#define LARVAL_HUGGER "larval hugger"
#define CLAWED_HUGGER "clawed hugger"
#define NEURO_HUGGER "neurotoxin hugger"
#define ACID_HUGGER "acid hugger"
#define RESIN_HUGGER "resin hugger"
#define OZELOMELYN_HUGGER "ozelomelyn hugger"

//List of huggie types
GLOBAL_LIST_INIT(hugger_type_list, list(
		/obj/item/clothing/mask/facehugger/larval,
		/obj/item/clothing/mask/facehugger/combat/slash,
		/obj/item/clothing/mask/facehugger/combat/chem_injector/neuro,
		/obj/item/clothing/mask/facehugger/combat/chem_injector/ozelomelyn,
		/obj/item/clothing/mask/facehugger/combat/acid,
		/obj/item/clothing/mask/facehugger/combat/resin,
		))

GLOBAL_LIST_INIT(hugger_to_ammo, list(
	/obj/item/clothing/mask/facehugger/larval = /datum/ammo/xeno/hugger,
	/obj/item/clothing/mask/facehugger/combat/slash = /datum/ammo/xeno/hugger/slash,
	/obj/item/clothing/mask/facehugger/combat/chem_injector/neuro = /datum/ammo/xeno/hugger/neuro,
	/obj/item/clothing/mask/facehugger/combat/chem_injector/ozelomelyn = /datum/ammo/xeno/hugger/ozelomelyn,
	/obj/item/clothing/mask/facehugger/combat/acid = /datum/ammo/xeno/hugger/acid,
	/obj/item/clothing/mask/facehugger/combat/resin = /datum/ammo/xeno/hugger/resin,
))

//List of huggie images
GLOBAL_LIST_INIT(hugger_images_list,  list(
	LARVAL_HUGGER = image('icons/Xeno/actions/carrier.dmi', icon_state = LARVAL_HUGGER),
	CLAWED_HUGGER = image('icons/Xeno/actions/carrier.dmi', icon_state = CLAWED_HUGGER),
	NEURO_HUGGER = image('icons/Xeno/actions/carrier.dmi', icon_state = NEURO_HUGGER),
	OZELOMELYN_HUGGER = image('icons/Xeno/actions/carrier.dmi', icon_state = OZELOMELYN_HUGGER),
	ACID_HUGGER = image('icons/Xeno/actions/carrier.dmi', icon_state = ACID_HUGGER),
	RESIN_HUGGER = image('icons/Xeno/actions/carrier.dmi', icon_state = RESIN_HUGGER),
))

// ***************************************
// *********** Hugger throw
// ***************************************
/datum/action/ability/activable/xeno/throw_hugger
	name = "Use/Throw Facehugger"
	action_icon_state = "throw_hugger"
	action_icon = 'icons/Xeno/actions/carrier.dmi'
	desc = "向目标投掷抱脸虫。对已在地面上的抱脸虫使用此能力可将其回收至储存空间。"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_THROW_HUGGER,
	)
	cooldown_duration = 3 SECONDS
	/// If the owner has the Resin Jelly Coating status effect, how much deciseconds should its duration be decreased by to grant thrown huggers fire immunity?
	var/fire_immunity_transfer = 0 SECONDS
	/// The mulitplier to modify the Facehugger's impact_time, activate_time, and proximity_time by.
	var/activation_time_multiplier = 1
	/// The range in which the Facehugger can leap.
	var/leapping_range = 4
	/// Should a fake facehugger be created as well? If so, what percentage should be used for the gradiant between fake facehugger's color and thrown facehugger's color?
	var/fake_hugger_gradiant_percentage = 0

/datum/action/ability/activable/xeno/throw_hugger/get_cooldown()
	return xeno_owner.xeno_caste.hugger_delay

/datum/action/ability/activable/xeno/throw_hugger/can_use_ability(atom/A, silent = FALSE, override_flags) // true
	. = ..()
	if(!.)
		return FALSE
	if(!A)
		return FALSE

