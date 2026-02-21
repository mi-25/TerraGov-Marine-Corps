//Big Red V2

/area/bigredv2/outside
	name = "殖民地地面"
	icon_state = "red"
	ceiling = CEILING_NONE
	minimap_color = MINIMAP_AREA_COLONY

/area/bigredv2/outside/ne
	name = "东北殖民地地面"
	icon_state = "northeast"

/area/bigredv2/outside/nw
	name = "西北殖民地地面"
	icon_state = "northwest"

/area/bigredv2/outside/c
	name = "中央殖民地地面"
	icon_state = "purple"

/area/bigredv2/outside/n
	name = "北方殖民地地面"
	icon_state = "north"

/area/bigredv2/outside/w
	name = "西部殖民地地面"
	icon_state = "west"

/area/bigredv2/outside/e
	name = "东部殖民地地面"
	icon_state = "east"

/area/bigredv2/outside/se
	name = "东南殖民地地面"
	icon_state = "southeast"
	always_unpowered = TRUE

/area/bigredv2/outside/s
	name = "南方殖民地地面"
	icon_state = "south"

/area/bigredv2/outside/sw
	name = "西南殖民地地面"
	icon_state = "southwest"

/area/bigredv2/caves
	name = "未知区域"
	icon_state = "bluenew"
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	ambience = list('sound/ambience/ambicave.ogg', 'sound/ambience/ambilava1.ogg', 'sound/ambience/ambilava2.ogg', 'sound/ambience/ambilava3.ogg')
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE

/area/bigredv2/caves/rock
	name = "封闭区域"
	icon_state = "transparent"
	area_flags = CANNOT_NUKE

/area/bigredv2/caves/north
	name = "北部洞穴"
	icon_state = "north"

/area/bigredv2/caves/south
	name = "南部洞穴"
	icon_state = "south"

/area/bigredv2/caves/south/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/bigredv2/caves/rustedpreparea
	name = "锈蚀准备区"
	icon_state = "yellow"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	always_unpowered = FALSE

/area/bigredv2/caves/undergroundrobotics
	name = "地下机器人实验室"
	icon_state = "yellow"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	always_unpowered = FALSE

/area/bigredv2/caves/secomplex
	name = "地下研究综合体"
	icon_state = "yellow"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/bigredv2/caves/east
	name = "东部洞穴"
	icon_state = "east"

/area/bigredv2/caves/east/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/bigredv2/caves/west
	name = "西部洞穴"
	icon_state = "west"
	ceiling = CEILING_UNDERGROUND

/area/bigredv2/caves/northeast
	name = "东北洞穴"
	icon_state = "northeast"

/area/bigredv2/caves/northeast/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/bigredv2/caves/northwest
	name = "西北洞穴"
	icon_state = "northwest"
	ceiling = CEILING_UNDERGROUND

/area/bigredv2/caves/southeast
	name = "东南洞穴"
	icon_state = "southeast"

/area/bigredv2/caves/southeast/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/bigredv2/caves/southwest
	name = "西南洞穴"
	icon_state = "southwest"
	ceiling = CEILING_UNDERGROUND

/area/bigredv2/outside/nanotrasen_lab/outside
	name = "纳米传讯化合物"
	icon_state = "yellow"
	ceiling = CEILING_NONE

/area/bigredv2/outside/nanotrasen_lab/inside
	name = "纳米传讯研究实验室"
	icon_state = "engine"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/bigredv2/outside/nanotrasen_lab/inside/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/bigredv2/outside/cargo
	name = "货物"
	icon_state = "storage"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_REQ

/area/bigredv2/outside/general_store
	name = "综合商店"
	icon_state = "blueold"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_REQ

/area/bigredv2/outside/marshal_office
	name = "元帅办公室"
	icon_state = "brig"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_SEC

/area/bigredv2/outside/medical
	name = "医院"
	icon_state = "CMO"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_MEDBAY

/area/bigredv2/outside/admin_building
	name = "管理"
	icon_state = "bridge"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_COMMAND

/area/bigredv2/outside/filtration_plant
	name = "过滤厂"
	icon_state = "atmos"
	minimap_color = MINIMAP_AREA_ENGI
	ceiling = CEILING_METAL
	outside = FALSE

/area/bigredv2/outside/virology
	name = "病毒学实验室"
	icon_state = "LP"
	ceiling = CEILING_UNDERGROUND_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_MEDBAY

/area/bigredv2/outside/dorms
	name = "宿舍区"
	icon_state = "fitness"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_LIVING

/area/bigredv2/outside/bar
	name = "横杆"
	icon_state = "bar"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_LIVING

/area/bigredv2/outside/chapel
	name = "礼拜堂"
	icon_state = "courtroom"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_LIVING

/area/bigredv2/outside/southcheckpoint
	name = "南检查站"
	icon_state = "courtroom"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_SEC

/area/bigredv2/outside/hydroponics
	name = "水培"
	icon_state = "garden"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_LIVING

/area/bigredv2/outside/library
	name = "图书馆"
	icon_state = "library"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_LIVING

/area/bigredv2/outside/office_complex
	name = "办公区"
	icon_state = "explored"
	ceiling = CEILING_METAL
	outside = FALSE

/area/bigredv2/outside/office_complex/crashed_ship
	name = "废弃的坎特伯雷号"

/area/bigredv2/outside/space_port
	name = "太空港"
	icon_state = "green"
	ceiling = CEILING_NONE
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ

/area/bigredv2/outside/space_port/two

/area/bigredv2/outside/telecomm
	name = "通讯系统"
	icon_state = "ass_line"
	ceiling = CEILING_UNDERGROUND_METAL
	outside = FALSE
	area_flags = CANNOT_NUKE

/area/bigredv2/outside/engineering
	name = "西区工程综合设施"
	icon_state = "engine"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_ENGI
	outside = FALSE

/area/bigredv2/outside/engineering/east
	name = "东区工程综合设施"

/area/bigredv2/outside/storage
	name = "存储"
	icon_state = "storage"
	ceiling = CEILING_METAL
	outside = FALSE

/area/bigredv2/outside/solar_plant
	name = "太阳能发电厂"
	icon_state = "substation"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_ENGI

/area/bigredv2/outside/atmos
	name = "大气稳定器"
	icon_state = "party"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_ENGI

/area/bigredv2/caves/lambda_lab
	name = "Lambda实验室"
	icon_state = "party"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE
	always_unpowered = FALSE

/area/bigredv2/outside/general_offices
	name = "总务办公室"
	icon_state = "storage"
	ceiling = CEILING_METAL
	outside = FALSE
