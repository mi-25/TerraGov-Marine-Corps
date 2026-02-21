/datum/loadout_item/feet/som_boots
	name = "Combat shoes"
	desc = "这双鞋的起源可以追溯到古老的采矿殖民地。它们可不仅仅是为了走路而设计的。"
	item_typepath = /obj/item/clothing/shoes/marine/som/knife
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_CORPSMAN, SOM_SQUAD_ENGINEER, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER, SOM_FIELD_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/feet/som_officer
	name = "officer's boots"
	desc = "一双闪亮的靴子，通常出现在火星之子军官的脚上。"
	item_typepath = /obj/item/clothing/shoes/marinechief/som
	jobs_supported = list(SOM_STAFF_OFFICER, SOM_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
