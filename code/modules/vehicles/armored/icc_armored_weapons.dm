// Fallow weapons are below.
/obj/item/armored_weapon/icc_lvrt_sarden
	name = "\improper EM-2600 '萨登'自动炮"
	desc = "LVRT'休耕地'的30毫米自动炮。一门威力惊人的自动炮。遗憾的是，由于该系统相关的预算削减浪潮，其弹链供弹系统已不复存在。它使用4发弹夹供弹。"
	icon_state = "icc_lvrt_autocannon"
	fire_sound = SFX_AC_FIRE
	interior_fire_sound = list('sound/vehicles/weapons/tank_autocannon_interior_fire_1.ogg', 'sound/vehicles/weapons/tank_autocannon_interior_fire_2.ogg')
	ammo = /obj/item/ammo_magazine/tank/sarden_clip
	accepted_ammo = list(/obj/item/ammo_magazine/tank/sarden_clip, /obj/item/ammo_magazine/tank/sarden_clip/high_explosive)
	fire_mode = GUN_FIREMODE_AUTOMATIC
	variance = 2
	projectile_delay = 0.65 SECONDS
	rearm_time = 0.5 SECONDS
	hud_state_empty = "rifle_empty"

/obj/item/armored_weapon/icc_lvrt_cannon
	name = "\improper EM-2500 低速加农炮"
	desc = "LVRT'休耕地'使用的76毫米低速火炮。射速缓慢，但爆炸威力强劲。使用76毫米炮弹装填。"
	icon_state = "icc_lvrt_cannon"
	fire_sound = SFX_AC_FIRE
	interior_fire_sound = list('sound/vehicles/weapons/tank_autocannon_interior_fire_1.ogg', 'sound/vehicles/weapons/tank_autocannon_interior_fire_2.ogg')
	ammo = /obj/item/ammo_magazine/tank/icc_lowvel_cannon
	accepted_ammo = list(/obj/item/ammo_magazine/tank/icc_lowvel_cannon, /obj/item/ammo_magazine/tank/icc_lowvel_cannon/high_explosive)
	variance = 0
	projectile_delay = 1.5 SECONDS
	rearm_time = 1.5 SECONDS
	hud_state_empty = "rifle_empty"

// generic coax

/obj/item/armored_weapon/icc_coaxial
	name = "EM-94同轴链式机枪（10x26mm）"
	desc = "一条带有ICC标记的带式供弹同轴机枪，喷射铅弹。需要车辆的枪管护套和动力系统才能以任何形式使用。可使用标准ML-41弹药箱或车辆专用弹药箱。"
	icon_state = "icc_lvrt_coax"
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_mg60.ogg'
	armored_weapon_flags = MODULE_SECONDARY|MODULE_FIXED_FIRE_ARC
	ammo = /obj/item/ammo_magazine/icc_mg
	accepted_ammo = list(/obj/item/ammo_magazine/icc_mg)
	fire_mode = GUN_FIREMODE_AUTOMATIC
	projectile_delay = 0.15 SECONDS
	variance = 5
	rearm_time = 3 SECONDS
	hud_state_empty = "rifle_empty"
