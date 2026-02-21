/*
//================================================
					Shotgun Ammo
//================================================
*/

/datum/ammo/bullet/shotgun
	hud_state_empty = "shotgun_empty"
	shell_speed = 2
	handful_amount = 5


/datum/ammo/bullet/shotgun/slug
	name = "霰弹枪独头弹"
	handful_icon_state = "shotgun_slug"
	hud_state = "shotgun_slug"
	ammo_behavior_flags = AMMO_BALLISTIC
	shell_speed = 3
	max_range = 15
	damage = 100
	penetration = 20
	sundering = 7.5

/datum/ammo/bullet/shotgun/slug/on_hit_mob(mob/target_mob, atom/movable/projectile/proj)
	staggerstun(target_mob, proj, paralyze = 2 SECONDS, stagger = 2 SECONDS, knockback = 1, slowdown = 2)


/datum/ammo/bullet/shotgun/beanbag
	name = "豆袋弹"
	handful_icon_state = "beanbag_slug"
	icon_state = "beanbag"
	hud_state = "shotgun_beanbag"
	ammo_behavior_flags = AMMO_BALLISTIC
	damage = 15
	max_range = 15
	shrapnel_chance = 0
	accuracy = 5

/datum/ammo/bullet/shotgun/beanbag/on_hit_mob(mob/target_mob, atom/movable/projectile/proj)
	staggerstun(target_mob, proj, paralyze = 2 SECONDS, stagger = 4 SECONDS, knockback = 1, slowdown = 2, hard_size_threshold = 1)

/datum/ammo/bullet/shotgun/incendiary
	name = "燃烧霰弹"
	handful_icon_state = "incendiary_slug"
	hud_state = "shotgun_fire"
	damage_type = BRUTE
	ammo_behavior_flags = AMMO_BALLISTIC|AMMO_INCENDIARY
	max_range = 15
	damage = 70
	penetration = 15
	sundering = 2
	bullet_color = COLOR_TAN_ORANGE

/datum/ammo/bullet/shotgun/incendiary/on_hit_mob(mob/target_mob, atom/movable/projectile/proj)
	staggerstun(target_mob, proj, knockback = 2, slowdown = 1)

/datum/ammo/bullet/shotgun/flechette
	name = "霰弹枪箭弹"
	handful_icon_state = "shotgun_flechette"
	icon_state = "flechette"
	hud_state = "shotgun_flechette"
	ammo_behavior_flags = AMMO_BALLISTIC
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/flechette/flechette_spread
	bonus_projectiles_amount = 2
	bonus_projectiles_scatter = 3
	accuracy_variation = 8
	max_range = 15
	damage = 50
	damage_falloff = 0.5
	penetration = 15
	sundering = 7

/datum/ammo/bullet/shotgun/flechette/flechette_spread
	name = "额外霰弹"
	damage = 40
	sundering = 5

/datum/ammo/bullet/shotgun/buckshot
	name = "霰弹枪鹿弹"
	handful_icon_state = "shotgun_buckshot"
	icon_state = "buckshot"
	hud_state = "shotgun_buckshot"
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/spread
	bonus_projectiles_amount = 5
	bonus_projectiles_scatter = 4
	accuracy_variation = 9
	accurate_range = 3
	max_range = 10
	damage = 40
	damage_falloff = 4

/datum/ammo/bullet/shotgun/buckshot/on_hit_mob(mob/target_mob, atom/movable/projectile/proj)
	staggerstun(target_mob, proj, paralyze = 2 SECONDS, stagger = 2 SECONDS, knockback = 2, slowdown = 0.5, max_range = 3)

/datum/ammo/bullet/hefa_buckshot
	name = "hefa 碎片"
	handful_icon_state = "shotgun_buckshot"
	icon_state = "buckshot"
	hud_state = "shotgun_buckshot"
	accuracy_variation = 9
	accurate_range = 3
	max_range = 10
	shrapnel_chance = 15
	damage = 30
	damage_falloff = 3

/datum/ammo/bullet/hefa_buckshot/on_hit_mob(mob/target_mob, atom/movable/projectile/proj)
	staggerstun(target_mob, proj, knockback = 2, max_range = 4)

/datum/ammo/bullet/shotgun/spread
	name = "额外鹿弹"
	icon_state = "buckshot"
	accuracy_variation = 9
	accurate_range = 3
	max_range = 10
	damage = 40
	damage_falloff = 4

