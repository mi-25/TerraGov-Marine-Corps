
/obj/item/clothing/under/gimmick
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
	has_sensor = 0
	displays_id = 0

//JASON
/obj/item/clothing/under/gimmick/jason
	name = "脏污的工作服"
	desc = "挖坟掘墓的绝佳穿着。"
	icon_state = "jason_suit"

/obj/item/clothing/mask/gimmick/jason
	name = "曲棍球面具"
	desc = "闻起来像青少年精神。"
	icon_state = "jason_mask"
	anti_hug = 100

/obj/item/clothing/suit/gimmick/jason
	name = "发霉的夹克"
	desc = "致命的时尚宣言。"
	icon_state = "jason_jacket"
	worn_icon_state = "jason_jacket"
	soft_armor = list(MELEE = 13, BULLET = 13, LASER = 13, ENERGY = 13, BOMB = 13, BIO = 13, FIRE = 13, ACID = 13)

//RAMBO
/obj/item/clothing/under/gimmick/rambo
	name = "作战裤"
	desc = "当一个人对抗全世界时，他唯一需要的就是这个。"
	icon_state = "rambo_suit"
	armor_protection_flags = LEGS|GROIN
	cold_protection_flags = LEGS|GROIN
	heat_protection_flags = LEGS|GROIN

/obj/item/clothing/suit/gimmick/rambo
	name = "吊坠"
	desc = "这是一颗珍贵的宝石，也是某种护身符。"
	armor_protection_flags = CHEST
	cold_protection_flags = CHEST
	heat_protection_flags = CHEST
	icon_state = "rambo_pendant"

//MCCLANE
/obj/item/clothing/under/gimmick/mcclane
	name = "节日服装"
	desc = "适合与家人共度圣诞假期的完美装扮。鞋子不包括在内。"
	icon_state = "mcclane_suit"
	armor_protection_flags = CHEST|GROIN|LEGS
	cold_protection_flags = CHEST|GROIN|LEGS
	heat_protection_flags = CHEST|GROIN|LEGS

//DUTCH
/obj/item/clothing/under/gimmick/dutch
	name = "战斗服"
	desc = "又一套丛林艰苦任务用的军装。"
	icon_state = "dutch_suit"
	armor_protection_flags = LEGS|GROIN
	cold_protection_flags = LEGS|GROIN
	heat_protection_flags = LEGS|GROIN

/obj/item/clothing/suit/armor/gimmick/dutch
	name = "防弹夹克"
	desc = "丛林里酷热难耐。有时闷热难当，有时则如人间地狱。"
	icon_state = "dutch_armor"
	armor_protection_flags = CHEST
	cold_protection_flags = CHEST
	heat_protection_flags = CHEST
	soft_armor = list(MELEE = 45, BULLET = 45, LASER = 35, ENERGY = 25, BOMB = 25, BIO = 0, FIRE = 25, ACID = 25)
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/flashlight,
		/obj/item/ammo_magazine/,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/binoculars,
		/obj/item/weapon/combat_knife,
		/obj/item/attachable/bayonet,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
	)

//ROBOCOP
/obj/item/clothing/under/gimmick/robocop
	name = "金属躯体"
	desc = "它或许是金属之躯，却承载着亚历克斯·J·墨菲的心与魂。"
	icon_state = "robocop_suit"
	atom_flags = CONDUCT

/obj/item/clothing/shoes/gimmick/robocop
	name = "抛光金属靴"
	desc = "正好用来践踏底特律的渣滓。"
	icon_state = "robocop_shoes"
	soft_armor = list(MELEE = 87, BULLET = 87, LASER = 87, ENERGY = 87, BOMB = 87, BIO = 50, FIRE = 87, ACID = 87)
	inventory_flags = CONDUCT|NOSLIPPING

/obj/item/clothing/gloves/gimmick/robocop
	name = "金属手"
	desc = "法律那冰冷无情的手。"
	icon_state = "black"
	atom_flags = CONDUCT
	soft_armor = list(MELEE = 87, BULLET = 87, LASER = 87, ENERGY = 87, BOMB = 87, BIO = 50, FIRE = 87, ACID = 87)

/obj/item/clothing/head/helmet/gimmick/robocop
	name = "抛光金属头盔"
	desc = "法律的无情面孔。由钛合金打造，表面覆有凯夫拉涂层。"
	icon_state = "robocop_helmet"
	worn_icon_state = "robocop_helmet"
	soft_armor = list(MELEE = 87, BULLET = 87, LASER = 87, ENERGY = 87, BOMB = 87, BIO = 50, FIRE = 87, ACID = 87)
	inventory_flags = COVEREYES|BLOCKSHARPOBJ
	inv_hide_flags = HIDEEARS|HIDEEYES|HIDETOPHAIR
	anti_hug = 100

/obj/item/clothing/suit/armor/gimmick/robocop
	name = "抛光金属护甲"
	desc = "干净整洁，保养良好，不像底特律那些丑陋的街道。由钛合金制成，并覆有凯夫拉层。"
	icon_state = "robocop_armor"
	worn_icon_state = "robocop_armor"
	slowdown = 1
	atom_flags = CONDUCT
	inventory_flags = BLOCKSHARPOBJ
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS
	cold_protection_flags = CHEST|GROIN|ARMS|LEGS
	heat_protection_flags = CHEST|GROIN|ARMS|LEGS
	allowed = list(/obj/item/weapon/gun/pistol/auto9)
	soft_armor = list(MELEE = 87, BULLET = 87, LASER = 87, ENERGY = 87, BOMB = 87, BIO = 50, FIRE = 87, ACID = 87)

//LUKE
/obj/item/clothing/under/gimmick/skywalker
	name = "黑色连体服"
	desc = "一套简单实用的连体服，专为掌握原力者设计。"
	icon_state = "skywalker_suit"

/obj/item/clothing/shoes/gimmick/skywalker
	name = "黑色军靴"
	desc = "功能完好，这双靴子已在众多行星和星舰上留下践踏的足迹。"
	icon_state = "skywalker_shoes"
	inventory_flags = NOSLIPPING

/obj/item/clothing/gloves/gimmick/skywalker
	name = "黑色手套"
	desc = "用来遮住那只机械手的东西……谁说英雄就不能在意自己的形象呢？"
	icon_state = "skywalker_gloves"



/obj/item/clothing/under/gimmick/rank/captain/suit
	name = "舰长制服"
	desc = "一套绿色制服配黄色领带。彰显权威。"
	icon_state = "green_suit"
	worn_icon_state = "dg_suit"

/obj/item/clothing/under/gimmick/rank/head_of_personnel/suit
	name = "人事主管制服"
	desc = "一套青绿色西装搭配黄色领带。一副权威却又俗气的装束。"
	icon_state = "teal_suit"
	worn_icon_state = "g_suit"
