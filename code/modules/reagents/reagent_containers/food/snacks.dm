//Food items that are eaten normally and don't leave anything behind.
/obj/item/reagent_containers/food/snacks
	name = "零食"
	desc = "美味"
	icon = 'icons/obj/items/food/food.dmi'
	var/bitesize = 1
	var/bitecount = 0
	var/trash = null
	var/slice_path
	var/slices_num
	var/package = FALSE
	center_of_mass = list("x"=15, "y"=15)
	var/list/tastes // for example list("crisps" = 2, "salt" = 1)

/obj/item/reagent_containers/food/snacks/create_reagents(max_vol, new_flags, list/init_reagents, data)
	. = ..()
	if(!length(tastes) || !length(init_reagents))
		return ..()
	if(reagents)
		qdel(reagents)
	reagents = new (max_vol, new_flags)
	reagents.my_atom = WEAKREF(src)
	for(var/rid in init_reagents)
		var/amount = list_reagents[rid]
		if(rid == /datum/reagent/consumable/nutriment)
			reagents.add_reagent(rid, amount, tastes.Copy())
		else
			reagents.add_reagent(rid, amount, data)

///Handles effects when the snack is finished
/obj/item/reagent_containers/food/snacks/proc/On_Consume(mob/consumer)
	if(reagents.total_volume)
		return

	consumer.dropItemToGround(src)
	if(trash)
		var/obj/item/new_trash = new trash
		consumer.put_in_hands(new_trash)
	qdel(src)

/obj/item/reagent_containers/food/snacks/attack_self(mob/user as mob)
	return

/obj/item/reagant_containers/food/snacks/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(!CONFIG_GET(flag/fun_allowed))
		return FALSE
	attack_hand(xeno_attacker)

/obj/item/reagent_containers/food/snacks/attack(mob/M, mob/user, def_zone)
	if(!reagents?.total_volume)						//Shouldn't be needed but it checks to see if it has anything left in it.
		to_chat(user, span_warning("\the [src] 已经什么都不剩了，哦不！"))
		M.dropItemToGround(src)	//so icons update :[
		qdel(src)
		return FALSE

	if(package)
		balloon_alert(user, "包装还没拆！")
		return FALSE

	if(iscarbon(M))
		var/mob/living/carbon/carbon_mob = M
		var/datum/reagent/consumable/nutriment/nutriment = reagents.get_reagent(/datum/reagent/consumable/nutriment)
		var/bite_nutrition = nutriment.get_nutrition_gain((reagents.total_volume < bitesize) ? nutriment.volume : nutriment.volume / reagents.total_volume * bitesize)
		nutriment = carbon_mob.reagents.get_reagent(/datum/reagent/consumable/nutriment)
		var/fullness = carbon_mob.nutrition + nutriment?.get_nutrition_gain() + bite_nutrition //adds our next bite to our total nutrition in body and stomach

		if(M == user) // If you're eating it yourself
			if(ishuman(carbon_mob) && (carbon_mob.species.species_flags & ROBOTIC_LIMBS))
				balloon_alert(user, "你无法进食！")
				return
			if(fullness <= NUTRITION_STARVING)
				to_chat(M, span_warning("你贪婪地啃下一块\the [src]，狼吞虎咽地吃了下去！"))
			if(fullness > NUTRITION_STARVING && fullness <= NUTRITION_HUNGRY)
				to_chat(M, span_warning("你饥渴地开始啃食\the [src]。"))
			if(fullness > NUTRITION_HUNGRY && fullness <= NUTRITION_WELLFED)
				to_chat(M, span_warning("你咬了一口\the [src]。"))
			if(fullness > NUTRITION_WELLFED && fullness <= NUTRITION_OVERFED)
				to_chat(M, span_warning("你勉强嚼了一点\the [src]。"))
			if(fullness > NUTRITION_OVERFED)
				to_chat(M, span_warning("你无法再强行咽下更多\the [src]了。"))
				return FALSE
		else
			if(ishuman(carbon_mob) && (carbon_mob.species.species_flags & ROBOTIC_LIMBS))
				balloon_alert(user, "你无法进食！")
				return
			if(fullness <= NUTRITION_OVERFED)
				user.balloon_alert_to_viewers("正在尝试喂食[carbon_mob]...")
				to_chat(carbon_mob, span_userdanger("[user]试图喂你吃\the [src]。"))
			else
				carbon_mob.balloon_alert(user, "[carbon_mob.p_theyre()] 满了！")
				return FALSE

			if(!do_after(user, 3 SECONDS, NONE, carbon_mob, BUSY_ICON_FRIENDLY))
				return

			var/rgt_list_text = get_reagent_list_text()

			log_combat(user, carbon_mob, "fed", src, "Reagents: [rgt_list_text]")

			user.balloon_alert_to_viewers("迫使[carbon_mob]吞下")
			to_chat(carbon_mob, span_userdanger("[user]强迫你吃下\the [src]。"))


		if(reagents)								//Handle ingestion of the reagent.
			playsound(M.loc,'sound/items/eatfood.ogg', 15, 1)
			if(reagents.total_volume)
				reagents.reaction(M, INGEST)
				if(reagents.total_volume > bitesize)
					//Why is bitesize used instead of an actual portion???
					record_reagent_consumption(bitesize, reagents.reagent_list, user, carbon_mob)
					reagents.trans_to(M, bitesize)
				else
					record_reagent_consumption(reagents.total_volume, reagents.reagent_list, user, carbon_mob)
					reagents.trans_to(carbon_mob, reagents.total_volume)
				bitecount++
				On_Consume(carbon_mob)
			return TRUE

	return FALSE

/obj/item/reagent_containers/food/snacks/examine(mob/user)
	. = ..()
	if(!(user in range(0)) && user != loc)
		return
	if(bitecount == 0)
		return
	if(bitecount == 1)
		. += span_notice("\The [src] was bitten by someone!")
		return
	if(bitecount<=3)
		. += span_notice("\The [src] was bitten [bitecount] times!")
		return
	. += span_notice("\The [src] was bitten multiple times!")

/obj/item/reagent_containers/food/snacks/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(!istype(I, /obj/item/tool/kitchen/utensil))
		return
	var/obj/item/tool/kitchen/utensil/attacking_utensil = I

	if(attacking_utensil.reagents.total_volume > 0)
		balloon_alert(user, "[attacking_utensil]上已经有东西了！")
		return

	user.visible_message("[user]用\the [attacking_utensil]舀起了一些[src]！", \
		span_notice("You scoop up some [src] with \the [attacking_utensil]!"))

	bitecount++
	var/image/food_image = image("icon" = icon, "icon_state" = icon_state, "layer" = attacking_utensil.layer+0.01)
	food_image.color = filling_color
	food_image.pixel_y = 5
	attacking_utensil.loaded = food_image
	attacking_utensil.update_appearance(UPDATE_OVERLAYS)

	reagents.trans_to(attacking_utensil, min(reagents.total_volume, 5))

	if(reagents.total_volume <= 0)
		qdel(src)


/obj/item/reagent_containers/food/snacks/sliceable/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(I.sharp == IS_NOT_SHARP_ITEM)
		if(I.w_class >= WEIGHT_CLASS_SMALL)
			return
		if(!user.transferItemToLoc(I, src))
			return
		if(length(contents) > max_items)
			balloon_alert(user, "已满！")
			return
		balloon_alert(user, "将[I]塞入[src]。")
		return

	if(!isturf(loc) || !(locate(/obj/structure/table) in loc))
		balloon_alert(user, "需要一张桌子或托盘来切片！")
		return

	balloon_alert_to_viewers("[user]斩击了[src]。")

	var/reagents_per_slice = reagents.total_volume / slices_num

	for(var/i in 1 to slices_num)
		var/obj/slice = new slice_path(loc)
		reagents.trans_to(slice,reagents_per_slice)

	qdel(src)
	return TRUE


/obj/item/reagent_containers/food/snacks/Destroy()
	for(var/atom/movable/AM AS in contents)
		AM.forceMove(get_turf(src))
	return ..()

/obj/item/reagent_containers/food/snacks/attack_animal(mob/M)
	if(!isanimal(M))
		return

	if(iscorgi(M))
		var/mob/living/simple_animal/corgi/eating_corgi = M
		if(bitecount == 0 || prob(50))
			eating_corgi.emote("nibbles away at the [src]")
		bitecount++
		eating_corgi.taste(reagents) //why should carbons get all the fun?
		if(bitecount >= 5)
			eating_corgi.emote(pick("burps from enjoyment!", "yaps for more!", "woofs twice!", "looks at the area where the [src] was.."))
			qdel(src)
		return

	if(ismouse(M))
		var/mob/living/simple_animal/mouse/monuse = M
		monuse.taste(reagents) // ratatouilles
		if(prob(50))
			balloon_alert_to_viewers("啃咬")
		monuse.health = min(monuse.health + 1, monuse.maxHealth)

