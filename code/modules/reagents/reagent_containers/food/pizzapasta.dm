/////////////////////////////////////////////////PIZZA////////////////////////////////////////

/obj/item/reagent_containers/food/snacks/pizzapasta
	icon = 'icons/obj/items/food/pizzaspaghetti.dmi'
	slices_num = 6
	bitesize = 1
	filling_color = "#BAA14C"
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta
	icon = 'icons/obj/items/food/pizzaspaghetti.dmi'
	bitesize = 1
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/margherita
	name = "玛格丽塔"
	desc = "披萨界的黄金标准。"
	icon_state = "pizzamargherita"
	slice_path = /obj/item/reagent_containers/food/snacks/pizzapasta/margheritaslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 40, /datum/reagent/consumable/tomatojuice = 6)
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/margheritaslice
	name = "玛格丽塔披萨片"
	desc = "一片经典披萨。"
	icon_state = "pizzamargheritaslice"
	filling_color = "#BAA14C"
	bitesize = 2
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/meatpizza
	name = "肉披萨"
	desc = "一份肉料披萨。"
	icon_state = "meatpizza"
	slice_path = /obj/item/reagent_containers/food/snacks/pizzapasta/meatpizzaslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 50, /datum/reagent/consumable/tomatojuice = 6)
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "meat" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/meatpizzaslice
	name = "肉披萨切片"
	desc = "一片肉感十足的披萨。"
	icon_state = "meatpizzaslice"
	filling_color = "#BAA14C"
	bitesize = 2
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "meat" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/mushroompizza
	name = "蘑菇披萨"
	desc = "特制披萨"
	icon_state = "mushroompizza"
	slice_path = /obj/item/reagent_containers/food/snacks/pizzapasta/mushroompizzaslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 35)
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "mushroom" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/mushroompizzaslice
	name = "蘑菇披萨切片"
	desc = "也许这是你人生中最后一片披萨。"
	icon_state = "mushroompizzaslice"
	filling_color = "#BAA14C"
	bitesize = 2
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "mushroom" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/vegetablepizza
	name = "蔬菜披萨"
	desc = "制作此披萨时未伤害任何番茄智人。"
	icon_state = "vegetablepizza"
	slice_path = /obj/item/reagent_containers/food/snacks/pizzapasta/vegetablepizzaslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 30, /datum/reagent/consumable/tomatojuice = 6, /datum/reagent/medicine/imidazoline = 12)
	tastes = list("crust" = 1, "tomato" = 2, "cheese" = 1, "carrot" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/vegetablepizzaslice
	name = "蔬菜披萨切片"
	desc = "一片最绿的披萨，不含任何绿色配料"
	icon_state = "vegetablepizzaslice"
	filling_color = "#BAA14C"
	bitesize = 2
	tastes = list("crust" = 1, "tomato" = 2, "cheese" = 1, "carrot" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/donkpocket
	name = "唐克口袋披萨"
	desc = "谁觉得这是个好主意？"
	icon_state = "donkpocketpizza"
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/protein = 15, /datum/reagent/consumable/tomatojuice = 6, /datum/reagent/medicine/tricordrazine = 10, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "meat" = 1, "laziness" = 1)
	slice_path = /obj/item/reagent_containers/food/snacks/pizzapasta/donkpocket

/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/donkpocket/raw
	name = "生冷多克包披萨"
	icon_state = "donkpocketpizza_raw"
	slice_path = /obj/item/reagent_containers/food/snacks/pizzapasta/donkpocket

/obj/item/reagent_containers/food/snacks/pizzapasta/donkpocket
	name = "唐克口袋披萨片"
	desc = "闻起来像唐克波奇饼。"
	icon_state = "donkpocketpizzaslice"
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "meat" = 1, "laziness" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/dank
	name = "美味披萨"
	desc = "嬉皮士最爱的披萨。"
	icon_state = "dankpizza"
	list_reagents = list(/datum/reagent/consumable/nutriment = 25, /datum/reagent/consumable/doctor_delight = 5, /datum/reagent/consumable/tomatojuice = 6, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "meat" = 1)
	slice_path = /obj/item/reagent_containers/food/snacks/pizzapasta/dank

/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/dank/raw
	name = "生鲜披萨"
	icon_state = "dankpizza_raw"
	slice_path = /obj/item/reagent_containers/food/snacks/pizzapasta/dank

/obj/item/reagent_containers/food/snacks/pizzapasta/dank
	name = "美味披萨切片"
	desc = "真爽啊，兄弟..."
	icon_state = "dankpizzaslice"
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "meat" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/sassysage
	name = "萨西披萨"
	desc = "你几乎能尝到那股傲慢劲儿。"
	icon_state = "sassysagepizza"
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/protein = 15, /datum/reagent/consumable/tomatojuice = 6, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "meat" = 1)
	slice_path = /obj/item/reagent_containers/food/snacks/pizzapasta/sassysage

