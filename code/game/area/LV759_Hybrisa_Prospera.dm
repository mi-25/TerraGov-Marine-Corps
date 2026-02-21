#define AMBIENT_LV759_OUTDOORS list('sound/effects/urban/outdoors/wind4.ogg','sound/effects/urban/outdoors/wind5.ogg','sound/effects/urban/outdoors/wind6.ogg','sound/effects/urban/outdoors/wind7.ogg','sound/effects/urban/outdoors/wind8.ogg','sound/effects/urban/outdoors/wind9.ogg','sound/effects/urban/outdoors/wind10.ogg','sound/effects/urban/outdoors/wind11.ogg','sound/effects/urban/outdoors/wind12.ogg','sound/effects/urban/outdoors/wind13.ogg','sound/effects/urban/outdoors/wind14.ogg','sound/effects/urban/outdoors/wind15.ogg','sound/effects/urban/outdoors/wind16.ogg','sound/effects/urban/outdoors/wind17.ogg','sound/effects/urban/outdoors/wind18.ogg','sound/effects/urban/outdoors/wind19.ogg','sound/effects/urban/outdoors/wind20.ogg','sound/effects/urban/outdoors/wind21.ogg','sound/effects/urban/outdoors/wind22.ogg','sound/effects/urban/outdoors/wind23.ogg','sound/effects/urban/outdoors/wind24.ogg','sound/effects/urban/outdoors/wind25.ogg','sound/effects/urban/outdoors/wind26.ogg','sound/effects/urban/outdoors/wind27.ogg','sound/effects/urban/outdoors/wind28.ogg',)
#define AMBIENT_LV759_INDOORS list('sound/effects/urban/indoors/indoor_wind.ogg','sound/effects/urban/indoors/indoor_wind2.ogg','sound/effects/urban/indoors/vent_1.ogg','sound/effects/urban/indoors/vent_2.ogg','sound/effects/urban/indoors/vent_3.ogg','sound/effects/urban/indoors/vent_4.ogg','sound/effects/urban/indoors/vent_5.ogg','sound/effects/urban/indoors/vent_6.ogg','sound/effects/urban/indoors/vent_7.ogg','sound/effects/urban/indoors/vent_6.ogg','sound/effects/urban/indoors/distant_sounds_1.ogg','sound/effects/urban/indoors/distant_sounds_2.ogg','sound/effects/urban/indoors/distant_sounds_3.ogg','sound/effects/urban/indoors/distant_sounds_4.ogg','sound/effects/urban/indoors/distant_sounds_5.ogg','sound/effects/urban/indoors/distant_sounds_6.ogg','sound/effects/urban/indoors/distant_sounds_7.ogg','sound/effects/urban/indoors/distant_sounds_8.ogg','sound/effects/urban/indoors/distant_sounds_9.ogg','sound/effects/urban/indoors/distant_sounds_10.ogg','sound/effects/engamb1.ogg','sound/effects/engamb2.ogg','sound/effects/engamb3.ogg','sound/effects/engamb4.ogg','sound/effects/engamb5.ogg','sound/effects/engamb6.ogg','sound/effects/engamb7.ogg',)
#define AMBIENT_LV759_DERELICTSHIP list('sound/effects/urban/indoors/derelict1.ogg','sound/effects/urban/indoors/derelict_ambience.ogg','sound/effects/urban/indoors/urban_interior.ogg','sound/effects/urban/indoors/derelict2.ogg','sound/effects/urban/indoors/derelict3.ogg','sound/effects/urban/indoors/derelict4.ogg','sound/effects/urban/indoors/derelict5.ogg','sound/effects/urban/indoors/derelict6.ogg','sound/effects/urban/indoors/derelict7.ogg','sound/effects/urban/indoors/derelict8.ogg')

//lv759 AREAS--------------------------------------//

/area/lv759
	name = "LV-759 希布瑞萨·普罗斯佩拉"
	icon = 'icons/turf/hybrisareas.dmi'
	icon_state = "hybrisa"

//parent types

/area/lv759/indoors
	name = "海布里萨 - 室内"
	icon_state = "cliff_blocked"//because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_METAL
	outside = FALSE
	always_unpowered = FALSE
	minimap_color = MINIMAP_AREA_LIVING
	ambience = AMBIENT_LV759_INDOORS

/area/lv759/outdoors
	name = "海布里萨 - 户外"
	icon_state = "cliff_blocked"//because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_NONE
	always_unpowered = TRUE
	ambience = AMBIENT_LV759_OUTDOORS

/area/lv759/oob
	name = "越界"
	icon_state = "oob"
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	always_unpowered = TRUE

// Landing Zone 1
/area/lv759/outdoors/landing_zone_1
	name = "新星医疗中心综合医院 - 应急响应一号着陆区"
	icon_state = "medical_lz1"
	minimap_color = MINIMAP_AREA_LZ
	ceiling = CEILING_NONE
	always_unpowered = FALSE

/area/lv759/indoors/landing_zone_1/flight_control_room
	name = "新星医疗中心医院综合体 - 应急响应一号着陆区 - 飞行控制室"
	icon_state = "hybrisa"
	ceiling = CEILING_METAL

/area/lv759/indoors/landing_zone_1/lz1_console
	name = "新星医疗中心综合医院 - 应急响应一号着陆区 - 阿拉莫号运输机控制台"
	icon_state = "hybrisa"
	requires_power = FALSE
	ceiling = CEILING_METAL

