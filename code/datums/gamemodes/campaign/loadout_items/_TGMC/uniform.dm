/datum/loadout_item/uniform
	item_slot = ITEM_SLOT_ICLOTHING

/datum/loadout_item/uniform/empty
	name = "no uniform"
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


/datum/loadout_item/uniform/marine_standard
	name = "TDF uniform"
	desc = "一套标准配发的、凯夫拉编织、经过危险品测试、电磁场增强的陆战队制服。你怀疑它并不像宣传的那样坚固耐用。"
	item_typepath = /obj/item/clothing/under/tdf/black_vest
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER, SQUAD_LEADER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/uniform/white_dress
	name = "white dress uniform"
	desc = "A standard-issue TerraGov Marine Corps white dress uniform. \
	The starch in the fabric chafes a small amount but it pales in comparison to the pride you feel when you first put it on during graduation from boot camp. Doesn't seem to fit perfectly around the waist though."
	item_typepath = /obj/item/clothing/under/marine/whites
	jobs_supported = list(SQUAD_MARINE, SQUAD_CORPSMAN, SQUAD_ENGINEER, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER, STAFF_OFFICER, CAPTAIN)

//corpsman
/datum/loadout_item/uniform/marine_corpsman
	name = "corpsman fatigues"
	desc = "一套标准配发的、凯夫拉编织、经过危险品测试、电磁场增强的战斗卫生兵作训服。你怀疑它并不像广告宣传的那样坚固耐用。"
	item_typepath = /obj/item/clothing/under/tdf/medic/corpman_vest
	jobs_supported = list(SQUAD_CORPSMAN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/uniform/marine_corpsman/role_post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/bodybag/cryobag, SLOT_IN_ACCESSORY)
	wearer.equip_to_slot_or_del(new /obj/item/roller, SLOT_IN_ACCESSORY)
	wearer.equip_to_slot_or_del(new /obj/item/tweezers_advanced, SLOT_IN_ACCESSORY)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/advanced/nanoblood, SLOT_IN_ACCESSORY)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/advanced/big/combatmix, SLOT_IN_ACCESSORY)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/advanced/combat_advanced, SLOT_IN_ACCESSORY)

//engineer
/datum/loadout_item/uniform/marine_engineer
	name = "Engineer fatigues"
	desc = "一套标准配发的、凯夫拉编织、经过危险品测试、电磁场增强的战斗工程兵作训服。你怀疑它并不像宣传的那样坚固耐用。"
	req_desc = "Requires a tool pouch. You ARE an engineer, right?"
	item_typepath = /obj/item/clothing/under/tdf/black_vest
	jobs_supported = list(SQUAD_ENGINEER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

//FC
/datum/loadout_item/uniform/field_commander
	name = "FC uniform"
	desc = "一件由TGMC战地军官穿着的特制、凯夫拉编织、防化测试、电磁场增强的装备。你怀疑它并不像宣传的那样坚固。"
	item_typepath = /obj/item/clothing/under/tdf/black_vest
	jobs_supported = list(FIELD_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

//Staff officer
/datum/loadout_item/uniform/staff_officer
	name = "SO uniform"
	desc = "一件标准配发的、凯夫拉编织的、经过危险品测试的、电磁场增强的参谋军官制服。为海军争光。"
	item_typepath = /obj/item/clothing/under/marine/officer/bridge
	jobs_supported = list(STAFF_OFFICER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

//Captain
/datum/loadout_item/uniform/captain_officer
	name = "Captain uniform"
	desc = "一套特制、熨烫平整、凯夫拉编织、经过危险品测试、电磁场增强的地球政府海军舰长制服。哪怕只是多看一眼，都可能让你面临军事法庭的审判。"
	item_typepath = /obj/item/clothing/under/marine/officer/command
	jobs_supported = list(CAPTAIN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
