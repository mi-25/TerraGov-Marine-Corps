#!/usr/bin/env python3
"""
TGMC 本地化工具 - 翻译注入模块
将翻译后的文本替换回 .dm 源码文件中。
支持 dry-run 预览、备份、占位符验证。
"""

import argparse
import csv
import os
import re
import shutil
import sys
from collections import defaultdict
from datetime import datetime


CSV_FIELDS = ['id', 'file', 'line', 'context', 'original', 'translation', 'status', 'error']

# name 属性被用作内部标识符/字典键的文件路径模式
# 翻译这些文件中的 name 会导致运行时查找失败
NAME_AS_KEY_FILE_PATTERNS = [
    # 种子系统：GLOB.seed_types[S.name] 用 name 做字典键
    'modules/hydroponics/',
    'modules/reagents/reagent_containers/food/snacks/grown',
    # 穿梭机系统：id/name 用于查找
    'modules/shuttle/',
    'controllers/subsystem/shuttle.dm',
    'datums/shuttles.dm',
    # 物种系统：GLOB.all_species[S.name] / GLOB.roundstart_species[S.name]
    '__HELPERS/global_lists.dm',
    'modules/mob/living/carbon/human/species_types/',
    'modules/mob/living/carbon/human/_species.dm',
    # 异形种姓系统：GLOB.xeno_caste_datums 用 name 做键
    'modules/mob/living/carbon/xenomorph/',
    '_globalvars/lists/mobs.dm',
    # 职位系统：name_occupations[J.title] / GLOB.jobs_command[job.title]
    'controllers/subsystem/job.dm',
    'datums/jobs/',
    # 小队系统：squads_by_name[name]
    'datums/jobs/squads.dm',
    # 地图模板系统
    'controllers/subsystem/mapping.dm',
    'datums/map_template/',
    # 安全等级系统：available_levels[security_level.name]
    'controllers/subsystem/security_level.dm',
    'modules/security_levels/',
    # 投票系统
    'controllers/subsystem/vote.dm',
    # 持久化系统
    'controllers/subsystem/persistence/',
    # 传送系统
    'modules/transport/tram/',
    # 按键绑定：GLOB.keybindings_by_name[name]
    '_globalvars/lists/keybinding.dm',
    'datums/keybinding/',
    # 管理员权限
    'modules/admin/admin_ranks.dm',
    # 外观配件系统：sprite_accessory 用 name 做键
    'modules/mob/new_player/sprite_accessories.dm',
    'modules/mob/new_player/ethnicity.dm',
    '_globalvars/lists/flavor_misc.dm',
    # 蜂巢升级系统：upgrades_by_name[name]
    'modules/mob/living/carbon/xenomorph/hive_upgrades.dm',
    # 游戏模式
    'datums/gamemodes/',
    # 乐器系统
    'controllers/subsystem/processing/instruments.dm',
    # 肢体/器官系统：get_limb() 用 limb.name 做匹配
    'modules/organs/',
    # HUD screen objects: name 被 put_storage_in_hand() 用作 switch 匹配键
    '_onclick/hud/screen_objects/',
    '_onclick/hud/',
]

# name 值精确黑名单：无论在哪个文件中，这些 name 值都不能翻译
NAME_EXACT_BLACKLIST = {
    "l_hand", "r_hand",           # storage.dm put_storage_in_hand() switch 键
    "right", "left",              # activate_hand() 匹配
}


def should_skip_name_entry(filepath: str, context: str, original: str = '') -> bool:
    """
    判断是否应跳过某个 name 类型的条目。
    当 name 属性在特定文件中被用作内部标识符时，翻译会破坏运行时查找。
    也检查精确黑名单中的 name 值。
    """
    if context != 'name':
        return False
    # 精确值黑名单
    if original in NAME_EXACT_BLACKLIST:
        return True
    # 路径模式匹配
    for pattern in NAME_AS_KEY_FILE_PATTERNS:
        if pattern in filepath:
            return True
    return False


def load_csv(csv_path: str) -> list:
    """加载 CSV 文件"""
    entries = []
    with open(csv_path, 'r', encoding='utf-8-sig', newline='') as f:
        reader = csv.DictReader(f)
        for row in reader:
            entries.append(row)
    return entries


