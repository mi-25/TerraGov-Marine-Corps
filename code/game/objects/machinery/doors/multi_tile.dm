//Terribly sorry for the code doubling, but things go derpy otherwise.
/obj/machinery/door/airlock/multi_tile
	width = 2

/obj/machinery/door/airlock/multi_tile/close() //Nasty as hell O(n^2) code but unfortunately necessary //honestly probably not, TODO fixme
	for(var/turf/T in locs)
		for(var/obj/hitbox/hit in T)
			return FALSE

	return ..()


/obj/machinery/door/airlock/multi_tile/get_weld_spark_icon_and_state()
	if(dir & NORTH|SOUTH)
		return list('icons/effects/welding_effect_multitile_door.dmi', "welding_sparks_vertical")
	else
		return list('icons/effects/welding_effect_multitile_door.dmi', "welding_sparks_horizontal")

///Due to inheritance from parent we need no icon_state, just icon
/obj/machinery/door/airlock/multi_tile/glass
	name = "玻璃气闸门"
	icon = 'icons/obj/doors/Door2x1glass.dmi'
	opacity = FALSE
	glass = TRUE
	assembly_type = /obj/structure/door_assembly/multi_tile


/obj/machinery/door/airlock/multi_tile/security
	name = "安全气闸门"
	icon = 'icons/obj/doors/Door2x1security.dmi'
	opacity = FALSE
	glass = TRUE


/obj/machinery/door/airlock/multi_tile/command
	name = "指挥气闸"
	icon = 'icons/obj/doors/Door2x1command.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/medical
	name = "医疗气闸"
	icon = 'icons/obj/doors/Door2x1medbay.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/engineering
	name = "工程气闸门"
	icon = 'icons/obj/doors/Door2x1engine.dmi'
	opacity = FALSE
	glass = TRUE


/obj/machinery/door/airlock/multi_tile/research
	name = "研究气闸"
	icon = 'icons/obj/doors/Door2x1research.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/secure
	name = "气闸门已锁定"
	icon = 'icons/obj/doors/Door2x1_secure.dmi'
	openspeed = 34

/obj/machinery/door/airlock/multi_tile/secure/indestructible
	name = "气闸门已锁定"
	icon = 'icons/obj/doors/Door2x1_secure.dmi'
	openspeed = 34
	resistance_flags = RESIST_ALL

/obj/machinery/door/airlock/multi_tile/secure2
	name = "气闸门已锁定"
	icon = 'icons/obj/doors/Door2x1_secure2.dmi'
	openspeed = 31
	req_access = null

/obj/machinery/door/airlock/multi_tile/secure2_glass
	name = "气闸门已锁定"
	icon = 'icons/obj/doors/Door2x1_secure2_glass.dmi'
	opacity = FALSE
	glass = TRUE
	openspeed = 31
	req_access = null



// MARINE MAIN SHIP

// GENETIC
/obj/machinery/door/airlock/multi_tile/mainship
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/mainship/comdoor.dmi' //Tiles with is here FOR SAFETY PURPOSES
	openspeed = 4 //shorter open animation.

/obj/machinery/door/airlock/multi_tile/mainship/generic
	name = "\improper 玻璃气闸门"
	icon = 'icons/obj/doors/mainship/2x1generic.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/mainship/generic/noglass
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/mainship/2x1personaldoor.dmi'
	glass = FALSE

/obj/machinery/door/airlock/multi_tile/mainship/generic/canteen
	name = "\improper 水壶"

/obj/machinery/door/airlock/multi_tile/mainship/generic/cryo
	name = "\improper 低温休眠舱"

/obj/machinery/door/airlock/multi_tile/mainship/generic/garden
	name = "\improper 花园"

/obj/machinery/door/airlock/multi_tile/mainship/generic/prep
	name = "\improper 小队准备室"

/obj/machinery/door/airlock/multi_tile/mainship/generic/range
	name = "\improper 射击场"

/obj/machinery/door/airlock/multi_tile/mainship/generic/rnr
	name = "\improper 休息与娱乐"

/obj/machinery/door/airlock/multi_tile/mainship/generic/mechbay
	name = "\improper 机甲驾驶员办公室"

/obj/machinery/door/airlock/multi_tile/mainship/blackgeneric
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/mainship/2x1almayerdoor.dmi'

