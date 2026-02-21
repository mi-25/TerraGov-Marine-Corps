//Not to be confused with /obj/item/reagent_containers/cup/glass/bottle

/obj/item/reagent_containers/cup/bottle
	name = "瓶子"
	desc = "一个小瓶子。"
	icon_state = "bottle-1"
	fill_icon_state = "bottle-1"
	worn_icon_state = "bottle-1"
	possible_transfer_amounts = list(5, 10, 15, 25, 50)
	volume = 50
	fill_icon_thresholds = list(0, 1, 20, 40, 60, 80, 100)

/obj/item/reagent_containers/cup/bottle/Initialize(mapload)
	. = ..()
	if(!icon_state)
		icon_state = "bottle-1"
	update_appearance()

/obj/item/reagent_containers/cup/bottle/toxin
	name = "毒素瓶"
	desc = "一小瓶毒素。请勿饮用，有毒。"
	list_reagents = list(/datum/reagent/toxin = 30)

/obj/item/reagent_containers/cup/bottle/cyanide
	name = "氰化物瓶"
	desc = "一小瓶氰化物。苦杏仁味？"
	list_reagents = list(/datum/reagent/toxin/cyanide = 30)

/obj/item/reagent_containers/cup/bottle/chloralhydrate
	name = "水合氯醛瓶"
	desc = "一小瓶水合氯醛。米奇的最爱！"
	icon_state = "bottle20"
	list_reagents = list(/datum/reagent/toxin/chloralhydrate = 15)

/obj/item/reagent_containers/cup/bottle/mutagen
	name = "不稳定诱变剂瓶"
	desc = "一小瓶不稳定的诱变剂。会随机改变接触者的DNA结构。"
	list_reagents = list(/datum/reagent/toxin/mutagen = 30)

/obj/item/reagent_containers/cup/bottle/synaptizine
	name = "突触兴奋剂药瓶"
	desc = "一小瓶突触素。"
	list_reagents = list(/datum/reagent/medicine/synaptizine = 30)

/obj/item/reagent_containers/cup/bottle/ammonia
	name = "氨水瓶"
	desc = "一小瓶氨水。"
	list_reagents = list(/datum/reagent/ammonia = 30)

/obj/item/reagent_containers/cup/bottle/diethylamine
	name = "二乙胺瓶"
	desc = "一小瓶二乙胺。"
	list_reagents = list(/datum/reagent/diethylamine = 30)

/obj/item/reagent_containers/cup/bottle/adminordrazine
	name = "管理神药瓶"
	desc = "一个小瓶子。装着众神的液体精华。"
	icon = 'icons/obj/drinks/bottles.dmi'
	icon_state = "holyflask"
	list_reagents = list(/datum/reagent/medicine/adminordrazine = 30)

/obj/item/reagent_containers/cup/bottle/capsaicin
	name = "辣椒素瓶"
	desc = "一个小瓶子。装着辣酱。"
	list_reagents = list(/datum/reagent/consumable/capsaicin = 30)

/obj/item/reagent_containers/cup/bottle/frostoil
	name = "霜油瓶"
	desc = "一个小瓶子。内含冷酱汁。"
	list_reagents = list(/datum/reagent/consumable/frostoil = 30)

//Oldstation.dmm chemical storage bottles

/obj/item/reagent_containers/cup/bottle/hydrogen
	name = "氢气瓶"
	list_reagents = list(/datum/reagent/hydrogen = 30)

/obj/item/reagent_containers/cup/bottle/lithium
	name = "锂瓶"
	list_reagents = list(/datum/reagent/lithium = 30)

/obj/item/reagent_containers/cup/bottle/carbon
	name = "碳素瓶"
	list_reagents = list(/datum/reagent/carbon = 30)

/obj/item/reagent_containers/cup/bottle/nitrogen
	name = "氮气瓶"
	list_reagents = list(/datum/reagent/nitrogen = 30)

