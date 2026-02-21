//Old jaeger for old grogs
/obj/item/clothing/head/modular/marine/old
	name = "\improper 耶格尔Mk.I型步兵头盔"
	desc = "通常与耶格尔战斗外骨骼搭配使用。可在头盔硬点上安装实用功能模块。带有步兵标识。"
	icon_state = "helmet"
	worn_icon_state = "helmet"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)

	attachments_allowed = list(
		/obj/item/armor_module/module/tyr_head,
		/obj/item/armor_module/module/hod_head,
		/obj/item/armor_module/module/mimir_environment_protection/mimir_helmet,
		/obj/item/armor_module/module/mimir_environment_protection/mimir_helmet/mark1,
		/obj/item/armor_module/module/welding,
		/obj/item/armor_module/module/welding/superior,
		/obj/item/armor_module/module/binoculars,
		/obj/item/armor_module/module/binoculars/artemis_mark_two,
		/obj/item/armor_module/module/artemis,
		/obj/item/armor_module/module/antenna,
		/obj/item/armor_module/module/night_vision,
		/obj/item/armor_module/storage/helmet,
		/obj/item/armor_module/armor/badge,
		/obj/item/armor_module/armor/visor/marine/old,
		/obj/item/armor_module/armor/visor/marine/old/skirmisher,
		/obj/item/armor_module/armor/visor/marine/old/scout,
		/obj/item/armor_module/armor/visor/marine/old/eva,
		/obj/item/armor_module/armor/visor/marine/old/eva/skull,
		/obj/item/armor_module/armor/visor/marine/old/eod,
		/obj/item/armor_module/armor/visor/marine/old/assault,
		/obj/item/armor_module/armor/visor/marine/mjolnir,
		/obj/item/armor_module/module/fire_proof_helmet,
	)

	greyscale_config = /datum/greyscale_config/armor_mk1/infantry
	greyscale_colors = ARMOR_PALETTE_BLACK
	colorable_colors = LEGACY_ARMOR_PALETTES_LIST
	colorable_allowed = PRESET_COLORS_ALLOWED


	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/old, /obj/item/armor_module/storage/helmet)

/obj/item/clothing/head/modular/marine/old/open
	name = "\improper 耶格尔 Mk.I 型头盔"
	desc = "通常与'游骑兵'战斗外骨骼搭配使用。可在头盔硬点上安装实用功能模块。"
	starting_attachments = list(/obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk1/infantry/old
	visorless_offset_y = 0

/obj/item/clothing/head/modular/marine/old/eva
	name = "\improper 耶格尔 Mk.I 型 EVA 头盔"
	desc = "通常与耶格尔战斗外骨骼配套使用。可在头盔硬点上安装实用功能模块。带有舱外活动标识。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/old/eva, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk1/eva

/obj/item/clothing/head/modular/marine/old/eva/skull
	name = "\improper 耶格尔 Mk.I 型 EVA'骷髅'头盔"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/old/eva/skull, /obj/item/armor_module/storage/helmet)

/obj/item/clothing/head/modular/marine/old/skirmisher
	name = "\improper 游骑兵 Mk.I 型 斥候头盔"
	desc = "通常与耶格尔战斗外骨骼搭配使用。可在头盔硬点上安装实用功能。带有游骑兵标识。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/old/skirmisher, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk1/skirmisher

/obj/item/clothing/head/modular/marine/old/scout
	name = "\improper 耶格尔Mk.I型侦察头盔"
	desc = "通常与'游骑兵'战斗外骨骼搭配使用。可在头盔硬点上安装实用功能模块。带有侦察兵标识。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/old/scout, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk1/scout

/obj/item/clothing/head/modular/marine/old/assault
	name = "\improper 耶格尔Mk.I型突击头盔"
	desc = "通常与耶格尔战斗外骨骼搭配使用。可在头盔硬点上安装实用功能模块。带有突击型涂装标识。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/old/assault, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk1

/obj/item/clothing/head/modular/marine/old/eod
	name = "\improper 耶格 Mk.I 型 EOD 头盔"
	desc = "通常与耶格尔战斗外骨骼配套使用。可在头盔硬点上安装实用功能模块。带有爆炸物处理标识。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/old/eod, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk1/eod

/obj/item/clothing/head/modular/marine/old/mjolnir
	name = "\improper 耶格尔 Mk.I 型 雷神头盔"
	desc = "通常与耶格尔战斗外骨骼搭配使用。可在头盔硬点上安装实用功能。带有雷神标记。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/mjolnir, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk1/mjolnir
