//Reagent Canister pouch. Including the canister inside the pouch, as well as the pouch item.

/obj/item/reagent_containers/glass/reagent_canister // See the Reagent Canister Pouch, this is just the container
	name = "加压试剂容器"
	desc = "一个加压容器。加压试剂罐附包的内胆。体积过大，只能装入其配套的附包中。"
	icon = 'icons/obj/clothing/pouches.dmi'
	icon_state = "r_canister"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/tanks_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/tanks_right.dmi',
	)
	worn_icon_state = "anesthetic"
	possible_transfer_amounts = null
	volume = 1200 //The equivalent of 5 pill bottles worth of BKTT
	w_class = WEIGHT_CLASS_BULKY

/obj/item/reagent_containers/glass/reagent_canister/examine(mob/user)
	. = ..()
	. += get_examine_info(user)

///Used on examine for properly skilled people to see contents.
/obj/item/reagent_containers/glass/reagent_canister/proc/get_examine_info(mob/user)
	if(isxeno(user))
		return
	if(!(user.skills.getRating(SKILL_MEDICAL) >= SKILL_MEDICAL_NOVICE) && !isobserver(usr)) //Failed skill check
		return span_notice("You don't know what's in it.")
	if(!reagents.total_volume)
		return span_notice("[src] is empty!")
	var/list/dat = list()
	dat += "\n \t [span_notice("<b>Total Reagents:</b> [reagents.total_volume]/[volume].")]</br>"
	for(var/datum/reagent/R AS in reagents.reagent_list)
		var/percent = round(R.volume / max(0.01 , reagents.total_volume * 0.01),0.01)
		if(R.scannable)
			dat += "\n \t <b>[R]:</b> [R.volume]|[percent]%</br>"
		else
			dat += "\n \t <b>Unknown:</b> [R.volume]|[percent]%</br>"
	return span_notice("[src]'s contents: [dat.Join(" ")]")

/obj/item/reagent_containers/hypospray/autoinjector/r_pouch //Custom empty autoinjector that we will manually fill the contents of
	name = "定制自动注射器"
	desc = "装有定制混合物的自动注射器。在需要快速注射时很有用。"
	icon_state = "RedGreen"
	amount_per_transfer_from_this = 30
	list_reagents = null //This injector gets filled up by the pouch on Initialize()

/obj/item/storage/pouch/pressurized_reagent_pouch //The actual pouch itself and all its function
	name = "加压试剂附包"
	w_class = WEIGHT_CLASS_BULKY
	icon_state = "reagent_pouch"
	desc = "A very large reagent pouch. It is used to refill custom injectors, and can also store one.\
	You can Alt-Click to remove the canister in order to refill it."
	item_flags = NOBLUDGEON
	///The internal container of the pouch. Holds the reagent that you use to refill the connected injector
	var/obj/item/reagent_containers/glass/reagent_canister/inner
	///List of chemicals we fill up our pouch with on Initialize()
	var/list/chemicals_to_fill = list(
		/datum/reagent/consumable/sodiumchloride = 1200,
	)

/obj/item/storage/pouch/pressurized_reagent_pouch/Initialize(mapload)
	. = ..()
	storage_datum.max_w_class = WEIGHT_CLASS_BULKY
	storage_datum.allow_drawing_method = TRUE
	//cant_hold_list to prevent chat spam when you try to put the container in
	storage_datum.set_holdable(can_hold_list = list(/obj/item/reagent_containers/hypospray), cant_hold_list = list(/obj/item/reagent_containers/glass/reagent_canister))
	storage_datum.draw_mode = TRUE

	inner = new /obj/item/reagent_containers/glass/reagent_canister
	new /obj/item/reagent_containers/hypospray/autoinjector/r_pouch(src)
	for(var/datum/reagent/chem_type AS in chemicals_to_fill)
		if(!chem_type)
			continue
		inner.reagents.add_reagent(chem_type, chemicals_to_fill[chem_type])
	if(length(contents) > 0)
		var/obj/item/reagent_containers/hypospray/autoinjector/hypo_to_fill = locate() in src
		if(!hypo_to_fill)
			update_icon()
			return
		for(var/datum/reagent/chem_type AS in chemicals_to_fill)
			if(!chem_type)
				continue
			hypo_to_fill.reagents.add_reagent(chem_type, (chemicals_to_fill[chem_type])/inner.volume*hypo_to_fill.volume)
		hypo_to_fill.update_icon()
	update_icon()


/obj/item/storage/pouch/pressurized_reagent_pouch/Destroy()
	if(inner)
		QDEL_NULL(inner)
	return ..()

/obj/item/storage/pouch/pressurized_reagent_pouch/update_overlays()
	. = ..()
	if(!inner)
		. += image('icons/obj/clothing/pouches.dmi', src, "reagent_pouch_0")
		return
	. += image('icons/obj/clothing/pouches.dmi', src, "reagent_canister")
	var/percentage = round((inner.reagents.total_volume/inner.reagents.maximum_volume)*100)
	switch(percentage)
		if(0)
			. += image('icons/obj/clothing/pouches.dmi', src, "reagent_pouch_0")
		if(1 to 33)
			. += image('icons/obj/clothing/pouches.dmi', src, "reagent_pouch_1")
		if(34 to 66)
			. += image('icons/obj/clothing/pouches.dmi', src, "reagent_pouch_2")
		if(67 to 100)
			. += image('icons/obj/clothing/pouches.dmi', src, "reagent_pouch_3")

