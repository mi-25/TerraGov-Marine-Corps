//gelida AREAS--------------------------------------//

/area/gelida
	icon_state = "lv-626"

//parent types

/area/gelida/indoors
	name = "室内"
	icon_state = "cliff_blocked" //because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_NONE
	outside = FALSE

/area/gelida/outdoors
	name = "户外"
	icon_state = "cliff_blocked" //because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_NONE
	outside = TRUE
	always_unpowered = TRUE

/area/gelida/oob
	name = "禁区 - 越界"
	icon_state = "unknown"

//Landing Zone 1

/area/gelida/landing_zone_1
	name = "一号着陆区"
	icon_state = "explored"
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ

/area/shuttle/drop1/gelida
	name = "Gelida IV - 阿拉莫号登陆区"
	icon_state = "away1"
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ

/area/gelida/landing_zone_1/lz1_console
	name = "Gelida IV - 阿拉莫号运输机控制台"
	icon_state = "tcomsatcham"
	requires_power = FALSE
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ

//Landing Zone 2

/area/gelida/landing_zone_2
	name = "格利达四号 - 二号着陆区"
	icon_state = "explored"
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ

/area/shuttle/drop2/gelida
	name = "格利达四号星 - 诺曼底号登陆区"
	icon_state = "away2"
	minimap_color = MINIMAP_AREA_LZ

/area/gelida/landing_zone_2/lz2_console
	name = "格利达四号 - 诺曼底号运输机控制台"
	icon_state = "tcomsatcham"
	requires_power = FALSE
	minimap_color = MINIMAP_AREA_LZ

//Landing Zone 3 & 4

/area/gelida/landing_zone_forecon
	name = "盖利达四号 - 侦察队穿梭机"
	icon_state = "shuttle"
	ceiling = CEILING_METAL
	requires_power = FALSE

/area/gelida/landing_zone_forecon/landing_zone_3
	name = "盖利达四号 - 着陆区三号"
	icon_state = "blue"
	ceiling = CEILING_NONE

/area/gelida/landing_zone_forecon/landing_zone_4
	name = "格利达四号 - 着陆区四号"
	icon_state = "blue"
	ceiling = CEILING_NONE

/area/gelida/landing_zone_forecon/UD6_Typhoon
	name = "盖利达四号星 - UD6台风"
	outside = FALSE
	ceiling = CEILING_METAL

/area/gelida/landing_zone_forecon/UD6_Tornado
	name = "盖利达四号星 - UD6 龙卷风"
	outside = FALSE
	ceiling = CEILING_METAL

//Outdoors areas
/area/gelida/outdoors/colony_streets //WHY IS THIS A SUBTYPE OF BUILDINGS AAAARGGHGHHHH YOU DIDN'T EVEN USE OBJECT INHERITANCE FOR THE CIELINGS I HATE YOU BOBBY
	name = "殖民地街道"
	icon_state = "green"
	ceiling = CEILING_NONE

/area/gelida/outdoors/colony_streets/windbreaker
	name = "殖民地防风衣"
	icon_state = "tcomsatcham"
	requires_power = FALSE
	ceiling = CEILING_NONE

/area/gelida/outdoors/colony_streets/windbreaker/observation
	name = "殖民地防风服 - 观察"
	icon_state = "purple"
	requires_power = FALSE
	ceiling = CEILING_NONE

/area/gelida/outdoors/colony_streets/central_streets
	name = "中央街道 - 西侧"
	icon_state = "west"

/area/gelida/outdoors/colony_streets/east_central_street
	name = "中央街道 - 东段"
	icon_state = "east"

/area/gelida/outdoors/colony_streets/south_street
	name = "殖民地街道 - 南"
	icon_state = "south"

/area/gelida/outdoors/colony_streets/south_east_street
	name = "殖民地街道 - 东南区"
	icon_state = "southeast"

/area/gelida/outdoors/colony_streets/south_west_street
	name = "殖民地街道 - 西南区"
	icon_state = "southwest"

/area/gelida/outdoors/colony_streets/north_west_street
	name = "殖民地街道 - 西北区"
	icon_state = "northwest"

/area/gelida/outdoors/colony_streets/north_east_street
	name = "殖民地街道 - 东北区"
	icon_state = "northeast"

/area/gelida/outdoors/colony_streets/north_street
	name = "殖民地街道 - 北区"
	icon_state = "north"

