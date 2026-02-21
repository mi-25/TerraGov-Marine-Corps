/*
* Areas for the Ice Colony map (nickname is "Shiva's Snowball")
* Area inheritance logic :
* Exterior Areas all use the same code, under /exterior branch. Those are NOT homogenous but used to give rough locations to area scanners. THIS INCLUDES UNDERGROUND UNBUILT AREAS
* Exterior is divided into /surface and /underground for ease of navigation. BOTH PATHS MUST INHERIT EXTERIOR
* Otherwise, all areas on the surface excluding external areas use /surface, no exceptions. All areas underground use /underground, no exceptions
* Areas are grouped by building if possible, this excludes some repeating buildings like storage units
* ELEVATORS AND SHUTTLES ARE SEGREGATED AT THE END OF THE FILE IF APPLICABLE
*/

//Base Instance
/area/ice_colony
	name = "冰封殖民地"
	icon_state = "cliff_blocked"
	ambience = list('sound/ambience/ambi_snow.ogg')

/*
*  ----------------
* | Exterior Areas |
*  ----------------
*/

/area/ice_colony/exterior
	name = "冰封殖民地"
	icon_state = "cliff_blocked"
	requires_power = TRUE
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE
	ambience = list('sound/ambience/ambi_snow.ogg' = 1, 'sound/effects/wind/wind_2_1.ogg' = 1, 'sound/effects/wind/wind_2_2.ogg' = 1, 'sound/effects/wind/wind_3_1.ogg' = 1, 'sound/effects/wind/wind_4_1.ogg' = 1, 'sound/effects/wind/wind_4_2.ogg' = 1, 'sound/effects/wind/wind_5_1.ogg' = 1)
	temperature = ICE_COLONY_TEMPERATURE
	minimap_color = MINIMAP_AREA_COLONY

/*
* Exterior - Surface
*/

//Rough color code for the surface exteriors
//Mountains : Deep Blue/Purple
//Valleys : Light Blue/Cyan
//Open Ground : Gray
//Buildings : Native Color. Command stays Blue, Clinic is Red

/area/ice_colony/exterior/surface
	name = "冰封殖民地 - 地表区域"


//Equivalent of space. None of this area should be accessible. If these are valleys, make separate areas
/area/ice_colony/exterior/surface/cliff
	name = "冰崖"
	icon_state = "cliff_blocked"

//Landing Pad for the Rasp. THIS IS NOT THE SHUTTLE AREA
/area/ice_colony/exterior/surface/landing_pad
	name = "航空港着陆坪"
	icon_state = "landing_pad"
	outside = FALSE
	always_unpowered = FALSE
	minimap_color = MINIMAP_AREA_LZ

//Landing Pad for the Vindi. THIS IS NOT THE SHUTTLE AREA
/area/ice_colony/exterior/surface/landing_pad2
	name = "紧急着陆平台"
	icon_state = "landing_pad"
	outside = FALSE
	always_unpowered = FALSE
	minimap_color = MINIMAP_AREA_LZ

//Everything around the physical landing pad
/area/ice_colony/exterior/surface/landing_pad_external
	name = "航空港着陆谷"
	icon_state = "landing_pad_ext"

//Aerodrome Container Yard
/area/ice_colony/exterior/surface/container_yard
	name = "航空港集装箱堆场"
	icon_state = "container_yard"

//The FRONT of the aerodromes.
/area/ice_colony/exterior/surface/taxiway
	name = "机场滑行道"
	icon_state = "landing_pad_taxiway"
//
// Valleys
// This is for all the areas mostly surrounded by mountains
// As of current, notably includes Excavation, Research, Requesition Storage, the North and Telecommunications
//

/area/ice_colony/exterior/surface/valley
	name = "冰崖谷"
	icon_state = "valley"

/area/ice_colony/exterior/surface/valley/north
	name = "北部山谷"
	icon_state = "valley_north"

/area/ice_colony/exterior/surface/valley/northeast
	name = "东北山谷"
	icon_state = "valley_north_east"

/area/ice_colony/exterior/surface/valley/northwest
	name = "西北山谷"
	icon_state = "valley_north_west"

/area/ice_colony/exterior/surface/valley/west
	name = "西部山谷"
	icon_state = "valley_west"

/area/ice_colony/exterior/surface/valley/south
	name = "南部山谷"
	icon_state = "valley_south"

