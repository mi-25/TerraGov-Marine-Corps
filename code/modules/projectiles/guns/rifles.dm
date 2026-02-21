//-------------------------------------------------------

/obj/item/weapon/gun/rifle
	icon = 'icons/obj/items/guns/rifles.dmi'
	reload_sound = 'sound/weapons/guns/interact/rifle_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/cocked.ogg'
	equip_slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	force = 15
	gun_features_flags = GUN_CAN_POINTBLANK||GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	load_method = MAGAZINE //codex
	aim_slowdown = 0.35
	wield_delay = 0.8 SECONDS
	gun_skill_category = SKILL_RIFLES

	burst_amount = 3
	burst_delay = 0.2 SECONDS
	accuracy_mult_unwielded = 0.6
	scatter = 0
	scatter_unwielded = 13
	recoil_unwielded = 4
	damage_falloff_mult = 0.5
	akimbo_scatter_mod = 8

//-------------------------------------------------------
//AR-18 Carbine

/obj/item/weapon/gun/rifle/standard_carbine
	name = "\improper AR-18 考瑟卡宾枪"
	desc = "凯克勒与霍赫 AR-18 卡宾枪是地球政府殖民地海军陆战队使用的标准步枪之一。它通常被那些在战斗中更偏好高机动性的人员使用，例如侦察兵和其他轻步兵。使用 10x24mm 无壳弹药。"
	icon_state = "t18"
	worn_icon_state = "t18"
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_ar18.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/t18_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/t18_reload.ogg'
	caliber = CALIBER_10X24_CASELESS //codex
	max_shells = 36 //codex
	force = 20
	default_ammo_type = /obj/item/ammo_magazine/rifle/standard_carbine
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/standard_carbine, /obj/item/ammo_magazine/rifle/standard_carbine/ap)
	attachable_allowed = list(
		/obj/item/attachable/stock/t18stock,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/burstfire_assembly,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/scope/mini,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/flamer/hydro_cannon,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	starting_attachment_types = list(/obj/item/attachable/stock/t18stock)
	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 16,"rail_x" = 5, "rail_y" = 19, "under_x" = 18, "under_y" = 14, "stock_x" = 0, "stock_y" = 13)
	aim_fire_delay = 0.1 SECONDS
	aim_speed_modifier = 2

	fire_delay = 0.2 SECONDS
	burst_delay = 0.1 SECONDS
	extra_delay = 0.1 SECONDS
	accuracy_mult = 1.05
	scatter = 0
	burst_amount = 4
	aim_slowdown = 0.30
	damage_falloff_mult = 0.9
	movement_acc_penalty_mult = 4

/obj/item/weapon/gun/rifle/standard_carbine/pointman
	starting_attachment_types = list(/obj/item/attachable/stock/t18stock, /obj/item/attachable/lasersight, /obj/item/attachable/flashlight)

/obj/item/weapon/gun/rifle/standard_carbine/standard
	starting_attachment_types = list(/obj/item/attachable/stock/t18stock, /obj/item/weapon/gun/grenade_launcher/underslung, /obj/item/attachable/reddot, /obj/item/attachable/extended_barrel)

/obj/item/weapon/gun/rifle/standard_carbine/scout
	starting_attachment_types = list(/obj/item/attachable/stock/t18stock, /obj/item/weapon/gun/grenade_launcher/underslung, /obj/item/attachable/motiondetector, /obj/item/attachable/extended_barrel)

/obj/item/weapon/gun/rifle/standard_carbine/engineer
	starting_attachment_types = list(/obj/item/attachable/stock/t18stock, /obj/item/attachable/magnetic_harness, /obj/item/attachable/verticalgrip, /obj/item/attachable/extended_barrel)

/obj/item/weapon/gun/rifle/standard_carbine/plasma_pistol
	starting_attachment_types = list(/obj/item/attachable/stock/t18stock, /obj/item/weapon/gun/pistol/plasma_pistol, /obj/item/attachable/motiondetector, /obj/item/attachable/compensator)

/obj/item/weapon/gun/rifle/standard_carbine/beginner
	starting_attachment_types = list(/obj/item/attachable/stock/t18stock, /obj/item/attachable/magnetic_harness, /obj/item/attachable/angledgrip, /obj/item/attachable/compensator)

/obj/item/weapon/gun/rifle/standard_carbine/suppressed
	starting_attachment_types = list(/obj/item/attachable/stock/t18stock, /obj/item/weapon/gun/grenade_launcher/underslung, /obj/item/attachable/reddot, /obj/item/attachable/suppressor)

/obj/item/weapon/gun/rifle/standard_carbine/npc
	starting_attachment_types = list(/obj/item/attachable/stock/t18stock, /obj/item/attachable/magnetic_harness, /obj/item/attachable/verticalgrip, /obj/item/attachable/bayonet)

//-------------------------------------------------------
//AR-12 Assault Rifle

/obj/item/weapon/gun/rifle/standard_assaultrifle
	name = "\improper AR-12 K&H 突击步枪"
	desc = "凯克勒与霍赫 AR-12 突击步枪曾是地球政府殖民地海军陆战队的制式步枪，后被 AR-18 卡宾枪取代。尽管如此，它仍被广泛使用。这款枪械本身在大多数情况下表现优异，但在近距离交战中有所不足，且据枪姿势相比其他一些步枪较为困难。它使用 10x24 毫米无壳弹。"
	icon_state = "t12"
	worn_icon_state = "t12"
	fire_sound = SFX_GUN_AR12
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/t18_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/t18_reload.ogg'
	caliber = CALIBER_10X24_CASELESS //codex
	max_shells = 50 //codex
	force = 20
	default_ammo_type = /obj/item/ammo_magazine/rifle/standard_assaultrifle
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/standard_assaultrifle, /obj/item/ammo_magazine/rifle/standard_assaultrifle/ap)
	attachable_allowed = list(
		/obj/item/attachable/stock/t12stock,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/burstfire_assembly,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/angledgrip,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/flamer/hydro_cannon,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	starting_attachment_types = list(/obj/item/attachable/stock/t12stock)
	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 17,"rail_x" = 0, "rail_y" = 23, "under_x" = 17, "under_y" = 13, "stock_x" = 0, "stock_y" = 13)
	aim_fire_delay = 0.1 SECONDS
	aim_speed_modifier = 2

	fire_delay = 0.2 SECONDS
	burst_delay = 0.15 SECONDS
	extra_delay = 0.05 SECONDS
	accuracy_mult = 1.1
	scatter = -2
	wield_delay = 0.9 SECONDS
	burst_amount = 3
	aim_slowdown = 0.4
	damage_falloff_mult = 0.5

	placed_overlay_iconstate = "t12"

/obj/item/weapon/gun/rifle/standard_assaultrifle/rifleman
	starting_attachment_types = list(/obj/item/attachable/stock/t12stock, /obj/item/attachable/reddot, /obj/item/attachable/extended_barrel, /obj/item/weapon/gun/grenade_launcher/underslung)

/obj/item/weapon/gun/rifle/standard_assaultrifle/engineer
	starting_attachment_types = list(/obj/item/attachable/stock/t12stock, /obj/item/attachable/magnetic_harness, /obj/item/attachable/extended_barrel, /obj/item/weapon/gun/flamer/mini_flamer)

/obj/item/weapon/gun/rifle/standard_assaultrifle/medic
	starting_attachment_types = list(/obj/item/attachable/stock/t12stock, /obj/item/attachable/magnetic_harness, /obj/item/attachable/extended_barrel, /obj/item/weapon/gun/grenade_launcher/underslung)

//-------------------------------------------------------
//DMR-37 DMR

/obj/item/weapon/gun/rifle/standard_dmr
	name = "\improper DMR-37 SCA 精确射手步枪"
	desc = "圣克里斯托武器公司DMR-37是地球政府殖民地海军陆战队的指定射手步枪。它以在超常射程上极为稳定的弹着点分布而闻名，但缺少连发或全自动模式。主要供偏好更谨慎射击方式的射手使用。使用10x27mm无壳弹口径。"
	icon = 'icons/obj/items/guns/marksman64.dmi'
	icon_state = "t37"
	worn_icon_state = "t37"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/marksman_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/marksman_right_64.dmi',
	)
	gun_crosshair = 'icons/UI_Icons/gun_crosshairs/sniper.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 32

	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_dmr37.ogg'
	fire_rattle = 'sound/weapons/guns/fire/tgmc/kinetic/gun_dmr37_low.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/m41a_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m41a_reload.ogg'
	caliber = CALIBER_10x27_CASELESS //codex
	aim_slowdown = 0.75
	wield_delay = 1 SECONDS
	force = 20
	max_shells = 20 //codex
	default_ammo_type = /obj/item/ammo_magazine/rifle/standard_dmr
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/standard_dmr)
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/gyro,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/scope/mini/dmr,
		/obj/item/attachable/motiondetector,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/buildasentry,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/flamer/hydro_cannon,
	)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_CAN_POINTBLANK|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	starting_attachment_types = list(/obj/item/attachable/scope/mini/dmr)
	attachable_offset = list("muzzle_x" = 50, "muzzle_y" = 20,"rail_x" = 21, "rail_y" = 22, "under_x" = 31, "under_y" = 15, "stock_x" = 14, "stock_y" = 10)
	actions_types = list(/datum/action/item_action/aim_mode)
	aim_fire_delay = 0.2 SECONDS
	aim_speed_modifier = 2

	fire_delay = 0.65 SECONDS
	accuracy_mult = 1.15
	scatter = -4
	burst_amount = 1
	movement_acc_penalty_mult = 6

/obj/item/weapon/gun/rifle/standard_dmr/marksman
	starting_attachment_types = list(/obj/item/attachable/scope, /obj/item/attachable/angledgrip, /obj/item/attachable/extended_barrel)

/obj/item/weapon/gun/rifle/standard_dmr/beginner
	starting_attachment_types = list(/obj/item/attachable/scope, /obj/item/attachable/verticalgrip, /obj/item/attachable/extended_barrel)

/obj/item/weapon/gun/rifle/standard_dmr/freelancer
	starting_attachment_types = list(/obj/item/attachable/reddot, /obj/item/attachable/verticalgrip, /obj/item/attachable/heavy_barrel)
//-------------------------------------------------------
//BR-64 BR

/obj/item/weapon/gun/rifle/standard_br
	name = "\improper BR-64 SCA 战斗步枪"
	desc = "圣克里斯托军械BR-64是地球政府殖民地海军陆战队的主战步枪。它以在大多数射程下表现稳定、中距离点射停止力强而闻名。主要使用者是偏好比常规弹药更大口径弹药的士兵。使用10x26.5毫米无壳弹。"
	icon_state = "t64"
	worn_icon_state = "t64"
	icon = 'icons/obj/items/guns/marksman64.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/marksman_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/marksman_right_64.dmi',
	)
	gun_crosshair = 'icons/UI_Icons/gun_crosshairs/sniper.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 32


	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_br64.ogg'
	fire_rattle = 'sound/weapons/guns/fire/tgmc/kinetic/gun_br64_low.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/m41a_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m41a_reload.ogg'
	caliber = CALIBER_10x265_CASELESS //codex
	aim_slowdown = 0.55
	wield_delay = 0.9 SECONDS
	force = 20
	max_shells = 36 //codex
	default_ammo_type = /obj/item/ammo_magazine/rifle/standard_br
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/standard_br)
	attachable_allowed = list(
		/obj/item/attachable/stock/t64stock,
		/obj/item/weapon/gun/grenade_launcher/underslung/battle_rifle,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/gyro,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/motiondetector,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/buildasentry,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/flamer/hydro_cannon,
	)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_CAN_POINTBLANK|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	starting_attachment_types = list(/obj/item/attachable/stock/t64stock, /obj/item/weapon/gun/grenade_launcher/underslung/battle_rifle, /obj/item/attachable/scope/mini)
	attachable_offset = list("muzzle_x" = 44, "muzzle_y" = 19,"rail_x" = 18, "rail_y" = 23, "under_x" = 33, "under_y" = 13, "stock_x" = 11, "stock_y" = 14)
	aim_fire_delay = 0.2 SECONDS
	aim_speed_modifier = 3

	fire_delay = 0.3 SECONDS
	burst_amount = 3
	burst_delay = 0.10 SECONDS
	extra_delay = 0.25 SECONDS
	accuracy_mult = 0.9
	scatter = 0

/obj/item/weapon/gun/rifle/standard_br/standard
	starting_attachment_types = list(/obj/item/attachable/stock/t64stock, /obj/item/weapon/gun/grenade_launcher/underslung/battle_rifle, /obj/item/attachable/reddot, /obj/item/attachable/extended_barrel)

//-------------------------------------------------------
//PR-412 Pulse Rifle

/obj/item/weapon/gun/rifle/m412
	name = "\improper PR-412脉冲步枪"
	desc = "PR-412步枪是一款脉冲工业公司生产的步枪，因其采用电子击发以获得更高初速而被宣传为脉冲步枪。在大多数星系中相当常见。使用10x24mm无壳弹药。"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	icon_state = "m412"
	worn_icon_state = "m412"

	fire_sound = 'sound/weapons/guns/fire/M412.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/m41a_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m41a_reload.ogg'
	caliber = CALIBER_10X24_CASELESS //codex
	max_shells = 40 //codex
	default_ammo_type = /obj/item/ammo_magazine/rifle
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/rifle,
		/obj/item/ammo_magazine/rifle/extended,
		/obj/item/ammo_magazine/rifle/incendiary,
		/obj/item/ammo_magazine/rifle/ap,
	)
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/burstfire_assembly,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/mini,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/buildasentry,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/flamer/hydro_cannon,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	starting_attachment_types = list(/obj/item/weapon/gun/grenade_launcher/underslung)
	attachable_offset = list("muzzle_x" = 44, "muzzle_y" = 19,"rail_x" = 15, "rail_y" = 21, "under_x" = 25, "under_y" = 16, "stock_x" = 18, "stock_y" = 15)

	fire_delay = 0.2 SECONDS
	burst_delay = 0.15 SECONDS
	accuracy_mult = 1.1
	scatter = -1
	wield_delay = 0.9 SECONDS
	burst_amount = 3
	aim_slowdown = 0.4
	damage_mult = 1.05 //Has smaller magazines

