/obj/item/fulton_extraction_pack
	name = "富尔顿回收包"
	desc = "一个可用于提取装备或人员的气球。任何未固定的物品均可移动。"
	icon = 'icons/obj/items/fulton.dmi'
	icon_state = "extraction_pack"
	worn_icon_state = "fulton"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/tools_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/tools_right.dmi',
	)
	w_class = WEIGHT_CLASS_NORMAL
	tool_behaviour = TOOL_FULTON
	resistance_flags = RESIST_ALL
	///Reference to the balloon vis obj effect
	var/atom/movable/vis_obj/fulton_balloon/baloon
	var/obj/effect/fulton_extraction_holder/holder_obj
	/// How many times you can use the fulton before it goes poof
	var/uses = 6

/obj/item/fulton_extraction_pack/examine(mob/user)
	. = ..()
	. += "It has [uses] uses remaining."


/obj/item/fulton_extraction_pack/Initialize(mapload)
	. = ..()
	baloon = new()
	holder_obj = new()


/obj/item/fulton_extraction_pack/Destroy()
	QDEL_NULL(baloon)
	QDEL_NULL(holder_obj)
	return ..()


/obj/item/fulton_extraction_pack/proc/extract(atom/movable/spirited_away, mob/living/user)
	if(!do_checks(spirited_away, user))
		return
	do_extract(spirited_away, user)
	var/datum/export_report/export_report = spirited_away.supply_export(user.faction)
	if(export_report)
		SSpoints.export_history += export_report
	user.visible_message(span_notice("[user]完成了将[src]连接到[spirited_away]的操作并启动了它。"),\
	span_notice("You attach the pack to [spirited_away] and activate it. This looks like it will yield [export_report.points ? export_report.points : "no"] point[export_report.points == 1 ? "" : "s"]."), null, 5)
	uses--
	if(uses < 1)
		user.temporarilyRemoveItemFromInventory(src) //Removes the item without qdeling it, qdeling it this early will break the rest of the procs
		moveToNullspace()

	qdel(spirited_away)


/obj/item/fulton_extraction_pack/proc/do_checks(atom/movable/spirited_away, mob/user)
	if(user.do_actions)
		return FALSE
	if(active)
		balloon_alert(user, "富尔顿未就绪")
		return FALSE
	user.visible_message(span_notice("[user]开始将[src]安装到[spirited_away]上。"),\
	span_notice("You start attaching the pack to [spirited_away]..."), null, 5)
	if(!do_after(user, 5 SECONDS, NONE, spirited_away))
		return FALSE
	if(!isturf(spirited_away.loc))
		balloon_alert(user, "必须在地面撤离")
		return FALSE
	if(spirited_away.anchored)
		balloon_alert(user, "无法提取已固定的物体")
		return FALSE
	var/area/bathhouse = get_area(spirited_away)
	if(bathhouse.ceiling >= CEILING_OBSTRUCTED)
		balloon_alert(user, "无法在室内提取")
		return FALSE
	return TRUE


/obj/item/fulton_extraction_pack/proc/do_extract(atom/movable/spirited_away, mob/user)
	active = TRUE

	holder_obj.appearance = spirited_away.appearance
	holder_obj.forceMove(spirited_away.loc)
	if(spirited_away.anchored)
		spirited_away.anchored = FALSE
	if(isliving(spirited_away))
		ADD_TRAIT(spirited_away, TRAIT_IMMOBILE, type)
	spirited_away.moveToNullspace()
	baloon.icon_state = initial(baloon.icon_state)
	holder_obj.vis_contents += baloon

	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(playsound), get_turf(holder_obj), 'sound/items/fultext_deploy.ogg', 50, TRUE), 0.4 SECONDS)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(playsound), get_turf(holder_obj), 'sound/items/fultext_launch.ogg', 50, TRUE), 7.4 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(cleanup_extraction)), 8 SECONDS)

	flick("fulton_expand", baloon)
	baloon.icon_state = "fulton_balloon"
	animate(holder_obj, pixel_z = 0, time = 0.4 SECONDS)
	animate(pixel_z = 10, time = 2 SECONDS)
	animate(pixel_z = 15, time = 1 SECONDS)
	animate(pixel_z = 10, time = 1 SECONDS)
	animate(pixel_z = 15, time = 1 SECONDS)
	animate(pixel_z = 10, time = 1 SECONDS)
	animate(pixel_z = SCREEN_PIXEL_SIZE, time = 1 SECONDS)


