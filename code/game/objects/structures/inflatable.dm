/obj/item/inflatable
	name = "通用充气式"
	desc = "你不应该看到这个。"
	icon = 'icons/obj/inflatable.dmi'
	hit_sound = 'sound/effects/Glasshit_old.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	///The type of structure we make upon inflation
	var/inflatable_type


/obj/item/inflatable/attack_self(mob/user)
	. = ..()
	balloon_alert(user, "充气中...")
	if(!do_after(user, 3 SECONDS, NONE, src))
		balloon_alert(user, "中断！")
		return
	playsound(loc, 'sound/items/zip.ogg', 25, 1)
	to_chat(user, span_notice("你给[src]充气。"))
	new inflatable_type(get_turf(user))
	qdel(src)


/obj/item/inflatable/wall
	name = "充气墙"
	desc = "折叠的薄膜，激活后迅速展开为大型立方体。"
	icon_state = "folded_wall"
	inflatable_type = /obj/structure/inflatable/wall


/obj/item/inflatable/door
	name = "充气门"
	desc = "折叠的薄膜，激活后可迅速展开成简易门。"
	icon_state = "folded_door"
	inflatable_type = /obj/structure/inflatable/door


/obj/structure/inflatable
	name = "通用充气式"
	desc = "你不应该看到这个。"
	density = TRUE
	allow_pass_flags = NONE
	icon = 'icons/obj/inflatable.dmi'
	max_integrity = 50
	resistance_flags = XENO_DAMAGEABLE

	///Are we deflated?
	var/deflated = FALSE
	///The type of item we get back upon deflation
	var/inflatable_item
	///The popped variant of this type
	var/popped_variant


/obj/structure/inflatable/deconstruct(disassembled = TRUE, mob/living/blame_mob)
	if(!deflated)
		deflate(!disassembled)
	return ..()

/obj/structure/inflatable/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			qdel(src)
		if(EXPLODE_HEAVY)
			deflate(TRUE)

		if(EXPLODE_LIGHT)
			if(prob(50))
				deflate(TRUE)
		if(EXPLODE_WEAK)
			if(prob(20))
				deflate(TRUE)


/obj/structure/inflatable/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return
	if(can_puncture(I))
		visible_message(span_danger("[user]用[I]刺穿了[src]！"))
		deflate(TRUE)

/obj/structure/inflatable/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(!do_after(xeno_attacker, 2 SECONDS, NONE, src, BUSY_ICON_FRIENDLY))
		return
	xeno_attacker.do_attack_animation(src, ATTACK_EFFECT_CLAW)
	xeno_attacker.visible_message(span_danger("\The [xeno_attacker] 用其锋利的爪子刺穿了 [src]，并在上面划开了一个巨大的口子！"), \
	span_danger("You puncture the [src] and rip a giant hole in it!"), null, 5)
	deflate(TRUE)

///Handles the structure deflating
/obj/structure/inflatable/proc/deflate(violent = FALSE)
	set waitfor = 0
	if(deflated)
		return
	deflated = TRUE
	playsound(loc, 'sound/machines/hiss.ogg', 25, 1)
	visible_message("[src] [violent ? "rapidly" : "slowly"] deflates!")
	flick("wall_[violent ? "popping" : "deflating"]", src)
	addtimer(CALLBACK(src, PROC_REF(post_deflate), violent), violent ? 1 SECONDS : 5 SECONDS)

///Creates the appropriate item after deflation
/obj/structure/inflatable/proc/post_deflate(violent = FALSE)
	if(violent)
		new popped_variant(get_turf(src))
	else
		new inflatable_item(get_turf(src))
	qdel(src)


/obj/structure/inflatable/verb/hand_deflate()
	set name = "Deflate"
	set category = "IC.Object"
	set src in oview(1)

	if(!ishuman(usr))
		return

	if(!deflated)
		balloon_alert(usr, "放气中...")
		deflate(FALSE)
	else
		balloon_alert(usr, "已经泄气了！")


/obj/structure/inflatable/wall
	name = "充气墙"
	desc = "一个充气的薄膜。请勿刺破。"
	icon_state = "wall"
	inflatable_item = /obj/item/inflatable/wall
	popped_variant = /obj/structure/inflatable/popped

/obj/structure/inflatable/popped
	name = "充气墙已破裂"
	desc = "它曾经是一堵充气墙，现在只剩一堆塑料残骸。"
	density = FALSE
	anchored = TRUE
	deflated = TRUE
	icon_state = "wall_popped"


/obj/structure/inflatable/popped/door
	name = "充气门已弹出"
	desc = "这曾经是一扇充气门，现在只剩下一堆塑料碎片。"
	icon_state = "door_popped"


//TODO make this not copypasta. A simple door component maybe.
/obj/structure/inflatable/door
	name = "充气门"
	icon_state = "door_closed"
	inflatable_item = /obj/item/inflatable/door
	popped_variant = /obj/structure/inflatable/popped/door
	///Are we open?
	var/open = FALSE
	///Are we currently busy opening/closing?
	var/switching_states = FALSE

/obj/structure/inflatable/door/Initialize(mapload)
	. = ..()
	if((locate(/mob/living) in loc) && !open)
		toggle_state()

/obj/structure/inflatable/door/Bumped(atom/user)
	. = ..()
	if(!open)
		return try_toggle_state(user)

/obj/structure/inflatable/door/update_icon()
	. = ..()
	if(open)
		icon_state = "door_open"
	else
		icon_state = "door_closed"

/obj/structure/inflatable/door/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	return try_toggle_state(user)

/obj/structure/inflatable/door/CanAllowThrough(atom/movable/mover, turf/target, height = 0, air_group = 0)
	if(air_group)
		return open
	if(istype(mover, /obj/effect/beam))
		return !opacity
	return ..()

/*
 * Checks all the requirements for opening/closing a door before opening/closing it. Copypasta. TODO: un-copypasta this
 *
 * atom/user - the mob trying to open/close this door
*/
/obj/structure/inflatable/door/proc/try_toggle_state(atom/user)
	if(switching_states || !ismob(user) || locate(/mob/living) in get_turf(src))
		return
	var/mob/M = user
	if(!M.client)
		return
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		if(C.handcuffed)
			return
	toggle_state()


///The proc that actually does the door closing. Plays the animation, etc. Copypasta. TODO: un-copypasta this
/obj/structure/inflatable/door/proc/toggle_state()
	switching_states = TRUE
	open = !open
	flick("door_[open ? "opening" : "closing"]", src)
	density = !density
	update_icon()
	addtimer(VARSET_CALLBACK(src, switching_states, FALSE), 1 SECONDS)

/obj/item/storage/briefcase/inflatable
	name = "充气路障箱"
	desc = "包含充气墙和门。"
	icon_state = "inf_box"
	worn_icon_state = "syringe_kit"

/obj/item/storage/briefcase/inflatable/Initialize(mapload, ...)
	. = ..()
	storage_datum.max_storage_space = 21
	for(var/i in 1 to 3)
		new /obj/item/inflatable/door(src)
	for(var/i in 1 to 4)
		new /obj/item/inflatable/wall(src)
