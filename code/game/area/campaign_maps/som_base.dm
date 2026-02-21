//rocinanteBase AREAS//
/area/rocinante_base
	name = "罗西南多极地基地"
	icon_state = "dark"
	area_flags = ALWAYS_RADIO

/area/rocinante_base/ground
	name = "地面"
	icon_state = "green"
	always_unpowered = TRUE
	minimap_color = MINIMAP_AREA_COLONY
	ambience = list('sound/ambience/ambi_snow.ogg')

/area/rocinante_base/surface
	name = "地表"
	icon_state = "red"

/area/rocinante_base/surface/building
	name = "罗西南多号内部"
	icon_state = "clear"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_COLONY

/area/rocinante_base/surface/building/building_underground
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_CAVES

/area/rocinante_base/ground/underground
	name = "罗西南多基地地下"
	icon_state = "cave"
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES

//landingZone
/area/rocinante_base/surface/landing

/area/rocinante_base/surface/landing/landing_pad_one
	name = "1号着陆坪"
	icon_state = "landing_pad"
	minimap_color = MINIMAP_AREA_LZ

/area/rocinante_base/surface/landing/landing_pad_one_external
	name = "着陆区1"
	icon_state = "landing_pad_ext"
	minimap_color = MINIMAP_AREA_LZ

/area/rocinante_base/surface/landing/landing_pad_two
	name = "2号着陆坪"
	icon_state = "landing_pad"
	minimap_color = MINIMAP_AREA_LZ

/area/rocinante_base/surface/landing/landing_pad_two_external
	name = "着陆区2"
	icon_state = "landing_pad_ext"
	minimap_color = MINIMAP_AREA_LZ

//BaseGround
/area/rocinante_base/ground/base_se
	name ="东南基地"
	icon_state = "southeast"

/area/rocinante_base/ground/base_s
	name ="南方基地"
	icon_state = "south"

/area/rocinante_base/ground/base_sw
	name ="西南基地"
	icon_state = "southwest"

/area/rocinante_base/ground/base_w
	name ="西部基地"
	icon_state = "west"

/area/rocinante_base/ground/base_e
	name ="东部基地"
	icon_state = "east"

/area/rocinante_base/ground/base_nw
	name ="西北基地"
	icon_state = "northwest"

/area/rocinante_base/ground/base_n
	name ="北部基地"
	icon_state = "north"

/area/rocinante_base/ground/base_ne
	name ="东北基地"
	icon_state = "northeast"

/area/rocinante_base/ground/base_cent
	name ="中央基地"
	icon_state = "central"

/area/rocinante_base/ground/southern_containers
	name ="南部集装箱仓库"
	icon_state = "primarystorage"
	minimap_color = MINIMAP_AREA_REQ

/area/rocinante_base/ground/firing_range
	name ="射击场"
	icon_state = "armory"

//BaseCaves
/area/rocinante_base/ground/underground/cave
	name = "地下洞穴"
	icon_state = "cave"

/area/rocinante_base/ground/underground/caveN
	name = "北部洞穴"
	icon_state = "cave"

/area/rocinante_base/ground/underground/caveCent
	name = "中央洞穴"
	icon_state = "cave"

/area/rocinante_base/ground/underground/caveE
	name = "东部洞穴"
	icon_state = "cave"

/area/rocinante_base/ground/underground/caveS
	name = "南部洞穴"
	icon_state = "cave"

/area/rocinante_base/ground/underground/caveW
	name = "西部洞穴"
	icon_state = "cave"

//BaseBuildings

//admin
/area/rocinante_base/surface/building/administration
	name = "管理"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_COMMAND

/area/rocinante_base/surface/building/administration/breakroom
	name = "行政休息室"

/area/rocinante_base/surface/building/administration/command
	name = "后勤指挥部"

/area/rocinante_base/surface/building/administration/north_com
	name = "北方指挥部"

/area/rocinante_base/surface/building/administration/central_com
	name = "中央指挥部"

/area/rocinante_base/surface/building/administration/south_com
	name = "南方指挥部"

/area/rocinante_base/surface/building/administration/comm_post
	name = "通讯站"

/area/rocinante_base/surface/building/administration/meeting
	name = "会议室"

/area/rocinante_base/surface/building/administration/air_com
	name = "南方航空指挥部"

/area/rocinante_base/surface/building/administration/north_air_com
	name = "北部空中指挥区"

//living
/area/rocinante_base/surface/building/living
	name = "生命体"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_LIVING

/area/rocinante_base/surface/building/living/prep
	name = "陆战队准备"
	minimap_color = MINIMAP_AREA_PREP

