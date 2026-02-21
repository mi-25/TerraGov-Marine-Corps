
/obj/machinery/door/airlock/secure
	name = "\improper 安全气闸"
	icon = 'icons/obj/doors/Door_secure.dmi'
	assembly_type = /obj/structure/door_assembly/door_assembly_com
	openspeed = 34

/obj/machinery/door/airlock/command
	name = "\improper 指挥舱气闸"
	icon = 'icons/obj/doors/mainship/comdoor.dmi'
	assembly_type = /obj/structure/door_assembly/door_assembly_com

/obj/machinery/door/airlock/command/thunderdome
	name = "\improper 雷霆穹顶管理"
	icon = 'icons/obj/doors/mainship/comdoor.dmi'
	req_access = list(ACCESS_CIVILIAN_ENGINEERING)

/obj/machinery/door/airlock/security
	name = "\improper 安全气闸门"
	icon = 'icons/obj/doors/Doorsec.dmi'
	assembly_type = /obj/structure/door_assembly/door_assembly_sec

/obj/machinery/door/airlock/engineering
	name = "\improper 工程气闸"
	icon = 'icons/obj/doors/mainship/engidoor.dmi'
	assembly_type = /obj/structure/door_assembly/door_assembly_eng

/obj/machinery/door/airlock/engineering/evac
	icon = 'icons/obj/doors/mainship/pod_doors.dmi'
	icon_state = "door_locked"

/obj/machinery/door/airlock/medical
	name = "\improper 医疗气闸"
	icon = 'icons/obj/doors/mainship/medidoor.dmi'
	assembly_type = /obj/structure/door_assembly/door_assembly_med

/obj/machinery/door/airlock/maintenance
	name = "\improper 维护舱口"
	icon = 'icons/obj/doors/mainship/maintdoor.dmi'
	assembly_type = /obj/structure/door_assembly/door_assembly_mai

/obj/machinery/door/airlock/external
	name = "\improper 外部气闸门"
	icon = 'icons/obj/doors/Doorext.dmi'
	assembly_type = /obj/structure/door_assembly/door_assembly_ext

/obj/machinery/door/airlock/external/brig
	req_access = list(ACCESS_MARINE_BRIG)

/obj/machinery/door/airlock/glass
	name = "\improper 玻璃气闸门"
	icon = 'icons/obj/doors/mainship/personaldoor.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/centcom
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/mainship/securedoor.dmi'
	opacity = TRUE

/obj/machinery/door/airlock/vault
	name = "\improper 金库"
	icon = 'icons/obj/doors/vault.dmi'
	opacity = TRUE
	assembly_type = /obj/structure/door_assembly/door_assembly_highsecurity //Until somebody makes better sprites.

/obj/machinery/door/airlock/freezer
	name = "\improper 冷冻室气闸"
	icon = 'icons/obj/doors/mainship/personaldoor.dmi'
	opacity = TRUE
	assembly_type = /obj/structure/door_assembly/door_assembly_fre

/obj/machinery/door/airlock/hatch
	name = "\improper 气密舱门"
	icon = 'icons/obj/doors/mainship/securedoor.dmi'
	opacity = TRUE
	assembly_type = /obj/structure/door_assembly/door_assembly_hatch

/obj/machinery/door/airlock/hatch/engineering
	req_access = list(ACCESS_MARINE_ENGINEERING)

/obj/machinery/door/airlock/maintenance_hatch
	name = "\improper 维护舱口"
	icon = 'icons/obj/doors/mainship/maintdoor.dmi'
	opacity = TRUE
	assembly_type = /obj/structure/door_assembly/door_assembly_mhatch

/obj/machinery/door/airlock/glass_command
	name = "\improper 指挥舱气闸"
	icon = 'icons/obj/doors/mainship/comdoor.dmi'
	opacity = FALSE
	assembly_type = /obj/structure/door_assembly/door_assembly_com
	glass = TRUE

/obj/machinery/door/airlock/glass_engineering
	name = "\improper 工程气闸"
	icon = 'icons/obj/doors/mainship/engidoor.dmi'
	opacity = FALSE
	assembly_type = /obj/structure/door_assembly/door_assembly_eng
	glass = TRUE

