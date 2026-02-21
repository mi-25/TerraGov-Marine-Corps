//*********************//
//        Shell        //
//*********************//
/datum/mutation_upgrade/shell/lone_healer
	name = "Lone Healer"
	desc = "心灵治愈现在可以以自身为目标。治疗自身的效果只有50/60/70%。"
	/// For the first structure, the multiplier of Psychic Cure's initial healing power to add to the ability.
	var/self_heal_multiplier_initial = -0.6
	/// For each structure, the multiplier of Psychic Cure's initial healing power to add to the ability.
	var/self_heal_multiplier_per_structure = 0.1

/datum/mutation_upgrade/shell/lone_healer/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Psychic Cure can now target yourself. Healing yourself is only [PERCENT(1 + get_self_heal_multiplier(new_amount))]% as effective."

/datum/mutation_upgrade/shell/lone_healer/on_mutation_enabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_cure/cure_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_cure]
	if(!cure_ability)
		return
	cure_ability.use_state_flags |= ABILITY_TARGET_SELF
	cure_ability.self_heal_multiplier += get_self_heal_multiplier(0)

/datum/mutation_upgrade/shell/lone_healer/on_mutation_disabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_cure/cure_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_cure]
	if(!cure_ability)
		return
	cure_ability.use_state_flags &= ~(ABILITY_TARGET_SELF)
	cure_ability.self_heal_multiplier -= get_self_heal_multiplier(0)

/datum/mutation_upgrade/shell/lone_healer/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_cure/cure_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_cure]
	if(!cure_ability)
		return
	cure_ability.self_heal_multiplier += get_self_heal_multiplier(new_amount - previous_amount, FALSE)

/// Returns the multiplier of Psychic Cure's initial healing power to add to the ability.
/datum/mutation_upgrade/shell/lone_healer/proc/get_self_heal_multiplier(structure_count, include_initial = TRUE)
	return (include_initial ? self_heal_multiplier_initial : 0) + (self_heal_multiplier_per_structure * structure_count)

/datum/mutation_upgrade/shell/shared_cure
	name = "Shared Cure"
	desc = "20/35/50% 的'心灵治愈'所恢复的生命值会重新施加于你自身。"
	/// For the first structure, the percentage of restored health from Psychic Cure to heal the owner. 1 = 100%, 0.01 = 1%.
	var/rebound_initial = 0.05
	/// For each structure, the additional percentage of restored health from Psychic Cure to heal the owner.
	var/rebound_per_structure = 0.15

/datum/mutation_upgrade/shell/shared_cure/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "[PERCENT(get_rebound(new_amount))]% of the health restored from Psychic Cure is reapplied to you."

/datum/mutation_upgrade/shell/shared_cure/on_mutation_enabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_cure/cure_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_cure]
	if(!cure_ability)
		return
	cure_ability.rebound_percentage += get_rebound(0)

/datum/mutation_upgrade/shell/shared_cure/on_mutation_disabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_cure/cure_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_cure]
	if(!cure_ability)
		return
	cure_ability.rebound_percentage -= get_rebound(0)

/datum/mutation_upgrade/shell/shared_cure/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_cure/cure_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_cure]
	if(!cure_ability)
		return
	cure_ability.rebound_percentage += get_rebound(new_amount - previous_amount, FALSE)

/// Returns the percentage of restored health from Psychic Cure to heal the owner.
/datum/mutation_upgrade/shell/shared_cure/proc/get_rebound(structure_count, include_initial = TRUE)
	return (include_initial ? rebound_initial : 0) + (rebound_per_structure * structure_count)

/datum/mutation_upgrade/shell/resistant_cure
	name = "Resistant Cure"
	desc = "心灵治愈现在还会为你和你的目标施加树脂凝胶的效果，持续40/50/60秒。"
	/// For the first structure, the amount of deciseconds that Psychic Cure will give fire immunity.
	var/duration_initial = 30 SECONDS
	/// For each structure, the amount of deciseconds that Psychic Cure will give fire immunity.
	var/duration_per_structure = 10 SECONDS

/datum/mutation_upgrade/shell/resistant_cure/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Psychic Cure now also applies the effects of resin jelly to you and your target for [get_duration(new_amount) / 10] seconds."

/datum/mutation_upgrade/shell/resistant_cure/on_mutation_enabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_cure/cure_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_cure]
	if(!cure_ability)
		return
	cure_ability.resin_jelly_duration += get_duration(0)

/datum/mutation_upgrade/shell/resistant_cure/on_mutation_disabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_cure/cure_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_cure]
	if(!cure_ability)
		return
	cure_ability.resin_jelly_duration -= get_duration(0)