/area/ice_colony/exterior/surface/valley/south/excavation
	name = "南部山谷 - 挖掘场"
	icon_state = "valley_south_excv"
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/exterior/surface/valley/southeast
	name = "东部山谷"
	icon_state = "valley_east"

/area/ice_colony/exterior/surface/valley/southwest
	name = "西南山谷"
	icon_state = "valley_south_west"

//
// Clearing
// The Colony Center, so to speak
//

/area/ice_colony/exterior/surface/clearing
	name = "冰原殖民地清理区"
	icon_state = "clear"

/area/ice_colony/exterior/surface/clearing/pass
	name = "殖民地中央谷地"
	icon_state = "clear_pass"

/area/ice_colony/exterior/surface/clearing/south
	name = "殖民地南部空地"
	icon_state = "clear_south"

/area/ice_colony/exterior/surface/clearing/north
	name = "殖民地北部空地"
	icon_state = "clear_north"

/*
* Exterior - Underground
*/

/area/ice_colony/exterior/underground
	name = "冰封殖民地 - 地下外部"
	icon_state = "cave"
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES


//
// Caves
// Extremely simple, anything that is not built is a cave
// For style, we have two subtypes. Open, and dig site
// These do NOT have particular names
//

/area/ice_colony/exterior/underground/caves
	name = "地下洞穴"
	icon_state = "cave"

/area/ice_colony/exterior/underground/caves/ice_nw
	name = "西北冰窟"
	icon_state = "icecave_nw"
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/exterior/underground/caves/ice_se
	name = "东南冰窟"
	icon_state = "icecave_se"
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/exterior/underground/caves/ice_w
	name = "西部冰窟"
	icon_state = "icecave_w"
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/exterior/underground/caves/open
	icon_state = "explored"

/area/ice_colony/exterior/underground/caves/open/garbledradio
	icon_state = "explored"
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/exterior/underground/caves/dig
	icon_state = "mining_living"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/ice_colony/exterior/underground/caves/rock
	name = "封闭区域"
	icon_state = "transparent"
	area_flags = CANNOT_NUKE

/*
*  ---------------------
* | Built Surface Areas |
*  ---------------------
*/

/area/ice_colony/surface
	name = "冰封殖民地 - 地表建筑"
	icon_state = "clear"
	ceiling = CEILING_METAL
	outside = FALSE

/*
* Surface - Bar
*/


/area/ice_colony/surface/bar
	name = "防冻剂"
	icon_state = "bar"
	minimap_color = MINIMAP_AREA_LIVING

/area/ice_colony/surface/bar/bar
	name = "防冻酒吧"

/area/ice_colony/surface/bar/canteen
	name = "防冻水壶"
	icon_state = "kitchen"

/*
* Surface - Clinic
*/

/area/ice_colony/surface/clinic
	name = "极光医疗诊所"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/ice_colony/surface/clinic/lobby
	name = "极光医疗诊所大厅"

/area/ice_colony/surface/clinic/treatment
	name = "极光医疗诊所治疗"
	icon_state = "medbay2"

/area/ice_colony/surface/clinic/storage
	name = "极光医疗诊所仓库"
	icon_state = "medbay3"

/*
* Surface - Colony Administration
*/

/area/ice_colony/surface/command
	name = "殖民地管理局"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_COMMAND

/area/ice_colony/surface/command/checkpoint
	name = "殖民地行政安检站"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/ice_colony/surface/command/control
	name = "殖民地控制中心"
	icon_state = "maintcentral"

/area/ice_colony/surface/command/control/office
	name = "殖民地控制中心办公室"
	icon_state = "bridge"

/area/ice_colony/surface/command/control/pv1
	name = "殖民地控制私人办公室"
	icon_state = "yellow"

/area/ice_colony/surface/command/control/pv2
	name = "殖民地控制私人办公室"
	icon_state = "green"

/area/ice_colony/surface/command/crisis
	name = "殖民地危机室"
	icon_state = "head_quarters"

/*
* Surface - Disposals
*/

/area/ice_colony/surface/disposals
	name = "地表废物处理"
	icon_state = "disposal"

/*
* Surface - Dormitories
*/

/area/ice_colony/surface/dorms
	name = "宿舍区"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_LIVING

/area/ice_colony/surface/dorms/canteen
	name = "宿舍食堂"
	icon_state = "kitchen"

