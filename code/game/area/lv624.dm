//LV624 AREAS--------------------------------------//
/area/lv624
	icon_state = "lv-626"

/area/lv624/ground
	name = "地面"
	icon_state = "green"
	always_unpowered = TRUE //Will this mess things up? God only knows

//Jungle
/area/lv624/ground/jungle1
	name = "东南丛林"
	icon_state = "southeast"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/lv624/ground/jungle2
	name = "南部丛林"
	icon_state = "south"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/lv624/ground/jungle3
	name = "西南丛林"
	icon_state = "southwest"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/lv624/ground/jungle4
	name = "中央西部丛林"
	icon_state = "west"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/lv624/ground/jungle5
	name = "东部丛林"
	icon_state = "east"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/lv624/ground/jungle6
	name = "西北丛林"
	icon_state = "northwest"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/lv624/ground/jungle7
	name = "北部丛林"
	icon_state = "north"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/lv624/ground/jungle8
	name = "东北丛林"
	icon_state = "northeast"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/lv624/ground/jungle9
	name = "中央丛林"
	icon_state = "central"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/lv624/ground/jungle10
	name = "西部丛林"
	icon_state = "west2"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

//Sand
/area/lv624/ground/sand1
	name = "\improper 西部荒原"
	icon_state = "west"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambisin4.ogg')

/area/lv624/ground/sand2
	name = "\improper 中央荒地"
	icon_state = "red"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambisin4.ogg')

/area/lv624/ground/sand2/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/lv624/ground/sand3
	name = "\improper 东部荒原"
	icon_state = "east"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambisin4.ogg')

/area/lv624/ground/sand3/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/lv624/ground/sand4
	name = "\improper 西北荒原"
	icon_state = "northwest"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambisin4.ogg')

/area/lv624/ground/sand5
	name = "\improper 中北荒原"
	icon_state = "blue-red"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambisin4.ogg')

/area/lv624/ground/sand6
	name = "\improper 东北荒原"
	icon_state = "northeast"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambisin4.ogg')

/area/lv624/ground/sand6/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/lv624/ground/sand7
	name = "\improper 西南荒原"
	icon_state = "southwest"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambisin4.ogg')

/area/lv624/ground/sand7/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/lv624/ground/sand8
	name = "\improper 南部中央荒地"
	icon_state = "away1"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambisin4.ogg')

/area/lv624/ground/sand9
	name = "\improper 东南荒原"
	icon_state = "southeast"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambisin4.ogg')

/area/lv624/ground/tfort
	name = "\improper 桌子堡垒"
	icon_state = "purple"
	outside = FALSE

/area/lv624/ground/river1
	name = "\improper 西河"
	icon_state = "blueold"
	ambience = list('sound/ambience/jungle_amb1.ogg')

/area/lv624/ground/river2
	name = "\improper 中央河流"
	icon_state = "purple"
	ambience = list('sound/ambience/jungle_amb1.ogg')

/area/lv624/ground/river3
	name = "\improper 东部河流"
	icon_state = "bluenew"
	ambience = list('sound/ambience/jungle_amb1.ogg')

/area/lv624/ground/filtration
	name = "\improper 过滤厂"
	icon_state = "green"
	outside = FALSE
	minimap_color = MINIMAP_AREA_ENGI

/area/lv624/ground/compound
	name = "\improper 纳米传讯化合物"
	icon_state = "green"

/area/lv624/ground/compound/ne
	name = "\improper 纳米传讯东北基地"
	icon_state = "northeast"

/area/lv624/ground/compound/n
	name = "\improper 纳米传讯北部基地"
	icon_state = "north"

/area/lv624/ground/compound/c
	name = "\improper 纳米传讯中央设施"
	icon_state = "purple"

/area/lv624/ground/compound/se
	name = "\improper 东南纳米传讯设施"
	icon_state = "southeast"

/area/lv624/ground/compound/sw
	name = "\improper 西南纳米传讯设施"
	icon_state = "southwest"
//	ambience = list('sound/ambience/jungle_amb1.ogg')

/area/lv624/ground/shelter
	name = "\improper 雨棚"
	icon_state = "blue"
	outside = FALSE

