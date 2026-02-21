// Constructable SMES version. Based on Coils. Each SMES can hold 6 Coils by default.
// Each coil adds 250kW I/O and 5M capacity.
// This is second version, now subtype of regular SMES.




// SMES itself
/obj/machinery/power/smes/buildable
	var/max_coils = 6 			//30M capacity, 1.5MW input/output when fully upgraded /w default coils
	var/cur_coils = 1 			// Current amount of installed coils
	var/safeties_enabled = TRUE	// If 0 modifications can be done without discharging the SMES, at risk of critical failure.
	var/failing = FALSE			// If 1 critical failure has occured and SMES explosion is imminent.
	resistance_flags = UNACIDABLE|CRUSHER_IMMUNE

/obj/machinery/power/smes/buildable/empty
	charge = 0

/obj/machinery/power/smes/buildable/empty/dist
	name = "殖民地配电SMES"

/obj/machinery/power/smes/buildable/empty/backup
	name = "备用电源 SMES"

/obj/machinery/power/smes/buildable/Initialize(mapload)
	. = ..()
	component_parts = list()
	component_parts += new /obj/item/stack/cable_coil(src,30)
	component_parts += new /obj/item/circuitboard/machine/smes(src)

	// Allows for mapped-in SMESs with larger capacity/IO
	for(var/i = 1, i <= cur_coils, i++)
		component_parts += new /obj/item/stock_parts/smes_coil(src)

	recalc_coils()

/obj/machinery/power/smes/buildable/proc/recalc_coils()
	if ((cur_coils <= max_coils) && (cur_coils >= 1))
		capacity = 0
		input_level_max = 0
		output_level_max = 0
		for(var/obj/item/stock_parts/smes_coil/C in component_parts)
			capacity += C.ChargeCapacity
			input_level_max += C.IOCapacity
			output_level_max += C.IOCapacity
		charge = between(0, charge, capacity)
		return 1
	else
		return 0

	// SMESs store very large amount of power. If someone screws up (ie: Disables safeties and attempts to modify the SMES) very bad things happen.
	// Bad things are based on charge percentage.
	// Possible effects:
	// Sparks - Lets out few sparks, mostly fire hazard if phoron present. Otherwise purely aesthetic.
	// Shock - Depending on intensity harms the user. Insultated Gloves protect against weaker shocks, but strong shock bypasses them.
	// EMP Pulse - Lets out EMP pulse discharge which screws up nearby electronics.
	// Light Overload - X% chance to overload each lighting circuit in connected powernet. APC based.
	// APC Failure - X% chance to destroy APC causing very weak explosion too. Won't cause hull breach or serious harm.
	// SMES Explosion - X% chance to destroy the SMES, in moderate explosion. May cause small hull breach.
/obj/machinery/power/smes/buildable/proc/total_system_failure(intensity = 0, mob/user as mob)
	if (!intensity)
		return

	var/mob/living/carbon/human/h_user = null
	if (!ishuman(user))
		return
	else
		h_user = user


	// Preparations
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	// Check if user has protected gloves.
	var/user_protected = 0
	if(h_user.gloves)
		var/obj/item/clothing/gloves/G = h_user.gloves
		if(G.siemens_coefficient == 0)
			user_protected = 1


	switch (intensity)
		if (0 to 15)
			// Small overcharge
			// Sparks, Weak shock
			s.set_up(2, 1, src)
			s.start()
			if (user_protected && prob(80))
				to_chat(h_user, "一道小电弧差点灼伤你的手。幸好你戴着手套！")
			else
				to_chat(h_user, "小型电弧火花在你触摸[src]时迸发并灼伤了你的手！")
				h_user.adjustFireLoss(rand(5,10))
				h_user.Unconscious(4 SECONDS)
			charge = 0

		if (16 to 35)
			// Medium overcharge
			// Sparks, Medium shock, Weak EMP
			s.set_up(4,1,src)
			s.start()
			if (user_protected && prob(25))
				to_chat(h_user, "中等强度的电弧火花迸发，差点灼伤你的手。幸好你戴着手套！")
			else
				to_chat(h_user, "当你触摸[src]时，中等强度的电火花迸发，严重灼伤了你的手！")
				h_user.adjustFireLoss(rand(10,25))
				h_user.Unconscious(10 SECONDS)
			INVOKE_ASYNC(src, PROC_REF(empulse), loc, 2, 4)
			charge = 0

		if (36 to 60)
			// Strong overcharge
			// Sparks, Strong shock, Strong EMP, 10% light overload. 1% APC failure
			s.set_up(7,1,src)
			s.start()
			if (user_protected)
				to_chat(h_user, "强烈的电弧在你和[src]之间迸发，无视你的手套灼伤了你的手！")
				h_user.adjustFireLoss(rand(25,60))
				h_user.Unconscious(16 SECONDS)
			else
				to_chat(h_user, "强烈的电弧在你和[src]之间迸发，将你击晕了一段时间！")
				h_user.adjustFireLoss(rand(35,75))
				h_user.Unconscious(24 SECONDS)
			INVOKE_ASYNC(src, PROC_REF(empulse), loc, 8, 16)
			charge = 0
			apcs_overload(1, 10)
			visible_message("警告。输出调节器故障。检测到不受控的放电。")

		if (61 to INFINITY)
			// Massive overcharge
			// Sparks, Near - instantkill shock, Strong EMP, 25% light overload, 5% APC failure. 50% of SMES explosion. This is bad.
			s.set_up(10,1,src)
			s.start()
			to_chat(h_user, "巨大的电弧在你和[src]之间迸发。你脑海中最后的念头是'糟了……'")
			// Remember, we have few gigajoules of electricity here.. Turn them into crispy toast.
			h_user.adjustFireLoss(rand(150,195))
			h_user.Unconscious(50 SECONDS)
			INVOKE_ASYNC(src, PROC_REF(empulse), loc, 32, 64)
			charge = 0
			apcs_overload(5, 25)
			visible_message("警告。输出调节器故障。检测到严重不受控放电。")

			if (prob(50))
				visible_message("危险！磁力约束场不稳定！约束场即将失效！")
				failing = 1
				// 30 - 60 seconds and then BAM!
				spawn(rand(300,600))
					if(!failing) // Admin can manually set this var back to 0 to stop overload, for use when griffed.
						update_icon()
						visible_message("磁力约束已稳定。")
						return
					visible_message("危险！磁力约束场失效倒计时 3 ... 2 ... 1 ...")
					explosion(loc, 2, 3, 5, 0, 8, explosion_cause=src)
					// Not sure if this is necessary, but just in case the SMES *somehow* survived..
					qdel(src)



	// Gets powernet APCs and overloads lights or breaks the APC completely, depending on percentages.
