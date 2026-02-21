// Riptide Areas

//Caves
/area/riptide/caves
	name = "洞穴"
	icon_state = "cave"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambisin4.ogg')
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE

/area/riptide/caves/rock
	name = "封闭区域"
	icon_state = "transparent"
	area_flags = CANNOT_NUKE

//DO NOT GO HERE!!!
/area/riptide/caves/sea
	name = "封闭水域区域"
	icon_state = "blueold"
	area_flags = NO_DROPPOD

/area/riptide/caves/checkpoint
	name = "PMC检查站"
	icon_state = "Warden"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE
	always_unpowered = FALSE

/area/riptide/caves/central
	name = "中央洞穴"
	icon_state = "central"

/area/riptide/caves/central/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/riptide/caves/north
	name = "北部洞穴"
	icon_state = "north2"

/area/riptide/caves/north/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/riptide/caves/north2
	name = "北部露头"
	icon_state = "north2"

/area/riptide/caves/north2/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/riptide/caves/piratecove
	name = "地下船"
	icon_state = "hangar"
	always_unpowered = FALSE

/area/riptide/caves/pmc
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE
	always_unpowered = FALSE

/area/riptide/caves/pmc/lobby
	name = "地下设施门厅"
	icon_state = "sec_backroom"

/area/riptide/caves/pmc/prison
	name = "地下拘留室"
	icon_state = "sec_backroom"

/area/riptide/caves/pmc/rnd
	name = "地下机器人学"
	icon_state = "security_sub"

/area/riptide/caves/pmc/toxins
	name = "地下实验室"
	icon_state = "security"

/area/riptide/caves/pmc/warehouse
	name = "地下仓库"
	icon_state = "armory"

/area/riptide/caves/tram
	name = "废弃电车线路"
	icon_state = "substation"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	always_unpowered = FALSE

/area/riptide/caves/south
	name = "南部矿井"
	icon_state = "south2"

/area/riptide/caves/south/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/riptide/caves/syndicatemining
	name = "废弃采石场"
	icon_state = "security_sub"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	always_unpowered = FALSE

//Outside Area
/area/riptide/outside
	name = "殖民地地面"
	icon_state = "cliff_blocked"
	ceiling = CEILING_NONE
	outside = TRUE
	minimap_color = MINIMAP_AREA_COLONY
	always_unpowered = TRUE

/area/riptide/outside/northislands
	name = "北部群岛"
	icon_state = "hallF"

/area/riptide/outside/northbeach
	name = "北滩"
	icon_state = "north"

/area/riptide/outside/westbeach
	name = "西滩"
	icon_state = "west"

/area/riptide/outside/westislands
	name = "西部群岛"
	icon_state = "hallA"

/area/riptide/outside/southbeach
	name = "南滩"
	icon_state = "south"

/area/riptide/outside/southislands
	name = "南方群岛"
	icon_state = "hallS"

/area/riptide/outside/river
	name = "河"
	icon_state = "valley"

/area/riptide/outside/eastbeach
	name = "东滩"
	icon_state = "east"

/area/riptide/outside/beachlzone
	name = "西北海滩"
	icon_state = "firingrange"

/area/riptide/outside/southjungle
	name = "南丛林"
	icon_state = "away2"

/area/riptide/outside/northjungle
	name = "北部丛林"
	icon_state = "anospectro"

/area/riptide/outside/westjungle
	name = "西部丛林"
	icon_state = "maint_research_shuttle"

/area/riptide/outside/volcano
	name = "火山喷发"
	icon_state = "prototype_engine"

//Inside area parent, not used.
/area/riptide/inside
	name = "内部"
	icon_state = "red"
	ceiling = CEILING_METAL
	outside = FALSE

/area/riptide/inside/engineering
	name = "工程部"
	icon_state = "engine"
	minimap_color = MINIMAP_AREA_ENGI

/area/riptide/inside/engineering/bridge
	name = "河坝"
	icon_state = "genetics"
	ceiling = CEILING_NONE
	outside = TRUE

