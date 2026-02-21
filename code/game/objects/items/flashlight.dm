/obj/item/flashlight
	name = "手电筒"
	desc = "手持式应急灯。"
	icon = 'icons/obj/lighting.dmi'
	icon_state = "flashlight"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/lights_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/lights_right.dmi',
	)
	worn_icon_state = "flashlight"
	w_class = WEIGHT_CLASS_SMALL
	atom_flags = CONDUCT
	equip_slot_flags = ITEM_SLOT_BELT
	actions_types = list(/datum/action/item_action)
	light_range = 5
	light_power = 3 //luminosity when on
	///Can this be turned into a rail light ?
	var/raillight_compatible = TRUE
	var/activation_sound = 'sound/items/flashlight.ogg'
	///If this flashlight affected by nightfall
	var/nightfall_immune = FALSE

/obj/item/flashlight/Initialize(mapload)
	. = ..()
	GLOB.nightfall_toggleable_lights += src

/obj/item/flashlight/Destroy()
	GLOB.nightfall_toggleable_lights -= src
	return ..()

/obj/item/flashlight/turn_light(mob/user, toggle_on, cooldown = 1 SECONDS, sparks = FALSE, forced = FALSE)
	if(forced && nightfall_immune)
		return NIGHTFALL_IMMUNE
	. = ..()
	if(. != CHECKS_PASSED)
		return
	if(!user && ismob(loc))
		user = loc
	set_light_on(toggle_on)
	update_action_button_icons()
	update_icon()

/obj/item/flashlight/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(turn_light(xeno_attacker, FALSE) != CHECKS_PASSED)
		return
	playsound(loc, SFX_ALIEN_CLAW_METAL, 25, 1)
	xeno_attacker.do_attack_animation(src, ATTACK_EFFECT_CLAW)
	to_chat(xeno_attacker, span_warning("我们让那个金属玩意儿熄灯了。") )

/obj/item/flashlight/update_icon_state()
	. = ..()
	if(light_on)
		icon_state = "[initial(icon_state)]-on"
	else
		icon_state = initial(icon_state)


/obj/item/flashlight/attack_self(mob/user)
	if(!isturf(user.loc))
		to_chat(user, "你无法在[user.loc]中打开灯。")
		return FALSE
	if(activation_sound && (turn_light(user, !light_on) != STILL_ON_COOLDOWN))
		playsound(get_turf(src), activation_sound, 15, 1)
	return TRUE

/obj/item/flashlight/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/tool/screwdriver))
		if(!raillight_compatible) //No fancy messages, just no
			return

		if(light_on)
			to_chat(user, span_warning("先关闭 [src]。"))
			return

		if(loc == user)
			user.dropItemToGround(src) //This part is important to make sure our light sources update, as it calls dropped()

		var/obj/item/attachable/flashlight/F = new(loc)
		user.put_in_hands(F) //This proc tries right, left, then drops it all-in-one.
		to_chat(user, span_notice("你将[src]改装了。它现在可以安装在武器上。"))
		to_chat(user, span_notice("用螺丝刀对 [F] 操作以将其改回。"))
		qdel(src) //Delete da old flashlight


/obj/item/flashlight/attack(mob/living/M, mob/living/user)
	if(light_on && user.zone_selected == BODY_ZONE_PRECISE_EYES)

		if((user.getBrainLoss() >= 60) && prob(50))	//too dumb to use flashlight properly
			return ..()	//just hit them in the head


		var/mob/living/carbon/human/H = M	//mob has protective eyewear
		if(ishuman(M) && ((H.head && H.head.inventory_flags & COVEREYES) || (H.wear_mask && H.wear_mask.inventory_flags & COVEREYES) || (H.glasses && H.glasses.inventory_flags & COVEREYES)))
			to_chat(user, span_notice("You're going to need to remove that [(H.head && H.head.inventory_flags & COVEREYES) ? "helmet" : (H.wear_mask && H.wear_mask.inventory_flags & COVEREYES) ? "mask": "glasses"] first."))
			return

		if(M == user)	//they're using it on themselves
			M.flash_act()
			M.visible_message(span_notice("[M] 将 [src] 指向 [M.p_their()] 的双眼。"), \
								span_notice("You wave the light in front of your eyes! Trippy!"))
			return

		user.visible_message(span_notice("[user]将[src]对准[M]的眼睛。"), \
							span_notice("You direct [src] to [M]'s eyes."))

		if(ishuman(M))	//robots and aliens are unaffected
			var/mob/living/carbon/C = M
			if(C.stat == DEAD || C.disabilities & BLIND)	//mob is dead or fully blind
				to_chat(user, span_notice("[C]瞳孔对光线无反应！"))
			else	//they're okay!
				C.flash_act()
				to_chat(user, span_notice("[C]的瞳孔收缩。"))
	else
		return ..()


