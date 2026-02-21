#!/usr/bin/env python3
"""Debug: test regex matching on the actual problematic string."""
import re

BYOND_ESC_CONTEXT_RE = re.compile(
    r'\\(?:the|The|a|an|he|she|they|his|her|their)'
)

trans = '[user]\u5f00\u59cb\u5c06\\a[mortar_shell.name]\u88c5\u5165[src]\u3002'
print(f"trans: {repr(trans)}")
for m in BYOND_ESC_CONTEXT_RE.finditer(trans):
    print(f"  match: {repr(m.group())} at {m.start()}-{m.end()}")
    end_pos = m.end()
    if end_pos < len(trans):
        print(f"  next char: {repr(trans[end_pos])} ord={ord(trans[end_pos])}")
