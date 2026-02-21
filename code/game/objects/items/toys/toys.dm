/* Toys!
* Contains:
*		Balloons
*		Fake telebeacon
*		Fake singularity
*      Toy mechs
*		Crayons
*		Snap pops
*		Water flower
*      Dolls
*      Inflatable duck
*		Other things
*/


//recreational items

/obj/item/toy
	icon = 'icons/obj/items/toy.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/items/toys_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/toys_right.dmi',
	)
	throw_speed = 4
	throw_range = 20
	force = 0

/obj/item/toy/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(!CONFIG_GET(flag/fun_allowed))
		return FALSE
	attack_hand(xeno_attacker)


/*
* Balloons
*/
/obj/item/toy/balloon
	name = "水球"
	desc = "一个透明的气球。里面什么都没有。"
	icon_state = "waterballoon-e"
	worn_icon_state = "balloon-empty"

/obj/item/toy/balloon/Initialize(mapload)
	. = ..()
	var/datum/reagents/R = new/datum/reagents(10)
	reagents = R
	R.my_atom = WEAKREF(src)

/obj/item/toy/balloon/attack(mob/living/carbon/human/M as mob, mob/user as mob)
	return

/obj/item/toy/balloon/afterattack(atom/A as mob|obj, mob/user as mob, proximity)
	if(!proximity)
		return
	if (istype(A, /obj/structure/reagent_dispensers/watertank) && get_dist(src,A) <= 1)
		A.reagents.trans_to(src, 10)
		to_chat(user, span_notice("你将气球灌入了[A]的内容。"))
		desc = "一个半透明的气球，里面有某种液体在晃荡。"
		update_icon()


/obj/item/toy/balloon/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/reagent_containers/glass))
		if(!I.reagents)
			return

		if(I.reagents.total_volume < 1)
			to_chat(user, "[I]是空的。")
			return

		if(I.reagents.has_reagent(/datum/reagent/toxin/acid/polyacid, 1))
			to_chat(user, "酸液腐蚀了气球！")
			I.reagents.reaction(user, TOUCH)
			qdel(src)
			return

		desc = "一个半透明的气球，里面有某种液体在晃动。"
		to_chat(user, span_notice("你将气球灌满了[I]的内容物。"))
		I.reagents.trans_to(src, 10)

	update_icon()


/obj/item/toy/balloon/throw_impact(atom/hit_atom)
	. = ..()
	if(!.)
		return
	if(src.reagents.total_volume >= 1)
		src.visible_message(span_warning("[src] 爆裂了！"),"You hear a pop and a splash.")
		src.reagents.reaction(get_turf(hit_atom), TOUCH)
		for(var/atom/A in get_turf(hit_atom))
			src.reagents.reaction(A, TOUCH)
		src.icon_state = "burst"
		QDEL_IN(src, 5)

/obj/item/toy/balloon/update_icon_state()
	. = ..()
	if(reagents.total_volume)
		icon_state = "waterballoon"
		worn_icon_state = "balloon"
	else
		icon_state = "waterballoon-e"
		worn_icon_state = "balloon-empty"

/obj/item/toy/syndicateballoon
	name = "辛迪加气球"
	desc = "背面有个标签写着'FUK NT!11!'。"
	throw_speed = 4
	throw_range = 20
	force = 0
	icon = 'icons/obj/items/toy.dmi'
	icon_state = "syndballoon"
	worn_icon_state = "syndballoon"
	w_class = WEIGHT_CLASS_BULKY

/*
* Fake telebeacon
*/
/obj/item/toy/blink
	name = "电子眨眼玩具游戏"
	desc = "眨眼。眨眼。眨眼。适合8岁及以上。"
	icon = 'icons/obj/items/radio.dmi'
	icon_state = "beacon"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/tools_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/tools_right.dmi',
	)
	worn_icon_state = "signaler"

/*
* Fake singularity
*/
/obj/item/toy/spinningtoy
	name = "引力奇点"
	desc = "'辛格洛'牌旋转玩具。"
	icon = 'icons/obj/singularity.dmi'
	icon_state = "singularity_s1"



/*
* Crayons
*/

