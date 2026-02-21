//Base Instance
/area/desert_dam
	name = "沙漠水坝"
	icon_state = "cliff_blocked"

//INTERIOR
// areas under rock
/area/desert_dam/interior
	ceiling = CEILING_METAL
	outside = FALSE

//NorthEastern Lab Section
/area/desert_dam/interior/lab_northeast
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/desert_dam/interior/lab_northeast
	name = "东北实验室"
	icon_state = "purple"

/area/desert_dam/interior/lab_northeast/east_lab_lobby
	name = "东侧实验室大厅"
	icon_state = "green"

/area/desert_dam/interior/lab_northeast/east_lab_west_hallway
	name = "东实验室西走廊"
	icon_state = "blue"

/area/desert_dam/interior/lab_northeast/east_lab_central_hallway
	name = "东实验室中央走廊"
	icon_state = "green"

/area/desert_dam/interior/lab_northeast/east_lab_east_hallway
	name = "东实验室东走廊"
	icon_state = "yellow"

/area/desert_dam/interior/lab_northeast/east_lab_workshop
	name = "东区实验室车间"
	icon_state = "ass_line"

/area/desert_dam/interior/lab_northeast/east_lab_storage
	name = "东区实验室仓库"
	icon_state = "storage"

/area/desert_dam/interior/lab_northeast/east_lab_RD_office
	name = "东区实验室研究主管办公室"
	icon_state = "yellow"

/area/desert_dam/interior/lab_northeast/east_lab_maintenence
	name = "东区实验室维护间"
	icon_state = "maintcentral"
	requires_power = FALSE
/area/desert_dam/interior/lab_northeast/east_lab_containment
	name = "东区实验室收容区"
	icon_state = "purple"

/area/desert_dam/interior/lab_northeast/east_lab_RND
	name = "东区实验室研发部"
	icon_state = "purple"

/area/desert_dam/interior/lab_northeast/east_lab_biology
	name = "东区实验室 生化"
	icon_state = "purple"

/area/desert_dam/interior/lab_northeast/east_lab_surgery
	name = "东实验室手术室"
	icon_state = "red"

/area/desert_dam/interior/lab_northeast/east_lab_excavation
	name = "东区实验室挖掘准备"
	icon_state = "blue"

/area/desert_dam/interior/lab_northeast/east_lab_west_entrance
	name = "东实验室西入口"
	icon_state = "purple"

/area/desert_dam/interior/lab_northeast/east_lab_east_entrance
	name = "东实验室入口"
	icon_state = "purple"

/area/desert_dam/interior/lab_northeast/east_lab_security_checkpoint
	name = "东区实验室安检点"
	icon_state = "purple"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/desert_dam/interior/lab_northeast/east_lab_security_office
	name = "东区实验室安保办公室"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/desert_dam/interior/lab_northeast/east_lab_security_armory
	name = "东区实验室军械库"
	icon_state = "armory"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/desert_dam/interior/lab_northeast/east_lab_xenobiology
	name = "东区实验室异形生物学"
	icon_state = "red"

//Dam Interior
/area/desert_dam/interior/dam_interior
	minimap_color = MINIMAP_AREA_ENGI
	outside = FALSE

/area/desert_dam/interior/dam_interior/engine_room
	name = "工程发电机房"
	icon_state = "yellow"

/area/desert_dam/interior/dam_interior/control_room
	name = "工程控制室"
	icon_state = "red"

/area/desert_dam/interior/dam_interior/smes_main
	name = "工程主变电站"
	icon_state = "purple"

/area/desert_dam/interior/dam_interior/smes_backup
	name = "工程备用副电站"
	icon_state = "green"

/area/desert_dam/interior/dam_interior/engine_east_wing
	name = "东侧引擎翼区"
	icon_state = "blue-red"

/area/desert_dam/interior/dam_interior/engine_west_wing
	name = "工程部西引擎舱"
	icon_state = "yellow"

/area/desert_dam/interior/dam_interior/lobby
	name = "工程大厅"
	icon_state = "purple"

/area/desert_dam/interior/dam_interior/atmos_storage
	name = "工程部大气储存室"
	icon_state = "purple"

/area/desert_dam/interior/dam_interior/northwestern_tunnel
	name = "工程西北隧道"
	icon_state = "green"

/area/desert_dam/interior/dam_interior/north_tunnel
	name = "工程区北部隧道"
	icon_state = "blue-red"
	minimap_color = MINIMAP_AREA_COLONY