//////////////////////////////////////////////////
////////////////////////////////////////////Snacks
//////////////////////////////////////////////////
//Items in the "Snacks" subcategory are food items that people actually eat. The key points are that they are created
//	already filled with reagents and are destroyed when empty. Additionally, they make a "munching" noise when eaten.

//Notes by Darem: Food in the "snacks" subtype can hold a maximum of 50 units Generally speaking, you don't want to go over 40
//	total for the item because you want to leave space for extra condiments. If you want effect besides healing, add a reagent for
//	it. Try to stick to existing reagents when possible (so if you want a stronger healing effect, just use Tricordrazine). On use
//	effect (such as the old officer eating a donut code) requires a unique reagent (unless you can figure out a better way).

//The nutriment reagent and bitesize variable replace the old heal_amt and amount variables. Each unit of nutriment is equal to
//	2 of the old heal_amt variable. Bitesize is the rate at which the reagents are consumed. So if you have 6 nutriment and a
//	bitesize of 2, then it'll take 3 bites to eat. Unlike the old system, the contained reagents are evenly spread among all
//	the bites. No more contained reagents = no more bites.

//Here is an example of the new formatting for anyone who wants to add more food items.
///obj/item/reagent_containers/food/snacks/burger/xeno			//Identification path for the object.
//	 name = "Xenoburger"												//Name that displays in the UI.
//	 desc = "Smells caustic. Tastes like heresy."						//Duh
//	 icon_state = "xburger"												//Refers to an icon in food.dmi
//	 list_reagents = list(/datum/reagent/consumable/nutriment = 2)			//This is what is in the food item. you may copy/paste
//	 tastes = list("dough" = 2, "heresy" = 1)							//This is the flavour of the food
//	 bitesize = 3														//This is the amount each bite consumes.


///obj/item/reagent_containers/food/snacks/burger/xeno/Initialize(mapload)		//Absolute pathing for procs, please.
//	 . = ..()															//Calls the parent proc, don't forget to add this.


/obj/item/reagent_containers/food/snacks/honeycomb
	name = "蜂巢"
	icon_state = "honeycomb"
	desc = "滴着糖浆般的甜腻。"
	list_reagents = list(/datum/reagent/consumable/honey = 10, /datum/reagent/consumable/nutriment = 0.5, /datum/reagent/consumable/sugar = 2)
	bitesize = 2

/obj/item/reagent_containers/food/snacks/candy
	name = "糖果"
	desc = "牛轧糖，爱它或恨它。"
	icon_state = "candy"
	trash = /obj/item/trash/candy
	icon = 'icons/obj/items/food/packaged.dmi'
	filling_color = "#7D5F46"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3)
	tastes = list("candy" = 1)

/obj/item/reagent_containers/food/snacks/candy/donor
	name = "赞助者糖果"
	desc = "给献血者的一点小礼物。"
	trash = /obj/item/trash/candy
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/sugar = 3, /datum/reagent/medicine/tricordrazine = 1, /datum/reagent/iron = 5) //Honk
	bitesize = 2


/obj/item/reagent_containers/food/snacks/candy_corn
	name = "糖果玉米"
	desc = "这是一把糖果玉米。可惜无法存放在侦探帽里。"
	icon = 'icons/obj/items/food/candy.dmi'
	icon_state = "candy_corn"
	filling_color = "#FFFCB0"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/sugar = 2)
	bitesize = 2
	tastes = list("candy corn" = 1)

/obj/item/reagent_containers/food/snacks/chips
	name = "芯片"
	desc = "指挥官瑞克的'什么鬼薯片'"
	icon = 'icons/obj/items/food/packaged.dmi'
	icon_state = "chips"
	trash = /obj/item/trash/chips
	filling_color = "#E8C31E"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sodiumchloride = 1)
	tastes = list("salt" = 1, "crisps" = 1)

/obj/item/reagent_containers/food/snacks/cookie
	name = "饼干"
	desc = "饼干！！！"
	icon_state = "COOKIE!!!"
	icon = 'icons/obj/items/food/confectionary.dmi'
	filling_color = "#DBC94F"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	tastes = list("cookie" = 1)

/obj/item/reagent_containers/food/snacks/chocolatebar
	name = "巧克力棒"
	desc = "如此甜美，令人发胖的食物。"
	icon = 'icons/obj/items/food/candy.dmi'
	icon_state = "chocolatebar"
	filling_color = "#7D5F46"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/sugar = 2, /datum/reagent/consumable/coco = 2)
	bitesize = 2
	tastes = list("chocolate" = 1)

/obj/item/reagent_containers/food/snacks/chocolateegg
	name = "巧克力蛋"
	desc = "如此甜美，令人发胖的食物。"
	icon = 'icons/obj/items/food/candy.dmi'
	icon_state = "chocolateegg"
	filling_color = "#7D5F46"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 2, /datum/reagent/consumable/coco = 2)
	bitesize = 2
	tastes = list("chocolate" = 4, "sweetness" = 1)

/obj/item/reagent_containers/food/snacks/egg
	name = "卵"
	desc = "一个卵！"
	icon = 'icons/obj/items/food/packaged.dmi'
	icon_state = "egg"
	filling_color = "#FDFFD1"
	var/egg_color
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("egg" = 1)

/obj/item/reagent_containers/food/snacks/egg/throw_impact(atom/hit_atom)
	. = ..()
	if(!.)
		return
	new/obj/effect/decal/cleanable/egg_smudge(src.loc)
	src.reagents.reaction(hit_atom, TOUCH)
	src.visible_message(span_warning("[src.name] 被压扁了。"),span_warning("You hear a smack."))
	qdel(src)

/obj/item/reagent_containers/food/snacks/egg/blue
	icon_state = "egg-blue"
	egg_color = "blue"

/obj/item/reagent_containers/food/snacks/egg/green
	icon_state = "egg-green"
	egg_color = "green"

/obj/item/reagent_containers/food/snacks/egg/mime
	icon_state = "egg-mime"
	egg_color = "mime"

/obj/item/reagent_containers/food/snacks/egg/orange
	icon_state = "egg-orange"
	egg_color = "orange"

/obj/item/reagent_containers/food/snacks/egg/purple
	icon_state = "egg-purple"
	egg_color = "purple"

/obj/item/reagent_containers/food/snacks/egg/rainbow
	icon_state = "egg-rainbow"
	egg_color = "rainbow"

/obj/item/reagent_containers/food/snacks/egg/red
	icon_state = "egg-red"
	egg_color = "red"

/obj/item/reagent_containers/food/snacks/egg/yellow
	icon_state = "egg-yellow"
	egg_color = "yellow"

/obj/item/reagent_containers/food/snacks/friedegg
	name = "煎蛋"
	desc = "煎蛋，加少许盐和胡椒。"
	icon_state = "friedegg"
	filling_color = "#FFDF78"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/sodiumchloride = 1, /datum/reagent/consumable/blackpepper = 1)
	tastes = list("egg" = 4, "salt" = 1, "pepper" = 1)

/obj/item/reagent_containers/food/snacks/boiledegg
	name = "煮鸡蛋"
	desc = "一颗煮熟的鸡蛋。"
	icon = 'icons/obj/items/food/packaged.dmi'
	icon_state = "egg"
	filling_color = "#FFFFFF"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("egg" = 1)

/obj/item/reagent_containers/food/snacks/flour
	name = "面粉"
	desc = "一小袋面粉。"
	icon = 'icons/obj/items/food/packaged.dmi'
	icon_state = "flour"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("chalky wheat" = 1)


/obj/item/reagent_containers/food/snacks/organ

	name = "器官"
	desc = "这对你有好处。"
	icon = 'icons/obj/items/organs.dmi'
	icon_state = "appendix"
	filling_color = "#E00D34"
	bitesize = 3


/obj/item/reagent_containers/food/snacks/organ/Initialize(mapload)
	list_reagents = list(/datum/reagent/consumable/nutriment = rand(3,5), /datum/reagent/toxin = rand(1,3))
	return ..()


/obj/item/reagent_containers/food/snacks/worm
	name = "蠕虫"
	icon = 'icons/obj/items/items.dmi'
	icon_state = "worm"
	desc = "一条小蠕虫。它看起来有点孤单。"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	bitesize = 2
	tastes = list("dirt" = 1)
	attack_verb = list("touches")

/obj/item/reagent_containers/food/snacks/tofu
	name = "豆腐"
	icon_state = "tofu"
	desc = "我们都爱豆腐。"
	filling_color = "#FFFEE0"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	bitesize = 3
	tastes = list("tofu" = 1)

