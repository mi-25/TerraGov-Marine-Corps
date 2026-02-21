//*********************//
//        Shell        //
//*********************//
/datum/mutation_upgrade/shell/carapace_waxing
	name = "Carapace Waxing"
	desc = "再生皮肤额外减少各类减益效果1/2/3层或2/4/6秒。"
	/// For each structure, the amount (in stacks / 2x seconds) that Regenerate Skin will increase negative status effects by.
	var/debuffs_per_structure = -1

/datum/mutation_upgrade/shell/carapace_waxing/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Regenerate Skin additionally reduces various debuffs by [-get_debuff_stacks(new_amount)] stacks or [-get_debuff_stacks(new_amount) * 2] seconds."

/datum/mutation_upgrade/shell/carapace_waxing/on_structure_update(previous_amount, new_amount)
	. = ..()
	if(!.)
		return
	var/datum/action/ability/xeno_action/regenerate_skin/regenerate_skin = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/regenerate_skin]
	if(!regenerate_skin)
		return
	regenerate_skin.debuff_removal_amount += -get_debuff_stacks(new_amount - previous_amount)

/// Returns the amount that Regenerate Skin will increase negative status effects by.
/datum/mutation_upgrade/shell/carapace_waxing/proc/get_debuff_stacks(structure_count)
	return debuffs_per_structure * structure_count

/datum/mutation_upgrade/shell/brittle_upclose
	name = "Brittle Upclose"
	desc = "你不再会被弹道武器击退，并获得5/7.5/10点弹道护甲，但失去30/35/40点近战护甲。来自近距离的弹道攻击会无视此额外弹道护甲。"
	/// For the first structure, the amount of bullet armor to increase by.
	var/bullet_armor_increase_initial = 2.5
	/// For each structure, the amount of additional bullet armor to increase by.
	var/bullet_armor_increase_per_structure = 2.5
	/// For the first structure, the amount of melee armor to increase by.
	var/melee_armor_reduction_initial = -25
	/// For each structure, the amount of additional melee armor to increase by.
	var/melee_armor_reduction_per_structure = -5

/datum/mutation_upgrade/shell/brittle_upclose/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "You can no longer be staggered by projectiles and gain [get_bullet_armor(new_amount)] bullet armor, but lose [-get_melee_armor(new_amount)] melee armor. Projectiles from pointblank range negate this bonus bullet armor."

/datum/mutation_upgrade/shell/brittle_upclose/on_mutation_enabled()
	xenomorph_owner.soft_armor = xenomorph_owner.soft_armor.modifyRating(get_melee_armor(0), get_bullet_armor(0))
	RegisterSignal(xenomorph_owner, COMSIG_XENO_PROJECTILE_HIT, PROC_REF(pre_projectile_hit))
	ADD_TRAIT(xenomorph_owner, TRAIT_STAGGER_RESISTANT, MUTATION_TRAIT)
	return ..()

/datum/mutation_upgrade/shell/brittle_upclose/on_mutation_disabled()
	xenomorph_owner.soft_armor = xenomorph_owner.soft_armor.modifyRating(get_melee_armor(0), get_bullet_armor(0))
	UnregisterSignal(xenomorph_owner, list(COMSIG_XENO_PROJECTILE_HIT))
	REMOVE_TRAIT(xenomorph_owner, TRAIT_STAGGER_RESISTANT, MUTATION_TRAIT)
	return ..()

/datum/mutation_upgrade/shell/brittle_upclose/on_structure_update(previous_amount, new_amount)
	. = ..()
	if(!.)
		return
	xenomorph_owner.soft_armor = xenomorph_owner.soft_armor.modifyRating(get_melee_armor(new_amount - previous_amount, FALSE), get_bullet_armor(new_amount - previous_amount, FALSE))

/// When hit by a non-friendly projectile at pointblank range, have the projectile deal additional damage.
/datum/mutation_upgrade/shell/brittle_upclose/proc/pre_projectile_hit(datum/source, atom/movable/projectile/proj, cardinal_move, uncrossing)
	SIGNAL_HANDLER
	if(xenomorph_owner.issamexenohive(proj.firer))
		return
	if(proj.distance_travelled >= 2)
		return
	proj.damage *= (1 + (get_bullet_armor(get_total_structures()) / 100)) // Effectively negates the bonus bullet armor.

/// Returns the amount of bullet armor that should be given.
/datum/mutation_upgrade/shell/brittle_upclose/proc/get_bullet_armor(structure_count, include_initial = TRUE)
	return (include_initial ? bullet_armor_increase_initial : 0) + (bullet_armor_increase_per_structure * structure_count)

