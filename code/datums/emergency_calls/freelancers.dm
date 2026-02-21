/datum/emergency_call/freelancers
	name = "自由佣兵"
	base_probability = 26
	alignement_factor = -1
	///Number of current Grenadiers in this squad.
	var/grenadiers = 0
	///Max amount of Grenadiers allowed in this squad.
	var/max_grenadiers = 2
	///Number of current Specialists in this squad.
	var/specialists = 0
	///Max amount of Specialists allowed in this squad.
	var/max_specialists = 1


/datum/emergency_call/freelancers/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>You are part of a [pick(75;"distant", 25;"close")] family in a colony of [pick(25;"a space station", 25;"Earth", 50;"one of the many colonized planets")].</b>")
	to_chat(H, "<B>However, due to [pick("a famine", "a poverty", "a disease outbreak", "a small-scale disaster", "an uprising", "a mutiny", "the unbearable conditions", "the bad state", "the harsh opinion")] in your colony, you abandoned her. You were then hired by [pick("your cousin, who is a freelancer", "some freelancers", "a group of freelancers", "a squad of ex-military freelancers", "your long-lived companion, who is a freelancer")] to be part of a freelance mercenary group.</b>")
	to_chat(H, "")
	to_chat(H, "<B>今日，一艘TGMC舰船，[SSmapping.configs[SHIP_MAP].map_name]，已在[SSmapping.configs[GROUND_MAP].map_name]轨道上发出求救信号。希望你能够活着回来领到你的薪水！</b>")
	to_chat(H, "<B>确保它们不被摧毁。只要你活着，就能收取报酬。</b>")


/datum/emergency_call/freelancers/create_member(datum/mind/M)
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
		var/datum/job/J = SSjob.GetJobType(/datum/job/freelancer/leader)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是被指派领导这支队伍响应附近地球政府殖民地海军陆战队求救信号的自由佣兵。确保你的团队完好无损，这样才能让他们拿到报酬！</notice></p>")
		return

	if(specialists < max_specialists)
		var/datum/job/J = SSjob.GetJobType(/datum/job/freelancer/specialist)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是一名自由佣兵专家，被指派到这支队伍，以响应附近发出的地球政府殖民地海军陆战队求救信号。使用配发的重型装备支援你的团队！</notice></p>")
		specialists++
		return

	if(medics < max_medics)
		var/datum/job/J = SSjob.GetJobType(/datum/job/freelancer/medic)
		H.apply_assigned_role_to_spawn(J)
		medics++
		to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是一名自由佣兵医疗兵，被指派到这支队伍，响应附近地球政府殖民地海军陆战队发出的求救信号。别让你的队友在战斗中倒下！</span></p>")
		return

	if(grenadiers < max_grenadiers)
		var/datum/job/J = SSjob.GetJobType(/datum/job/freelancer/grenadier)
		H.apply_assigned_role_to_spawn(J)
		grenadiers++
		to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是一名自由佣兵老兵，被指派到这支队伍来响应附近发出的TGMC求救信号。成为第一道攻击线，用额外的火力支援你的团队！</span></p>")
		return

	var/datum/job/J = SSjob.GetJobType(/datum/job/freelancer/standard)
	H.apply_assigned_role_to_spawn(J)
	to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是一名自由佣兵，被指派到这个小组来响应附近发出的地球政府殖民地海军陆战队求救信号。不要让你和你的团队放松警惕！</span></p>")
