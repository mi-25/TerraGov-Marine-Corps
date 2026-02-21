//Jaeger Mk.II

//Medium
/obj/item/clothing/suit/modular/jaeger
	name = "\improper 耶格尔中型步兵外骨骼"
	desc = "一套步兵型'游骑兵'战斗外骨骼，设计用于配合模块化枪械配件，以适应多种作战环境。这款外骨骼似乎配备了中等程度的装甲板。Alt+点击以移除已安装的配件。使用它来切换内置手电筒。"
	soft_armor = MARINE_ARMOR_MEDIUM
	icon_state = "chest"
	worn_icon_state = "chest"
	slowdown = SLOWDOWN_ARMOR_MEDIUM

	attachments_allowed = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/module/valkyrie_autodoc,
		/obj/item/armor_module/module/fire_proof,
		/obj/item/armor_module/module/tyr_extra_armor,
		/obj/item/armor_module/module/tyr_extra_armor/mark1,
		/obj/item/armor_module/module/mimir_environment_protection,
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
		/obj/item/armor_module/module/hlin_explosive_armor,
		/obj/item/armor_module/module/ballistic_armor,
		/obj/item/armor_module/module/chemsystem,
		/obj/item/armor_module/module/eshield,
		/obj/item/armor_module/module/mirage,
		/obj/item/armor_module/module/armorlock,

		/obj/item/armor_module/storage/general,
		/obj/item/armor_module/storage/ammo_mag,
		/obj/item/armor_module/storage/engineering,
		/obj/item/armor_module/storage/medical,
		/obj/item/armor_module/storage/general/som,
		/obj/item/armor_module/storage/engineering/som,
		/obj/item/armor_module/storage/medical/som,
		/obj/item/armor_module/storage/injector,
		/obj/item/armor_module/storage/grenade,
		/obj/item/armor_module/storage/integrated,
		/obj/item/armor_module/armor/badge,
	)

	item_map_variant_flags = ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_DESERT_VARIANT

	greyscale_config = /datum/greyscale_config/armor_mk2/infantry
	colorable_allowed = PRESET_COLORS_ALLOWED
	colorable_colors = LEGACY_ARMOR_PALETTES_LIST
	greyscale_colors = ARMOR_PALETTE_BLACK


	allowed_uniform_type = /obj/item/clothing/under

/obj/item/clothing/suit/modular/jaeger/eva
	name = "\improper 耶格尔EVA中型外骨骼"
	desc = "一套EVA型杰格战斗外骨骼，设计用于搭配模块化枪械配件，以便在多种环境中执行任务。这套外骨骼似乎配备了中等程度的装甲板。Alt+点击以移除已安装的配件。使用它来切换内置手电筒。"
	greyscale_config = /datum/greyscale_config/armor_mk2/eva

/obj/item/clothing/suit/modular/jaeger/helljumper
	name = "\improper 耶格尔地狱伞兵中型外骨骼"
	desc = "一款地狱跳跃者型耶格战斗外骨骼，设计用于配合模块化枪械配件，以便在多种环境中发挥作用。这款似乎配备了中等程度的装甲板。Alt+点击以移除已安装的配件。使用它来切换内置手电筒。"
	greyscale_config = /datum/greyscale_config/armor_mk2/helljumper

/obj/item/clothing/suit/modular/jaeger/ranger
	name = "\improper 游骑兵中型外骨骼"
	desc = "一款游骑兵型杰格战斗外骨骼，设计用于配合模块化枪械配件，以适应多种环境下的作战需求。这款外骨骼似乎配备了中等程度的装甲板。Alt+左键点击可移除已安装的配件。使用它可开关内置手电筒。"
	greyscale_config = /datum/greyscale_config/armor_mk2/ranger

// Light