def extract_bracket_expressions(text: str) -> list:
    """
    提取文本中所有完整的方括号表达式 [...]，支持嵌套括号。
    返回完整的 [expression] 列表（包含方括号本身）。
    """
    results = []
    i = 0
    while i < len(text):
        if text[i] == '[':
            depth = 1
            start = i
            i += 1
            while i < len(text) and depth > 0:
                if text[i] == '[':
                    depth += 1
                elif text[i] == ']':
                    depth -= 1
                i += 1
            if depth == 0:
                results.append(text[start:i])
            # depth > 0 意味着未闭合的括号，不加入结果
        else:
            i += 1
    return results


def has_unclosed_bracket(text: str) -> bool:
    """检查文本是否包含未闭合的方括号（说明原文被截断）"""
    depth = 0
    for ch in text:
        if ch == '[':
            depth += 1
        elif ch == ']':
            depth -= 1
    return depth != 0


def validate_placeholders(original: str, translation: str) -> tuple:
    """
    验证译文中的占位符是否与原文一致。
    检查方括号表达式（包括复杂的三元运算符等）和 BYOND 转义符。
    同时检测译文中是否引入了非法的反斜杠序列。
    返回 (is_valid, missing, extra)
    """
    # 检查原文是否有未闭合的方括号（被截断的字符串）
    if has_unclosed_bracket(original):
        return (False, {'[未闭合的方括号表达式]'}, set())

    # 提取所有完整的方括号表达式（支持复杂内容如三元运算符）
    orig_brackets = extract_bracket_expressions(original)
    trans_brackets = extract_bracket_expressions(translation)

    orig_bracket_set = set(orig_brackets)
    trans_bracket_set = set(trans_brackets)

    # BYOND 转义符（需要在原文和译文之间保持一致的）
    # 文本宏: \the \The \a \A \an \he \she \they \his \her \their
    # 名词修饰: \improper \proper
    # 颜色: \black 等
    # 字面方括号: \[ \]
    BYOND_ESC_RE = re.compile(
        r'\\(?:the|The|improper|proper|black|A|a|an|he|she|they|his|her|their|\[|\])'
    )
    orig_escapes = BYOND_ESC_RE.findall(original)
    trans_escapes = BYOND_ESC_RE.findall(translation)

    # 转义符用 sorted multiset 比较（同一个转义可能出现多次，顺序无关但数量要一致）
    orig_esc_sorted = sorted(orig_escapes)
    trans_esc_sorted = sorted(trans_escapes)

    orig_all = orig_bracket_set | set(orig_escapes)
    trans_all = trans_bracket_set | set(trans_escapes)

    missing = orig_all - trans_all
    extra = trans_all - orig_all

    # 即使集合相同，数量不一致也算不匹配（如原文有两个 \the，译文只有一个）
    if orig_esc_sorted != trans_esc_sorted:
        missing_list = list(orig_esc_sorted)
        for e in trans_esc_sorted:
            if e in missing_list:
                missing_list.remove(e)
        extra_list = list(trans_esc_sorted)
        for e in orig_esc_sorted:
            if e in extra_list:
                extra_list.remove(e)
        if missing_list or extra_list:
            return (False, set(missing_list) | missing, set(extra_list) | extra)

    if missing or extra:
        return (False, missing, extra)

    # 最后检查：译文中不能出现非法的反斜杠序列
    # DM 合法的反斜杠序列（完整列表）:
    #   文本宏: \the \The \a \an \he \she \they \his \her \their
    #   名词修饰: \improper \proper
    #   字面字符: \[ \] \n \t \\ \" \' \> \< \s
    #   HTML/引用: \ref
    #   数字: \0-9
    LEGAL_BACKSLASH_RE = re.compile(
        r'\\(?:the|The|improper|proper|black|A|a|an|he|she|they|his|her|their'
        r'|\[|\]|n|t|s|r|\\|"|\'|>|<|ref|th|[0-9])'
    )
    for i, ch in enumerate(translation):
        if ch == '\\' and i + 1 < len(translation):
            remaining = translation[i:]
            if not LEGAL_BACKSLASH_RE.match(remaining):
                next_char = translation[i + 1]
                # \后跟中文字符 = 一定是翻译破坏了转义符
                if '\u4e00' <= next_char <= '\u9fff':
                    bad_seq = translation[i:i+6]
                    return (False, {f'非法反斜杠序列: {bad_seq}'}, set())
                # \后跟其他非法字符也拦截（但 \tab 等空白字符放行）
                if next_char not in (' ', '\t'):
                    bad_seq = translation[i:i+6]
                    return (False, {f'非法反斜杠序列: {bad_seq}'}, set())

    # 检查 BYOND 转义符后面的上下文是否合法
    # \the \The \a \an \his \her 等后面必须跟空格或字符串结尾
    # DM 编译器会把 \his的 当成未知转义序列
    BYOND_ESC_CONTEXT_RE = re.compile(
        r'\\(?:the|The|a|an|he|she|they|his|her|their|improper|proper|black)'
    )
    for m in BYOND_ESC_CONTEXT_RE.finditer(translation):
        end_pos = m.end()
        if end_pos < len(translation):
            next_char = translation[end_pos]
            # 转义符后面必须跟空格才合法
            if next_char != ' ':
                bad_context = translation[m.start():m.start()+15]
                return (False, {f'转义符后缺少空格: {bad_context}'}, set())

    return (True, set(), set())