/obj/item/reagent_containers/food/snacks/tofurkey
	name = "素火鸡"
	desc = "用豆腐制成的假火鸡。"
	icon = 'icons/obj/items/food/mre.dmi'
	icon_state = "tofurkey"
	filling_color = "#FFFEE0"
	list_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/toxin/sleeptoxin = 3)
	bitesize = 3
	tastes = list("tofu" = 3, "breadcrumbs" = 1)

/obj/item/reagent_containers/food/snacks/stuffing
	name = "填装"
	desc = "湿润、辛辣的面包屑，用于填充死鸟的体腔。开吃吧！"
	icon = 'icons/obj/items/food/mre.dmi'
	icon_state = "stuffing"
	filling_color = "#C9AC83"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	tastes = list("breadcrumbs" = 3, "pepper" = 1)

/obj/item/reagent_containers/food/snacks/carpmeat
	name = "鲤鱼鱼片"
	desc = "一份太空鲤鱼鱼柳"
	icon = 'icons/obj/items/food/meat.dmi'
	icon_state = "fishfillet"
	filling_color = "#FFDEFE"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/toxin/carpotoxin = 3)
	bitesize = 6
	tastes = list("fish" = 1)

/obj/item/reagent_containers/food/snacks/fishfingers
	name = "鱼条"
	desc = "一根手指的鱼。"
	icon = 'icons/obj/items/food/meat.dmi'
	icon_state = "fishfingers"
	filling_color = "#FFDEFE"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/toxin/carpotoxin = 3)
	bitesize = 3
	tastes = list("fish" = 1, "breadcrumbs" = 1)

/obj/item/reagent_containers/food/snacks/hugemushroomslice
	name = "巨大蘑菇切片"
	desc = "巨大蘑菇的一片切片。"
	icon = 'icons/obj/items/food/meat.dmi'
	icon_state = "hugemushroomslice"
	filling_color = "#E0D7C5"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/psilocybin = 3)
	bitesize = 6
	tastes = list("mushroom" = 1)

/obj/item/reagent_containers/food/snacks/tomatomeat
	name = "番茄片"
	desc = "巨大番茄的一片"
	icon = 'icons/obj/items/food/meat.dmi'
	icon_state = "tomatomeat"
	filling_color = "#DB0000"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	tastes = list("tomato" = 1)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/bearmeat
	name = "熊肉"
	desc = "一块非常爷们的肉排。"
	icon = 'icons/obj/items/food/meat.dmi'
	icon_state = "bearmeat"
	filling_color = "#DB0000"
	list_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/toxin/sleeptoxin = 3)
	tastes = list("meat" = 1, "salmon" = 1)
	bitesize = 3

/obj/item/reagent_containers/food/snacks/raw_lizard_sausage
	name = "生蜥蜴血肠"
	desc = "一条生蜥蜴血肠，已准备好放在晾架上风干。"
	icon = 'icons/obj/items/food/meat.dmi'
	icon_state = "raw_lizard_sausage"
	list_reagents = list(/datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/blood = 3)
	tastes = list("meat" = 1, "black pudding" = 1)

/obj/item/reagent_containers/food/snacks/lizard_sausage
	name = "\improper 蜥蜴血肠"
	desc = "一种粗制干腌血肠，传统上采用100%有机来源的蜥蜴肉制成。"
	icon = 'icons/obj/items/food/meat.dmi'
	icon_state = "lizard_sausage"
	list_reagents = list(/datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("meat" = 1, "black pudding" = 1)

/obj/item/reagent_containers/food/snacks/meatball
	name = "肉丸"
	desc = "真是顿丰盛的大餐。"
	icon = 'icons/obj/items/food/meat.dmi'
	icon_state = "meatball"
	filling_color = "#DB0000"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	tastes = list("meat" = 1)
	bitesize = 1

/obj/item/reagent_containers/food/snacks/sausage
	name = "香肠"
	desc = "一块混杂的长条肉块。"
	icon = 'icons/obj/items/food/meat.dmi'
	icon_state = "sausage"
	filling_color = "#DB0000"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	tastes = list("meat" = 1)
	bitesize = 2

/obj/item/reagent_containers/food/snacks/donkpocket
	name = "唐克口袋"
	desc = "资深叛徒的首选食品。"
	icon = 'icons/obj/items/food/confectionary.dmi'
	icon_state = "donkpocket"
	filling_color = "#DEDEAB"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4)
	var/warm = 0
	tastes = list("meat" = 2, "dough" = 2, "laziness" = 1)

/obj/item/reagent_containers/food/snacks/donkpocket/proc/cooltime()
	if(warm)
		spawn( 4200 )
			if(!gc_destroyed) //not cdel'd
				warm = 0
				reagents.del_reagent(/datum/reagent/medicine/tricordrazine)
				name = "唐克口袋"

/obj/item/reagent_containers/food/snacks/human
	var/hname = ""
	var/job = null
	filling_color = "#D63C3C"

/obj/item/reagent_containers/food/snacks/omelette
	name = "奶酪煎蛋卷"
	desc = "你就只会说这个！"
	icon_state = "omelette"
	trash = /obj/item/trash/plate
	filling_color = "#FFF9A8"
	list_reagents = list(/datum/reagent/consumable/nutriment = 8)
	tastes = list("egg" = 1, "cheese" = 1)


/obj/item/reagent_containers/food/snacks/muffin
	name = "松饼"
	desc = "一块美味松软的小蛋糕"
	icon = 'icons/obj/items/food/confectionary.dmi'
	icon_state = "muffin"
	filling_color = "#E0CF9B"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	bitesize = 2
	tastes = list("muffin" = 1)

/obj/item/reagent_containers/food/snacks/waffles
	name = "华夫饼"
	desc = "嗯，华夫饼"
	icon_state = "waffles"
	trash = /obj/item/trash/waffles
	filling_color = "#E6DEB5"
	list_reagents = list(/datum/reagent/consumable/nutriment = 8)
	bitesize = 2
	tastes = list("waffles" = 1)

/obj/item/reagent_containers/food/snacks/eggplantparm
	name = "茄子帕尔马干酪"
	desc = "茄子唯一的美味做法。"
	icon_state = "eggplantparm"
	trash = /obj/item/trash/plate
	filling_color = "#4D2F5E"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	bitesize = 2
	tastes = list("eggplant" = 3, "cheese" = 1)

/obj/item/reagent_containers/food/snacks/soylentgreen
	name = "索伦绿"
	desc = "不是用人做的。真的。" //Totally people.
	icon_state = "soylent_green"
	trash = /obj/item/trash/waffles
	filling_color = "#B8E6B5"
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	bitesize = 2
	tastes = list("waffles" = 7, "people" = 1)

/obj/item/reagent_containers/food/snacks/soylenviridians
	name = "索伊伦·维尔迪安斯"
	desc = "不是用人做的。真的。" //Actually honest for once.
	icon_state = "soylent_yellow"
	trash = /obj/item/trash/waffles
	filling_color = "#E6FA61"
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	bitesize = 2
	tastes = list("waffles" = 7, "the colour green" = 1)

/obj/item/reagent_containers/food/snacks/human/kabob
	name = "-轨道轰炸"
	icon_state = "kabob"
	desc = "人肉串。"
	trash = /obj/item/stack/rods
	filling_color = "#A85340"
	list_reagents = list(/datum/reagent/consumable/nutriment = 8)
	tastes = list("tender meat" = 3, "metal" = 1)
	bitesize = 2

/obj/item/reagent_containers/food/snacks/monkeykabob
	name = "肉串"
	icon_state = "kabob"
	desc = "美味的肉，串在签子上。"
	trash = /obj/item/stack/rods
	filling_color = "#A85340"
	list_reagents = list(/datum/reagent/consumable/nutriment = 8)
	tastes = list("meat" = 3, "metal" = 1)
	bitesize = 2

/obj/item/reagent_containers/food/snacks/tofukabob
	name = "豆腐串烧"
	icon_state = "kabob"
	desc = "纯素肉串。"
	trash = /obj/item/stack/rods
	filling_color = "#FFFEE0"
	list_reagents = list(/datum/reagent/consumable/nutriment = 8)
	tastes = list("tofu" = 3, "metal" = 1)
	bitesize = 2

/obj/item/reagent_containers/food/snacks/cubancarp
	name = "古巴鲤鱼"
	desc = "一份恶作剧三明治，先灼烧你的舌头，然后让它麻木！"
	icon = 'icons/obj/items/food/meat.dmi'
	icon_state = "cubancarp"
	trash = /obj/item/trash/plate
	filling_color = "#E9ADFF"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/toxin/carpotoxin = 3, /datum/reagent/consumable/capsaicin = 3)
	tastes = list("fish" = 4, "batter" = 1, "hot peppers" = 1)
	bitesize = 3

