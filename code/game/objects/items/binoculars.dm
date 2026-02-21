/obj/item/binoculars
	name = "望远镜"
	desc = "一副双筒望远镜。"
	icon = 'icons/obj/items/binoculars.dmi'
	icon_state = "binoculars"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/binoculars_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/binoculars_right.dmi',
	)
	atom_flags = CONDUCT
	force = 5
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 5
	throw_range = 15
	throw_speed = 3
	zoom_tile_offset = 11
	zoom_viewsize = 12

/obj/item/binoculars/attack_self(mob/user)
	if(user.interactee && istype(user.interactee, /obj/machinery/deployable))
		to_chat(user, span_warning("你现在无法使用这个！"))
		return
	if(!zoom && !(user.client.eye == user) && !(user.client.eye == user.loc))
		to_chat(user, span_warning("你正在查看其他东西。"))
		return
	zoom(user)

#define MODE_CAS 0
#define MODE_RAILGUN 1
#define MODE_ORBITAL 2
#define MODE_RANGE_FINDER 3

/obj/item/binoculars/tactical
	name = "一副战术望远镜"
	desc = "一副具备激光瞄准功能的双筒望远镜。独特动作可切换模式。Alt+点击以更改选定的已链接火炮。使用时Ctrl+点击以瞄准目标。Shift+点击以获取坐标。在轨道轰炸模式下进行激光指示时，Ctrl+Shift+点击以发射轨道轰炸。"
	icon_state = "range_finders"
	var/laser_cooldown = 0
	var/cooldown_duration = 200 //20 seconds
	var/obj/effect/overlay/temp/laser_target/laser
	var/target_acquisition_delay = 100 //10 seconds
	var/mode = 0  //Able to be switched between modes, 0 for cas laser, 1 for finding coordinates, 2 for directing railgun, 3 for orbital bombardment, 4 for range finding and mortar targeting.
	var/changable = TRUE //If set to FALSE, you can't toggle the mode between CAS and coordinate finding
	var/ob_fired = FALSE // If the user has fired the OB
	var/turf/current_turf // The target turf, used for OBs
	///Last stored turf targetted by rangefinders
	var/turf/targetturf
	///Linked mortar for remote targeting.
	var/list/obj/machinery/deployable/mortar/linked_mortars = list()
	/// Selected mortar index
	var/selected_mortar = 1

/obj/item/binoculars/tactical/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/binoculars/tactical/unique_action(mob/user)
	. = ..()
	toggle_mode(user)
	return TRUE

/obj/item/binoculars/tactical/examine(mob/user)
	. = ..()
	switch(mode)
		if(MODE_CAS)
			. += span_notice("They are currently set to CAS marking mode.")
		if(MODE_RANGE_FINDER)
			. += span_notice("They are currently set to range finding mode.")
		if(MODE_RAILGUN)
			. += span_notice("They are currently set to railgun targeting mode.")
		if(MODE_ORBITAL)
			. += span_notice("They are currently set to orbital bombardment mode.")
	. += span_notice("Use on an artillery piece to link it for remote targeting.")
	if(length(linked_mortars))
		. += span_notice("They are currently linked to [length(linked_mortars)] artillery piece(s).")
		. += span_notice("They are currently set to [linked_mortars[selected_mortar].name] N°[selected_mortar].")
		return
	. += span_notice("They are not linked to any artillery piece(s).")

/obj/item/binoculars/tactical/Destroy()
	if(laser)
		QDEL_NULL(laser)
	return ..()

/obj/item/binoculars/tactical/InterceptClickOn(mob/user, params, atom/object)
	var/list/pa = params2list(params)
	if(!pa.Find("ctrl") && pa.Find("shift"))
		acquire_coordinates(object, user)
		return TRUE

	if(pa.Find("ctrl") && !pa.Find("shift"))
		acquire_target(object, user)
		return TRUE

	if(pa.Find("ctrl") && pa.Find("shift"))
		try_fire_ob(object, user)
		return TRUE

	return FALSE

/obj/item/binoculars/tactical/onzoom(mob/living/user)
	. = ..()
	user.reset_perspective(src)
	user.update_sight()
	user.client.click_intercept = src

