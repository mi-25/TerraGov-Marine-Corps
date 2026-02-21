/obj/item/implant/neurostim
	name = "神经刺激器植入体"
	desc = "一种调节痛觉和感觉功能的植入体。其益处包括减轻疼痛、改善平衡能力，以及增强对过度刺激和方向迷失的抵抗力。为确保服从性，当植入体听到（非无线电）语音口令时，会施加负面刺激。该植入体可能随时间推移被身体免疫系统降解，因此偶尔可能发生故障。"
	icon_state = "implant_evil"
	implant_flags = ACTIVATE_ON_HEAR|BENEFICIAL_IMPLANT
	var/phrase = "supercalifragilisticexpialidocious"

/obj/item/implant/neurostim/get_data()
	return {"
	<b>Implant Specifications:</b><BR>
	<b>Name:</b> Nanotrasen NX-35 Neurostimulator Implant<BR>
	<HR>
	<b>Implant Details:</b><BR>
	<b>Function:</b> Stimulates and regulates sensorimotor function to optimize performance. Benefits include improved balance, and improved resistance to overstimulation and disoritentation.<BR>
	<b>Special Features:</b> To encourage compliance, negative stimulus is applied if the implant recieves a specified codeprhase.<BR>
	<b>Integrity:</b> Implant will be degraded by the body's immune system and thus occasionally malfunction."}

/obj/item/implant/neurostim/on_hear(datum/source, message, atom/movable/speaker, message_language, raw_message, radio_freq, list/spans, message_mode)
	if(findtext(message, phrase))
		activate()

/obj/item/implant/neurostim/activate(accidental = FALSE)
	. = ..()
	if(!.)
		return
	if(malfunction == MALFUNCTION_PERMANENT)
		return FALSE

	if(accidental) //was triggered by random chance or EMP
		playsound(implant_owner, 'sound/machines/buzz-two.ogg', 60, 1)
		implant_owner.visible_message(span_warning("Something buzzes inside [implant_owner][part ? "'s [part.display_name]" : ""]."))
	else
		playsound(implant_owner, 'sound/machines/twobeep.ogg', 60, 1)
		implant_owner.visible_message(span_warning("Something beeps inside [implant_owner][part ? "'s [part.display_name]" : ""]."))
	addtimer(CALLBACK(src, PROC_REF(shock_sparks)), 1 SECONDS)

///Plays a shocky animation
/obj/item/implant/neurostim/proc/shock_sparks()
	playsound(implant_owner, 'sound/effects/sparks2.ogg', 60, 1)
	var/datum/effect_system/spark_spread/s = new
	s.set_up(2, 1, src)
	s.start()
	addtimer(CALLBACK(src, PROC_REF(shock_collar)), 5)

///Shocks the owner for whatever reason
/obj/item/implant/neurostim/proc/shock_collar()
	implant_owner.visible_message(span_danger("[implant_owner] 痛苦地抽搐着！"), span_danger("Excruciating pain shoots through [part ? "your [part.display_name]" : "you"]!"))
	implant_owner.flash_act(1, TRUE)
	implant_owner.AdjustStun(20 SECONDS)
	implant_owner.Paralyze(20 SECONDS)
	implant_owner.apply_damage(100, STAMINA, part)
	implant_owner.apply_damage(5, BURN, part)
	UPDATEHEALTH(implant_owner)

/obj/item/implant/neurostim/implant(mob/living/carbon/human/target, mob/living/user)
	var/p = stripped_input(user, "Choose activation phrase:")
	if(!p)
		return FALSE
	phrase = p
	user.mind.store_memory("[src] in [target] can be made to deliver negative stimulus by saying something containing the phrase ''[phrase]'', <B>say [phrase]</B> to attempt to activate.", 0, 0)
	to_chat(user, span_notice("[src] 在 [target] 中可以通过说出包含短语 ''[phrase]'' 的内容来传递负面刺激，<B>说 [phrase]</B> 以尝试激活。"))
	return ..()


/obj/item/implant/neurostim/emp_act(severity)
	. = ..()
	if(malfunction)
		return
	if (prob(80))
		activate(TRUE)
	else
		meltdown()