def auto_fix_translation(original: str, translation: str) -> str:
    """
    尝试自动修复译文中的常见问题。
    返回修复后的译文，如果无法修复则返回原译文。
    """
    fixed = translation

    # 修复1: \A 改为 \a（DM 不认识大写 \A，只认识 \a）
    fixed = re.sub(r'\\A(?= )', r'\\a', fixed)

    # 修复2: BYOND 转义符后缺少空格，如 \a[var] -> \a [var]，\the[var] -> \the [var]
    BYOND_ESC_NOSPACE_RE = re.compile(r'(\\(?:the|The|a|an|he|she|they|his|her|their))(\[)')
    fixed = BYOND_ESC_NOSPACE_RE.sub(r'\1 \2', fixed)

    return fixed


def group_by_file(entries: list) -> dict:
    """按文件路径分组"""
    groups = defaultdict(list)
    for entry in entries:
        groups[entry['file']].append(entry)
    return groups


def backup_file(filepath: str, backup_dir: str):
    """创建文件备份"""
    rel = os.path.relpath(filepath, os.path.dirname(filepath))
    backup_path = os.path.join(backup_dir, os.path.basename(filepath))

    # 如果备份目录中已有同名文件，添加时间戳
    if os.path.exists(backup_path):
        name, ext = os.path.splitext(backup_path)
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        backup_path = f"{name}_{timestamp}{ext}"

    os.makedirs(os.path.dirname(backup_path) if os.path.dirname(backup_path) else backup_dir, exist_ok=True)
    shutil.copy2(filepath, backup_path)
    return backup_path


def inject_translation(line_content: str, original: str, translation: str) -> str:
    """
    在一行代码中将原文替换为译文。
    只替换双引号内的字符串内容，保留代码结构。
    """
    # 安全检查：译文不能包含换行符
    translation = translation.replace('\n', '').replace('\r', '')
    # 安全检查：中文双引号替换为单引号（避免破坏 DM 字符串）
    translation = translation.replace('\u201c', "'").replace('\u201d', "'")
    # 安全检查：译文不能包含未转义的英文双引号（会截断 DM 字符串）
    if '"' in translation:
        return None

    # 转义原文中的特殊正则字符，但保留实际内容匹配
    escaped_original = re.escape(original)
    # 在引号内查找并替换
    pattern = f'"{escaped_original}"'
    replacement = f'"{translation}"'

    if re.search(pattern, line_content):
        return line_content.replace(f'"{original}"', f'"{translation}"', 1)

    return None  # 未找到匹配


def inject_multiline_translation(full_content: str, original: str, translation: str) -> str:
    """
    在全文中替换多行文本块 {"original"} → {"translation"}。
    用于 html_description、bioscan 等跨行文本。
    """
    # 安全检查：中文双引号替换为单引号
    translation = translation.replace('\u201c', "'").replace('\u201d', "'")
    # 安全检查：译文不能包含未转义的英文双引号
    if '"' in translation and '"}' not in translation:
        return None

    target = '{"' + original + '"}'
    if target in full_content:
        replacement = '{"' + translation + '"}'
        return full_content.replace(target, replacement, 1)
    return None


