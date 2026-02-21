/*
* Contains:
* 		Beds
*		Roller beds
*/

/*
* Beds
*/
/obj/structure/bed
	name = "床"
	desc = "一张床垫安放在矩形金属框架上。用于以舒适的方式支撑躺卧者，尤其适用于常规睡眠。古老的技术，但依然实用。"
	icon_state = "bed"
	icon = 'icons/obj/objects.dmi'
	buckle_flags = CAN_BUCKLE|BUCKLE_PREVENTS_PULL
	buckle_lying = 90
	allow_pass_flags = PASS_LOW_STRUCTURE|PASSABLE
	resistance_flags = XENO_DAMAGEABLE
	obj_flags = parent_type::obj_flags|BLOCK_Z_OUT_DOWN|BLOCK_Z_IN_UP
	max_integrity = 40
	hit_sound = 'sound/effects/metalhit.ogg'
	coverage = 10
	var/dropmetal = TRUE
	var/buildstacktype = /obj/item/stack/sheet/metal
	var/buildstackamount = 1
	var/foldabletype //To fold into an item (e.g. roller bed item)
	///pixel x shift to give to the buckled mob
	var/buckling_x = 0
	///pixel y shift to give to the buckled mob. This stacks with the lying down pixel shift when relevant
	var/buckling_y = -2
	var/obj/structure/closet/bodybag/buckled_bodybag
	var/accepts_bodybag = FALSE //Whether you can buckle bodybags to this bed
	var/base_bed_icon //Used by beds that change sprite when something is buckled to them


/obj/structure/bed/nometal
	dropmetal = FALSE

/obj/structure/bed/bunkbed
	name = "双层床"
	icon_state = "bunkbed"

/obj/structure/bed/update_icon_state()
	. = ..()
	if(!base_bed_icon)
		return
	if(LAZYLEN(buckled_mobs) || buckled_bodybag)
		icon_state = "[base_bed_icon]_up"
	else
		icon_state = "[base_bed_icon]_down"

/obj/structure/bed/Destroy()
	if(buckled_bodybag)
		unbuckle_bodybag()
	return ..()


/obj/structure/bed/post_buckle_mob(mob/buckling_mob)
	. = ..()
	buckling_mob.pixel_y = buckling_y
	buckling_mob.pixel_x = buckling_x
	if(base_bed_icon)
		density = TRUE
	update_icon()

/obj/structure/bed/post_unbuckle_mob(mob/buckled_mob)
	. = ..()
	buckled_mob.pixel_y = initial(buckled_mob.pixel_y)
	buckled_mob.pixel_x = initial(buckled_mob.pixel_x)
	if(base_bed_icon)
		density = FALSE
	update_icon()

	if(isliving(buckled_mob)) //Properly update whether we're lying or not
		var/mob/living/unbuckled_target = buckled_mob
		if(HAS_TRAIT(unbuckled_target, TRAIT_FLOORED))
			unbuckled_target.set_lying_angle(pick(90, 270))

/obj/structure/bed/set_glide_size(target = 8)
	. = ..()
	buckled_bodybag?.set_glide_size(target)

//Unsafe proc // TODO I should be using standard buckle code for this
/obj/structure/bed/proc/buckle_bodybag(obj/structure/closet/bodybag/B, mob/user)
	if(buckled_bodybag || buckled)
		return
	B.visible_message(span_notice("[user] 将 [B] 固定到 [src] 上！"))
	B.roller_buckled = src
	B.glide_modifier_flags |= GLIDE_MOD_BUCKLED
	B.forceMove(loc)
	B.setDir(dir)
	B.layer = layer + 0.1
	buckled_bodybag = B
	density = TRUE
	update_icon()
	if(buckling_y)
		buckled_bodybag.pixel_y = buckling_y
	if(B.pulledby)
		B.pulledby.stop_pulling()
	if(pulledby)
		B.set_glide_size(pulledby.glide_size)


/obj/structure/bed/proc/unbuckle_bodybag(mob/user)
	if(!buckled_bodybag)
		return
	buckled_bodybag.layer = initial(buckled_bodybag.layer)
	buckled_bodybag.pixel_y = initial(buckled_bodybag.pixel_y)
	buckled_bodybag.roller_buckled = null
	buckled_bodybag.glide_modifier_flags &= ~GLIDE_MOD_BUCKLED
	buckled_bodybag.reset_glide_size()
	buckled_bodybag = null
	density = FALSE
	update_icon()


