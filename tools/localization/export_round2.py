#!/usr/bin/env python3
"""导出当前仍被 inject.py 跳过的 482 条，分析原因并准备重新翻译。"""
import csv
import re
import sys
sys.stdout.reconfigure(encoding='utf-8')
sys.path.insert(0, '.')
from inject import validate_placeholders, auto_fix_translation, should_skip_name_entry, has_unclosed_bracket, extract_bracket_expressions

INPUT = 'strings.csv'
OUTPUT = 'retranslate_round2.csv'
CSV_FIELDS = ['id', 'file', 'line', 'context', 'original', 'translation', 'status', 'error']

entries_out = []
cat = {'bracket_mismatch': 0, 'escape_issue': 0, 'has_quotes': 0, 'unclosed': 0, 'other': 0}

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
        if should_skip_name_entry(filepath, context):
            continue
        fixed = auto_fix_translation(orig, trans)
        ok, missing, extra = validate_placeholders(orig, fixed)
        if ok:
            if '"' not in fixed:
                continue
            # 含双引号
            cat['has_quotes'] += 1
        else:
            ms = str(missing)
            if '未闭合' in ms:
                cat['unclosed'] += 1
            elif '非法反斜杠' in ms or '转义符后缺少空格' in ms:
                cat['escape_issue'] += 1
            elif any(x in ms for x in ['\\the', '\\The', '\\a', '\\his']):
                cat['escape_issue'] += 1
            else:
                cat['bracket_mismatch'] += 1

        row['translation'] = ''
        row['status'] = 'pending'
        row['error'] = str(missing) if not ok else 'has_quotes'
        entries_out.append(row)

with open(OUTPUT, 'w', encoding='utf-8-sig', newline='') as f:
    writer = csv.DictWriter(f, fieldnames=CSV_FIELDS)
    writer.writeheader()
    writer.writerows(entries_out)

print(f'导出 {len(entries_out)} 条 → {OUTPUT}')
for k, v in sorted(cat.items(), key=lambda x: -x[1]):
    print(f'  {k}: {v}')

# 打印几个典型例子
print('\n--- 典型例子 ---')
with open(OUTPUT, 'r', encoding='utf-8-sig') as f:
    reader = csv.DictReader(f)
    for i, row in enumerate(reader):
        if i >= 8:
            break
        print(f'{row["id"]} err={row["error"][:60]}')
        print(f'  orig: {row["original"][:120]}')
        print()
