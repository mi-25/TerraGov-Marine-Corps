#!/usr/bin/env python3
"""
TGMC 本地化工具 - 自动翻译模块
调用 DeepSeek API 将提取的英文字符串翻译为简体中文。
支持断点续传、失败重试、ETA 进度显示、失败条目导出。
"""

import argparse
import csv
import json
import logging
import os
import re
import sys
import time
import threading
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime

try:
    import requests
except ImportError:
    print("[错误] 需要 requests 库。请运行: pip install requests", file=sys.stderr)
    sys.exit(1)

try:
    from tqdm import tqdm
    HAS_TQDM = True
except ImportError:
    HAS_TQDM = False

# DeepSeek 翻译 system prompt
SYSTEM_PROMPT = """你是一个专业的游戏本地化翻译员，正在翻译 TGMC（TerraGov Marine Corps），一款基于 BYOND 引擎的太空站13（SS13）多人角色扮演游戏。

## 游戏背景
TGMC 是一款以科幻军事为主题的多人对抗游戏。玩家分为两大阵营：
- **陆战队（Marines）**：隶属地球政府殖民地海军陆战队（TGMC），使用现代化武器装备，以小队为单位作战。小队包括阿尔法（Alpha）、布拉沃（Bravo）、查理（Charlie）、德尔塔（Delta）。
- **异形（Xenomorphs）**：外星生物种群，拥有从幼虫到女王的完整进化体系，依靠菌毯、树脂建筑和信息素协同作战。

其他阵营包括：殖民地解放阵线（CLF）、火星之子（SOM）、纳米传讯（Nanotrasen）PMC、自由佣兵等。

## 翻译规则

### 必须保留不翻译的内容（原样复制，一个字符都不能改）
1. **方括号表达式**：[src]、[user]、[count]、[user.p_their()]、[target.name] 等。包括复杂表达式如 [automatic_meds_use ? "now" : "no longer"]，整个 [...] 内的内容必须原样保留
2. **BYOND 转义符**：\\the、\\The、\\a、\\an、\\he、\\she、\\his、\\her、\\their、\\improper、\\proper、\\black 等。转义符后面必须保留一个空格，如 "\\the [src]" 不能写成 "\\the[src]" 或 "\\这个[src]"
3. **字面方括号转义**：\\[ 和 \\] 必须原样保留，不能去掉反斜杠
4. **HTML 标签**：<b>、</b>、<i>、<font color='red'>、<span class='warning'>、</span> 等
5. **代码标识符和路径**：/obj/item/...、/mob/living/... 等
6. **href 链接**：<a href='byond://...'> 等

### 绝对禁止的操作
1. 不要翻译方括号 [...] 内的任何内容，即使看起来像英文单词
2. 不要翻译反斜杠转义符（如 \\the 不能变成 \\这个）
3. 不要删除或修改反斜杠转义符后面的空格
4. 不要在译文中使用英文双引号 "（会破坏 DM 字符串语法）
5. 不要添加原文中没有的方括号表达式

### 翻译风格要求
1. 军事用语使用正式简洁的风格，如"目标已锁定"、"弹药不足"
2. 异形相关文本使用偏生物/有机体的描述风格
3. 系统提示和 UI 文本使用简洁直白的风格
4. 物品名称和描述保持游戏感，不要过于书面化
5. 保持原文的语气（警告、通知、描述、对话等）
6. 只返回翻译结果，不要添加任何解释、引号或额外文字

### 术语一致性
翻译时必须严格遵循提供的术语表，确保专有名词翻译一致。如果术语表中有对应翻译，必须使用术语表中的译法。"""

GLOSSARY_PROMPT_TEMPLATE = """
## 术语表（翻译时必须遵循）
{glossary_text}
"""


CSV_FIELDS = ['id', 'file', 'line', 'context', 'original', 'translation', 'status', 'error']

# 全局变量：构建好的完整 system prompt（含术语表）
_built_system_prompt = None