/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/sassysage/raw
	name = "生萨吉披萨"
	icon_state = "sassysagepizza_raw"

/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/pineapple
	name = "\improper 夏威夷披萨"
	desc = "披萨界的爱因斯坦谜题。"
	icon_state = "pineapplepizza"
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/tomatojuice = 6, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "pineapple" = 2, "ham" = 2)
	slice_path = /obj/item/reagent_containers/food/snacks/pizzapasta/pineapple

/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/pineapple/raw
	name = "生夏威夷披萨"
	icon_state = "pineapplepizza_raw"
	slice_path = null

/obj/item/reagent_containers/food/snacks/pizzapasta/pineapple
	name = "\improper 夏威夷披萨切片"
	desc = "一片美味的争议。"
	icon_state = "pineapplepizzaslice"
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "pineapple" = 2, "ham" = 2)

/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/ants
	name = "\improper 异形派对披萨"
	desc = "/// 充满漏洞，记得修复"
	icon_state = "antpizza"
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/tomatojuice = 10, /datum/reagent/consumable/nutriment/vitamin = 4, /datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "insects" = 1)
	slice_path = /obj/item/reagent_containers/food/snacks/pizzapasta/ants

/obj/item/reagent_containers/food/snacks/pizzapasta/ants
	name = "\improper 蚂蚁派对披萨切片"
	desc = "完美披萨的关键在于不要放太多蚂蚁。"
	icon_state = "antpizzaslice"
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "insects" = 1)

/obj/item/pizzabox
	name = "披萨盒"
	desc = "适合装披萨的盒子。"
	icon = 'icons/obj/items/food/pizzaspaghetti.dmi'
	icon_state = "pizzabox1"

	var/open = 0 // Is the box open?
	var/ismessy = 0 // Fancy mess on the lid
	var/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/pizza // Content pizza
	var/list/boxes = list() // If the boxes are stacked, they come here
	var/boxtag = ""

/obj/item/pizzabox/update_desc(updates)
	. = ..()
	if(open && pizza)
		desc = "一个适合装披萨的盒子。里面似乎有一个[pizza.name]。"
	else if(boxes.len > 0)
		desc = "一堆适合装披萨的盒子。这堆里似乎有[boxes.len + 1]个盒子。"

		var/obj/item/pizzabox/topbox = boxes[boxes.len]
		var/toptag = topbox.boxtag
		if(toptag != "")
			desc = "[desc] 顶部的盒子上有个标签，上面写着：'[toptag]'。"
	else
		desc = "适合装披萨的盒子。"

		if(boxtag != "")
			desc = "[desc] 箱子上贴着一个标签，上面写着：'[boxtag]'。"

/obj/item/pizzabox/update_icon_state()
	. = ..()
	if(open)
		if(ismessy)
			icon_state = "pizzabox_messy"
		else
			icon_state = "pizzabox_open"
		return

	icon_state = "pizzabox[boxes.len+1]"

