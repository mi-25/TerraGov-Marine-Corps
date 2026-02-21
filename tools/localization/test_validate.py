#!/usr/bin/env python3
"""Test validate_placeholders with all error cases from compile output."""
import sys
sys.path.insert(0, '.')
from inject import validate_placeholders

tests = [
    # (name, original, translation, should_pass)
    ("simple var ok", "[user] says hello", "[user] 说你好", True),
    ("ternary mismatch", '[automatic_meds_use ? "now" : "no longer"] injecting', '[自动用药 ? "now" : "no longer"] injecting', False),
    ("unclosed bracket", '[automatic_meds_use ? ', '[自动用药 ? ', False),

    # Escape sequence errors from compile output:
    ("\\The dropped", "\\The [H] needs two wrists", "\\这个[H]至少需要两只手腕", False),
    ("\\a dropped", "[user] starts loading \\a [mortar_shell.name] into [src].", "[user]开始将\\a[mortar_shell.name]装入[src]。", True),
    ("\\a completely removed", "You take \\a [Sign] from [src].", "你从[src]那里拿走了[Sign]。", False),
    ("\\his preserved", "[user] fails at refilling \\his [W.name]!", "[user] 在给\\his的[W.name]装填弹药时失败！", True),
    ("\\The -> \\the case change", "\\The [acid_t] begins to crumble!", "\\the [acid_t]在酸液下崩解！", False),
    ("\\the \\the \\The all dropped", "\\The [usr] cuts \\the [C] with \\the [src]!", "[usr]用[src]切断了[C]的束缚！", False),
    ("\\black illegal", "glowing \\black nettle", "发光的\\黑色荨麻", False),
    ("\\这 illegal", "\\The [display_name] shudders", "\\这[display_name]饥渴地颤抖", False),
    ("\\[ literal bracket", "\\[[time_stamp()]] Uncaught", "[[time_stamp()]] 未捕获", False),

    # Should pass cases
    ("no escapes ok", "hello world", "你好世界", True),
    ("multiple vars ok", "[src] charge [cell.charge]/[cell.maxcharge]", "[src] 电量 [cell.charge]/[cell.maxcharge]", True),
]

passed = 0
failed = 0
for name, orig, trans, should_pass in tests:
    ok, missing, extra = validate_placeholders(orig, trans)
    if ok == should_pass:
        passed += 1
        print(f"  PASS: {name}")
    else:
        failed += 1
        print(f"  FAIL: {name} (expected {'pass' if should_pass else 'reject'}, got {'pass' if ok else 'reject'})")
        print(f"        missing={missing} extra={extra}")

print(f"\n{passed}/{passed+failed} tests passed")
if failed:
    sys.exit(1)
