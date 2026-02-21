#define DOOR_FLAG_OPEN_ONLY (1 << 0)

/obj/machinery/button
	name = "按钮"
	desc = "一个遥控开关。"
	icon = 'icons/obj/machines/buttons.dmi'
	icon_state = "doorctrl"
	power_channel = ENVIRON
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 5
	soft_armor = list(MELEE = 50, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 10, BIO = 100, FIRE = 90, ACID = 70)

	layer = ABOVE_MOB_LAYER
	var/id = null
	var/next_activate = 0

	var/device_type = null
	var/obj/item/assembly/device

/obj/machinery/button/Initialize(mapload, ndir)
	. = ..()
	if(!device && device_type)
		device = new device_type(src)
	setup_device()

/obj/machinery/button/proc/setup_device()
	if(id && istype(device, /obj/item/assembly/control))
		var/obj/item/assembly/control/control_device = device
		control_device.id = id

/obj/machinery/button/indestructible
	resistance_flags = RESIST_ALL


/obj/machinery/button/Initialize(mapload, ndir = 0)
	. = ..()
	setDir(ndir)
	pixel_x = ( (dir & 3) ? 0 : (dir == 4 ? -24 : 24) )
	pixel_y = ( (dir & 3) ? (dir == 1 ? -24 : 24) : 0 )
	update_icon()


/obj/machinery/button/update_icon_state()
	. = ..()
	if(machine_stat & (NOPOWER|BROKEN))
		icon_state = "[initial(icon_state)]-p"
	else
		icon_state = initial(icon_state)


/obj/machinery/button/attack_ai(mob/user)
	return attack_hand(user)


/obj/machinery/button/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	if((machine_stat & (NOPOWER|BROKEN)))
		return

	if(!allowed(user))
		to_chat(user, span_danger("访问被拒绝"))
		flick("[initial(icon_state)]-denied", src)
		return

	use_power(active_power_usage)
	icon_state = "[initial(icon_state)]1"

	device?.pulsed()

	pulsed()

	addtimer(CALLBACK(src, TYPE_PROC_REF(/atom/movable, update_icon)), 1.5 SECONDS)


/obj/machinery/button/proc/pulsed()
	if(next_activate > world.time)
		return FALSE
	next_activate = world.time + 3 SECONDS
	return TRUE

/obj/machinery/button/door
	name = "门按钮"
	desc = "一扇门的远程控制开关。"
	var/specialfunctions = NONE


/obj/machinery/button/door/indestructible
	resistance_flags = RESIST_ALL


/obj/machinery/button/door/pulsed()
	. = ..()
	if(!.)
		return
	var/openclose
	for(var/obj/machinery/door/poddoor/M in GLOB.machines)
		if(M.id != src.id)
			continue
		if(!specialfunctions)
			openclose = M.density
		else if(CHECK_BITFIELD(specialfunctions, DOOR_FLAG_OPEN_ONLY))
			openclose = TRUE
		if(openclose)
			M.open()
			continue
		M.close()


/obj/machinery/button/door/open_only
	name = "开启按钮"
	desc = "打开与其链接的任何东西。不会关闭。小心你释放的东西。"
	specialfunctions = DOOR_FLAG_OPEN_ONLY

/obj/machinery/button/door/open_only/Initialize(mapload)
	. = ..()
	switch(dir)
		if(NORTH)
			pixel_y = -12
		if(SOUTH)
			pixel_y = 29
		if(EAST)
			pixel_x = -21
		if(WEST)
			pixel_x = 21


/obj/machinery/button/door/open_only/landing_zone
	name = "封锁解除"
	id = "landing_zone"
	icon_state = "shutterctrl"
	use_power = NO_POWER_USE
	resistance_flags = RESIST_ALL
	req_one_access = list(ACCESS_MARINE_DROPSHIP)
	/// Has the shutters alarm been played?
	var/alarm_played = FALSE

/obj/machinery/button/door/open_only/landing_zone/Initialize(mapload)
	. = ..()
	var/area/area = get_area(src)
	area.area_flags |= MARINE_BASE

