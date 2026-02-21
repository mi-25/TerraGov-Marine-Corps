// Lawanka Outpost Areas

/area/lawankaoutpost/caves
	name = "洞穴"
	icon_state = "cave"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambisin4.ogg')
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE

/area/lawankaoutpost/caves/rock
	name = "封闭区域"
	icon_state = "transparent"
	area_flags = CANNOT_NUKE

/area/lawankaoutpost/caves/northwest
	name = "西北洞穴"
	icon_state = "northwest"

/area/lawankaoutpost/caves/northwest/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/lawankaoutpost/caves/west
	name = "西部洞穴"
	icon_state = "west"

/area/lawankaoutpost/caves/west/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/lawankaoutpost/caves/nukestorage
	name = "核能储存室"
	icon_state = "nuke_storage"
	always_unpowered = FALSE

/area/lawankaoutpost/caves/southwest
	name = "西南洞穴"
	icon_state = "southwest"

/area/lawankaoutpost/caves/south
	name = "南部洞穴"
	icon_state = "south"
	ceiling = CEILING_UNDERGROUND

/area/lawankaoutpost/caves/east
	name = "东部洞穴"
	icon_state = "east"
	ceiling = CEILING_UNDERGROUND

/area/lawankaoutpost/caves/nanotrasen_lab
	name = "ETA 研究实验室"
	icon_state = "research"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE
	always_unpowered = FALSE

/area/lawankaoutpost/outside
	name = "殖民地地面"
	icon_state = "green"
	ceiling = CEILING_NONE
	minimap_color = MINIMAP_AREA_JUNGLE
	always_unpowered = TRUE

/area/lawankaoutpost/outside/northwest
	name = "西北殖民地"
	icon_state = "northwest"

/area/lawankaoutpost/outside/north
	name = "北方殖民地"
	icon_state = "north"

/area/lawankaoutpost/outside/northeast
	name = "东北殖民地"
	icon_state = "northeast"

/area/lawankaoutpost/outside/west
	name = "西部殖民地"
	icon_state = "west"

/area/lawankaoutpost/outside/central
	name = "中央殖民地"
	icon_state = "central"

/area/lawankaoutpost/outside/east
	name = "东部殖民地"
	icon_state = "east"

/area/lawankaoutpost/outside/southwest
	name = "西南殖民地"
	icon_state = "southwest"

/area/lawankaoutpost/outside/south
	name = "南方殖民地"
	icon_state = "south"

/area/lawankaoutpost/outside/southeast
	name = "东南殖民地"
	icon_state = "southeast"

/area/lawankaoutpost/colony
	name = "殖民地建设"
	icon_state = "red"
	ceiling = CEILING_METAL
	outside = FALSE

/area/lawankaoutpost/colony/biologics
	name = "生物研究设施"
	icon_state = "xeno_lab"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/lawankaoutpost/colony/biologics_storage
	name = "生化储存室"
	icon_state = "xeno_f_lab"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/lawankaoutpost/colony/cargo
	name = "货物"
	icon_state = "quart"
	minimap_color = MINIMAP_AREA_REQ

/area/lawankaoutpost/colony/mining
	name = "矿物处理"
	icon_state = "mining"
	minimap_color = MINIMAP_AREA_REQ

/area/lawankaoutpost/colony/medbay
	name = "医疗舱"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/lawankaoutpost/colony/robotics
	name = "机器人技术"
	icon_state = "ass_line"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/lawankaoutpost/colony/atmos
	name = "大气系统"
	icon_state = "atmos"
	minimap_color = MINIMAP_AREA_ENGI

/area/lawankaoutpost/colony/northdorms
	name = "北部宿舍区"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/lawankaoutpost/colony/recdorms
	name = "宿舍区娱乐室"
	icon_state = "showroom"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/lawankaoutpost/colony/bar
	name = "酒吧"
	icon_state = "bar"
	minimap_color = MINIMAP_AREA_LIVING

/area/lawankaoutpost/colony/operations_administration
	name = "作战管理"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_COMMAND

/area/lawankaoutpost/colony/operations_hall
	name = "行动主走廊"
	icon_state = "hallC1"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_COMMAND

/area/lawankaoutpost/colony/operations_kitchen
	name = "作战厨房"
	icon_state = "kitchen"
	minimap_color = MINIMAP_AREA_COMMAND

/area/lawankaoutpost/colony/operations_meeting
	name = "作战会议室"
	icon_state = "conference"
	minimap_color = MINIMAP_AREA_COMMAND

/area/lawankaoutpost/colony/operations_storage
	name = "作战工具储藏室"
	icon_state = "storage"
	minimap_color = MINIMAP_AREA_COMMAND

/area/lawankaoutpost/colony/southdorms
	name = "南部宿舍区"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/lawankaoutpost/colony/engineering
	name = "工程"
	icon_state = "engine"
	minimap_color = MINIMAP_AREA_ENGI
	ceiling = CEILING_OBSTRUCTED

/area/lawankaoutpost/colony/chapel
	name = "小教堂"
	icon_state = "chapel"
	minimap_color = MINIMAP_AREA_LIVING

/area/lawankaoutpost/colony/marshalls
	name = "马歇尔办公室"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/area/lawankaoutpost/colony/hydroponics
	name = "水培"
	icon_state = "hydro"
	minimap_color = MINIMAP_AREA_LIVING

/area/lawankaoutpost/colony/cabin
	name = "南舱室"
	icon_state = "crew_quarters"

/area/lawankaoutpost/colony/landingzoneone
	name = "一号着陆区"
	icon_state = "landingzone1"
	area_flags = NO_DROPPOD
	minimap_color = MINIMAP_AREA_LZ

/area/lawankaoutpost/colony/landingzonetwo
	name = "着陆区二"
	icon_state = "landingzone2"
	area_flags = NO_DROPPOD
	minimap_color = MINIMAP_AREA_LZ