/datum/ammo/bullet/shotgun/frag
	name = "霰弹枪高爆弹"
	handful_icon_state = "shotgun_tracker"
	hud_state = "shotgun_tracker"
	ammo_behavior_flags = AMMO_BALLISTIC
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/frag/frag_spread
	bonus_projectiles_amount = 2
	bonus_projectiles_scatter = 6
	accuracy_variation = 8
	max_range = 15
	damage = 10
	damage_falloff = 0.5
	penetration = 0

/datum/ammo/bullet/shotgun/frag/drop_nade(turf/T)
	explosion(T, weak_impact_range = 2, tiny = TRUE, explosion_cause=src)

/datum/ammo/bullet/shotgun/frag/on_hit_mob(mob/target_mob, atom/movable/projectile/proj)
	drop_nade(get_turf(target_mob))

/datum/ammo/bullet/shotgun/frag/on_hit_obj(obj/target_obj, atom/movable/projectile/proj)
	drop_nade(target_obj.density ? get_step_towards(target_obj, proj) : target_obj.loc)

/datum/ammo/bullet/shotgun/frag/on_hit_turf(turf/target_turf, atom/movable/projectile/proj)
	drop_nade(target_turf.density ? get_step_towards(target_turf, proj) : target_turf)

/datum/ammo/bullet/shotgun/frag/do_at_max_range(turf/target_turf, atom/movable/projectile/proj)
	drop_nade(target_turf.density ? get_step_towards(target_turf, proj) : target_turf)

/datum/ammo/bullet/shotgun/frag/frag_spread
	name = "额外破片弹"
	damage = 5

/datum/ammo/bullet/shotgun/sx16_buckshot
	name = "霰弹枪鹿弹" //16 gauge is between 12 and 410 bore.
	handful_icon_state = "shotgun_buckshot"
	icon_state = "buckshot"
	hud_state = "shotgun_buckshot"
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/sx16_buckshot/spread
	bonus_projectiles_amount = 4
	bonus_projectiles_scatter = 10
	accuracy_variation = 10
	max_range = 10
	damage = 25
	damage_falloff = 4

/datum/ammo/bullet/shotgun/sx16_buckshot/spread
	name = "额外鹿弹"

/datum/ammo/bullet/shotgun/heavy_buckshot
	name = "重型鹿弹"
	handful_icon_state = "heavy_shotgun_buckshot"
	icon_state = "buckshot"
	hud_state = "shotgun_buckshot"
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/heavy_spread
	bonus_projectiles_amount = 5
	bonus_projectiles_scatter = 4
	accuracy_variation = 9
	accurate_range = 3
	max_range = 10
	damage = 50
	damage_falloff = 4

/datum/ammo/bullet/shotgun/heavy_buckshot/on_hit_mob(mob/target_mob, atom/movable/projectile/proj)
	staggerstun(target_mob, proj, paralyze = 2 SECONDS, stagger = 2 SECONDS, knockback = 2, slowdown = 0.5, max_range = 3)

/datum/ammo/bullet/shotgun/barrikada_slug
	name = "重金属弹头"
	handful_icon_state = "heavy_shotgun_barrikada"
	hud_state = "shotgun_slug"
	ammo_behavior_flags = AMMO_BALLISTIC
	shell_speed = 4
	max_range = 15
	damage = 125
	penetration = 50
	sundering = 15

/datum/ammo/bullet/shotgun/barrikada/on_hit_mob(mob/target_mob, atom/movable/projectile/proj)
	staggerstun(target_mob, proj, slowdown = 2, stagger = 3 SECONDS, knockback = 2)

/datum/ammo/bullet/shotgun/heavy_spread
	name = "额外鹿弹"
	icon_state = "buckshot"
	accuracy_variation = 9
	accurate_range = 3
	max_range = 10
	damage = 50
	damage_falloff = 4

/datum/ammo/bullet/shotgun/sx16_flechette
	name = "霰弹枪箭弹"
	handful_icon_state = "shotgun_flechette"
	icon_state = "flechette"
	hud_state = "shotgun_flechette"
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/sx16_flechette/spread
	bonus_projectiles_amount = 4
	bonus_projectiles_scatter = 8
	accuracy_variation = 7
	max_range = 15
	damage = 15
	damage_falloff = 0.5
	penetration = 15

/datum/ammo/bullet/shotgun/sx16_flechette/spread
	name = "额外霰弹"