//Trying to buckle a mob
/obj/structure/bed/buckle_mob(mob/living/buckling_mob, force = FALSE, check_loc = TRUE, lying_buckle = FALSE, hands_needed = 0, target_hands_needed = 0, silent)
	if(buckled_bodybag)
		return FALSE
	return ..()

/obj/structure/bed/Moved(atom/old_loc, movement_dir, forced, list/old_locs)
	. = ..()
	if(!buckled_bodybag || buckled_bodybag.Move(loc, movement_dir, glide_size))
		return TRUE
	forceMove(buckled_bodybag.loc)
	return FALSE

/obj/structure/bed/roller/CanAllowThrough(atom/movable/mover, turf/target)
	if(mover == buckled_bodybag)
		return TRUE

	return ..()

/obj/structure/bed/roller/attack_hand_alternate(mob/living/user)
	. = ..()
	if(!ishuman(user)) // Keep xenos from toggling the brake
		return

	if(!anchored)
		balloon_alert(user, "刹车已启动")
		anchored = TRUE
	else
		balloon_alert(user, "刹车解除")
		anchored = FALSE

/obj/structure/bed/MouseDrop_T(atom/dropping, mob/user)
	if(accepts_bodybag && !buckled_bodybag && !LAZYLEN(buckled_mobs) && istype(dropping,/obj/structure/closet/bodybag) && ishuman(user))
		var/obj/structure/closet/bodybag/B = dropping
		if(!B.roller_buckled && !B.anchored)
			buckle_bodybag(B, user)
			return TRUE
	else
		return ..()

/obj/structure/bed/MouseDrop(atom/over_object)
	. = ..()
	if(foldabletype && !LAZYLEN(buckled_mobs) && !buckled_bodybag)
		if(ishuman(over_object))
			var/mob/living/carbon/human/H = over_object
			if(H == usr && !H.incapacitated() && Adjacent(H) && in_range(src, over_object))
				var/obj/item/I = new foldabletype(get_turf(src))
				H.put_in_hands(I)
				if(istype(I,/obj/item/roller/medevac)) //We need to preserve key variables like linked beacons and cooldowns.
					var/obj/item/roller/medevac/M = I
					var/obj/structure/bed/medevac_stretcher/B = src
					if(B.last_teleport)
						M.last_teleport = B.last_teleport
						if(world.time < M.last_teleport)
							START_PROCESSING(SSprocessing, M)
							M.update_icon()
					if(B.linked_beacon)
						B.linked_beacon.add_stretcher(M, null, TRUE)
						B.linked_beacon.remove_stretcher(src, null, TRUE)
				qdel(src)

/obj/structure/bed/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			qdel(src)
		if(EXPLODE_HEAVY)
			if(prob(50))
				if(buildstacktype && dropmetal)
					new buildstacktype (loc, buildstackamount)
				qdel(src)
		if(EXPLODE_LIGHT)
			if(prob(5))
				if(buildstacktype && dropmetal)
					new buildstacktype (loc, buildstackamount)
				qdel(src)

/obj/structure/bed/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(iswrench(I))
		if(!buildstacktype)
			return

		playsound(loc, 'sound/items/ratchet.ogg', 25, 1)
		if(dropmetal)
			new buildstacktype(loc, buildstackamount)
		qdel(src)

/obj/structure/bed/grab_interact(obj/item/grab/grab, mob/user, base_damage = 5, is_sharp = FALSE)
	. = ..()
	if(.)
		return
	if(LAZYLEN(buckled_mobs) || buckled_bodybag)
		return
	if(!ismob(grab.grabbed_thing))
		return
	var/mob/grabbed_mob = grab.grabbed_thing
	to_chat(user, span_notice("你将[grabbed_mob]放置在[src]上。"))
	grabbed_mob.forceMove(loc)
	return TRUE

/obj/structure/bed/alien
	icon_state = "abed"

/obj/structure/bed/fancy
	name = "豪华床"
	desc = "极致舒适。"

/obj/structure/bed/psych
	name = "精神病床"
	desc = "献给疯狂之人。"
	icon_state = "psychbed"

/*
* Roller beds
*/
/obj/structure/bed/roller
	name = "担架床"
	desc = "一张基本款带软垫的皮革担架板，安置在小框架上。舒适度欠佳，但能让病患在快速转移时保持躺卧姿势。配有刹车装置，防止病患滑动移位。"
	icon = 'icons/obj/rollerbed.dmi'
	icon_state = "roller_down"
	anchored = FALSE
	buckle_flags = CAN_BUCKLE
	drag_delay = 0 //Pulling something on wheels is easy
	buckling_y = 3
	foldabletype = /obj/item/roller
	accepts_bodybag = TRUE
	base_bed_icon = "roller"