def load_glossary(glossary_path: str) -> dict:
    """加载术语表 CSV，返回 {english: chinese} 映射"""
    glossary = {}
    with open(glossary_path, 'r', encoding='utf-8-sig', newline='') as f:
        reader = csv.DictReader(f)
        for row in reader:
            en = row.get('english', '').strip()
            zh = row.get('chinese', '').strip()
            if en and zh:
                glossary[en] = zh
    return glossary


def build_system_prompt(glossary_path: str = None) -> str:
    """构建完整的 system prompt，可选附加术语表"""
    prompt = SYSTEM_PROMPT
    if glossary_path and os.path.exists(glossary_path):
        glossary = load_glossary(glossary_path)
        if glossary:
            lines = [f"- {en} → {zh}" for en, zh in glossary.items()]
            glossary_text = '\n'.join(lines)
            prompt += GLOSSARY_PROMPT_TEMPLATE.format(glossary_text=glossary_text)
            print(f"已加载术语表: {len(glossary)} 条术语")
    return prompt


def find_relevant_terms(text: str, glossary: dict) -> dict:
    """从原文中匹配出现的术语，返回相关子集（减少 token 消耗）"""
    relevant = {}
    text_lower = text.lower()
    for en, zh in glossary.items():
        if en.lower() in text_lower:
            relevant[en] = zh
    return relevant


def setup_logging(log_file: str) -> logging.Logger:
    """配置日志记录"""
    logger = logging.getLogger('tgmc_translate')
    logger.setLevel(logging.DEBUG)

    fh = logging.FileHandler(log_file, encoding='utf-8')
    fh.setLevel(logging.DEBUG)
    fmt = logging.Formatter('[%(asctime)s] %(levelname)s - %(message)s', datefmt='%Y-%m-%d %H:%M:%S')
    fh.setFormatter(fmt)
    logger.addHandler(fh)

    return logger


def load_csv(csv_path: str) -> list:
    """加载 CSV 文件"""
    entries = []
    with open(csv_path, 'r', encoding='utf-8-sig', newline='') as f:
        reader = csv.DictReader(f)
        for row in reader:
            entries.append(row)
    return entries


def save_csv(entries: list, csv_path: str):
    """保存 CSV 文件"""
    with open(csv_path, 'w', encoding='utf-8-sig', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=CSV_FIELDS)
        writer.writeheader()
        writer.writerows(entries)


def call_deepseek(text: str, config, system_prompt: str, glossary: dict = None) -> str:
    """调用 DeepSeek API 进行翻译，支持按条目附加相关术语"""
    # 构建 user message：原文 + 该条目涉及的术语提示
    user_content = text
    if glossary:
        relevant = find_relevant_terms(text, glossary)
        if relevant:
            terms_hint = '、'.join(f'{en}={zh}' for en, zh in relevant.items())
            user_content = f"[相关术语: {terms_hint}]\n{text}"

    headers = {
        'Content-Type': 'application/json',
        'Authorization': f'Bearer {config.api_key}',
    }
    payload = {
        'model': config.model,
        'messages': [
            {'role': 'system', 'content': system_prompt},
            {'role': 'user', 'content': user_content},
        ],
        'temperature': 0.3,
        'max_tokens': 1024,
    }

    resp = requests.post(
        f'{config.api_url}/chat/completions',
        headers=headers,
        json=payload,
        timeout=30,
    )

    if resp.status_code == 429:
        raise RateLimitError("API 速率限制 (429)")

    resp.raise_for_status()
    data = resp.json()

    result = data['choices'][0]['message']['content'].strip()
    # 去除可能被 API 添加的外层引号
    if len(result) >= 2 and result[0] == '"' and result[-1] == '"':
        result = result[1:-1]
    # 清理：去除 API 可能原样返回的术语提示前缀
    result = re.sub(r'^\[相关术语:.*?\]\s*', '', result)
    # 清理：移除换行符（DM 字符串不支持裸换行）
    result = result.replace('\n', '').replace('\r', '')
    # 清理：中文双引号替换为单引号（避免破坏 DM 字符串引号匹配）
    result = result.replace('\u201c', "'").replace('\u201d', "'")
    return result