/obj/item/toy/crayon
	name = "蜡笔"
	desc = "一支彩色蜡笔。请勿食用或塞入鼻孔。"
	icon = 'icons/obj/items/crayons.dmi'
	icon_state = "crayonred"
	w_class = WEIGHT_CLASS_TINY
	attack_verb = list("attacks", "colours")
	var/colour = "#FF0000" //RGB
	var/shadeColour = "#220000" //RGB
	var/uses = 30 //0 for unlimited uses
	var/instant = 0
	var/colourName = "red" //for updateIcon purposes

/obj/item/toy/crayon/suicide_act(mob/user)
	user.visible_message(span_danger("[user]正把[name]塞进[user.p_their()]鼻孔，直插[user.p_their()]大脑。看起来[user.p_theyre()]试图自杀。"))
	return (BRUTELOSS|OXYLOSS)

/*
* Snap pops
*/
/obj/item/toy/snappop
	name = "啪嗒"
	desc = "哇！"
	icon_state = "snappop"
	w_class = WEIGHT_CLASS_TINY

/obj/item/toy/snappop/Initialize(mapload)
	. = ..()
	var/static/list/connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_cross),
	)
	AddElement(/datum/element/connect_loc, connections)

/obj/item/toy/snappop/throw_impact(atom/hit_atom)
	. = ..()
	if(!.)
		return
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	new /obj/effect/decal/cleanable/ash(src.loc)
	src.visible_message(span_warning("[src.name]爆炸了！"),span_warning("You hear a snap!"))
	playsound(src, 'sound/effects/snap.ogg', 25, 1)
	qdel(src)

/obj/item/toy/snappop/proc/on_cross(datum/source, atom/movable/H, oldloc, oldlocs)
	SIGNAL_HANDLER
	if(!ishuman(H)) //i guess carp and shit shouldn't set them off
		return
	var/mob/living/carbon/M = H
	if(M.m_intent != MOVE_INTENT_RUN)
		return
	to_chat(M, span_warning("你踩到了摔炮！"))

	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(2, 0, src)
	s.start()
	new /obj/effect/decal/cleanable/ash(src.loc)
	visible_message(span_warning("[src.name]爆炸了！"),span_warning("You hear a snap!"))
	playsound(src, 'sound/effects/snap.ogg', 25, 1)
	qdel(src)

/*
* Water flower
*/
/obj/item/toy/waterflower
	name = "水之花"
	desc = "一朵看似无辜的向日葵……暗藏玄机。"
	icon = 'icons/obj/items/harvest.dmi'
	icon_state = "sunflower"
	worn_icon_state = "sunflower"
	var/empty = 0
	flags

/obj/item/toy/waterflower/Initialize(mapload)
	. = ..()
	var/datum/reagents/R = new/datum/reagents(10)
	reagents = R
	R.my_atom = WEAKREF(src)
	R.add_reagent(/datum/reagent/water, 10)

/obj/item/toy/waterflower/attack(mob/living/carbon/human/M as mob, mob/user as mob)
	return

/obj/item/toy/waterflower/afterattack(atom/A as mob|obj, mob/user as mob)

	if (istype(A, /obj/item/storage/backpack ))
		return

	else if (locate (/obj/structure/table, src.loc))
		return

	else if (istype(A, /obj/structure/reagent_dispensers/watertank) && get_dist(src,A) <= 1)
		A.reagents.trans_to(src, 10)
		to_chat(user, span_notice("你重新装填了你的花！"))
		return

	else if (src.reagents.total_volume < 1)
		src.empty = 1
		to_chat(user, span_notice("你的花朵已经枯萎了！"))
		return

	else
		src.empty = 0


		var/obj/effect/decal/D = new/obj/effect/decal/(get_turf(src))
		D.name = "water"
		D.icon = 'icons/obj/items/chemistry.dmi'
		D.icon_state = "chempuff"
		D.create_reagents(5)
		src.reagents.trans_to(D, 1)
		playsound(src.loc, 'sound/effects/spray3.ogg', 15, 1, 3)

		spawn(0)
			for(var/i=0, i<1, i++)
				step_towards(D,A)
				D.reagents.reaction(get_turf(D))
				for(var/atom/T in get_turf(D))
					D.reagents.reaction(T)
					if(ismob(T) && T:client)
						to_chat(T:client, span_warning("[user] 用水喷了你！"))
				sleep(0.4 SECONDS)
			qdel(D)

		return

