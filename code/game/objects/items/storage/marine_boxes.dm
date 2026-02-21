/obj/item/storage/box/crate
	name = "板条箱"
	desc = "这只是一个普通的木质板条箱。"
	icon = 'icons/obj/items/storage/marine_box.dmi'
	icon_state = "case"

/obj/item/storage/box/crate/Initialize(mapload, ...)
	. = ..()
	storage_datum.foldable = /obj/item/stack/sheet/wood

/obj/item/storage/box/crate/update_icon_state()
	. = ..()
	icon_state = length(contents) ? initial(icon_state) : "empty_case"

/obj/item/storage/box/crate/heavy_armor
	name = "\improper B系列防御护甲板条箱"
	desc = "一个装有实验性B18装甲的大型箱子，专为眼光独到的专家准备。"
	icon_state = "armor_case"
	w_class = WEIGHT_CLASS_HUGE

/obj/item/storage/box/crate/heavy_armor/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 3
	storage_datum.max_storage_space = 0

/obj/item/storage/box/crate/heavy_armor/PopulateContents()
	new /obj/item/clothing/gloves/marine/specialist(src)
	new /obj/item/clothing/suit/storage/marine/specialist(src)
	new /obj/item/clothing/head/helmet/marine/specialist(src)

/obj/item/storage/box/crate/grenade_system
	name = "\improper M92 榴弹发射器箱"
	desc = "一个装有阿玛特系统M92重型多管榴弹发射器的大型箱子。将此图标拖入你的角色以打开它！\n注意：你无法将物品放回此箱子内。"
	icon_state = "grenade_case"
	w_class = WEIGHT_CLASS_HUGE
	slowdown = 1

/obj/item/storage/box/crate/grenade_system/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 2
	storage_datum.max_storage_space = 0

/obj/item/storage/box/crate/grenade_system/PopulateContents()
	new /obj/item/weapon/gun/grenade_launcher/multinade_launcher(src)
	new /obj/item/storage/belt/grenade/b17(src)

/obj/item/storage/box/crate/rocket_system
	name = "\improper M5 RPG板条箱"
	desc = "一个装有重型反坦克导弹发射器和导弹的大箱子。将此图标拖入你的角色以打开它！\n注意：你无法将物品放回此箱子内。"
	icon_state = "rocket_case"
	w_class = WEIGHT_CLASS_HUGE
	slowdown = 1

/obj/item/storage/box/crate/rocket_system/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 6
	storage_datum.max_storage_space = 0

/obj/item/storage/box/crate/rocket_system/PopulateContents()
	new /obj/item/weapon/gun/launcher/rocket/sadar(src)
	new /obj/item/ammo_magazine/rocket/sadar(src)
	new /obj/item/ammo_magazine/rocket/sadar(src)
	new /obj/item/ammo_magazine/rocket/sadar/ap(src)
	new /obj/item/ammo_magazine/rocket/sadar/ap(src)
	new /obj/item/ammo_magazine/rocket/sadar/wp(src)

/obj/item/storage/box/crate/heavy_grenadier
	name = "\improper 重型掷弹手携行箱"
	desc = "一个装有B17重型护甲和阿玛特系统M92重型多管手雷发射器的大箱子。将此图标拖入角色以打开！\n注意：无法将物品放回此箱内。"
	icon_state = "grenade_case"
	w_class = WEIGHT_CLASS_HUGE
	slowdown = 1

/obj/item/storage/box/crate/heavy_grenadier/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 6
	storage_datum.max_storage_space = 0

/obj/item/storage/box/crate/heavy_grenadier/PopulateContents()
	new /obj/item/weapon/gun/grenade_launcher/multinade_launcher(src)
	new /obj/item/storage/belt/grenade/b17(src)
	new /obj/item/clothing/suit/storage/marine/B17(src)
	new /obj/item/clothing/head/helmet/marine/grenadier(src)
	new /obj/item/storage/box/visual/grenade/frag(src)
	new /obj/item/storage/box/visual/grenade/frag(src)
	new /obj/item/storage/box/visual/grenade/incendiary(src)

