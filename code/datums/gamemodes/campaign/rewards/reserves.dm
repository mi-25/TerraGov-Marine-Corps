/datum/campaign_asset/strategic_reserves
	name = "Strategic Reserve"
	desc = "紧急预备队"
	detailed_desc = "A strategic reserve force is activated to bolster your numbers, increasing your active attrition significantly. Additionally, the respawn delay for your team is reduced by 90 seconds. Can only be used when the opponent has initiated a mission, and only once per campaign."
	ui_icon = "reserve_force"
	uses = 1
	asset_flags = ASSET_ACTIVATED_EFFECT|ASSET_DISABLE_ON_MISSION_END|ASSET_DISALLOW_REPEAT_USE
	///How much the faction's respawn delay is modified by
	var/respawn_delay_mod = -90 SECONDS

/datum/campaign_asset/strategic_reserves/activation_checks()
	. = ..()
	if(.)
		return
	var/datum/game_mode/hvh/campaign/mode = SSticker.mode
	var/datum/campaign_mission/current_mission = mode.current_mission
	if(current_mission.mission_state != MISSION_STATE_ACTIVE) //we specifically want ONLY the active state, not the new state
		to_chat(faction.faction_leader, span_warning("在任务开始前，你无法呼叫战略预备队！"))
		return TRUE
	if(current_mission.hostile_faction != faction.faction)
		to_chat(faction.faction_leader, span_warning("你只能在防守时呼叫战略预备队！"))
		return TRUE

/datum/campaign_asset/strategic_reserves/activated_effect()
	faction.active_attrition_points += round(length(GLOB.clients) * 0.3)
	faction.respawn_delay_modifier += respawn_delay_mod

/datum/campaign_asset/strategic_reserves/deactivate()
	. = ..()
	faction.respawn_delay_modifier -= respawn_delay_mod

/datum/campaign_asset/tactical_reserves
	name = "Rapid reserves"
	desc = "预备队可立即部署"
	detailed_desc = "Tactical reserves undergo emergency rapid mobilisation to bolster your forces. All currently dead players on your team can immediately respawn, if attrition is available."
	ui_icon = "respawn"
	uses = 1
	cost = 5
	asset_flags = ASSET_ACTIVATED_EFFECT|ASSET_SL_AVAILABLE

/datum/campaign_asset/tactical_reserves/activation_checks()
	. = ..()
	if(.)
		return
	var/datum/game_mode/hvh/campaign/mode = SSticker.mode
	var/datum/campaign_mission/current_mission = mode.current_mission
	if(current_mission.mission_state != MISSION_STATE_ACTIVE) //we specifically want ONLY the active state, not the new state
		to_chat(faction.faction_leader, span_warning("任务开始前无法呼叫战术预备队！"))
		return TRUE

/datum/campaign_asset/tactical_reserves/activated_effect()
	var/datum/game_mode/hvh/campaign/mode = SSticker.mode
	for(var/mob/candidate AS in GLOB.player_list)
		if(candidate.faction != faction.faction)
			continue
		if(candidate.stat != DEAD)
			continue
		mode.player_death_times -= candidate.ckey
		deltimer(mode.respawn_timers[candidate.ckey])
		mode.respawn_timers[candidate.ckey] = null
		mode.player_respawn(candidate)

		to_chat(candidate, "<span class='warning'>战术预备队已动员。如果可能，你现在可以立即重生。<spawn>")
		candidate.playsound_local(null, 'sound/ambience/votestart.ogg', 50)