/obj/item/roller
	name = "担架床"
	desc = "一张可折叠携带的滚轮床。"
	icon = 'icons/obj/rollerbed.dmi'
	icon_state = "folded"
	w_class = WEIGHT_CLASS_SMALL //Fits in a backpack
	drag_delay = 1 //Pulling something on wheels is easy
	var/rollertype = /obj/structure/bed/roller

/obj/item/roller/attack_self(mob/user)
	deploy_roller(user, user.loc)

/obj/item/roller/afterattack(atom/target, mob/user, proximity)
	if(!proximity || !isturf(target) || target.density)
		return
	var/turf/target_turf = target
	for(var/atom/atom_to_check AS in target_turf)
		if(atom_to_check.density)
			return
	deploy_roller(user, target_turf)

/obj/item/roller/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/roller_holder) && rollertype == /obj/structure/bed/roller)
		var/obj/item/roller_holder/RH = I
		if(RH.held)
			return

		to_chat(user, span_notice("你捡起了[src]。"))
		forceMove(RH)
		RH.held = src


/obj/item/roller/proc/deploy_roller(mob/user, atom/location)
	var/obj/structure/bed/roller/R = new rollertype(location)
	user.temporarilyRemoveItemFromInventory(src)
	if(istype(R,/obj/structure/bed/medevac_stretcher)) //We need to preserve key variables like linked beacons and cooldowns.
		var/obj/item/roller/medevac/I = src
		var/obj/structure/bed/medevac_stretcher/B = R
		if(I.last_teleport)
			B.last_teleport = I.last_teleport
		if(I.linked_beacon)
			I.linked_beacon.add_stretcher(B, null, TRUE)
			I.linked_beacon.remove_stretcher(I, null, TRUE)
	qdel(src)

/obj/item/roller_holder
	name = "担架架"
	desc = "折叠滚轮床的运输架。"
	icon = 'icons/obj/rollerbed.dmi'
	icon_state = "folded"
	var/obj/item/roller/held

/obj/item/roller_holder/Initialize(mapload)
	. = ..()
	held = new(src)

/obj/item/roller_holder/attack_self(mob/user as mob)

	if(!held)
		to_chat(user, span_warning("枪架是空的。"))
		return

	var/obj/structure/bed/roller/R = new(user.loc)
	to_chat(user, span_notice("你部署了[R]。"))
	qdel(held)
	held = null

////////////////////////////////////////////
			//MEDEVAC STRETCHER
//////////////////////////////////////////////

//List of all activated medevac stretchers
GLOBAL_LIST_EMPTY(activated_medevac_stretchers)

/obj/structure/bed/medevac_stretcher
	name = "医疗后送担架"
	desc = "带有集成信标的医疗后送担架，可通过运输机升降装置快速撤离受伤患者，并配备紧急蓝移传送器，可将患者传送至已链接的信标。可接收患者和裹尸袋。右键点击激活。"
	icon = 'icons/obj/rollerbed.dmi'
	icon_state = "stretcher_down"
	buckling_y = 0
	buildstacktype = null
	foldabletype = /obj/item/roller/medevac
	base_bed_icon = "stretcher"
	accepts_bodybag = TRUE
	resistance_flags = NONE
	var/teleport_timer = null
	var/last_teleport = null
	var/obj/item/medevac_beacon/linked_beacon = null
	var/stretcher_activated
	var/obj/item/radio/headset/mainship/doc/radio
	///A busy var to check if the strecher is already used to send someone to the beacon
	var/busy = FALSE

/obj/structure/bed/medevac_stretcher/Initialize(mapload)
	. = ..()
	radio = new(src)

/obj/structure/bed/medevac_stretcher/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(xeno_attacker.status_flags & INCORPOREAL)
		return FALSE
	if(buckled_bodybag)
		unbuckle_bodybag()
	for(var/m in buckled_mobs)
		user_unbuckle_mob(m, xeno_attacker, TRUE)

/obj/structure/bed/medevac_stretcher/attack_ghost(mob/dead/observer/user)
	. = ..()
	if(!linked_beacon?.loc)
		return
	user.forceMove(get_turf(linked_beacon))