/obj/machinery/door/airlock/glass_security
	name = "\improper 安全气闸门"
	icon = 'icons/obj/doors/Doorsec.dmi'
	opacity = FALSE
	assembly_type = /obj/structure/door_assembly/door_assembly_sec
	glass = TRUE

/obj/machinery/door/airlock/glass_security/locked
	icon_state = "door_locked"
	locked = TRUE

/obj/machinery/door/airlock/glass_medical
	name = "\improper 医疗气闸"
	icon = 'icons/obj/doors/Doormedglass.dmi'
	opacity = FALSE
	assembly_type = /obj/structure/door_assembly/door_assembly_med
	glass = TRUE

/obj/machinery/door/airlock/mining
	name = "\improper 采矿气闸门"
	icon = 'icons/obj/doors/Doormining.dmi'
	assembly_type = /obj/structure/door_assembly/door_assembly_min

/obj/machinery/door/airlock/marine
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/door_marines.dmi'
	assembly_type = /obj/structure/door_assembly/door_assembly_min

/obj/machinery/door/airlock/atmos
	name = "\improper 大气隔离舱"
	icon = 'icons/obj/doors/Dooratmo.dmi'
	assembly_type = /obj/structure/door_assembly/door_assembly_atmo

/obj/machinery/door/airlock/research
	name = "\improper 研究气闸"
	icon = 'icons/obj/doors/Doorresearch.dmi'
	assembly_type = /obj/structure/door_assembly/door_assembly_research

/obj/machinery/door/airlock/glass_research
	name = "\improper 研究气闸"
	icon = 'icons/obj/doors/Doorresearchglass.dmi'
	opacity = FALSE
	assembly_type = /obj/structure/door_assembly/door_assembly_research
	glass = TRUE

/obj/machinery/door/airlock/glass_mining
	name = "\improper 采矿气闸"
	icon = 'icons/obj/doors/Doorminingglass.dmi'
	opacity = FALSE
	assembly_type = /obj/structure/door_assembly/door_assembly_min
	glass = TRUE

/obj/machinery/door/airlock/glass_atmos
	name = "\improper 大气气闸"
	icon = 'icons/obj/doors/Dooratmoglass.dmi'
	opacity = FALSE
	assembly_type = /obj/structure/door_assembly/door_assembly_atmo
	glass = TRUE

/obj/machinery/door/airlock/gold
	name = "\improper 金色气闸门"
	icon = 'icons/obj/doors/Doorgold.dmi'
	mineral = "gold"

/obj/machinery/door/airlock/silver
	name = "\improper 银色气闸"
	icon = 'icons/obj/doors/Doorsilver.dmi'
	mineral = "silver"

/obj/machinery/door/airlock/diamond
	name = "\improper 钻石气闸门"
	icon = 'icons/obj/doors/Doordiamond.dmi'
	mineral = "diamond"

/obj/machinery/door/airlock/uranium
	name = "\improper 铀制气闸门"
	desc = "他们都说我疯了。"
	icon = 'icons/obj/doors/Dooruranium.dmi'
	mineral = "uranium"


/obj/machinery/door/airlock/phoron
	name = "\improper 等离子体气闸"
	desc = "这不可能出问题。"
	icon = 'icons/obj/doors/Doorphoron.dmi'
	mineral = "phoron"



/obj/machinery/door/airlock/sandstone
	name = "\improper 砂岩气闸门"
	icon = 'icons/obj/doors/Doorsand.dmi'
	mineral = "sandstone"

/obj/machinery/door/airlock/science
	name = "\improper 研究气闸"
	icon = 'icons/obj/doors/Doorsci.dmi'
	assembly_type = /obj/structure/door_assembly/door_assembly_science

/obj/machinery/door/airlock/glass_science
	name = "\improper 研究气闸"
	icon = 'icons/obj/doors/Doorsciglass.dmi'
	opacity = FALSE
	assembly_type = /obj/structure/door_assembly/door_assembly_science
	glass = TRUE

/obj/machinery/door/airlock/highsecurity
	name = "\improper 高科技安全气闸"
	icon = 'icons/obj/doors/hightechsecurity.dmi'
	assembly_type = /obj/structure/door_assembly/door_assembly_highsecurity