/obj/item/storage/box/crate/heavy_gunner
	name = "\improper 重型转轮机枪手装备箱"
	desc = "一个装有B18护甲、弹药和一把该死加特林的大箱子。将此图标拖入你的角色来打开它！\n注意：你无法将物品放回此箱内。"
	icon_state = "rocket_case"
	w_class = WEIGHT_CLASS_HUGE
	slowdown = 1

/obj/item/storage/box/crate/heavy_gunner/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 16
	storage_datum.max_storage_space = 0

/obj/item/storage/box/crate/heavy_gunner/PopulateContents()
	new /obj/item/clothing/gloves/marine/specialist(src)
	new /obj/item/clothing/suit/storage/marine/specialist(src)
	new /obj/item/clothing/head/helmet/marine/specialist(src)
	new /obj/item/weapon/gun/minigun(src)
	new /obj/item/belt_harness/marine(src)
	new /obj/item/ammo_magazine/minigun_powerpack(src)

/obj/item/storage/box/crate/m42c_system
	name = "\improper 反器材狙击步枪系统（侦察套装）"
	desc = "一个装有您专属远程狙击步枪的大箱子。将此图标拖到您身上即可打开！\n注意：您无法将物品放回此箱内。"
	icon_state = "sniper_case"
	w_class = WEIGHT_CLASS_HUGE
	slowdown = 1

/obj/item/storage/box/crate/m42c_system/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 12
	storage_datum.max_storage_space = 0

/obj/item/storage/box/crate/m42c_system/PopulateContents()
	new /obj/item/clothing/suit/modular/xenonauten/light(src)
	new /obj/item/clothing/head/modular/m10x(src)
	new /obj/item/clothing/glasses/night/m42_night_goggles(src)
	new /obj/item/ammo_magazine/sniper(src)
	new /obj/item/ammo_magazine/sniper/incendiary(src)
	new /obj/item/ammo_magazine/sniper/flak(src)
	new /obj/item/binoculars/tactical(src)
	new /obj/item/storage/backpack/marine/smock(src)
	new /obj/item/weapon/gun/pistol/vp70(src)
	new /obj/item/ammo_magazine/pistol/vp70(src)
	new /obj/item/ammo_magazine/pistol/vp70(src)
	new /obj/item/weapon/gun/rifle/sniper/antimaterial(src)
	new /obj/item/bodybag/tarp(src)

/obj/item/storage/box/crate/m42c_system_Jungle
	name = "\improper 反器材狙击步枪系统（射手套装）"
	desc = "一个装有您专属远程狙击步枪的大箱子。将此图标拖入您的角色以打开它！\n注意：您无法将物品放回此箱内。"
	icon_state = "sniper_case"
	w_class = WEIGHT_CLASS_HUGE
	slowdown = 1

/obj/item/storage/box/crate/m42c_system_Jungle/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 9
	storage_datum.max_storage_space = 0

/obj/item/storage/box/crate/m42c_system_Jungle/PopulateContents()
	new /obj/item/clothing/suit/modular/xenonauten/light(src)
	new /obj/item/clothing/head/modular/m10x(src)
	new /obj/item/clothing/glasses/m42_goggles(src)
	new /obj/item/ammo_magazine/sniper(src)
	new /obj/item/ammo_magazine/sniper(src)
	new /obj/item/ammo_magazine/sniper/incendiary(src)
	new /obj/item/weapon/gun/rifle/sniper/antimaterial(src)
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new /obj/item/clothing/under/marine/camo/snow(src)
		new /obj/item/storage/backpack/marine/satchel(src)
		new /obj/item/bodybag/tarp/snow(src)
	else
		new /obj/item/facepaint/sniper(src)
		new /obj/item/storage/backpack/marine/smock(src)
		new /obj/item/bodybag/tarp(src)
