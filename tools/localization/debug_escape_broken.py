#!/usr/bin/env python3
"""Show the 4 remaining escape_broken entries in detail."""
import csv
import re
import sys
sys.stdout.reconfigure(encoding='utf-8')
sys.path.insert(0, '.')
from inject import validate_placeholders, auto_fix_translation

LEGAL = re.compile(
    r'\\(?:the|The|improper|proper|a|an|he|she|they|his|her|their'
    r'|\[|\]|n|t|s|r|\\|"|\'|>|<|ref|[0-9])'
)

with open('strings.csv', 'r', encoding='utf-8-sig') as f:
    reader = csv.DictReader(f)
    for row in reader:
        orig = row.get('original', '')
        trans = row.get('translation', '')
        status = row.get('status', '')
        if status != 'translated' or not trans:
            continue
        fixed = auto_fix_translation(orig, trans)
        ok, missing, extra = validate_placeholders(orig, fixed)
        if not ok and '非法反斜杠序列' in str(missing):
            print(f'{row["id"]} {row["file"]}:{row["line"]}')
            print(f'  orig:  {repr(orig[:200])}')
            print(f'  trans: {repr(trans[:200])}')
            print(f'  fixed: {repr(fixed[:200])}')
            print(f'  reason: {missing}')
            # Show which backslash is illegal
            for i, ch in enumerate(fixed):
                if ch == '\\' and i + 1 < len(fixed):
                    remaining = fixed[i:]
                    if not LEGAL.match(remaining):
                        print(f'  illegal at pos {i}: {repr(fixed[i:i+10])}')
            print()
