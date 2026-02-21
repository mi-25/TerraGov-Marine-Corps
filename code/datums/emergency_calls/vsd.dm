// VSD
/datum/emergency_call/vsd
	name = "维亚切斯拉夫安保特遣队PMC"
	base_probability = 26
	alignement_factor = 0

/datum/emergency_call/vsd/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>你是辛迪加私人武装的一员，隶属于维亚切斯拉夫安保分队。你的任务是不惜一切代价消灭这些企业渣滓。清除前进道路上的一切障碍。</b>")
	to_chat(H, "<B>你装备了弹道护甲以对抗地球政府的一些武器。耶格尔的护甲有弱点，瞄准头部和胸甲正下方。耶格尔对5.56口径弹药有弱点。</b>")
	to_chat(H, "<B>一艘地球政府舰船已进入辛迪加和星际商业委员会空域。你们的任务是击沉这艘船。祝好运。</B>")
	to_chat(H, "")

/datum/emergency_call/vsd/create_member(datum/mind/M)
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
		var/datum/job/J = SSjob.GetJobType(/datum/job/vsd/leader)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是'死亡小队'维亚切斯拉夫小组的指挥官。带领你的部下走向胜利，不留痕迹。呼哈！</span></p>")
		return

	if(medics < max_medics)
		var/datum/job/J = SSjob.GetJobType(/datum/job/vsd/medic)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是队伍的生命线。你装备齐全，能够治疗自己和他人，务必照顾好你的战友。呼啦！</span></p>")
		medics++
		return

	if(prob(15))
		var/datum/job/J = SSjob.GetJobType(/datum/job/vsd/spec)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are trained specially in several different skills. You are the gunner, frontliner, EXPLOSION! of your group. Welcome Specialist, protect your group at all costs. Hoorah!")]</p>")
		return


	var/datum/job/J = SSjob.GetJobType(/datum/job/vsd/standard)
	H.apply_assigned_role_to_spawn(J)
	to_chat(H, "<p style='font-size:1.5em'><span class='notice'>你是一名训练有素的维亚切斯拉夫特工。你不是消耗品。你接受了全方位的训练，以应对地球政府殖民地海军陆战队的各种武器。我们不会接受任何伤亡。祝你好运，士兵，呼啦！</notice></p>")
