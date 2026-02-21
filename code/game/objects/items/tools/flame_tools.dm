
/*
CONTAINS:
CANDLES
MATCHES
CIGARETTES
CIGARS
SMOKING PIPES
CHEAP LIGHTERS
ZIPPO

CIGARETTE PACKETS ARE IN FANCY.DM
*/




/*
	candle, match, lighter
*/


/obj/item/tool/candle
	name = "红色蜡烛"
	desc = "一根蜡烛"
	icon = 'icons/obj/items/candle.dmi'
	icon_state = "candle1"
	worn_icon_state = "candle1"
	w_class = WEIGHT_CLASS_TINY
	light_system = MOVABLE_LIGHT
	light_range = 2
	light_power = 0.6
	light_color = LIGHT_COLOR_FIRE
	var/wax = 800

/obj/item/tool/candle/update_icon_state()
	. = ..()
	if(wax > 150)
		icon_state = "candle[1][heat ? "_lit" : ""]"
	else if(wax > 80)
		icon_state = "candle[2][heat ? "_lit" : ""]"
	else
		icon_state = "candle[3][heat ? "_lit" : ""]"

/obj/item/tool/candle/Destroy()
	if(heat)
		STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/tool/candle/attackby(obj/item/W as obj, mob/user as mob)
	if(iswelder(W))
		var/obj/item/tool/weldingtool/WT = W
		if(WT.isOn()) //Badasses dont get blinded by lighting their candle with a blowtorch
			light("<span class ='notice'>[user] casually lights [src] with [W].</span>")
	else if(W.heat > 400)
		light()
	else
		return ..()

/obj/item/tool/candle/proc/light(flavor_text)
	if(!heat)
		heat = 1000
		if(!flavor_text)
			flavor_text = "<span class ='notice'>[usr] lights [src].</span>"
		visible_message(flavor_text)
		set_light_on(TRUE)
		update_icon()
		START_PROCESSING(SSobj, src)

/obj/item/tool/candle/process()
	if(!heat)
		STOP_PROCESSING(SSobj, src)
		return
	wax--
	if(!wax)
		new/obj/item/trash/candle(src.loc)
		qdel(src)
		return
	update_icon()



/obj/item/tool/candle/attack_self(mob/user as mob)
	if(heat)
		heat = 0
		update_icon()
		set_light(0)
		STOP_PROCESSING(SSobj, src)


///////////
//MATCHES//
///////////
/obj/item/tool/match
	name = "匹配"
	desc = "一根简易火柴，用于点燃精致的烟具。"
	icon = 'icons/obj/items/cigarettes.dmi'
	icon_state = "match_unlit"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/smoking_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/smoking_right.dmi',
	)
	light_system = MOVABLE_LIGHT
	light_range = 2
	light_power = 0.6
	light_color = LIGHT_COLOR_FIRE
	var/burnt = FALSE
	var/smoketime = 5
	w_class = WEIGHT_CLASS_TINY
	attack_verb = list("burns", "singes")

/obj/item/tool/match/process()
	smoketime--
	if(smoketime < 0)
		burn_out()
		return



/obj/item/tool/match/Destroy()
	if(heat)
		STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/tool/match/dropped(mob/user)
	if(heat)
		burn_out(user)
	return ..()

/obj/item/tool/match/proc/light_match()
	if(heat)
		return
	heat = 1000
	damtype = "burn"
	icon_state = "match_lit"
	set_light_on(TRUE)

	START_PROCESSING(SSobj, src)
	update_icon()

/obj/item/tool/match/proc/burn_out(mob/user)
	heat = 0
	burnt = TRUE
	damtype = BRUTE
	icon_state = "match_burnt"
	worn_icon_state = "cigoff"
	set_light_on(FALSE)
	name = "烧焦的火柴"
	desc = "一根火柴。这根火柴已经有些年头了。"
	STOP_PROCESSING(SSobj, src)