/obj/item/reagent_containers/food/snacks/popcorn
	name = "爆米花"
	desc = "现在去找个电影院。"
	icon_state = "popcorn"
	icon = 'icons/obj/items/food/packaged.dmi'
	trash = /obj/item/trash/popcorn
	var/unpopped = 0
	filling_color = "#FFFAD4"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	bitesize = 0.1  //this snack is supposed to be eating during looooong time. And this it not dinner food! --rastaf0
	tastes = list("popcorn" = 3, "butter" = 1)


/obj/item/reagent_containers/food/snacks/popcorn/Initialize(mapload)
	. = ..()
	unpopped = rand(1,10)

/obj/item/reagent_containers/food/snacks/popcorn/On_Consume(mob/consumer)
	if(prob(unpopped))	//lol ...what's the point?
		to_chat(consumer, span_warning("你咬到了一个没爆开的爆米花粒！"))
		unpopped = max(0, unpopped-1)
	return ..()


/obj/item/reagent_containers/food/snacks/sosjerky
	name = "Scaredy 私藏牛肉干"
	icon_state = "sosjerky"
	desc = "用最优质太空牛肉制成的牛肉干。"
	icon = 'icons/obj/items/food/packaged.dmi'
	trash = /obj/item/trash/sosjerky
	filling_color = "#631212"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sodiumchloride = 2)
	bitesize = 2
	tastes = list("dried meat" = 1)

/obj/item/reagent_containers/food/snacks/no_raisin
	name = "4号无葡萄干"
	icon_state = "4no_raisins"
	desc = "全宇宙最好的葡萄干。不知道为什么。"
	icon = 'icons/obj/items/food/packaged.dmi'
	trash = /obj/item/trash/raisins
	filling_color = "#343834"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/sugar = 4)
	tastes = list("dried raisins" = 1)

/obj/item/reagent_containers/food/snacks/spacetwinkie
	name = "太空奶油夹心蛋糕"
	icon_state = "space_twinkie"
	icon = 'icons/obj/items/food/confectionary.dmi'
	desc = "保证比你能活得更久。"
	filling_color = "#FFE591"
	list_reagents = list(/datum/reagent/consumable/sugar = 4)
	bitesize = 2

/obj/item/reagent_containers/food/snacks/cheesiehonkers
	name = "芝士脆脆"
	icon_state = "cheesie_honkers"
	icon = 'icons/obj/items/food/packaged.dmi'
	desc = "一口大小的芝士零食，让你的嘴巴充满鸣响"
	trash = /obj/item/trash/cheesie
	filling_color = "#FFA305"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3)
	bitesize = 2
	tastes = list("cheese" = 5, "crisps" = 2)

/obj/item/reagent_containers/food/snacks/syndicake
	name = "辛迪蛋糕"
	icon = 'icons/obj/items/food/packaged.dmi'
	icon_state = "syndi_cakes"
	desc = "一种极其湿润的零食蛋糕，微波加热后风味依旧绝佳。"
	filling_color = "#FF5D05"

	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/doctor_delight = 5)
	trash = /obj/item/trash/syndi_cakes
	bitesize = 3
	tastes = list("sweetness" = 3, "cake" = 1)

/obj/item/reagent_containers/food/snacks/loadedbakedpotato
	name = "烤土豆"
	desc = "完全烤焦了。"
	icon_state = "loadedbakedpotato"
	filling_color = "#9C7A68"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	bitesize = 2
	tastes = list("nutriment" = 1)

/obj/item/reagent_containers/food/snacks/fries
	name = "太空薯条"
	desc = "又名：法式薯条、自由薯条等。"
	icon = 'icons/obj/items/food/cheeseandfries.dmi'
	icon_state = "fries"
	trash = /obj/item/trash/plate
	filling_color = "#EDDD00"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4)
	bitesize = 2
	tastes = list("fries" = 3, "salt" = 1)

/obj/item/reagent_containers/food/snacks/soydope
	name = "我是多普"
	desc = "豆制品里提取的毒品。"
	icon_state = "soydope"
	trash = /obj/item/trash/plate
	filling_color = "#C4BF76"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	bitesize = 2
	tastes = list("soy" = 1)

/obj/item/reagent_containers/food/snacks/cheesyfries
	name = "芝士薯条"
	desc = "薯条。上面浇了芝士。这还用说。"
	icon = 'icons/obj/items/food/cheeseandfries.dmi'
	icon_state = "cheesyfries"
	trash = /obj/item/trash/plate
	filling_color = "#EDDD00"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	bitesize = 2
	tastes = list("fries" = 3, "cheese" = 1)

/obj/item/reagent_containers/food/snacks/fortunecookie
	name = "幸运饼干"
	desc = "每块饼干里都藏着一个真正的预言！"
	icon = 'icons/obj/items/food/confectionary.dmi'
	icon_state = "fortune_cookie"
	filling_color = "#E8E79E"
	trash = /obj/item/trash/fortunecookie
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	bitesize = 2
	tastes = list("cookie" = 1)

/obj/item/reagent_containers/food/snacks/badrecipe
	name = "烧焦的残骸"
	desc = "应该有人因为这事被从厨师岗位上撤职。"
	icon_state = "badrecipe"
	filling_color = "#211F02"
	list_reagents = list(/datum/reagent/carbon = 1, /datum/reagent/carbon = 3)
	bitesize = 2

/obj/item/reagent_containers/food/snacks/meatsteak
	name = "肉排"
	desc = "一块热辣多汁的肉。"
	icon = 'icons/obj/items/food/meat.dmi'
	icon_state = "meatsteak"
	trash = /obj/item/trash/plate
	filling_color = "#7A3D11"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/sodiumchloride = 1, /datum/reagent/consumable/blackpepper = 1)
	bitesize = 3
	tastes = list("meat" = 1)

/obj/item/reagent_containers/food/snacks/monkeycube
	name = "猴子方块"
	desc = "加水即可！"
	icon = 'icons/obj/items/food/packaged.dmi'
	icon_state = "monkeycube"
	bitesize = 12
	filling_color = "#ADAC7F"
	var/monkey_type = /mob/living/carbon/human/species/monkey
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	tastes = list("the jungle" = 1, "bananas" = 1)

/obj/item/reagent_containers/food/snacks/monkeycube/examine(mob/user)
	. = ..()
	if(package)
		. += "It is wrapped in waterproof cellophane. Maybe using it in your hand would tear it off?"

/obj/item/reagent_containers/food/snacks/monkeycube/afterattack(obj/O, mob/user, proximity)
	if(!proximity)
		return
	if(istype(O,/obj/structure/sink) && !package)
		to_chat(user, "你将\the [name]放在水流下冲洗...")
		user.drop_held_item()
		return Expand()
	return ..()

/obj/item/reagent_containers/food/snacks/monkeycube/attack_self(mob/user)
	if(!package)
		return
	icon_state = "monkeycube"
	balloon_alert_to_viewers("拆开[src]的包装")
	package = FALSE

/obj/item/reagent_containers/food/snacks/monkeycube/On_Consume(mob/consumer)
	to_chat(consumer, span_warning("<span>你体内的某个东西突然膨胀了！</span>"))
	balloon_alert_to_viewers("吃掉[src]", ignored_mobs = consumer)
	consumer.dropItemToGround(src)
	if(!ishuman(consumer))
		return ..()
	//Do not try to understand.
	var/obj/item/surprise = new(consumer)
	var/mob/ook = monkey_type
	surprise.icon = initial(ook.icon)
	surprise.icon_state = initial(ook.icon_state)
	surprise.name = "malformed [initial(ook.name)]"
	surprise.desc = "Looks like \a very deformed [initial(ook.name)], a little small for its kind. It shows no signs of life."
	surprise.transform *= 0.6
	surprise.add_mob_blood(consumer)
	var/mob/living/carbon/human/H = consumer
	var/datum/limb/E = H.get_limb("chest")
	E.fracture()
	for (var/datum/internal_organ/I in E.internal_organs)
		I.take_damage(rand(I.min_bruised_damage, I.min_broken_damage+1))
	if(!E.hidden && prob(60)) //set it snuggly
		E.hidden = surprise
		E.cavity = 0
	else 		//someone is having a bad day
		E.createwound(CUT, 30)
		surprise.embed_into(consumer, E)
	qdel(src)

/obj/item/reagent_containers/food/snacks/monkeycube/proc/Expand()
	balloon_alert_to_viewers("扩张")
	var/turf/T = get_turf(src)
	if(T)
		new monkey_type(T)
	qdel(src)


/obj/item/reagent_containers/food/snacks/monkeycube/wrapped
	desc = "仍然包裹在纸里。"
	icon_state = "monkeycubewrap"
	package = TRUE


/obj/item/reagent_containers/food/snacks/monkeycube/farwacube
	name = "法瓦方块"
	monkey_type = /mob/living/carbon/human/species/monkey/farwa

/obj/item/reagent_containers/food/snacks/monkeycube/wrapped/farwacube
	name = "法瓦方块"
	monkey_type = /mob/living/carbon/human/species/monkey/farwa


