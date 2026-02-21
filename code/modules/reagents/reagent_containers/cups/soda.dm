
//////////////////////////soda_cans//
//These are in their own group to be used as IED's in /obj/item/grenade/ghettobomb.dm
/// How much fizziness is added to the can of soda by throwing it, in percentage points
#define SODA_FIZZINESS_THROWN 15
/// How much fizziness is added to the can of soda by shaking it, in percentage points
#define SODA_FIZZINESS_SHAKE 5

/obj/item/reagent_containers/cup/soda_cans
	name = "汽水罐"
	icon = 'icons/obj/drinks/soda.dmi'
	icon_state = "cola"
	icon_state_preview = "cola"
	reagent_flags = NONE
	obj_flags = CAN_BE_HIT
	possible_transfer_amounts = list(5, 10, 15, 25, 30)
	volume = 30
	throwforce = 12 // set to 0 upon being opened. Have you ever been domed by a soda can? Those things fucking hurt
	/// If the can hasn't been opened yet, this is the measure of how fizzed up it is from being shaken or thrown around. When opened, this is rolled as a percentage chance to burst
	var/fizziness = 0

/obj/item/reagent_containers/cup/soda_cans/random/Initialize(mapload)
	..()
	var/T = pick(subtypesof(/obj/item/reagent_containers/cup/soda_cans) - /obj/item/reagent_containers/cup/soda_cans/random)
	new T(loc)
	return INITIALIZE_HINT_QDEL

/obj/item/reagent_containers/cup/soda_cans/attack(mob/target_mob, mob/living/user)
	if(iscarbon(target_mob) && !reagents.total_volume && (user.a_intent == INTENT_HARM) && user.zone_selected == BODY_ZONE_HEAD)
		if(target_mob == user)
			user.visible_message(span_warning("[user] 把 [src] 的罐子砸在 [user.p_their()] 的额头上！"), span_notice("You crush the can of [src] on your forehead."))
		else
			user.visible_message(span_warning("[user] 把 [src] 的罐子砸在 [target_mob] 的额头上！"), span_notice("You crush the can of [src] on [target_mob]'s forehead."))
		playsound(target_mob,'sound/weapons/pierce.ogg', rand(10,50), TRUE)
		var/obj/item/trash/can/crushed_can = new /obj/item/trash/can(target_mob.loc)
		crushed_can.icon_state = icon_state
		qdel(src)
		return TRUE
	return ..()

/obj/item/reagent_containers/cup/soda_cans/proc/open_soda(mob/user)
	if(prob(fizziness))
		user.visible_message(span_danger("[user]打开了[src]，突然被里面嘶嘶作响的内容喷了一身！"), span_danger("You pull back the tab of [src], and are suddenly sprayed with a torrent of liquid! Ahhh!!"))
		burst_soda(user)
		return

	to_chat(user, "你拉开[src]的拉环，发出令人满意的'噗'声。") //Ahhhhhhhh
	reagents.reagent_flags |= OPENCONTAINER
	playsound(src, "can_open", 50, TRUE)
	throwforce = 0

/**
 * Burst the soda open on someone. Fun! Opens and empties the soda can, but does not crush it.
 *
 * Arguments:
 * * target - Who's getting covered in soda
 * * hide_message - Stops the generic fizzing message, so you can do your own
 */
/obj/item/reagent_containers/cup/soda_cans/proc/burst_soda(atom/target, hide_message = FALSE)
	if(!target)
		return

	playsound(src, 'sound/effects/can_pop.ogg', 80, TRUE)
	if(!hide_message)
		visible_message(span_danger("[src] 喷涌而出，嘶嘶作响的液体溅了[target]一身！"))
	reagents.reagent_flags |= OPENCONTAINER
	reagents.clear_reagents()
	throwforce = 0

/obj/item/reagent_containers/cup/soda_cans/throw_impact(atom/hit_atom, speed, bounce)
	. = ..()
	if(. || !reagents.total_volume) // if it was caught, already opened, or has nothing in it
		return

	fizziness += SODA_FIZZINESS_THROWN
	if(!prob(fizziness))
		return

	burst_soda(hit_atom, hide_message = TRUE)
	visible_message(span_danger("[src]与[hit_atom]的撞击导致其破裂，内容物四处飞溅！"))
	var/obj/item/trash/can/crushed_can = new /obj/item/trash/can(src.loc)
	crushed_can.icon_state = icon_state
	moveToNullspace()
	QDEL_IN(src, 1 SECONDS) // give it a second so it can still be logged for the throw impact