// Landing Zone 2
/area/lv759/outdoors/landing_zone_2
	name = "KMCC星际货运枢纽 - 二号着陆区"
	icon_state = "mining_lz2"
	minimap_color = MINIMAP_AREA_LZ
	ceiling = CEILING_NONE
	area_flavor = AREA_FLAVOR_URBAN

/area/lv759/indoors/landing_zone_2
	icon_state = "hybrisa"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/lv759/indoors/landing_zone_2/kmcc_hub_flight_control_room
	name = "KMCC星际货运枢纽 - 飞行控制室"

/area/lv759/indoors/landing_zone_2/kmcc_hub_security
	name = "KMCC星际货运枢纽 - 安检站办公室"
	icon_state = "security_checkpoint"

/area/lv759/indoors/landing_zone_2/kmcc_hub_lounge_north
	name = "KMCC星际货运枢纽 - 旅客出发区 - 北侧休息室"

/area/lv759/indoors/landing_zone_2/kmcc_hub_fuel
	name = "KMCC星际货运枢纽 - 燃料储存与维护区 - 北区"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv759/indoors/landing_zone_2/kmcc_hub_lounge_south
	name = "KMCC星际货运枢纽 - 旅客出发区 - 南侧休息厅"

/area/lv759/indoors/landing_zone_2/kmcc_hub_lounge_hallway
	name = "KMCC星际货运枢纽 - 旅客出发区 - 走廊"

/area/lv759/indoors/landing_zone_2/kmcc_hub_south_office
	name = "KMCC星际货运枢纽 - 旅客出发区 - 南侧办公室"

/area/lv759/indoors/landing_zone_2/kmcc_hub_maintenance
	name = "KMCC星际货运枢纽 - 乘客离港区 - 维护中"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv759/indoors/landing_zone_2/kmcc_hub/lz2_console
	name = "KMCC星际货运枢纽 - 诺曼底号运输机控制台"
	requires_power = FALSE

/area/lv759/indoors/landing_zone_2/kmcc_hub_cargo
	name = "KMCC星际货运枢纽 - 货物处理中心"
	icon_state = "mining_cargo"
	minimap_color = MINIMAP_AREA_REQ

/area/lv759/indoors/landing_zone_2/kmcc_hub_maintenance_north
	name = "KMCC星际货运枢纽 - 货物处理中心 - 维护区"
	icon_state = "mining"
	minimap_color = MINIMAP_AREA_ENGI

// Derelict Ship
/area/lv759/indoors/derelict_ship
	name = "废弃飞船"
	icon_state = "derelictship"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_SEC_CAVE
	ambience = AMBIENT_LV759_DERELICTSHIP

// Caves
/area/lv759/indoors/nt_research_complex_entrance
	name = "纳米传讯 - 高级生化基因组研究综合体 - 北主入口"
	ceiling = CEILING_UNDERGROUND
	minimap_color = MINIMAP_AREA_CAVES

/area/lv759/indoors/caves
	name = "LV759 - 洞穴"
	icon_state = "caves_west"
	always_unpowered = TRUE
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_CAVES
	ambience = list('sound/effects/urban/outdoors/windy_caverns_1.ogg',
	'sound/effects/urban/outdoors/windy_caverns_2.ogg',
	'sound/effects/urban/outdoors/windy_caverns_3.ogg',
	'sound/effects/urban/outdoors/deepcave1.ogg',
	'sound/effects/urban/outdoors/deepcave2.ogg',
	)

/area/lv759/indoors/caves/west_caves
	name = "洞穴 - 西侧"

/area/lv759/indoors/caves/west_caves_alarm
	name = "洞穴 - 西侧"
	icon_state = "caves_west"

/area/lv759/indoors/caves/east_caves
	name = "洞穴 - 东侧"
	icon_state = "caves_east"

/area/lv759/indoors/caves/south_caves
	name = "洞穴 - 南部"
	icon_state = "caves_south"

/area/lv759/indoors/caves/south_east_caves
	name = "洞穴 - 东南"
	icon_state = "caves_southeast"

/area/lv759/indoors/caves/south_west_caves
	name = "洞穴 - 西南"
	icon_state = "caves_southwest"

/area/lv759/indoors/caves/south_west_caves_alarm
	name = "洞穴 - 西南"
	icon_state = "caves_southwest"

/area/lv759/indoors/caves/north_west_caves
	name = "洞穴 - 西北"
	icon_state = "caves_northwest"
	ceiling = CEILING_UNDERGROUND
	always_unpowered = FALSE

/area/lv759/outdoors/north_west_caves_outdoors
	name = "洞穴 - 西北"
	icon_state = "caves_northwest"
	ceiling = CEILING_UNDERGROUND

/area/lv759/indoors/caves/north_east_caves
	name = "洞穴 - 东北"
	icon_state = "caves_northeast"
	ceiling = CEILING_UNDERGROUND
	always_unpowered = FALSE

/area/lv759/indoors/caves/north_caves
	name = "洞穴 - 北部"
	icon_state = "caves_north"
	always_unpowered = TRUE
	ceiling = CEILING_UNDERGROUND

/area/lv759/indoors/caves/central_caves
	name = "洞穴 - 中央"
	icon_state = "caves_central"