class RateLimitError(Exception):
    pass


class SimpleFallbackProgress:
    """当 tqdm 不可用时的简单进度显示"""
    def __init__(self, total, disable=False):
        self.total = total
        self.current = 0
        self.disable = disable
        self.start_time = time.time()
        self._postfix = {}

    def update(self, n=1):
        self.current += n
        if not self.disable:
            elapsed = time.time() - self.start_time
            rate = self.current / elapsed if elapsed > 0 else 0
            eta = (self.total - self.current) / rate if rate > 0 else 0
            pf = ' '.join(f'{k}={v}' for k, v in self._postfix.items())
            print(f'\r进度: {self.current}/{self.total} '
                  f'[{elapsed:.0f}s 已用, ETA {eta:.0f}s] {pf}', end='', flush=True)

    def set_postfix(self, **kwargs):
        self._postfix = kwargs

    def set_description(self, desc):
        pass

    def close(self):
        if not self.disable:
            print()

    def __enter__(self):
        return self

    def __exit__(self, *args):
        self.close()


def create_progress(total: int, disable: bool = False):
    """创建进度条（优先使用 tqdm）"""
    if HAS_TQDM and not disable:
        return tqdm(
            total=total,
            desc='翻译中',
            unit='条',
            bar_format='{l_bar}{bar}| {n_fmt}/{total_fmt} [{elapsed}<{remaining}, {rate_fmt}] {postfix}',
        )
    return SimpleFallbackProgress(total, disable=disable)


def should_skip_entry(entry: dict, config) -> bool:
    """判断条目是否应被跳过"""
    if config.skip_ids:
        skip_list = [s.strip() for s in config.skip_ids.split(',')]
        if entry['id'] in skip_list:
            return True
    if config.skip_text:
        if re.search(config.skip_text, entry.get('original', '')):
            return True
    # context 过滤：只翻译指定类型的条目
    if getattr(config, 'context_filter', None):
        allowed = [c.strip() for c in config.context_filter.split(',')]
        if entry.get('context', '') not in allowed:
            return True
    return False


def export_failed(entries: list, output_path: str):
    """导出失败条目到新文件，并将原 CSV 中这些条目的 status 重置为 pending"""
    failed = [e for e in entries if e.get('status') == 'failed']
    if not failed:
        print("没有失败的条目需要导出。")
        return

    # 写入失败条目到新文件（status 重置为 pending）
    export_entries = []
    for e in failed:
        new_entry = dict(e)
        new_entry['status'] = 'pending'
        new_entry['error'] = ''
        export_entries.append(new_entry)

    with open(output_path, 'w', encoding='utf-8-sig', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=CSV_FIELDS)
        writer.writeheader()
        writer.writerows(export_entries)

    # 原 CSV 中也重置
    for e in entries:
        if e.get('status') == 'failed':
            e['status'] = 'pending'
            e['error'] = ''

    print(f"已导出 {len(failed)} 条失败条目 → {output_path}（status 已重置为 pending）")


