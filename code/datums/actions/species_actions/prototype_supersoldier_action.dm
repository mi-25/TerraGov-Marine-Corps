/atom/movable/stim_say_holder
	tts_silicon_voice_effect = TRUE
	speech_span = SPAN_ROBOT
	name = "兴奋剂植入体"

/datum/action/supersoldier_stims
	name = "注射兴奋剂"
	action_icon_state = "stim_menu"
	interaction_flags = INTERACT_OBJ_UI
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_KB_STIMS,
	)
	///list of currently running stims for this owner
	var/list/datum/stim/active_stims = list()
	///say holder we use to say things for fluff
	var/atom/movable/stim_say_holder/say_holder

/datum/action/supersoldier_stims/New(Target)
	. = ..()
	say_holder = new

/datum/action/supersoldier_stims/Destroy()
	. = ..()
	QDEL_NULL(say_holder)

/datum/action/supersoldier_stims/give_action(mob/M)
	. = ..()
	say_holder.forceMove(M)

/datum/action/supersoldier_stims/remove_action(mob/M)
	say_holder.moveToNullspace()
	return ..()


/datum/action/supersoldier_stims/can_use_action(silent, override_flags, selecting)
	. = ..()
	if(!.)
		return
	return !owner.incapacitated()

/datum/action/supersoldier_stims/action_activate()
	. = ..()
	if(!.)
		return
	interact(owner)

/datum/action/supersoldier_stims/ui_state()
	return GLOB.not_incapacitated_state

/datum/action/supersoldier_stims/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "SupersoldierStims")
		ui.open()

/datum/action/supersoldier_stims/ui_static_data(mob/user)
	var/static/list/data = list()
	if(!length(data)) // list not built yet
		data["stims"] = list()
		for(var/datum/stim/typepath AS in subtypesof(/datum/stim))
			if(typepath::stim_flags & STIM_ABSTRACT)
				continue
			data["stims"] += list(list(
				"name" = typepath::name,
				"desc" = typepath::desc,
				"uid" = typepath::stim_uid,
				"duration" = typepath::stim_duration,
				"allow_dupe" = (typepath::stim_flags & STIM_ALLOW_DUPE),
			))
		data["max_stims"] = MAX_ACTIVE_STIMS
	return data

GLOBAL_LIST_INIT(stim_type_lookup, init_stims())
/proc/init_stims()
	. = list()
	for(var/datum/stim/typepath AS in subtypesof(/datum/stim))
		.[typepath::stim_uid] = typepath

/datum/action/supersoldier_stims/ui_data(mob/user)
	var/list/data = list()
	data["active_stims"] = list()
	for(var/datum/stim/active_stim AS in active_stims)
		data["active_stims"] += list(list(
			"active_uid" = active_stim.stim_uid,
			"decisecondsleft" = ((active_stim.castedtime + active_stim.stim_duration) - world.time)
		))
	data["active_stimsets"] = user.client?.prefs.stim_sequences
	return data

/datum/action/supersoldier_stims/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	var/sequence_name = params["sequence"]
	var/list/stim_sequence
	if(sequence_name)
		if(!length(sequence_name))
			return FALSE
		if(!(sequence_name in owner.client?.prefs.stim_sequences))
			return FALSE
		stim_sequence = owner.client?.prefs.stim_sequences[sequence_name]

	var/stim_uid = params["stim"]
	if(stim_uid && !(stim_uid in GLOB.stim_type_lookup))
		return FALSE

	switch(action)
		if("cast_sequence")
			ui.close()
			cast_stim_sequence(stim_sequence)
			return FALSE

		if("change_pos")
			var/old_pos = text2num(params["old_pos"])
			var/new_pos = text2num(params["new_pos"])
			if(new_pos < 1)
				new_pos = length(stim_sequence)
			else if (new_pos > length(stim_sequence))
				new_pos = 1
			stim_sequence.Swap(old_pos, new_pos)
			owner.client?.prefs.save_preferences()
			return TRUE

		if("remove_from_sequence")
			var/old_pos = text2num(params["old_pos"])
			stim_sequence.Cut(old_pos, old_pos + 1)
			owner.client?.prefs.save_preferences()
			return TRUE

		if("add_to_sequence")
			if(length(stim_sequence) >= MAX_ACTIVE_STIMS)
				to_chat(owner, span_info("不能拥有超过[MAX_ACTIVE_STIMS]个兴奋剂。"))
				return FALSE
			var/datum/stim/stim_type = GLOB.stim_type_lookup[stim_uid]
			if((stim_uid in stim_sequence) && !(stim_type::stim_flags & STIM_ALLOW_DUPE))
				to_chat(owner, span_info("无法复制此兴奋剂"))
				return FALSE
			stim_sequence += stim_uid
			owner.client?.prefs.save_preferences()
			return TRUE

		if("new_sequence")
			var/new_name = params["new_name"]
			if(!istext(new_name) || !length(new_name))
				return FALSE
			if(new_name in owner.client?.prefs.stim_sequences)
				to_chat(owner, "该序列已存在！")
				return FALSE
			owner.client?.prefs.stim_sequences[new_name] = list()
			owner.client?.prefs.save_preferences()
			return TRUE

		if("delete_sequence")
			owner.client?.prefs.stim_sequences -= sequence_name
			owner.client?.prefs.save_preferences()
			return TRUE

