/obj/item/reagent_containers/food/snacks/donut
	name = "甜甜圈"
	desc = "甜甜圈糕点，一种地球上常见的零食。与咖啡搭配极佳。"
	icon = 'icons/obj/items/food/donuts.dmi'
	icon_state = "donut"
	filling_color = "#D9C386"
	var/overlay_state = "donut"
	tastes = list("donut" = 1)

/obj/item/reagent_containers/food/snacks/donut/normal
	name = "甜甜圈"
	desc = "一个甜甜圈。在边境地带很罕见，好好珍惜它。"
	icon_state = "donut"
	tastes = list("donut" = 1)
	list_reagents = list (/datum/reagent/consumable/nutriment = 3)
	bitesize = 3

/obj/item/reagent_containers/food/snacks/donut/normal/Initialize(mapload)
	. = ..()
	if(prob(40))
		icon_state = "donut_pink"
		overlay_state = "fdonut"
		name = "糖霜甜甜圈"
		desc = "一个粉色糖霜甜甜圈。在边境地带更为罕见。"
		reagents.add_reagent(/datum/reagent/consumable/sprinkles, 2)
	else if(prob(10))
		icon_state = "donut_homer"
		overlay_state = "fdonut"
		name = "糖霜甜甜圈"
		desc = "一个粉色糖霜甜甜圈。边境上最稀有的那种。"
		reagents.add_reagent(/datum/reagent/consumable/sprinkles, 3)

/obj/item/reagent_containers/food/snacks/donut/chaos
	name = "混沌甜甜圈"
	desc = "就像生活一样，它的滋味从不重复。"
	icon_state = "donut_chaos"
	filling_color = "#ED11E6"
	tastes = list("donut" = 3, "chaos" = 1)
	list_reagents = list (/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/sprinkles = 1)
	bitesize = 10


/obj/item/reagent_containers/food/snacks/donut/chaos/Initialize(mapload)
	. = ..()
	var/chaosselect = pick(1,2,3,4,5,6,7,8,9)
	switch(chaosselect)
		if(1)
			reagents.add_reagent(/datum/reagent/consumable/nutriment, 3)
		if(2)
			reagents.add_reagent(/datum/reagent/consumable/capsaicin, 3)
		if(3)
			reagents.add_reagent(/datum/reagent/consumable/frostoil, 3)
		if(4)
			reagents.add_reagent(/datum/reagent/consumable/sprinkles, 3)
		if(5)
			reagents.add_reagent(/datum/reagent/toxin/phoron, 3)
		if(6)
			reagents.add_reagent(/datum/reagent/consumable/coco, 3)
		if(7)
			reagents.add_reagent(/datum/reagent/consumable/banana, 3)
		if(8)
			reagents.add_reagent(/datum/reagent/consumable/berryjuice, 3)
		if(9)
			reagents.add_reagent(/datum/reagent/medicine/tricordrazine, 3)
	if(prob(30))
		icon_state = "donut2"
		overlay_state = "fdonut2"
		name = "霜糖混沌甜甜圈"
		reagents.add_reagent(/datum/reagent/consumable/sprinkles, 2)


/obj/item/reagent_containers/food/snacks/donut/jelly
	name = "果冻甜甜圈"
	desc = "你羡慕了？"
	icon_state = "jelly"
	filling_color = "#ED1169"
	tastes = list("jelly" = 1, "donut" = 3)
	bitesize = 5
	list_reagents = list (/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/berryjuice = 5)


/obj/item/reagent_containers/food/snacks/donut/jelly/Initialize(mapload)
	. = ..()
	if(prob(30))
		icon_state = "jelly_pink"
		overlay_state = "fdonut2"
		name = "糖霜果冻甜甜圈"
		reagents.add_reagent(/datum/reagent/consumable/sprinkles, 2)

/obj/item/reagent_containers/food/snacks/donut/cherryjelly
	name = "果冻甜甜圈"
	desc = "你怕了吗？"
	icon_state = "jelly_pink"
	filling_color = "#ED1169"
	list_reagents = list (/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/cherryjelly = 5)