//MARINE SHIP AIRLOCKS

/obj/machinery/door/airlock/mainship
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/mainship/comdoor.dmi' //Tiles with is here FOR SAFETY PURPOSES
	openspeed = 4 //shorter open animation.

/obj/machinery/door/airlock/mainship/security
	name = "\improper 安全气闸门"
	icon = 'icons/obj/doors/mainship/secdoor.dmi'
	req_access = list(ACCESS_MARINE_BRIG)

/obj/machinery/door/airlock/mainship/security/free_access
	req_access = null

/obj/machinery/door/airlock/mainship/security/locked
	icon_state = "door_locked"
	locked = TRUE

/obj/machinery/door/airlock/mainship/security/locked/free_access
	req_access = null

/obj/machinery/door/airlock/mainship/security/checkpoint
	name = "\improper 安全检查站"

/obj/machinery/door/airlock/mainship/security/CMA
	name = "\improper 宪兵总长的铺位"

/obj/machinery/door/airlock/mainship/security/glass
	name = "\improper 安全气闸门"
	icon = 'icons/obj/doors/mainship/secdoor_glass.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/mainship/security/glass/free_access
	req_access = null

/obj/machinery/door/airlock/mainship/security/glass/office
	name = "\improper 安保办公室"

/obj/machinery/door/airlock/mainship/security/glass/cells
	name = "\improper 安全牢房"

/obj/machinery/door/airlock/mainship/security/glass/CMA
	name = "\improper 宪兵总长办公室"

/obj/machinery/door/airlock/mainship/command
	name = "\improper 指挥舱气闸"
	icon = 'icons/obj/doors/mainship/comdoor.dmi'
	req_access = list(ACCESS_MARINE_BRIDGE)

/obj/machinery/door/airlock/mainship/command/free_access
	req_access = null

/obj/machinery/door/airlock/mainship/command/locked
	icon_state = "door_locked"
	locked = TRUE

/obj/machinery/door/airlock/mainship/command/locked/free_access
	req_access = null

/obj/machinery/door/airlock/mainship/command/open
	icon_state = "door_open"
	density = FALSE
	opacity = FALSE

/obj/machinery/door/airlock/mainship/command/open/free_access
	req_access = null

/obj/machinery/door/airlock/mainship/command/canterbury //For wall-smoothing
	req_access = list(ACCESS_MARINE_DROPSHIP)

/obj/machinery/door/airlock/mainship/command/cic
	name = "\improper 作战信息中心"

/obj/machinery/door/airlock/mainship/command/brief
	name = "\improper 简报室"

/obj/machinery/door/airlock/mainship/command/CPToffice
	name = "\improper 舰长办公室"

/obj/machinery/door/airlock/mainship/command/CPTstudy
	name = "\improper 舰长书房"
	req_access = list(ACCESS_MARINE_CAPTAIN)

/obj/machinery/door/airlock/mainship/command/CPTmess
	name = "\improper 舰长餐厅"

/obj/machinery/door/airlock/mainship/command/FCDRoffice
	name = "\improper 战地指挥官办公室"

/obj/machinery/door/airlock/mainship/command/FCDRquarters
	name = "\improper 战地指挥官舱室"

/obj/machinery/door/airlock/mainship/command/officer
	name = "\improper 军官宿舍"

/obj/machinery/door/airlock/mainship/secure
	name = "\improper 安全气闸"
	icon = 'icons/obj/doors/mainship/securedoor.dmi'
	req_access = list(ACCESS_MARINE_BRIDGE)

/obj/machinery/door/airlock/mainship/secure/free_access
	req_access = null

/obj/machinery/door/airlock/mainship/secure/locked
	icon_state = "door_locked"
	locked = TRUE

/obj/machinery/door/airlock/mainship/secure/locked/free_access
	req_access = null

/obj/machinery/door/airlock/mainship/secure/open
	icon_state = "door_open"
	density = FALSE
	opacity = FALSE

/obj/machinery/door/airlock/mainship/secure/open/free_access
	req_access = null

