/obj/item/explosive/grenade/smokebomb
	name = "\improper M40 HSDP 烟雾手雷"
	desc = "M40 HSDP是一种小型但威力强大的烟雾手雷。基于与M40 HEDP相同的平台。设定在2秒后引爆。"
	icon_state = "grenade_smoke"
	worn_icon_state = "grenade_smoke"
	det_time = 2 SECONDS
	hud_state = "grenade_smoke"
	dangerous = FALSE
	icon_state_mini = "grenade_blue"
	/// smoke type created when the grenade is primed
	var/datum/effect_system/smoke_spread/smoketype = /datum/effect_system/smoke_spread/bad
	///radius this smoke grenade will encompass
	var/smokeradius = 6
	///The duration of the smoke in 2 second ticks
	var/smoke_duration = 9

/obj/item/explosive/grenade/smokebomb/prime()
	var/datum/effect_system/smoke_spread/smoke = new smoketype()
	playsound(loc, 'sound/effects/smoke_bomb.ogg', 25, TRUE)
	smoke.set_up(smokeradius, loc, smoke_duration)
	smoke.start()
	qdel(src)

/obj/item/explosive/grenade/smokebomb/som
	name = "\improper S30-S 烟雾手雷"
	desc = "S30-S是一种小型但威力强大的烟雾手雷。基于大多数火星之子手雷共享的S30平台。设定在2秒后引爆。"
	icon_state = "grenade_smoke_som"
	worn_icon_state = "grenade_smoke_som"

/obj/item/explosive/grenade/smokebomb/neuro
	name = "\improper M40-N 神经毒素烟雾手雷"
	desc = "一枚烟雾手雷，内含由纳米传讯开发的浓缩神经毒素，据称源自异形。在某些星域被禁止用作化学武器，但被地球政府殖民地海军陆战队归类为低致命性防暴工具。"
	icon_state = "grenade_neuro"
	worn_icon_state = "grenade_neuro"
	hud_state = "grenade_neuro"
	det_time = 4 SECONDS
	dangerous = TRUE
	smoketype = /datum/effect_system/smoke_spread/xeno/neuro/medium

/obj/item/explosive/grenade/smokebomb/acid
	name = "\improper M40-A 酸液烟雾手雷"
	desc = "一种设定为释放由纳米传讯开发的、据称源自异形的强酸性烟雾云的手雷。拥有闪亮的耐酸外壳。根据多项条约，其使用被视为战争罪行，但地球政府均未签署这些条约。"
	icon_state = "grenade_acid"
	worn_icon_state = "grenade_acid"
	hud_state = "grenade_acid"
	det_time = 4 SECONDS
	dangerous = TRUE
	smoketype = /datum/effect_system/smoke_spread/xeno/acid/opaque
	smokeradius = 5

/obj/item/explosive/grenade/smokebomb/satrapine
	name = "萨特拉平烟雾手雷"
	desc = "一枚含有神经毒剂的烟雾手雷，能使受害者因剧痛而丧失行动能力，同时清除常见的止痛药。火星之子部队大量使用此装备。"
	icon_state = "grenade_nerve"
	worn_icon_state = "grenade_nerve"
	hud_state = "grenade_nerve"
	det_time = 4 SECONDS
	dangerous = TRUE
	smoketype = /datum/effect_system/smoke_spread/satrapine

/obj/item/explosive/grenade/smokebomb/satrapine/activate(mob/user)
	. = ..()
	if(!.)
		return FALSE
	user?.record_war_crime()

/obj/item/explosive/grenade/smokebomb/cloak
	name = "\improper M40-2 SCDP 烟雾手雷"
	desc = "M40 HSDP 的改进型号，烟雾弹幕有效载荷略有提升。设定为 2 秒后引爆。"
	icon_state = "grenade_cloak"
	worn_icon_state = "grenade_cloak"
	hud_state = "grenade_hide"
	icon_state_mini = "grenade_green"
	smoketype = /datum/effect_system/smoke_spread/tactical
	smoke_duration = 11
	smokeradius = 7

/obj/item/explosive/grenade/smokebomb/cloak/som
	name = "\improper S30-C 烟雾手雷"
	desc = "S30-S的改进型号，配备了略微增强的烟雾弹载荷。设定为2秒后引爆。"
	icon_state = "grenade_cloak_som"
	worn_icon_state = "grenade_cloak_som"

/obj/item/explosive/grenade/smokebomb/cloak/ags
	name = "\improper AGLS-37 SCDP 烟雾手雷"
	desc = "一枚小巧的智能手雷，它即将在你面前爆炸，除非你发现它是惰性的。除此之外，这是一枚相当普通的手雷，只不过它不知为何处于可触发状态。"
	icon_state = "ags_cloak"
	smokeradius = 4

/obj/item/explosive/grenade/smokebomb/drain
	name = "\improper M40-T 烟雾手雷"
	desc = "M40-T是一种小型但威力强大的缠足手雷，旨在以最小副作用清除等离子体。基于与M40 HEDP相同的平台。设定在6秒后引爆。"
	icon_state = "grenade_pgas"
	worn_icon_state = "grenade_pgas"
	hud_state = "grenade_drain"
	det_time = 6 SECONDS
	icon_state_mini = "grenade_blue"
	dangerous = TRUE
	smoketype = /datum/effect_system/smoke_spread/plasmaloss
	smoke_duration = 11
	smokeradius = 7

/obj/item/explosive/grenade/smokebomb/antigas
	name = "\improper M40-AG 烟雾手雷"
	desc = "一种原本设计用于清除空气中污染物以进行清洁的气体手雷，现被重新用于清除敌对气体。"
	icon_state = "grenade_agas"
	worn_icon_state = "grenade_agas"
	hud_state = "grenade_antigas"
	det_time = 3 SECONDS
	icon_state_mini = "grenade_antigas"
	dangerous = TRUE
	smoketype = /datum/effect_system/smoke_spread/antigas
	smoke_duration = 11
	smokeradius = 7

/obj/item/explosive/grenade/smokebomb/drain/agls
	name = "\improper AGLS-T 烟雾手雷"
	desc = "一枚小巧的智能手雷，它即将在你面前爆炸，除非你发现它是惰性的。除此之外，这是一枚相当普通的手雷，只不过它不知为何处于可击发状态。"
	icon_state = "ags_pgas"
	det_time = 3 SECONDS
	smokeradius = 4

/obj/item/explosive/grenade/smokebomb/drain/pellet
	name = "缠足弹发射系统弹丸"
	desc = "一枚小型弹丸从天而降。在落点位置释放缠足效果。"
	icon_state = "pellet_pgas"
	det_time = 2 SECONDS
	smokeradius = 10
	smoke_duration = 15