/obj/machinery/door/airlock/multi_tile/mainship/blackgeneric/glass
	name = "\improper 玻璃气闸门"
	icon = 'icons/obj/doors/mainship/2x1almayerdoor_glass.dmi'
	opacity = FALSE
	glass = TRUE

//PREP DOORS

/obj/machinery/door/airlock/multi_tile/mainship/marine
	name = "\improper 小队整备"
	icon = 'icons/obj/doors/mainship/2x1prepdoor.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/mainship/marine/requisitions
	name = "\improper 补给舱"
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_CARGO)

/obj/machinery/door/airlock/multi_tile/mainship/marine/general/sl
	name = "\improper 班长准备工作"
	req_access = list(ACCESS_MARINE_LEADER)

/obj/machinery/door/airlock/multi_tile/mainship/marine/general/smart
	name = "\improper 智能机枪手准备"
	req_access = list(ACCESS_MARINE_SMARTPREP)

/obj/machinery/door/airlock/multi_tile/mainship/marine/general/corps
	name = "\improper 卫生兵准备工作"
	req_access = list(ACCESS_MARINE_MEDPREP)

/obj/machinery/door/airlock/multi_tile/mainship/marine/general/engi
	name = "\improper 工程兵准备"
	req_access = list(ACCESS_MARINE_ENGPREP)

/obj/machinery/door/airlock/multi_tile/mainship/marine/alpha
	name = "\improper 阿尔法小队准备区"
	icon = 'icons/obj/doors/mainship/2x1prepdoor_alpha.dmi'
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_ALPHA)

/obj/machinery/door/airlock/multi_tile/mainship/marine/alpha/sl
	name = "\improper 阿尔法班班长准备"
	req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_ALPHA)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/alpha/engineer
	name = "\improper 阿尔法班工程兵准备"
	req_access = list(ACCESS_MARINE_ENGPREP, ACCESS_MARINE_ALPHA)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/alpha/medic
	name = "\improper 阿尔法小队医疗准备"
	req_access = list(ACCESS_MARINE_MEDPREP, ACCESS_MARINE_ALPHA)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/alpha/smart
	name = "\improper 阿尔法班智能机枪手准备就绪"
	req_access = list(ACCESS_MARINE_SMARTPREP, ACCESS_MARINE_ALPHA)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/bravo
	name = "\improper 布拉沃小队准备"
	icon = 'icons/obj/doors/mainship/2x1prepdoor_bravo.dmi'
	req_one_access = list(ACCESS_MARINE_LOGISTICS,ACCESS_MARINE_BRAVO)

/obj/machinery/door/airlock/multi_tile/mainship/marine/bravo/sl
	name = "\improper 布拉沃班班长准备"
	req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_BRAVO)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/bravo/engineer
	name = "\improper 布拉沃班工程兵准备"
	req_access = list(ACCESS_MARINE_ENGPREP, ACCESS_MARINE_BRAVO)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/bravo/medic
	name = "\improper 布拉沃班卫生兵准备工作"
	req_access = list(ACCESS_MARINE_MEDPREP, ACCESS_MARINE_BRAVO)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/bravo/smart
	name = "\improper 布拉沃班智能机枪手准备就绪"
	req_access = list(ACCESS_MARINE_SMARTPREP, ACCESS_MARINE_BRAVO)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/charlie
	name = "\improper 查理小队准备区"
	icon = 'icons/obj/doors/mainship/2x1prepdoor_charlie.dmi'
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_CHARLIE)

/obj/machinery/door/airlock/multi_tile/mainship/marine/charlie/sl
	name = "\improper 查理班班长准备"
	req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_CHARLIE)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/charlie/engineer
	name = "\improper 查理班工程兵准备"
	req_access = list(ACCESS_MARINE_ENGPREP, ACCESS_MARINE_CHARLIE)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/charlie/medic
	name = "\improper 查理班卫生兵准备工作"
	req_access = list(ACCESS_MARINE_MEDPREP, ACCESS_MARINE_CHARLIE)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/charlie/smart
	name = "\improper 查理班智能机枪手准备就绪"
	req_access = list(ACCESS_MARINE_SMARTPREP, ACCESS_MARINE_CHARLIE)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/delta
	name = "\improper 德尔塔小队准备区"
	icon = 'icons/obj/doors/mainship/2x1prepdoor_delta.dmi'
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_DELTA)