/obj/machinery/door/airlock/mainship/secure/tcomms
	name = "\improper 通讯系统"

/obj/machinery/door/airlock/mainship/secure/evac
	name = "\improper 撤离气闸"

/obj/machinery/door/airlock/mainship/secure/evac/Initialize(mapload)
	. = ..()
	RegisterSignal(SSdcs, COMSIG_GLOB_EVACUATION_STARTED, PROC_REF(force_open))

///Force open that door
/obj/machinery/door/airlock/mainship/secure/proc/force_open()
	SIGNAL_HANDLER
	unlock(TRUE)
	INVOKE_ASYNC(src, PROC_REF(open), TRUE)
	lock(TRUE)

/obj/machinery/door/airlock/mainship/ai
	name = "\improper 人工智能核心"
	icon = 'icons/obj/doors/mainship/personaldoor.dmi'
	req_access = list(ACCESS_MARINE_BRIDGE)

/obj/machinery/door/airlock/mainship/ai/glass
	name = "\improper 人工智能核心"
	icon = 'icons/obj/doors/Doorglass.dmi'
	opacity = FALSE
	glass = TRUE



/obj/machinery/door/airlock/mainship/evacuation
	name = "\improper 撤离气闸"
	icon = 'icons/obj/doors/mainship/securedoor.dmi'


/obj/machinery/door/airlock/mainship/maint
	name = "\improper 维护舱口"
	icon = 'icons/obj/doors/mainship/maintdoor.dmi'
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_ENGINEERING)

/obj/machinery/door/airlock/mainship/maint/free_access

/obj/machinery/door/airlock/mainship/maint/core
	name = "\improper 核心舱口"

/obj/machinery/door/airlock/mainship/maint/hangar
	name = "\improper 机库控制室"
	req_one_access = list(ACCESS_MARINE_DROPSHIP)

/obj/machinery/door/airlock/mainship/engineering
	name = "\improper 工程气闸"
	icon = 'icons/obj/doors/mainship/engidoor.dmi'
	opacity = FALSE
	glass = TRUE
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_ENGINEERING)

/obj/machinery/door/airlock/mainship/engineering/glass
	name = "\improper 工程玻璃气闸门"
	icon = 'icons/obj/doors/mainship/engidoor_glass.dmi'

/obj/machinery/door/airlock/mainship/engineering/glass/free_access
	req_one_access = null

/obj/machinery/door/airlock/mainship/engineering/free_access
	req_one_access = null

/obj/machinery/door/airlock/mainship/engineering/storage
	name = "\improper 工程存储室"
	icon = 'icons/obj/doors/mainship/maintdoor.dmi'

/obj/machinery/door/airlock/mainship/engineering/disposals
	name = "\improper 垃圾处理"

/obj/machinery/door/airlock/mainship/engineering/workshop
	name = "\improper 工程车间"

/obj/machinery/door/airlock/mainship/engineering/engine
	name = "\improper 工程引擎监控"

/obj/machinery/door/airlock/mainship/engineering/atmos
	name = "\improper 大气处理区"

/obj/machinery/door/airlock/mainship/engineering/CSEoffice
	name = "\improper 首席舰船工程师办公室"
	req_access = list(ACCESS_MARINE_CE)

/obj/machinery/door/airlock/mainship/engineering/server_room
	name = "\improper 服务器机房"
	req_one_access = null

/obj/machinery/door/airlock/mainship/medical
	name = "\improper 医疗气闸"
	icon = 'icons/obj/doors/mainship/medidoor.dmi'
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_BRIDGE)


/obj/machinery/door/airlock/mainship/medical/free_access
	req_one_access = list()

/obj/machinery/door/airlock/mainship/medical/morgue
	name = "\improper 停尸房"
	req_access = list(ACCESS_MARINE_CHEMISTRY)

/obj/machinery/door/airlock/mainship/medical/or
	name = "\improper 手术室"

/obj/machinery/door/airlock/mainship/medical/or/or1
	name = "\improper 手术室 1"
/obj/machinery/door/airlock/mainship/medical/or/or2
	name = "\improper 手术室2"

/obj/machinery/door/airlock/mainship/medical/or/or3
	name = "\improper 手术室3"

