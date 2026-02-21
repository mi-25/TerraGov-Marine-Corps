//Procedures in this file: Eye mending surgery
//////////////////////////////////////////////////////////////////
//						EYE SURGERY							//
//////////////////////////////////////////////////////////////////

/datum/surgery_step/eye
	priority = 2
	can_infect = 1
	var/eye_step

/datum/surgery_step/eye/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected, checks_only)
	if(!affected || (affected.limb_status & LIMB_DESTROYED))
		return 0

	if(target_zone != "eyes")
		return 0

	var/datum/internal_organ/eyes/E = target.get_organ_slot(ORGAN_SLOT_EYES)
	if(!E)
		return 0
	if(E.eye_surgery_stage == eye_step)
		return 1

/datum/surgery_step/eye/cut_open
	allowed_tools = list(
		/obj/item/tool/surgery/scalpel = 100,
		/obj/item/tool/kitchen/knife = 75,
		/obj/item/shard = 50,
	)

	min_duration = EYE_CUT_MIN_DURATION
	max_duration = EYE_CUT_MAX_DURATION
	eye_step = 0

/datum/surgery_step/eye/cut_open/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 开始用 \the [tool] 分离 [target] 眼睛的角膜。"), \
	span_notice("You start to separate the cornea on [target]'s eyes with \the [tool]."))
	target.balloon_alert_to_viewers("分离中...")
	..()

/datum/surgery_step/eye/cut_open/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 已使用 \the [tool] 将 [target] 的眼角膜分离。") , \
	span_notice("You have separated the cornea on [target]'s eyes with \the [tool]."))
	target.balloon_alert_to_viewers("成功")
	var/datum/internal_organ/eyes/E = target.get_organ_slot(ORGAN_SLOT_EYES)
	E.eye_surgery_stage = 1
	target.disabilities |= NEARSIGHTED // code\#define\mobs.dm
	return ..()

/datum/surgery_step/eye/cut_open/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	var/datum/internal_organ/eyes/E = target.get_organ_slot(ORGAN_SLOT_EYES)
	user.visible_message(span_warning("[user]的手一滑，用\the [tool]划伤了[target]的眼睛！") , \
	span_warning("Your hand slips, slicing [target]'s eyes with \the [tool]!") )
	target.balloon_alert_to_viewers("滑倒了！")
	affected.createwound(CUT, 10)
	E.take_damage(5, 0)
	target.updatehealth()
	affected.update_wounds()


/datum/surgery_step/eye/lift_eyes
	allowed_tools = list(
		/obj/item/tool/surgery/retractor = 100,
		/obj/item/tool/kitchen/utensil/fork = 50,
	)

	min_duration = EYE_LIFT_MIN_DURATION
	max_duration = EYE_LIFT_MAX_DURATION
	eye_step = 1

/datum/surgery_step/eye/lift_eyes/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user]开始用\the [tool]从[target]的眼睛上剥离角膜。"), \
	span_notice("You start lifting the cornea from [target]'s eyes with \the [tool]."))
	target.balloon_alert_to_viewers("正在抬起...")
	..()

/datum/surgery_step/eye/lift_eyes/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 用 \the [tool] 从 [target] 的眼睛里取出了角膜。") , \
	span_notice("You have lifted the cornea from [target]'s eyes with \the [tool].") )
	target.balloon_alert_to_viewers("成功")
	var/datum/internal_organ/eyes/E = target.get_organ_slot(ORGAN_SLOT_EYES)
	E.eye_surgery_stage = 2
	return ..()

/datum/surgery_step/eye/lift_eyes/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	var/datum/internal_organ/eyes/eyes = target.get_organ_slot(ORGAN_SLOT_EYES)
	user.visible_message(span_warning("[user]的手滑了一下，用\the [tool]伤到了[target]的眼睛！"),
	span_warning("Your hand slips, damaging [target]'s eyes with \the [tool]!"))
	target.balloon_alert_to_viewers("滑倒了！")
	eyes.take_damage(5, 0)
	target.apply_damage(10, BRUTE, affected, updating_health = TRUE)

/datum/surgery_step/eye/mend_eyes
	allowed_tools = list(
		/obj/item/tool/surgery/hemostat = 100,
		/obj/item/stack/cable_coil = 75,
		/obj/item/assembly/mousetrap = 10,
	)

	min_duration = EYE_MEND_MIN_DURATION
	max_duration = EYE_MEND_MAX_DURATION
	eye_step = 2

/datum/surgery_step/eye/mend_eyes/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user]开始用\the [tool]修复[target]眼睛的神经和晶状体。"), \
	span_notice("You start mending the nerves and lenses in [target]'s eyes with the [tool]."))
	target.balloon_alert_to_viewers("愈合中...")
	..()

/datum/surgery_step/eye/mend_eyes/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 用 \the [tool] 修复了 [target] 的神经和晶状体。") ,	\
	span_notice("You mend the nerves and lenses in [target]'s with \the [tool]."))
	target.balloon_alert_to_viewers("成功")
	var/datum/internal_organ/eyes/E = target.get_organ_slot(ORGAN_SLOT_EYES)
	E.eye_surgery_stage = 3
	return ..()

/datum/surgery_step/eye/mend_eyes/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	var/datum/internal_organ/eyes/E = target.get_organ_slot(ORGAN_SLOT_EYES)
	user.visible_message(span_warning("[user]的手一滑，将 \the [tool] 刺进了[target]的眼睛里！"),
	span_warning("Your hand slips, stabbing \the [tool] into [target]'s eye!"))
	target.balloon_alert_to_viewers("滑倒了！")
	E.take_damage(5, 0)
	target.apply_damage(10, BRUTE, affected, 0, TRUE, updating_health = TRUE)


/datum/surgery_step/eye/cauterize
	allowed_tools = list(
		/obj/item/tool/surgery/cautery = 100,
		/obj/item/clothing/mask/cigarette = 75,
		/obj/item/tool/lighter = 50,
		/obj/item/tool/weldingtool = 25,
	)

	min_duration = EYE_CAUTERISE_MIN_DURATION
	max_duration = EYE_CAUTERISE_MAX_DURATION
	eye_step = 3

/datum/surgery_step/eye/cauterize/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user]正开始用\the [tool]灼烧[target]眼睛周围的切口。") , \
	span_notice("You are beginning to cauterize the incision around [target]'s eyes with \the [tool]."))
	target.balloon_alert_to_viewers("正在灼烧...")

/datum/surgery_step/eye/cauterize/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user]用\the [tool]烧灼了[target]眼睛周围的切口。"), \
	span_notice("You cauterize the incision around [target]'s eyes with \the [tool]."))
	target.balloon_alert_to_viewers("成功")
	target.disabilities &= ~NEARSIGHTED
	target.disabilities &= ~BLIND
	var/datum/internal_organ/eyes/E = target.get_organ_slot(ORGAN_SLOT_EYES)
	E.damage = 0
	E.eye_surgery_stage = 0
	return ..()


/datum/surgery_step/eye/cauterize/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	var/datum/internal_organ/eyes/E = target.get_organ_slot(ORGAN_SLOT_EYES)
	user.visible_message(span_warning("[user]的手一滑，\the [tool]灼伤了[target]的眼睛！"),
	span_warning("Your hand slips, searing [target]'s eyes with \the [tool]!"))
	target.balloon_alert_to_viewers("滑倒了！")
	E.take_damage(5, 0)
	target.apply_damage(5, BURN, affected, updating_health = TRUE)