/obj/item/clothing/suit/modular/jaeger/light
	name = "\improper 杰格侦察型轻型外骨骼"
	desc = "一款侦察型耶格尔战斗外骨骼，设计用于配合模块化枪械配件，以适应多种环境作战。这款似乎配备了轻型装甲板。Alt+点击可移除已安装的配件。使用它可切换内置手电筒。"
	soft_armor = MARINE_ARMOR_LIGHT
	slowdown = SLOWDOWN_ARMOR_LIGHT
	greyscale_config = /datum/greyscale_config/armor_mk2/scout

/obj/item/clothing/suit/modular/jaeger/light/skirmisher
	name = "\improper 游骑兵轻型外骨骼"
	desc = "一款为适应多种环境而设计，可与模块化枪械配件协同工作的'游骑兵'型耶格尔战斗外骨骼。这款似乎配备了轻量装甲板。Alt+点击以移除已安装的配件。使用它来切换内置手电筒。"
	greyscale_config = /datum/greyscale_config/armor_mk2/skirmisher

/obj/item/clothing/suit/modular/jaeger/light/trooper
	name = "\improper 耶格尔轻装外骨骼"
	desc = "一套为适应多种作战环境而设计，可与模块化枪械配件兼容的'骑兵'型耶格尔战斗外骨骼。这套外骨骼似乎配备了轻量化装甲板。Alt+点击可移除已安装的配件。使用可切换内置手电筒。"
	greyscale_config = /datum/greyscale_config/armor_mk2/trooper

// Heavy
/obj/item/clothing/suit/modular/jaeger/heavy
	name = "\improper 耶格尔·冈格尼尔重型外骨骼"
	desc = "一款冈尼尔型耶格尔战斗外骨骼，设计用于配合模块化枪械配件，以便在多种环境中发挥作用。这款似乎配备了大量的装甲板。Alt+点击以移除已安装的配件。使用它来切换内置手电筒。"
	soft_armor = MARINE_ARMOR_HEAVY
	slowdown = SLOWDOWN_ARMOR_HEAVY
	greyscale_config = /datum/greyscale_config/armor_mk2/gugnir

/obj/item/clothing/suit/modular/jaeger/heavy/assault
	name = "\improper 耶格突击型重型外骨骼"
	desc = "一款为适应多种环境而设计的突击型耶格尔战斗外骨骼，可与模块化枪械配件配合使用。这款似乎配备了大量的装甲板。Alt+点击可移除已安装的配件。使用它来切换内置手电筒。"
	greyscale_config = /datum/greyscale_config/armor_mk2

/obj/item/clothing/suit/modular/jaeger/heavy/eod
	name = "\improper 耶格尔重型拆弹外骨骼"
	desc = "一款EOD型'游骑兵'战斗外骨骼，设计用于适配模块化枪械配件，以便在多种环境中执行任务。这款型号似乎配备了厚重的装甲板。Alt+点击可移除已安装的配件。使用它可开关内置手电筒。"
	greyscale_config = /datum/greyscale_config/armor_mk2/eod

