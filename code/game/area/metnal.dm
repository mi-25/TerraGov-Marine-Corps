// Metnal Mining Base areas

//Caves
/area/metnal/caves
	name = "洞穴"
	icon_state = "cave"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambisin4.ogg')
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE

/area/metnal/caves/rock
	name = "封闭区域"
	icon_state = "transparent"
	area_flags = CANNOT_NUKE

/area/metnal/caves/northwest
	name = "西北洞穴"
	icon_state = "northwest2"

/area/metnal/caves/northwest/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/metnal/caves/north
	name = "北部洞穴"
	icon_state = "north2"

/area/metnal/caves/nukestorage
	name = "核能储存室"
	icon_state = "nuke_storage"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	always_unpowered = FALSE

/area/metnal/caves/northeast
	name = "东北洞穴"
	icon_state = "northeast2"

/area/metnal/caves/northeast/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/metnal/caves/southwest
	name = "西南洞穴"
	icon_state = "southwest2"

/area/metnal/caves/southwest/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/metnal/caves/south
	name = "南部洞穴"
	icon_state = "south2"

/area/metnal/caves/south/garbledradio
	name = "南部洞穴"
	icon_state = "south2"
	ceiling = CEILING_UNDERGROUND

/area/metnal/caves/southeast
	name = "东南洞穴"
	icon_state = "east2"

/area/metnal/caves/southeast/garbledradio
	name = "东南洞穴"
	icon_state = "southeast2"

/area/metnal/caves/west
	name = "西部洞穴"
	icon_state = "west2"
	ceiling = CEILING_UNDERGROUND

/area/metnal/caves/west/garbledradio
	name = "西部洞穴"
	icon_state = "west2"
	ceiling = CEILING_UNDERGROUND

//Outside Area
/area/metnal/outside
	name = "殖民地地面"
	icon_state = "cliff_blocked"
	ceiling = CEILING_NONE
	outside = TRUE
	minimap_color = MINIMAP_AREA_CELL_MAX
	always_unpowered = TRUE
	temperature = T22C

/area/metnal/outside/pathways/secondary
	name = "着陆区主要通道"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_LIVING

/area/metnal/outside/pathways //looks less awful on tacmap
	name = "主要进化路径"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_LIVING

/area/metnal/outside/central
	name = "中央殖民地地面"
	icon_state = "green"

/area/metnal/outside/caldera
	name = "卡尔德拉"
	icon_state = "red"
	temperature = T40C

/area/metnal/outside/southeast
	name = "东南殖民地"
	icon_state = "southeast"

/area/metnal/outside/south
	name = "南方殖民地"
	icon_state = "south"

/area/metnal/outside/southwest
	name = "西南殖民地"
	icon_state = "southeast"

/area/metnal/outside/east
	name = "东部区域"
	icon_state = "east"

/area/metnal/outside/northeast
	name = "东北地面区"
	icon_state = "northeast"

/area/metnal/outside/north
	name = "北部地带"
	icon_state = "north"

/area/metnal/outside/northwest
	name = "西北地面"
	icon_state = "northwest"

/area/metnal/outside/west
	name = "西部战场"
	icon_state = "west"

//Inside area parent, not used.
/area/metnal/inside
	name = "内部"
	icon_state = "red"
	ceiling = CEILING_METAL
	outside = FALSE

// dorm areas
/area/metnal/inside/colonydorms
	name = "殖民地宿舍"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_LIVING

/area/metnal/inside/laundromat
	name = "洗衣房"
	icon_state = "LP"
	minimap_color = MINIMAP_AREA_LIVING


// research areas
/area/metnal/inside/research
	name = "研究实验室"
	icon_state = "research"
	minimap_color = MINIMAP_AREA_RESEARCH
	ceiling = CEILING_UNDERGROUND_METAL

/area/metnal/inside/experimentation
	name = "实验区"
	icon_state = "research"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE
	ceiling = CEILING_DEEP_UNDERGROUND

// engineering areas
/area/metnal/inside/engineering
	name = "工程部"
	icon_state = "engine"
	ceiling = CEILING_OBSTRUCTED
	minimap_color = MINIMAP_AREA_ENGI

/area/metnal/inside/substation
	name = "地热变电站"
	icon_state = "substation"
	ceiling = CEILING_OBSTRUCTED
	minimap_color = MINIMAP_AREA_ENGI

/area/metnal/inside/garage
	name = "机库"
	icon_state = "garage"
	minimap_color = MINIMAP_AREA_REQ

