/obj/item/storage/lockbox
	name = "保险箱"
	desc = "一个上锁的箱子。"
	icon_state = "lockbox+l"
	worn_icon_state = "syringe_kit"
	w_class = WEIGHT_CLASS_BULKY
	req_access = list(ACCESS_MARINE_CAPTAIN)
	storage_type = /datum/storage/lockbox
	var/locked = 1
	var/broken = 0
	var/icon_locked = "lockbox+l"
	var/icon_closed = "lockbox"
	var/icon_broken = "lockbox+b"

/obj/item/storage/lockbox/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/card/id))
		if(broken)
			to_chat(user, span_warning("它看起来坏了。"))
			return

		if(!allowed(user))
			to_chat(user, span_warning("访问被拒绝"))
			return

		locked = !locked
		if(locked)
			icon_state = icon_locked
			to_chat(user, span_warning("你锁上了[src]！"))
		else
			icon_state = icon_closed
			to_chat(user, span_warning("你解锁了[src]！"))

	if(locked)
		to_chat(user, span_warning("它锁住了！"))
		return

	return ..()