/obj/item/pizzabox/update_overlays()
	. = ..()
	if(open && pizza)
		var/image/pizzaimg = image("pizzaspaghetti.dmi", icon_state = pizza.icon_state)
		pizzaimg.pixel_z = -3
		. += pizzaimg
		return
	// Stupid code because byondcode sucks - imagine blaming the engine for you being bad at coding. TODO: clean this up
	var/doimgtag = 0
	if(boxes.len > 0)
		var/obj/item/pizzabox/topbox = boxes[boxes.len]
		if(topbox.boxtag != "")
			doimgtag = 1
	else
		if(boxtag != "")
			doimgtag = 1

	if(doimgtag)
		var/image/tagimg = image("pizzaspaghetti.dmi", icon_state = "pizzabox_tag")
		tagimg.pixel_z = boxes.len * 3
		. += tagimg

//ATTACK HAND IGNORING PARENT RETURN VALUE
/obj/item/pizzabox/attack_hand(mob/living/user)
	if( open && pizza )
		user.put_in_hands( pizza )

		to_chat(user, span_warning("你把[src.pizza]从[src]里拿了出来。"))
		src.pizza = null
		update_icon()
		return

	else if( boxes.len > 0 )
		if( user.get_inactive_held_item() != src )
			return ..()

		var/obj/item/pizzabox/box = boxes[boxes.len]
		boxes -= box

		user.put_in_hands( box )
		to_chat(user, span_warning("你从手中移除了最上面的[src]。"))
		box.update_icon()
		update_icon()

	else
		return ..()

/obj/item/pizzabox/attack_self( mob/user as mob )

	if( boxes.len > 0 )
		return

	open = !open

	if( open && pizza )
		ismessy = 1

	update_icon()

/obj/item/pizzabox/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/pizzabox))
		var/obj/item/pizzabox/box = I

		if(box.open || open)
			to_chat(user, span_warning("先把[box]关上！"))
			return

		// Make a list of all boxes to be added
		var/list/boxestoadd = list()
		boxestoadd += box
		for(var/obj/item/pizzabox/i in box.boxes)
			boxestoadd += i

		if((length(boxes) + 1) + length(boxestoadd) > 5)
			to_chat(user, span_warning("堆叠过高！"))
			return

		user.transferItemToLoc(box, src)
		box.boxes = list()
		boxes.Add(boxestoadd)

		box.update_icon()
		update_icon()

		to_chat(user, span_warning("你把[box]放在了[src]上面！"))

	else if(istype(I, /obj/item/reagent_containers/food/snacks/sliceable/pizzapasta))
		if(!open)
			to_chat(user, span_warning("你试图将[I]推过盖子，但行不通！"))
			return

		user.transferItemToLoc(I, src)
		pizza = I

		update_icon()

		to_chat(user, span_warning("你将[I]放入了[src]！"))

	else if(istype(I, /obj/item/tool/pen))
		if(open)
			return

		var/t = stripped_input(user, "Enter what you want to add to the tag:", "Write", "", 30)

		boxtag = "[boxtag][t]"

		update_icon()


/obj/item/pizzabox/margherita/Initialize(mapload)
	. = ..()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/margherita(src)
	boxtag = "Margherita Deluxe"


/obj/item/pizzabox/mushroom/Initialize(mapload)
	. = ..()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/mushroompizza(src)
	boxtag = "Mushroom Special"


/obj/item/pizzabox/meat/Initialize(mapload)
	. = ..()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/meatpizza(src)
	boxtag = "Meatlover's Supreme"

/obj/item/pizzabox/donkpocket/Initialize(mapload)
	. = ..()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/donkpocket(src)
	boxtag = "Bangin' Donk"

/obj/item/pizzabox/ants/Initialize(mapload)
	. = ..()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/ants(src)
	boxtag = "Anthill Deluxe"

/obj/item/pizzabox/dank/Initialize(mapload)
	. = ..()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/dank(src)
	boxtag = "Fresh Herbs"

/obj/item/pizzabox/vegetable/Initialize(mapload)
	. = ..()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/vegetablepizza(src)
	boxtag = "Gourmet Vegetable"

