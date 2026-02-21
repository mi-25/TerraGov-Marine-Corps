
//########################## CONTRABAND ;3333333333333333333 -Agouri ###################################################

/obj/item/contraband
	name = "违禁品"
	desc = "你大概不该拿着这个。"
	icon = 'icons/obj/contraband.dmi'
	force = 0


/obj/item/contraband/poster
	name = "卷起的海报"
	desc = "这张海报自带自动粘合机制，便于固定在任意垂直表面。"
	icon_state = "rolled_poster"
	var/serial_number = 0


/obj/item/contraband/poster/Initialize(mapload, given_serial)
	. = ..()
	if(!given_serial)
		serial_number = rand(1, length(GLOB.poster_designs))
	else
		serial_number = given_serial
	name += " - No. [serial_number]"

//############################## THE ACTUAL DECALS ###########################

/obj/structure/sign/poster
	name = "海报"
	desc = "一大张太空抗性打印纸。"
	icon = 'icons/obj/contraband.dmi'
	icon_state = "poster_map"
	anchored = TRUE
	base_icon = 'icons/obj/contraband.dmi'

	var/serial_number
	var/ruined = 0


/obj/structure/sign/poster/Initialize(mapload, serial)
	. = ..()

	serial_number = serial

	if(!serial_number)
		serial_number = rand(1, length(GLOB.poster_designs))	//This is for the mappers that want individual posters without having to use rolled posters.

	var/designtype = GLOB.poster_designs[serial_number]
	var/datum/poster/design = new designtype
	name += " - [design.name]"
	desc += " [design.desc]"
	icon_state = design.icon_state // poster[serial_number]

	if(autoplace)
		return
	switch(dir)
		if(NORTH)
			pixel_y = 30
		if(SOUTH)
			pixel_y = -30
		if(EAST)
			pixel_x = 30
		if(WEST)
			pixel_x = -30


/obj/structure/sign/poster/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return
	if(iswirecutter(I))
		playsound(loc, 'sound/items/wirecutter.ogg', 25, 1)
		if(ruined)
			to_chat(user, span_notice("你撕下了海报的残骸。"))
			qdel(src)
		else
			to_chat(user, span_notice("你小心翼翼地从墙上撕下海报。"))
			roll_and_drop(user.loc)


/obj/structure/sign/poster/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(ruined)
		return
	var/temp_loc = user.loc
	switch(tgui_alert(user, "Do I want to rip the poster from the wall?", "You think...", list("Yes","No")))
		if("Yes")
			if(user.loc != temp_loc)
				return
			visible_message(span_warning("[user] 以一次果断的动作撕开了[src]！") )
			playsound(src.loc, 'sound/items/poster_ripped.ogg', 25, 1)
			ruined = 1
			icon_state = "poster_ripped"
			name = "撕碎的海报"
			desc = "你无法辨认海报上原本的印刷内容。它已经损坏了。"
		if("No")
			return

/obj/structure/sign/poster/proc/roll_and_drop(turf/newloc)
	var/obj/item/contraband/poster/P = new(src, serial_number)
	P.loc = newloc
	src.loc = P
	qdel(src)


//separated to reduce code duplication. Moved here for ease of reference and to unclutter r_wall/attackby()
/turf/closed/wall/proc/place_poster(obj/item/contraband/poster/P, mob/user)

	if(!istype(src,/turf/closed/wall))
		to_chat(user, span_warning("你不能把东西放在这里！"))
		return

	var/stuff_on_wall = 0
	for(var/obj/O in contents) //Let's see if it already has a poster on it or too much stuff
		if(istype(O,/obj/structure/sign/poster))
			to_chat(user, span_notice("墙上太杂乱，无法张贴海报！"))
			return
		stuff_on_wall++
		if(stuff_on_wall == 3)
			to_chat(user, span_notice("墙上太乱了，没法贴海报！"))
			return

	to_chat(user, span_notice("你开始将海报贴在墙上..."))

	//declaring D because otherwise if P gets 'deconstructed' we lose our reference to P.resulting_poster
	var/obj/structure/sign/poster/D = new(P.serial_number)

	var/temp_loc = user.loc
	flick("poster_being_set",D)
	D.loc = src
	qdel(P)	//delete it now to cut down on sanity checks afterwards. Agouri's code supports rerolling it anyway
	playsound(D.loc, 'sound/items/poster_being_created.ogg', 25, 1)

	sleep(1.7 SECONDS)
	if(!D)	return

	if(istype(src,/turf/closed/wall) && user && user.loc == temp_loc)//Let's check if everything is still there
		to_chat(user, span_notice("你贴好了海报！"))
	else
		D.roll_and_drop(temp_loc)

/datum/poster
	// Name suffix. Poster - [name]
	var/name=""
	// Description suffix
	var/desc=""
	var/icon_state=""