//////////////////
//FINE SMOKABLES//
//////////////////
/obj/item/clothing/mask/cigarette
	name = "香烟"
	desc = "一卷烟草和尼古丁。"
	icon_state = "cigoff"
	throw_speed = 0.5
	worn_icon_state = "cigoff"
	w_class = WEIGHT_CLASS_TINY
	armor_protection_flags = NONE
	light_range = 0.1
	light_power = 0.1
	light_color = LIGHT_COLOR_ORANGE
	var/lit = FALSE
	var/icon_on = "cigon"  //Note - these are in masks.dmi not in cigarette.dmi
	var/icon_off = "cigoff"
	var/type_butt = /obj/item/trash/cigbutt
	var/lastHolder = null
	var/smoketime = 300
	var/chem_volume = 30
	var/list/list_reagents = list(/datum/reagent/nicotine = 15)
	/// the quantity that will be transmited each 2 seconds
	var/transquantity = 1
	///Icon_state for mob sprite emissive
	var/emissive_state = "cigon_emissive"

/obj/item/clothing/mask/cigarette/Initialize(mapload)
	. = ..()
	create_reagents(chem_volume, INJECTABLE|NO_REACT, list_reagents) // making the cigarrete a chemical holder with a maximum volume of 30

/obj/item/clothing/mask/cigarette/apply_custom(mutable_appearance/standing, inhands, icon_used, state_used)
	. = ..()
	if(!lit)
		return
	var/mutable_appearance/emissive_overlay = emissive_appearance(icon_used, emissive_state, src)
	standing.overlays.Add(emissive_overlay)

/obj/item/clothing/mask/cigarette/attackby(obj/item/W, mob/user, params)
	if(lit || smoketime <= 0)
		return

	if(iswelder(W))
		var/obj/item/tool/weldingtool/WT = W
		if(WT.isOn())//Badasses dont get blinded while lighting their cig with a blowtorch
			light(span_notice("[user] casually lights the [name] with [W]."))

	else if(istype(W, /obj/item/tool/lighter/zippo))
		var/obj/item/tool/lighter/zippo/Z = W
		if(Z.heat)
			light(span_rose("With a flick of [user.p_their()] wrist, [user] lights their [name] with [W]."))

	else if(istype(W, /obj/item/explosive/grenade/flare/civilian))
		var/obj/item/explosive/grenade/flare/civilian/FL = W
		if(FL.heat)
			light(span_notice("[user] lights [user.p_their()] [name] with [W]."))

	else if(istype(W, /obj/item/explosive/grenade/flare))
		var/obj/item/explosive/grenade/flare/FL2 = W
		if(FL2.heat)
			light(span_notice("[user] lights [user.p_their()] [name] with [W]."))

	else if(istype(W, /obj/item/tool/lighter))
		var/obj/item/tool/lighter/L = W
		if(L.heat)
			light(span_notice("[user] manages to light [user.p_their()] [name] with [W]."))

	else if(istype(W, /obj/item/tool/match))
		var/obj/item/tool/match/M = W
		if(M.heat)
			light(span_notice("[user] lights [user.p_their()] [name] with their [W]."))

	else if(istype(W, /obj/item/weapon/energy/sword))
		var/obj/item/weapon/energy/sword/S = W
		if(S.active)
			light(span_warning("[user] swings [user.p_their()] [W], barely missing [user.p_their()] nose. [user.p_they()] light [user.p_their()] [name] in the process."))

	else if(istype(W, /obj/item/assembly/igniter))
		light(span_notice("[user] fiddles with [W], and manages to light [user.p_their()] [name]."))

	else if(istype(W, /obj/item/weapon/gun/flamer))
		light(span_notice("[user] lights [user.p_their()] [src] with the pilot light of the [W]."))

	else if(istype(W, /obj/item/weapon/gun))
		var/obj/item/weapon/gun/G = W
		if(istype(G, /obj/item/weapon/gun/energy/lasgun))
			var/obj/item/weapon/gun/energy/lasgun/L = G
			if(L.rounds)
				light(span_notice("[user] deftly lights [user.p_their()] [src] with the [L]'s low power setting."))
			else
				to_chat(user, span_warning("你试图用[L]点燃你的[src]，但你的能量电池没电了！"))
		else if(istype(LAZYACCESS(G.attachments_by_slot, ATTACHMENT_SLOT_UNDER), /obj/item/weapon/gun/flamer))
			light(span_notice("[user] lights [user.p_their()] [src] with the underbarrel [LAZYACCESS(G.attachments_by_slot, ATTACHMENT_SLOT_UNDER)]."))

	else if(istype(W, /obj/item/tool/surgery/cautery))
		light(span_notice("[user] lights [user.p_their()] [src] with the [W]."))

	else if(istype(W, /obj/item/clothing/mask/cigarette))
		var/obj/item/clothing/mask/cigarette/C = W
		if(C.lit)
			light(span_notice("[user] lights [user.p_their()] [src] with the [C] after a few attempts."))

	else if(istype(W, /obj/item/tool/candle))
		if(W.heat > 200)
			light(span_notice("[user] lights [user.p_their()] [src] with the [W] after a few attempts."))

	else
		return ..()


