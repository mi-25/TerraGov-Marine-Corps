/area/bluemoon/outside
	name = "殖民地地面"
	icon_state = "blue"
	ceiling = CEILING_NONE
	minimap_color = MINIMAP_AREA_COLONY
	always_unpowered = TRUE

/area/bluemoon/outside/c
	name = "中央殖民地地面"
	icon_state = "central"

/area/bluemoon/outside/n
	name = "北部殖民地地面"
	icon_state = "north"

/area/bluemoon/outside/w
	name = "西部殖民地地面"
	icon_state = "west"

/area/bluemoon/outside/e
	name = "东部殖民地地面"
	icon_state = "east"

/area/bluemoon/outside/s
	name = "南方殖民地地面"
	icon_state = "south"

/area/bluemoon/outside/se
	name = "东南殖民地地面"
	icon_state = "southeast"

/area/bluemoon/outside/ne
	name = "东北殖民地地面"
	icon_state = "northeast"

/area/bluemoon/caves
	name = "洞穴"
	icon_state = "bluenew"
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	ambience = list('sound/ambience/ambicave.ogg', 'sound/ambience/ambilava1.ogg', 'sound/ambience/ambilava2.ogg', 'sound/ambience/ambilava3.ogg')
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE

/area/bluemoon/caves/rock
	name = "封闭区域"
	icon_state = "transparent"
	area_flags = CANNOT_NUKE

/area/bluemoon/caves/w
	name = "西部洞穴"
	icon_state = "west"
	ceiling = CEILING_UNDERGROUND

/area/bluemoon/caves/sw
	name = "西南洞穴"
	icon_state = "southwest"

/area/bluemoon/caves/sw/shallow
	ceiling = CEILING_UNDERGROUND

/area/bluemoon/caves/s
	name = "南部洞穴"
	icon_state = "south"

/area/bluemoon/caves/s/shallow
	ceiling = CEILING_UNDERGROUND

/area/bluemoon/caves/se
	name = "东南洞穴"
	icon_state = "southeast"
	area_flags = CANNOT_NUKE

/area/bluemoon/caves/e
	name = "东部洞穴"
	icon_state = "east"

/area/bluemoon/caves/e/shallow
	ceiling = CEILING_UNDERGROUND

/area/bluemoon/caves/ne
	name = "东北洞穴区"
	icon_state = "northeast"

/area/bluemoon/caves/ne/shallow
	ceiling = CEILING_UNDERGROUND

/area/bluemoon/caves/n
	name = "北部洞穴"
	icon_state = "north"
	ceiling = CEILING_UNDERGROUND

/area/bluemoon/caves/facility
	name = "未知区域"
	icon_state = "blue"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	always_unpowered = FALSE
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/bluemoon/caves/facility/bunker
	name = "紧急掩体"
	minimap_color = MINIMAP_AREA_LIVING_CAVE

/area/bluemoon/caves/facility/omicron
	name = "欧米茄研究设施"
	icon_state = "anomaly"
	area_flags = CANNOT_NUKE

/area/bluemoon/caves/facility/eta
	name = "埃塔研究设施"
	icon_state = "anog"
	area_flags = CANNOT_NUKE

/area/bluemoon/caves/facility/eta/e
	name = "埃塔研究设施 - 办公区"

/area/bluemoon/caves/facility/eta/xeno
	name = "埃塔研究设施 - 异形收容单元"
	icon_state = "xeno_lab"

/area/bluemoon/caves/facility/lambda
	name = "拉姆达研究设施"
	icon_state = "research"

/area/bluemoon/caves/facility/lambda/n
	name = "拉姆达研究设施 - 北部"

/area/bluemoon/caves/facility/lambda/s
	name = "拉姆达研究设施 - 南部"

/area/bluemoon/caves/facility/lambda/sec
	name = "Lambda研究设施 - 安全检查站"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_SEC

/area/bluemoon/outside/building
	name = "未知区域"
	icon_state = "blue"
	ceiling = CEILING_METAL
	outside = FALSE
	always_unpowered = FALSE

/area/bluemoon/outside/building/lz
	name = "太空港"
	icon_state = "shuttle"
	minimap_color = MINIMAP_AREA_LZ
	ceiling = CEILING_NONE
	area_flags = NEAR_FOB

/area/bluemoon/outside/building/marshal
	name = "宪兵办公室"
	icon_state = "armory"
	minimap_color = MINIMAP_AREA_SEC

/area/bluemoon/outside/building/marshal/court
	name = "法庭"

/area/bluemoon/outside/building/med
	name = "医疗诊所"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/bluemoon/outside/building/med/icu
	name = "医疗诊所重症监护室"
	icon_state = "medbay2"

/area/bluemoon/outside/building/cargo
	name = "货舱"
	icon_state = "ass_line"
	minimap_color = MINIMAP_AREA_REQ

/area/bluemoon/outside/building/cargo/outpost
	name = "货物储存区"

/area/bluemoon/outside/building/cargo/shop
	name = "综合商店"
	icon_state = "yellow"

/area/bluemoon/outside/building/virology
	name = "病毒学实验室"
	icon_state = "toxlab"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/bluemoon/outside/building/engi
	name = "变电站"
	icon_state = "engine"
	minimap_color = MINIMAP_AREA_ENGI

/area/bluemoon/outside/building/engi/filt
	name = "过滤厂"
	icon_state = "engine_waste"

/area/bluemoon/outside/building/admin
	name = "殖民地行政办公室"
	icon_state = "blue2"
	minimap_color = MINIMAP_AREA_COMMAND

/area/bluemoon/outside/building/dorms
	name = "殖民地宿舍区"
	icon_state = "restrooms"
	minimap_color = MINIMAP_AREA_LIVING

/area/bluemoon/outside/building/dorms/rec
	name = "街机"
	icon_state = "green"

/area/bluemoon/outside/building/dorms/bar
	name = "酒吧"
	icon_state = "sensor"

/area/bluemoon/outside/building/dorms/eat
	name = "食堂"
	icon_state = "lava_civ_cargo"

/area/bluemoon/outside/building/dorms/plant
	name = "水培舱"
	icon_state = "hydro"
	ceiling = CEILING_GLASS

/area/bluemoon/outside/building/dorms/chapel
	name = "礼拜堂"
	icon_state = "library"

/area/bluemoon/outside/building/mining
	name = "挖掘中心"
	icon_state = "mining_outpost"
	minimap_color = MINIMAP_AREA_ENGI_CAVE

/area/bluemoon/outside/building/toolshed
	name = "工具储藏室"
	icon_state = "auxstorage"
	minimap_color = MINIMAP_AREA_REQ_CAVE
