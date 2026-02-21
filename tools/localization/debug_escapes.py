#!/usr/bin/env python3
"""Debug: find entries where BYOND escape sequences got broken in translation."""
import csv
import re

ESC_PATTERN = re.compile(r'\\(?:the|a|an|he|she|they|his|her|their|The)')

with open('strings.csv', 'r', encoding='utf-8-sig') as f:
    reader = csv.DictReader(f)
    count = 0
    for row in reader:
        trans = row.get('translation', '')
        orig = row.get('original', '')
        status = row.get('status', '')
        if status != 'translated' or not trans:
            continue
        try:
            orig_esc = ESC_PATTERN.findall(orig)
        except Exception:
            continue
        if orig_esc:
            try:
                trans_esc = ESC_PATTERN.findall(trans)
            except Exception:
                trans_esc = []
            if set(orig_esc) != set(trans_esc):
                print(f'{row["id"]} {row["file"]}:{row["line"]}')
                print(f'  orig: {orig[:150]}')
                print(f'  trans: {trans[:150]}')
                print(f'  orig_esc: {orig_esc}  trans_esc: {trans_esc}')
                print()
                count += 1
    print(f'Total broken escape entries: {count}')
