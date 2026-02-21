/obj/item/explosive/grenade/incendiary
	name = "\improper M40 HIDP 燃烧手雷"
	desc = "M40 HIDP是一种小型但威力惊人的燃烧手雷。它设定在4秒后引爆。"
	icon_state = "grenade_fire"
	worn_icon_state = "grenade_fire"
	det_time = 4 SECONDS
	hud_state = "grenade_fire"
	icon_state_mini = "grenade_orange"

/obj/item/explosive/grenade/incendiary/prime()
	flame_radius(2, get_turf(src))
	playsound(loc, SFX_INCENDIARY_EXPLOSION, 35)
	qdel(src)


/proc/flame_radius(radius = 1, turf/epicenter, burn_intensity = 25, burn_duration = 25, burn_damage = 25, fire_stacks = 15, colour = "red", fire_type = /obj/fire/flamer) //~Art updated fire.
	if(!isturf(epicenter))
		CRASH("flame_radius used without a valid turf parameter")
	radius = clamp(radius, 1, 50) //Sanitize inputs

	for(var/t in filled_turfs(epicenter, radius, "circle", pass_flags_checked = PASS_AIR))
		var/turf/turf_to_flame = t
		turf_to_flame.ignite(randfloat(burn_duration*0.75, burn_duration), burn_intensity, colour, burn_damage, fire_stacks, fire_type)

/obj/item/explosive/grenade/incendiary/som
	name = "\improper S30-I 燃烧手雷"
	desc = "火星之子部队使用的可靠燃烧手雷。基于大多数火星之子手雷共用的S30平台设计。适用于手投或枪榴弹发射器使用。"
	icon_state = "grenade_fire_som"
	worn_icon_state = "grenade_fire_som"

/obj/item/explosive/grenade/incendiary/molotov
	name = "简易燃烧弹"
	desc = "一种强效的简易燃烧弹，掺入少量火药。廉价、高效，在密闭空间中尤为致命。常见于叛乱分子和恐怖分子之手。很难预测它会在几秒后爆炸，务必小心。很可能在你面前就炸开。"
	icon_state = "molotov"
	worn_icon_state = "molotov"
	arm_sound = 'sound/items/welder2.ogg'

/obj/item/explosive/grenade/incendiary/molotov/Initialize(mapload)
	. = ..()
	det_time = rand(1 SECONDS, 4 SECONDS)//Adds some risk to using this thing.

/obj/item/explosive/grenade/incendiary/molotov/prime()
	flame_radius(2, get_turf(src))
	playsound(loc, SFX_MOLOTOV, 35)
	qdel(src)

/obj/item/explosive/grenade/incendiary/molotov/throw_impact(atom/hit_atom, speed, bounce = TRUE)
	. = ..()
	if(!.)
		return
	if(!hit_atom.density || prob(35))
		return
	prime()
