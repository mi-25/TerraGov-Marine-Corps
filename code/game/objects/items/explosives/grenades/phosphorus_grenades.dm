/obj/item/explosive/grenade/phosphorus
	name = "\improper M40 HPDP 手雷"
	desc = "M40 HPDP是一种小型但威力强大的磷质手雷。它设定在2秒后引爆。"
	icon_state = "grenade_phos"
	worn_icon_state = "grenade_phos"
	det_time = 2 SECONDS
	hud_state = "grenade_hide"
	var/datum/effect_system/smoke_spread/phosphorus/smoke
	icon_state_mini = "grenade_cyan"

/obj/item/explosive/grenade/phosphorus/Initialize(mapload)
	. = ..()
	smoke = new(src)

/obj/item/explosive/grenade/phosphorus/Destroy()
	QDEL_NULL(smoke)
	return ..()

/obj/item/explosive/grenade/phosphorus/prime()
	playsound(loc, 'sound/effects/smoke.ogg', 25, 1, 4)
	smoke.set_up(6, loc, 7)
	smoke.start()
	flame_radius(4, get_turf(src))
	flame_radius(1, get_turf(src), burn_intensity = 75, burn_duration = 45, burn_damage = 15, fire_stacks = 75)	//The closer to the middle you are the more it hurts
	qdel(src)

/obj/item/explosive/grenade/phosphorus/activate(mob/user)
	. = ..()
	if(!.)
		return FALSE
	user?.record_war_crime()

/obj/item/explosive/grenade/phosphorus/upp
	name = "\improper 8型白磷手雷"
	desc = "一枚在联合太空鳞翅目部队中发现的致命气体手雷。设计用于向目标泼洒白磷。拉环后2秒爆炸。"
	icon_state = "grenade_upp_wp"
	worn_icon_state = "grenade_upp_wp"
	arm_sound = 'sound/weapons/armbombpin_1.ogg'
