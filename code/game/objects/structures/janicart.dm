/obj/structure/janitorialcart
	name = "清洁推车"
	desc = "终极清洁推车！拥有存放水、拖把、标识牌、垃圾袋等物品的空间！"
	icon = 'icons/obj/janitor.dmi'
	icon_state = "cart"
	anchored = FALSE
	density = TRUE
	drag_delay = 1
	coverage = 20
	resistance_flags = XENO_DAMAGEABLE
	max_integrity = 100
	//copypaste sorry
	var/amount_per_transfer_from_this = 5 //shit I dunno, adding this so syringes stop runtime erroring. --NeoFite
	var/obj/item/storage/bag/trash/mybag
	var/obj/item/tool/mop/mymop
	var/obj/item/reagent_containers/spray/myspray
	var/obj/item/lightreplacer/myreplacer
	var/obj/item/reagent_containers/glass/bucket/janibucket/mybucket
	var/signs = 0	//maximum capacity hardcoded below


/obj/structure/janitorialcart/Initialize(mapload)
	. = ..()
	mybucket = new(src)
	update_icon()

/obj/structure/janitorialcart/examine(mob/user)
	. = ..()
	if(mybucket)
		. += "Its bucket contains [mybucket.reagents.total_volume] unit\s of liquid."
	else
		. += "It has no bucket."


/obj/structure/janitorialcart/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/storage/bag/trash) && !mybag)
		user.drop_held_item()
		mybag = I
		I.forceMove(src)
		update_icon()
		updateUsrDialog()
		to_chat(user, span_notice("你将[I]放入[src]。"))

	else if(istype(I, /obj/item/tool/mop))
		if(I.reagents.total_volume < I.reagents.maximum_volume && mybucket)	//if it's not completely soaked we assume they want to wet it, otherwise store it
			if(mybucket.reagents.total_volume < 1)
				to_chat(user, "[mybucket] 没水了！</span>")
				return

			mybucket.reagents.trans_to(I, 5)	//
			to_chat(user, span_notice("你把[I]弄湿在[mybucket]里。"))
			playsound(loc, 'sound/effects/slosh.ogg', 25, 1)

		else if(!mymop)
			user.drop_held_item()
			mymop = I
			I.forceMove(src)
			update_icon()
			updateUsrDialog()
			to_chat(user, span_notice("你将[I]放入[src]。"))

	else if(istype(I, /obj/item/reagent_containers/spray) && !myspray)
		user.drop_held_item()
		myspray = I
		I.forceMove(src)
		update_icon()
		updateUsrDialog()
		to_chat(user, span_notice("你将[I]放入[src]。"))

	else if(istype(I, /obj/item/lightreplacer) && !myreplacer)
		user.drop_held_item()
		myreplacer = I
		I.forceMove(src)
		update_icon()
		updateUsrDialog()
		to_chat(user, span_notice("你将[I]放入[src]。"))

	else if(istype(I, /obj/item/tool/wet_sign))
		if(signs >= 4)
			to_chat(user, span_notice("[src]无法再携带更多标牌。"))
			return

		user.drop_held_item()
		I.forceMove(src)
		signs++
		update_icon()
		updateUsrDialog()
		to_chat(user, span_notice("你将[I]放入[src]。"))

	else if(istype(I, /obj/item/reagent_containers/glass/bucket/janibucket))
		user.drop_held_item()
		mybucket = I
		I.forceMove(src)
		update_icon()
		updateUsrDialog()
		to_chat(user, span_notice("你将[I]放入[src]。"))
		return TRUE

	else if(mybag)
		mybag.attackby(I, user, params)





/obj/structure/janitorialcart/interact(mob/user)
	. = ..()
	if(.)
		return
	var/dat
	if(mybag)
		dat += "<a href='byond://?src=[text_ref(src)];garbage=1'>[mybag.name]</a><br>"
	if(mymop)
		dat += "<a href='byond://?src=[text_ref(src)];mop=1'>[mymop.name]</a><br>"
	if(myspray)
		dat += "<a href='byond://?src=[text_ref(src)];spray=1'>[myspray.name]</a><br>"
	if(myreplacer)
		dat += "<a href='byond://?src=[text_ref(src)];replacer=1'>[myreplacer.name]</a><br>"
	if(mybucket)
		dat += "<a href='byond://?src=[text_ref(src)];bucket=1'>[mybucket.name]</a><br>"
	if(signs)
		dat += "<a href='byond://?src=[text_ref(src)];sign=1'>[signs] sign\s</a><br>"
	var/datum/browser/popup = new(user, "janicart", name, 240, 160)
	popup.set_content(dat)
	popup.open()


/obj/structure/janitorialcart/Topic(href, href_list)
	if(!in_range(src, usr))
		return
	if(!isliving(usr))
		return
	var/mob/living/user = usr
	if(href_list["garbage"])
		if(mybag)
			user.put_in_hands(mybag)
			to_chat(user, span_notice("你从[src]那里拿走了[mybag]。"))
			mybag = null
	if(href_list["mop"])
		if(mymop)
			user.put_in_hands(mymop)
			to_chat(user, span_notice("你从[src]拿走了[mymop]。"))
			mymop = null
	if(href_list["spray"])
		if(myspray)
			user.put_in_hands(myspray)
			to_chat(user, span_notice("你从[src]那里拿走了[myspray]。"))
			myspray = null
	if(href_list["replacer"])
		if(myreplacer)
			user.put_in_hands(myreplacer)
			to_chat(user, span_notice("你从[src]拿走了[myreplacer]。"))
			myreplacer = null
	if(href_list["bucket"])
		if(mybucket)
			user.put_in_hands(mybucket)
			to_chat(user, span_notice("你从[src]那里拿走了[mybucket]。"))
			mybucket = null
	if(href_list["sign"])
		if(signs)
			var/obj/item/tool/wet_sign/Sign = locate() in src
			if(Sign)
				user.put_in_hands(Sign)
				to_chat(user, span_notice("你从[src]那里拿走了\a [Sign]。"))
				signs--
			else
				warning("[src] signs ([signs]) didn't match contents")
				signs = 0

	update_icon()
	updateUsrDialog()


/obj/structure/janitorialcart/update_overlays()
	. = ..()
	if(mybag)
		. += "cart_garbage"
	if(mymop)
		. += "cart_mop"
	if(myspray)
		. += "cart_spray"
	if(myreplacer)
		. += "cart_replacer"
	if(mybucket)
		. += "cart_bucket"
	if(signs)
		. += "cart_sign[signs]"