/datum/action/ability/activable/xeno/throw_hugger/use_ability(atom/A)
	//target a hugger on the ground to store it directly (unless its a fake/harmless hugger)
	if(istype(A, /obj/item/clothing/mask/facehugger) && !istype(A, /obj/item/clothing/mask/facehugger/combat/harmless))
		if(isturf(get_turf(A)) && xeno_owner.Adjacent(A))
			if(!xeno_owner.issamexenohive(A))
				to_chat(xeno_owner, span_warning("那只抱脸虫被污染了！"))
				xeno_owner.dropItemToGround(A)
				return fail_activate()
			xeno_owner.store_hugger(A)
			return succeed_activate()

	var/obj/item/clothing/mask/facehugger/F = xeno_owner.get_active_held_item()
	if(!istype(F) || F.stat == DEAD) //empty active hand
		//if no hugger in active hand, we take one from our storage
		if(!xeno_owner.huggers)
			to_chat(xeno_owner, span_warning("我们没有抱脸虫可用！"))
			return fail_activate()

		F = new xeno_owner.selected_hugger_type(get_turf(xeno_owner), xeno_owner.hivenumber, xeno_owner)
		xeno_owner.huggers--

		xeno_owner.put_in_active_hand(F)
		to_chat(xeno_owner, span_xenonotice("我们从储存中取出一只抱脸虫。当前庇护数量：[xeno_owner.huggers] / [xeno_owner.xeno_caste.huggers_max]。"))

	if(!cooldown_timer)
		if(fire_immunity_transfer > 0)
			var/datum/status_effect/resin_jelly_coating/fire_immunity_effect = xeno_owner.has_status_effect(STATUS_EFFECT_RESIN_JELLY_COATING)
			if(fire_immunity_effect)
				fire_immunity_effect.duration = max(1, fire_immunity_effect.duration - fire_immunity_transfer)
				fire_immunity_effect.check_duration()
				F.set_fire_immunity(TRUE)
		F.impact_time = max(0.5 SECONDS, initial(F.impact_time) * activation_time_multiplier)
		F.activate_time = max(0.5 SECONDS, initial(F.activate_time) * activation_time_multiplier)
		F.proximity_time = max(0.5 SECONDS, initial(F.proximity_time) * activation_time_multiplier)
		F.leap_range = leapping_range
		xeno_owner.dropItemToGround(F)
		playsound(xeno_owner, 'sound/effects/throw.ogg', 30, TRUE)
		F.stat = CONSCIOUS //Hugger is conscious
		F.leaping = FALSE //Hugger is not leaping
		F.facehugger_register_source(xeno_owner) //Set us as the source
		F.throw_at(A, CARRIER_HUGGER_THROW_DISTANCE, CARRIER_HUGGER_THROW_SPEED)
		if(fake_hugger_gradiant_percentage > 0 && !istype(F, /obj/item/clothing/mask/facehugger/combat/harmless))
			var/obj/item/clothing/mask/facehugger/combat/harmless/fake = new(get_turf(xeno_owner), xeno_owner.hivenumber, xeno_owner)
			fake.set_fire_immunity(F.fire_immune)
			fake.impact_time = F.impact_time
			fake.activate_time = F.activate_time
			fake.proximity_time = F.proximity_time
			fake.leap_range = F.leap_range
			fake.stat = F.stat
			fake.leaping = F.leaping
			fake.facehugger_register_source(xeno_owner)
			fake.throw_at(get_step(A, pick(CARDINAL_ALL_DIRS)), CARRIER_HUGGER_THROW_DISTANCE, CARRIER_HUGGER_THROW_SPEED)
			fake.color = gradient(initial(fake.color), initial(F.color), fake_hugger_gradiant_percentage)
		xeno_owner.visible_message(span_xenowarning("\The [xeno_owner] 向 \the [A] 投掷了什么东西！"), \
		span_xenowarning("We throw a facehugger towards \the [A]!"))
		add_cooldown()
		return succeed_activate()

