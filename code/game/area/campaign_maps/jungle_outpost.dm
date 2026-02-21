//Jungle outpost areas
/area/campaign/jungle_outpost
	icon_state = "lv-626"

/area/campaign/jungle_outpost/ground
	name = "地面"
	icon_state = "green"
	always_unpowered = TRUE
	ambience = list('sound/ambience/jungle_amb1.ogg')

//Jungle
/area/campaign/jungle_outpost/ground/jungle
	name = "中央丛林"
	icon_state = "central"
	minimap_color = MINIMAP_AREA_JUNGLE

/area/campaign/jungle_outpost/ground/jungle/south_west
	name = "西南丛林"
	icon_state = "southwest"

/area/campaign/jungle_outpost/ground/jungle/south_east
	name = "东南丛林"
	icon_state = "southeast"

/area/campaign/jungle_outpost/ground/jungle/north_west
	name = "西北丛林"
	icon_state = "northwest"

/area/campaign/jungle_outpost/ground/jungle/north_east
	name = "东北丛林"
	icon_state = "northeast"

/area/campaign/jungle_outpost/ground/jungle/west
	name = "西部丛林"
	icon_state = "west"

/area/campaign/jungle_outpost/ground/jungle/south
	name = "南部丛林"
	icon_state = "south"

/area/campaign/jungle_outpost/ground/jungle/east
	name = "东部丛林"
	icon_state = "east"

/area/campaign/jungle_outpost/ground/jungle/north
	name = "北部丛林"
	icon_state = "north"

//river
/area/campaign/jungle_outpost/ground/river
	name = "\improper 南河"
	icon_state = "blueold"

/area/campaign/jungle_outpost/ground/river/north
	name = "\improper 北河"

/area/campaign/jungle_outpost/ground/river/west
	name = "\improper 西河"

/area/campaign/jungle_outpost/ground/river/east
	name = "\improper 东部河流"

/area/campaign/jungle_outpost/ground/river/lake
	name = "\improper 南湖"

//outpost
/area/campaign/jungle_outpost/outpost
	name = "\improper 前哨站"
	icon_state = "green"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_COLONY

/area/campaign/jungle_outpost/outpost/bar
	name = "\improper 酒吧"
	icon_state = "bar"

/area/campaign/jungle_outpost/outpost/medbay
	name = "\improper 医疗舱"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/campaign/jungle_outpost/outpost/medbay/lobby
	name = "\improper 医疗舱大厅"
	icon_state = "medbay2"

/area/campaign/jungle_outpost/outpost/medbay/chemistry
	name = "\improper 化学"
	icon_state = "chem"

/area/campaign/jungle_outpost/outpost/security
	name = "\improper 安保站"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/area/campaign/jungle_outpost/outpost/security/vault
	name = "\improper 金库"
	icon_state = "security"

/area/campaign/jungle_outpost/outpost/command
	name = "\improper 作战"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_COMMAND

/area/campaign/jungle_outpost/outpost/command/captain
	name = "\improper 副官办公室"
	icon_state = "captain"

/area/campaign/jungle_outpost/outpost/engineering
	name = "\improper 工程"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI

/area/campaign/jungle_outpost/outpost/living
	name = "\improper 生活区"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_LIVING

/area/campaign/jungle_outpost/outpost/living/bathroom
	name = "\improper 卫生间"
	icon_state = "restrooms"

/area/campaign/jungle_outpost/outpost/living/canteen
	name = "\improper 水壶"
	icon_state = "cafeteria"

/area/campaign/jungle_outpost/outpost/living/kitchen
	name = "\improper 厨房"
	icon_state = "kitchen"

/area/campaign/jungle_outpost/outpost/living/hydro
	name = "\improper 水培穹顶"
	icon_state = "hydro"

/area/campaign/jungle_outpost/outpost/req
	name = "\improper 货舱"
	icon_state = "quart"
	minimap_color = MINIMAP_AREA_REQ

/area/campaign/jungle_outpost/outpost/req/qm
	name = "\improper 军需官办公室"
	icon_state = "quartoffice"

/area/campaign/jungle_outpost/outpost/req/depot
	name = "\improper 货舱区"
	icon_state = "quartstorage"

/area/campaign/jungle_outpost/outpost/req/containers
	name = "\improper 容器存储"
	icon_state = "container_yard"
	outside = TRUE
	ceiling = CEILING_NONE
	always_unpowered = TRUE

/area/campaign/jungle_outpost/outpost/science
	name = "\improper 研究实验室"
	icon_state = "toxlab"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/campaign/jungle_outpost/outpost/science/south
	name = "\improper 南部研究实验室"
	icon_state = "toxlab"

/area/campaign/jungle_outpost/outpost/science/office
	name = "\improper 科研主管办公室"
	icon_state = "toxlab"

/area/campaign/jungle_outpost/outpost/landing
	name = "\improper 着陆平台"
	icon_state = "landing_pad_ext"
	minimap_color = MINIMAP_AREA_LZ
	outside = TRUE
	ceiling = CEILING_NONE
	always_unpowered = TRUE

/area/campaign/jungle_outpost/outpost/landing/storage
	name = "\improper 着陆平台储物区"
	icon_state = "landing_pad"

/area/campaign/jungle_outpost/outpost/outer/southwest
	name = "\improper 西南穹顶"
	icon_state = "green"

/area/campaign/jungle_outpost/outpost/outer/west
	name = "\improper 西部穹顶"
	icon_state = "green"

/area/campaign/jungle_outpost/outpost/outer/hermit
	name = "\improper 隐士之家"
	icon_state = "green"
	always_unpowered = TRUE