/obj/item/reagent_containers/cup/bottle/oxygen
	name = "氧气瓶"
	list_reagents = list(/datum/reagent/oxygen = 30)

/obj/item/reagent_containers/cup/bottle/fluorine
	name = "氟气瓶"
	list_reagents = list(/datum/reagent/fluorine = 30)

/obj/item/reagent_containers/cup/bottle/sodium
	name = "钠瓶"
	list_reagents = list(/datum/reagent/sodium = 30)

/obj/item/reagent_containers/cup/bottle/silicon
	name = "硅胶瓶"
	list_reagents = list(/datum/reagent/silicon = 30)

/obj/item/reagent_containers/cup/bottle/phosphorus
	name = "磷瓶"
	list_reagents = list(/datum/reagent/phosphorus = 30)

/obj/item/reagent_containers/cup/bottle/sulfur
	name = "硫磺瓶"
	list_reagents = list(/datum/reagent/sulfur = 30)

/obj/item/reagent_containers/cup/bottle/chlorine
	name = "氯气瓶"
	list_reagents = list(/datum/reagent/chlorine = 30)

/obj/item/reagent_containers/cup/bottle/potassium
	name = "钾瓶"
	list_reagents = list(/datum/reagent/potassium = 30)

/obj/item/reagent_containers/cup/bottle/iron
	name = "铁瓶"
	list_reagents = list(/datum/reagent/iron = 30)

/obj/item/reagent_containers/cup/bottle/copper
	name = "铜瓶"
	list_reagents = list(/datum/reagent/copper = 30)

/obj/item/reagent_containers/cup/bottle/mercury
	name = "汞瓶"
	list_reagents = list(/datum/reagent/mercury = 30)

/obj/item/reagent_containers/cup/bottle/water
	name = "水瓶"
	list_reagents = list(/datum/reagent/water = 30)

/obj/item/reagent_containers/cup/bottle/ethanol
	name = "乙醇瓶"
	list_reagents = list(/datum/reagent/consumable/ethanol = 30)

/obj/item/reagent_containers/cup/bottle/sugar
	name = "糖瓶"
	list_reagents = list(/datum/reagent/consumable/sugar = 30)

/obj/item/reagent_containers/cup/bottle/sacid
	name = "硫酸瓶"
	list_reagents = list(/datum/reagent/toxin/acid = 30)

/obj/item/reagent_containers/cup/bottle/welding_fuel
	name = "焊接燃料瓶"
	list_reagents = list(/datum/reagent/fuel = 30)

/obj/item/reagent_containers/cup/bottle/silver
	name = "银瓶"
	list_reagents = list(/datum/reagent/silver = 30)

/obj/item/reagent_containers/cup/bottle/caramel
	name = "焦糖瓶"
	desc = "一瓶装有焦糖化糖的瓶子，也就是焦糖。请勿舔舐。"
	list_reagents = list(/datum/reagent/consumable/caramel = 30)

/*
 *	Syrup bottles, basically a unspillable cup that transfers reagents upon clicking on it with a cup
 */

/obj/item/reagent_containers/cup/bottle/syrup_bottle
	name = "糖浆瓶"
	desc = "一个带有糖浆泵的瓶子，可将美味的糖浆直接注入您的咖啡杯中。"
	icon = 'icons/obj/food/containers.dmi'
	icon_state = "syrup"
	fill_icon_state = "syrup"
	fill_icon_thresholds = list(0, 20, 40, 60, 80, 100)
	possible_transfer_amounts = list(5, 10)
	amount_per_transfer_from_this = 5
	///variable to tell if the bottle can be refilled
	var/cap_on = TRUE

/obj/item/reagent_containers/cup/bottle/syrup_bottle/examine(mob/user)
	. = ..()
	. += span_notice("Alt-click to toggle the pump cap.")
	. += span_notice("Use a pen on it to rename it.")