def process_file(filepath: str, entries: list, source_dir: str, backup_dir: str,
                 dry_run: bool, force: bool) -> dict:
    """
    处理单个文件的翻译注入。
    返回统计信息 {injected, skipped, not_found, errors}
    """
    stats = {'injected': 0, 'skipped': 0, 'not_found': 0, 'errors': []}

    abs_path = os.path.join(source_dir, filepath.replace('/', os.sep))
    if not os.path.exists(abs_path):
        stats['errors'].append(f"文件不存在: {abs_path}")
        return stats

    try:
        with open(abs_path, 'r', encoding='utf-8', errors='replace') as f:
            lines = f.readlines()
            full_content = ''.join(lines)
    except Exception as e:
        stats['errors'].append(f"无法读取 {abs_path}: {e}")
        return stats

    # 分离多行文本条目和单行条目
    multiline_entries = [e for e in entries if e.get('context') == 'multiline_text']
    singleline_entries = [e for e in entries if e.get('context') != 'multiline_text']

    modified = False

    # 先处理多行文本块（全文替换）
    for entry in multiline_entries:
        original = entry['original']
        translation = entry['translation']

        if not translation:
            stats['skipped'] += 1
            continue

        if should_skip_name_entry(filepath, entry.get('context', ''), original):
            stats['skipped'] += 1
            continue

        translation = auto_fix_translation(original, translation)

        if not force:
            is_valid, missing, extra = validate_placeholders(original, translation)
            if not is_valid:
                stats['skipped'] += 1
                msg = f"  [占位符不匹配] {entry['id']}: 缺少 {missing}"
                if dry_run:
                    print(msg)
                stats['errors'].append(msg)
                continue

        result = inject_multiline_translation(full_content, original, translation)
        if result is not None:
            if dry_run:
                print(f"  [DRY RUN 多行] {filepath}:{entry.get('line', '?')}")
                print(f"    - \"{original[:80]}...\"")
                print(f"    + \"{translation[:80]}...\"")
            else:
                full_content = result
                modified = True
            stats['injected'] += 1
        else:
            stats['not_found'] += 1
            if dry_run:
                print(f"  [未找到 多行] {entry['id']}: \"{original[:50]}...\"")

    # 如果多行替换修改了内容，重新拆分为行
    if modified:
        lines = full_content.splitlines(True)

    # 按行号索引单行条目
    line_map = defaultdict(list)
    for entry in singleline_entries:
        try:
            line_num = int(entry['line'])
            line_map[line_num].append(entry)
        except (ValueError, KeyError):
            stats['errors'].append(f"无效行号: {entry.get('id', '?')}")

    for line_num, line_entries in sorted(line_map.items()):
        if line_num < 1 or line_num > len(lines):
            for entry in line_entries:
                stats['not_found'] += 1
                if not dry_run:
                    print(f"  [未找到] {entry['id']}: 行 {line_num} 超出范围")
            continue

        line_idx = line_num - 1

        for entry in line_entries:
            original = entry['original']
            translation = entry['translation']

            if not translation:
                stats['skipped'] += 1
                continue

            # 跳过 name 属性在特定文件中的翻译（这些 name 被用作内部标识符）
            if should_skip_name_entry(filepath, entry.get('context', ''), original):
                stats['skipped'] += 1
                continue

            # 尝试自动修复译文
            translation = auto_fix_translation(original, translation)

            # 占位符验证
            if not force:
                is_valid, missing, extra = validate_placeholders(original, translation)
                if not is_valid:
                    stats['skipped'] += 1
                    msg = f"  [占位符不匹配] {entry['id']}: 缺少 {missing}"
                    if dry_run:
                        print(msg)
                    stats['errors'].append(msg)
                    continue

            # 尝试替换
            result = inject_translation(lines[line_idx], original, translation)

            if result is not None:
                if dry_run:
                    print(f"  [DRY RUN] {filepath}:{line_num}")
                    print(f"    - \"{original}\"")
                    print(f"    + \"{translation}\"")
                else:
                    lines[line_idx] = result
                    modified = True
                stats['injected'] += 1
            else:
                # 原文不在预期行，尝试在附近行搜索（±5行）
                found = False
                for offset in range(-5, 6):
                    search_idx = line_idx + offset
                    if search_idx < 0 or search_idx >= len(lines) or offset == 0:
                        continue
                    result = inject_translation(lines[search_idx], original, translation)
                    if result is not None:
                        if dry_run:
                            print(f"  [DRY RUN] {filepath}:{search_idx + 1} (偏移 {offset:+d})")
                            print(f"    - \"{original}\"")
                            print(f"    + \"{translation}\"")
                        else:
                            lines[search_idx] = result
                            modified = True
                        stats['injected'] += 1
                        found = True
                        break

                if not found:
                    stats['not_found'] += 1
                    if dry_run:
                        print(f"  [未找到] {entry['id']}: \"{original[:50]}...\"")

    # 写回文件
    if modified and not dry_run:
        if backup_dir:
            bp = backup_file(abs_path, backup_dir)
            print(f"  备份: {bp}")

        with open(abs_path, 'w', encoding='utf-8', newline='') as f:
            f.writelines(lines)

    return stats


