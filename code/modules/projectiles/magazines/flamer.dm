

//Flame thrower.

/obj/item/ammo_magazine/flamer_tank
	name = "焚化器储罐"
	desc = "一个通常装有超稠萘的燃料罐，这是一种粘稠的可燃液体化学品，用于FL-240焚化装置。请小心处理。"
	icon_state = "flametank"
	icon = 'icons/obj/items/ammo/flamer.dmi'
	max_rounds = 50 //Per turf.
	current_rounds = 50
	reload_delay = 2 SECONDS
	w_class = WEIGHT_CLASS_NORMAL //making sure you can't sneak this onto your belt.
	caliber = CALIBER_FUEL_THICK //Ultra Thick Napthal Fuel, from the lore book.
	magazine_flags = NONE
	icon_state_mini = "tank_light"
	default_ammo = /datum/ammo/flamethrower
	///The type of fuel we refuel with
	var/fuel_type = DEFAULT_FUEL_TYPE

/obj/item/ammo_magazine/flamer_tank/get_fueltype()
	return fuel_type

/obj/item/ammo_magazine/flamer_tank/can_refuel(atom/refueler, fuel_type, mob/user)
	if(fuel_type != get_fueltype())
		user?.balloon_alert(user, "燃料错误")
		return FALSE
	if(current_rounds == max_rounds)
		user?.balloon_alert(user, "已满")
		return FALSE
	return TRUE

/obj/item/ammo_magazine/flamer_tank/do_refuel(atom/refueler, fuel_type, mob/user)
	var/fuel_transfer_amount = min(refueler.reagents.total_volume, (max_rounds - current_rounds))
	refueler.reagents.remove_reagent(fuel_type, fuel_transfer_amount)
	current_rounds += fuel_transfer_amount
	playsound(loc, 'sound/effects/refill.ogg', 25, 1, 3)
	caliber = CALIBER_FUEL
	user?.balloon_alert(user, "已补充")
	update_appearance(UPDATE_ICON)

/obj/item/ammo_magazine/flamer_tank/mini
	name = "微型焚化炉罐"
	desc = "一个通常装有超稠萘的燃料罐，这是一种粘性可燃液体化学品，用于下挂式焚烧器单元。小心处理。"
	icon_state = "flametank_mini"
	reload_delay = 0 SECONDS
	w_class = WEIGHT_CLASS_SMALL
	current_rounds = 25
	max_rounds = 25
	icon_state_mini = "tank_orange_mini"

/obj/item/ammo_magazine/flamer_tank/large	// Extra thicc tank
	name = "大型喷火器储罐"
	desc = "一个大型超稠萘燃料罐，内含粘稠可燃液态化学品，供FL-84喷火器使用。"
	icon_state = "flametank_large"
	max_rounds = 75
	current_rounds = 75
	reload_delay = 3 SECONDS
	icon_state_mini = "tank_orange"

/obj/item/ammo_magazine/flamer_tank/large/som
	name = "大型喷火器储罐"
	desc = "一个装有超稠萘的大型燃料罐，这是一种粘稠的可燃液体化学品，用于V-62喷火器。"
	icon_state = "flametank_som"
	icon_state_mini = "tank_red"
	max_rounds = 75
	current_rounds = 75
	reload_delay = 3 SECONDS

/obj/item/ammo_magazine/flamer_tank/large/X
	name = "大型喷火器燃料罐（X）"
	desc = "一个大型燃料罐，装有超稠萘X型燃料，这是一种粘稠的可燃液体化学品，燃烧温度极高，专为FL-84喷火器设计。请小心处理。"
	icon_state = "flametank_large_blue"
	default_ammo = /datum/ammo/flamethrower/blue
	fuel_type = /datum/reagent/fuel/xfuel
	icon_state_mini = "tank_blue"

/obj/item/ammo_magazine/flamer_tank/large/X/som
	desc = "一个大型燃料罐，装有超稠度萘基X型燃料，这是一种粘性可燃液态化学品，专为V-62喷火器设计。"
	icon_state = "flametank_som_x"
	icon_state_mini = "tank_red_blue"

/obj/item/ammo_magazine/flamer_tank/large/X/deathsquad
	name = "巨型喷火器异形燃料罐"
	desc = "利用超空间技术，纳米传讯成功将远超你一生所需剂量的X燃料压缩进了这个特制储罐中。"
	max_rounds = 225
	current_rounds = 225
	reload_delay = 2 SECONDS

/obj/item/ammo_magazine/flamer_tank/backtank
	name = "背包燃料罐"
	desc = "专为FL-84喷火器和FL-240焚化装置设计的特种燃料罐。"
	icon_state = "flamethrower_tank"
	equip_slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	max_rounds = 500
	current_rounds = 500
	reload_delay = 1 SECONDS
	caliber = CALIBER_FUEL_THICK
	magazine_flags = MAGAZINE_WORN
	icon_state_mini = "tank"

	default_ammo = /datum/ammo/flamethrower

/obj/item/ammo_magazine/flamer_tank/backtank/X
	name = "背包燃料罐 (X)"
	desc = "一个特制的超厚型萘X燃料罐，专为FL-84喷火器和FL-240焚化装置设计。"
	icon_state = "x_flamethrower_tank"
	default_ammo = /datum/ammo/flamethrower/blue
	fuel_type = /datum/reagent/fuel/xfuel

/obj/item/ammo_magazine/flamer_tank/water
	name = "加压水箱"
	desc = "用于FL-84下挂灭火器的水罐。可手动补充。"
	icon_state = "watertank"
	max_rounds = 200
	current_rounds = 200
	reload_delay = 0 SECONDS
	w_class = WEIGHT_CLASS_NORMAL
	caliber = CALIBER_WATER //Deep lore
	magazine_flags = NONE
	icon_state_mini = "tank_water"

	default_ammo = /datum/ammo/water
	fuel_type = /datum/reagent/water

//The engineer pyro bag internal fuel tank
/obj/item/ammo_magazine/flamer_tank/internal
	name = "内置燃料箱"
	desc = "一个装有超稠密萘的大型燃料箱，这是一种粘稠的可燃液体化学品，不过你不应该看到这个。"
	icon_state = ""
	max_rounds = 280
	current_rounds = 280
	reload_delay = 0 SECONDS

/obj/item/ammo_magazine/flamer_tank/vsd
	name = "大型CC/21喷火器储罐（X）"
	desc = "一个为维亚切斯拉夫 CC/21 喷火器准备的大型储罐，装满了浓稠的萘X燃料。"
	icon_state = "flametank_vsd"
	max_rounds = 150
	current_rounds = 150
	reload_delay = 4 SECONDS
	default_ammo = /datum/ammo/flamethrower/blue
	fuel_type = /datum/reagent/fuel/xfuel
	icon_state_mini = "tank_blue"