/obj/machinery/door/airlock/mainship/medical/or/or4
	name = "\improper 手术室4"

/obj/machinery/door/airlock/mainship/medical/or/free_access
	req_one_access = null

/obj/machinery/door/airlock/mainship/medical/glass
	name = "\improper 医疗气闸"
	icon = 'icons/obj/doors/mainship/medidoor_glass.dmi'
	opacity = FALSE
	glass = TRUE
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_BRIDGE)

/obj/machinery/door/airlock/mainship/medical/glass/free_access
	req_one_access = null

/obj/machinery/door/airlock/mainship/medical/glass/CMO
	name = "\improper 首席医疗官办公室"
	req_access = list(ACCESS_MARINE_CMO)

/obj/machinery/door/airlock/mainship/medical/glass/chemistry
	name = "\improper 化学实验室"

/obj/machinery/door/airlock/mainship/medical/glass/research
	req_access = list(ACCESS_MARINE_RESEARCH)

/obj/machinery/door/airlock/mainship/research
	name = "\improper 研究气闸"
	icon = 'icons/obj/doors/mainship/medidoor.dmi'
	req_access = list(ACCESS_MARINE_RESEARCH)

/obj/machinery/door/airlock/mainship/research/free_access
	req_access = null

/obj/machinery/door/airlock/mainship/research/open
	icon_state = "door_open"
	density = FALSE
	opacity = FALSE

/obj/machinery/door/airlock/mainship/research/open/free_access
	req_one_access = null

/obj/machinery/door/airlock/mainship/research/locked
	icon_state = "door_locked"
	locked = TRUE

/obj/machinery/door/airlock/mainship/research/locked/free_access
	req_one_access = null

/obj/machinery/door/airlock/mainship/research/chemistry
	name = "\improper 化学实验室"
	req_access = list(ACCESS_MARINE_CHEMISTRY)

/obj/machinery/door/airlock/mainship/research/or
	name = "\improper 实验性手术室"

/obj/machinery/door/airlock/mainship/research/pen
	name = "\improper 研究笔"

/obj/machinery/door/airlock/mainship/research/glass
	icon = 'icons/obj/doors/mainship/medidoor_glass.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/mainship/research/glass/wing
	name = "\improper 医学研究翼"
	id = "researchdoorext"

/obj/machinery/door/airlock/mainship/research/glass/cell
	name = "\improper 收容单元"
	id = "Containment Cell"
	icon_state = "door_locked"
	locked = TRUE

/obj/machinery/door/airlock/mainship/research/glass/cell/cell1
	name = "\improper 收容单元 1"
	id = "Containment Cell 1"

/obj/machinery/door/airlock/mainship/research/glass/cell/cell2
	name = "\improper 收容单元 2"
	id = "Containment Cell 2"

/obj/machinery/door/airlock/mainship/research/glass/free_access
	req_access = null

/obj/machinery/door/airlock/mainship/generic
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/mainship/personaldoor.dmi'

/obj/machinery/door/airlock/mainship/generic/corporate
	name = "企业联络官办公室"
	icon = 'icons/obj/doors/mainship/personaldoor.dmi'
	req_access = list(ACCESS_NT_CORPORATE)

/obj/machinery/door/airlock/mainship/generic/corporate/quarters
	name = "企业联络官舱室"

/obj/machinery/door/airlock/mainship/generic/bathroom
	name = "\improper 卫生间"

/obj/machinery/door/airlock/mainship/generic/bathroom/toilet
	name = "\improper 马桶"

/obj/machinery/door/airlock/mainship/generic/pilot
	name = "\improper 飞行员办公室"
	req_one_access = list(ACCESS_MARINE_PILOT)

/obj/machinery/door/airlock/mainship/generic/pilot/bunk
	name = "\improper 飞行员宿舍"

/obj/machinery/door/airlock/mainship/generic/pilot/quarters
	name = "\improper 飞行员宿舍"
	req_one_access = list(ACCESS_MARINE_MECH, ACCESS_MARINE_ARMORED)

/obj/machinery/door/airlock/mainship/generic/mech_bay
	name = "\improper 机甲库"
	req_one_access = list(ACCESS_MARINE_MECH, ACCESS_MARINE_ARMORED)