/// Returns the amount of melee armor that should be given.
/datum/mutation_upgrade/shell/brittle_upclose/proc/get_melee_armor(structure_count, include_initial = TRUE)
	return (include_initial ? melee_armor_reduction_initial : 0) + (melee_armor_reduction_per_structure * structure_count)

/datum/mutation_upgrade/shell/carapace_regrowth
	name = "Carapace Regrowth"
	desc = "再生皮肤额外恢复50/60/70%的最大生命值，但会使你的所有护甲值降低30点，持续6秒。"
	/// For the first structure, the amount to increase Regenerate Skin's healing multiplier by.
	var/heal_multiplier_initial = 0.4
	/// For each structure, the amount to increase Regenerate Skin's healing multiplier by.
	var/heal_multiplier_per_structure = 0.1
	/// How much should the armor debuff value be?
	var/armor_debuff_amount = 30

/datum/mutation_upgrade/shell/carapace_regrowth/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Regenerate Skin additionally recovers [PERCENT(get_heal_multiplier(new_amount))]% of your maximum health, but will reduce all of your armor values by [armor_debuff_amount] for 6 seconds."

/datum/mutation_upgrade/shell/carapace_regrowth/on_mutation_enabled()
	var/datum/action/ability/xeno_action/regenerate_skin/regenerate_skin = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/regenerate_skin]
	if(!regenerate_skin)
		return
	regenerate_skin.heal_multiplier += get_heal_multiplier(0)
	regenerate_skin.armor_debuff_amount += armor_debuff_amount
	return ..()

/datum/mutation_upgrade/shell/carapace_regrowth/on_mutation_disabled()
	var/datum/action/ability/xeno_action/regenerate_skin/regenerate_skin = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/regenerate_skin]
	if(!regenerate_skin)
		return
	regenerate_skin.heal_multiplier -= get_heal_multiplier(0)
	regenerate_skin.armor_debuff_amount -= armor_debuff_amount
	return ..()

/datum/mutation_upgrade/shell/carapace_regrowth/on_structure_update(previous_amount, new_amount)
	. = ..()
	if(!.)
		return
	var/datum/action/ability/xeno_action/regenerate_skin/regenerate_skin = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/regenerate_skin]
	if(!regenerate_skin)
		return
	regenerate_skin.heal_multiplier += get_heal_multiplier(new_amount - previous_amount, FALSE)

/// Returns the amount to increase Regenerate Skin's healing multiplier by.
/datum/mutation_upgrade/shell/carapace_regrowth/proc/get_heal_multiplier(structure_count, include_initial = TRUE)
	return (include_initial ? heal_multiplier_initial : 0) + (heal_multiplier_per_structure * structure_count)

//*********************//
//         Spur        //
//*********************//
/datum/mutation_upgrade/spur/breathtaking_spin
	name = "Breathtaking Spin"
	desc = "甩尾攻击现在造成耐力伤害。它不再造成麻痹，并且造成1.5倍/1.75倍/2倍更多伤害。"
	/// For the first structure, the amount to increase Tail Swipe's damage multiplier by.
	var/damage_multiplier_initial = 1.25
	/// For each structure, the amount to increase Tail Swipe's damage multiplier by.
	var/damage_multiplier_per_structure = 0.25

/datum/mutation_upgrade/spur/breathtaking_spin/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Tail Swipe deals stamina damage instead. It no longer paralyzes and deals [get_damage_multiplier(new_amount)]x more damage."

/datum/mutation_upgrade/spur/breathtaking_spin/on_mutation_enabled()
	var/datum/action/ability/xeno_action/tail_sweep/tail_sweep = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/tail_sweep]
	if(!tail_sweep)
		return
	tail_sweep.damage_multiplier += get_damage_multiplier(0)
	tail_sweep.damage_type = STAMINA
	tail_sweep.paralyze_duration -= initial(tail_sweep.paralyze_duration)
	return ..()

/datum/mutation_upgrade/spur/breathtaking_spin/on_mutation_disabled()
	var/datum/action/ability/xeno_action/tail_sweep/tail_sweep = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/tail_sweep]
	if(!tail_sweep)
		return
	tail_sweep.damage_multiplier -= get_damage_multiplier(0)
	tail_sweep.damage_type = initial(tail_sweep.damage_type)
	tail_sweep.paralyze_duration += initial(tail_sweep.paralyze_duration)
	return ..()

