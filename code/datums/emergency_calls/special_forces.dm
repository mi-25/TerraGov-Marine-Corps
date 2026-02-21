/datum/emergency_call/special_forces
	name = "本地系统特种部队"
	base_probability = 15
	alignement_factor = -1
	///number of available special weapon dudes
	var/max_specialists = 1

/datum/emergency_call/special_forces/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>你是本地特种反应部队的一员，驻扎在这个孤立星系中，接受了良好的训练并配备了精良的装备。</b>")
	to_chat(H, "<B>通常，你大部分时间都在为这里的少数大人物提供安保，期间穿插着基地内的休整和偶尔的人质事件。</b>")
	to_chat(H, "")
	to_chat(H, "<B>然而，最近一处当地定居点突然失联，发出了求救信号，恰逢一艘TGMC舰船，[SSmapping.configs[SHIP_MAP].map_name]号出现在轨道上，两者很可能有关联。</b>")
	to_chat(H, "<B>调查他们的存在，并尽力帮助下方的殖民地！</b>")

/datum/emergency_call/special_forces/create_member(datum/mind/M)
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
		var/datum/job/J = SSjob.GetJobType(/datum/job/special_forces/leader)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是被指派带领这支特遣队，前往响应附近发出的地球政府殖民地海军陆战队求救信号的特种部队舰长。保持你的队伍完整，完成任务！</notice></p>")
		return
	if(max_specialists > 0)
		var/datum/job/J = SSjob.GetJobType(/datum/job/special_forces/drone_operator)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are the specially trained drone operator of this special force group directed to investigate the TGMC distress signal sent nearby. Don't let you and your team's guard down!")]</p>")
		max_specialists --
		return
	if(prob(30))
		var/datum/job/J = SSjob.GetJobType(/datum/job/special_forces/breacher)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a specially trained member of this special force group directed to investigate the TGMC distress signal sent nearby. Be the vanguard of your squad!")]</p>")
		return
	var/datum/job/J = SSjob.GetJobType(/datum/job/special_forces/standard)
	H.apply_assigned_role_to_spawn(J)
	to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是一名训练有素的该特种部队成员，奉命调查附近发出的地球政府殖民地海军陆战队求救信号。不要让你和你的团队放松警惕！</notice></p>")