def main():
    parser = argparse.ArgumentParser(
        description='TGMC 本地化工具 - 将翻译注入回 .dm 源码文件'
    )
    parser.add_argument(
        '--csv', '-c',
        required=True,
        help='翻译后的 CSV 文件路径'
    )
    parser.add_argument(
        '--source-dir', '-s',
        required=True,
        help='源码根目录（与 extract.py 使用的相同）'
    )
    parser.add_argument(
        '--backup-dir', '-b',
        default=None,
        help='备份目录（默认不备份，建议设置）'
    )
    parser.add_argument(
        '--dry-run', '-n',
        action='store_true',
        help='预览模式：只显示将要修改的内容，不实际写入'
    )
    parser.add_argument(
        '--force', '-f',
        action='store_true',
        help='强制注入：跳过占位符验证'
    )

    args = parser.parse_args()

    if not os.path.exists(args.csv):
        print(f"[错误] CSV 文件不存在: {args.csv}", file=sys.stderr)
        sys.exit(1)

    source_dir = os.path.abspath(args.source_dir)
    if not os.path.isdir(source_dir):
        print(f"[错误] 源码目录不存在: {source_dir}", file=sys.stderr)
        sys.exit(1)

    if args.backup_dir:
        os.makedirs(args.backup_dir, exist_ok=True)

    # 加载翻译
    entries = load_csv(args.csv)
    translated = [e for e in entries if e.get('status') == 'translated' and e.get('translation')]
    print(f"加载 {len(entries)} 条记录，其中 {len(translated)} 条已翻译")

    if not translated:
        print("没有已翻译的条目可注入。")
        return

    if args.dry_run:
        print("=== DRY RUN 模式 ===\n")

    # 按文件分组处理
    file_groups = group_by_file(translated)
    total_stats = {'injected': 0, 'skipped': 0, 'not_found': 0, 'errors': []}

    for filepath, file_entries in sorted(file_groups.items()):
        print(f"\n处理: {filepath} ({len(file_entries)} 条)")
        stats = process_file(
            filepath, file_entries, source_dir,
            args.backup_dir, args.dry_run, args.force
        )
        total_stats['injected'] += stats['injected']
        total_stats['skipped'] += stats['skipped']
        total_stats['not_found'] += stats['not_found']
        total_stats['errors'].extend(stats['errors'])

    # 汇总
    print(f"\n{'=== DRY RUN 结果 ===' if args.dry_run else '=== 注入完成 ==='}")
    print(f"  注入: {total_stats['injected']}")
    print(f"  跳过: {total_stats['skipped']}")
    print(f"  未找到: {total_stats['not_found']}")
    if total_stats['errors']:
        print(f"  错误: {len(total_stats['errors'])}")
        for err in total_stats['errors'][:10]:
            print(f"    {err}")
        if len(total_stats['errors']) > 10:
            print(f"    ... 还有 {len(total_stats['errors']) - 10} 条错误")


if __name__ == '__main__':
    main()
