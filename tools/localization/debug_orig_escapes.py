#!/usr/bin/env python3
"""Find all unique backslash sequences in originals."""
import csv
import re
import sys
sys.stdout.reconfigure(encoding='utf-8')

seqs = {}
with open('strings.csv', 'r', encoding='utf-8-sig') as f:
    reader = csv.DictReader(f)
    for row in reader:
        orig = row.get('original', '')
        for m in re.finditer(r'\\([a-zA-Z]+)', orig):
            word = m.group(1)
            seqs[word] = seqs.get(word, 0) + 1

for word, count in sorted(seqs.items(), key=lambda x: -x[1]):
    print(f'{count:5d}  \\{word}')
