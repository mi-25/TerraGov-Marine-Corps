/datum/emergency_call/retired
	name = "退役的TGMC老兵小队"
	base_probability = 5
	alignement_factor = -1

/datum/emergency_call/retired/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>你是一名地球政府海军陆战队的退役老兵。</b>")
	to_chat(H, "<B>虽然你可能已过巅峰时期，但高层指挥部认为你仍有足够能力被派往[SSmapping.configs[SHIP_MAP].map_name]，该舰最近发出了求救信号。</b>")
	to_chat(H, "<B>调查求救信号发出的原因，给年轻一代展示一下该怎么做！</b>")

/datum/emergency_call/retired/create_member(datum/mind/mind_to_assign)
	. = ..()
	if(!.)
		return
	var/mob/original = mind_to_assign.current
	var/mob/living/carbon/human/H = .

	if(H.physique == MALE)
		H.h_style = pick("Bald", "Balding Hair", "Balding Fade", "Balding ponytail", "Balding medium")
	else
		H.h_style = pick("Overeye Very Short", "Updo", "Ponytail 1")

	H.r_hair = 235
	H.g_hair = 235
	H.b_hair = 235
	H.r_facial = 235
	H.g_facial = 235
	H.b_facial = 235
	H.update_hair()

	mind_to_assign.transfer_to(H, TRUE)
	H.fully_replace_character_name(mind_to_assign.name, H.real_name)

	if(original)
		qdel(original)

	print_backstory(H)

	if(!leader)
		leader = H
		var/datum/job/J = SSjob.GetJobType(/datum/job/retired/leader)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是地球政府殖民地海军陆战队的退役老兵远征队长！带领你的战友们进行最后一次冲锋！</span></p>")
		return

	var/datum/job/J = SSjob.GetJobType(/datum/job/retired)
	H.apply_assigned_role_to_spawn(J)
	to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是一名经过改造的地球政府殖民地海军陆战队老兵，你可能已经用合成部件替换了一些肢体，但至少你还能走路！跟随探险队长，重温你的光辉岁月！</notice></p>")
