/mob/living/silicon/ai/verb/ai_network_change()
	set category = "Silicon"
	set name = "Jump To Network"

	if(incapacitated())
		return

	unset_interaction()
	cameraFollow = null

	var/new_network = tgui_input_list(src, "Which network would you like to view?", "Jump To Network", available_networks)
	if(!new_network)
		return

	if(!eyeobj)
		view_core()
		return

	for(var/i in GLOB.cameranet.cameras)
		var/obj/machinery/camera/C = i

		if(!C.can_use())
			continue

		if(new_network in C.network)
			eyeobj.setLoc(get_turf(C))
			break

	to_chat(src, span_notice("已切换至'[uppertext(new_network)]'摄像头网络。"))



/mob/living/silicon/ai/verb/display_status()
	set category = "Silicon"
	set name = "Display Status"

	if(incapacitated())
		return

	var/list/ai_emotions = list("Very Happy", "Happy", "Neutral", "Unsure", "Confused", "Sad", "BSOD", "Blank", "Problems?", "Awesome", "Facepalm", "Thinking", "Friend Computer", "Blue Glow", "Red Glow")
	var/emote = tgui_input_list(usr, "Please, select a status!", "AI Status", ai_emotions)
	if(!emote)
		return

	for(var/obj/machinery/status_display/ai/SD AS in GLOB.ai_status_displays)
		SD.emotion = emote
		SD.update()

	if(emote == "Friend Computer")
		var/datum/radio_frequency/frequency = SSradio.return_frequency(FREQ_STATUS_DISPLAYS)

		if(!frequency)
			return

		var/datum/signal/status_signal = new(list("command" = "friendcomputer"))
		frequency.post_signal(src, status_signal)

	to_chat(src, span_notice("显示状态已更改为：[emote]"))


/mob/living/silicon/ai/verb/change_hologram()
	set category = "Silicon"
	set name = "Change Hologram"

	if(incapacitated())
		return

	var/hologram = tgui_alert(src, "Would you like to select a hologram based on a crew member, an animal, or switch to a unique avatar?", "Hologram", list("Crew Member", "Unique", "Animal"))
	switch(hologram)
		if("Crew Member")
			var/list/personnel_list = list()

			for(var/datum/data/record/t in GLOB.datacore.general)
				personnel_list["[t.fields["name"]]: [t.fields["rank"]]"] = t.fields["photo_front"]

			if(!length(personnel_list))
				to_chat(src, span_warning("未找到合适记录。中止操作。"))
				return

			hologram = tgui_input_list(src, "Select a crew member:", null,personnel_list)
			var/icon/character_icon = personnel_list[hologram]
			if(!character_icon)
				return

			holo_icon = getHologramIcon(icon(character_icon))

		if("Animal")
			var/list/icon_list = list(
			"bear" = 'icons/mob/animal.dmi',
			"carp" = 'icons/mob/animal.dmi',
			"chicken_brown" = 'icons/mob/animal.dmi',
			"corgi" = 'icons/mob/pets.dmi',
			"cow" = 'icons/mob/animal.dmi',
			"crab" = 'icons/mob/animal.dmi',
			"fox" = 'icons/mob/pets.dmi',
			"goat" = 'icons/mob/animal.dmi',
			"cat" = 'icons/mob/pets.dmi',
			"cat2" = 'icons/mob/pets.dmi',
			"parrot_fly" = 'icons/mob/animal.dmi',
			"pug" = 'icons/mob/pets.dmi'
			)

			hologram = tgui_input_list(src, "Please select a hologram:", null, icon_list)
			if(!hologram)
				return

			holo_icon = getHologramIcon(icon(icon_list[hologram], hologram))

		if("Unique")
			var/list/icon_list = list(
				"default" = 'icons/mob/ai.dmi',
				"floating face" = 'icons/mob/ai.dmi',
				"xeno_queen" = 'icons/mob/ai.dmi',
				"void_horror" = 'icons/mob/ai.dmi',
				"carp" = 'icons/mob/ai.dmi'
				)

			hologram = tgui_input_list(src, "Please select a hologram:", null, icon_list)
			if(!hologram)
				return

			holo_icon = getHologramIcon(icon(icon_list[hologram], hologram))

		else
			return

	to_chat(src, span_notice("全息影像已更改为：[hologram]"))


/mob/living/silicon/ai/verb/toggle_sensors()
	set category = "Silicon"
	set name = "Toggle Sensors"

	if(incapacitated())
		return

	toggle_sensor_mode()


/mob/living/silicon/ai/verb/make_announcement()
	set category = "Silicon"
	set name = "Make Announcement"

	if(incapacitated())
		return

	if(last_announcement + 60 SECONDS > world.time)
		to_chat(src, span_warning("请等待一段时间后再进行广播。"))
		return

	var/input = stripped_input(usr, "Please write a message to announce to the station crew.", "Announcement")
	if(!input || incapacitated())
		return

	last_announcement = world.time
	priority_announce(input, "[src] Announcement", sound = 'sound/AI/aireport.ogg')


