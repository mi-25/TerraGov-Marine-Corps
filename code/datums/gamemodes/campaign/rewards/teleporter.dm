//turns it on
/datum/campaign_asset/teleporter_enabled
	name = "Enable Teleporter Array"
	desc = "启用传送阵列，用于当前或下一次任务。"
	detailed_desc = "Established a link between our Teleporter Array and its master Bluespace drive, allowing its operation during the current or next mission."
	asset_portrait = /atom/movable/screen/text/screen_text/picture/potrait/som_scientist
	ui_icon = "tele_active"
	uses = 3
	cost = 8
	asset_flags = ASSET_ACTIVATED_EFFECT|ASSET_ACTIVE_MISSION_ONLY|ASSET_DISABLE_ON_MISSION_END|ASSET_DISALLOW_REPEAT_USE
	already_active_message = "The Teleporter Array is already activated!"
	blacklist_mission_flags = MISSION_DISALLOW_TELEPORT
	blacklist_message = "External factors prevent the use of the teleporter at this time. Teleporter unavailable."
	///The teleporter associated with this asset
	var/obj/structure/teleporter_array/linked_teleporter

/datum/campaign_asset/teleporter_enabled/activation_checks()
	. = ..()
	if(.)
		return
	var/datum/game_mode/hvh/campaign/mode = SSticker.mode
	var/datum/campaign_mission/current_mission = mode.current_mission
	if(!current_mission.mission_z_level)
		to_chat(faction.faction_leader, span_warning("正在加载新战场坐标。请稍后再试。"))
		return TRUE
	if(linked_teleporter)
		return FALSE
	for(var/obj/structure/teleporter_array/teleporter AS in GLOB.teleporter_arrays)
		if(teleporter.faction != faction.faction)
			continue
		if(teleporter.teleporter_status == TELEPORTER_ARRAY_INOPERABLE)
			to_chat(faction.faction_leader, span_warning("传送阵列因连接的蓝空驱动器被摧毁而永久停用。"))
			return TRUE
		linked_teleporter = teleporter
		return FALSE
	return TRUE

/datum/campaign_asset/teleporter_enabled/activated_effect()
	linked_teleporter.enable_teleporter()
	linked_teleporter.charges += 1
	to_chat(faction.faction_leader, span_warning("传送阵列已启动。与蓝空驱动器连接已确认。准备传送。"))

//adds more charges
/datum/campaign_asset/teleporter_charges
	name = "Teleporter Array charges"
	desc = "传送器阵列充能+3"
	detailed_desc = "Central command have allocated the battalion with three additional uses of the Teleporter Array. Its extremely costly to run and demand is high across the conflict zone, so make them count."
	asset_portrait = /atom/movable/screen/text/screen_text/picture/potrait/som_scientist
	ui_icon = "tele_uses"
	uses = 3
	cost = 3

/datum/campaign_asset/teleporter_charges/activated_effect()
	for(var/obj/structure/teleporter_array/teleporter AS in GLOB.teleporter_arrays)
		if(teleporter.faction != faction.faction)
			continue
		teleporter.charges += 1
		to_chat(faction.faction_leader, span_warning("传送器阵列已准备就绪，可再次启动。"))
		return

//Turns it off for good
/datum/campaign_asset/teleporter_disabled
	name = "Teleporter Array disabled"
	desc = "传送阵列已被永久禁用"
	detailed_desc = "The Bluespace drive powering all Teleporter Arrays in the conflict zone has been destroyed, rending all Teleporter Arrays inoperable. You'll have to deploy the old fashion way from here on out."
	asset_flags = ASSET_IMMEDIATE_EFFECT|ASSET_DEBUFF
	asset_portrait = /atom/movable/screen/text/screen_text/picture/potrait/som_scientist
	ui_icon = "tele_broken"

/datum/campaign_asset/teleporter_disabled/immediate_effect()
	for(var/obj/structure/teleporter_array/teleporter AS in GLOB.teleporter_arrays)
		if(teleporter.faction != faction.faction)
			continue
		teleporter.teleporter_status = TELEPORTER_ARRAY_INOPERABLE
		to_chat(faction.faction_leader, span_warning("错误：传送阵列已永久失效。"))
		return
