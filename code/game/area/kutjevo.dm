
//Areas for the Kutjevo Refinery

/area/kutjevo
	name = "库切沃精炼厂"
	icon = 'icons/turf/area_kutjevo.dmi'
	icon_state = "kutjevo"
	temperature = 308.7 //kelvin, 35c, 95f
	minimap_color = MINIMAP_AREA_ENGI

/area/shuttle/drop1/kutjevo
	name = "库特耶沃 - 阿拉莫号运输机着陆区"
	icon_state = "shuttle"
	icon = 'icons/turf/area_kutjevo.dmi'

/area/shuttle/drop2/kutjevo
	name = "库切沃 - 诺曼底号登陆区"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_kutjevo.dmi'
	minimap_color = MINIMAP_AREA_LZ

/area/kutjevo/exterior
	name = "库切沃 - 外部"
	ceiling = CEILING_NONE
	icon_state = "ext"
	always_unpowered = TRUE

/area/kutjevo/interior
	name = "库切沃 - 内部"
	icon_state = "int"
	always_unpowered = FALSE
	min_ambience_cooldown = 1 SECONDS
	max_ambience_cooldown = 1 SECONDS
	ambience = list('sound/ambience/ambienthum.ogg' = 1)

/area/kutjevo/interior/oob
	name = "库切沃 - 禁区"
	icon_state = "oob"
	ceiling = CEILING_DEEP_UNDERGROUND
	always_unpowered = TRUE

/area/kutjevo/interior/oob/dev_room
	name = "库切沃 - 制作人员室"
	icon_state = "kutjevo"

//exterior map areas

/area/kutjevo/exterior/lz_pad
	name = "库特耶沃辅助着陆区"
	icon_state = "lz_pad"
	minimap_color = MINIMAP_BLACK

/area/kutjevo/exterior/lz_dunes
	name = "库切沃 - 着陆区沙丘"
	icon_state = "lz_dunes"
	minimap_color = MINIMAP_AREA_CAVES

/area/kutjevo/exterior/lz_river
	name = "库切沃 - 发电站河"
	icon_state = "lz_river"
	minimap_color = MINIMAP_WATER

/area/kutjevo/exterior/spring
	name = "库切沃 - 南方之春"
	icon_state = "lz_river"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_CAVES

/area/kutjevo/exterior/scrubland
	name = "库切沃 - 灌木地带"
	icon_state = "scrubland"
	minimap_color = MINIMAP_AREA_COLONY

/area/kutjevo/exterior/scrubland/north
	name = "库切沃 - 北部灌木地带"

/area/kutjevo/exterior/scrubland/south
	name = "库切沃 - 灌木丛南部"
	ambience = list('sound/effects/wind/wind_2_1.ogg' = 1, 'sound/effects/wind/wind_2_2.ogg' = 1, 'sound/effects/wind/wind_3_1.ogg' = 1, 'sound/effects/wind/wind_4_1.ogg' = 1, 'sound/effects/wind/wind_4_2.ogg' = 1, 'sound/effects/wind/wind_5_1.ogg' = 1)
	min_ambience_cooldown = 10 SECONDS
	max_ambience_cooldown = 12 SECONDS

/area/kutjevo/exterior/stonyfields
	name = "库切沃 - 石原"
	icon_state = "stone_fields"
	minimap_color = MINIMAP_AREA_COLONY

/area/kutjevo/exterior/space_port
	name = "库切沃综合设施 - 西北太空港"
	icon_state = "green"
	always_unpowered = FALSE
	ceiling = CEILING_NONE
	minimap_color = MINIMAP_AREA_LZ

/area/kutjevo/exterior/Northwest_Colony
	name = "库切沃 - 西北殖民地地面"
	icon_state = "rf_dunes"
	minimap_color = MINIMAP_AREA_COLONY
	ambience = list('sound/effects/wind/wind_2_1.ogg' = 1, 'sound/effects/wind/wind_2_2.ogg' = 1, 'sound/effects/wind/wind_3_1.ogg' = 1, 'sound/effects/wind/wind_4_1.ogg' = 1, 'sound/effects/wind/wind_4_2.ogg' = 1, 'sound/effects/wind/wind_5_1.ogg' = 1)
	min_ambience_cooldown = 10 SECONDS
	max_ambience_cooldown = 12 SECONDS

/area/kutjevo/exterior/runoff_dunes
	name = "库切沃 - 径流沙丘"
	icon_state = "rf_dunes"
	minimap_color = MINIMAP_AREA_COLONY

/area/kutjevo/exterior/runoff_river
	name = "库切沃 - 径流河"
	icon_state = "rf_river"
	minimap_color = MINIMAP_WATER

/area/kutjevo/exterior/runoff_bridge
	name = "库切沃 - 径流桥"
	icon_state = "rf_bridge"
	minimap_color = MINIMAP_AREA_COLONY

/area/kutjevo/exterior/overlook
	name = "库切沃 - 径流河俯瞰点"
	icon_state = "rf_overlook"