/area/gelida/outdoors/colony_streets/winde
	name = "殖民地街道 - 西北区"
	icon_state = "northwest"

//misc indoors areas

/area/gelida/indoors/lone_buildings
	name = "gelida - 孤立的建筑"
	icon_state = "green"

/area/gelida/indoors/lone_buildings/engineering
	name = "紧急工程"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI

/area/gelida/indoors/lone_buildings/spaceport
	name = "北侧LZ1 - 太空港"
	icon_state = "red"

/area/gelida/indoors/lone_buildings/outdoor_bot
	name = "东侧LZ1 - 户外植物园"
	icon_state = "yellow"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_LIVING

/area/gelida/indoors/lone_buildings/storage_blocks
	name = "户外储物区"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_REQ

/area/gelida/indoors/lone_buildings/chunk
	name = "大块头"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_LIVING

//A Block
/area/gelida/indoors/a_block
	name = "A区"
	icon_state = "blue"
	ceiling = CEILING_METAL

/area/gelida/indoors/a_block/admin
	name = "A区 - 殖民地行动中心"
	icon_state = "mechbay"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_COMMAND

/area/gelida/indoors/a_block/dorms
	name = "A区 - 西部宿舍与办公室"
	icon_state = "fitness"
	minimap_color = MINIMAP_AREA_LIVING

/area/gelida/indoors/a_block/fitness
	name = "A区 - 健身中心"
	icon_state = "fitness"
	minimap_color = MINIMAP_AREA_LIVING

/area/gelida/indoors/a_block/hallway
	name = "A区 - 南作战走廊"
	icon_state = "green"

/area/gelida/indoors/a_block/hallway/damage
	name = "A区 - 南作战走廊"
	icon_state = "green"
	ceiling = CEILING_NONE

/area/gelida/indoors/a_block/medical
	name = "A区 - 医疗"
	icon_state = "medbay"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_MEDBAY

/area/gelida/indoors/a_block/security
	name = "A区 - 安保区"
	icon_state = "head_quarters"
	minimap_color = MINIMAP_AREA_SEC

/area/gelida/indoors/a_block/kitchen
	name = "A区 - 厨房与餐厅"
	icon_state = "kitchen"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_LIVING

/area/gelida/indoors/a_block/executive
	name = "A区 - 副官套房"
	icon_state = "captain"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_COMMAND

/area/gelida/indoors/a_block/dorm_north
	name = "A区 - 北部共享宿舍"
	icon_state = "fitness"
	minimap_color = MINIMAP_AREA_LIVING

/area/gelida/indoors/a_block/bridges
	name = "A区 - 西侧宿舍通往安保桥"
	icon_state = "hallC1"
	ceiling = CEILING_GLASS

/area/gelida/indoors/a_block/bridges/dorms_fitness
	name = "A区 - 企业区至健身区桥梁"
	icon_state = "hallC1"
	ceiling = CEILING_GLASS

/area/gelida/indoors/a_block/bridges/corpo_fitness
	name = "A区 - 西部宿舍通往健身房"
	icon_state = "hallC1"
	ceiling = CEILING_GLASS


/area/gelida/indoors/a_block/bridges/corpo
	name = "A区 - 安保至企业区桥梁"
	icon_state = "hallC1"

/area/gelida/indoors/a_block/bridges/op_centre
	name = "A区 - 安保至作战中心桥梁"
	icon_state = "hallC1"

/area/gelida/indoors/a_block/bridges/garden_bridge
	name = "A区 - 花园桥"
	icon_state = "hallC2"

/area/gelida/indoors/a_block/corpo
	name = "A区 - 企业办公室"
	icon_state = "toxlab"

/area/gelida/indoors/a_block/garden
	name = "A区 - 西部作战花园"
	icon_state = "green"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_LIVING
//B Block

/area/gelida/indoors/b_block
	name = "B区"
	icon_state = "red"
	ceiling = CEILING_METAL

/area/gelida/indoors/b_block/hydro
	name = "B区 - 水培室"
	icon_state = "hydro"
	minimap_color = MINIMAP_AREA_LIVING

/area/gelida/indoors/b_block/bar
	name = "B区 - 酒吧"
	icon_state = "cafeteria"
	minimap_color = MINIMAP_AREA_LIVING

/area/gelida/indoors/b_block/bridge
	name = "B区段 - 水培桥接网络"
	icon_state = "hallC1"
	ceiling = CEILING_GLASS