/area/desert_dam/interior/dam_interior/west_tunnel
	name = "工程西隧道"
	icon_state = "yellow"

/area/desert_dam/interior/dam_interior/central_tunnel
	name = "工程中心隧道"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_COLONY

/area/desert_dam/interior/dam_interior/south_tunnel
	name = "工程区南侧隧道"
	icon_state = "purple"
	minimap_color = MINIMAP_AREA_ENGI

/area/desert_dam/interior/dam_interior/northeastern_tunnel
	name = "工程东北隧道"
	icon_state = "green"
	minimap_color = MINIMAP_AREA_COLONY

/area/desert_dam/interior/dam_interior/CE_office
	name = "工程部 首席工程师办公室"
	icon_state = "yellow"

/area/desert_dam/interior/dam_interior/workshop
	name = "工程车间"
	icon_state = "purple"

/area/desert_dam/interior/dam_interior/hanger
	name = "工程机库"
	icon_state = "hangar"

/area/desert_dam/interior/dam_interior/hangar_storage
	name = "工程机库储藏室"
	icon_state = "storage"

/area/desert_dam/interior/dam_interior/auxilary_tool_storage
	name = "工程辅助工具储存柜"
	icon_state = "red"

/area/desert_dam/interior/dam_interior/primary_tool_storage
	name = "工程主工具储藏室"
	icon_state = "blue"

/area/desert_dam/interior/dam_interior/tech_storage
	name = "工程部安全技术存储室"
	icon_state = "dark"

/area/desert_dam/interior/dam_interior/break_room
	name = "工程部休息室"
	icon_state = "yellow"

/area/desert_dam/interior/dam_interior/disposals
	name = "工程部废弃物处理"
	icon_state = "disposal"

/area/desert_dam/interior/dam_interior/western_dam_cave
	name = "工程区西侧入口"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_CAVES

/area/desert_dam/interior/dam_interior/office
	name = "工程办公室"
	icon_state = "red"

/area/desert_dam/interior/dam_interior
	name = "工程部"
	icon_state = ""

/area/desert_dam/interior/east_engineering
	name = "东部工程"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/desert_dam/interior/dam_interior/north_tunnel_entrance
	name = "工程区北隧道入口"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_SEC

/area/desert_dam/interior/dam_interior/east_tunnel_entrance
	name = "工程东区隧道入口"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_SEC

/area/desert_dam/interior/dam_interior/south_tunnel_entrance
	name = "工程区南隧道入口"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_SEC

/area/desert_dam/interior/caves
	name = "洞穴"
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	icon_state = "red"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambisin4.ogg')
	minimap_color = MINIMAP_AREA_CAVES

/area/desert_dam/interior/caves/northern_caves
	name = "北部洞穴"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_CAVES
/area/desert_dam/interior/caves/east_caves
	name = "东部洞穴"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_CAVES
	requires_power = FALSE

/area/desert_dam/interior/caves/central_caves
	name = "中央洞穴"
	icon_state = "yellow"
	requires_power = FALSE
/area/desert_dam/interior/caves/central_caves/entrances/east_tunnel_entrance
	name = "东部中央隧道入口"
	icon_state = "red"
/area/desert_dam/interior/caves/central_caves/entrances/south_tunnel_entrance
	name = "南部中央隧道入口"
	icon_state = "red"
/area/desert_dam/interior/caves/central_caves/entrances/west_tunnel_entrance
	name = "西部中央隧道入口"
	icon_state = "red"

/area/desert_dam/interior/caves/temple
	name = "沙之圣殿"
	icon_state = "green"
	requires_power = FALSE

//BUILDING
//areas not under rock
// ceiling = CEILING_METAL
/area/desert_dam/building
	ceiling = CEILING_METAL
	outside = FALSE
//Substations
/area/desert_dam/building/substation
	name = "变电站"
	icon = 'icons/turf/dam_areas.dmi'
	minimap_color = MINIMAP_AREA_ENGI

/area/desert_dam/building/substation/northwest
	name = "指挥分站"
	icon_state = "northewestern_ss"

/area/desert_dam/building/substation/northeast
	name = "指挥分站"
	icon_state = "northeastern_ss"

/area/desert_dam/building/substation/east
	name = "指挥分站"
	icon_state = "eastern_ss"

/area/desert_dam/building/substation/southeast
	name = "指挥分站"
	icon_state = "southeastern_ss"

