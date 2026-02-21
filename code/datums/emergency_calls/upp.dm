/datum/emergency_call/upp
	name = "联合太空鳞翅目海盗团"
	base_probability = 0
	shuttle_id = SHUTTLE_DISTRESS_UPP
	spawn_type = /mob/living/carbon/human/species/moth


/datum/emergency_call/upp/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>You grew up on [pick(50;"an asteriod", 25;"a famished colony", 25;"a classified station")] with [pick(75;"few", 25;"some")] belongings or luxuries.</B>")
	to_chat(H, "<B>The family you grew up with were [pick(50;"getting by", 25;"impoverished", 25;"starving")] and you were one of [pick(10;"two", 20;"three", 30;"four", 20;"five", 20;"six")] children.</B>")
	to_chat(H, "<B>You come from a long line of [pick(50;"pirates", 25;"renegades", 25;"rogue soldiers")] and quickly joined the local band to improve your living conditions.</B>")
	to_chat(H, "")
	to_chat(H, "<B>今日，一艘 TGMC 舰船，[SSmapping.configs[SHIP_MAP].map_name]，在 [SSmapping.configs[GROUND_MAP].map_name] 轨道上发出了求救信号。你的 USL 突击海盗战帮出动，你的劫掠开始了！</b>")
	to_chat(H, "<B>必要时消灭地球政府殖民地海军陆战队部队。除非平民先攻击你，否则不要伤害他们。</B>")
	to_chat(H, span_notice("You speak in a language that humans cannot understand, only you and your fellow pirates can.<br>Type in <b>\",0 <text>\" in the say verb</b> to speak in Galactic Common.<br>Type in <b>\";,0 <text>\" in the say verb</b> to commincate the radio in Galactic Common."))


/datum/emergency_call/upp/create_member(datum/mind/M)
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
		var/datum/job/J = SSjob.GetJobType(/datum/job/upp/leader)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are the leader of the USL pirate band in responding to the TGMC distress signal sent nearby. Let your squadmates march to battle, for the USL!")]</p>")
		return

	if(medics < max_medics)
		var/datum/job/J = SSjob.GetJobType(/datum/job/upp/medic)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a medic of the USL pirate band to respond to the TGMC distress signal sent nearby. Kit up and get ready to tend wounds!")]</p>")
		medics++
		return

	if(prob(20))
		var/datum/job/J = SSjob.GetJobType(/datum/job/upp/heavy)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a specialist of the USL pirate band to respond to the TGMC distress signal sent nearby. Crush the vermin!")]</p>")
		return

	var/datum/job/J = SSjob.GetJobType(/datum/job/upp/standard)
	H.apply_assigned_role_to_spawn(J)
	to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a member of the USL pirate band to respond to the TGMC distress signal sent nearby. Do not forget your training, stand tall with your other pirates!")]</p>")

/datum/emergency_call/upphvh
	name = "联合太空鳞翅目海盗帮（人类 vs 人类）"
	base_probability = 0
	shuttle_id = SHUTTLE_DISTRESS_UPP
	spawn_type = /mob/living/carbon/human/species/moth


/datum/emergency_call/upphvh/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>You grew up on [pick(50;"an asteriod", 25;"a famished colony", 25;"a classified station")] with [pick(75;"few", 25;"some")] belongings or luxuries.</B>")
	to_chat(H, "<B>The family you grew up with were [pick(50;"getting by", 25;"impoverished", 25;"starving")] and you were one of [pick(10;"two", 20;"three", 30;"four", 20;"five", 20;"six")] children.</B>")
	to_chat(H, "<B>You come from a long line of [pick(50;"pirates", 25;"renegades", 25;"rogue soldiers")] and quickly joined the local band to improve your living conditions.</B>")
	to_chat(H, "")
	to_chat(H, "<B>今日，一艘TGMC舰船，[SSmapping.configs[SHIP_MAP].map_name]，在[SSmapping.configs[GROUND_MAP].map_name]轨道上发出了求救信号。你们的联合太空鳞翅目突击海盗战帮出发了，你们的劫掠开始了！</b>")
	to_chat(H, "<B>必要时消灭地球政府殖民地海军陆战队部队。除非平民先攻击你，否则不要伤害他们。</B>")
	to_chat(H, span_notice("你使用一种人类无法理解的语言说话，只有你和你的海盗同伴能听懂。<br>在说话动词中输入<b>',0 <文本>'</b>来使用银河通用语说话。<br>在说话动词中输入<b>';,0 <文本>'</b>来使用银河通用语进行无线电通讯。"))


/datum/emergency_call/upphvh/create_member(datum/mind/M)
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
		var/datum/job/J = SSjob.GetJobType(/datum/job/upp/leader/hvh)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are the leader of the USL pirate band in responding to the TGMC distress signal sent nearby. Let your squadmates march to battle, for the USL!")]</p>")
		return

	if(medics < max_medics)
		var/datum/job/J = SSjob.GetJobType(/datum/job/upp/medic/hvh)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a medic of the USL pirate band to respond to the TGMC distress signal sent nearby. Kit up and get ready to tend wounds!")]</p>")
		medics++
		return

	if(prob(20))
		var/datum/job/J = SSjob.GetJobType(/datum/job/upp/heavy/hvh)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a specialist of the USL pirate band to respond to the TGMC distress signal sent nearby. Crush the vermin!")]</p>")
		return

	var/datum/job/J = SSjob.GetJobType(/datum/job/upp/standard/hvh)
	H.apply_assigned_role_to_spawn(J)
	to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a member of the USL pirate band to respond to the TGMC distress signal sent nearby. Do not forget your training, stand tall with your other pirates!")]</p>")

/datum/emergency_call/upphvh/human
	name = "联合太空鳞翅目海盗团（人类 vs 人类）"
	spawn_type = /mob/living/carbon/human