/datum/mutation_upgrade/shell/resistant_cure/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_cure/cure_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_cure]
	if(!cure_ability)
		return
	cure_ability.resin_jelly_duration += get_duration(new_amount - previous_amount, FALSE)

/// Returns the amount of deciseconds that Psychic Cure will give fire immunity.
/datum/mutation_upgrade/shell/resistant_cure/proc/get_duration(structure_count, include_initial = TRUE)
	return (include_initial ? duration_initial : 0) + (duration_per_structure * structure_count)

//*********************//
//         Spur        //
//*********************//
/datum/mutation_upgrade/spur/smashing_fling
	name = "Smashing Fling"
	desc = "心灵甩投造成相当于你近战伤害的150/175/200%伤害，可引发碰撞，但不再立即击晕。如果目标与人类、物体或墙壁碰撞：双方都会被短暂麻痹并再次受到伤害。"
	/// For the first structure, the multiplier of the owner's melee damage to deal as both immediate and collusion damage.
	var/multiplier_initial = 1.25
	/// For each structure, the multiplier of the owner's melee damage to deal as both immediate and collusion damage.
	var/multiplier_per_structure = 0.25

/datum/mutation_upgrade/spur/smashing_fling/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Psychic Fling deals [PERCENT(get_multiplier(new_amount))]% damage equal to your melee damage, enables collusions, but no longer immediately stuns. If the target collides with a human, object, or wall: both are paralyzed and dealt damage again."

/datum/mutation_upgrade/spur/smashing_fling/on_mutation_enabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_fling/fling_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_fling]
	if(!fling_ability)
		return
	fling_ability.stun_duration = 0 SECONDS
	fling_ability.damage_multiplier += get_multiplier(0)
	fling_ability.collusion_paralyze_duration = 0.1 SECONDS // This is honestly flavor.
	fling_ability.collusion_damage_multiplier += get_multiplier(0)

/datum/mutation_upgrade/spur/smashing_fling/on_mutation_disabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_fling/fling_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_fling]
	if(!fling_ability)
		return
	fling_ability.stun_duration = initial(fling_ability.stun_duration)
	fling_ability.damage_multiplier -= get_multiplier(0)
	fling_ability.collusion_paralyze_duration = initial(fling_ability.collusion_paralyze_duration)
	fling_ability.collusion_damage_multiplier -= get_multiplier(0)

/datum/mutation_upgrade/spur/smashing_fling/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_fling/fling_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_fling]
	if(!fling_ability)
		return
	var/amount = get_multiplier(new_amount - previous_amount, FALSE)
	fling_ability.damage_multiplier += amount
	fling_ability.collusion_damage_multiplier += amount

/// Returns the multiplier of the owner's melee damage to deal as both immediate and collusion damage.
/datum/mutation_upgrade/spur/smashing_fling/proc/get_multiplier(structure_count, include_initial = TRUE)
	return (include_initial ? multiplier_initial : 0) + (multiplier_per_structure * structure_count)

/datum/mutation_upgrade/spur/gravity_tide
	name = "Gravity Tide"
	desc = "不灭之力将物体拉向你，然后将其推开。投掷距离增加2/3/4。"
	/// For the first structure, the amount of distance that Unrelenting Force will throw things.
	var/distance_initial = 1
	/// For each structure, the additional amount of distance that Unrelenting Force will throw things.
	var/distance_per_structure = -1

/datum/mutation_upgrade/spur/gravity_tide/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Unrelenting Force pulls things towards you then pushes them away. The distance they are thrown is increased by [get_distance(new_amount)]."

/datum/mutation_upgrade/spur/gravity_tide/on_mutation_enabled()
	. = ..()
	var/datum/action/ability/activable/xeno/unrelenting_force/force_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/unrelenting_force]
	if(!force_ability)
		return
	force_ability.rebound_throwing = TRUE
	force_ability.throwing_distance += get_distance(0)

/datum/mutation_upgrade/spur/gravity_tide/on_mutation_disabled()
	. = ..()
	var/datum/action/ability/activable/xeno/unrelenting_force/force_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/unrelenting_force]
	if(!force_ability)
		return
	force_ability.rebound_throwing = initial(force_ability.rebound_throwing)
	force_ability.throwing_distance -= get_distance(0)

/datum/mutation_upgrade/spur/gravity_tide/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/activable/xeno/unrelenting_force/force_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/unrelenting_force]
	if(!force_ability)
		return
	force_ability.throwing_distance += get_distance(new_amount - previous_amount, FALSE)

