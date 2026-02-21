// Daedalus Prison Areas

//Caves
/area/daedalusprison/caves
	name = "洞穴"
	icon_state = "cave"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambisin4.ogg')
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE

/area/daedalusprison/caves/rock
	name = "封闭区域"
	icon_state = "transparent"
	area_flags = CANNOT_NUKE

/area/daedalusprison/caves/northwest
	name = "西北洞穴"
	icon_state = "northwest2"

/area/daedalusprison/caves/northwest/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/daedalusprison/caves/north
	name = "北部洞穴"
	icon_state = "north2"

/area/daedalusprison/caves/north/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/daedalusprison/caves/nukestorage
	name = "核能储存室"
	icon_state = "nuke_storage"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	always_unpowered = FALSE

/area/daedalusprison/caves/research
	name = "生物研究设施"
	icon_state = "research"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE
	always_unpowered = FALSE

/area/daedalusprison/caves/northeast
	name = "东北洞穴"
	icon_state = "northeast2"

/area/daedalusprison/caves/northeast/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/daedalusprison/caves/southwest
	name = "西南洞穴"
	icon_state = "southwest2"

/area/daedalusprison/caves/southwest/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/daedalusprison/caves/south
	name = "南侧隧道"
	icon_state = "south2"
	ceiling = CEILING_UNDERGROUND

/area/daedalusprison/caves/east
	name = "东部隧道"
	icon_state = "east2"

//Outside Area
/area/daedalusprison/outside
	name = "殖民地地面"
	icon_state = "cliff_blocked"
	ceiling = CEILING_NONE
	outside = TRUE
	minimap_color = MINIMAP_AREA_COLONY
	always_unpowered = TRUE
	temperature = ICE_COLONY_TEMPERATURE

/area/daedalusprison/outside/southeast
	name = "东南殖民地"
	icon_state = "southeast"

/area/daedalusprison/outside/south
	name = "南方殖民地"
	icon_state = "south"

/area/daedalusprison/outside/southwest
	name = "西南殖民地"
	icon_state = "southeast"

/area/daedalusprison/outside/east
	name = "东部区域"
	icon_state = "east"

/area/daedalusprison/outside/northeast
	name = "东北地面"
	icon_state = "northeast"

/area/daedalusprison/outside/north
	name = "北部地带"
	icon_state = "north"

//Inside area parent, not used.
/area/daedalusprison/inside
	name = "内部"
	icon_state = "red"
	ceiling = CEILING_GLASS
	outside = FALSE

/area/daedalusprison/inside/engineering
	name = "工程部"
	icon_state = "engine"
	minimap_color = MINIMAP_AREA_ENGI
	ceiling = CEILING_METAL

/area/daedalusprison/inside/colonydorms
	name = "殖民地宿舍"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_LIVING
	ceiling = CEILING_METAL

/area/daedalusprison/inside/bar
	name = "殖民地酒吧"
	icon_state = "bar"
	minimap_color = MINIMAP_AREA_LIVING
	ceiling = CEILING_METAL

/area/daedalusprison/inside/cargo
	name = "殖民地货运"
	icon_state = "primarystorage"
	minimap_color = MINIMAP_AREA_REQ
	ceiling = CEILING_METAL

/area/daedalusprison/inside/colonyauxstorage
	name = "殖民地辅助储藏室"
	icon_state = "storage"
	always_unpowered = TRUE
	minimap_color = MINIMAP_AREA_REQ
	ceiling = CEILING_METAL

/area/daedalusprison/inside/bunker
	name = "着陆区掩体"
	icon_state = "shuttlered"
	minimap_color = MINIMAP_AREA_SEC
	ceiling = CEILING_METAL

/area/daedalusprison/inside/bunker/west
	name = "西部掩体"

/area/daedalusprison/inside/bunker/center
	name = "中央掩体"

/area/daedalusprison/inside/bunker/east
	name = "东部掩体"