/obj/item/toy/waterflower/examine(mob/user)
	. = ..()
	. += "[reagents.total_volume] units of water left!"



/*
* Mech prizes
*/
/obj/item/toy/prize
	icon_state = "ripleytoy"
	var/cooldown = 0

//all credit to skasi for toy mech fun ideas
/obj/item/toy/prize/attack_self(mob/user as mob)
	if(cooldown < world.time - 8)
		to_chat(user, span_notice("你和[src]玩耍。"))
		playsound(user, 'sound/mecha/mechstep.ogg', 15, 1)
		cooldown = world.time

/obj/item/toy/prize/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(loc == user)
		if(cooldown < world.time - 8)
			to_chat(user, span_notice("你和[src]一起玩。"))
			playsound(user, 'sound/mecha/mechturn.ogg', 15, 1)
			cooldown = world.time
			return

/obj/item/toy/prize/ripley
	name = "玩具里普利"
	desc = "迷你机甲手办！集齐全套！1/11。"

/obj/item/toy/prize/fireripley
	name = "玩具消防里普利"
	desc = "迷你机甲手办！集齐全套！2/11。"
	icon_state = "fireripleytoy"

/obj/item/toy/prize/deathripley
	name = "玩具死亡小队里普利"
	desc = "迷你机甲手办！集齐全套！3/11。"
	icon_state = "deathripleytoy"

/obj/item/toy/prize/gygax
	name = "玩具盖格"
	desc = "迷你机甲手办！集齐全套！4/11。"
	icon_state = "gygaxtoy"


/obj/item/toy/prize/durand
	name = "玩具杜兰德"
	desc = "迷你机甲手办！集齐全套！5/11。"
	icon_state = "durandprize"

/obj/item/toy/prize/honk
	name = "玩具 H.O.N.K."
	desc = "迷你机甲手办！集齐全套！6/11。"
	icon_state = "honkprize"

/obj/item/toy/prize/marauder
	name = "玩具掠夺者"
	desc = "迷你机甲手办！集齐全套！7/11。"
	icon_state = "marauderprize"

/obj/item/toy/prize/seraph
	name = "玩具塞拉芬"
	desc = "迷你机甲手办！集齐全套！8/11。"
	icon_state = "seraphprize"

/obj/item/toy/prize/mauler
	name = "玩具碾压者"
	desc = "迷你机甲手办！集齐全套！9/11。"
	icon_state = "maulerprize"

/obj/item/toy/prize/odysseus
	name = "玩具奥德修斯"
	desc = "迷你机甲手办！集齐全套！10/11。"
	icon_state = "odysseusprize"

/obj/item/toy/prize/phazon
	name = "玩具相位枪"
	desc = "迷你机甲手办！集齐全套！11/11。"
	icon_state = "phazonprize"

/obj/item/toy/inflatable_duck
	name = "充气鸭子"
	desc = "既然能随波逐流，何必在意沉浮！"
	icon_state = "inflatable"
	worn_icon_state = "inflatable"
	icon = 'icons/obj/clothing/belts.dmi'
	equip_slot_flags = ITEM_SLOT_BELT


/obj/item/toy/beach_ball
	name = "沙滩球"
	icon_state = "beachball"
	worn_icon_state = "beachball"
	density = FALSE
	anchored = FALSE
	w_class = WEIGHT_CLASS_SMALL
	throw_speed = 1
	throw_range = 20

/obj/item/toy/beach_ball/afterattack(atom/target as mob|obj|turf|area, mob/user as mob)
	user.drop_held_item()
	throw_at(target, throw_range, throw_speed, user)


/obj/item/toy/dice
	name = "d6"
	desc = "一个六面骰子。"
	icon = 'icons/obj/items/dice.dmi'
	icon_state = "d66"
	w_class = WEIGHT_CLASS_TINY
	var/sides = 6
	attack_verb = list("dices")

