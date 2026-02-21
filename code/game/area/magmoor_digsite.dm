// Magmoor Digsite IV - Hathkar

//Base Area

/area/magmoor
	name = "岩浆"
	icon_state = "lava"
	outside = FALSE


/area/magmoor/landing
	name = "一号着陆区"
	ceiling = CEILING_NONE
	minimap_color = MINIMAP_AREA_LZ

/area/magmoor/landing/two
	name = "着陆区二"
	minimap_color = MINIMAP_AREA_LZ


// Volcano
/area/magmoor/volcano
	name = "马格莫尔中央裂隙"
	ceiling = CEILING_DEEP_UNDERGROUND
	area_flags = NO_DROPPOD
	always_unpowered = TRUE

//Caves

/area/magmoor/cave
	ceiling = CEILING_DEEP_UNDERGROUND
	ambience = list('sound/ambience/ambicave.ogg', 'sound/ambience/ambilava1.ogg', 'sound/ambience/ambilava2.ogg', 'sound/ambience/ambilava3.ogg')
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE

/area/magmoor/cave/central
	name = "中央洞穴"
	icon_state = "lava_cave_c"

/area/magmoor/cave/central/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/magmoor/cave/north
	name = "北侧洞穴"
	icon_state = "lava_cave_n"

/area/magmoor/cave/north/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/magmoor/cave/northeast
	name = "东北洞穴"
	icon_state = "lava_cave_ne"

/area/magmoor/cave/northeast/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/magmoor/cave/northwest
	name = "西北洞穴"
	icon_state = "lava_cave_nw"

/area/magmoor/cave/northwest/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/magmoor/cave/south
	name = "南侧洞穴"
	icon_state = "lava_cave_s"

/area/magmoor/cave/south/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/magmoor/cave/southeast
	name = "东南洞穴"
	icon_state = "lava_cave_se"

/area/magmoor/cave/southeast/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/magmoor/cave/southwest
	name = "西南洞穴"
	icon_state = "lava_cave_sw"

/area/magmoor/cave/southwest/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/magmoor/cave/east
	name = "东侧洞穴"
	icon_state = "lava_cave_e"

/area/magmoor/cave/east/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/magmoor/cave/west
	name = "西侧洞穴"
	icon_state = "lava_cave_w"

/area/magmoor/cave/west/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/magmoor/cave/mining/fossil
	name = "西南化石沉积区"
	icon_state = "lava_mining_fossil"

/area/magmoor/cave/rock
	name = "封闭区域"
	icon_state = "transparent"
	area_flags = CANNOT_NUKE

//Compound Outside
/area/magmoor/compound
	ceiling = CEILING_NONE
	name = "中央岩浆矿场"
	icon_state = "central"
	outside = TRUE
	ambience = list('sound/ambience/ambilava1.ogg', 'sound/ambience/ambilava2.ogg', 'sound/ambience/ambilava3.ogg')
	always_unpowered = TRUE

/area/magmoor/compound/north
	name = "北岩浆地复合体"
	icon_state = "north"

/area/magmoor/compound/northeast
	name = "东北熔岩地复合体"
	icon_state = "northeast"

/area/magmoor/compound/northwest
	name = "西北熔岩坑基地"
	icon_state = "northwest"

/area/magmoor/compound/south
	name = "南岩浆坑基地"
	icon_state = "south"

/area/magmoor/compound/southeast
	name = "东南熔岩坑复合体"
	icon_state = "southeast"

/area/magmoor/compound/southwest
	name = "西南熔岩坑复合体"
	icon_state = "southwest"

/area/magmoor/compound/east
	name = "东熔岩地复合体"
	icon_state = "east"

/area/magmoor/compound/west
	name = "西岩浆区建筑群"
	icon_state = "west"

//Medical

/area/magmoor/medical
	name = "医疗诊所"
	icon_state = "lava_med"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_MEDBAY

