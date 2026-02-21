/datum/action/observer_action/can_use_action(silent, override_flags, selecting)
	. = ..()
	if(!.)
		return FALSE
	if(!isobserver(owner))
		return FALSE
	return TRUE


/datum/action/observer_action/crew_manifest
	name = "显示船员名单"
	action_icon = 'icons/obj/items/books.dmi'
	action_icon_state = "book"


/datum/action/observer_action/crew_manifest/action_activate()
	if(!can_use_action())
		return FALSE
	var/mob/dead/observer/O = owner
	O.view_manifest()


/datum/action/observer_action/show_hivestatus
	name = "显示蜂巢状态"
	action_icon = 'icons/Xeno/actions/queen.dmi'
	action_icon_state = "watch_xeno"


/datum/action/observer_action/show_hivestatus/action_activate()
	if(!can_use_action())
		return FALSE
	check_hive_status(usr)

/datum/action/observer_action/take_ssd_mob
	name = "接管SSD角色"
	action_icon_state = "take_ssd"

/datum/action/observer_action/take_ssd_mob/action_activate()
	var/mob/dead/observer/dead_owner = owner

	if(!GLOB.ssd_posses_allowed)
		to_chat(owner, span_warning("接管SSD角色当前已禁用。"))
		return

	if(GLOB.key_to_time_of_death[owner.key] + TIME_BEFORE_TAKING_BODY > world.time && !dead_owner.started_as_observer)
		to_chat(owner, span_warning("你死亡时间过短，无法接管新的角色。"))
		return

	var/list/mob/living/free_ssd_mobs = list()
	for(var/mob/living/ssd_mob AS in GLOB.ssd_living_mobs)
		if(is_centcom_level(ssd_mob.z) || ssd_mob.afk_status == MOB_RECENTLY_DISCONNECTED)
			continue
		free_ssd_mobs += ssd_mob

	if(!length(free_ssd_mobs))
		to_chat(owner, span_warning("没有处于SSD状态的生物。"))
		return FALSE

	var/mob/living/new_mob = tgui_input_list(owner, "Pick a mob", "Available Mobs", free_ssd_mobs)
	if(!istype(new_mob) || !owner.client)
		return FALSE

	if(new_mob.stat == DEAD)
		to_chat(owner, span_warning("如果该生物已死亡，则无法加入。"))
		return FALSE
	if(tgui_alert(owner, "Are you sure you want to take " + new_mob.real_name +" ("+new_mob.job.title+")?", "Take SSD mob", list("Yes", "No",)) != "Yes")
		return

	if(HAS_TRAIT(new_mob, TRAIT_POSSESSING))
		to_chat(owner, span_warning("该生物当前正附身于另一个生物。"))
		return FALSE

	if(new_mob.client)
		to_chat(owner, span_warning("该目标已被占用。"))
		return FALSE

	if(new_mob.afk_status == MOB_RECENTLY_DISCONNECTED) //We do not want to occupy them if they've only been gone for a little bit.
		to_chat(owner, span_warning("该玩家离开时间不够长。请再等待 [round(timeleft(new_mob.afk_timer_id) * 0.1)] 秒。"))
		return FALSE

	if(is_banned_from(owner.ckey, new_mob?.job?.title))
		to_chat(owner, span_warning("你已被禁止担任[new_mob?.job.title]职位。"))
		return

	if(!ishuman(new_mob))
		message_admins(span_adminnotice("[owner.key] took control of [new_mob.name] as [new_mob.p_they()] was ssd."))
		log_admin("[owner.key] took control of [new_mob.name] as [new_mob.p_they()] was ssd.")
		new_mob.transfer_mob(owner)
		return

	if((!(owner.client?.prefs?.be_special & BE_SSD_RANDOM_NAME)) && (CONFIG_GET(flag/prevent_dupe_names) && GLOB.real_names_joined.Find(owner.client.prefs.real_name)))
		to_chat(usr, span_warning("已有人使用此角色名加入本局游戏。请前往'偏好设置'标签页下的'游戏偏好'中，更改你的角色/名称。"))
		return

	message_admins(span_adminnotice("[owner.key] took control of [new_mob.name] as [new_mob.p_they()] was ssd."))
	log_admin("[owner.key] took control of [new_mob.name] as [new_mob.p_they()] was ssd.")
	var/mob/living/carbon/human/new_human = new_mob
	var/datum/job/j = new_human.job
	var/datum/outfit/job/o = j.outfit
	if(owner.client?.prefs?.be_special & BE_SSD_RANDOM_NAME)
		new_human.fully_replace_character_name(new_human.real_name, new_human.species.random_name(new_human.gender))
		o.handle_id(new_human)
		new_human.transfer_mob(owner)
		return
	new_human.transfer_mob(owner)
	new_human.on_transformation()
	o.handle_id(new_human)

//respawn button for campaign gamemode
/datum/action/observer_action/campaign_respawn
	name = "重生"
	action_icon_state = "respawn"

/datum/action/observer_action/campaign_respawn/action_activate()
	var/datum/game_mode/mode = SSticker.mode
	if(!mode)
		to_chat(usr, span_warning("回合尚未准备就绪！"))
		return

	mode.player_respawn(owner)