/obj/item/fulton_extraction_pack/proc/cleanup_extraction()
	holder_obj.moveToNullspace()
	holder_obj.pixel_z = initial(pixel_z)
	holder_obj.vis_contents -= baloon
	baloon.icon_state = initial(baloon.icon_state)
	if(uses < 1)
		qdel(src)
	active = FALSE

/obj/item/fulton_extraction_pack/tank
	name = "重型坦克富尔顿回收"
	desc = "一种重型气球，用于吊运严重受损的坦克及其他大型载具。"
	w_class = WEIGHT_CLASS_BULKY
	uses = 1

/obj/item/fulton_extraction_pack/tank/Initialize(mapload)
	. = ..()
	//even lower than a coder sprite
	var/matrix/M = new
	M.Scale(1.5, 1.5)
	transform = M

/obj/item/fulton_extraction_pack/tank/extract(atom/movable/spirited_away, mob/living/user)
	if(!isarmoredvehicle(spirited_away))
		return ..()
	RegisterSignal(spirited_away, COMSIG_ARMORED_DO_EXTRACT, PROC_REF(extract_vehicle))

	user.visible_message(span_notice("[user] 完成了将 [src] 安装到 [spirited_away] 上的操作，准备进行紧固。"),\
	span_notice("You attach the pack to [spirited_away], ready for fastening."), null, 5)

	user.temporarilyRemoveItemFromInventory(src) //Removes the item without qdeling it, qdeling it this early will break the rest of the procs
	moveToNullspace()

/obj/item/fulton_extraction_pack/tank/proc/extract_vehicle(obj/vehicle/sealed/armored/spirited_away, mob/living/user)
	SIGNAL_HANDLER
	do_extract(spirited_away, user)
	spirited_away.moveToNullspace()
	addtimer(CALLBACK(spirited_away, TYPE_PROC_REF(/obj/vehicle/sealed/armored, return_to_base)), 8 SECONDS)

/obj/effect/fulton_extraction_holder
	name = "富尔顿回收装置"
	desc = "你不应该看到这个。"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT


//Overrides.
/mob/living/carbon/xenomorph/fulton_act(mob/living/user, obj/item/I)
	if(!SSpoints)
		balloon_alert(user, "未能与目标建立链接")
		return TRUE

	if(stat != DEAD)
		balloon_alert(user, "目标仍然存活")
		to_chat(user, span_warning("提取装置嗡嗡作响，发出抗议。这个似乎还活着。"))
		return TRUE

	var/obj/item/fulton_extraction_pack/ext_pack = I
	ext_pack.extract(src, user)
	return TRUE

/mob/living/carbon/human/fulton_act(mob/living/user, obj/item/I)
	if(!can_sell_human_body(src, user.faction))
		balloon_alert(user, "指挥部不感兴趣")
		return TRUE
	if(stat != DEAD)
		balloon_alert(user, "目标仍然存活")
		to_chat(user, span_warning("提取装置嗡嗡作响，发出抗议。这个似乎还活着。"))
		return TRUE
	var/obj/item/fulton_extraction_pack/ext_pack = I
	ext_pack.extract(src, user)
	return TRUE


/obj/structure/table/fulton_act(mob/living/user, obj/item/I)
	if(!flipped)
		return FALSE //Place it in.
	balloon_alert(user, "无法提取")
	return TRUE


/obj/structure/closet/fulton_act(mob/living/user, obj/item/I)
	if(opened)
		return FALSE //Place it in.
	balloon_alert(user, "无法提取")
	return TRUE


