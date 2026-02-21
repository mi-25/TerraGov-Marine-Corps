/datum/emergency_call/deathsquad
	name = "纳米传讯死亡小队"
	base_probability = 0
	shuttle_id = SHUTTLE_DISTRESS_PMC


/datum/emergency_call/deathsquad/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>你隶属于一支背景保密的纳米传讯精英离岸部队。</b>")
	to_chat(H, "<B>Though rumors say that [pick("you work for a death squad group assigned in", "you were modified to not feel any emotions in a research lab of", "you were a soldier who was affected by PTSD after an operation in", "you were an product of a classified genetics research in", "you were an experimental soldier in the depths of", "left for dead and later recovered in", "listed as KIA but remained alive during a botchered operation in", 5;"raised literally from the depths of hell itself. Only until you were recovered in", 5;"raised literally from the Higher Power. But realized you were in")] [pick(10;"Mars", 10;"Earth's moon, Luna", 10;"Earth", 10;"a space station", "a war-ridden outpost", "a jungle", "a defunct TGMC-NT station", "a desert planet", "an icey colony", "a frozen cave system", "a molten planet", "a digsite", "a research outpost")].</B>")
	to_chat(H, "<B>尽管如此，你否认了所有那些谣言，并隐藏了自己的真实身份。</b>")
	to_chat(H, "")
	to_chat(H, "<B>Today, you and your squadmates are sent by Nanotrasen to the TGMC vessel, [SSmapping.configs[SHIP_MAP].map_name], after a long period of [pick("cryostasis", "rest and relaxation")].</b>")
	to_chat(H, "<B>你必须肃清并消灭所有与地球政府殖民地海军陆战队舰船 [SSmapping.configs[SHIP_MAP].map_name] 有关的人员...</b>")
	to_chat(H, "<b>直接服从纳米传讯中央指挥部的任何命令。</b>")


/datum/emergency_call/deathsquad/create_member(datum/mind/M)
	. = ..()
	if(!.)
		return

	var/mob/original = M.current
	var/mob/living/carbon/human/H = .

	H.name = pick(SSstrings.get_list_from_file("names/death_squad"))
	H.real_name = H.name

	M.transfer_to(H, TRUE)
	H.fully_replace_character_name(M.name, H.real_name)

	if(original)
		qdel(original)

	print_backstory(H)

	if(!leader)
		leader = H
		var/datum/job/J = SSjob.GetJobType(/datum/job/deathsquad/leader)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are the leader of the elite Asset Protection commando squad.")]</p>")
		return

	if(prob(70))
		var/datum/job/J = SSjob.GetJobType(/datum/job/deathsquad/standard)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a member of the elite Asset Protection commando squad.")]</p>")
		return

	var/datum/job/J = SSjob.GetJobType(/datum/job/deathsquad/gunner)
	H.apply_assigned_role_to_spawn(J)
	to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a member of the elite Asset Protection commando squad.")]</p>")
	return
