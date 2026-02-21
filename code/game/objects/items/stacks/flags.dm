// Flags.

/obj/item/stack/flag
	name = "阵营"
	desc = "一些彩色旗帜。"
	singular_name = "flag"
	amount = 10
	max_amount = 10
	icon = 'icons/obj/mining.dmi'
	var/upright = 0
	var/base_state

/obj/item/stack/flag/Initialize(mapload)
	. = ..()
	base_state = icon_state

/obj/item/stack/flag/red
	name = "红色警报"
	singular_name = "red flag"
	icon_state = "redflag"

/obj/item/stack/flag/yellow
	name = "黄色旗帜"
	singular_name = "yellow flag"
	icon_state = "yellowflag"

/obj/item/stack/flag/green
	name = "绿色旗帜"
	singular_name = "green flag"
	icon_state = "greenflag"

/obj/item/stack/flag/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(upright && istype(I, type))
		return attack_hand(user)

/obj/item/stack/flag/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(upright)
		upright = 0
		icon_state = base_state
		anchored = FALSE
		src.visible_message("<b>[user]</b> 将 [src] 击倒在地。")

/obj/item/stack/flag/attack_self(mob/user as mob)

	var/obj/item/stack/flag/F = locate() in get_turf(src)

	var/turf/T = get_turf(src)
	if(!T)
		to_chat(user, "旗帜无法在这片地形上竖立。")
		return

	if(F?.upright)
		to_chat(user, "这里已经有一面旗帜了。")
		return

	var/obj/item/stack/flag/newflag = new src.type(T)
	newflag.amount = 1
	newflag.upright = 1
	anchored = TRUE
	newflag.name = newflag.singular_name
	newflag.icon_state = "[newflag.base_state]_open"
	newflag.visible_message("<b>[user]</b> 将 [newflag] 牢牢地插在地上。")
	src.use(1)