/obj/machinery/door/airlock/multi_tile/mainship/marine/delta/sl
	name = "\improper 德尔塔班班长准备"
	req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_DELTA)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/delta/engineer
	name = "\improper 德尔塔班工程兵准备"
	req_access = list(ACCESS_MARINE_ENGPREP, ACCESS_MARINE_DELTA)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/delta/medic
	name = "\improper 德尔塔小队医疗准备"
	req_access = list(ACCESS_MARINE_MEDPREP, ACCESS_MARINE_DELTA)
	req_one_access = null

/obj/machinery/door/airlock/multi_tile/mainship/marine/delta/smart
	name = "\improper 德尔塔班智能机枪手准备就绪"
	req_access = list(ACCESS_MARINE_SMARTPREP, ACCESS_MARINE_DELTA)
	req_one_access = null

//MEDICAL
/obj/machinery/door/airlock/multi_tile/mainship/generic/personal
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/mainship/2x1personaldoor.dmi'

/obj/machinery/door/airlock/multi_tile/mainship/medidoor
	name = "\improper 医疗气闸"
	icon = 'icons/obj/doors/mainship/2x1medidoor.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/mainship/personalglass
	name = "\improper 大型气闸门"
	icon = 'icons/obj/doors/mainship/2x1personaldoor_glass.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/mainship/medidoor/medbay
	name = "\improper 医疗湾"
	req_access = list(ACCESS_MARINE_MEDBAY)

/obj/machinery/door/airlock/multi_tile/mainship/medidoor/medbay/free_access
	req_access = null

/obj/machinery/door/airlock/multi_tile/mainship/research
	name = "\improper 研究气闸"
	icon = 'icons/obj/doors/mainship/2x1medidoor.dmi'
	opacity = FALSE
	glass = TRUE
	req_access = list(ACCESS_MARINE_RESEARCH)

//MAINTENANCE
/obj/machinery/door/airlock/multi_tile/mainship/maint
	name = "维护舱口"
	icon = 'icons/obj/doors/mainship/2x1maintdoor.dmi'
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_ENGINEERING)

/obj/machinery/door/airlock/multi_tile/mainship/maint/free_access
	req_one_access = null

//ENGINEERING

/obj/machinery/door/airlock/multi_tile/mainship/engineering
	name = "\improper 工程气闸"
	icon = 'icons/obj/doors/mainship/2x1engidoor.dmi'
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_ENGINEERING)

/obj/machinery/door/airlock/multi_tile/mainship/engineering/free_access
	req_access = null

/obj/machinery/door/airlock/multi_tile/mainship/engineering/glass
	name = "\improper 工程玻璃气闸门"
	icon = 'icons/obj/doors/mainship/2x1engidoor_glass.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/mainship/engineering/glass/free_access
	req_access = null

//COMMAND
/obj/machinery/door/airlock/multi_tile/mainship/comdoor
	name = "\improper 指挥气闸"
	icon = 'icons/obj/doors/mainship/2x1comdoor.dmi'
	opacity = FALSE
	glass = TRUE
	req_access = list(ACCESS_MARINE_BRIDGE)

/obj/machinery/door/airlock/multi_tile/mainship/comdoor/free_access
	req_access = null

/obj/machinery/door/airlock/multi_tile/mainship/comdoor/cargopads
	name = "\improper 货物装卸区"
	req_access = list(ACCESS_NT_CORPORATE)

/obj/machinery/door/airlock/multi_tile/mainship/secdoor
	name = "\improper 安全气闸门"
	icon = 'icons/obj/doors/mainship/2x1secdoor.dmi'
	opacity = FALSE
	glass = FALSE
	req_access = list(ACCESS_MARINE_BRIG)

/obj/machinery/door/airlock/multi_tile/mainship/secdoor/glass
	name = "\improper 安全玻璃气闸门"
	icon = 'icons/obj/doors/mainship/2x1secdoor_glass.dmi'
	glass = TRUE

//------Dropship Cargo Doors -----//

/obj/machinery/door/airlock/multi_tile/mainship/dropshiprear
	opacity = TRUE
	width = 3
	resistance_flags = RESIST_ALL
	no_panel = TRUE
	not_weldable = TRUE

/obj/machinery/door/airlock/multi_tile/mainship/dropshiprear/proc/lockdown()
	unlock()
	close()
	lock()

