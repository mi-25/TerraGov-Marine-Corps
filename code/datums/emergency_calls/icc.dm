// ICC
/datum/emergency_call/icc
	name = "独立殖民地联盟小队"
	base_probability = 26
	alignement_factor = 0

/datum/emergency_call/icc/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>你是独立殖民地邦联武装力量（ICCAF）的一员，该组织由ICC组建，这是一个由前世代飞船殖民地组成的团体，它们联合起来建立了经济和军事联盟，以对抗其规模大得多的邻国地球政府。</b>")
	to_chat(H, "<B>尽管星际商业委员会拥有独立于其成员国的常备军，但大多数较大的成员国仍保留着自己的常备舰队和陆军，配备各自的装备和作战条令，而标准部队则因长期资金和人员不足而闻名。</b>")
	to_chat(H, "<B>因此，舰船人员中有很大一部分最终会作为临时地面人员服役，然而，被称为'卫兵'的真正步兵则以高素质部队而闻名。</b>")
	to_chat(H, "")
	to_chat(H, "<B>今天，一艘地球政府飞船，[SSmapping.configs[SHIP_MAP].map_name]，已在[SSmapping.configs[GROUND_MAP].map_name]轨道上发出求救信号。这是我们发动攻击而不被拦截的机会！</b>")
	to_chat(H, "<B>消灭船上的地球政府人员，夺取舰船。如有火星之子等国际商会特遣队，则在此目标上与他们合作。不留俘虏。</B>")

/datum/emergency_call/icc/create_member(datum/mind/M)
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
		var/datum/job/J = SSjob.GetJobType(/datum/job/icc/leader)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是被指派带领这支小队响应附近TGMC求救信号的ICC班长。保持你的团队完整，接管这艘船并完成任务！</span></p>")
		return

	if(medics < max_medics)
		var/datum/job/J = SSjob.GetJobType(/datum/job/icc/medic)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是一名ICCN医疗兵，负责确保这群人在响应附近发出的TGMC求救信号时不会死亡。让你的团队保持完整，接管这艘船，完成任务！</span></p>")
		medics++
		return

	if(prob(15))
		var/datum/job/J = SSjob.GetJobType(/datum/job/icc/guard)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a trained member of the ICCGF, unlike most you are a dedicated infantryman, better known as a 'Guardsman'. You have been attached to this ICCN group to investigate the TGMC distress signal sent nearby. Be the vanguard of your squad!")]</p>")
		return


	var/datum/job/J = SSjob.GetJobType(/datum/job/icc/standard)
	H.apply_assigned_role_to_spawn(J)
	to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是一名训练有素的ICCN成员，你被指派到这个小队，任务是调查附近发出的地球政府殖民地海军陆战队求救信号。不要让你和你的团队放松警惕！</notice></p>")