/obj/item/reagent_containers/food/snacks/monkeycube/stokcube
	name = "斯托克方块"
	monkey_type = /mob/living/carbon/human/species/monkey/stok

/obj/item/reagent_containers/food/snacks/monkeycube/wrapped/stokcube
	name = "斯托克方块"
	monkey_type = /mob/living/carbon/human/species/monkey/stok


/obj/item/reagent_containers/food/snacks/monkeycube/neaeracube
	name = "异形方块"
	monkey_type = /mob/living/carbon/human/species/monkey/naera
/obj/item/reagent_containers/food/snacks/monkeycube/wrapped/neaeracube
	name = "异形方块"
	monkey_type = /mob/living/carbon/human/species/monkey/naera

/obj/item/reagent_containers/food/snacks/monkeysdelight
	name = "猴子的喜悦"
	desc = "咿咿咿！"
	icon_state = "monkeysdelight"
	trash = /obj/item/trash/tray
	filling_color = "#5C3C11"
	list_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/banana = 5, /datum/reagent/consumable/blackpepper = 1, /datum/reagent/consumable/sodiumchloride = 1)
	bitesize = 6
	tastes = list("the jungle" = 1, "banana" = 1)

/obj/item/reagent_containers/food/snacks/baguette
	name = "法棍"
	desc = "祝您好胃口！"
	icon = 'icons/obj/items/food/bread.dmi'
	icon_state = "baguette"
	filling_color = "#E3D796"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/blackpepper = 1, /datum/reagent/consumable/sodiumchloride = 1)
	bitesize = 3
	tastes = list("bread" = 1)

/obj/item/reagent_containers/food/snacks/fishandchips
	name = "炸鱼薯条"
	desc = "在下也这么认为，老兄。"
	icon = 'icons/obj/items/food/cheeseandfries.dmi'
	icon_state = "fishandchips"
	filling_color = "#E3D796"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/toxin/carpotoxin = 3)
	bitesize = 3
	tastes = list("fish" = 1, "chips" = 1)

/obj/item/reagent_containers/food/snacks/rofflewaffles
	name = "罗夫尔华夫饼"
	desc = "罗夫尔公司的华夫饼。"
	icon_state = "rofflewaffles"
	trash = /obj/item/trash/waffles
	filling_color = "#FF00F7"
	list_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/psilocybin = 8)
	bitesize = 4
	tastes = list("waffle" = 1, "mushrooms" = 1)

/obj/item/reagent_containers/food/snacks/stewedsoymeat
	name = "炖煮素肉"
	desc = "连非素食主义者都会爱上它！"
	icon_state = "stewedsoymeat"
	trash = /obj/item/trash/plate
	list_reagents = list(/datum/reagent/consumable/nutriment = 8)
	tastes = list("soy" = 1, "vegetables" = 1)

/obj/item/reagent_containers/food/snacks/pizzapasta/boiledspaghetti
	name = "煮熟的意大利面"
	desc = "一碗普通的面条，真没劲。"
	icon_state = "spagettiboiled"
	trash = /obj/item/trash/plate
	filling_color = "#FCEE81"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	bitesize = 2
	tastes = list("pasta" = 1)

/obj/item/reagent_containers/food/snacks/spesslaw
	name = "太空法"
	desc = "律师的最爱"
	icon_state = "spesslaw"
	filling_color = "#DE4545"
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	bitesize = 3
	tastes = list("pasta" = 1, "tomato" = 1, "meat" = 1)

/obj/item/reagent_containers/food/snacks/poppypretzel
	name = "罂粟椒盐卷饼"
	desc = "一个充满气泡的大型软椒盐卷饼！"
	icon = 'icons/obj/items/food/confectionary.dmi'
	icon_state = "poppypretzel"
	filling_color = "#AB7D2E"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	bitesize = 2
	tastes = list("pretzel" = 1)

/obj/item/reagent_containers/food/snacks/carrotfries
	name = "胡萝卜薯条"
	desc = "新鲜胡萝卜制成的美味薯条。"
	icon = 'icons/obj/items/food/cheeseandfries.dmi'
	icon_state = "carrotfries"
	trash = /obj/item/trash/plate
	filling_color = "#FAA005"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/carrotjuice = 3)
	bitesize = 2
	tastes = list("carrots" = 3, "salt" = 1)

/obj/item/reagent_containers/food/snacks/candiedapple
	name = "糖霜苹果"
	desc = "裹着糖衣的苹果。"
	icon = 'icons/obj/items/food/candy.dmi'
	icon_state = "candiedapple"
	filling_color = "#F21873"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/sugar = 2)
	bitesize = 3
	tastes = list("carrots" = 3, "salt" = 1)

/obj/item/reagent_containers/food/snacks/twobreadold
	name = "两个面包"
	desc = "它尝起来非常苦涩，带有酒味。"
	icon = 'icons/obj/items/food/bread.dmi'
	icon_state = "twobread"
	filling_color = "#DBCC9A"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	bitesize = 3
	tastes = list("bread" = 2)

/obj/item/reagent_containers/food/snacks/mint
	name = "薄荷"
	desc = "它只有威化饼那么薄。"
	icon = 'icons/obj/items/food/food.dmi'
	icon_state = "mint"
	filling_color = "#F2F2F2"
	list_reagents = list(/datum/reagent/toxin/minttoxin = 1)

/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit
	name = "胖头盔饼干"
	desc = "这是一块精心制作的肥菇饼干。配料包括精细切碎的肥菇，以及研磨细致的矮人小麦粉。"
	icon_state = "phelmbiscuit"
	filling_color = "#CFB4C4"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	bitesize = 2
	tastes = list("mushroom" = 1, "biscuit" = 1)

/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit/Initialize(mapload)
	if(prob(10))
		name = "极品肥美头盔饼干"
		desc = "微波炉被一股奇异的情绪笼罩！它烤出了一块非凡的肥美蘑菇饼干！"
		list_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/medicine/tricordrazine = 5)
	return ..()

/obj/item/reagent_containers/food/snacks/chawanmushi
	name = "茶碗蒸"
	desc = "一份传奇的蛋奶冻，能让敌人变成朋友。可能对猫来说太辣了。"
	icon_state = "chawanmushi"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#F0F2E4"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	tastes = list("custard" = 1)

/obj/item/reagent_containers/food/snacks/tossedsalad
	name = "沙拉"
	desc = "一份像样的沙拉，简单基础，夹杂着小块的胡萝卜、番茄和苹果。纯素！"
	icon = 'icons/obj/items/food/soupsalad.dmi'
	icon_state = "herbsalad"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#76B87F"
	list_reagents = list(/datum/reagent/consumable/nutriment = 8)
	bitesize = 3
	tastes = list("leaves" = 1, "vegetables" = 1, "apple" = 1)

/obj/item/reagent_containers/food/snacks/validsalad
	name = "有效沙拉"
	desc = "这只是一份可疑'香草'配上肉丸和炸土豆片的沙拉。没什么可疑的。"
	icon = 'icons/obj/items/food/soupsalad.dmi'
	icon_state = "validsalad"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#76B87F"
	list_reagents = list(/datum/reagent/consumable/nutriment = 8)
	bitesize = 3
	tastes = list("leaves" = 1, "nutriment" = 1, "meat" = 1, "valids" = 1)

/////////////////////////////////////////////////Sliceable////////////////////////////////////////
// All the food items that can be sliced into smaller bits like Meatbread and Cheesewheels

// sliceable is just an organization type path, it doesn't have any additional code or variables tied to it.
/obj/item/reagent_containers/food/snacks/sliceable
	name = "可切片食物"
	bitesize = 1
	slices_num = 5
	var/max_items = 4

/obj/item/reagent_containers/food/snacks/sliceable/cheesewheel
	name = "奶酪轮"
	desc = "一大轮美味的切达奶酪。"
	icon = 'icons/obj/items/food/cheeseandfries.dmi'
	icon_state = "cheesewheel"
	slice_path = /obj/item/reagent_containers/food/snacks/cheesewedge
	list_reagents = list(/datum/reagent/consumable/nutriment = 20)
	filling_color = "#FFF700"
	tastes = list("cheese" = 1)

/obj/item/reagent_containers/food/snacks/cheesewedge
	name = "奶酪楔"
	desc = "一块美味的切达干酪楔形块。切下它的奶酪轮应该就在不远处。"
	icon = 'icons/obj/items/food/cheeseandfries.dmi'
	icon_state = "cheesewedge"
	filling_color = "#FFF700"
	bitesize = 2
	tastes = list("cheese" = 1)

