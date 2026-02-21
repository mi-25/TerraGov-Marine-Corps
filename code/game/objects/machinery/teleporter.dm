/obj/machinery/computer/teleporter
	name = "传送器"
	desc = "用于控制已链接的传送枢纽和站点。"
	icon_state = "computer"
	screen_overlay = "teleport"


/obj/machinery/teleport
	name = "传送"
	icon = 'icons/obj/stationobjs.dmi'
	density = TRUE
	anchored = TRUE


/obj/machinery/teleport/hub
	name = "传送器枢纽"
	desc = "这是传送机器的枢纽。"
	icon_state = "tele0"


/obj/machinery/teleport/station
	name = "空间站"
	desc = "这是空间站传送器。"
	icon_state = "controller"
