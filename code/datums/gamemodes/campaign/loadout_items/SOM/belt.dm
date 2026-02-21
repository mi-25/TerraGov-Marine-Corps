/datum/loadout_item/belt/som
	item_blacklist = list(
		/obj/item/weapon/gun/shotgun/double/sawn = ITEM_SLOT_SECONDARY,
		/obj/item/weapon/energy/sword/som = ITEM_SLOT_SECONDARY,
	)


/datum/loadout_item/belt/som/ammo_belt
	name = "Ammo belt"
	desc = "源自M276弹药带和一些旧殖民地安保装备的腰带。可容纳6个标准尺寸弹匣。"
	item_typepath = /obj/item/storage/belt/marine/som
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_ENGINEER, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER, SOM_FIELD_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
	item_blacklist = list(
		/obj/item/weapon/gun/rifle/som_mg/standard = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/twohanded/fireaxe/som = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/flamer/som/mag_harness = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/shotgun/som/standard = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/shotgun/som/support = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/shotgun/double/sawn = ITEM_SLOT_SECONDARY,
		/obj/item/weapon/energy/sword/som = ITEM_SLOT_SECONDARY,
	)

/datum/loadout_item/belt/som/sparepouch
	name = "Utility pouch"
	desc = "一个轻便小巧的附包，可固定在护甲或腰带上，为杂物或弹匣/弹鼓提供额外存储空间。采用正宗火星之子皮革制成。"
	item_typepath = /obj/item/storage/belt/sparepouch/som
	jobs_supported = list(SOM_SQUAD_MARINE)

/datum/loadout_item/belt/som/shotgun_mixed
	name = "Shotgun shell rig"
	desc = "专为容纳霰弹枪弹或单发弹道弹药设计的弹药带。采用传统的火星之子皮革制成。已装满鹿弹和箭形弹弹壳。"
	item_typepath = /obj/item/storage/belt/shotgun/som/mixed
	jobs_supported = list(SOM_SQUAD_MARINE)
	item_whitelist = list(
		/obj/item/weapon/gun/shotgun/som/standard = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/shotgun/som/support = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/shotgun/som/back_slot = ITEM_SLOT_BACK,
	)

/datum/loadout_item/belt/som/shotgun_flechette
	name = "Shotgun shell rig"
	desc = "一条设计用于容纳霰弹枪弹或单发弹药的弹链。采用传统的火星之子皮革制成。已装满箭形弹。"
	item_typepath = /obj/item/storage/belt/shotgun/som/flechette
	jobs_supported = list(SOM_SQUAD_ENGINEER)
	item_whitelist = list(
		/obj/item/weapon/gun/shotgun/som/standard = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/shotgun/som/support = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/shotgun/som/back_slot = ITEM_SLOT_BACK,
	)

/datum/loadout_item/belt/som/grenades
	name = "Grenade rig"
	desc = "一种简单的携行系统，有多种配置可选。此版本专为携带大量手雷而设计。"
	ui_icon = "grenade"
	item_typepath = /obj/item/storage/belt/grenade/som
	jobs_supported = list(SOM_SQUAD_VETERAN)
	purchase_cost = 80
	quantity = 2

/datum/loadout_item/belt/som/grenades/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	. = ..()
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/som, SLOT_IN_BELT)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/som, SLOT_IN_BELT)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/satrapine, SLOT_IN_BELT)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/satrapine, SLOT_IN_BELT)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang/stun, SLOT_IN_BELT)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang/stun, SLOT_IN_BELT)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/som, SLOT_IN_BELT)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/som, SLOT_IN_BELT)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/som, SLOT_IN_BELT)

/datum/loadout_item/belt/som/pistol_holster
	name = "Pistol holster"
	desc = "源自旧殖民地安保枪套装备的腰带。可容纳任何手枪副武器，并携带大量弹药。"
	ui_icon = "v11"
	item_typepath = /obj/item/storage/holster/belt/pistol/m4a3/som
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_CORPSMAN, SOM_SQUAD_ENGINEER, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER)
	item_whitelist = list(
		/obj/item/weapon/gun/pistol/som/standard = ITEM_SLOT_SECONDARY,
		/obj/item/weapon/gun/pistol/som/burst = ITEM_SLOT_SECONDARY,
		/obj/item/weapon/gun/pistol/highpower/standard = ITEM_SLOT_SECONDARY,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta = ITEM_SLOT_SECONDARY,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta/custom = ITEM_SLOT_SECONDARY,
	)
	req_desc = "Requires a pistol secondary."

/datum/loadout_item/belt/som/pistol_holster/default
	jobs_supported = list(SOM_STAFF_OFFICER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/belt/som/pistol_holster/officer
	desc = "一款质量上乘的手枪腰带，采用火星之子军官常见的款式。看起来有些年头，但保养得很好。可容纳任何手枪副武器，以及大量弹药。"
	ui_icon = "vx12"
	item_typepath = /obj/item/storage/holster/belt/pistol/m4a3/som/fancy
	jobs_supported = list(SOM_FIELD_COMMANDER, SOM_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/belt/som/lifesaver
	name = "S17 lifesaver bag"
	desc = "一条源自旧时采矿殖民地医护人员所用腰带的厚重腰带。"
	ui_icon = "medkit"
	item_typepath = /obj/item/storage/belt/lifesaver/som/quick
	jobs_supported = list(SOM_SQUAD_CORPSMAN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