/area/magmoor/medical/chemistry
	name = "医疗诊所化学室"
	icon_state = "lava_chem"

/area/magmoor/medical/cmo
	name = "首席医疗官"
	icon_state = "lava_cmo"

/area/magmoor/medical/breakroom
	name = "医疗休息室"
	icon_state = "cafeteria"

/area/magmoor/medical/lobby
	name = "医疗大厅"
	icon_state = "lava_med"

/area/magmoor/medical/surgery
	name = "手术室"
	icon_state = "surgery"

/area/magmoor/medical/morgue
	name = "医疗停尸间"
	icon_state = "morgue"

/area/magmoor/medical/storage
	name = "医疗仓库"
	icon_state = "lava_med"

/area/magmoor/medical/treatment
	name = "医疗中心"
	icon_state = "medbay2"

/area/magmoor/medical/patient
	name = "医疗病房"
	icon_state = "medbay3"


//Engineer

/area/magmoor/engi
	name = "工程部"
	icon_state = "lava_engie"
	ceiling = CEILING_METAL
	ambience = list('sound/ambience/ambisin1.ogg', 'sound/ambience/ambisin2.ogg', 'sound/ambience/ambisin3.ogg', 'sound/ambience/ambisin4.ogg')
	minimap_color = MINIMAP_AREA_ENGI

/area/magmoor/engi/atmos
	name = "大气处理"
	icon_state = "lava_atmos"

/area/magmoor/engi/thermal
	name = "热核反应堆"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	icon_state = "lava_power"
	minimap_color = MINIMAP_AREA_ENGI_CAVE

/area/magmoor/engi/power
	name = "电力管理中心"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	icon_state = "lava_power"
	minimap_color = MINIMAP_AREA_ENGI_CAVE

/area/magmoor/engi/storage
	name = "工程大厅与仓库"
	icon_state = "lava_engi_storage"

/area/magmoor/engi/garage
	name = "工程车库"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	icon_state = "lava_eng1"
	minimap_color = MINIMAP_AREA_ENGI_CAVE

//Security

/area/magmoor/security
	name = "拘留室"
	icon_state = "lava_sec_prison"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_SEC

/area/magmoor/security/storage
	name = "安全军械库"
	icon_state = "lava_sec_secure"

/area/magmoor/security/infocenter
	name = "安全信息中心"
	icon_state = "lava_sec"

/area/magmoor/security/nuke
	name = "紧急核裂变设施"
	icon_state = "lava_sec_nuke"

/area/magmoor/security/arrivals/south
	name = "南部抵达安检点"
	icon_state = "lava_sec"

/area/magmoor/security/arrivals/east
	name = "东部抵达区安检点"
	icon_state = "lava_sec"

/area/magmoor/security/lobby
	name = "安保大厅"
	icon_state = "lava_sec"

//Civilian

/area/magmoor/civilian
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_LIVING

/area/magmoor/civilian/cook
	name = "厨房"
	icon_state = "lava_cook"

/area/magmoor/civilian/bar
	name = "醉醺醺的鲤鱼"

/area/magmoor/civilian/dorms
	name = "宿舍区"
	icon_state = "lava_dorms"

/area/magmoor/civilian/jani
	name = "清洁工办公室"
	icon_state = "lava_jani"

/area/magmoor/civilian/clean
	name = "盥洗室"
	icon_state = "lava_bathrooms"

/area/magmoor/civilian/clean/toilet
	name = "卫生间"
	icon_state = "red"

/area/magmoor/civilian/clean/shower
	name = "淋浴间"
	icon_state = "blue"

/area/magmoor/civilian/chapel
	name = "礼拜堂"
	icon_state = "lava_chapel"
	ceiling = CEILING_GLASS
	ambience = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg')

/area/magmoor/civilian/mosque
	name = "清真寺"
	icon_state = "lava_chapel"
	ceiling = CEILING_GLASS
	ambience = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg')