/datum/mutation_upgrade/spur/breathtaking_spin/on_structure_update(previous_amount, new_amount)
	. = ..()
	if(!.)
		return
	var/datum/action/ability/xeno_action/tail_sweep/tail_sweep = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/tail_sweep]
	if(!tail_sweep)
		return
	tail_sweep.damage_multiplier += get_damage_multiplier(new_amount - previous_amount, FALSE)

/// Returns the amount to increase Tail Swipe's damage multiplier by.
/datum/mutation_upgrade/spur/breathtaking_spin/proc/get_damage_multiplier(structure_count, include_initial = TRUE)
	return (include_initial ? damage_multiplier_initial : 0) + (damage_multiplier_per_structure * structure_count)

/datum/mutation_upgrade/spur/power_spin
	name = "Power Spin"
	desc = "甩尾击退距离增加1格，并造成1/2/3秒踉跄。"
	/// The amount to increase Tail Swipe's knockback by.
	var/knockback_amount = 1
	/// For each structure, the amount of deciseconds to increase Tail Swipe's stagger duration by.
	var/stagger_per_structure = 1 SECONDS

/datum/mutation_upgrade/spur/power_spin/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Tail Swipe's knockback is increased by [knockback_amount] tile and staggers for [get_stagger_duration(new_amount) * 0.1] seconds."

/datum/mutation_upgrade/spur/power_spin/on_mutation_enabled()
	var/datum/action/ability/xeno_action/tail_sweep/tail_sweep = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/tail_sweep]
	if(!tail_sweep)
		return
	tail_sweep.knockback_distance += knockback_amount
	return ..()

/datum/mutation_upgrade/spur/power_spin/on_mutation_disabled()
	var/datum/action/ability/xeno_action/tail_sweep/tail_sweep = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/tail_sweep]
	if(!tail_sweep)
		return
	tail_sweep.knockback_distance -= knockback_amount
	return ..()

/datum/mutation_upgrade/spur/power_spin/on_structure_update(previous_amount, new_amount)
	. = ..()
	if(!.)
		return
	var/datum/action/ability/xeno_action/tail_sweep/tail_sweep = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/tail_sweep]
	if(!tail_sweep)
		return
	tail_sweep.stagger_duration += get_stagger_duration(new_amount - previous_amount)

/// Returns the amount of deciseconds to increase Tail Swipe's stagger duration by.
/datum/mutation_upgrade/spur/power_spin/proc/get_stagger_duration(structure_count)
	return stagger_per_structure * structure_count

/datum/mutation_upgrade/spur/sharpening_claws
	name = "Sharpening Claws"
	desc = "每有10点破甲/缺失护甲，你的近战伤害倍率增加3/6/9%。"
	/// The amount of sunder used to determine the final multiplier.
	var/sunder_repeating_threshold = 10
	/// For each structure, the amount to increase the melee damage modifier by for each time the sunder threshold is passed.
	var/modifier_per_structure = 0.03
	/// The amount that the melee damage modifier has been increased by so far.
	var/modifier_so_far = 0

/datum/mutation_upgrade/spur/sharpening_claws/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "For each [sunder_repeating_threshold] sunder / missing armor, your melee damage multiplier is increased by [PERCENT(get_modifier(new_amount))]%."

/datum/mutation_upgrade/spur/sharpening_claws/on_mutation_enabled()
	RegisterSignal(xenomorph_owner, COMSIG_XENOMORPH_SUNDER_CHANGE, PROC_REF(on_sunder_change))
	return ..()

/datum/mutation_upgrade/spur/sharpening_claws/on_mutation_disabled()
	UnregisterSignal(xenomorph_owner, COMSIG_XENOMORPH_SUNDER_CHANGE)
	return ..()

/datum/mutation_upgrade/spur/sharpening_claws/on_structure_update(previous_amount, new_amount)
	. = ..()
	if(!.)
		return
	xenomorph_owner.xeno_melee_damage_modifier -= modifier_so_far
	modifier_so_far = 0
	on_sunder_change(null, 0, xenomorph_owner.sunder)

/// Changes melee damage modifier based on the difference between old and current sunder values.
/datum/mutation_upgrade/spur/sharpening_claws/proc/on_sunder_change(datum/source, old_sunder, new_sunder)
	SIGNAL_HANDLER
	var/new_modifier = round(new_sunder / sunder_repeating_threshold) * get_modifier(get_total_structures())
	if(new_modifier == modifier_so_far)
		return
	xenomorph_owner.xeno_melee_damage_modifier += (new_modifier - modifier_so_far)
	modifier_so_far = new_modifier