/obj/item/toy/dice/Initialize(mapload)
	. = ..()
	icon_state = "[name][rand(sides)]"

/obj/item/toy/dice/d20
	name = "d20"
	desc = "一颗二十面的骰子。"
	icon_state = "d2020"
	sides = 20

/obj/item/toy/dice/attack_self(mob/user as mob)
	var/result = rand(1, sides)
	var/comment = ""
	if(sides == 20 && result == 20)
		comment = "Nat 20!"
	else if(sides == 20 && result == 1)
		comment = "Ouch, bad luck."
	icon_state = "[name][result]"
	user.visible_message(span_notice("[user] 投掷了 [src]。它落在了 [result] 上。[comment]"), \
						span_notice("You throw [src]. It lands on a [result]. [comment]"), \
						span_notice("You hear [src] landing on a [result]. [comment]"))



/obj/item/toy/bikehorn
	name = "自行车喇叭"
	desc = "自行车喇叭。"
	icon = 'icons/obj/items/items.dmi'
	icon_state = "bike_horn"
	worn_icon_state = "bike_horn"
	throwforce = 3
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 15
	attack_verb = list("HONKS")


/obj/item/toy/bikehorn/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/squeak, 'sound/items/bikehorn.ogg', 50)

/obj/item/toy/plush
	name = "通用玩偶"
	desc = "一个模样古怪的玩偶，标签上写着：'若拾获，请归还给程序员。'"
	w_class = WEIGHT_CLASS_TINY
	icon_state = "debug"
	attack_verb = list("thumps", "whomps", "bumps")
	var/last_hug_time

/obj/item/toy/plush/attack_self(mob/user)
	if(world.time > last_hug_time)
		user.visible_message(span_notice("[user] 拥抱了 [src]！真可爱！"), \
							span_notice("You hug [src]. Dawwww... "))
		last_hug_time = world.time + 50 //5 second cooldown

/obj/item/toy/plush/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/squeak, 'sound/items/dollsqueak.ogg', 50)

/obj/item/toy/plush/farwa
	name = "法瓦毛绒玩偶"
	desc = "一个法瓦毛绒玩偶。它柔软又令人安心！"
	w_class = WEIGHT_CLASS_TINY
	icon_state = "farwaplush"

/obj/item/toy/plush/therapy_red
	name = "红色治疗娃娃"
	desc = "用于治疗和娱乐的玩具。这个是红色的。"
	icon_state = "therapyred"
	w_class = WEIGHT_CLASS_TINY

/obj/item/toy/plush/therapy_purple
	name = "紫色治疗娃娃"
	desc = "用于治疗和娱乐的玩具。这个是紫色的。"
	icon_state = "therapypurple"
	w_class = WEIGHT_CLASS_TINY

/obj/item/toy/plush/therapy_blue
	name = "蓝色治疗娃娃"
	desc = "用于治疗和娱乐的玩具。这个是蓝色的。"
	icon_state = "therapyblue"
	w_class = WEIGHT_CLASS_TINY

/obj/item/toy/plush/therapy_yellow
	name = "黄色治疗娃娃"
	desc = "用于治疗和娱乐的玩具。这个是黄色的。"
	icon_state = "therapyyellow"
	w_class = WEIGHT_CLASS_TINY

/obj/item/toy/plush/therapy_orange
	name = "橙色治疗娃娃"
	desc = "用于治疗和娱乐的玩具。这个是橙色的。"
	icon_state = "therapyorange"
	w_class = WEIGHT_CLASS_TINY

/obj/item/toy/plush/therapy_green
	name = "绿色治疗娃娃"
	desc = "用于治疗和娱乐的玩具。这个是绿色的。"
	icon_state = "therapygreen"
	w_class = WEIGHT_CLASS_TINY

/obj/item/toy/plush/carp
	name = "鲤鱼玩偶"
	desc = "一个可爱的鲤鱼造型毛绒玩具。"
	icon_state = "carpplush"
	worn_icon_state = "carp_plushie"
	attack_verb = list("bites", "eats", "fin slaps")