/obj/structure/bed/medevac_stretcher/Destroy()
	QDEL_NULL(radio)
	if(linked_beacon)
		linked_beacon.remove_stretcher(src)
	return ..()

/obj/structure/bed/medevac_stretcher/update_overlays()
	. = ..()

	if(stretcher_activated)
		. += image("beacon_active_[density ? "up":"down"]")

	if(LAZYLEN(buckled_mobs) || buckled_bodybag)
		. += image("icon_state"="stretcher_box","layer"=LYING_MOB_LAYER + 0.1)

/obj/structure/bed/medevac_stretcher/ai_should_stay_buckled(mob/living/carbon/npc)
	return TRUE

/obj/structure/bed/medevac_stretcher/attack_hand_alternate(mob/living/user)
	activate_medevac_teleport(user)

/obj/structure/bed/medevac_stretcher/proc/activate_medevac_teleport(mob/user)
	if(!ishuman(user))
		return

	if(busy)
		return

	if(!linked_beacon)
		playsound(loc,'sound/machines/buzz-two.ogg', 25, FALSE)
		to_chat(user, span_warning("[src]的蓝移引擎未连接至任何医疗后送信标。"))
		return

	if(user.faction != linked_beacon.faction)
		playsound(loc,'sound/machines/buzz-two.ogg', 25, FALSE)
		visible_message(span_warning("[src]的安全装置在位移前启动，因未能检测到正确的识别码。"))
		return

	if(world.time < last_teleport )
		playsound(loc,'sound/machines/buzz-two.ogg', 25, FALSE)
		to_chat(user, span_warning("[src]的蓝移引擎仍在充能中；将在[round(last_teleport - world.time) * 0.1]秒后准备就绪。"))
		return

	if(user in buckled_mobs)
		to_chat(user, span_warning("你被固定在[src]上时无法够到传送启动按钮。"))
		return

	if(!linked_beacon.planted)
		playsound(loc,'sound/machines/buzz-two.ogg', 25, FALSE)
		to_chat(user, span_warning("[src]的蓝移引擎链接医疗后送信标未部署且未激活！"))
		return

	if(!linked_beacon.check_power())
		playsound(loc,'sound/machines/buzz-two.ogg', 25, FALSE)
		to_chat(user, span_warning("[src]的蓝移引擎连接的医疗后送信标未供电。"))
		return

	if(is_centcom_level(linked_beacon.z)) // No. No using teleportation to teleport to the adminzone.
		playsound(loc,'sound/machines/buzz-two.ogg', 25, FALSE)
		to_chat(user, span_warning("[src]的信标超出范围！"))
		return

	user.visible_message(span_warning("[user]激活了[src]的蓝移引擎，使其轰鸣启动。"),
	span_warning("You activate [src]'s bluespace engine, causing it to rev to life."))
	playsound(loc,'sound/mecha/powerup.ogg', 25, FALSE)
	teleport_timer = addtimer(CALLBACK(src, PROC_REF(medevac_teleport), user), MEDEVAC_TELE_DELAY, TIMER_STOPPABLE|TIMER_UNIQUE) //Activate after 5 second delay.
	RegisterSignal(src, COMSIG_MOVABLE_UNBUCKLE, PROC_REF(on_mob_unbuckle))
	busy = TRUE

/obj/structure/bed/medevac_stretcher/proc/on_mob_unbuckle(datum/source, mob/living/buckled_mob, force = FALSE)
	SIGNAL_HANDLER
	busy = FALSE
	UnregisterSignal(src, COMSIG_MOVABLE_UNBUCKLE)
	deltimer(teleport_timer)
	playsound(loc,'sound/machines/buzz-two.ogg', 25, FALSE)
	visible_message(span_warning("[src]的安全装置启动，不再检测到被固定的使用者。"))


