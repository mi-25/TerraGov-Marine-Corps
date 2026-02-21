/obj/item/clothing/shoes/proc/step_action() //this was made to rewrite clown shoes squeaking
	SEND_SIGNAL(src, COMSIG_SHOES_STEP_ACTION)


/obj/item/clothing/shoes/syndigaloshes
	desc = "一双棕色鞋子。它们似乎有额外的抓地力。"
	name = "棕色鞋子"
	icon_state = "brown"
	worn_icon_state = "brown"
	permeability_coefficient = 0.05
	inventory_flags = NOSLIPPING
	var/list/clothing_choices = list()
	siemens_coefficient = 0.8

/obj/item/clothing/shoes/mime
	name = "默剧演员鞋"
	icon_state = "mime"

/obj/item/clothing/shoes/swat
	name = "\improper 特警靴"
	desc = "当你想要提升火力的时候。"
	icon_state = "swat"
	soft_armor = list(MELEE = 80, BULLET = 60, LASER = 50, ENERGY = 25, BOMB = 50, BIO = 10, FIRE = 25, ACID = 25)
	inventory_flags = NOSLIPPING
	item_flags = SYNTH_RESTRICTED
	siemens_coefficient = 0.6

/obj/item/clothing/shoes/ruggedboot
	name = "战术靴"
	desc = "用于危险环境作业人员穿着的靴子。"
	icon_state = "swat"
	soft_armor = list(MELEE = 20, BULLET = 20, LASER = 20, ENERGY = 25, BOMB = 20, BIO = 20, FIRE = 20, ACID = 20)
	inventory_flags = NOSLIPPING
	item_flags = SYNTH_RESTRICTED
	siemens_coefficient = 0.6

/obj/item/clothing/shoes/space_ninja
	name = "忍者鞋"
	desc = "一双跑鞋。非常适合跑步，砸碎头骨时效果更佳。"
	icon_state = "s-ninja"
	permeability_coefficient = 0.01
	inventory_flags = NOSLIPPING
	soft_armor = list(MELEE = 60, BULLET = 50, LASER = 30, ENERGY = 15, BOMB = 30, BIO = 30, FIRE = 15, ACID = 15)
	siemens_coefficient = 0.2

	cold_protection_flags = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection_flags = FEET
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/sandal
	desc = "一双相当朴素的木制凉鞋。"
	name = "凉鞋"
	icon_state = "wizard"
	armor_protection_flags = NONE

/obj/item/clothing/shoes/sandal/marisa
	desc = "一双魔法黑鞋。"
	name = "魔法鞋"
	icon_state = "black"
	armor_protection_flags = FEET

/obj/item/clothing/shoes/galoshes
	desc = "橡胶靴"
	name = "胶靴"
	icon_state = "galoshes"
	permeability_coefficient = 0.05
	inventory_flags = NOSLIPPING
	slowdown = SHOES_SLOWDOWN+1

/obj/item/clothing/shoes/clown_shoes
	desc = "恶作剧者的标准配置小丑鞋。天哪，这鞋可真大！"
	name = "小丑鞋"
	icon_state = "clown"
	worn_icon_state = "clown"
	slowdown = SHOES_SLOWDOWN + 1


/obj/item/clothing/shoes/clown_shoes/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/effects/clownstep1.ogg', 'sound/effects/clownstep2.ogg'), 50)

/obj/item/clothing/shoes/clown_shoes/erp
	desc ="恶作剧者的军用标准制式小丑鞋。天哪，它们真大！而且还是加固的！"
	name = "加固小丑鞋"
	armor_protection_flags = FEET
	cold_protection_flags = FEET
	heat_protection_flags = FEET
	inventory_flags = NOQUICKEQUIP|NOSLIPPING
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7

/obj/item/clothing/shoes/jackboots
	name = "军靴"
	desc = "适用于战斗场景或作战情况的安保作战靴。全天候战斗，随时待命。"
	icon_state = "jackboots"
	worn_icon_state = "jackboots"
	siemens_coefficient = 0.7

/obj/item/clothing/shoes/cult
	name = "军靴"
	desc = "纳尔-赛信徒所穿的一双靴子。"
	icon_state = "cult"
	worn_icon_state = "cult"
	siemens_coefficient = 0.7

	cold_protection_flags = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection_flags = FEET
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/cyborg
	name = "合成人靴子"
	desc = "赛博格服装的鞋子"
	icon_state = "boots"

/obj/item/clothing/shoes/slippers
	name = "兔兔拖鞋"
	desc = "毛茸茸！"
	icon_state = "slippers"
	worn_icon_state = "slippers"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/shoes/slippers_worn
	name = "穿着的兔耳拖鞋"
	desc = "毛茸茸……"
	icon_state = "slippers_worn"
	worn_icon_state = "slippers_worn"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/shoes/laceup
	name = "系带鞋"
	desc = "时尚的巅峰，而且已经预先抛光好了！"
	icon_state = "laceups"

/obj/item/clothing/shoes/swimmingfins
	desc = "助你畅游自如。"
	name = "脚蹼"
	icon_state = "flippers"
	inventory_flags = NOSLIPPING
	slowdown = SHOES_SLOWDOWN+1


/obj/item/clothing/shoes/snow
	name = "雪地靴"
	desc = "当你的双脚和你的心一样冰冷"
	icon_state = "swat"
	siemens_coefficient = 0.6
	cold_protection_flags = FEET
	heat_protection_flags = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/techpriest
	name = "技术神甫靴"
	desc = "赞美机魂！"
	icon_state = "tp_boots"
	worn_icon_state = "tp_boots"
	inventory_flags = NOSLIPPING