/area/daedalusprison/inside/prisonshower
	name = "淋浴间"
	icon_state = "decontamination"
	minimap_color = MINIMAP_AREA_CELL_MED

/area/daedalusprison/inside/habitationnorth
	name = "北区居住舱"
	icon_state = "cells_med_n"
	minimap_color = MINIMAP_AREA_CELL_MED

/area/daedalusprison/inside/habitationsouth
	name = "监狱南居住区"
	icon_state = "cells_med_s"
	minimap_color = MINIMAP_AREA_CELL_MED

/area/daedalusprison/inside/studyroom
	name = "监狱学习室"
	icon_state = "library"
	minimap_color = MINIMAP_AREA_LIVING

/area/daedalusprison/inside/mining
	name = "监狱矿物处理"
	icon_state = "mining"
	ceiling = CEILING_OBSTRUCTED
	minimap_color = MINIMAP_AREA_CELL_MED

/area/daedalusprison/inside/westernbooth
	name = "西部监狱安保亭"
	icon_state = "brig"
	minimap_color = MINIMAP_AREA_SEC

/area/daedalusprison/inside/westcomputerlab
	name = "监狱西部计算机实验室"
	icon_state = "server"
	minimap_color = MINIMAP_AREA_LIVING

/area/daedalusprison/inside/substation
	name = "监狱变电站"
	icon_state = "substation"
	minimap_color = MINIMAP_AREA_ENGI

/area/daedalusprison/inside/prisongarden
	name = "监狱花园"
	icon_state = "garden"
	minimap_color = MINIMAP_AREA_LIVING

/area/daedalusprison/inside/centralhalls
	name = "监狱中央大厅"
	icon_state = "hallC1"

/area/daedalusprison/inside/laundromat
	name = "监狱洗衣房"
	icon_state = "LP"
	minimap_color = MINIMAP_AREA_LIVING

/area/daedalusprison/inside/laundromat/collapsedroof
	outside = TRUE
	ceiling = CEILING_NONE
	always_unpowered = TRUE

/area/daedalusprison/inside/mechanicshop
	name = "监狱机械车间"
	icon_state = "engine"
	minimap_color = MINIMAP_AREA_ENGI

/area/daedalusprison/inside/staffrestroom
	name = "监狱员工洗手间"
	icon_state = "toilet"
	minimap_color = MINIMAP_AREA_LIVING

/area/daedalusprison/inside/auxstorage
	name = "监狱辅助储藏室"
	icon_state = "storage"
	minimap_color = MINIMAP_AREA_REQ

/area/daedalusprison/inside/staffbreakroom
	name = "监狱员工休息室"
	icon_state = "Holodeck"
	minimap_color = MINIMAP_AREA_LIVING

/area/daedalusprison/inside/northclass
	name = "北部教室"
	icon_state = "law"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/daedalusprison/inside/southclass
	name = "监狱南侧教室"
	icon_state = "law"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/daedalusprison/inside/centralbooth
	name = "监狱中央安保亭"
	icon_state = "brig"
	minimap_color = MINIMAP_AREA_SEC

/area/daedalusprison/inside/recreation
	name = "监狱娱乐区"
	icon_state = "showroom"
	minimap_color = MINIMAP_AREA_LIVING

/area/daedalusprison/inside/janitorial
	name = "监狱清洁室"
	icon_state = "janitor"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/daedalusprison/inside/freezer
	name = "监狱冷冻室"
	icon_state = "kitchen"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/daedalusprison/inside/kitchen
	name = "监狱厨房"
	icon_state = "kitchen"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/daedalusprison/inside/cafeteria
	name = "监狱食堂"
	icon_state = "cafeteria"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/daedalusprison/inside/sportstorage
	name = "监狱运动器材库"
	icon_state = "auxstorage"
	minimap_color = MINIMAP_AREA_REQ

