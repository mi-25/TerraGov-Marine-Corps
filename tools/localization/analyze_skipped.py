#!/usr/bin/env python3
"""分析被跳过的条目，分类统计，找出可自动修复的。"""
import csv
import re
import sys
sys.stdout.reconfigure(encoding='utf-8')

sys.path.insert(0, '.')
from inject import validate_placeholders, has_unclosed_bracket, extract_bracket_expressions, should_skip_name_entry

BYOND_ESC_RE = re.compile(r'\\(?:the|The|a|an|he|she|they|his|her|their|\[|\])')

categories = {
    'unclosed_bracket': [],      # 原文未闭合方括号
    'escape_missing': [],        # 译文丢失了转义符
    'escape_broken': [],         # 译文中有非法反斜杠
    'escape_no_space': [],       # 转义符后缺少空格
    'bracket_mismatch': [],      # 方括号内容不匹配
    'name_as_key': [],           # name 被用作内部标识符
    'other': [],
}

with open('strings.csv', 'r', encoding='utf-8-sig') as f:
    reader = csv.DictReader(f)
    total = 0
    skipped = 0
    for row in reader:
        orig = row.get('original', '')
        trans = row.get('translation', '')
        status = row.get('status', '')
        filepath = row.get('file', '')
        context = row.get('context', '')
        if status != 'translated' or not trans:
            continue
        total += 1

        # Check name-as-key skip
        if should_skip_name_entry(filepath, context):
            categories['name_as_key'].append(row)
            skipped += 1
            continue

        is_valid, missing, extra = validate_placeholders(orig, trans)
        if is_valid:
            continue

        skipped += 1
        missing_str = str(missing)

        if '未闭合的方括号表达式' in missing_str:
            categories['unclosed_bracket'].append(row)
        elif '非法反斜杠序列' in missing_str:
            categories['escape_broken'].append(row)
        elif '转义符后缺少空格' in missing_str:
            categories['escape_no_space'].append(row)
        elif any(esc in missing_str for esc in ['\\the', '\\The', '\\a', '\\an', '\\his', '\\her', '\\he', '\\she', '\\they', '\\their', '\\[', '\\]']):
            categories['escape_missing'].append(row)
        else:
            categories['bracket_mismatch'].append(row)

print(f'总翻译条目: {total}')
print(f'被跳过条目: {skipped}')
print()
for cat, entries in categories.items():
    print(f'{cat}: {len(entries)}')
    for e in entries[:3]:
        print(f'  {e["id"]} {e["file"]}:{e["line"]}')
        print(f'    orig: {e["original"][:100]}')
        print(f'    trans: {e["translation"][:100]}')
    if len(entries) > 3:
        print(f'  ... 还有 {len(entries) - 3} 条')
    print()