/obj/item/pizzabox/sassysage/Initialize(mapload)
	. = ..()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/sassysage(src)
	boxtag = "Sausage Lovers"

/obj/item/pizzabox/pineapple/Initialize(mapload)
	. = ..()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/pineapple(src)
	boxtag = "Honolulu Chew"

///spaghetti prototype used by all subtypes
/obj/item/reagent_containers/food/snacks/pizzapasta
	icon = 'icons/obj/items/food/pizzaspaghetti.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/raw
	name = "意大利面"
	desc = "这意面真不错！"
	icon_state = "spaghetti"
	tastes = list("pasta" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/boiledspaghetti
	name = "煮熟的意大利面"
	desc = "一碗朴素的面条，这需要更多配料。"
	icon = 'icons/obj/items/food/pizzaspaghetti.dmi'
	icon_state = "spagettiboiled"
	trash = /obj/item/trash/plate
	filling_color = "#FCEE81"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	bitesize = 2
	tastes = list("pasta" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/pastatomato
	name = "意大利面"
	desc = "意大利面和碎番茄。就像你那虐待成性的父亲以前做的那样！"
	icon_state = "pastatomato"
	bitesize = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/tomatojuice = 10, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("pasta" = 1, "tomato" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/copypasta
	name = "复制粘贴"
	desc = "你或许不该尝试这个，总听人说这有多糟糕……"
	icon_state = "copypasta"
	bitesize = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/consumable/tomatojuice = 20, /datum/reagent/consumable/nutriment/vitamin = 8)
	tastes = list("pasta" = 1, "tomato" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/meatballspaghetti
	name = "意大利面和肉丸"
	desc = "这肉丸子可真不错！"
	icon_state = "meatballspaghetti"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/protein = 10, /datum/reagent/consumable/nutriment/vitamin = 2)
	trash = /obj/item/trash/plate
	filling_color = "#DE4545"
	bitesize = 3
	tastes = list("pasta" = 1, "tomato" = 1, "meat" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/spesslaw
	name = "太空法"
	desc = "律师的最爱。"
	icon_state = "spesslaw"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/protein = 20, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("pasta" = 1, "meat" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/chowmein
	name = "炒面"
	desc = "面条与炒蔬菜的美味搭配。"
	icon_state = "chowmein"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("noodle" = 1, "tomato" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/beefnoodle
	name = "牛肉面"
	desc = "营养丰富，肉质饱满，面条筋道。"
	icon_state = "beefnoodle"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("noodle" = 1, "meat" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/butternoodles
	name = "黄油面条"
	desc = "面条裹着香浓黄油。简单滑溜，却美味可口。"
	icon_state = "butternoodles"
	list_reagents = list(/datum/reagent/consumable/nutriment = 9, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("noodle" = 1, "butter" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/mac_n_cheese
	name = "通心粉配奶酪"
	desc = "采用最上等的奶酪和面包屑精心制作而成。然而，它始终无法满足对速食顿克的那种渴望。"
	icon_state = "mac_n_cheese"
	list_reagents = list(/datum/reagent/consumable/nutriment = 9, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("cheese" = 1, "breadcrumbs" = 1, "pasta" = 1)

/obj/item/pizzabox/random
	var/list/pizza_choices = list(
		/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/margherita,
		/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/vegetablepizza,
		/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/mushroompizza,
		/obj/item/reagent_containers/food/snacks/sliceable/pizzapasta/meatpizza,
	)

/obj/item/pizzabox/random/Initialize(mapload)
	. = .. ()
	var/pizza_type = pick(pizza_choices)
	pizza = new pizza_type(src)
	boxtag = "Pizza Time"

/obj/item/reagent_containers/food/snacks/pizzapasta/spagetti
	name = "意大利面"
	desc = "一捆生意大利面。"
	icon_state = "spagetti"
	filling_color = "#EDDD00"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	bitesize = 1
	tastes = list("raw pasta" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/sassysage
	name = "萨西披萨切片"
	desc = "美味又俏皮。"
	icon_state = "sassysagepizzaslice"
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "meat" = 1)
