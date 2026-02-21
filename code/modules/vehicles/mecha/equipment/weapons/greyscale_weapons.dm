/*!
 * Greyscale mech equipment file
 *
 * Basically all equipment that you can add onto a mech should go here
 * naming scheme is [Greek titan/titan relative] + [weapon type]
 * when setting variance remember that it's negatively modified by the arm it's attached to
 * note that weapon vars are not the same as guns
 * Notably:
 * No autoburst var, uses basic var instead
 * only one firemode per gun
 * equip_cooldown gets overriden unless propjectile is thrown
 */

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/pistol
	name = "\improper 科特斯手枪"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "机甲可用的最小型武器。威力不大，但能让机甲获得更高的机动性。"
	icon_state = "pistol"
	fire_sound = 'sound/mecha/weapons/mech_pistol.ogg'
	muzzle_iconstate = "muzzle_flash"
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(36,30), "S" = list(-2,16), "E" = list(44,16), "W" = list(-13,36)),
		MECHA_L_ARM = list("N" = list(-4,30), "S" = list(32,16), "E" = list(44,36), "W" = list(-13,16)),
	)
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	ammotype = /datum/ammo/bullet/pistol/mech
	max_integrity = 500
	projectiles = 20
	projectiles_cache = 400
	projectiles_cache_max = 400
	variance = 10
	slowdown = 0
	projectile_delay = 0.3 SECONDS
	harmful = TRUE
	ammo_type = MECHA_AMMO_PISTOL
	hud_icons = list("pistol", "pistol_empty")
	fire_mode = GUN_FIREMODE_SEMIAUTO

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/burstpistol
	name = "\improper 克里乌斯连发手枪"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "为机甲配备的连发武器。相比大型武器，机动性和精度更高，但伤害较低。"
	icon_state = "burstpistol"
	fire_sound = 'sound/mecha/weapons/mech_pistol.ogg'
	muzzle_iconstate = "muzzle_flash"
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(36,30), "S" = list(-2,8), "E" = list(52,8), "W" = list(-21,28)),
		MECHA_L_ARM = list("N" = list(-4,30), "S" = list(32,8), "E" = list(52,28), "W" = list(-20,8)),
	)
	ammotype = /datum/ammo/bullet/pistol/mech/burst
	max_integrity = 450
	projectiles = 42
	projectiles_cache = 840
	projectiles_cache_max = 840
	variance = 15
	slowdown = 0.1
	projectile_delay = 0.6 SECONDS
	burst_amount = 3
	projectile_burst_delay = 0.1 SECONDS
	harmful = TRUE
	ammo_type = MECHA_AMMO_BURSTPISTOL
	hud_icons = list("pistol_light", "pistol_empty")
	fire_mode = GUN_FIREMODE_AUTOBURST

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/smg
	name = "\improper 科俄斯冲锋枪"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "作为最小的自动射击武器，它提供了比大多数大型同类武器更好的机动性，但火力较弱。"
	icon_state = "smg"
	muzzle_iconstate = "muzzle_flash"
	fire_sound = 'sound/mecha/weapons/mech_smg.ogg'
	mech_flags = EXOSUIT_MODULE_GREYSCALE|EXOSUIT_MODULE_VENDABLE
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(36,30), "S" = list(-2,12), "E" = list(54,14), "W" = list(-20,34)),
		MECHA_L_ARM = list("N" = list(-4,30), "S" = list(32,12), "E" = list(52,34), "W" = list(-22,14)),
	)
	flash_offsets_core = list(
		MECHA_R_ARM = list("N" = list(52,46), "S" = list(14,29), "E" = list(70,32), "W" = list(-13,34)),
		MECHA_L_ARM = list("N" = list(12,46), "S" = list(50,29), "E" = list(77,33), "W" = list(-8,32)),
	)
	ammotype = /datum/ammo/bullet/smg/mech
	max_integrity = 400
	projectiles = 60
	projectiles_cache = 780
	projectiles_cache_max = 780
	variance = 15
	projectile_delay = 0.15 SECONDS
	slowdown = 0
	rearm_time = 1.5 SECONDS
	harmful = TRUE
	weight = 65
	ammo_type = MECHA_AMMO_SMG
	hud_icons = list("smg", "smg_empty")
	fire_mode = GUN_FIREMODE_AUTOMATIC
	cooldown_key = MECH_COOLDOWN_KEY_RAPIDFIRE

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/burstrifle
	name = "\improper 忒提斯点射步枪"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "中型机甲突击武器。类似克洛诺斯突击步枪，但以点射模式开火。"
	icon_state = "burstrifle"
	fire_sound = 'sound/mecha/weapons/mech_rifle.ogg'
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(36,30), "S" = list(-2,-6), "E" = list(64,17), "W" = list(-33,37)),
		MECHA_L_ARM = list("N" = list(-4,30), "S" = list(32,-6), "E" = list(63,37), "W" = list(-34,17)),
	)
	ammotype = /datum/ammo/bullet/rifle/mech/burst
	max_integrity = 400
	projectiles = 72
	projectiles_cache = 720
	projectiles_cache_max = 720
	variance = 15
	projectile_delay = 0.6 SECONDS
	burst_amount = 3
	projectile_burst_delay = 0.2 SECONDS
	slowdown = 0
	harmful = TRUE
	ammo_type = MECHA_AMMO_BURSTRIFLE
	hud_icons = list("hivelo", "hivelo_empty")
	fire_mode = GUN_FIREMODE_AUTOBURST

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/assault_rifle
	name = "\improper 克罗努斯突击步枪"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "地球政府殖民地海军陆战队机甲部队标配的加大尺寸多用途步枪。"
	icon_state = "assaultrifle"
	fire_sound = 'sound/mecha/weapons/mech_rifle.ogg'
	mech_flags = EXOSUIT_MODULE_GREYSCALE|EXOSUIT_MODULE_VENDABLE
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(36,30), "S" = list(-2,-6), "E" = list(64,17), "W" = list(-34,37)),
		MECHA_L_ARM = list("N" = list(-4,30), "S" = list(32,-6), "E" = list(64,37), "W" = list(-34,17)),
	)
	flash_offsets_core = list(
		MECHA_R_ARM = list("N" = list(52,46), "S" = list(14,29), "E" = list(70,29), "W" = list(-19,34)),
		MECHA_L_ARM = list("N" = list(12,46), "S" = list(50,29), "E" = list(70,34), "W" = list(-19,29)),
	)
	ammotype = /datum/ammo/bullet/rifle/mech
	max_integrity = 400
	projectiles = 30
	projectiles_cache = 390
	projectiles_cache_max = 390
	variance = 10
	projectile_delay = 0.25 SECONDS
	slowdown = 0
	harmful = TRUE
	rearm_time = 3 SECONDS
	weight = 65
	ammo_type = MECHA_AMMO_RIFLE
	hud_icons = list("rifle", "rifle_empty")
	fire_mode = GUN_FIREMODE_AUTOMATIC
	cooldown_key = MECH_COOLDOWN_KEY_RAPIDFIRE

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/shotgun
	name = "\improper 菲比霰弹枪"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "地球政府殖民地海军陆战队的经典武器，但更大更强！发射加号尺寸的鹿弹，在近战中造成高额伤害。"
	icon_state = "shotgun"
	fire_sound = 'sound/mecha/weapons/mech_shotgun.ogg'
	mech_flags = EXOSUIT_MODULE_GREYSCALE|EXOSUIT_MODULE_VENDABLE
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(36,30), "S" = list(-2,-4), "E" = list(61,16), "W" = list(-31,36)),
		MECHA_L_ARM = list("N" = list(-4,30), "S" = list(32,-4), "E" = list(61,36), "W" = list(-31,16)),
	)
	flash_offsets_core = list(
		MECHA_R_ARM = list("N" = list(52,46), "S" = list(12,25), "E" = list(84,29), "W" = list(-19,29)),
		MECHA_L_ARM = list("N" = list(12,46), "S" = list(52,25), "E" = list(84,32), "W" = list(-19,34)),
	)
	ammotype = /datum/ammo/bullet/shotgun/mech
	max_integrity = 350
	projectiles = 9
	projectiles_cache = 90
	projectiles_cache_max = 90
	variance = 30
	projectile_delay = 2.5 SECONDS
	slowdown = 0
	harmful = TRUE
	rearm_time = 4 SECONDS
	weight = 80
	ammo_type = MECHA_AMMO_SHOTGUN
	hud_icons = list("shotgun_buckshot", "shotgun_empty")
	fire_mode = GUN_FIREMODE_SEMIAUTO
	cooldown_key = MECH_COOLDOWN_KEY_HIGHALPHASTRIKE

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/greyscale_lmg
	name = "\improper 布里阿柔斯轻机枪"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "一个巨大的金属块，发射底排式轻机枪子弹。就像标准轻机枪一样，但更大、更好、更重。"
	icon_state = "lmg"
	fire_sound = 'sound/mecha/weapons/mech_lmg.ogg'
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(36,30), "S" = list(-2,-6), "E" = list(64,17), "W" = list(-34,37)),
		MECHA_L_ARM = list("N" = list(-4,30), "S" = list(32,-6), "E" = list(64,37), "W" = list(-34,17)),
	)
	ammotype = /datum/ammo/bullet/rifle/mech/lmg
	max_integrity = 400
	projectiles = 120
	projectiles_cache = 1200
	projectiles_cache_max = 1200
	variance = 25
	projectile_delay = 0.15 SECONDS
	slowdown = 0.3
	harmful = TRUE
	ammo_type = MECHA_AMMO_GREY_LMG
	hud_icons = list("rifle_heavy", "rifle_empty")
	fire_mode = GUN_FIREMODE_AUTOMATIC

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/light_cannon
	name = "\improper 莱托轻型自动炮"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "一种弹鼓供弹的自动炮，发射破片弹，弹道命中时会在前方锥形区域内爆炸。对集群敌人特别有效。"
	icon_state = "lightcannon"
	fire_sound = 'sound/mecha/weapons/mech_light_cannon.ogg'
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(36,30), "S" = list(-2,-15), "E" = list(80,4), "W" = list(-50,24)),
		MECHA_L_ARM = list("N" = list(-4,30), "S" = list(32,-15), "E" = list(80,24), "W" = list(-50,4)),
	)
	ammotype = /datum/ammo/tx54/mech
	max_integrity = 400
	projectiles = 30
	projectiles_cache = 300
	projectiles_cache_max = 300
	variance = 20
	projectile_delay = 0.7 SECONDS
	slowdown = 0.4
	harmful = TRUE
	ammo_type = MECHA_AMMO_LIGHTCANNON
	hud_icons = list("grenade_airburst", "grenade_empty")
	fire_mode = GUN_FIREMODE_AUTOMATIC

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser_rifle
	name = "\improper 埃该翁激光步枪"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "标准机甲激光步枪。无需补充弹药，发射高精度激光，能够立即命中目标，但相比同类武器造成的伤害略低。"
	icon_state = "lasermg"
	fire_sound = 'sound/mecha/weapons/mech_laser_heavy.ogg'
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(33,68), "S" = list(-2,-6), "E" = list(80,13), "W" = list(-50,33)),
		MECHA_L_ARM = list("N" = list(0,68), "S" = list(32,-6), "E" = list(80,33), "W" = list(-50,13)),
	)
	ammotype = /datum/ammo/energy/lasgun/marine/mech
	max_integrity = 400
	energy_drain = 10
	variance = 0
	projectile_delay = 0.4 SECONDS
	slowdown = 0.4
	harmful = TRUE
	fire_mode = GUN_FIREMODE_AUTOMATIC

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser_projector
	name = "\improper 盖吉斯激光投射器"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "激光投影器，能够进行点射。无需补充弹药，发射高精度激光，可立即命中目标，但与同类武器相比造成的伤害略低。"
	icon_state = "laserrifle"
	fire_sound = 'sound/mecha/weapons/mech_laser_heavy.ogg'
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(33,52), "S" = list(-2,-6), "E" = list(75,11), "W" = list(-45,31)),
		MECHA_L_ARM = list("N" = list(0,52), "S" = list(32,-6), "E" = list(75,31), "W" = list(-45,11)),
	)
	ammotype = /datum/ammo/energy/lasgun/marine/mech/burst
	max_integrity = 400
	energy_drain = 5
	variance = 0
	projectile_delay = 0.6 SECONDS
	burst_amount = 3
	projectile_burst_delay = 0.2 SECONDS
	slowdown = 0.4
	harmful = TRUE
	fire_mode = GUN_FIREMODE_AUTOBURST

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser_smg
	name = "\improper 记忆女神激光冲锋枪"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "标准机甲激光冲锋枪。无需补充弹药，发射高精度激光，可立即命中目标，但相比同类武器伤害略低。比激光步枪更灵活。"
	icon_state = "lasersmg"
	fire_sound = 'sound/mecha/weapons/mech_laser_light.ogg'
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(33,48), "S" = list(-2,6), "E" = list(67,11), "W" = list(-37,31)),
		MECHA_L_ARM = list("N" = list(0,48), "S" = list(32,6), "E" = list(67,31), "W" = list(-37,11)),
	)
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	ammotype = /datum/ammo/energy/lasgun/marine/mech/smg
	max_integrity = 400
	energy_drain = 5
	variance = 0
	projectile_delay = 0.2 SECONDS
	slowdown = 0.2
	harmful = TRUE
	fire_mode = GUN_FIREMODE_AUTOMATIC

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/heavy_cannon
	name = "\improper 忒弥斯重型加农炮"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "没有什么比装在战争机器人上的坦克炮更能表达'下地狱去吧'的意思了。尽管每发之后都需要重新装填，但威力巨大。"
	icon_state = "heavycannon"
	fire_sound = 'sound/mecha/weapons/mech_heavy_cannon.ogg'
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(36,48), "S" = list(-1,1), "E" = list(72,32), "W" = list(-42,48)),
		MECHA_L_ARM = list("N" = list(-4,48), "S" = list(33,1), "E" = list(72,48), "W" = list(-42,32)),
	)
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	ammotype = /datum/ammo/bullet/apfsds
	max_integrity = 400
	projectiles = 1
	projectiles_cache = 15
	projectiles_cache_max = 15
	variance = 0
	projectile_delay = 1 SECONDS
	slowdown = 1.2
	harmful = TRUE
	ammo_type = MECHA_AMMO_HEAVYCANNON
	hud_icons = list("shell_apcr", "shell_empty")
	fire_mode = GUN_FIREMODE_SEMIAUTO

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/heavy_cannon/apply_weapon_modifiers(atom/movable/projectile/projectile_to_fire, mob/firer)
	. = ..()
	projectile_to_fire.def_zone = BODY_ZONE_CHEST //no delimb spam

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/minigun
	name = "\improper 瑞亚火神炮"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "当你能够躲在弹幕之后时，机动性就不再是必需品！发射前需要蓄力。"
	icon_state = "minigun"
	fire_sound = 'sound/mecha/weapons/mech_minigun.ogg'
	windup_sound = 'sound/weapons/guns/fire/tank_minigun_start.ogg'
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(35,60), "S" = list(-2,-11), "E" = list(64,0), "W" = list(-34,20)),
		MECHA_L_ARM = list("N" = list(-2,60), "S" = list(32,-11), "E" = list(64,20), "W" = list(-34,0)),
	)
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	ammotype = /datum/ammo/bullet/minigun/mech
	max_integrity = 400
	projectiles = 200
	projectiles_cache = 800
	projectiles_cache_max = 800
	variance = 35
	projectile_delay = 1.5
	slowdown = 0.7
	windup_delay = 0.5 SECONDS
	harmful = TRUE
	ammo_type = MECHA_AMMO_MINIGUN
	hud_icons = list("smartgun", "smartgun_empty")
	fire_mode = GUN_FIREMODE_AUTOMATIC

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/sniper
	name = "\improper 海洋狙击步枪"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "一款仅限机甲使用的反坦克步枪。最初设计用于对抗小型装甲车辆，但对体型相近的生物同样有效。配备敌我识别系统。"
	icon_state = "sniper"
	fire_sound = 'sound/mecha/weapons/mech_sniper.ogg'
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(36,30), "S" = list(-2,-14), "E" = list(80,0), "W" = list(-50,22)),
		MECHA_L_ARM = list("N" = list(-4,30), "S" = list(32,-14), "E" = list(80,22), "W" = list(-50,0)),
	)
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	ammotype = /datum/ammo/bullet/sniper/mech
	max_integrity = 200
	projectiles = 15
	projectiles_cache = 90
	projectiles_cache_max = 90
	variance = -15
	projectile_delay = 1 SECONDS
	slowdown = 0.6
	harmful = TRUE
	ammo_type = MECHA_AMMO_SNIPER
	hud_icons = list("sniper_supersonic", "sniper_empty")
	fire_mode = GUN_FIREMODE_SEMIAUTO

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/heavyrocket
	name = "\improper 亥伯龙重型火箭发射器"
	desc = "地球政府殖民地海军陆战队对于'爆炸越大越好'这一问题的最终答案。发射重型穿甲火箭。"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	icon_state = "rocketlauncher"
	fire_sound = 'sound/mecha/weapons/mech_rpg.ogg'
	mech_flags = EXOSUIT_MODULE_GREYSCALE|EXOSUIT_MODULE_VENDABLE
	equipment_slot = MECHA_BACK
	ammotype = /datum/ammo/rocket/mech/heavy
	max_integrity = 350
	projectiles = 1
	projectiles_cache = 10
	projectiles_cache_max = 10
	projectile_delay = 6 SECONDS
	variance = 0
	equip_cooldown = 2 SECONDS
	weight = 130
	slowdown = 0
	rearm_time = 5 SECONDS
	windup_delay = 1 SECONDS
	ammo_type = MECHA_AMMO_RPG
	hud_icons = list("rocket_he", "rocket_empty")
	fire_mode = GUN_FIREMODE_SEMIAUTO

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/flamethrower
	name = "\improper 赫利俄斯喷火器"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "一种专为机甲设计的喷火器。机动性较差，但额外的凝固汽油足以弥补这一缺陷。"
	icon_state = "flamer"
	fire_sound = 'sound/mecha/weapons/mech_flamer.ogg'
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(36,30), "S" = list(-2,-11), "E" = list(77,3), "W" = list(-47,23)),
		MECHA_L_ARM = list("N" = list(-4,30), "S" = list(32,-11), "E" = list(77,23), "W" = list(-47,3)),
	)
	flash_offsets_core = list(
		MECHA_R_ARM = list("N" = list(52,46), "S" = list(11,25), "E" = list(84,29), "W" = list(-19,29)),
		MECHA_L_ARM = list("N" = list(12,46), "S" = list(51,25), "E" = list(84,32), "W" = list(-19,34)),
	)
	mech_flags = EXOSUIT_MODULE_GREYSCALE|EXOSUIT_MODULE_VENDABLE
	ammotype = /datum/ammo/flamethrower/mech_flamer
	max_integrity = 250
	projectiles = 10
	projectiles_cache = 60
	projectiles_cache_max = 60
	variance = 10
	projectile_delay = 2 SECONDS
	slowdown = 0
	harmful = TRUE
	weight = 90
	ammo_type = MECHA_AMMO_FLAMER
	hud_icons = list("flame", "flame_empty")
	fire_mode = GUN_FIREMODE_AUTOMATIC

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/rpg
	name = "\improper 土卫八导弹舱"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "一个机甲导弹舱。备用弹药不多，需要频繁从外部补充。不过嘛，爆炸导弹一路走起！"
	icon_state = "rpg"
	fire_sound = 'sound/mecha/weapons/mech_rpg.ogg'
	flash_offsets = list(
		MECHA_R_ARM = list("N" = list(36,48), "S" = list(-1,1), "E" = list(56,20), "W" = list(-26,36)),
		MECHA_L_ARM = list("N" = list(-4,48), "S" = list(33,1), "E" = list(56,36), "W" = list(-26,20)),
	)
	flash_offsets_core = list(
		MECHA_R_ARM = list("N" = list(52,46), "S" = list(12,25), "E" = list(84,29), "W" = list(-19,29)),
		MECHA_L_ARM = list("N" = list(12,46), "S" = list(52,25), "E" = list(84,32), "W" = list(-19,34)),
	)
	mech_flags = EXOSUIT_MODULE_GREYSCALE|EXOSUIT_MODULE_VENDABLE
	ammotype = /datum/ammo/rocket/mech
	max_integrity = 400
	projectiles = 2
	projectiles_cache = 20
	projectiles_cache_max = 20
	variance = 15
	projectile_delay = 5 SECONDS
	slowdown = 0
	weight = 95
	rearm_time = 4 SECONDS
	windup_delay = 0.5 SECONDS
	harmful = TRUE
	ammo_type = MECHA_AMMO_RPG
	hud_icons = list("rocket_he", "rocket_empty")
	fire_mode = GUN_FIREMODE_SEMIAUTO
	cooldown_key = MECH_COOLDOWN_KEY_HIGHALPHASTRIKE

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/microrocket
	name = "\improper 阿斯特里亚微型火箭吊舱"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "一个机甲微型导弹舱。发射一连串微型火箭，可自动追踪目标。"
	icon_state = "tow"
	fire_sound = 'sound/mecha/weapons/mech_rpg.ogg'
	flash_offsets_core = list(
		MECHA_R_BACK = list("N" = list(40,60), "S" = list(22,55), "E" = list(26,55), "W" = list(32,62)),
		MECHA_L_BACK = list("N" = list(22,60), "S" = list(40,55), "E" = list(35,62), "W" = list(39,55)),
	)
	mech_flags = EXOSUIT_MODULE_GREYSCALE|EXOSUIT_MODULE_VENDABLE
	equipment_slot = MECHA_BACK
	ammotype = /datum/ammo/rocket/homing/microrocket/mech
	max_integrity = 400
	projectiles = 6
	projectiles_cache = 48
	projectiles_cache_max = 48
	variance = 20
	projectile_delay = 6 SECONDS
	burst_amount = 3
	projectile_burst_delay = 0.2 SECONDS
	slowdown = 0
	weight = 90
	rearm_time = 8 SECONDS
	harmful = TRUE
	ammo_type = MECHA_AMMO_RPG
	hud_icons = list("rocket_he", "rocket_empty")
	fire_mode = GUN_FIREMODE_BURSTFIRE