/obj/item/reagent_containers/food/snacks/baked_cheese
	name = "烤奶酪轮"
	desc = "一个烤奶酪轮，融化而美味。"
	icon = 'icons/obj/items/food/cheeseandfries.dmi'
	icon_state = "baked_cheese"
	list_reagents = list(/datum/reagent/consumable/nutriment/protein = 10, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/consumable/nutriment = 5)
	tastes = list("cheese" = 1)
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/baked_cheese_platter
	name = "芝士拼盘"
	desc = "烤奶酪轮：分享佳品。通常搭配酥脆的面包片蘸食，因为比美味奶酪更棒的，只有抹在面包上的美味奶酪。"
	icon = 'icons/obj/items/food/cheeseandfries.dmi'
	icon_state = "baked_cheese_platter"
	list_reagents = list(/datum/reagent/consumable/nutriment/protein = 12, /datum/reagent/consumable/nutriment/vitamin = 6, /datum/reagent/consumable/nutriment = 8)
	tastes = list("cheese" = 1, "bread" = 1)
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/watermelonslice
	name = "西瓜切片"
	desc = "一片水润的美味。"
	icon_state = "watermelonslice"
	filling_color = "#FF3867"
	bitesize = 2
	tastes = list("watermelon" = 1)

/obj/item/reagent_containers/food/snacks/cracker
	name = "饼干"
	desc = "这是一块咸味饼干。"
	icon_state = "cracker"
	icon = 'icons/obj/items/food/mre.dmi'
	filling_color = "#F5DEB8"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	tastes = list("cracker" = 1)

// Flour + egg = dough
/obj/item/reagent_containers/food/snacks/flour/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/reagent_containers/food/snacks/egg))
		new /obj/item/reagent_containers/food/snacks/dough(src)
		balloon_alert(user, "制作面团")
		qdel(I)
		qdel(src)

// Egg + flour = dough
/obj/item/reagent_containers/food/snacks/egg/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/reagent_containers/food/snacks/flour))
		new /obj/item/reagent_containers/food/snacks/dough(src)
		balloon_alert(user, "制作面团")
		qdel(I)
		qdel(src)

	else if(istype(I, /obj/item/toy/crayon))
		var/obj/item/toy/crayon/C = I
		var/clr = C.colourName

		if(!(clr in list("blue", "green", "mime", "orange", "purple", "rainbow", "red", "yellow")))
			to_chat(user, span_notice("这颗卵拒绝接受这种颜色！"))
			return

		to_chat(user, span_notice("你将 \the [src] 染成[clr]色"))
		icon_state = "egg-[clr]"
		egg_color = clr

/obj/item/reagent_containers/food/snacks/dough
	name = "面团"
	desc = "一块面团。"
	icon = 'icons/obj/items/food/food_ingredients.dmi'
	icon_state = "dough"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	bitesize = 2
	tastes = list("dough" = 1)

// Dough + rolling pin = flat dough
/obj/item/reagent_containers/food/snacks/dough/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/tool/kitchen/rollingpin))
		new /obj/item/reagent_containers/food/snacks/sliceable/flatdough(src)
		balloon_alert(user, "压平面团")
		qdel(src)

// slicable into 3xdoughslices
/obj/item/reagent_containers/food/snacks/sliceable/flatdough
	name = "扁平面团"
	desc = "压扁的面团。"
	icon = 'icons/obj/items/food/food_ingredients.dmi'
	icon_state = "flat dough"
	slice_path = /obj/item/reagent_containers/food/snacks/doughslice
	slices_num = 3
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	tastes = list("dough" = 1)

/obj/item/reagent_containers/food/snacks/doughslice
	name = "面团切片"
	desc = "一道佳肴的基石。"
	icon = 'icons/obj/items/food/food_ingredients.dmi'
	icon_state = "doughslice"
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	tastes = list("dough" = 1)

/obj/item/reagent_containers/food/snacks/meat
	name = "肉"
	desc = "一块肉"
	icon_state = "meat"
	icon = 'icons/obj/items/food/meat.dmi'
	max_integrity = 180
	filling_color = "#FF1C1C"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/tool/kitchen/knife))
		new /obj/item/reagent_containers/food/snacks/rawcutlet(src)
		new /obj/item/reagent_containers/food/snacks/rawcutlet(src)
		new /obj/item/reagent_containers/food/snacks/rawcutlet(src)
		balloon_alert(user, "将肉切成条")
		qdel(src)

/obj/item/reagent_containers/food/snacks/meat/syntiflesh
	name = "合成人肉"
	desc = "一块合成人肉块。"

/obj/item/reagent_containers/food/snacks/meat/human
	desc = "一块肉排。看起来有点像猪肉……"

/obj/item/reagent_containers/food/snacks/meat/xeno
	icon_state = "xenomeat"
	filling_color = "#43DE18"
	tastes = list("meat" = 1, "acid" = 1)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/meat/monkey
	//same as plain meat

/obj/item/reagent_containers/food/snacks/meat/corgi
	name = "柯基肉"
	desc = "尝起来...嗯，你知道的..."

/obj/item/reagent_containers/food/snacks/rawcutlet
	name = "生肉排"
	desc = "一小块生肉。"
	icon = 'icons/obj/items/food/food_ingredients.dmi'
	icon_state = "rawcutlet"
	bitesize = 1
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	tastes = list("meat" = 1)

/obj/item/reagent_containers/food/snacks/rawcutlet/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/tool/kitchen/knife))
		new /obj/item/reagent_containers/food/snacks/rawmeatball(src)
		new /obj/item/reagent_containers/food/snacks/rawmeatball(src)
		new /obj/item/reagent_containers/food/snacks/rawmeatball(src)
		balloon_alert(user, "切割并卷成球状")
		qdel(src)


/obj/item/reagent_containers/food/snacks/cutlet
	name = "肉排"
	desc = "一片美味的肉片。"
	icon = 'icons/obj/items/food/food_ingredients.dmi'
	icon_state = "cutlet"
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("meat" = 1)


/obj/item/reagent_containers/food/snacks/rawmeatball
	name = "生肉丸"
	desc = "一个生肉丸。"
	icon = 'icons/obj/items/food/meat.dmi'
	icon_state = "raw_meatball"
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)

/obj/item/reagent_containers/food/snacks/rawmeatball/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/grillable, /obj/item/reagent_containers/food/snacks/meatball, rand(40 SECONDS, 50 SECONDS), TRUE, TRUE)

/obj/item/reagent_containers/food/snacks/hotdog
	name = "热狗"
	desc = "与狗无关，也许。"
	icon = 'icons/obj/items/food/food.dmi'
	icon_state = "hotdog"
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	tastes = list("bun" = 3, "meat" = 2)

/obj/item/reagent_containers/food/snacks/flatbread
	name = "扁面包"
	desc = "平淡但管饱。"
	icon = 'icons/obj/items/food/food_ingredients.dmi'
	icon_state = "flatbread"
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)


/obj/item/reagent_containers/food/snacks/rawsticks
	name = "生土豆条"
	desc = "生薯条，不太好吃。"
	icon = 'icons/obj/items/food/food_ingredients.dmi'
	icon_state = "rawsticks"
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	tastes = list("potatoes" = 3, "salt" = 1)

/obj/item/reagent_containers/food/snacks/packaged_burrito
	name = "包装墨西哥卷饼"
	desc = "一份硬邦邦的微波炉玉米煎饼。包装上没有标明加热时间。由纳米传讯公司包装。"
	icon = 'icons/obj/items/food/mre.dmi'
	icon_state = "burrito"
	bitesize = 2
	package = TRUE
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	tastes = list("tortilla" = 2, "beans" = 2)

/obj/item/reagent_containers/food/snacks/packaged_burrito/attack_self(mob/user as mob)
	if(package)
		playsound(src.loc,'sound/effects/pageturn2.ogg', 15, 1)
		balloon_alert(user, "解开卷饼包装")
		package = FALSE
		icon = 'icons/obj/items/food/mexican.dmi'
		icon_state = "openburrito"

/obj/item/reagent_containers/food/snacks/packaged_hdogs
	name = "包装热狗"
	desc = "一根软趴趴、室温状态的热狗。包装上没有标明烹饪时间，所以你估计它大概可以直接吃。由纳米传讯公司包装。"
	icon = 'icons/obj/items/food/mre.dmi'
	icon_state = "hot_dogs"
	bitesize = 2
	package = TRUE
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sodiumchloride = 2)
	tastes = list("dough" = 1, "chicken" = 1)

/obj/item/reagent_containers/food/snacks/packaged_hdogs/attack_self(mob/user as mob)
	if(package)
		playsound(src.loc,'sound/effects/pageturn2.ogg', 15, 1)
		balloon_alert(user, "拆开热狗包装")
		package = FALSE
		icon = 'icons/obj/items/food/food.dmi'
		icon_state = "hotdog"