/obj/item/clothing/mask/cigarette/afterattack(obj/item/reagent_containers/glass/glass, mob/living/user, proximity)
	. = ..()
	if(!proximity || lit) //can't dip if cigarette is lit
		return
	if(istype(glass))	//you can dip cigarettes into beakers
		if(glass.reagents.trans_to(src, chem_volume))	//if reagents were transfered, show the message
			to_chat(user, span_notice("你将\the [src]浸入\the [glass]。"))
		else			//if not, either the beaker was empty, or the cigarette was full
			if(!glass.reagents.total_volume)
				to_chat(user, span_notice("[glass] 是空的。"))
			else
				to_chat(user, span_notice("[src] 已满。"))

/obj/item/clothing/mask/cigarette/proc/light(flavor_text = null)
	if(lit)
		return

	lit = TRUE
	heat = 1000
	name = "点燃 [name]"
	attack_verb = list("burns", "singes")
	damtype = BURN
	if(reagents.get_reagent_amount(/datum/reagent/toxin/phoron)) // the phoron explodes when exposed to fire
		var/datum/effect_system/reagents_explosion/e = new()
		e.set_up(round(reagents.get_reagent_amount(/datum/reagent/toxin/phoron) * 0.4, 1), get_turf(src))
		e.start()
		qdel(src)
		return
	if(reagents.get_reagent_amount(/datum/reagent/fuel)) // the fuel explodes, too, but much less violently
		var/datum/effect_system/reagents_explosion/e = new()
		e.set_up(round(reagents.get_reagent_amount(/datum/reagent/fuel) * 0.2, 1), get_turf(src))
		e.start()
		qdel(src)
		return
	DISABLE_BITFIELD(reagents.reagent_flags, NO_REACT)
	reagents.handle_reactions()
	icon_state = icon_on
	worn_icon_state = icon_on
	if(flavor_text)
		var/turf/T = get_turf(src)
		T.visible_message(flavor_text)
	if(iscarbon(loc))
		var/mob/living/carbon/C = loc
		if(C.r_hand == src)
			C.update_inv_r_hand()
		else if(C.l_hand == src)
			C.update_inv_l_hand()
		else if(ishuman(loc))
			var/mob/living/carbon/human/H = loc
			if(H.wear_mask == src)
				H.update_inv_wear_mask()
	playsound(src, 'sound/items/cig_light.ogg', 15, 1)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/mask/cigarette/process()
	var/mob/living/M = loc
	if(isliving(loc))
		M.IgniteMob()
	smoketime--
	if(smoketime < 0)
		if(ismob(loc))
			to_chat(M, span_notice("你的[name]熄灭了。"))
			playsound(src, 'sound/items/cig_snuff.ogg', 15, 1)
		die()
		return

	if(reagents?.total_volume)	//	check if it has any reagents at all
		if(iscarbon(loc) && (src == loc:wear_mask)) // if it's in the human/monkey mouth, transfer reagents to the mob //TODO WHAT BAYCODER USED A : UNIRONICALLY
			if(ishuman(loc))
				var/mob/living/carbon/human/H = loc
				if(H.species.species_flags & ROBOTIC_LIMBS)
					return
			var/mob/living/carbon/C = loc

			if(prob(15)) // so it's not an instarape in case of acid
				reagents.reaction(C, INGEST)
			reagents.trans_to(C, transquantity)
		else // else just remove some of the reagents
			reagents.remove_any(REAGENTS_METABOLISM)