/obj/machinery/door/airlock/multi_tile/mainship/dropshiprear/proc/release()
	unlock()

/obj/machinery/door/airlock/multi_tile/mainship/dropshiprear/ex_act(severity)
	return

/obj/machinery/door/airlock/multi_tile/mainship/dropshiprear/close(forced=0)
	if(forced)
		for(var/filler in fillers)
			var/filler_turf = get_turf(filler)
			for(var/mob/living/L in filler_turf)
				step(L, pick(NORTH,SOUTH)) // bump them off the tile
		safe = FALSE // in case anyone tries to run into the closing door~
		..()
		safe = TRUE // without having to rewrite closing proc~spookydonut
	else
		..()

/obj/machinery/door/airlock/multi_tile/mainship/dropshiprear/ds1
	name = "\improper 阿拉莫号货舱门"
	icon = 'icons/obj/doors/mainship/dropship1_cargo.dmi'

/obj/machinery/door/airlock/multi_tile/mainship/dropshiprear/ds2
	name = "\improper 诺曼底号货舱门"
	icon = 'icons/obj/doors/mainship/dropship2_cargo.dmi'


//nice colony colony entrance
/obj/machinery/door/airlock/multi_tile/ice
	name = "冰原殖民地门"
	icon = 'icons/obj/doors/icecolony.dmi'
	icon_state = "door_closed"
	width = 4
	openspeed = 17
	no_panel = TRUE
	opacity = TRUE

/obj/machinery/door/airlock/multi_tile/prison
	name = "电梯门"
	icon = 'icons/obj/doors/prison/4x1_elevator.dmi'
	icon_state = "door_closed"
	width = 4
	openspeed = 17
	no_panel = TRUE
	opacity = TRUE

/obj/machinery/door/airlock/multi_tile/prison/glass
	icon = 'icons/obj/doors/prison/4x1_elevator_access.dmi'

/obj/machinery/door/airlock/multi_tile/urban
	name = "\improper 气闸门"
	icon_state = "door_closed"
	req_access = null

/obj/machinery/door/airlock/multi_tile/urban/generic
	icon = 'icons/obj/doors/hybrisa/hybrisa_2x1generic.dmi'
	opacity = FALSE
	req_one_access = list(ACCESS_CIVILIAN_PUBLIC)

/obj/machinery/door/airlock/multi_tile/urban/generic_solid
	icon = 'icons/obj/doors/hybrisa/hybrisa_2x1generic_solid.dmi'
	req_one_access = list(ACCESS_CIVILIAN_PUBLIC)

// Medical

/obj/machinery/door/airlock/multi_tile/urban/medical
	icon = 'icons/obj/doors/hybrisa/hybrisa_2x1medidoor.dmi'
	opacity = FALSE
	req_one_access = list(ACCESS_CIVILIAN_RESEARCH, ACCESS_CIVILIAN_PUBLIC)

/obj/machinery/door/airlock/multi_tile/urban/medical_solid
	icon = 'icons/obj/doors/hybrisa/hybrisa_2x1medidoor_solid.dmi'
	req_one_access = list(ACCESS_CIVILIAN_RESEARCH, ACCESS_CIVILIAN_PUBLIC)

// Personal
/obj/machinery/door/airlock/multi_tile/urban/personal
	icon = 'icons/obj/doors/hybrisa/hybrisa_2x1personaldoor_glass.dmi'
	opacity = FALSE
	req_one_access = list(ACCESS_CIVILIAN_RESEARCH)


/obj/machinery/door/airlock/multi_tile/urban/personal_solid
	icon = 'icons/obj/doors/hybrisa/hybrisa_2x1personaldoor.dmi'
	req_one_access = list(ACCESS_CIVILIAN_RESEARCH)

// Personal White

/obj/machinery/door/airlock/multi_tile/urban/personal_white
	icon = 'icons/obj/doors/hybrisa/hybrisa_2x1personaldoor_glass_white.dmi'
	opacity = FALSE
	req_one_access = list(ACCESS_CIVILIAN_RESEARCH)

/obj/machinery/door/airlock/multi_tile/urban/personal_solid_white
	icon = 'icons/obj/doors/hybrisa/hybrisa_2x1personaldoor_white.dmi'
	req_one_access = list(ACCESS_CIVILIAN_RESEARCH)
