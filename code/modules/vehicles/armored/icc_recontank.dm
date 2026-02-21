/obj/vehicle/sealed/armored/multitile/icc_lvrt
	name = "\improper LVRT '休耕'侦察车"
	desc = "轻型侦察履带车'休耕'是一款ICC侦察车辆，专为高速机动设计，用于侦察和袭扰敌方阵地。可选择配备低速坦克炮或SARDEN作为武器。"
	icon = 'icons/obj/armored/2x2/icc_lvrt.dmi'
	icon_state = "icc_lvrt"
	turret_icon = 'icons/obj/armored/2x2/icc_lvrt_gun.dmi'
	turret_icon_state = "icc_lvrt_turret"
	damage_icon_path = 'icons/obj/armored/2x2/icc_lvrt_damage.dmi'
	interior = /datum/interior/armored/icc_lvrt
	hitbox = /obj/hitbox/medium
	armored_flags = ARMORED_HAS_PRIMARY_WEAPON|ARMORED_HAS_SECONDARY_WEAPON|ARMORED_HAS_HEADLIGHTS|ARMORED_HAS_UNDERLAY
	permitted_weapons = list(/obj/item/armored_weapon/icc_lvrt_sarden, /obj/item/armored_weapon/icc_lvrt_cannon, /obj/item/armored_weapon/icc_coaxial)
	permitted_mods = list(/obj/item/tank_module/ability/smoke_launcher)
	required_entry_skill = SKILL_LARGE_VEHICLE_DEFAULT
	minimap_icon_state = "apc"
	max_integrity = 450
	soft_armor = list(MELEE = 40, BULLET = 60 , LASER = 60, ENERGY = 60, BOMB = 40, BIO = 60, FIRE = 40, ACID = 40)
	max_occupants = 5 //Boy is TINY.
	pixel_x = 0
	pixel_y = -40
	enter_delay = 0.5 SECONDS
	ram_damage = 25
	move_delay = 0.25 SECONDS
	easy_load_list = list(
		/obj/item/ammo_magazine/tank,
		/obj/structure/largecrate,
		/obj/structure/closet/crate,
	)

/obj/vehicle/sealed/armored/multitile/icc_lvrt/enter_locations(atom/movable/entering_thing)
	return list(get_step(src, REVERSE_DIR(dir)))

/obj/vehicle/sealed/armored/multitile/icc_lvrt/Initialize(mapload)
	. = ..()
	var/obj/item/armored_weapon/icc_coaxial/gun = new(src)
	gun.attach(src)
	gun.attach(src)
