/// this code sucks dont use it
/obj/item/mmi
	name = "人机界面"
	desc = "战士平淡无奇的缩写'MMI'，掩盖了这头怪物的真正恐怖。"
	icon = 'icons/obj/items/assemblies.dmi'
	icon_state = "mmi_empty"
	w_class = WEIGHT_CLASS_NORMAL

	//these vars are so the mecha fabricator doesn't shit itself anymore. --NEO

	req_access = list(ACCESS_MARINE_RESEARCH)

	//Revised. Brainmob is now contained directly within object of transfer. MMI in this case.

	var/locked = 0
	var/mob/living/brain/brainmob = null//The current occupant.


/obj/item/mmi/attackby(obj/item/O, mob/user)
	if(istype(O,/obj/item/organ/brain) && !brainmob) //Time to stick a brain in it --NEO

		var/obj/item/organ/brain/B = O
		if(B.obj_integrity <= 0)
			to_chat(user, span_warning("那个大脑已经彻底死亡了。"))
			return
		else if(!B.brainmob)
			to_chat(user, span_warning("你不确定这个大脑是从哪来的，但你很确定这是个没用的脑子。"))
			return

		visible_message(span_notice("[user]将\a [O]插入\the [src]。"))

		brainmob = O:brainmob
		O:brainmob = null
		brainmob.loc = src
		brainmob.container = src
		brainmob.set_stat(CONSCIOUS)
		GLOB.dead_mob_list -= brainmob//Update dem lists
		GLOB.alive_living_list += brainmob

		user.drop_held_item()
		qdel(O)

		name = "人机接口：[brainmob.real_name]"
		icon_state = "mmi_full"

		locked = 1

		return

	if(istype(O,/obj/item/card/id) && brainmob)
		if(allowed(user))
			locked = !locked
			to_chat(user, span_notice("You [locked ? "lock" : "unlock"] the brain holder."))
		else
			to_chat(user, span_warning("访问被拒绝。"))
		return
	if(brainmob)
		O.attack(brainmob, user)//Oh noooeeeee
		return
	..()

	//TODO: ORGAN REMOVAL UPDATE. Make the brain remain in the MMI so it doesn't lose organ data.
/obj/item/mmi/attack_self(mob/user as mob)
	if(!brainmob)
		to_chat(user, span_warning("你倒空了 MMI，但里面什么也没有。"))
	else if(locked)
		to_chat(user, span_warning("你将MMI倒置，但大脑被牢牢固定住了。"))
	else
		to_chat(user, span_notice("你将MMI倒空，把大脑倒在了地上。"))
		var/obj/item/organ/brain/brain = new(user.loc)
		brainmob.container = null//Reset brainmob mmi var.
		brainmob.loc = brain//Throw mob into brain.
		GLOB.alive_living_list -= brainmob//Get outta here
		brain.brainmob = brainmob//Set the brain to use the brainmob
		brainmob = null//Set mmi brainmob var to null

		icon_state = "mmi_empty"
		name = "人机界面"

/obj/item/mmi/proc/transfer_identity(mob/living/carbon/human/H)//Same deal as the regular brain proc. Used for human-->robot people.
	brainmob = new(src)
	brainmob.name = H.real_name
	brainmob.real_name = H.real_name
	brainmob.container = src

	name = "人机接口：[brainmob.real_name]"
	icon_state = "mmi_full"
	locked = 1
	return

/obj/item/mmi/radio_enabled
	name = "无线电人机界面"
	desc = "战士平淡无奇的缩写'MMI'掩盖了这头怪物的真正恐怖。这个型号内置了无线电。"

	var/obj/item/radio/radio = null//Let's give it a radio.

/obj/item/mmi/radio_enabled/Initialize(mapload)
	. = ..()
	radio = new(src)//Spawns a radio inside the MMI.
	radio.broadcasting = 1//So it's broadcasting from the start.

/obj/item/mmi/radio_enabled/verb/Toggle_Broadcasting()
	set name = "Toggle Broadcasting"
	set desc = "Toggle broadcasting channel on or off."
	set category = "MMI"
	set src = usr.loc//In user location, or in MMI in this case.
	set popup_menu = 0//Will not appear when right clicking.

	if(brainmob.stat)//Only the brainmob will trigger these so no further check is necessary.
		to_chat(brainmob, "无法在失去行动能力或死亡时执行此操作。")

	radio.broadcasting = radio.broadcasting==1 ? 0 : 1
	to_chat(brainmob, span_notice("Radio is [radio.broadcasting==1 ? "now" : "no longer"] broadcasting."))

/obj/item/mmi/radio_enabled/verb/Toggle_Listening()
	set name = "Toggle Listening"
	set desc = "Toggle listening channel on or off."
	set category = "MMI"
	set src = usr.loc
	set popup_menu = 0

	if(brainmob.stat)
		to_chat(brainmob, "无法在失去行动能力或死亡时执行此操作。")

	radio.listening = radio.listening==1 ? 0 : 1
	to_chat(brainmob, span_notice("Radio is [radio.listening==1 ? "now" : "no longer"] receiving broadcast."))

/obj/item/mmi/emp_act(severity)
	if(!brainmob)
		return
	else
		switch(severity)
			if(1)
				brainmob.emp_damage += rand(20,30)
			if(2)
				brainmob.emp_damage += rand(10,20)
			if(3)
				brainmob.emp_damage += rand(0,10)
	..()