/obj/item/binoculars/tactical/onunzoom(mob/living/user)
	. = ..()

	QDEL_NULL(laser)

	if(!user?.client)
		return

	user.client.click_intercept = null
	user.reset_perspective(user)
	user.update_sight()


/obj/item/binoculars/tactical/update_remote_sight(mob/living/user)
	user.lighting_cutoff = LIGHTING_CUTOFF_HIGH
	user.sync_lighting_plane_cutoff()
	return TRUE


/obj/item/binoculars/tactical/update_overlays()
	. = ..()
	switch(mode)
		if(MODE_CAS)
			. += "binoculars_cas"
		if(MODE_RANGE_FINDER)
			. += "binoculars_range"
		if(MODE_RAILGUN)
			. += "binoculars_railgun"
		if(MODE_ORBITAL)
			. += "binoculars_orbital"

/// Proc that when called checks if the selected mortar isnt out of list bounds and if it is, resets to 1
/obj/item/binoculars/tactical/proc/check_mortar_index()
	if(!linked_mortars)
		return
	if(!length(linked_mortars))
		selected_mortar = 1 // set back to default but it still wont fire because no mortars and thats good
		return
	if(selected_mortar > length(linked_mortars))
		selected_mortar = 1

/obj/item/binoculars/tactical/AltClick(mob/user)
	. = ..()
	if(!length(linked_mortars))
		return
	if(length(linked_mortars) == 1)
		to_chat(user, span_notice("只有一个连接部件，无法切换到另一个。"))
	selected_mortar += 1
	check_mortar_index()
	var/obj/mortar = linked_mortars[selected_mortar]
	to_chat(user, span_notice("正在向[linked_mortars[selected_mortar].name]发送坐标：经度[mortar.x]，纬度[mortar.y]。"))

/obj/item/binoculars/tactical/verb/toggle_mode(mob/user)
	set category = "IC.Object"
	set name = "Toggle Laser Mode"
	if(!user && isliving(loc))
		user = loc
	if (laser)
		to_chat(user, "<span class='warning'>瞄准时无法切换模式</span>")
		return
	if(!changable)
		to_chat(user, "这副望远镜只有一种模式。")
		return
	mode += 1
	if(mode > MODE_RANGE_FINDER)
		mode = MODE_CAS
	switch(mode)
		if(MODE_CAS)
			to_chat(user, span_notice("你已将[src]切换至近距空中支援标记模式。"))
		if(MODE_RAILGUN)
			to_chat(user, span_notice("你将[src]切换至导轨炮瞄准模式。"))
		if(MODE_ORBITAL)
			to_chat(user, span_notice("你已将[src]切换至轨道轰炸瞄准模式。"))
		if(MODE_RANGE_FINDER)
			to_chat(user, span_notice("你将[src]切换至测距模式。"))
	update_icon()
	playsound(user, 'sound/items/binoculars.ogg', 15, 1)

/obj/item/binoculars/tactical/proc/acquire_coordinates(atom/A, mob/living/carbon/human/user)
	var/turf/TU = get_turf(A)
	targetturf = TU
	to_chat(user, span_notice("坐标：经度 [targetturf.x]。纬度 [targetturf.y]。"))
	playsound(src, 'sound/effects/binoctarget.ogg', 35)