//////////////////////////
//NON GUNS BEYOND HERE
//////////////////////////

#define LASER_DASH_RANGE_NORMAL 2
#define LASER_DASH_RANGE_ENHANCED 5

/obj/item/mecha_parts/mecha_equipment/laser_sword
	name = "\improper 明亮激光剑刃"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	desc = "一种由等离子体制成的专用机甲激光刃。其紧凑的尺寸允许快速、短程的攻击。激活时，会使腿部执行器过载向前冲刺，然后用超热的等离子体光束进行切割。"
	icon_state = "lasersword"
	mech_flags = EXOSUIT_MODULE_GREYSCALE|EXOSUIT_MODULE_VENDABLE
	max_integrity = 400
	slowdown = 0
	harmful = TRUE
	equip_cooldown = 5 SECONDS
	energy_drain = 100
	range = MECHA_MELEE|MECHA_RANGED
	force = 200
	weight = 60
	var/image/slash_extra_image
	///ravager slash VFX but red
	var/obj/effect/abstract/particle_holder/particle_holder
	/// holder var for the mob that is attacking right now
	var/mob/cutter

/obj/item/mecha_parts/mecha_equipment/laser_sword/action_checks(atom/target, ignore_cooldown)
	. = ..()
	if(!.)
		return
	if(chassis.zoom_mode)
		to_chat(chassis.occupants, "[icon2html(src, chassis.occupants)][span_warning("Unable to dash while in zoom mode!")]")
		return FALSE
	if(cutter)
		to_chat(chassis.occupants, "[icon2html(src, chassis.occupants)][span_warning("Already in use!")]")
		return FALSE

