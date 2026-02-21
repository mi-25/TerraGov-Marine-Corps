//Bluesummers Wreck Site Areas

//Caves
/area/bluesummers/caves
	name = "洞穴"
	icon_state = "cave"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambisin4.ogg')
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE

/area/bluesummers/caves/rock
	name = "封闭区域"
	icon_state = "transparent"

/area/bluesummers/caves/northwest
	name = "西北洞穴"
	icon_state = "northwest2"

/area/bluesummers/caves/northwest/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/bluesummers/caves/northwest/garbledradio/indoor
	name = "西北洞穴残骸区"
	always_unpowered = FALSE
	ceiling = CEILING_UNDERGROUND_METAL

/area/bluesummers/caves/northwest/indoor
	name = "西北洞穴残骸"
	always_unpowered = FALSE
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/bluesummers/caves/north
	name = "北部洞穴"
	icon_state = "north2"

/area/bluesummers/caves/north/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/bluesummers/caves/mining
	name = "北部地形改造区"
	icon_state = "nuke_storage"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_REQ
	always_unpowered = FALSE

/area/bluesummers/caves/mining/drill
	name = "奔袭者地形改造钻机"
	icon_state = "mining_eva"

/area/bluesummers/caves/mining/south
	name = "南侧地形改造翼"
	icon_state = "mining_storage"

/area/bluesummers/caves/cryostorage
	name = "低温休眠储存舱区"
	icon_state = "research"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_MEDBAY_CAVE
	always_unpowered = FALSE

/area/bluesummers/caves/cryostorage/north
	name = "低温休眠舱储存区北翼"
	icon_state = "anospectro"

/area/bluesummers/caves/cryostorage/south
	name = "低温休眠舱存储区南翼"
	icon_state = "anolab"
	ceiling = CEILING_UNDERGROUND_METAL

/area/bluesummers/caves/cryostorage/bridge
	name = "蓝夏号舰桥"
	icon_state = "bridge"

/area/bluesummers/caves/cryostorage/gravity
	name = "重力发生器室"
	icon_state = "anomaly"

/area/bluesummers/caves/cryostorage/tcomms
	name = "通信控制室"
	icon_state = "tcomsatcomp"

/area/bluesummers/caves/cloning
	name = "限制克隆区"
	icon_state = "cloning"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE
	always_unpowered = FALSE

/area/bluesummers/caves/dorms
	name = "船员宿舍"
	icon_state = "crew_quarters"
	ceiling = CEILING_UNDERGROUND
	minimap_color = MINIMAP_AREA_LIVING_CAVE
	always_unpowered = FALSE

/area/bluesummers/caves/martian
	name = "惩罚者级登舰船"
	icon_state = "shuttlered"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_SEC_CAVE
	always_unpowered = FALSE

/area/bluesummers/caves/northeast
	name = "东北洞穴"
	icon_state = "northeast2"

/area/bluesummers/caves/northeast/indoor
	name = "东北洞穴残骸区"
	always_unpowered = FALSE
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/bluesummers/caves/northeast/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/bluesummers/caves/northeast/garbledradio/indoor
	name = "东北洞穴残骸区"
	always_unpowered = FALSE
	ceiling = CEILING_UNDERGROUND_METAL

/area/bluesummers/caves/southwest
	name = "西南洞穴"
	icon_state = "southwest2"
	ceiling = CEILING_UNDERGROUND

/area/bluesummers/caves/east
	name = "东部隧道"
	icon_state = "east2"
	ceiling = CEILING_UNDERGROUND

/area/bluesummers/caves/southeast
	name = "东南洞穴"
	icon_state = "southeast2"
	ceiling = CEILING_UNDERGROUND

/area/bluesummers/caves/west
	name = "西侧隧道"
	icon_state = "west2"
	ceiling = CEILING_UNDERGROUND

/area/bluesummers/caves/south
	name = "南部洞穴"
	icon_state = "south2"
	ceiling = CEILING_UNDERGROUND

//Outside Area
/area/bluesummers/outside
	name = "沙漠地带"
	icon_state = "cliff_blocked"
	ceiling = CEILING_NONE
	outside = TRUE
	always_unpowered = TRUE
	ambience = list('sound/effects/wind/wind_2_1.ogg' = 1, 'sound/effects/wind/wind_2_2.ogg' = 1, 'sound/effects/wind/wind_3_1.ogg' = 1, 'sound/effects/wind/wind_4_1.ogg' = 1, 'sound/effects/wind/wind_4_2.ogg' = 1, 'sound/effects/wind/wind_5_1.ogg' = 1)
	min_ambience_cooldown = 10 SECONDS
	max_ambience_cooldown = 12 SECONDS