/obj/item/clothing/mask/cigarette/attack_self(mob/user)
	if(lit)
		user.visible_message(span_notice("[user]冷静地丢下并踩灭了点燃的[src]，瞬间将其熄灭。"))
		playsound(src, 'sound/items/cig_snuff.ogg', 15, 1)
		die()
	return ..()

/obj/item/clothing/mask/cigarette/attack_obj(obj/target_object, mob/living/user)
	if(lit)
		return ..()
	if(!istype(target_object, /obj/machinery/light))
		return ..()
	var/obj/machinery/light/fixture = target_object
	if(fixture.status != LIGHT_BROKEN || !fixture.has_power())
		return ..()
	light(span_notice("[user] lights [user.p_their()] [src] from the broken light."))
	return TRUE

/obj/item/clothing/mask/cigarette/attack(mob/living/living_target, mob/living/user)
	if(lit)
		return ..()
	if(!living_target.on_fire)
		return ..()
	if(user == living_target)
		light(span_notice("[user] lights [user.p_their()] [src] from their own burning body, that's crazy!"))
	else
		light(span_notice("[user] lights [user.p_their()] [src] from the burning body of [living_target], that's stone cold."))
	return TRUE

/obj/item/clothing/mask/cigarette/attack_turf(turf/target_turf, mob/living/user)
	if(!lit && locate(/obj/fire/flamer) in target_turf.contents)
		light(span_notice("[user] lights [user.p_their()] [src] with the burning ground."))
		return TRUE
	return ..()

/obj/item/clothing/mask/cigarette/proc/die()
	var/turf/T = get_turf(src)
	new type_butt(T)
	if(ismob(loc))
		var/mob/living/M = loc
		M.temporarilyRemoveItemFromInventory(src)	//un-equip it so the overlays can update
		M.update_inv_wear_mask()
	STOP_PROCESSING(SSobj, src)
	qdel(src)

/obj/item/clothing/mask/cigarette/antitox
	name = "神经杀手香烟"
	desc = "一种新型香烟，旨在抵御有毒气体，但仍可能让你感到疲惫。"
	icon_state = "anticigoff"
	worn_icon_state = "anticigoff"
	icon_on = "anticigon"
	smoketime = 30
	chem_volume = 60
	transquantity = 2 // one of each for the whole duration
	list_reagents = list(/datum/reagent/medicine/ryetalyn = 30, /datum/reagent/water = 30)  //some water so it purges the rye too

/obj/item/clothing/mask/cigarette/emergency
	name = "红色同志"
	desc = "一支鲜红色的香烟，上面似乎印着俄文品牌标识。但'RUSSIAN RED'这几个字却清晰可辨。"
	icon_state = "rrcigoff"
	worn_icon_state = "rrcigoff"
	icon_on = "rrcigon"
	smoketime = 10
	transquantity = 1
	list_reagents = list(/datum/reagent/medicine/russian_red = 10)  //same ammount as a pill

/obj/item/clothing/mask/cigarette/bica
	name = "草莓味香烟"
	desc = "红色尖端。侧面印有一个单词：'(BICARIDINE)'。"
	icon_state = "bicacigoff"
	worn_icon_state = "bicacigoff"
	icon_on = "bicacigon"
	smoketime = 30
	transquantity = 5 // one of each for the whole duration
	list_reagents = list(/datum/reagent/medicine/bicaridine = 15)

/obj/item/clothing/mask/cigarette/kelo
	name = "柠檬味香烟"
	desc = "黄色尖端。侧面印有一个单词：'（KELOTANE）'。"
	icon_state = "kelocigoff"
	worn_icon_state = "kelocigoff"
	icon_on = "kelocigon"
	smoketime = 30
	transquantity = 5 // one of each for the whole duration
	list_reagents = list(/datum/reagent/medicine/kelotane = 15)

/obj/item/clothing/mask/cigarette/tram
	name = "罂粟味香烟"
	desc = "地球政府阿片类药物替代品，用水稀释以规避2112年《阿片类药物管制法案》。"
	icon_state = "tramcigoff"
	worn_icon_state = "tramcigoff"
	icon_on = "tramcigon"
	smoketime = 15  //so half a minute
	chem_volume = 60
	transquantity = 2 // one of each for the whole duration
	list_reagents = list(/datum/reagent/medicine/tramadol = 30, /datum/reagent/water = 30)