/obj/machinery/door/airlock/mainship/generic/mech_pilot/office
	name = "\improper 机甲驾驶员办公室"
	req_access = list(ACCESS_MARINE_MECH)

/obj/machinery/door/airlock/mainship/generic/mech_pilot/bunk
	name = "\improper 机甲驾驶员铺位"
	req_one_access = list(ACCESS_MARINE_MECH, ACCESS_MARINE_ARMORED)

/obj/machinery/door/airlock/mainship/generic/ert
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/mainship/personaldoor.dmi'
	interaction_flags = INTERACT_MACHINE_NOSILICON //go away naughty AI

/obj/machinery/door/airlock/mainship/generic/glass
	name = "\improper 玻璃气闸门"
	icon = 'icons/obj/doors/mainship/personaldoor_glass.dmi'

/obj/machinery/door/airlock/mainship/marine
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/mainship/prepdoor.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/mainship/marine/get_weld_spark_icon_and_state()
	if(dir & NORTH|SOUTH)
		return list('icons/effects/welding_effect_multitile_door.dmi', "welding_sparks_marinedoor")
	return ..()

/obj/machinery/door/airlock/mainship/marine/canterbury //For wallsmoothing

/obj/machinery/door/airlock/mainship/marine/general/sl
	name = "\improper 班长准备工作"
	icon = 'icons/obj/doors/mainship/prepdoor.dmi'
	req_access = list(ACCESS_MARINE_LEADER)
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/mainship/marine/general/smart
	name = "\improper 智能机枪手准备"
	icon = 'icons/obj/doors/mainship/prepdoor.dmi'
	req_access = list(ACCESS_MARINE_SMARTPREP)
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/mainship/marine/general/corps
	name = "\improper 卫生兵准备"
	icon = 'icons/obj/doors/mainship/prepdoor.dmi'
	req_access = list(ACCESS_MARINE_MEDPREP)
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/mainship/marine/general/engi
	name = "\improper 工程兵准备"
	icon = 'icons/obj/doors/mainship/prepdoor.dmi'
	req_access = list(ACCESS_MARINE_ENGPREP)
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/mainship/marine/requisitions
	name = "\improper 补给舱"
	icon = 'icons/obj/doors/mainship/prepdoor.dmi'
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_CARGO)
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/mainship/marine/requisitions/lift
	name = "\improper ASRS 升降机"
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/alpha
	name = "\improper 阿尔法小队准备区"
	icon = 'icons/obj/doors/mainship/prepdoor_alpha.dmi'
	req_access = list(ACCESS_MARINE_PREP)
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_ALPHA)
	opacity = FALSE
	glass = TRUE
	dir = SOUTH

/obj/machinery/door/airlock/mainship/marine/alpha/sl
	name = "\improper 阿尔法班班长准备"
	req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_ALPHA)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/alpha/engineer
	name = "\improper 阿尔法班工程兵准备就绪"
	req_access = list(ACCESS_MARINE_ENGPREP, ACCESS_MARINE_ALPHA)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/alpha/medic
	name = "\improper 阿尔法班卫生兵准备"
	req_access = list(ACCESS_MARINE_MEDPREP, ACCESS_MARINE_ALPHA)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/alpha/smart
	name = "\improper 阿尔法班智能机枪手准备就绪"
	req_access = list(ACCESS_MARINE_SMARTPREP, ACCESS_MARINE_ALPHA)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/bravo
	name = "\improper 布拉沃小队准备"
	icon = 'icons/obj/doors/mainship/prepdoor_bravo.dmi'
	req_access = list(ACCESS_MARINE_PREP)
	req_one_access = list(ACCESS_MARINE_LOGISTICS,ACCESS_MARINE_BRAVO)
	opacity = FALSE
	glass = TRUE
	dir = SOUTH