//jaeger hats
/obj/item/clothing/head/modular/marine
	name = "耶格尔式步兵头盔"
	desc = "通常与耶格尔战斗外骨骼搭配使用。可在头盔硬点上安装实用功能模块。带有步兵标识。"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	icon_state = "helmet"
	worn_icon_state = "helmet"
	icon_override = null
	soft_armor = MARINE_ARMOR_HEAVY

	greyscale_colors = ARMOR_PALETTE_DRAB
	colorable_allowed = PRESET_COLORS_ALLOWED
	colorable_colors = LEGACY_ARMOR_PALETTES_LIST
	greyscale_config = /datum/greyscale_config/armor_mk2/infantry


	attachments_allowed = list(
		/obj/item/armor_module/module/tyr_head,
		/obj/item/armor_module/module/fire_proof_helmet,
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
		/obj/item/armor_module/armor/visor/marine,
		/obj/item/armor_module/armor/visor/marine/skirmisher,
		/obj/item/armor_module/armor/visor/marine/scout,
		/obj/item/armor_module/armor/visor/marine/eva,
		/obj/item/armor_module/armor/visor/marine/eva/skull,
		/obj/item/armor_module/armor/visor/marine/gungnir,
		/obj/item/armor_module/armor/visor/marine/eod,
		/obj/item/armor_module/armor/visor/marine/assault,
		/obj/item/armor_module/armor/visor/marine/helljumper,
		/obj/item/armor_module/armor/visor/marine/ranger,
		/obj/item/armor_module/armor/visor/marine/traditional,
		/obj/item/armor_module/armor/visor/marine/mjolnir_open,
		/obj/item/armor_module/armor/visor/marine/trooper,
		/obj/item/armor_module/armor/visor/marine/fourvisor,
		/obj/item/armor_module/armor/visor/marine/foureyevisor,
		/obj/item/armor_module/armor/visor/marine/markonevisor,
		/obj/item/armor_module/armor/visor/marine/phobos,
		/obj/item/armor_module/armor/visor/marine/clementia,
		/obj/item/armor_module/armor/visor/marine/hephaestus,
	)

	starting_attachments = list(/obj/item/armor_module/armor/visor/marine, /obj/item/armor_module/storage/helmet)

	item_map_variant_flags = ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_DESERT_VARIANT

/obj/item/clothing/head/modular/marine/eva
	name = "耶格尔式EVA头盔"
	desc = "通常与耶格尔战斗外骨骼配套使用。可在头盔硬点上安装实用功能模块。带有舱外活动标识。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/eva, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk2/eva

/obj/item/clothing/head/modular/marine/eva/skull
	name = "耶格尔式EVA'骷髅'头盔"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/eva/skull, /obj/item/armor_module/storage/helmet)

/obj/item/clothing/head/modular/marine/skirmisher
	name = "耶格尔式斥候头盔"
	desc = "通常与耶格尔战斗外骨骼配套使用。可在头盔硬点上安装实用功能模块。带有游骑兵标识。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/skirmisher, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk2/skirmisher

/obj/item/clothing/head/modular/marine/scout
	name = "耶格尔式侦察头盔"
	desc = "通常与耶格尔战斗外骨骼搭配使用。可在头盔硬点上安装实用功能模块。带有侦察兵标识。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/scout, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk2/scout

/obj/item/clothing/head/modular/marine/gungnir
	name = "耶格尔式冈格尼尔头盔"
	desc = "通常与耶格尔战斗外骨骼搭配使用。可在头盔硬点上安装实用功能模块。带有冈格尼尔标记。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/gungnir, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk2/gugnir

/obj/item/clothing/head/modular/marine/assault
	name = "耶格尔式突击头盔"
	desc = "通常与耶格尔战斗外骨骼搭配使用。可在头盔硬点上安装实用功能。带有突击部队标识。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/assault, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk2

/obj/item/clothing/head/modular/marine/eod
	name = "耶格尔式排爆头盔"
	desc = "通常与耶格尔战斗外骨骼搭配使用。可在头盔硬点上安装实用功能模块。带有爆炸物处理标识。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/eod, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk2/eod

/obj/item/clothing/head/modular/marine/helljumper
	name = "耶格尔式地狱伞兵头盔"
	desc = "通常与游骑兵战斗外骨骼搭配使用。可在头盔硬点上安装实用功能模块。带有地狱伞兵标识。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/helljumper, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk2/helljumper
	visorless_offset_y = 0

/obj/item/clothing/head/modular/marine/ranger
	name = "游侠式头盔"
	desc = "通常与游骑兵战斗外骨骼搭配使用。可在头盔硬点上安装实用功能。带有游骑兵标识。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/ranger, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk2/ranger

/obj/item/clothing/head/modular/marine/traditional
	name = "耶格尔式传统游骑兵头盔"
	desc = "通常与游骑兵战斗外骨骼搭配使用。可在头盔硬点上安装实用功能模块。带有传统的游骑兵标记。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/traditional, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk2/traditional

