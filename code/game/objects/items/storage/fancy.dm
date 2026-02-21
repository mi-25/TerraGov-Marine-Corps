/*
* The 'fancy' path is for objects like donut boxes that show how many items are in the storage item on the sprite itself
* .. Sorry for the shitty path name, I couldnt think of a better one.
*
* WARNING: var/icon_type is used for both examine text and sprite name. Please look at the procs below and adjust your sprite names accordingly
*
* Contains:
*		Donut Box
*		Egg Box
*		Candle Box
*		Crayon Box
*		Cigarette Box
*/

/obj/item/storage/fancy
	icon = 'icons/obj/items/food/food.dmi'
	icon_state = "donutbox6"
	name = "甜甜圈盒"
	var/icon_type = "donut"
	var/spawn_type
	var/spawn_number

/obj/item/storage/fancy/Initialize(mapload, ...)
	. = ..()
	if(spawn_type)
		storage_datum.set_holdable(can_hold_list = list(spawn_type))
	if(spawn_type)
		for(var/i in 1 to spawn_number)
			new spawn_type(src)

/obj/item/storage/fancy/update_icon_state()
	. = ..()
	icon_state = "[icon_type]box[length(contents)]"

/obj/item/storage/fancy/examine(mob/user)
	. = ..()
	switch(length(contents))
		if(0)
			. += "There are no [icon_type]s left in the box."
		if(1)
			. += "There is one [icon_type] left in the box."
		if(2 to INFINITY)
			. += "There are [length(contents)] [icon_type]s in the box."

/*
* Egg Box
*/
/obj/item/storage/fancy/egg_box
	icon = 'icons/obj/items/food/packaged.dmi'
	icon_state = "eggbox"
	icon_type = "egg"
	name = "蛋盒"
	spawn_type = /obj/item/reagent_containers/food/snacks/egg
	spawn_number = 12

/obj/item/storage/fancy/egg_box/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 12
	storage_datum.max_storage_space = 24

/*
* Candle Box
*/
/obj/item/storage/fancy/candle_box
	name = "蜡烛包"
	desc = "一包红色蜡烛。"
	icon = 'icons/obj/items/candle.dmi'
	icon_state = "candlebox5"
	icon_type = "candle"
	worn_icon_state = "candlebox5"
	throwforce = 2
	equip_slot_flags = ITEM_SLOT_BELT
	spawn_type = /obj/item/tool/candle
	spawn_number = 5

/obj/item/storage/fancy/candle_box/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 5

/*
* Crayon Box
*/
/obj/item/storage/fancy/crayons
	name = "一盒蜡笔"
	desc = "一盒蜡笔，满足你绘制符文的所有需求。"
	icon = 'icons/obj/items/crayons.dmi'
	icon_state = "crayonbox"
	w_class = WEIGHT_CLASS_SMALL
	icon_type = "crayon"

/obj/item/storage/fancy/crayons/Initialize(mapload)
	. = ..()
	storage_datum.storage_slots = 6
	storage_datum.set_holdable(can_hold_list = list(/obj/item/toy/crayon))

/obj/item/storage/fancy/crayons/PopulateContents()
	new /obj/item/toy/crayon/red(src)
	new /obj/item/toy/crayon/orange(src)
	new /obj/item/toy/crayon/yellow(src)
	new /obj/item/toy/crayon/green(src)
	new /obj/item/toy/crayon/blue(src)
	new /obj/item/toy/crayon/purple(src)
	update_icon()

/obj/item/storage/fancy/crayons/update_overlays()
	. = ..()
	. += image('icons/obj/items/crayons.dmi',"crayonbox")
	for(var/obj/item/toy/crayon/crayon in contents)
		. += image('icons/obj/items/crayons.dmi',crayon.colourName)

