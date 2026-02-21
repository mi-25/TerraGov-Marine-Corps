#!/usr/bin/env python3
"""Check what \\imp is about."""
import csv
import re
import sys
sys.stdout.reconfigure(encoding='utf-8')

with open('strings.csv', 'r', encoding='utf-8-sig') as f:
    reader = csv.DictReader(f)
    count = 0
    for row in reader:
        trans = row.get('translation', '')
        orig = row.get('original', '')
        if '\\imp' in trans or '\\imp' in orig:
            print(f'{row["id"]} {row["file"]}:{row["line"]} ctx={row["context"]}')
            print(f'  orig: {orig[:200]}')
            print(f'  trans: {trans[:200]}')
            print()
            count += 1
            if count >= 10:
                break
    print(f'Shown {count}')
