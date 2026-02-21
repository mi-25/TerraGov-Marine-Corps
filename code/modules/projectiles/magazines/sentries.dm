/obj/item/ammo_magazine/sentry
	name = "\improper M30 弹匣（10x28毫米无壳弹）"
	desc = "ST-571哨戒炮使用的50发10x28mm无壳弹弹鼓。当哨戒炮弹药耗尽时，只需将其装入弹药口即可。"
	w_class = WEIGHT_CLASS_NORMAL
	icon_state = "sentry"
	icon = 'icons/obj/items/ammo/sentry.dmi'
	magazine_flags = NONE //can't be refilled or emptied by hand
	caliber = CALIBER_10X28
	max_rounds = 500
	default_ammo = /datum/ammo/bullet/turret

/obj/item/ammo_magazine/minisentry
	name = "\improper M30 弹匣（10x20毫米无壳弹）"
	desc = "一盒100发10x20毫米无壳弹，用于ST-580点防御哨戒炮。当哨戒炮弹药耗尽时，只需将其装入哨戒炮的弹药口即可。"
	w_class = WEIGHT_CLASS_NORMAL
	icon_state = "ua580"
	icon = 'icons/obj/items/ammo/sentry.dmi'
	magazine_flags = NONE //can't be refilled or emptied by hand
	caliber = CALIBER_10X20
	max_rounds = 300
	default_ammo = /datum/ammo/bullet/turret/mini

/obj/item/ammo_magazine/sentry_premade/dumb
	name = "M30弹匣（10x28mm无壳弹）"
	desc = "一盒50发10x28毫米无壳弹，用于ST-571哨戒炮。当哨戒炮弹药耗尽时，只需将其填入弹药口即可。"
	w_class = WEIGHT_CLASS_NORMAL
	icon_state = "sentry"
	icon = 'icons/obj/items/ammo/sentry.dmi'
	magazine_flags = NONE //can't be refilled or emptied by hand
	caliber = CALIBER_10X28
	max_rounds = 500
	default_ammo = /datum/ammo/bullet/turret/dumb

/obj/item/ammo_magazine/sentry/fob_sentry
	max_rounds = INFINITY

// Sniper Sentry

/obj/item/ammo_magazine/sentry/sniper
	name = "\improper SST-574 弹匣（10x28mm 无壳弹）"
	desc = "一盒50发10x28毫米无壳弹，用于SST-574哨戒炮。当哨戒炮弹药耗尽时，只需将其装入哨戒炮的弹药口即可。"
	icon_state = "sniper_sentry"
	max_rounds = 75
	default_ammo = /datum/ammo/bullet/turret/sniper

// Shotgun Sentry

/obj/item/ammo_magazine/sentry/shotgun
	name = "\improper SHT-573 弹鼓（12G 无壳弹）"
	desc = "一盒200发专为SST-573哨戒炮设计的伸缩式12G弹药。当哨戒炮弹药耗尽时，只需将其装入哨戒炮的弹药口即可。"
	caliber = CALIBER_12G
	icon_state = "shotgun_sentry"
	max_rounds = 100
	default_ammo = /datum/ammo/bullet/turret/buckshot

// Flamer Sentry

/obj/item/ammo_magazine/sentry/flamer
	name = "\improper SFT-575燃料罐"
	desc = "SFT-575哨戒炮的燃料罐。当哨戒炮燃料耗尽时，只需将其装入哨戒炮的燃料口即可。"
	caliber = CALIBER_FUEL
	icon_state = "flamer_sentry"
	max_rounds = 500
	default_ammo = /datum/ammo/flamethrower/sentry

/obj/item/ammo_magazine/sentry/laser
	name = "\improper SLT-576 哨戒炮激光电池"
	desc = "SLT-576 哨戒炮的电池。当哨戒炮电量耗尽时，只需将其插入哨戒炮的电池插槽即可。"
	caliber = CALIBER_LASER
	icon_state = "laser_sentry"
	max_rounds = 500
	default_ammo = /datum/ammo/energy/lasersentry