/obj/item/reagent_containers/food/snacks/donut/cherryjelly/Initialize(mapload)
	. = ..()
	if(prob(30))
		icon_state = "jelly_pink"
		overlay_state = "box-donut2"
		name = "糖霜果冻甜甜圈"
		reagents.add_reagent(/datum/reagent/consumable/sprinkles, 2)

/obj/item/reagent_containers/food/snacks/donut/meat
	name = "肉饼甜甜圈"
	desc = "尝起来和看起来一样恶心。"
	icon_state = "donut_meat"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 3, /datum/reagent/consumable/ketchup = 3)
	tastes = list("meat" = 1, "grease" = 3)

/obj/item/reagent_containers/food/snacks/donut/berry
	name = "粉色甜甜圈"
	desc = "搭配豆奶拿铁风味更佳。"
	icon_state = "donut_pink"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/berryjuice = 3, /datum/reagent/consumable/sprinkles = 1) //Extra sprinkles to reward frosting

/obj/item/reagent_containers/food/snacks/donut/trumpet
	name = "太空甜甜圈"
	desc = "配上一杯冰凉的牛奶再合适不过了。"
	icon_state = "donut_purple"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sprinkles = 1)
	tastes = list("donut" = 3, "violets" = 1)

/obj/item/reagent_containers/food/snacks/donut/apple
	name = "苹果甜甜圈"
	desc = "搭配肉桂杜松子酒风味更佳。"
	icon_state = "donut_green"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sprinkles = 1)
	tastes = list("donut" = 3, "green apples" = 1)

/obj/item/reagent_containers/food/snacks/donut/caramel
	name = "焦糖甜甜圈"
	desc = "配上一杯热可可，味道更佳。"
	icon_state = "donut_beige"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/caramel = 3, /datum/reagent/consumable/sprinkles = 1)
	tastes = list("donut" = 3, "buttery sweetness" = 1)

/obj/item/reagent_containers/food/snacks/donut/choco
	name = "巧克力甜甜圈"
	desc = "配上一杯热牛奶味道更佳。"
	icon_state = "donut_choc"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/hot_coco = 3, /datum/reagent/consumable/sprinkles = 1) //the coco reagent is just bitter.
	tastes = list("donut" = 4, "bitterness" = 1)

/obj/item/reagent_containers/food/snacks/donut/choco/Initialize(mapload)
	. = ..()
	if(prob(40))
		icon_state = "donut_choc_sprinkles"
		overlay_state = "fdonut"
		name = "糖霜甜甜圈"
		desc = "巧克力糖霜甜甜圈。配热巧克力绝佳。"
		reagents.add_reagent(/datum/reagent/consumable/sprinkles, 2)

/obj/item/reagent_containers/food/snacks/donut/blumpkin
	name = "布隆普金甜甜圈"
	desc = "与一杯舒缓的醉汉南瓜汁是绝配。"
	icon_state = "donut_blue"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sprinkles = 1)
	tastes = list("donut" = 2, "blumpkin" = 1)

/obj/item/reagent_containers/food/snacks/donut/bungo
	name = "邦戈甜甜圈"
	desc = "配上一罐嬉皮士的快乐，味道更佳。"
	icon_state = "donut_yellow"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sprinkles = 1)
	tastes = list("donut" = 3, "tropical sweetness" = 1)

/obj/item/reagent_containers/food/snacks/donut/matcha
	name = "抹茶甜甜圈"
	desc = "配茶绝佳。"
	icon_state = "donut_olive"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/poisonberryjuice = 3, /datum/reagent/consumable/sprinkles = 1)
	tastes = list("donut" = 3, "matcha" = 1)

