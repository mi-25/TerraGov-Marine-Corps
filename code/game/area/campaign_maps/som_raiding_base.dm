
/area/campaign/som_raiding
	icon_state = "lv-626"
	area_flags = ALWAYS_RADIO
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg')

/area/campaign/som_raiding/ground
	name = "地面"
	icon_state = "green"
	always_unpowered = TRUE
	ambience = list('sound/ambience/jungle_amb1.ogg')

//Jungle
/area/campaign/som_raiding/ground/jungle
	name = "中央丛林"
	icon_state = "central"
	minimap_color = MINIMAP_AREA_JUNGLE

/area/campaign/som_raiding/ground/jungle/south_west
	name = "西南丛林"
	icon_state = "southwest"

/area/campaign/som_raiding/ground/jungle/south_east
	name = "东南丛林"
	icon_state = "southeast"

/area/campaign/som_raiding/ground/jungle/north_west
	name = "西北丛林"
	icon_state = "northwest"

/area/campaign/som_raiding/ground/jungle/north_east
	name = "东北丛林"
	icon_state = "northeast"

/area/campaign/som_raiding/ground/jungle/west
	name = "西部丛林"
	icon_state = "west"

/area/campaign/som_raiding/ground/jungle/south
	name = "南部丛林"
	icon_state = "south"

/area/campaign/som_raiding/ground/jungle/east
	name = "东部丛林"
	icon_state = "east"

/area/campaign/som_raiding/ground/jungle/north
	name = "北部丛林"
	icon_state = "north"

//river
/area/campaign/som_raiding/ground/river
	name = "\improper 南河"
	icon_state = "blueold"

/area/campaign/som_raiding/ground/river/north
	name = "\improper 北河"

/area/campaign/som_raiding/ground/river/west
	name = "\improper 西河"

/area/campaign/som_raiding/ground/river/east
	name = "\improper 东部河流"

/area/campaign/som_raiding/ground/river/lake
	name = "\improper 南湖"

//outpost
/area/campaign/som_raiding/cave
	name = "\improper 山脉"
	icon_state = "cave"
	ceiling = CEILING_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES

/area/campaign/som_raiding/cave/tunnel
	name = "\improper 旧隧道 - 南侧"
	icon_state = "explored"

/area/campaign/som_raiding/cave/tunnel_west
	name = "\improper 旧隧道 - 西侧"
	icon_state = "explored"

//outpost
/area/campaign/som_raiding/outpost
	name = "\improper 前哨站"
	icon_state = "green"
	ceiling = CEILING_UNDERGROUND_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_COLONY

/area/campaign/som_raiding/outpost/firing_range
	name = "\improper 射击靶场"

/area/campaign/som_raiding/outpost/construction
	name = "\improper 施工场地"

/area/campaign/som_raiding/outpost/central_corridor
	name = "\improper 中央走廊"

/area/campaign/som_raiding/outpost/maintenance
	name = "\improper 西南维护区"
	minimap_color = MINIMAP_AREA_CAVES
	icon_state = "maint_security_starboard"

/area/campaign/som_raiding/outpost/maintenance/engie
	name = "\improper 工程维护"
	icon_state = "maint_engine"

/area/campaign/som_raiding/outpost/maintenance/operation
	name = "\improper 作战维护"
	icon_state = "apmaint"

/area/campaign/som_raiding/outpost/maintenance/cic
	name = "\improper 舰桥维护"
	icon_state = "fpmaint"

/area/campaign/som_raiding/outpost/maintenance/req
	name = "\improper 补给维护"
	icon_state = "maint_cargo"

/area/campaign/som_raiding/outpost/maintenance/med
	name = "\improper 医疗舱维护区"
	icon_state = "maint_medbay"

/area/campaign/som_raiding/outpost/medbay
	name = "\improper 医疗舱"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/campaign/som_raiding/outpost/security
	name = "\improper 军械库"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/area/campaign/som_raiding/outpost/security/south_post
	name = "\improper 南侧安全检查点"

/area/campaign/som_raiding/outpost/security/southeast_post
	name = "\improper 东南安保检查点"

/area/campaign/som_raiding/outpost/security/west_post
	name = "\improper 西侧安全检查点"

/area/campaign/som_raiding/outpost/security/north_post
	name = "\improper 北部安全检查站"

/area/campaign/som_raiding/outpost/security/cargo_post
	name = "\improper 卡罗安全检查站"

/area/campaign/som_raiding/outpost/command
	name = "\improper 作战"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_COMMAND

/area/campaign/som_raiding/outpost/command/captain
	name = "\improper 副官办公室"
	icon_state = "captain"

/area/campaign/som_raiding/outpost/command/telecom
	name = "\improper 通讯系统"
	icon_state = "tcomms"

/area/campaign/som_raiding/outpost/command/cic
	name = "\improper 作战信息中心"

/area/campaign/som_raiding/outpost/command/north
	name = "\improper 北侧办公室"

/area/campaign/som_raiding/outpost/command/living
	name = "\improper 军官宿舍"

/area/campaign/som_raiding/outpost/engineering
	name = "\improper 工程"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI

/area/campaign/som_raiding/outpost/living
	name = "\improper 营房"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_LIVING

/area/campaign/som_raiding/outpost/living/briefing
	name = "\improper 简报室"
	icon_state = "conference"

/area/campaign/som_raiding/outpost/living/bathroom
	name = "\improper 卫生间"
	icon_state = "restrooms"

/area/campaign/som_raiding/outpost/living/canteen
	name = "\improper 水壶"
	icon_state = "cafeteria"

/area/campaign/som_raiding/outpost/living/kitchen
	name = "\improper 厨房"
	icon_state = "kitchen"

/area/campaign/som_raiding/outpost/req
	name = "\improper 主货舱"
	icon_state = "quart"
	minimap_color = MINIMAP_AREA_REQ

/area/campaign/som_raiding/outpost/req/north
	name = "\improper 北部货舱"

/area/campaign/som_raiding/outpost/req/aux
	name = "\improper 北部辅助储藏室"
	icon_state = "quart"
	minimap_color = MINIMAP_AREA_REQ

/area/campaign/som_raiding/outpost/req/secure
	name = "\improper 安全储物间"
	icon_state = "quart"
	minimap_color = MINIMAP_AREA_REQ

/area/campaign/som_raiding/outpost/req/qm
	name = "\improper 军需官办公室"
	icon_state = "quartoffice"

/area/campaign/som_raiding/outpost/tunnel
	name = "\improper 南侧隧道"
	icon_state = "explored"
	ceiling = CEILING_UNDERGROUND

/area/campaign/som_raiding/outpost/tunnel/west
	name = "\improper 西侧隧道"