/mob/living/carbon/xenomorph/proc/store_hugger(obj/item/clothing/mask/facehugger/F, message = TRUE, forced = FALSE) //todo: wrap this into ability
	if(huggers < xeno_caste.huggers_max)
		if(F.stat == DEAD && !forced)
			to_chat(src, span_notice("这只抱脸虫已经死亡，我们无法回收利用。"))
			return
		F.kill_hugger()
		huggers++
		if(message)
			playsound(src, 'sound/voice/alien/drool2.ogg', 50, 0, 1)
			to_chat(src, span_notice("我们回收这只抱脸虫的生物质来生产另一只。当前庇护数量：[huggers] / [xeno_caste.huggers_max]。"))
	else if(message)
		to_chat(src, span_warning("我们没法再带更多抱脸虫了！"))

// ***************************************
// ********* Trap
// ***************************************
/datum/action/ability/xeno_action/place_trap
	name = "Place trap"
	action_icon_state = "place_trap"
	action_icon = 'icons/Xeno/actions/construction.dmi'
	desc = "在菌毯上放置一个可填入抱脸虫或酸液的坑洞。当陆战队员踩上时触发。"
	ability_cost = 400
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_PLACE_TRAP,
	)
	use_state_flags = ABILITY_USE_LYING
	/// The amount of huggers that can be stored in the created trap.
	var/trap_hugger_limit = 1

/datum/action/ability/xeno_action/place_trap/can_use_action(silent, override_flags, selecting)
	. = ..()
	var/turf/T = get_turf(owner)
	if(!T || !T.is_weedable() || T.density)
		if(!silent)
			to_chat(owner, span_warning("这里不能这么做。"))
		return FALSE

	if(!xeno_owner.loc_weeds_type)
		if(!silent)
			to_chat(owner, span_warning("我们只能在菌毯上塑形。在开始建造前，我们必须找到一些树脂！"))
		return FALSE

	if(!T.check_alien_construction(owner, silent, /obj/structure/xeno/trap) || !T.check_disallow_alien_fortification(owner, silent))
		return FALSE

/datum/action/ability/xeno_action/place_trap/action_activate()
	var/turf/T = get_turf(owner)

	succeed_activate()

	playsound(T, SFX_ALIEN_RESIN_BUILD, 25)
	GLOB.round_statistics.trap_holes++
	SSblackbox.record_feedback("tally", "round_statistics", 1, "carrier_traps")
	owner.record_traps_created()
	new /obj/structure/xeno/trap(T, owner.get_xeno_hivenumber(), trap_hugger_limit)

	to_chat(owner, span_xenonotice("我们在菌毯上放置了一个陷阱，但它还需要填充。"))

// ***************************************
// *********** Spawn hugger
// ***************************************
/datum/action/ability/xeno_action/spawn_hugger
	name = "Spawn Facehugger"
	action_icon_state = "spawn_hugger"
	action_icon = 'icons/Xeno/actions/carrier.dmi'
	desc = "生成一只抱脸虫，储存在你的身体上。"
	ability_cost = 200
	cooldown_duration = 10 SECONDS
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_SPAWN_HUGGER,
	)
	use_state_flags = ABILITY_USE_LYING
	/// The amount of damage dealt to the owner for using the ability.
	var/health_cost = 0

/datum/action/ability/xeno_action/spawn_hugger/on_cooldown_finish()
	to_chat(owner, span_xenodanger("我们现在可以再生成一只抱脸虫。"))
	owner.playsound_local(owner, 'sound/effects/alien/new_larva.ogg', 25, 0, 1)
	return ..()

/datum/action/ability/xeno_action/spawn_hugger/can_use_action(silent, override_flags, selecting)
	. = ..()
	if(!.)
		return FALSE
	if(xeno_owner.huggers >= xeno_owner.xeno_caste.huggers_max)
		if(!silent)
			to_chat(xeno_owner, span_xenowarning("我们无法容纳更多抱脸虫了！"))
		return FALSE

