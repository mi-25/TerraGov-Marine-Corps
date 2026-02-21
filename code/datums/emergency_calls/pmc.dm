/datum/emergency_call/pmc
	name = "纳米传讯私人军事承包商小队"
	base_probability = 11
	alignement_factor = -2
	shuttle_id = SHUTTLE_DISTRESS_PMC
	///Number of current Smartgunners in this squad.
	var/smartgunners = 0
	///Max amount of Smartgunners allowed in this squad.
	var/max_smartgunners = 2
	///Number of current Snipers in this squad.
	var/snipers = 0
	///Max amount of Snipers allowed in this squad.
	var/max_snipers = 1

/datum/emergency_call/pmc/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>After leaving your [pick(75;"distant", 20;"close", 5;"ever-lovingly close")] [pick("family", "friends", "band of friends", "friend group", "relatives", "cousins")] [pick("behind", "behind in safety", "behind secretly", "behind regrettably")], you decided to join the ranks of a private military contracting group working for Nanotrasen.</b>")
	to_chat(H, "<B>Working there has proven to be [pick(50;"very", 20;"somewhat", 5;"astoundingly")] profitable for you.</b>")
	to_chat(H, "<B>While you are [pick("enlisted as", "officially", "part-time officially", "privately")] [pick("an employee", "a security officer", "an officer")], much of your work is off the books. You work as a skilled rapid-response contractor.</b>")
	to_chat(H, "")
	to_chat(H, "<B>今日，一艘 TGMC 舰船，[SSmapping.configs[SHIP_MAP].map_name]，已在 [SSmapping.configs[GROUND_MAP].map_name] 轨道上发出求救信号。时间紧迫，立即发射你们的穿梭机！</b>")
	to_chat(H, "<B>确保企业联络官的安全。</b>")
	to_chat(H, "<B>如果没有联络官，则消灭威胁并与舰长合作后返回家园。</b>")


/datum/emergency_call/pmc/create_member(datum/mind/M)
	. = ..()
	if(!.)
		return

	var/mob/original = M.current
	var/mob/living/carbon/human/H = .

	M.transfer_to(H, TRUE)
	H.fully_replace_character_name(M.name, H.real_name)

	if(original)
		qdel(original)

	print_backstory(H)

	if(!leader)
		leader = H
		var/datum/job/J = SSjob.GetJobType(/datum/job/pmc/leader)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are the leader of this private military contractor team in responding to the TGMC distress signal sent out nearby. Address the situation and get your team to safety!")]</p>")
		return

	if(smartgunners < max_smartgunners)
		var/datum/job/J = SSjob.GetJobType(/datum/job/pmc/gunner)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a PMC heavy gunner assigned to this team to respond to the TGMC distress signal sent out nearby. Be the back guard of your squad!")]</p>")
		smartgunners++
		return

	if(snipers < max_snipers)
		var/datum/job/J = SSjob.GetJobType(/datum/job/pmc/sniper)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a PMC heavy sniper assigned to this team to respond to the TGMC distress signal sent out nearby. Support your squad with long ranged firepower!")]</p>")
		snipers++
		return

	var/datum/job/J = SSjob.GetJobType(/datum/job/pmc/standard)
	H.apply_assigned_role_to_spawn(J)
	to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a private military contractor assigned to this team to respond to the TGMC distress signal sent out nearby. Assist your team and protect NT's interests whenever possible!")]</p>")
