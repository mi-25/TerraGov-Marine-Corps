/obj/structure/prop/som_fighter
	name = "\improper 先驱者"
	desc = "一款先进的'先驱者'级战斗机。这是火星之子部队在太空与大气层中的主力战机，配备了众多高科技系统和武器。"
	icon = 'icons/obj/structures/prop/mainship_96.dmi'
	icon_state = "SOM_fighter"
	pixel_x = -33
	pixel_y = -10
	bound_height = 64
	bound_width = 96
	density = TRUE
	allow_pass_flags = PASSABLE
	obj_flags = parent_type::obj_flags|BLOCK_Z_OUT_DOWN|BLOCK_Z_IN_UP

/obj/structure/prop/som_fighter/empty
	icon_state = "SOM_fighter_empty"
	desc = "一架先进的'先驱者'级战斗机。这是火星之子部队在太空和大气层中的主力战机，目前看来似乎未配备武器。"

/obj/structure/prop/tgmc_fighter
	name = "蝰蛇"
	desc = "一架毒蛇MK.III战斗机。无论是在大气层内还是太空中都表现出色，毒蛇几十年来一直是地球政府海军中可靠且多用途的主力机型。"
	icon = 'icons/obj/structures/prop/mainship_96.dmi'
	icon_state = "fighter_loaded"
	pixel_x = -33
	pixel_y = -10
	bound_height = 64
	bound_width = 96
	density = TRUE
	allow_pass_flags = PASSABLE
	obj_flags = parent_type::obj_flags|BLOCK_Z_OUT_DOWN|BLOCK_Z_IN_UP

/obj/structure/prop/tgmc_fighter/empty
	icon_state = "fighter"
	desc = "一架毒蛇MK.III型战斗机。无论是在大气层内还是太空中都表现出色，毒蛇战机几十年来一直是地球政府海军可靠且多用途的主力机型。这架目前似乎未配备武器。"

/obj/structure/prop/train
	name = "机车"
	desc = "重型磁悬浮机车。专为从A点到B点运输大量货物而设计。"
	icon = 'icons/obj/structures/train.dmi'
	icon_state = "maglev"
	density = TRUE
	allow_pass_flags = PASS_AIR
	bound_width = 128

/obj/structure/prop/train/carriage
	name = "导轨托架"
	desc = "一辆重型磁悬浮运输车。不知道里面装着什么？"
	icon_state = "carriage"

/obj/structure/prop/train/carriage_lit
	name = "导轨托架"
	desc = "一辆重型磁悬浮运输车。不知道里面装着什么？"
	icon_state = "carriage_lit"

/obj/structure/prop/train/cargo_nt
	name = "导轨车"
	desc = "重型磁悬浮轨道车。这辆车上装载着一个大型货柜。"
	icon_state = "nt"

/obj/structure/prop/train/cargo_sat
	name = "导轨车"
	desc = "重型磁悬浮轨道车。这辆车上装载着一个大型货柜。"
	icon_state = "sat"

/obj/structure/prop/train/cargo_hyperdyne
	name = "导轨车"
	desc = "重型磁悬浮轨道车。这辆车上装有一个大型货柜。"
	icon_state = "hyperdyne"

/obj/structure/prop/train/construction
	name = "导轨车"
	desc = "重型磁悬浮轨道车。这辆装载了多种建筑材料。"
	icon_state = "construction"
	allow_pass_flags = PASSABLE

/obj/structure/prop/train/crates
	name = "导轨车"
	desc = "重型磁悬浮轨道车。这辆车上装载着各种板条箱。"
	icon_state = "crates"
	allow_pass_flags = PASSABLE

/obj/structure/prop/train/weapons
	name = "导轨车"
	desc = "重型磁悬浮轨道车。这辆装载着一批武器。"
	icon_state = "weapons"
	allow_pass_flags = PASSABLE

/obj/structure/prop/train/mech
	name = "导轨车"
	desc = "重型磁悬浮轨道车。这辆车上装有多种机甲装备。"
	icon_state = "mech"
	allow_pass_flags = PASSABLE

/obj/structure/prop/train/empty
	name = "导轨车"
	desc = "重型磁悬浮轨道车。这辆目前是空的。"
	icon_state = "empty"
	allow_pass_flags = PASS_LOW_STRUCTURE|PASSABLE|PASS_WALKOVER

/obj/structure/prop/train/empty/Initialize(mapload)
	. = ..()
	var/static/list/connections = list(
		COMSIG_OBJ_TRY_ALLOW_THROUGH = PROC_REF(can_climb_over),
	)
	AddElement(/datum/element/connect_loc, connections)

/obj/structure/prop/nt_computer
	name = "服务器机架"
	desc = "一个服务器机架。谁知道上面有什么？"
	icon = 'icons/obj/structures/campaign/tall_structures.dmi'
	icon_state = "serverrack_on"
	layer = ABOVE_MOB_LAYER
	density = TRUE
	light_range = 1
	light_power = 0.5
	light_color = LIGHT_COLOR_FLARE
	var/use_emissive = TRUE

/obj/structure/prop/nt_computer/Initialize(mapload)
	. = ..()
	update_icon()

/obj/structure/prop/nt_computer/update_overlays()
	. = ..()
	if(use_emissive)
		. += emissive_appearance(icon, "[icon_state]_emissive", src, alpha = src.alpha)

/obj/structure/prop/nt_computer/rack
	name = "控制架"
	desc = "一个系统控制机架。谁知道上面有什么？"
	icon_state = "recorder_on"
	use_emissive = FALSE

/obj/structure/prop/nt_computer/recorder
	name = "备份记录器"
	desc = "一个备份数据记录器。谁知道里面有什么？"
	icon_state = "rack_on"
	light_range = 0
	light_power = 0

/obj/structure/gauss_cannon
	name = "\improper 高斯炮"
	desc = "一门强大的高斯炮。专为击穿敌对航天器而设计。"
	icon = 'icons/obj/machines/artillery.dmi'
	icon_state = "gauss_cannon"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	bound_width = 128
	bound_height = 64
	bound_y = 64
	resistance_flags = RESIST_ALL
	allow_pass_flags = NONE
	light_range = 4
	light_power = 0.5
	light_color = LIGHT_COLOR_BLUEGREEN

/obj/structure/gauss_cannon/Initialize(mapload)
	. = ..()
	update_icon()

/obj/structure/gauss_cannon/update_overlays()
	. = ..()
	. += emissive_appearance(icon, "[icon_state]_emissive", src, alpha = src.alpha)