/obj/item/weapon/gun/rifle/m412/freelancer
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/weapon/gun/grenade_launcher/underslung, /obj/item/attachable/extended_barrel)

//-------------------------------------------------------
//PR-412 PMC VARIANT

/obj/item/weapon/gun/rifle/m412/elite
	name = "\improper PR-412E 战斗步枪"
	desc = "PR-412脉冲步枪系列的'精英'改装型，配发给特种作战单位。它配备了枪托和更长的枪管，集成了枪管充电器，枪身上不知为何印有一个红色骷髅图案。"
	icon_state = "m412e"
	worn_icon_state = "m412e"
	default_ammo_type = /obj/item/ammo_magazine/rifle/ap
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/burstfire_assembly,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/mini,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/buildasentry,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/flamer/hydro_cannon,
	)

	attachable_offset = list("muzzle_x" = 44, "muzzle_y" = 19,"rail_x" = 15, "rail_y" = 21, "under_x" = 25, "under_y" = 16, "stock_x" = 18, "stock_y" = 15)
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/weapon/gun/grenade_launcher/underslung)
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)


	burst_amount = 1
	burst_delay = 0.15 SECONDS
	accuracy_mult = 1.15
	damage_mult = 1.5
	scatter = -2
	force = 20

//-------------------------------------------------------
//PR-11

/obj/item/weapon/gun/rifle/m41a
	name = "\improper PR-11脉冲步枪"
	desc = "一把奇怪的电子击发失败步枪，在其时代是相当不为人知的武器。不过它推动了现代电子击发技术的普及。使用10x24mm无壳弹药。带有不可拆卸的榴弹发射器。"
	icon = 'icons/obj/items/guns/machineguns64.dmi'
	icon_state = "m41a"
	worn_icon_state = "m41a"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/machineguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/machineguns_right_1.dmi',
	)
	fire_sound = SFX_GUN_PULSE
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/m41a_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m41a_reload.ogg'
	aim_slowdown = 0.5
	wield_delay = 1.55 SECONDS
	max_shells = 95 //codex
	default_ammo_type = /obj/item/ammo_magazine/rifle/m41a
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/m41a)
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/scope,
		/obj/item/attachable/buildasentry,
		/obj/item/attachable/stock/m41a,
		/obj/item/weapon/gun/grenade_launcher/underslung/invisible,
		/obj/item/attachable/stock/m41a_custom,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	starting_attachment_types = list(/obj/item/attachable/stock/m41a, /obj/item/weapon/gun/grenade_launcher/underslung/invisible)
	attachable_offset = list("muzzle_x" = 41, "muzzle_y" = 19,"rail_x" = 12, "rail_y" = 24, "under_x" = 24, "under_y" = 13, "stock_x" = 22, "stock_y" = 16)

	burst_amount = 4
	burst_delay = 0.15 SECONDS
	scatter = 0
	fire_delay = 0.2 SECONDS

/obj/item/weapon/gun/rifle/m41a/field_commander
	starting_attachment_types = list(
		/obj/item/attachable/stock/m41a,
		/obj/item/weapon/gun/grenade_launcher/underslung/invisible,
		/obj/item/attachable/reddot,
		/obj/item/attachable/extended_barrel,
	)

/obj/item/weapon/gun/rifle/m41a/magharness
	starting_attachment_types = list(
		/obj/item/attachable/stock/m41a,
		/obj/item/attachable/magnetic_harness,
		/obj/item/weapon/gun/grenade_launcher/underslung/invisible,
	)

/obj/item/weapon/gun/rifle/m41a/freelancer_custom
	name = "\improper PR-11脉冲步枪马格南定制型"
	desc = "一把奇怪的电子击发失败步枪，是那个时代相当不为人知的武器。不过它确实在现代推动了电子击发的普及。使用10x24mm无壳弹药。带有不可拆卸的榴弹发射器。这款特定型号由MAGNUM自由佣兵使用轻质材料进行了定制和调校。还新增了连续5发快速射击的连发模式。"
	icon_state = "m41a_custom"
	worn_icon_state = "m41a_custom"
	starting_attachment_types = list(/obj/item/attachable/stock/m41a_custom, /obj/item/weapon/gun/grenade_launcher/underslung/invisible)
	aim_slowdown = 0.4
	wield_delay = 1.2 SECONDS

	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	burst_amount = 5
	burst_delay = 0.1 SECONDS
	fire_delay = 0.15 SECONDS
	extra_delay = 0.2 SECONDS

/obj/item/weapon/gun/rifle/m41a/freelancer_custom/leader
	starting_attachment_types = list(
		/obj/item/attachable/stock/m41a_custom,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
		/obj/item/weapon/gun/grenade_launcher/underslung/invisible,
	)
//-------------------------------------------------------

/obj/item/weapon/gun/rifle/mpi_km
	name = "\improper MPi-KM 突击步枪"
	desc = "一款廉价而坚固的步枪，有时更被称为'AK'。使用7.62x39毫米弹药。尽管除了下挂之外缺乏其他枪械配件安装点，但凭借其低廉的成本和高于常规口径的弹药，它仍然是黑市上的热门产品。"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	icon_state = "ak47"
	worn_icon_state = "ak47"
	caliber = CALIBER_762X39 //codex

	max_shells = 40 //codex
	fire_sound = 'sound/weapons/guns/fire/ak47.ogg'
	unload_sound = 'sound/weapons/guns/interact/ak47_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/ak47_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/ak47_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/mpi_km/plum
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/rifle/mpi_km,
		/obj/item/ammo_magazine/rifle/mpi_km/plum,
		/obj/item/ammo_magazine/rifle/mpi_km/black,
		/obj/item/ammo_magazine/rifle/mpi_km/carbine,
		/obj/item/ammo_magazine/rifle/mpi_km/carbine/plum,
		/obj/item/ammo_magazine/rifle/mpi_km/carbine/black,
		/obj/item/ammo_magazine/rifle/mpi_km/extended,
	)
	aim_slowdown = 0.5
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/buildasentry,
		/obj/item/attachable/stock/mpi_km,
		/obj/item/attachable/verticalgrip,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/grenade_launcher/underslung/mpi, //alt sprite, unremovable
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 35, "muzzle_y" = 18,"rail_x" = 6, "rail_y" = 20, "under_x" = 19, "under_y" = 14, "stock_x" = 5, "stock_y" = 12)
	starting_attachment_types = list(/obj/item/attachable/stock/mpi_km)
	force = 20

	burst_amount = 1
	fire_delay = 0.25 SECONDS
	scatter = 0
	wield_delay = 0.9 SECONDS

	placed_overlay_iconstate = "ak47"

/obj/item/weapon/gun/rifle/mpi_km/standard
	starting_attachment_types = list(
		/obj/item/attachable/stock/mpi_km,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/bayonet/converted,
	)

/obj/item/weapon/gun/rifle/mpi_km/grenadier
	desc = "一把廉价而耐用的步枪，有时更被称为'AK'。使用7.62x39毫米弹药。这把枪带有一个内置的下挂榴弹发射器，看起来非常老旧，但保养得很好。"
	starting_attachment_types = list(
		/obj/item/attachable/stock/mpi_km,
		/obj/item/weapon/gun/grenade_launcher/underslung/mpi,
		/obj/item/attachable/magnetic_harness,
	)

/obj/item/weapon/gun/rifle/mpi_km/black
	name = "\improper MPi-KM 突击步枪"
	desc = "一款由火星之子制造的廉价而坚固的步枪，以其可靠性和制止力而闻名。有时更广为人知的名字是'AK'，它使用7.62x39毫米弹药。"
	icon_state = "ak47_black"
	worn_icon_state = "ak47_black"
	default_ammo_type = /obj/item/ammo_magazine/rifle/mpi_km/black
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/buildasentry,
		/obj/item/attachable/stock/mpi_km/black,
		/obj/item/attachable/verticalgrip,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/grenade_launcher/underslung/mpi, //alt sprite, unremovable
		/obj/item/attachable/reddot,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight/under,
	)
	starting_attachment_types = list(/obj/item/attachable/stock/mpi_km/black)

/obj/item/weapon/gun/rifle/mpi_km/black/magharness
	starting_attachment_types = list(
		/obj/item/attachable/stock/mpi_km/black,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/lasersight,
	)

/obj/item/weapon/gun/rifle/mpi_km/black/grenadier
	desc = "火星之子制造的一款廉价而坚固的步枪，以其可靠性和制止力而闻名。有时更广为人知的是'AK'这个称呼，它使用7.62x39毫米弹药。这把枪配备了一个内置的下挂手雷发射器。"
	starting_attachment_types = list(
		/obj/item/attachable/stock/mpi_km/black,
		/obj/item/weapon/gun/grenade_launcher/underslung/mpi,
		/obj/item/attachable/reddot,
	)

// RPD

/obj/item/weapon/gun/rifle/lmg_d
	name = "\improper LMG-D轻机枪"
	desc = "一款廉价耐用的机枪，有时更广为人知的名字是'RPD'。使用7.62x39毫米弹药。尽管除了下挂之外没有其他枪械配件安装点，但凭借其低廉的成本、高弹容量和高于常规口径的弹药，它仍然是黑市上的热门产品。"
	icon = 'icons/obj/items/guns/machineguns64.dmi'
	icon_state = "rpd"
	worn_icon_state = "rpd"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/machineguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/machineguns_right_1.dmi',
	)
	fire_animation = "rpd_fire"
	caliber = CALIBER_762X39 //codex

	max_shells = 100  //codex
	wield_delay = 1.4 SECONDS
	aim_slowdown = 0.95
	fire_sound = 'sound/weapons/guns/fire/ak47.ogg'
	unload_sound = 'sound/weapons/guns/interact/ak47_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/ak47_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/ak47_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/lmg_d
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/lmg_d)

	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/buildasentry,
		/obj/item/attachable/stock/lmg_d,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/foldable/bipod,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/grenade_launcher/underslung/mpi,
		/obj/item/attachable/reddot,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight/under,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)

	attachable_offset = list("muzzle_x" = 35, "muzzle_y" = 18,"rail_x" = 6, "rail_y" = 20, "under_x" = 19, "under_y" = 14, "stock_x" = 6, "stock_y" = 14)
	starting_attachment_types = list(/obj/item/attachable/stock/lmg_d)

	fire_delay = 0.25 SECONDS
	scatter = 2
	burst_amount = 1
	movement_acc_penalty_mult = 6

/obj/item/weapon/gun/rifle/lmg_d/magharness
	starting_attachment_types = list(
		/obj/item/attachable/stock/lmg_d,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/foldable/bipod,
	)

//-------------------------------------------------------
//DP-27

/obj/item/weapon/gun/rifle/dpm
	name = "\improper 杰格佳廖夫'RP'机枪"
	desc = "一种在星域边缘常见的廉价且耐用的机枪。发射大口径弹药以弥补其缓慢的射速，因其外形相似，通常被称为'留声机'。发射7.62x39毫米穿甲弹。"
	icon = 'icons/obj/items/guns/machineguns64.dmi'
	icon_state = "dp27"
	worn_icon_state = "dp27"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/machineguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/machineguns_right_1.dmi',
	)
	max_shells = 47 //codex
	caliber = CALIBER_762X39 //codex
	fire_sound = SFX_SVD_FIRE
	dry_fire_sound = 'sound/weapons/guns/fire/dpm.ogg'
	unload_sound = 'sound/weapons/guns/interact/dpm_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/dpm_reload.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/dpm
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/dpm)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/stock/dpm,
	)

	gun_features_flags = GUN_WIELDED_FIRING_ONLY|GUN_AMMO_COUNTER
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 17,"rail_x" = 22, "rail_y" = 17, "under_x" = 32, "under_y" = 14, "stock_x" = 13, "stock_y" = 9)
	starting_attachment_types = list(/obj/item/attachable/stock/dpm)
	aim_fire_delay = 0.25 SECONDS
	aim_speed_modifier = 0.75

	fire_delay = 0.45 SECONDS
	damage_mult = 2
	burst_amount = 1
	accuracy_mult = 1
	scatter = 2
	recoil = -1
	wield_delay = 1.1 SECONDS
	aim_slowdown = 0.85
	movement_acc_penalty_mult = 4

//-------------------------------------------------------
//M16 RIFLE

/obj/item/weapon/gun/rifle/m16
	name = "\improper FN M16A4 突击步枪"
	desc = "一款轻便、多用途的突击步枪，配备30发弹匣，发射5.56x45mm NATO弹药。作为M16平台的第四代产品，这款FN变体增加了全自动射击模式，并因其高度可定制性而在佣兵和民兵组织中保持生命力。它极其擅长快速点射，但必须掌握好射击节奏。"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	icon_state = "m16a4"
	worn_icon_state = "m16a4"

	caliber = CALIBER_556X45 //codex
	max_shells = 30 //codex
	fire_sound = 'sound/weapons/guns/fire/m16.ogg'
	unload_sound = 'sound/weapons/guns/interact/m16_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m16_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/m16_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/m16
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/m16)
	aim_slowdown = 0.4
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/m16sight,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/mini,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/buildasentry,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE)
	attachable_offset = list("muzzle_x" = 47, "muzzle_y" = 19,"rail_x" = 18, "rail_y" = 24, "under_x" = 29, "under_y" = 15, "stock_x" = 19, "stock_y" = 13)
	aim_fire_delay = 0.2 SECONDS
	aim_speed_modifier = 2.5

	fire_delay = 0.2 SECONDS
	scatter = 2
	extra_delay = -0.05 SECONDS
	burst_delay = 0.15 SECONDS
	accuracy_mult = 1.1
	wield_delay = 0.7 SECONDS
	damage_mult = 1.2

/obj/item/weapon/gun/rifle/m16/ugl
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/bayonet/converted, /obj/item/weapon/gun/grenade_launcher/underslung)

/obj/item/weapon/gun/rifle/m16/spec_op
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/suppressor, /obj/item/weapon/gun/shotgun/combat/masterkey)

//-------------------------------------------------------
//FAMAS rifle, based on the F1

