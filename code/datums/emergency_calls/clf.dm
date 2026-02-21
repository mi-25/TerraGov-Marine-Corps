//Colonial Liberation Front
/datum/emergency_call/clf
	name = "殖民地解放阵线小组"
	base_probability = 20
	alignement_factor = 0
	///number of available special weapon dudes
	var/max_specialists = 1


/datum/emergency_call/clf/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>You grew up [pick("on the TGMC prison station","in the LV-624 jungle","on a desert planet","on an icy colony")] to a[pick(50;" poor", 15;" well-off", 35;"n average")] family.</B>")
	to_chat(H, "<B>You joined the CLF because [pick(20;"you harbor a strong hatred for the oppressive TerraGov",5;"you are good at killing, and in times like these this is the place to be", 10;"your militia was absorbed into the CLF")] and you are considered a terrorist by the TGMC.</B>")
	to_chat(H, "<B>攻击地球政府殖民地海军陆战队，并尽可能进行破坏。确保任何幸存者都在你的监管下逃脱。</b>")


/datum/emergency_call/clf/create_member(datum/mind/M)
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
		var/datum/job/J = SSjob.GetJobType(/datum/job/clf/leader)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, span_notice("我是殖民地解放阵线的地方领导人。"))
		return
	if(medics < max_medics)
		var/datum/job/J = SSjob.GetJobType(/datum/job/clf/medic)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, span_notice("我是殖民地解放阵线的一名卫生员。"))
		medics++
		return
	if(max_specialists > 0)
		var/datum/job/J = SSjob.GetJobType(/datum/job/clf/specialist)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, span_notice("你是殖民地解放阵线（CLF）的专家。使用你的特殊武器，带领你的队伍走向胜利！"))
		max_specialists --
		return

	var/datum/job/J = SSjob.GetJobType(/datum/job/clf/standard)
	H.apply_assigned_role_to_spawn(J)
	to_chat(H, span_notice("我是殖民地解放阵线的一员。"))