/obj/item/binoculars/tactical/proc/acquire_target(atom/A, mob/living/carbon/human/user)
	set waitfor = 0

	if(laser)
		to_chat(user, span_warning("你已经锁定目标了。"))
		return

	if(world.time < laser_cooldown)
		to_chat(user, span_warning("[src]的激光电池正在充能。"))
		return

	var/turf/TU = get_turf(A)
	var/distance = get_dist(TU, get_turf(user))
	var/zoom_screen_size = zoom_tile_offset + zoom_viewsize + 3
	if(!(TU.z in SSmapping.get_connected_levels(get_turf(user))) || distance == -1 || (distance > zoom_screen_size))
		to_chat(user, span_warning("你无法在透过其他东西观察时，通过\the [src]进行有效聚焦。"))
		return


	if(!user.mind)
		return
	var/datum/squad/S = user.assigned_squad

	var/laz_name = "[user.get_paygrade()] [user.name][S ? " ([S.name])" : null]"


	var/area/targ_area = get_area(A)
	if(!istype(TU))
		return
	var/is_outside = FALSE
	if(is_ground_level(TU.z) && (targ_area.ceiling <= CEILING_OBSTRUCTED))
		is_outside = TRUE
	if(!is_outside)
		to_chat(user, span_warning("深度警告：目标过深，无法使用弹药。"))
		return
	if(user.do_actions)
		return
	playsound(src, 'sound/effects/nightvision.ogg', 35)
	if(mode != MODE_RANGE_FINDER)
		to_chat(user, span_notice("正在启动激光瞄准。请保持静止。"))
		if(!do_after(user, max(1.5 SECONDS, target_acquisition_delay - (2.5 SECONDS * user.skills.getRating(SKILL_LEADERSHIP))), NONE, TU, BUSY_ICON_GENERIC) || world.time < laser_cooldown || laser)
			return
	if(targ_area.area_flags & OB_CAS_IMMUNE)
		to_chat(user, span_warning("我们的有效载荷无法抵达此目标！"))
		return
	switch(mode)
		if(MODE_CAS)
			to_chat(user, span_notice("目标已锁定。激光瞄准已上线。请勿移动。"))
			log_game("[key_name(user)] has begun lasing a CAS mission at [AREACOORD(TU)].")
			var/obj/effect/overlay/temp/laser_target/cas/CS = new (TU, 0, laz_name, S)
			laser = CS
			playsound(src, 'sound/effects/binoctarget.ogg', 35)
			while(laser)
				if(!do_after(user, 5 SECONDS, NONE, laser, BUSY_ICON_GENERIC))
					QDEL_NULL(laser)
					break
		if(MODE_RANGE_FINDER)
			if(!length(linked_mortars))
				to_chat(user, span_notice("未找到已连接的炮台。"))
				return
			check_mortar_index() // incase varedit screws something up
			targetturf = TU
			to_chat(user, span_notice("迫击炮 [selected_mortar] 已锁定目标坐标：经度 [targetturf.x]，纬度 [targetturf.y]。"))
			log_game("[key_name(user)] has lased a mortar mission at [AREACOORD(TU)].")
			playsound(src, 'sound/effects/binoctarget.ogg', 35)
			var/obj/machinery/deployable/mortar/mortar = linked_mortars[selected_mortar]
			mortar.recieve_target(TU,user)
			return
		if(MODE_RAILGUN)
			if(SSticker?.mode?.round_type_flags & MODE_DISALLOW_RAILGUN)
				to_chat(user, span_notice("错误。未检测到链接的导轨炮。无法开火。"))
				return
			to_chat(user, span_notice("正在获取目标。磁轨炮三角定位中。请勿移动。"))
			if((GLOB.rail_gun?.last_firing + COOLDOWN_RAILGUN_FIRE) > world.time)
				to_chat(user, "[icon2html(src, user)] [span_warning("The Rail Gun hasn't cooled down yet!")]")
			else if(!targ_area)
				to_chat(user, "[icon2html(src, user)] [span_warning("No target detected!")]")
			else
				var/obj/effect/overlay/temp/laser_target/RGL = new (TU, 0, laz_name, S)
				laser = RGL
				playsound(src, 'sound/effects/binoctarget.ogg', 35)
				if(!do_after(user, 2 SECONDS, NONE, user, BUSY_ICON_GENERIC))
					QDEL_NULL(laser)
					return
				to_chat(user, span_notice("目标已锁定。导轨炮正在开火。不要移动。"))
				log_game("[key_name(user)] has lased a railgun mission at [AREACOORD(TU)].")
				while(laser)
					GLOB.rail_gun?.fire_rail_gun(TU,user)
					if(!do_after(user, 3 SECONDS, NONE, laser, BUSY_ICON_GENERIC))
						QDEL_NULL(laser)
						break
		if(MODE_ORBITAL)
			to_chat(user, span_notice("正在获取目标。轨道炮三角定位中。请勿移动。"))
			log_game("[key_name(user)] has begun to laze an Orbital Bombardment mission at [AREACOORD(TU)].")
			if(!targ_area)
				to_chat(user, "[icon2html(src, user)] [span_warning("No target detected!")]")
			else
				var/obj/effect/overlay/temp/laser_target/ob/OBL = new (TU, 0, laz_name, S)
				laser = OBL
				playsound(src, 'sound/effects/binoctarget.ogg', 35)
				if(!do_after(user, 15 SECONDS, NONE, user, BUSY_ICON_GENERIC))
					QDEL_NULL(laser)
					return
				to_chat(user, span_notice("目标已锁定。轨道炮准备开火。"))
				// Wait for that ALT click to fire
				current_turf = TU
				ob_fired = FALSE // Reset the fired state
				while(laser && !ob_fired)
					if(!do_after(user, 5 SECONDS, NONE, laser, BUSY_ICON_GENERIC))
						QDEL_NULL(laser)
						break
				current_turf = null

/obj/item/binoculars/tactical/proc/try_fire_ob(atom/A, mob/living/carbon/human/user)
	if(mode != MODE_ORBITAL)
		return
	if(A != laser || !current_turf)
		return // Gotta click on a laser target
	ob_fired = TRUE
	var/x_offset = rand(-2,2) //Little bit of randomness.
	var/y_offset = rand(-2,2)
	var/turf/target = locate(current_turf.x + x_offset,current_turf.y + y_offset,current_turf.z)
	GLOB.orbital_cannon?.fire_ob_cannon(target, user)
	var/warhead_type = GLOB.orbital_cannon.tray.warhead.name
	for(var/mob/living/silicon/ai/AI AS in GLOB.ai_list)
		to_chat(AI, span_warning("注意 - 地面操作员已触发轨道轰炸。弹头类型：[warhead_type]。目标：[AREACOORD_NO_Z(current_turf)]"))
		playsound(AI,'sound/machines/triple_beep.ogg', 25, 1, 20)
	to_chat(user, span_notice("收到开火请求。清空目标区域。"))
	log_attack("[key_name(user)] fired a [warhead_type] in [AREACOORD(current_turf)].")
	message_admins("[ADMIN_TPMONTY(user)] fired a [warhead_type] in [ADMIN_VERBOSEJMP(current_turf)].")
	QDEL_NULL(laser)

///Sets or unsets the binocs linked mortar.
/obj/item/binoculars/tactical/proc/set_mortar(obj/machinery/deployable/mortar/mortar)
	if(mortar in linked_mortars)
		UnregisterSignal(mortar, COMSIG_QDELETING)
		linked_mortars -= mortar
		LAZYREMOVE(mortar.linked_struct_binoculars, src)
		return FALSE
	linked_mortars += mortar
	LAZYADD(mortar.linked_struct_binoculars, src)
	RegisterSignal(mortar, COMSIG_QDELETING, PROC_REF(clean_refs))
	return TRUE

///Proc called when linked_mortar is deleted.
/obj/item/binoculars/tactical/proc/clean_refs(datum/source)
	SIGNAL_HANDLER
	say("注意：与链接火炮的连接已断开。")
	linked_mortars -= source
	check_mortar_index()

/obj/item/binoculars/tactical/scout
	name = "侦察战术望远镜"
	desc = "战术望远镜的改进型号，具备先进的激光瞄准功能。Ctrl+点击以锁定目标。"
	cooldown_duration = 80
	target_acquisition_delay = 30

//For events
/obj/item/binoculars/tactical/range
	name = "测距仪"
	desc = "一副用于定位坐标并瞄准联动火炮的双筒望远镜。使用时按Shift+点击或Ctrl+点击获取坐标。按Alt+点击更改选定的联动火炮。"
	changable = 0
	mode = MODE_RANGE_FINDER

#undef MODE_CAS
#undef MODE_RANGE_FINDER
#undef MODE_RAILGUN
#undef MODE_ORBITAL
