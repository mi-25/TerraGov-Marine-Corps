
///////////////////////////////////////////////Condiments
//Notes by Darem: The condiments food-subtype is for stuff you don't actually eat but you use to modify existing food. They all
//	leave empty containers when used up and can be filled/re-filled with other items. Formatting for first section is identical
//	to mixed-drinks code. If you want an object that starts pre-loaded, you need to make it in addition to the other code.

//Food items that aren't eaten normally and leave an empty container behind.
/obj/item/reagent_containers/food/condiment
	name = "调味品容器"
	desc = "只是个普通的调味品容器。"
	icon = 'icons/obj/items/food/condiment.dmi'
	icon_state = "emptycondiment"
	reagent_flags = OPENCONTAINER
	possible_transfer_amounts = list(1,5,10)
	center_of_mass = list("x"=16, "y"=6)
	volume = 50

/obj/item/reagent_containers/food/condiment/attack_self(mob/user)
	return

/obj/item/reagent_containers/food/condiment/attack(mob/M, mob/user, def_zone)
	var/datum/reagents/R = reagents

	if(!R || !R.total_volume)
		to_chat(user, span_warning("[src.name]是空的！"))
		return 0

	if(iscarbon(M))
		var/mob/living/carbon/H = M
		if(M == user)
			if(ishuman(H) && (H.species.species_flags & ROBOTIC_LIMBS))
				to_chat(H, span_warning("你脑袋上有个显示器，你觉得这玩意儿能往哪儿放？"))
				return
			to_chat(H, span_notice("你吞下了[src]中的一些内容。"))
			if(reagents.total_volume)
				record_reagent_consumption(min(10, reagents.total_volume), reagents.reagent_list, user)
				reagents.trans_to(H, 10)
			playsound(H.loc,'sound/items/drink.ogg', 15, 1)
			return 1
		else
			if(ishuman(H) && (H.species.species_flags & ROBOTIC_LIMBS))
				to_chat(user, span_warning("他们长着个显示器脑袋，你觉得你能往哪儿装？"))
				return
			M.visible_message(span_warning("[user]试图喂[M]吃[src]。"))
			if(!do_after(user, 3 SECONDS, NONE, M, BUSY_ICON_FRIENDLY))
				return
			M.visible_message(span_warning("[user] 给 [M] 喂食 [src]。"))
			var/rgt_list_text = get_reagent_list_text()
			log_combat(user, M, "fed", src, "Reagents: [rgt_list_text]")
			if(reagents.total_volume)
				record_reagent_consumption(min(10, reagents.total_volume), reagents.reagent_list, user, M)
				reagents.reaction(M, INGEST)
				reagents.trans_to(M, 10)
			playsound(M.loc,'sound/items/drink.ogg', 15, 1)
			return 1
	return 0

/obj/item/reagent_containers/food/condiment/attackby(obj/item/I, mob/user)
	return

/obj/item/reagent_containers/food/condiment/afterattack(obj/target, mob/user , flag)
	if(istype(target, /obj/structure/reagent_dispensers)) //A dispenser. Transfer FROM it TO us.

		if(!target.reagents.total_volume)
			to_chat(user, span_warning("[target] 已空。"))
			return

		if(reagents.holder_full())
			to_chat(user, span_warning("[src]已满。"))
			return

		var/trans = target.reagents.trans_to(src, target:amount_per_transfer_from_this)
		to_chat(user, span_notice("你将[src]装满了[target]中的[trans]单位内容物。"))

	//Something like a glass or a food item. Player probably wants to transfer TO it.
	else if(target.is_injectable() && !isliving(target))
		if(!reagents.total_volume)
			to_chat(user, span_warning("[src]是空的。"))
			return
		if(target.reagents.total_volume >= target.reagents.maximum_volume)
			to_chat(user, span_warning("你无法再向[target]添加更多物品。"))
			return
		var/trans = src.reagents.trans_to(target, amount_per_transfer_from_this)
		to_chat(user, span_notice("你将[trans]单位的调味料转移到[target]。"))