/obj/item/reagent_containers/food/snacks/upp
	name = "\improper 联合太空鳞翅目口粮"
	desc = "一个密封、冻干、压缩的包装，内含单份食物。在联合太空鳞翅目海盗团伙乃至火星居民中都很常见，尤其是驻扎在偏远殖民地的人员。这份包装于2415年。"
	icon = 'icons/obj/items/food/mre.dmi'
	icon_state = "upp_ration"
	bitesize = 2
	package = TRUE
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/sodiumchloride = 0.5)
	var/variation = null


/obj/item/reagent_containers/food/snacks/upp/Initialize(mapload)
	if(!variation)
		variation = pick("fish","rice")

	switch(variation)
		if("fish")
			tastes = list("dried [pick("carp", "shark", "tuna", "fish")]" = 1, "[pick("potatoes", "borsch", "borshch", "bortsch", "hardtack")]" = 1)
		if("rice")
			tastes = list("[pick("rice", "rye", "starch")]" = 1, "[pick("sawdust", "beans", "chicken")]" = 1)

	return ..()

/obj/item/reagent_containers/food/snacks/upp/attack_self(mob/user as mob)
	if(package)
		playsound(src.loc,'sound/effects/pageturn2.ogg', 15, 1)
		balloon_alert(user, "撕开包装密封条")
		package = FALSE
		desc = "一份极度干燥的食品，几乎没什么调味或色泽。看起来是为长期储存准备的，但离开包装就会变质。最好现在就吃掉以免浪费。至少现在情况还算公平。"
		switch(variation)
			if("fish")
				name = "配给鱼"
				icon_state = "upp_1"
			if("rice")
				name = "配给大米"
				icon_state = "upp_2"

/obj/item/reagent_containers/food/snacks/upp/fish
	name = "\improper 人民联盟配给口粮（鱼肉）"
	variation = "fish"

/obj/item/reagent_containers/food/snacks/upp/rice
	name = "\improper 人民联盟配给（谷物）"
	variation = "rice"

/obj/item/reagent_containers/food/snacks/enrg_bar
	name = "能量棒"
	desc = "一种高热量能量棒，采用成分名称难以发音的原料制成。不知为何，连包装都是可食用的。"
	icon = 'icons/obj/items/food/packaged.dmi'
	icon_state = "energybar"
	bitesize = 2
	w_class = WEIGHT_CLASS_TINY
	trash = /obj/item/trash/eat
	//no taste, default to "something indescribable"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)


/obj/item/reagent_containers/food/snacks/kepler_crisps
	name = "开普勒薯片"
	desc = "'它们好得令人不安！' 现在含0%反式脂肪。"
	icon_state = "kepler"
	bitesize = 2
	trash = /obj/item/trash/kepler
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sodiumchloride = 1)
	tastes = list("chips" = 2)

//Wrapped candy bars

/obj/item/reagent_containers/food/snacks/wrapped
	package = TRUE
	bitesize = 3
	icon = 'icons/obj/items/food/packaged.dmi'
	var/obj/item/trash/wrapper = null //Why this and not trash? Because it pulls the wrapper off when you unwrap it as a trash item.

/obj/item/reagent_containers/food/snacks/wrapped/attack_self(mob/user as mob)
	if(package)
		balloon_alert(user, "打开包裹")
		playsound(loc,'sound/effects/pageturn2.ogg', 15, 1)

		new wrapper (user.loc)
		icon_state = "[initial(icon_state)]-o"
		package = FALSE


/obj/item/reagent_containers/food/snacks/wrapped/booniebars
	name = "奔尼帽护目镜"
	desc = "两块美味的薄荷巧克力。<i>'有时候，东西就是……够不着。'</i>"
	icon_state = "boonie"
	bitesize = 2 //Two bars
	wrapper = /obj/item/trash/boonie
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/coco = 4)
	tastes = list("peppermint" = 3, "falling into the sun" = 1)

/obj/item/reagent_containers/food/snacks/wrapped/chunk
	name = "CHUNK 板条箱"
	desc = "一块'<b>大块头</b>'牌巧克力。<i>'根据联邦法律允许存在的最致密巧克力。我们依法要求您不要将此钝器用于营养摄取以外的任何用途。'</i>"
	icon_state = "chunk"
	force = 35 //LEGAL LIMIT OF CHOCOLATE
	bitesize = 3
	wrapper = /obj/item/trash/chunk
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/coco = 10)
	tastes = list("compressed matter" = 1)

/obj/item/reagent_containers/food/snacks/wrapped/barcaridine
	name = "巴卡拉丁酒吧"
	desc = "一块巧克力，闻起来像医疗舱的味道。<i>'巧克力总能帮助缓解疼痛。'</i>"
	icon_state = "barcardine"
	wrapper = /obj/item/trash/barcaridine
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/coco = 2, /datum/reagent/medicine/tramadol = 2)
	tastes = list ("cough syrup" = 1)

/obj/item/reagent_containers/food/snacks/wrapped/berrybar
	name = "浆果能量棒"
	desc = "浆果美味棒！这是世界卫生协会为外环殖民地研发的新产品。<i>'来点浆果，远离饥饿！'</i>"
	icon_state = "berrybar"
	wrapper = /obj/item/trash/berrybar
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/berryjuice = 1,
		/datum/reagent/medicine/tramadol = 10,
		/datum/reagent/medicine/bicaridine = 10,
		/datum/reagent/medicine/kelotane = 10,
		/datum/reagent/medicine/tricordrazine = 10,
	)
	tastes = list("delicious processed berries" = 1)
	bitesize = 9

/obj/item/reagent_containers/food/snacks/wrapped/proteinbar
	name = "蛋白棒"
	desc = "巧克力蛋白棒，由其他食谱中无处安放的致密未使用食材制成。"
	icon_state = "proteinbar"
	force = 10 //dense enough to hurt but less than chunk
	wrapper = /obj/item/trash/candy
	list_reagents = list(/datum/reagent/consumable/nutriment/protein = 8, /datum/reagent/consumable/coco = 2)
	tastes = list("compressed matter" = 3, "discarded rubber" = 1)

//MREs

/obj/item/reagent_containers/food/snacks/packaged_meal
	name = "\improper 单兵口粮组件"
	package = TRUE
	bitesize = 4
	icon_state = "entree"
	icon = 'icons/obj/items/food/mre.dmi'
	var/flavor = "boneless pork ribs"//default value


/obj/item/reagent_containers/food/snacks/packaged_meal/Initialize(mapload, newflavor)
	tastes = list("[pick(SSstrings.get_list_from_file("names/food_adjectives"))]" = 1) //idea, list, gimmick
	determinetype(newflavor)
	desc = "A packaged [icon_state] from a Meal Ready-to-Eat, there is a lengthy list of [pick("obscure", "arcane", "unintelligible", "revolutionary", "sophisticated", "unspellable")] ingredients and addictives printed on the back.</i>"
	return ..()

/obj/item/reagent_containers/food/snacks/packaged_meal/attack_self(mob/user as mob)
	if(package)
		balloon_alert(user, "打开包裹")
		playsound(loc,'sound/effects/pageturn2.ogg', 15, 1)
		name = "\improper" + flavor
		desc = "一份标准军用即食口粮的内容物。这份是" + flavor + "."
		icon_state = flavor
		package = FALSE

/obj/item/reagent_containers/food/snacks/packaged_meal/proc/determinetype(newflavor)
	name = "\improper 单兵口粮组件" + " (" + newflavor + ")"
	flavor = newflavor

	switch(newflavor)
		if("boneless pork ribs", "grilled chicken", "pizza square", "spaghetti", "chicken tenders")
			icon_state = "entree"
			list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/sodiumchloride = 1)
		if("meatballs", "cheese spread", "beef turnover", "mashed potatoes")
			icon_state = "side"
			list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/sodiumchloride = 1)
		if("biscuit", "pretzels", "peanuts", "cracker")
			icon_state = "snack"
			list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/sodiumchloride = 1)
		if("spiced apples", "chocolate brownie", "sugar cookie", "choco bar", "crayon")
			icon_state = "dessert"
			list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/sugar = 1)


/obj/item/reagent_containers/food/snacks/lollipop
	name = "棒棒糖"
	desc = "一根美味的棒棒糖。"
	icon = 'icons/obj/items/lollipop.dmi'
	icon_state = "lollipop_stick"
	worn_icon_state = "lollipop_stick"
	equip_slot_flags = ITEM_SLOT_MASK
	w_class = WEIGHT_CLASS_TINY
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 4)
	tastes = list("candy" = 1)
	var/mutable_appearance/head
	var/headcolor = rgb(0, 0, 0)
	var/succ_int = 100
	var/next_succ = 0
	var/mob/living/carbon/owner

/obj/item/reagent_containers/food/snacks/lollipop/Initialize(mapload)
	. = ..()
	head = mutable_appearance('icons/obj/items/lollipop.dmi', "lollipop_head")
	change_head_color(rgb(rand(0, 255), rand(0, 255), rand(0, 255)))