/area/ice_colony/surface/dorms/lavatory
	name = "宿舍区盥洗室"
	icon_state = "janitor"

/area/ice_colony/surface/dorms/restroom_w
	name = "西区宿舍卫生间"
	icon_state = "toilet"

/area/ice_colony/surface/dorms/restroom_e
	name = "东区宿舍卫生间"
	icon_state = "toilet"

/*
* Surface - Engineering
*/

/area/ice_colony/surface/engineering
	name = "工程部"
	icon_state = "engine_hallway"
	minimap_color = MINIMAP_AREA_ENGI

/area/ice_colony/surface/engineering/generator
	name = "工程发电机房"
	icon_state = "engine"

/area/ice_colony/surface/engineering/electric
	name = "工程电力储存室"
	icon_state = "engine_storage"

/area/ice_colony/surface/engineering/tool
	name = "工程工具储藏室"
	icon_state = "storage"

/*
* Surface - Excavation Preparation
*/

/area/ice_colony/surface/excavation
	name = "勘探前哨站"
	icon_state = "mining_outpost"
	minimap_color = MINIMAP_AREA_REQ

/area/ice_colony/surface/excavationbarracks
	name = "挖掘营房"
	icon_state = "mining_outpost"
	minimap_color = MINIMAP_AREA_REQ

/area/ice_colony/surface/excavation/storage
	name = "挖掘前哨外部存储"
	icon_state = "mining_storage"

/*
* Surface - Garage
*/

/area/ice_colony/surface/garage
	name = "机库"
	icon_state = "garage"
	minimap_color = MINIMAP_AREA_ENGI

/area/ice_colony/surface/garage/one
	name = "机库西侧单元"
	icon_state = "garage_one"

/area/ice_colony/surface/garage/two
	name = "东部车库单元"
	icon_state = "garage_two"

/area/ice_colony/surface/garage/three
	name = "西南殖民地车库"

/area/ice_colony/surface/garage/repair
	name = "车库维修站"
	icon_state = "engine"

/*
* Surface - Hangar
*/

/area/ice_colony/surface/hangar
	name = "航空港机库"
	icon_state = "hangar"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/ice_colony/surface/hangar/hallway
	name = "航空港机库走廊"

/area/ice_colony/surface/hangar/alpha
	name = "阿尔法航空港机库"
	icon_state = "hangar_alpha"

/area/ice_colony/surface/hangar/beta
	name = "航空港机库'贝塔'"
	icon_state = "hangar_beta"

/area/ice_colony/surface/hangar/checkpoint
	name = "航空港机库安检点"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/*
* Surface - Hydroponics
*/

/area/ice_colony/surface/hydroponics
	name = "冰原殖民地水培区"
	icon_state = "hydro"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_LIVING

/area/ice_colony/surface/hydroponics/lobby
	name = "水培放松模块"
	icon_state = "garden"

/area/ice_colony/surface/hydroponics/north
	name = "水培区北翼"
	icon_state = "hydro_north"

/area/ice_colony/surface/hydroponics/south
	name = "水培区南翼"
	icon_state = "hydro_south"

/*
* Surface - Mining
*/

/area/ice_colony/surface/mining
	name = "采矿前哨站"
	icon_state = "mining_production"
	minimap_color = MINIMAP_AREA_REQ

/*
* Surface - Power
*/

/area/ice_colony/surface/substation
	name = "地表电力分站"
	icon_state = "dk_yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/ice_colony/surface/substation/smes
	name = "地表电力变电站 SMES"
	icon_state = "substation"

/*
* Surface - Requesitions
*/

/area/ice_colony/surface/requesitions
	name = "地表补给仓库"
	icon_state = "quartstorage"
	minimap_color = MINIMAP_AREA_ENGI

/*
* Surface - Research
*/

/area/ice_colony/surface/research
	name = "奥米克戎穹顶"
	icon_state = "toxlab"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/ice_colony/surface/research/tech_storage
	name = "奥米克戎穹顶技术存储室"
	icon_state = "primarystorage"

/area/ice_colony/surface/research/field_gear
	name = "奥米克戎穹顶野外装备储存室"
	icon_state = "eva"

/area/ice_colony/surface/research/temporary
	name = "奥米克戎穹顶临时储存区"
	icon_state = "storage"

/*
* Surface - Storage Units
*/

/area/ice_colony/surface/storage_unit
	name = "存储单元"
	icon_state = "storage"

