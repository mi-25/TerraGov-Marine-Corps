/* Kitchen tools
* Contains:
*		Utensils
*		Spoons
*		Forks
*		Knives
*		Kitchen knives
*		Butcher's cleaver
*		Rolling Pins
*		Trays
*/

/obj/item/tool/kitchen //todo: kill this shit
	icon = 'icons/obj/items/kitchen_tools.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/kitchen_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/kitchen_right.dmi',
	)

/*
* Utensils
*/
/obj/item/tool/kitchen/utensil
	force = 5
	w_class = WEIGHT_CLASS_TINY
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	atom_flags = CONDUCT
	attack_verb = list("attacks", "stabs", "pokes")
	sharp = 0
	/// Is there something on this utensil?
	var/image/loaded

/obj/item/tool/kitchen/utensil/Initialize(mapload)
	. = ..()
	pixel_y = rand(0, 4)

	create_reagents(5)

/obj/item/tool/kitchen/utensil/Destroy()
	QDEL_NULL(loaded)
	return ..()

/obj/item/tool/kitchen/utensil/update_overlays()
	. = ..()
	if(!loaded)
		return
	. += loaded

/obj/item/tool/kitchen/utensil/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!istype(M))
		return ..()

	if(user.a_intent != INTENT_HELP)
		return ..()

	if(reagents.total_volume > 0)
		reagents.reaction(M, INGEST)
		reagents.trans_to(M, reagents.total_volume)
		if(M == user)
			visible_message(span_notice("[user] 从 \the [src] 中吃了一些 [loaded]。"))
			M.reagents.add_reagent(/datum/reagent/consumable/nutriment, 1)
		else
			visible_message(span_notice("[user]用\the [src]给[M]喂了一些[loaded]"))
			M.reagents.add_reagent(/datum/reagent/consumable/nutriment, 1)
		playsound(M.loc,'sound/items/eatfood.ogg', 15, 1)
		QDEL_NULL(loaded)
		update_appearance(UPDATE_OVERLAYS)
		return
	return ..()

/obj/item/tool/kitchen/utensil/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(!CONFIG_GET(flag/fun_allowed))
		return FALSE
	attack_hand(xeno_attacker)

/obj/item/tool/kitchen/utensil/fork
	name = "分叉"
	desc = "这是一把叉子。确实很尖。"
	icon_state = "fork"

/obj/item/tool/kitchen/utensil/pfork
	name = "塑料叉"
	desc = "太好了，不用洗碗了。"
	icon_state = "pfork"

/obj/item/tool/kitchen/utensil/spoon
	name = "勺子"
	desc = "这是一把勺子。你可以在反光中看到自己倒过来的脸。"
	icon_state = "spoon"
	attack_verb = list("attacks", "pokes")

/obj/item/tool/kitchen/utensil/pspoon
	name = "塑料勺"
	desc = "这是一把塑料勺子。真没劲。"
	icon_state = "pspoon"
	attack_verb = list("attacks", "pokes")

/*
* Knives
*/
/obj/item/tool/kitchen/utensil/knife
	name = "求生刀"
	desc = "能切开任何食物。"
	icon_state = "knife"
	force = 10
	throwforce = 10
	sharp = IS_SHARP_ITEM_ACCURATE
	edge = 1

/obj/item/tool/kitchen/utensil/knife/suicide_act(mob/user)
	user.visible_message(pick(span_danger("[user] is slitting [user.p_their()] wrists with the [name]! It looks like [user.p_theyre()] trying to commit suicide."), \
							span_danger("[user] is slitting [user.p_their()] throat with the [name]! It looks like [user.p_theyre()] trying to commit suicide."), \
							span_danger("[user] is slitting [user.p_their()] stomach open with the [name]! It looks like [user.p_theyre()] trying to commit seppuku.")))
	return (BRUTELOSS)

/obj/item/tool/kitchen/utensil/knife/attack(target as mob, mob/living/user as mob)
	playsound(loc, 'sound/weapons/bladeslice.ogg', 25, 1, 5)
	return ..()

/obj/item/tool/kitchen/utensil/pknife
	name = "塑料刀"
	desc = "最钝的刀刃。"
	icon_state = "pknife"
	force = 10
	throwforce = 10

/*
* Kitchen knives
*/
/obj/item/tool/kitchen/knife
	name = "厨房刀"
	icon_state = "knife"
	desc = "太空厨具公司生产的通用厨师刀。保证多年锋利如初。"
	atom_flags = CONDUCT
	sharp = IS_SHARP_ITEM_ACCURATE
	edge = 1
	force = 10
	w_class = WEIGHT_CLASS_NORMAL
	throwforce = 6
	throw_speed = 3
	throw_range = 6
	attack_verb = list("slashes", "stabs", "slices", "tears", "rips", "dices", "cuts")

/obj/item/tool/kitchen/knife/suicide_act(mob/user)
	user.visible_message(pick(span_danger("[user] is slitting [user.p_their()] wrists with the [name]! It looks like [user.p_theyre()] trying to commit suicide."), \
							span_danger("[user] is slitting [user.p_their()] throat with the [name]! It looks like [user.p_theyre()] trying to commit suicide."), \
							span_danger("[user] is slitting [user.p_their()] stomach open with the [name]! It looks like [user.p_theyre()] trying to commit seppuku.")))
	return BRUTELOSS

/obj/item/tool/kitchen/knife/ritual
	name = "仪式匕首"
	desc = "曾为这把剑刃提供动力的超凡能量现已沉寂。"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "render"

/*
* Bucher's cleaver
*/
/obj/item/tool/kitchen/knife/butcher
	name = "屠夫砍刀"
	icon_state = "butch"
	desc = "用于切剁肉类的大型工具。这包括小丑以及小丑副产品。"
	atom_flags = CONDUCT
	force = 35
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 25
	throw_speed = 3
	throw_range = 6
	attack_verb = list("cleaves", "slashes", "stabs", "slices", "tears", "rips", "dices", "cuts")
	sharp = IS_SHARP_ITEM_ACCURATE
	edge = 1
	hitsound = 'sound/weapons/bladeslice.ogg'

/*
* Rolling Pins
*/

/obj/item/tool/kitchen/rollingpin
	name = "擀面杖"
	desc = "用于击晕酒保。"
	icon_state = "rolling_pin"
	force = 8
	throwforce = 10
	throw_speed = 2
	throw_range = 7
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("bashes", "batters", "bludgeons", "thrashes", "whacks")
