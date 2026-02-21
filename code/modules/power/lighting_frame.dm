/obj/machinery/light_construct
	name = "灯架"
	desc = "一个正在建造中的灯具。"
	icon = 'icons/obj/lighting.dmi'
	icon_state = "tube-construct-stage1"
	anchored = TRUE
	layer = FLY_LAYER
	///build stage
	var/stage = 1
	///What kind of bulb its intended for
	var/fixture_type = "tube"
	///Quantity of metal refunded on deconstruction
	var/sheets_refunded = 2

/obj/machinery/light_construct/Initialize(mapload)
	. = ..()
	if(fixture_type == "bulb")
		icon_state = "bulb-construct-stage1"

/obj/machinery/light_construct/examine(mob/user)
	. = ..()
	switch(stage)
		if(1)
			. += "It's an empty frame."
		if(2)
			. += "It's wired."
		if(3)
			. += "The casing is closed."


/obj/machinery/light_construct/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(iswrench(I))
		if(stage == 1)
			playsound(loc, 'sound/items/ratchet.ogg', 25, 1)
			to_chat(user, "你开始拆除[src]。")
			if(!do_after(usr, 30, NONE, src, BUSY_ICON_BUILD))
				return
			new /obj/item/stack/sheet/metal(get_turf(loc), sheets_refunded)
			user.visible_message("[user] 拆解了 [src]。", \
				"You deconstruct [src].", "You hear a noise.")
			playsound(loc, 'sound/items/deconstruct.ogg', 25, 1)
			qdel(src)
		else if(stage == 2)
			to_chat(user, "你得先把电线拆掉。")
			return
		else if(stage == 3)
			to_chat(user, "你得先把外壳拧开。")
			return

	else if(iswirecutter(I))
		if(stage != 2)
			return
		stage = 1
		switch(fixture_type)
			if("tube")
				icon_state = "tube-construct-stage1"
			if("bulb")
				icon_state = "bulb-construct-stage1"
		new /obj/item/stack/cable_coil(get_turf(loc), 1, "red")
		user.visible_message("[user.name] 从 [src] 上拆除了线路。", \
			"You remove the wiring from [src].", "You hear a noise.")
		playsound(loc, 'sound/items/wirecutter.ogg', 25, 1)

	else if(iscablecoil(I))
		var/obj/item/stack/cable_coil/coil = I

		if(stage != 1)
			return

		if(!coil.use(1))
			return

		switch(fixture_type)
			if("tube")
				icon_state = "tube-construct-stage2"
			if("bulb")
				icon_state = "bulb-construct-stage2"
		stage = 2
		user.visible_message("[user] 将电线连接到 [src]。", \
			"You add wires to [src].")

	else if(isscrewdriver(I))
		if(stage != 2)
			return

		switch(fixture_type)
			if("tube")
				icon_state = "tube_empty" //whygod
			if("bulb")
				icon_state = "bulb_empty"

		stage = 3
		user.visible_message("[user] 合上了 [src] 的机匣。", \
			"You close [src]'s casing.", "You hear a noise.")
		playsound(loc, 'sound/items/screwdriver.ogg', 25, 1)

		var/obj/machinery/light/newlight
		switch(fixture_type)
			if("tube")
				newlight = new /obj/machinery/light/built(loc)
			if("bulb")
				newlight = new /obj/machinery/light/small/built(loc)
			else
				qdel(src) //what did you do

		newlight.setDir(dir)
		qdel(src)


/obj/machinery/light_construct/small
	name = "小型灯具框架"
	desc = "一个正在建造的小型照明装置。"
	icon = 'icons/obj/lighting.dmi'
	icon_state = "bulb-construct-stage1"
	anchored = TRUE
	stage = 1
	fixture_type = "bulb"
	sheets_refunded = 1
