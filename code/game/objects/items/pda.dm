/obj/item/pda
	name = "PDA"
	desc = "一部 AgyeI-12 个人数据助手，一种混合用途的移动设备，同时包含神经接口模块。由大型企业像糖果一样分发给公司雇员，是市场上最常见、最可靠的个人数据助手。"
	icon = 'icons/obj/items/pda.dmi'
	icon_state = "pda_white"
	///Text to say when the pda is interacted with
	var/list/audio_log
	///Overlay for the pda if it has an audio log
	var/screen_overlay = "pda_on"
	var/dialog_delay = 1.5 SECONDS

/obj/item/pda/Initialize(mapload)
	. = ..()
	if(audio_log)
		update_appearance(UPDATE_OVERLAYS)

/obj/item/pda/update_overlays()
	. = ..()
	. += mutable_appearance(icon, screen_overlay)
	. += emissive_appearance(icon, screen_overlay, src)

/obj/item/pda/attack_self(mob/user)
	. = ..()
	play_log(user)

///Checks cooldown and plays the audio log
/obj/item/pda/proc/play_log(mob/user)
	if(!audio_log)
		return
	if(TIMER_COOLDOWN_RUNNING(src, COOLDOWN_PDA_PLAY))
		user.balloon_alert(user, "还在玩！")
		return

	balloon_alert_to_viewers("开始记录")
	if(SStts.tts_enabled && !voice)
		voice = pick(SStts.available_speakers)
	for(var/i = 1 to length(audio_log))
		addtimer(CALLBACK(src, PROC_REF(say_dialog), audio_log[i]), dialog_delay * i)

	TIMER_COOLDOWN_START(src, COOLDOWN_PDA_PLAY, 5 SECONDS)

/obj/item/pda/proc/say_dialog(text)
	say(text)

/obj/item/pda/red
	icon_state = "pda_red"

/obj/item/pda/green
	icon_state = "pda_green"

/obj/item/pda/blue
	icon_state = "pda_blue"

/obj/item/pda/purple
	icon_state = "pda_purple"

/obj/item/pda/large
	name = "平板电脑 PDA"
	desc = "一部 AgyeI-35 TABPDA，一款混合用途的移动设备，同时包含神经接口模块。这是标准 PDA 的更大尺寸版本，以便于使用。"
	icon_state = "pda_large_white"
	screen_overlay = "pda_large_on"

/obj/item/pda/large/red
	icon_state = "pda_large_red"

/obj/item/pda/large/green
	icon_state = "pda_large_green"

/obj/item/pda/large/blue
	icon_state = "pda_large_blue"

/obj/item/pda/large/purple
	icon_state = "pda_large_purple"
