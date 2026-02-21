/datum/loadout_item/uniform/som_standard
	name = "SOM uniform"
	desc = "火星之子军人的标准制服。其设计明显源自旧时采矿殖民地使用的采矿服。"
	item_typepath = /obj/item/clothing/under/som/webbing
	jobs_supported = list(SOM_SQUAD_MARINE)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/uniform/som_veteran
	name = "SOM veteran uniform"
	desc = "火星之子军事人员的标准制服。其设计明显源自旧采矿殖民地使用的采矿服。这件带有专家身份的标识。"
	item_typepath = /obj/item/clothing/under/som/veteran/webbing
	jobs_supported = list(SOM_SQUAD_VETERAN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/uniform/som_leader
	name = "SOM leader uniform"
	desc = "火星之子军事人员的标准制服。其设计明显源自旧采矿殖民地使用的采矿服。这件带有领导标识。"
	item_typepath = /obj/item/clothing/under/som/leader/webbing
	jobs_supported = list(SOM_SQUAD_LEADER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

//corpsman
/datum/loadout_item/uniform/som_medic
	name = "SOM medical uniform"
	desc = "火星之子军事人员的标准制服。其设计明显源自旧采矿殖民地使用的采矿服。这件带有医疗标识。"
	item_typepath = /obj/item/clothing/under/som/medic/vest
	jobs_supported = list(SOM_SQUAD_CORPSMAN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/uniform/som_medic/role_post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/bodybag/cryobag, SLOT_IN_ACCESSORY)
	wearer.equip_to_slot_or_del(new /obj/item/roller, SLOT_IN_ACCESSORY)
	wearer.equip_to_slot_or_del(new /obj/item/tweezers_advanced, SLOT_IN_ACCESSORY)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/advanced/nanoblood, SLOT_IN_ACCESSORY)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/advanced/big/combatmix, SLOT_IN_ACCESSORY)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/advanced/combat_advanced, SLOT_IN_ACCESSORY)

//engineer
/datum/loadout_item/uniform/som_engineer
	name = "SOM uniform"
	desc = "火星之子军人的标准制服。其设计明显源自旧采矿殖民地使用的采矿服。"
	req_desc = "Requires a tool pouch. You ARE an engineer, right?"
	item_typepath = /obj/item/clothing/under/som/webbing
	jobs_supported = list(SOM_SQUAD_ENGINEER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/uniform/som_field_commander
	name = "Officer uniform"
	desc = "火星之子战地军官专属的黑色制服。"
	item_typepath = /obj/item/clothing/under/som/officer/webbing
	jobs_supported = list(SOM_FIELD_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/uniform/som_officer
	name = "Officer uniform"
	desc = "火星之子军官的独特黑色制服。通常由初级军官穿着。"
	item_typepath = /obj/item/clothing/under/som/officer
	jobs_supported = list(SOM_STAFF_OFFICER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/uniform/som_senior_officer
	name = "Officer uniform"
	desc = "火星之子军官标志性的黑色夹克制服。通常由高级军官穿着。"
	item_typepath = /obj/item/clothing/under/som/officer/senior
	jobs_supported = list(SOM_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

