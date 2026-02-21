/obj/item/attachable/flamer_nozzle
	name = "标准喷火器喷嘴"
	desc = "标准喷火器喷嘴。这种喷嘴喷射火焰流，用于直接而精准的火焰攻击。虽然其覆盖范围不如其对应型号，但在定向的前线作战中表现出色。"
	icon_state = "directional"
	icon = 'icons/obj/items/guns/attachments/flamer.dmi'
	slot = ATTACHMENT_SLOT_FLAMER_NOZZLE
	attach_delay = 2 SECONDS
	detach_delay = 2 SECONDS
	///This is pulled when the parent flamer fires, it determines how the parent flamers fire stream acts.
	var/stream_type = FLAMER_STREAM_STRAIGHT
	///Modifier for burn level of attached flamer. Percentage based.
	var/burn_level_mod = 1
	///Modifier for burn time of attached flamer. Percentage based.
	var/burn_time_mod = 1
	///Range modifier of attached flamer. Numerically based.
	var/range_modifier = 0
	///Damage multiplier for mobs caught in the initial stream of fire of the attached flamer.
	var/mob_flame_damage_mod = 1

/obj/item/attachable/flamer_nozzle/on_attach(attaching_item, mob/user)
	. = ..()
	if(!istype(attaching_item, /obj/item/weapon/gun/flamer))
		return
	var/obj/item/weapon/gun/flamer/flamer = attaching_item
	flamer.burn_level_mod *= burn_level_mod
	flamer.burn_time_mod *= burn_time_mod
	flamer.flame_max_range += range_modifier
	flamer.mob_flame_damage_mod *= mob_flame_damage_mod

/obj/item/attachable/flamer_nozzle/on_detach(attaching_item, mob/user)
	. = ..()
	if(!istype(attaching_item, /obj/item/weapon/gun/flamer))
		return
	var/obj/item/weapon/gun/flamer/flamer = attaching_item
	flamer.burn_level_mod /= burn_level_mod
	flamer.burn_time_mod /= burn_time_mod
	flamer.flame_max_range -= range_modifier
	flamer.mob_flame_damage_mod /= mob_flame_damage_mod

/obj/item/attachable/flamer_nozzle/unremovable
	attach_features_flags = NONE

/obj/item/attachable/flamer_nozzle/unremovable/invisible
	icon_state = "invisible"

/obj/item/attachable/flamer_nozzle/wide
	name = "喷射喷火器喷嘴"
	desc = "这种专用喷嘴能以比标准喷嘴更宽泛的方式喷洒所连接喷火器的火焰。它适用于大范围区域封锁，而非进攻性的定向喷射。"
	icon_state = "wide"
	pixel_shift_y = 17
	stream_type = FLAMER_STREAM_CONE
	burn_time_mod = 0.3

///Funny red wide nozzle that can fill entire screens with flames. Admeme only.
/obj/item/attachable/flamer_nozzle/wide/red
	name = "红色喷雾喷火器喷嘴"
	desc = "它是红色的，所以显然更有效。"
	icon_state = "wide_red"
	range_modifier = 3

///Flamer ammo is a normal ammo datum, which means we can shoot it if we want
/obj/item/attachable/flamer_nozzle/long
	name = "加长喷火器喷嘴"
	icon_state = "long"
	desc = "与将燃料散布在区域上不同，此喷嘴会发射单个火球以远程点燃目标。单发燃料消耗的减少也意味着下一发准备就绪更快。"
	stream_type = FLAMER_STREAM_RANGED
	delay_mod = -10

/obj/item/attachable/flamer_nozzle/long/on_attach(attaching_item, mob/user)
	. = ..()
	if(!istype(attaching_item, /obj/item/weapon/gun/flamer))
		return
	var/obj/item/weapon/gun/flamer/flamer = attaching_item
	//Since we're firing more like a normal gun, we do need to use up rounds after firing
	flamer.reciever_flags &= ~AMMO_RECIEVER_DO_NOT_EMPTY_ROUNDS_AFTER_FIRE

/obj/item/attachable/flamer_nozzle/long/on_detach(attaching_item, mob/user)
	. = ..()
	if(!istype(attaching_item, /obj/item/weapon/gun/flamer))
		return
	var/obj/item/weapon/gun/flamer/flamer = attaching_item
	if(initial(flamer.reciever_flags) & AMMO_RECIEVER_DO_NOT_EMPTY_ROUNDS_AFTER_FIRE)
		flamer.reciever_flags |= AMMO_RECIEVER_DO_NOT_EMPTY_ROUNDS_AFTER_FIRE