/obj/machinery/button/door/open_only/landing_zone/attack_hand(mob/living/user)
	if((machine_stat & (NOPOWER|BROKEN)))
		return
	#ifndef TESTING
	if(world.time < SSticker.round_start_time + SSticker.mode.deploy_time_lock)
		to_chat(user, span_notice("隔离闸门还不能开启！"))
		return
	#endif
	if(!allowed(user))
		to_chat(user, span_danger("访问被拒绝"))
		flick("[initial(icon_state)]-denied", src)
		return
	if(alarm_played)
		flick("[initial(icon_state)]-denied", src)
		return
	use_power(active_power_usage)
	icon_state = "[initial(icon_state)]1"

	alarm_played = TRUE
	playsound_z(z, 'sound/effects/shutters_alarm.ogg', 15) // woop woop, shutters opening.
	log_game("[key_name(user)] has opened the LZ Containment Shutters.")
	addtimer(CALLBACK(src, TYPE_PROC_REF(/atom/movable, update_icon)), 1.5 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(pulsed)), 185)

/obj/machinery/button/door/open_only/landing_zone/pulsed()
	. = ..()
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_OPEN_SHUTTERS_EARLY)

/obj/machinery/button/door/open_only/landing_zone/lz2
	id = "landing_zone_2"


/obj/machinery/driver_button
	name = "质量驱动器按钮"
	icon = 'icons/obj/objects.dmi'
	icon_state = "launcherbtt"
	desc = "质量加速器的远程控制开关。"
	var/id = null
	var/active = 0
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 4

/obj/machinery/ignition_switch
	name = "点火开关"
	icon = 'icons/obj/objects.dmi'
	icon_state = "launcherbtt"
	desc = "用于遥控点火器的开关。"
	var/id = null
	var/active = 0
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 4

/obj/machinery/flasher_button
	name = "闪光弹按钮"
	desc = "用于遥控安装式闪光器的开关。"
	icon = 'icons/obj/objects.dmi'
	icon_state = "launcherbtt"
	var/id = null
	var/active = 0
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 4

/obj/machinery/crema_switch
	desc = "烧吧，宝贝，烧吧！"
	name = "焚化炉点火器"
	icon = 'icons/obj/power.dmi'
	icon_state = "crema_switch"
	anchored = TRUE
	req_access = list(ACCESS_MARINE_MEDBAY)
	var/on = 0
	var/area/area = null
	var/otherarea = null
	var/id = 1

/obj/machinery/medical_help_button
	name = "需要医疗救助"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "doorctrl0"
	desc = "一个用于通知医生你需要协助的按钮。"
	var/active = FALSE
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 4
	var/obj/item/radio/radio

/obj/machinery/medical_help_button/Initialize(mapload)
	. = ..()
	radio = new(src)

/obj/machinery/medical_help_button/Destroy()
	QDEL_NULL(radio)
	return ..()

/obj/machinery/medical_help_button/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(!istype(user))
		return
	if(machine_stat & (NOPOWER|BROKEN))
		to_chat(user, span_warning("[src]似乎无法运作。"))
		return
	if(active)
		return
	use_power(active_power_usage)
	icon_state = "doorctrl1"

	radio.talk_into(src, "<b>[user.name] is requesting medical attention at: [get_area(src)].</b>", RADIO_CHANNEL_MEDICAL)
	visible_message("保持冷静，很快会有人来帮你。")

	active = TRUE
	addtimer(CALLBACK(src, PROC_REF(icon_update_check)), 10 SECONDS)

/obj/machinery/medical_help_button/proc/icon_update_check()
	active = FALSE
	update_icon()

/obj/machinery/medical_help_button/update_icon_state()
	. = ..()
	if(machine_stat & NOPOWER)
		icon_state = "doorctrl-p"
	else
		icon_state = "doorctrl0"

/obj/machinery/button/valhalla
	resistance_flags = INDESTRUCTIBLE
	///The mob created by the spawner
	var/mob/living/carbon/human/linked
	///What spawner landmark is linked with this spawner (this has to be matching with the landmark)
	var/link

/obj/machinery/button/valhalla/Destroy()
	linked = null
	return ..()

/obj/machinery/button/valhalla/marine_button
	name = "异形生成器"

