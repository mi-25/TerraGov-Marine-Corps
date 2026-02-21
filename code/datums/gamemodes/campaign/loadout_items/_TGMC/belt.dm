/datum/loadout_item/belt
	item_slot = ITEM_SLOT_BELT

/datum/loadout_item/belt/empty
	name = "no belt"
	desc = ""
	ui_icon = "empty"
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
	jobs_supported = list(
		SQUAD_MARINE,
		SQUAD_CORPSMAN,
		SQUAD_ENGINEER,
		SQUAD_SMARTGUNNER,
		SQUAD_LEADER,
		FIELD_COMMANDER,
		STAFF_OFFICER,
		CAPTAIN,
		SOM_SQUAD_MARINE,
		SOM_SQUAD_CORPSMAN,
		SOM_SQUAD_ENGINEER,
		SOM_SQUAD_VETERAN,
		SOM_SQUAD_LEADER,
		SOM_FIELD_COMMANDER,
		SOM_STAFF_OFFICER,
		SOM_COMMANDER,
	)


/datum/loadout_item/belt/ammo_belt
	name = "Ammo belt"
	desc = "M276是地球政府殖民地海军陆战队的标准承载装备。它由一个模块化腰带和各种弹夹组成。此版本是为大量弹药携带行动设计的标准型号。"
	item_typepath = /obj/item/storage/belt/marine
	jobs_supported = list(SQUAD_MARINE, SQUAD_ENGINEER, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
	item_blacklist = list(
		/obj/item/weapon/gun/rifle/standard_smartmachinegun/patrol = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/minigun/smart_minigun/motion_detector = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/flamer/big_flamer/marinestandard/wide = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/standard_mmg/machinegunner = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/rifle/standard_gpmg/machinegunner = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/shotgun/pump/t35/standard = ITEM_SLOT_SUITSTORE,
	)

/datum/loadout_item/belt/sparepouch
	name = "G8 pouch"
	desc = "一个轻便小巧的附包，可固定在阿玛特系统M3型护甲或腰带上，为杂项装备或弹匣/弹鼓提供额外存储空间。"
	item_typepath = /obj/item/storage/belt/sparepouch
	jobs_supported = list(SQUAD_MARINE)

/datum/loadout_item/belt/sparepouch/smartgunner
	desc = "A general storage pouch. \
	Contains additional ammo." //contents handled by the SG-85
	req_desc = "Requires a SG-85."
	jobs_supported = list(SQUAD_SMARTGUNNER)
	item_whitelist = list(
		/obj/item/weapon/gun/minigun/smart_minigun/motion_detector = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/rifle/standard_smartmachinegun/patrol = ITEM_SLOT_SUITSTORE,
	)

/datum/loadout_item/belt/shotgun_mixed
	name = "Shotgun shell rig"
	desc = "一条设计用于容纳霰弹枪弹或单发弹药的弹链。装满了鹿弹和箭弹。"
	item_typepath = /obj/item/storage/belt/shotgun/mixed
	jobs_supported = list(SQUAD_MARINE)
	item_whitelist = list(
		/obj/item/weapon/gun/shotgun/pump/t35/standard = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/shotgun/pump/t35/back_slot = ITEM_SLOT_BACK,
	)

/datum/loadout_item/belt/smg_holster
	name = "SMG-25 holster"
	desc = "The M276 is the standard load-bearing equipment of the TGMC. It consists of a modular belt with various clips. \
	This version is designed for the SMG-25, and features a larger frame to support the gun. Due to its unorthodox design, it isn't a very common sight, and is only specially issued."
	ui_icon = "m25"
	req_desc = "Requires a SMG-25 secondary."
	item_typepath = /obj/item/storage/holster/m25
	jobs_supported = list(SQUAD_MARINE)
	item_whitelist = list(/obj/item/weapon/gun/smg/m25/holstered = ITEM_SLOT_SECONDARY)

/datum/loadout_item/belt/scabbard
	name = "Scabbard"
	desc = "一个用于携带M2132砍刀的大型皮质刀鞘。刀片需单独购买。"
	ui_icon = "machete"
	item_typepath = /obj/item/storage/holster/blade/machete
	jobs_supported = list(SQUAD_MARINE, SQUAD_LEADER, SQUAD_SMARTGUNNER)
	item_whitelist = list(/obj/item/weapon/sword/machete = ITEM_SLOT_SECONDARY)
	req_desc = "Requires a machete secondary."

/datum/loadout_item/belt/scabbard/officer
	desc = "一把军官马刀的传家宝刀鞘。看起来价值不菲。"
	item_typepath = /obj/item/storage/holster/blade/officer
	jobs_supported = list(FIELD_COMMANDER)
	item_whitelist = list(/obj/item/weapon/sword/officersword = ITEM_SLOT_SECONDARY)
	req_desc = "Requires an officer sword secondary."

/datum/loadout_item/belt/belt_harness
	name = "Belt harness"
	desc = "肩部佩戴的带子，带有夹具，可固定到大多数物品上。应该能防止你丢失武器，但愿如此。"
	item_typepath = /obj/item/belt_harness/marine
	jobs_supported = list(SQUAD_MARINE, SQUAD_ENGINEER, SQUAD_LEADER, FIELD_COMMANDER)

/datum/loadout_item/belt/belt_harness/smart_gunner
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
	jobs_supported = list(SQUAD_SMARTGUNNER)

/datum/loadout_item/belt/pistol_holster
	name = "Pistol holster"
	desc = "一个腰带枪套，能够携带任何手枪和大量弹药。"
	ui_icon = "vp70"
	item_typepath = /obj/item/storage/holster/belt/pistol/standard_pistol
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER)
	item_whitelist = list(
		/obj/item/weapon/gun/pistol/standard_pistol/standard = ITEM_SLOT_SECONDARY,
		/obj/item/weapon/gun/pistol/standard_heavypistol/tactical = ITEM_SLOT_SECONDARY,
		/obj/item/weapon/gun/pistol/vp70/tactical = ITEM_SLOT_SECONDARY,
		/obj/item/weapon/gun/pistol/highpower/standard = ITEM_SLOT_SECONDARY,
		/obj/item/weapon/gun/pistol/m1911/custom = ITEM_SLOT_SECONDARY,
		/obj/item/weapon/gun/pistol/rt3 = ITEM_SLOT_SECONDARY,
		/obj/item/weapon/gun/pistol/smart_pistol = ITEM_SLOT_SECONDARY,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_pistol/tactical = ITEM_SLOT_SECONDARY,
		/obj/item/weapon/gun/revolver/standard_revolver = ITEM_SLOT_SECONDARY,
	)
	req_desc = "Requires a pistol secondary."

/datum/loadout_item/belt/pistol_holster/default
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
	jobs_supported = list(STAFF_OFFICER, CAPTAIN)

/datum/loadout_item/belt/db_shotgun
	name = "Shotgun holster"
	desc = "SH-34霰弹枪的皮质枪套。"
	ui_icon = "tx34"
	item_typepath = /obj/item/storage/holster/belt/ts34
	jobs_supported = list(SQUAD_SMARTGUNNER)
	item_whitelist = list(/obj/item/weapon/gun/shotgun/double/marine = ITEM_SLOT_SECONDARY)
	req_desc = "Requires a SH-34 secondary."

/datum/loadout_item/belt/lifesaver
	name = "Lifesaver bag"
	desc = "M276是地球政府殖民地海军陆战队的标准负重装备。此配置挂载一个装有多种注射器和轻型医疗用品的帆布袋，常见于卫生兵。"
	ui_icon = "medkit"
	item_typepath = /obj/item/storage/belt/lifesaver/quick
	jobs_supported = list(SQUAD_CORPSMAN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
