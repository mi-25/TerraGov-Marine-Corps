////////////////////////////////////////////////////////////////////////////////
/// Drinks.
////////////////////////////////////////////////////////////////////////////////
/obj/item/reagent_containers/cup/glass
	name = "饮用"
	desc = "美味"
	icon = 'icons/obj/drinks/drinks.dmi'
	icon_state = "glass_empty"
	possible_transfer_amounts = list(5,10,15,20,25,30,50)
	resistance_flags = NONE
	can_shatter = TRUE

/obj/item/reagent_containers/cup/glass/throw_impact(atom/hit_atom, speed, bounce)
	. = ..()
	smash(hit_atom, TRUE)

/obj/item/reagent_containers/cup/glass/proc/smash(atom/target, ranged = FALSE, break_top = FALSE)
	if(!can_shatter)
		return
	if(QDELING(src) || !target) //Invalid loc
		return
	var/obj/item/broken_bottle/B = new (loc)
	B.mimic_broken(src, target, break_top)
	qdel(src)
	target.Bumped(B)

///////////////////////////////////////////////Drinks
//Notes by Darem: Drinks are simply containers that start preloaded. Unlike condiments, the contents can be ingested directly
// rather then having to add it to something else first. They should only contain liquids. They have a default container size of 50.
// Formatting is the same as food.

/obj/item/reagent_containers/cup/glass/coffee
	name = "强力咖啡"
	desc = "小心，您即将享用的饮料非常烫。"
	icon = 'icons/obj/drinks/coffee.dmi'
	icon_state = "coffee"
	base_icon_state = "coffee"
	list_reagents = list(/datum/reagent/consumable/coffee = 30)
	can_shatter = FALSE
	drink_type = BREAKFAST
	var/lid_open = FALSE

/obj/item/reagent_containers/cup/glass/coffee/no_lid
	icon_state = "coffee_empty"
	list_reagents = null

/obj/item/reagent_containers/cup/glass/coffee/examine(mob/user)
	. = ..()
	. += span_notice("Alt-click to toggle cup lid.")

/obj/item/reagent_containers/cup/glass/coffee/AltClick(mob/user)
	. = ..()
	lid_open = !lid_open
	update_icon_state()

/obj/item/reagent_containers/cup/glass/coffee/update_icon_state()
	. = ..()
	if(lid_open)
		icon_state = reagents.total_volume ? "[base_icon_state]_full" : "[base_icon_state]_empty"
	else
		icon_state = base_icon_state

/obj/item/reagent_containers/cup/glass/ice
	name = "冰杯"
	desc = "小心，冰块很凉，不要咀嚼。"
	icon_state = "icecup"
	list_reagents = list(/datum/reagent/consumable/ice = 30)
	can_shatter = FALSE

/obj/item/reagent_containers/cup/glass/mug // parent type is literally just so empty mug sprites are a thing
	name = "马克杯"
	desc = "一杯盛在雅致马克杯中的饮品。"
	icon = 'icons/obj/drinks/coffee.dmi'
	icon_state = "tea_empty"
	base_icon_state = "tea"

/obj/item/reagent_containers/cup/glass/mug/update_icon_state()
	icon_state = "[base_icon_state][reagents.total_volume ? null : "_empty"]"
	return ..()

/obj/item/reagent_containers/cup/glass/mug/tea
	name = "杜克紫茶"
	desc = "对紫公爵的侮辱就是对太空女王的侮辱！任何一位真正的绅士都会与你决斗，如果你玷污了这杯茶。"
	icon_state = "tea"
	list_reagents = list(/datum/reagent/consumable/tea = 30)

/obj/item/reagent_containers/cup/glass/mug/coco
	name = "荷兰热可可"
	desc = "太空南美制造。"
	icon_state = "tea"
	list_reagents = list(/datum/reagent/consumable/hot_coco = 15, /datum/reagent/consumable/sugar = 5)
	drink_type = SUGAR

/obj/item/reagent_containers/cup/glass/mug/nanotrasen
	name = "\improper 纳米传讯马克杯"
	desc = "一个展示你企业自豪感的杯子。"
	icon_state = "mug_nt_empty"
	base_icon_state = "mug_nt"

/obj/item/reagent_containers/cup/glass/coffee_cup
	name = "咖啡杯"
	desc = "一个热塑成型的塑料咖啡杯。理论上也可以用来装其他热饮，如果你有冒险精神的话。"
	icon = 'icons/obj/drinks/coffee.dmi'
	icon_state = "coffee_cup_e"
	base_icon_state = "coffee_cup"
	possible_transfer_amounts = list(10)
	volume = 30
	can_shatter = FALSE

/obj/item/reagent_containers/cup/glass/coffee_cup/update_icon_state()
	icon_state = reagents.total_volume ? base_icon_state : "[base_icon_state]_e"
	return ..()