/obj/structure/bed/medevac_stretcher/proc/medevac_teleport(mob/user)
	UnregisterSignal(src, COMSIG_MOVABLE_UNBUCKLE)
	busy = FALSE
	if(!linked_beacon || !linked_beacon.check_power() || !linked_beacon.planted) //Beacon has to be planted in a powered area.
		playsound(loc,'sound/machines/buzz-two.ogg', 25, FALSE)
		visible_message(span_warning("[src]的安全装置在位移前启动，因为它未能检测到已通电、已连接且已部署的医疗后送信标。"))
		return
	var/mob/living/M
	if(LAZYLEN(buckled_mobs))
		M = buckled_mobs[1]
	else if(buckled_bodybag)
		M = locate(/mob/living) in buckled_bodybag.contents
	else
		playsound(loc,'sound/machines/buzz-two.ogg', 25, FALSE)
		visible_message(span_warning("[src]的蓝移引擎中止了位移，无法检测到合适的撤离人员。"))
		return
	if(!M) //We need a mob to teleport or no deal
		playsound(loc,'sound/machines/buzz-two.ogg', 25, FALSE)
		visible_message(span_warning("[src]的蓝移引擎中止了位移，无法检测到合适的撤离人员。"))
		return

	if(M.faction != linked_beacon.faction)
		playsound(loc,'sound/machines/buzz-two.ogg', 25, FALSE)
		visible_message(span_warning("[src]的安全装置在位移前启动，因未能检测到正确的识别码。"))
		return

	visible_message(span_notice("<b>[M] 在一阵火花中消失，[src]的蓝移引擎生成了它的置换场。</b>"))
	if(buckled_bodybag)
		var/obj/structure/closet/bodybag/teleported_bodybag = buckled_bodybag
		unbuckle_bodybag()
		teleported_bodybag.forceMove(get_turf(linked_beacon))
	else
		unbuckle_mob(M)
		M.forceMove(get_turf(linked_beacon))

	//Pretty SFX
	var/datum/effect_system/spark_spread/spark_system
	spark_system = new /datum/effect_system/spark_spread()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)
	spark_system.start(src)
	playsound(loc,'sound/effects/phasein.ogg', 50, FALSE)
	var/datum/effect_system/spark_spread/spark_system2
	spark_system2 = new /datum/effect_system/spark_spread()
	spark_system2.set_up(5, 0, linked_beacon)
	spark_system2.attach(linked_beacon)
	spark_system2.start(linked_beacon)
	playsound(linked_beacon.loc,'sound/effects/phasein.ogg', 50, FALSE)

	linked_beacon.medvac_alert(M) //We warn med channel about the mob, not what was teleported.
	last_teleport = world.time + MEDEVAC_COOLDOWN

/obj/structure/bed/medevac_stretcher/attackby(obj/item/I, mob/user, params)
	. = ..()

	if(istype(I, /obj/item/medevac_beacon))
		var/obj/item/medevac_beacon/B = I
		B.add_stretcher(src, user)

	else if(istype(I, /obj/item/healthanalyzer)) //Allows us to use the analyzer on the occupant without taking him out.
		var/mob/living/occupant
		if(LAZYLEN(buckled_mobs))
			occupant = buckled_mobs[1]
		else if(buckled_bodybag)
			occupant = locate(/mob/living) in buckled_bodybag.contents
		var/obj/item/healthanalyzer/J = I
		J.attack(occupant, user)


/obj/structure/bed/medevac_stretcher/proc/medvac_alert(mob/M)
	playsound(loc, 'sound/machines/ping.ogg', 50, FALSE)
	radio.talk_into(src, "Patient [M] has been tele-vaced to medvac beacon at: [get_area(linked_beacon)]. Coordinates: (X: [linked_beacon.x], Y: [linked_beacon.y])", RADIO_CHANNEL_MEDICAL)

/obj/structure/bed/medevac_stretcher/examine(mob/user)
	. = ..()
	var/list/details = list()
	if(linked_beacon)
		details += "It's linked to a beacon located at: [get_area(linked_beacon)]. Coordinates: (X: [linked_beacon.x], Y: [linked_beacon.y]).</br>"

	if(world.time < last_teleport)
		details += "Its bluespace engine is currently recharging. <b>The interface displays: [round(last_teleport - world.time) * 0.1] seconds until it has recharged.</b></br>"

	if(LAZYLEN(buckled_mobs))
		details += "It contains [buckled_mobs[1]].</br>"
	else if(buckled_bodybag)
		var/mob/living/M = locate(/mob/living) in buckled_bodybag.contents
		details += "It contains [M].</br>"

	. += span_notice("[details.Join(" ")]")


/obj/item/roller/medevac
	name = "医疗后送担架"
	desc = "一个可折叠的医疗后送担架，便于携带。可用于将陆战队员瞬间传送到已链接的信标处。别忘了信标！"
	icon_state = "stretcher_folded"
	var/last_teleport = null
	var/obj/item/medevac_beacon/linked_beacon = null
	rollertype = /obj/structure/bed/medevac_stretcher
	///Visual timer for the medevac cooldown
	var/timer_cooldown
	///Who is currently holding onto the medevac roller?
	var/mob/holder