///takes a list of stim types or stim UIDs to cast them in an order with all the fanfare associated it like yelling it out and sounds
/datum/action/supersoldier_stims/proc/cast_stim_sequence(list/stim_types)
	var/list/datum/stim/stims = list()
	for(var/typepath in stim_types)
		if(!ispath(typepath))
			typepath = GLOB.stim_type_lookup[typepath]
			if(!ispath(typepath))
				stack_trace("bad stim passed, must be UID or type: [typepath]")
				continue
		stims += new typepath
	for(var/datum/stim/stim AS in stims)
		if(!stim.can_cast(owner, src))
			return
		playsound(owner.loc, 'sound/machines/hiss.ogg', 30, TRUE)
		say_holder.say(stim.cast_say, forced=TRUE)
		if(!do_after(owner, stim.cast_delay, extra_checks=CALLBACK(stim, TYPE_PROC_REF(/datum/stim, can_cast), owner, src)))
			return
		stim.finish_cast(owner)
		stim.castedtime = world.time
		active_stims += stim
		addtimer(CALLBACK(src, PROC_REF(clean_stim), stim), stim.stim_duration)

///commands a stim to clean itself up and cleans iwhats needed from its end
/datum/action/supersoldier_stims/proc/clean_stim(datum/stim/stim)
	if(!(stim in active_stims)) // cleaned up already by something else, mostly for timer/qdel skew
		return
	active_stims -= stim
	stim.end_effects(owner)
	qdel(stim)
	if(length(active_stims) < 1)
		owner.balloon_alert(owner, "兴奋剂注射完毕")

/datum/stim
	/// displayed in UI
	var/name = "DEFAULT STIM"
	/// displayed as desc in the UI
	var/desc = "Example simple desc"
	///UIDS BETWEEN STIMS MUST BE UNIQUE, THIS IS USED FOR PREF (SO DONT CHANGE IT) AND IDENTIFICATION IN THE TGUI
	var/stim_uid = "DO NOT SAVE"
	///what we say when casting the stim
	var/cast_say = "GAYT"
	/// on init, typepath to make particles, once finish cast executes then the actual effects
	var/obj/effect/abstract/particle_holder/particles

	/// stim flags see species.dm defines
	var/stim_flags = NONE
	///how long we last this stim, cannot recast if its not duplicatable during this time
	var/stim_duration = STIM_DURATION_DEFAULT
	///delay while casting until the next stim
	var/cast_delay = 2.5 SECONDS

	///last world.time that this stim was cast at, for tracking in UI
	var/castedtime

///bool return as to whether we are currently alllowed to cats this stim
/datum/stim/proc/can_cast(mob/living/owner, datum/action/supersoldier_stims/action, silent=FALSE)
	SHOULD_CALL_PARENT(TRUE)
	for(var/datum/action/supersoldier_stims/stim AS in action.active_stims)
		if((type == stim.type) && !(stim_flags & STIM_ALLOW_DUPE))
			if(!silent)
				owner.balloon_alert(owner, "无法复制兴奋剂！")
			return FALSE
	if(length(action.active_stims) >= MAX_ACTIVE_STIMS)
		if(!silent)
			owner.balloon_alert(owner, "注射太多兴奋剂了！")
		return FALSE
	return TRUE

/// all effects to apply/play when applying this stim
/datum/stim/proc/finish_cast(mob/living/owner)
	if(particles)
		particles = new(owner, particles)

/// any extra effects to play/cleanup when the stim ends
/datum/stim/proc/end_effects(mob/living/owner)
	if(particles)
		QDEL_NULL(particles)

/datum/stim/status_effect
	stim_flags = STIM_ABSTRACT
	///typepath for status effect we are going to be applying
	var/effect_type = /datum/status_effect

/datum/stim/status_effect/finish_cast(mob/living/owner)
	owner.set_timed_status_effect(stim_duration, effect_type, only_if_higher = TRUE)