/obj/item/reagent_containers/cup/soda_cans/attack_self(mob/user)
	if(!is_drainable())
		open_soda(user)
		return
	return ..()

/obj/item/reagent_containers/cup/soda_cans/attack_self_alternate(mob/living/user)
	if(!is_drainable())
		playsound(src, 'sound/effects/can_shake.ogg', 50, TRUE)
		user.visible_message(span_danger("[user]摇晃着[src]！"), span_danger("You shake up [src]!"), vision_distance=2)
		fizziness += SODA_FIZZINESS_SHAKE
		return
	return ..()

/obj/item/reagent_containers/cup/soda_cans/examine(mob/user)
	. = ..()
	if(!in_range(user, src))
		return
	if(fizziness > 30 && prob(fizziness * 2))
		. += span_notice("<i>You examine [src] closer, and note the following...</i>")
		. += "\t[span_warning("You get a menacing aura of fizziness from it...")]"

#undef SODA_FIZZINESS_THROWN
#undef SODA_FIZZINESS_SHAKE

/obj/item/reagent_containers/cup/soda_cans/cola
	name = "太空可乐"
	desc = "可乐。在太空中。"
	icon_state = "cola"
	list_reagents = list(/datum/reagent/consumable/space_cola = 30)
	drink_type = SUGAR

/obj/item/reagent_containers/cup/soda_cans/tonic
	name = "T-Borg的奎宁水"
	desc = "奎宁的味道有点怪，但至少能预防太空疟疾。"
	icon_state = "tonic"
	volume = 50
	list_reagents = list(/datum/reagent/consumable/tonic = 50)
	drink_type = ALCOHOL

/obj/item/reagent_containers/cup/soda_cans/sodawater
	name = "苏打水"
	desc = "一罐苏打水。何不调一杯威士忌苏打呢？"
	icon_state = "sodawater"
	volume = 50
	list_reagents = list(/datum/reagent/consumable/sodawater = 50)

/obj/item/reagent_containers/cup/soda_cans/lemon_lime
	name = "橙子汽水"
	desc = "你想要的是橙子味。它给了你柠檬青柠味。"
	icon_state = "lemon-lime"
	list_reagents = list(/datum/reagent/consumable/lemon_lime = 30)
	drink_type = FRUIT

/obj/item/reagent_containers/cup/soda_cans/lemon_lime/Initialize(mapload)
	. = ..()
	name = "柠檬青柠汽水"

/obj/item/reagent_containers/cup/soda_cans/sol_dry
	name = "索尔干"
	desc = "也许这能让你的肚子好受点。也许不能。"
	icon_state = "sol_dry"
	list_reagents = list(/datum/reagent/consumable/sol_dry = 30)
	drink_type = SUGAR

/obj/item/reagent_containers/cup/soda_cans/space_up
	name = "太空能量！"
	desc = "尝起来像是舰体破裂的味道。"
	icon_state = "space-up"
	list_reagents = list(/datum/reagent/consumable/space_up = 30)
	drink_type = SUGAR | JUNKFOOD

/obj/item/reagent_containers/cup/soda_cans/starkist
	name = "星之吻"
	desc = "液态星辰的味道。还有，一点金枪鱼……？"
	icon_state = "starkist"
	list_reagents = list(/datum/reagent/consumable/space_cola = 15, /datum/reagent/consumable/orangejuice = 15)
	drink_type = SUGAR | FRUIT | JUNKFOOD

/obj/item/reagent_containers/cup/soda_cans/space_mountain_wind
	name = "太空山风"
	desc = "像太空风一样直接穿透你。"
	icon_state = "space_mountain_wind"
	list_reagents = list(/datum/reagent/consumable/spacemountainwind = 30)
	drink_type = SUGAR | JUNKFOOD

/obj/item/reagent_containers/cup/soda_cans/thirteenloko
	name = "十三洛可"
	desc = "首席医疗官已告知船员，饮用十三乐可可能导致癫痫、失明、醉酒甚至死亡。请理性饮用。"
	icon_state = "thirteen_loko"
	list_reagents = list(/datum/reagent/consumable/ethanol/thirteenloko = 30)
	drink_type = SUGAR | JUNKFOOD

