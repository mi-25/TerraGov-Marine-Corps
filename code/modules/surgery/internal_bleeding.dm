//Procedures in this file: Inernal wound patching, Implant removal.
//////////////////////////////////////////////////////////////////
//					INTERNAL WOUND PATCHING						//
//////////////////////////////////////////////////////////////////


/datum/surgery_step/fix_vein
	allowed_tools = list(
		/obj/item/tool/surgery/FixOVein = 100,
		/obj/item/stack/cable_coil = 75,
	)
	can_infect = 1
	blood_level = 1

	min_duration = FIXVEIN_MIN_DURATION
	max_duration = FIXVEIN_MAX_DURATION

/datum/surgery_step/fix_vein/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected, checks_only)
	if(affected.surgery_open_stage >= 2)
		if(locate(/datum/wound/internal_bleeding) in affected.wounds)
			return SURGERY_CAN_USE
	return SURGERY_CANNOT_USE

/datum/surgery_step/fix_vein/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user]开始用\the [tool]修补[target]的[affected.display_name]中受损的血管。") , \
	span_notice("You start patching the damaged vein in [target]'s [affected.display_name] with \the [tool]."))
	target.custom_pain("The pain in [affected.display_name] is unbearable!",1)
	target.balloon_alert_to_viewers("正在修复...")
	..()

/datum/surgery_step/fix_vein/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 已使用 \the [tool] 修补了 [target] 的 [affected.display_name] 中受损的血管。"), \
		span_notice("You have patched the damaged vein in [target]'s [affected.display_name] with \the [tool]."))
	target.balloon_alert_to_viewers("成功")

	QDEL_LIST(affected.wounds)
	if(ishuman(user) && prob(40))
		user:bloody_hands(target, 0)
	return ..()

/datum/surgery_step/fix_vein/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_warning("[user]的手滑了一下，把[tool]抹在了[target]的[affected.display_name]切口上！") , \
	span_warning("Your hand slips, smearing [tool] in the incision in [target]'s [affected.display_name]!"))
	target.balloon_alert_to_viewers("滑倒了！")
	affected.take_damage_limb(5, 0)
	target.updatehealth()