/obj/machinery/door/airlock/mainship/marine/bravo/sl
	name = "\improper 布拉沃班班长准备工作"
	req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_BRAVO)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/bravo/engineer
	name = "\improper 布拉沃班工程兵准备"
	req_access = list(ACCESS_MARINE_ENGPREP, ACCESS_MARINE_BRAVO)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/bravo/medic
	name = "\improper 布拉沃班卫生兵准备工作"
	req_access = list(ACCESS_MARINE_MEDPREP, ACCESS_MARINE_BRAVO)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/bravo/smart
	name = "\improper 布拉沃班智能机枪手准备就绪"
	req_access = list(ACCESS_MARINE_SMARTPREP, ACCESS_MARINE_BRAVO)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/charlie
	name = "\improper 查理小队准备"
	icon = 'icons/obj/doors/mainship/prepdoor_charlie.dmi'
	req_access = list(ACCESS_MARINE_PREP)
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_CHARLIE)
	opacity = FALSE
	glass = TRUE
	dir = SOUTH

/obj/machinery/door/airlock/mainship/marine/charlie/sl
	name = "\improper 查理班班长准备"
	req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_CHARLIE)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/charlie/engineer
	name = "\improper 查理班工程兵准备"
	req_access = list(ACCESS_MARINE_ENGPREP, ACCESS_MARINE_CHARLIE)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/charlie/medic
	name = "\improper 查理班卫生兵准备"
	req_access = list(ACCESS_MARINE_MEDPREP, ACCESS_MARINE_CHARLIE)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/charlie/smart
	name = "\improper 查理班智能机枪手准备就绪"
	req_access = list(ACCESS_MARINE_SMARTPREP, ACCESS_MARINE_CHARLIE)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/delta
	name = "\improper 德尔塔小队准备区"
	icon = 'icons/obj/doors/mainship/prepdoor_delta.dmi'
	req_access = list(ACCESS_MARINE_PREP)
	req_one_access = list(ACCESS_MARINE_LOGISTICS, ACCESS_MARINE_DELTA)
	opacity = FALSE
	glass = TRUE
	dir = SOUTH

/obj/machinery/door/airlock/mainship/marine/delta/sl
	name = "\improper 德尔塔班班长准备"
	req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_DELTA)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/delta/engineer
	name = "\improper 德尔塔班工程兵准备"
	req_access = list(ACCESS_MARINE_ENGPREP, ACCESS_MARINE_DELTA)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/delta/medic
	name = "\improper 德尔塔小队医疗准备"
	req_access = list(ACCESS_MARINE_MEDPREP, ACCESS_MARINE_DELTA)
	req_one_access = null

/obj/machinery/door/airlock/mainship/marine/delta/smart
	name = "\improper 德尔塔班智能机枪手准备就绪"
	req_access = list(ACCESS_MARINE_SMARTPREP, ACCESS_MARINE_DELTA)
	req_one_access = null



//DROPSHIP SIDE AIRLOCKS

/obj/machinery/door/airlock/dropship_hatch
	name = "\improper 运输机舱门"
	icon = 'icons/obj/doors/mainship/dropship1_side.dmi' //Tiles with is here FOR SAFETY PURPOSES
	id = "sh_dropship1"
	openspeed = 4 //shorter open animation.
	resistance_flags = RESIST_ALL
	no_panel = TRUE
	not_weldable = TRUE

/obj/machinery/door/airlock/dropship_hatch/proc/lockdown()
	unlock()
	close()
	lock()

/obj/machinery/door/airlock/dropship_hatch/proc/release()
	unlock()

/obj/machinery/door/airlock/dropship_hatch/ex_act(severity)
	return

/obj/machinery/door/airlock/dropship_hatch/close(forced=0)
	if(forced)
		for(var/mob/living/L in loc)
			step(L, pick(EAST,WEST)) // bump them off the tile
		safe = 0 // in case anyone tries to run into the closing door~
		..()
		safe = 1 // without having to rewrite closing proc~spookydonut
	else
		..()


/obj/machinery/door/airlock/dropship_hatch/left
	dir = EAST

/obj/machinery/door/airlock/dropship_hatch/right
	dir = WEST

/obj/machinery/door/airlock/dropship_hatch/left/two
	icon = 'icons/obj/doors/mainship/dropship2_side.dmi' //Tiles with is here FOR SAFETY PURPOSES
	id = "sh_dropship2"

