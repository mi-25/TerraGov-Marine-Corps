/obj/item/attachable/stock //Generic stock parent and related things.
	name = "默认枪托"
	desc = "默认父对象，不应用于实际使用。"
	icon = 'icons/obj/items/guns/attachments/stock.dmi'
	slot = ATTACHMENT_SLOT_STOCK
	attach_features_flags = NONE //most stocks are not removable
	size_mod = 2
	pixel_shift_x = 30
	pixel_shift_y = 14

/obj/item/attachable/stock/mosin
	name = "莫辛木制枪托"
	desc = "斯拉夫枪械的非标准长木质枪托。"
	icon_state = "mosin"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/ppsh
	name = "PPSh-17b 冲锋枪木质枪托"
	desc = "PPSh-17b 冲锋枪的长木制枪托"
	icon_state = "ppsh"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/t27
	name = "MG-27 枪身"
	desc = "MG-27 中型机枪的枪托。"
	icon_state = "t27"
	pixel_shift_x = 15
	pixel_shift_y = 0

/obj/item/attachable/stock/pal12
	name = "帕拉丁-12泵动式霰弹枪枪托"
	desc = "帕拉丁-12霰弹枪的标准轻型枪托。"
	icon_state = "pal12"

/obj/item/attachable/stock/mpi_km
	name = "MPi-KM 木质枪托"
	desc = "一个带有木纹涂层的金属枪托，专为MPi-KM设计。"
	icon_state = "ak47"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/mpi_km/black
	name = "MPi-KM聚合物枪托"
	desc = "一个黑色聚合物枪托，专为MPi-KM设计。"
	icon_state = "ak47_black"

/obj/item/attachable/stock/lmg_d
	name = "LMG-D 木质枪托"
	desc = "金属制枪托，带有木纹漆面涂层，专为LMG-D设计。"
	icon_state = "ak47"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/tx15
	name = "\improper SH-15枪托"
	desc = "SH-15的标准枪托。无法拆卸。"
	icon_state = "tx15"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/sgstock
	name = "SG-29 枪托"
	desc = "标准机枪枪托。"
	icon_state = "sg29"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/strstock
	name = "SG-62 枪托"
	desc = "标准步枪枪托。"
	icon_state = "sg62"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/lasgun
	name = "\improper M43 日怒激光枪枪托"
	desc = "M43 烈日激光枪的标准枪托。"
	icon_state = "laser"
	pixel_shift_x = 41
	pixel_shift_y = 10

/obj/item/attachable/stock/lasgun/practice
	name = "\improper M43-P 日炎激光步枪枪托"
	desc = "M43-P 日怒激光枪的标准枪托，看起来是塑料材质的。"
	icon_state = "laser"
	pixel_shift_x = 41
	pixel_shift_y = 10

/obj/item/attachable/stock/tl127stock
	name = "\improper SR-127 枪托"
	desc = "一个不可拆卸的SR-127狙击步枪枪托。"
	icon_state = "tl127"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/garand
	name = "\improper C1枪托"
	desc = "一个不可拆卸的C1枪托。"
	icon_state = "garand"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/trenchgun
	name = "\improper L-4043 枪托"
	desc = "一个不可拆卸的L-4043枪托。"
	icon_state = "trench"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/icc_heavyshotgun
	name = "\improper ML-101枪托"
	desc = "一个不可拆卸的ML-101枪托。"
	icon_state = "ml101"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/icc_pdw
	name = "\improper L-40 枪托"
	desc = "一个不可拆卸的L-40枪托。"
	icon_state = "l40"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/icc_sharpshooter
	name = "\improper L-1 枪托"
	desc = "一个不可拆卸的L-11枪托。"
	icon_state = "l11"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/clf_heavyrifle
	name = "PTR-41/1785 枪身"
	desc = "PTR-41/1785 A-MR 的枪托。"
	icon_state = "ptrs"
	pixel_shift_x = 15
	pixel_shift_y = 0

/obj/item/attachable/stock/dpm
	name = "\improper DP-27 枪托"
	desc = "一个不可拆卸的DP枪托。"
	icon_state = "dp"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/t39stock
	name = "\improper SH-39 枪托"
	desc = "SH-39专用枪托。"
	icon_state = "t39"
	pixel_shift_x = 32
	pixel_shift_y = 13
	size_mod = 1
	attach_features_flags = ATTACH_REMOVABLE
	wield_delay_mod = 0.2 SECONDS
	accuracy_mod = 0.15
	recoil_mod = -2
	scatter_mod = -2

/obj/item/attachable/stock/t60stock
	name = "MG-60 枪托"
	desc = "一个不可拆卸的MG-60通用机枪枪托。"
	icon_state = "t60"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/t70stock
	name = "\improper GL-70 枪托"
	desc = "一个不可拆卸的 GL-70 榴弹发射器枪托。"
	icon_state = "t70"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/t84stock
	name = "\improper FL-84 枪托"
	desc = "一个不可拆卸的FL-84喷火器枪托。"
	icon_state = "tl84"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/m41a
	name = "PR-11 枪托"
	icon_state = "m41a"

/obj/item/attachable/stock/m41a_custom
	name = "PR-11定制枪托"
	icon_state = "m41a_custom"

/obj/item/attachable/stock/tx11
	name = "AR-11 枪托"
	icon_state = "tx11"

/obj/item/attachable/stock/som_mg_stock
	name = "\improper V-41 枪托"
	desc = "一个不可拆卸的V-41机枪枪托。"
	icon_state = "v41"
	pixel_shift_x = 0
	pixel_shift_y = 0

/obj/item/attachable/stock/t18stock
	name = "\improper AR-18枪托"
	desc = "AR-18专用枪托。"
	icon_state = "t18"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/t12stock
	name = "\improper AR-12 枪托"
	desc = "AR-12专用枪托。"
	icon_state = "t12"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/t42stock
	name = "\improper MG-42枪托"
	desc = "MG-42专用枪托。"
	icon_state = "t42"
	pixel_shift_x = 32
	pixel_shift_y = 13

/obj/item/attachable/stock/t64stock
	name = "\improper BR-64 枪托"
	desc = "BR-64专用枪托。"
	icon_state = "t64"

//You can remove the stock on the Magnum. So it has stats and is removeable.
/obj/item/attachable/stock/t76
	name = "T-76 马格南枪托"
	desc = "R-76 马格南枪托。除了让武器更难挥舞外，几乎能改善你所有的操控性。如果你珍惜自己的肩膀，建议始终将其安装在 R-76 上。"
	icon_state = "t76"
	attach_features_flags = ATTACH_REMOVABLE
	melee_mod = 5
	scatter_mod = -1
	size_mod = 2
	aim_speed_mod = 0.05
	recoil_mod = -2
	pixel_shift_x = 30
	pixel_shift_y = 14

/obj/item/attachable/stock/at45stock
	name = "\improper CC/AT45 枪托"
	desc = "CC/AT45 的枪托。"
	icon_state = "at45"
	pixel_shift_x = 0
	pixel_shift_y = 0
