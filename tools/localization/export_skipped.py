#!/usr/bin/env python3
"""导出所有被 inject.py 跳过的条目到 retranslate.csv，用于重新翻译。"""
import csv
import re
import sys
sys.stdout.reconfigure(encoding='utf-8')
sys.path.insert(0, '.')
from inject import validate_placeholders, has_unclosed_bracket, extract_bracket_expressions, should_skip_name_entry, auto_fix_translation

INPUT = 'strings.csv'
OUTPUT = 'retranslate.csv'

fieldnames = ['id', 'file', 'line', 'context', 'original', 'translation', 'status', 'error']

skipped = []
reasons = {}

with open(INPUT, 'r', encoding='utf-8-sig') as f:
    reader = csv.DictReader(f)
    for row in reader:
        orig = row.get('original', '')
        trans = row.get('translation', '')
        status = row.get('status', '')
        filepath = row.get('file', '')
        context = row.get('context', '')

        if status != 'translated' or not trans:
            continue

        # name-as-key 跳过的不需要重新翻译，它们本来就不该翻译
        if should_skip_name_entry(filepath, context):
            continue

        # 自动修复后再验证
        fixed = auto_fix_translation(orig, trans)
        is_valid, missing, extra = validate_placeholders(orig, fixed)
        if is_valid:
            # 还要检查 inject_translation 会不会因为双引号拒绝
            if '"' in fixed:
                row['translation'] = ''
                row['status'] = 'pending'
                row['error'] = '译文含双引号'
                skipped.append(row)
                reasons['含双引号'] = reasons.get('含双引号', 0) + 1
            continue

        # 被跳过了，清空翻译重新来
        reason = str(missing)
        row['translation'] = ''
        row['status'] = 'pending'
        row['error'] = reason
        skipped.append(row)

        # 分类统计
        if '未闭合的方括号表达式' in reason:
            reasons['未闭合方括号'] = reasons.get('未闭合方括号', 0) + 1
        elif '非法反斜杠序列' in reason:
            reasons['非法反斜杠'] = reasons.get('非法反斜杠', 0) + 1
        elif '转义符后缺少空格' in reason:
            reasons['转义符后缺空格'] = reasons.get('转义符后缺空格', 0) + 1
        elif any(esc in reason for esc in ['\\the', '\\The', '\\a', '\\an', '\\his', '\\her']):
            reasons['转义符丢失'] = reasons.get('转义符丢失', 0) + 1
        else:
            reasons['方括号不匹配'] = reasons.get('方括号不匹配', 0) + 1

with open(OUTPUT, 'w', encoding='utf-8-sig', newline='') as f:
    writer = csv.DictWriter(f, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(skipped)

print(f'导出 {len(skipped)} 条待重新翻译的条目 → {OUTPUT}')
print()
for reason, count in sorted(reasons.items(), key=lambda x: -x[1]):
    print(f'  {reason}: {count}')