//when you attack the syrup bottle with a container it refills it
/obj/item/reagent_containers/cup/bottle/syrup_bottle/attackby(obj/item/attacking_item, mob/user, params)

	if(!cap_on)
		return ..()

	if(!check_allowed_items(attacking_item,target_self = TRUE))
		return

	if(attacking_item.is_refillable())
		if(!reagents.total_volume)
			balloon_alert(user, "瓶子空了！")
			return TRUE

		if(attacking_item.reagents.holder_full())
			balloon_alert(user, "容器已满！")
			return TRUE

		var/transfer_amount = reagents.trans_to(attacking_item, amount_per_transfer_from_this)
		balloon_alert(user, "已转移 [transfer_amount] 单位")
		flick("syrup_anim",src)

	attacking_item.update_appearance()
	update_appearance()

	return TRUE

/obj/item/reagent_containers/cup/bottle/syrup_bottle/AltClick(mob/user)
	. = ..()
	cap_on = !cap_on
	if(!cap_on)
		icon_state = "syrup_open"
		balloon_alert(user, "已移除泵盖")
	else
		icon_state = "syrup"
		balloon_alert(user, "装上泵盖")
	update_icon_state()

//types of syrups

/obj/item/reagent_containers/cup/bottle/syrup_bottle/caramel
	name = "焦糖糖浆瓶"
	desc = "一个装有焦糖化糖浆的挤压瓶，也就是焦糖。请勿舔舐。"
	list_reagents = list(/datum/reagent/consumable/caramel = 50)

/obj/item/reagent_containers/cup/bottle/syrup_bottle/liqueur
	name = "咖啡利口酒糖浆瓶"
	desc = "一瓶泵压式墨西哥咖啡风味利口酒糖浆。自1936年投产，HONK。"
	list_reagents = list(/datum/reagent/consumable/ethanol/kahlua = 50)

///////////////////////////////////////////////Alchohol bottles! -Agouri //////////////////////////
//Functionally identical to regular drinks. The only difference is that the default bottle size is 100. - Darem
//Bottles now weaken and break when smashed on people's heads. - Giacom

/obj/item/reagent_containers/food/drinks/bottle
	amount_per_transfer_from_this = 10
	volume = 100
	worn_icon_state = "broken_beer" //Generic held-item sprite until unique ones are made.
	var/can_shatter = 1 //Whether the 'bottle' is made of glass or not so that milk cartons dont shatter when someone gets hit by it

/obj/item/reagent_containers/food/drinks/bottle/proc/smash(mob/living/target as mob, mob/living/user as mob)

	//Creates a shattering noise and replaces the bottle with a broken_bottle
	user.temporarilyRemoveItemFromInventory(src)
	var/obj/item/weapon/broken_bottle/B = new /obj/item/weapon/broken_bottle(user.loc)
	user.put_in_active_hand(B)
	if(prob(33))
		new/obj/item/shard(target.loc) // Create a glass shard at the target's location!
	B.icon_state = src.icon_state

	var/icon/I = new('icons/obj/items/drinks.dmi', src.icon_state)
	I.Blend(B.broken_outline, ICON_OVERLAY, rand(5), 1)
	I.SwapColor(rgb(255, 0, 220, 255), rgb(0, 0, 0, 0))
	B.icon = I

	playsound(src, SFX_SHATTER, 25, 1)
	user.put_in_active_hand(B)

	qdel(src)

