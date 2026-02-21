/obj/item/vehicle_module/mounted_gun
	icon = 'icons/obj/vehicles.dmi'
	icon_state = ""
	slot = ATTACHMENT_SLOT_WEAPON
	w_class = WEIGHT_CLASS_BULKY
	attach_features_flags = ATTACH_ACTIVATION|ATTACH_REMOVABLE|ATTACH_NO_HANDS
	///The gun mounted on a vehicle. Initial value is the type to use
	var/obj/item/weapon/gun/mounted_gun
	///Firing angle for the mounted weapon
	var/firing_angle = 120

/obj/item/vehicle_module/mounted_gun/Initialize(mapload)
	if(!mounted_gun)
		return INITIALIZE_HINT_QDEL
	. = ..()
	mounted_gun = new mounted_gun(src)
	mounted_gun.gun_fire_angle = firing_angle
	action_icon = mounted_gun.icon
	action_icon_state = mounted_gun.icon_state

/obj/item/vehicle_module/mounted_gun/Destroy()
	QDEL_NULL(mounted_gun)
	return ..()

/obj/item/vehicle_module/mounted_gun/on_unbuckle(datum/source, mob/living/unbuckled_mob, force = FALSE)
	if(mounted_gun.loc == unbuckled_mob)
		unbuckled_mob.dropItemToGround(mounted_gun, TRUE)
	return ..()

/obj/item/vehicle_module/mounted_gun/activate(mob/living/user)
	if(mounted_gun.loc == user)
		on_weapon_equipped(null, user)
		return FALSE
	if(!user.put_in_active_hand(mounted_gun) && !user.put_in_inactive_hand(mounted_gun))
		to_chat(user, span_warning("无法装备武器！用空手点击[parent]来装备。"))
		return FALSE
	RegisterSignal(mounted_gun, COMSIG_MOVABLE_MOVED, PROC_REF(on_weapon_moved))
	RegisterSignal(mounted_gun, COMSIG_ITEM_EQUIPPED, PROC_REF(on_weapon_equipped))
	return TRUE

///Handles the weapon being moved
/obj/item/vehicle_module/mounted_gun/proc/on_weapon_moved(obj/item/source)
	SIGNAL_HANDLER
	if(ismob(mounted_gun.loc)) //we have to handle it after its fully equipped or it becomes cursed
		return
	reequip_weapon()

///Handles the weapon being put into an equip slot
/obj/item/vehicle_module/mounted_gun/proc/on_weapon_equipped(obj/item/source, mob/user)
	SIGNAL_HANDLER
	user.dropItemToGround(mounted_gun, TRUE)
	reequip_weapon()

///Safely puts the weapon back into storage
/obj/item/vehicle_module/mounted_gun/proc/reequip_weapon()
	UnregisterSignal(mounted_gun, list(COMSIG_MOVABLE_MOVED, COMSIG_ITEM_EQUIPPED))
	mounted_gun.forceMove(src)


/obj/item/vehicle_module/mounted_gun/volkite
	name = "架设式半长炮"
	desc = "一套安装在轻型载具（如火星之子悬浮摩托）上的成对沃尔凯特武器。虽然它们缺乏其他一些沃尔凯特武器的原始威力，但通过极高的射速和集成的可充电能源弥补了这一不足。"
	icon = 'icons/obj/vehicles/hover_bike.dmi'
	icon_state = "bike_volkite"
	should_use_obj_appeareance = FALSE
	mounted_gun = /obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/demi_culverin

///bike volkite
/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/demi_culverin
	name = "\improper VX-42b 半长炮"
	desc = "一套安装在轻型载具（如火星之子悬浮摩托）上的成对沃尔凯特武器。虽然它们缺乏其他一些沃尔凯特武器的原始威力，但通过极高的射速和集成的可充电能源弥补了这一不足。"
	icon = 'icons/obj/vehicles/vehicle_weapons.dmi'
	icon_state = "bike_volkite"
	worn_icon_state = null
	allowed_ammo_types = list(/obj/item/cell/lasgun/volkite/turret/hover_bike)
	default_ammo_type = /obj/item/cell/lasgun/volkite/turret/hover_bike
	attachable_allowed = null
	item_flags = NONE
	gun_features_flags = GUN_AMMO_COUNTER|GUN_ENERGY|GUN_AMMO_COUNT_BY_SHOTS_REMAINING
	reciever_flags = AMMO_RECIEVER_MAGAZINES|AMMO_RECIEVER_DO_NOT_EJECT_HANDFULS|AMMO_RECIEVER_CYCLE_ONLY_BEFORE_FIRE|AMMO_RECIEVER_CLOSED|AMMO_RECIEVER_AUTO_EJECT_LOCKED
	ammo_level_icon = null
	gun_skill_category = SKILL_HEAVY_WEAPONS
	max_shots = 90
	ammo_datum_type = /datum/ammo/energy/volkite/demi_culverin
	rounds_per_shot = 20
	fire_delay = 0.1 SECONDS
	accuracy_mult_unwielded = 1
	scatter_unwielded = 8
	recoil_unwielded = -2
	damage_falloff_mult = 0.4
	movement_acc_penalty_mult = 3

