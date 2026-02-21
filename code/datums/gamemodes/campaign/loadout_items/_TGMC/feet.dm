/datum/loadout_item/feet
	item_slot = ITEM_SLOT_FEET
	ui_icon = "boots"

/datum/loadout_item/feet/empty
	name = "no footwear"
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


/datum/loadout_item/feet/marine_boots
	name = "Combat boots"
	desc = "标准制式作战靴，专为战斗场景或作战环境设计。全天候战斗，随时待命。"
	item_typepath = /obj/item/clothing/shoes/marine/tdf/full
	jobs_supported = list(SQUAD_MARINE, SQUAD_CORPSMAN, SQUAD_ENGINEER, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER, STAFF_OFFICER, CAPTAIN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/feet/marine_brown_boots
	name = "Brown boots"
	desc = "标准制式作战靴，专为战斗场景或作战环境设计。全天候作战，随时待命。"
	item_typepath = /obj/item/clothing/shoes/marine/brown/full
	jobs_supported = list(SQUAD_MARINE, SQUAD_CORPSMAN, SQUAD_ENGINEER, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER, STAFF_OFFICER, CAPTAIN)

/datum/loadout_item/feet/white_dress
	name = "Dress shoes"
	desc = "配白色礼服制服用的精致白鞋。不附带战斗刀。"
	item_typepath = /obj/item/clothing/shoes/white
	jobs_supported = list(SQUAD_MARINE, SQUAD_CORPSMAN, SQUAD_ENGINEER, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER, STAFF_OFFICER, CAPTAIN)

//Captain
/datum/loadout_item/feet/captain
	name = "Captain's shoes"
	desc = "鞋底经过特殊设计，能更好地践踏脚下的目标。"
	item_typepath = /obj/item/clothing/shoes/marinechief/captain
	jobs_supported = list(CAPTAIN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