/obj/item/storage/fancy/crayons/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/toy/crayon))
		var/obj/item/toy/crayon/C = I
		switch(C.colourName)
			if("mime")
				to_chat(user, "这支蜡笔太过悲伤，无法被这个盒子所容纳。")
			if("rainbow")
				to_chat(user, "这支蜡笔的力量过于强大，无法被这个盒子所容纳。")

////////////
//CIG PACK//
////////////
/obj/item/storage/fancy/cigarettes
	name = "香烟盒"
	desc = "太空奥运会赞助商，太空香烟最受欢迎的品牌。"
	icon = 'icons/obj/items/cigarettes.dmi'
	icon_state = "cigpacket"
	worn_icon_state = "cigpacket"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 2
	equip_slot_flags = ITEM_SLOT_BELT
	icon_type = "cigarette"
	spawn_type = /obj/item/clothing/mask/cigarette
	spawn_number = 18

/obj/item/storage/fancy/cigarettes/Initialize(mapload, ...)
	. = ..()
	storage_datum.max_storage_space = 18
	storage_datum.storage_slots = 18
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/clothing/mask/cigarette,
		/obj/item/tool/lighter,
	))

/obj/item/storage/fancy/cigarettes/update_icon_state()
	. = ..()
	icon_state = "[initial(icon_state)][length(contents)]"

/obj/item/storage/fancy/cigarettes/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!istype(M, /mob))
		return

	if(M == user && user.zone_selected == "mouth" && length(contents) > 0 && !user.wear_mask)
		var/obj/item/clothing/mask/cigarette/C = locate() in src
		if(C)
			storage_datum.remove_from_storage(C, get_turf(user), user)
			user.equip_to_slot_if_possible(C, SLOT_WEAR_MASK)
			to_chat(user, span_notice("你从烟盒里抽出一支香烟。"))
			update_icon()
	else
		..()

/obj/item/storage/fancy/chemrettes
	name = "化学包"
	desc = "地球政府，化学填充，香烟。现在有额外口味！"
	icon = 'icons/obj/items/cigarettes.dmi'
	icon_state = "chempacketbox"
	worn_icon_state = "chempacketbox"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 2
	equip_slot_flags = ITEM_SLOT_BELT
	icon_type = "chempacket"

/obj/item/storage/fancy/chemrettes/Initialize(mapload, ...)
	. = ..()
	storage_datum.max_storage_space = 18
	storage_datum.storage_slots = 18
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/clothing/mask/cigarette,
		/obj/item/tool/lighter,
		/obj/item/storage/box/matches,
	))