/obj/item/reagent_containers/food/snacks/donut/laugh
	name = "甜豌豆甜甜圈"
	desc = "和堡垒波本威士忌是绝配！"
	icon_state = "donut_laugh"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/laughter = 3)
	tastes = list("donut" = 3, "fizzy tutti frutti" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/trumpet
	name = "太空人的果冻甜甜圈"
	desc = "配上一杯冰凉的麦芽奶，味道更佳。"
	icon_state = "jelly_purple"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "violets" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/apple
	name = "苹果果冻甜甜圈"
	desc = "搭配肉桂利口酒味道更佳。"
	icon_state = "jelly_green"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/caramel
	name = "焦糖果冻甜甜圈"
	desc = "配上一杯热可可，味道更佳。"
	icon_state = "jelly_beige"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/caramel = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "buttery sweetness" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/choco
	name = "巧克力果冻甜甜圈"
	desc = "配上一杯热牛奶，味道更佳。"
	icon_state = "jelly_choc"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/hot_coco = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1) //the coco reagent is just bitter.
	tastes = list("jelly" = 1, "donut" = 4, "bitterness" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/blumpkin
	name = "蓝莓果冻甜甜圈"
	desc = "与一杯舒缓的醉酒南瓜汁是绝配。"
	icon_state = "jelly_blue"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 2, "blumpkin" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/bungo
	name = "邦戈果冻甜甜圈"
	desc = "搭配一罐嬉皮士的快乐，味道更佳。"
	icon_state = "jelly_yellow"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "tropical sweetness" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/matcha
	name = "抹茶果冻甜甜圈"
	desc = "配茶绝佳。"
	icon_state = "jelly_olive"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/poisonberryjuice = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "matcha" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/laugh
	name = "甜豌豆果冻甜甜圈"
	desc = "与一瓶巴斯蒂安波本威士忌是绝配！"
	icon_state = "jelly_laugh"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/laughter = 3)
	tastes = list("jelly" = 3, "donut" = 1, "fizzy tutti frutti" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly
	name = "果冻甜甜圈"
	desc = "你羡慕了？"
	list_reagents = list(/datum/reagent/toxin/phoron = 3)

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/plain
	icon_state = "jelly"

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/berry
	name = "粉色果冻甜甜圈"
	desc = "搭配豆奶拿铁风味更佳。"
	icon_state = "jelly_pink"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/berryjuice = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1) //Extra sprinkles to reward frosting

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/trumpet
	name = "太空人的果冻甜甜圈"
	desc = "配上一杯冰凉的牛奶再合适不过了。"
	icon_state = "jelly_purple"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "violets" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/apple
	name = "苹果果冻甜甜圈"
	desc = "搭配肉桂利口酒味道更佳。"
	icon_state = "jelly_green"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "green apples" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/caramel
	name = "焦糖果冻甜甜圈"
	desc = "配上一杯热可可，味道更佳。"
	icon_state = "jelly_beige"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/caramel = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "buttery sweetness" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/choco
	name = "巧克力果冻甜甜圈"
	desc = "配上一杯热牛奶味道更佳。"
	icon_state = "jelly_choc"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/hot_coco = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1) //the coco reagent is just bitter.
	tastes = list("jelly" = 1, "donut" = 4, "bitterness" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/blumpkin
	name = "蓝莓果冻甜甜圈"
	desc = "与一杯舒缓的醉酒南瓜汁是绝配。"
	icon_state = "jelly_blue"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 2, "blumpkin" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/bungo
	name = "邦戈果冻甜甜圈"
	desc = "配上一罐嬉皮士的快乐，味道更佳。"
	icon_state = "jelly_yellow"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "tropical sweetness" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/matcha
	name = "抹茶果冻甜甜圈"
	desc = "配茶绝佳。"
	icon_state = "jelly_olive"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/poisonberryjuice = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "matcha" = 1)

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/laugh
	name = "甜豌豆果冻甜甜圈"
	desc = "与一瓶巴斯蒂安波本威士忌是绝配！"
	icon_state = "jelly_laugh"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/laughter = 3)
	tastes = list("jelly" = 3, "donut" = 1, "fizzy tutti frutti" = 1)
