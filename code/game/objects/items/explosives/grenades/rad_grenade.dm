/obj/item/explosive/grenade/rad
	name = "\improper V-40辐射手雷"
	desc = "辐射手雷会释放出极其强烈但短暂的辐射脉冲，在中等半径范围内削弱有机生命体并烧毁电子设备。在初始爆炸后，放射性效应会持续一段时间。请极其小心地处理。"
	icon_state = "grenade_rad"
	worn_icon_state = "grenade_rad"
	icon_state_mini = "grenade_red"
	hud_state = "grenade_he"
	///The range for the grenade's full effect
	var/inner_range = 4
	///The range range for the grenade's weak effect
	var/outer_range = 7
	///The potency of the grenade
	var/rad_strength = 16

/obj/item/explosive/grenade/rad/prime()
	var/turf/impact_turf = get_turf(src)

	playsound(impact_turf, 'sound/effects/portal_opening.ogg', 50, 1)
	for(var/mob/living/victim in hearers(outer_range, src))
		var/strength
		var/sound_level
		if(get_dist(victim, impact_turf) <= inner_range)
			strength = rad_strength
			sound_level = 3
		else
			strength = rad_strength * 0.6
			sound_level = 2

		strength = victim.modify_by_armor(strength, BIO, 25)
		victim.apply_radiation(strength, sound_level)
	qdel(src)