//makes lollipops actually wearable as masks and still edible the old fashioned way.
/obj/item/reagent_containers/food/snacks/lollipop/proc/handle_reagents()
	var/fraction = min(FOOD_METABOLISM/reagents.total_volume, 1)
	reagents.reaction(owner, INGEST, fraction)
	if(!reagents.trans_to(owner, FOOD_METABOLISM))
		reagents.remove_any(FOOD_METABOLISM)

/obj/item/reagent_containers/food/snacks/lollipop/process()
	if(!owner)
		stack_trace("lollipop processing without an owner")
		return PROCESS_KILL
	if(!reagents)
		stack_trace("lollipop processing without a reagents datum")
		return PROCESS_KILL
	if(owner.stat == DEAD)
		return PROCESS_KILL
	if(!reagents.total_volume)
		qdel(src)
		return
	if(next_succ <= world.time)
		handle_reagents()
		next_succ = world.time + succ_int

/obj/item/reagent_containers/food/snacks/lollipop/equipped(mob/user, slot)
	. = ..()
	if(!iscarbon(user))
		return
	if(slot != SLOT_WEAR_MASK)
		owner = null
		STOP_PROCESSING(SSobj, src) //equipped is triggered when moving from hands to mouth and vice versa
		return
	owner = user
	START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/food/snacks/lollipop/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/reagent_containers/food/snacks/lollipop/proc/change_head_color(C)
	headcolor = C
	cut_overlay(head)
	head.color = C
	add_overlay(head)

//med pop
/obj/item/reagent_containers/food/snacks/lollipop/tramadol
	name = "电车弹射"
	desc = "你在医疗舱表现良好的奖励。可以食用或放入面罩槽。"
	list_reagents = list(/datum/reagent/consumable/sugar = 1, /datum/reagent/medicine/tramadol = 4)
	tastes = list("cough syrup" = 1, "artificial sweetness" = 1)

/obj/item/reagent_containers/food/snacks/lollipop/tramadol/combat
	desc = "一种在意识到大量陆战队员最终染上严重阿片类药物成瘾后设计的棒棒糖，旨在对抗这种成瘾。它是否有效真的取决于你。可以食用或放入面罩槽位。"
	list_reagents = list(/datum/reagent/consumable/sugar = 1, /datum/reagent/medicine/tramadol = 10)
	tastes = list("cough syrup" = 1, "artificial sweetness" = 1)

/obj/item/reagent_containers/food/snacks/lollipop/combat
	name = "通讯频道弹出"
	desc = "一种通过将糖与比卡酮和凯洛坦混合制成的棒棒糖，能够缓慢消耗试剂来随时间治愈伤口。可以食用或放入面罩槽位。"
	list_reagents = list(/datum/reagent/consumable/sugar = 1, /datum/reagent/medicine/bicaridine = 5, /datum/reagent/medicine/kelotane = 5)

/obj/item/reagent_containers/food/snacks/lollipop/tricord
	name = "三效合剂"
	desc = "一根掺有三氯喹啉的棒棒糖，这是一种缓慢生效的治疗剂。可以食用或放入面罩槽位。"
	list_reagents = list(/datum/reagent/consumable/sugar = 1, /datum/reagent/medicine/tricordrazine = 10)
	tastes = list("cough syrup" = 1, "artificial sweetness" = 1)

////////////////////////////////////////////DONK POCKETS////////////////////////////////////////////

/obj/item/reagent_containers/food/snacks/donkpocket
	name = "\improper 唐克口袋"
	desc = "资深叛徒的首选食品。"
	icon_state = "donkpocket"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("meat" = 2, "dough" = 2, "laziness" = 1)
	w_class = WEIGHT_CLASS_SMALL
/obj/item/reagent_containers/food/snacks/donkpocket/warm
	name = "温热的唐克口袋"
	desc = "资深叛徒的首选热食。"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/medicine/tricordrazine = 6)
	tastes = list("meat" = 2, "dough" = 2, "laziness" = 1)

//donkpockets

/obj/item/reagent_containers/food/snacks/donkpocket/dankpocket
	name = "\improper 暗袋"
	desc = "经验丰富的植物学家首选食物。"
	icon_state = "dankpocket"
	list_reagents = list(/datum/reagent/space_drugs = 3, /datum/reagent/consumable/nutriment = 4)
	tastes = list("meat" = 2, "dough" = 2)

/obj/item/reagent_containers/food/snacks/donkpocket/spicy
	name = "\improper 辣味口袋"
	desc = "经典零食，现已加入热激活辣味风味。"
	icon_state = "donkpocketspicy"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/capsaicin = 2)
	tastes = list("meat" = 2, "dough" = 2, "spice" = 1)

/obj/item/reagent_containers/food/snacks/donkpocket/warm/spicy
	name = "热辣口袋"
	desc = "经典零食，现在可能有点太辣了。"
	icon_state = "donkpocketspicy"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/medicine/tricordrazine = 2, /datum/reagent/consumable/capsaicin = 5)
	tastes = list("meat" = 2, "dough" = 2, "weird spices" = 2)

/obj/item/reagent_containers/food/snacks/donkpocket/teriyaki
	name = "\improper 照烧口袋"
	desc = "经典空间站小吃的东亚风味版本。"
	icon_state = "donkpocketteriyaki"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/soysauce = 2)
	tastes = list("meat" = 2, "dough" = 2, "soy sauce" = 2)

/obj/item/reagent_containers/food/snacks/donkpocket/warm/teriyaki
	name = "温热的照烧口袋"
	desc = "经典太空站小吃的东亚风味演绎，如今热气腾腾、温暖可口。"
	icon_state = "donkpocketteriyaki"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 3, /datum/reagent/medicine/tricordrazine = 2, /datum/reagent/consumable/soysauce = 2)
	tastes = list("meat" = 2, "dough" = 2, "soy sauce" = 2)

/obj/item/reagent_containers/food/snacks/donkpocket/pizza
	name = "\improper 披萨口袋"
	desc = "美味、多汁且出奇地管饱。"
	icon_state = "donkpocketpizza"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/tomatojuice = 2)
	tastes = list("meat" = 2, "dough" = 2, "cheese"= 2)

/obj/item/reagent_containers/food/snacks/donkpocket/warm/pizza
	name = "温热的披萨口袋"
	desc = "美味、多汁，趁热享用更佳。"
	icon_state = "donkpocketpizza"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/medicine/tricordrazine = 2, /datum/reagent/consumable/tomatojuice = 2)
	tastes = list("meat" = 2, "dough" = 2, "melty cheese"= 2)

/obj/item/reagent_containers/food/snacks/donkpocket/honk
	name = "\improper 鸣叫口袋"
	desc = "这款获奖的唐克口袋赢得了小丑和人类的一致喜爱。"
	icon_state = "donkpocketbanana"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/banana = 4)
	tastes = list("banana" = 2, "dough" = 2, "children's antibiotics" = 1)

/obj/item/reagent_containers/food/snacks/donkpocket/warm/honk
	name = "温热的鸣叫包"
	desc = "获奖的顿克口袋，现在热腾腾的。"
	icon_state = "donkpocketbanana"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/medicine/tricordrazine = 2, /datum/reagent/consumable/banana = 4, /datum/reagent/consumable/laughter = 6)
	tastes = list("dough" = 2, "children's antibiotics" = 1)

/obj/item/reagent_containers/food/snacks/donkpocket/berry
	name = "\improper 浆果口袋"
	desc = "一种极其甜腻的甜甜圈口袋，最初为'甜点风暴'行动而创制。"
	icon_state = "donkpocketberry"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/berryjuice = 3)
	tastes = list("dough" = 2, "jam" = 2)

/obj/item/reagent_containers/food/snacks/donkpocket/warm/berry
	name = "温暖的浆果口袋"
	desc = "一个无比美味的甜甜圈口袋，现在温热可口。"
	icon_state = "donkpocketberry"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/medicine/tricordrazine = 2, /datum/reagent/consumable/berryjuice = 3)
	tastes = list("dough" = 2, "warm jam" = 2)

/obj/item/reagent_containers/food/snacks/donkpocket/gondola
	name = "\improper 冈多拉口袋"
	desc = "在食谱中使用真正的贡多拉肉，至少可以说，是个颇具争议的选择。" //Only a monster would craft this.
	icon_state = "donkpocketgondola"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("meat" = 2, "dough" = 2, "inner peace" = 1)

/obj/item/reagent_containers/food/snacks/donkpocket/warm/gondola
	name = "温暖的冈多拉口袋"
	desc = "在食谱中使用真正的贡多拉肉，至少可以说，是个颇具争议的选择。"
	icon_state = "donkpocketgondola"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/medicine/tricordrazine = 2)
	tastes = list("meat" = 2, "dough" = 2, "inner peace" = 1)
