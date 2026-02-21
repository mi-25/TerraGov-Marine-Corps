//Sons of Mars
/datum/emergency_call/som
	name = "火星之子小队"
	base_probability = 26
	alignement_factor = 0
	///number of available special weapon dudes
	var/max_specialists = 1


/datum/emergency_call/som/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>You [pick("grew up in the mines working in horrible conditions until signing up to", "were part of a poor family until you decided to leave to join", "were born on a colony on Mars to a family of several brothers and sisters before leaving to", "worked at horrible conditions in the mines until deciding to leave to join")] the Sons of Mars (SoM).</b>")
	to_chat(H, "<B>作为独立殖民地邦联（ICC）的成员国，火星之子成立于2180年，是一个高度工业化的团体，拥有约20万名现役或受训成员的常备军。</b>")
	to_chat(H, "<B>尽管星际商业委员会拥有独立于其成员国的常备军，但大多数较大的成员国仍保留着自己的常备舰队和陆军，并拥有各自的装备和作战条令。</b>")
	to_chat(H, "")
	to_chat(H, "<B>今天，一艘地球政府飞船，[SSmapping.configs[SHIP_MAP].map_name]，在[SSmapping.configs[GROUND_MAP].map_name]轨道上发出了求救信号。这是我们发动攻击而不被拦截的机会！</b>")
	to_chat(H, "<B>消灭船上的地球政府人员，夺取舰船。如有国际商会特遣队（如国际商会武装部队）在场，则与他们合作达成此目标。不留俘虏。夺回曾经失去的一切。</B>")

/datum/emergency_call/som/do_activate(announce = TRUE)
	max_specialists = round(mob_max * 0.2)
	return ..()

/datum/emergency_call/som/create_member(datum/mind/M)
	. = ..()
	if(!.)
		return

	var/mob/original = M.current
	var/mob/living/carbon/human/H = .

	M.transfer_to(H, TRUE)

	if(original)
		qdel(original)

	print_backstory(H)

	if(!leader)
		leader = H
		var/datum/job/J = SSjob.GetJobType(/datum/job/som/ert/leader)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a member of the Sons of Mars assigned to lead this fireteam to the TGMC distress signal sent out nearby. Lead your fireteam to top-working conidition!")]</p>")
		return
	if(medics < max_medics)
		var/datum/job/J = SSjob.GetJobType(/datum/job/som/ert/medic)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a Sons of Mars medic assigned to this fireteam to respond to the TGMC distress signal sent out nearby. Keep your squad alive in this fight!")]</p>")
		medics++
		return
	if(max_specialists > 0)
		var/datum/job/J = SSjob.GetJobType(/datum/job/som/ert/specialist)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a veteran of the Sons of Mars trusted with specialised weaponry. You are assigned to this fireteam to respond to the TGMC distress signal sent out nearby. Do them proud and kill all who stand in your teams way!")]</p>")
		max_specialists --
		return
	if(prob(65))
		var/datum/job/J = SSjob.GetJobType(/datum/job/som/ert/veteran)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'>[span_notice("You are a veteran of the Sons of Mars and are assigned to this fireteam to respond to the TGMC distress signal sent out nearby. Do them proud and kill all who stand in your teams way!")]</p>")
		return

	var/datum/job/J = SSjob.GetJobType(/datum/job/som/ert/standard)
	H.apply_assigned_role_to_spawn(J)
	to_chat(H, span_notice("你是被指派前往地球政府殖民地海军陆战队附近求救信号的火星之子成员。保护好你自己和你的队友，消灭所有阻挡你们队伍的人！"))
