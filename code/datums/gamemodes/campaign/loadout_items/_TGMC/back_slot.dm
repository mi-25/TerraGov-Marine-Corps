/datum/loadout_item/back
	item_slot = ITEM_SLOT_BACK

/datum/loadout_item/back/empty
	name = "no backpack"
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

/datum/loadout_item/back/marine_satchel
	name = "Satchel"
	desc = "某些TGMC士兵和支援人员使用的重型挎包。容量小于背包，但物品可以瞬间取出。"
	item_typepath = /obj/item/storage/backpack/marine/satchel
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER, STAFF_OFFICER, CAPTAIN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/back/marine_backpack
	name = "Backpack"
	desc = "地球政府殖民地海军陆战队标准配发背包。专为向战场输送装备而设计。比挎包容量更大，但取物有延迟。"
	item_typepath = /obj/item/storage/backpack/marine
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER)

/datum/loadout_item/back/combat_pack
	name = "Combat pack"
	desc = "一款用于远征和短程行动的小型轻便背包。拥有背包的存储容量，且无取物延迟。"
	purchase_cost = 25
	item_typepath = /obj/item/storage/backpack/lightpack
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER)

/datum/loadout_item/back/combat_pack/free
	purchase_cost = 0
	jobs_supported = list(SQUAD_LEADER, FIELD_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/back/flamer_tank
	name = "Flame tank"
	desc = "专为FL-84喷火器和FL-240焚化装置设计的特种燃料罐。"
	req_desc = "Requires a FL-84 flamethrower."
	item_typepath = /obj/item/ammo_magazine/flamer_tank/backtank
	jobs_supported = list(SQUAD_MARINE)
	item_whitelist = list(/obj/item/weapon/gun/flamer/big_flamer/marinestandard/wide = ITEM_SLOT_SUITSTORE)

/datum/loadout_item/back/flamer_tank/x_fuel
	name = "X-fuel tank"
	desc = "一种特制的超稠密萘X型燃料罐，以其极高的温度和缓慢的燃烧速率，以及独特的蓝色火焰而闻名。供FL-84喷火器和FL-240焚化装置使用。"
	item_typepath = /obj/item/ammo_magazine/flamer_tank/backtank/X
	purchase_cost = 50
	unlock_cost = 200
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_UNLOCKABLE

/datum/loadout_item/back/jetpack
	name = "Heavy jetpack"
	desc = "An upgraded jetpack with enough fuel to send a person flying for a short while with extreme force. \
	It provides better mobility for heavy users and enough thrust to be used in an aggressive manner. \
	Alt right click or middleclick to fly to a destination when the jetpack is equipped. Will collide with hostiles"
	req_desc = "Requires a SMG-25 or ALF-51B."
	item_typepath = /obj/item/jetpack_marine/heavy
	jobs_supported = list(SQUAD_MARINE)
	item_whitelist = list(
		/obj/item/weapon/gun/smg/m25/magharness = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/rifle/alf_machinecarbine/assault = ITEM_SLOT_SUITSTORE,
		/obj/item/storage/holster/blade/machete/full_alt = ITEM_SLOT_SUITSTORE,
	)

//special unlockable
/datum/loadout_item/back/marine_shotgun
	name = "SH-35"
	desc = "Equipped with a mag harness, bayonet, angled grip and foldable stock. \
	The SH-35 is the most commonly used shotgun of the TGMC. With good mobility and handling, it has unparalleled close range power when using buckshot. Able to kill or maim all but the most heavily armored targets with a single well aimmed blast. \
	When using flechette rounds, it can provide surprisingly powerful long range damage with good penetration, although its low rate of fire means its sustained damage is relatively poor. \
	Uses 12 gauge shells."
	ui_icon = "t35"
	purchase_cost = 25
	item_typepath = /obj/item/weapon/gun/shotgun/pump/t35/back_slot
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER, SQUAD_LEADER)
	loadout_item_flags = NONE

/datum/loadout_item/back/marine_shotgun/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	. = ..()
	wearer.equip_to_slot_or_del(new /obj/item/ammo_magazine/shotgun/buckshot, SLOT_R_HAND)

/datum/loadout_item/back/tgmc_heam_rocket_bag
	name = "HEAM rocket bag"
	desc = "Unlocked for free with the Heavy weapon specialisation perk. This backpack holds 4 67mm high explosive anti mech shells, in addition to a recoiless rifle. \
	The recoiless rifle is a powerful support weapon that deals significant damage against heavily armored mechs or vehicles, \
	but will generally devastate any human target unfortunate enough to be hit in a pinch. Has a draw delay and has poor accuracy against human targets."
	ui_icon = "t160"
	unlock_cost = 300
	purchase_cost = 100
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_UNLOCKABLE
	quantity = 2
	item_typepath = /obj/item/storage/holster/backholster/rpg/heam
	jobs_supported = list(SQUAD_MARINE)