/obj/item/toy/plush/lizard
	name = "蜥蜴玩偶"
	desc = "一个可爱的蜥蜴造型毛绒玩具。"
	icon_state = "lizplush"
	worn_icon_state = "lizplush"
	attack_verb = list("claws", "hisses", "tail slaps")

/obj/item/toy/plush/snake
	name = "蛇蛇玩偶"
	desc = "一个可爱的蛇形毛绒玩具。请勿与真蛇混淆。"
	icon_state = "snakeplush"
	worn_icon_state = "snakeplush"
	attack_verb = list("bites", "hisses", "tail slaps")

/obj/item/toy/plush/slime
	name = "史莱姆玩偶"
	desc = "一个可爱的毛绒玩具，外形像史莱姆。它基本上就是个沙包。"
	icon_state = "slimeplush"
	worn_icon_state = "slimeplush"
	attack_verb = list("blorbles", "slimes", "absorbs")

/obj/item/toy/plush/moth
	name = "飞蛾玩偶"
	desc = "一个描绘可爱飞蛾人的毛绒玩具。这是个可以拥抱的小虫子！"
	icon_state = "moffplush"
	worn_icon_state = "moffplush"
	attack_verb = list("flutters", "flaps")

/obj/item/toy/plush/rouny
	name = "奔跑者毛绒玩具"
	desc = "一个描绘抱脸虫的毛绒玩偶，为纪念LV-426战役一百周年而制作。比真实的东西要可爱柔软得多。"
	icon_state = "rounyplush"
	worn_icon_state = "rounyplush"
	attack_verb = list("slashes", "bites", "pounces")

/obj/item/toy/plush/witch
	name = "女巫玩偶"
	desc = "一个描绘可爱女巫的毛绒玩具。它喜欢偷书。"
	icon_state = "marisa"
	worn_icon_state = "marisa"

/obj/item/toy/plush/fairy
	name = "仙子玩偶"
	desc = "一个描绘可爱仙女的毛绒玩具。摸起来凉凉的。"
	icon_state = "cirno"
	worn_icon_state = "cirno"

/obj/item/toy/plush/royalqueen
	name = "皇家异形女王玩偶"
	desc = "一个描绘皇家异形女王的毛绒玩偶。散发着淡淡的星尘和法棍面包的香气，标签上写着 Wee!。"
	icon_state = "queenplushie"
	worn_icon_state = "queenplushie"
	attack_verb = list("nuzzles", "bops", "pats")

/obj/item/toy/plush/royalqueen/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/squeak, 'sound/items/wee.ogg', 20)

#define HIGH_GNOME_MOVE_RANGE 40
#define STANDARD_GNOME_PIPE_CHANCE 50
#define GNOME_EXCLUSION_RANGE 21 //20 is the max view of a ghost

/obj/item/toy/plush/gnome
	name = "侏儒"
	desc = "一个守护地球花园的神话生物。你好奇它为何会出现在这里。"
	icon_state = "gnome"
	worn_icon_state = "gnome"
	attack_verb = list("kickes", "punches", "pounces")

/obj/item/toy/plush/gnome/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/squeak, 'sound/items/gnome.ogg', 50)

/obj/item/toy/plush/gnome/living
	resistance_flags = UNACIDABLE
	///how far the gnome should choose for teleportation purposes
	var/gnome_move_range = 5
	///how many failed teleports we've done
	var/teleport_retries = 0
	///sanity cap to prevent gnome spending too much time calculating possible teleport areas, it's theoretically possible to store the gnome in an impossible area so we need to check this
	var/max_tries = 50
	///list for keeping track of the mobs around us
	var/mob/possible_mobs = list()
	///list for keeping track of items in current gnome turf
	var/turf/targetturf
	///used for determining if a gnome is in the pipe network
	var/pipe_mode = FALSE
	///how likely are we to enter a pipe
	var/pipe_mode_chance = STANDARD_GNOME_PIPE_CHANCE
	///hold an int that determines what the interval a gnome acts
	var/gnome_act_timer
	///original gnome spawn location, used as an emergency backup
	var/gnome_origin

