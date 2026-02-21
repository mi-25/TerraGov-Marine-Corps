/obj/item/cell
	name = "能量电池"
	desc = "可充电电化学电池。"
	icon = 'icons/obj/power.dmi'
	icon_state = "cell"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/cells_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/cells_right.dmi',
	)
	worn_icon_state = "cell"
	force = 5
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL
	/// note %age conveted to actual charge in New
	var/charge = 0
	/// maximum amount of charge the cell can hold
	var/maxcharge = 1000
	/// BOOL, true if rigged to explode
	var/rigged = FALSE
	///If not 100% reliable, it will build up faults.
	var/minor_fault = 0
	/// BOOL, If true, the cell will recharge itself.
	var/self_recharge = FALSE
	/// How much power to give, if self_recharge is true. The number is in absolute cell charge, as it gets divided by CELLRATE later.
	var/charge_amount = 25
	/// A tracker for use in self-charging
	var/last_use = 0
	/// How long it takes for the cell to start recharging after last use
	var/charge_delay = 0
	///used to track what set of overlays to use to display charge level
	var/charge_overlay = "cell"

/obj/item/cell/Initialize(mapload)
	. = ..()
	charge = maxcharge
	if(self_recharge)
		START_PROCESSING(SSobj, src)

	update_appearance(UPDATE_ICON)

/obj/item/cell/Destroy()
	if(self_recharge)
		STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/cell/process()
	if(self_recharge)
		if(world.time >= last_use + charge_delay)
			give(charge_amount)
			update_appearance(UPDATE_ICON)
			SEND_SIGNAL(src, COMSIG_CELL_SELF_RECHARGE, charge_amount)
	else
		return PROCESS_KILL

/obj/item/cell/update_overlays()
	. = ..()
	if(charge < 0.01 || !charge_overlay)
		return
	var/remaining = CEILING((charge / max(maxcharge, 1)) * 100, 25)
	. += "[charge_overlay]_[remaining]"

/obj/item/cell/examine(mob/user)
	. = ..()
	if(maxcharge <= 2500)
		. += "The manufacturer's label states this cell has a power rating of [maxcharge], and that you should not swallow it.\nThe charge meter reads [round(src.percent() )]%."
	else
		. += "This power cell has an exciting chrome finish, as it is an uber-capacity cell type! It has a power rating of [maxcharge]!\nThe charge meter reads [round(src.percent() )]%."
	if(rigged)
		if(get_dist(user,src) < 3) //Have to be close to make out the *DANGEROUS* details
			. += span_danger("This power cell looks jury rigged to explode!")

/obj/item/cell/attack_self(mob/user as mob) // todo shitcode fixme
	if(!rigged)
		return ..()

	if(issynth(user) && !CONFIG_GET(flag/allow_synthetic_gun_use))
		to_chat(user, span_warning("你的程序限制使用改装过的能量电池。"))
		return
	log_bomber(user, "primed a rigged", src)
	user.visible_message(span_danger("[user] 正在使 [src] 不稳定；它即将引爆！"),
	span_danger("You destabilize [src]; it will detonate shortly!"))
	var/datum/effect_system/spark_spread/spark_system = new /datum/effect_system/spark_spread()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)
	spark_system.start(src)
	playsound(loc, 'sound/items/welder2.ogg', 25, 1, 6)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.throw_mode_on()
	overlays += mutable_appearance('icons/obj/items/grenade.dmi', "danger", ABOVE_ALL_MOB_LAYER, src)
	spawn(rand(3,50))
		spark_system.start(src)
		explode()

