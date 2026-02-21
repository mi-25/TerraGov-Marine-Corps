// This file contains legacy mapped in objects that should be replaced where possible.

/obj/machinery/computer3
	name = "电脑"
	icon = 'icons/obj/machines/computer3.dmi'
	icon_state = "frame"
	density = TRUE
	anchored = TRUE

/obj/machinery/computer3/powermonitor
	icon_state = "frame-eng"

/obj/machinery/computer3/laptop
	name = "笔记本电脑"
	desc = "一台翻盖便携式电脑。它已打开。"

	icon_state = "laptop"

/obj/machinery/computer3/laptop/secure_data
	icon_state = "laptop"

/obj/machinery/computer3/server
	name = "服务器"
	icon = 'icons/obj/machines/computer3.dmi'
	icon_state = "serverframe"

/obj/machinery/computer3/server/rack
	name = "服务器机架"
	icon_state = "rackframe"

/obj/item/laptop
	name = "笔记本电脑"
	desc = "一台蛤壳式便携计算机。它处于闭合状态。"
	icon = 'icons/obj/machines/computer3.dmi'
	icon_state =  "laptop-closed"
	worn_icon_state =  "laptop-inhand"
	pixel_x = 2
	pixel_y = -3
	w_class = WEIGHT_CLASS_NORMAL

/obj/machinery/lapvend
	name = "笔记本电脑贩售机"
	desc = "一台通用自动售货机。"
	icon = 'icons/obj/machines/vending.dmi'
	icon_state = "robotics"
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	density = TRUE

/obj/structure/computer3frame
	density = TRUE
	anchored = FALSE
	name = "电脑框架"
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "0"

/obj/machinery/computer/atmoscontrol
	name = "\improper 中央大气计算机"
	icon_state = "computer"
	screen_overlay = "computer_generic"
	density = TRUE
	anchored = TRUE

/obj/item/computer3_part
	name = "电脑部件"
	desc = "老天爷啊，这下你可闯祸了"
	gender = PLURAL
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "hdd1"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/computer3_part/storage
	name = "存储设备"
	desc = "用于存储和检索数字信息的设备。"

/obj/item/computer3_part/storage/hdd
	name = "硬盘"
	icon_state = "hdd1"

/obj/item/computer3_part/storage/hdd/big
	name = "大型硬盘"
	icon_state = "hdd2"

/obj/item/clothing/shoes/centcom
	name = "皮鞋"
	desc = "它们看起来打磨得无可挑剔。"
	icon_state = "laceups"
