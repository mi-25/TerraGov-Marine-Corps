/obj/machinery/door/poddoor/shutters
	name = "\improper 防护板"
	icon = 'icons/obj/doors/rapid_pdoor.dmi'
	icon_state = "shutter"
	power_channel = ENVIRON
	resistance_flags = DROPSHIP_IMMUNE
	base_icon_state = "shutter"

/obj/machinery/door/poddoor/shutters/Initialize(mapload)
	. = ..()
	if(density && closed_layer)
		layer = closed_layer
	else if(!density && open_layer)
		layer = open_layer
	else
		layer = CLOSED_BLASTDOOR_LAYER
	update_icon_state()

/obj/machinery/door/poddoor/shutters/open()
	if(operating)
		return FALSE
	if(!SSticker)
		return FALSE
	if(!operating)
		operating = TRUE
	do_animate("opening")
	icon_state = "[base_icon_state]0"
	playsound(loc, 'sound/machines/shutter.ogg', 25)
	addtimer(CALLBACK(src, PROC_REF(do_open)), 1 SECONDS)
	return TRUE

/obj/machinery/door/poddoor/shutters/proc/do_open()
	density = FALSE
	layer = open_layer
	set_opacity(FALSE)

	if(operating)
		operating = FALSE
	if(autoclose)
		addtimer(CALLBACK(src, PROC_REF(autoclose)), 150)

/obj/machinery/door/poddoor/shutters/close()
	if(operating)
		return
	operating = TRUE
	do_animate("closing")
	icon_state = "[base_icon_state]1"
	layer = closed_layer
	density = TRUE
	if(visible)
		set_opacity(TRUE)
	playsound(loc, 'sound/machines/shutter.ogg', 25)
	addtimer(CALLBACK(src, PROC_REF(do_close)), 1 SECONDS)
	return TRUE

/obj/machinery/door/poddoor/shutters/proc/do_close()
	operating = FALSE


/obj/machinery/door/poddoor/shutters/update_icon_state()
	. = ..()
	if(operating)
		return
	icon_state = "[base_icon_state][density]"


/obj/machinery/door/poddoor/shutters/do_animate(animation)
	switch(animation)
		if("opening")
			flick("[base_icon_state]c0", src)
		if("closing")
			flick("[base_icon_state]c1", src)


/obj/machinery/door/poddoor/shutters/timed_late
	icon = 'icons/obj/doors/mainship/blastdoors_shutters.dmi'
	name = "定时紧急防护板"
	use_power = FALSE


/obj/machinery/door/poddoor/shutters/timed_late/Initialize(mapload)
	RegisterSignals(SSdcs, list(COMSIG_GLOB_OPEN_TIMED_SHUTTERS_LATE, COMSIG_GLOB_OPEN_TIMED_SHUTTERS_CRASH, COMSIG_GLOB_CAMPAIGN_MISSION_STARTED), PROC_REF(open))
	return ..()


/obj/machinery/door/poddoor/shutters/opened
	icon_state = "shutter0"
	density = FALSE
	opacity = FALSE
	layer = BLASTDOOR_LAYER

/obj/machinery/door/poddoor/shutters/opened/medbay
	name = "医疗区封锁闸门"
	id = "Medbay"

/obj/machinery/door/poddoor/shutters/opened/wy
	id = "wyoffice"

/obj/machinery/door/poddoor/shutters/mainship
	icon = 'icons/obj/doors/mainship/blastdoors_shutters.dmi'
	icon_state = "shutter"
	openspeed = 4 //shorter open animation.

/obj/machinery/door/poddoor/shutters/mainship/thunderdome/one
	name = "雷霆穹顶防爆门"
	id = "thunderdome1"
	resistance_flags = RESIST_ALL


/obj/machinery/door/poddoor/shutters/mainship/thunderdome/two
	name = "雷霆穹顶防爆门"
	id = "thunderdome2"
	resistance_flags = RESIST_ALL

//transit shutters used by marine dropships
/obj/machinery/door/poddoor/shutters/transit
	name = "运输舱门"
	desc = "安全百叶窗，用于防止飞行期间发生危险减压"
	icon = 'icons/obj/doors/mainship/blastdoors_shutters.dmi'
	resistance_flags = RESIST_ALL|DROPSHIP_IMMUNE
	id = "ghhjmugggggtgggbg" // do not have any button or thing have an ID assigned to this, it is a very bad idea.
	smoothing_groups = list(SMOOTH_GROUP_SURVIVAL_TITANIUM_WALLS)