/obj/item/cell/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/reagent_containers/syringe))
		var/obj/item/reagent_containers/syringe/S = I

		if(issynth(user) && !CONFIG_GET(flag/allow_synthetic_gun_use))
			to_chat(user, span_warning("你的程序限制了动力电池的改装。"))
			return

		to_chat(user, "你将溶液注入能量电池。")

		if(S.reagents.has_reagent(/datum/reagent/toxin/phoron, 5))
			rigged = TRUE
		S.reagents.clear_reagents()

	else if(ismultitool(I))
		if(issynth(user) && !CONFIG_GET(flag/allow_synthetic_gun_use))
			to_chat(user, span_warning("你的程序限制了对动力电池的改装。"))
			return
		var/skill = user.skills.getRating(SKILL_ENGINEER)
		var/delay = SKILL_TASK_EASY - (5 + skill * 1.25)

		if(user.do_actions)
			return
		var/obj/effect/overlay/sparks/spark_overlay = new

		if(!rigged)
			if(skill < SKILL_ENGINEER_ENGI) //Field engi skill or better or ya fumble.
				user.visible_message(span_notice("[user] 笨手笨脚地摸索着如何操作 [src]。"),
				span_notice("You fumble around, trying to figure out how to rig [src] to explode."))
				if(!do_after(user, delay, NONE, src, BUSY_ICON_UNSKILLED))
					return

			user.visible_message(span_notice("[user]开始用[I]操作[src]。"),
			span_notice("You begin rigging [src] to detonate with [I]."))
			if(!do_after(user, delay, NONE, src, BUSY_ICON_BUILD))
				return
			rigged = TRUE
			overlays += spark_overlay
			user.visible_message(span_notice("[user]完成了对[src]的[I]操作。"),
			span_notice("You rig [src] to explode on use with [I]."))
		else
			if(skill < SKILL_ENGINEER_ENGI)
				user.visible_message(span_notice("[user] 笨手笨脚地摸索着如何操作 [src]。"),
				span_notice("You fumble around, trying to figure out how to stabilize [src]."))
				var/fumbling_time = SKILL_TASK_EASY
				if(!do_after(user, fumbling_time, NONE, src, BUSY_ICON_UNSKILLED))
					return
				if(prob((SKILL_ENGINEER_PLASTEEL - skill) * 20))
					to_chat(user, "<font color='danger'>在你笨拙地摆弄了几秒钟后，[src]愤怒地嗡嗡作响，仿佛受到了冒犯。你有一种<b>非常</b>不祥的预感。</font>")
					rigged = TRUE
					explode() //Oops. Now you fucked up (or succeeded only too well). Immediate detonation.
			user.visible_message(span_notice("[user]开始用[I]操作[src]。"),
			span_notice("You begin stabilizing [src] with [I] so it won't detonate on use."))
			if(skill > SKILL_ENGINEER_ENGI)
				delay = max(delay - 10, 0)
			if(!do_after(user, delay, NONE, src, BUSY_ICON_BUILD))
				return
			rigged = FALSE
			overlays -= spark_overlay
			user.visible_message(span_notice("[user]完成了用[I]对[src]的操作。"),
			span_notice("You stabilize the [src] with [I]; it will no longer detonate on use."))

/obj/item/cell/emp_act(severity)
	. = ..()
	charge = max(charge - ((maxcharge * 0.5) / severity), 0)
	update_appearance(UPDATE_ICON)

/obj/item/cell/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			qdel(src)
		if(EXPLODE_HEAVY)
			if(prob(50))
				qdel(src)
				return
			if(prob(50))
				corrupt()
		if(EXPLODE_LIGHT)
			if(prob(25))
				qdel(src)
				return
			if(prob(25))
				corrupt()
		if(EXPLODE_WEAK)
			if(prob(25))
				corrupt()

/obj/item/cell/suicide_act(mob/user)
	user.visible_message(span_danger("[user]正在舔舐[src.name]的电极！看起来[user.p_theyre()]想自杀。"))
	return (FIRELOSS)

/obj/item/cell/use(amount) // use power from a cell
	if(rigged && amount > 0)
		explode()
		return FALSE
	last_use = world.time

	if(charge < amount)
		return FALSE
	charge = (charge - amount)
	return TRUE

///Adds power to the cell
/obj/item/cell/proc/give(amount)
	if(rigged && amount > 0)
		explode()
		return FALSE

	if(maxcharge < amount)
		return FALSE
	var/amount_used = min(maxcharge-charge,amount)
	charge += amount_used
	return amount_used

///return % charge of cell
/obj/item/cell/proc/percent()
	return 100 * (charge / maxcharge)

///Returns TRUE if charge is equal to maxcharge
/obj/item/cell/proc/is_fully_charged()
	return charge == maxcharge

///Explodes, scaling with cell charge
/obj/item/cell/proc/explode()

	var/heavy_impact_range = clamp(round(sqrt(charge) * 0.01), 0, 3)
	var/light_impact_range = clamp(round(sqrt(charge) * 0.15), 0, 4)
	var/flash_range = clamp(round(sqrt(charge) * 0.05), -1, 4)

	explosion(src, 0, heavy_impact_range, light_impact_range, 0, flash_range)

	QDEL_IN(src, 1)

///Divides charge and maxcharge, then has a 10% chance to be rigged to explode
/obj/item/cell/proc/corrupt()
	charge /= 2
	maxcharge /= 2
	if(prob(10))
		rigged = TRUE //broken batterys are dangerous

///Returns a number based on the current charge of the power cell
/obj/item/cell/proc/get_electrocute_damage()
	switch(charge)
		if(1000000 to INFINITY)
			return min(rand(50,160),rand(50,160))
		if(200000 to 1000000-1)
			return min(rand(25,80),rand(25,80))
		if(100000 to 200000-1)//Ave powernet
			return min(rand(20,60),rand(20,60))
		if(50000 to 100000-1)
			return min(rand(15,40),rand(15,40))
		if(1000 to 50000-1)
			return min(rand(10,20),rand(10,20))
		else
			return 0