/datum/stim/trait
	stim_flags = STIM_ABSTRACT
	/// trait we will be applying
	var/trait_type = null

/datum/stim/trait/finish_cast(mob/living/owner)
	ADD_TRAIT(owner, trait_type, SUPERSOLDIER_TRAIT)
	return ..()

/datum/stim/trait/end_effects(mob/living/owner)
	REMOVE_TRAIT(owner, trait_type, SUPERSOLDIER_TRAIT)
	return ..()

/datum/stim/trait/immediate_defib
	name = "立即除颤"
	desc = "自动将生命值设为除颤器阈值以下1点。连续使用两次将造成足够伤害摧毁使用者的心脏。"
	cast_say = "Injecting tissue stimulants..."
	stim_uid = "immediate_defib"
	stim_flags = NONE
	trait_type = TRAIT_IMMEDIATE_DEFIB

/datum/stim/trait/instant_death
	name = "心脏骤停"
	desc = "当用户生命值达到危急状态时，立即通过电击使其心脏停跳，造成足以致死的缺氧伤害。"
	cast_say = "Injecting conditional poisons..."
	stim_uid = "crit_is_death"
	stim_flags = NONE
	trait_type = TRAIT_CRIT_IS_DEATH

/datum/stim/trait/no_ear_damage
	name = "耳部抗性"
	desc = "强化你的听觉，使其在激活期间免疫耳部伤害。"
	cast_say = "Reinforcing auricle..."
	stim_uid = "deafnessimmunity"
	stim_flags = NONE
	trait_type = TRAIT_EARDAMAGE_IMMUNE

/datum/stim/trait/no_flashbang
	name = "闪光抗性"
	desc = "强化你的眼睛，使其在激活期间免疫强光闪烁。但不会让你免疫眼部伤害！"
	cast_say = "Reinforcing oculus..."
	stim_uid = "noflashbang"
	stim_flags = NONE
	trait_type = TRAIT_FLASHBANGIMMUNE

/datum/stim/trait/no_footsteps
	name = "无声脚步"
	desc = "重塑你的双脚，使其暂时完全无声。"
	cast_say = "Adjusting pedisurface..."
	stim_uid = "nofootsteps"
	stim_flags = NONE
	trait_type = TRAIT_SILENT_FOOTSTEPS

/datum/stim/trait/quick_getup
	name = "快速起身"
	desc = "增强下肢肌肉反应能力，使你在倒地后能迅速起身。"
	cast_say = "Enhancing muscular responsiveness..."
	stim_uid = "quickgetup"
	stim_flags = NONE
	trait_type = TRAIT_QUICK_GETUP

/datum/stim/trait/tank_collision_immunity
	name = "载具撞击免疫"
	desc = "强化你的身体重量，使你免疫载具撞击造成的移动和伤害。"
	cast_say = "Increasing bone density..."
	stim_uid = "tankcollisionimmunity"
	stim_flags = NONE
	trait_type = TRAIT_STOPS_TANK_COLLISION

/datum/stim/portal_toggle
	name = "传送门弱点"
	desc = "通过混合定向同位素反转你的维度对齐，如果你原本对传送门免疫，现在将不再免疫；如果你原本无法通过传送门，现在将能够通过。"
	cast_say = "Inverting polarity..."
	stim_uid = "portallchange"
	stim_flags = NONE

/datum/stim/portal_toggle/finish_cast(mob/living/owner)
	owner.resistance_flags ^= PORTAL_IMMUNE
	return ..()

/datum/stim/portal_toggle/end_effects(mob/living/owner)
	owner.resistance_flags ^= PORTAL_IMMUNE
	return ..()

/datum/stim/speed_increase
	name = "速度提升"
	desc = "提升你的移动速度，使你行走和移动被动加快。"
	cast_say = "Administering adrenaline..."
	stim_uid = "speedincrease"
	particles = /particles/stims/speed
	stim_flags = NONE

/datum/stim/speed_increase/finish_cast(mob/living/owner)
	owner.add_movespeed_modifier(MOVESPEED_ID_STIM_INCREASE, TRUE, 0, NONE, TRUE, -0.5)
	return ..()

/datum/stim/speed_increase/end_effects(mob/living/owner)
	owner.remove_movespeed_modifier(MOVESPEED_ID_STIM_INCREASE)
	return ..()

/datum/stim/stam_usage_decrease
	name = "体力效率"
	desc = "提升你的移动灵活性，让你消耗耐力更慢。"
	cast_say = "Administering synephrine..."
	stim_uid = "stamusedecrease"
	stim_flags = STIM_ALLOW_DUPE
	///cached amount that we edited
	var/amount_edited