def translate_entries(csv_path: str, config, logger: logging.Logger):
    """主翻译流程，支持并发"""
    entries = load_csv(csv_path)
    total = len(entries)
    logger.info(f"加载 CSV: {total} 条记录")

    # 构建 system prompt（含术语表）
    glossary_path = getattr(config, 'glossary', None)
    system_prompt = build_system_prompt(glossary_path)
    glossary = load_glossary(glossary_path) if glossary_path and os.path.exists(glossary_path) else None
    logger.info(f"System prompt 长度: {len(system_prompt)} 字符, 术语表: {len(glossary) if glossary else 0} 条")

    # 确定待处理条目
    if config.retry_failed:
        pending_indices = [i for i, e in enumerate(entries) if e.get('status') == 'failed']
        logger.info(f"重试模式: {len(pending_indices)} 条失败条目")
    else:
        pending_indices = [i for i, e in enumerate(entries)
                          if e.get('status') in ('pending', 'failed')]

    if config.resume:
        pending_indices = [i for i, e in enumerate(entries)
                          if e.get('status') in ('pending', 'failed')]
        logger.info(f"续传模式: {len(pending_indices)} 条待处理")

    if not pending_indices:
        print("没有需要翻译的条目。")
        return

    workers = getattr(config, 'workers', 1)
    print(f"待翻译: {len(pending_indices)} 条 (共 {total} 条), 并发: {workers}")

    success_count = 0
    fail_count = 0
    skip_count = 0
    save_counter = 0
    lock = threading.Lock()

    pbar = create_progress(len(pending_indices), disable=config.no_eta)

    def process_one(idx):
        """处理单条翻译（线程安全）"""
        nonlocal success_count, fail_count, skip_count
        entry = entries[idx]

        if should_skip_entry(entry, config):
            entry['status'] = 'skipped'
            with lock:
                skip_count += 1
            logger.info(f"[跳过] {entry['id']}: {entry['original'][:50]}")
            return

        for attempt in range(config.max_retries):
            try:
                start_t = time.time()
                result = call_deepseek(entry['original'], config, system_prompt, glossary)
                elapsed_t = time.time() - start_t

                entry['translation'] = result
                entry['status'] = 'translated'
                entry['error'] = ''
                with lock:
                    success_count += 1
                logger.info(
                    f"[成功] {entry['id']} ({elapsed_t:.1f}s): "
                    f"\"{entry['original'][:30]}\" → \"{result[:30]}\""
                )
                return

            except RateLimitError:
                wait = config.delay * (2 ** (attempt + 1))
                logger.warning(f"[限流] {entry['id']}: 等待 {wait:.1f}s ({attempt+1}/{config.max_retries})")
                time.sleep(wait)

            except requests.exceptions.Timeout:
                wait = config.delay * (2 ** attempt)
                logger.warning(f"[超时] {entry['id']}: 重试 ({attempt+1}/{config.max_retries})")
                time.sleep(wait)

            except Exception as e:
                if attempt < config.max_retries - 1:
                    wait = config.delay * (2 ** attempt)
                    logger.warning(f"[错误] {entry['id']}: {e}, 重试 ({attempt+1}/{config.max_retries})")
                    time.sleep(wait)
                else:
                    entry['status'] = 'failed'
                    entry['error'] = str(e)[:200]
                    with lock:
                        fail_count += 1
                    logger.error(f"[失败] {entry['id']}: {e}")

    try:
        if workers <= 1:
            # 单线程模式（原逻辑）
            for idx in pending_indices:
                process_one(idx)
                pbar.update(1)
                pbar.set_postfix(ok=success_count, fail=fail_count, skip=skip_count)

                save_counter += 1
                if save_counter >= config.batch_size:
                    save_csv(entries, csv_path)
                    save_counter = 0
                    logger.info(f"自动保存 CSV (已处理 {success_count + fail_count + skip_count} 条)")

                if entries[idx].get('status') == 'translated':
                    time.sleep(config.delay)
        else:
            # 多线程并发模式
            completed = 0
            with ThreadPoolExecutor(max_workers=workers) as executor:
                futures = {}
                for idx in pending_indices:
                    f = executor.submit(process_one, idx)
                    futures[f] = idx

                for future in as_completed(futures):
                    future.result()  # 触发异常
                    completed += 1
                    pbar.update(1)
                    pbar.set_postfix(ok=success_count, fail=fail_count, skip=skip_count)

                    if completed % config.batch_size == 0:
                        with lock:
                            save_csv(entries, csv_path)
                        logger.info(f"自动保存 CSV (已处理 {completed} 条)")

    except KeyboardInterrupt:
        print("\n\n[中断] 正在保存进度...")
        logger.warning("用户中断，保存进度")
    finally:
        pbar.close()
        save_csv(entries, csv_path)
        logger.info(f"最终保存: 成功={success_count}, 失败={fail_count}, 跳过={skip_count}")

    print(f"\n翻译完成: 成功 {success_count}, 失败 {fail_count}, 跳过 {skip_count}")
    print(f"结果已保存到 {csv_path}")