/obj/item/cell/crap
	name = "\improper 纳米传讯品牌可充电AA电池"
	desc = "你无法超越等离子体之巅。" //TOTALLY TRADEMARK INFRINGEMENT
	maxcharge = 500

/obj/item/cell/crap/empty/Initialize(mapload)
	. = ..()
	charge = 0
	update_appearance(UPDATE_ICON)

/obj/item/cell/secborg
	name = "安保机器人可充电D型电池"
	maxcharge = 600	//600 max charge / 100 charge per shot = six shots

/obj/item/cell/secborg/empty/Initialize(mapload)
	. = ..()
	charge = 0
	update_appearance(UPDATE_ICON)

/obj/item/cell/apc
	name = "重型能量电池"
	maxcharge = 5000

/obj/item/cell/high
	name = "高容量能量电池"
	icon_state = "hcell"
	worn_icon_state = "hcell"
	maxcharge = 10000

/obj/item/cell/high/empty/Initialize(mapload)
	. = ..()
	charge = 0
	update_appearance(UPDATE_ICON)

/obj/item/cell/super
	name = "超级容量能量电池"
	icon_state = "scell"
	worn_icon_state = "scell"
	maxcharge = 20000

/obj/item/cell/super/empty/Initialize(mapload)
	. = ..()
	charge = 0
	update_appearance(UPDATE_ICON)

/obj/item/cell/hyper
	name = "超容量能量电池"
	icon_state = "hpcell"
	worn_icon_state = "hpcell"
	maxcharge = 30000

/obj/item/cell/hyper/empty/Initialize(mapload)
	. = ..()
	charge = 0
	update_appearance(UPDATE_ICON)

/obj/item/cell/infinite
	name = "无限容量能量电池！"
	icon_state = "icell"
	worn_icon_state = "icell"
	maxcharge = 30000

/obj/item/cell/infinite/use()
	return TRUE

/obj/item/cell/potato
	name = "土豆电池"
	desc = "一种可充电的淀粉基能量电池。"
	icon = 'icons/obj/power.dmi' //'icons/obj/items/harvest.dmi'
	icon_state = "potato_cell" //"potato_battery"
	charge = 100
	maxcharge = 300
	minor_fault = 1

/obj/item/cell/rtg // todo should kill this subtype
	charge_overlay = null

/obj/item/cell/rtg/small
	name = "充能电池"
	desc = "这是一个微型放射性同位素发电机，可装入 APC，但不适用于激光武器。所需的屏蔽层显著降低了最大容量。"
	icon = 'icons/obj/items/stock_parts.dmi'
	icon_state = "capacitor"
	worn_icon_state = "capacitor"
	maxcharge = 2000
	self_recharge = TRUE
	charge_amount = 25
	charge_delay = 2 SECONDS //One hit on a resin thingy every 8 seconds, or one actual wall every 80 seconds.

/obj/item/cell/rtg/plasma_cutter
	name = "等离子体切割器电池"
	desc = "你不应该看到这个"
	maxcharge = 7500
	self_recharge = TRUE
	charge_amount = 25
	charge_delay = 2 SECONDS //One hit on a resin thingy every 8 seconds, or one actual wall every 80 seconds.

/obj/item/cell/rtg/large
	name = "大型充能电池"
	desc = "这是一个可以安装到 APC 中的放射性同位素发电机，但不适用于激光武器。它温度过高，不易储存，且无法手动充电。"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "trashmelt"
	w_class = WEIGHT_CLASS_HUGE
	maxcharge = 5000
	self_recharge = TRUE
	charge_amount = 50
	charge_delay = 2 SECONDS //One hit on a resin thingy every 4 seconds, or one actual wall every 40 seconds.

/obj/item/cell/mecha
	name = "小型放射性同位素电池"
	desc = "一块巨大的扭曲金属，作为机甲的动力核心。尽管它散发着蓝光，但你最好别去舔它。"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "trashmelt"
	w_class = WEIGHT_CLASS_HUGE
	charge_overlay = null
	self_recharge = TRUE
	maxcharge = 1400
	charge_amount = 150

/obj/item/cell/mecha/medium
	name = "中型放射性同位素电池"
	maxcharge = 650
	charge_amount = 200

/obj/item/cell/night_vision_battery
	name = "夜视仪电池"
	desc = "一种小型、不可充电的专用于夜视镜的电池。"
	icon_state = "night_vision"
	maxcharge = 500
	w_class = WEIGHT_CLASS_TINY
	charge_overlay = ""