/obj/item/weapon/gun/rifle/famas
	name = "\improper FAMAS突击步枪"
	desc = "一种轻便、多用途的速射突击步枪，配备24发弹匣和短程瞄准镜，可在短时间内发射5.56x45mm北约弹药。"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	icon_state = "famas"
	worn_icon_state = "famas"

	caliber = CALIBER_556X45 //codex
	max_shells = 24 //codex
	fire_sound = 'sound/weapons/guns/fire/famas.ogg'
	unload_sound = 'sound/weapons/guns/interact/m16_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m16_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/m16_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/famas
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/famas)
	aim_slowdown = 0.4
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/burstfire_assembly,
		/obj/item/attachable/magnetic_harness,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	attachable_offset = list("muzzle_x" = 38, "muzzle_y" = 17,"rail_x" = 22, "rail_y" = 24, "under_x" = 28, "under_y" = 12, "stock_x" = 19, "stock_y" = 13)

	fire_delay = 0.15 SECONDS
	burst_delay = 0.15 SECONDS
	accuracy_mult = 1.15
	wield_delay = 0.7 SECONDS
	damage_mult = 1.2
	scatter = 1
	movement_acc_penalty_mult = 4

//-------------------------------------------------------
//MG-42 Light Machine Gun

/obj/item/weapon/gun/rifle/standard_lmg
	name = "\improper MG-42 考瑟轻机枪"
	desc = "Kauser MG-42是TGMC目前标准的非敌我识别轻机枪。它以能够出色地提供重型火力压制而闻名。通常用于固守阵地或提供火力支援。它使用10x24毫米弹药。"

	icon_state = "t42"
	worn_icon_state = "t42"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/machineguns_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/machineguns_right_64.dmi',
	)
	inhand_x_dimension = 64
	inhand_y_dimension = 32

	caliber = CALIBER_10X24_CASELESS //codex
	max_shells = 120 //codex
	force = 30
	aim_slowdown = 0.8
	wield_delay = 1.2 SECONDS
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_mg42.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/T42_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/T42_reload.ogg'
	default_ammo_type = /obj/item/ammo_magazine/standard_lmg
	allowed_ammo_types = list(/obj/item/ammo_magazine/standard_lmg)
	attachable_allowed = list(
		/obj/item/attachable/stock/t42stock,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/burstfire_assembly,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
	)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_AUTOBURST)
	gun_skill_category = SKILL_HEAVY_WEAPONS
	starting_attachment_types = list(/obj/item/attachable/stock/t42stock)
	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 17,"rail_x" = 4, "rail_y" = 20, "under_x" = 16, "under_y" = 14, "stock_x" = 0, "stock_y" = 13)
	aim_fire_delay = 0.1 SECONDS
	aim_speed_modifier = 2

	fire_delay = 0.2 SECONDS
	burst_delay = 0.15 SECONDS
	extra_delay = 0.05 SECONDS
	accuracy_mult = 1.1
	accuracy_mult_unwielded = 0.5
	scatter = 2
	scatter_unwielded = 80
	movement_acc_penalty_mult = 6

/obj/item/weapon/gun/rifle/standard_lmg/autorifleman
	starting_attachment_types = list(/obj/item/attachable/verticalgrip, /obj/item/attachable/reddot)

/obj/item/weapon/gun/rifle/standard_lmg/beginner
	starting_attachment_types = list(/obj/item/attachable/extended_barrel, /obj/item/attachable/reddot, /obj/item/attachable/verticalgrip)

//-------------------------------------------------------
//MG-60 General Purpose Machine Gun

/obj/item/weapon/gun/rifle/standard_gpmg
	name = "\improper MG-60 劳姆金属通用机枪"
	desc = "Raummetall MG-60通用机枪是TGMC现役的标准通用机枪。虽然通常安装在载具上，但有时也会被步兵用于扼守要道、压制敌人，或在极少数情况下用于行进间射击。它使用10x26mm弹药箱。"
	icon = 'icons/obj/items/guns/machineguns64.dmi'
	icon_state = "t60"
	worn_icon_state = "t60"
	fire_animation = "t60_fire"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/machineguns_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/machineguns_right_64.dmi',
	)
	inhand_x_dimension = 64
	inhand_y_dimension = 32

	caliber = CALIBER_10x26_CASELESS //codex
	max_shells = 200 //codex
	force = 35
	aim_slowdown = 1.2
	wield_delay = 1.7 SECONDS
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_mg60.ogg'
	fire_rattle = 'sound/weapons/guns/fire/tgmc/kinetic/gun_mg60_low.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/T42_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/T42_reload.ogg'
	default_ammo_type = /obj/item/ammo_magazine/standard_gpmg
	allowed_ammo_types = list(/obj/item/ammo_magazine/standard_gpmg)
	attachable_allowed = list(
		/obj/item/attachable/flashlight,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/stock/t60stock,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
	)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	starting_attachment_types = list(/obj/item/attachable/stock/t60stock)
	gun_skill_category = SKILL_HEAVY_WEAPONS
	attachable_offset = list("muzzle_x" = 42, "muzzle_y" = 21,"rail_x" = 6, "rail_y" = 23, "under_x" = 26, "under_y" = 15, "stock_x" = 8, "stock_y" = 13)
	aim_fire_delay = 0.15 SECONDS
	aim_speed_modifier = 5.3

	fire_delay = 0.15 SECONDS
	damage_falloff_mult = 0.5
	burst_amount = 1
	accuracy_mult = 0.85
	accuracy_mult_unwielded = 0.4
	scatter = 7
	scatter_unwielded = 45
	movement_acc_penalty_mult = 7.25

	placed_overlay_iconstate = "lmg"

/obj/item/weapon/gun/rifle/standard_gpmg/machinegunner
	starting_attachment_types = list(/obj/item/attachable/stock/t60stock, /obj/item/attachable/foldable/bipod, /obj/item/attachable/magnetic_harness, /obj/item/attachable/extended_barrel)

/obj/item/weapon/gun/rifle/standard_gpmg/beginner
	starting_attachment_types = list(/obj/item/attachable/stock/t60stock, /obj/item/attachable/foldable/bipod, /obj/item/attachable/magnetic_harness, /obj/item/attachable/heavy_barrel)

//-------------------------------------------------------
//M41AE2 Heavy Pulse Rifle

/obj/item/weapon/gun/rifle/m412l1_hpr
	name = "\improper PR-412L1重型脉冲步枪"
	desc = "一种基于PR-412脉冲步枪平台的大型武器，能够提供压制火力。点射模式效果显著。使用10x24mm无壳弹药。"
	icon = 'icons/obj/items/guns/machineguns64.dmi'
	icon_state = "m412l1"
	worn_icon_state = "m412l1"
	fire_animation = "m412l1_fire"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/machineguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/machineguns_right_1.dmi',
	)
	caliber = CALIBER_10X24_CASELESS //codex
	max_shells = 200 //codex
	aim_slowdown = 1.1
	wield_delay = 2 SECONDS
	fire_sound = 'sound/weapons/guns/fire/hmg.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/m41a_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m41a_reload.ogg'
	default_ammo_type = /obj/item/ammo_magazine/m412l1_hpr
	allowed_ammo_types = list(/obj/item/ammo_magazine/m412l1_hpr)
	attachable_allowed = list(
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/scope/mini,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/buildasentry,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	gun_skill_category = SKILL_HEAVY_WEAPONS
	attachable_offset = list("muzzle_x" = 42, "muzzle_y" = 19,"rail_x" = 17, "rail_y" = 21, "under_x" = 31, "under_y" = 15, "stock_x" = 18, "stock_y" = 15)
	aim_fire_delay = 0.15 SECONDS
	aim_speed_modifier = 2

	fire_delay = 0.3 SECONDS
	burst_amount = 5
	burst_delay = 0.1 SECONDS
	accuracy_mult_unwielded = 0.5
	accuracy_mult = 1.05
	scatter = 5
	scatter_unwielded = 25
	recoil_unwielded = 4
	force = 30
	damage_mult = 1.05

	placed_overlay_iconstate = "lmg"

/obj/item/weapon/gun/rifle/m412l1_hpr/freelancer
	starting_attachment_types = list(
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/verticalgrip,
	)
//-------------------------------------------------------
//USL TYPE 71 RIFLE

/obj/item/weapon/gun/rifle/type71
	name = "\improper 71式脉冲步枪"
	desc = "联合太空鳞翅目海盗的主要步枪，71式是一款可靠的7.62x39毫米口径步枪，以三连发点射模式开火以节省弹药。一款用于压制任务、符合超视距作战理论的新型号正在开发中，目前仅配发给联合太空鳞翅目的少数列兵。"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	icon_state = "type71"
	worn_icon_state = "type71"

	caliber = CALIBER_762X39 //codex
	max_shells = 42 //codex
	fire_sound = 'sound/weapons/guns/fire/type71.ogg'
	unload_sound = 'sound/weapons/guns/interact/type71_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/type71_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/type71_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/type71
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/type71)
	aim_slowdown = 0.6
	wield_delay = 0.9 SECONDS
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/burstfire_assembly,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/angledgrip,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/flamer/mini_flamer/unremovable,
		/obj/item/attachable/suppressor/unremovable/invisible,
		/obj/item/attachable/scope/unremovable,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	attachable_offset = list("muzzle_x" = 41, "muzzle_y" = 19,"rail_x" = 18, "rail_y" = 24, "under_x" = 34, "under_y" = 16, "stock_x" = 19, "stock_y" = 13)
	gun_firemode_list = list(GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	aim_fire_delay = 0.15 SECONDS
	aim_speed_modifier = 2

	fire_delay = 0.25 SECONDS
	burst_amount = 3
	accuracy_mult = 1.1
	accuracy_mult_unwielded = 0.8
	scatter = -1


/obj/item/weapon/gun/rifle/type71/flamer
	name = "\improper 71式脉冲步枪"
	desc = "这似乎是标准71式步枪的一种较少见的变体，配备了枪管下挂式喷火器和改进型机械瞄具。"
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 18,"rail_x" = 12, "rail_y" = 23, "under_x" = 20, "under_y" = 13, "stock_x" = 24, "stock_y" = 13)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope/marine,
		/obj/item/weapon/gun/flamer/mini_flamer/unremovable,
	)
	starting_attachment_types = list(/obj/item/weapon/gun/flamer/mini_flamer/unremovable)

/obj/item/weapon/gun/rifle/type71/flamer/standard
	starting_attachment_types = list(
		/obj/item/weapon/gun/flamer/mini_flamer/unremovable,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/magnetic_harness,
	)

/obj/item/weapon/gun/rifle/type71/commando
	name = "\improper 73型'突击队'脉冲卡宾枪"
	desc = "标准71式步枪的一种罕见变体，该版本配备了集成消音器、瞄准镜和大量精细调校。许多部件经过更换、打磨和改进。因此，该变体很少在精英部队之外出现。"
	icon_state = "type71"
	worn_icon_state = "type71"
	wield_delay = 0.2 SECONDS
	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 19,"rail_x" = 10, "rail_y" = 22, "under_x" = 21, "under_y" = 18, "stock_x" = 21, "stock_y" = 18)
	starting_attachment_types = list(/obj/item/attachable/suppressor/unremovable/invisible, /obj/item/attachable/scope/unremovable)

	fire_delay = 0.3 SECONDS
	burst_amount = 2
	accuracy_mult = 1.25
	accuracy_mult_unwielded = 0.8
	damage_mult = 1.3

/obj/item/weapon/gun/rifle/type71/seasonal
	desc = "许多太空海盗和民兵的主要步枪，71式是一款可靠的步枪，使用7.62x39毫米弹药，以三连发模式射击以节省弹药。"

//-------------------------------------------------------
//SH-15 AUTOMATIC SHOTGUN

/obj/item/weapon/gun/rifle/standard_autoshotgun
	name = "\improper 绍尔 SH-15 自动霰弹枪"
	desc = "Zauer SH-15自动突击霰弹枪，这是泰伦军械库的变体型号。ZX系列枪械的又一次迭代，不过它已被纳入地球政府殖民地海军陆战队的制式装备，因此获得了SH的命名。它取代了各种霰弹枪型号，成为配发给地球政府殖民地海军陆战队的半自动霰弹枪。它采用线膛设计，主要装填射程更远的弹药，不兼容鹿弹。使用12发16号径弹匣。"
	icon_state = "tx15"
	worn_icon_state = "tx15"
	icon = 'icons/obj/items/guns/shotguns.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/shotguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/shotguns_right_1.dmi',
	)
	gun_crosshair = 'icons/UI_Icons/gun_crosshairs/shotgun.dmi'
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_sh15.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/shotgun_empty.ogg'
	caliber = CALIBER_16G //codex
	max_shells = 12 //codex
	force = 20
	default_ammo_type = /obj/item/ammo_magazine/rifle/tx15_slug
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/rifle/tx15_slug,
		/obj/item/ammo_magazine/rifle/tx15_flechette,
	)
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/stock/tx15,
		/obj/item/attachable/compensator,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/motiondetector,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES //Its a shotgun type weapon effectively, most shotgun type weapons shouldn't be able to point blank 1 handed.
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	starting_attachment_types = list(/obj/item/attachable/stock/tx15)
	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 16,"rail_x" = 12, "rail_y" = 17, "under_x" = 20, "under_y" = 13, "stock_x" = 26, "stock_y" = 13)
	gun_skill_category = SKILL_SHOTGUNS

	fire_delay = 1 SECONDS
	accuracy_mult = 1.15
	burst_amount = 1
	scatter = -2
	movement_acc_penalty_mult = 3

/obj/item/weapon/gun/rifle/standard_autoshotgun/engineer
	starting_attachment_types = list(/obj/item/attachable/stock/tx15, /obj/item/attachable/magnetic_harness, /obj/item/weapon/gun/grenade_launcher/underslung)

/obj/item/weapon/gun/rifle/standard_autoshotgun/standard
	starting_attachment_types = list(/obj/item/attachable/stock/tx15, /obj/item/attachable/magnetic_harness, /obj/item/attachable/heavy_barrel, /obj/item/weapon/gun/grenade_launcher/underslung)

/obj/item/weapon/gun/rifle/standard_autoshotgun/plasma_pistol
	starting_attachment_types = list(/obj/item/attachable/stock/tx15, /obj/item/attachable/motiondetector, /obj/item/attachable/extended_barrel, /obj/item/weapon/gun/pistol/plasma_pistol)

//-------------------------------------------------------
//SG-29 Smart Machine Gun (It's more of a rifle than the SG.)