/obj/item/reagent_containers/food/drinks/bottle/attack(mob/living/target as mob, mob/living/user as mob)

	if(!target)
		return

	if(user.a_intent != INTENT_HARM || !can_shatter)
		return ..()

	force = 15 //Smashing bottles over someoen's head hurts.

	var/datum/limb/affecting = user.zone_selected //Find what the player is aiming at

	//apply damage
	var/paralyze_duration = target.apply_damage(force, BRUTE, affecting, MELEE, updating_health = TRUE, attacker = user)

	if(affecting == "head" && istype(target, /mob/living/carbon/) && !isxeno(target))

		if(target != user)
			user.visible_message(span_danger("[target] 被 [user] 用一瓶 [name] 砸中了脑袋！"))
		else
			user.visible_message(span_danger("[user]用一瓶[name]砸到了[user.p_them()]自己的头！"))
		if(paralyze_duration >= force) //if they have armor, no stun
			target.apply_effect(4 SECONDS, EFFECT_PARALYZE)

	else
		if(target != user)
			user.visible_message(span_danger("[target] 被 [user] 用一瓶 [name] 攻击了！"))
		else
			user.visible_message(span_danger("[user]用[name]的瓶子攻击了[user.p_them()]自己！"))

	UPDATEHEALTH(target)

	//Attack logs
	log_combat(user, target, "smashed", src)

	//The reagents in the bottle splash all over the target, thanks for the idea Nodrak
	if(reagents)
		visible_message(span_boldnotice("[src]的内容溅了[target]一身！"))
		reagents.reaction(target, TOUCH)

	//Finally, smash the bottle. This kills (del) the bottle.
	smash(target, user)

/obj/item/reagent_containers/food/drinks/bottle/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(!CONFIG_GET(flag/fun_allowed))
		return FALSE
	attack_hand(xeno_attacker)

/obj/item/reagent_containers/food/drinks/bottle/gin
	name = "\improper 格里夫特金酒"
	desc = "一瓶高品质金酒，产自新伦敦空间站。"
	icon_state = "ginbottle"
	center_of_mass = list("x"=16, "y"=4)
	list_reagents = list(/datum/reagent/consumable/ethanol/gin = 100)

/obj/item/reagent_containers/food/drinks/bottle/whiskey
	name = "\improper 吉特大叔的特酿珍藏"
	desc = "一款优质单一麦芽威士忌，在阿拉巴马州偏远地区由乡民精心陈酿四年而成。"
	icon_state = "whiskeybottle"
	center_of_mass = list("x"=16, "y"=3)
	list_reagents = list(/datum/reagent/consumable/ethanol/whiskey = 100)

/obj/item/reagent_containers/food/drinks/bottle/specialwhiskey
	name = "\improper 纳米传讯'太空陈酿'60年威士忌"
	desc = "这款上等威士忌自2378年起就在一艘殖民飞船的船体内陈酿。它的价值超过你几个月的薪水——瓶身上就敢如此大胆地宣称。"
	icon_state = "specialwhiskeybottle"
	center_of_mass = list("x"=16, "y"=3)
	list_reagents = list(/datum/reagent/consumable/ethanol/specialwhiskey = 100)

/obj/item/reagent_containers/food/drinks/bottle/experimentalliquor
	name = "\improper NT-06"
	desc = "一个黑色瓶子，上面除了一张纸条和警告标签外别无他物。写着'喝下此物，你将死亡'、'600度酒精度'以及其他诸如此类的劝阻话语。"
	icon_state = "experimentalliquorbottle"
	center_of_mass = list("x"=17, "y"=5)
	list_reagents = list(/datum/reagent/consumable/ethanol/pwine = 100)

/obj/item/reagent_containers/food/drinks/bottle/sake
	name = "\improper 传统切腹风格清酒"
	desc = "甜得恰到好处，入口却如火焰般灼烧。"
	icon_state = "sakebottle"
	center_of_mass = list("x"=17, "y"=7)
	list_reagents = list(/datum/reagent/consumable/ethanol/sake = 100)

/obj/item/reagent_containers/food/drinks/bottle/vodka
	name = "\improper 红星伏特加"
	desc = "瓶子上写着：'啦啦红明星人：精致事物的爱好者。'至少你是这么认为的……"
	icon_state = "vodkabottle"
	center_of_mass = list("x"=17, "y"=3)
	list_reagents = list(/datum/reagent/consumable/ethanol/vodka = 100)