/area/lv624/ground/ruin
	name = "\improper 未知结构"
	icon_state = "red"
	outside = FALSE

/area/lv624/ground/southcargo
	name = "\improper 南侧货物储存区"
	icon_state = "storage"
	outside = FALSE

/area/lv624/ground/central2
	name = "北部中央洞穴"
	icon_state = "away3"

/area/lv624/ground/caves //Does not actually exist
	name = "洞穴"
	icon_state = "cave"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambisin4.ogg')
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES

//Caves
/area/lv624/ground/caves/rock //catchall for closed turfs we want immune to rain/easily visible to map editing tools
	name = "封闭区域"
	icon_state = "transparent"
	minimap_color = null
	area_flags = CANNOT_NUKE

/area/lv624/ground/caves/west1
	name = "西部洞穴"
	icon_state = "away1"

/area/lv624/ground/caves/west1/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/lv624/ground/caves/east1
	name = "东部洞穴"
	icon_state = "away"

/area/lv624/ground/caves/east1/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/lv624/ground/caves/central1
	name = "中央洞穴"
	icon_state = "away4" //meh

/area/lv624/ground/caves/central1/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/lv624/ground/caves/central2
	name = "中央洞穴"
	icon_state = "away3"

/area/lv624/ground/caves/west2
	name = "西北洞穴"
	icon_state = "cave"

/area/lv624/ground/caves/east2
	name = "东北洞穴"
	icon_state = "cave"

/area/lv624/ground/caves/central3
	name = "南中洞穴"
	icon_state = "away2"

/area/lv624/ground/caves/central3/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/lv624/ground/caves/central5
	name = "西南中央洞穴"
	icon_state = "purple"

/area/lv624/ground/caves/central5/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/lv624/ground/caves/central4
	name = "西南洞穴"
	icon_state = "yellow"

/area/lv624/ground/caves/central4/garbledradio
	ceiling = CEILING_UNDERGROUND

//Lazarus landing
/area/lv624/lazarus
	name = "\improper 拉撒路"
	icon_state = "green"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_COLONY

/area/lv624/lazarus/atmos
	name = "\improper 大气系统"
	icon_state = "atmos"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_ENGI

/area/lv624/lazarus/atmos/outside
	name = "\improper 大气处理区"
	icon_state = "purple"
	ceiling = CEILING_NONE

/area/lv624/lazarus/hallway_one
	name = "\improper 走廊"
	icon_state = "green"

/area/lv624/lazarus/hallway_two
	name = "\improper 走廊"
	icon_state = "purple"

/area/lv624/lazarus/medbay
	name = "\improper 医疗舱"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/lv624/lazarus/armory
	name = "\improper 军械库"
	icon_state = "armory"
	minimap_color = MINIMAP_AREA_SEC

/area/lv624/lazarus/security
	name = "\improper 安保"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/area/lv624/lazarus/captain
	name = "\improper 指挥官宿舍"
	icon_state = "captain"
	minimap_color = MINIMAP_AREA_COMMAND

/area/lv624/lazarus/hop
	name = "\improper 人事主管办公室"
	icon_state = "head_quarters"
	minimap_color = MINIMAP_AREA_COMMAND

/area/lv624/lazarus/kitchen
	name = "\improper 厨房"
	icon_state = "kitchen"
	minimap_color = MINIMAP_AREA_LIVING

/area/lv624/lazarus/canteen
	name = "\improper 水壶"
	icon_state = "cafeteria"
	minimap_color = MINIMAP_AREA_LIVING

/area/lv624/lazarus/main_hall
	name = "\improper 主走廊"
	icon_state = "hallC1"

/area/lv624/lazarus/main_hall
	name = "\improper 主走廊"
	icon_state = "hallC1"

/area/lv624/lazarus/toilet
	name = "\improper 宿舍厕所"
	icon_state = "toilet"
	minimap_color = MINIMAP_AREA_LIVING

/area/lv624/lazarus/chapel
	name = "\improper 礼拜堂"
	icon_state = "chapel"
	minimap_color = MINIMAP_AREA_LIVING
	ambience = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg')

/area/lv624/lazarus/toilet
	name = "\improper 宿舍卫生间"
	icon_state = "toilet"
	minimap_color = MINIMAP_AREA_LIVING