/obj/machinery/door/poddoor/shutters/mainship/open
	density = FALSE
	opacity = FALSE
	layer = BLASTDOOR_LAYER
	icon_state = "shutter0"

/obj/machinery/door/poddoor/shutters/mainship/selfdestruct
	name = "自毁锁定"
	id = "sd_lockdown"
	resistance_flags = RESIST_ALL

/obj/machinery/door/poddoor/shutters/mainship/selfdestruct/Initialize(mapload)
	. = ..()
	RegisterSignal(SSsecurity_level, COMSIG_SECURITY_LEVEL_CHANGED, PROC_REF(on_alert_change))

/// Called when [COMSIG_SECURITY_LEVEL_CHANGED] sends a signal, opens the shutters if the sec level is an "emergency" level
/obj/machinery/door/poddoor/shutters/mainship/selfdestruct/proc/on_alert_change(datum/source, datum/security_level/next_level, datum/security_level/previous_level)
	SIGNAL_HANDLER
	if(!(next_level.sec_level_flags & SEC_LEVEL_FLAG_STATE_OF_EMERGENCY))
		return
	open()

/obj/machinery/door/poddoor/shutters/mainship/open/hangar
	name = "\improper 机库舱门"
	id = "hangar_shutters"

/obj/machinery/door/poddoor/shutters/mainship/open/checkpoint
	name = "检查点闸门"


/obj/machinery/door/poddoor/shutters/mainship/open/checkpoint/north
	id = "northcheckpoint"


/obj/machinery/door/poddoor/shutters/mainship/open/checkpoint/south
	id = "southcheckpoint"

/obj/machinery/door/poddoor/shutters/mainship/open/medical
	name = "医疗区封锁闸门"
	id = "medbay_lockdown"

/obj/machinery/door/poddoor/shutters/mainship/open/indestructible
	resistance_flags = RESIST_ALL|DROPSHIP_IMMUNE


/obj/machinery/door/poddoor/shutters/transit/open
	density = FALSE
	opacity = FALSE
	layer = BLASTDOOR_LAYER
	icon_state = "shutter0"

/obj/machinery/door/poddoor/shutters/barren
	resistance_flags = UNACIDABLE|DROPSHIP_IMMUNE

/obj/machinery/door/poddoor/shutters/mainship/pressure
	name = "压力闸门"
	density = FALSE
	opacity = FALSE
	resistance_flags = RESIST_ALL|DROPSHIP_IMMUNE
	open_layer = CLOSED_BLASTDOOR_LAYER
	closed_layer = CLOSED_BLASTDOOR_LAYER

/obj/machinery/door/poddoor/shutters/tadpole_cockpit
	name = "压力闸门"
	density = FALSE
	opacity = FALSE
	open_layer = CLOSED_BLASTDOOR_LAYER
	closed_layer = CLOSED_BLASTDOOR_LAYER

//mainship shutters
/obj/machinery/door/poddoor/shutters/mainship/hangar
	name = "\improper 机库舱门"
	id = "hangar_shutters"

/obj/machinery/door/poddoor/shutters/mainship/hangar/fuel
	name = "\improper 固体燃料储存区"
	id = "solid_fuel"

/obj/machinery/door/poddoor/shutters/mainship/req
	name = "\improper 补给舱门关闭"

/obj/machinery/door/poddoor/shutters/mainship/req/ro
	name = "\improper 补给线"
	id = "ROlobby"
/obj/machinery/door/poddoor/shutters/mainship/req/ro1
	name = "\improper 补给线 1"
	id = "ROlobby1"

/obj/machinery/door/poddoor/shutters/mainship/req/ro2
	name = "\improper 补给线 2"
	id = "ROlobby2"

/obj/machinery/door/poddoor/shutters/mainship/containment
	name = "\improper 收容单元"
	id = "containmentcell"

/obj/machinery/door/poddoor/shutters/mainship/containment/cell1
	name = "\improper 收容单元 1"
	id = "containmentcell_1"

/obj/machinery/door/poddoor/shutters/mainship/containment/cell2
	name = "\improper 收容单元 2"
	id = "containmentcell_2"

/obj/machinery/door/poddoor/shutters/mainship/brigarmory
	name = "\improper 禁闭室军械库百叶窗"
	id = "brig_armory"

/obj/machinery/door/poddoor/shutters/mainship/cic
	name = "\improper 指挥中心防护板"

