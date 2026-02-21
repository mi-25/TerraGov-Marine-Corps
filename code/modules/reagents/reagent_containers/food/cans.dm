/obj/item/reagent_containers/food/drinks/cans
	name = "汽水罐"
	reagent_flags = NONE
	var/canopened = FALSE

/obj/item/reagent_containers/food/drinks/cans/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(!CONFIG_GET(flag/fun_allowed))
		return FALSE
	attack_hand(xeno_attacker)


/obj/item/reagent_containers/food/drinks/cans/attack_self(mob/user as mob)
	if(canopened == FALSE)
		playsound(src,'sound/effects/canopen.ogg', 15, 1)
		to_chat(user, span_notice("You open the drink with [pick("an audible", "a satisfying")] pop!"))
		canopened = TRUE
		ENABLE_BITFIELD(reagents.reagent_flags, OPENCONTAINER_NOUNIT)
		return
	var/obj/item/reagent_containers/H = usr.get_active_held_item()
	var/N = tgui_input_list(user, "Amount per transfer from this:","[H]", possible_transfer_amounts)
	if (N)
		H.amount_per_transfer_from_this = N

/obj/item/reagent_containers/food/drinks/cans/attack(mob/M as mob, mob/user as mob, def_zone)
	if (canopened == FALSE)
		to_chat(user, span_notice("你得先打开饮料！"))
		return
	..()

//DRINKS

/obj/item/reagent_containers/food/drinks/cans/cola
	name = "\improper TGM 可乐"
	desc = "一罐人工香料、甜味剂和色素，至少它是碳酸饮料。由纳米传讯罐装。"
	icon_state = "tgm_cola"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/space_cola = 30)

/obj/item/reagent_containers/food/drinks/cans/waterbottle
	name = "\improper 纳米传讯瓶装泉水"
	desc = "纳米传讯瓶装的'春季'水，价格虚高。"
	icon_state = "bottled_water"
	center_of_mass = list("x"=15, "y"=8)
	list_reagents = list(/datum/reagent/water = 30)

/obj/item/reagent_containers/food/drinks/cans/beer
	name = "一罐啤酒"
	desc = "啤酒。你已锁定目标。是时候进行效力射击了。"
	icon_state = "beercan"
	center_of_mass = list("x"=16, "y"=12)
	list_reagents = list(/datum/reagent/consumable/ethanol/beer = 30)

/obj/item/reagent_containers/food/drinks/cans/ale
	name = "一罐啤酒"
	desc = "啤酒被误解的表亲。"
	icon_state = "alecan"
	worn_icon_state = "beer"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/ethanol/ale = 30)

/obj/item/reagent_containers/food/drinks/cans/space_mountain_wind
	name = "\improper 太空山风"
	desc = "像太空风一样直接穿透你。"
	icon_state = "space_mountain_wind"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/spacemountainwind = 30)

/obj/item/reagent_containers/food/drinks/cans/thirteenloko
	name = "\improper 十三洛可"
	desc = "首席医疗官已告知船员，饮用十三乐可可能导致癫痫、失明、醉酒甚至死亡。请理性饮用。"
	icon_state = "thirteen_loko"
	center_of_mass = list("x"=16, "y"=8)
	list_reagents = list(/datum/reagent/consumable/ethanol/thirteenloko = 30)

/obj/item/reagent_containers/food/drinks/cans/dr_gibb
	name = "\improper 吉布医生"
	desc = "一种由42种你念不出名字的化学品调制而成的美味混合物。"
	icon_state = "dr_gibb"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/dr_gibb = 30)

/obj/item/reagent_containers/food/drinks/cans/starkist
	name = "\improper 星之吻"
	desc = "液态星辰的味道。还有，一点金枪鱼……？"
	icon_state = "starkist"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/space_cola = 15, /datum/reagent/consumable/orangejuice = 15)

/obj/item/reagent_containers/food/drinks/cans/space_up
	name = "\improper 太空汽水"
	desc = "尝起来像是舰体破裂的味道。"
	icon_state = "space-up"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/space_up = 30)

