// Coffees and Teas

/datum/glass_style/drinking_glass/coffee
	required_drink_type = /datum/reagent/consumable/coffee
	name = "glass of coffee-咖啡杯"
	desc = "别松手，否则滚烫的液体和玻璃碎片会溅得到处都是。"
	icon_state = "glass_brown"

/datum/glass_style/drinking_glass/tea
	required_drink_type = /datum/reagent/consumable/tea
	name = "glass of tea-一杯茶"
	desc = "在这里饮用似乎不太合适。"
	icon_state = "teaglass"

/datum/glass_style/drinking_glass/icecoffee
	required_drink_type = /datum/reagent/consumable/coffee/icecoffee
	name = "iced coffee-冰咖啡"
	desc = "一杯让你精神焕发、恢复活力的饮品！"
	icon = 'icons/obj/drinks/coffee.dmi'
	icon_state = "icedcoffeeglass"

/datum/glass_style/drinking_glass/hot_ice_coffee
	required_drink_type = /datum/reagent/consumable/hot_ice_coffee
	name = "hot ice coffee-热冰咖啡"
	desc = "一杯烈酒——这可不便宜。"
	icon = 'icons/obj/drinks/coffee.dmi'
	icon_state = "hoticecoffee"

/datum/glass_style/drinking_glass/icetea
	required_drink_type = /datum/reagent/consumable/tea/icetea
	name = "iced tea-冰茶"
	desc = "纯天然，富含抗氧化剂的风味体验。"
	icon = 'icons/obj/drinks/mixed_drinks.dmi'
	icon_state = "icedteaglass"

/datum/glass_style/drinking_glass/soy_latte
	required_drink_type = /datum/reagent/consumable/coffee/soy_latte
	name = "soy latte-豆奶拿铁"
	desc = "阅读时来一杯清爽提神的饮料。"
	icon = 'icons/obj/drinks/coffee.dmi'
	icon_state = "soy_latte"

/datum/glass_style/drinking_glass/cafe_latte
	required_drink_type = /datum/reagent/consumable/coffee/cafe_latte
	name = "cafe latte-卡布奇诺"
	desc = "阅读时来一杯美味、提神又清爽的饮料。"
	icon = 'icons/obj/drinks/coffee.dmi'
	icon_state = "cafe_latte"

/datum/glass_style/drinking_glass/pumpkin_latte
	required_drink_type = /datum/reagent/consumable/pumpkin_latte
	name = "pumpkin latte-南瓜拿铁"
	desc = "咖啡与南瓜汁的混合饮品。"
	icon = 'icons/obj/drinks/mixed_drinks.dmi'
	icon_state = "pumpkin_latte"

/datum/glass_style/has_foodtype/drinking_glass/hot_coco
	required_drink_type = /datum/reagent/consumable/hot_coco
	name = "glass of hot coco-一杯热可可"
	desc = "冬日暖身佳饮。"
	icon_state = "chocolateglass"
	drink_type = SUGAR | DAIRY

/datum/glass_style/drinking_glass/italian_coco
	required_drink_type = /datum/reagent/consumable/italian_coco
	name = "glass of italian coco-一杯意大利可可"
	desc = "冬日佳品的别样演绎，只为取悦味蕾。"
	icon = 'icons/obj/drinks/mixed_drinks.dmi'
	icon_state = "italiancoco"

/datum/glass_style/drinking_glass/mushroom_tea
	required_drink_type = /datum/reagent/consumable/mushroom_tea
	name = "glass of mushroom tea-蘑菇茶"
	desc = "这饮料的味道意外地很开胃。"
	icon_state = "mushroom_tea_glass"

/datum/glass_style/drinking_glass/t_letter
	required_drink_type = /datum/reagent/consumable/t_letter
	name = "glass of T-一杯T"
	desc = "第20号。"
	icon = 'icons/obj/drinks/mixed_drinks.dmi'
	icon_state = "tletter"