/area/desert_dam/building/substation/central
	name = "指挥分站"
	icon_state = "central_ss"

/area/desert_dam/building/substation/southwest
	name = "指挥分站"
	icon_state = "southwestern_ss"

/area/desert_dam/building/substation/west
	name = "指挥分站"
	icon_state = "western_ss"

//Administration
/area/desert_dam/building/administration
	minimap_color = MINIMAP_AREA_COMMAND

/area/desert_dam/building/administration/control_room
	name = "行政着陆控制室"
	icon_state = "yellow"

/area/desert_dam/building/administration/lobby
	name = "行政大厅"
	icon_state = "green"

/area/desert_dam/building/administration/hallway
	name = "行政走廊"
	icon_state = "purple"

/area/desert_dam/building/administration/office
	name = "行政办公室"
	icon_state = "blue-red"

/area/desert_dam/building/administration/overseer_office
	name = "行政监督官办公室"
	icon_state = "red"

/area/desert_dam/building/administration/meetingrooom
	name = "行政会议室"
	icon_state = "yellow"

/area/desert_dam/building/administration/archives
	name = "行政档案"
	icon_state = "green"


//Bar
/area/desert_dam/building/bar
	minimap_color = MINIMAP_AREA_LIVING

/area/desert_dam/building/bar/bar
	name = "横杆"
	icon_state = "yellow"

/area/desert_dam/building/bar/backroom
	name = "酒吧后间"
	icon_state = "green"

/area/desert_dam/building/bar/bar_restroom
	name = "酒吧洗手间"
	icon_state = "purple"


//Cafe
/area/desert_dam/building/cafeteria
	minimap_color = MINIMAP_AREA_LIVING

/area/desert_dam/building/cafeteria/cafeteria
	name = "食堂"
	icon_state = "yellow"

/area/desert_dam/building/cafeteria/backroom
	name = "食堂后厨"
	icon_state = "green"

/area/desert_dam/building/cafeteria/restroom
	name = "食堂洗手间"
	icon_state = "purple"

/area/desert_dam/building/cafeteria/loading
	name = "食堂装载室"
	icon_state = "blue-red"

/area/desert_dam/building/cafeteria/cold_room
	name = "食堂冷库"
	icon_state = "red"


//Dorms
/area/desert_dam/building/dorms
	minimap_color = MINIMAP_AREA_LIVING

/area/desert_dam/building/dorms/hallway_northwing
	name = "宿舍北翼"
	icon_state = "yellow"

/area/desert_dam/building/dorms/hallway_westwing
	name = "宿舍西翼"
	icon_state = "green"

/area/desert_dam/building/dorms/hallway_eastwing
	name = "宿舍东翼"
	icon_state = "purple"

/area/desert_dam/building/dorms/restroom
	name = "宿舍淋浴间"
	icon_state = "blue-red"

/area/desert_dam/building/dorms/pool
	name = "宿舍泳池室"
	icon_state = "red"


//Medical
/area/desert_dam/building/medical
	minimap_color = MINIMAP_AREA_MEDBAY

/area/desert_dam/building/medical/garage
	name = "医疗车库"
	icon_state = "garage"

/area/desert_dam/building/medical/emergency_room
	name = "医疗急救室"
	icon_state = "medbay"

/area/desert_dam/building/medical/treatment_room
	name = "医疗室"
	icon_state = "medbay2"

/area/desert_dam/building/medical/lobby
	name = "医疗大厅"
	icon_state = "medbay3"

/area/desert_dam/building/medical/chemistry
	name = "医疗药房"
	icon_state = "medbay"

/area/desert_dam/building/medical/west_wing_hallway
	name = "医疗西翼"
	icon_state = "medbay2"

/area/desert_dam/building/medical/north_wing_hallway
	name = "医疗北翼"
	icon_state = "medbay3"

/area/desert_dam/building/medical/east_wing_hallway
	name = "医疗东翼"
	icon_state = "medbay"

/area/desert_dam/building/medical/primary_storage
	name = "医疗主储存区"
	icon_state = "red"

/area/desert_dam/building/medical/surgery_room_one
	name = "医疗手术室一号"
	icon_state = "yellow"

/area/desert_dam/building/medical/surgery_room_two
	name = "医疗手术室二"
	icon_state = "purple"

/area/desert_dam/building/medical/surgery_observation
	name = "医疗手术观察"
	icon_state = "medbay2"

