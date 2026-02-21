/obj/machinery/computer/pod
	name = "吊舱发射控制"
	desc = "一个用于发射吊舱的控制台。有些人更喜欢发射机甲。"
	icon_state = "computer"
	screen_overlay = "computer_generic"
	circuit = /obj/item/circuitboard/computer/pod
	var/id = 1
	var/timing = 0
	var/time = 30
	var/title = "Mass Driver Controls"

/obj/machinery/computer/pod/old
	icon_state = "old"
	screen_overlay = "old_screen"
	name = "舱门控制计算机"
	title = "Door Controls"

/obj/machinery/computer/pod/old/syndicate
	name = "ProComp 行政版 IIc"
	desc = "辛迪加预算紧张。操作外部气闸。"
	title = "External Airlock Controls"

/obj/machinery/computer/pod/old/swf
	name = "魔幻系统IV"
	desc = "一件蕴含强大魔力的神秘法器。正在运行 E-Knock 2.2：巫师版。"