/datum/ammo/bullet/shotgun/sx16_slug
	name = "霰弹枪独头弹"
	handful_icon_state = "shotgun_slug"
	hud_state = "shotgun_slug"
	shell_speed = 3
	max_range = 15
	damage = 40
	penetration = 20

/datum/ammo/bullet/shotgun/sx16_slug/on_hit_mob(mob/target_mob, atom/movable/projectile/proj)
	staggerstun(target_mob, proj, slowdown = 1, knockback = 1)

/datum/ammo/bullet/shotgun/tx15_flechette
	name = "霰弹枪箭弹"
	handful_icon_state = "shotgun_flechette"
	icon_state = "flechette"
	hud_state = "shotgun_flechette"
	ammo_behavior_flags = AMMO_BALLISTIC
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/tx15_flechette/spread
	bonus_projectiles_amount = 4
	bonus_projectiles_scatter = 2
	max_range = 15
	damage = 17
	damage_falloff = 0.25
	penetration = 15
	sundering = 1.5

/datum/ammo/bullet/shotgun/tx15_flechette/spread
	name = "额外霰弹"

/datum/ammo/bullet/shotgun/tx15_slug
	name = "霰弹枪独头弹"
	handful_icon_state = "shotgun_slug"
	hud_state = "shotgun_slug"
	ammo_behavior_flags = AMMO_BALLISTIC
	shell_speed = 3
	max_range = 15
	damage = 60
	penetration = 30
	sundering = 3.5

/datum/ammo/bullet/shotgun/tx15_slug/on_hit_mob(mob/target_mob, atom/movable/projectile/proj)
	staggerstun(target_mob, proj, slowdown = 2, knockback = 1)

/datum/ammo/bullet/shotgun/mbx900_buckshot
	name = "轻型霰弹枪鹿弹" // If .410 is the smallest shotgun shell, then...
	handful_icon_state = "light_shotgun_buckshot"
	icon_state = "buckshot"
	hud_state = "shotgun_buckshot"
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/mbx900_buckshot/spread
	bonus_projectiles_amount = 2
	bonus_projectiles_scatter = 10
	accuracy_variation = 10
	max_range = 10
	damage = 50
	damage_falloff = 1

/datum/ammo/bullet/shotgun/mbx900_buckshot/spread
	name = "额外鹿弹"
	damage = 40

/datum/ammo/bullet/shotgun/mbx900_sabot
	name = "轻型霰弹枪脱壳弹"
	handful_icon_state = "light_shotgun_sabot"
	icon_state = "shotgun_slug"
	hud_state = "shotgun_sabot"
	ammo_behavior_flags = AMMO_BALLISTIC
	shell_speed = 5
	max_range = 30
	damage = 50
	penetration = 40
	sundering = 3

/datum/ammo/bullet/shotgun/mbx900_tracker
	name = "轻型霰弹枪追踪弹"
	handful_icon_state = "light_shotgun_tracker"
	icon_state = "shotgun_slug"
	hud_state = "shotgun_tracker"
	shell_speed = 4
	max_range = 15
	damage = 40
	penetration = 30

/datum/ammo/bullet/shotgun/mbx900_tracker/on_hit_mob(mob/target_mob, atom/movable/projectile/proj)
	target_mob.AddComponent(/datum/component/dripping, DRIP_ON_TIME, 60 SECONDS, 3 SECONDS)

/datum/ammo/bullet/shotgun/tracker
	name = "霰弹枪追踪弹"
	handful_icon_state = "shotgun_tracker"
	icon_state = "shotgun_slug"
	hud_state = "shotgun_tracker"
	shell_speed = 4
	max_range = 15
	damage = 90
	penetration = 10

/datum/ammo/bullet/shotgun/tracker/on_hit_mob(mob/target_mob, atom/movable/projectile/proj)
	target_mob.AddComponent(/datum/component/dripping, DRIP_ON_TIME, 60 SECONDS, 3 SECONDS)

//I INSERT THE SHELLS IN AN UNKNOWN ORDER
/datum/ammo/bullet/shotgun/blank
	name = "霰弹枪空包弹"
	handful_icon_state = "shotgun_blank"
	icon_state = "shotgun_blank"
	hud_state = "shotgun_buckshot" // don't fix this: this is so you can do buckshot roulette
	shell_speed = 0
	max_range = -1
	damage = 0

//Breaching shell!!