/obj/item/toy/plush/gnome/living/Initialize(mapload)
	. = ..()
	gnome_origin = get_turf(src)
	addtimer(CALLBACK(src, PROC_REF(gnome_act)), 5 MINUTES)
	RegisterSignal(src, COMSIG_MOVABLE_SHUTTLE_CRUSH, PROC_REF(shuttle_crush))

///root proc for handling gnome AI routines
/obj/item/toy/plush/gnome/living/proc/gnome_act()
	///targetturf stores our position at the start of routine in all. teleport_routine uses it as a baseline for determining where to find teleport locations also
	targetturf = get_turf(src)
	gnome_act_timer = rand(4,8) MINUTES
	pipe_mode_chance = STANDARD_GNOME_PIPE_CHANCE
	if(prob(10))
		do_flavor_actions(targetturf) //flavor actions don't take being watched into account
		addtimer(CALLBACK(src, PROC_REF(gnome_act)), gnome_act_timer)
		return
	possible_mobs = list()
	for(var/mob/nearbymob in range(GNOME_EXCLUSION_RANGE, src)) //all mobs are included except animals, this means that AIs and ghosts will block gnome movement
		if(isanimal(nearbymob))
			continue
		if(isobserver(nearbymob))
			continue
		possible_mobs += nearbymob
	if(handle_pipe_mode(targetturf) && pipe_mode) //if we're in pipe_mode we return,
		addtimer(CALLBACK(src, PROC_REF(gnome_act)), gnome_act_timer)
		return
	if(isspacearea(get_area(src)))
		forceMove(gnome_origin) //we're in space, return to origin
		targetturf = get_turf(src) //reset targetturf to origin to avoid problems with teleport_routine
	gnome_move_range = gnome_move_range + teleport_retries * 3 //for each teleport retry the gnome gets a multiplier to distance, to allow it to "escape" if left unattended
	if(length(possible_mobs))
		addtimer(CALLBACK(src, PROC_REF(gnome_act)), rand(15,90) SECONDS) //we're being watched, set shorter counter so we can escape once eyes are off of us
		teleport_retries += 1 //for each time a watching mob suppresses our teleport, increment counter
		return
	else
		if(handle_ladders())
			targetturf = get_turf(src) //need to reset targetturf to new position indicated by ladder use, or teleport_routine will calculate from old position
		flick("gnome_escape", src)
		addtimer(CALLBACK(src, PROC_REF(teleport_routine), targetturf), 1.5 SECONDS) //delay just briefly so our animation can go off
	addtimer(CALLBACK(src, PROC_REF(gnome_act)), gnome_act_timer)

//handles gnome going up or down ladders
/obj/item/toy/plush/gnome/living/proc/handle_ladders()
	for(var/atom/movable/object AS in targetturf.contents)
		if(!length(targetturf.contents) || prob(60)) //possibility that we don't use a ladder
			return FALSE
		if(isladder(object))
			var/obj/structure/ladder/selectedladder = object
			if(selectedladder.up && selectedladder.down)
				pick(forceMove(get_turf(selectedladder.up)), forceMove(get_turf(selectedladder.down)))
				break
			else if(selectedladder.up)
				forceMove(get_turf(selectedladder.up))
				break
			else if(selectedladder.down)
				forceMove(get_turf(selectedladder.down))
				break
	return TRUE

///handles gnome teleportation when not being observed by players
/obj/item/toy/plush/gnome/living/proc/teleport_routine(turf/targetturf)
	var/loopcount
	while(!length(possible_mobs))
		loopcount += 1
		var/area/targetarea = get_area(targetturf)
		if(!targetarea || !targetturf)
			targetturf = get_turf(src) //somehow we've lost our turf, use the one underneath us
			continue
		//find teleport locations within radius gnome_move_range of targetturf. once found, we verify that it's valid, set our new targetturf to it and move gnome to the new location
		targetturf = locate(targetturf.x + rand(gnome_move_range * -1, gnome_move_range), targetturf.y + rand(gnome_move_range * -1, gnome_move_range), targetturf.z)
		targetarea = get_area(targetturf)
		if(get_teleport_prereqs(targetturf) || loopcount >= max_tries) //try different turfs within range until we find something that passes get_teleport_prereqs or we hit max amount of loops
			teleport_retries = 0 //teleported successfully, clear teleport_retries
			break
	forceMove(targetturf)
	flick("gnome_return", src)