/datum/stim/stam_usage_decrease/finish_cast(mob/living/owner)
	var/datum/component/stamina_behavior/stam = owner.GetComponent(/datum/component/stamina_behavior)
	amount_edited = stam.stim_drain_modifier * 0.3
	stam.stim_drain_modifier -= amount_edited
	return ..()

/datum/stim/stam_usage_decrease/end_effects(mob/living/owner)
	var/datum/component/stamina_behavior/stam = owner.GetComponent(/datum/component/stamina_behavior)
	stam.stim_drain_modifier += amount_edited
	return ..()


/datum/stim/stamina_regen
	name = "体力恢复"
	desc = "提升你对疲劳的抵抗力，使你更缓慢地消耗体力。"
	cast_say = "Administering amphetamines..."
	stim_uid = "stamregenincrease"
	stim_flags = STIM_ALLOW_DUPE

/datum/stim/stamina_regen/finish_cast(mob/living/owner)
	owner.add_stamina_regen_modifier(name, 3*STAMINA_SKILL_REGEN_MOD) //equates 3 levels of stam skill
	return ..()

/datum/stim/stamina_regen/end_effects(mob/living/owner)
	owner.remove_stamina_regen_modifier(name)
	return ..()

/datum/stim/skills
	stim_flags = STIM_ABSTRACT
	///assoc list list(SKILL = AMT_TOCHANGE) for when we want to let themm use it
	var/list/skills
	///assoc list list(SKILL = MAXIMUM_INT) for when we dont want to let them cast this
	var/list/max_skills

/datum/stim/skills/can_cast(mob/living/owner, datum/action/supersoldier_stims/action, silent)
	. = ..()
	for(var/skill in max_skills)
		if(owner.skills.getRating(skill) >= max_skills[skill])
			if(!silent)
				owner.balloon_alert(owner, "技能等级已过高！")
			return FALSE

/datum/stim/skills/finish_cast(mob/living/owner)
	. = ..()
	owner.set_skills(owner.skills.modifyRating(arglist(skills)))

/datum/stim/skills/end_effects(mob/living/owner)
	. = ..()
	var/list/negativeskills = skills.Copy()
	for(var/skill in negativeskills)
		negativeskills[skill] = -negativeskills[skill]
	owner.set_skills(owner.skills.modifyRating(arglist(negativeskills)))

/datum/stim/skills/melee
	name = "近战技能"
	desc = "用魔法强化你的攻击，提升你的近战技能。"
	cast_say = "Neural reaction module loading..."
	stim_uid = "meleeskillbuff"
	stim_flags = STIM_ALLOW_DUPE
	skills = list(SKILL_MELEE_WEAPONS = 1)
	max_skills = list(SKILL_MELEE_WEAPONS = SKILL_MELEE_SUPER)

/datum/stim/skills/powerloader
	name = "动力装载机技能"
	desc = "提升你操作动力装载机的技能。"
	cast_say = "Neural powerloader module loading..."
	stim_uid = "powerloaderskillbuff"
	stim_flags = STIM_ALLOW_DUPE
	skills = list(SKILL_POWERLOADER = 1)
	max_skills = list(SKILL_POWERLOADER = SKILL_POWERLOADER_PRO) // ensures RO and such are still better

/particles/stims
	count = 10
	spawning = 1
	gravity = list(0, -0.03)
	icon = 'icons/effects/particles/generic_particles.dmi'
	lifespan = 10
	fade = 8
	color = 1
	color_change = 0.05
	position = generator(GEN_SPHERE, 0, 14, NORMAL_RAND)

/particles/stims/speed
	icon_state = "square"
	gradient = list(1, "#001eff", 2, "#00ffc3", "loop")

/datum/stim/better_throw
	name = "投掷距离增加"
	desc = "增强你的投掷力量，让你能把东西扔得更远。"
	cast_say = "Administering muscle enhancers..."
	stim_uid = "throwstrength"
	stim_flags = NONE

/datum/stim/better_throw/finish_cast(mob/living/owner)
	. = ..()
	RegisterSignal(owner, COMSIG_MOB_THROW, PROC_REF(on_throw))

/datum/stim/better_throw/end_effects(mob/living/owner)
	. = ..()
	UnregisterSignal(owner, COMSIG_MOB_THROW)

/datum/stim/better_throw/proc/on_throw(mob/living/owner, atom/target, atom/movable/thrown_thing, list/throw_modifiers)
	SIGNAL_HANDLER
	throw_modifiers["range_modifier"] += 4
	throw_modifiers["targetted_throw"] = FALSE