/area/magmoor/civilian/pool
	name = "澡堂"
	icon_state = "lava_civ"
	ceiling = CEILING_GLASS

/area/magmoor/civilian/basket
	name = "篮球场"
	icon_state = "lava_civ"
	ceiling = CEILING_GLASS

/area/magmoor/civilian/gambling
	name = "游戏休息室"
	icon_state = "lava_civ"

/area/magmoor/civilian/cryostasis
	name = "低温休眠"
	icon_state = "lava_civ"

/area/magmoor/civilian/rnr
	name = "休息与娱乐"

/area/magmoor/civilian/arrival
	name = "南部抵达大厅走廊"
	icon_state = "lava_civ"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_COLONY

/area/magmoor/civilian/arrival/east
	name = "东部抵达大厅走廊"


// Research
/area/magmoor/research
	name = "研究与考古"
	icon_state = "lava_research"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	ambience = list('sound/ambience/ambitech.ogg', 'sound/ambience/ambitech2.ogg')
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/magmoor/research/containment
	name = "研究材料与收容"
	icon_state = "storage"

/area/magmoor/research/researchdirector
	name = "研究主管办公室"
	icon_state = "blue"

/area/magmoor/research/decontamination
	name = "研究净化室"
	icon_state = "decontamination"

/area/magmoor/research/serverroom
	name = "研究服务器室"
	icon_state = "party"

/area/magmoor/research/rnd
	name = "研发部"
	icon_state = "research"

/area/magmoor/research/rnd/lobby
	name = "研发部大厅"
	icon_state = "purple"

/area/magmoor/research/lab
	name = "研究材料分析"
	icon_state = "lava_research"

//Cargo
/area/magmoor/cargo
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_REQ

/area/magmoor/cargo/processing
	name = "东区货物处理"
	icon_state = "lava_civ_cargo"

/area/magmoor/cargo/processing/south
	name = "货物处理区南侧"

/area/magmoor/cargo/storage
	name = "东侧货物储存区"
	icon_state = "storage"

/area/magmoor/cargo/storage/south
	name = "货物储存区南侧"

/area/magmoor/cargo/storage/secure
	name = "东侧货物安全储存室"
	icon_state = "auxstorage"

/area/magmoor/cargo/storage/secure/south
	name = "货物安全存储区南侧"

/area/magmoor/cargo/freezer
	name = "东侧货舱冷冻室"
	icon_state = "kitchen"

//Hydroponics
/area/magmoor/hydroponics
	name = "水培大厅与牲畜区"
	icon_state = "lava_civ_garden"
	ceiling = CEILING_GLASS
	outside = TRUE
	minimap_color = MINIMAP_AREA_LIVING

/area/magmoor/hydroponics/north
	name = "水培室北区"

/area/magmoor/hydroponics/south
	name = "水培区南侧"

//Command
/area/magmoor/command
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_COMMAND

/area/magmoor/command/lobby
	name = "北指挥大厅"
	icon_state = "blue2"

/area/magmoor/command/lobby/east
	name = "东侧指挥大厅"

/area/magmoor/command/office
	name = "指挥室"
	icon_state = "law"

/area/magmoor/command/office/main
	name = "监控室"
	icon_state = "lava_comm"

/area/magmoor/command/conference
	name = "指挥会议室"
	icon_state = "head_quarters"

/area/magmoor/command/commandroom
	name = "指挥控制室"
	icon_state = "bridge"
	ambience = list('sound/ambience/signal.ogg')

//Mining
/area/magmoor/mining/
	name = "采矿设备与休息室"
	icon_state = "lava_mining"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_REQ_CAVE

/area/magmoor/mining/garage
	name = "采矿车库与仓库"
	icon_state = "storage"

/area/magmoor/mining/refinery
	name = "矿石精炼厂"
	icon_state = "lava_mining_proc"

/area/magmoor/mining/storage
	name = "矿物储存"
	icon_state = "storage"