//C Block

/area/gelida/indoors/c_block
	name = "C区"
	icon_state = "green"

/area/gelida/indoors/c_block/cargo
	name = "C区 - 货舱"
	icon_state = "primarystorage"
	minimap_color = MINIMAP_AREA_REQ

/area/gelida/indoors/c_block/mining
	name = "C区 - 采矿"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_REQ

/area/gelida/indoors/c_block/garage
	name = "C区 - 车库"
	icon_state = "storage"
	minimap_color = MINIMAP_AREA_REQ

/area/gelida/indoors/c_block/casino
	name = "C区 - 赌场"
	icon_state = "purple"
	minimap_color = MINIMAP_AREA_LIVING

/area/gelida/indoors/c_block/bridge
	name = "C区 - 货舱至机库桥"
	icon_state = "hallC1"
	ceiling = CEILING_GLASS

//Rockies

/area/gelida/outdoors/n_rockies
	name = "北方殖民地 - 落基山脉"
	icon_state = "away"

/area/gelida/outdoors/nw_rockies
	name = "西北殖民地 - 落基山脉"
	icon_state = "away1"

/area/gelida/outdoors/w_rockies
	name = "西部殖民地 - 落基山脉"
	icon_state = "away2"
	ceiling = CEILING_UNDERGROUND
	always_unpowered = TRUE

/area/gelida/outdoors/p_n_rockies
	name = "北部处理器 - 落基山脉"
	icon_state = "away"

/area/gelida/outdoors/p_nw_rockies
	name = "西北处理器 - 落基山脉"
	icon_state = "away1"

/area/gelida/outdoors/p_w_rockies
	name = "西部处理器 - 落基山脉"
	icon_state = "away2"

/area/gelida/outdoors/p_e_rockies
	name = "东处理厂 - 落基山脉"
	icon_state = "away3"

/area/gelida/outdoors/rock
	name = "封闭区域"
	icon_state = "transparent"
	outside = FALSE
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE
	area_flags = CANNOT_NUKE

//ATMOS
/area/gelida/atmos
	name = "大气处理器"
	icon_state = "engineering"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_ENGI

/area/gelida/atmos/outdoor
	name = "大气处理器 - 室外"
	icon_state = "quart"
	ceiling = CEILING_NONE
	minimap_color = NONE

/area/gelida/atmos/east_reactor
	name = "大气处理器 - 东部反应堆"
	icon_state = "blue"

/area/gelida/atmos/east_reactor/north
	name = "大气处理器 - 东侧外部反应堆 - 北区"
	icon_state = "yellow"

/area/gelida/atmos/east_reactor/south
	name = "大气处理器 - 东反应堆外部 - 南侧"
	icon_state = "red"

/area/gelida/atmos/east_reactor/east
	name = "大气处理器 - 东反应堆外部 - 东"
	icon_state = "green"

/area/gelida/atmos/east_reactor/west
	name = "大气处理器 - 东反应堆外部 - 西侧"
	icon_state = "purple"
/area/gelida/atmos/west_reactor
	name = "大气处理器 - 西部反应堆"
	icon_state = "blue"

/area/gelida/atmos/cargo_intake
	name = "大气处理器 - 货物入口"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_REQ

/area/gelida/atmos/command_centre
	name = "大气处理器 - 中央指挥部"
	icon_state = "red"

/area/gelida/atmos/north_command_centre
	name = "大气处理器 - 北部指挥中心检查点"
	icon_state = "green"

/area/gelida/atmos/filt
	name = "大气处理器 - 过滤系统"
	icon_state = "mechbay"

/area/gelida/powergen
	name = "地下发电站"
	icon_state = "ass_line"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	outside = FALSE

/area/gelida/powergen/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/gelida/cavestructuretwo
	name = "地下废弃建筑"
	icon_state = "garage"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_CAVES
	outside = FALSE

/area/gelida/caves
	outside = FALSE
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE

/area/gelida/caves/west_caves
	name = "西部洞穴"
	icon_state = "yellow"

/area/gelida/caves/west_caves/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/gelida/caves/central_caves
	name = "中央洞穴"
	icon_state = "purple"

/area/gelida/caves/central_caves/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/gelida/caves/east_caves
	name = "东部洞穴"
	icon_state = "blue-red"

/area/gelida/caves/east_caves/garbledradio
	ceiling = CEILING_UNDERGROUND
