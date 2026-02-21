#!/usr/bin/env python3
"""Debug: check actual chars around backslash in problematic CSV entries."""
import csv

with open('strings.csv', 'r', encoding='utf-8-sig') as f:
    reader = csv.DictReader(f)
    for row in reader:
        if row['id'] == 'ffe155e0':
            trans = row['translation']
            bslash = '\\'
            for i, ch in enumerate(trans):
                if ch == bslash:
                    snippet = trans[i:i+5]
                    ords = [ord(c) for c in snippet]
                    print(f"pos {i}: {repr(snippet)}  ords={ords}")
            print(f"full repr: {repr(trans)}")
            break
