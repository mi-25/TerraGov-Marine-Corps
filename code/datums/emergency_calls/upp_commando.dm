/datum/emergency_call/upp_commando
	name = "联合太空鳞翅目海盗精英"
	base_probability = 0
	shuttle_id = SHUTTLE_DISTRESS_UPP
	spawn_type = /mob/living/carbon/human/species/moth


/datum/emergency_call/upp_commando/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>You grew up on [pick(50;"an asteriod", 25;"a famished colony", 25;"a classified station")] with [pick(75;"few", 25;"some")] belongings or luxuries.</B>")
	to_chat(H, "<B>The family you grew up with were [pick(50;"getting by", 25;"impoverished", 25;"starving")] and you were one of [pick(10;"two", 20;"three", 30;"four", 20;"five", 20;"six")] children.</B>")
	to_chat(H, "<B>You come from a long line of [pick(25;"professionals", 25;"renegades", 50;"rogue soldiers")] and quickly joined the local band to improve your living conditions.</B>")
	to_chat(H, "")
	to_chat(H, "<B>今天，你和你的队友被联合太空鳞翅目派遣，在本地小行星带长时间静默潜伏后，前往[SSmapping.configs[SHIP_MAP].map_name]。开始渗透任务！</b>")
	to_chat(H, "<B>必要时消灭地球政府殖民地海军陆战队部队。除非平民先攻击你，否则不要伤害他们。</B>")
	to_chat(H, span_notice("You speak in a language that humans cannot understand, only you and your fellow pirates can.<br>Type in <b>\",0 <text>\" in the say verb</b> to speak in Galactic Common.<br>Type in <b>\";,0 <text>\" in the say verb</b> to commincate the radio in Galactic Common."))


/datum/emergency_call/upp_commando/create_member(datum/mind/M)
	. = ..()
	if(!.)
		return

	var/mob/original = M.current
	var/mob/living/carbon/human/H = .

	H.name = GLOB.namepool[/datum/namepool/moth].random_name(H)
	H.real_name = H.name

	M.transfer_to(H, TRUE)
	H.fully_replace_character_name(M.name, H.real_name)

	if(original)
		qdel(original)

	print_backstory(H)

	if(!leader)
		leader = H
		var/datum/job/J = SSjob.GetJobType(/datum/job/upp/commando/leader)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are the leader of the Elite USL pirate band.")]</p>")
		return

	if(medics < max_medics)
		var/datum/job/J = SSjob.GetJobType(/datum/job/upp/commando/medic)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are the medic of the Elite USL pirate band.")]</p>")
		medics++
		return

	var/datum/job/J = SSjob.GetJobType(/datum/job/upp/commando/leader)
	H.apply_assigned_role_to_spawn(J)
	to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a member of the Elite USL pirate band.")]</p>")
