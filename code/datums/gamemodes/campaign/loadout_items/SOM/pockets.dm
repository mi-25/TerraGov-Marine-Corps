/datum/loadout_item/r_pocket/som_standard_first_aid
	name = "First aid pouch"
	desc = "标准火星之子急救附包。包含一套基础医疗用品。"
	ui_icon = "medkit"
	item_typepath = /obj/item/storage/pouch/firstaid/som/combat_patrol
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_VETERAN)

/datum/loadout_item/r_pocket/som_standard_first_aid/standard_improved
	desc = "标准火星之子急救附包。内含一套改进型医疗用品。"
	item_typepath = /obj/item/storage/pouch/firstaid/som/combat_patrol_leader
	loadout_item_flags = null

/datum/loadout_item/r_pocket/som_standard_first_aid/improved
	desc = "标准火星之子急救附包。包含一套改进的医疗用品。"
	item_typepath = /obj/item/storage/pouch/firstaid/som/combat_patrol_leader
	jobs_supported = list(SOM_SQUAD_LEADER, SOM_FIELD_COMMANDER)

/datum/loadout_item/r_pocket/som_support_grenades
	name = "Support nades"
	desc = "一个装有六枚标准支援手雷的附包。包含致命和非致命两种烟雾手雷，以及眩晕手雷。"
	ui_icon = "grenade"
	item_typepath = /obj/item/storage/pouch/grenade/som/combat_patrol
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_CORPSMAN, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER, SOM_FIELD_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/r_pocket/som_standard_grenades
	name = "Standard nades"
	desc = "一个装有六枚标准进攻型手雷的附包。包含高爆手雷和燃烧手雷。"
	ui_icon = "grenade"
	item_typepath = /obj/item/storage/pouch/grenade/som/standard
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_CORPSMAN, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER, SOM_FIELD_COMMANDER)

/datum/loadout_item/r_pocket/som_emp_grenades
	name = "EMP nades"
	desc = "一个装有六枚EMP手雷的附包。对包括机甲在内的电子系统有效。"
	purchase_cost = 30
	ui_icon = "grenade"
	item_typepath = /obj/item/storage/pouch/grenade/som/emp
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_CORPSMAN, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER, SOM_FIELD_COMMANDER)

/datum/loadout_item/r_pocket/war_crime_grenades
	name = "Warcrime nades"
	desc = "一个装有辐射和萨特拉平手雷的附包。极其危险。"
	ui_icon = "grenade"
	req_desc = "Requires a suit with a Mithridatius environmental protection module."
	item_typepath = /obj/item/storage/pouch/grenade/som
	jobs_supported = list(SOM_SQUAD_VETERAN)
	item_whitelist = list(/obj/item/clothing/suit/modular/som/heavy/mithridatius = ITEM_SLOT_OCLOTHING)

/datum/loadout_item/r_pocket/war_crime_grenades/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/satrapine, SLOT_IN_R_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/satrapine, SLOT_IN_R_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/satrapine, SLOT_IN_R_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/rad, SLOT_IN_R_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/rad, SLOT_IN_R_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/rad, SLOT_IN_R_POUCH)

/datum/loadout_item/r_pocket/som_shotgun
	name = "Buckshot shells"
	desc = "专门用于存放霰弹枪弹药的附包。内含鹿弹弹壳。"
	ui_icon = "grenade"
	item_typepath = /obj/item/storage/pouch/shotgun/som
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER)

/datum/loadout_item/r_pocket/som_shotgun/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/buckshot, SLOT_IN_R_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/buckshot, SLOT_IN_R_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/buckshot, SLOT_IN_R_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/buckshot, SLOT_IN_R_POUCH)

/datum/loadout_item/r_pocket/som_construction
	name = "Construction pouch"
	desc = "一个装有各种建筑物资的附包。可用于快速建立加固阵地。"
	ui_icon = "materials"
	item_typepath = /obj/item/storage/pouch/construction/som
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER)

/datum/loadout_item/r_pocket/som_construction/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/tool/shovel/etool, SLOT_IN_R_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sandbags_empty/half, SLOT_IN_R_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sandbags/large_stack, SLOT_IN_R_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/stack/barbed_wire/full, SLOT_IN_R_POUCH)

/datum/loadout_item/r_pocket/som_magazine
	name = "Mag pouch-P"
	desc = "一个装有三个弹匣的附包。在适用情况下会包含一种主弹药类型。"
	ui_icon = "grenade"
	item_typepath = /obj/item/storage/pouch/magazine/large/som
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_CORPSMAN, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER, SOM_FIELD_COMMANDER)
	item_blacklist = list(
		/obj/item/weapon/gun/rifle/som_mg/standard = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/twohanded/fireaxe/som = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/flamer/som/mag_harness = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/shotgun/som/standard = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/shotgun/som/support = ITEM_SLOT_SUITSTORE,
	)