def main():
    parser = argparse.ArgumentParser(
        description='TGMC 本地化工具 - 使用 DeepSeek API 自动翻译'
    )
    parser.add_argument(
        '--input', '-i',
        required=True,
        help='输入 CSV 文件路径（extract.py 生成的文件）'
    )
    parser.add_argument(
        '--api-key', '-k',
        required=True,
        help='DeepSeek API 密钥'
    )
    parser.add_argument(
        '--api-url',
        default='https://api.deepseek.com/v1',
        help='DeepSeek API 端点 URL（默认: https://api.deepseek.com/v1）'
    )
    parser.add_argument(
        '--model', '-m',
        default='deepseek-chat',
        help='模型名称（默认: deepseek-chat）'
    )
    parser.add_argument(
        '--delay', '-d',
        type=float,
        default=0.5,
        help='请求间隔秒数（默认: 0.5）'
    )
    parser.add_argument(
        '--max-retries',
        type=int,
        default=3,
        help='最大重试次数（默认: 3）'
    )
    parser.add_argument(
        '--batch-size',
        type=int,
        default=10,
        help='每翻译 N 条自动保存一次（默认: 10）'
    )
    parser.add_argument(
        '--resume',
        action='store_true',
        help='断点续传：跳过已翻译/已跳过的条目'
    )
    parser.add_argument(
        '--retry-failed',
        action='store_true',
        help='仅重试状态为 failed 的条目'
    )
    parser.add_argument(
        '--skip-ids',
        default=None,
        help='跳过指定 ID（逗号分隔，如 a1b2c3d4,e5f6g7h8）'
    )
    parser.add_argument(
        '--skip-text',
        default=None,
        help='跳过匹配正则表达式的原文'
    )
    parser.add_argument(
        '--export-failed',
        default=None,
        metavar='FILE',
        help='导出失败条目到指定文件（并重置其 status 为 pending）'
    )
    parser.add_argument(
        '--no-eta',
        action='store_true',
        help='禁用进度条显示'
    )
    parser.add_argument(
        '--log-file',
        default=None,
        help='日志文件路径（默认: translate_YYYYMMDD_HHMMSS.log）'
    )
    parser.add_argument(
        '--glossary', '-g',
        default=None,
        help='术语表 CSV 文件路径（如 glossary.csv），确保专有名词翻译一致'
    )
    parser.add_argument(
        '--workers', '-w',
        type=int,
        default=1,
        help='并发线程数（默认: 1，建议 5-10，过高可能触发限流）'
    )
    parser.add_argument(
        '--context-filter',
        default=None,
        help='只翻译指定 context 类型（逗号分隔，如 spawn_message,multiline_text,alert_field）'
    )

    args = parser.parse_args()

    if not os.path.exists(args.input):
        print(f"[错误] CSV 文件不存在: {args.input}", file=sys.stderr)
        sys.exit(1)

    # 设置日志
    if not args.log_file:
        args.log_file = f"translate_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"
    logger = setup_logging(args.log_file)
    logger.info(f"启动翻译: input={args.input}, model={args.model}, delay={args.delay}, glossary={args.glossary}")

    # 如果只是导出失败条目
    if args.export_failed:
        entries = load_csv(args.input)
        export_failed(entries, args.export_failed)
        save_csv(entries, args.input)
        return

    # 自动查找同目录下的 glossary.csv
    if not args.glossary:
        default_glossary = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'glossary.csv')
        if os.path.exists(default_glossary):
            args.glossary = default_glossary
            print(f"自动加载术语表: {default_glossary}")

    # 执行翻译
    translate_entries(args.input, args, logger)


if __name__ == '__main__':
    main()