/obj/item/reagent_containers/cup/glass/dry_ramen
	name = "杯面"
	desc = "只需加入5毫升水，即可自热！让你重温校园时光的味道。现已推出咸味新口味！"
	icon_state = "ramen"
	list_reagents = list(/datum/reagent/consumable/dry_ramen = 15, /datum/reagent/consumable/salt = 3)
	drink_type = GRAIN
	can_shatter = FALSE

/obj/item/reagent_containers/cup/glass/waterbottle
	name = "水瓶"
	desc = "一瓶在古老地球装瓶厂灌装的水。"
	icon = 'icons/obj/drinks/bottles.dmi'
	icon_state = "smallbottle"
	list_reagents = list(/datum/reagent/water = 49.5, /datum/reagent/fluorine = 0.5)//see desc, don't think about it too hard
	volume = 50
	amount_per_transfer_from_this = 10
	fill_icon_thresholds = list(0, 10, 25, 50, 75, 80, 90)
	can_shatter = FALSE
	// The 2 bottles have separate cap overlay icons because if the bottle falls over while bottle flipping the cap stays fucked on the moved overlay
	var/cap_icon = 'icons/obj/drinks/drink_effects.dmi'
	var/cap_icon_state = "bottle_cap_small"
	var/cap_on = TRUE
	var/cap_lost = FALSE
	var/mutable_appearance/cap_overlay
	var/flip_chance = 10

/obj/item/reagent_containers/cup/glass/waterbottle/Initialize(mapload)
	cap_overlay = mutable_appearance(cap_icon, cap_icon_state)
	return ..()

/obj/item/reagent_containers/cup/glass/waterbottle/update_overlays()
	. = ..()
	if(cap_on)
		. += cap_overlay

/obj/item/reagent_containers/cup/glass/waterbottle/examine(mob/user)
	. = ..()
	if(cap_lost)
		. += span_notice("The cap seems to be missing.")
	else if(cap_on)
		. += span_notice("The cap is firmly on to prevent spilling. Alt-click to remove the cap.")
	else
		. += span_notice("The cap has been taken off. Alt-click to put a cap on.")

/obj/item/reagent_containers/cup/glass/waterbottle/AltClick(mob/user)
	. = ..()
	if(cap_lost)
		to_chat(user, span_warning("舰长好像不见了！他去哪儿了？"))
		return

	if(cap_on)
		cap_on = FALSE
		animate(src, transform = null, time = 2, loop = 0)
		to_chat(user, span_notice("你拧开了[src]的盖子。"))
		playsound(loc, 'sound/effects/can_open1.ogg', 50, TRUE)
	else
		cap_on = TRUE
		to_chat(user, span_notice("你将瓶盖盖在[src]上。"))
	update_appearance()

/obj/item/reagent_containers/cup/glass/waterbottle/is_refillable()
	if(cap_on)
		return FALSE
	return ..()

/obj/item/reagent_containers/cup/glass/waterbottle/is_drainable()
	if(cap_on)
		return FALSE
	return ..()

/obj/item/reagent_containers/cup/glass/waterbottle/attack(mob/target, mob/living/user, def_zone)
	if(!target)
		return

	if(cap_on && reagents.total_volume && istype(target))
		to_chat(user, span_warning("你必须先取下弹匣才能这么做！"))
		return

	return ..()

/obj/item/reagent_containers/cup/glass/waterbottle/afterattack(atom/target, mob/user, has_proximity, click_parameters)
	if(!has_proximity)
		return FALSE

	if(cap_on && (target.is_refillable() || target.is_drainable() || (reagents.total_volume && user.a_intent != INTENT_HARM)))
		to_chat(user, span_warning("你必须先取下保护盖才能这么做！"))
		return

	else if(istype(target, /obj/item/reagent_containers/cup/glass/waterbottle))
		var/obj/item/reagent_containers/cup/glass/waterbottle/other_bottle = target
		if(other_bottle.cap_on)
			to_chat(user, span_warning("[other_bottle] 的瓶盖拧得很紧！"))
			return

	return ..()

// heehoo bottle flipping
/obj/item/reagent_containers/cup/glass/waterbottle/throw_impact(atom/hit_atom, speed, bounce)
	. = ..()
	if(QDELETED(src))
		return
	if(!cap_on || !reagents.total_volume)
		return
	if(prob(flip_chance)) // landed upright
		visible_message(span_notice("[src] 平稳着陆！"))
	else // landed on it's side
		animate(src, transform = matrix(prob(50)? 90 : -90, MATRIX_ROTATE), time = 3, loop = 0)

/obj/item/reagent_containers/cup/glass/waterbottle/pickup(mob/user)
	. = ..()
	animate(src, transform = null, time = 1, loop = 0)

/obj/item/reagent_containers/cup/glass/waterbottle/empty
	list_reagents = list()
	cap_on = FALSE

/obj/item/reagent_containers/cup/glass/waterbottle/large
	desc = "一瓶全新的大容量商用瓶装水。"
	icon_state = "largebottle"
	list_reagents = list(/datum/reagent/water = 100)
	volume = 100
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,20,25,30,50,100)
	cap_icon_state = "bottle_cap"