/area/kutjevo/exterior/botany_bay_ext
	name = "库切沃 - 太空大麻农场外部"
	icon_state = "weed_ext"

/area/kutjevo/exterior/construction
	name = "库切沃 - 废弃建筑工地"
	icon_state = "construction"
	minimap_color = MINIMAP_AREA_COLONY
	ambience = list('sound/ambience/windambient.ogg' = 1)
	min_ambience_cooldown = 19 SECONDS
	max_ambience_cooldown = 19 SECONDS

/area/kutjevo/exterior/complex_border
	name = "库切沃综合设施 - 外部"
	icon_state = "kutjevo"
	minimap_color = MINIMAP_AREA_COLONY

/area/kutjevo/exterior/complex_border/botany_medical_cave
	name = "库切沃综合设施 - 植物学 - 医疗洞穴"
	icon_state = "med_ext"
	ambience = list('sound/ambience/windambient.ogg' = 1)
	min_ambience_cooldown = 19 SECONDS
	max_ambience_cooldown = 19 SECONDS

/area/kutjevo/exterior/complex_border/med_park
	name = "库切沃综合区 - 医疗园区"
	icon_state = "med_ext"

/area/kutjevo/exterior/complex_border/med_rec
	name = "库切沃综合设施 - 水箱洞穴"
	icon_state = "construction2"

//telecomms areas
/area/kutjevo/exterior/telecomm
	name = "库切沃 - 通信中继站"
	icon_state = "ass_line"
	always_unpowered = FALSE

/area/kutjevo/exterior/telecomm/lz1_north
	name = "库特耶沃 - 北部LZ1通讯中继站"

/area/kutjevo/exterior/telecomm/lz1_south
	name = "库特耶沃 - 南LZ1通讯中继站"

/area/kutjevo/exterior/telecomm/lz2_north
	name = "库特耶沃 - 北部LZ2通信中继站"

/area/kutjevo/exterior/telecomm/lz2_south
	name = "库特耶沃 - 南侧LZ2通讯中继站"

//interior areas + caves

//Primary Colony Buildings
/area/kutjevo/interior/complex
	name = "库切沃综合设施"
	ceiling = CEILING_METAL
	icon_state = "kutjevo"

/area/kutjevo/interior/complex/botany
	name = "库切沃综合设施 - 植物学湾"
	icon_state = "botany0"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/kutjevo/interior/complex/botany/east
	name = "库切沃综合设施 - 植物学东厅"
	icon_state = "botany1"

/area/kutjevo/interior/complex/botany/east_tech
	name = "库切沃综合设施 - 发电厂通道"
	icon_state = "botany1"
	minimap_color = MINIMAP_AREA_COLONY

/area/kutjevo/interior/complex/botany/locks
	name = "库切沃综合设施 - 植物学风暴锁"
	icon_state = "botany0"

/area/kutjevo/interior/complex/med
	name = "库切沃综合设施 - 医疗大厅"
	icon_state = "med0"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/kutjevo/interior/complex/med/auto_doc
	name = "库切沃综合设施 - 医疗自动诊疗走廊"
	icon_state = "med2"

/area/kutjevo/interior/complex/med/operating
	name = "库切沃综合设施 - 医疗操作走廊"
	icon_state = "med3"

/area/kutjevo/interior/complex/med/triage
	name = "库切沃综合设施 - 医疗检伤分类走廊"
	icon_state = "med4"

/area/kutjevo/interior/complex/med/cells
	name = "库切沃综合设施 - 医疗冷冻舱"
	icon_state = "med5"

/area/kutjevo/interior/complex/med/pano
	name = "库切沃综合设施 - 医疗全景监控中心"
	icon_state = "med3"

/area/kutjevo/interior/complex/med/locks
	name = "库切沃综合设施 - 医疗风暴锁"
	icon_state = "med1"

/area/kutjevo/interior/complex/Northwest_Dorms
	name = "库切沃综合区 - 西北殖民地宿舍"
	icon_state = "Colony_int"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_LZ
	area_flags = MARINE_BASE

/area/kutjevo/interior/complex/Northwest_Flight_Control
	name =  "库切沃综合设施 - 西北飞行控制室"
	icon_state = "Colony_int"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_LZ
	area_flags = MARINE_BASE

/area/kutjevo/interior/complex/Northwest_Security_Checkpoint
	name = "库切沃综合设施 - 西北安全检查站"
	icon_state = "Colony_int"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_SEC
	area_flags = MARINE_BASE

//Out buildings + foremans
/area/kutjevo/interior/power
	name = "库切沃 - 水电站变电站"
	ceiling = CEILING_METAL
	icon_state = "power"
	minimap_color = MINIMAP_AREA_ENGI

/area/kutjevo/interior/power/comms
	name = "库切沃 - 水电站通讯中继站"
	ceiling = CEILING_METAL
	icon_state = "power"
	minimap_color = MINIMAP_AREA_ENGI

/area/kutjevo/interior/filtration
	name = "库切沃 - 水力发电大坝过滤站"
	ceiling = CEILING_METAL
	icon_state = "power"
	minimap_color = MINIMAP_AREA_ENGI