/mob/living/silicon/ai/verb/ai_core_display()
	set category = "Silicon"
	set name = "AI Core Display"

	if(incapacitated())
		return

	var/list/iconstates = GLOB.ai_core_display_screens
	for(var/option in iconstates)
		if(option == "Random")
			iconstates[option] = image(icon = icon, icon_state = "ai-random")
			continue
		iconstates[option] = image(icon = icon, icon_state = resolve_ai_icon(option))

	view_core()

	var/ai_core_icon = tgui_input_list(src, "Choose your AI core display icon.", "AI Core Display", iconstates)
	if(!ai_core_icon || incapacitated())
		return

	icon_state = resolve_ai_icon(ai_core_icon)


/mob/living/silicon/ai/cancel_camera()
	set category = "Silicon"
	set name = "Cancel Camera View"

	view_core()


/mob/living/silicon/ai/verb/toggle_acceleration()
	set category = "Silicon"
	set name = "Toggle Camera Acceleration"

	if(incapacitated())
		return

	acceleration = !acceleration

	to_chat(src, span_notice("Camera acceleration has been [acceleration ? "enabled" : "disabled"]."))


/mob/living/silicon/ai/verb/radio_settings()
	set category = "Silicon"
	set name = "Radio Settings"

	if(incapacitated())
		return

	if(!radio)
		to_chat(src, span_warning("未检测到内置无线电。"))
		return

	to_chat(src, span_notice("正在访问内部无线电设置。"))
	radio.interact(src)


/mob/living/silicon/ai/verb/view_manifest()
	set category = "Silicon"
	set name = "View Crew Manifest"

	if(incapacitated())
		return

	var/dat = GLOB.datacore.get_manifest()

	var/datum/browser/popup = new(src, "manifest", "<div align='center'>Crew Manifest</div>", 370, 420)
	popup.set_content(dat)
	popup.open(FALSE)

/mob/living/silicon/ai/verb/toggle_anchor()
	set category = "Silicon"
	set name = "Toggle Floor Bolts"

	if(!isturf(loc)) // if their location isn't a turf
		return // stop
	if(stat == DEAD)
		return

	src.anchored = !anchored
	playsound(loc,'sound/mecha/mechanical_toggle.ogg', 20)


	to_chat(src, "<b>You are now [anchored ? "" : "un"]anchored.</b>")


/mob/living/silicon/ai/verb/show_laws()
	set category = "Silicon"
	set name = "Show Laws"

	if(incapacitated())
		return

	to_chat(src, span_notice("<b>遵守以下法则：</b>"))
	for(var/i in laws)
		to_chat(src, span_notice("[i]"))


/mob/living/silicon/ai/verb/state_laws()
	set category = "Silicon"
	set name = "State Laws"

	if(incapacitated())
		return

	if(tgui_alert(src, "Are you sure you want to announce your laws[radiomod ? " over the [radiomod] channel" : ""]?", "State Laws", list("Yes", "No")) != "Yes")
		return

	say("[radiomod] 当前生效的法律集：")

	var/delay = 1 SECONDS
	for(var/i in laws)
		addtimer(CALLBACK(src, TYPE_PROC_REF(/atom/movable, say), "[radiomod] [i]"), delay)
		delay += 1 SECONDS


/mob/living/silicon/ai/verb/set_autosay()
	set category = "Silicon"
	set name = "Set Announce Mode"

	if(incapacitated())
		return

	if(!radio)
		to_chat(src, "未检测到无线电。")
		return

	var/chan = tgui_input_list(usr, "Select a channel:", "", list("Default", "None") + radio.channels )
	if(!chan)
		return

	if(chan == "Default")
		radiomod = ";"
		chan += " ([radio.frequency])"
	else if(chan == "None")
		radiomod = ""
	else
		for(var/key in GLOB.department_radio_keys)
			if(GLOB.department_radio_keys[key] == chan)
				radiomod = ":" + key
				break

	to_chat(src, span_notice("Automatic announcements [chan == "None" ? "will not use the radio." : "set to [chan]."]"))


/mob/living/silicon/ai/verb/shutdown_systems()
	set category = "Silicon"
	set name = "Shutdown Systems"


	if(tgui_alert(src, "Do you want to shutdown your systems? WARNING: This will permanently put you out of your mob.", "Shutdown Systems", list("Yes", "No")) != "Yes")
		return

	if(tgui_alert(src, "Are you sure you want to shutdown your systems? You won't be able to return to your body. You can't change your mind so choose wisely!", "Shutdown systems confirm", list("Yes", "No")) != "Yes")
		return

	to_chat(src, span_notice("系统正在关闭..."))
	icon_state = "ai"

	log_game("[key_name(src)] has ghosted at [AREACOORD(src)].")
	message_admins("[ADMIN_TPMONTY(src)] has ghosted.")

	priority_announce("[src] has suffered an unexpected NTOS failure over its Logarithmic silicon backhaul functions and has been taken offline. An attempt to load a backup personality core will proceed shortly.", "AI NT-OS Critical Failure")
	ghostize(FALSE)
	offer_mob()

/mob/living/silicon/ai/up()
	set name = "Move Upwards"
	set category = "IC"

	if(eyeobj.zMove(UP, z_move_flags = ZMOVE_IGNORE_OBSTACLES|ZMOVE_FEEDBACK))
		to_chat(src, span_notice("你向上移动。"))

/mob/living/silicon/ai/down()
	set name = "Move Down"
	set category = "IC"

	if(eyeobj.zMove(DOWN, z_move_flags = ZMOVE_IGNORE_OBSTACLES|ZMOVE_FEEDBACK))
		to_chat(src, span_notice("你向下移动。"))
