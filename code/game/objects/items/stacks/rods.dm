/obj/item/stack/rods
	name = "金属杆"
	desc = "一些金属棒。可用于建造，或其他用途。"
	singular_name = "metal rod"
	icon_state = "rods"
	atom_flags = CONDUCT
	w_class = WEIGHT_CLASS_NORMAL
	force = 9
	throwforce = 15
	throw_speed = 5
	throw_range = 20
	max_amount = 60
	attack_verb = list("hits", "bludgeons", "whacks")


/obj/item/stack/rods/attackby(obj/item/W as obj, mob/user as mob)
	. = ..()
	if(.)
		return

	if(istype(W, /obj/item/stack/barbed_wire)) // making razorwire obstacles
		var/obj/item/stack/barbed_wire/B = W
		if(amount < 8)
			to_chat(user, span_warning("你需要至少 [8 - amount] 个 [src] 才能制作铁丝网障碍物！"))
			return
		if(B.amount < 2)
			to_chat(user, span_warning("你需要再收集[2 - B.amount]个[B]才能制作铁丝网障碍！"))
			return
		use(8)
		B.use(2)
		var/obj/structure/razorwire/M = new /obj/item/stack/razorwire(user.loc, 2)
		to_chat(user, span_notice("你将金属杆和铁丝网组合成了[M]！"))
		return
	if (iswelder(W))
		var/obj/item/tool/weldingtool/WT = W

		if(amount < 4)
			to_chat(user, span_warning("你需要至少四根金属棒才能做到。"))
			return

		if(WT.remove_fuel(0,user))
			var/obj/item/stack/sheet/metal/new_item = new(usr.loc)
			new_item.add_to_stacks(usr)
			visible_message(span_warning("[src]被[user]用焊枪塑造成金属。"), null, span_warning("You hear welding."))
			var/obj/item/stack/rods/R = src
			var/replace = (user.get_inactive_held_item()==R)
			R.use(4)
			if (!R && replace)
				user.put_in_hands(new_item)
		return

/obj/item/stack/rods/attack_self(mob/user as mob)

	if(!istype(user.loc,/turf)) return 0

	if (locate(/obj/structure/grille, usr.loc))
		for(var/obj/structure/grille/G in usr.loc)
			if (G.obj_integrity <= G.integrity_failure)
				G.repair_damage(10, user)
				G.density = TRUE
				G.icon_state = "grille"
				use(1)
			else
				return 1

	else if(!CHECK_BITFIELD(obj_flags, IN_USE))
		if(amount < 4)
			to_chat(user, span_notice("你至少需要四根金属棒才能做到。"))
			return
		to_chat(usr, span_notice("正在组装格栅..."))
		ENABLE_BITFIELD(obj_flags, IN_USE)
		if (!do_after(usr, 20, NONE, src, BUSY_ICON_BUILD))
			DISABLE_BITFIELD(obj_flags, IN_USE)
			return
		new /obj/structure/grille/ ( usr.loc )
		to_chat(usr, span_notice("你组装了一个格栅"))
		DISABLE_BITFIELD(obj_flags, IN_USE)
		use(4)

/obj/item/stack/rods/attack_turf(turf/T, mob/living/user)
	if(istype(T, /turf/open/liquid))
		place_catwalk(T, user)
	else if(isfloorturf(T))
		reinforce_floor(T, user)

///Builds a catwalk
/obj/item/stack/rods/proc/place_catwalk(turf/target_turf, mob/living/user)
	if(target_turf.is_covered())
		user.balloon_alert(user, "已覆盖！")
		return
	if(amount < CATWALK_ROD_REQ)
		user.balloon_alert(user, "[CATWALK_ROD_REQ] 根金属杆需要！")
		return
	user.balloon_alert(user, "建造中...")
	if(!do_after(user, 5 SECONDS, NONE, src, BUSY_ICON_BUILD))
		return
	if(target_turf.is_covered())
		user.balloon_alert(user, "已覆盖！")
		return
	if(!use(CATWALK_ROD_REQ))
		user.balloon_alert(user, "[CATWALK_ROD_REQ] 根金属杆需要！")
		return
	playsound(target_turf, 'sound/weapons/genhit.ogg', 50, TRUE)
	new /obj/structure/catwalk(target_turf)

///Reinforces a bare floor
/obj/item/stack/rods/proc/reinforce_floor(turf/target_turf, mob/living/user)
	if(!istype(target_turf, /turf/open/floor/plating))
		user.balloon_alert(user, "移除护板！")
		return
	if(amount < REINFORCED_FLOOR_ROD_REQ)
		user.balloon_alert(user, "[CATWALK_ROD_REQ] 根金属杆需要！")
		return
	user.balloon_alert(user, "正在加固地板...")
	if(!do_after(user, 3 SECONDS, NONE, src, BUSY_ICON_BUILD))
		return
	if(!istype(target_turf, /turf/open/floor/plating))
		user.balloon_alert(user, "移除装甲板！")
		return
	if(!use(REINFORCED_FLOOR_ROD_REQ))
		user.balloon_alert(user, "[CATWALK_ROD_REQ] 根金属杆需要！")
		return
	target_turf.ChangeTurf(/turf/open/floor/engine)
	playsound(target_turf, 'sound/items/deconstruct.ogg', 25, TRUE)