/area/desert_dam/building/medical/morgue
	name = "医疗停尸间"
	icon_state = "blue"

/area/desert_dam/building/medical/break_room
	name = "医疗休息室"
	icon_state = "medbay"

/area/desert_dam/building/medical/CMO
	name = "首席医疗官办公室"
	icon_state = "CMO"

/area/desert_dam/building/medical/office1
	name = "一号医疗办公室"
	icon_state = "red"

/area/desert_dam/building/medical/office2
	name = "医疗办公室二"
	icon_state = "blue"

/area/desert_dam/building/medical/patient_wing
	name = "医疗病患区"
	icon_state = "medbay2"

/area/desert_dam/building/medical/virology_wing
	name = "医疗病毒学翼区"
	icon_state = "medbay3"

/area/desert_dam/building/medical/virology_isolation
	name = "医疗病毒学隔离室"
	icon_state = "medbay"

/area/desert_dam/building/medical/medsecure
	name = "医疗病毒学隔离室"
	icon_state = "red"

/area/desert_dam/building/medical
	name = "医疗"
	icon_state = "medbay2"


//Warehouse
/area/desert_dam/building/warehouse
	minimap_color = MINIMAP_AREA_REQ

/area/desert_dam/building/warehouse/warehouse
	name = "仓库"
	icon_state = "yellow"

/area/desert_dam/building/warehouse/loading
	name = "仓库装卸区"
	icon_state = "red"

/area/desert_dam/building/warehouse/breakroom
	name = "仓库休息室"
	icon_state = "green"



//Hydroponics
/area/desert_dam/building/hydroponics
	minimap_color = MINIMAP_AREA_LIVING

/area/desert_dam/building/hydroponics/hydroponics
	name = "水培"
	icon_state = "hydro"

/area/desert_dam/building/hydroponics/hydroponics_storage
	name = "水培储藏室"
	icon_state = "green"

/area/desert_dam/building/hydroponics/hydroponics_loading
	name = "水培室装载间"
	icon_state = "garage"

/area/desert_dam/building/hydroponics/hydroponics_breakroom
	name = "水培休息室"
	icon_state = "red"


//Telecoms
/area/desert_dam/building/telecommunication
	name = "通信系统"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_COMMAND

//Water Treatment Plant 1
/area/desert_dam/building/water_treatment_one
	name = "水处理一号"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI
	requires_power = FALSE

/area/desert_dam/building/water_treatment_one/lobby
	name = "水处理一号大厅"
	icon_state = "red"
	requires_power = TRUE

/area/desert_dam/building/water_treatment_one/breakroom
	name = "水处理一号休息室"
	icon_state = "green"
	requires_power = TRUE

/area/desert_dam/building/water_treatment_one/garage
	name = "一号水处理车库"
	icon_state = "garage"
	requires_power = TRUE

/area/desert_dam/building/water_treatment_one/sedimentation
	name = "水处理一号沉淀池"
	icon_state = "blue"
	requires_power = TRUE

/area/desert_dam/building/water_treatment_one/equipment
	name = "水处理一号设备间"
	icon_state = "red"
	requires_power = TRUE

/area/desert_dam/building/water_treatment_one/hallway
	name = "水处理一号走廊"
	icon_state = "purple"
	requires_power = TRUE

/area/desert_dam/building/water_treatment_one/control_room
	name = "水处理一号控制室"
	icon_state = "yellow"
	requires_power = TRUE

/area/desert_dam/building/water_treatment_one/purification
	name = "水处理一号净化站"
	icon_state = "green"
	requires_power = TRUE

/area/desert_dam/building/water_treatment_one/floodgate_control
	name = "一号水处理厂防洪闸控制"
	icon_state = "green"
	requires_power = TRUE

/area/desert_dam/building/water_treatment_one/floodgate_control/central
	name = "中央防洪闸控制"
	icon_state = "green"
	requires_power = TRUE

/area/desert_dam/building/water_treatment_one/floodgate_control/central2
	name = "中央防洪闸控制存储室"
	icon_state = "green"
	requires_power = TRUE

//Water Treatment Plant 2
/area/desert_dam/building/water_treatment_two
	name = "水处理设施二"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/desert_dam/building/water_treatment_two/lobby
	name = "水处理二区大厅"
	icon_state = "red"

/area/desert_dam/building/water_treatment_two/breakroom
	name = "水处理二号休息室"
	icon_state = "green"

