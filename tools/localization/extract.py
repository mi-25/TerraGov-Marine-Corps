#!/usr/bin/env python3
"""
TGMC 本地化工具 - 文本提取模块
从 .dm 源码文件中提取玩家可见的英文字符串，生成 CSV 文件。
"""

import argparse
import csv
import hashlib
import os
import re
import sys
from pathlib import Path


# 提取模式：(正则, 上下文标签)
# 每个正则的第一个捕获组应为目标字符串内容
EXTRACT_PATTERNS = [
    # to_chat(target, "msg") 或 to_chat(target, span_xxx("msg"))
    (re.compile(
        r'to_chat\s*\([^,]+,\s*(?:span_\w+\s*\(\s*)?"((?:[^"\\]|\\.)*)"',
        re.DOTALL
    ), 'to_chat'),
    # visible_message("msg") 或 visible_message(span_xxx("msg"))
    (re.compile(
        r'visible_message\s*\(\s*(?:span_\w+\s*\(\s*)?"((?:[^"\\]|\\.)*)"',
        re.DOTALL
    ), 'visible_message'),
    # balloon_alert(target, "msg")
    (re.compile(
        r'balloon_alert\s*\([^,]+,\s*"((?:[^"\\]|\\.)*)"',
        re.DOTALL
    ), 'balloon_alert'),
    # balloon_alert_to_viewers("msg")
    (re.compile(
        r'balloon_alert_to_viewers\s*\(\s*"((?:[^"\\]|\\.)*)"',
        re.DOTALL
    ), 'balloon_alert'),
    # name = "value" (属性赋值)
    (re.compile(
        r'^\s*name\s*=\s*"((?:[^"\\]|\\.)*)"',
        re.MULTILINE
    ), 'name'),
    # desc = "value" (属性赋值)
    (re.compile(
        r'^\s*desc\s*=\s*"((?:[^"\\]|\\.)*)"',
        re.MULTILINE
    ), 'desc'),
    # say("msg")
    (re.compile(
        r'\bsay\s*\(\s*"((?:[^"\\]|\\.)*)"',
        re.DOTALL
    ), 'say'),
    # span_role_body("msg") — 职业 spawn 消息
    (re.compile(
        r'span_role_body\s*\(\s*"((?:[^"\\]|\\.)*)"',
        re.DOTALL
    ), 'spawn_message'),
    # span_role_header("msg")
    (re.compile(
        r'span_role_header\s*\(\s*"((?:[^"\\]|\\.)*)"',
        re.DOTALL
    ), 'spawn_header'),
    # separator_hr("msg")
    (re.compile(
        r'separator_hr\s*\(\s*"((?:[^"\\]|\\.)*)"',
        re.DOTALL
    ), 'separator'),
    # . += "msg" (get_spawn_message_information 中的追加文本)
    (re.compile(
        r'\.\s*\+=\s*"((?:[^"\\]|\\.)*)"',
        re.DOTALL
    ), 'append_text'),
    # priority_announce 的标题参数
    (re.compile(
        r'priority_announce\s*\([^,]+,\s*"((?:[^"\\]|\\.)*)"',
        re.DOTALL
    ), 'announce_title'),
    # assemble_alert 的 title/subtitle/message 字段（仅匹配缩进的赋值，排除 comm_title 等）
    (re.compile(
        r'(?<!\w)(?:title|subtitle|message)\s*=\s*"((?:[^"\\]|\\.)*)"',
        re.DOTALL
    ), 'alert_field'),
]

# 多行文本块提取模式（单独处理，因为跨行）
MULTILINE_TEXT_PATTERN = re.compile(
    r'=\s*\{"((?:[^}]|\}(?!"))*?)"\}',
    re.DOTALL
)

# 应跳过的属性赋值模式（非玩家可见）
SKIP_PROPERTY_PATTERN = re.compile(
    r'^\s*(?:icon_state|icon|base_icon_state|worn_icon_state|'
    r'icon_empty|icon_half|icon_full|empty_desc|'
    r'type_butt|sound|pixel_[xy]|layer|plane|'
    r'hud_icon_state|overlay_icon_state)\s*=',
    re.MULTILINE
)


def generate_id(file_path: str, line: int, text: str) -> str:
    """基于文件路径、行号和原文生成唯一 ID（SHA256 前8位）"""
    raw = f"{file_path}:{line}:{text}"
    return hashlib.sha256(raw.encode('utf-8')).hexdigest()[:8]


def should_skip_text(text: str) -> bool:
    """判断字符串是否应被跳过（非玩家可见或无意义）"""
    if not text or not text.strip():
        return True
    # 纯数字/符号
    if re.match(r'^[\d\s\W]+$', text) and not re.search(r'[a-zA-Z]', text):
        return True
    # 纯变量插值（如 "[src]" 或 "[user]"）
    stripped = re.sub(r'\[[\w.()]+\]', '', text).strip()
    if not stripped:
        return True
    # 单个字符
    if len(text.strip()) <= 1:
        return True
    # 文件路径模式
    if re.match(r'^[\'"]?[\w/]+\.\w{2,4}[\'"]?$', text.strip()):
        return True
    return False


