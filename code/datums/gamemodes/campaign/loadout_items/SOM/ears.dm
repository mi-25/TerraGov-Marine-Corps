/datum/loadout_item/ears/som_standard
	name = "Standard headset"
	desc = "一副耳机，允许你与团队通信并访问战术小地图。如果你不使用它，那你的日子可不好过。"
	item_typepath = /obj/item/radio/headset/mainship/som
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_CORPSMAN, SOM_SQUAD_ENGINEER, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/ears/som_command
	name = "Command headset"
	desc = "一副指挥耳机，可与所有小队通信并访问战术小地图。如果你不用这个，那可就惨了。"
	item_typepath = /obj/item/radio/headset/mainship/som/command
	jobs_supported = list(SOM_FIELD_COMMANDER, SOM_STAFF_OFFICER, SOM_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