/obj/item/clothing/head/modular/marine/trooper
	name = "耶格尔式突击兵头盔"
	desc = "通常与耶格尔战斗外骨骼搭配使用。可在头盔硬点上安装实用功能模块。带有陆战队员标识。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/trooper, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk2/trooper

/obj/item/clothing/head/modular/marine/mjolnir_open
	name = "耶格尔 Mk.I 型开放式雷神头盔"
	desc = "通常与耶格尔战斗外骨骼搭配使用。可在头盔硬点上安装实用功能模块。带有雷神标记，但下颚可展开。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/mjolnir_open, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/armor_mk2/mjolnir_open

// Hardsuit Helmets

/obj/item/clothing/head/modular/marine/hardsuit_helm
	name = "弗莱克特克斯基础硬质头盔"
	desc = "通常与 FleckTex WY-01 模块化外骨骼搭配使用。可在头盔硬点上安装实用功能。带有异形之王标记。"
	greyscale_config = /datum/greyscale_config/hardsuit_variant
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine, /obj/item/armor_module/storage/helmet, /obj/item/armor_module/armor/secondary_color/helm)

/obj/item/clothing/head/modular/marine/hardsuit_helm/markfive
	name = "弗莱克泰克斯 Mark V 破门头盔"
	desc = "通常与 FleckTex WY-01 模块化外骨骼搭配使用。可在头盔硬点上安装实用功能模块。带有破门者标记。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/fourvisor, /obj/item/armor_module/storage/helmet, /obj/item/armor_module/armor/secondary_color/helm)
	greyscale_config = /datum/greyscale_config/hardsuit_variant/syndicate_markfive

/obj/item/clothing/head/modular/marine/hardsuit_helm/markthree
	name = "弗莱克泰克斯 马克III 掠夺者头盔"
	desc = "通常与 FleckTex WY-01 模块化外骨骼搭配使用。可在头盔硬点上安装实用功能。带有 Marauder 标记。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/foureyevisor, /obj/item/armor_module/storage/helmet, /obj/item/armor_module/armor/secondary_color/helm)
	greyscale_config = /datum/greyscale_config/hardsuit_variant/syndicate_markthree

/obj/item/clothing/head/modular/marine/hardsuit_helm/markone
	name = "弗莱克特克斯 Mk I 掠夺者头盔"
	desc = "通常与 FleckTex WY-01 模块化外骨骼搭配使用。可在头盔硬点上安装实用功能模块。带有掠夺者标记。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/markonevisor, /obj/item/armor_module/storage/helmet, /obj/item/armor_module/armor/secondary_color/helm)
	greyscale_config = /datum/greyscale_config/hardsuit_variant

// VSD hardsuit helms!

/obj/item/clothing/head/modular/marine/vsd_hardsuit
	name = "撞击者MT/41'火卫一'头盔"
	desc = "通常与CrashCore MT/P模块化外骨骼配套使用。可在头盔硬点上安装实用功能模块。带有'恐惧之神'标识。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/phobos, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/vsd_hardsuit

/obj/item/clothing/head/modular/marine/vsd_hardsuit/clementia
	name = "撞击者MT/41'克莱门蒂亚'头盔"
	desc = "通常与CrashCore MT/P模块化外骨骼配对使用。可在头盔硬点上安装实用功能模块。带有'克莱门蒂亚'标记。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/clementia, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/vsd_hardsuit/alt

/obj/item/clothing/head/modular/marine/vsd_hardsuit/hephaestus
	name = "撞击者MT/41'赫菲斯托斯'头盔"
	desc = "通常与CrashCore MT/P模块化外骨骼搭配使用。可在头盔硬点上安装实用功能模块。带有'赫菲斯托斯'标记。"
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/hephaestus, /obj/item/armor_module/storage/helmet)
	greyscale_config = /datum/greyscale_config/vsd_hardsuit/alt_two