// Caves Central Plateau
/area/lv759/outdoors/caveplateau
	name = "洞穴 - 高原"
	icon_state = "caves_plateau"
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES
	ambience = list('sound/effects/urban/outdoors/derelict_plateau_1.ogg',
	'sound/effects/urban/outdoors/derelict_plateau_2.ogg',
	)

// Colony Streets
/area/lv759/outdoors/colony_streets
	name = "殖民地街道"
	icon_state = "colonystreets_north"
	ceiling = CEILING_NONE
	always_unpowered = FALSE
	area_flavor = AREA_FLAVOR_URBAN
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/outdoors/colony_streets/central_streets
	name = "中央街道 - 西侧"
	icon_state = "colonystreets_west"

/area/lv759/outdoors/colony_streets/east_central_street
	name = "中央街道 - 东区"
	icon_state = "colonystreets_east"

/area/lv759/outdoors/colony_streets/south_street
	name = "殖民地街道 - 南侧"
	icon_state = "colonystreets_south"

/area/lv759/outdoors/colony_streets/south_east_street
	name = "殖民地街道 - 东南区"
	icon_state = "colonystreets_southeast"

/area/lv759/outdoors/colony_streets/south_west_street
	name = "殖民地街道 - 西南区 - 纳米传讯检查站通道"
	icon_state = "colonystreets_southwest"
	ceiling = CEILING_UNDERGROUND

/area/lv759/outdoors/colony_streets/north_west_street
	name = "殖民地街道 - 西北区"
	icon_state = "colonystreets_northwest"

/area/lv759/outdoors/colony_streets/north_east_street
	name = "殖民地街道 - 东北区"
	icon_state = "colonystreets_northeast"

/area/lv759/outdoors/colony_streets/north_street
	name = "殖民地街道 - 北部"
	icon_state = "colonystreets_north"

//Spaceport Indoors
/area/lv759/indoors/spaceport
	minimap_color = MINIMAP_AREA_ESCAPE

/area/lv759/indoors/spaceport/hallway_northeast
	name = "纳米传讯天界之门太空港 - 走廊 - 东北"
	icon_state = "WYSpaceport"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/indoors/spaceport/hallway_north
	name = "纳米传讯天界之门太空港 - 走廊 - 北侧"
	icon_state = "WYSpaceport"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/indoors/spaceport/hallway_northwest
	name = "纳米传讯天界之门太空港 - 走廊 - 西北"
	icon_state = "WYSpaceport"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/indoors/spaceport/hallway_east
	name = "纳米传讯天界之门太空港 - 走廊 - 东侧"
	icon_state = "WYSpaceport"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/indoors/spaceport/heavyequip
	name = "纳米传讯天界之门太空港 - 重型设备存储区"
	icon_state = "WYSpaceport"

/area/lv759/indoors/spaceport/engineering
	name = "纳米传讯天界之门太空港 - 燃料储存与处理"
	icon_state = "WYSpaceport"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv759/indoors/spaceport/janitor
	name = "纳米传讯天界之门太空港 - 清洁工储物间"
	icon_state = "WYSpaceport"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/indoors/spaceport/maintenance_east
	name = "纳米传讯天界之门太空港 - 维护区 - 东侧"
	icon_state = "WYSpaceport"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/indoors/spaceport/communications_office
	name = "纳米传讯天界之门太空港 - 通讯与行政办公室"
	icon_state = "WYSpaceportadmin"
	minimap_color = MINIMAP_AREA_COMMAND

/area/lv759/indoors/spaceport/flight_control_room
	name = "纳米传讯天界之门太空港 - 飞行控制室"
	icon_state = "WYSpaceportadmin"
	minimap_color = MINIMAP_AREA_COMMAND

/area/lv759/indoors/spaceport/security
	name = "纳米传讯天界之门太空港 - 安保 - 观察与办公室"
	icon_state = "security_checkpoint"
	minimap_color = MINIMAP_AREA_SEC

/area/lv759/indoors/spaceport/security_office
	name = "纳米传讯天界之门太空港 - 办公室"
	icon_state = "security_checkpoint"
	minimap_color = MINIMAP_AREA_SEC

/area/lv759/indoors/spaceport/cargo
	name = "纳米传讯天界之门太空港 - 货运区"
	icon_state = "WYSpaceportcargo"
	minimap_color = MINIMAP_AREA_REQ

/area/lv759/indoors/spaceport/cargo_maintenance
	name = "纳米传讯天界之门太空港 - 货运区 - 维护通道"
	icon_state = "WYSpaceportcargo"
	minimap_color = MINIMAP_AREA_REQ

/area/lv759/indoors/spaceport/baggagehandling
	name = "纳米传讯天界之门太空港 - 行李寄存与处理处"
	icon_state = "WYSpaceportbaggage"

/area/lv759/indoors/spaceport/cuppajoes
	name = "纳米传讯天界之门太空港 - 乔氏咖啡"
	icon_state = "cuppajoes"
	minimap_color = MINIMAP_AREA_LIVING

/area/lv759/indoors/spaceport/kitchen
	name = "纳米传讯天界之门太空港 - 厨房"
	icon_state = "WYSpaceportblue"
	minimap_color = MINIMAP_AREA_LIVING