/obj/machinery/door/poddoor/shutters/mainship/cic/armory
	name = "\improper 军械库百叶窗"
	id = "cic_armory"

/obj/machinery/door/poddoor/shutters/mainship/engineering/armory
	name = "\improper 工程军械库闸门"
	id = "engi_armory"

/obj/machinery/door/poddoor/shutters/mainship/corporate
	name = "\improper 隐私遮板"
	id = "cl_shutters"

/obj/machinery/door/poddoor/shutters/mainship/fc_office
	name = "\improper 隐私遮板"
	id = "fc_shutters"

/obj/machinery/door/poddoor/shutters/mainship/cell
	name = "\improper 收容单元"
	id = "Containment Cell"

/obj/machinery/door/poddoor/shutters/mainship/cell/cell1
	name = "\improper 收容单元 1"
	id = "Containment Cell 1"

/obj/machinery/door/poddoor/shutters/mainship/cell/cell2
	name = "\improper 收容单元 2"
	id = "Containment Cell 2"

/// urban shutters
/obj/machinery/door/poddoor/shutters/urban
	icon = 'icons/obj/structures/prop/urban/urbanshutters.dmi'
	icon_state = "almayer_pdoor"
	base_icon_state = "almayer_pdoor"
	desc = "这是一个百叶窗。你可以用<B>撬棍</B>或<B>爪子</B><B>打开</B>它。"
	openspeed = 4
	///how long it takes xenos to open a shutter by hand
	var/lift_time = 10 SECONDS
	soft_armor = list(MELEE = 50, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 15, BIO = 50, FIRE = 50, ACID = 50)

/obj/machinery/door/poddoor/shutters/urban/attackby(obj/item/attacking_item, mob/user, params)
	. = ..()
	if(iscrowbar(attacking_item))
		user.balloon_alert(user, "抬起[src]...")
		if(!do_after(user, 15 SECONDS, NONE, src, BUSY_ICON_FRIENDLY))
			return
		balloon_alert_to_viewers("抬起[src]")
		open()

/obj/machinery/door/poddoor/shutters/urban/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(xeno_attacker.a_intent != INTENT_HELP)
		xeno_attacker.balloon_alert(xeno_attacker, "抬起[src]...")
		if(!xeno_attacker.mob_size == MOB_SIZE_BIG)
			if(!do_after(xeno_attacker, lift_time, NONE, src,  BUSY_ICON_HOSTILE))
				return
		else
			if(!do_after(xeno_attacker, 5 SECONDS, NONE, src, BUSY_ICON_HOSTILE))
				return
		open()
		balloon_alert_to_viewers("举起[src]")

/obj/machinery/door/poddoor/shutters/urban/open_shutters
	icon_state = "almayer_pdoor"
	base_icon_state = "almayer_pdoor"
	opacity = FALSE
	layer = ABOVE_WINDOW_LAYER
	max_integrity = 100
	lift_time = 5 SECONDS
	soft_armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 10, BIO = 30, FIRE = 20, ACID = 20)

/obj/machinery/door/poddoor/shutters/urban/open_shutters/opened
	icon_state = "almayer_pdoor0"
	density = FALSE
	opacity = FALSE
	layer = BLASTDOOR_LAYER

/obj/machinery/door/poddoor/shutters/urban/shutters
	icon_state = "shutter"
	layer = ABOVE_WINDOW_LAYER

/obj/machinery/door/poddoor/shutters/urban/shutters/opened
	icon_state = "shutter0"
	base_icon_state = "shutter"
	density = FALSE
	opacity = FALSE
	layer = BLASTDOOR_LAYER

/obj/machinery/door/poddoor/shutters/urban/white
	desc = "这看起来不太好打开。"
	icon_state = "w_almayer_pdoor"
	base_icon_state = "w_almayer_pdoor"

/obj/machinery/door/poddoor/shutters/urban/secure_red_door
	desc = "这看起来不太好打开。"
	icon_state = "pdoor"
	base_icon_state = "pdoor"

/obj/machinery/door/poddoor/shutters/urban/biohazard/white
	icon_state = "w_almayer_pdoor"
	icon = 'icons/obj/structures/prop/urban/urbanshutters.dmi'
	base_icon_state = "w_almayer_pdoor"

/obj/machinery/door/poddoor/shutters/urban/security_lockdown
	icon = 'icons/obj/doors/mainship/blastdoors_shutters.dmi'
	icon_state = "pdoor"
	base_icon_state = "pdoor"
	lift_time = 15 SECONDS
