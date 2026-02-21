/obj/structure/coatrack
	name = "衣帽架"
	desc = "挂外套的衣架。"
	icon = 'icons/obj/structures/misc.dmi'
	icon_state = "coatrack0"
	coverage = 5
	var/obj/item/clothing/suit/coat
	var/list/allowed = list(/obj/item/clothing/suit/storage/labcoat, /obj/item/clothing/suit/storage/det_suit, /obj/item/clothing/suit/storage/bomber)

/obj/structure/coatrack/Initialize(mapload)
	. = ..()
	var/static/list/connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_cross),
	)
	AddElement(/datum/element/connect_loc, connections)

/obj/structure/coatrack/attack_hand(mob/living/user)
	if(coat)
		user.visible_message("[user] 从 \the [src] 上脱下 [coat]。", "You take [coat] off the \the [src]")
		if(!user.put_in_active_hand(coat))
			coat.loc = get_turf(user)
		coat = null
		update_icon()


/obj/structure/coatrack/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(!(I.type in allowed) || coat)
		to_chat(user, span_notice("你无法将[I]挂在[src]上"))
		return

	user.visible_message("[user] 将 [I] 挂在了 \the [src] 上。", "You hang [I] on the \the [src]")
	coat = I
	user.drop_held_item(src)
	coat.forceMove(src)
	update_icon()


/obj/structure/coatrack/proc/on_cross(datum/source, atom/movable/AM, oldloc, oldlocs)
	SIGNAL_HANDLER
	if(coat)
		return
	for(var/T in allowed)
		if(istype(AM,T))
			src.visible_message("[AM] 降落在 \the [src]上。")
			coat = AM
			coat.forceMove(src)
			update_icon()
			break


/obj/structure/coatrack/update_overlays()
	. = ..()
	if(istype(coat, /obj/item/clothing/suit/storage/labcoat))
		. += image(icon, icon_state = "coat_lab")
	if(istype(coat, /obj/item/clothing/suit/storage/labcoat/cmo))
		. += image(icon, icon_state = "coat_cmo")
	if(istype(coat, /obj/item/clothing/suit/storage/det_suit))
		. += image(icon, icon_state = "coat_det")