/obj/item/reagent_containers/food/drinks/bottle/tequila
	name = "\improper 卡卡沃保证品质龙舌兰酒"
	desc = "采用优质石油馏分、纯沙利度胺及其他高品质原料精制而成！"
	icon_state = "tequilabottle"
	center_of_mass = list("x"=16, "y"=3)
	list_reagents = list(/datum/reagent/consumable/ethanol/tequila = 100)

/obj/item/reagent_containers/food/drinks/bottle/davenport
	name = "\improper 达文波特黑麦威士忌"
	desc = "一款价格不菲的威士忌，风味独特。瓶身自豪地宣称其为'真正的经典'。"
	icon_state = "davenportbottle"
	center_of_mass = list("x"=16, "y"=3)
	list_reagents = list(/datum/reagent/consumable/ethanol/davenport = 50)


/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing
	name = "虚无之瓶"
	desc = "一个空瓶子"
	icon_state = "bottleofnothing"
	center_of_mass = list("x"=17, "y"=5)
	list_reagents = list(/datum/reagent/consumable/nothing = 100)

/obj/item/reagent_containers/food/drinks/bottle/patron
	name = "缠绕艺术家赞助人"
	desc = "银河系各太空夜店供应的银边龙舌兰酒。"
	icon_state = "patronbottle"
	center_of_mass = list("x"=16, "y"=6)
	list_reagents = list(/datum/reagent/consumable/ethanol/patron = 100)

/obj/item/reagent_containers/food/drinks/bottle/rum
	name = "舰长皮特的古巴风味朗姆酒"
	desc = "以著名的{{P0}}古巴{{P1}}皮特上尉命名，这款朗姆酒就像他最后的任务一样充满变数。"
	icon_state = "rumbottle"
	center_of_mass = list("x"=16, "y"=8)
	list_reagents = list(/datum/reagent/consumable/ethanol/rum = 100)

/obj/item/reagent_containers/food/drinks/bottle/holywater
	name = "圣水瓶"
	desc = "牧师圣水的一小瓶。"
	icon_state = "holyflask"
	center_of_mass = list("x"=17, "y"=10)
	list_reagents = list(/datum/reagent/water/holywater = 100)

/obj/item/reagent_containers/food/drinks/bottle/vermouth
	name = "金眼味美思"
	desc = "甜美，甜美的干爽~"
	icon_state = "vermouthbottle"
	center_of_mass = list("x"=17, "y"=3)
	list_reagents = list(/datum/reagent/consumable/ethanol/vermouth = 100)

/obj/item/reagent_containers/food/drinks/bottle/kahlua
	name = "罗伯特·罗巴斯特咖啡利口酒"
	desc = "一种广为人知的墨西哥咖啡风味利口酒。自1936年开始生产，HONK"
	icon_state = "kahluabottle"
	center_of_mass = list("x"=17, "y"=3)
	list_reagents = list(/datum/reagent/consumable/ethanol/kahlua = 100)

/obj/item/reagent_containers/food/drinks/bottle/goldschlager
	name = "大学女生金酒"
	desc = "因为只有他们才会喝100度的肉桂烈酒。"
	icon_state = "goldschlagerbottle"
	center_of_mass = list("x"=15, "y"=3)
	list_reagents = list(/datum/reagent/consumable/ethanol/goldschlager = 100)

/obj/item/reagent_containers/food/drinks/bottle/cognac
	name = "夏多巴顿特级干邑"
	desc = "一种甘甜而烈性十足的饮品，经过多次蒸馏与多年陈酿制成。这次你或许不该再高喊'狗屎安保'了。"
	icon_state = "cognacbottle"
	center_of_mass = list("x"=16, "y"=6)
	list_reagents = list(/datum/reagent/consumable/ethanol/cognac = 100)