/obj/item/mecha_parts/mecha_equipment/laser_sword/action(mob/source, atom/target, list/modifiers)
	if(!action_checks(target))
		return
	//melee swipe, no need to dash
	if(chassis.Adjacent(target))
		execute_melee(source, modifiers)
		return ..()

	//try dash to target
	var/laser_dash_range = HAS_TRAIT(chassis, TRAIT_MELEE_CORE) ? LASER_DASH_RANGE_ENHANCED : LASER_DASH_RANGE_NORMAL

	chassis.add_filter("dash_blur", 1, radial_blur_filter(0.3))
	if(!istype(chassis, /obj/vehicle/sealed/mecha/combat/greyscale/core))
		icon_state += "_on"
		chassis.update_appearance(UPDATE_ICON)
	else
		var/obj/vehicle/sealed/mecha/combat/greyscale/core/slasher = chassis
		var/hand_used = slasher.equip_by_category[MECHA_L_ARM] == src ? "_left" : "_right"
		var/image_iconstate = "active" + icon_state + hand_used
		if(chassis.leg_overload_mode)
			image_iconstate = "b_" + image_iconstate
		slash_extra_image = image('icons/mecha/mech_core_weapons.dmi', null, image_iconstate)
		chassis.add_overlay(slash_extra_image)
	new /obj/effect/temp_visual/after_image(chassis.loc, chassis)
	RegisterSignal(chassis, COMSIG_MOVABLE_POST_THROW, PROC_REF(end_dash))
	cutter = source
	chassis.atom_flags |= DIRLOCK
	RegisterSignal(chassis, COMSIG_MOVABLE_MOVED, PROC_REF(drop_afterimage))
	RegisterSignal(chassis, COMSIG_MOVABLE_BUMP, PROC_REF(on_bump))
	chassis.throw_at(target, laser_dash_range, 1)
	return ..()