/obj/item/roller/medevac/Destroy()
	STOP_PROCESSING(SSprocessing, src)
	holder = null
	if(linked_beacon)
		linked_beacon.remove_stretcher(src)
	return ..()

/obj/item/roller/medevac/process()
	timer_cooldown = max(last_teleport - world.time, 0)
	if(!timer_cooldown)
		if(holder)
			balloon_alert(holder, "医疗后送已充能")
		playsound(loc,'sound/machines/ping.ogg', 10, FALSE)
		STOP_PROCESSING(SSprocessing, src)
	update_icon()

/obj/item/roller/medevac/attack_self(mob/user)
	deploy_roller(user, user.loc)

/obj/item/roller/medevac/attack_ghost(mob/dead/observer/user)
	. = ..()
	if(!linked_beacon?.loc)
		return
	user.forceMove(get_turf(linked_beacon))

/obj/item/roller/medevac/dropped(mob/user)
	. = ..()
	holder = null
	update_icon()

/obj/item/roller/medevac/pickup(mob/user)
	. = ..()
	holder = user

/obj/item/roller/medevac/examine(mob/user)
	. = ..()
	var/list/details = list()
	if(linked_beacon)
		details += "It's linked to a beacon located at: [get_area(linked_beacon)]. Coordinates: (X: [linked_beacon.x], Y: [linked_beacon.y]).</br>"

	if(world.time < last_teleport)
		details += "[span_warning("It's bluespace engine is currently recharging. The interface estimates: [round(last_teleport - world.time) * 0.1] seconds until it has recharged.")]</br>"

	. += span_notice("[details.Join(" ")]")

/obj/item/roller/medevac/update_overlays()
	. = ..()
	var/display_timer_cooldown = CEILING((timer_cooldown) * 0.1, 1)
	if(isturf(loc) || !display_timer_cooldown)
		return
	var/mutable_appearance/desc = mutable_appearance('icons/misc/12x12.dmi')
	desc.maptext = MAPTEXT("[display_timer_cooldown]s")

	. += desc

/obj/item/roller/medevac/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/medevac_beacon))
		var/obj/item/medevac_beacon/B = I
		B.add_stretcher(src, user)

/obj/item/medevac_beacon
	name = "医疗后送信标"
	desc = "一种专用的传送信标，可与医疗后送担架连接；为担架的置换场提供目标目的地。警告：必须在通电区域才能运作。"
	icon = 'icons/obj/items/beacon.dmi'
	icon_state = "med_0"
	var/planted = FALSE
	var/locked = FALSE
	var/list/obj/item/roller/medevac/linked_beds = list()
	var/list/obj/structure/bed/medevac_stretcher/linked_beds_deployed = list()
	req_one_access = list(ACCESS_MARINE_MEDPREP, ACCESS_MARINE_LEADER, ACCESS_MARINE_MEDBAY)
	var/obj/item/radio/headset/mainship/doc/radio

/obj/item/medevac_beacon/Initialize(mapload)
	. = ..()
	radio = new(src)

/obj/item/medevac_beacon/Destroy()
	QDEL_NULL(radio)
	for(var/obj/item/roller/medevac/rollerbed in linked_beds)
		rollerbed.linked_beacon = null
	for(var/obj/structure/bed/medevac_stretcher/stretcherbed in linked_beds)
		stretcherbed.linked_beacon = null
	linked_beds = null
	linked_beds_deployed = null
	return ..()

/obj/item/medevac_beacon/examine(mob/user)
	. = ..()
	var/list/details = list()
	if(!check_power())
		details += "<b>It's currently unpowered.</b></br>"
	else
		details += "<b>It's currently powered.</b></br>"
	details += "It's currently linked to:</b></br>"
	if(!linked_beds && !linked_beds_deployed)
		details += "<b>No beds detected!</b></br>"
	else
		for(var/obj/structure/bed/medevac_stretcher/stretcherbed in linked_beds_deployed)
			var/turf/bed_turf = get_turf(stretcherbed)
			details += "[world.time < stretcherbed.last_teleport ? "\[[round((stretcherbed.last_teleport - world.time) * 0.1)]s\]" : "\[READY\]"] Deployed medevac stretcher at: X:[bed_turf.x], Y:[bed_turf.y] - \[[get_area(bed_turf)]\]</br>"

		for(var/obj/item/roller/medevac/rollerbed in linked_beds)
			var/turf/bed_turf = get_turf(rollerbed)
			details += "[world.time < rollerbed.last_teleport ? "\[[round((rollerbed.last_teleport - world.time) * 0.1)]s\]" : "\[READY\]"] Medevac roller at: X:[bed_turf.x], Y:[bed_turf.y] \[[get_area(bed_turf)]\]"
			for(var/mob/M in bed_turf.contents)
				if(M.contains(rollerbed))
					details += "- \[<b>[M]</b>\]"
			details += "</br>"

	. += span_notice("[details.Join(" ")]")