/datum/ammo/bullet/shotgun/breaching
	name = "霰弹枪破门弹"
	handful_icon_state = "shotgun_slug"
	hud_state = "shotgun_slug"
	ammo_behavior_flags = AMMO_BALLISTIC
	shell_speed = 3
	max_range = 5
	damage = 200
	penetration = 0
	sundering = 5
	///Bonus flat damage to walls, balanced around resin walls. Stolen from autocannons
	var/wall_bonus = 900

/datum/ammo/bullet/shotgun/breaching/on_hit_turf(turf/target_turf, atom/movable/projectile/proj)
	proj.proj_max_range -= 20

	if(istype(target_turf, /turf/closed/wall))
		var/turf/closed/wall/wall_victim = target_turf
		wall_victim.take_damage(wall_bonus, proj.damtype, proj.armor_type)

/datum/ammo/bullet/shotgun/breaching/on_hit_mob(mob/target_mob, atom/movable/projectile/proj)
	proj.proj_max_range -= 5
	staggerstun(target_mob, proj, max_range = 20, slowdown = 1)

/datum/ammo/bullet/shotgun/breaching/on_hit_obj(obj/target_obj, atom/movable/projectile/proj)
	proj.proj_max_range -= 5


/datum/ammo/bullet/shotgun/sh410_ricochet
	name = "轻型自动霰弹枪跳弹弹壳"
	handful_icon_state = "light_shotgun_ricochet"
	icon_state = "bullet_large_red"
	hud_state = "shotgun_ricochet"
	ammo_behavior_flags = AMMO_BALLISTIC
	shell_speed = 2
	max_range = 15
	damage = 50
	penetration = 0
	sundering = 0.5
	bonus_projectiles_scatter = 0

/datum/ammo/bullet/shotgun/sh410_ricochet/on_hit_turf(turf/target_turf, atom/movable/projectile/proj)
	reflect(target_turf, proj, 20)

/datum/ammo/bullet/shotgun/sh410_ricochet/one
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/sh410_ricochet

/datum/ammo/bullet/shotgun/sh410_ricochet/two
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/sh410_ricochet/one

/datum/ammo/bullet/shotgun/sh410_gas
	name = "轻型自动霰弹枪气体弹"
	handful_icon_state = "light_shotgun_gas"
	icon_state = "bullet_large_green"
	hud_state = "shotgun_flechette"
	ammo_behavior_flags = AMMO_BALLISTIC|AMMO_LEAVE_TURF
	shell_speed = 2.5
	max_range = 8
	damage = 40
	penetration = 0
	sundering = 0
	shrapnel_chance = 0
	var/passed_turf_smoke_type = /datum/effect_system/smoke_spread/bad
	var/datum/effect_system/smoke_spread/bad/trail_spread_system

/datum/ammo/bullet/shotgun/sh410_gas/New()
	. = ..()
	if((ammo_behavior_flags & AMMO_LEAVE_TURF) && passed_turf_smoke_type)
		trail_spread_system = new passed_turf_smoke_type(only_once = FALSE)

/datum/ammo/bullet/shotgun/sh410_gas/Destroy()
	if(trail_spread_system)
		QDEL_NULL(trail_spread_system)
	return ..()

/datum/ammo/bullet/shotgun/sh410_gas/on_leave_turf(turf/target_turf, atom/movable/projectile/proj)
	trail_spread_system.set_up(0, target_turf, 3)
	trail_spread_system.start()

/datum/ammo/bullet/shotgun/sh410_buckshot
	name = "轻型自动霰弹枪马格努姆鹿弹弹壳"
	handful_icon_state = "light_shotgun_buckshot"
	icon_state = "buckshot"
	hud_state = "shotgun_buckshot"
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/sh410_buckshot/spread
	bonus_projectiles_amount = 4
	bonus_projectiles_scatter = 5
	accuracy_variation = 10
	max_range = 10
	damage = 20
	damage_falloff = 0.5

/datum/ammo/bullet/shotgun/sh410_buckshot/spread
	name = "额外鹿弹"
	damage = 20

/datum/ammo/bullet/shotgun/sh410_sabot
	name = "轻型自动霰弹枪脱壳弹"
	handful_icon_state = "light_shotgun_sabot"
	icon_state = "bullet_large"
	hud_state = "shotgun_sabot"
	ammo_behavior_flags = AMMO_BALLISTIC
	shell_speed = 5
	max_range = 30
	damage = 50
	penetration = 40
	sundering = 3