/obj/item/mecha_parts/mecha_equipment/laser_sword/attack(mob/living/M, mob/living/user)
	var/user_target_zone = user.zone_selected //stops 1 hit delimbs
	user.zone_selected = BODY_ZONE_CHEST
	. = ..()
	user.zone_selected = user_target_zone

///signal handler, drops afterimage every move executed while dashing
/obj/item/mecha_parts/mecha_equipment/laser_sword/proc/drop_afterimage(datum/source)
	SIGNAL_HANDLER
	new /obj/effect/temp_visual/after_image(chassis.loc, chassis)

///Wrapper for mob bump attacks mid lunge
/obj/item/mecha_parts/mecha_equipment/laser_sword/proc/on_bump(datum/source, atom/bumped)
	SIGNAL_HANDLER
	if(!ismob(bumped))
		return
	INVOKE_ASYNC(src, PROC_REF(do_bump_attack), bumped)
	return COMPONENT_BUMP_RESOLVED

///Hits a mob in the way
/obj/item/mecha_parts/mecha_equipment/laser_sword/proc/do_bump_attack(mob/living/bumped_mob)
	bumped_mob.attackby(src, cutter)

///Ends dash and executes attack
/obj/item/mecha_parts/mecha_equipment/laser_sword/proc/end_dash(datum/source)
	SIGNAL_HANDLER
	UnregisterSignal(source, list(COMSIG_MOVABLE_POST_THROW, COMSIG_MOVABLE_MOVED, COMSIG_MOVABLE_BUMP))
	chassis.remove_filter("dash_blur")
	icon_state = initial(icon_state)
	chassis.cut_overlay(slash_extra_image)
	chassis.update_appearance(UPDATE_ICON)
	execute_melee(cutter)
	cutter = null
	chassis.atom_flags &= ~DIRLOCK