///validate that the turf we're attempting to teleport to is not dense in space etc
/obj/item/toy/plush/gnome/living/proc/get_teleport_prereqs(turf/targetturf, ignore_watching_players = FALSE)
	var/area/targetarea = get_area(targetturf)
	if(!targetarea || !targetturf)
		return FALSE
	if(isclosedturf(targetturf))
		return FALSE
	if(isspaceturf(targetturf) || isspacearea(targetarea) || islava(targetturf))
		return FALSE
	for(var/atom/movable/object AS in targetturf.contents) //don't move to tiles with dense objects on them
		if(object.density)
			return FALSE
	for(var/mob/nearbymob in range(GNOME_EXCLUSION_RANGE, src)) //make sure wherever we're going doesn't have observing mobs
		if(isanimal(nearbymob))
			continue
		if(isobserver(nearbymob))
			continue
		else if(!ignore_watching_players) //if we detect any mob that's not an observer or animal we return false
			return FALSE
	return TRUE

///various flavor actions
/obj/item/toy/plush/gnome/living/proc/do_flavor_actions(turf/targetturf)
	var/randomchoice = rand(1,8)
	switch(randomchoice)
		if(1)
			pick(playsound(src, 'sound/items/gnome.ogg', 35, TRUE),
			playsound(src, 'sound/misc/robotic scream.ogg', 35, TRUE),
			playsound(src, 'sound/voice/predator/laugh1.ogg', 35, TRUE),
			playsound(src, 'sound/voice/predator/laugh2.ogg', 35, TRUE),
			playsound(src, 'sound/voice/predator/laugh3.ogg', 35, TRUE),
			playsound(src, 'sound/voice/gnomelaugh.ogg', 35, TRUE),
			playsound(src, 'sound/weapons/guns/fire/tank_cannon1.ogg', 35, TRUE),
			playsound(src, 'sound/weapons/guns/fire/tank_cannon2.ogg', 35, TRUE),
			playsound(src, 'sound/voice/predator/helpme.ogg', 35, TRUE))
		if(2)
			for(var/atom/movable/object AS in targetturf.contents)
				if(isfood(object))
					qdel(object)
					playsound(src,'sound/items/eatfood.ogg', 25, 1)
					visible_message(span_warning("[src] 消耗了 \the [object]。"))
					break
		if(3)
			for(var/dirn in shuffle(GLOB.alldirs))
				var/turf/destturf = get_step(src,dirn)
				if(get_teleport_prereqs(destturf, TRUE))
					forceMove(destturf)
					break
		if(4)
			desc = initial(desc)
			new /obj/item/tool/kitchen/knife/butcher(targetturf)
			new /obj/effect/decal/cleanable/blood(targetturf)
			color = COLOR_DARK_RED
			desc += " It's covered in a dried reddish liquid, probably cranberry juice."
		if(5)
			pick(balloon_alert_to_viewers("凝视着"),
			(balloon_alert_to_viewers("调整了一下帽子")),
			(balloon_alert_to_viewers("模仿一个快速的刺击动作")),
			(balloon_alert_to_viewers("翻了个白眼")),
			(balloon_alert_to_viewers("低声咕哝着什么")),
			(balloon_alert_to_viewers("它的眼睛来回扫视")),
			(balloon_alert_to_viewers("憋住笑声")),
			(balloon_alert_to_viewers("眨眼")),
			(balloon_alert_to_viewers("眯起眼睛")),
			(balloon_alert_to_viewers("恶狠狠地瞪着")))
		if(6)
			for(var/atom/movable/object AS in targetturf.contents)
				if(isinjector(object))
					qdel(object)
					playsound(src,'sound/items/hypospray.ogg', 25, 1)
					visible_message(span_warning("[src] 将 \the [object] 注入其手臂。"))
					break
		if(7)
			flick("gnome_hop", src)
		if(8)
			teleport_retries += 10 //gnome is getting out of here
			teleport_routine()



