/**
 *
 *  Chestplates
 *
 */
/obj/item/armor_module/armor/chest
	icon_state = "chest"
	slot = ATTACHMENT_SLOT_CHESTPLATE
	greyscale_config = /datum/greyscale_config/armor_mk1/infantry

/obj/item/armor_module/armor/chest/marine
	name = "\improper 耶格式中型步兵胸甲"
	gender = PLURAL
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供中等防护，同时带来一定程度的行动负担，但安装和拆卸都相当简便。点击装甲框架即可安装。此装甲似乎标记为步兵装甲部件。"
	soft_armor = list(MELEE = 25, BULLET = 45, LASER = 45, ENERGY = 35, BOMB = 30, BIO = 30, FIRE = 30, ACID = 35)
	slowdown = 0.3


/obj/item/armor_module/armor/chest/marine/skirmisher
	name = "\improper 耶格尔式轻型突击胸甲"
	desc = "专为耶格尔战斗外骨骼设计。安装后可提供少量防护，但会增加负重，且易于在装甲上装卸。点击装甲框架进行安装。此装甲标记为游骑兵装甲部件。"
	soft_armor = list(MELEE = 15, BULLET = 35, LASER = 35, ENERGY = 25, BOMB = 25, BIO = 25, FIRE = 25, ACID = 25)
	slowdown = 0.1
	greyscale_config = /datum/greyscale_config/armor_mk1/skirmisher

/obj/item/armor_module/armor/chest/marine/skirmisher/scout
	name = "\improper 耶格尔式轻型侦察胸甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供轻微防护，同时增加少量负重，且易于在装甲上装卸。点击装甲框架进行安装。此装甲似乎标记为侦察型部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/scout

/obj/item/armor_module/armor/chest/marine/skirmisher/trooper
	name = "\improper 耶格尔式突击兵胸甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供少量防护，同时带来轻微负重，且易于在装甲上装卸。点击装甲框架进行安装。此装甲似乎标记为'突击队员'装甲部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/trooper

/obj/item/armor_module/armor/chest/marine/assault
	name = "\improper 耶格尔式重型突击胸甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供高防护性，同时也会带来较高的负重。该装甲易于安装和拆卸。点击装甲框架进行安装。此装甲似乎标记为突击型装甲部件。"
	soft_armor = list(MELEE = 30, BULLET = 50, LASER = 50, ENERGY = 40, BOMB = 35, BIO = 35, FIRE = 35, ACID = 40)
	slowdown = 0.5
	greyscale_config = /datum/greyscale_config/armor_mk1

/obj/item/armor_module/armor/chest/marine/eva
	name = "\improper 耶格式中型EVA胸甲"
	desc = "专为耶格尔战斗外骨骼设计。安装后可提供中等防护，同时带来一定程度的行动不便，但安装和拆卸都相当简便。点击装甲框架即可安装。此装甲似乎标记为舱外活动装甲部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/eva

/obj/item/armor_module/armor/chest/marine/assault/eod
	name = "\improper 耶格尔式重型EOD胸甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供高防护性，但也会增加负重，且装卸过程相对简便。点击装甲框架进行安装。此装甲似乎标记为EOD（爆炸物处理）防护组件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/eod

/obj/item/armor_module/armor/chest/marine/helljumper
	name = "\improper 耶格尔型地狱伞兵胸甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供中等水平的防护，同时带来一定的行动负担，但安装和拆卸都相当简便。点击装甲框架即可安装。此装甲似乎标记为'地狱伞兵'装甲部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/helljumper

/obj/item/armor_module/armor/chest/marine/ranger
	name = "\improper 游侠型耶格尔胸甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供中等水平的防护，同时带来一定的行动负担，但安装和拆卸都相当简便。点击装甲框架即可安装。此装甲似乎标记为游骑兵部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/ranger

/obj/item/armor_module/armor/chest/marine/mjolnir
	name = "\improper 耶格型雷神胸甲"
	desc = "专为耶格尔战斗外骨骼设计。安装后可提供中等防护，同时带来一定负重，且易于在装甲上装卸。点击装甲框架进行安装。此装甲似乎标记为雷神装甲部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/mjolnir

// Hardsuit Chest Plates
/obj/item/armor_module/armor/chest/marine/hardsuit
	icon_state_variants = list(
		"normal",
		"webbing",
	)
	current_variant = "normal"
	greyscale_colors = ARMOR_PALETTE_BLACK
	colorable_colors = LEGACY_ARMOR_PALETTES_LIST
	colorable_allowed = ICON_STATE_VARIANTS_ALLOWED|PRESET_COLORS_ALLOWED
	starting_attachments = list(/obj/item/armor_module/armor/secondary_color/chest/webbing)