/obj/machinery/door/airlock/dropship_hatch/right/two
	icon = 'icons/obj/doors/mainship/dropship2_side.dmi' //Tiles with is here FOR SAFETY PURPOSES
	id = "sh_dropship2"

/obj/machinery/door/airlock/hatch/cockpit
	icon = 'icons/obj/doors/mainship/dropship1_pilot.dmi'
	name = "\improper 驾驶舱"
	req_access = list(ACCESS_MARINE_DROPSHIP)
	resistance_flags = RESIST_ALL
	no_panel = TRUE
	not_weldable = TRUE

/obj/machinery/door/airlock/hatch/cockpit/canAIControl(mob/user)
	return TRUE

/obj/machinery/door/airlock/hatch/cockpit/two
	icon = 'icons/obj/doors/mainship/dropship2_pilot.dmi'

//PRISON AIRLOCKS
/obj/machinery/door/airlock/prison
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/prison/celldoor.dmi'

/obj/machinery/door/airlock/prison/open
	icon_state = "door_open"
	density = FALSE
	opacity = FALSE

/obj/machinery/door/airlock/prison/horizontal
	dir = SOUTH

/obj/machinery/door/airlock/prison/horizontal/open
	icon_state = "door_open"
	density = FALSE
	opacity = FALSE


//Colony Mapped Doors
/obj/machinery/door/airlock/colony

/obj/machinery/door/airlock/colony/engineering
	icon = 'icons/obj/doors/mainship/engidoor.dmi'
	opacity = FALSE
	glass = TRUE
	req_access = list(ACCESS_CIVILIAN_ENGINEERING)

/obj/machinery/door/airlock/colony/engineering/smes
	name = "\improper 工程穹顶SMES"

/obj/machinery/door/airlock/colony/engineering/nexusstorage
	name = "\improper 枢纽货物储存区"

/obj/machinery/door/airlock/colony/engineering/nexusstorage/open
	icon_state = "door_open"
	density = FALSE
	opacity = FALSE

/obj/machinery/door/airlock/colony/medical
	icon = 'icons/obj/doors/mainship/medidoor_glass.dmi'
	opacity = FALSE
	glass = TRUE
	req_access = list(ACCESS_CIVILIAN_MEDICAL)

/obj/machinery/door/airlock/colony/medical/domestorage
	name = "\improper 医疗穹顶储存区"

/obj/machinery/door/airlock/colony/medical/domesurgery
	name = "\improper 医疗穹顶手术"

/obj/machinery/door/airlock/colony/medical/domelockers
	name = "\improper 医疗穹顶储物柜"

/obj/machinery/door/airlock/colony/medical/hydroponics
	name = "\improper 水培穹顶"
	req_access = list(ACCESS_CIVILIAN_PUBLIC)


/obj/machinery/door/airlock/colony/research
	icon = 'icons/obj/doors/mainship/medidoor.dmi'
	req_access = list(ACCESS_CIVILIAN_RESEARCH)

/obj/machinery/door/airlock/colony/research/dome
	name = "\improper 研究穹顶"
	icon_state = "door_locked"
	locked = TRUE

// urban doors

/obj/machinery/door/airlock/urban
	openspeed = 4
	icon_state = "door_closed"
	req_access = null

/obj/machinery/door/airlock/urban/generic
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/hybrisa/hybrisa_generic_glass.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/urban/generic_solid
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/hybrisa/hybrisa_generic.dmi'

// Medical

/obj/machinery/door/airlock/urban/medical
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/hybrisa/hybrisa_medidoor_glass.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/urban/medical_solid
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/hybrisa/hybrisa_medidoor.dmi'

// Personal
/obj/machinery/door/airlock/urban/personal
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/hybrisa/hybrisa_personaldoor_glass.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/urban/personal_solid
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/hybrisa/hybrisa_personaldoor.dmi'

// Personal White
/obj/machinery/door/airlock/urban/personal_white
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/hybrisa/hybrisa_personaldoor_glass_white.dmi'
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/urban/personal_solid_white
	name = "\improper 气闸门"
	icon = 'icons/obj/doors/hybrisa/hybrisa_personaldoor_white.dmi'

