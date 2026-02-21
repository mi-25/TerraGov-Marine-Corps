/datum/loadout_item/gloves/som_gloves
	name = "SOM gloves"
	desc = "这副手套的起源可以追溯到古老的采矿殖民地，看起来相当坚固。"
	item_typepath = /obj/item/clothing/gloves/marine/som
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_CORPSMAN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/gloves/som_veteran_gloves
	name = "Veteran gloves"
	desc = "源自古老采矿殖民地的防护手套。这些看起来比普通款更坚固。"
	item_typepath = /obj/item/clothing/gloves/marine/som/veteran
	jobs_supported = list(SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/gloves/som_insulated
	name = "Insulated gloves"
	desc = "源自古老采矿殖民地的防护手套。这些手套似乎内置了绝缘层。"
	item_typepath = /obj/item/clothing/gloves/marine/som/insulated
	jobs_supported = list(SOM_SQUAD_ENGINEER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/gloves/som_officer_gloves
	name = "Officer gloves"
	desc = "火星之子军官常戴的黑色手套。"
	item_typepath = /obj/item/clothing/gloves/marine/som/officer
	jobs_supported = list(SOM_FIELD_COMMANDER, SOM_STAFF_OFFICER, SOM_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