//handles gnome "escaping" a shuttle crush
/obj/item/toy/plush/gnome/living/proc/shuttle_crush()
	SIGNAL_HANDLER
	new /obj/item/toy/plush/gnome(gnome_origin) //shuttle crush deletes src object, create new gnome at spawn point to give illusion of escape

///handles gnome transportation using pipes
/obj/item/toy/plush/gnome/living/proc/handle_pipe_mode(turf/targetturf)
	if(!length(targetturf.contents))
		return
	pipe_mode_chance -= length(possible_mobs) * 10 //for each mob nearby subtract 10 from the chance to interact with vents
	if(!prob(pipe_mode_chance))
		return
	if(pipe_mode)
		if(length(GLOB.atmospumps))
			var/obj/machinery/atmospherics/components/unary/vent_pump/targetpump = pick(GLOB.atmospumps)
			forceMove(targetpump.loc)
			playsound(src, SFX_ALIEN_VENTPASS, 35, TRUE)
			pipe_mode = FALSE
	else //if we're not in pipe mode check the ground for scrubbers/vents, if we find one enter it
		for(var/atom/movable/object AS in targetturf.contents)
			if(isatmosvent(object) || isatmosscrubber(object))
				forceMove(object)
				playsound(src, SFX_ALIEN_VENTPASS, 35, TRUE)
				pipe_mode = TRUE

#undef HIGH_GNOME_MOVE_RANGE
#undef STANDARD_GNOME_PIPE_CHANCE
#undef GNOME_EXCLUSION_RANGE

/obj/item/toy/beach_ball/basketball
	name = "篮球"
	icon_state = "basketball"
	worn_icon_state = "basketball"
	desc = "这是你的机会，在太空大灌篮里秀出你的舞步。"
	w_class = WEIGHT_CLASS_BULKY


/obj/structure/hoop
	name = "篮球框"
	desc = "砰，沙卡拉卡！"
	icon = 'icons/obj/structures/misc.dmi'
	icon_state = "hoop"
	anchored = TRUE
	density = TRUE
	resistance_flags = XENO_DAMAGEABLE
	var/side = ""
	var/id = ""

/obj/structure/hoop/grab_interact(obj/item/grab/grab, mob/user, base_damage = BASE_OBJ_SLAM_DAMAGE, is_sharp = FALSE)
	. = ..()
	if(.)
		return
	if(!isliving(grab.grabbed_thing))
		return
	if(user.a_intent == INTENT_HARM)
		return
	var/mob/living/grabbed_mob = grab.grabbed_thing
	if(user.grab_state <= GRAB_AGGRESSIVE)
		to_chat(user, span_warning("你需要握得更稳才能做到！"))
		return

	grabbed_mob.forceMove(loc)
	grabbed_mob.Paralyze(4 SECONDS)
	for(var/obj/machinery/scoreboard/X in GLOB.machines)
		if(X.id == id)
			X.score(side, 3)// 3 points for dunking a mob
	visible_message(span_danger("[user] 将 [grabbed_mob] 按进了 [src] 里！"))


/obj/structure/hoop/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(get_dist(src, user) < 2)
		user.transferItemToLoc(I, loc)
		for(var/obj/machinery/scoreboard/X in GLOB.machines)
			if(X.id == id)
				X.score(side)
		visible_message(span_notice("[user] 把 [I] 塞进了 [src] 里！"))


/obj/structure/hoop/CanAllowThrough(atom/movable/mover, turf/target)
	if(istype(mover,/obj/item) && mover.throwing)
		var/obj/item/I = mover
		if(prob(50))
			I.forceMove(loc)
			for(var/obj/machinery/scoreboard/X in GLOB.machines)
				if(X.id == id)
					X.score(side)
					// no break, to update multiple scoreboards
			visible_message(span_notice("嗖！\the [I] 落入了 \the [src]。"), 3)
		else
			visible_message(span_warning("\the [I] 从 \the [src] 的边缘弹开了！"), 3)
		return FALSE
	else
		return ..()