////////////
// CIGARS //
////////////
/obj/item/clothing/mask/cigarette/cigar
	name = "高级雪茄"
	desc = "一卷棕色的烟草……嗯，你不太确定。这东西可真大！"
	icon_state = "cigaroff"
	icon_on = "cigaron"
	icon_off = "cigaroff"
	type_butt = /obj/item/trash/cigbutt/cigarbutt
	throw_speed = 0.5
	worn_icon_state = "cigaroff"
	smoketime = 1500
	chem_volume = 40
	list_reagents = list(/datum/reagent/nicotine = 10)
	emissive_state = "cigaron_emissive"

/obj/item/clothing/mask/cigarette/cigar/cohiba
	name = "\improper Cohiba Robusto 雪茄"
	desc = "这支雪茄已经无可挑剔了。"
	smoketime = 2000
	chem_volume = 80
	list_reagents = list(/datum/reagent/nicotine = 15)

/obj/item/clothing/mask/cigarette/cigar/havana
	name = "高级哈瓦那雪茄"
	desc = "只有最顶尖的精英才配享用的雪茄。"
	smoketime = 7200
	chem_volume = 50
	list_reagents = list(/datum/reagent/nicotine = 20)

/////////////////
//SMOKING PIPES//
/////////////////
/obj/item/clothing/mask/cigarette/pipe
	name = "烟斗"
	desc = "烟斗，用于吸烟。可能是海泡石之类的材质制成的。"
	icon_state = "pipeoff"
	worn_icon_state = "pipeoff"
	icon_on = "pipeon"  //Note - these are in masks.dmi
	icon_off = "pipeoff"
	smoketime = 400

/obj/item/clothing/mask/cigarette/pipe/process()
	var/turf/location = get_turf(src)
	smoketime--
	if(smoketime < 0)
		new /obj/effect/decal/cleanable/ash(location)
		if(ismob(loc))
			var/mob/living/M = loc
			to_chat(M, span_notice("你的[name]熄灭了，你倒掉了烟灰。"))
			heat = 0
			lit = FALSE
			icon_state = icon_off
			worn_icon_state = icon_off
			M.update_inv_wear_mask(0)
		STOP_PROCESSING(SSobj, src)
		return

/obj/item/clothing/mask/cigarette/pipe/attack_self(mob/user as mob) //Refills the pipe. Can be changed to an attackby later, if loose tobacco is added to vendors or something.
	if(lit)
		user.visible_message(span_notice("[user] 熄灭了 [src]。"))
		heat = 0
		lit = FALSE
		icon_state = icon_off
		worn_icon_state = icon_off
		STOP_PROCESSING(SSobj, src)
		return
	if(smoketime <= 0)
		to_chat(user, span_notice("你给烟斗重新装满了烟草。"))
		smoketime = initial(smoketime)


/obj/item/clothing/mask/cigarette/pipe/cobpipe
	name = "玉米芯烟斗"
	desc = "一种由乡野村民推广开来的尼古丁输送系统，在太空潮人群体中延续至今并保持流行。"
	icon_state = "cobpipeoff"
	worn_icon_state = "cobpipeoff"
	icon_on = "cobpipeon"  //Note - these are in masks.dmi
	icon_off = "cobpipeoff"

/obj/item/clothing/mask/cigarette/pipe/cobpipe/curved
	name = "弯曲的玉米芯烟斗"
	desc = "通常是将军们抽的，或者那些嗜血成性的突击队员……但这款更有格调！"
	icon_state = "curvedcoboff"
	worn_icon_state = "curvedcoboff"
	icon_on = "curvedcobon"  //Note - these are in masks.dmi
	icon_off = "curvedcoboff"

/obj/item/clothing/mask/cigarette/pipe/bonepipe
	name = "欧罗巴骨管"
	desc = "用欧罗巴骨鲸的骨头制成的烟斗。"
	icon_state = "bonepipeoff"
	worn_icon_state = "bonepipeoff"
	icon_on = "bonepipeon"  //Note - these are in masks.dmi
	icon_off = "bonepipeoff"