/// Returns the amount of distance that Unrelenting Force will throw things.
/datum/mutation_upgrade/spur/gravity_tide/proc/get_distance(structure_count, include_initial = TRUE)
	return (include_initial ? distance_initial : 0) + (distance_per_structure * structure_count)

/datum/mutation_upgrade/spur/body_fling
	name = "Body Fling"
	desc = "心灵甩投可对自身和友方异形使用。被甩投异形击中的人类将麻痹2秒，并受到相当于你斩击伤害150/175/200%的伤害。"
	conflicting_mutation_types = list(
		/datum/mutation_upgrade/veil/psychic_choke
	)
	/// For the first structure, the multiplier of the owner's slash damage dealt when a xenomorph flung by Psychic Fling collides with a human.
	var/multiplier_initial = 1.25
	/// For each structure, the additional multiplier of the owner's slash damage dealt when a xenomorph flung by Psychic Fling collides with a human.
	var/multiplier_per_structure = 0.25

/datum/mutation_upgrade/spur/body_fling/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Psychic Fling can be used on yourself and allied xenomorphs. Humans who are hit by a flung xenomorph are paralyzed for 2 seconds and dealt [PERCENT(get_multiplier(new_amount))]% of your slash damage."

/datum/mutation_upgrade/spur/body_fling/on_mutation_enabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_fling/fling_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_fling]
	if(!fling_ability)
		return
	fling_ability.use_state_flags |= ABILITY_TARGET_SELF
	fling_ability.collusion_damage_multiplier += get_multiplier(0)
	fling_ability.collusion_paralyze_duration += 2 SECONDS
	fling_ability.collusion_xenos_only = TRUE

/datum/mutation_upgrade/spur/body_fling/on_mutation_disabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_fling/fling_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_fling]
	if(!fling_ability)
		return
	fling_ability.use_state_flags &= ~ABILITY_TARGET_SELF
	fling_ability.collusion_damage_multiplier -= get_multiplier(0)
	fling_ability.collusion_paralyze_duration -= 2 SECONDS
	fling_ability.collusion_xenos_only = initial(fling_ability.collusion_xenos_only)

/datum/mutation_upgrade/spur/body_fling/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_fling/fling_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_fling]
	if(!fling_ability)
		return
	fling_ability.collusion_damage_multiplier += get_multiplier(new_amount - previous_amount, FALSE)

/// Returns multiplier of the owner's slash damage dealt when a xenomorph flung by Psychic Fling collides with a human.
/datum/mutation_upgrade/spur/body_fling/proc/get_multiplier(structure_count, include_initial = TRUE)
	return (include_initial ? multiplier_initial : 0) + (multiplier_per_structure * structure_count)

//*********************//
//         Veil        //
//*********************//
/datum/mutation_upgrade/veil/delayed_condition
	name = "Delayed Condition"
	desc = "心灵治愈赋予目标减速免疫，并延迟所有对其造成的击晕、击倒和踉跄效果8/10/12秒。延迟结束后，状态效果将重新施加。"
	/// For the first structure, the amount of deciseconds that Psychic Cure will delay various status effects by.
	var/duration_initial = 6 SECONDS
	/// For each structure, the amount of deciseconds that Psychic Cure will delay various status effects by.
	var/duration_per_structure = 2 SECONDS

/datum/mutation_upgrade/veil/delayed_condition/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Psychic Heal grants slowdown immunity and delays all inbound stun, knockdown, and stagger effects caused to your target by [get_duration(new_amount) / 10] seconds. At the end of this duration, delayed status effects are reapplied."

/datum/mutation_upgrade/veil/delayed_condition/on_mutation_enabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_cure/cure_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_cure]
	if(!cure_ability)
		return
	cure_ability.delayed_status_duration += get_duration(0)

/datum/mutation_upgrade/veil/delayed_condition/on_mutation_disabled()
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_cure/cure_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_cure]
	if(!cure_ability)
		return
	cure_ability.delayed_status_duration -= get_duration(0)

/datum/mutation_upgrade/veil/delayed_condition/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_cure/cure_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_cure]
	if(!cure_ability)
		return
	cure_ability.delayed_status_duration += get_duration(new_amount - previous_amount, FALSE)

/// Returns the amount of deciseconds that Psychic Cure will delay various status effects by.
/datum/mutation_upgrade/veil/delayed_condition/proc/get_duration(structure_count, include_initial = TRUE)
	return (include_initial ? duration_initial : 0) + (duration_per_structure * structure_count)

