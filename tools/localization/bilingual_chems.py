#!/usr/bin/env python3
"""
批量修改 strings.csv 中化学药品/试剂的 name 翻译为双语格式：英文-中文
"""
import csv
import sys
sys.stdout.reconfigure(encoding='utf-8')

INPUT = 'strings.csv'
CSV_FIELDS = ['id', 'file', 'line', 'context', 'original', 'translation', 'status', 'error']

# 试剂相关文件路径
REAGENT_FILE_PATTERNS = [
    'modules/reagents/chemistry/reagents/',
]

# 排除的条目（不是药品名，是机器名或其他）
EXCLUDE_PATTERNS = [
    'machinery/',
    'reagentgrinder',
    'chem_master',
    'chem_dispenser',
    'pandemic',
]

def is_reagent_name(filepath, context):
    """判断是否是试剂 name 条目"""
    if context != 'name':
        return False
    if not any(p in filepath for p in REAGENT_FILE_PATTERNS):
        return False
    if any(p in filepath for p in EXCLUDE_PATTERNS):
        return False
    return True

def make_bilingual(original, translation):
    """生成双语格式：English-中文"""
    if not translation or not original:
        return translation
    # 如果已经是双语格式，跳过
    if '-' in translation and any('\u4e00' <= c <= '\u9fff' for c in translation.split('-')[-1]):
        return translation
    # 如果翻译和原文完全一样（没翻译），跳过
    if translation == original:
        return translation
    # 如果原文含有方括号表达式或转义符，跳过（不是简单名称）
    if '[' in original or '\\' in original:
        return translation
    # 如果翻译中没有中文字符，跳过
    if not any('\u4e00' <= c <= '\u9fff' for c in translation):
        return translation
    return f'{original}-{translation}'

entries = []
modified = 0
with open(INPUT, 'r', encoding='utf-8-sig') as f:
    reader = csv.DictReader(f)
    for row in reader:
        if is_reagent_name(row['file'], row.get('context', '')) and row.get('status') == 'translated':
            old_trans = row['translation']
            new_trans = make_bilingual(row['original'], old_trans)
            if new_trans != old_trans:
                row['translation'] = new_trans
                modified += 1
        entries.append(row)

with open(INPUT, 'w', encoding='utf-8-sig', newline='') as f:
    writer = csv.DictWriter(f, fieldnames=CSV_FIELDS)
    writer.writeheader()
    writer.writerows(entries)

print(f'修改了 {modified} 条试剂名称为双语格式')

# 显示一些例子
with open(INPUT, 'r', encoding='utf-8-sig') as f:
    reader = csv.DictReader(f)
    shown = 0
    for row in reader:
        if is_reagent_name(row['file'], row.get('context', '')) and row.get('status') == 'translated':
            trans = row['translation']
            if '-' in trans and any('\u4e00' <= c <= '\u9fff' for c in trans):
                print(f'  "{row["original"]}" → "{trans}"')
                shown += 1
                if shown >= 30:
                    break