/obj/item/weapon/gun/rifle/standard_smartmachinegun
	name = "\improper SG-29 太空金属-KT 智能机枪"
	desc = "Raummetall-KT SG-29是TGMC目前标准的具备敌我识别能力的中型机枪。它以能够提供出色的重型火力支援而闻名。通常用于需要坚守阵地或提供火力支援的场合。需要特殊训练，且无法关闭敌我识别功能。它使用10x26mm弹药。"
	icon_state = "sg29"
	worn_icon_state = "sg29"
	icon = 'icons/obj/items/guns/machineguns.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/machineguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/machineguns_right_1.dmi',
	)
	caliber = CALIBER_10x26_CASELESS //codex
	max_shells = 300 //codex
	force = 30
	aim_slowdown = 0.95
	wield_delay = 1.5 SECONDS
	fire_sound = SFX_GUN_SMARTGUN
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/T42_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/T42_reload.ogg'
	default_ammo_type = /obj/item/ammo_magazine/standard_smartmachinegun
	allowed_ammo_types = list(/obj/item/ammo_magazine/standard_smartmachinegun)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
		/obj/item/attachable/stock/sgstock,
		/obj/item/attachable/sgbarrel,
	)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_IFF|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	starting_attachment_types = list(/obj/item/attachable/stock/sgstock, /obj/item/attachable/sgbarrel)
	gun_skill_category = SKILL_SMARTGUN //Uses SG skill for the penalties.
	attachable_offset = list("muzzle_x" = 42, "muzzle_y" = 17,"rail_x" = 15, "rail_y" = 21, "under_x" = 24, "under_y" = 14, "stock_x" = 12, "stock_y" = 13)
	fire_delay = 0.2 SECONDS
	burst_amount = 0
	accuracy_mult_unwielded = 0.5
	accuracy_mult = 1.1
	scatter = -5
	scatter_unwielded = 40
	movement_acc_penalty_mult = 4

	placed_overlay_iconstate = "smartgun"

/obj/item/weapon/gun/rifle/standard_smartmachinegun/pmc
	starting_attachment_types = list(/obj/item/attachable/stock/sgstock, /obj/item/attachable/sgbarrel, /obj/item/attachable/motiondetector, /obj/item/attachable/lasersight)

/obj/item/weapon/gun/rifle/standard_smartmachinegun/deathsquad
	starting_attachment_types = list(/obj/item/attachable/stock/sgstock, /obj/item/attachable/sgbarrel, /obj/item/attachable/magnetic_harness, /obj/item/attachable/lasersight)

/obj/item/weapon/gun/rifle/standard_smartmachinegun/patrol
	starting_attachment_types = list(/obj/item/attachable/stock/sgstock, /obj/item/attachable/sgbarrel, /obj/item/attachable/motiondetector, /obj/item/attachable/lasersight)

/obj/item/weapon/gun/rifle/standard_smartmachinegun/basic
	starting_attachment_types = list(/obj/item/attachable/stock/sgstock, /obj/item/attachable/sgbarrel, /obj/item/attachable/magnetic_harness, /obj/item/attachable/flashlight/under)

//-------------------------------------------------------
//SG Target Rifle, has underbarreled spotting rifle that applies effects.

/obj/item/weapon/gun/rifle/standard_smarttargetrifle
	name = "\improper SG-62 考瑟-KT 智能目标步枪"
	desc = "Kauser-KT SG-62 是一款由地球政府殖民地海军陆战队使用的具备敌我识别能力的步枪，配有一支同样具备敌我识别能力的测距步枪，能够发射配备各种专用弹药的弹道子弹。这是一把能为多种情况提供多种解决方案的枪……前提是你装填了正确的弹药。需要特殊训练，且无法关闭敌我识别功能。它使用高速 10x27mm 弹药供步枪使用，12x66mm 弹药供下挂步枪使用。"
	icon = 'icons/obj/items/guns/marksman64.dmi'
	icon_state = "sg62"
	worn_icon_state = "sg62"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/marksman_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/marksman_right_1.dmi',
	)
	caliber = CALIBER_10x27_CASELESS //codex
	max_shells = 40 //codex
	aim_slowdown = 0.85
	wield_delay = 0.85 SECONDS
	fire_sound =  'sound/weapons/guns/fire/t62.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/T42_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/T42_reload.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/standard_smarttargetrifle
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/standard_smarttargetrifle)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope/marine,
		/obj/item/weapon/gun/rifle/standard_spottingrifle,
		/obj/item/attachable/stock/strstock,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
	)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_IFF|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	gun_skill_category = SKILL_SMARTGUN //Uses SG skill for the penalties.
	attachable_offset = list("muzzle_x" = 12, "muzzle_y" = 22, "rail_x" = 15, "rail_y" = 22, "under_x" = 28, "under_y" = 16, "stock_x" = 12, "stock_y" = 14)
	starting_attachment_types = list(/obj/item/weapon/gun/rifle/standard_spottingrifle, /obj/item/attachable/stock/strstock)

	fire_delay = 0.5 SECONDS
	burst_amount = 0
	accuracy_mult_unwielded = 0.4
	accuracy_mult = 1.1
	scatter = 0
	scatter_unwielded = 20
	movement_acc_penalty_mult = 8

	placed_overlay_iconstate = "smartgun"

/obj/item/weapon/gun/rifle/standard_smarttargetrifle/motion
	starting_attachment_types = list(/obj/item/weapon/gun/rifle/standard_spottingrifle, /obj/item/attachable/stock/strstock, /obj/item/attachable/motiondetector)

/obj/item/weapon/gun/rifle/standard_spottingrifle
	name = "SG-153 观测步枪"
	desc = "下挂式测距步枪，通常安装在另一把枪械的上方。"
	icon_state = "sg153"
	icon = 'icons/obj/items/guns/marksman64.dmi'
	fire_sound =  'sound/weapons/guns/fire/spottingrifle.ogg'
	caliber = CALIBER_12x7
	slot = ATTACHMENT_SLOT_UNDER
	max_shells = 5
	default_ammo_type =/obj/item/ammo_magazine/rifle/standard_spottingrifle
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/rifle/standard_spottingrifle,
		/obj/item/ammo_magazine/rifle/standard_spottingrifle/highimpact,
		/obj/item/ammo_magazine/rifle/standard_spottingrifle/heavyrubber,
		/obj/item/ammo_magazine/rifle/standard_spottingrifle/plasmaloss,
		/obj/item/ammo_magazine/rifle/standard_spottingrifle/tungsten,
		/obj/item/ammo_magazine/rifle/standard_spottingrifle/incendiary,
		/obj/item/ammo_magazine/rifle/standard_spottingrifle/flak,
	)
	force = 5
	attachable_allowed = list()
	actions_types = list()
	gun_firemode_list = list(GUN_FIREMODE_SEMIAUTO)
	gun_features_flags = GUN_IS_ATTACHMENT|GUN_WIELDED_FIRING_ONLY|GUN_ATTACHMENT_FIRE_ONLY|GUN_AMMO_COUNTER|GUN_IFF|GUN_SMOKE_PARTICLES
	attach_features_flags = NONE
	fire_delay = 1 SECONDS
	accuracy_mult = 1.25
	pixel_shift_x = 18
	pixel_shift_y = 16

//-------------------------------------------------------
//SG-25 Smart Rifle (Added back spefically for NT PMC ert, do not expect it to return in marine roster)

/obj/item/weapon/gun/rifle/pmc_smartrifle
	name = "\improper SG-25智能步枪"
	desc = "SG-25是纳米传讯的实验型智能武器系统，搭载在地球政府殖民地海军陆战队标准配发AR-12的步枪框架上。需要特殊训练且无法关闭敌我识别系统。使用10x26mm弹药。"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	icon_state = "sg25"
	worn_icon_state = "sg25"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/rifles_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/rifles_right_1.dmi',
	)
	caliber = CALIBER_10x26_CASELESS //codex
	max_shells = 100 //codex
	force = 25
	aim_slowdown = 0.6
	wield_delay = 0.75 SECONDS
	fire_sound = SFX_GUN_SMARTGUN
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/T42_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/T42_reload.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/standard_smartrifle
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/standard_smartrifle)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/angledgrip,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/motiondetector,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/flamer/hydro_cannon,
	)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_IFF|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	gun_skill_category = SKILL_SMARTGUN //Uses SG skill for the penalties.
	attachable_offset = list("muzzle_x" = 52, "muzzle_y" = 17,"rail_x" = 30, "rail_y" = 26, "under_x" = 33, "under_y" = 13, "stock_x" = 12, "stock_y" = 13)
	fire_delay = 0.2 SECONDS
	burst_amount = 0
	accuracy_mult = 1.1
	scatter = 0
	accuracy_mult_unwielded = 0.5
	scatter_unwielded = 15
	damage_mult = 1.25
	damage_falloff_mult = 0.3
	shell_speed_mod = 2

/obj/item/weapon/gun/rifle/pmc_smartrifle/leader
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/bayonet/converted, /obj/item/attachable/verticalgrip)

//-------------------------------------------------------
//Sectoid Rifle

/obj/item/weapon/gun/rifle/sectoid_rifle
	name = "异形步枪"
	desc = "一把外形奇特的异形枪械。它没有扳机，也没有任何明显的开火方式。"
	icon = 'icons/obj/items/guns/energy.dmi'
	icon_state = "alien_rifle"
	worn_icon_state = "alien_rifle"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/energy_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/energy_right_1.dmi',
	)
	fire_sound = 'sound/weapons/guns/fire/alienplasma.ogg'
	fire_rattle = 'sound/weapons/guns/fire/alienplasma.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/vp70_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/m41a_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m4ra_reload.ogg'
	max_shells = 20//codex stuff
	ammo_datum_type = /datum/ammo/energy/sectoid_plasma
	muzzleflash_iconstate = "muzzle_flash_pulse"
	default_ammo_type = /obj/item/ammo_magazine/rifle/sectoid_rifle
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/sectoid_rifle)
	wield_delay = 0.6 SECONDS

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_ENERGY|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_SEMIAUTO, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 18,"rail_x" = 12, "rail_y" = 23, "under_x" = 23, "under_y" = 15, "stock_x" = 22, "stock_y" = 12)

	fire_delay = 0.5 SECONDS
	burst_amount = 3
	burst_delay = 0.15 SECONDS
	accuracy_mult = 2
	accuracy_mult_unwielded = 0.8
	movement_acc_penalty_mult = 3

/obj/item/weapon/gun/rifle/sectoid_rifle/Initialize(mapload, spawn_empty)
	. = ..()
	AddComponent(/datum/component/reequip, list(SLOT_BACK)) //Sectoids have alien powers that make them not lose their gun

//only sectoids can fire it
/obj/item/weapon/gun/rifle/sectoid_rifle/able_to_fire(mob/user)
	. = ..()
	if(!.)
		return
	if(!ishuman(user))
		return FALSE
	var/mob/living/carbon/human/H = user
	if(!(H.species.species_flags & USES_ALIEN_WEAPONS))
		to_chat(user, span_warning("这把枪没有扳机，你根本不知道怎么开火！"))
		return FALSE
	return TRUE


//-------------------------------------------------------
//SR-127 bolt action sniper rifle

/obj/item/weapon/gun/rifle/chambered
	name = "\improper SR-127 鲍尔栓动步枪"
	desc = "鲍尔SR-127是TGMC的标准配发栓动步枪。以其远程精度著称，尽管年代久远且缺乏敌我识别系统，仍被狙击手使用，不过谨慎瞄准可提供后方火力支援。它配备不可拆卸的瞄准镜。使用8.6×70毫米盒式弹匣。"
	icon = 'icons/obj/items/guns/marksman64.dmi'
	icon_state = "tl127"
	worn_icon_state = "tl127"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/marksman_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/marksman_right_64.dmi',
	)
	gun_crosshair = 'icons/UI_Icons/gun_crosshairs/sniper.dmi'

	inhand_x_dimension = 64
	inhand_y_dimension = 32
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_sr127.ogg'
	fire_rattle = 'sound/weapons/guns/fire/tgmc/kinetic/gun_sr127_low.ogg'
	cocked_sound = 'sound/weapons/guns/interact/tl-127_bolt.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/sniper_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/m41a_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m41a_reload.ogg'
	caliber = CALIBER_86X70 //codex
	max_shells = 10 //codex
	default_ammo_type = /obj/item/ammo_magazine/rifle/chamberedrifle
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/rifle/chamberedrifle,
		/obj/item/ammo_magazine/rifle/chamberedrifle/flak,
	)
	attachable_allowed = list(
		/obj/item/attachable/scope/unremovable/tl127,
		/obj/item/attachable/stock/tl127stock,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/foldable/bipod,
	)

	gun_features_flags = GUN_WIELDED_FIRING_ONLY|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	reciever_flags = AMMO_RECIEVER_REQUIRES_UNIQUE_ACTION|AMMO_RECIEVER_MAGAZINES|AMMO_RECIEVER_UNIQUE_ACTION_LOCKS|AMMO_RECIEVER_AUTO_EJECT

	cock_animation = "tl127_cock"
	cocked_message = "You rack the bolt!"

	gun_firemode_list = list(GUN_FIREMODE_SEMIAUTO)
	attachable_offset = list("muzzle_x" = 40, "muzzle_y" = 19,"rail_x" = 10, "rail_y" = 22, "under_x" = 33, "under_y" = 16, "stock_x" = 8, "stock_y" = 12)
	actions_types = list(/datum/action/item_action/aim_mode)
	aim_fire_delay = 1 SECONDS

	starting_attachment_types = list(
		/obj/item/attachable/scope/unremovable/tl127,
		/obj/item/attachable/stock/tl127stock,
	)

	burst_amount = 0
	fire_delay = 1.35 SECONDS
	accuracy_mult = 1.15
	accuracy_mult_unwielded = 0.7
	scatter = -5
	scatter_unwielded = 20
	recoil = 0
	recoil_unwielded = 4
	aim_slowdown = 1
	wield_delay = 1.5 SECONDS
	cock_delay = 0.7 SECONDS
	movement_acc_penalty_mult = 6

/obj/item/weapon/gun/rifle/chambered/unscoped
	starting_attachment_types = list(/obj/item/attachable/stock/tl127stock)

//-------------------------------------------------------
//SR-81 Auto-Sniper

