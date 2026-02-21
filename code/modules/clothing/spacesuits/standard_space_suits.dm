
/obj/item/clothing/head/helmet/space/tgmc
	name = "\improper TGMC 压缩头盔"
	desc = "一款高科技、由地球政府殖民地海军陆战队设计的深红色太空服头盔。用于太空维护。"
	icon_state = "void_helm"
	anti_hug = 3

/obj/item/clothing/suit/space/tgmc
	name = "\improper TGMC 压缩服"
	icon_state = "void"
	desc = "一款高科技、由地球政府殖民地海军陆战队设计的深红色太空服。用于太空维护。"
	slowdown = 1


/obj/item/clothing/head/helmet/space/capspace
	name = "太空头盔"
	icon_state = "capspace"
	desc = "专为在危险低压环境中工作而设计的特殊头盔。只为最时尚的军事领袖准备。"
	permeability_coefficient = 0.01
	soft_armor = list(MELEE = 40, BULLET = 50, LASER = 50, ENERGY = 25, BOMB = 50, BIO = 100, FIRE = 25, ACID = 25)

/obj/item/clothing/suit/space/captain
	name = "舰长护甲"
	desc = "一件笨重、耐用的纳米传讯专属装甲。现在由你负责！"
	icon_state = "caparmor"
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS
	allowed = list(/obj/item/tank/emergency_oxygen, /obj/item/flashlight,/obj/item/weapon/gun, /obj/item/ammo_magazine, /obj/item/weapon/baton,/obj/item/restraints/handcuffs)
	slowdown = 1.5
	soft_armor = list(MELEE = 40, BULLET = 50, LASER = 50, ENERGY = 25, BOMB = 50, BIO = 100, FIRE = 25, ACID = 25)
	inventory_flags = NOPRESSUREDMAGE
	inv_hide_flags = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	cold_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7

//space santa
/obj/item/clothing/head/helmet/space/santahat
	name = "圣诞帽"
	desc = "呵呵呵。圣诞快乐！"
	icon_state = "santahat"
	inventory_flags = NOPRESSUREDMAGE|BLOCKSHARPOBJ
	inv_hide_flags = HIDEEYES
	armor_protection_flags = HEAD

/obj/item/clothing/suit/space/santa
	name = "圣诞老人服装"
	desc = "节日快乐！"
	icon_state = "santa"
	slowdown = 0
	allowed = list(/obj/item) //for stuffing exta special presents

/obj/item/clothing/head/helmet/space/chronos
	name = "\improper 克洛诺斯 Mk 0 型 蓝移头盔"
	desc = "一顶光滑的银色头盔。它仿佛来自未来……"
	icon_state = "rig-chronos"
	soft_armor = list(MELEE = 100, BULLET = 100, LASER = 100, ENERGY = 100, BOMB = 100, BIO = 100, FIRE = 100, ACID = 100)
	resistance_flags = UNACIDABLE
	siemens_coefficient = 0

/obj/item/clothing/suit/space/chronos
	name = "\improper 克洛诺斯 Mk 0 型 蓝空护甲"
	desc = "一套光滑的银色套装。它仿佛源自未来……"
	icon_state = "rig-chronos"
	soft_armor = list(MELEE = 100, BULLET = 100, LASER = 100, ENERGY = 100, BOMB = 100, BIO = 100, FIRE = 100, ACID = 100)	//DONT FUCK WITH THIS SENATOR
	resistance_flags = UNACIDABLE
	siemens_coefficient = 0
	slowdown = 0
	allowed = list(/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/baton,/obj/item/restraints/handcuffs,/obj/item/tank/emergency_oxygen)
