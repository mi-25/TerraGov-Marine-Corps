#!/usr/bin/env python3
"""Find what backslash sequences are being flagged as illegal in translations."""
import csv
import re
import sys
sys.stdout.reconfigure(encoding='utf-8')

LEGAL = re.compile(r'\\(?:the|The|a|an|he|she|they|his|her|their|\[|\]|n|t|\\|"|\'|[0-9])')

flagged = {}
with open('strings.csv', 'r', encoding='utf-8-sig') as f:
    reader = csv.DictReader(f)
    for row in reader:
        trans = row.get('translation', '')
        if not trans:
            continue
        for i, ch in enumerate(trans):
            if ch == '\\' and i + 1 < len(trans):
                remaining = trans[i:]
                if not LEGAL.match(remaining):
                    seq = trans[i:i+4]
                    flagged[seq] = flagged.get(seq, 0) + 1

for seq, count in sorted(flagged.items(), key=lambda x: -x[1])[:30]:
    print(f'{count:5d}  {repr(seq)}')
