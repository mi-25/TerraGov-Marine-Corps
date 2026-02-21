#define CONTROL_POD_DOORS 0
#define CONTROL_NORMAL_DOORS 1

/obj/machinery/door_control
	name = "远程门控"
	desc = "它能远程控制门。"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "doorctrl0"
	power_channel = ENVIRON
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 4
	layer = ABOVE_OBJ_LAYER
	mouse_over_pointer = MOUSE_HAND_POINTER

	var/pressed = FALSE
	var/id = null
	var/range = 10
	var/normaldoorcontrol = CONTROL_POD_DOORS
	var/desiredstate = 0 // Zero is closed, 1 is open.
	var/specialfunctions = 1
	var/directional = TRUE //if true we apply directional offsets, if not the door control is free floating

/obj/machinery/door_control/unmeltable
	resistance_flags = RESIST_ALL

/obj/machinery/door_control/ai
	name = "AI锁定"

/obj/machinery/door_control/ai/exterior
	name = "AI外部封锁"
	id = "ailockdownexterior"

/obj/machinery/door_control/ai/interior
	name = "AI内部封锁"
	id = "ailockdowninterior"

/obj/machinery/door_control/Initialize(mapload, ndir = 0)
	. = ..()
	if(directional)
		setDir(ndir)
		pixel_x = ( (dir & 3) ? 0 : (dir == 4 ? -22 : 22) )
		pixel_y = ( (dir & 3) ? (dir == 1 ? -16 : 28) : 0 )
		update_icon()

/obj/machinery/door_control/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return
	if(istype(I, /obj/item/detective_scanner))
		return
	else
		return attack_hand(user)

/obj/machinery/door_control/proc/handle_door()
	for(var/obj/machinery/door/airlock/D in range(range))
		if(D.id_tag == src.id)
			if(specialfunctions & OPEN)
				if (D.density)
					D.open()
				else
					D.close()
			if(desiredstate == 1)
				if(specialfunctions & IDSCAN)
					D.aiDisabledIdScanner = 1
				if(specialfunctions & BOLTS)
					D.lock()
				if(specialfunctions & SHOCK)
					D.secondsElectrified = -1
				if(specialfunctions & SAFE)
					D.safe = 0
			else
				if(specialfunctions & IDSCAN)
					D.aiDisabledIdScanner = 0
				if(specialfunctions & BOLTS)
					if(!D.wires.is_cut(WIRE_BOLTS) && D.hasPower())
						D.unlock()
				if(specialfunctions & SHOCK)
					D.secondsElectrified = 0
				if(specialfunctions & SAFE)
					D.safe = 1

/obj/machinery/door_control/proc/handle_pod()
	SIGNAL_HANDLER
	for(var/obj/machinery/door/poddoor/M in GLOB.machines)
		if(M.id == id)
			if(M.density)
				M.open()
			else
				M.close()

/obj/machinery/door_control/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(istype(user,/mob/living/carbon/xenomorph))
		return
	if(machine_stat & (NOPOWER|BROKEN))
		to_chat(user, span_warning("[src]似乎无法运作。"))
		return

	if(!allowed(user))
		to_chat(user, span_warning("访问被拒绝"))
		if(directional)
			flick("doorctrl-denied",src)
		if(!directional) //nondirectional door controls use the old door denied sprites
			flick("olddoorctrl-denied",src)
		return

	use_power(active_power_usage)
	pressed = TRUE
	update_icon()

	switch(normaldoorcontrol)
		if(CONTROL_NORMAL_DOORS)
			handle_door()
		if(CONTROL_POD_DOORS)
			handle_pod()

	desiredstate = !desiredstate
	addtimer(CALLBACK(src, PROC_REF(unpress)), 15, TIMER_OVERRIDE|TIMER_UNIQUE)


/obj/machinery/door_control/attack_ai(mob/living/silicon/ai/AI)
	return attack_hand(AI)


/obj/machinery/door_control/proc/unpress()
	pressed = FALSE
	update_icon()

/obj/machinery/door_control/update_icon_state()
	. = ..()
	if(machine_stat & NOPOWER)
		icon_state = "doorctrl-p"
	else if(pressed)
		icon_state = "doorctrl1"
	else
		icon_state = "doorctrl0"

/obj/machinery/driver_button/attack_ai(mob/living/silicon/ai/AI)
	return attack_hand(AI)


/obj/machinery/driver_button/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/detective_scanner))
		return
	else
		return attack_hand(user)

/obj/machinery/driver_button/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(machine_stat & (NOPOWER|BROKEN))
		return
	if(active)
		return

	use_power(active_power_usage)

	active = TRUE
	icon_state = "launcheract"

	for(var/obj/machinery/door/poddoor/M in GLOB.machines)
		if(M.id == id)
			M.open()

	sleep(5 SECONDS)

	for(var/obj/machinery/door/poddoor/M in GLOB.machines)
		if(M.id == id)
			M.close()

	icon_state = "launcherbtt"
	active = 0

//mainship door controls
/obj/machinery/door_control/mainship/ammo
	name = "弹药储存"
	id = "ammo2"
	req_one_access = list(ACCESS_MARINE_BRIG, ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_ENGINEERING, ACCESS_MARINE_LEADER, ACCESS_MARINE_BRIDGE, ACCESS_MARINE_DROPSHIP)

/obj/machinery/door_control/mainship/droppod
	name = "空降舱舱室"
	id = "droppod"
	req_one_access = list(ACCESS_MARINE_BRIG, ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_ENGINEERING, ACCESS_MARINE_LEADER, ACCESS_MARINE_BRIDGE, ACCESS_MARINE_DROPSHIP)

/obj/machinery/door_control/mainship/engineering
	req_access = list(ACCESS_MARINE_ENGINEERING)

