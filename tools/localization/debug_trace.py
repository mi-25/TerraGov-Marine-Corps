#!/usr/bin/env python3
"""Debug: trace validate_placeholders step by step for the mlrs case."""
import sys
sys.path.insert(0, '.')
from inject import validate_placeholders, extract_bracket_expressions, has_unclosed_bracket
import re

orig = '[user] starts loading \\a [mortar_shell.name] into [src].'
trans = '[user]\u5f00\u59cb\u5c06\\a[mortar_shell.name]\u88c5\u5165[src]\u3002'

print(f"orig: {repr(orig)}")
print(f"trans: {repr(trans)}")
print()

# Step 1: unclosed bracket check
print(f"has_unclosed_bracket(orig): {has_unclosed_bracket(orig)}")
print(f"has_unclosed_bracket(trans): {has_unclosed_bracket(trans)}")

# Step 2: bracket expressions
orig_b = extract_bracket_expressions(orig)
trans_b = extract_bracket_expressions(trans)
print(f"orig brackets: {orig_b}")
print(f"trans brackets: {trans_b}")
print(f"brackets match: {set(orig_b) == set(trans_b)}")

# Step 3: escape sequences
BYOND_ESC_RE = re.compile(r'\\(?:the|The|a|an|he|she|they|his|her|their|\[|\])')
orig_esc = BYOND_ESC_RE.findall(orig)
trans_esc = BYOND_ESC_RE.findall(trans)
print(f"orig escapes: {orig_esc}")
print(f"trans escapes: {trans_esc}")
print(f"escapes match: {sorted(orig_esc) == sorted(trans_esc)}")

# Step 4: full validation
ok, missing, extra = validate_placeholders(orig, trans)
print(f"\nResult: ok={ok}, missing={missing}, extra={extra}")