/area/daedalusprison/inside/northmeetingroom
	name = "监狱会议室"
	icon_state = "conference"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/daedalusprison/inside/library
	name = "监狱图书馆"
	icon_state = "library"
	minimap_color = MINIMAP_AREA_LIVING

/area/daedalusprison/inside/execution
	name = "监狱处决"
	icon_state = "sec_backroom"
	minimap_color = MINIMAP_AREA_LIVING

/area/daedalusprison/inside/basketball
	name = "监狱篮球场"
	icon_state = "anog"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/daedalusprison/inside/lobby
	name = "监狱大厅"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_LIVING

/area/daedalusprison/inside/corporateoffice
	name = "联络官办公室"
	icon_state = "blueold"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/daedalusprison/inside/southmeetingroom
	name = "企业会议室"
	icon_state = "party"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/daedalusprison/inside/garage
	name = "监狱车库"
	icon_state = "garage"
	minimap_color = MINIMAP_AREA_REQ

/area/daedalusprison/inside/easternhalls
	name = "监狱东侧走廊"
	icon_state = "hallS"

/area/daedalusprison/inside/gym
	name = "监狱健身房"
	icon_state = "bluenew"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/daedalusprison/inside/chapel
	name = "监狱礼拜堂"
	icon_state = "chapel"
	minimap_color = MINIMAP_AREA_LIVING

/area/daedalusprison/inside/security
	name = "安保"
	icon_state = "brig"
	minimap_color = MINIMAP_AREA_SEC

/area/daedalusprison/inside/security/easternbooth
	name = "东部监狱安保亭"

/area/daedalusprison/inside/security/secbreakroom
	name = "监狱安保休息室"

/area/daedalusprison/inside/security/cameras
	name = "监狱监控中心"

/area/daedalusprison/inside/security/warden
	name = "典狱长办公室"

/area/daedalusprison/inside/security/office
	name = "监狱安保办公室"

/area/daedalusprison/inside/security/interrogation
	name = "监狱审讯"
	icon_state = "interrogation"

/area/daedalusprison/inside/security/medsec
	name = "监狱医疗区安保"
	ceiling = CEILING_METAL

/area/daedalusprison/inside/medical
	name = "监狱医务室"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY
	ceiling = CEILING_METAL

/area/daedalusprison/inside/medical/chemistry
	name = "监狱化学"

/area/daedalusprison/inside/medical/treatment
	name = "监狱医务室治疗"

/area/daedalusprison/inside/barracks
	name = "监狱安全营房"
	icon_state = "armory"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/daedalusprison/inside/garden
	name = "水培花园"
	icon_state = "garden"
	minimap_color = MINIMAP_AREA_LIVING
	ceiling = CEILING_METAL

/area/daedalusprison/inside/hydroponics
	name = "水培"
	icon_state = "hydro"
	minimap_color = MINIMAP_AREA_LIVING
	ceiling = CEILING_METAL

/area/daedalusprison/inside/hydroponicstesting
	name = "水培测试"
	icon_state = "hydro_north"
	minimap_color = MINIMAP_AREA_LIVING
	ceiling = CEILING_METAL

/area/daedalusprison/inside/seccheckpoint
	name = "安全检查站"
	icon_state = "brig"
	minimap_color = MINIMAP_AREA_SEC

/area/daedalusprison/inside/secoffices
	name = "安全检查站办公室"
	icon_state = "brig"
	minimap_color = MINIMAP_AREA_SEC

/area/daedalusprison/inside/pmcdropship
	name = "坠毁的PMC空投艇"
	icon_state = "shuttle"
	minimap_color = MINIMAP_AREA_COLONY
	always_unpowered = TRUE

/area/daedalusprison/inside/landingzoneone
	name = "着陆区一号"
	icon_state = "landingzone1"
	area_flags = NO_DROPPOD
	minimap_color = MINIMAP_AREA_LZ

/area/daedalusprison/inside/telecomms
	name = "通讯"
	icon_state = "tcomsatcham"
	area_flags = NO_DROPPOD
	requires_power = FALSE