/datum/loadout_item/back/machete
	name = "Machete"
	desc = "一个大型皮质刀鞘，内装M2132砍刀。可固定在背部、腰部或护甲上。对人类目标极为致命——前提是你能近身。"
	ui_icon = "machete"
	item_typepath = /obj/item/storage/holster/blade/machete/full
	jobs_supported = list(SQUAD_MARINE, SQUAD_LEADER)
	loadout_item_flags = NONE

/datum/loadout_item/back/minigun_powerpack
	name = "MG-100 powerpack"
	desc = "一个重型加固背包，装有支援设备、能量电池和MG-100加特林系统的备用弹药。你没有多余的，所以要省着用。"
	req_desc = "Requires an MG-100."
	item_typepath = /obj/item/ammo_magazine/minigun_powerpack
	jobs_supported = list(SQUAD_MARINE)
	loadout_item_flags = NONE
	item_whitelist = list(/obj/item/weapon/gun/minigun/magharness = ITEM_SLOT_SUITSTORE)

//corpsman
/datum/loadout_item/back/corpsman_satchel
	name = "Medical satchel"
	desc = "部分TGMC卫生兵携带的重型挎包。可通过插入方式为除颤器充电。容量小于背包，但物品可即时取用。"
	item_typepath = /obj/item/storage/backpack/marine/corpsman/satchel
	jobs_supported = list(SQUAD_CORPSMAN)

/datum/loadout_item/back/corpsman_backpack
	name = "Medical backpack"
	desc = "地球政府殖民地海军陆战队卫生兵的标准配发背包。你可以通过插入来为除颤器充电。比挎包容量更大，但有取出延迟。"
	item_typepath = /obj/item/storage/backpack/marine/corpsman
	jobs_supported = list(SQUAD_CORPSMAN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

//engineer
/datum/loadout_item/back/engineerpack
	name = "Sentry welderpack"
	desc = "地球政府殖民地海军陆战队技术员使用的专用背包。内置燃料罐，可快速为焊枪补充燃料。装载有哨戒炮，非常适合防御区域或建立火力封锁区。"
	item_typepath = /obj/item/storage/backpack/marine/engineerpack
	jobs_supported = list(SQUAD_ENGINEER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/back/engineerpack/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	. = ..()
	wearer.equip_to_slot_or_del(new /obj/item/weapon/gun/sentry/mini/combat_patrol, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/ammo_magazine/minisentry, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/antigas, SLOT_IN_BACKPACK)

/datum/loadout_item/back/tgmc_rocket_bag
	name = "Rocket bag"
	desc = "This backpack holds 4 67mm shells, in addition to a recoiless rifle. \
	A powerful ranged weapon with a wide area of effect, the recoiless rifle is a powerful support weapon that can severely wound whole groups of opponents in a single shot. Has a draw delay."
	ui_icon = "t160"
	purchase_cost = 100
	quantity = 3
	item_typepath = /obj/item/storage/holster/backholster/rpg/low_impact
	jobs_supported = list(SQUAD_ENGINEER)

/datum/loadout_item/back/tech_backpack
	name = "Demolition backpack"
	desc = "地球政府殖民地海军陆战队技术员的标准配发背包。内装拆弹包、C4炸药和手雷。有抽枪延迟。"
	item_typepath = /obj/item/storage/backpack/marine/tech
	jobs_supported = list(SQUAD_ENGINEER)

/datum/loadout_item/back/tech_backpack/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	. = ..()
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/antigas, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/detpack, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/detpack, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/detpack, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/assembly/signaler, SLOT_IN_BACKPACK)

//smartgunner
/datum/loadout_item/back/sg_minigun_powerpack
	name = "SG-85 powerpack"
	desc = "A reinforced backpack heavy with the IFF altered ammunition, onboard micro generator, and extensive cooling system which enables the SG-85 gatling gun to operate. \
	Use the SG-85 on the backpack itself to connect them."
	req_desc = "Requires an SG-85."
	item_typepath = /obj/item/ammo_magazine/minigun_powerpack/smartgun
	jobs_supported = list(SQUAD_SMARTGUNNER)
	item_whitelist = list(/obj/item/weapon/gun/minigun/smart_minigun/motion_detector = ITEM_SLOT_SUITSTORE)