/datum/mutation_upgrade/veil/deflective_force
	name = "Deflective Force"
	desc = "不屈之力现在会反弹其影响区域内的所有抛射物。反弹超过50点抛射物伤害时，会将心灵尖啸的冷却时间重置为原始值的50/40/30%。"
	/// For the first structure, the amount to multiply Psychic Scream's cooldown by if enough projectile damage was reflected.
	var/multiplier_initial = 0.6
	/// For each structure, the additional amount to multiply Psychic Scream's cooldown by if enough projectile damage was reflected.
	var/multiplier_per_structure = -0.1

/datum/mutation_upgrade/veil/deflective_force/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "Unrelenting Force now reflects all projectiles in its affected area. Reflecting more than 50 projectile damage resets Psychic Scream's cooldown to [PERCENT(get_multiplier(new_amount))]% of its original value."

/datum/mutation_upgrade/veil/deflective_force/on_mutation_enabled()
	. = ..()
	var/datum/action/ability/activable/xeno/unrelenting_force/force_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/unrelenting_force]
	if(!force_ability)
		return
	force_ability.projectile_cooldown_mulitplier += get_multiplier(0)

/datum/mutation_upgrade/veil/deflective_force/on_mutation_disabled()
	. = ..()
	var/datum/action/ability/activable/xeno/unrelenting_force/force_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/unrelenting_force]
	if(!force_ability)
		return
	force_ability.projectile_cooldown_mulitplier -= get_multiplier(0)

/datum/mutation_upgrade/veil/deflective_force/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/activable/xeno/unrelenting_force/force_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/unrelenting_force]
	if(!force_ability)
		return
	force_ability.projectile_cooldown_mulitplier += get_multiplier(new_amount - previous_amount, FALSE)

/// Returns the amount to multiply Psychic Scream's cooldown by if enough projectile damage was reflected.
/datum/mutation_upgrade/veil/deflective_force/proc/get_multiplier(structure_count, include_initial = TRUE)
	return (include_initial ? multiplier_initial : 0) + (multiplier_per_structure * structure_count)

/datum/mutation_upgrade/veil/psychic_choke
	name = "Psychic Choke"
	desc = "你失去了心灵甩投能力，换来了心灵扼喉能力。心灵扼喉能让你在持续引导时麻痹一名陆战队员。打断心灵扼喉的伤害阈值为20/35/50。"
	conflicting_mutation_types = list(
		/datum/mutation_upgrade/spur/body_fling
	)
	/// For each structure, the amount to increase Psychic Choke's damage threshold.
	var/threshold_per_structure = 15

/datum/mutation_upgrade/veil/psychic_choke/get_desc_for_alert(new_amount)
	if(!new_amount)
		return ..()
	return "You lose the ability Psychic Fling in exchange for the ability Psychic Choke. Psychic Choke lets you paralyze a marine as long you channel it. The damage threshold to disrupt Psychic Choke is [get_threshold(new_amount)]."

/datum/mutation_upgrade/veil/psychic_choke/on_mutation_enabled()
	var/datum/action/ability/activable/xeno/psychic_fling/fling_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_fling]
	if(fling_ability)
		fling_ability.remove_action(xenomorph_owner)
	var/datum/action/ability/activable/xeno/psychic_choke/choke_ability = new()
	choke_ability.give_action(xenomorph_owner)
	return ..()

/datum/mutation_upgrade/veil/psychic_choke/on_mutation_disabled()
	var/datum/action/ability/activable/xeno/psychic_choke/choke_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_choke]
	if(choke_ability)
		choke_ability.remove_action(xenomorph_owner)
	var/datum/action/ability/activable/xeno/psychic_fling/fling_ability = new()
	fling_ability.give_action(xenomorph_owner)
	return ..()

/datum/mutation_upgrade/veil/psychic_choke/on_structure_update(previous_amount, new_amount)
	. = ..()
	var/datum/action/ability/activable/xeno/psychic_choke/choke_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_choke]
	if(!choke_ability)
		return
	choke_ability.damage_threshold += get_threshold(new_amount - previous_amount, FALSE)

/datum/mutation_upgrade/veil/psychic_choke/on_xenomorph_upgrade()
	var/datum/action/ability/activable/xeno/psychic_fling/fling_ability = xenomorph_owner.actions_by_path[/datum/action/ability/activable/xeno/psychic_fling]
	if(fling_ability)
		fling_ability.remove_action(xenomorph_owner) // Since upgrading give abilities that are missing, we have to remove it again.

/// Returns the amount to increase Psychic Choke's damage threshold.
/datum/mutation_upgrade/veil/psychic_choke/proc/get_threshold(structure_count, include_initial = TRUE)
	return (include_initial ? PSYCHIC_CHOKE_DAMAGE_THRESHOLD : 0) + (threshold_per_structure * structure_count)