// cargo areas
/area/metnal/inside/cargo
	name = "殖民地货运"
	icon_state = "primarystorage"
	minimap_color = MINIMAP_AREA_REQ

/area/metnal/inside/mining
	name = "矿物处理"
	icon_state = "mining"
	ceiling = CEILING_OBSTRUCTED
	minimap_color = MINIMAP_AREA_CELL_MED

/area/metnal/inside/auxstorage
	name = "辅助存储"
	icon_state = "storage"
	minimap_color = MINIMAP_AREA_REQ

/area/metnal/inside/mineralextraction
	name = "矿物开采区"
	icon_state = "mining"
	ceiling = CEILING_UNDERGROUND
	minimap_color = MINIMAP_AREA_REQ_CAVE

/area/metnal/inside/emergencystorage
	name = "二级应急储存室"
	icon_state = "storage"
	ceiling = CEILING_OBSTRUCTED
	minimap_color = MINIMAP_AREA_REQ

/area/metnal/inside/emergencyequip
	name = "紧急装备储存室"
	icon_state = "storage"
	ceiling = CEILING_OBSTRUCTED
	minimap_color = MINIMAP_AREA_REQ

/area/metnal/inside/centralminingequip
	name = "中央采矿设备仓库"
	icon_state = "storage"
	ceiling = CEILING_OBSTRUCTED
	minimap_color = MINIMAP_AREA_REQ

// cafeteria areas
/area/metnal/inside/bar
	name = "马尔斯酒吧"
	icon_state = "bar"
	minimap_color = MINIMAP_AREA_LIVING

/area/metnal/inside/cafeteria
	name = "食堂"
	icon_state = "cafeteria"
	minimap_color = MINIMAP_AREA_ESCAPE

// Headquarters areas
/area/metnal/inside/Headquarters
	name = "指挥部"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_COMMAND_CAVE

/area/metnal/inside/quartermaster
	name = "军需官集结区"
	icon_state = "storage"
	minimap_color = MINIMAP_AREA_REQ

/area/metnal/inside/bridge
	name = "舰桥"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_COMMAND

/area/metnal/inside/kitchen
	name = "厨房"
	icon_state = "kitchen"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/metnal/inside/restroom
	name = "主卫生间"
	icon_state = "cafeteria"
	minimap_color = MINIMAP_AREA_JUNGLE

/area/metnal/inside/executivedorms
	name = "指挥宿舍"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_COMMAND

/area/metnal/inside/primarystorage
	name = "主要殖民地仓库"
	icon_state = "storage"
	minimap_color = MINIMAP_AREA_REQ_CAVE

// other civilian areas

/area/metnal/inside/chapel
	name = "教堂"
	icon_state = "chapel"
	minimap_color = MINIMAP_AREA_LIVING

/area/metnal/inside/recreation
	name = "交叉路口"
	icon_state = "showroom"
	minimap_color = MINIMAP_AREA_LIVING
	ceiling = CEILING_DEEP_UNDERGROUND

/area/metnal/inside/bathhouse
	name = "澡堂"
	icon_state = "bathhouse"
	minimap_color = MINIMAP_AREA_LIVING
	ceiling = CEILING_METAL

// command areas
/area/metnal/inside/northmeetingroom
	name = "作战室"
	icon_state = "conference"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/metnal/inside/administration
	name = "管理"
	icon_state = "admin"
	minimap_color = MINIMAP_AREA_COMMAND

// security areas
/area/metnal/inside/security
	name = "安保"
	icon_state = "brig"
	minimap_color = MINIMAP_AREA_SEC

// medbay areas
/area/metnal/inside/meddesk
	name = "医疗舱文员桌"
	ceiling = CEILING_OBSTRUCTED
	minimap_color = MINIMAP_AREA_MEDBAY

/area/metnal/inside/medical
	name = "医务室"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY
	ceiling = CEILING_OBSTRUCTED
/area/metnal/inside/medical/storage
	name = "医疗区办公室与储藏室"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/metnal/inside/medical/chemistry
	name = "化学"
	ceiling = CEILING_OBSTRUCTED

// hydroponics areas
/area/metnal/inside/garden
	name = "水培花园"
	icon_state = "garden"
	minimap_color = MINIMAP_AREA_LIVING

// other areas
/area/metnal/inside/landingzoneone
	name = "一号着陆区"
	icon_state = "landingzone1"
	area_flags = NO_DROPPOD
	minimap_color = MINIMAP_AREA_LZ

/area/metnal/inside/telecomms
	name = "通讯"
	icon_state = "tcomsatcham"
	area_flags = NO_DROPPOD
	requires_power = FALSE