/obj/item/weapon/gun/rifle/standard_autosniper
	name = "\improper SR-81 考瑟-KT 自动狙击步枪"
	desc = "Kauser-KT SR-81是地球政府殖民地海军陆战队的自动狙击步枪，通常与其标志性的夜视仪/KTLD瞄准镜组合搭配使用。其显著特点在于其同类武器中较高的射速，并在任何距离上都有不错的表现。使用8.6x70mm无壳弹，具有为敌我识别射击设计的专用压力。"
	icon_state = "t81"
	worn_icon_state = "t81"
	gun_crosshair = 'icons/UI_Icons/gun_crosshairs/sniper.dmi'
	fire_sound = 'sound/weapons/guns/fire/sniper.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/sniper_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/m41a_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m41a_reload.ogg'
	caliber = CALIBER_86X70 //codex
	max_shells = 20 //codex
	default_ammo_type = /obj/item/ammo_magazine/rifle/autosniper
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/autosniper)
	attachable_allowed = list(
		/obj/item/attachable/autosniperbarrel,
		/obj/item/attachable/scope/nightvision,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
	)

	gun_features_flags = GUN_WIELDED_FIRING_ONLY|GUN_AMMO_COUNTER|GUN_IFF|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 48, "muzzle_y" = 18,"rail_x" = 23, "rail_y" = 23, "under_x" = 38, "under_y" = 16, "stock_x" = 9, "stock_y" = 12)
	starting_attachment_types = list(
		/obj/item/attachable/autosniperbarrel,
		/obj/item/attachable/scope/nightvision,
	)

	burst_amount = 0
	fire_delay = 0.55 SECONDS
	accuracy_mult = 1.1
	accuracy_mult_unwielded = 0.7
	scatter = -5
	scatter_unwielded = 20
	recoil = 0
	recoil_unwielded = 4
	aim_slowdown = 1
	wield_delay = 1.5 SECONDS
	movement_acc_penalty_mult = 6

//-------------------------------------------------------
//AR-11 Rifle, based on the gamer-11

/obj/item/weapon/gun/rifle/tx11
	name = "\improper AR-11 K&H 战斗步枪"
	desc = "凯克勒与霍赫 AR-11 曾是地球政府殖民地海军陆战队的制式步枪。其中大部分早已封存入库，但仍有一些会出现在陆战队员或雇佣兵手中。它以弹匣容量大和优秀的点射火力著称，但使用起来相当笨拙，尤其是在战斗中。它使用 4.92×34 毫米无壳高速弹药。"
	icon_state = "tx11"
	worn_icon_state = "tx11"
	caliber = CALIBER_492X34_CASELESS //codex
	max_shells = 70 //codex
	wield_delay = 0.85 SECONDS
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_ar11.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/T42_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/T42_reload.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/tx11
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/tx11)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/scope/mini/tx11,
		/obj/item/attachable/stock/tx11,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/scope/marine,
	)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	starting_attachment_types = list(/obj/item/attachable/stock/tx11, /obj/item/attachable/scope/mini/tx11)
	attachable_offset = list("muzzle_x" = 31, "muzzle_y" = 17,"rail_x" = 6, "rail_y" = 20, "under_x" = 20, "under_y" = 12, "stock_x" = 17, "stock_y" = 14)
	aim_fire_delay = 0.15 SECONDS

	fire_delay = 0.25 SECONDS
	burst_amount = 3
	burst_delay = 0.05 SECONDS
	extra_delay = 0.15 SECONDS
	accuracy_mult_unwielded = 0.5
	accuracy_mult = 1.15
	scatter = -1
	scatter_unwielded = 15
	aim_slowdown = 0.45
	movement_acc_penalty_mult = 6

/obj/item/weapon/gun/rifle/tx11/scopeless
	starting_attachment_types = list(/obj/item/attachable/stock/tx11)

/obj/item/weapon/gun/rifle/tx11/freelancerone
	starting_attachment_types = list(/obj/item/attachable/stock/tx11, /obj/item/attachable/magnetic_harness, /obj/item/attachable/bayonet/converted, /obj/item/attachable/lasersight)

/obj/item/weapon/gun/rifle/tx11/freelancertwo
	starting_attachment_types = list(/obj/item/attachable/stock/tx11, /obj/item/attachable/motiondetector, /obj/item/attachable/bayonet/converted, /obj/item/attachable/lasersight)

/obj/item/weapon/gun/rifle/tx11/standard
	starting_attachment_types = list(/obj/item/attachable/stock/tx11, /obj/item/attachable/reddot, /obj/item/attachable/lasersight)

/obj/item/weapon/gun/rifle/tx11/freelancer_custom
	name = "\improper AR-11 战斗步枪 马格南 定制型"
	desc = "凯克勒与霍赫 AR-11 曾是地球政府殖民地海军陆战队的制式步枪。其中大部分早已封存入库，但仍有一些会出现在陆战队员或佣兵手中。它以弹匣容量大、点射火力强而闻名，但使用起来相当笨拙，尤其是在战斗中。它使用 4.92×34 毫米无壳高速弹药。这款特定型号经过 MAGNUM 自由佣兵的定制和调校，使其更精准、更轻便。"
	icon_state = "tx11_custom"
	worn_icon_state = "tx11_custom"

	wield_delay = 0.6 SECONDS
	scatter = -0.5
	scatter_unwielded = 10
	aim_slowdown = 0.3
	movement_acc_penalty_mult = 3
	starting_attachment_types = list(/obj/item/attachable/stock/tx11)

/obj/item/weapon/gun/rifle/tx11/freelancer_custom/leader
	starting_attachment_types = list(/obj/item/attachable/stock/tx11, /obj/item/attachable/motiondetector, /obj/item/attachable/bayonet/converted, /obj/item/attachable/lasersight)
//-------------------------------------------------------
//AR-21 Assault Rifle

/obj/item/weapon/gun/rifle/standard_skirmishrifle
	name = "\improper AR-21 考瑟突击步枪"
	desc = "Kauser AR-21 是一款多用途步枪，旨在填补大口径武器与普通步枪之间的空白。它发射威力强大的 10x25mm 子弹，具有良好的停止作用。但与更小型的同类武器相比，它在弹匣容量和机动性方面有所不足。"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	icon_state = "t21"
	worn_icon_state = "t21"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/rifles_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/rifles_right_64.dmi',
	)

	inhand_x_dimension = 64
	inhand_y_dimension = 32
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_ar21.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/t21_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/t21_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/t21_reload.ogg'
	caliber = CALIBER_10X25_CASELESS //codex
	max_shells = 40 //codex
	force = 20
	default_ammo_type = /obj/item/ammo_magazine/rifle/standard_skirmishrifle
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/standard_skirmishrifle)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/scope,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/angledgrip,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/motiondetector,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/flamer/hydro_cannon,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 46, "muzzle_y" = 16,"rail_x" = 18, "rail_y" = 19, "under_x" = 34, "under_y" = 13, "stock_x" = 0, "stock_y" = 13)
	aim_fire_delay = 0.15 SECONDS
	aim_speed_modifier = 2.5

	fire_delay = 0.25 SECONDS
	burst_amount = 1
	burst_delay = 0.15 SECONDS
	accuracy_mult = 1.2
	scatter = -2
	wield_delay = 0.8 SECONDS
	aim_slowdown = 0.5
	damage_falloff_mult = 0.5

/obj/item/weapon/gun/rifle/standard_skirmishrifle/standard
	starting_attachment_types = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/extended_barrel,
		/obj/item/weapon/gun/grenade_launcher/underslung,
	)

//-------------------------------------------------------
//AF-51B MACHINEcarbine

/obj/item/weapon/gun/rifle/alf_machinecarbine
	name = "\improper ALF-51B 考瑟尔冲锋枪"
	desc = "Kauser ALF-51B 是 ALF-51（或称 AR-18 卡宾枪）的非官方改型，改装为冲锋枪长度的枪管，重新设计膛室以适配威力更强的弹药，并采用弹链供弹。这是真正的近战巅峰。超出此范围则毫无用处。无法精确瞄准。使用 10x25mm 无壳弹药。"
	icon = 'icons/obj/items/guns/machineguns.dmi'
	icon_state = "alf51b"
	worn_icon_state = "alf51b"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/machineguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/machineguns_right_1.dmi',
	)
	fire_animation = "alf51b_fire"
	fire_sound = 'sound/weapons/guns/fire/t18b.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/t18_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/t18_reload.ogg'
	caliber = CALIBER_10X25_CASELESS //codex
	max_shells = 80 //codex
	force = 20
	default_ammo_type = /obj/item/ammo_magazine/rifle/alf_machinecarbine
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/alf_machinecarbine)
	attachable_allowed = list(
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	attachable_offset = list("muzzle_x" = 31, "muzzle_y" = 16,"rail_x" = 10, "rail_y" = 19, "under_x" = 21, "under_y" = 13, "stock_x" = 0, "stock_y" = 13)

	fire_delay = 0.2 SECONDS
	burst_delay = 0.1 SECONDS
	extra_delay = 0.2 SECONDS
	scatter = 4
	burst_amount = 4
	aim_slowdown = 0.3
	wield_delay = 0.6 SECONDS
	damage_falloff_mult = 3

	movement_acc_penalty_mult = 4

/obj/item/weapon/gun/rifle/alf_machinecarbine/assault
	starting_attachment_types = list(
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/verticalgrip,
	)

//-------------------------------------------------------
// MKH-98

/obj/item/weapon/gun/rifle/mkh
	name = "\improper MKH-98 风暴步枪"
	desc = "一把经过认证的经典之作，这款复刻设计被誉为首个成功的突击步枪概念，通常被称为'风暴步枪'。其射速在同类武器中高于平均水平，但弹容量有所不足。此版本使用7.62x39毫米弹药。"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	icon_state = "mkh98"
	worn_icon_state = "mkh98"
	caliber = CALIBER_762X39 //codex

	max_shells = 30 //codex
	fire_sound = 'sound/weapons/guns/fire/ak47.ogg'
	unload_sound = 'sound/weapons/guns/interact/ak47_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/ak47_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/ak47_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/mkh
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/mkh)
	aim_slowdown = 0.35
	attachable_allowed = list(
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 51, "muzzle_y" = 18,"rail_x" = 24, "rail_y" = 22, "under_x" = 36, "under_y" = 16, "stock_x" = 0, "stock_y" = 12)

	accuracy_mult = 1.1
	burst_amount = 1
	fire_delay = 0.2 SECONDS
	scatter = 1
	wield_delay = 0.7 SECONDS
	movement_acc_penalty_mult = 4

//-------------------------------------------------------
// GL-54 grenade launcher
/obj/item/weapon/gun/rifle/tx54
	name = "\improper GL-54 榴弹发射器"
	desc = "一款弹匣供弹的半自动榴弹发射器，设计用于发射空爆智能手雷。需要T49瞄准镜进行精确瞄准。"
	icon = 'icons/obj/items/guns/special64.dmi'
	icon_state = "tx54"
	worn_icon_state = "tx54" ///todo
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/special_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/special_right_1.dmi',
	)
	max_shells = 5 //codex
	max_chamber_items = 1
	fire_delay = 1.2 SECONDS
	fire_sound = 'sound/weapons/guns/fire/underbarrel_grenadelauncher.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/shotgun_empty.ogg'
	caliber = CALIBER_20MM //codex
	attachable_allowed = list(
		/obj/item/attachable/scope/optical,
		/obj/item/attachable/reddot,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/buildasentry,
	)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_WIELDED_STABLE_FIRING_ONLY|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	starting_attachment_types = list(/obj/item/attachable/scope/optical)
	default_ammo_type = null
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/rifle/tx54,
		/obj/item/ammo_magazine/rifle/tx54/he,
		/obj/item/ammo_magazine/rifle/tx54/incendiary,
		/obj/item/ammo_magazine/rifle/tx54/smoke,
		/obj/item/ammo_magazine/rifle/tx54/smoke/dense,
		/obj/item/ammo_magazine/rifle/tx54/smoke/tangle,
		/obj/item/ammo_magazine/rifle/tx54/smoke/acid,
		/obj/item/ammo_magazine/rifle/tx54/razor,
	)
	gun_firemode_list = list(GUN_FIREMODE_SEMIAUTO)
	attachable_offset = list("muzzle_x" = 31, "muzzle_y" = 17,"rail_x" = 12, "rail_y" = 20, "under_x" = 28, "under_y" = 13, "stock_x" = -1, "stock_y" = 17)
	aim_slowdown = 0.8
	wield_delay = 1 SECONDS
	burst_amount = 1
	accuracy_mult = 1.15
	scatter = -2
	aim_fire_delay = 0.2 SECONDS
	aim_speed_modifier = 2

/obj/item/weapon/gun/rifle/tx54/motion_sensor
	starting_attachment_types = list(/obj/item/attachable/motiondetector)
	default_ammo_type = /obj/item/ammo_magazine/rifle/tx54

//-------------------------------------------------------
// AR-55 built in grenade launcher

/obj/item/weapon/gun/rifle/tx54/mini
	name = "\improper GL-55 20mm 手雷发射器"
	desc = "一款可装于武器上、可重新装填的五发手雷发射器。"
	icon = 'icons/obj/items/guns/attachments/gun.dmi'
	icon_state = "tx55gl"
	placed_overlay_iconstate = "tx55gl"
	attachable_allowed = list()
	gun_features_flags = GUN_AMMO_COUNTER|GUN_IS_ATTACHMENT|GUN_ATTACHMENT_FIRE_ONLY|GUN_WIELDED_STABLE_FIRING_ONLY|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	attach_features_flags = NONE
	slot = ATTACHMENT_SLOT_STOCK
	default_ammo_type = /obj/item/ammo_magazine/rifle/tx54
	attach_delay = 3 SECONDS
	detach_delay = 3 SECONDS
	actions_types = list(/datum/action/item_action/aim_mode)
	starting_attachment_types = list()

//-------------------------------------------------------
// AR-55 rifle

