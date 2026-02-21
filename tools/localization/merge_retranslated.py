#!/usr/bin/env python3
"""将 retranslate_fixed.csv 中的翻译结果合并回 strings.csv"""
import csv
import sys
sys.stdout.reconfigure(encoding='utf-8')

MAIN_CSV = 'strings.csv'
RETRANS_CSV = 'retranslate_fixed.csv'

CSV_FIELDS = ['id', 'file', 'line', 'context', 'original', 'translation', 'status', 'error']

# 加载重新翻译的结果
retrans = {}
with open(RETRANS_CSV, 'r', encoding='utf-8-sig', newline='') as f:
    reader = csv.DictReader(f)
    for row in reader:
        if row.get('status') == 'translated' and row.get('translation'):
            retrans[row['id']] = row

print(f'加载 {len(retrans)} 条重新翻译的结果')

# 更新主 CSV
entries = []
updated = 0
with open(MAIN_CSV, 'r', encoding='utf-8-sig', newline='') as f:
    reader = csv.DictReader(f)
    for row in reader:
        rid = row['id']
        if rid in retrans:
            r = retrans[rid]
            row['original'] = r['original']  # 可能修复了截断的原文
            row['translation'] = r['translation']
            row['status'] = 'translated'
            row['error'] = ''
            updated += 1
        entries.append(row)

with open(MAIN_CSV, 'w', encoding='utf-8-sig', newline='') as f:
    writer = csv.DictWriter(f, fieldnames=CSV_FIELDS)
    writer.writeheader()
    writer.writerows(entries)

print(f'已更新 {updated} 条到 {MAIN_CSV}')
