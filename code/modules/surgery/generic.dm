//Procedures in this file: Gneric surgery steps
//////////////////////////////////////////////////////////////////
//						COMMON STEPS							//
//////////////////////////////////////////////////////////////////

/datum/surgery_step/generic
	can_infect = TRUE
	var/open_step

/datum/surgery_step/generic/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected, checks_only)
	if(target_zone == "eyes" || target_zone == "mouth") //There are specific steps for eye surgery and face surgery
		return SURGERY_CANNOT_USE
	if(!affected)
		return SURGERY_CANNOT_USE
	if(affected.limb_status & LIMB_DESTROYED)
		return SURGERY_CANNOT_USE
	if(!isnull(open_step) && affected.surgery_open_stage != open_step)
		return SURGERY_CANNOT_USE
	if(target_zone == "head" && target.species && (target.species.species_flags & (IS_SYNTHETIC|ROBOTIC_LIMBS)))
		return SURGERY_CAN_USE
	if(affected.limb_status & LIMB_ROBOT)
		return SURGERY_CANNOT_USE
	return SURGERY_CAN_USE


/datum/surgery_step/generic/incision_manager
	priority = 0.1 //Attempt before generic scalpel step
	allowed_tools = list(/obj/item/tool/surgery/scalpel/manager = 100)

	min_duration = INCISION_MANAGER_MIN_DURATION
	max_duration = INCISION_MANAGER_MAX_DURATION
	open_step = 0

/datum/surgery_step/generic/incision_manager/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user]开始用\the [tool]在[target]的[affected.display_name]上及内部构建一个预备切口。"), \
	span_notice("You start to construct a prepared incision on and within [target]'s [affected.display_name] with \the [tool]."))
	target.balloon_alert_to_viewers("正在切开...")
	target.custom_pain("You feel a horrible, searing pain in your [affected.display_name] as it is pushed apart!",1)
	..()

/datum/surgery_step/generic/incision_manager/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 已在 [target] 的 [affected.display_name] 上及内部用 \the [tool] 构建了一个预备切口。"), \
	span_notice("You have constructed a prepared incision on and within [target]'s [affected.display_name] with \the [tool]."))
	target.balloon_alert_to_viewers("成功")
	affected.surgery_open_stage = 1

	if(istype(target) && !(target.species.species_flags & NO_BLOOD))
		affected.add_limb_flags(LIMB_BLEEDING)

	affected.createwound(CUT, 1)
	affected.clamp_bleeder() //Hemostat function, clamp bleeders
	affected.surgery_open_stage = 2 //Can immediately proceed to other surgery steps
	target.updatehealth()
	return ..()

/datum/surgery_step/generic/incision_manager/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_warning("[user]的手在系统火花中猛地一震，用\the [tool]在[target]的[affected.display_name]上撕开了一个可怕的窟窿！"), \
	span_warning("Your hand jolts as the system sparks, ripping a gruesome hole in [target]'s [affected.display_name] with \the [tool]!"))
	target.balloon_alert_to_viewers("滑倒了！")
	affected.createwound(CUT, 20)
	affected.createwound(BURN, 15)
	affected.update_wounds()



/datum/surgery_step/generic/cut_with_laser
	priority = 0.1 //Attempt before generic scalpel step
	allowed_tools = list(
		/obj/item/tool/surgery/scalpel/laser3 = 95,
		/obj/item/weapon/energy/sword = 5,
	)

	min_duration = 60
	max_duration = 80
	open_step = 0
	can_infect = FALSE

/datum/surgery_step/generic/cut_with_laser/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 开始用 \the [tool] 在 [target] 的 [affected.display_name] 上进行无血切口。"), \
	span_notice("You start the bloodless incision on [target]'s [affected.display_name] with \the [tool]."))
	target.custom_pain("You feel a horrible, searing pain in your [affected.display_name]!", 1)
	target.balloon_alert_to_viewers("正在切开...")
	..()