/area/desert_dam/building/water_treatment_two/garage
	name = "水处理厂二号车库"
	icon_state = "garage"

/area/desert_dam/building/water_treatment_two/sedimentation
	name = "水处理二区沉淀池"
	icon_state = "blue"

/area/desert_dam/building/water_treatment_two/equipment
	name = "水处理二号设备"
	icon_state = "red"

/area/desert_dam/building/water_treatment_two/hallway
	name = "水处理二区走廊"
	icon_state = "purple"

/area/desert_dam/building/water_treatment_two/control_room
	name = "水处理二号控制室"
	icon_state = "yellow"

/area/desert_dam/building/water_treatment_two/purification
	name = "水处理厂二号净化室"
	icon_state = "green"

/area/desert_dam/building/water_treatment_two/floodgate_control
	name = "水处理二号防洪闸控制"
	icon_state = "green"


//Library UNUSED
/*
/area/desert_dam/building/library/library
	name = "图书馆"
	icon_state = "library"
/area/desert_dam/building/library/restroom
	name = "图书馆洗手间"
	icon_state = "green"
/area/desert_dam/building/library/studyroom
	name = "图书馆自习室"
	icon_state = "purple"
*/

//Security
/area/desert_dam/building/security
	minimap_color = MINIMAP_AREA_SEC

/area/desert_dam/building/security/prison
	name = "安全监狱"
	icon_state = "sec_prison"

/area/desert_dam/building/security/marshals_office
	name = "安保局长办公室"
	icon_state = "sec_hos"

/area/desert_dam/building/security/armory
	name = "安全军械库"
	icon_state = "armory"

/area/desert_dam/building/security/warden
	name = "安保官办公室"
	icon_state = "Warden"

/area/desert_dam/building/security/interrogation
	name = "安全审讯"
	icon_state = "interrogation"

/area/desert_dam/building/security/backroom
	name = "安全审讯"
	icon_state = "sec_backroom"

/area/desert_dam/building/security/observation
	name = "安全观察"
	icon_state = "observatory"

/area/desert_dam/building/security/detective
	name = "安保侦探办公室"
	icon_state = "detective"

/area/desert_dam/building/security/office
	name = "安全办公室"
	icon_state = "yellow"

/area/desert_dam/building/security/lobby
	name = "安全大厅"
	icon_state = "green"

/area/desert_dam/building/security/northern_hallway
	name = "安全区北走廊"
	icon_state = "purple"

/area/desert_dam/building/security/courtroom
	name = "安全法庭"
	icon_state = "courtroom"

/area/desert_dam/building/security/evidence
	name = "安保证据"
	icon_state = "red"

/area/desert_dam/building/security/holding
	name = "安全拘留室"
	icon_state = "yellow"

/area/desert_dam/building/security/southern_hallway
	name = "安全区南走廊"
	icon_state = "green"

/area/desert_dam/building/security/deathrow
	name = "安全区死囚牢房"
	icon_state = "cells_max_n"

/area/desert_dam/building/security/execution_chamber
	name = "安全处决室"
	icon_state = "red"

/area/desert_dam/building/security/staffroom
	name = "安保人员休息室"
	icon_state = "security"

//Church
/area/desert_dam/building/church
	name = "教堂"
	icon_state = "courtroom"
	minimap_color = MINIMAP_AREA_LIVING

//Mining area
/area/desert_dam/building/mining
	minimap_color = MINIMAP_AREA_REQ

/area/desert_dam/building/mining/workshop
	name = "采矿工坊"
	icon_state = "yellow"

/area/desert_dam/building/mining/workshop_foyer
	name = "采矿工坊前厅"
	icon_state = "purple"

//Legacy Areas for mining
	/*
/area/desert_dam/building/mining/garage
	name = "采矿车库"
	icon_state = "garage"
/area/desert_dam/building/mining/boxing_room
	name = "采矿拳击室"
	icon_state = "red"
/area/desert_dam/building/mining/loading_room
	name = "采矿装载区"
	icon_state = "yellow"
/area/desert_dam/building/mining/break_room
	name = "采矿休息室"
	icon_state = "purple"
/area/desert_dam/building/mining/locker_room
	name = "采矿更衣室"
	icon_state = "green"
/area/desert_dam/building/mining/lobby
	name = "采矿大厅"
	icon_state = "red"
/area/desert_dam/building/mining/front_desk
	name = "采矿前台"
	icon_state = "green"
/area/desert_dam/building/mining/foremans_office
	name = "矿工领班办公室"
	icon_state = "yellow"
/area/desert_dam/building/mining/maintenance_north
	name = "采矿维护区北侧"
	icon_state = "dark160"
/area/desert_dam/building/mining/maintenance_east
	name = "东侧采矿维护区"
	icon_state = "dark128"
/area/desert_dam/building/mining/bunkhouse
	name = "矿工营房"
	icon_state = "red"
/area/desert_dam/building/mining/construction_site
	name = "施工场地"
	icon_state = "yellow"
*/