/area/lv759/indoors/spaceport/docking_bay_2
	name = "纳米传讯天界之门太空港 - 二号对接舱 - 燃料补给与维护区"
	icon_state = "WYSpaceportblue"

/area/lv759/indoors/spaceport/docking_bay_1
	name = "纳米传讯天界之门太空港 - 1号对接舱"
	icon_state = "WYSpaceport"

/area/lv759/indoors/spaceport/starglider
	name = "纳米传讯-LWI 星滑翔者 SG-200"
	icon_state = "wydropship"
	requires_power = FALSE

/area/lv759/indoors/spaceport/horizon_runner
	name = "纳米传讯-LWI 地平线奔跑者 HR-150"
	icon_state = "wydropship"
	requires_power = FALSE

// Garage

/area/lv759/indoors/garage_reception
	name = "机库 - 接待处"
	icon_state = "garage"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv759/indoors/garage_restroom
	name = "机库 - 洗手间"
	icon_state = "garage"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv759/indoors/garage_workshop
	name = "机库 - 工坊"
	icon_state = "garage"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv759/indoors/garage_workshop_storage
	name = "车库 - 工坊 - 储藏室"
	icon_state = "garage"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv759/indoors/garage_managersoffice
	name = "车库 - 经理办公室"
	icon_state = "garage"
	minimap_color = MINIMAP_AREA_ENGI

// Meridian Offices & Factory Floor
/area/lv759/indoors/meridian
	icon_state = "meridian"
	minimap_color = MINIMAP_AREA_REQ

/area/lv759/indoors/meridian/meridian_foyer
	name = "梅里迪安 - 门厅"

/area/lv759/indoors/meridian/meridian_showroom
	name = "Meridian - 展示厅"

/area/lv759/indoors/meridian/meridian_office
	name = "子午线 - 办公室"

/area/lv759/indoors/meridian/meridian_managersoffice
	name = "子午线 - 经理办公室"

/area/lv759/indoors/meridian/meridian_factory
	name = "子午线 - 工厂车间"
	icon_state = "meridian_factory"

/area/lv759/indoors/meridian/meridian_restroom
	name = "梅里迪安 - 洗手间"

/area/lv759/indoors/meridian/meridian_maintenance_south
	name = "子午线 - 南维护区"

/area/lv759/indoors/meridian/meridian_maintenance_east
	name = "子午线 - 工厂车间 - 维护区"

// Apartments (Dorms)
/area/lv759/indoors/apartment
	minimap_color = MINIMAP_AREA_LIVING

/area/lv759/indoors/apartment/westfoyer
	name = "西港公寓大楼 - 西侧 - 门厅"
	icon_state = "apartments"

/area/lv759/indoors/apartment/westhallway
	name = "西港公寓大楼 - 西侧 - 走廊"
	icon_state = "apartments"

/area/lv759/indoors/apartment/westbedrooms
	name = "西港公寓大楼 - 西侧 - 卧室"
	icon_state = "apartments"

/area/lv759/indoors/apartment/westshowers
	name = "西港公寓大楼 - 西侧 - 淋浴间"
	icon_state = "apartments"

/area/lv759/indoors/apartment/westrestroom
	name = "西港公寓大楼 - 西侧 - 洗手间"
	icon_state = "apartments"

/area/lv759/indoors/apartment/westentertainment
	name = "西港公寓大楼 - 西区 - 娱乐中心"
	icon_state = "apartments"

/area/lv759/indoors/apartment/eastentrance
	name = "西港公寓大楼 - 东区 - 入口房间"
	icon_state = "apartments"

/area/lv759/indoors/apartment/eastfoyer
	name = "西港公寓大楼 - 东侧 - 门厅"
	icon_state = "apartments"

/area/lv759/indoors/apartment/eastrestroomsshower
	name = "西港公寓大楼 - 东侧 - 洗手间与淋浴间"
	icon_state = "apartments"

/area/lv759/indoors/apartment/eastbedrooms
	name = "西港公寓大楼 - 东侧 - 卧室区"
	icon_state = "apartments"

/area/lv759/indoors/apartment/eastbedroomsstorage
	name = "西港公寓大楼 - 东侧 - 卧室 - 储藏室"
	icon_state = "apartments"

/area/lv759/indoors/apartment/northfoyer
	name = "西港公寓大楼 - 北侧 - 门厅"
	icon_state = "apartments"

/area/lv759/indoors/apartment/northhallway
	name = "西港公寓楼 - 北侧 - 走廊"
	icon_state = "apartments"

/area/lv759/indoors/apartment/northapartments
	name = "西港公寓综合体 - 北区 - 豪华公寓"
	icon_state = "apartments"

// Nanotrasen Offices
/area/lv759/indoors/nt_office
	name = "纳米传讯办公室 - 接待走廊"
	icon_state = "wyoffice"
	minimap_color = MINIMAP_AREA_COMMAND

/area/lv759/indoors/nt_office/hallway
	name = "纳米传讯办公室 - 西侧门厅"
	icon_state = "wyoffice"

/area/lv759/indoors/nt_office/floor
	name = "纳米传讯办公室 - 主办公楼层"

/area/lv759/indoors/nt_office/breakroom
	name = "纳米传讯办公室 - 休息室"

/area/lv759/indoors/nt_office/vip
	name = "纳米传讯办公室 - 会议室"

/area/lv759/indoors/nt_office/pressroom
	name = "纳米传讯办公室 - 会议厅"

