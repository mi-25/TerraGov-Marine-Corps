#define NUKE_STAGE_NONE 0
#define NUKE_STAGE_COVER_REMOVED 1
#define NUKE_STAGE_COVER_OPENED 2
#define NUKE_STAGE_SEALANT_OPEN 3
#define NUKE_STAGE_UNWRENCHED 4
#define NUKE_STAGE_BOLTS_REMOVED 5

/obj/machinery/nuclearbomb
	name = "核裂变炸药"
	desc = "你最好别待在这儿看它是不是已经激活了。"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "nuclearbomb0"
	density = TRUE
	anchored = TRUE
	coverage = 20
	atom_flags = CRITICAL_ATOM
	resistance_flags = RESIST_ALL|PORTAL_IMMUNE
	layer = BELOW_MOB_LAYER
	interaction_flags = INTERACT_MACHINE_TGUI
	var/deployable = TRUE
	var/extended = FALSE
	var/lighthack = FALSE
	///Time to start the timer on
	var/time = 360 SECONDS
	///Min time for the nuke timer
	var/timemin = 360 SECONDS
	///Max time for the nuke timer
	var/timemax = 1200 SECONDS
	var/timer_enabled = FALSE
	///ID of timer
	var/timer
	var/safety = TRUE
	var/exploded = FALSE
	var/removal_stage = NUKE_STAGE_NONE
	use_power = NO_POWER_USE
	var/obj/effect/countdown/nuclearbomb/countdown

	var/has_auth
	var/obj/item/disk/nuclear/red/r_auth
	var/obj/item/disk/nuclear/green/g_auth
	var/obj/item/disk/nuclear/blue/b_auth

/obj/machinery/nuclearbomb/Initialize(mapload)
	. = ..()
	GLOB.nuke_list += src
	countdown = new(src)
	name = "[initial(name)] ([UNIQUEID])"
	update_minimap_icon()
	RegisterSignal(SSdcs, COMSIG_GLOB_DROPSHIP_HIJACKED, PROC_REF(disable_on_hijack))

/obj/machinery/nuclearbomb/Destroy()
	if(timer_enabled)
		disable("[src] deletion" )
	GLOB.nuke_list -= src
	QDEL_NULL(countdown)
	return ..()

///Enables nuke timer
/obj/machinery/nuclearbomb/proc/enable(reason)
	GLOB.active_nuke_list += src
	countdown.start()
	notify_ghosts("The [src] has been enabled, it has [round(time MILLISECONDS)] seconds on the timer.", source = src, action = NOTIFY_ORBIT, extra_large = TRUE)
	timer_enabled = TRUE
	timer = addtimer(CALLBACK(src, PROC_REF(explode)), time, TIMER_STOPPABLE)
	update_minimap_icon()
	// The timer is needed for when the signal is sent
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_NUKE_START, src)
	log_game("[reason] has enabled the nuke at [AREACOORD(src)]")
	message_admins("[reason] has enabled the nuke at [ADMIN_VERBOSEJMP(src)]")
	global_rally_zombies(src, TRUE)

///Handles if the nuke is specifically defused
/obj/machinery/nuclearbomb/proc/do_defuse(mob/user)
	disable(key_name(user))
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_NUKE_DEFUSED, src, user)

	user.visible_message(span_boldwarning("[user] 解除了核弹的激活状态"),
	"You disabled the nuke.")

///Disables nuke timer
/obj/machinery/nuclearbomb/proc/disable(reason)
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_NUKE_STOP, src)
	countdown.stop()
	GLOB.active_nuke_list -= src
	if(timer_enabled)
		log_game("[reason] has disabled the nuke at [AREACOORD(src)]")
		message_admins("[reason] has disabled the nuke at [ADMIN_VERBOSEJMP(src)]") //Incase disputes show up about marines griefing and the like.
	timer_enabled = FALSE
	if(timer)
		deltimer(timer)
		timer = null
	update_minimap_icon()

///Handles the boom
/obj/machinery/nuclearbomb/proc/explode()
	disable("[src] explosion")

	if(safety)
		return
	if(exploded)
		return
	exploded = TRUE
	safety = TRUE
	if(!lighthack)
		icon_state = "nuclearbomb3"

	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_NUKE_EXPLODED, z)
	return TRUE

