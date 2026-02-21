//Sons of Mars
/datum/emergency_call/som_breachers
	name = "火星之子破门小队"
	base_probability = 13
	alignement_factor = 0
	///number of available special weapon dudes
	var/max_specialists = 1

/datum/emergency_call/som_breachers/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>You [pick("grew up in the mines working in horrible conditions until signing up to", "were part of a poor family until you decided to leave to join", "were born on a colony on Mars to a family of several brothers and sisters before leaving to", "worked at horrible conditions in the mines until deciding to leave to join", "have a proud family tradition of military service so enrolled as early as possible to serve")] the Sons of Mars (SoM).</b>")
	to_chat(H, "<B>Due to your [pick("marked distinction in combat", "ruthless record fighting against TGMC", "family's connections", "previous failures in combat")] you have been assigned to the 5th Special Assault Force of the SOM.</b>")
	to_chat(H, "<B>加入第五特种突击舰队被视为一项巨大荣誉，通常被派遣执行一些最危险的任务，特别专注于舰船作战。虽然伤亡率通常极高，但在第五舰队的成功往往能快速推进士兵的职业生涯。</b>")
	to_chat(H, "")
	to_chat(H, "<B>今天，一艘地球政府飞船，[SSmapping.configs[SHIP_MAP].map_name]，在[SSmapping.configs[GROUND_MAP].map_name]轨道上发出了求救信号。这是我们发动攻击而不被拦截的机会！</b>")
	to_chat(H, "<B>消灭船上的地球政府人员，夺取舰船。如有国际商会特遣队（如国际商会武装部队）在场，则与他们合作达成此目标。不留俘虏。夺回曾经失去的一切。</B>")

/datum/emergency_call/som_breachers/do_activate(announce = TRUE)
	max_specialists = floor(mob_max * 0.2)
	return ..()

/datum/emergency_call/som_breachers/create_member(datum/mind/M)
	. = ..()
	if(!.)
		return

	var/mob/original = M.current
	var/mob/living/carbon/human/H = .

	M.transfer_to(H, TRUE)

	if(original)
		qdel(original)

	print_backstory(H)

	var/datum/job/selected_job

	if(!leader)
		leader = H
		selected_job = SSjob.GetJobType(/datum/job/som/ert/leader/breacher)
		H.apply_assigned_role_to_spawn(selected_job)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a member of the Sons of Mars assigned to lead this elite breaching team, sent to response to the TGMC distress signal sent out nearby. Lead your team with conviction and crush the Terra Gov scum!")]</p>")
		return
	if(medics < max_medics)
		selected_job = SSjob.GetJobType(/datum/job/som/ert/medic/breacher)
		H.apply_assigned_role_to_spawn(selected_job)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a Sons of Mars medic assigned to this elite breaching team, sent to response to the TGMC distress signal sent out nearby. Keep your squad alive in this fight!")]</p>")
		medics++
		return
	if(max_specialists > 0)
		selected_job = SSjob.GetJobType(/datum/job/som/ert/breacher/specialist)
		H.apply_assigned_role_to_spawn(selected_job)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a veteran of the Sons of Mars trusted with specialised weaponry. You are assigned to this elite breaching team, sent to response to the TGMC distress signal sent out nearby. Do them proud and kill all who stand in your way!")]</p>")
		max_specialists --
		return

	selected_job = SSjob.GetJobType(/datum/job/som/ert/breacher)
	H.apply_assigned_role_to_spawn(selected_job)
	to_chat(H, span_notice("你是火星之子的一员，被分配到这支精英突击队，奉命响应附近发出的TGMC求救信号。你的职责是消灭所有发现的地球政府走狗。绝不手软！"))