/datum/surgery_step/generic/cut_with_laser/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 使用 \the [tool] 在 [target] 的 [affected.display_name] 上做了一个无血切口。"), \
	span_notice("You have made a bloodless incision on [target]'s [affected.display_name] with \the [tool]."))
	target.balloon_alert_to_viewers("成功")
	//Could be cleaner
	affected.surgery_open_stage = 1

	if(istype(target) && !(target.species.species_flags & NO_BLOOD))
		affected.add_limb_flags(LIMB_BLEEDING)

	affected.createwound(CUT, 1)
	affected.clamp_bleeder() //Hemostat function, clamp bleeders
	//spread_germs_to_organ(affected, user) //I don't see the reason for infection with a clean laser incision, when scalpel or ICS is fine
	affected.update_wounds()
	return ..()

/datum/surgery_step/generic/cut_with_laser/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_warning("[user]的手一滑，刀刃噼啪作响，用\the [tool]在[target]的[affected.display_name]上划出了一道长长的灼伤！"), \
	span_warning("Your hand slips as the blade sputters, searing a long gash in [target]'s [affected.display_name] with \the [tool]!"))
	target.balloon_alert_to_viewers("滑倒了！")
	affected.createwound(CUT, 7.5)
	affected.createwound(BURN, 12.5)
	affected.update_wounds()



/datum/surgery_step/generic/cut_open
	allowed_tools = list(
		/obj/item/tool/surgery/scalpel = 100,
		/obj/item/tool/kitchen/knife = 75,
		/obj/item/shard = 50,
		/obj/item/weapon/combat_knife = 25,
		/obj/item/stack/throwing_knife = 15,
		/obj/item/weapon/sword/mercsword = 1,
	)

	min_duration = 60
	max_duration = 80
	open_step = 0

/datum/surgery_step/generic/cut_open/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user]开始用\the [tool]在[target]的[affected.display_name]上做切口。"), \
	span_notice("You start the incision on [target]'s [affected.display_name] with \the [tool]."))
	target.custom_pain("You feel a horrible pain as if from a sharp knife in your [affected.display_name]!", 1)
	target.balloon_alert_to_viewers("正在切开...")
	..()

/datum/surgery_step/generic/cut_open/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 已使用 \the [tool] 在 [target] 的 [affected.display_name] 上做了一个切口。"), \
	span_notice("You have made an incision on [target]'s [affected.display_name] with \the [tool]."))
	target.balloon_alert_to_viewers("成功")
	affected.surgery_open_stage = 1

	if(istype(target) && !(target.species.species_flags & NO_BLOOD))
		affected.add_limb_flags(LIMB_BLEEDING)

	affected.createwound(CUT, 1)
	target.updatehealth()
	return ..()

/datum/surgery_step/generic/cut_open/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_warning("[user]的手滑了一下，用\the [tool]在错误的位置划开了[target]的[affected.display_name]！"), \
	span_warning("Your hand slips, slicing open [target]'s [affected.display_name] in the wrong place with \the [tool]!"))
	target.balloon_alert_to_viewers("滑倒了！")
	affected.createwound(CUT, 10)
	affected.update_wounds()



/datum/surgery_step/generic/clamp_bleeders
	allowed_tools = list(
		/obj/item/tool/surgery/hemostat = 100,
		/obj/item/stack/cable_coil = 75,
		/obj/item/assembly/mousetrap = 20,
	)

	min_duration = 40
	max_duration = 60

/datum/surgery_step/generic/clamp_bleeders/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected, checks_only)
	if(..())
		if(affected.surgery_open_stage && !(affected.limb_wound_status & LIMB_WOUND_CLAMPED))
			return SURGERY_CAN_USE
	return SURGERY_CANNOT_USE

/datum/surgery_step/generic/clamp_bleeders/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user]开始用\the [tool]夹住[target]的[affected.display_name]中的出血点。"), \
	span_notice("You start clamping bleeders in [target]'s [affected.display_name] with \the [tool]."))
	target.custom_pain("The pain in your [affected.display_name] is maddening!", 1)
	target.balloon_alert_to_viewers("夹紧中...")
	..()