/obj/item/storage/pouch/pressurized_reagent_pouch/AltClick(mob/user)
	if(!remove_canister(user))
		return ..()

///Attempts to remove the reagent canister from the pouch. Returns FALSE if there is no canister to remove
/obj/item/storage/pouch/pressurized_reagent_pouch/proc/remove_canister(mob/user)
	if(!inner)
		to_chat(user, span_warning("这个附包里没有容器！"))
		return FALSE
	if(!user.put_in_active_hand(inner))
		user.put_in_hands(inner) //If put_in_active fails, we still pick up or drop the canister
	inner = null
	update_icon()
	return TRUE

/obj/item/storage/pouch/pressurized_reagent_pouch/attackby(obj/item/held_item, mob/user)
	if(istype(held_item, /obj/item/reagent_containers/hypospray))
		fill_autoinjector(held_item, user)
		return ..()

	if(istype(held_item, /obj/item/reagent_containers/glass/reagent_canister)) //If it's the reagent canister, we put it in the special holder
		if(!inner)
			user.temporarilyRemoveItemFromInventory(held_item)
			inner = held_item
			to_chat(user, span_notice("你将[held_item]插入[src]！"))
			update_icon()
			return
		to_chat(user, span_warning("[src] 内已有一个容器！"))
		return

	return ..()

/obj/item/storage/pouch/pressurized_reagent_pouch/attackby_alternate(obj/item/held_item, mob/user, params)
	. = ..()
	if(istype(held_item, /obj/item/reagent_containers/hypospray))
		fill_autoinjector(held_item, user)

///Fills the hypo that gets stored in the pouch from the internal storage tank. Returns FALSE if you fail to refill your injector
/obj/item/storage/pouch/pressurized_reagent_pouch/proc/fill_autoinjector(obj/item/reagent_containers/hypospray/autoinjector, mob/user)
	if(!inner)
		user.balloon_alert(user, "没有容器！")
		return FALSE
	if(!inner.reagents.total_volume)
		user.balloon_alert(user, "没有剩余试剂！")
		return FALSE
	inner.reagents.trans_to(autoinjector, autoinjector.volume)
	playsound(loc, 'sound/effects/refill.ogg', 25, TRUE, 3)
	autoinjector.update_icon()
	update_icon()

/obj/item/storage/pouch/pressurized_reagent_pouch/examine(mob/user)
	. = ..()
	. += get_display_contents(user)

///Used on examine for properly skilled people to see contents.
/obj/item/storage/pouch/pressurized_reagent_pouch/proc/get_display_contents(mob/user)
	if(isxeno(user))
		return
	if(!(user.skills.getRating(SKILL_MEDICAL) >= SKILL_MEDICAL_NOVICE) && !isobserver(usr)) //Failed skill check
		return span_notice("You don't know what's in it.")
	if(!inner)
		return span_notice("[src] has no container inside!")
	if(!inner.reagents.total_volume)
		return span_notice("[src] is empty!")
	var/list/dat = list()
	dat += "\n \t [span_notice("<b>Total Reagents:</b> [inner.reagents.total_volume]/[inner.volume].")]</br>"
	if(length(inner.reagents.reagent_list) > 0)
		for(var/datum/reagent/R AS in inner.reagents.reagent_list)
			var/percent = round(R.volume / max(0.01 , inner.reagents.total_volume * 0.01),0.01)
			if(R.scannable)
				dat += "\n \t <b>[R]:</b> [R.volume]|[percent]%</br>"
			else
				dat += "\n \t <b>Unknown:</b> [R.volume]|[percent]%</br>"
	return span_notice("[src]'s reagent display shows the following contents: [dat.Join(" ")]")

/obj/item/storage/pouch/pressurized_reagent_pouch/empty //So you can mix to your hearts content
	desc = "A very large reagent pouch. It is used to refill custom injectors, and can also store one. \
	You can Alt-Click to remove the canister in order to refill it. \
	This one is empty, allowing you to freely mix whatever you want."
	chemicals_to_fill = null

/obj/item/storage/pouch/pressurized_reagent_pouch/bktt //Pre-filled with equal parts BKTT and a basic auto injector
	name = "bktt试剂附包"
	desc = "A very large reagent pouch. It is used to refill custom injectors, and can also store one.\
	You can Alt-Click to remove the canister in order to refill it. \
	This one comes preloaded with BKTT."
	chemicals_to_fill = list(
		/datum/reagent/medicine/bicaridine = 300,
		/datum/reagent/medicine/kelotane = 300,
		/datum/reagent/medicine/tramadol = 150, //Half metabolism
		/datum/reagent/medicine/tricordrazine = 300,
	)