/obj/item/reagent_containers/food/condiment/on_reagent_change()
	if(icon_state == "saltshakersmall" || icon_state == "peppermillsmall")
		return
	if(length(reagents.reagent_list) > 0)
		switch(reagents.get_master_reagent_id())
			if(/datum/reagent/consumable/ketchup)
				name = "番茄酱"
				desc = "你已经感觉更像个美国人了。"
				icon_state = "ketchup"
				center_of_mass = list("x"=16, "y"=6)
			if(/datum/reagent/consumable/capsaicin)
				name = "辣酱"
				desc = "你几乎能尝到胃溃疡的滋味了！"
				icon_state = "hotsauce"
				center_of_mass = list("x"=16, "y"=6)
			if(/datum/reagent/consumable/enzyme)
				name = "通用酶"
				desc = "用于烹饪各种菜肴。"
				icon_state = "enzyme"
				center_of_mass = list("x"=16, "y"=6)
			if(/datum/reagent/consumable/soysauce)
				name = "酱油"
				desc = "一种咸味的大豆调味料。"
				icon_state = "soysauce"
				center_of_mass = list("x"=16, "y"=6)
			if(/datum/reagent/consumable/frostoil)
				name = "冷酱"
				desc = "经过时会让舌头麻木。"
				icon_state = "coldsauce"
				center_of_mass = list("x"=16, "y"=6)
			if(/datum/reagent/consumable/sodiumchloride)
				name = "盐瓶"
				desc = "盐。来自太空海洋，大概是。"
				icon_state = "saltshaker"
				center_of_mass = list("x"=16, "y"=10)
			if(/datum/reagent/consumable/blackpepper)
				name = "胡椒研磨器"
				desc = "常用于给食物调味或让人打喷嚏。"
				icon_state = "peppermillsmall"
				center_of_mass = list("x"=16, "y"=10)
			if(/datum/reagent/consumable/cornoil)
				name = "玉米油"
				desc = "一种美味的食用油，用于烹饪。由玉米制成。"
				icon_state = "oliveoil"
				center_of_mass = list("x"=16, "y"=6)
			if(/datum/reagent/consumable/sugar)
				name = "糖"
				desc = "美味的太空糖！"
				center_of_mass = list("x"=16, "y"=6)
			else
				name = "杂项调味瓶"
				if (length(reagents.reagent_list) == 1)
					desc = "看起来是[reagents.get_master_reagent_name()]，但你不确定。"
				else
					desc = "多种调味料的混合物。[reagents.get_master_reagent_name()] 是其中之一。"
					icon_state = "mixedcondiments"
					center_of_mass = list("x"=16, "y"=6)
	else
		icon_state = "emptycondiment"
		name = "调味瓶"
		desc = "一个空的调味瓶。"
		center_of_mass = list("x"=16, "y"=6)
		return

/obj/item/reagent_containers/food/condiment/enzyme
	name = "通用酶"
	desc = "用于烹饪各种菜肴。"
	icon_state = "enzyme"
	list_reagents = list(/datum/reagent/consumable/enzyme = 50)

/obj/item/reagent_containers/food/condiment/sugar
	list_reagents = list(/datum/reagent/consumable/sugar = 50)

/obj/item/reagent_containers/food/condiment/saltshaker		//Seperate from above since it's a small shaker rather then
	name = "盐瓶"											//	a large one.
	desc = "盐。来自太空海洋，大概是。"
	icon_state = "saltshakersmall"
	possible_transfer_amounts = list(1,20) //for clown turning the lid off
	amount_per_transfer_from_this = 1
	volume = 20
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 20)

/obj/item/reagent_containers/food/condiment/peppermill
	name = "胡椒研磨器"
	desc = "常用于给食物调味或让人打喷嚏。"
	icon_state = "peppermillsmall"
	possible_transfer_amounts = list(1,20) //for clown turning the lid off
	amount_per_transfer_from_this = 1
	volume = 20
	list_reagents = list(/datum/reagent/consumable/blackpepper = 20)