/obj/item/medevac_beacon/proc/medvac_alert(mob/M)
	playsound(loc, 'sound/machines/ping.ogg', 50, FALSE)
	radio.talk_into(src, "Patient [M] has been tele-vaced to medvac beacon at: [get_area(src)]. Coordinates: (X: [x], Y: [y])", RADIO_CHANNEL_MEDICAL)

/obj/item/medevac_beacon/attack_self(mob/user)
	if(locked)
		to_chat(user, span_warning("[src]的界面已锁定！现在只有班长、卫生兵或医疗官可以解锁它。"))
		return
	user.drop_held_item()
	anchored = TRUE
	planted = TRUE
	to_chat(user, span_warning("你部署并激活了[src]。"))
	icon_state = "med_1"
	playsound(loc,'sound/machines/ping.ogg', 25, FALSE)
	faction = user.faction

/obj/item/medevac_beacon/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(locked)
		to_chat(user, span_warning("[src]的界面已锁定！现在只有班长、卫生兵或医疗官可以解锁。"))
		return
	if(planted)
		anchored = FALSE
		planted = FALSE
		to_chat(user, span_warning("你取出并关闭了[src]。"))
		icon_state = "med_0"
		playsound(loc,'sound/machines/click.ogg', 25, FALSE)

/obj/item/medevac_beacon/attack_ghost(mob/dead/observer/user)
	. = ..()
	if(!linked_beds && !linked_beds_deployed)
		return
	var/list/obj/destinations = SANITIZE_LIST(linked_beds) + SANITIZE_LIST(linked_beds_deployed)
	var/obj/target
	if(length(linked_beds + linked_beds_deployed) > 1)
		var/list/medevac_assoc = list()
		for(var/obj/destination in destinations)
			var/turf/T = get_turf(destination)
			medevac_assoc["X:[T.x], Y:[T.y] - \[[get_area(destination)]\]"] = destination
		destinations = list()
		for(var/destination in medevac_assoc)
			destinations += destination
		var/input = tgui_input_list(user, "Choose a medevac to teleport to:", "Ghost Medevac teleport", destinations, null, 0)
		if(!input)
			return
		target = medevac_assoc[input]
		if(!input)
			return
	else
		target = destinations[1]
	if(!target || QDELETED(target) || !target.loc)
		return
	user.forceMove(get_turf(target))

/obj/item/medevac_beacon/attackby(obj/item/I, mob/user, params) //Corpsmen can lock their beacons.
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/card/id))
		if(!allowed(user))
			to_chat(user, span_warning("访问被拒绝。"))
			playsound(loc,'sound/machines/buzz-two.ogg', 25, FALSE)
			return
		locked = !locked
		user.visible_message(span_notice("[user] [locked ? "locks" : "unlocks"] [src]'s interface."),
		span_notice("You [locked ? "lock" : "unlock"] [src]'s interface."))
	else if(istype(I, /obj/item/roller/medevac))
		if(locked)
			to_chat(user, span_warning("访问被拒绝。"))
			playsound(loc,'sound/machines/buzz-two.ogg', 25, FALSE)
			return

		add_stretcher(I, user)


/obj/item/medevac_beacon/proc/check_power()
	var/area/A = loc?.loc
	if(!A || !isarea(A))
		return FALSE
	return(A.powered(1))

