//Procedures in this file: Robotic limbs attachment
//////////////////////////////////////////////////////////////////
//						LIMB SURGERY							//
//////////////////////////////////////////////////////////////////

/datum/surgery_step/limb
	can_infect = 0
	var/limb_step

/datum/surgery_step/limb/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected, checks_only)
	if(!affected)
		return SURGERY_CANNOT_USE
	if(!(affected.limb_status & LIMB_DESTROYED))
		return SURGERY_CANNOT_USE
	if(affected.parent && (affected.parent.limb_status & LIMB_DESTROYED))//parent limb is destroyed
		return SURGERY_CANNOT_USE
	if(affected.limb_replacement_stage != limb_step)
		return SURGERY_CANNOT_USE
	if(affected.body_part == HEAD) //head has its own steps
		return SURGERY_CANNOT_USE
	return SURGERY_CAN_USE

/datum/surgery_step/limb/cut
	allowed_tools = list(
		/obj/item/tool/surgery/scalpel = 100,
		/obj/item/tool/kitchen/knife = 75,
		/obj/item/shard = 50,
	)

	min_duration = ROBOLIMB_CUT_MIN_DURATION
	max_duration = ROBOLIMB_CUT_MAX_DURATION
	limb_step = 0

/datum/surgery_step/limb/cut/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user]开始用\the [tool]切除[target]原本[affected.display_name]所在位置的皮肉。"), \
	span_notice("You start cutting away flesh where [target]'s [affected.display_name] used to be with \the [tool]."))
	target.balloon_alert_to_viewers("切割中...")
	..()

/datum/surgery_step/limb/cut/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user]用\the [tool]切除了[target]原本[affected.display_name]所在位置的皮肉。"),	\
	span_notice("You cut away flesh where [target]'s [affected.display_name] used to be with \the [tool]."))
	target.balloon_alert_to_viewers("成功")
	affected.limb_replacement_stage = 1
	return ..()

/datum/surgery_step/limb/cut/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	if(affected.parent)
		affected = affected.parent
		user.visible_message(span_warning("[user]的手滑了一下，划开了[target]的[affected.display_name]！"), \
		span_warning("Your hand slips, cutting [target]'s [affected.display_name] open!"))
		target.balloon_alert_to_viewers("滑倒了！")
		affected.createwound(CUT, 10)
		affected.update_wounds()



/datum/surgery_step/limb/mend
	allowed_tools = list(
		/obj/item/tool/surgery/retractor = 100,
		/obj/item/tool/crowbar = 75,
		/obj/item/tool/kitchen/utensil/fork = 50,
	)

	min_duration = ROBOLIMB_MEND_MIN_DURATION
	max_duration = ROBOLIMB_MEND_MAX_DURATION
	limb_step = 1

/datum/surgery_step/limb/mend/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 正开始用[tool]在[target]的[affected.display_name]原处重新定位血肉和神经末梢。"), \
	span_notice("You start repositioning flesh and nerve endings where [target]'s [affected.display_name] used to be with [tool]."))
	target.balloon_alert_to_viewers("重新部署中...")
	..()

/datum/surgery_step/limb/mend/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 已使用[tool]将[target]的[affected.display_name]处的血肉和神经末梢重新定位完毕。"),	\
	span_notice("You have finished repositioning flesh and nerve endings where [target]'s [affected.display_name] used to be with [tool]."))
	target.balloon_alert_to_viewers("成功")
	affected.limb_replacement_stage = 2
	return ..()

/datum/surgery_step/limb/mend/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	if(affected.parent)
		affected = affected.parent
		user.visible_message(span_warning("[user]的手滑了一下，撕开了[target]的[affected.display_name]上的皮肉！"), \
		span_warning("Your hand slips, tearing flesh on [target]'s [affected.display_name]!"))
		target.balloon_alert_to_viewers("滑倒了！")
		target.apply_damage(10, BRUTE, affected, 0, TRUE, updating_health = TRUE)


/datum/surgery_step/limb/prepare
	allowed_tools = list(
		/obj/item/tool/surgery/cautery = 100,
		/obj/item/clothing/mask/cigarette = 75,
		/obj/item/tool/lighter = 50,
		/obj/item/tool/weldingtool = 25,
	)

	min_duration = ROBOLIMB_PREPARE_MIN_DURATION
	max_duration = ROBOLIMB_PREPARE_MAX_DURATION
	limb_step = 2

/datum/surgery_step/limb/prepare/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user]开始用\the [tool]调整[target]的[affected.display_name]周围区域。"), \
	span_notice("You start adjusting the area around [target]'s [affected.display_name] with \the [tool]."))
	target.balloon_alert_to_viewers("调整中...")
	..()

/datum/surgery_step/limb/prepare/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 已经用 \the [tool] 完成了对 [target] 的 [affected.display_name] 周围区域的调整。"),	\
	span_notice("You have finished adjusting the area around [target]'s [affected.display_name] with \the [tool]."))
	target.balloon_alert_to_viewers("成功")
	affected.add_limb_flags(LIMB_AMPUTATED)
	affected.setAmputatedTree()
	affected.limb_replacement_stage = 0
	return ..()

/datum/surgery_step/limb/prepare/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	if(affected.parent)
		affected = affected.parent
		user.visible_message(span_warning("[user]的手滑了一下，灼伤了[target]的[affected.display_name]！"), \
		span_warning("Your hand slips, searing [target]'s [affected.display_name]!"))
		target.balloon_alert_to_viewers("滑倒了！")
		target.apply_damage(10, BURN, affected, updating_health = TRUE)


/datum/surgery_step/limb/attach
	allowed_tools = list(/obj/item/robot_parts = 100)

	min_duration = ROBOLIMB_ATTACH_MIN_DURATION
	max_duration = ROBOLIMB_ATTACH_MAX_DURATION
	limb_step = 0

/datum/surgery_step/limb/attach/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	if(..())
		var/obj/item/robot_parts/p = tool
		if(p.part)
			if(!(affected.name in p.part))
				return SURGERY_CANNOT_USE
		if(affected.limb_status & LIMB_AMPUTATED)
			return SURGERY_CAN_USE
	return SURGERY_CANNOT_USE

/datum/surgery_step/limb/attach/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user]开始将\the [tool]安装到[target]原本[affected.display_name]所在的位置。"), \
	span_notice("You start attaching \the [tool] where [target]'s [affected.display_name] used to be."))
	target.balloon_alert_to_viewers("正在安装...")

/datum/surgery_step/limb/attach/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 已将 \the [tool] 安装到 [target] 原本的 [affected.display_name] 位置。"),	\
	span_notice("You have attached \the [tool] where [target]'s [affected.display_name] used to be."))
	target.balloon_alert_to_viewers("成功")

	//Update our dear victim to have a limb again
	if(istype(tool, /obj/item/robot_parts/biotic))
		affected.biotize()
	else
		affected.robotize()

	target.update_body()
	target.updatehealth()
	target.UpdateDamageIcon()

	//Deal with the limb item properly
	user.temporarilyRemoveItemFromInventory(tool)
	qdel(tool)
	return ..()

/datum/surgery_step/limb/attach/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_warning("[user]的手滑了一下，损坏了[target]的[affected.display_name]上的连接器！"), \
	span_warning("Your hand slips, damaging connectors on [target]'s [affected.display_name]!"))
	target.balloon_alert_to_viewers("滑倒了！")
	target.apply_damage(10, BRUTE, affected, 0, TRUE, updating_health = TRUE)