def extract_strings_from_file(filepath: str, root_dir: str) -> list:
    """从单个 .dm 文件中提取所有玩家可见字符串"""
    results = []
    rel_path = os.path.relpath(filepath, root_dir).replace('\\', '/')

    try:
        with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
            content = f.read()
            lines = content.split('\n')
    except Exception as e:
        print(f"[警告] 无法读取文件 {filepath}: {e}", file=sys.stderr)
        return results

    # 标准单行模式提取
    for pattern, context in EXTRACT_PATTERNS:
        for match in pattern.finditer(content):
            text = match.group(1)

            if should_skip_text(text):
                continue

            # 计算行号
            line_start = content[:match.start()].count('\n') + 1

            # 对 name/desc 属性，检查是否在跳过列表中
            if context in ('name', 'desc'):
                # 获取匹配所在的完整行
                line_content = lines[line_start - 1] if line_start <= len(lines) else ''
                if SKIP_PROPERTY_PATTERN.match(line_content):
                    continue

            entry_id = generate_id(rel_path, line_start, text)
            results.append({
                'id': entry_id,
                'file': rel_path,
                'line': line_start,
                'context': context,
                'original': text,
                'translation': '',
                'status': 'pending',
                'error': '',
            })

    # 多行文本块提取 {"..."}
    for match in MULTILINE_TEXT_PATTERN.finditer(content):
        text = match.group(1)
        if should_skip_text(text):
            continue
        line_start = content[:match.start()].count('\n') + 1
        entry_id = generate_id(rel_path, line_start, text)
        results.append({
            'id': entry_id,
            'file': rel_path,
            'line': line_start,
            'context': 'multiline_text',
            'original': text,
            'translation': '',
            'status': 'pending',
            'error': '',
        })

    return results


def load_existing_ids(csv_path: str) -> set:
    """加载已有 CSV 中的 ID 集合（用于增量提取）"""
    ids = set()
    if not os.path.exists(csv_path):
        return ids
    try:
        with open(csv_path, 'r', encoding='utf-8-sig', newline='') as f:
            reader = csv.DictReader(f)
            for row in reader:
                ids.add(row.get('id', ''))
    except Exception:
        pass
    return ids


def write_csv(entries: list, output_path: str, append: bool = False):
    """将提取结果写入 CSV 文件"""
    fieldnames = ['id', 'file', 'line', 'context', 'original', 'translation', 'status', 'error']

    existing_entries = []
    if append and os.path.exists(output_path):
        try:
            with open(output_path, 'r', encoding='utf-8-sig', newline='') as f:
                reader = csv.DictReader(f)
                existing_entries = list(reader)
        except Exception:
            pass

    all_entries = existing_entries + entries

    with open(output_path, 'w', encoding='utf-8-sig', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(all_entries)


def collect_dm_files(source_dir: str, pattern: str = '**/*.dm') -> list:
    """递归收集所有 .dm 文件"""
    source_path = Path(source_dir)
    return sorted(str(p) for p in source_path.glob(pattern))


def main():
    parser = argparse.ArgumentParser(
        description='TGMC 本地化工具 - 从 .dm 文件中提取玩家可见字符串'
    )
    parser.add_argument(
        '--source-dir', '-s',
        required=True,
        help='源码根目录（如 ../../code）'
    )
    parser.add_argument(
        '--output', '-o',
        default='strings.csv',
        help='输出 CSV 文件路径（默认: strings.csv）'
    )
    parser.add_argument(
        '--pattern', '-p',
        default='**/*.dm',
        help='文件匹配模式（默认: **/*.dm）'
    )
    parser.add_argument(
        '--append', '-a',
        action='store_true',
        help='增量模式：追加到已有 CSV，跳过已存在的条目'
    )
    parser.add_argument(
        '--files',
        default=None,
        help='只提取指定文件（逗号分隔的相对路径，如 datums/jobs/job/job.dm,datums/gamemodes/infestation.dm）'
    )

    args = parser.parse_args()

    source_dir = os.path.abspath(args.source_dir)
    if not os.path.isdir(source_dir):
        print(f"[错误] 源码目录不存在: {source_dir}", file=sys.stderr)
        sys.exit(1)

    # 收集文件
    if args.files:
        # 指定文件模式
        file_list = [f.strip() for f in args.files.split(',') if f.strip()]
        dm_files = []
        for f in file_list:
            abs_f = os.path.join(source_dir, f.replace('/', os.sep))
            if os.path.exists(abs_f):
                dm_files.append(abs_f)
            else:
                print(f"[警告] 文件不存在: {abs_f}", file=sys.stderr)
        print(f"指定 {len(dm_files)} 个文件")
    else:
        dm_files = collect_dm_files(source_dir, args.pattern)
        print(f"找到 {len(dm_files)} 个 .dm 文件")

    # 加载已有 ID（增量模式）
    existing_ids = set()
    if args.append:
        existing_ids = load_existing_ids(args.output)
        print(f"已有 {len(existing_ids)} 个条目（增量模式）")

    # 提取字符串
    all_entries = []
    seen_ids = set()

    for i, filepath in enumerate(dm_files):
        entries = extract_strings_from_file(filepath, source_dir)
        for entry in entries:
            # 去重
            if entry['id'] in seen_ids or entry['id'] in existing_ids:
                continue
            seen_ids.add(entry['id'])
            all_entries.append(entry)

        # 进度显示
        if (i + 1) % 100 == 0 or i + 1 == len(dm_files):
            print(f"\r处理进度: {i + 1}/{len(dm_files)} 文件, 已提取 {len(all_entries)} 条字符串", end='')

    print()  # 换行

    # 写入 CSV
    write_csv(all_entries, args.output, append=args.append)
    print(f"完成！共提取 {len(all_entries)} 条新字符串 → {args.output}")


if __name__ == '__main__':
    main()