/datum/action/ability/xeno_action/spawn_hugger/action_activate()
	xeno_owner.huggers++
	to_chat(xeno_owner, span_xenowarning("我们通过无性内部繁殖的奇迹生成了一只抱脸虫，并将其加入我们的储备。当前庇护数量：[xeno_owner.huggers] / [xeno_owner.xeno_caste.huggers_max]。"))
	playsound(xeno_owner, 'sound/voice/alien/drool2.ogg', 50, 0, 1)
	if(health_cost)
		xeno_owner.adjustBruteLoss(health_cost, TRUE)
	succeed_activate()
	add_cooldown()
	if(owner.client)
		var/datum/personal_statistics/personal_statistics = GLOB.personal_statistics_list[owner.ckey]
		personal_statistics.huggers_created++

// ***************************************
// *********** Drop all hugger, panic button
// ***************************************
/datum/action/ability/xeno_action/carrier_panic
	name = "Carrier Panic"
	action_icon_state = "carrier_panic"
	action_icon = 'icons/Xeno/actions/carrier.dmi'
	desc = "在恐慌中丢弃所有储存的抱脸虫。消耗所有剩余的等离子体！"
	ability_cost = 10
	cooldown_duration = 50 SECONDS
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_DROP_ALL_HUGGER,
	)
	use_state_flags = ABILITY_USE_LYING
	/// What percentage of the owner's maximum plasma should be consumed? 1 = 100%.
	var/succeed_cost = 1

/datum/action/ability/xeno_action/carrier_panic/give_action(mob/living/L)
	. = ..()
	RegisterSignal(owner, COMSIG_MOB_DEATH, PROC_REF(do_activate))

/datum/action/ability/xeno_action/carrier_panic/remove_action(mob/living/L)
	UnregisterSignal(owner, COMSIG_MOB_DEATH)
	return ..()

/// Helper proc for action acitvation via signal
/datum/action/ability/xeno_action/carrier_panic/proc/do_activate()
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, PROC_REF(action_activate))

/datum/action/ability/xeno_action/carrier_panic/can_use_action(silent, override_flags, selecting)
	. = ..()
	if(!.)
		return FALSE
	if(xeno_owner.health > (xeno_owner.maxHealth * 0.56))
		if(!silent)
			to_chat(xeno_owner, span_xenowarning("我们还没伤到需要惊慌失措的地步！"))
		return FALSE
	if(xeno_owner.huggers < 1)
		if(!silent)
			to_chat(xeno_owner, span_xenowarning("我们没有抱脸虫可供投放！"))
		return FALSE

/datum/action/ability/xeno_action/carrier_panic/action_activate()
	if(!xeno_owner.huggers)
		return

	xeno_owner.visible_message(span_xenowarning("一大群吱吱作响的小异形正试图逃离[xeno_owner]！"))
	while(xeno_owner.huggers > 0)
		var/obj/item/clothing/mask/facehugger/new_hugger = new /obj/item/clothing/mask/facehugger/larval(get_turf(xeno_owner), xeno_owner.hivenumber, xeno_owner)
		step_away(new_hugger, xeno_owner, 1)
		addtimer(CALLBACK(new_hugger, TYPE_PROC_REF(/obj/item/clothing/mask/facehugger, go_active), TRUE), new_hugger.jump_cooldown)
		xeno_owner.huggers--
	succeed_activate(succeed_cost * xeno_owner.xeno_caste.plasma_max)
	add_cooldown()

/datum/action/ability/xeno_action/carrier_panic/update_button_icon()
	desc = "在恐慌中丢弃所有储存的抱脸虫。"
	if(succeed_cost > 0)
		desc += (succeed_cost == 1 ? " Uses all remaining plasma!" : " Uses [PERCENT(succeed_cost)]% of your maximum plasma!")
	return ..()