/area/ice_colony/surface/storage_unit/research
	name = "存储单元研究"
	icon_state = "storage"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/ice_colony/surface/storage_unit/telecomms
	name = "通讯塔存储单元"
	icon_state = "storage"

/area/ice_colony/surface/storage_unit/power
	name = "存储单元电源"
	icon_state = "storage"

/*
* Surface - Telecommunications
*/

/area/ice_colony/surface/tcomms
	name = "殖民地通讯"
	icon_state = "tcomsatcham"

/*
*  -------------------------
* | Built Underground Areas |
*  -------------------------
*/

/area/ice_colony/underground
	name = "冰封殖民地 - 建于地下"
	icon_state = "explored"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES

/*
* Underground - Crew Areas
*/

/area/ice_colony/underground/crew
	name = "地下船员区"
	icon_state = "crew_quarters"
	minimap_color = MINIMAP_AREA_LIVING_CAVE

/area/ice_colony/underground/crew/dorm_l
	name = "西宿舍区"
	icon_state = "Sleep"

/area/ice_colony/underground/crew/dorm_r
	name = "东区宿舍"
	icon_state = "Sleep"

/area/ice_colony/underground/crew/canteen
	name = "地下食堂"
	icon_state = "kitchen"

/area/ice_colony/underground/crew/disposals
	name = "地下处理系统"
	icon_state = "disposal"

/area/ice_colony/underground/crew/lavatory
	name = "地下盥洗室"
	icon_state = "janitor"

/area/ice_colony/underground/crew/leisure
	name = "地下休闲区"

/area/ice_colony/underground/crew/bball
	name = "地下运动中心"

/area/ice_colony/underground/crew/bball/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/underground/crew/chapel
	name = "地下教堂"
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/underground/crew/library
	name = "地下图书馆"
	icon_state = "library"
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/underground/crew/morgue
	name = "地下太平间"
	icon_state = "morgue"
	ceiling = CEILING_UNDERGROUND

/*
* Underground - Colony Administration
*/

/area/ice_colony/underground/command
	name = "殖民地地下管理局"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_COMMAND_CAVE

/area/ice_colony/underground/command/checkpoint
	name = "地下殖民地行政大厅"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/ice_colony/underground/command/center
	name = "殖民地地下行政指挥中心"
	icon_state = "head_quarters"

/area/ice_colony/underground/command/pv1
	name = "殖民地地下行政私人办公室"
	icon_state = "yellow"

/area/ice_colony/underground/command/pv2
	name = "殖民地地下行政私人办公室"
	icon_state = "green"

/*
* Underground - Engineering
*/

/area/ice_colony/underground/engineering
	name = "地下工程"
	icon_state = "engine_hallway"
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/underground/engineering/locker
	name = "地下工程储物间"
	icon_state = "storage"


/area/ice_colony/underground/engineering/substation
	name = "地下电力变电站"
	icon_state = "substation"
	ceiling = CEILING_UNDERGROUND

/*
* Underground - Hallways
*/

/area/ice_colony/underground/hallway
	name = "地下走廊"
	icon_state = "hallC1"

/area/ice_colony/underground/hallway/north_west
	name = "西北地下走廊"

/area/ice_colony/underground/hallway/north_west/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/underground/hallway/south_east
	name = "东南地下走廊"
	icon_state = "hallF"

/area/ice_colony/underground/hallway/south_east/garbledradio
	ceiling = CEILING_UNDERGROUND

/*
* Underground - Maintenance
*/

/area/ice_colony/underground/maintenance
	name = "地下维护"
	icon_state = "maintcentral"

/area/ice_colony/underground/maintenance/central
	name = "地下中央维护区"

/area/ice_colony/underground/maintenance/central/construction
	name = "地下中央维护工程"
	icon_state = "construction"

/area/ice_colony/underground/maintenance/security
	name = "地下安保维护"
	icon_state = "maint_security_port"

/area/ice_colony/underground/maintenance/engineering
	name = "地下工程维护"
	icon_state = "maint_engineering"

/area/ice_colony/underground/maintenance/engineering/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/underground/maintenance/research
	name = "地下研究设施维护区"
	icon_state = "maint_research_port"

/area/ice_colony/underground/maintenance/east
	name = "东部地下维护区"
	icon_state = "fmaint"

/area/ice_colony/underground/maintenance/south
	name = "地下南部维护区"
	icon_state = "asmaint"