/obj/item/weapon/gun/rifle/tx55
	name = "\improper AR-55 突击步枪"
	desc = "正式命名为'目标单兵战斗武器'的AR-55，其上部采用无托结构，配备一门20毫米榴弹发射器，可发射多种专用弹头；下部挂载一支使用10x24毫米无壳弹药的突击步枪。由于其尺寸和重量，使用起来略显笨重。需要T49瞄准镜进行精确瞄准。"
	icon_state = "tx55"
	worn_icon_state = "tx55"
	fire_sound = SFX_GUN_AR12
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/t18_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/t18_reload.ogg'
	caliber = CALIBER_10X24_CASELESS //codex
	max_shells = 36 //codex
	wield_delay = 1.2 SECONDS
	default_ammo_type = /obj/item/ammo_magazine/rifle/standard_carbine
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/standard_carbine)
	attachable_allowed = list(
		/obj/item/attachable/scope/optical,
		/obj/item/weapon/gun/rifle/tx54/mini,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/motiondetector,
	)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	starting_attachment_types = list(
		/obj/item/weapon/gun/rifle/tx54/mini,
		/obj/item/attachable/scope/optical,
	)
	attachable_offset = list("muzzle_x" = 31, "muzzle_y" = 17,"rail_x" = 13, "rail_y" = 22, "under_x" = 21, "under_y" = 14, "stock_x" = -1, "stock_y" = 17)

	aim_fire_delay = 0.1 SECONDS
	aim_speed_modifier = 2
	fire_delay = 0.2 SECONDS
	burst_delay = 0.15 SECONDS
	extra_delay = 0.05 SECONDS
	accuracy_mult_unwielded = 0.5
	scatter = 1
	scatter_unwielded = 15
	burst_scatter_mult = 2
	aim_slowdown = 1
	movement_acc_penalty_mult = 6

/obj/item/weapon/gun/rifle/tx55/combat_patrol //no scope for HvH
	starting_attachment_types = list(
		/obj/item/weapon/gun/rifle/tx54/mini,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/compensator,
		/obj/item/attachable/verticalgrip,
	)

/obj/item/weapon/gun/rifle/tx55/freelancer_custom
	name = "\improper AR-55 突击步枪 马格南定制型"
	desc = "正式命名为'目标单兵战斗武器'的AR-55，其上部采用无托结构，配备一门20毫米榴弹发射器，可发射多种专用弹头；下部挂载一支使用10x24毫米无壳弹药的突击步枪。由于尺寸和重量，使用起来略显笨重。需要T49瞄准镜进行精确瞄准。此特定型号由MAGNUM自由佣兵定制调校，使其更轻量化，并能使用AR-12的更大容量弹匣。"
	icon_state = "tx55_custom"
	worn_icon_state = "tx55_custom"
	default_ammo_type = /obj/item/ammo_magazine/rifle/standard_assaultrifle
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/standard_assaultrifle, /obj/item/ammo_magazine/rifle/standard_assaultrifle/ap)
	max_shells = 50 //codex
	aim_slowdown = 0.7
	movement_acc_penalty_mult = 5

/obj/item/weapon/gun/rifle/tx55/freelancer_custom/grenadier
	starting_attachment_types = list(
		/obj/item/weapon/gun/rifle/tx54/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/gyro,
	)

/obj/item/weapon/gun/rifle/tx55/freelancer_custom/leader
	starting_attachment_types = list(
		/obj/item/weapon/gun/rifle/tx54/mini,
		/obj/item/attachable/scope/optical,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/verticalgrip,
	)

/obj/item/weapon/gun/rifle/tx55/freelancer_custom/combat_patrol
	starting_attachment_types = list(
		/obj/item/weapon/gun/rifle/tx54/mini,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/verticalgrip,
	)

//-------------------------------------------------------
//A true classic, the Garand. Ping.

/obj/item/weapon/gun/rifle/garand
	name = "\improper CAU C1 加兰德半自动步枪"
	desc = "卡尔福德-1型是卡尔福德兵工厂对经典枪型的现代化复刻版本。最显著的改动在于导轨系统的细微调整。除此之外，它完美保留了标志性的退夹音效等所有经典特征。使用.30-06漏夹供弹。"
	icon = 'icons/obj/items/guns/marksman64.dmi'
	icon_state = "garand"
	worn_icon_state = "garand"
	inhand_x_dimension = 64
	inhand_y_dimension = 32
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/marksman_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/marksman_right_64.dmi',
	)
	gun_crosshair = 'icons/UI_Icons/gun_crosshairs/sniper.dmi'
	fire_sound = 'sound/weapons/guns/fire/garand.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/sniper_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/garand_ping.ogg'
	reload_sound = 'sound/weapons/guns/interact/m41a_reload.ogg'
	empty_sound = null
	caliber = CALIBER_3006 //codex
	max_shells = 8 //codex
	default_ammo_type = /obj/item/ammo_magazine/rifle/garand
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/rifle/garand,
	)
	attachable_allowed = list(
		/obj/item/attachable/stock/garand,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/foldable/bipod,
	)

	gun_features_flags = GUN_WIELDED_FIRING_ONLY|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	reciever_flags = AMMO_RECIEVER_MAGAZINES|AMMO_RECIEVER_AUTO_EJECT|AMMO_RECIEVER_CYCLE_ONLY_BEFORE_FIRE

	gun_firemode_list = list(GUN_FIREMODE_SEMIAUTO)
	attachable_offset = list("muzzle_x" = 40, "muzzle_y" = 19,"rail_x" = 9, "rail_y" = 22, "under_x" = 33, "under_y" = 16, "stock_x" = 0, "stock_y" = 11)
	aim_fire_delay = 1.25 SECONDS

	starting_attachment_types = list(
		/obj/item/attachable/stock/garand,
	)

	burst_amount = 0
	fire_delay = 0.8 SECONDS
	accuracy_mult = 1.15
	accuracy_mult_unwielded = 0.75
	scatter = 0
	scatter_unwielded = 25
	recoil = 0
	recoil_unwielded = 4
	aim_slowdown = 0.75
	wield_delay = 1.2 SECONDS
	movement_acc_penalty_mult = 6

//-------------------------------------------------------
// V-31 SOM rifle

/obj/item/weapon/gun/rifle/som
	name = "\improper V-31 突击步枪"
	desc = "V-31曾是火星之子的制式步枪，直至更先进的能量武器列装。尽管如此，由于相对易于生产和维护，以及内置的用于发射所谓'微型'手雷的低速导轨炮，V-31仍被广泛使用。其紧凑的无托式设计带来了良好的操控性，通常在所有射程内都有效。使用10x25mm无壳弹药。"
	icon_state = "v31"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	worn_icon_state = "v31"
	fire_sound = 'sound/weapons/guns/fire/som_rifle.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/t18_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/t18_reload.ogg'
	caliber = CALIBER_10X24_CASELESS
	max_shells = 50
	default_ammo_type = /obj/item/ammo_magazine/rifle/som
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/som, /obj/item/ammo_magazine/rifle/som/ap, /obj/item/ammo_magazine/rifle/som/incendiary)
	attachable_allowed = list(
		/obj/item/weapon/gun/shotgun/micro_grenade,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/motiondetector,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	starting_attachment_types = list(
		/obj/item/weapon/gun/shotgun/micro_grenade,
	)
	attachable_offset = list("muzzle_x" = 45, "muzzle_y" = 16,"rail_x" = 23, "rail_y" = 24, "under_x" = 33, "under_y" = 11, "stock_x" = -1, "stock_y" = 17)

	wield_delay = 0.8 SECONDS

	aim_fire_delay = 0.1 SECONDS
	aim_speed_modifier = 2

	fire_delay = 0.2 SECONDS
	aim_slowdown = 0.35

	accuracy_mult = 1
	accuracy_mult_unwielded = 0.55
	scatter = -2
	scatter_unwielded = 15

	burst_amount = 3
	burst_scatter_mult = 4
	burst_delay = 0.1 SECONDS
	extra_delay = 0.1 SECONDS

	damage_falloff_mult = 0.7

/obj/item/weapon/gun/rifle/som/standard
	starting_attachment_types = list(
		/obj/item/weapon/gun/shotgun/micro_grenade,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/reddot,
	)

/obj/item/weapon/gun/rifle/som/suppressed
	starting_attachment_types = list(
		/obj/item/weapon/gun/shotgun/micro_grenade,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/magnetic_harness,
	)

/obj/item/weapon/gun/rifle/som/veteran
	default_ammo_type = /obj/item/ammo_magazine/rifle/som/ap
	starting_attachment_types = list(
		/obj/item/weapon/gun/shotgun/micro_grenade,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/reddot,
	)

/obj/item/weapon/gun/rifle/som/mag_harness
	starting_attachment_types = list(
		/obj/item/weapon/gun/shotgun/micro_grenade,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
	)

/obj/item/weapon/gun/rifle/som/basic //export model
	starting_attachment_types = list(
		/obj/item/weapon/gun/shotgun/micro_grenade,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/bayonet/converted,
	)

//-------------------------------------------------------
// V-34 SOM carbine
/obj/item/weapon/gun/rifle/som_carbine
	name = "\improper V-34卡宾枪"
	desc = "一款在火星起义期间广泛使用的老旧但坚固的武器。作为一款相对轻便紧凑的武器，凭借良好的射速和大口径，它仍然具有可观的威力，尽管在远距离上其有效性会显著下降。它使用7.62x39毫米弹药。"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	icon_state = "v34"
	worn_icon_state = "v34"
	caliber = CALIBER_762X39
	muzzleflash_iconstate = "muzzle_flash"
	max_shells = 30
	fire_sound = 'sound/weapons/guns/fire/ak47.ogg'
	unload_sound = 'sound/weapons/guns/interact/ak47_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/ak47_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/ak47_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/mpi_km/carbine
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/rifle/mpi_km,
		/obj/item/ammo_magazine/rifle/mpi_km/plum,
		/obj/item/ammo_magazine/rifle/mpi_km/black,
		/obj/item/ammo_magazine/rifle/mpi_km/carbine,
		/obj/item/ammo_magazine/rifle/mpi_km/carbine/plum,
		/obj/item/ammo_magazine/rifle/mpi_km/carbine/black,
		/obj/item/ammo_magazine/rifle/mpi_km/extended,
	)
	attachable_allowed = list(
		/obj/item/attachable/foldable/som_carbine,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/verticalgrip,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 18,"rail_x" = 8, "rail_y" = 20, "under_x" = 17, "under_y" = 13, "stock_x" = -6, "stock_y" = 16)
	starting_attachment_types = list(/obj/item/attachable/foldable/som_carbine)
	force = 15

	burst_amount = 1
	fire_delay = 0.15 SECONDS
	accuracy_mult = 0.75
	scatter = 12
	recoil = 1.5
	wield_delay = 0.6 SECONDS
	aim_slowdown = 0.4
	movement_acc_penalty_mult = 4
	damage_falloff_mult = 1.4
	damage_mult = 0.9

/obj/item/weapon/gun/rifle/som_carbine/mag_harness
	starting_attachment_types = list(/obj/item/attachable/foldable/som_carbine, /obj/item/attachable/magnetic_harness)

/obj/item/weapon/gun/rifle/som_carbine/black
	desc = "这是火星之子对一款在火星起义期间广泛使用的古老武器进行的现代化重新设计。这款武器相对轻便紧凑，凭借良好的射速和大口径，仍能造成可观的杀伤力，尽管在远距离上其效能会显著下降。它使用7.62x39毫米口径弹药。"
	icon_state = "v34_black"
	worn_icon_state = "v34_black"
	default_ammo_type = /obj/item/ammo_magazine/rifle/mpi_km/carbine/black
	attachable_allowed = list(
		/obj/item/attachable/foldable/som_carbine,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/reddot,
	)

/obj/item/weapon/gun/rifle/som_carbine/black/standard
	starting_attachment_types = list(
		/obj/item/attachable/foldable/som_carbine,
		/obj/item/attachable/reddot,
	)

//-------------------------------------------------------
// V-35 battle rifle

/obj/item/weapon/gun/rifle/som_big
	name = "\improper V-35 战斗步枪"
	desc = "The V-35 is a more recent addition to the SOM armory, \
	where its superior per shot firepower serves as a cheaper alternative to vastly more expensive and maintenance intensive volkite weaponry. \
	A variety of ammunition types further more gives the V-35 significant tactical flexibility that volkite weaponry typically lacks, in addition to the ability to use aim mode."

	icon_state = "v35"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	worn_icon_state = "v35"
	ammo_level_icon = "v35"


	fire_sound = 'sound/weapons/guns/fire/ks23.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/deagle_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/m4ra_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m4ra_reload.ogg'
	caliber = CALIBER_10x27_CASELESS
	aim_slowdown = 0.8
	wield_delay = 1.1 SECONDS
	force = 20
	max_shells = 20
	default_ammo_type = /obj/item/ammo_magazine/rifle/som_big
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/rifle/som_big,
		/obj/item/ammo_magazine/rifle/som_big/incendiary,
		/obj/item/ammo_magazine/rifle/som_big/anti_armour,
	)
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/gyro,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/motiondetector,
	)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_CAN_POINTBLANK|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 54, "muzzle_y" = 20,"rail_x" = 23, "rail_y" = 22, "under_x" = 45, "under_y" = 14, "stock_x" = 14, "stock_y" = 10)

	fire_delay = 0.65 SECONDS
	accuracy_mult = 1.1
	scatter = -1
	burst_amount = 1
	movement_acc_penalty_mult = 7

	actions_types = list(/datum/action/item_action/aim_mode)
	aim_fire_delay = 0.2 SECONDS
	aim_speed_modifier = 2

/obj/item/weapon/gun/rifle/som_big/standard
	starting_attachment_types = list(/obj/item/attachable/motiondetector, /obj/item/attachable/heavy_barrel, /obj/item/attachable/verticalgrip)

/obj/item/weapon/gun/rifle/som_big/support
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/heavy_barrel, /obj/item/attachable/foldable/bipod)
//-------------------------------------------------------
// V-41 SOM LMG