/area/lv624/lazarus/sleep_male
	name = "\improper 男性宿舍"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_LIVING

/area/lv624/lazarus/sleep_female
	name = "\improper 女性宿舍"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_LIVING

/area/lv624/lazarus/quart
	name = "\improper 军需官"
	icon_state = "quart"
	minimap_color = MINIMAP_AREA_REQ

/area/lv624/lazarus/quartstorage
	name = "\improper 货舱"
	icon_state = "quartstorage"
	minimap_color = MINIMAP_AREA_REQ

/area/lv624/lazarus/quartstorage/dome

/area/lv624/lazarus/quartstorage/two

/area/lv624/lazarus/quartstorage/outdoors
	name = "\improper 货舱区域"
	icon_state = "purple"
	ceiling = CEILING_NONE
	minimap_color = MINIMAP_AREA_COLONY
	always_unpowered = TRUE

/area/lv624/lazarus/engineering
	name = "\improper 工程"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv624/lazarus/comms
	name = "\improper 通讯中继器"
	icon_state = "tcomsatcham"

/area/lv624/lazarus/secure_storage
	name = "\improper 安全储物区"
	icon_state = "storage"
	minimap_color = MINIMAP_AREA_SEC

/area/lv624/lazarus/internal_affairs
	name = "\improper 内部事务"
	icon_state = "law"

/area/lv624/lazarus/corporate_affairs
	name = "\improper 企业事务"
	icon_state = "law"

/area/lv624/lazarus/robotics
	name = "\improper 机器人学"
	icon_state = "ass_line"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv624/lazarus/research
	name = "\improper 研究实验室"
	icon_state = "toxlab"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/lv624/lazarus/research/caves
	ceiling = CEILING_DEEP_UNDERGROUND

/area/lv624/lazarus/fitness
	name = "\improper 健身房"
	icon_state = "fitness"
	minimap_color = MINIMAP_AREA_LIVING

/area/lv624/lazarus/hydroponics
	name = "\improper 水培室"
	icon_state = "hydro"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_LIVING

/area/lv624/lazarus/hydroponics/aux
	name = "\improper 辅助水培区"

/area/lv624/lazarus/bar
	name = "\improper 酒吧"
	icon_state = "kitchen"
	ceiling = CEILING_GLASS

/area/lv624/lazarus/overgrown
	name = "\improper 过度生长的穹顶"
	icon_state = "construction"
	ceiling = CEILING_NONE
	outside = TRUE

/area/lv624/lazarus/sandtemple
	name = "\improper 神秘神庙"
	icon_state = "sandtemple"
	ceiling = CEILING_DEEP_UNDERGROUND
	always_unpowered = TRUE

/area/lv624/lazarus/sandtemple/garbledradio
	ceiling = CEILING_UNDERGROUND
	always_unpowered = FALSE

/area/lv624/lazarus/sandtemple/sideroom //needed to allow nuke generator within temple to function
	name = "\improper 神秘神庙"
	icon_state = "purple"
	requires_power = FALSE

/area/lv624/lazarus/tablefort
	name = "\improper 桌子堡垒"
	icon_state = "tablefort"
	always_unpowered = TRUE
	outside = FALSE

/area/lv624/lazarus/crashed_ship
	name = "\improper 坠毁的飞船"
	icon_state = "shuttlered"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	always_unpowered = TRUE
	minimap_color = MINIMAP_AREA_SHIP

/area/lv624/lazarus/crashed_ship/desparity
	always_unpowered = FALSE

/area/lv624/lazarus/relay
	name = "\improper 秘密中继室"
	icon_state = "tcomsatcham"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv624/lazarus/console
	name = "\improper 穿梭机控制台"
	icon_state = "tcomsatcham"
	area_flags = NO_DROPPOD
	requires_power = FALSE

/area/lv624/lazarus/spaceport
	name = "\improper 东部太空港"
	icon_state = "landingzone1"
	area_flags = NO_DROPPOD
	minimap_color = MINIMAP_AREA_LZ

/area/lv624/lazarus/spaceport2
	name = "\improper 西部太空港"
	icon_state = "landingzone2"
	area_flags = NO_DROPPOD
	minimap_color = MINIMAP_AREA_LZ