/obj/item/reagent_containers/food/drinks/cans/lemon_lime
	name = "柠檬青柠"
	desc = "你想要的是橙子味。它给了你柠檬青柠味。"
	icon_state = "lemon-lime"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/lemon_lime = 30)

/obj/item/reagent_containers/food/drinks/cans/iced_tea
	name = "冰茶罐"
	desc = "就跟班里的红脖子他奶奶常买的那种一样。"
	icon_state = "ice_tea_can"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/ = 30)

/obj/item/reagent_containers/food/drinks/cans/grape_juice
	name = "葡萄汁"
	desc = "一罐可能不是葡萄汁的东西。"
	icon_state = "purple_can"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/grapejuice = 30)

/obj/item/reagent_containers/food/drinks/cans/tonic
	name = "汤力水"
	desc = "第一步：汤力水。确认。第二步：金酒。"
	icon_state = "tonic"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/tonic = 50)

/obj/item/reagent_containers/food/drinks/cans/sodawater
	name = "苏打水"
	desc = "一罐苏打水。据那些欧洲佬说，这玩意儿比自来水更提神……"
	icon_state = "sodawater"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/sodawater = 50)

/obj/item/reagent_containers/food/drinks/cans/souto
	name = "\improper 经典苏打"
	desc = "罐头上大胆地宣称是橘子口味。你忍不住觉得这是个谎言。产自哈瓦那。"
	icon_state = "souto_classic"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/suoto = 50)

/obj/item/reagent_containers/food/drinks/cans/souto/diet
	name = "\improper 索托饮食"
	desc = "现在含有0%果汁！哈瓦那罐装"
	icon_state = "souto_diet_classic"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/suoto = 25, /datum/reagent/water = 25)

/obj/item/reagent_containers/food/drinks/cans/souto/cherry
	name = "\improper 樱桃苏打"
	desc = "现在添加了更多人工风味！产自哈瓦那"
	icon_state = "souto_cherry"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/suoto/cherry = 50)

/obj/item/reagent_containers/food/drinks/cans/souto/cherry/diet
	name = "\improper 樱桃味南方汽水（低糖）"
	desc = "既不是无糖口味，也不是樱桃口味。产自哈瓦那。"
	icon_state = "souto_diet_cherry"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/suoto/cherry = 25, /datum/reagent/consumable/ethanol = 25)

/obj/item/reagent_containers/food/drinks/cans/aspen
	name = "\improper 纳米传讯白杨啤酒"
	desc = "味道还不错，如果你能忽略它尝起来像尿的话。由纳米传讯罐装。"
	icon_state = "6_pack_1"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/ethanol/nt_beer = 50)

/obj/item/reagent_containers/food/drinks/cans/souto/lime
	name = "\improper 青柠苏托"
	desc = "不差。但也不算好，不过确实不差。哈瓦那罐装。"
	icon_state = "souto_lime"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/lemon_lime = 50)

/obj/item/reagent_containers/food/drinks/cans/souto/lime/diet
	name = "\improper 青柠味苏打"
	desc = "十种酸液，两杯代糖，几乎一整罐二氧化碳，还有大约210千帕的压力，全都塞进一个铝罐里。有什么不喜欢的呢？哈瓦那罐装。"
	icon_state = "souto_diet_lime"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/lemon_lime = 25, /datum/reagent/water = 25)

/obj/item/reagent_containers/food/drinks/cans/souto/grape
	name = "\improper 葡萄味索托"
	desc = "一种经久不衰的汽水口味。然而，这尝起来像是葡萄味的止咳糖浆。产自哈瓦那。"
	icon_state = "souto_grape"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/grapejuice = 50)

/obj/item/reagent_containers/food/drinks/cans/souto/grape/diet
	name = "\improper 葡萄味苏打汽水"
	desc = "你相当确定这只是葡萄味止咳糖浆和苏打水。产自哈瓦那。"
	icon_state = "souto_diet_grape"
	center_of_mass = list("x"=16, "y"=10)
	list_reagents = list(/datum/reagent/consumable/grapejuice = 25, /datum/reagent/water = 25)