// ***************************************
// *********** Choose Hugger Type
// ***************************************
// Choose Hugger Type
/datum/action/ability/xeno_action/choose_hugger_type
	name = "Choose Hugger Type"
	action_icon_state = "facehugger"
	action_icon = 'icons/Xeno/actions/carrier.dmi'
	desc = "选择你将通过使用/投掷抱脸虫能力构建的抱脸虫类型。"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_CHOOSE_HUGGER,
		KEYBINDING_ALTERNATE = COMSIG_XENOABILITY_SWITCH_HUGGER,
	)
	use_state_flags = ABILITY_USE_LYING|ABILITY_USE_STAGGERED

/datum/action/ability/xeno_action/choose_hugger_type/give_action(mob/living/L)
	. = ..()
	xeno_owner.selected_hugger_type = GLOB.hugger_type_list[1] //Set our default
	update_button_icon() //Update immediately to get our default

/datum/action/ability/xeno_action/choose_hugger_type/update_button_icon()
	var/atom/A = xeno_owner.selected_hugger_type
	action_icon_state = initial(A.name)
	return ..()

/datum/action/ability/xeno_action/choose_hugger_type/alternate_action_activate()
	var/i = GLOB.hugger_type_list.Find(xeno_owner.selected_hugger_type)
	if(length(GLOB.hugger_type_list) == i)
		xeno_owner.selected_hugger_type = GLOB.hugger_type_list[1]
	else
		xeno_owner.selected_hugger_type = GLOB.hugger_type_list[i+1]

	var/atom/A = xeno_owner.selected_hugger_type
	to_chat(xeno_owner, span_notice("现在使用生成抱脸虫能力时，将生成<b>[initial(A.name)]\s</b>。"))
	xeno_owner.balloon_alert(xeno_owner,"[initial(A.name)]")
	update_button_icon()
	succeed_activate()
	return COMSIG_KB_ACTIVATED

/datum/action/ability/xeno_action/choose_hugger_type/action_activate()
	var/hugger_choice = show_radial_menu(owner, owner, GLOB.hugger_images_list, radius = 48)
	if(!hugger_choice)
		return
	for(var/obj/item/clothing/mask/facehugger/hugger_type AS in GLOB.hugger_type_list)
		if(initial(hugger_type.name) == hugger_choice)
			xeno_owner.selected_hugger_type = hugger_type
			break
	to_chat(xeno_owner, span_notice("现在使用生成抱脸虫能力时，将生成<b>[hugger_choice]\s</b>。"))
	xeno_owner.balloon_alert(xeno_owner, "[hugger_choice]")
	update_button_icon()
	return succeed_activate()

/datum/action/ability/xeno_action/build_hugger_turret
	name = "Build Hugger Turret"
	action_icon_state = "hugger_turret"
	action_icon = 'icons/Xeno/actions/carrier.dmi'
	desc = "建造一座会向敌方陆战队员发射抱脸虫的炮塔。建造炮塔时当前选中的抱脸虫类型将决定发射的抱脸虫种类。"
	ability_cost = 800
	cooldown_duration = 5 MINUTES
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_BUILD_HUGGER_TURRET,
	)

/datum/action/ability/xeno_action/build_hugger_turret/can_use_action(silent, override_flags, selecting)
	. = ..()
	var/turf/T = get_turf(owner)
	var/mob/living/carbon/xenomorph/blocker = locate() in T
	if(blocker && blocker != owner && blocker.stat != DEAD)
		if(!silent)
			to_chat(owner, span_xenowarning("无法建造，[blocker]挡住了去路！"))
		return FALSE

	if(!T.is_weedable())
		return FALSE

	if(!xeno_owner.loc_weeds_type)
		if(!silent)
			to_chat(owner, span_xenowarning("这里没有菌毯！"))
		return FALSE

	if(!T.check_alien_construction(owner, silent, /obj/structure/xeno/xeno_turret) || !T.check_disallow_alien_fortification(owner))
		return FALSE

	for(var/obj/structure/xeno/xeno_turret/turret AS in GLOB.xeno_resin_turrets_by_hive[blocker.hivenumber])
		if(get_dist(turret, owner) < XENO_TURRET_EXCLUSION_RANGE)
			if(!silent)
				to_chat(owner, span_xenowarning("另一座炮塔距离太近！"))
			return FALSE

