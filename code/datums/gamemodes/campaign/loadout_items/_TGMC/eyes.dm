/datum/loadout_item/eyes
	item_slot = ITEM_SLOT_EYES

/datum/loadout_item/eyes/empty
	name = "no eyewear"
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


/datum/loadout_item/eyes/ballistic_goggles
	name = "Ballistic goggles"
	desc = "标准配发的TGMC护目镜。主要用于装饰头盔。"
	item_typepath = /obj/item/clothing/glasses/mgoggles
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER)

/datum/loadout_item/eyes/health_hud
	name = "HealthMate HUD"
	desc = "一种抬头显示器，可扫描视野内的人类并提供其健康状况的准确数据。该投影仪可安装在兼容的眼镜上。"
	item_typepath = /obj/item/clothing/glasses/hud/health
	jobs_supported = list(SQUAD_CORPSMAN, SQUAD_LEADER, FIELD_COMMANDER, STAFF_OFFICER, CAPTAIN, SOM_SQUAD_CORPSMAN, SOM_SQUAD_LEADER, SOM_FIELD_COMMANDER, SOM_STAFF_OFFICER, SOM_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/eyes/mesons
	name = "Meson scanner"
	desc = "Used to shield the user's eyes from harmful electromagnetic emissions, also used as general safety goggles. \
	Not adequate as welding protection. Allows the user to see structural information about their surroundings."
	item_typepath = /obj/item/clothing/glasses/meson
	jobs_supported = list(SQUAD_ENGINEER, SOM_SQUAD_ENGINEER, SOM_SQUAD_VETERAN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/eyes/welding
	name = "Welding goggles"
	desc = "保护眼睛免受焊接伤害，已获疯狂科学家协会认证。"
	item_typepath = /obj/item/clothing/glasses/welding
	jobs_supported = list(SQUAD_MARINE, SQUAD_ENGINEER, SOM_SQUAD_MARINE, SOM_SQUAD_VETERAN)

/datum/loadout_item/eyes/smartgun_imagers
	name = "KTLD sight"
	desc = "专为与KTLD武器（如SG型武器）配对设计的头戴式耳机和护目镜系统。配备低分辨率短程成像仪，可查看地形。"
	item_typepath = /obj/item/clothing/glasses/night/m56_goggles
	jobs_supported = list(SQUAD_SMARTGUNNER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
