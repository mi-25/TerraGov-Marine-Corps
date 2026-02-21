#!/usr/bin/env python3
"""找出所有化学药品/试剂相关的 name 条目。"""
import csv
import sys
sys.stdout.reconfigure(encoding='utf-8')

REAGENT_FILE_PATTERNS = [
    'modules/reagents/',
    'modules/projectiles/ammo_types/bullet/smg.dm',  # some chems referenced
]

with open('strings.csv', 'r', encoding='utf-8-sig') as f:
    reader = csv.DictReader(f)
    count = 0
    name_entries = []
    desc_entries = []
    for row in reader:
        filepath = row.get('file', '')
        context = row.get('context', '')
        status = row.get('status', '')
        orig = row.get('original', '')
        trans = row.get('translation', '')

        is_reagent = any(p in filepath for p in REAGENT_FILE_PATTERNS)
        if not is_reagent:
            continue

        if context == 'name' and status == 'translated' and trans:
            name_entries.append(row)
        elif context == 'desc' and status == 'translated' and trans:
            desc_entries.append(row)

    print(f'试剂文件中的 name 条目: {len(name_entries)}')
    print(f'试剂文件中的 desc 条目: {len(desc_entries)}')
    print()
    print('--- name 条目示例 ---')
    for e in name_entries[:40]:
        print(f'  {e["file"]}:{e["line"]}  "{e["original"]}" → "{e["translation"]}"')
