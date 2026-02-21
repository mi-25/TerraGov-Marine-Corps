//Camera only overwatch
/obj/machinery/computer/camera_advanced/overwatch/req
	icon_state = "overwatch_req"
	screen_overlay = "overwatch_req_screen"
	name = "补给监控控制台"
	desc = "补给大哥要求看到金钱流入贪婪的虚空。"
	circuit = /obj/item/circuitboard/computer/supplyoverwatch
	overwatch_title = "Requisition"

/obj/machinery/computer/camera_advanced/overwatch/medical
	screen_overlay = "overwatch_med_screen"
	name = "医疗监控控制台"
	desc = "监控病患是舰上医疗人员的职责之一。只要确保你不会感到无聊就行。"
	req_access = list(ACCESS_MARINE_MEDBAY)
	circuit = /obj/item/circuitboard/computer/supplyoverwatch
	overwatch_title = "Medical"

//Military overwatch
/obj/machinery/computer/camera_advanced/overwatch/military/alpha
	name = "阿尔法监控控制台"

/obj/machinery/computer/camera_advanced/overwatch/military/bravo
	name = "布拉沃监控控制台"

/obj/machinery/computer/camera_advanced/overwatch/military/charlie
	name = "查理监控台"

/obj/machinery/computer/camera_advanced/overwatch/military/delta
	name = "德尔塔监控控制台"

/obj/machinery/computer/camera_advanced/overwatch/military/som
	faction = FACTION_SOM
	icon_state = "som_console"
	screen_overlay = "som_overwatch_emissive"
	light_color = LIGHT_COLOR_FLARE
	networks = list(SOM_CAMERA_NETWORK)
	req_access = list(ACCESS_MARINE_BRIDGE)
	map_flags = MINIMAP_FLAG_MARINE_SOM

/obj/machinery/computer/camera_advanced/overwatch/military/som/zulu
	name = "\improper 祖鲁监控控制台"

/obj/machinery/computer/camera_advanced/overwatch/military/som/yankee
	name = "\improper 扬基监控控制台"

/obj/machinery/computer/camera_advanced/overwatch/military/som/xray
	name = "\improper X射线监控控制台"

/obj/machinery/computer/camera_advanced/overwatch/military/som/whiskey
	name = "\improper 威士忌监控控制台"

/obj/machinery/computer/camera_advanced/overwatch/military/main
	icon_state = "overwatch_main"
	screen_overlay = "overwatch_main_screen"
	name = "主监控控制台"
	desc = "用于通用监控目的的最先进设备。"
	overwatch_title = "Main"

/obj/machinery/computer/camera_advanced/overwatch/military/main/som
	faction = FACTION_SOM
	icon_state = "som_console"
	screen_overlay = "som_main_overwatch_emissive"
	light_color = LIGHT_COLOR_FLARE
	networks = list(SOM_CAMERA_NETWORK)
	req_access = list(ACCESS_MARINE_BRIDGE)
	map_flags = MINIMAP_FLAG_MARINE_SOM
