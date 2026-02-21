/**
 *  Arms pieces
*/

/obj/item/armor_module/armor/arms
	icon_state = "arm"
	slot = ATTACHMENT_SLOT_SHOULDER
	greyscale_config = /datum/greyscale_config/armor_mk1/infantry
	colorable_colors = LEGACY_ARMOR_PALETTES_LIST

/obj/item/armor_module/armor/arms/marine
	name = "\improper 耶格尔式步兵臂甲"
	gender = PLURAL
	desc = "专为耶格尔战斗外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有臂部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲部件标记为步兵装甲组件。"
	soft_armor = list(MELEE = 10, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 10, BIO = 10, FIRE = 10, ACID = 10)
	slowdown = 0.1

/obj/item/armor_module/armor/arms/marine/skirmisher
	name = "\improper 游骑兵型突击兵臂甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供防护，同时增加负重，且装卸相当便捷。点击装甲框架即可安装。所有臂甲板均提供相同的护甲值与减速效果，这意味着只有更换胸甲板才会带来显著的护甲差异。此装甲部件标记为'游骑兵'型。"
	greyscale_config = /datum/greyscale_config/armor_mk1/skirmisher

/obj/item/armor_module/armor/arms/marine/scout
	name = "\improper 耶格式样侦察兵臂甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供防护，但也会增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有臂部护板均提供相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲部件标记为侦察型。"
	greyscale_config = /datum/greyscale_config/armor_mk1/scout

/obj/item/armor_module/armor/arms/marine/assault
	name = "\improper 耶格尔式突击臂甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有臂部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会带来显著的护甲差异。此装甲部件标记为突击型。"
	greyscale_config = /datum/greyscale_config/armor_mk1

/obj/item/armor_module/armor/arms/marine/eva
	name = "\improper 耶格尔式舱外活动臂甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有臂甲板均提供相同的护甲值和减速效果，这意味着只有更换胸甲板才会显著改变护甲性能。此装甲似乎标记为舱外活动装甲部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/eva

/obj/item/armor_module/armor/arms/marine/eod
	name = "\improper 耶格尔式排爆臂甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供防护，但也会增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有臂部护板均提供相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲部件标记为EOD（爆炸物处理）专用。"
	greyscale_config = /datum/greyscale_config/armor_mk1/eod

/obj/item/armor_module/armor/arms/marine/helljumper
	name = "\improper 耶格尔式地狱伞兵臂甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有臂部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲似乎标记为'地狱伞兵'装甲部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/helljumper

/obj/item/armor_module/armor/arms/marine/ranger
	name = "\improper 游侠型护臂板"
	desc = "专为'游侠'战斗外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有臂甲护板均提供相同的护甲值与减速效果，这意味着只有更换胸甲才能显著改变护甲性能。此护甲部件标记为游侠护甲组件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/ranger

/obj/item/armor_module/armor/arms/marine/trooper
	name = "\improper 耶格尔式突击兵臂甲"
	desc = "专为耶格尔战斗外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有臂甲板均具有相同的护甲值和减速效果，这意味着只有更换胸甲板才会显著改变护甲性能。此装甲部件标记为'突击队员'型。"
	greyscale_config = /datum/greyscale_config/armor_mk1/trooper

/obj/item/armor_module/armor/arms/marine/mjolnir
	name = "\improper 耶格型雷神臂甲"
	desc = "专为耶格尔战斗外骨骼设计。安装后能提供防护，同时也会增加负重，且安装和拆卸都相当简便。点击装甲框架即可安装。所有臂甲板均提供相同的护甲值和减速效果，这意味着只有更换胸甲才会带来显著的护甲差异。此装甲似乎被标记为雷神之锤装甲部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/mjolnir

// Hardsuit Arm Plates
/obj/item/armor_module/armor/arms/marine/hardsuit_arms
	name = "\improper FleckTex 基础臂甲"
	desc = "专为 FleckTex WY-01 外骨骼设计。安装后可提供防护，同时增加负重，且便于在护甲上装卸。点击护甲框架进行安装。所有臂甲板均提供相同的护甲值和减速效果，这意味着只有更换胸甲板才会带来显著的护甲差异。此护甲显示为'基础'护甲部件。"
	starting_attachments = list(/obj/item/armor_module/armor/secondary_color/arm)
	greyscale_config = /datum/greyscale_config/hardsuit_variant

/obj/item/armor_module/armor/arms/marine/hardsuit_arms/syndicate_markfive
	name = "\improper 弗莱克泰克斯 Mark V 破门者臂甲"
	desc = "专为 FleckTex WY-01 外骨骼设计。当附着在装甲上时，它能提供防护并增加负重，且装卸相当简便。点击装甲框架即可安装。所有臂甲板具有相同的护甲值和减速效果，这意味着只有更换胸甲板才会带来显著的护甲差异。此装甲似乎被标记为 Mark V 装甲部件。"
	greyscale_config = /datum/greyscale_config/hardsuit_variant/syndicate_markfive

/obj/item/armor_module/armor/arms/marine/hardsuit_arms/syndicate_markthree
	name = "\improper 弗莱克泰克斯 Mark III 掠夺者臂甲"
	desc = "专为 FleckTex WY-01 外骨骼设计。安装后可提供防护，同时增加负重，且易于在护甲上装卸。点击护甲框架进行安装。所有臂甲板均提供相同的护甲值和减速效果，这意味着只有更换胸甲板才会带来显著的护甲差异。此护甲部件标记为 Mark III 型。"
	greyscale_config = /datum/greyscale_config/hardsuit_variant/syndicate_markthree

/obj/item/armor_module/armor/arms/marine/hardsuit_arms/syndicate_markone
	name = "\improper 弗莱克泰克斯 Mark I 掠夺者臂甲"
	desc = "专为 FleckTex WY-01 外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有臂甲板均提供相同的护甲值和减速效果，这意味着只有更换胸甲板才会带来显著的护甲差异。此装甲部件标记为 Mark I 型。"
	greyscale_config = /datum/greyscale_config/hardsuit_variant

//VSD Hardsuits
/obj/item/armor_module/armor/arms/marine/vsd_hardsuit
	name = "\improper 撞击者超重型MT/41'火卫一'型装甲板"
	desc = "专为CrashCore MT/P外骨骼设计。安装后可提供防护，但会增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有臂甲板具有相同的护甲值和减速效果，这意味着只有更换胸甲板才会显著改变护甲性能。此装甲似乎标记为'火卫一'装甲部件。"
	greyscale_config = /datum/greyscale_config/vsd_hardsuit

/obj/item/armor_module/armor/arms/marine/vsd_hardsuit/clementia
	name = "\improper 撞击者超重型MT/41'克莱门蒂亚'装甲板"
	desc = "专为CrashCore MT/P外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有臂甲板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲似乎标记为'克莱门蒂亚'装甲部件。"
	greyscale_config = /datum/greyscale_config/vsd_hardsuit/alt

/obj/item/armor_module/armor/arms/marine/vsd_hardsuit/hephaestus
	name = "\improper 撞击者超重型MT/41'赫菲斯托斯'臂甲"
	desc = "专为CrashCore MT/P外骨骼设计。安装后可提供防护并增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有臂甲板均具有相同的护甲值和减速效果，这意味着只有更换胸甲板才会显著改变护甲性能。此装甲部件似乎标有'赫菲斯托斯'标识。"
	greyscale_config = /datum/greyscale_config/vsd_hardsuit/alt_two



