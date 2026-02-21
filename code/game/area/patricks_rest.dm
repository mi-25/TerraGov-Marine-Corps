//Patricks Rest  AREAS//
/area/patricks_rest
	name = "帕特里克休息站"
	icon_state = "dark"
	area_flags = ALWAYS_RADIO

/area/patricks_rest/ground
	name = "地面"
	icon_state = "green"
	always_unpowered = TRUE

/area/patricks_rest/surface
	name = "地表"
	icon_state = "red"

/area/patricks_rest/surface/building
	name = "帕特里克休息站殖民地建筑"
	icon_state = "clear"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_COLONY

/area/patricks_rest/ground/underground
	name = "帕特里克休息站殖民地地下"
	icon_state = "cave"
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES

//LandingZone
/area/patricks_rest/surface/landing_pad
	name = "1号着陆坪"
	icon_state = "landing_pad"
	area_flags = NO_DROPPOD
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ

/area/patricks_rest/surface/landing_pad_external
	name = "着陆区1"
	icon_state = "landing_pad_ext"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ

/area/patricks_rest/surface/landing_pad_2
	name = "二号着陆坪"
	icon_state = "landing_pad"
	area_flags = NO_DROPPOD
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ

/area/patricks_rest/surface/landing_pad2_external
	name = "着陆区2"
	icon_state = "landing_pad_ext"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ

//River
/area/patricks_rest/ground/river/riverside_north
	name = "北部河床"
	icon_state = "bluenew"

/area/patricks_rest/ground/river/riverside_central
	name = "中央河床"
	icon_state = "bluenew"

/area/patricks_rest/ground/river/riverside_south
	name = "南部河床"
	icon_state = "bluenew"

//ColonyGround
/area/patricks_rest/ground/colonyse
	name ="东南殖民地"
	icon_state = "southeast"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/patricks_rest/ground/colonys
	name ="南方殖民地"
	icon_state = "south"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/patricks_rest/ground/colonysw
	name ="西南殖民地"
	icon_state = "southwest"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/patricks_rest/ground/colonyw
	name ="西部殖民地"
	icon_state = "west"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/patricks_rest/ground/colonye
	name ="东部殖民地"
	icon_state = "east"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/patricks_rest/ground/colonynw
	name ="西北殖民地"
	icon_state = "northwest"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/patricks_rest/ground/colonyn
	name ="北方殖民地"
	icon_state = "north"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/patricks_rest/ground/colonyne
	name ="东北殖民地"
	icon_state = "northeast"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/patricks_rest/ground/colonycent
	name ="中央殖民地"
	icon_state = "central"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

//ColonyCaves
/area/patricks_rest/ground/underground/cave
	name = "所罗门洞穴"
	icon_state = "cave"

//ColonyBuildings
/area/patricks_rest/surface/building/canteen
	name = "水壶"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_LIVING

/area/patricks_rest/surface/building/barracks
	name = "兵营"
	icon_state = "crew_quarters"
	minimap_color = MINIMAP_AREA_LIVING

/area/patricks_rest/surface/building/prep
	name = "准备"
	icon_state = "green"
	minimap_color = MINIMAP_AREA_PREP

/area/patricks_rest/surface/building/command
	name = "指挥"
	icon_state = "bluenew"
	minimap_color = MINIMAP_AREA_COMMAND

/area/patricks_rest/surface/building/engineering
	name = "工程部"
	icon_state = "substation"
	minimap_color = MINIMAP_AREA_ENGI

/area/patricks_rest/surface/building/hydro
	name = "水力发电"
	icon_state = "substation"
	minimap_color = MINIMAP_AREA_ENGI

/area/patricks_rest/surface/building/offices
	name = "办公室"
	icon_state = "dark160"
	minimap_color = MINIMAP_AREA_LIVING

/area/patricks_rest/surface/building/cargo_office
	name = "货物办公室"
	icon_state = "dark160"
	minimap_color = MINIMAP_AREA_REQ

/area/patricks_rest/surface/building/medbay
	name = "医疗舱"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/patricks_rest/surface/building/armory
	name = "军械库"
	icon_state = "armory"
	minimap_color = MINIMAP_AREA_SEC

/area/patricks_rest/surface/building/administration
	name = "管理"
	icon_state = "bluenew"
	minimap_color = MINIMAP_AREA_COMMAND

/area/patricks_rest/surface/building/atc
	name = "交通管制"
	icon_state = "bluenew"
	minimap_color = MINIMAP_AREA_COMMAND

/area/patricks_rest/surface/building/residential_e
	name = "东区住宅区"
	icon_state = "crew_quarters"
	minimap_color = MINIMAP_AREA_LIVING

/area/patricks_rest/surface/building/residential_cent
	name = "住宅区中心"
	icon_state = "crew_quarters"
	minimap_color = MINIMAP_AREA_LIVING

/area/patricks_rest/surface/building/residential_w
	name = "西区住宅区"
	icon_state = "crew_quarters"
	minimap_color = MINIMAP_AREA_LIVING

/area/patricks_rest/surface/building/residential_engi
	name = "住宅区工程"
	icon_state = "crew_quarters"
	minimap_color = MINIMAP_AREA_LIVING

/area/patricks_rest/surface/building/transformer_residential
	name = "水力发电"
	icon_state = "substation"
	minimap_color = MINIMAP_AREA_ENGI

/area/patricks_rest/surface/building/transformer_barracks
	name = "水力发电"
	icon_state = "substation"
	minimap_color = MINIMAP_AREA_ENGI

/area/patricks_rest/surface/building/transformer_offices
	name = "水力发电"
	icon_state = "substation"
	minimap_color = MINIMAP_AREA_ENGI

/area/patricks_rest/surface/building/security_post_cargo
	name = "货物安保岗哨"
	icon_state = "armory"
	minimap_color = MINIMAP_AREA_SEC

/area/patricks_rest/surface/building/security_post_residential
	name = "住宅区安保哨所"
	icon_state = "armory"
	minimap_color = MINIMAP_AREA_SEC

/area/patricks_rest/surface/building/security_post_research
	name = "研究安全哨站"
	icon_state = "armory"
	minimap_color = MINIMAP_AREA_SEC

/area/patricks_rest/surface/building/storage_depot_south
	name = "南侧仓储区"
	icon_state = "dark160"
	minimap_color = MINIMAP_AREA_REQ

/area/patricks_rest/surface/building/storage_depot_research
	name = "研究存储仓库"
	icon_state = "dark160"
	minimap_color = MINIMAP_AREA_REQ

/area/patricks_rest/surface/building/ore
	name = "矿石处理"
	icon_state = "dark160"
	minimap_color = MINIMAP_AREA_REQ

/area/patricks_rest/surface/building/ore_storage
	name = "矿石储存区"
	icon_state = "dark160"
	minimap_color = MINIMAP_AREA_REQ

/area/patricks_rest/surface/building/baggage
	name = "行李提取处"
	icon_state = "dark160"
	minimap_color = MINIMAP_AREA_REQ

/area/patricks_rest/surface/building/science
	name = "科研部"
	icon_state = "purple"
	minimap_color = MINIMAP_AREA_RESEARCH
