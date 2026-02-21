/obj/machinery/cell_charger
	name = "重型电池充电器"
	desc = "标准充电器的强化版本，专为动力电池充电而设计。"
	icon = 'icons/obj/power.dmi'
	icon_state = "ccharger0"
	anchored = TRUE
	use_power = IDLE_POWER_USE
	wrenchable = TRUE
	idle_power_usage = 5
	active_power_usage = 40000	//40 kW. (this the power drawn when charging)
	power_channel = EQUIP
	var/obj/item/cell/charging = null
	var/chargelevel = -1

/obj/machinery/cell_charger/proc/updateicon()
	icon_state = "ccharger[charging ? 1 : 0]"

	if(charging && !(machine_stat & (BROKEN|NOPOWER)) )

		var/newlevel = 	round(charging.percent() * 4.0 / 99)
		//to_chat(world, "nl: [newlevel]")

		if(chargelevel != newlevel)

			overlays.Cut()
			overlays += "ccharger-o[newlevel]"

			chargelevel = newlevel
	else
		overlays.Cut()

/obj/machinery/cell_charger/examine(mob/user)
	. = ..()
	. += "There's [charging ? "a" : "no"] cell in the charger."
	if(charging)
		. += "Current charge: [charging.charge]"

/obj/machinery/cell_charger/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(machine_stat & BROKEN)
		return

	if(istype(I, /obj/item/cell) && anchored)
		if(istype(I, /obj/item/cell/night_vision_battery))
			balloon_alert(user, "无法重新充能！")
			return

		if(charging)
			to_chat(user, span_warning("充电器内已装有电池。"))
			return

		var/area/A = loc.loc
		if(!isarea(A))
			return

		if(A.power_equip == 0) // There's no APC in this area, don't try to cheat power!
			to_chat(user, span_warning("[name]在你尝试插入电池时闪烁红光！"))
			return

		if(user.transferItemToLoc(I, src))
			charging = I
			user.visible_message("[user] 将电池插入充电器。", "You insert a cell into the charger.")
			chargelevel = -1
			start_processing()

		updateicon()

	else if(iswrench(I))
		if(charging)
			to_chat(user, span_warning("先把电池拆下来！"))
			return

		anchored = !anchored
		to_chat(user, "You [anchored ? "attach" : "detach"] the cell charger [anchored ? "to" : "from"] the ground")
		playsound(loc, 'sound/items/ratchet.ogg', 25, 1)

/obj/machinery/cell_charger/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(charging)
		usr.put_in_hands(charging)
		charging.update_icon()

		src.charging = null
		user.visible_message("[user] 从充电器中取出了电池。", "You remove the cell from the charger.")
		chargelevel = -1
		updateicon()
		stop_processing()


/obj/machinery/cell_charger/emp_act(severity)
	. = ..()
	if(charging)
		charging.emp_act(severity)


/obj/machinery/cell_charger/process()
	//to_chat(world, "ccpt [charging] [stat]")
	if((machine_stat & (BROKEN|NOPOWER)) || !anchored)
		return

	if (charging && !charging.is_fully_charged())
		charging.give(active_power_usage*GLOB.CELLRATE)

		updateicon()