/obj/item/reagent_containers/cup/soda_cans/dr_gibb
	name = "吉布医生"
	desc = "由42种不同风味混合而成的美味饮品。"
	icon_state = "dr_gibb"
	list_reagents = list(/datum/reagent/consumable/dr_gibb = 30)
	drink_type = SUGAR | JUNKFOOD

/obj/item/reagent_containers/cup/soda_cans/pwr_game
	name = "权力游戏"
	desc = "唯一一款真正玩家渴望的PWR能量饮料。当玩家谈论'玩家燃料'时，他们指的就是这个。"
	icon_state = "purple_can"
	list_reagents = list(/datum/reagent/consumable/pwr_game = 30)

/obj/item/reagent_containers/cup/soda_cans/shamblers
	name = "蹒跚者汁液"
	desc = "~给我来点震颤者之酒！~"
	icon_state = "shamblers"
	list_reagents = list(/datum/reagent/consumable/shamblers = 30)
	drink_type = SUGAR | JUNKFOOD

/obj/item/reagent_containers/cup/soda_cans/wellcheers
	name = "维乐果汁"
	desc = "一杯散发着海水咸味的紫色怪饮。远处隐约传来海鸥的鸣叫。"
	icon_state = "wellcheers"
	list_reagents = list(/datum/reagent/consumable/wellcheers = 30)
	drink_type = SUGAR | JUNKFOOD

/obj/item/reagent_containers/cup/soda_cans/grey_bull
	name = "灰色蛮牛"
	desc = "灰色蛮牛，它给你手套！"
	icon_state = "energy_drink"
	list_reagents = list(/datum/reagent/consumable/grey_bull = 20)
	drink_type = SUGAR | JUNKFOOD

/obj/item/reagent_containers/cup/soda_cans/monkey_energy
	name = "猴子能量"
	desc = "释放猿猴！"
	icon_state = "monkey_energy"
	volume = 50
	list_reagents = list(/datum/reagent/consumable/monkey_energy = 50)
	drink_type = SUGAR | JUNKFOOD

/obj/item/reagent_containers/cup/soda_cans/volt_energy
	name = "24伏能量"
	desc = "充电，用24伏能量！"
	icon_state = "volt_energy"
	list_reagents = list(/datum/reagent/consumable/volt_energy = 30)
	drink_type = SUGAR | JUNKFOOD

/obj/item/reagent_containers/cup/soda_cans/melon_soda
	name = "坎苏米西瓜汽水"
	desc = "日本最受欢迎的蜜瓜汽水，现已推出罐装版！"
	icon_state = "melon_soda"
	list_reagents = list(/datum/reagent/consumable/melon_soda = 30)
	drink_type = SUGAR | JUNKFOOD

/obj/item/reagent_containers/cup/soda_cans/air
	name = "压缩空气罐"
	desc = "没有空气短缺。不要饮用。"
	icon_state = "air"
	list_reagents = list(/datum/reagent/nitrogen = 24, /datum/reagent/oxygen = 6)

/obj/item/reagent_containers/cup/soda_cans/beer
	name = "太空啤酒"
	desc = "罐装啤酒。在太空中。"
	icon_state = "space_beer"
	volume = 40
	list_reagents = list(/datum/reagent/consumable/ethanol/beer = 40)
	drink_type = GRAIN

/obj/item/reagent_containers/cup/soda_cans/beer/rice
	name = "米酒"
	desc = "一种在火星上流行的清淡米制拉格啤酒。根据1516年的《纯净法》，这被视为对巴伐利亚人的仇恨犯罪。"
	icon_state = "ebisu"
	list_reagents = list(/datum/reagent/consumable/ethanol/rice_beer = 40)

/obj/item/reagent_containers/cup/soda_cans/beer/rice/Initialize(mapload)
	. = ..()
	var/brand = pick("Ebisu Super Dry", "Shimauma Ichiban", "Moonlabor Malt's")
	name = "[brand]"
	switch(brand)
		if("Ebisu Super Dry")
			icon_state = "ebisu"
			desc = "火星最受欢迎的米酒品牌，200年经久不衰。"
		if("Shimauma Ichiban")
			icon_state = "shimauma"
			desc = "火星最平庸的米酒品牌。虽不及惠比寿受欢迎，但稳居第二的位置倒也自在。"
		if("Moonlabor Malt's")
			icon_state = "moonlabor"
			desc = "火星的冷门大米啤酒品牌。在黑道中颇受欢迎，原因不明。"