/obj/item/storage/fancy/chemrettes/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/clothing/mask/cigarette/bica(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/mask/cigarette/kelo(src)
	for(var/i in 1 to 5)
		new /obj/item/clothing/mask/cigarette/tram(src)
	for(var/i in 1 to 5)
		new /obj/item/clothing/mask/cigarette/antitox(src)
	new /obj/item/tool/lighter(src)

/obj/item/storage/fancy/chemrettes/update_icon_state()
	. = ..()
	icon_state = "[initial(icon_state)][length(contents)]"

/obj/item/storage/fancy/cigarettes/dromedaryco
	name = "\improper 纳米传讯黄金数据包"
	desc = "建设更美好的世界，卷制更优质的香烟。这些精致的香烟是纳米传讯进军市场的产品。背后有强大的法律团队支持。"
	icon_state = "ntpacket"
	worn_icon_state = "ntpacket"

/obj/item/storage/fancy/cigarettes/luckystars
	name = "\improper 幸运星烟包"
	desc = "一种由合成人培育的烟草调制而成的柔和混合烟。其广告歌保证会让你过耳不忘。"
	icon_state = "lspacket"
	worn_icon_state = "lspacket"

/obj/item/storage/fancy/cigarettes/kpack
	name = "\improper 库兰德黄金烟包"
	desc = "库兰德，黄金：3%烟草。97%其他成分。当你想要看起来很酷，而缓慢而可怕的死亡风险并非真正考虑因素时使用。"
	icon_state = "kpacket"
	worn_icon_state = "kpacket"

/obj/item/storage/fancy/cigarettes/lady_finger
	name = "\improper 北极酷薄荷烟包"
	desc = "一款入门级香烟，包装为亮蓝色。让你闻起来像润喉糖和烟味。"
	icon_state = "acpacket"
	worn_icon_state = "acpacket"

/obj/item/storage/fancy/cigar
	name = "雪茄盒"
	desc = "一个在你未吸烟时存放雪茄的盒子。"
	icon_state = "cigarcase"
	worn_icon_state = "cigarcase"
	icon = 'icons/obj/items/cigarettes.dmi'
	throwforce = 2
	w_class = WEIGHT_CLASS_SMALL
	equip_slot_flags = ITEM_SLOT_BELT
	spawn_type = /obj/item/clothing/mask/cigarette/cigar
	spawn_number = 7
	icon_type = "cigar"

/obj/item/storage/fancy/cigar/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 7

/obj/item/storage/fancy/cigar/update_icon_state()
	. = ..()
	icon_state = "[initial(icon_state)][length(contents)]"

/obj/item/storage/fancy/cigar/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!istype(M, /mob))
		return

	if(M == user && user.zone_selected == "mouth" && length(contents) > 0 && !user.wear_mask)
		var/obj/item/clothing/mask/cigarette/cigar/C = locate() in src
		if(C)
			storage_datum.remove_from_storage(C, get_turf(user), user)
			user.equip_to_slot_if_possible(C, SLOT_WEAR_MASK)
			to_chat(user, span_notice("你从盒子里取出一支雪茄。"))
			update_icon()
	else
		..()

/*
* Vial Box
*/
/obj/item/storage/fancy/vials
	icon = 'icons/obj/items/storage/vialbox.dmi'
	icon_state = "vialbox6"
	icon_type = "vial"
	name = "试管储存盒"
	spawn_type = /obj/item/reagent_containers/glass/beaker/vial
	spawn_number = 6

/obj/item/storage/fancy/vials/Initialize(mapload, ...)
	. = ..()
	storage_datum.max_w_class = WEIGHT_CLASS_NORMAL
	storage_datum.set_holdable(can_hold_list = list(/obj/item/reagent_containers/glass/beaker/vial))
	storage_datum.max_storage_space = 14 //The sum of the w_classes of all the items in this storage item.
	storage_datum.storage_slots = 6
	update_icon()

/obj/item/storage/fancy/vials/update_icon_state()
	. = ..()
	icon_state = "vialbox[length(contents)]"

/obj/item/storage/fancy/vials/prison
	icon = 'icons/obj/machines/virology.dmi'

/obj/item/storage/lockbox/vials
	name = "安全储存盒"
	desc = "一个上了锁的盒子，用来防止孩子拿到里面的东西。"
	icon = 'icons/obj/items/storage/vialbox.dmi'
	icon_state = "vialbox0"
	worn_icon_state = "syringe_kit"
	req_access = list(ACCESS_MARINE_MEDBAY)

/obj/item/storage/lockbox/vials/Initialize(mapload, ...)
	. = ..()
	storage_datum.max_w_class = WEIGHT_CLASS_NORMAL
	storage_datum.set_holdable(can_hold_list = list(/obj/item/reagent_containers/glass/beaker/vial))
	storage_datum.max_storage_space = 14 //The sum of the w_classes of all the items in this storage item.
	storage_datum.storage_slots = 6
	update_icon()

/obj/item/storage/lockbox/vials/update_icon_state()
	. = ..()
	icon_state = "vialbox[length(contents)]"

/obj/item/storage/lockbox/vials/update_overlays()
	. = ..()
	if (!broken)
		. += image(icon, src, "led[locked]")
		if(locked)
			. += image(icon, src, "cover")
	else
		. += image(icon, src, "ledb")

/obj/item/storage/lockbox/vials/attackby(obj/item/I, mob/user, params)
	. = ..()
	update_icon()