//NorthWest Lab Buildings
/area/desert_dam/building/lab_northwest
	minimap_color = MINIMAP_AREA_RESEARCH

/area/desert_dam/building/lab_northwest/west_lab_robotics
	name = "西区实验室机器人学"
	icon_state = "ass_line"

/area/desert_dam/building/lab_northwest/west_lab_robotics_mechbay
	name = "西区实验室机甲库"
	icon_state = "purple"

/area/desert_dam/building/lab_northwest/west_lab_east_hallway
	name = "西侧实验室走廊"
	icon_state = "red"

/area/desert_dam/building/lab_northwest/west_lab_west_hallway
	name = "西侧实验室走廊"
	icon_state = "red"

/area/desert_dam/building/lab_northwest/west_lab_maintenance
	name = "西区实验室维护通道"
	icon_state = "purple"

/area/desert_dam/building/lab_northwest/west_lab_chemistry
	name = "西实验室化学"
	icon_state = "yellow"

/area/desert_dam/building/lab_northwest/west_lab_cafeteria
	name = "西区实验室食堂"
	icon_state = "blue"

/area/desert_dam/building/lab_northwest/west_lab_kitchen
	name = "西区实验室厨房"
	icon_state = "kitchen"

/area/desert_dam/building/lab_northwest/west_lab_dormitory
	name = "西区实验室宿舍"
	icon_state = "red"

/area/desert_dam/building/lab_northwest/west_lab_meeting_room
	name = "西实验室会议室"
	icon_state = "purple"

/area/desert_dam/building/lab_northwest/west_lab_xenoflora
	name = "西侧实验室异形植物群"
	icon_state = "purple"

/area/desert_dam/building/lab_northeast/checkpoint
	name = "东实验室检查点"
	icon_state = "red"

/area/desert_dam/building/lab_northeast/garage
	name = "东区实验室车库"
	icon_state = "garage"



//EXTERIOR
//under open sky
/area/desert_dam/exterior
	always_unpowered = TRUE

/area/desert_dam/exterior/rock
	name = "岩石"
	icon_state = "cave"

/area/desert_dam/exterior/landing
	always_unpowered = FALSE
	minimap_color = MINIMAP_AREA_LZ

//Landing Pad for the Alamo. THIS IS NOT THE SHUTTLE AREA
/area/desert_dam/exterior/landing/landing_pad_one
	name = "机场着陆坪"
	icon_state = "landing_pad"
	minimap_color = MINIMAP_AREA_LZ
	requires_power = FALSE
/area/desert_dam/exterior/landing/landing_pad_one_external
	name = "空降着陆谷"
	icon_state = "landing_pad_ext"
	minimap_color = MINIMAP_AREA_COLONY


//Landing Pad for the Normandy. THIS IS NOT THE SHUTTLE AREA
/area/desert_dam/exterior/landing/landing_pad_two
	name = "东部机场着陆坪"
	icon_state = "landing_pad"
	minimap_color = MINIMAP_AREA_LZ
	requires_power = FALSE
/area/desert_dam/exterior/landing/landing_pad_two_external
	name = "东部着陆谷"
	icon_state = "landing_pad_ext"
	minimap_color = MINIMAP_AREA_COLONY

//Landing Pad for the abandoned tradeship, not used for transit. THIS IS NOT THE SHUTTLE AREA
/area/desert_dam/exterior/landing/landing_pad_three
	name = "航空港着陆坪"
	icon_state = "landing_pad"
	minimap_color = MINIMAP_AREA_LZ
	requires_power = FALSE
/area/desert_dam/exterior/landing/landing_pad_three_external
	name = "航空港着陆谷"
	icon_state = "landing_pad_ext"
	minimap_color = MINIMAP_AREA_COLONY

//Valleys
//Near LZ
//TODO: incorporate valleys and substrations for floodlight coverage