/obj/machinery/power/smes/buildable/proc/apcs_overload(failure_chance, overload_chance)
	if (!src.powernet)
		return

	for(var/obj/machinery/power/terminal/T in src.powernet.nodes)
		if(istype(T.master, /obj/machinery/power/apc))
			var/obj/machinery/power/apc/A = T.master
			if (prob(overload_chance))
				A.overload_lighting()
			if (prob(failure_chance))
				A.set_broken()

	// Failing SMES has special icon overlay.
/obj/machinery/power/smes/buildable/update_overlays()
	. = ..()
	if(failing)
		. += image('icons/obj/power.dmi', "smes_crit")

/obj/machinery/power/smes/buildable/attackby(obj/item/I, mob/user, params)
	// No more disassembling of overloaded SMESs. You broke it, now enjoy the consequences.
	if(failing)
		to_chat(user, span_warning("[src]的屏幕正闪烁着警报。它似乎过载了！现在触碰它可能不是个好主意。"))
		return
	// If parent returned 1:
	// - Hatch is open, so we can modify the SMES
	// - No action was taken in parent function (terminal de/construction atm).
	. = ..()

	if(!.)
		return

	// Charged above 1% and safeties are enabled.
	if((charge > (capacity / 100)) && safeties_enabled && !ismultitool(I))
		to_chat(user, span_warning("[src]的安全电路在充能状态下阻止了修改！"))
		return

	if(outputting || input_attempt)
		to_chat(user, span_warning("先把 [src] 关掉！"))
		return

	// Probability of failure if safety circuit is disabled (in %)
	var/failure_probability = round((charge / capacity) * 100)

	// If failure probability is below 5% it's usually safe to do modifications
	if(failure_probability < 5)
		failure_probability = 0

	// Crowbar - Disassemble the SMES.
	if(iscrowbar(I))
		if(terminal)
			to_chat(user, span_warning("你得先拆解终端机！"))
			return

		playsound(get_turf(src), 'sound/items/crowbar.ogg', 25, 1)
		to_chat(user, span_warning("你开始拆卸[src]！"))

		if(!do_after(user, 10 SECONDS * cur_coils, NONE, src, BUSY_ICON_BUILD)) // More coils = takes longer to disassemble. It's complex so largest one with 5 coils will take 50s
			return

		if(failure_probability && prob(failure_probability))
			total_system_failure(failure_probability, user)
			return

		to_chat(user, span_warning("你已拆解了SMES电池！"))
		var/obj/machinery/constructable_frame/machine_frame/M = new(loc)
		M.state = 2
		M.icon_state = "box_1"
		for(var/obj/O in component_parts)
			O.forceMove(loc)
		qdel(src)

	// Superconducting Magnetic Coil - Upgrade the SMES
	else if(istype(I, /obj/item/stock_parts/smes_coil))
		if(cur_coils >= max_coils)
			to_chat(user, span_warning("你无法向这个SMES单元插入更多线圈！"))
			return

		if(failure_probability && prob(failure_probability))
			total_system_failure(failure_probability, user)
			return

		to_chat(user, "你将线圈安装到SMES单元中！")
		if(!user.transferItemToLoc(I, src))
			return

		cur_coils ++
		component_parts += I
		recalc_coils()

	// Multitool - Toggle the safeties.
	else if(ismultitool(I))
		safeties_enabled = !safeties_enabled
		to_chat(user, span_warning("You [safeties_enabled ? "connected" : "disconnected"] the safety circuit."))
		visible_message("[icon2html(src, viewers(src))] <b>[src]</b> beeps: \"Caution. Safety circuit has been: [safeties_enabled ? "re-enabled" : "disabled. Please excercise caution."]\"")