/obj/machinery/button/valhalla/marine_button/attack_hand(mob/living/user)
	var/xeno_wanted = tgui_input_list(user, "What xeno do you want to spawn?", "Xeno spawn", GLOB.all_xeno_types)
	if(!xeno_wanted)
		return
	QDEL_NULL(linked)
	if(!get_turf(GLOB.valhalla_button_spawn_landmark[link]))
		to_chat(user, span_warning("发生错误，请向程序员反馈。"))
		CRASH("Valhalla button linked with an improper landmark: button ID: [link].")
	linked = new xeno_wanted(get_turf(GLOB.valhalla_button_spawn_landmark[link]))

/obj/machinery/button/valhalla/marine_spawner
	name = "陆战队生成器"

/// Generates a list of jobs datums to spawn on a mob
/obj/machinery/button/valhalla/marine_spawner/proc/spawn_humans(mob/living/user)
	var/list/job_outfits = list()
	for(var/type in subtypesof(/datum/outfit/job))
		if(istype(type, /datum/outfit))
			continue
		var/datum/outfit/out = type
		job_outfits[initial(out.name)] = out

	job_outfits = sortList(job_outfits)
	job_outfits.Insert(1, "Naked")

	var/datum/outfit/selected_outfit = tgui_input_list(user, "Which outfit do you want the human to wear?", "Human spawn", job_outfits)
	if(!selected_outfit)
		return

	QDEL_NULL(linked)
	if(!get_turf(GLOB.valhalla_button_spawn_landmark[link]))
		to_chat(user, span_warning("发生错误，请向程序员反馈。"))
		CRASH("Valhalla button linked with an improper landmark: button ID: [link].")
	linked = new /mob/living/carbon/human(get_turf(GLOB.valhalla_button_spawn_landmark[link]))
	if(selected_outfit == "Naked" || !selected_outfit)
		return
	linked.equipOutfit(job_outfits[selected_outfit], TRUE)

/obj/machinery/button/valhalla/marine_spawner/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	spawn_humans(xeno_attacker)

/obj/machinery/button/valhalla/marine_spawner/attack_hand(mob/living/user)
	spawn_humans(user)
	var/list/item_blacklist = typecacheof(list(
		/obj/item/supplytablet,
		/obj/item/radio/headset,
	))

	if(!linked)
		return

	for(var/obj/item/item in linked.contents)
		if(item.type in item_blacklist)
			qdel(item) // Prevents blacklisted items from being spawned, like ASRS tablets and headsets

/obj/machinery/button/valhalla/vehicle_button
	name = "载具生成器"

/// Generates a list of vehicles to spawn
/obj/machinery/button/valhalla/vehicle_button/proc/spawn_vehicles(mob/living/user)
	var/list/spawnable_vehicles = list(
		/obj/vehicle/sealed/armored/multitile,
		/obj/vehicle/sealed/armored/multitile/apc,
		/obj/vehicle/sealed/armored/multitile/som_tank,
		/obj/vehicle/sealed/armored/multitile/campaign,
		/obj/vehicle/sealed/armored/multitile/icc_lvrt,
		/obj/vehicle/sealed/mecha/combat/greyscale/recon,
		/obj/vehicle/sealed/mecha/combat/greyscale/assault,
		/obj/vehicle/sealed/mecha/combat/greyscale/vanguard,
	)

	var/selected_vehicle = tgui_input_list(user, "Which vehicle do you want to spawn?", "Vehicle spawn", spawnable_vehicles)
	if(!selected_vehicle)
		return

	QDEL_NULL(linked)
	if(!get_turf(GLOB.valhalla_button_spawn_landmark[link]))
		to_chat(user, span_warning("发生错误，请向程序员反馈。"))
		CRASH("Valhalla button linked with an improper landmark: button ID: [link].")
	linked = new selected_vehicle(get_turf(GLOB.valhalla_button_spawn_landmark[link]))

/obj/machinery/button/valhalla/vehicle_button/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	spawn_vehicles(xeno_attacker)

/obj/machinery/button/valhalla/vehicle_button/attack_hand(mob/living/user)
	spawn_vehicles(user)

#undef DOOR_FLAG_OPEN_ONLY