/obj/item/armor_module/armor/chest/marine/hardsuit/syndicate_markfive
	name = "\improper 弗莱克泰克斯 Mark V 破门胸甲"
	desc = "专为 FleckTex WY-01 外骨骼设计。安装后可提供高防护性，但也会增加负重，且安装和拆卸都较为简便。点击装甲框架即可安装。所有臂甲板均提供相同的护甲值和减速效果，这意味着只有更换胸甲板才会带来显著的护甲差异。此装甲似乎被标记为 Mark V 装甲部件。"
	soft_armor = list(MELEE = 30, BULLET = 50, LASER = 50, ENERGY = 40, BOMB = 35, BIO = 35, FIRE = 35, ACID = 40)
	slowdown = 0.5
	greyscale_config = /datum/greyscale_config/hardsuit_variant/syndicate_markfive

/obj/item/armor_module/armor/chest/marine/hardsuit/syndicate_markthree
	name = "\improper 弗莱克泰克斯 马克III型 掠夺者 胸甲"
	desc = "专为 FleckTex WY-01 外骨骼设计。安装后可提供中等防护，同时带来一定负重，且安装和拆卸都较为简便。点击装甲框架即可安装。所有臂甲板均提供相同的护甲值和减速效果，这意味着只有更换胸甲板才会带来显著的护甲差异。此装甲似乎被标记为 Mark III 型装甲部件。"
	greyscale_config = /datum/greyscale_config/hardsuit_variant/syndicate_markthree

/obj/item/armor_module/armor/chest/marine/hardsuit/syndicate_markone
	name = "\improper 弗莱克特克斯 Mark I 掠夺者胸甲"
	desc = "专为 FleckTex WY-01 外骨骼设计。安装后能提供少量防护，同时增加少许负担，且易于在护甲上装卸。点击护甲框架进行安装。所有臂甲板均提供相同的护甲值和减速效果，这意味着只有更换胸甲板才会带来显著的护甲差异。此护甲似乎标记为 Mark I 型护甲部件。"
	soft_armor = list(MELEE = 15, BULLET = 35, LASER = 35, ENERGY = 25, BOMB = 25, BIO = 25, FIRE = 25, ACID = 25)
	slowdown = 0.1
	greyscale_config = /datum/greyscale_config/hardsuit_variant

//VSD Hardsuits
/obj/item/armor_module/armor/chest/marine/vsd_hardsuit
	name = "\improper 坠毁者超重型MT/41'火卫一'胸甲"
	desc = "专为CrashCore MT/P外骨骼设计。它能提供相当不错的防护，但附着时会增加负重，且易于在护甲上装卸。点击护甲框架进行附着。这意味着只有更换胸甲才会显著改变护甲值。此护甲似乎标记为'火卫一'护甲部件。"
	soft_armor = list(MELEE = 50, BULLET = 60, LASER = 60, ENERGY = 50, BOMB = 45, BIO = 45, FIRE = 45, ACID = 50)
	slowdown = SLOWDOWN_ARMOR_VERY_HEAVY
	greyscale_config = /datum/greyscale_config/vsd_hardsuit
	starting_attachments = list(/obj/item/armor_module/armor/secondary_color/chest/visor_color)

/obj/item/armor_module/armor/chest/marine/vsd_hardsuit/clementia
	name = "\improper 撞击者超重型MT/41'克莱门蒂亚'胸甲"
	desc = "专为'坠毁核心'MT/P外骨骼设计。它提供相当出色的防护能力，但安装后会带来行动负担，且拆装过程较为简便。点击装甲框架即可安装。这意味着仅更换胸甲就能显著改变防护性能。此装甲部件标记为'克莱门蒂亚'型号。"
	greyscale_config = /datum/greyscale_config/vsd_hardsuit/alt
	starting_attachments = list(/obj/item/armor_module/armor/secondary_color/chest)

/obj/item/armor_module/armor/chest/marine/vsd_hardsuit/hephaestus
	name = "\improper 撞击者超重型MT/41'赫菲斯托斯'胸甲"
	desc = "专为'坠毁核心'MT/P型外骨骼设计。它提供相当出色的防护能力，但安装后会带来一定的行动负担，且从装甲上装卸都相当简便。点击装甲框架即可安装。这意味着只有更换胸甲才会显著改变装甲性能。此装甲部件似乎标有'赫菲斯托斯'标识。"
	greyscale_config = /datum/greyscale_config/vsd_hardsuit/alt_two
	starting_attachments = list(/obj/item/armor_module/armor/secondary_color/chest)