/datum/surgery_step/generic/clamp_bleeders/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user]用\the [tool]夹住了[target]的[affected.display_name]上的出血点。"),	\
	span_notice("You clamp bleeders in [target]'s [affected.display_name] with \the [tool]."))
	target.balloon_alert_to_viewers("成功")
	affected.clamp_bleeder()
	spread_germs_to_organ(affected, user)
	return ..()

/datum/surgery_step/generic/clamp_bleeders/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_warning("[user]的手滑了一下，用\the [tool]撕裂了[target]的[affected.display_name]血管，造成大出血！"),	\
	span_warning("Your hand slips, tearing blood vessels and causing massive bleeding in [target]'s [affected.display_name] with \the [tool]!"))
	target.balloon_alert_to_viewers("滑倒了！")
	affected.createwound(CUT, 10)
	affected.update_wounds()



/datum/surgery_step/generic/retract_skin
	allowed_tools = list(
		/obj/item/tool/surgery/retractor = 100,
		/obj/item/tool/crowbar = 75,
		/obj/item/tool/kitchen/utensil/fork = 50,
	)

	min_duration = 30
	max_duration = 40
	open_step = 1

/datum/surgery_step/generic/retract_skin/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	if(target_zone == "groin")
		user.visible_message(span_notice("[user]开始用\the [tool]撬开切口，重新排列[target]下腹部的器官。"), \
		span_notice("You start to pry open the incision and rearrange the organs in [target]'s lower abdomen with \the [tool]."))
	else
		user.visible_message(span_notice("[user]开始用\the [tool]撬开[target]的[affected.display_name]上的切口。"), \
		span_notice("You start to pry open the incision on [target]'s [affected.display_name] with \the [tool]."))
	target.custom_pain("It feels like the skin on your [affected.display_name] is on fire!", 1)
	target.balloon_alert_to_viewers("正在切开...")
	..()

/datum/surgery_step/generic/retract_skin/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	if(target_zone == "chest")
		user.visible_message(span_notice("[user] 用 \the [tool] 撑开 [target] 躯干上的肋骨。"), \
		span_notice("You keep the ribcage open on [target]'s torso with \the [tool]."))
	else if(target_zone == "groin")
		user.visible_message(span_notice("[user] 用 \the [tool] 撑开 [target] 下腹部的切口。"), \
		span_notice("You keep the incision open on [target]'s lower abdomen with \the [tool]."))
	else
		user.visible_message(span_notice("[user] 用 \the [tool] 保持 [target] 的 [affected.display_name] 切口敞开。"), \
		span_notice("You keep the incision open on [target]'s [affected.display_name] with \the [tool]."))
	target.balloon_alert_to_viewers("成功")
	affected.surgery_open_stage = 2
	return ..()

/datum/surgery_step/generic/retract_skin/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	if(target_zone == "chest")
		user.visible_message(span_warning("[user]的手滑了一下，用\the [tool]损伤了[target]躯干内的数个器官！"), \
		span_warning("Your hand slips, damaging several organs in [target]'s torso with \the [tool]!"))
	if(target_zone == "groin")
		user.visible_message(span_warning("[user]的手滑了一下，用\the [tool]损伤了[target]下腹部的多个器官！"), \
		span_warning("Your hand slips, damaging several organs in [target]'s lower abdomen with \the [tool]!"))
	else
		user.visible_message(span_warning("[user]的手滑了一下，用\the [tool]撕开了[target] [affected.display_name]切口的边缘！"), \
		span_warning("Your hand slips, tearing the edges of the incision on [target]'s [affected.display_name] with \the [tool]!"))
	target.balloon_alert_to_viewers("滑倒了！")
	target.apply_damage(12, BRUTE, affected, 0, TRUE, updating_health = TRUE)
	affected.update_wounds()


/datum/surgery_step/generic/cauterize
	allowed_tools = list(
		/obj/item/tool/surgery/cautery = 100,
		/obj/item/clothing/mask/cigarette = 75,
		/obj/item/tool/lighter = 50,
		/obj/item/tool/weldingtool = 25,
	)

	min_duration = CAUTERY_MIN_DURATION
	max_duration = CAUTERY_MAX_DURATION
	can_infect = FALSE