/// Permanently disables this nuke, for use on hijack
/obj/machinery/nuclearbomb/proc/disable_on_hijack()
	desc += " A strong interference renders this inoperable."
	machine_stat |= BROKEN
	anchored = FALSE
	if(timer_enabled)
		disable("Alamo hijack")

/obj/machinery/nuclearbomb/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return
	if(!extended)
		return
	if(!istype(I, /obj/item/disk/nuclear))
		return
	if(!user.transferItemToLoc(I, src))
		return
	switch(I.type)
		if(/obj/item/disk/nuclear/red)
			r_auth = I
		if(/obj/item/disk/nuclear/green)
			g_auth = I
		if(/obj/item/disk/nuclear/blue)
			b_auth = I
	if(r_auth && g_auth && b_auth)
		has_auth = TRUE

/obj/machinery/nuclearbomb/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(xeno_attacker.status_flags & INCORPOREAL)
		return FALSE

	if(!timer_enabled)
		to_chat(xeno_attacker, span_warning("\The [src] 正酣睡着。我们最好别打扰它。"))
		return

	xeno_attacker.visible_message(span_boldwarning("[xeno_attacker] 开始小心翼翼地斩击核弹。"),
	"You start slashing delicately at the nuke.")
	if(!do_after(xeno_attacker, 5 SECONDS, NONE, src, BUSY_ICON_DANGER, BUSY_ICON_HOSTILE))
		return
	do_defuse(xeno_attacker)

/obj/machinery/nuclearbomb/can_interact(mob/user)
	. = ..()
	if(!.)
		return FALSE

	if(!extended)
		return FALSE

	if(machine_stat & BROKEN)
		return FALSE

	return TRUE

/obj/machinery/nuclearbomb/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	if(extended)
		return

	if(!deployable)
		return

	if(!do_after(user, 3 SECONDS, NONE, src, BUSY_ICON_BUILD))
		return

	if(removal_stage < NUKE_STAGE_BOLTS_REMOVED)
		if(anchored)
			visible_message(span_warning("随着一声响亮的哔声，[src]的显示面板上灯光闪烁。它启动了！"))
		else
			anchored = TRUE
			visible_message(span_warning("随着一声钢铁的脆响，螺栓从[src]中滑出，将其牢牢固定在地板上！"))
	else
		visible_message(span_warning("\The [src]发出令人极度不适的碎裂声。看起来固定螺栓已经被切断了。"))
	if(!lighthack)
		flick("nuclearbombc", src)
		icon_state = "nuclearbomb1"

	extended = TRUE

/obj/machinery/nuclearbomb/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "NuclearBomb", name)
		ui.open()

/obj/machinery/nuclearbomb/ui_data(mob/user)
	var/list/data = list()

	data["time"] = round(time MILLISECONDS)
	data["time_left"] = get_time_left()
	data["timer_enabled"] = timer_enabled
	data["has_auth"] = has_auth
	data["safety"] = safety
	data["anchor"] = anchored
	data["red"] = r_auth
	data["green"] = g_auth
	data["blue"] = b_auth
	data["current_site"] = get_area_name(get_area(src))
	data["nuke_ineligible_site"] = GLOB.nuke_ineligible_site
	var/safe_text = (safety) ? "Safe" : "Engaged"
	var/status = "Unknown"

	if(has_auth)
		if(timer_enabled)
			status = "Func/Set-[safe_text]"
		else
			status = "Functional-[safe_text]"
	else
		if(timer_enabled)
			status = "Set-[safe_text]"
		else
			status = "Auth. S1-[safe_text]"

	if(timer && timeleft(timer) <= 5 SECONDS)
		status = "Initializing nuclear explosion. Have a nice day :)"

	data["status"] = status

	return data

/obj/machinery/nuclearbomb/ui_act(action, list/params)
	. = ..()
	if(.)
		return
	var/mob/user = usr
	switch(action)
		if("toggle_timer")
			if(!has_auth)
				return
			toggle_timer(user)
		if("change_time")
			if(!has_auth)
				return
			if(!isnum(params["seconds"]))
				CRASH("non-number passed")
			change_time(params["seconds"] SECONDS)
		if("toggle_safety")
			if(!has_auth)
				return
			toggle_safety(user)
		if("toggle_anchor")
			if(!has_auth)
				return
			toggle_anchor(user)
		if("toggle_disk")
			toggle_disk(user, params["disktype"])

