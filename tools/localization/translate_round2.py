#!/usr/bin/env python3
"""
Round 2 翻译：使用占位符保护策略。
将方括号表达式替换为占位符 {{P0}} {{P1}} 等，只让 DeepSeek 翻译纯文本部分，
翻译完再还原占位符。同时保护 BYOND 转义符和 HTML 标签。
"""
import csv
import json
import os
import re
import sys
import time
import threading
from concurrent.futures import ThreadPoolExecutor, as_completed

sys.stdout.reconfigure(encoding='utf-8')

try:
    import requests
except ImportError:
    print("需要 requests: pip install requests", file=sys.stderr)
    sys.exit(1)

API_KEY = sys.argv[1] if len(sys.argv) > 1 else ''
API_URL = 'https://api.deepseek.com/v1'
MODEL = 'deepseek-chat'
INPUT_CSV = 'retranslate_round2.csv'
CSV_FIELDS = ['id', 'file', 'line', 'context', 'original', 'translation', 'status', 'error']

SYSTEM_PROMPT = """你是一个专业的游戏本地化翻译员，正在翻译 TGMC（TerraGov Marine Corps）游戏。

翻译规则：
1. 将英文翻译为简体中文
2. {{P0}} {{P1}} 等占位符必须原样保留，不能翻译、删除或修改
3. 不要在译文中使用英文双引号 "
4. 只返回翻译结果，不要添加解释或引号
5. 药物/化学品名称使用双语格式：英文名-中文名（如 Bicaridine-双卡因）
6. 军事用语简洁正式，异形相关用生物风格描述
7. 保持原文语气"""


def extract_and_protect(text):
    """
    提取文本中的方括号表达式、BYOND转义符、HTML标签，替换为占位符。
    返回 (protected_text, placeholders_dict)
    """
    placeholders = {}
    counter = [0]

    def replace_with_placeholder(match_text):
        key = f'{{{{P{counter[0]}}}}}'
        placeholders[key] = match_text
        counter[0] += 1
        return key

    result = text

    # 1. 保护方括号表达式（支持嵌套）
    protected = []
    i = 0
    while i < len(result):
        if result[i] == '[':
            depth = 1
            start = i
            i += 1
            while i < len(result) and depth > 0:
                if result[i] == '[':
                    depth += 1
                elif result[i] == ']':
                    depth -= 1
                i += 1
            if depth == 0:
                bracket_expr = result[start:i]
                key = f'{{{{P{counter[0]}}}}}'
                placeholders[key] = bracket_expr
                counter[0] += 1
                protected.append(key)
            else:
                protected.append(result[start:i])
        else:
            protected.append(result[i])
            i += 1
    result = ''.join(protected)

    # 2. 保护 BYOND 转义符 + 后面的空格
    def protect_escape(m):
        return replace_with_placeholder(m.group(0))

    result = re.sub(
        r'\\(?:the|The|improper|proper|black|A|a|an|he|she|they|his|her|their|ref|\[|\])(?= )?',
        protect_escape, result
    )

    # 3. 保护 HTML 标签
    result = re.sub(r'<[^>]+>', protect_escape, result)

    # 4. 保护 href 链接
    result = re.sub(r"<a\s+href='[^']*'>", protect_escape, result)

    return result, placeholders


def restore_placeholders(translated, placeholders):
    """将占位符还原为原始内容"""
    result = translated
    for key, value in placeholders.items():
        result = result.replace(key, value)
    return result


def translate_one(text, placeholders):
    """翻译单条文本"""
    if not text.strip():
        return text

    # 如果保护后只剩占位符没有可翻译文本，直接还原
    stripped = text
    for key in placeholders:
        stripped = stripped.replace(key, '')
    if not stripped.strip() or not re.search(r'[a-zA-Z]', stripped):
        return text  # 没有英文可翻译

    headers = {
        'Content-Type': 'application/json',
        'Authorization': f'Bearer {API_KEY}',
    }
    payload = {
        'model': MODEL,
        'messages': [
            {'role': 'system', 'content': SYSTEM_PROMPT},
            {'role': 'user', 'content': text},
        ],
        'temperature': 0.2,
        'max_tokens': 1024,
    }

    for attempt in range(3):
        try:
            resp = requests.post(f'{API_URL}/chat/completions', headers=headers, json=payload, timeout=30)
            if resp.status_code == 429:
                time.sleep(2 ** (attempt + 1))
                continue
            resp.raise_for_status()
            result = resp.json()['choices'][0]['message']['content'].strip()
            # 去除外层引号
            if len(result) >= 2 and result[0] == '"' and result[-1] == '"':
                result = result[1:-1]
            result = result.replace('\n', '').replace('\r', '')
            result = result.replace('\u201c', "'").replace('\u201d', "'")
            return result
        except Exception as e:
            if attempt == 2:
                raise
            time.sleep(1)


def process_entry(row):
    """处理单条翻译"""
    orig = row['original']

    # 提取并保护
    protected_text, placeholders = extract_and_protect(orig)

    # 翻译
    translated = translate_one(protected_text, placeholders)

    # 还原占位符
    final = restore_placeholders(translated, placeholders)

    # 清理双引号（DM 字符串内不能有裸双引号）
    # 但方括号内的双引号是合法的，不需要清理
    # 只清理方括号外的双引号
    return final


def main():
    if not API_KEY:
        print("用法: python translate_round2.py <api_key>")
        sys.exit(1)

    entries = []
    with open(INPUT_CSV, 'r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f)
        entries = list(reader)

    pending = [e for e in entries if e.get('status') == 'pending']
    print(f'待翻译: {len(pending)} 条')

    success = 0
    fail = 0
    lock = threading.Lock()

    def worker(entry):
        nonlocal success, fail
        try:
            result = process_entry(entry)
            entry['translation'] = result
            entry['status'] = 'translated'
            entry['error'] = ''
            with lock:
                success += 1
        except Exception as e:
            entry['status'] = 'failed'
            entry['error'] = str(e)[:200]
            with lock:
                fail += 1

    completed = 0
    with ThreadPoolExecutor(max_workers=20) as executor:
        futures = {executor.submit(worker, e): e for e in pending}
        for f in as_completed(futures):
            f.result()
            completed += 1
            if completed % 20 == 0 or completed == len(pending):
                print(f'\r进度: {completed}/{len(pending)} ok={success} fail={fail}', end='', flush=True)

    print(f'\n\n完成: 成功 {success}, 失败 {fail}')

    with open(INPUT_CSV, 'w', encoding='utf-8-sig', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=CSV_FIELDS)
        writer.writeheader()
        writer.writerows(entries)

    print(f'已保存到 {INPUT_CSV}')


if __name__ == '__main__':
    main()