/obj/machinery/door_control/mainship/medbay
	req_access = list(ACCESS_MARINE_MEDBAY)

/obj/machinery/door_control/mainship/fuel
	name = "固体燃料储存"
	id = "solid_fuel"

/obj/machinery/door_control/mainship/hangar
	name = "机库舱门"
	id = "hangar_shutters"

/obj/machinery/door_control/mainship/research
	name = "医疗研究翼"
	id = "researchdoorext"
	req_access = list(ACCESS_MARINE_RESEARCH)

/obj/machinery/door_control/mainship/research/lockdown
	name = "研究封锁"
	id = "researchlockdownext"

/obj/machinery/door_control/mainship/brigarmory
	name = "禁闭室军械库"
	id = "brig_armory"
	req_access = list(ACCESS_MARINE_BRIG)

/obj/machinery/door_control/mainship/checkpoint
	name = "检查点闸门"
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_BRIG, ACCESS_MARINE_LEADER, ACCESS_MARINE_BRIDGE)

/obj/machinery/door_control/mainship/checkpoint/north
	id = "northcheckpoint"

/obj/machinery/door_control/mainship/checkpoint/south
	id = "southcheckpoint"

/obj/machinery/door_control/mainship/cic
	name = "指挥中心封锁"
	id = "cic_lockdown"
	req_one_access = list(ACCESS_MARINE_BRIDGE)

/obj/machinery/door_control/mainship/cic/armory
	name = "军械库封锁"
	id = "cic_armory"

/obj/machinery/door_control/mainship/cic/hangar
	name = "机库封锁"
	id = "hangar_lockdown"

/obj/machinery/door_control/mainship/mech
	name = "\improper 机甲舱门"
	id = "mech_shutters"
	req_one_access = list(ACCESS_MARINE_MECH)

/obj/machinery/door_control/mainship/vehicle
	name = "\improper 载具舱门"
	id = "vehicle_shutters"
	req_one_access = list(ACCESS_MARINE_ARMORED, ACCESS_MARINE_MECH, ACCESS_MARINE_ARMORED)

/obj/machinery/door_control/mainship/tcomms
	name = "通信室入口"
	id = "tcomms"
	req_one_access = list(ACCESS_MARINE_ENGINEERING, ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_BRIDGE)

/obj/machinery/door_control/mainship/engineering/armory
	name = "工程军械库封锁"
	id = "engi_armory"
	req_one_access = list(ACCESS_MARINE_ENGINEERING, ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_BRIDGE)


/obj/machinery/door_control/mainship/corporate
	name = "隐私护窗"
	id = "cl_shutters"
	req_access = list(ACCESS_NT_CORPORATE)

/obj/machinery/door_control/mainship/fc_shutters
	name = "隐私护窗"
	id = "fc_shutters"
	req_access = list(ACCESS_MARINE_BRIDGE)

/obj/machinery/door_control/mainship/req
	name = "RO 线路防护门"
	id = "ROlobby"
	req_one_access = list(ACCESS_MARINE_CARGO, ACCESS_MARINE_LOGISTICS)

/obj/machinery/door_control/mainship/req/ro1
	name = "1号气闸防护门关闭"
	id = "ROlobby1"

/obj/machinery/door_control/mainship/req/ro2
	name = "二号轨道炮线路护盾关闭"
	id = "ROlobby2"

/obj/machinery/door_control/directional
	name = "自动定向门控制"

/obj/machinery/door_control/directional/unmeltable
	resistance_flags = RESIST_ALL

/obj/machinery/door_control/old //sometimes we need a button that has the appearance of the old button and isn't initialized to an x or y value
	icon_state = "olddoorctrl0"
	directional = FALSE

/obj/machinery/door_control/old/update_icon_state()
	. = ..()
	if(machine_stat & NOPOWER)
		icon_state = "olddoorctrl-p"
	else if(pressed)
		icon_state = "olddoorctrl1"
	else
		icon_state = "olddoorctrl0"

/obj/machinery/door_control/old/req
	name = "RO 线路防护门"
	id = "ROlobby"
	req_one_access = list(ACCESS_MARINE_CARGO, ACCESS_MARINE_LOGISTICS)

/obj/machinery/door_control/old/valhalla
	name = "RO 线路防护门"
	id = "valhalla"

/obj/machinery/door_control/old/cic
	name = "指挥中心封锁"
	id = "cic_lockdown"
	req_one_access = list(ACCESS_MARINE_BRIDGE)

/obj/machinery/door_control/old/cic/hangar
	name = "机库封锁"
	id = "hangar_lockdown"

/obj/machinery/door_control/old/cic/hangar_shutters
	id = "hangar_shutters"
	name = "机库闸门"

/obj/machinery/door_control/old/cic/armory
	name = "军械库封锁"
	id = "cic_armory"

/obj/machinery/door_control/old/medbay
	req_access = list(ACCESS_MARINE_MEDBAY)

/obj/machinery/door_control/old/checkpoint
	name = "检查点闸门"
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_BRIG, ACCESS_MARINE_LEADER, ACCESS_MARINE_BRIDGE)

/obj/machinery/door_control/old/checkpoint/north
	id = "northcheckpoint"

/obj/machinery/door_control/old/checkpoint/south
	id = "southcheckpoint"

/obj/machinery/door_control/old/ai
	id = "AiCoreShutter"

/obj/machinery/door_control/old/unmeltable
	resistance_flags = RESIST_ALL

/obj/machinery/door_control/minidropship
	id = "minidropship_podlock"

/obj/machinery/door_control/minidropship/Initialize()
	. = ..()
	RegisterSignal(SSdcs, COMSIG_GLOB_TADPOLE_SHUTTER, PROC_REF(handle_pod))
