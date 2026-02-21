
//areas for new prison (I want to leave the legacy ones intact yo)

/area/fiorina
	name = "菲奥里纳轨道监狱 - 科学附属区"
	icon = 'icons/turf/area_prison_v3_fiorina.dmi'
	//ambience = list('figuresomethingout.ogg')
	icon_state = "fiorina"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_COLONY

/area/fiorina/oob
	name = "菲奥里娜 - 越界区域"
	icon_state = "oob"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = null
	always_unpowered = TRUE

/area/fiorina/maintenance
	name = "菲奥里纳 - 维护区"
	ceiling = CEILING_METAL
	icon_state = "maints"

//tumor / hive areas aka the place that is CAS immune
/area/fiorina/tumor
	name = "菲奥里纳 - 树脂瘤"
	icon_state = "tumor0"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_CAVES

/area/fiorina/tumor/deep
	icon_state = "tumor0-deep"

/area/fiorina/tumor/fiberbush
	name = "菲奥里纳 - 纤维灌木丛感染"
	icon_state = "tumor-fiberbush"
	minimap_color = MINIMAP_AREA_LIVING_CAVE

/area/fiorina/tumor/ship
	name = "菲奥里纳 - 拾荒船'NSV雷诺号'"
	icon_state = "tumor1"
	minimap_color = MINIMAP_AREA_SHIP

/area/fiorina/tumor/civres
	name = "菲奥里娜 - 绿色街区住宅区"
	icon_state = "tumor0"
	minimap_color = MINIMAP_AREA_LIVING_CAVE

/area/fiorina/tumor/aux_engi
	name = "菲奥里娜 - 工程区"
	icon_state = "tumor2"
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	ceiling = CEILING_UNDERGROUND

/area/fiorina/tumor/servers
	name = "菲奥里纳 - 研究服务器"
	icon_state = "tumor2"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/fiorina/tumor/ice_lab
	name = "菲奥里纳 - 低温研究实验室"
	icon_state = "tumor3"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE
	ceiling = CEILING_UNDERGROUND



//LZ CODE
/area/fiorina/lz
	icon_state = "lz"
	ceiling = CEILING_GLASS
	name = "菲奥里纳 - 着陆区"
	minimap_color = MINIMAP_AREA_LZ

/area/fiorina/lz/near_lzI
	name = "菲奥里纳 - LZ1辅助港口"

/area/fiorina/lz/near_lzII
	name = "菲奥里纳 - LZ2 监狱港口"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/fiorina/lz/console_I
	name = "菲奥里纳 - LZ1 控制台"
	icon_state = "lz1"
	requires_power = 0

/area/fiorina/lz/console_II
	name = "菲奥里纳 - LZ2 控制台"
	icon_state = "lz2"
	requires_power = 0

/area/shuttle/drop1/prison_v3
	name = "菲奥里纳 - 阿拉莫号运输机着陆区"
	icon_state = "shuttle"

/area/shuttle/drop2/prison_v3
	name = "菲奥里纳 - 诺曼底着陆区"
	icon_state = "shuttle2"

//STATION AREAS AAAA
/area/fiorina/station
	name = "菲奥里娜 - 空间站内部"
	icon_state = "station0"
	ceiling = CEILING_GLASS

/area/fiorina/station/lowsec
	name = "菲奥里娜 - 低安保监区"
	icon_state = "station1"
	minimap_color = MINIMAP_AREA_CELL_VIP

/area/fiorina/station/power_ring
	name = "菲奥里纳 - 工程环带"
	icon_state = "power0"
	minimap_color = MINIMAP_AREA_ENGI

/area/fiorina/station/disco
	name = "菲奥里娜 - 迪斯科仓库"
	icon_state = "disco"

/area/fiorina/station/flight_deck
	name = "菲奥里娜 - 飞行甲板"
	icon_state = "police_line"

/area/fiorina/station/security
	name = "菲奥里娜 - 安保中心"
	icon_state = "security_hub"
	minimap_color = MINIMAP_AREA_SEC
	ceiling = CEILING_METAL

/area/fiorina/station/security/wardens
	name = "菲奥里娜 - 典狱长办公室"
	icon_state = "wardens"
	minimap_color = MINIMAP_AREA_SEC

/area/fiorina/station/botany
	name = "菲奥里娜 - 植物学培育托盘"
	icon_state = "botany"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/fiorina/station/park
	name = "菲奥里纳 - 公园"
	icon_state = "station0"
	minimap_color = MINIMAP_AREA_LIVING
	ceiling = CEILING_METAL

/area/fiorina/station/transit_hub
	name = "菲奥里纳 - 交通枢纽"
	icon_state = "station1"
	minimap_color = MINIMAP_AREA_COLONY

/area/fiorina/station/central_ring
	name = "菲奥里纳 - 中央环带"
	icon_state = "station2"
	minimap_color = MINIMAP_AREA_LIVING
	ceiling = CEILING_METAL

/area/fiorina/station/chapel
	name = "菲奥里娜 - 礼拜堂"
	icon_state = "station3"
	minimap_color = MINIMAP_AREA_LIVING
	ceiling = CEILING_METAL

/area/fiorina/station/civres_blue
	name = "菲奥里纳 - 蓝色街区住宅区"
	icon_state = "station1"
	minimap_color = MINIMAP_AREA_REQ
	ceiling = CEILING_METAL

/area/fiorina/station/medbay
	name = "菲奥里娜 - 医疗舱"
	icon_state = "station4"
	minimap_color = MINIMAP_AREA_MEDBAY
	ceiling = CEILING_METAL

/area/fiorina/station/research_cells
	name = "菲奥里纳 - 研究监区"
	icon_state = "station0"
	minimap_color = MINIMAP_AREA_RESEARCH


//telecomms areas
/area/fiorina/station/telecomm
	name = "菲奥里纳 - 通信中继站"
	icon_state = "ass_line"

/area/fiorina/station/telecomm/lz1_cargo
	name = "菲奥里纳 - LZ1 货舱通信中继站"

/area/fiorina/station/telecomm/lz1_containers
	name = "菲奥里纳 - LZ1 集装箱通信中继站"

/area/fiorina/station/telecomm/lz1_tram
	name = "菲奥里纳 - LZ1辅助港口通信中继站"

/area/fiorina/station/telecomm/lz1_engineering
	name = "菲奥里纳 - 工程主通信中继站"

/area/fiorina/station/telecomm/lz2_engineering
	name = "菲奥里纳 - 工程部次级通讯中继站"

/area/fiorina/station/telecomm/lz2_north
	name = "菲奥里纳 - LZ2 北部通信中继站"

/area/fiorina/station/telecomm/lz2_maint
	name = "菲奥里纳 - 备用通信中继站"