/area/lv759/indoors/nt_office/supervisor
	name = "纳米传讯办公室 - 殖民地主管办公室"

// Bar & Entertainment Complex
/area/lv759/indoors/bar
	name = "酒吧"
	icon_state = "bar"

/area/lv759/indoors/bar/entertainment
	name = "酒吧 - 娱乐分区"

/area/lv759/indoors/bar/bathroom
	name = "酒吧 - 洗手间"

/area/lv759/indoors/bar/maintenance
	name = "酒吧 - 维护区"

/area/lv759/indoors/bar/kitchen
	name = "酒吧 - 厨房"

//Botany

/area/lv759/indoors/botany
	minimap_color = MINIMAP_AREA_LIVING_CAVE

/area/lv759/indoors/botany/botany_greenhouse
	name = "植物学 - 温室"
	icon_state = "botany"

/area/lv759/indoors/botany/botany_hallway
	name = "植物学 - 走廊"
	icon_state = "botany"

/area/lv759/indoors/botany/botany_maintenance
	name = "植物学 - 维护"
	icon_state = "botany"

/area/lv759/indoors/botany/botany_mainroom
	name = "植物学 - 主室"
	icon_state = "botany"

// Hosptial
/area/lv759/indoors/hospital
	icon_state = "medical"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/lv759/indoors/hospital/paramedics_garage
	name = "新星医疗中心综合医院 - 救护车车库"

/area/lv759/indoors/hospital/cryo_room
	name = "诺瓦医疗中心综合医院 - 低温治疗区"

/area/lv759/indoors/hospital/emergency_room
	name = "新星医疗中心 - 急诊室"

/area/lv759/indoors/hospital/reception
	name = "新星医疗中心 - 接待处"

/area/lv759/indoors/hospital/cmo_office
	name = "诺瓦医疗中心 - 首席医疗官办公室"

/area/lv759/indoors/hospital/maintenance
	name = "新星医疗中心 - 子空间通讯与电力系统"

/area/lv759/indoors/hospital/pharmacy
	name = "新星医疗中心综合楼 - 药房及出口大厅"

/area/lv759/indoors/hospital/outgoing
	name = "诺瓦医疗中心医院综合体 - 出院病房"

/area/lv759/indoors/hospital/central_hallway
	name = "诺瓦医疗医院综合体 - 中央走廊"

/area/lv759/indoors/hospital/east_hallway
	name = "新星医疗医院综合体 - 东侧走廊"

/area/lv759/indoors/hospital/medical_storage
	name = "诺瓦医疗医院综合体 - 医疗储藏室"

/area/lv759/indoors/hospital/operation
	name = "诺瓦医疗中心医院综合体 - 手术室与观察区"

/area/lv759/indoors/hospital/patient_ward
	name = "新星医疗中心 - 病房区"

/area/lv759/indoors/hospital/virology
	name = "诺瓦医疗医院综合体 - 病毒学部"

/area/lv759/indoors/hospital/morgue
	name = "新星医疗中心综合医院 - 停尸间"

/area/lv759/indoors/hospital/icu
	name = "诺瓦医疗中心医院综合体 - 重症监护病房"

/area/lv759/indoors/hospital/storage
	name = "诺瓦医疗医院综合体 - 储藏室"

/area/lv759/indoors/hospital/maintenance_north
	name = "新星医疗中心综合楼 - 北区维护通道"

/area/lv759/indoors/hospital/maintenance_south
	name = "新星医疗中心综合楼 - 南侧维护区"

/area/lv759/indoors/hospital/janitor
	name = "新星医疗中心医院综合楼 - 清洁工储物间"

// Mining

/area/lv759/indoors/mining_outpost
	icon_state = "mining"
	minimap_color = MINIMAP_AREA_REQ

/area/lv759/indoors/mining_outpost/north
	name = "KMCC - 采矿前哨站 - 北部"

/area/lv759/indoors/mining_outpost/north_maint
	name = "KMCC - 采矿前哨站 - 北部 - 维护区"

/area/lv759/indoors/mining_outpost/northeast
	name = "KMCC - 采矿前哨站 - 东北部"

/area/lv759/indoors/mining_outpost/south
	name = "KMCC - 采矿前哨站 - 南侧"

/area/lv759/indoors/mining_outpost/vehicledeployment
	name = "KMCC - 采矿车部署 南侧"

/area/lv759/indoors/mining_outpost/processing
	name = "KMCC - 采矿处理与储存"

/area/lv759/indoors/mining_outpost/east
	name = "KMCC - 采矿前哨站 - 东区"

/area/lv759/indoors/mining_outpost/east_dorms
	name = "KMCC - 采矿前哨站 - 东部宿舍区"

/area/lv759/indoors/mining_outpost/east_deploymentbay
	name = "KMCC - 采矿前哨站 - 东部 - 部署舱"

/area/lv759/indoors/mining_outpost/east_command
	name = "KMCC - 采矿前哨站 - 东部 - 指挥中心"

/area/lv759/indoors/mining_outpost/cargo_maint
	name = "KMCC - 采矿前哨站 - 东区 - 维护区"

// Electrical Substations
/area/lv759/indoors/electical_systems
	icon_state = "power0"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv759/indoors/electical_systems/substation1
	name = "电力系统 - 一号变电站 - 控制室"

