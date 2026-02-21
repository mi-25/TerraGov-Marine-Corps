/obj/machinery/computer/gravity_control_computer
	name = "重力发生器控制"
	desc = "用于控制局部重力发生器的计算机。仅限合格人员操作。"
	icon = 'icons/obj/machines/computer.dmi'
	icon_state = "computer"
	screen_overlay = "airtunnel0e"
	broken_icon = "computer_blue_broken"
	anchored = TRUE
	density = TRUE


/obj/machinery/gravity_generator
	name = "重力发生器"
	desc = "一种在部署时能产生引力子场的装置。"
	icon = 'icons/obj/singularity.dmi'
	icon_state = "TheSingGen"
	anchored = TRUE
	density = TRUE
	use_power = TRUE