/area/kutjevo/interior/construction
	name = "库切沃 - 废弃建筑内部"
	ceiling = CEILING_UNDERGROUND_METAL
	icon_state = "construction_int"
	minimap_color = MINIMAP_AREA_CAVES

/area/kutjevo/interior/construction/two
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	ceiling = CEILING_UNDERGROUND_METAL

/area/kutjevo/interior/foremans_office
	name = "库切沃 - 工头办公室"
	ceiling = CEILING_METAL
	icon_state = "foremans"

/area/kutjevo/interior/botany_bay_int
	name = "库切沃 - 太空大麻农场内部"
	ceiling = CEILING_METAL
	icon_state = "weed_int"

/area/kutjevo/interior/power_pt2_electric_boogaloo
	name = "库切沃 - 发电厂"
	ceiling = CEILING_METAL
	icon_state = "power_2"
	minimap_color = MINIMAP_AREA_SEC

/area/kutjevo/interior/colony
	name = "库切沃 - 殖民地建筑内部"
	icon_state = "colony_int"

/area/kutjevo/exterior/colony_central
	name = "库切沃 - 中央殖民地洞穴"
	icon_state = "colony_caves_0"
	minimap_color = MINIMAP_AREA_CAVES
	ceiling = CEILING_UNDERGROUND
	ambience = list('sound/ambience/ambicave.ogg', 'sound/ambience/ambilava1.ogg', 'sound/ambience/ambilava2.ogg', 'sound/ambience/ambicave2.ogg', 'sound/effects/rocksfalling1.ogg', 'sound/effects/rocksfalling2.ogg')

/area/kutjevo/interior/colony_central/mine_elevator
	name = "库切沃 - 中央殖民地电梯"
	icon_state = "colony_caves_0"
	ambience = list('sound/ambience/ambicave.ogg', 'sound/ambience/ambilava1.ogg', 'sound/ambience/ambilava2.ogg', 'sound/ambience/ambicave2.ogg', 'sound/effects/rocksfalling1.ogg', 'sound/effects/rocksfalling2.ogg')
	ceiling = CEILING_UNDERGROUND
	minimap_color = MINIMAP_AREA_SEC

/area/kutjevo/exterior/colony_north
	name = "库切沃 - 北部殖民地洞穴"
	ceiling = CEILING_DEEP_UNDERGROUND
	icon_state = "colony_caves_1"
	ambience = list('sound/ambience/ambicave.ogg', 'sound/ambience/ambilava1.ogg', 'sound/ambience/ambilava2.ogg', 'sound/ambience/ambicave2.ogg', 'sound/effects/rocksfalling1.ogg', 'sound/effects/rocksfalling2.ogg')
	minimap_color = MINIMAP_AREA_CAVES

/area/kutjevo/exterior/colony_north/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/kutjevo/exterior/colony_S_East
	name = "库切沃 - 东北殖民地洞穴"
	ceiling = CEILING_DEEP_UNDERGROUND
	icon_state = "colony_caves_2"
	ambience = list('sound/ambience/ambicave.ogg', 'sound/ambience/ambilava1.ogg', 'sound/ambience/ambilava2.ogg', 'sound/ambience/ambicave2.ogg', 'sound/effects/rocksfalling1.ogg', 'sound/effects/rocksfalling2.ogg')
	minimap_color = MINIMAP_AREA_CAVES

/area/kutjevo/exterior/colony_S_east/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/kutjevo/exterior/colony_N_East
	name = "库切沃 - 东南殖民地洞穴"
	ceiling = CEILING_DEEP_UNDERGROUND
	icon_state = "colony_caves_2"
	ambience = list('sound/ambience/ambicave.ogg', 'sound/ambience/ambilava1.ogg', 'sound/ambience/ambilava2.ogg', 'sound/ambience/ambicave2.ogg', 'sound/effects/rocksfalling1.ogg', 'sound/effects/rocksfalling2.ogg')
	minimap_color = MINIMAP_AREA_CAVES

/area/kutjevo/exterior/colony_N_east/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/kutjevo/exterior/colony_South
	name = "库切沃 - 南部殖民地洞穴"
	ceiling = CEILING_DEEP_UNDERGROUND
	icon_state = "colony_caves_3"
	ambience = list('sound/ambience/ambicave.ogg', 'sound/ambience/ambilava1.ogg', 'sound/ambience/ambilava2.ogg', 'sound/ambience/ambicave2.ogg', 'sound/effects/rocksfalling1.ogg', 'sound/effects/rocksfalling2.ogg')
	minimap_color = MINIMAP_AREA_CAVES

/area/kutjevo/exterior/colony_South/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/kutjevo/interior/colony_South/power2
	name = "库切沃 - 南部殖民地处理厂"
	ceiling = CEILING_UNDERGROUND_METAL
	icon_state = "colony_caves_3"
	minimap_color = MINIMAP_AREA_ENGI_CAVE
