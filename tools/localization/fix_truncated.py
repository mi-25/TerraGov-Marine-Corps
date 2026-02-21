#!/usr/bin/env python3
"""
修复 retranslate.csv 中未闭合方括号的条目。
从源码中重新提取完整的字符串内容（支持 DM 嵌套引号）。
"""
import csv
import os
import re
import sys
sys.stdout.reconfigure(encoding='utf-8')

SOURCE_DIR = '../../code'
INPUT = 'retranslate.csv'
OUTPUT = 'retranslate_fixed.csv'

CSV_FIELDS = ['id', 'file', 'line', 'context', 'original', 'translation', 'status', 'error']


def extract_dm_string(line: str, partial_original: str) -> str:
    """
    从一行 DM 代码中提取包含 partial_original 的完整字符串。
    DM 字符串中 [...] 内的双引号不会终止字符串。
    """
    # 找到 partial_original 在行中的位置
    idx = line.find(partial_original)
    if idx < 0:
        return None

    # 向前找到字符串的开始引号
    start = idx - 1
    while start >= 0 and line[start] != '"':
        start -= 1
    if start < 0:
        return None

    # 从开始引号之后解析完整字符串（处理 [...] 内的嵌套引号）
    pos = start + 1
    bracket_depth = 0
    result = []

    while pos < len(line):
        ch = line[pos]

        if ch == '[' and bracket_depth >= 0:
            bracket_depth += 1
            result.append(ch)
        elif ch == ']' and bracket_depth > 0:
            bracket_depth -= 1
            result.append(ch)
        elif ch == '"' and bracket_depth == 0:
            # 字符串结束
            break
        elif ch == '"' and bracket_depth > 0:
            # 在方括号内的引号，是嵌套字符串的一部分
            result.append(ch)
        elif ch == '\\':
            result.append(ch)
            pos += 1
            if pos < len(line):
                result.append(line[pos])
        else:
            result.append(ch)

        pos += 1

    return ''.join(result)


def main():
    entries = []
    with open(INPUT, 'r', encoding='utf-8-sig', newline='') as f:
        reader = csv.DictReader(f)
        entries = list(reader)

    fixed_count = 0
    unfixable = 0
    not_truncated = 0

    for entry in entries:
        error = entry.get('error', '')
        if '未闭合' not in error:
            not_truncated += 1
            continue

        filepath = os.path.join(SOURCE_DIR, entry['file'].replace('/', os.sep))
        if not os.path.exists(filepath):
            entry['error'] = f'文件不存在: {filepath}'
            unfixable += 1
            continue

        try:
            with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
                lines = f.readlines()
        except Exception as e:
            entry['error'] = f'无法读取: {e}'
            unfixable += 1
            continue

        line_num = int(entry['line'])
        partial = entry['original']

        # 在目标行及附近搜索
        found = False
        for offset in range(0, 6):
            for sign in [0, -1, 1]:
                search_line = line_num - 1 + (offset * sign if sign else 0)
                if search_line < 0 or search_line >= len(lines):
                    continue
                line_content = lines[search_line]

                full_string = extract_dm_string(line_content, partial[:30])
                if full_string and len(full_string) > len(partial):
                    entry['original'] = full_string
                    entry['error'] = ''
                    entry['status'] = 'pending'
                    fixed_count += 1
                    found = True
                    break
            if found:
                break

        if not found:
            entry['error'] = f'无法从源码提取完整字符串'
            unfixable += 1

    with open(OUTPUT, 'w', encoding='utf-8-sig', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=CSV_FIELDS)
        writer.writeheader()
        writer.writerows(entries)

    print(f'处理完成:')
    print(f'  修复截断原文: {fixed_count}')
    print(f'  无法修复: {unfixable}')
    print(f'  非截断条目(保持不变): {not_truncated}')
    print(f'  总计: {len(entries)} → {OUTPUT}')


if __name__ == '__main__':
    main()
