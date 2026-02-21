//ORIONOUTPOST AREAS//
/area/orion_outpost
	name = "猎户座军事前哨站"
	icon_state = "dark"

/area/orion_outpost/ground
	name = "地面"
	icon_state = "green"
	always_unpowered = TRUE

/area/orion_outpost/ground/rock
	name = "封闭区域"
	icon_state = "transparent"
	area_flags = CANNOT_NUKE

/area/orion_outpost/surface
	name = "地表"
	icon_state = "red"

/area/orion_outpost/surface/building
	name = "猎户座前哨站建筑"
	icon_state = "clear"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_COLONY

/area/orion_outpost/ground/underground
	name = "猎户座前哨站地下"
	icon_state = "cave"
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES

//LandingZone
/area/orion_outpost/surface/landing_pad
	name = "1号着陆坪"
	icon_state = "landing_pad"
	area_flags = NO_DROPPOD
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ
	always_unpowered = TRUE

/area/orion_outpost/surface/landing_pad_external
	name = "着陆区1"
	icon_state = "landing_pad_ext"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ

/area/orion_outpost/surface/landing_pad_2
	name = "2号着陆坪"
	icon_state = "landing_pad"
	area_flags = NO_DROPPOD
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ
	always_unpowered = TRUE

/area/orion_outpost/surface/landing_pad2_external
	name = "着陆区2"
	icon_state = "landing_pad_ext"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ

/area/orion_outpost/surface/train_yard
	name = "列车场"
	icon_state = "landing_pad_ext"
	minimap_color = MINIMAP_AREA_LZ

//River
/area/orion_outpost/ground/river/riverside_north
	name = "北部河床"
	icon_state = "bluenew"

/area/orion_outpost/ground/river/riverside_central
	name = "中央河床"
	icon_state = "bluenew"

/area/orion_outpost/ground/river/riverside_south
	name = "南部河床"
	icon_state = "bluenew"

//OutpostGround
/area/orion_outpost/ground/outpostse
	name ="东南前哨站"
	icon_state = "southeast"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/orion_outpost/ground/outposts
	name ="南方前哨站"
	icon_state = "south"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/orion_outpost/ground/outpostsw
	name ="西南前哨站"
	icon_state = "southwest"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/orion_outpost/ground/outpostw
	name ="西部前哨站"
	icon_state = "west"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/orion_outpost/ground/outposte
	name ="东部前哨站"
	icon_state = "east"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/orion_outpost/ground/outpostnw
	name ="西北前哨站"
	icon_state = "northwest"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/orion_outpost/ground/outpostn
	name ="北部前哨站"
	icon_state = "north"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/orion_outpost/ground/outpostne
	name ="东北前哨站"
	icon_state = "northeast"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/orion_outpost/ground/outpostcent
	name ="中央前哨站"
	icon_state = "central"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

//OutpostCaves
/area/orion_outpost/ground/underground/cave
	name = "地下洞穴"
	icon_state = "cave"

/area/orion_outpost/ground/underground/caveN
	name = "北部洞穴"
	icon_state = "cave"

/area/orion_outpost/ground/underground/caveN/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/orion_outpost/ground/underground/caveNW
	name = "西北洞穴"
	icon_state = "cave"

/area/orion_outpost/ground/underground/caveE
	name = "东部洞穴"
	icon_state = "cave"

/area/orion_outpost/ground/underground/caveE/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/orion_outpost/ground/underground/caveS
	name = "南部洞穴"
	icon_state = "cave"

/area/orion_outpost/ground/underground/caveS/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/orion_outpost/ground/underground/caveW
	name = "西部洞穴"
	icon_state = "cave"

//OutpostBuildings
/area/orion_outpost/surface/building/canteen
	name = "水壶"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_LIVING

/area/orion_outpost/surface/building/barracks
	name = "兵营"
	icon_state = "crew_quarters"
	minimap_color = MINIMAP_AREA_LIVING

/area/orion_outpost/surface/building/prep
	name = "准备"
	icon_state = "green"
	minimap_color = MINIMAP_AREA_PREP

/area/orion_outpost/surface/building/command
	name = "指挥"
	icon_state = "bluenew"
	minimap_color = MINIMAP_AREA_COMMAND

/area/orion_outpost/surface/building/engineering
	name = "工程部"
	icon_state = "substation"
	minimap_color = MINIMAP_AREA_ENGI

/area/orion_outpost/surface/building/cargo
	name = "货物储存区"
	icon_state = "dark160"
	minimap_color = MINIMAP_AREA_REQ

/area/orion_outpost/surface/building/nebuilding
	name = "东北建筑"
	icon_state = "dark160"

/area/orion_outpost/surface/building/medbay
	name = "医疗舱"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/orion_outpost/surface/building/dorms
	name = "宿舍"
	icon_state = "crew_quarters"
	minimap_color = MINIMAP_AREA_LIVING

/area/orion_outpost/surface/building/bunker
	name = "掩体"
	always_unpowered = TRUE
	icon_state = "dark128"

/area/orion_outpost/surface/building/crashedufo
	name = "坠毁的UFO"
	icon_state = "blueold"
	always_unpowered = TRUE

/area/orion_outpost/surface/building/tadpolepad
	name = "蝌蚪号着陆坪"
	icon_state = "purple"

/area/orion_outpost/surface/building/armory
	name = "军械库"
	icon_state = "armory"
	minimap_color = MINIMAP_AREA_SEC

/area/orion_outpost/surface/building/brig
	name = "禁闭室"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_SEC

/area/orion_outpost/surface/building/monitor
	name = "监控站"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_SEC

/area/orion_outpost/surface/building/administration
	name = "管理"
	icon_state = "bluenew"
	minimap_color = MINIMAP_AREA_COMMAND

/area/orion_outpost/surface/building/atc
	name = "交通管制"
	icon_state = "bluenew"
	minimap_color = MINIMAP_AREA_COMMAND

/area/orion_outpost/surface/building/ammodepot
	name = "弹药库"
	icon_state = "dark"
	minimap_color = MINIMAP_AREA_SEC

/area/orion_outpost/surface/building/vehicledepot
	name = "载具仓库"
	icon_state = "dark160"
	minimap_color = MINIMAP_AREA_ENGI

/area/orion_outpost/surface/building/breakroom
	name = "休息室建筑"
	icon_state = "dark160"
	minimap_color = MINIMAP_AREA_LIVING