/obj/item/weapon/gun/rifle/som_mg
	name = "\improper V-41 机枪"
	desc = "V-41是火星之子使用的大型便携式机枪，能以牺牲机动性和操控性为代价，提供持续、精准的压制火力。通常在他们偏好的快速机动进攻战术不适用时出现。使用10x26mm无壳弹。"
	icon = 'icons/obj/items/guns/machineguns64.dmi'
	icon_state = "v41"
	worn_icon_state = "v41"
	fire_animation = "v41_fire"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/machineguns_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/machineguns_right_64.dmi',
	)

	inhand_x_dimension = 64
	inhand_y_dimension = 32
	caliber = CALIBER_10x26_CASELESS
	max_shells = 200
	force = 35
	wield_delay = 1.7 SECONDS
	fire_sound = 'sound/weapons/guns/fire/v41.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/T42_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/v41_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/v41_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/som_mg
	allowed_ammo_types = list(/obj/item/ammo_magazine/som_mg)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/stock/som_mg_stock,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
	)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	starting_attachment_types = list(/obj/item/attachable/stock/som_mg_stock)
	gun_skill_category = SKILL_HEAVY_WEAPONS
	attachable_offset = list("muzzle_x" = 53, "muzzle_y" = 19,"rail_x" = 14, "rail_y" = 23, "under_x" = 41, "under_y" = 14, "stock_x" = -32, "stock_y" = 0)
	aim_fire_delay = 0.2 SECONDS
	aim_slowdown = 1.2

	fire_delay = 0.2 SECONDS
	burst_amount = 1
	accuracy_mult = 0.9
	accuracy_mult_unwielded = 0.4
	scatter = 6
	scatter_unwielded = 40
	movement_acc_penalty_mult = 7

	placed_overlay_iconstate = "lmg"

/obj/item/weapon/gun/rifle/som_mg/standard
	starting_attachment_types = list(/obj/item/attachable/stock/som_mg_stock, /obj/item/attachable/foldable/bipod, /obj/item/attachable/reddot, /obj/item/attachable/extended_barrel)

//-------------------------------------------------------
//L-11 ICC Sharpshooter Rifle

/obj/item/weapon/gun/rifle/icc_sharpshooter
	name = "\improper L-11 神射手步枪"
	desc = "L-11是一款久经沙场、备受考验的步枪，由ICCAF使用。虽然与大多数强调近距离接战的ICCAF步枪相比，它显得相当沉重、冗长且不便操作，但与大多数同类武器相比，其出色的远程潜力轻易弥补了这些不足。该枪主要见于预备役部队，他们预期进行远距离作战而非近身缠斗。使用10x27mm弹匣。"
	icon = 'icons/obj/items/guns/marksman64.dmi'
	icon_state = "l11"
	worn_icon_state = "l11"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/marksman_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/marksman_right_64.dmi',
	)
	inhand_x_dimension = 64
	inhand_y_dimension = 32


	fire_sound = SFX_FAL_FIRE
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/fal_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/fal_reload.ogg'
	caliber = CALIBER_10x27_CASELESS //codex
	aim_slowdown = 0.8
	wield_delay = 1.05 SECONDS
	force = 20
	max_shells = 20 //codex
	default_ammo_type = /obj/item/ammo_magazine/rifle/icc_sharpshooter
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/icc_sharpshooter)
	attachable_allowed = list(
		/obj/item/attachable/stock/icc_sharpshooter,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/gyro,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/motiondetector,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung/mpi/removeable,
	)
	starting_attachment_types = list(/obj/item/attachable/stock/icc_sharpshooter)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_CAN_POINTBLANK|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 40, "muzzle_y" = 14, "rail_x" = 15, "rail_y" = 17, "under_x" = 23, "under_y" = 10, "stock_x" = 17, "stock_y" = 10)
	actions_types = list(/datum/action/item_action/aim_mode)
	aim_fire_delay = 0.1 SECONDS
	aim_speed_modifier = 2

	burst_amount = 1
	fire_delay = 0.7 SECONDS
	damage_mult = 1.1
	accuracy_mult = 1.15
	scatter = 0
	movement_acc_penalty_mult = 5

/obj/item/weapon/gun/rifle/icc_sharpshooter/medic
	starting_attachment_types = list(/obj/item/attachable/stock/icc_sharpshooter, /obj/item/attachable/reddot, /obj/item/attachable/verticalgrip, /obj/item/attachable/heavy_barrel)

//-------------------------------------------------------
// L-15 ICC Battlecarbine

/obj/item/weapon/gun/rifle/icc_battlecarbine
	name = "\improper L-15战斗卡宾枪"
	desc = "L-15战斗卡宾枪是ICCAF的标准步枪，拥有大口径弹药和威猛的外形，是一款优秀的近战枪械。但由于短枪管导致弹道下坠严重，它在远距离表现不佳。使用该武器的部队表示，必须不惜一切代价拉近距离才能发挥其真正威力。使用10x25mm无壳弹药。"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	icon_state = "l15"
	worn_icon_state = "l15"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/rifles_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/rifles_right_64.dmi',
	)

	inhand_x_dimension = 64
	inhand_y_dimension = 32

	fire_sound = 'sound/weapons/guns/fire/mdr.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/mdr_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/mdr_reload.ogg'
	caliber = CALIBER_10X25_CASELESS //codex
	max_shells = 30 //codex
	force = 20
	default_ammo_type = /obj/item/ammo_magazine/rifle/icc_battlecarbine
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/icc_battlecarbine)
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/gyro,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/motiondetector,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung/mpi/removeable,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 44, "muzzle_y" = 19,"rail_x" = 20, "rail_y" = 23, "under_x" = 33, "under_y" = 13, "stock_x" = 0, "stock_y" = 13)
	aim_fire_delay = 0.25 SECONDS
	aim_speed_modifier = 1.65

	burst_amount = 1
	fire_delay = 0.2 SECONDS
	scatter = 3
	aim_slowdown = 0.35
	wield_delay = 0.55 SECONDS
	damage_falloff_mult = 2.5
	movement_acc_penalty_mult = 4

/obj/item/weapon/gun/rifle/icc_battlecarbine/standard
	starting_attachment_types = list(/obj/item/weapon/gun/grenade_launcher/underslung/mpi/removeable, /obj/item/attachable/magnetic_harness, /obj/item/attachable/extended_barrel)


//-------------------------------------------------------
// ML-12 ICC Confrontation Rifle

/obj/item/weapon/gun/rifle/icc_confrontationrifle
	name = "\improper ML-12 对抗步枪"
	desc = "ML-12对抗步枪是ICCAF使用的绝对野兽级武器。采用短枪身设计发射大口径弹药，能在近距离彻底撕碎敌方目标，但操作员在连续射击时必须留意其惊人的后坐力。使用10x28mm无壳弹药。"
	icon = 'icons/obj/items/guns/marksman64.dmi'
	icon_state = "ml12"
	worn_icon_state = "ml12"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/marksman_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/marksman_right_64.dmi',
	)

	inhand_x_dimension = 64
	inhand_y_dimension = 32

	fire_sound = 'sound/weapons/guns/fire/ml12.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/ml12_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/ml12_reload.ogg'
	caliber = CALIBER_10X28_CASELESS //codex
	max_shells = 25 //codex
	force = 20
	default_ammo_type = /obj/item/ammo_magazine/rifle/icc_confrontationrifle
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/icc_confrontationrifle)
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/reddot,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/motiondetector,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 48, "muzzle_y" = 18,"rail_x" = 24, "rail_y" = 26, "under_x" = 36, "under_y" = 14, "stock_x" = 0, "stock_y" = 13)
	aim_fire_delay = 0.3 SECONDS
	aim_speed_modifier = 2.5

	burst_amount = 1
	fire_delay = 0.45 SECONDS
	aim_slowdown = 0.55
	wield_delay = 0.85 SECONDS
	damage_falloff_mult = 2
	movement_acc_penalty_mult = 6.5

	min_scatter = 4
	max_scatter = 20
	scatter_increase = 5
	scatter_decay = 1
	scatter_decay_unwielded = 0.5

/obj/item/weapon/gun/rifle/icc_confrontationrifle/leader
	starting_attachment_types = list(/obj/item/attachable/lasersight, /obj/item/attachable/magnetic_harness, /obj/item/attachable/extended_barrel)

//-------------------------------------------------------
//ML-41 Autoshotgun

/obj/item/weapon/gun/rifle/icc_autoshotgun
	name = "\improper ML-41自动霰弹枪"
	desc = "ML-41自动霰弹枪由ICCAF在快节奏的登舰突击中使用，配备适用于各种情况的多种弹药。使用16发12号口径弹鼓。"
	icon = 'icons/obj/items/guns/shotguns64.dmi'
	icon_state = "ml41"
	worn_icon_state = "ml41"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/shotguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/shotguns_right_1.dmi',
	)
	gun_crosshair = 'icons/UI_Icons/gun_crosshairs/shotgun.dmi'
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/shotgun_empty.ogg'
	caliber = CALIBER_12G //codex
	max_shells = 16 //codex
	force = 20
	default_ammo_type = /obj/item/ammo_magazine/rifle/icc_autoshotgun
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/rifle/icc_autoshotgun,
		/obj/item/ammo_magazine/rifle/icc_autoshotgun/frag,
	)
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/compensator,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/motiondetector,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES //Its a shotgun type weapon effectively, most shotgun type weapons shouldn't be able to point blank 1 handed.
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 26,"rail_x" = 26, "rail_y" = 24, "under_x" = 40, "under_y" = 16, "stock_x" = 26, "stock_y" = 13)
	gun_skill_category = SKILL_SHOTGUNS

	fire_delay = 0.9 SECONDS
	accuracy_mult = 1.15
	damage_mult = 0.5
	aim_slowdown = 0.6
	wield_delay = 0.75 SECONDS
	burst_amount = 1
	scatter = 8
	movement_acc_penalty_mult = 2

/obj/item/weapon/gun/rifle/icc_autoshotgun/guard
	starting_attachment_types = list(/obj/item/attachable/verticalgrip, /obj/item/attachable/magnetic_harness)

//-------------------------------------------------------
//L-88 Assaultcarbine and EM-88 'Export' Varient

/obj/item/weapon/gun/rifle/icc_assaultcarbine
	name = "\improper L-88 突击卡宾枪"
	desc = "一款由 ICCAF 预备役人员使用的老旧、可靠但过时的无托式步枪，最适合在需要快速清理拐角的近距离战斗中使用，配有整体式前握把和无放大倍率的瞄准镜以提高精度并减少阻力。使用 5.56x45mm NATO 弹药。"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	icon_state = "l88"
	worn_icon_state = "l88"

	caliber = CALIBER_556X45 //codex
	max_shells = 30 //codex
	fire_sound = 'sound/weapons/guns/fire/famas.ogg'
	unload_sound = 'sound/weapons/guns/interact/m16_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m16_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/m16_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/icc_assaultcarbine
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/rifle/icc_assaultcarbine,
		/obj/item/ammo_magazine/rifle/icc_assaultcarbine/export,
	)
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	attachable_offset = list("muzzle_x" = 44, "muzzle_y" = 19,"rail_x" = 8, "rail_y" = 21, "under_x" = 28, "under_y" = 12, "stock_x" = 19, "stock_y" = 13)

	fire_delay = 0.2 SECONDS
	burst_delay = 0.1 SECONDS
	extra_delay = 0.15 SECONDS
	accuracy_mult = 1.15
	damage_mult = 1.2
	damage_falloff_mult = 1.5
	wield_delay = 0.85 SECONDS
	aim_slowdown = 0.2
	scatter = 0

/obj/item/weapon/gun/rifle/icc_assaultcarbine/export
	name = "\improper L&S EM-88 突击卡宾枪"
	desc = "一把老旧、可靠但已过时的无托式步枪，通常出现在ICC星域，因为很久以前就已作为剩余物资处理，其中一些剩余型号有时会通过不正当手段流入TGMC星域。它最适合在近距离作战中快速清理角落，配有整体式前握把和无放大倍率的瞄准镜以提高精度并减少阻力。使用5.56x45mm NATO弹药。"
	icon_state = "l88_export"
	worn_icon_state = "l88_export"
	default_ammo_type = /obj/item/ammo_magazine/rifle/icc_assaultcarbine/export
//-------------------------------------------------------
//MG-60 General Purpose Machine Gun

/obj/item/weapon/gun/rifle/icc_mg
	name = "\improper ML-41 突击机枪"
	desc = "ML-41是一款ICCAF部队使用的极其轻量化的机枪，其重量在同级别武器中异常轻盈，使其能够用于快速机动，但代价是远距离伤害较低且通常散布较大。它使用10x26mm弹药箱。"
	icon = 'icons/obj/items/guns/machineguns64.dmi'
	icon_state = "minimi"
	worn_icon_state = "minimi"
	fire_animation = "minimi_fire"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/machineguns_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/machineguns_right_64.dmi',
	)
	inhand_x_dimension = 64
	inhand_y_dimension = 32

	caliber = CALIBER_10x26_CASELESS //codex
	max_shells = 200 //codex
	force = 30
	aim_slowdown = 0.85
	wield_delay = 0.95 SECONDS
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_mg60.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/T42_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/T42_reload.ogg'
	default_ammo_type = /obj/item/ammo_magazine/icc_mg
	allowed_ammo_types = list(/obj/item/ammo_magazine/icc_mg, /obj/item/ammo_magazine/icc_mg/belt)
	attachable_allowed = list(
		/obj/item/attachable/flashlight,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/stock/t60stock,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
	)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	gun_skill_category = SKILL_HEAVY_WEAPONS
	attachable_offset = list("muzzle_x" = 42, "muzzle_y" = 21,"rail_x" = 6, "rail_y" = 23, "under_x" = 26, "under_y" = 15, "stock_x" = 8, "stock_y" = 13)
	aim_fire_delay = 0.15 SECONDS
	aim_speed_modifier = 5

	fire_delay = 0.15 SECONDS
	damage_falloff_mult = 2.5
	burst_amount = 1
	accuracy_mult = 0.85
	accuracy_mult_unwielded = 0.4
	scatter = 5
	scatter_unwielded = 45
	movement_acc_penalty_mult = 6

/obj/item/weapon/gun/rifle/icc_mg/guard
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/heavy_barrel)

// VSD weapons
// L26