/area/lv759/indoors/electical_systems/substation2
	name = "电力系统 - 二号变电站"

/area/lv759/indoors/electical_systems/substation3
	name = "电力系统 - 三号变电站"

// Power-Plant (Engineering)
/area/lv759/indoors/power_plant
	name = "纳米传讯动态网格枢纽 - 中央走廊"
	icon_state = "power0"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv759/indoors/power_plant/south_hallway
	name = "纳米传讯动力网格枢纽 - 南侧走廊"

/area/lv759/indoors/power_plant/geothermal_generators
	name = "纳米传讯 DynaGrid 枢纽 - 地热发电机室"

/area/lv759/indoors/power_plant/power_storage
	name = "纳米传讯动力网格枢纽 - 能源储存室"

/area/lv759/indoors/power_plant/transformers_north
	name = "纳米传讯动力网格枢纽 - 变压器 - 北侧"

/area/lv759/indoors/power_plant/transformers_south
	name = "纳米传讯 DynaGrid 枢纽 - 变压器 - 南"

/area/lv759/indoors/power_plant/gas_generators
	name = "纳米传讯动态网格节点 - 气体混合与储存"

/area/lv759/indoors/power_plant/fusion_generators
	name = "纳米传讯动态网格枢纽 - 控制中心"

/area/lv759/indoors/power_plant/telecomms
	icon_state = "comms_1"
	name = "纳米传讯动态网格枢纽 - 电信系统"

/area/lv759/indoors/power_plant/workers_canteen
	name = "纳米传讯动力网格枢纽 - 员工餐厅"

/area/lv759/indoors/power_plant/workers_canteen_kitchen
	name = "纳米传讯动力网格枢纽 - 员工食堂 - 厨房"

/area/lv759/indoors/power_plant/equipment_east
	name = "纳米传讯动态网格枢纽 - 装备储存室 - 东侧"

/area/lv759/indoors/power_plant/equipment_west
	name = "纳米传讯动力网格枢纽 - 装备储存室 - 西侧"

// Marshalls
/area/lv759/indoors/colonial_marshals
	name = "CMB - 哨兵前哨站"
	icon_state = "security_hub"
	minimap_color = MINIMAP_AREA_SEC

/area/lv759/indoors/colonial_marshals/prisoners_cells
	name = "CMB - 哨兵前哨站 - 最高安全病房 - 牢房"

/area/lv759/indoors/colonial_marshals/prisoners_foyer
	name = "CMB - 哨兵前哨站 - 最高安全病房 - 门厅"

/area/lv759/indoors/colonial_marshals/prisoners_recreation_area
	name = "CMB - 哨兵前哨站 - 最高安全区 - 娱乐区与淋浴间"

/area/lv759/indoors/colonial_marshals/garage
	name = "CMB - 哨兵前哨站 - 载具部署与维护"

/area/lv759/indoors/colonial_marshals/armory_foyer
	name = "CMB - 哨兵前哨站 - 军械库门厅"

/area/lv759/indoors/colonial_marshals/armory
	name = "CMB - 哨兵前哨站 - 军械库"

/area/lv759/indoors/colonial_marshals/armory_firingrange
	name = "CMB - 哨兵前哨站 - 射击场"

/area/lv759/indoors/colonial_marshals/armory_evidenceroom
	name = "CMB - 哨兵前哨站 - 证据室"

/area/lv759/indoors/colonial_marshals/office
	name = "CMB - 哨兵前哨站 - 办公室"

/area/lv759/indoors/colonial_marshals/reception
	name = "CMB - 哨兵前哨站 - 接待处"

/area/lv759/indoors/colonial_marshals/hallway_central
	name = "CMB - 哨兵前哨站 - 中央走廊"

/area/lv759/indoors/colonial_marshals/hallway_south
	name = "CMB - 哨兵前哨站 - 南走廊"

/area/lv759/indoors/colonial_marshals/hallway_reception
	name = "CMB - 哨兵前哨站 - 接待走廊"

/area/lv759/indoors/colonial_marshals/hallway_north
	name = "CMB - 哨兵前哨站 - 北走廊"

/area/lv759/indoors/colonial_marshals/hallway_north_locker
	name = "CMB - 哨兵前哨站 - 北走廊 - 更衣室"

/area/lv759/indoors/colonial_marshals/holding_cells
	name = "CMB - 哨兵前哨站 - 拘留室"

/area/lv759/indoors/colonial_marshals/head_office
	name = "CMB - 哨兵前哨站 - 法证办公室"

/area/lv759/indoors/colonial_marshals/north_office
	name = "CMB - 哨兵前哨站 - 北办公室"

/area/lv759/indoors/colonial_marshals/wardens_office
	name = "CMB - 哨兵前哨站 - 典狱长办公室"

/area/lv759/indoors/colonial_marshals/interrogation
	name = "CMB - 哨兵前哨站 - 审讯"

/area/lv759/indoors/colonial_marshals/press_room
	name = "CMB - 哨兵前哨站 - 法庭"

/area/lv759/indoors/colonial_marshals/changing_room
	name = "CMB - 哨兵前哨站 - 更衣室"

/area/lv759/indoors/colonial_marshals/restroom
	name = "CMB - 哨兵前哨站 - 洗手间与淋浴间"

/area/lv759/indoors/colonial_marshals/south_maintenance
	name = "CMB - 哨兵前哨站 - 维护区 - 南侧"