/datum/surgery_step/generic/cauterize/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected, checks_only)
	if(..())
		if(affected.surgery_open_stage == 1 || affected.surgery_open_stage == 2)
			return SURGERY_CAN_USE
	return SURGERY_CANNOT_USE

/datum/surgery_step/generic/cauterize/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 正开始用 \the [tool] 烧灼 [target] 的 [affected.display_name] 上的切口。") , \
	span_notice("You are beginning to cauterize the incision on [target]'s [affected.display_name] with \the [tool]."))
	target.custom_pain("Your [affected.display_name] is being burned!", 1)
	target.balloon_alert_to_viewers("正在烧灼...")
	..()

/datum/surgery_step/generic/cauterize/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user]用\the [tool]烧灼了[target]的[affected.display_name]上的切口。"), \
	span_notice("You cauterize the incision on [target]'s [affected.display_name] with \the [tool]."))
	target.balloon_alert_to_viewers("成功")
	affected.surgery_open_stage = 0
	affected.remove_limb_flags(LIMB_BLEEDING)
	DISABLE_BITFIELD(affected.limb_wound_status, LIMB_WOUND_CLAMPED) //Once the incision is closed, any clamping we did doesn't matter
	return ..()

/datum/surgery_step/generic/cauterize/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_warning("[user]的手滑了一下，用\the [tool]在[target]的[affected.display_name]上留下了一个小灼伤！"), \
	span_warning("Your hand slips, leaving a small burn on [target]'s [affected.display_name] with \the [tool]!"))
	target.balloon_alert_to_viewers("滑倒了！")
	target.apply_damage(3, BURN, affected, updating_health = TRUE)

///Sewing people closed. Not fast, but works on corpses.
/datum/surgery_step/generic/repair
	allowed_tools = list(
		/obj/item/tool/surgery/suture = 100,
		/obj/item/stack/cable_coil = 75,
		/obj/item/shard = 20,
	)
	surgery_skill_required = SKILL_SURGERY_TRAINED
	open_step = 0
	min_duration = SUTURE_MIN_DURATION
	max_duration = SUTURE_MAX_DURATION
	///Healing applied on step success, split between burn and brute
	var/base_healing = 37.5

/datum/surgery_step/generic/repair/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected, checks_only)
	if(!..())
		return SURGERY_CANNOT_USE
	if(affected.has_external_wound())//limb has treatable damage
		return SURGERY_CAN_USE
	to_chat(user, span_notice("[target]的[affected.display_name]没有外部损伤。") )
	return SURGERY_INVALID

/datum/surgery_step/generic/repair/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 开始缝合 [target] 的 [affected.display_name] 上的伤口。")  , \
	span_notice("You are beginning to suture the wounds on [target]'s [affected.display_name].") )
	target.custom_pain("Your [affected.display_name] is getting stabbed!!", 1)
	target.balloon_alert_to_viewers("缝合中...")
	..()

/datum/surgery_step/generic/repair/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_notice("[user] 将[target]的[affected.display_name]上的一些伤口缝合了起来。") , \
	span_notice("You finish suturing some of the wounds on [target]'s [affected.display_name].") )
	target.balloon_alert_to_viewers("成功")
	var/skilled_healing = base_healing * max(user.skills.getPercent(SKILL_SURGERY, SKILL_SURGERY_MASTER), 0.1)
	var/burn_heal = min(skilled_healing, affected.burn_dam)
	var/brute_heal = max(skilled_healing - burn_heal, 0)
	affected.heal_limb_damage(brute_heal, burn_heal, updating_health = TRUE) //Corpses need their health updated manually since they don't do it themselves
	return ..()

/datum/surgery_step/generic/repair/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/limb/affected)
	user.visible_message(span_warning("[user]的手一滑，用\the [tool]撕开了[target]的皮肤！") , \
	span_warning("Your hand slips, tearing \the [tool] through [target]'s skin!") )
	target.balloon_alert_to_viewers("滑倒了！")
	affected.take_damage_limb(5, updating_health = TRUE)