/obj/item/weapon/gun/rifle/vsd_lmg
	name = "\improper L26 支援机枪"
	desc = "辛迪加的主力通用机枪，使用5.56毫米弹药。它的设计看起来...有些过时，但依然可靠。能以毁灭性的后坐力快速开火，代价是移动速度降低。"
	icon = 'icons/obj/items/guns/machineguns64.dmi'
	icon_state = "l26"
	worn_icon_state = "l26"
	fire_animation = "l26_fire"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/machineguns_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/machineguns_right_64.dmi',
	)
	caliber = CALIBER_556X45 //codex
	max_shells = 200 //codex
	wield_delay = 1.4 SECONDS
	aim_slowdown = 0.95
	fire_sound = 'sound/weapons/guns/fire/famas.ogg'
	unload_sound = 'sound/weapons/guns/interact/ak47_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/ak47_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/ak47_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/vsd_mg
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/vsd_mg)
	inhand_x_dimension = 64
	inhand_y_dimension = 32

	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/buildasentry,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/foldable/bipod,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/attachable/reddot,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight/under,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	attachable_offset = list("muzzle_x" = 46, "muzzle_y" = 18,"rail_x" = 20, "rail_y" = 20, "under_x" = 31, "under_y" = 11, "stock_x" = 8, "stock_y" = 13)
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	gun_skill_category = SKILL_HEAVY_WEAPONS

	fire_delay = 0.15 SECONDS
	scatter = 5
	burst_amount = 1
	movement_acc_penalty_mult = 8

/obj/item/weapon/gun/rifle/vsd_lmg/standard
	starting_attachment_types = list(/obj/item/attachable/reddot, /obj/item/attachable/foldable/bipod, /obj/item/attachable/extended_barrel)

/obj/item/weapon/gun/rifle/vsd_lmg/engineer
	starting_attachment_types = list(/obj/item/attachable/foldable/bipod, /obj/item/attachable/compensator)

/obj/item/weapon/gun/rifle/vsd_lmg/juggernaut
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/foldable/bipod, /obj/item/attachable/extended_barrel)

// CC/67, the new C550!

/obj/item/weapon/gun/rifle/vsd_rifle
	name = "\improper CC/67 突击步枪"
	desc = "Crash Core的下一代突击步枪，使用10x27mm口径弹药。无论是战斗还是支援都表现出色，任何站在你面前的人都会感受到它的威力。"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	icon_state = "c550"
	worn_icon_state = "c550"
	fire_sound = 'sound/weapons/guns/fire/t21.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/deagle_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/m41a_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m41a_reload.ogg'
	aim_slowdown = 0.5
	wield_delay =  0.9 SECONDS
	max_shells = 30 //codex
	default_ammo_type = /obj/item/ammo_magazine/rifle/vsd_rifle
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/vsd_rifle)
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/scope,
		/obj/item/attachable/buildasentry,
		/obj/item/attachable/verticalgrip,
		/obj/item/weapon/gun/grenade_launcher/underslung/invisible,
	)

	attachable_offset = list("muzzle_x" = 63, "muzzle_y" = 19,"rail_x" = 27, "rail_y" = 23, "under_x" = 40, "under_y" = 15, "stock_x" = 8, "stock_y" = 13)
	burst_amount = 3
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	burst_delay = 0.25 SECONDS
	extra_delay = 0.15 SECONDS
	scatter = 0
	fire_delay = 0.35 SECONDS
	damage_mult = 0.5

/obj/item/weapon/gun/rifle/vsd_rifle/standard
	starting_attachment_types = list(/obj/item/attachable/reddot, /obj/item/attachable/verticalgrip, /obj/item/attachable/extended_barrel)

/obj/item/weapon/gun/rifle/vsd_rifle/medic
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/verticalgrip, /obj/item/attachable/suppressor)

// CC/74

/obj/item/weapon/gun/rifle/vsd_lmg_main
	name = "\improper CC/74 突击轻机枪"
	desc = "CC/74，VSD武器库中最新的突击轻机枪。采用7.62x39毫米口径，其冰冷的铁制准星所及之处，一切皆在它爆裂的威力下化为乌有。"
	icon = 'icons/obj/items/guns/machineguns64.dmi'
	icon_state = "c74"
	worn_icon_state = "c74"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/machineguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/machineguns_right_1.dmi',
	)
	caliber = CALIBER_762X39 //codex
	max_shells = 150  //codex
	wield_delay = 1.4 SECONDS
	aim_slowdown = 0.95
	fire_sound = 'sound/weapons/guns/fire/hmg.ogg'
	unload_sound = 'sound/weapons/guns/interact/minigun_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/minigun_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/minigun_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/vsd_mg_main
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/vsd_mg_main)

	attachable_allowed = list(
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/buildasentry,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/attachable/reddot,
		/obj/item/attachable/lasersight,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	attachable_offset = list("muzzle_x" = 62, "muzzle_y" = 19,"rail_x" = 26, "rail_y" = 25, "under_x" = 31, "under_y" = 11, "stock_x" = 8, "stock_y" = 13)
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	gun_skill_category = SKILL_HEAVY_WEAPONS

	fire_delay = 0.25 SECONDS
	scatter = 3
	burst_amount = 1
	movement_acc_penalty_mult = 8

/obj/item/weapon/gun/rifle/vsd_lmg_main/recoilcomp
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/compensator)

/obj/item/weapon/gun/rifle/vsd_carbine
	name = "\improper CC/77 突击卡宾枪"
	desc = "Crash Core公司的新一代突击卡宾枪，使用10x24mm无壳弹。无论是战斗还是支援都表现出色，足以让任何挡在你面前的人尝到苦头。"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	icon_state = "c77"
	worn_icon_state = "c77"
	fire_sound = 'sound/weapons/guns/fire/t21.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/deagle_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/m41a_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m41a_reload.ogg'
	aim_slowdown = 0.5
	wield_delay =  0.9 SECONDS
	max_shells = 45 //codex
	default_ammo_type = /obj/item/ammo_magazine/rifle/vsd_carbine
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/vsd_carbine)
	attachable_allowed = list(
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/scope,
		/obj/item/attachable/buildasentry,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/weapon/gun/grenade_launcher/underslung/invisible,
	)

	attachable_offset = list("muzzle_x" = 62, "muzzle_y" = 18,"rail_x" = 29, "rail_y" = 24, "under_x" = 50, "under_y" = 15, "stock_x" = 8, "stock_y" = 13)
	burst_amount = 3
	gun_firemode_list = list(GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	burst_delay = 0.1 SECONDS
	scatter = 0
	fire_delay = 0.2 SECONDS

/obj/item/weapon/gun/rifle/vsd_carbine/recoilcomp
	starting_attachment_types = list(/obj/item/attachable/reddot, /obj/item/attachable/angledgrip, /obj/item/attachable/compensator)

/obj/item/weapon/gun/rifle/vsd_carbine/suppressed
	starting_attachment_types = list(/obj/item/attachable/reddot, /obj/item/attachable/verticalgrip, /obj/item/attachable/suppressor)


//VSD breaching shotgun

/obj/item/weapon/gun/rifle/vsd_breaching
	name = "\improper CC/B/31 破门霰弹枪"
	desc = "维雅切斯拉夫安保小组的破门霰弹枪，发射12号口径破门独头弹。如果目标有护甲，这不会致命。"
	icon = 'icons/obj/items/guns/shotguns64.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/shotguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/shotguns_right_1.dmi',
	)
	icon_state = "cb31"
	worn_icon_state = "cb31"
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	reload_sound = 'sound/weapons/guns/interact/shotgun_cmb_insert.ogg'
	default_ammo_type = /obj/item/ammo_magazine/rifle/cb31
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/cb31)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
	)
	max_shells = 25 //codex
	item_map_variant_flags = NONE
	attachable_offset = list("muzzle_x" = 45, "muzzle_y" = 19,"rail_x" = 32, "rail_y" = 28, "under_x" = 36, "under_y" = 13, "stock_x" = 0, "stock_y" = 12)

	fire_delay = 1.5 SECONDS
	accuracy_mult = 1.15
	burst_amount = 1
	scatter = -2
	movement_acc_penalty_mult = 3

/obj/item/weapon/gun/rifle/vsd_breaching/standard
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness)

//-------------------------------------------------------
//.410 spas-15

/obj/item/weapon/gun/rifle/light_autoshotgun
	name = "\improper SH-410自动霰弹枪"
	desc = "SH-410霰弹枪是地球政府殖民地海军陆战队装备序列中的最新武器。在配发部队之前，该枪已被众多反恐机构广泛采用，在近距离交战中取得了显著成效。与16号口径相比，.410口径的弹丸威力较弱，更不用说12号口径了，但其更高的射速无疑能弥补这一不足。"
	icon_state = "sh410"
	worn_icon_state = "sh410"
	icon = 'icons/obj/items/guns/shotguns64.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/shotguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/shotguns_right_1.dmi',
	)
	gun_crosshair = 'icons/UI_Icons/gun_crosshairs/shotgun.dmi'
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_sh410.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/shotgun_empty.ogg'
	caliber = CALIBER_410_AUTOSHOTGUN //same as the MBX
	max_shells = 15 //vs 12 on ts15
	force = 20
	wield_delay =  0.8 SECONDS
	default_ammo_type = /obj/item/ammo_magazine/rifle/sh410_sabot
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/rifle/sh410_sabot,
		/obj/item/ammo_magazine/rifle/sh410_buckshot,
		/obj/item/ammo_magazine/rifle/sh410_tracker,
		/obj/item/ammo_magazine/rifle/sh410_ricochet,
		/obj/item/ammo_magazine/rifle/sh410_gas,
	)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/scope/mini, // sabot
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/gyro,
		/obj/item/attachable/motiondetector,
		/obj/item/weapon/gun/flamer/hydro_cannon,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/attachable/suppressor, // please forward all complaints to atropos (he asked me to)
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE)
	attachable_offset = list("muzzle_x" = 46, "muzzle_y" = 18,"rail_x" = 26, "rail_y" = 21, "under_x" = 36, "under_y" = 15, "stock_x" = 12, "stock_y" = 18)
	gun_skill_category = SKILL_SHOTGUNS
	fire_delay = 0.6 SECONDS
	burst_amount = 3
	burst_scatter_mult = 2
	burst_delay = 0.3 SECONDS
	extra_delay = 1.3 SECONDS
	accuracy_mult = 1
	scatter = 2
	burst_scatter_mult = 2
	damage_falloff_mult = 1

//-------------------------------------------------------
//SG-60 PMC Smart Machine Gun

/obj/item/weapon/gun/rifle/pmc_gpmg
	name = "\improper SG-60 太空金属智能机枪"
	desc = "Raummetall-KT SG-60是纳米传讯最新的智能机枪型号，安装在通用的MG-60上。与已知的SG-29相比，这款武器的射速要高得多，但代价是牺牲了精度。常见于身着重型外骨骼装甲的纳米传讯承包商手中。配有未组装的枪管充电器。需要特殊训练，且无法关闭敌我识别系统。使用10x26mm弹药。"
	icon = 'icons/obj/items/guns/machineguns64.dmi'
	icon_state = "sg60"
	worn_icon_state = "sg60"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/machineguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/machineguns_right_1.dmi',
	)
	fire_sound = SFX_GUN_SMARTGPMG
	force = 30
	aim_slowdown = 0.8
	wield_delay = 1.5 SECONDS
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/T42_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/T42_reload.ogg'
	default_ammo_type = /obj/item/ammo_magazine/smart_gpmg
	allowed_ammo_types = list(/obj/item/ammo_magazine/smart_gpmg)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
	)

	gun_features_flags = GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_IFF|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	gun_skill_category = SKILL_SMARTGUN //Uses SG skill for the penalties.
	attachable_offset = list("muzzle_x" = 46, "muzzle_y" = 21,"rail_x" = 15, "rail_y" = 23, "under_x" = 31, "under_y" = 14, "stock_x" = 12, "stock_y" = 13)

	fire_delay = 0.15 SECONDS
	burst_amount = 0
	accuracy_mult_unwielded = 0.5
	accuracy_mult = 1.1
	scatter = 4
	scatter_unwielded = 40
	movement_acc_penalty_mult = 4
	damage_falloff_mult = 0.3
	shell_speed_mod = 2

/obj/item/weapon/gun/rifle/pmc_gpmg/gunner

	starting_attachment_types = list(/obj/item/attachable/motiondetector, /obj/item/attachable/lasersight,)

//-------------------------------------------------------
//PR-416 PMC rifle

/obj/item/weapon/gun/rifle/m416
	name = "\improper RA-SH-416 突击步枪"
	desc = "RA-SH-416 RivArms是纳米传讯承包商的标准制式步枪。配备内置下挂手雷发射器。使用10x25mm弹药。"
	icon = 'icons/obj/items/guns/rifles64.dmi'
	icon_state = "m416"
	worn_icon_state = "m416"
	fire_sound = 'sound/weapons/guns/fire/t40.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/type71_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/type71_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/type71_cocked.ogg'
	caliber = CALIBER_127X55 //codex
	max_shells = 40 //codex
	force = 20
	wield_delay = 0.6 SECONDS
	aim_slowdown = 0.4
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/rifle/m416
	)
	default_ammo_type = /obj/item/ammo_magazine/rifle/m416
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/mini,
		/obj/item/weapon/gun/grenade_launcher/underslung/invisible,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	starting_attachment_types = list(/obj/item/weapon/gun/grenade_launcher/underslung/invisible)
	attachable_offset = list("muzzle_x" = 46, "muzzle_y" = 20,"rail_x" = 23, "rail_y" = 26, "under_x" = 25, "under_y" = 17, "stock_x" = 18, "stock_y" = 15)

	fire_delay = 0.25 SECONDS
	burst_delay = 0.1 SECONDS
	extra_delay = 0.15 SECONDS
	accuracy_mult = 1
	scatter = -1
	recoil_unwielded = 7
	burst_amount = 2
	shell_speed_mod = 1
	damage_falloff_mult = 0.3

/obj/item/weapon/gun/rifle/m416/pmc_standard
	starting_attachment_types = list(/obj/item/weapon/gun/grenade_launcher/underslung/invisible, /obj/item/attachable/magnetic_harness,)

/obj/item/weapon/gun/rifle/m416/elite
	name = "\improper RA-SH-416E 突击步枪"
	desc = "RA-SH-416E RivArms是纳米传讯高级承包商标准配发步枪的改进型号。配备内置枪管充电器和下挂手雷发射器。使用10x25mm弹药。"
	icon_state = "m416e"
	worn_icon_state = "m416e"

	damage_mult = 1.25
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	burst_amount = 0
	shell_speed_mod = 2

/obj/item/weapon/gun/rifle/m416/elite/pmc_officer
	starting_attachment_types = list(/obj/item/weapon/gun/grenade_launcher/underslung/invisible, /obj/item/attachable/magnetic_harness, /obj/item/attachable/bayonet/converted,)