/obj/item/vehicle_module/mounted_gun/minigun
	name = "双联 V-44 轻型加特林机枪"
	desc = "一套为轻型载具（如火星之子悬浮摩托）设计的三管'轻型'加特林机枪。采用较小口径弹药以优化内置弹匣容量，但以凶猛的射速弥补了这一不足。"
	icon = 'icons/obj/vehicles/hover_bike.dmi'
	icon_state = "bike_minigun"
	should_use_obj_appeareance = FALSE
	mounted_gun = /obj/item/weapon/gun/bike_minigun

/obj/item/weapon/gun/bike_minigun
	name = "双联 V-44 轻型加特林机炮"
	desc = "一对三联装'轻型'加特林机枪，专为安装在火星之子悬浮摩托等轻型载具上而设计。采用较小口径弹药以优化内置弹匣容量，但以惊人的射速弥补了这一不足。"
	icon = 'icons/obj/vehicles/vehicle_weapons.dmi'
	icon_state = "bike_minigun"
	worn_icon_state = null
	fire_animation = "minigun_fire"
	max_shells = 500 //codex
	caliber = CALIBER_762X51 //codex
	load_method = MAGAZINE //codex
	fire_sound = 'sound/weapons/guns/fire/minigun.ogg'
	unload_sound = 'sound/weapons/guns/interact/minigun_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/minigun_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/minigun_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/bike_minigun
	allowed_ammo_types = list(/obj/item/ammo_magazine/bike_minigun)
	w_class = WEIGHT_CLASS_HUGE
	gun_skill_category = SKILL_HEAVY_WEAPONS
	item_flags = NONE
	equip_slot_flags = NONE
	gun_features_flags = GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	reciever_flags = AMMO_RECIEVER_CYCLE_ONLY_BEFORE_FIRE|AMMO_RECIEVER_MAGAZINES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)

	fire_delay = 0.1 SECONDS
	windup_delay = 0.3 SECONDS
	windup_sound = 'sound/weapons/guns/fire/tank_minigun_start.ogg'

	recoil_unwielded = -2
	scatter_unwielded = 10
	damage_falloff_mult = 0.4
	movement_acc_penalty_mult = 2

//
/obj/item/vehicle_module/mounted_gun/autocannon
	name = "双联 V-44 轻型加特林机炮"
	desc = "专为轻型载具（如SOM悬浮摩托）设计的三管轻型加特林机枪。采用小口径弹药以优化内置弹匣容量，但以惊人的射速弥补了威力不足。"
	icon = 'icons/obj/vehicles/big_bike.dmi'
	icon_state = "bike_autocannon"
	should_use_obj_appeareance = FALSE
	mounted_gun = /obj/item/weapon/gun/bike_autocannon

/obj/item/weapon/gun/bike_autocannon
	name = "双联AC-32轻型自动炮"
	desc = "一对20毫米自动炮，设计用于安装在重型摩托车等轻型载具上。它威力强大，提供可观的杀伤力和大容量内置弹匣。"
	icon = 'icons/obj/vehicles/vehicle_weapons.dmi'
	icon_state = "bike_autocannon"
	worn_icon_state = null
	max_shells = 150
	caliber = CALIBER_20
	load_method = MAGAZINE
	fire_sound = 'sound/weapons/guns/fire/hmg2.ogg'
	reload_sound = 'sound/weapons/guns/interact/minigun_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/bike_autocannon
	allowed_ammo_types = list(/obj/item/ammo_magazine/bike_autocannon)
	w_class = WEIGHT_CLASS_HUGE
	gun_skill_category = SKILL_HEAVY_WEAPONS
	item_flags = NONE
	equip_slot_flags = NONE
	gun_features_flags = GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	reciever_flags = AMMO_RECIEVER_CYCLE_ONLY_BEFORE_FIRE|AMMO_RECIEVER_MAGAZINES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)

	fire_delay = 0.2 SECONDS

	recoil_unwielded = -2
	scatter_unwielded = 4
	damage_falloff_mult = 0.4
	movement_acc_penalty_mult = 2