/area/desert_dam/exterior/valley
	minimap_color = MINIMAP_AREA_COLONY
	always_unpowered = FALSE

/area/desert_dam/exterior/valley/valley_northwest
	name = "西北山谷"
	icon_state = "valley_north_west"
/area/desert_dam/exterior/valley/valley_cargo
	name = "运输谷"
	icon_state = "valley_south_west"
	requires_power = FALSE
/area/desert_dam/exterior/valley/valley_telecoms
	name = "通讯谷"
	icon_state = "valley_west"
	requires_power = FALSE
/area/desert_dam/exterior/valley/tradeship
	name = "纳米传讯 杰瑞-卡伯特"
	icon_state = "dark160"
	requires_power = FALSE
	minimap_color = MINIMAP_AREA_SHIP

//Away from LZ

/area/desert_dam/exterior/valley/valley_labs
	name = "实验室山谷"
	icon_state = "valley_north"
	requires_power = FALSE
/area/desert_dam/exterior/valley/valley_mining
	name = "采矿谷"
	icon_state = "valley_east"
	requires_power = FALSE
/area/desert_dam/exterior/valley/valley_civilian
	name = "平民谷"
	icon_state = "valley_south_excv"
	requires_power = FALSE
/area/desert_dam/exterior/valley/valley_medical
	name = "医疗谷"
	icon_state = "valley"
	requires_power = FALSE

/area/desert_dam/exterior/valley/valley_medical_south
	name = "南方医疗谷"
	icon_state = "valley"
	requires_power = FALSE
/area/desert_dam/exterior/valley/valley_hydro
	name = "水谷"
	icon_state = "valley"
/area/desert_dam/exterior/valley/valley_crashsite
	name = "坠机点山谷"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_CAVES
	requires_power = FALSE
/area/desert_dam/exterior/valley/north_valley_dam
	name = "北坝谷"
	icon_state = "valley"
	requires_power = FALSE
/area/desert_dam/exterior/valley/south_valley_dam
	name = "南坝谷"
	icon_state = "valley"
/area/desert_dam/exterior/valley/bar_valley_dam
	name = "巴伦谷"
	icon_state = "yellow"
	requires_power = FALSE
/area/desert_dam/exterior/valley/valley_wilderness
	name = "荒野山谷"
	icon_state = "central"
	requires_power = FALSE

//End of the river areas, no Next
/area/desert_dam/exterior/river/riverside_northwest
	name = "西北河床"
	icon_state = "bluenew"
/area/desert_dam/exterior/river/riverside_central_north
	name = "北部中央河床"
	icon_state = "purple"
/area/desert_dam/exterior/river/riverside_central_south
	name = "南部中央河床"
	icon_state = "purple"
/area/desert_dam/exterior/river/riverside_south
	name = "南部河床"
	icon_state = "bluenew"
/area/desert_dam/exterior/river/riverside_east
	name = "东部河床"
	icon_state = "bluenew"
/area/desert_dam/exterior/river/riverside_northeast
	name = "东北河床"
	icon_state = "bluenew"
//The filtration plants - This area isn't for the WHOLE plant, but the areas that have water in them, so the water changes color as well.

/area/desert_dam/exterior/river/filtration_a
	name = "过滤厂A"

/area/desert_dam/exterior/river/filtration_b
	name = "过滤厂B"

//Areas that are rivers, but will not change because they're before the floodgates
/area/desert_dam/exterior/river_mouth/southern
	name = "南部河口"
	icon_state = "purple"

/area/desert_dam/exterior/river_mouth/eastern
	name = "东部河口"
	icon_state = "purple"

/area/desert_dam/landing/console
	name = "LZ1 '管理员'"
	icon_state = "tcomsatcham"
	requires_power = 0
	area_flags = NO_DROPPOD

/area/desert_dam/landing/console2
	name = "LZ2 '补给'"
	icon_state = "tcomsatcham"
	requires_power = 0
	area_flags = NO_DROPPOD

//Transit Shuttle
/area/shuttle/tri_trans1/alpha
	icon_state = "shuttle"
/area/shuttle/tri_trans1/away
	icon_state = "away1"

/area/shuttle/tri_trans2/alpha
	icon_state = "shuttlered"
/area/shuttle/tri_trans2/away
	icon_state = "away2"
/area/shuttle/tri_trans2/omega
	icon_state = "shuttle2"

