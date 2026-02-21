

/obj/item/mortar_kit/mlrs
	name = "\improper TA-40L 多管火箭发射器系统"
	desc = "一门由乘员手动操作、可牵引的多管火箭发射器系统，由地球政府殖民地海军陆战队使用，旨在通过密集的弹药覆盖区域以累积巨大的火力输出，因此射击时具有较高的散布以实现此目的。仅能以最多16发火箭弹的连射模式开火，总共可容纳32发火箭弹。使用60毫米火箭弹。"
	icon_state = "mlrs"
	max_integrity = 400
	item_flags = IS_DEPLOYABLE|TWOHANDED|DEPLOYED_NO_PICKUP|DEPLOY_ON_INITIALIZE
	w_class = WEIGHT_CLASS_HUGE
	deployable_item = /obj/machinery/deployable/mortar/mlrs

/obj/machinery/deployable/mortar/mlrs //TODO why in the seven hells is this a howitzer child??????
	pixel_x = 0
	anchored = FALSE // You can move this.
	fire_sound = 'sound/weapons/guns/fire/rocket_arty.ogg'
	reload_sound = 'sound/weapons/guns/interact/tat36_reload.ogg'
	fall_sound = 'sound/weapons/guns/misc/rocket_whistle.ogg'
	minimum_range = 25
	allowed_shells = list(
		/obj/item/mortal_shell/rocket/mlrs,
		/obj/item/mortal_shell/rocket/mlrs/gas,
		/obj/item/mortal_shell/rocket/mlrs/incendiary,
		/obj/item/mortal_shell/rocket/mlrs/cloak,
	)
	tally_type = TALLY_ROCKET_ARTY
	cool_off_time = 80 SECONDS
	fire_delay = 0.15 SECONDS
	fire_amount = 16
	reload_time = 0.25 SECONDS
	max_rounds = 32
	offset_per_turfs = 25
	spread = 5
	max_spread = 5

//this checks for box of rockets, otherwise will go to normal attackby for mortars
/obj/machinery/deployable/mortar/mlrs/attackby(obj/item/I, mob/user, params)
	if(firing)
		user.balloon_alert(user, "枪管过热——稍等片刻！")
		return

	if(!istype(I, /obj/item/storage/box/mlrs_rockets))
		return ..()

	var/obj/item/storage/box/rocket_box = I

	//prompt user and ask how many rockets to load
	var/numrockets = tgui_input_number(user, "How many rockets do you wish to load?)", "Quantity to Load", 0, 16, 0)
	if(numrockets < 1 || !can_interact(user))
		return

	//loop that continues loading until a invalid condition is met
	var/rocketsloaded = 0
	while(rocketsloaded < numrockets)
		//verify it has rockets
		if(!istype(rocket_box.contents[1], /obj/item/mortal_shell/rocket/mlrs))
			user.balloon_alert(user, "火箭弹耗尽！")
			return
		var/obj/item/mortal_shell/mortar_shell = rocket_box.contents[1]

		if(length(chamber_items) >= max_rounds)
			user.balloon_alert(user, "装不下了！")
			return

		if(!(mortar_shell.type in allowed_shells))
			user.balloon_alert(user, "这个弹壳不匹配！")
			return

		if(busy)
			user.balloon_alert(user, "其他人正在使用这个！")
			return

		user.visible_message(span_notice("[user]开始将\a [mortar_shell.name]装入[src]。"),
		span_notice("You start loading \a [mortar_shell.name] into [src]."))
		playsound(loc, reload_sound, 50, 1)
		busy = TRUE
		if(!do_after(user, reload_time, NONE, src, BUSY_ICON_HOSTILE))
			busy = FALSE
			return

		busy = FALSE

		user.visible_message(span_notice("[user]将\a [mortar_shell.name]装填入[src]。"),
		span_notice("You load \a [mortar_shell.name] into [src]."))
		chamber_items += mortar_shell

		rocket_box.storage_datum.remove_from_storage(mortar_shell,null,user)
		rocketsloaded++
	user.balloon_alert(user, "右键开火")


/obj/machinery/deployable/mortar/mlrs/AltRightClick(mob/living/user)
	if(!Adjacent(user) || user.lying_angle || user.incapacitated() || !ishuman(user))
		return

	if(!anchored)
		anchored = TRUE
		to_chat(user, span_warning("你已将机枪固定在地面上。它无法被移动。"))
	else
		anchored = FALSE
		to_chat(user, span_warning("你已将机枪从地面解锚。现在可以移动它了。"))
