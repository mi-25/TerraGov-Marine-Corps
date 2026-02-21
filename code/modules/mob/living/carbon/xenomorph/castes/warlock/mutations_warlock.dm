//*********************//
//        Shell        //
//*********************//
/datum/mutation_upgrade/shell/cautious_mind
	name = "Cautious Mind"
	desc = "心灵护盾若在护盾完好时被自动取消，将尝试引爆。引爆消耗现为其原始消耗的125/100/75%。"
	/// For the first structure,the multiplier of Psychic Shield's initial ability cost to add to the ability cost.
	var/cost_multiplier_initial = 0.5
	/// For each structure, the multiplier of Psychic Shield's initial ability cost to add to the ability cost.
	var/cost_multiplier_per_structure = -0.25

/datum/mutation_upgrade/shell/cautious_mind/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Psychic Shield will attempt to detonate if it was canceled while the shield is intact. The detonation cost is now [PERCENT(1 + get_multiplier(new_amount))]% of its original cost."

/datum/mutation_upgrade/shell/cautious_mind/on_mutation_enabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_shield/shield_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_shield]
	if(!shield_ability)
		return
	shield_ability.detonates_on_cancel = TRUE
	shield_ability.detonation_cost += initial(shield_ability.detonation_cost) * get_multiplier(0)

/datum/mutation_upgrade/shell/cautious_mind/on_mutation_disabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_shield/shield_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_shield]
	if(!shield_ability)
		return
	shield_ability.detonates_on_cancel = initial(shield_ability.detonates_on_cancel)
	shield_ability.detonation_cost -= initial(shield_ability.detonation_cost) * get_multiplier(0)

/datum/mutation_upgrade/shell/cautious_mind/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_shield/shield_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_shield]
	if(!shield_ability)
		return
	shield_ability.detonation_cost += initial(shield_ability.detonation_cost) * get_multiplier(new_amount - previous_amount, FALSE)

/// Returns the multiplier of Psychic Shield's initial ability cost to add to the ability cost.
/datum/mutation_upgrade/shell/cautious_mind/proc/get_multiplier(structure_count, include_initial = TRUE)
	return (include_initial ? cost_multiplier_initial : 0) + (cost_multiplier_per_structure * structure_count)

//*********************//
//         Spur        //
//*********************//
/datum/mutation_upgrade/spur/draining_blast
	name = "Draining Blast"
	desc = "心灵冲击现在切换为一种名为心灵汲取的新型光束；它造成0.7倍耐力伤害，直接命中时造成短暂击倒，非直接命中时造成击退。心灵汲取的冷却时间是原冷却时间的95/90/85%。"
	/// For each structure, the multiplier to add to Psychic Blast's cooldown.
	var/multiplier_per_structure = -0.05

/datum/mutation_upgrade/spur/draining_blast/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Psychic Blast now switch to a different type of beam called Psychic Drain; it deals 0.7x stamina damage, briefly knockdowns on direct impact, and knockback on non-direct impact. Psychic Drain's cooldown is [PERCENT(1 + get_multiplier(new_amount))]% of its original cooldown."

/datum/mutation_upgrade/spur/draining_blast/on_mutation_enabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psy_blast/blast_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psy_blast]
	if(!blast_ability)
		return
	blast_ability.selectable_ammo_types += /datum/ammo/energy/xeno/psy_blast/psy_drain

/datum/mutation_upgrade/spur/draining_blast/on_mutation_disabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psy_blast/blast_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psy_blast]
	if(!blast_ability)
		return
	blast_ability.selectable_ammo_types -= /datum/ammo/energy/xeno/psy_blast/psy_drain

/datum/mutation_upgrade/spur/draining_blast/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/activable/xeno/psy_blast/blast_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psy_blast]
	if(!blast_ability)
		return
	blast_ability.cooldown_duration += initial(blast_ability.cooldown_duration) * get_multiplier(new_amount - previous_amount)

/// Returns the multiplier to add to Psychic Blast's cooldown.
/datum/mutation_upgrade/spur/draining_blast/proc/get_multiplier(structure_count)
	return multiplier_per_structure * structure_count

//*********************//
//         Veil        //
//*********************//
/datum/mutation_upgrade/veil/mobile_mind
	name = "Mobile Mind"
	desc = "心灵护盾不再要求你保持静止来维持护盾。然而，手动引爆时护盾会嘶嘶作响地消散，并且在护盾激活期间会使你的速度降低0.8/0.6/0.4。"
	/// For the first structure, the amount to increase Psychic Shield's movement speed modifier by.
	var/movespeed_initial = 1
	/// For each structure, the amount to increase Psychic Shield's movement speed modifier by.
	var/movespeed_per_structure = -0.2

/datum/mutation_upgrade/veil/mobile_mind/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Psychic Shield no longer forces you to remain still to keep the shield up. However, the shield sizzles out when manually detonating and slows you down by [get_movespeed(new_amount)] while it is active."

/datum/mutation_upgrade/veil/mobile_mind/on_mutation_enabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_shield/shield_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_shield]
	if(!shield_ability)
		return
	shield_ability.do_after_flags |= (IGNORE_USER_LOC_CHANGE|IGNORE_TARGET_LOC_CHANGE)
	shield_ability.can_manually_detonate = FALSE
	shield_ability.movement_speed_modifier += get_movespeed(0)

/datum/mutation_upgrade/veil/mobile_mind/on_mutation_disabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_shield/shield_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_shield]
	if(!shield_ability)
		return
	shield_ability.do_after_flags &= ~(IGNORE_USER_LOC_CHANGE|IGNORE_TARGET_LOC_CHANGE)
	shield_ability.can_manually_detonate = initial(shield_ability.can_manually_detonate)
	shield_ability.movement_speed_modifier -= get_movespeed(0)

/datum/mutation_upgrade/veil/mobile_mind/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_shield/shield_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_shield]
	if(!shield_ability)
		return
	shield_ability.movement_speed_modifier += get_movespeed(new_amount - previous_amount, FALSE)

/// Returns the amount to increase Psychic Shield's movement speed modifier by.
/datum/mutation_upgrade/veil/mobile_mind/proc/get_movespeed(structure_count, include_initial = TRUE)
	return (include_initial ? movespeed_initial : 0) + (movespeed_per_structure * structure_count)