/datum/loadout_item/r_pocket/som_tools
	name = "Tool pouch"
	desc = "它设计用于存放维修工具——螺丝刀、扳手、电缆卷等。它还有一个挂钩，用于固定工兵铲。"
	ui_icon = "construction"
	item_typepath = /obj/item/storage/pouch/tools/som/full
	jobs_supported = list(SOM_SQUAD_ENGINEER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/r_pocket/som_general
	name = "General pouch"
	desc = "用于携带小件物品的通用附包。"
	ui_icon = "grenade"
	item_typepath = /obj/item/storage/pouch/general/som
	jobs_supported = list(SOM_STAFF_OFFICER, SOM_COMMANDER)

//l_pocket
/datum/loadout_item/l_pocket/som_standard_first_aid
	name = "First aid pouch"
	desc = "标准火星之子急救附包。包含一套基础医疗用品。"
	ui_icon = "medkit"
	item_typepath = /obj/item/storage/pouch/firstaid/som/combat_patrol
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_ENGINEER, SOM_SQUAD_VETERAN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/l_pocket/som_standard_first_aid/standard_improved
	desc = "标准火星之子急救附包。包含一套改进的医疗用品。"
	item_typepath = /obj/item/storage/pouch/firstaid/som/combat_patrol_leader
	loadout_item_flags = null

/datum/loadout_item/l_pocket/som_standard_first_aid/improved
	desc = "标准火星之子急救附包。内含一套改进型医疗用品。"
	item_typepath = /obj/item/storage/pouch/firstaid/som/combat_patrol_leader
	jobs_supported = list(SOM_SQUAD_LEADER, SOM_FIELD_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/l_pocket/som_support_grenades
	name = "Support nades"
	desc = "一个装有六枚标准支援手雷的附包。包含致命和非致命两种烟雾手雷，以及眩晕手雷。"
	ui_icon = "grenade"
	item_typepath = /obj/item/storage/pouch/grenade/som/combat_patrol
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_CORPSMAN, SOM_SQUAD_ENGINEER, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER, SOM_FIELD_COMMANDER)

/datum/loadout_item/l_pocket/som_standard_grenades
	name = "Standard nades"
	desc = "一个装有六枚标准进攻型手雷的附包。包含高爆手雷和燃烧手雷。"
	ui_icon = "grenade"
	item_typepath = /obj/item/storage/pouch/grenade/som/standard
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_CORPSMAN, SOM_SQUAD_ENGINEER, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER, SOM_FIELD_COMMANDER)

/datum/loadout_item/l_pocket/som_emp_grenades
	name = "EMP nades"
	desc = "一个装有六枚EMP手雷的附包。对包括机甲在内的电子系统有效。"
	purchase_cost = 30
	ui_icon = "grenade"
	item_typepath = /obj/item/storage/pouch/grenade/som/emp
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_CORPSMAN, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER, SOM_FIELD_COMMANDER)

/datum/loadout_item/l_pocket/war_crime_grenades
	name = "Warcrime nades"
	desc = "一个装有辐射和萨特拉平手雷的附包。极其危险。"
	ui_icon = "grenade"
	req_desc = "Requires a suit with a Mithridatius environmental protection module."
	item_typepath = /obj/item/storage/pouch/grenade/som
	jobs_supported = list(SOM_SQUAD_VETERAN)
	item_whitelist = list(/obj/item/clothing/suit/modular/som/heavy/mithridatius = ITEM_SLOT_OCLOTHING)

/datum/loadout_item/l_pocket/war_crime_grenades/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/satrapine, SLOT_IN_L_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/satrapine, SLOT_IN_L_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/satrapine, SLOT_IN_L_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/rad, SLOT_IN_L_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/rad, SLOT_IN_L_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/rad, SLOT_IN_L_POUCH)

/datum/loadout_item/l_pocket/som_shotgun
	name = "Flechette shells"
	desc = "专用于存放霰弹枪弹药的附包。内含箭形弹。"
	ui_icon = "grenade"
	item_typepath = /obj/item/storage/pouch/shotgun/som
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_CORPSMAN, SOM_SQUAD_ENGINEER, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER)

/datum/loadout_item/l_pocket/som_shotgun/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/flechette, SLOT_IN_L_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/flechette, SLOT_IN_L_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/flechette, SLOT_IN_L_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/flechette, SLOT_IN_L_POUCH)

/datum/loadout_item/l_pocket/som_construction
	name = "Construction pouch"
	desc = "一个装有各种建筑物资的附包。可用于快速建立加固阵地。"
	ui_icon = "materials"
	item_typepath = /obj/item/storage/pouch/construction/som
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER)

/datum/loadout_item/l_pocket/som_construction/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/tool/shovel/etool, SLOT_IN_L_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sandbags_empty/half, SLOT_IN_L_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sandbags/large_stack, SLOT_IN_L_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/stack/barbed_wire/full, SLOT_IN_L_POUCH)

/datum/loadout_item/l_pocket/som_construction/engineer
	desc = "一个装有额外金属、塑钢和铁丝网的附包。可用于快速建立加固阵地。"
	jobs_supported = list(SOM_SQUAD_ENGINEER)

/datum/loadout_item/l_pocket/som_construction/engineer/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/plasteel/large_stack, SLOT_IN_L_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_L_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_L_POUCH)
	wearer.equip_to_slot_or_del(new /obj/item/stack/barbed_wire/full, SLOT_IN_L_POUCH)

/datum/loadout_item/l_pocket/som_magazine
	name = "Mag pouch-S"
	desc = "一个装有三个弹匣的附包。如果适用，还会包含一种次要弹药类型。"
	ui_icon = "grenade"
	item_typepath = /obj/item/storage/pouch/magazine/large/som
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_ENGINEER, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER, SOM_FIELD_COMMANDER)
	item_blacklist = list(
		/obj/item/weapon/gun/rifle/som_mg/standard = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/twohanded/fireaxe/som = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/flamer/som/mag_harness = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/shotgun/som/standard = ITEM_SLOT_SUITSTORE,
	)


/datum/loadout_item/l_pocket/som_magazine/medic
	jobs_supported = list(SOM_SQUAD_CORPSMAN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/l_pocket/som_general
	name = "General pouch"
	desc = "用于携带小件物品的通用附包。"
	ui_icon = "grenade"
	item_typepath = /obj/item/storage/pouch/general/som
	jobs_supported = list(SOM_STAFF_OFFICER, SOM_COMMANDER)