/obj/item/reagent_containers/cup/glass/waterbottle/large/empty
	list_reagents = list()
	cap_on = FALSE

// Admin spawn
/obj/item/reagent_containers/cup/glass/waterbottle/relic
	name = "神秘瓶子"
	desc = "一个与水壶非常相似的瓶子，但上面用马克笔潦草地写着一些字。它似乎在散发着某种能量。"
	flip_chance = 100 // FLIPP

/obj/item/reagent_containers/cup/glass/waterbottle/relic/Initialize(mapload)
	var/reagent_id = get_random_reagent_id()
	var/datum/reagent/random_reagent = new reagent_id
	list_reagents = list(random_reagent.type = 50)
	. = ..()
	desc += span_notice("The writing reads '[random_reagent.name]'.")
	update_appearance()


/obj/item/reagent_containers/cup/glass/sillycup
	name = "纸杯"
	desc = "一个纸水杯。"
	icon_state = "water_cup_e"
	possible_transfer_amounts = list(10)
	volume = 10
	can_shatter = FALSE

/obj/item/reagent_containers/cup/glass/sillycup/update_icon_state()
	icon_state = reagents.total_volume ? "water_cup" : "water_cup_e"
	return ..()

/obj/item/reagent_containers/cup/glass/bottle/juice/smallcarton
	name = "小型纸盒"
	desc = "一个小纸盒，用于盛放饮料。"
	icon = 'icons/obj/drinks/boxes.dmi'
	icon_state = "juicebox"
	volume = 15
	drink_type = NONE

/obj/item/reagent_containers/cup/glass/bottle/juice/smallcarton/Initialize(mapload, vol)
	. = ..()
	AddComponent( \
		/datum/component/takes_reagent_appearance, \
		on_icon_changed = CALLBACK(src, PROC_REF(on_cup_change)), \
		on_icon_reset = CALLBACK(src, PROC_REF(on_cup_reset)), \
		base_container_type = /obj/item/reagent_containers/cup/glass/bottle/juice/smallcarton, \
	)

/obj/item/reagent_containers/cup/glass/bottle/juice/smallcarton/smash(atom/target, mob/thrower, ranged = FALSE)
	try_splash(thrower, target)
	var/obj/item/broken_bottle/bottle_shard = new (loc)
	bottle_shard.mimic_broken(src, target)
	qdel(src)
	target.Bumped(bottle_shard)

/obj/item/reagent_containers/cup/glass/colocup
	name = "colo杯"
	desc = "一种廉价、批量生产的杯子款式，通常在派对上使用。不知为何，它们似乎永远不会变成红色……"
	icon = 'icons/obj/drinks/colo.dmi'
	icon_state = "colocup"
	possible_transfer_amounts = list(5, 10, 15, 20)
	volume = 20
	amount_per_transfer_from_this = 5
	can_shatter = FALSE
	/// Allows the lean sprite to display upon crafting
	var/random_sprite = TRUE

/obj/item/reagent_containers/cup/glass/colocup/Initialize(mapload)
	. = ..()
	pixel_x = rand(-4,4)
	pixel_y = rand(-4,4)
	if(!random_sprite)
		return
	icon_state = "colocup[rand(0, 6)]"
	if(icon_state == "colocup6")
		desc = "一种廉价、批量生产的杯子款式，通常用于派对。哇，这个是红色的！搞什么鬼？"

//////////////////////////drinkingglass and shaker//
//Note by Darem: This code handles the mixing of drinks. New drinks go in three places: In Chemistry-Reagents.dm (for the drink
// itself), in Chemistry-Recipes.dm (for the reaction that changes the components into the drink), and here (for the drinking glass
// icon states.

/obj/item/reagent_containers/cup/glass/flask
	name = "烧瓶"
	desc = "每个优秀的太空人都知道，无论去哪儿，带上几品脱威士忌总是个好主意。"
	icon = 'icons/obj/drinks/bottles.dmi'
	icon_state = "flask"
	volume = 60
	can_shatter = FALSE

/obj/item/reagent_containers/cup/glass/flask/gold
	name = "舰长的酒壶"
	desc = "舰长的金色酒壶。"
	icon_state = "flask_gold"

/obj/item/reagent_containers/cup/glass/flask/det
	name = "侦探的酒壶"
	desc = "侦探唯一真正的朋友。"
	icon_state = "detflask"
	list_reagents = list(/datum/reagent/consumable/ethanol/whiskey = 30)

/obj/item/reagent_containers/cup/glass/flask/det/minor
	list_reagents = list(/datum/reagent/consumable/applejuice = 30)

/obj/item/reagent_containers/cup/glass/mug/britcup
	name = "杯子"
	desc = "一个印有英国国旗图案的杯子。"
	icon = 'icons/obj/drinks/coffee.dmi'
	icon_state = "britcup_empty"
	base_icon_state = "britcup"
	volume = 30