/area/riptide/inside/engineering/cave
	name = "地下工程"
	icon_state = "engine"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/riptide/inside/beachbar
	name = "海滩酒吧"
	icon_state = "bar"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/beachshop
	name = "礼品店"
	icon_state = "thunder"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/beachtoilet
	name = "公共卫生间"
	icon_state = "landing_pad_taxiway"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/beachden
	name = "赌场"
	icon_state = "bar"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/beachdressing
	name = "海滩更衣室"
	icon_state = "locker"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/beachmotel
	name = "海滩汽车旅馆"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/luxurybar
	name = "豪华河畔酒吧"
	icon_state = "bar"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/beachsushi
	name = "寿司店"
	icon_state = "kitchen"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/medical
	name = "医疗前厅"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/riptide/inside/medical/surgery
	name = "手术"
	icon_state = "patients"

/area/riptide/inside/medical/offices
	name = "首席医疗官办公室"
	icon_state = "CMO"

/area/riptide/inside/chapel
	name = "礼拜堂"
	icon_state = "quart"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/warehouse
	name = "工业仓库"
	icon_state = "auxstorage"
	minimap_color = MINIMAP_AREA_REQ

/area/riptide/inside/hydroponics
	name = "水培"
	icon_state = "garden"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/tikihut
	name = "提基小屋"
	icon_state = "observatory"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/arena
	name = "枪战竞技场"
	icon_state = "courtroom"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/observatory
	name = "竞技场观察"
	icon_state = "eva"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/recroom
	name = "娱乐室"
	icon_state = "HH_Crypt"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/luxurybaroverlook
	name = "舰桥俯瞰区"
	icon_state = "tcomsatentrance"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/canteen
	name = "公共食堂"
	icon_state = "apmaint"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/canteen/two
	name = "北部食堂"

/area/riptide/inside/abandonedsec
	name = "废弃安保岛"
	icon_state = "sec_prison"
	minimap_color = MINIMAP_AREA_CELL_MED

/area/riptide/inside/cargoboat
	name = "货船"
	icon_state = "amaint"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/lighttower
	name = "照明塔"
	icon_state = "observatory"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/lighttowermaint
	name = "灯塔维护"
	icon_state = "maint_engine"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/boatdock
	name = "船坞"
	icon_state = "eva"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/abandonedcottage
	name = "废弃小屋"
	icon_state = "purple"
	minimap_color = MINIMAP_AREA_LIVING
	always_unpowered = TRUE

/area/riptide/inside/breachedfob
	name = "基地已摧毁"
	icon_state = "janitor"
	minimap_color = MINIMAP_AREA_LIVING
	always_unpowered = TRUE

/area/riptide/inside/southtower
	name = "南部观测站"
	icon_state = "janitor"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/guardcheck
	name = "南方卫队"
	icon_state = "janitor"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/riverblocker
	name = "南部河流交叉口"
	icon_state = "janitor"
	minimap_color = MINIMAP_AREA_LIVING

/area/riptide/inside/syndicatecheckpoint
	name = "不祥基地检查点"
	icon_state = "checkpoint1"
	minimap_color = MINIMAP_AREA_SEC

/area/riptide/inside/syndicatefoyer
	name = "不祥基地门厅"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/area/riptide/inside/syndicateport
	name = "不祥基地港"
	icon_state = "checkpoint1"
	minimap_color = MINIMAP_AREA_SEC

/area/riptide/inside/syndicategen
	name = "不祥的基础引擎"
	icon_state = "security_sub"
	minimap_color = MINIMAP_AREA_SEC

/area/riptide/inside/syndicatehead
	name = "不祥的基地指挥室"
	icon_state = "sec_hos"
	minimap_color = MINIMAP_AREA_SEC

/area/riptide/inside/syndicatestarboard
	name = "不祥基地右舷"
	icon_state = "sec_prison"
	minimap_color = MINIMAP_AREA_SEC

/area/riptide/inside/telecomms
	name = "通讯"
	icon_state = "tcomsatcham"
	area_flags = NO_DROPPOD
	requires_power = FALSE

/area/riptide/inside/landingzoneone
	name = "着陆区一号"
	icon_state = "landingzone1"
	area_flags = NO_DROPPOD
	minimap_color = MINIMAP_AREA_LZ