///executes a melee attack in the direction that the mech is facing
/obj/item/mecha_parts/mecha_equipment/laser_sword/proc/execute_melee(mob/source, list/modifiers)
	var/list/turf/targets
	targets = list(get_step(chassis, chassis.dir), get_step(chassis, turn(chassis.dir, 45)), get_step(chassis, turn(chassis.dir, -45)))
	if(!targets[1])
		return
	playsound(chassis, 'sound/mecha/weapons/laser_sword.ogg', 30)

	var/old_intent = source.a_intent
	source.a_intent = INTENT_HARM

	particle_holder = new(get_turf(chassis), /particles/ravager_slash)
	particle_holder.particles.color = COLOR_RED
	QDEL_NULL_IN(src, particle_holder, 5)
	particle_holder.particles.rotation += dir2angle(chassis.dir)
	switch(chassis.dir) // There's no shared logic here because sprites are magical.
		if(NORTH) // Gotta define stuff for each angle so it looks good.
			particle_holder.particles.position = list(8, 4)
			particle_holder.particles.velocity = list(0, 20)
		if(EAST)
			particle_holder.particles.position = list(3, -8)
			particle_holder.particles.velocity = list(20, 0)
		if(SOUTH)
			particle_holder.particles.position = list(-9, -3)
			particle_holder.particles.velocity = list(0, -20)
		if(WEST)
			particle_holder.particles.position = list(-4, 9)
			particle_holder.particles.velocity = list(-20, 0)
	for(var/turf/target in targets)
		for(var/atom/movable/slashed AS in target)
			slashed.attackby(src, source, list2params(modifiers))
	source.a_intent = old_intent

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser_spear
	name = "\improper 日光束粒子刺穿器"
	desc = "为地球政府殖民地海军陆战队战斗机甲设计的压缩能量长矛。一种用于中短距离强力防御的近战武器。激活时会延伸出一支超高温等离子体长矛，刺穿路径上的一切。近战核心将同时提升其射程和威力。这是地球政府殖民地海军陆战队精良机甲近战攻击能力系列中的顶级近战武器。"
	icon = 'icons/mecha/mecha_equipment_64x32.dmi'
	icon_state = "lance"
	fire_sound = 'sound/mecha/weapons/laser_sword.ogg'
	windup_sound = 'sound/weapons/guns/fire/tank_minigun_start.OGG'
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	ammotype = /datum/ammo/energy/lasgun/marine/mech/lance_strike
	max_integrity = 400
	slowdown = 0.15
	windup_delay = 0.6 SECONDS
	harmful = TRUE
	projectile_delay = 3 SECONDS
	energy_drain = 100
	variance = 0
	range = MECHA_MELEE|MECHA_RANGED
	muzzle_iconstate = null
	muzzle_flash_color = COLOR_PULSE_BLUE
	fire_mode = GUN_FIREMODE_SEMIAUTO

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser_spear/action_checks(mob/source, atom/target, list/modifiers)
	. = ..()
	if(!.)
		return FALSE
	ammotype = HAS_TRAIT(chassis, TRAIT_MELEE_CORE) ? /datum/ammo/energy/lasgun/marine/mech/lance_strike/super : /datum/ammo/energy/lasgun/marine/mech/lance_strike
