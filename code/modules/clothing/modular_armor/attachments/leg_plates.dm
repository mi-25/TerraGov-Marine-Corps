/**
 *  Leg Pieces
*/

/obj/item/armor_module/armor/legs
	icon_state = "leg"
	greyscale_config = /datum/greyscale_config/armor_mk1/infantry
	slot = ATTACHMENT_SLOT_KNEE


/obj/item/armor_module/armor/legs/marine
	name = "\improper 耶格尔式步兵腿甲"
	gender = PLURAL
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有腿部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲标记为步兵装甲部件。"
	soft_armor = list(MELEE = 10, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 10, BIO = 10, FIRE = 10, ACID = 10)
	slowdown = 0.1

/obj/item/armor_module/armor/legs/marine/skirmisher
	name = "\improper 耶格尔式突击兵腿部护板"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有腿部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲似乎标记为'游骑兵'装甲部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/skirmisher

/obj/item/armor_module/armor/legs/marine/scout
	name = "\improper 耶格尔式侦察兵腿部护板"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有腿部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会带来显著的护甲差异。此装甲部件标记为侦察型。"
	greyscale_config = /datum/greyscale_config/armor_mk1/scout

/obj/item/armor_module/armor/legs/marine/assault
	name = "\improper 耶格尔式突击腿甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有腿部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲部件标记为突击型护甲。"
	greyscale_config = /datum/greyscale_config/armor_mk1

/obj/item/armor_module/armor/legs/marine/eva
	name = "\improper 耶格尔式EVA腿部护板"
	desc = "专为耶格尔战斗外骨骼设计。安装后能提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有腿部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲标记为舱外活动装甲部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/eva

/obj/item/armor_module/armor/legs/marine/eod
	name = "\improper 耶格尔式排爆腿甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供防护，但也会增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有腿部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲似乎被标记为EOD（爆炸物处理）装甲部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/eod

/obj/item/armor_module/armor/legs/marine/helljumper
	name = "\improper 耶格尔型地狱伞兵腿甲"
	desc = "专为耶格尔战斗外骨骼设计。安装后能提供防护，同时也会增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有腿部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会带来显著的护甲差异。此装甲似乎标记为地狱伞兵装甲部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/helljumper

/obj/item/armor_module/armor/legs/marine/ranger
	name = "\improper 游侠型腿部护甲"
	desc = "专为耶格尔战斗外骨骼设计。安装后可提供防护，但会增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有腿部护板具有相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲标记为游骑兵装甲部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/ranger

/obj/item/armor_module/armor/legs/marine/trooper
	name = "\improper 耶格尔式突击兵腿甲"
	desc = "专为'游骑兵'战斗外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有腿部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲部件标记为'突击队员'护甲组件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/trooper

/obj/item/armor_module/armor/legs/marine/mjolnir
	name = "\improper 耶格尔型雷神腿部护板"
	desc = "专为耶格尔战斗外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有腿部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲值。此护甲似乎标记为雷神之锤装甲部件。"
	greyscale_config = /datum/greyscale_config/armor_mk1/mjolnir

// Hardsuit Leg Plates

// Base Hardsuit Legs
/obj/item/armor_module/armor/legs/marine/hardsuit_legs
	name = "\improper FleckTex 基础腿部护板"
	desc = "专为 FleckTex WY-01 外骨骼设计。安装后可提供防护，同时增加负重，且安装和拆卸都相当简便。点击装甲框架即可安装。所有臂甲板均提供相同的护甲值和减速效果，这意味着只有更换胸甲板才会带来显著的护甲差异。此装甲似乎被标记为基础装甲部件。"
	starting_attachments = list(/obj/item/armor_module/armor/secondary_color/leg)
	greyscale_config = /datum/greyscale_config/hardsuit_variant

/obj/item/armor_module/armor/legs/marine/hardsuit_legs/syndicate_markfive
	name = "\improper 弗莱克泰克斯 Mark V 破门者腿部护板"
	desc = "专为 FleckTex WY-01 外骨骼设计。当附着在护甲上时，它能提供防护并增加负重，且易于安装和拆卸。点击护甲框架进行安装。所有臂甲板具有相同的护甲值和减速效果，这意味着只有更换胸甲板才会带来显著的护甲差异。此护甲似乎被标记为 Mark V 护甲部件。"
	greyscale_config = /datum/greyscale_config/hardsuit_variant/syndicate_markfive

/obj/item/armor_module/armor/legs/marine/hardsuit_legs/syndicate_markthree
	name = "\improper 弗莱克泰克斯 Mark III 掠夺者腿部护板"
	desc = "专为 FleckTex WY-01 外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有臂甲板均提供相同的护甲值和减速效果，这意味着只有更换胸甲板才会带来显著的护甲差异。此装甲似乎标记为 Mark III 型装甲部件。"
	greyscale_config = /datum/greyscale_config/hardsuit_variant/syndicate_markthree

/obj/item/armor_module/armor/legs/marine/hardsuit_legs/syndicate_markone
	name = "\improper FleckTex Mark I 掠夺者腿部护板"
	desc = "专为 FleckTex WY-01 外骨骼设计。安装后可提供防护，同时增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有臂甲板均提供相同的护甲值和减速效果，这意味着只有更换胸甲板才会带来显著的护甲差异。此装甲部件标记为 Mark I 型。"
	greyscale_config = /datum/greyscale_config/hardsuit_variant

//VSD Hardsuits
/obj/item/armor_module/armor/legs/marine/vsd_hardsuit
	name = "\improper 撞击者超重型MT/41'火卫一'腿部护板"
	desc = "专为CrashCore MT/P外骨骼设计。安装后可提供防护，但会增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有腿部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲似乎标记为'火卫一'装甲部件。"
	greyscale_config = /datum/greyscale_config/vsd_hardsuit

/obj/item/armor_module/armor/legs/marine/vsd_hardsuit/clementia
	name = "\improper 撞击者超重型MT/41'克莱门蒂亚'腿部护板"
	desc = "专为CrashCore MT/P外骨骼设计。安装后可提供防护，但会增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有腿部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲似乎标记为'克莱门蒂亚'装甲部件。"
	greyscale_config = /datum/greyscale_config/vsd_hardsuit/alt

/obj/item/armor_module/armor/legs/marine/vsd_hardsuit/hephaestus
	name = "\improper 撞击者超重型MT/41'赫菲斯托斯'腿部护板"
	desc = "专为'坠毁核心'MT/P型外骨骼设计。安装后可提供防护并增加负重，且易于在装甲上装卸。点击装甲框架进行安装。所有腿部护板均具有相同的护甲值和减速效果，这意味着只有更换胸甲才会显著改变护甲性能。此装甲似乎标记为'赫菲斯托斯'装甲部件。"
	greyscale_config = /datum/greyscale_config/vsd_hardsuit/alt_two