/area/lv759/indoors/colonial_marshals/north_maintenance
	name = "CMB - 哨兵前哨站 - 维护区 - 北侧"

/area/lv759/indoors/colonial_marshals/southwest_maintenance
	name = "CMB - 哨兵前哨站 - 维护区 - 西南"


// Jack's Surplus
/area/lv759/indoors/jacks_surplus
	name = "杰克军品店"
	icon_state = "jacks"

//Nanotrasen - Resource Recovery Facility
/area/lv759/indoors/recycling_plant
	name = "纳米传讯 - 资源回收设施"
	icon_state = "recycling"

/area/lv759/indoors/recycling_plant/garage
	name = "纳米传讯 - 资源回收设施 - 车库"
/area/lv759/indoors/recycling_plant/synthetic_storage
	name = "合成人存储室"
	icon_state = "synthetic"

/area/lv759/indoors/recycling_plant_office
	name = "纳米传讯 - 资源回收设施 - 办公室"
	icon_state = "recycling"

/area/lv759/indoors/recycling_plant_waste_disposal_incinerator
	name = "纳米传讯 - 资源回收设施 - 废物处理焚化室"
	icon_state = "recycling"

// Restrooms
/area/lv759/indoors/south_public_restroom
	name = "公共卫生间 - 南侧"
	icon_state = "restroom"

/area/lv759/indoors/southwest_public_restroom
	name = "公共卫生间 - 西南"
	icon_state = "restroom"

//Nightgold Casino
/area/lv759/indoors/casino
	name = "夜金赌场"
	icon_state = "nightgold"
	minimap_color = MINIMAP_AREA_LIVING

/area/lv759/indoors/casino/casino_office
	name = "夜金赌场 - 经理办公室"
	icon_state = "nightgold"

/area/lv759/indoors/casino/casino_restroom
	name = "夜金赌场 - 洗手间"
	icon_state = "nightgold"

/area/lv759/indoors/casino/casino_vault
	name = "夜金赌场 - 金库"
	icon_state = "nightgold"

// Pizza
/area/lv759/indoors/pizzaria
	name = "披萨银河 - 泽塔前哨站"
	icon_state = "pizza"
	minimap_color = MINIMAP_AREA_CELL_MED

//T-comms
/area/lv759/indoors/tcomms_northwest
	name = "通信子站 - 西北区"
	icon_state = "comms_1"
	minimap_color = MINIMAP_AREA_ENGI

// NTmart
/area/lv759/indoors/NTmart
	name = "纳米传讯商店"
	icon_state = "NTmart"
	minimap_color = MINIMAP_AREA_CELL_MED
	ambience = list('sound/effects/urban/indoors/weymart1.ogg',
	'sound/effects/urban/indoors/weymart2.ogg',
	'sound/effects/urban/indoors/weymart3.ogg',
	'sound/effects/urban/indoors/weymart4.ogg'
	)

/area/lv759/indoors/NTmart/backrooms
	name = "NTmart - 后室"
	icon_state = "NTmartbackrooms"

/area/lv759/indoors/NTmart/maintenance
	name = "NTmart - 维护"
	icon_state = "NTmartbackrooms"

// NT Security Checkpoints
/area/lv759/indoors/nt_security
	minimap_color = MINIMAP_AREA_SEC

/area/lv759/indoors/nt_security/checkpoint_northeast
	name = "纳米传讯安全检查站 - 东北"
	icon_state = "security_checkpoint_northeast"

/area/lv759/indoors/nt_security/checkpoint_east
	name = "纳米传讯安全检查站 - 东侧"
	icon_state = "security_checkpoint_east"

/area/lv759/indoors/nt_security/checkpoint_central
	name = "纳米传讯安全检查点 - 中央"
	icon_state = "security_checkpoint_central"

/area/lv759/indoors/nt_security/checkpoint_west
	name = "纳米传讯安全检查站 - 西侧"
	icon_state = "security_checkpoint_west"

/area/lv759/indoors/nt_security/checkpoint_northwest
	name = "纳米传讯安全检查站 - 西北"
	icon_state = "security_checkpoint_northwest"

// Misc
/area/lv759/indoors/hobosecret
	name = "隐藏的流浪者庇护所"
	icon_state = "hobo"
	ceiling = CEILING_METAL
	always_unpowered = TRUE

// Nanotrasen Advanced Bio-Genomic Research Complex

/area/lv759/indoors/nt_research_complex
	name = "纳米传讯 - 高级生化基因组研究综合体"
	icon_state = "wylab"
	minimap_color = MINIMAP_AREA_CAVES
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	ambience = list('sound/effects/urban/indoors/lab_ambience.ogg')

/area/lv759/indoors/nt_research_complex/medical_annex
	name = "纳米传讯 - 高级生化基因组研究综合体 - 医疗附属建筑"
	minimap_color = MINIMAP_AREA_MEDBAY_CAVE

/area/lv759/indoors/nt_research_complex/reception
	name = "纳米传讯 - 高级生化基因组研究综合体 - 接待与行政"

/area/lv759/indoors/nt_research_complex/cargo
	name = "纳米传讯 - 高级生物基因组研究综合体 - 补给与货运"
	minimap_color = MINIMAP_AREA_REQ_CAVE