///Toggles the timer on or off
/obj/machinery/nuclearbomb/proc/toggle_timer(mob/user)
	if(exploded)
		return
	if(safety)
		balloon_alert(user, "保险还开着！")
		return
	if(!anchored)
		balloon_alert(user, "锚点未设置！")
		return
	var/area/area = get_area(src)
	if(get_area_name(area) in GLOB.nuke_ineligible_site)
		balloon_alert(user, "无效引爆地点！")
		return
	if(!timer_enabled)
		enable(key_name(user))
		balloon_alert(user, "计时器已启动")
	else
		disable(key_name(user))
		balloon_alert(user, "计时器已停止")

	if(!lighthack)
		icon_state = (timer_enabled) ? "nuclearbomb2" : "nuclearbomb1"

///Modifies the nuke timer
/obj/machinery/nuclearbomb/proc/change_time(change)
	if(!timer_enabled)
		time = clamp(time + change, timemin, timemax)

///Toggles the safety on or off
/obj/machinery/nuclearbomb/proc/toggle_safety(mob/user)
	safety = !safety
	if(safety)
		balloon_alert(user, "保险已开启")
		disable(key_name(user))
	else
		balloon_alert(user, "保险关闭")

///Toggles the anchor bolts on or off
/obj/machinery/nuclearbomb/proc/toggle_anchor(mob/user)
	if(removal_stage == NUKE_STAGE_BOLTS_REMOVED)
		anchored = FALSE
		visible_message(span_warning("\The [src] 发出极其难听的嘎吱声。看起来固定螺栓已经被切断了。"))
		return
	if(istype(get_area(loc), /area/shuttle))
		balloon_alert(user, "位置不合适！")
		return

	anchored = !anchored
	if(anchored)
		balloon_alert(user, "已固定")
		visible_message(span_warning("随着一声钢铁般的脆响，螺栓从[src]中滑出，将其锚固在地板上。"))
		log_game("[user] has anchored the nuke at [AREACOORD(src)]")
	else
		balloon_alert(user, "未固定")
		visible_message(span_warning("固定螺栓滑回[src]的深处。"))
		disable(key_name(user))
		log_game("[user] has unanchored the nuke at [AREACOORD(src)]")

///Handles disk insertion and removal
/obj/machinery/nuclearbomb/proc/toggle_disk(mob/user, disk_colour)
	var/disk_type
	var/obj/item/disk/nuclear/disk_slot
	switch(disk_colour)
		if("red")
			disk_slot = r_auth
			disk_type = /obj/item/disk/nuclear/red
		if("green")
			disk_slot = g_auth
			disk_type = /obj/item/disk/nuclear/green
		if("blue")
			disk_slot = b_auth
			disk_type = /obj/item/disk/nuclear/blue

	if(disk_slot)
		has_auth = FALSE
		switch(disk_colour)
			if("red")
				user.put_in_hands(r_auth)
				r_auth = null
			if("green")
				user.put_in_hands(g_auth)
				g_auth = null
			if("blue")
				user.put_in_hands(b_auth)
				b_auth = null
	else
		var/obj/item/I = user.get_active_held_item()
		if(!istype(I, disk_type))
			return
		if(!user.drop_held_item())
			return
		I.forceMove(user)
		switch(disk_colour)
			if("red")
				r_auth = I
			if("green")
				g_auth = I
			if("blue")
				b_auth = I
		if(r_auth && g_auth && b_auth)
			has_auth = TRUE

///Returns time left on the nuke in seconds
/obj/machinery/nuclearbomb/proc/get_time_left()
	return timer ? round(timeleft(timer) MILLISECONDS) : round(time MILLISECONDS)

///Change minimap icon if its on or off
/obj/machinery/nuclearbomb/proc/update_minimap_icon()
	SSminimaps.remove_marker(src)
	SSminimaps.add_marker(src, MINIMAP_FLAG_ALL, image('icons/UI_icons/map_blips_large.dmi', null, "nuke[timer_enabled ? "_on" : "_off"]", MINIMAP_LOCATOR_LAYER))

#undef NUKE_STAGE_NONE
#undef NUKE_STAGE_COVER_REMOVED
#undef NUKE_STAGE_COVER_OPENED
#undef NUKE_STAGE_SEALANT_OPEN
#undef NUKE_STAGE_UNWRENCHED
#undef NUKE_STAGE_BOLTS_REMOVED