/datum/action/ability/xeno_action/build_hugger_turret/action_activate()
	if(!do_after(owner, 10 SECONDS, NONE, owner, BUSY_ICON_BUILD))
		return FALSE

	if(!can_use_action())
		return FALSE

	var/obj/structure/xeno/xeno_turret/hugger_turret/turret = new (get_turf(owner), xeno_owner.hivenumber)
	turret.ammo = GLOB.ammo_list[GLOB.hugger_to_ammo[xeno_owner.selected_hugger_type]]
	succeed_activate()
	add_cooldown()

// ***************************************
// *********** Call of Younger
// ***************************************

/datum/action/ability/activable/xeno/call_younger
	name = "Call of Younger"
	action_icon_state = "call_younger"
	action_icon = 'icons/Xeno/actions/carrier.dmi'
	desc = "吸引被抱脸目标体内的幼虫。目标失去平衡，被拉向你，同时其体内幼虫的成长进度加速。"
	ability_cost = 150
	cooldown_duration = 20 SECONDS
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_CALL_YOUNGER,
	)


/datum/action/ability/activable/xeno/call_younger/can_use_ability(atom/A, silent, override_flags)
	. = ..()
	if(!.)
		return

	if(!ishuman(A))
		if(!silent)
			A.balloon_alert(owner, "不是人类！")
		return FALSE

	var/mob/living/carbon/human/target = A

	if(!(locate(/obj/item/alien_embryo) in target))
		if(!silent)
			target.balloon_alert(owner, "未感染！")
		return FALSE

	if(target.stat == DEAD)
		if(!silent)
			target.balloon_alert(owner, "你死了！")
		return FALSE

	if(!line_of_sight(owner, target, 9))
		if(!silent)
			target.balloon_alert(owner, "需要视线！")
		return FALSE
	return TRUE

/datum/action/ability/activable/xeno/call_younger/use_ability(atom/A)
	var/mob/living/carbon/human/victim = A

	owner.face_atom(victim)

	if(!do_after(xeno_owner, 0.5 SECONDS, NONE, xeno_owner, BUSY_ICON_DANGER, extra_checks = CALLBACK(src, PROC_REF(can_use_ability), A, FALSE, ABILITY_USE_BUSY)))
		return fail_activate()
	if(!can_use_ability(A))
		return fail_activate()

	var/obj/item/alien_embryo/young = locate() in victim
	var/debuff = young.stage + 1
	var/stamina_dmg = (victim.maxHealth + victim.max_stamina) * (debuff + xeno_owner.xeno_caste.aura_strength) * 0.1

	xeno_owner.emote("roar5")
	victim.emote("scream")
	owner.visible_message(span_xenowarning("\the [owner] 发出一声不同寻常的咆哮！"), \
	span_xenowarning("We called out to the younger one inside [victim]!"))
	victim.visible_message(span_xenowarning("\The [victim] 失去 [victim.p_their()] 平衡，侧身摔倒！"), \
	span_xenowarning("You feel like something inside you is tearing out!"))

	victim.apply_effects(2 SECONDS, 1 SECONDS)
	victim.adjust_stagger(debuff SECONDS)
	victim.adjust_slowdown(debuff)
	victim.apply_damage(stamina_dmg, STAMINA, attacker = owner)

	var/datum/internal_organ/O
	for(var/i in list(ORGAN_SLOT_HEART, ORGAN_SLOT_LUNGS, ORGAN_SLOT_LIVER))
		O = victim.get_organ_slot(i)
		O.take_damage(debuff, TRUE)

	young.adjust_boost_timer(20, 40)

	if(young.stage <= 1)
		victim.throw_at(owner, 2, 1, owner)
	else if(young.stage > 1 && young.stage <= 5)
		victim.throw_at(owner, 3, 1, owner)
	else if(young.stage == 6)
		victim.throw_at(owner, 4, 1, owner)

	succeed_activate()
	add_cooldown()
