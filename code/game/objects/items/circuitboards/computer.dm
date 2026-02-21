/obj/item/circuitboard/computer


/obj/item/circuitboard/computer/card
	name = "ID 控制台（电脑主板）"
	icon_state = "command"
	build_path = /obj/machinery/computer/marine_card


/obj/item/circuitboard/computer/card/centcom
	name = "中央司令部身份识别控制台（电脑主板）"
	build_path = /obj/item/circuitboard/computer/card/centcom


//TODO: Move these into computer/camera.dm
/obj/item/circuitboard/computer/security
	name = "电路板（监控摄像头显示器）"
	build_path = /obj/machinery/computer/security
	var/network = list("military")
	req_access = list(ACCESS_MARINE_BRIG)
	var/locked = 1

/obj/item/circuitboard/computer/security/construct(obj/machinery/computer/security/C)
	if (..(C))
		C.network = network

/obj/item/circuitboard/computer/security/decon(obj/machinery/computer/security/C)
	if (..(C))
		network = C.network

/obj/item/circuitboard/computer/security/engineering
	name = "电路板（工程监控摄像头）"
	build_path = /obj/machinery/computer/security/engineering
	network = list("Engineering","Power Alarms","Atmosphere Alarms","Fire Alarms")
	req_access = list()
/obj/item/circuitboard/computer/security/mining
	name = "电路板（采矿摄像头监控器）"
	build_path = /obj/machinery/computer/security/mining
	network = list("MINE")
	req_access = list()

/obj/item/circuitboard/computer/cryopodcontrol
	name = "电路板（低温监控控制台）"
	build_path = /obj/machinery/computer/cryopod

/obj/item/circuitboard/computer/med_data
	name = "电路板（医疗记录）"
	build_path = /obj/machinery/computer/med_data

/obj/item/circuitboard/computer/pandemic
	name = "电路板（泛用诊断与紧急医疗智能计算机 2200）"
	build_path = /obj/machinery/computer/pandemic

/obj/item/circuitboard/computer/communications
	name = "电路板（通讯）"
	build_path = /obj/machinery/computer/communications

/obj/item/circuitboard/computer/marine_card
	name = "电路板（身份识别计算机）"
	build_path = /obj/machinery/computer/marine_card

/obj/item/circuitboard/computer/supplycomp
	name = "电路板（补给ASRS计算机）"
	build_path = /obj/machinery/computer/supplycomp

/obj/item/circuitboard/computer/ordercomp
	name = "电路板（补给订购计算机）"
	build_path = /obj/machinery/computer/ordercomp

/obj/item/circuitboard/computer/supplyoverwatch
	name = "电路板（补给监控计算机）"
	build_path = /obj/machinery/computer/camera_advanced/overwatch/req

/obj/item/circuitboard/computer/supplydrop
	name = "电路板（补给目标锁定计算机）"
	build_path = /obj/machinery/computer/supplydrop_console

/obj/item/circuitboard/computer/marine_card/centcom
	name = "电路板（中央司令部身份识别计算机）"
	build_path = /obj/machinery/computer/marine_card/centcom

/obj/item/circuitboard/computer/teleporter
	name = "电路板（传送器）"
	build_path = /obj/machinery/computer/teleporter

/obj/item/circuitboard/computer/secure_data
	name = "电路板（安全记录）"
	build_path = /obj/machinery/computer/secure_data

/obj/item/circuitboard/computer/skills
	name = "电路板（人事档案）"
	build_path = /obj/machinery/computer/skills

/obj/item/circuitboard/computer/stationalert
	name = "电路板（空间站警报）"
	build_path = /obj/machinery/computer/station_alert



/obj/item/circuitboard/computer/air_management
	name = "电路板（大气监测器）"
	build_path = /obj/machinery/computer/general_air_control
	var/frequency = 1439

/obj/item/circuitboard/computer/air_management/tank_control
	name = "电路板（坦克控制）"
	build_path = /obj/machinery/computer/general_air_control/large_tank_control
	frequency = 1441

/obj/item/circuitboard/computer/air_management/supermatter_core
	name = "电路板（核心控制）"
	build_path = /obj/machinery/computer/general_air_control/supermatter_core
	frequency = 1438

/obj/item/circuitboard/computer/air_management/injector_control
	name = "电路板（注射器控制）"
	build_path = /obj/machinery/computer/general_air_control/fuel_injection

/obj/item/circuitboard/computer/air_management/construct(obj/machinery/computer/general_air_control/C)
	if (..(C))
		C.frequency = frequency

/obj/item/circuitboard/computer/air_management/decon(obj/machinery/computer/general_air_control/C)
	if (..(C))
		frequency = C.frequency



/obj/item/circuitboard/computer/atmos_alert
	name = "电路板（大气警报）"
	build_path = /obj/machinery/computer/atmos_alert
/obj/item/circuitboard/computer/pod
	name = "电路板（质量加速器控制）"
	build_path = /obj/machinery/computer/pod
/obj/item/circuitboard/computer/arcade
	name = "电路板（街机）"
	build_path = /obj/machinery/computer/arcade

/obj/item/circuitboard/computer/powermonitor
	name = "电路板（电力监控器）"
	build_path = /obj/machinery/power/monitor
/obj/item/circuitboard/computer/olddoor
	name = "电路板（门禁系统）"
	build_path = /obj/machinery/computer/pod/old
/obj/item/circuitboard/computer/syndicatedoor
	name = "电路板（ProComp Executive）"
	build_path = /obj/machinery/computer/pod/old/syndicate
/obj/item/circuitboard/computer/swfdoor
	name = "电路板（魔法）"
	build_path = /obj/machinery/computer/pod/old/swf
/obj/item/circuitboard/computer/prisoner
	name = "电路板（囚犯管理）"
	build_path = /obj/machinery/computer/prisoner
/obj/item/circuitboard/computer/crew
	name = "电路板（船员监控电脑）"
	build_path = /obj/machinery/computer/crew
/obj/item/circuitboard/computer/operating
	name = "电路板（手术计算机）"
	build_path = /obj/machinery/computer/operating

/obj/item/circuitboard/computer/comm_monitor
	name = "电路板（电信监控器）"
	build_path = /obj/machinery/computer/telecomms/monitor

/obj/item/circuitboard/computer/comm_server
	name = "电路板（电信服务器监控器）"
	build_path = /obj/machinery/computer/telecomms/server



/obj/item/circuitboard/computer/area_atmos
	name = "电路板（区域空气控制）"
	build_path = /obj/machinery/computer/area_atmos


/obj/item/circuitboard/computer/security/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/card/id))
		if(!check_access(I))
			to_chat(user, span_warning("访问被拒绝。"))
			return

		locked = !locked
		to_chat(user, span_notice("You [locked ? "" : "un"]lock the circuit controls."))

	else if(ismultitool(I))
		if(locked)
			to_chat(user, span_warning("电路控制已锁定。"))
			return

		var/existing_networks = jointext(network, ",")
		var/input = strip_html(input(user, "Which networks would you like to connect this camera console circuit to? Seperate networks with a comma. No Spaces!\nFor example: military,Security,Secret ", "Multitool-Circuitboard interface", existing_networks))
		if(!input)
			to_chat(user, "未检测到输入，请挂断后重试。")
			return

		var/list/tempnetwork = splittext(input, ",")
		tempnetwork = difflist(tempnetwork, GLOB.restricted_camera_networks, 1)
		if(!length(tempnetwork))
			to_chat(user, "未找到网络，请挂断后重试。")
			return

		network = tempnetwork

