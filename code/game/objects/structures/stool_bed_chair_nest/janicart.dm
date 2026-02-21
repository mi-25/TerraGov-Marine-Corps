

///old style janicart
/obj/structure/bed/chair/janicart
	name = "医疗推车"
	icon = 'icons/obj/vehicles.dmi'
	desc = "一位勇敢的清洁工机器人牺牲了自己，才造就了如此惊人的速度与实用性结合体。"
	icon_state = "pussywagon"
	anchored = FALSE
	density = TRUE
	buildstacktype = null ///can't be disassembled and doesn't drop anything when destroyed
	buckle_flags = CAN_BUCKLE
	//copypaste sorry
	var/amount_per_transfer_from_this = 5 //shit I dunno, adding this so syringes stop runtime erroring. --NeoFite
	var/obj/item/storage/bag/trash/mybag = null
	var/callme = "pimpin' ride"	//how do people refer to it?
	var/move_delay = 2

/obj/structure/bed/chair/janicart/Initialize(mapload)
	. = ..()
	create_reagents(100, OPENCONTAINER)


/obj/structure/bed/chair/janicart/examine(mob/user)
	. = ..()
	. += "This [callme] contains [reagents.total_volume] unit\s of water!"
	if(mybag)
		. += "\A [mybag] is hanging on the [callme]."


/obj/structure/bed/chair/janicart/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/tool/mop))
		if(reagents.total_volume <= 1)
			to_chat(user, span_notice("这个[callme]没水了！"))
			return

		reagents.trans_to(I, 2)
		to_chat(user, span_notice("你弄湿了[I]的[callme]。"))
		playsound(loc, 'sound/effects/slosh.ogg', 25, 1)

	else if(istype(I, /obj/item/key))
		to_chat(user, "驾驶这辆[callme]时，请将[I]握在手中。")

	else if(istype(I, /obj/item/storage/bag/trash))
		to_chat(user, span_notice("你将垃圾袋挂在了[callme]上。"))
		user.drop_held_item()
		I.forceMove(src)
		mybag = I

/obj/structure/bed/chair/janicart/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(mybag)
		mybag.loc = get_turf(user)
		user.put_in_hands(mybag)
		mybag = null


/obj/structure/bed/chair/janicart/relaymove(mob/user, direction)
	if(world.time <= last_move_time + move_delay)
		return
	if(user.incapacitated(TRUE))
		unbuckle_mob(user)
	if(istype(user.l_hand, /obj/item/key) || istype(user.r_hand, /obj/item/key))
		step(src, direction)
	else
		to_chat(user, span_notice("你需要把钥匙拿在手里才能驾驶这辆[callme]。"))

/obj/item/key
	name = "钥匙"
	desc = "一把钥匙环，上面挂着一把小钢钥匙和一个粉色吊牌，上面写着'Pussy Wagon'。"
	icon = 'icons/obj/vehicles.dmi'
	icon_state = "keys"
	w_class = WEIGHT_CLASS_TINY