/obj/item/reagent_containers/food/drinks/bottle/wine
	name = "双须特酿葡萄酒"
	desc = "瓶子周围笼罩着一层微弱的不安与蛋疼气息。"
	icon_state = "winebottle"
	center_of_mass = list("x"=16, "y"=4)
	list_reagents = list(/datum/reagent/consumable/ethanol/wine = 100)

/obj/item/reagent_containers/food/drinks/bottle/absinthe
	name = "越狱者脊椎"
	desc = "喝上一口，你就知道好时光要来了。"
	icon_state = "absinthebottle"
	center_of_mass = list("x"=16, "y"=6)
	list_reagents = list(/datum/reagent/consumable/ethanol/absinthe = 100)

/obj/item/reagent_containers/food/drinks/bottle/melonliquor
	name = "翡翠瓜酒"
	desc = "一瓶46度的翡翠甜瓜利口酒。口感清甜柔和。"
	icon_state = "alco-green" //Placeholder.
	center_of_mass = list("x"=16, "y"=6)
	list_reagents = list(/datum/reagent/consumable/ethanol/melonliquor = 100)

/obj/item/reagent_containers/food/drinks/bottle/bluecuracao
	name = "蓝橙酒小姐"
	desc = "一款果味浓郁、异常湛蓝的饮品。饮用者无法使用第五魔法。"
	icon_state = "alco-blue" //Placeholder.
	center_of_mass = list("x"=16, "y"=6)
	list_reagents = list(/datum/reagent/consumable/ethanol/bluecuracao = 100)

/obj/item/reagent_containers/food/drinks/bottle/grenadine
	name = "荆棘玫瑰石榴糖浆"
	desc = "酸甜可口，一种用于为饮品增添色泽或风味的吧台糖浆。"
	icon_state = "grenadine"
	center_of_mass = list("x"=16, "y"=6)
	list_reagents = list(/datum/reagent/consumable/grenadine = 100)

/obj/item/reagent_containers/food/drinks/bottle/pwine
	name = "术士的天鹅绒"
	desc = "这包装真是精美，里面的葡萄酒品质一定很高！年份肯定非常出色！"
	icon_state = "pwinebottle"
	center_of_mass = list("x"=16, "y"=4)
	list_reagents = list(/datum/reagent/consumable/ethanol/pwine = 100)

//////////////////////////JUICES AND STUFF ///////////////////////

/obj/item/reagent_containers/food/drinks/bottle/orangejuice
	name = "橙汁"
	desc = "富含维生素，美味可口！"
	icon_state = "orangejuice"
	worn_icon_state = "carton"
	center_of_mass = list("x"=16, "y"=7)
	can_shatter = 0
	list_reagents = list(/datum/reagent/consumable/orangejuice = 100)

/obj/item/reagent_containers/food/drinks/bottle/cream
	name = "牛奶奶油"
	desc = "这是奶油。用牛奶制成的。你还以为里面会有什么？"
	icon_state = "cream"
	worn_icon_state = "carton"
	center_of_mass = list("x"=16, "y"=8)
	can_shatter = 0
	list_reagents = list(/datum/reagent/consumable/cream = 100)

/obj/item/reagent_containers/food/drinks/bottle/tomatojuice
	name = "番茄汁"
	desc = "好吧，至少它看起来像番茄汁。在那一大片红色里，你根本分不清。"
	icon_state = "tomatojuice"
	worn_icon_state = "carton"
	center_of_mass = list("x"=16, "y"=8)
	can_shatter = 0
	list_reagents = list(/datum/reagent/consumable/tomatojuice = 100)

/obj/item/reagent_containers/food/drinks/bottle/limejuice
	name = "青柠汁"
	desc = "酸甜可口的美味。"
	icon_state = "limejuice"
	worn_icon_state = "carton"
	center_of_mass = list("x"=16, "y"=8)
	can_shatter = 0
	list_reagents = list(/datum/reagent/consumable/limejuice = 100)