/area/rocinante_base/surface/building/living/barracks
	name = "陆战队营房"
	minimap_color = MINIMAP_AREA_PREP

/area/rocinante_base/surface/building/living/west_barracks
	name = "西部营房"

/area/rocinante_base/surface/building/living/po_quarters
	name = "飞行员宿舍"

/area/rocinante_base/surface/building/living/laundromat
	name = "洗衣房"

/area/rocinante_base/surface/building/living/bar
	name = "酒吧"

/area/rocinante_base/surface/building/living/janitor
	name = "清洁工具间"
	icon_state = "janitor"

/area/rocinante_base/surface/building/living/chapel_ne
	name = "东北礼拜堂"
	icon_state = "chapel"

//tram
/area/rocinante_base/surface/building/tramstation
	name = "电车车站"
	icon_state = "landing_pad_ext"
	minimap_color = MINIMAP_AREA_LZ

/area/rocinante_base/surface/building/tramstation/tramstation_nw
	name = "西北电车车站"

/area/rocinante_base/surface/building/tramstation/tramstation_cent
	name = "中央电车车站"

/area/rocinante_base/surface/building/tramstation/tramstation_e
	name = "东部电车车站"

//sci
/area/rocinante_base/surface/building/science
	name = "科研"
	icon_state = "toxlab"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/rocinante_base/surface/building/science/research_lab
	name = "中央研究实验室"

/area/rocinante_base/surface/building/science/crystal_lab
	name = "水晶研究实验室"

/area/rocinante_base/surface/building/science/tele_lab
	name = "传送研究实验室"

/area/rocinante_base/surface/building/science/bio_lab
	name = "生化研究实验室"
	icon_state = "xeno_lab"

/area/rocinante_base/surface/building/science/complex_hall
	name = "西部研究综合楼走廊"
	icon_state = "purple"

/area/rocinante_base/surface/building/science/complex_hall_e
	name = "东部研究综合楼走廊"
	icon_state = "purple"

/area/rocinante_base/surface/building/science/break_room
	name = "研究休息区"

//security
/area/rocinante_base/surface/building/security
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/area/rocinante_base/surface/building/security/hub
	name = "安全中心"

/area/rocinante_base/surface/building/security/brig
	name = "禁闭室"

/area/rocinante_base/surface/building/security/sec_dorms
	name = "安全宿舍"

/area/rocinante_base/surface/building/security/complex_sec
	name = "研究综合楼安保哨所"

/area/rocinante_base/surface/building/security/garage_sec
	name = "载具库安全岗哨"

/area/rocinante_base/surface/building/security/medical_sec
	name = "医疗安保岗"

/area/rocinante_base/surface/building/security/west_sec
	name = "西部哨站"

/area/rocinante_base/surface/building/security/command_sec
	name = "指挥安全哨所"

//cargo
/area/rocinante_base/surface/building/cargo
	name = "货物"
	icon_state = "quart"
	minimap_color = MINIMAP_AREA_REQ

/area/rocinante_base/surface/building/cargo/vehicle_garage
	name = "载具机库"

/area/rocinante_base/surface/building/cargo/southern_aux
	name = "南部辅助储藏室"

/area/rocinante_base/surface/building/cargo/air_storage
	name = "弹药库"

//engie
/area/rocinante_base/surface/building/engineering
	name = "工程部"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI

/area/rocinante_base/surface/building/engineering/north_smes
	name = "北部SMES站"

/area/rocinante_base/surface/building/engineering/south_smes
	name = "南部SMES站"

//medical
/area/rocinante_base/surface/building/medical
	name = "医疗"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

//misc
/area/rocinante_base/surface/building/office_n
	name = "北部办公楼"
	icon_state = "law"

/area/rocinante_base/surface/building/north_aux
	name = "北部辅助储藏室"

/area/rocinante_base/surface/building/central_aux
	name = "中央辅助存储区"

/area/rocinante_base/surface/building/command_hall
	name = "北方指挥部走廊"

/area/rocinante_base/surface/building/southern_construction
	name = "南部建筑工地"

/area/rocinante_base/surface/building/mining_construction
	name = "采矿工地"

/area/rocinante_base/surface/building/lz_control
	name = "着陆区控制"
	minimap_color = MINIMAP_AREA_LZ

/area/rocinante_base/surface/building/tram_line
	name = "电车线路"
	icon_state = "yellow"

/area/rocinante_base/surface/building/west_aux
	name = "西部辅助储藏室"

/area/rocinante_base/surface/building/train_station
	name = "火车站"
	icon_state = "landing_pad_ext"
	outside = FALSE
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_REQ_CAVE