/obj/item/flashlight/pen
	name = "手电筒"
	desc = "一支笔形手电，供医务人员使用。"
	icon_state = "penlight"
	worn_icon_state = ""
	atom_flags = CONDUCT
	light_range = 2
	w_class = WEIGHT_CLASS_TINY
	raillight_compatible = FALSE

/obj/item/flashlight/drone
	name = "低功率手电筒"
	desc = "一盏微型灯，可能供小型机器人使用。"
	icon_state = "penlight"
	worn_icon_state = ""
	light_range = 2
	w_class = WEIGHT_CLASS_TINY
	raillight_compatible = FALSE

//The desk lamps are a bit special
/obj/item/flashlight/lamp
	name = "台灯"
	desc = "一盏带有可调节支架的台灯。"
	icon_state = "lamp"
	worn_icon_state = "lamp"
	light_range = 5
	w_class = WEIGHT_CLASS_BULKY
	light_on = FALSE
	raillight_compatible = FALSE

//Menorah!
/obj/item/flashlight/lamp/menorah
	name = "烛台"
	desc = "庆祝光明节。"
	icon_state = "menorah"
	worn_icon_state = "menorah"
	light_range = 2
	w_class = WEIGHT_CLASS_BULKY

//Green-shaded desk lamp
/obj/item/flashlight/lamp/green
	desc = "一盏经典的绿色灯罩台灯。"
	icon_state = "lampgreen"
	worn_icon_state = "lampgreen"
	light_range = 5

/obj/item/device/flashlight/lamp/tripod
	name = "三脚架灯"
	desc = "一个安装在三角架上的应急灯管。它似乎能永远亮着。"
	icon = 'icons/obj/lighting.dmi'
	icon_state = "tripod_lamp"
	light_range = 6//pretty good

/obj/item/device/flashlight/lamp/tripod/grey
	icon_state = "tripod_lamp_grey"

/obj/item/flashlight/lamp/verb/toggle_light()
	set name = "Toggle light"
	set category = "IC.Object"
	set src in oview(1)

	if(istype(usr, /mob/living/carbon/xenomorph)) //Sneaky xenos turning off the lights
		attack_alien(usr)
		return

	if(!usr.stat)
		attack_self(usr)

/obj/item/flashlight/lamp/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(xeno_attacker.status_flags & INCORPOREAL)
		return FALSE
	xeno_attacker.do_attack_animation(src, ATTACK_EFFECT_SMASH)
	playsound(loc, 'sound/effects/metalhit.ogg', 20, TRUE)
	xeno_attacker.visible_message(span_danger("\The [xeno_attacker] 猛击了 [src]！"), \
	span_danger("We smash [src]!"), null, 5)
	deconstruct(FALSE)

/obj/item/flashlight/slime
	gender = PLURAL
	name = "发光粘液"
	desc = "一团发光的球体，看起来像是琥珀。"
	icon = 'icons/obj/lighting.dmi'
	icon_state = "floor1" //not a slime extract sprite but... something close enough!
	worn_icon_state = "slime"
	w_class = WEIGHT_CLASS_TINY
	light_range = 6
	light_on = TRUE //Bio-luminesence has one setting, on.
	raillight_compatible = FALSE


/obj/item/flashlight/slime/attack_self(mob/user)
	return //Bio-luminescence does not toggle.

/******************************Lantern*******************************/

/obj/item/flashlight/lantern
	name = "提灯"
	icon_state = "lantern"
	desc = "一盏矿灯。"
	light_range = 6			// luminosity when on
	raillight_compatible = FALSE