/////////
//ZIPPO//
/////////
/obj/item/tool/lighter
	name = "廉价打火机"
	desc = "一个便宜到近乎免费的打火机。"
	icon = 'icons/obj/items/cigarettes.dmi'
	icon_state = "lighter-g"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/smoking_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/smoking_right.dmi',
	)
	worn_icon_state = "lighter-g"
	var/icon_on = "lighter-g-on"
	var/icon_off = "lighter-g"
	var/clr = "g"
	light_system = MOVABLE_LIGHT
	light_range = 2
	light_power = 0.6
	light_color = LIGHT_COLOR_FIRE
	w_class = WEIGHT_CLASS_TINY
	throwforce = 4
	atom_flags = CONDUCT
	equip_slot_flags = ITEM_SLOT_BELT
	attack_verb = list("burns", "singes")

/obj/item/tool/lighter/zippo
	name = "\improper 芝宝打火机"
	desc = "打火机。"
	icon_state = "zippo"
	worn_icon_state = "zippo"
	icon_on = "zippoon"
	icon_off = "zippo"

/obj/item/tool/lighter/random/Initialize(mapload)
	. = ..()
	clr = pick("r","c","y","g")
	icon_on = "lighter-[clr]-on"
	icon_off = "lighter-[clr]"
	icon_state = icon_off

/obj/item/tool/lighter/attack_self(mob/living/user)
	if(user.r_hand == src || user.l_hand == src)
		if(!heat)
			heat = 1500
			icon_state = icon_on
			worn_icon_state = icon_on
			if(istype(src, /obj/item/tool/lighter/zippo) )
				user.visible_message(span_rose("[user] 甚至没有停下脚步，以一个流畅的动作翻开并点燃了[src]。"))
				playsound(loc, 'sound/items/zippo_on.ogg', 15, 1)
			else
				if(prob(95))
					user.visible_message(span_notice("尝试了几次后，[user]成功点燃了[src]。"))
				else
					to_chat(user, span_warning("你在点燃打火机时烧到了自己。"))
					if (user.l_hand == src)
						user.apply_damage(2,BURN,"l_hand")
					else
						user.apply_damage(2,BURN,"r_hand")
					user.visible_message(span_notice("尝试了几次后，[user] 终于点燃了 [src]，但 [user.p_they()] 在这个过程中烫伤了 [user.p_their()] 的手指。"))
				playsound(loc, 'sound/items/lighter_on.ogg', 15, 1)
			set_light_on(TRUE)
		else
			turn_off(user, FALSE)
	else
		return ..()

/obj/item/tool/lighter/proc/turn_off(mob/living/bearer, silent = TRUE)
	if(heat)
		heat = 0
		icon_state = icon_off
		worn_icon_state = icon_off
		if(!silent)
			if(istype(src, /obj/item/tool/lighter/zippo) )
				bearer.visible_message("<span class='rose'>你听到一声轻微的咔哒声，[bearer]甚至没看自己在做什么就关掉了[src]。</span>")
				playsound(loc, 'sound/items/zippo_off.ogg', 15, 1)
			else
				bearer.visible_message("<span class='notice'>[bearer] 悄悄关闭了 [src]。</span>")
				playsound(loc, 'sound/items/lighter_off.ogg', 15, 1)
		set_light_on(FALSE)
		return TRUE
	return FALSE

/obj/item/tool/lighter/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!isliving(M))
		return
	M.IgniteMob()
	if(!istype(M, /mob))
		return

	if(istype(M.wear_mask, /obj/item/clothing/mask/cigarette) && user.zone_selected == "mouth" && heat)
		var/obj/item/clothing/mask/cigarette/cig = M.wear_mask
		if(M == user)
			cig.attackby(src, user)
		else
			if(istype(src, /obj/item/tool/lighter/zippo))
				cig.light(span_rose("[user] whips the [name] out and holds it for [M]."))
			else
				cig.light(span_notice("[user] holds the [name] out for [M], and lights the [cig.name]."))
	else
		return ..()