/area/lv759/indoors/nt_research_complex/researchanddevelopment
	name = "纳米传讯 - 先进生化基因组研究综合体 - 技术研发实验室"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/lv759/indoors/nt_research_complex/mainlabs
	name = "纳米传讯 - 高级生物基因组研究综合体 - 高级化学测试与研究实验室"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/lv759/indoors/nt_research_complex/xenobiology
	name = "纳米传讯 - 高级生物基因组研究综合体 - 高级异形生物学实验室"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE
	ambience = list('sound/effects/urban/indoors/lab_ambience_2.ogg')

/area/lv759/indoors/nt_research_complex/weaponresearchlab
	name = "纳米传讯 - 高级生物基因组研究综合体 - 高级武器研究实验室"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/lv759/indoors/nt_research_complex/weaponresearchlabtesting
	name = "纳米传讯 - 高级生化基因组研究综合体 - 高级武器研究实验室 - 武器测试靶场"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/lv759/indoors/nt_research_complex/xenoarcheology
	name = "纳米传讯 - 高级生化基因组研究综合体 - 异形考古学研究实验室"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/lv759/indoors/nt_research_complex/vehicledeploymentbay
	name = "纳米传讯 - 高级生化基因组研究综合体 - 载具部署与维护舱"
	minimap_color = MINIMAP_AREA_REQ_CAVE

/area/lv759/indoors/nt_research_complex/janitor
	name = "纳米传讯 - 高级生化基因组研究综合体 - 清洁用品储藏室"
	minimap_color = MINIMAP_AREA_LIVING_CAVE

/area/lv759/indoors/nt_research_complex/cafeteria
	name = "纳米传讯 - 高级生化基因组研究综合体 - 食堂"
	minimap_color = MINIMAP_AREA_LIVING_CAVE

/area/lv759/indoors/nt_research_complex/cafeteriakitchen
	name = "纳米传讯 - 先进生化基因组研究综合体 - 食堂 - 厨房"
	minimap_color = MINIMAP_AREA_LIVING_CAVE

/area/lv759/indoors/nt_research_complex/dormsfoyer
	name = "纳米传讯 - 高级生化基因组研究综合体 - 宿舍前厅"
	minimap_color = MINIMAP_AREA_LIVING_CAVE

/area/lv759/indoors/nt_research_complex/dormsbedroom
	name = "纳米传讯 - 高级生化基因组研究综合体 - 宿舍区"
	minimap_color = MINIMAP_AREA_LIVING_CAVE

/area/lv759/indoors/nt_research_complex/securitycommand
	name = "纳米传讯 - 高级生化基因组研究综合体 - 安全指挥中心与部署区"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/lv759/indoors/nt_research_complex/securityarmory
	name = "纳米传讯 - 高级生化基因组研究综合体 - 军械库"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/lv759/indoors/nt_research_complex/hangarbay
	name = "纳米传讯 - 高级生化基因组研究综合体 - 机库区"
	minimap_color = MINIMAP_AREA_ESCAPE_CAVE
	ambience = list('sound/effects/urban/indoors/lab_ambience_hallway.ogg')

/area/lv759/indoors/nt_research_complex/hangarbayshuttle
	name = "纳米传讯 - 高级生化基因组研究综合体 - 机库区 - 纳米传讯PMC紧急响应小组穿梭机"
	minimap_color = MINIMAP_AREA_ESCAPE_CAVE
	ambience = list('sound/effects/urban/indoors/lab_ambience_hallway.ogg')

/area/lv759/indoors/nt_research_complex/hallwaynorth
	name = "纳米传讯 - 高级生化基因组研究综合体 - 技术研发实验室"
	ambience = list('sound/effects/urban/indoors/lab_ambience_hallway.ogg')

/area/lv759/indoors/nt_research_complex/hallwaynorthexit
	name = "纳米传讯 - 高级生化基因组研究综合体 - 北走廊 - 人员出口东侧"
	ambience = list('sound/effects/urban/indoors/lab_ambience_hallway.ogg')

/area/lv759/indoors/nt_research_complex/hallwayeast
	name = "纳米传讯 - 高级生化基因组研究综合体 - 东侧走廊"
	ambience = list('sound/effects/urban/indoors/lab_ambience_hallway.ogg')

/area/lv759/indoors/nt_research_complex/hallwaycentral
	name = "纳米传讯 - 高级生化基因组研究综合体 - 中央走廊"
	ambience = list('sound/effects/urban/indoors/lab_ambience_hallway.ogg')

/area/lv759/indoors/nt_research_complex/hallwaysouthwest
	name = "纳米传讯 - 高级生化基因组研究综合体 - 西南走廊"
	ambience = list('sound/effects/urban/indoors/lab_ambience_hallway.ogg')

/area/lv759/indoors/nt_research_complex/hallwaysoutheast
	name = "纳米传讯 - 高级生化基因组研究综合体 - 东南走廊"
	ambience = list('sound/effects/urban/indoors/lab_ambience_hallway.ogg')

/area/lv759/indoors/nt_research_complex/southeastexit
	name = "纳米传讯 - 高级生化基因组研究综合体 - 东南维护与紧急出口"

/area/lv759/indoors/nt_research_complex/changingroom
	name = "纳米传讯 - 高级生化基因组研究综合体 - 更衣室"
	minimap_color = MINIMAP_AREA_LIVING_CAVE
