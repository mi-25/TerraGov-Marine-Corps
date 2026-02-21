/datum/emergency_call/erp
	name = "紧急响应恶作剧者"
	base_probability = 0

/datum/emergency_call/erp/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>你是一名恶作剧者，隶属于紧急响应恶作剧者组织，专门负责为任何需要娱乐的场合提供欢乐</B>")
	to_chat(H, "<B>刚刚从[SSmapping.configs[SHIP_MAP].map_name]发出了一个信标，请求恶作剧和娱乐！</b>")
	to_chat(H, "<B>为那里的TGMC好人们助兴，确保所有非TGMC的反乐趣源头都被恶搞并迅速清除！</b>")

/datum/emergency_call/erp/create_member(datum/mind/M)
	. = ..()
	if(!.)
		return

	var/mob/original = M.current
	var/mob/living/carbon/human/H = .

	M.transfer_to(H, TRUE)
	H.fully_replace_character_name(M.name, pick("Bologna", "Giggles", "Bozo", "Gooby", "Smokey", "Gorgo", "Willy", "Bouba", "Kiki", "Goode", "Badde", "Ugglee",))

	if(original)
		qdel(original)

	print_backstory(H)

	if(!leader)
		leader = H
		var/datum/job/J = SSjob.GetJobType(/datum/job/erp/masterprankster)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are an ERP Master Prankster sent to entertain & prank at the TGMC distress signal location sent nearby. Coordinate your fellow entertainers & pranksters in bringing joy to this situation!")]</p>")
		return

	if(prob(30))
		var/datum/job/J = SSjob.GetJobType(/datum/job/erp/piethrower)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are an ERP Pie Thrower sent to entertain & prank at the TGMC distress signal location sent nearby. Fire your amazing explosive pies at the sources of anti-fun!")]</p>")
		return

	if(prob(30))
		var/datum/job/J = SSjob.GetJobType(/datum/job/erp/boobookisser)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are an ERP Boo-boo Kisser sent to entertain & prank at the TGMC distress signal location sent nearby. Use your anti-boo-boo equipment to keep your fellow pranksters alive & FUN!")]</p>")
		return

	var/datum/job/J = SSjob.GetJobType(/datum/job/erp)
	H.apply_assigned_role_to_spawn(J)
	to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are an ERP Prankster sent to entertain & prank at the TGMC distress signal location sent nearby. Entertain your friends & prank sources of anti-fun!")]</p>")