/obj/structure/closet/crate/fulton_act(mob/living/user, obj/item/I)
	if(opened)
		return FALSE //Place it in.

	if(!SSpoints)
		balloon_alert(user, "未能与目的地建立链接")
		return TRUE

	if(length(contents))
		balloon_alert(user, "[src] 不为空")
		to_chat(user, span_warning("超过最大重量。清空[src]以将其取出。"))
		return TRUE

	var/obj/item/fulton_extraction_pack/ext_pack = I
	ext_pack.extract(src, user)
	return TRUE


/obj/item/fulton_extraction_pack/adminbus //For adminbusing and doing quests.
	tool_behaviour = null //We work on a different system here.
	var/obj/structure/fulton_extraction_point/linked_extraction_point
	var/list/allowed_target_tags = list() //List of valid tags for objects to extract.
	var/must_be_used_outdoors = TRUE
	var/do_after_time = 5 SECONDS
	var/require_living_to_be_dead = TRUE
	var/care_about_anchored = TRUE


/obj/item/fulton_extraction_pack/adminbus/Destroy()
	linked_extraction_point = null
	return ..()


/obj/item/fulton_extraction_pack/adminbus/preattack(mob/user, atom/target)
	if(!isturf(target.loc) || !ismovable(target))
		return FALSE
	if(active)
		balloon_alert(user, "富尔顿未就绪")
		return FALSE
	. = TRUE
	if(istype(target, /obj/structure/fulton_extraction_point))
		if(linked_extraction_point && linked_extraction_point == target)
			linked_extraction_point = null
			balloon_alert(user, "撤离点已断开连接")
		else
			linked_extraction_point = target
			balloon_alert(user, "撤离点已连接")
		return
	if(length(allowed_target_tags) && !(target.tag in allowed_target_tags))
		return
	if(must_be_used_outdoors)
		var/area/target_area = get_area(target)
		if(target_area.ceiling >= CEILING_OBSTRUCTED)
			balloon_alert(user, "无法在室内提取")
			return
	var/atom/movable/movable_target = target
	if(care_about_anchored && movable_target.anchored)
		balloon_alert(user, "无法提取已固定的物体")
		return FALSE
	if(do_after_time && (user.do_actions || !do_after(user, do_after_time, TRUE, target)))
		return
	if(require_living_to_be_dead && isliving(target))
		var/mob/living/living_target = target
		if(living_target.stat == DEAD)
			return

	do_extract(target, user)

	if(linked_extraction_point)
		movable_target.forceMove(get_turf(linked_extraction_point))
		if(isliving(movable_target))
			REMOVE_TRAIT(movable_target, TRAIT_IMMOBILE, type)
	else
		qdel(target)

/obj/vehicle/sealed/armored/fulton_act(mob/living/user, obj/item/I)
	. = TRUE
	if(!istype(I, /obj/item/fulton_extraction_pack/tank))
		user.balloon_alert(user, "需要更大的富尔顿！")
		return
	if((armored_flags & ARMORED_WRECK_PREP_STAGE_TWO))
		user.balloon_alert(user, "已安装！")
		return
	if(!(armored_flags & ARMORED_WRECK_PREP_STAGE_ONE))
		user.balloon_alert(user, "需要 [ARMORED_WRECK_PLASTEEL_REQ] 塑钢")
		return
	if(!do_after(user, 5 SECONDS, NONE, src, BUSY_ICON_BUILD))
		return
	if((armored_flags & ARMORED_WRECK_PREP_STAGE_TWO))
		user.balloon_alert(user, "已安装！")
		return

	armored_flags |= ARMORED_WRECK_PREP_STAGE_TWO
	var/obj/item/fulton_extraction_pack/ext_pack = I
	ext_pack.extract(src, user)
	return TRUE


/obj/structure/fulton_extraction_point
	name = "富尔顿回收信标"
	desc = "富尔顿回收系统的信标。激活手中的回收包以将其链接至信标。"
	icon = 'icons/obj/items/fulton.dmi'
	icon_state = "extraction_point"
	anchored = TRUE
	density = FALSE