/area/bluesummers/outside/southeast
	name = "东南沙漠"
	icon_state = "southeast"

/area/bluesummers/outside/southeast/roofed
	ceiling = CEILING_METAL
	outside = FALSE

/area/bluesummers/outside/south
	name = "南部沙漠"
	icon_state = "south"

/area/bluesummers/outside/south/roofed
	ceiling = CEILING_METAL
	outside = FALSE

/area/bluesummers/outside/southwest
	name = "西南沙漠"
	icon_state = "southwest"

/area/bluesummers/outside/southwest/roofed
	ceiling = CEILING_METAL
	outside = FALSE

/area/bluesummers/outside/northeast
	name = "东北沙漠"
	icon_state = "northeast"

/area/bluesummers/outside/northeast/roofed
	ceiling = CEILING_METAL
	outside = FALSE

/area/bluesummers/outside/north
	name = "北部沙漠"
	icon_state = "north"

/area/bluesummers/outside/north/roofed
	ceiling = CEILING_METAL
	outside = FALSE

/area/bluesummers/outside/northwest
	name = "西北沙漠"
	icon_state = "northwest"

/area/bluesummers/outside/northwest/roofed
	ceiling = CEILING_METAL
	outside = FALSE

//Indoor Areas
/area/bluesummers/inside
	name = "内部"
	icon_state = "red"
	ceiling = CEILING_METAL
	outside = FALSE
	min_ambience_cooldown = 1 SECONDS
	max_ambience_cooldown = 1 SECONDS
	ambience = list('sound/ambience/ambienthum.ogg' = 1)

/area/bluesummers/inside/space_port
	name = "太空港"
	icon_state = "landingzone1"
	ceiling = NONE
	area_flags = NO_DROPPOD
	minimap_color = MINIMAP_AREA_LZ

/area/bluesummers/inside/telecomms
	name = "通讯"
	icon_state = "tcomsatcham"
	area_flags = NO_DROPPOD
	requires_power = FALSE

/area/bluesummers/inside/garage
	name = "载具储存翼舱"
	icon_state = "garage"

/area/bluesummers/inside/hydroponics
	name = "水培区北翼"
	icon_state = "hydro_north"
	minimap_color = MINIMAP_AREA_LIVING

/area/bluesummers/inside/hydroponics/south
	name = "水培区南翼"
	icon_state = "hydro_south"

/area/bluesummers/inside/biodome
	name = "生物环境穹顶"
	icon_state = "garden"
	minimap_color = MINIMAP_AREA_LIVING

/area/bluesummers/inside/engineering
	name = "工程区"
	icon_state = "engine_storage"
	minimap_color = MINIMAP_AREA_ENGI

/area/bluesummers/inside/engineering/office
	name = "工程翼办公室"
	icon_state = "engine_monitoring"

/area/bluesummers/inside/engineering/plant
	name = "电气翼植物"
	icon_state = "engine"
	ceiling = CEILING_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_ENGI_CAVE

/area/bluesummers/inside/engineering/plant/control
	name = "电气翼控制"
	icon_state = "engine_control"

/area/bluesummers/inside/chapel
	name = "宗教翼教堂"
	icon_state = "chapel"
	minimap_color = MINIMAP_AREA_LIVING

/area/bluesummers/inside/chapel/office
	name = "宗教翼办公室"
	icon_state = "chapeloffice"

/area/bluesummers/inside/recreation
	name = "娱乐区"
	icon_state = "courtroom"
	minimap_color = MINIMAP_AREA_LIVING

/area/bluesummers/inside/industrial
	name = "工业翼"
	icon_state = "construction"
	minimap_color = MINIMAP_AREA_REQ

/area/bluesummers/inside/robotics
	name = "机器人翼"
	icon_state = "toxlab"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/bluesummers/inside/captains_office
	name = "舰长办公室"
	icon_state = "captain"
	minimap_color = MINIMAP_AREA_COMMAND

/area/bluesummers/inside/observation_deck
	name = "观察甲板"
	icon_state = "tcomsatcham"

/area/bluesummers/inside/food_processing
	name = "西翼食品加工区"
	icon_state = "kitchen"
	minimap_color = MINIMAP_AREA_PREP

/area/bluesummers/inside/food_processing/east
	name = "东部食品加工区"

/area/bluesummers/inside/eva
	name = "EVA作战翼"
	icon_state = "eva"

/area/bluesummers/inside/holodeck
	name = "全息甲板娱乐区"
	icon_state = "Holodeck"

/area/bluesummers/inside/luxury
	name = "豪华客舱区"
	icon_state = "Theatre"
	minimap_color = MINIMAP_AREA_LIVING

/area/bluesummers/inside/data_processing
	name = "数据处理区"
	icon_state = "HH_MOFFICE"