/area/ice_colony/underground/maintenance/north
	name = "地下北部维护区"
	icon_state = "asmaint"
	ceiling = CEILING_UNDERGROUND

/*
* Underground - Medbay
*/

/area/ice_colony/underground/medical
	name = "地下医疗实验室"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY_CAVE

/area/ice_colony/underground/medical/lobby
	name = "地下医疗实验室大厅"

/area/ice_colony/underground/medical/lobby/garbledradio
	name = "地下医疗实验室大厅"
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/underground/medical/hallway
	name = "地下医疗实验室走廊"
	icon_state = "medbay2"

/area/ice_colony/underground/medical/hallway/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/underground/medical/storage
	name = "地下医疗实验室储藏室"
	icon_state = "storage"

/area/ice_colony/underground/medical/treatment
	name = "地下医疗实验室治疗"
	icon_state = "medbay3"

/area/ice_colony/underground/medical/treatment/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/underground/medical/or
	name = "地下医疗实验室手术室"
	icon_state = "surgery"
	ceiling = CEILING_UNDERGROUND

/*
* Underground - Reception
*/

/area/ice_colony/underground/reception
	name = "地下接待区"
	icon_state = "showroom"

/area/ice_colony/underground/reception/checkpoint_north
	name = "地下接待区北部安检点"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC_CAVE
	ceiling = CEILING_UNDERGROUND

/area/ice_colony/underground/reception/checkpoint_south
	name = "地下接待区南部安检点"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/ice_colony/underground/reception/toilet_men
	name = "地下接待区男卫生间"
	icon_state = "toilet"

/area/ice_colony/underground/reception/toilet_women
	name = "地下接待区女卫生间"
	icon_state = "toilet"

/*
* Underground - Requesition
*/

/area/ice_colony/underground/requesition
	name = "地下补给"
	icon_state = "quart"
	minimap_color = MINIMAP_AREA_REQ_CAVE

/area/ice_colony/underground/requesition/lobby
	name = "地下补给大厅"
	icon_state = "quartoffice"

/area/ice_colony/underground/requesition/storage
	name = "地下补给储藏室"
	icon_state = "quartstorage"

/area/ice_colony/underground/requesition/sec_storage
	name = "地下补给安全储存室"
	icon_state = "storage"

/*
* Underground - Research
*/

/area/ice_colony/underground/research
	name = "西塔-V研究实验室"
	icon_state = "anolab"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/ice_colony/underground/research/work
	name = "Theta-V 研究实验室工作站"
	icon_state = "toxmix"

/area/ice_colony/underground/research/storage
	name = "Theta-V 研究实验室仓库"
	icon_state = "storage"

/area/ice_colony/underground/research/sample
	name = "Theta-V 研究实验室样本隔离"
	icon_state = "anosample"

/*
* Underground - Security
*/

/area/ice_colony/underground/security
	name = "地下安全中心"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/ice_colony/underground/security/marshal
	name = "宪兵办公室"
	icon_state = "sec_hos"

/area/ice_colony/underground/security/detective
	name = "侦探办公室"
	icon_state = "detective"

/area/ice_colony/underground/security/interrogation
	name = "审讯室"
	icon_state = "interrogation"

/area/ice_colony/underground/security/backroom
	name = "地下安全中心清洁工具间"
	icon_state = "sec_backroom"

/area/ice_colony/underground/security/hallway
	name = "地下安全中心走廊"
	icon_state = "checkpoint1"

/area/ice_colony/underground/security/armory
	name = "地下安全中心军械库"
	icon_state = "armory"

/area/ice_colony/underground/security/brig
	name = "地下安全中心禁闭室"
	icon_state = "brig"

/*
* Underground - Hangar
*/

/area/ice_colony/underground/hangar
	name = "地下机库"
	icon_state = "hangar"
	ceiling = CEILING_NONE

/area/ice_colony/underground/responsehangar
	name = "殖民地响应小队机库"
	minimap_color = MINIMAP_AREA_SHIP

/area/ice_colony/underground/westroadtunnel
	name = "西侧道路隧道"

/*
* Underground - Storage
*/

/area/ice_colony/underground/storage
	name = "地下技术储藏室"
	icon_state = "storage"
	minimap_color = MINIMAP_AREA_ENGI_CAVE

/area/ice_colony/underground/storage/highsec
	name = "地下高安保技术存储区"
	icon_state = "armory"
