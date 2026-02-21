//////////////////////////////////////////////////////////////////
//					IMPLANT/ITEM REMOVAL SURGERY				//
//////////////////////////////////////////////////////////////////


/datum/surgery_step/implant_removal
	priority = 1
	allowed_tools = list(
		/obj/item/tool/surgery/hemostat = 100,
		/obj/item/tool/wirecutters = 75,
		/obj/item/tool/kitchen/utensil/fork = 20,
	)

	min_duration = HEMOSTAT_REMOVE_MIN_DURATION
	max_duration = HEMOSTAT_REMOVE_MAX_DURATION

/datum/surgery_step/implant_removal/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected, checks_only)
	if(affected.surgery_open_stage >= 2)
		return SURGERY_CAN_USE
	return SURGERY_CANNOT_USE

/datum/surgery_step/implant_removal/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 开始用 \the [tool] 在 [target] 的 [affected.display_name] 切口内探查。"), \
	span_notice("You start poking around inside the incision on [target]'s [affected.display_name] with \the [tool]."))
	target.custom_pain("The pain in your chest is living hell!", 1)
	target.balloon_alert_to_viewers("正在检查...")
	..()

/datum/surgery_step/implant_removal/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	if(length(affected.implants))

		var/obj/item/implantfound = affected.implants[1]
		user.visible_message(span_notice("[user] 用 \the [tool] 从 [target] 的 [affected.display_name] 切口处取出了什么东西。"), \
		span_notice("You take [implantfound] out of incision on [target]'s [affected.display_name]s with \the [tool]."))
		target.balloon_alert_to_viewers("发现植入物")
		implantfound.unembed_ourself()

	else if(affected.hidden)
		user.visible_message(span_notice("[user] 从 [target] 的 [affected.display_name] 切口处用 \the [tool] 取出了什么东西。"), \
		span_notice("You take something out of incision on [target]'s [affected.display_name]s with \the [tool]."))
		target.balloon_alert_to_viewers("发现弹片")
		affected.hidden.loc = get_turf(target)
		affected.hidden.update_icon()
		affected.hidden = null

	else
		user.visible_message(span_notice("[user] 在 [target] 的 [affected.display_name] 内没有找到任何东西，于是将 \the [tool] 抽了出来。"), \
		span_notice("You could not find anything inside [target]'s [affected.display_name]."))
		target.balloon_alert_to_viewers("未找到任何内容")
	return ..()

/datum/surgery_step/implant_removal/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_warning("[user]的手滑了一下，用\the [tool]刮伤了[target]的[affected.display_name]内部组织！"), \
	span_warning("Your hand slips, scraping tissue inside [target]'s [affected.display_name] with \the [tool]!"))
	target.balloon_alert_to_viewers("滑倒了！")
	affected.createwound(CUT, 20)
	if(length(affected.implants))
		var/fail_prob = 10
		fail_prob += 100 - tool_quality(tool)
		if(prob(fail_prob))
			var/obj/item/I = affected.implants[1]
			if(istype(I,/obj/item/implant))
				var/obj/item/implant/imp = I
				user.visible_message(span_warning("[target]的[affected.display_name]里有什么东西在哔哔响！"))
				playsound(imp.loc, 'sound/items/countdown.ogg', 25, 1)
				addtimer(CALLBACK(imp, TYPE_PROC_REF(/obj/item/implant, activate)), 25)
	target.updatehealth()
	affected.update_wounds()