/// Adds a medevac roller or stretcher to the medevac beacon. Returns TRUE if the beacon is in the linked_beds* list and false if it is not in there.
/obj/item/medevac_beacon/proc/add_stretcher(obj/target_bed, mob/user, silent = FALSE)
	var/obj/item/roller/medevac/rollerbed = target_bed
	if(istype(rollerbed, /obj/item/roller/medevac))
		if(rollerbed in linked_beds)
			if(!silent)
				if(user)
					balloon_alert(user, "已连接！")
				playsound(loc,'sound/machines/buzz-sigh.ogg', 25, FALSE)
			return TRUE
		if(rollerbed.linked_beacon)
			rollerbed.linked_beacon.remove_stretcher(rollerbed)
		linked_beds += rollerbed
		rollerbed.linked_beacon = src
		if(!silent)
			if(user)
				balloon_alert(user, "已链接")
			playsound(loc,'sound/machines/ping.ogg', 25, FALSE)
		return TRUE

	var/obj/structure/bed/medevac_stretcher/stretcherbed = target_bed
	if(istype(stretcherbed, /obj/structure/bed/medevac_stretcher))
		if(stretcherbed in linked_beds_deployed)
			if(!silent)
				if(user)
					balloon_alert(user, "已连接！")
				playsound(loc,'sound/machines/buzz-sigh.ogg', 25, FALSE)
			return TRUE
		if(stretcherbed.linked_beacon)
			stretcherbed.linked_beacon.remove_stretcher(stretcherbed)
		linked_beds_deployed += stretcherbed
		stretcherbed.linked_beacon = src
		if(!silent)
			if(user)
				balloon_alert(user, "已链接")
			playsound(loc,'sound/machines/ping.ogg', 25, FALSE)
		return TRUE

	return	FALSE

/// Removes the stretcher from the linked_beds* list. Returns TRUE if the bed is not linked to the beacon and FALSE otherwise.
/obj/item/medevac_beacon/proc/remove_stretcher(obj/target_bed)
	var/obj/item/roller/medevac/rollerbed = target_bed
	if(rollerbed && (rollerbed in linked_beds) && rollerbed.linked_beacon == src)
		rollerbed.linked_beacon = null
		linked_beds -= rollerbed
		return TRUE
	var/obj/structure/bed/medevac_stretcher/stretcherbed = target_bed
	if(stretcherbed && (stretcherbed in linked_beds_deployed) && stretcherbed.linked_beacon == src)
		stretcherbed.linked_beacon = null
		linked_beds_deployed -= stretcherbed
		return TRUE
	return FALSE


//bedroll
/obj/structure/bed/bedroll
	name = "展开的铺盖卷"
	desc = "适合那些漫长的任务，当无处可睡时，你至少记得带上一样能带来慰藉的东西。"
	icon = 'icons/obj/rollerbed.dmi'
	icon_state = "bedroll_o"
	foldabletype = /obj/item/roller/bedroll
	accepts_bodybag = FALSE
	buildstacktype = null

/obj/item/roller/bedroll
	name = "折叠式铺盖卷"
	desc = "标准配发的USCMC睡袋，服役时间久到你都记不清了。标签上写着使用前要展开，但谁在乎这些条条框框呢，对吧？"
	icon = 'icons/obj/rollerbed.dmi'
	icon_state = "bedroll"
	rollertype = /obj/structure/bed/bedroll

//Hospital Rollers (non foldable)

/obj/structure/bed/roller/hospital
	name = "病床"
	icon = 'icons/obj/rollerbed.dmi'
	icon_state = "bigrollerempty_up"
	foldabletype = null
	base_bed_icon = "bigrollerempty"

/obj/structure/bed/roller/hospital/bloody
	base_bed_icon = "bigrollerbloodempty"

/obj/structure/bed/roller/hospital_empty
	icon_state = "bigrollerempty2_down"
	foldabletype = null

/obj/structure/bed/roller/hospital_empty/bigrollerempty
	icon_state = "bigrollerempty_down"
	buckling_y = 2
	base_bed_icon = "bigrollerempty"

/obj/structure/bed/roller/hospital_empty/bigrollerempty2
	icon_state = "bigrollerempty2_down"
	buckling_y = 2
	base_bed_icon = "bigrollerempty2"

/obj/structure/bed/roller/hospital_empty/bigrollerempty3
	icon_state = "bigrollerempty3_down"
	buckling_y = 2
	base_bed_icon = "bigrollerempty3"

/obj/structure/bed/roller/hospital_empty/bigrollerbloodempty
	icon_state = "bigrollerbloodempty_down"
	buckling_y = 2
	base_bed_icon = "bigrollerbloodempty"

// Hospital divider (not a bed)
/obj/structure/bed/urban/hospital/hospitaldivider
	name = "医院隔帘"
	desc = "医院隔帘，用于保护隐私。"
	icon = 'icons/obj/structures/prop/urban/urbanrandomprops.dmi'
	icon_state = "hospitalcurtain"
	layer = ABOVE_MOB_LAYER
	anchored = TRUE