/// Returns the amount to increase the melee damage modifier by for each time the sunder threshold is passed.
/datum/mutation_upgrade/spur/sharpening_claws/proc/get_modifier(structure_count)
	return modifier_per_structure * structure_count

//*********************//
//         Veil        //
//*********************//
/datum/mutation_upgrade/veil/carapace_sweat
	name = "Carapace Sweat"
	desc = "再生皮肤可在着火时使用，并会为你施加2/4/6秒的树脂凝胶。如果你当时正在着火，你将被熄灭，并使附近的人类着火。"
	/// For each structure, the amount of deciseconds that the Resin Jelly status effect will have.
	var/duration_per_structure = 2 SECONDS

/datum/mutation_upgrade/veil/carapace_sweat/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Regenerate Skin can be used while on fire and grants fire immunity for [get_duration(new_amount) * 0.1] seconds. If you were on fire, you will be extinguished and set nearby humans on fire."

/datum/mutation_upgrade/veil/carapace_sweat/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/xeno_action/regenerate_skin/regenerate_skin = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/regenerate_skin]
	if(!regenerate_skin)
		return
	regenerate_skin.resin_jelly_duration += get_duration(new_amount - previous_amount)

/// Returns the amount of deciseconds that the Resin Jelly status effect will have.
/datum/mutation_upgrade/veil/carapace_sweat/proc/get_duration(structure_count)
	return duration_per_structure * structure_count

/datum/mutation_upgrade/veil/slow_and_steady
	name = "Slow and Steady"
	desc = "你不再会在'坚守阵地'期间被定身。然而，激活期间，你的移动延迟会增加1.2/1/0.8秒。"
	/// For the first structure, the amount of deciseconds of delay to add to movement while Fortify is active.
	var/movement_delay_initial = 1.4 SECONDS
	/// For each structure, the amount of deciseconds of delay to add to movement while Fortify is active.
	var/movement_delay_per_structure = -0.2 SECONDS

/datum/mutation_upgrade/veil/slow_and_steady/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "You are no longer immobilized during Fortify. However, your move delay is increased by [get_delay(new_amount) * 0.1] seconds while it is active."

/datum/mutation_upgrade/veil/slow_and_steady/on_mutation_enabled()
	var/datum/action/ability/xeno_action/fortify/fortify = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/fortify]
	if(!fortify)
		return

	fortify.should_immobilize = FALSE
	fortify.set_movement_delay(fortify.movement_delay + get_delay(0))
	return ..()

/datum/mutation_upgrade/veil/slow_and_steady/on_mutation_disabled()
	var/datum/action/ability/xeno_action/fortify/fortify = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/fortify]
	if(!fortify)
		return
	fortify.should_immobilize = initial(fortify.should_immobilize)
	fortify.set_movement_delay(fortify.movement_delay - get_delay(0))
	return ..()

/datum/mutation_upgrade/veil/slow_and_steady/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/xeno_action/fortify/fortify = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/fortify]
	if(!fortify)
		return
	fortify.set_movement_delay(fortify.movement_delay + get_delay(new_amount - previous_amount, FALSE))

/// Returns the amount of deciseconds of delay to add to movement while Fortify is active.
/datum/mutation_upgrade/veil/slow_and_steady/proc/get_delay(structure_count, include_initial = TRUE)
	return (include_initial ? movement_delay_initial : 0) + (movement_delay_per_structure * structure_count)

/datum/mutation_upgrade/veil/carapace_sharing
	name = "Carapace Sharing"
	desc = "再生皮肤还会为附近的一名友方异形移除8/16/24%的破甲。此效果优先作用于破甲值最高的目标。"
	/// For each structure, the amount to increase Regenerate Skin's ally sunder healing multiplier by.
	var/ally_unsunder_multiplier_per_structure = 0.08

/datum/mutation_upgrade/veil/carapace_sharing/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Regenerate Skin additionally removes [PERCENT(get_multiplier(new_amount))]% sunder of a nearby friendly xenomorph. This prioritizes those with the highest sunder."

/datum/mutation_upgrade/veil/carapace_sharing/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/xeno_action/regenerate_skin/regenerate_skin = xenomorph_owner.actions_by_path[/datum/action/ability/xeno_action/regenerate_skin]
	if(!regenerate_skin)
		return
	regenerate_skin.ally_unsunder_multiplier += get_multiplier(new_amount - previous_amount)

/// Returns the amount to increase Regenerate Skin's ally sunder healing multiplier by.
/datum/mutation_upgrade/veil/carapace_sharing/proc/get_multiplier(structure_count, include_initial = TRUE)
	return ally_unsunder_multiplier_per_structure * structure_count

