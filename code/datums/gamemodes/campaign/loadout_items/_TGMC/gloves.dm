/datum/loadout_item/gloves
	item_slot = ITEM_SLOT_GLOVES

/datum/loadout_item/gloves/empty
	name = "no gloves"
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


/datum/loadout_item/gloves/marine_gloves
	name = "Combat gloves"
	desc = "标准配发的陆战队战术手套。上面写着：'由陆战队黑寡妇协会编织'。"
	item_typepath = /obj/item/clothing/gloves/marine/tdf
	jobs_supported = list(SQUAD_MARINE, SQUAD_CORPSMAN, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/gloves/marine_fingerless
	name = "Fingerless gloves"
	desc = "标准配发的陆战队战术手套，但这次是露指款！上面写着：'由陆战队黑寡妇协会编织'。"
	item_typepath = /obj/item/clothing/gloves/marine/fingerless
	jobs_supported = list(SQUAD_MARINE, SQUAD_CORPSMAN, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER)

/datum/loadout_item/gloves/white_dress
	name = "Dress gloves"
	desc = "与白色礼服相配的精致白手套。"
	item_typepath = /obj/item/clothing/gloves/white
	jobs_supported = list(SQUAD_MARINE, SQUAD_CORPSMAN, SQUAD_ENGINEER, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER, STAFF_OFFICER, CAPTAIN)

//corpsman
/datum/loadout_item/gloves/defib_gloves
	name = "Defib gloves"
	desc = "高级医疗手套，内置小型电极，可为患者进行除颤。告别笨重的设备！"
	purchase_cost = 50
	item_typepath = /obj/item/clothing/gloves/defibrillator
	jobs_supported = list(SQUAD_CORPSMAN)

//engineer
/datum/loadout_item/gloves/insulated
	name = "Insulated gloves"
	desc = "绝缘陆战队战术手套，可防护电击。"
	item_typepath = /obj/item/clothing/gloves/marine/insulated
	jobs_supported = list(SQUAD_ENGINEER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

//FC
/datum/loadout_item/gloves/officer_gloves
	name = "Officer gloves"
	desc = "闪亮又引人注目。看起来价格不菲。"
	item_typepath = /obj/item/clothing/gloves/marine/officer
	jobs_supported = list(FIELD_COMMANDER, STAFF_OFFICER, CAPTAIN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

//captain
/datum/loadout_item/gloves/captain_gloves
	name = "Captain's gloves"
	desc = "你或许喜欢这副手套，但{{P0}}们认为你不配拥有它们。"
	item_typepath = /obj/item/clothing/gloves/marine/techofficer/captain
	jobs_supported = list(CAPTAIN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
