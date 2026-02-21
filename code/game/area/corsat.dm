//Areas for Biodomes Map

/area/corsat
	icon = 'icons/turf/area_corsat.dmi'
	ceiling = CEILING_GLASS

/area/corsat/landing/console
	name = "\improper LZ1 '伽马'"
	icon_state = "corsat_telecomms"
	requires_power = FALSE

/area/corsat/landing/console2
	name = "\improper LZ2 '西格玛'"
	icon_state = "corsat_telecomms"

/area/corsat/emergency_access
	name = "\improper 未知区域"
	icon_state = "corsat_hull"
	ceiling = CEILING_METAL
	requires_power = FALSE

//SIGMA SECTOR

/area/corsat/sigma
	name = "\improper 西格玛扇区"
	icon_state = "corsat_hull"

/area/corsat/sigma/north
	name = "\improper 西格玛区北走廊"
	icon_state = "sigma_hallway_north"

/area/corsat/sigma/hangar
	name = "\improper 西格玛着陆舱"
	icon_state = "sigma_hangar"

/area/corsat/sigma/hangar/monorail
	name = "\improper 西格玛单轨车站"
	icon_state = "monorail"

/area/corsat/sigma/hangar/monorail/control
	name = "\improper 西格玛单轨控制"
	icon_state = "monorail"

/area/corsat/sigma/hangar/monorail/railcart
	name = "\improper CORSAT 单轨铁路"
	icon_state = "railcart"
	ceiling = CEILING_METAL
	requires_power = FALSE

/area/corsat/sigma/hangar/monorail/railcart_transit
	name = "\improper CORSAT 单轨运输系统"
	icon_state = "railcart"
	ceiling = CEILING_METAL

/area/corsat/sigma/hangar/cargo
	name = "\improper 西格玛机库货物检查点"
	icon_state = "sigma_hangar"

/area/corsat/sigma/hangar/checkpoint
	name = "\improper 西格玛机库检查点"
	icon_state = "sigma_hangar"

/area/corsat/sigma/hangar/id
	name = "\improper 西格玛机库身份检查点"
	icon_state = "corsat_id"

/area/corsat/sigma/hangar/arrivals
	name = "\improper 西格玛抵达区"
	icon_state = "sigma_arrivals"

/area/corsat/sigma/hangar/office
	name = "\improper 西格玛机库办公室"
	icon_state = "sigma_hangar_office"

/area/corsat/sigma/hangar/security
	name = "\improper 西格玛机库安保"
	icon_state = "sigma_hangar_security"

/area/corsat/sigma/airlock/east
	name = "\improper 西格玛穹顶东侧气闸"
	icon_state = "sigma_airlock_east"

/area/corsat/sigma/airlock/east/id
	name = "\improper 西格玛东部身份检查点"
	icon_state = "corsat_id"

/area/corsat/sigma/airlock/south
	name = "\improper 西格玛穹顶南气闸"
	icon_state = "sigma_airlock_south"

/area/corsat/sigma/airlock/south/id
	name = "\improper 西格玛南侧身份检查点"
	icon_state = "corsat_id"

/area/corsat/sigma/airlock/control
	name = "\improper 西格玛穹顶控制模块"
	icon_state = "sigma_control"

/area/corsat/sigma/cargo
	name = "\improper 西格玛货物"
	icon_state = "sigma_cargo"

/area/corsat/sigma/laundry
	name = "\improper 西格玛洗衣房"
	icon_state = "sigma_laundry"

/area/corsat/sigma/lavatory
	name = "\improper 西格玛洗手间"
	icon_state = "sigma_lavatory"

/area/corsat/sigma/cafe
	name = "\improper 西格玛咖啡馆"
	icon_state = "sigma_cafe"

/area/corsat/sigma/dorms
	name = "\improper 西格玛居住舱"
	icon_state = "sigma_residential"

/area/corsat/sigma/checkpoint
	name = "\improper 西格玛安全检查点"
	icon_state = "sigma_security_checkpoint"

/area/corsat/sigma/southeast
	name = "\improper 西格玛区东南走廊"
	icon_state = "sigma_hallway_southeast"

/area/corsat/sigma/southeast/generator
	name = "\improper CORSAT 备用发电机"
	icon_state = "secondary_core"
	ceiling = CEILING_METAL

/area/corsat/sigma/southeast/telecomm
	name = "\improper CORSAT 通信站"
	icon_state = "corsat_telecomms"
	ceiling = CEILING_METAL

/area/corsat/sigma/southeast/datalab
	name = "\improper 西格玛数据实验室"
	icon_state = "sigma_data_lab"
	ceiling = CEILING_METAL

/area/corsat/sigma/southeast/dataoffice
	name = "\improper 西格玛数据办公室"
	icon_state = "sigma_data_offices"

/area/corsat/sigma/southeast/datamaint
	name = "\improper 西格玛数据维护"
	icon_state = "sigma_data_lab"

/area/corsat/sigma/south
	name = "\improper 西格玛区南侧走廊"
	icon_state = "sigma_hallway_south"

/area/corsat/sigma/south/complex
	name = "\improper 西格玛研究综合体"
	icon_state = "sigma_complex"

/area/corsat/sigma/south/complex/teleporter
	name = "\improper 西格玛传送器"
	icon = 'icons/turf/areas.dmi'
	icon_state = "shuttle"
	ceiling = CEILING_METAL
	requires_power = FALSE

/area/corsat/sigma/south/robotics
	name = "\improper 西格玛机器人实验室"
	icon_state = "robotics"

/area/corsat/sigma/south/engineering
	name = "\improper 西格玛工程"
	icon_state = "sigma_engineering"

/area/corsat/sigma/south/security
	name = "\improper 西格玛安全中心"
	icon_state = "sigma_security"

/area/corsat/sigma/south/offices
	name = "\improper 西格玛办公室"
	icon_state = "sigma_offices"

/area/corsat/sigma/biodome
	name = "\improper 西格玛生物穹顶"
	icon_state = "sigma_biodome"
	always_unpowered = 1
	ceiling = CEILING_UNDERGROUND_METAL

// Ice Nightmare insert variation. COLD!
/area/corsat/sigma/biodome/ice

/area/corsat/sigma/biodome/testgrounds
	name = "\improper 西格玛生物穹顶试验场"
	icon_state = "sigma_testgrounds"
	requires_power = FALSE

/area/corsat/sigma/biodome/gunrange
	name = "\improper 西格玛生物穹顶射击场"
	icon_state = "sigma_gunrange"
	requires_power = FALSE

/area/corsat/sigma/biodome/scrapyard
	name = "\improper 西格玛生物穹顶废料场"
	icon_state = "sigma_scrapyard"
	requires_power = FALSE

//GAMMA SECTOR

/area/corsat/gamma
	name = "\improper 伽马扇区"
	icon_state = "corsat_hull"

/area/corsat/gamma/hangar
	name = "\improper 伽马着陆舱"
	icon_state = "gamma_hangar"

/area/corsat/gamma/hangar/monorail
	name = "\improper 伽马单轨车站"
	icon_state = "monorail"

/area/corsat/gamma/hangar/monorail/control
	name = "\improper 伽马单轨列车控制"
	icon_state = "monorail"

/area/corsat/gamma/hangar/monorail/railcart
	name = "\improper CORSAT 导轨车"
	icon_state = "railcart"
	ceiling = CEILING_METAL
	requires_power = FALSE

/area/corsat/gamma/hangar/cargo
	name = "\improper 伽马机库货物检查点"
	icon_state = "gamma_hangar"

/area/corsat/gamma/hangar/checkpoint
	name = "\improper 伽马机库检查点"
	icon_state = "gamma_hangar"

/area/corsat/gamma/hangar/office
	name = "\improper 伽马机库办公室"
	icon_state = "gamma_hangar_office"

/area/corsat/gamma/hangar/flightcontrol
	name = "\improper CORSAT飞行控制中心"
	icon_state = "flight_center"

/area/corsat/gamma/hangar/security
	name = "\improper 伽马机库安保"
	icon_state = "gamma_hangar_security"

/area/corsat/gamma/hangar/arrivals
	name = "\improper 伽马抵达区"
	icon_state = "gamma_arrivals"

/area/corsat/gamma/foyer
	name = "\improper 伽马前厅"
	icon_state = "gamma_foyer"

/area/corsat/gamma/hallwaymain
	name = "\improper 伽马区西侧走廊"
	icon_state = "gamma_hallway_main"

/area/corsat/gamma/hallwaysouth
	name = "\improper 伽马区南侧走廊"
	icon_state = "gamma_hallway_south"

/area/corsat/gamma/residential
	name = "\improper 伽马居住区走廊"
	icon_state = "gamma_hallway_main"

/area/corsat/gamma/residential/west
	name = "\improper CORSAT学院"
	icon_state = "gamma_residential_west"

/area/corsat/gamma/residential/east
	name = "\improper 伽马北区住宅区"
	icon_state = "gamma_residential_east"

/area/corsat/gamma/residential/maint
	name = "\improper 伽马住宅区维护"
	icon_state = "gamma_residential_maint"

/area/corsat/gamma/residential/researcher
	name = "\improper 研究员宿舍"
	icon_state = "researcher_quarters"

/area/corsat/gamma/residential/lounge
	name = "\improper 研究员休息室"
	icon_state = "researcher_lounge"

/area/corsat/gamma/residential/lavatory
	name = "\improper 伽马洗手间"
	icon_state = "gamma_lavatory"

/area/corsat/gamma/residential/showers
	name = "\improper 伽马淋浴间"
	icon_state = "gamma_showers"

/area/corsat/gamma/residential/laundry
	name = "\improper 伽马洗衣房"
	icon_state = "gamma_laundry"

/area/corsat/gamma/cargo
	name = "\improper 伽马货舱"
	icon_state = "gamma_cargo"

/area/corsat/gamma/cargo/lobby
	name = "\improper 伽马货物大厅"
	icon_state = "gamma_cargo_lobby"

/area/corsat/gamma/cargo/disposal
	name = "\improper 伽马垃圾处理"
	icon_state = "gamma_disposals"

/area/corsat/gamma/medbay
	name = "\improper CORSAT 医疗站"
	icon_state = "corsat_medbay"

/area/corsat/gamma/medbay/morgue
	name = "\improper CORSAT 停尸房"
	icon_state = "corsat_morgue"

/area/corsat/gamma/medbay/chemistry
	name = "\improper CORSAT 化学实验室"
	icon_state = "corsat_chemistry"

/area/corsat/gamma/medbay/surgery
	name = "\improper CORSAT 手术室"
	icon_state = "corsat_surgery"

/area/corsat/gamma/medbay/lobby
	name = "\improper CORSAT 医疗站大厅"
	icon_state = "medbay_lobby"

/area/corsat/gamma/hydroponics
	name = "\improper CORSAT 水培室"
	icon_state = "corsat_hydroponics"

/area/corsat/gamma/canteen
	name = "\improper CORSAT 食堂"
	icon_state = "corsat_canteen"

/area/corsat/gamma/kitchen
	name = "\improper CORSAT 厨房"
	icon_state = "corsat_kitchen"

/area/corsat/gamma/freezer
	name = "\improper CORSAT 食品储藏室"
	icon_state = "food_storage"

/area/corsat/gamma/administration
	name = "\improper CORSAT 行政中心"
	icon_state = "corsat_administration"

/area/corsat/gamma/security
	name = "\improper CORSAT 安全中心"
	icon_state = "gamma_security"

/area/corsat/gamma/security/cells
	name = "\improper CORSAT 安保牢房"
	icon_state = "security_cell"

/area/corsat/gamma/security/armory
	name = "\improper CORSAT 军械库"
	icon_state = "corsat_armory"

/area/corsat/gamma/rnr
	name = "\improper CORSAT 休整区"
	icon_state = "corsat_rnr"

/area/corsat/gamma/rnr/bar
	name = "\improper CORSAT 酒吧"
	icon_state = "corsat_bar"

/area/corsat/gamma/rnr/arcade
	name = "\improper CORSAT 街机"
	icon_state = "corsat_arcade"

/area/corsat/gamma/rnr/library
	name = "\improper CORSAT 图书馆"
	icon_state = "corsat_library"

/area/corsat/gamma/engineering
	name = "\improper 伽马工程"
	icon_state = "gamma_engineering"

/area/corsat/gamma/engineering/lobby
	name = "\improper 伽马工程大厅"
	icon_state = "gamma_engineering"

/area/corsat/gamma/engineering/atmos
	name = "\improper CORSAT大气处理系统"
	icon_state = "gamma_atmos"

/area/corsat/gamma/engineering/core
	name = "\improper CORSAT 发电机核心"
	icon_state = "corsat_core"

/area/corsat/gamma/sigmaremote
	name = "\improper 西格玛远程综合体"
	icon_state = "sigma_complex_remote"

/area/corsat/gamma/sigmaremote/teleporter
	name = "\improper 西格玛远程传送器"
	icon = 'icons/turf/areas.dmi'
	icon_state = "shuttle"
	ceiling = CEILING_METAL
	requires_power = FALSE

/area/corsat/gamma/airlock/north
	name = "\improper 伽马穹顶北部气闸"
	icon_state = "gamma_airlock_north"
	ceiling = CEILING_GLASS

/area/corsat/gamma/airlock/north/id
	name = "\improper 伽马北区身份检查点"
	icon_state = "corsat_id"

/area/corsat/gamma/airlock/south
	name = "\improper 伽马穹顶南气闸"
	icon_state = "gamma_airlock_south"

/area/corsat/gamma/airlock/south/id
	name = "\improper 伽马南检查站"
	icon_state = "corsat_id"

/area/corsat/gamma/airlock/control
	name = "\improper 伽马穹顶控制模块"
	icon_state = "gamma_control"
	ceiling = CEILING_GLASS

/area/corsat/gamma/biodome
	name = "\improper 伽马生物穹顶"
	icon_state = "gamma_biodome"
	temperature = ICE_COLONY_TEMPERATURE
	ceiling = CEILING_UNDERGROUND_METAL
	requires_power = FALSE

/area/corsat/gamma/biodome/complex
	name = "\improper 伽马研究综合体"
	icon_state = "gamma_complex"
	temperature = T20C
	requires_power = TRUE

/area/corsat/gamma/biodome/virology
	name = "\improper 伽马病毒学翼区"
	icon_state = "gamma_virology"
	temperature = T20C
	requires_power = TRUE

/area/corsat/gamma/biodome/toxins
	name = "\improper 伽马毒素翼区"
	icon_state = "gamma_toxin"
	temperature = T20C
	requires_power = TRUE

//THETA SECTOR

/area/corsat/theta
	name = "\improper 西塔扇区"
	icon_state = "corsat_hull"
	ceiling = CEILING_GLASS

/area/corsat/theta/biodome
	name = "\improper 生物穹顶西塔"
	icon_state = "theta_biodome"
	ceiling = CEILING_UNDERGROUND_METAL
	requires_power = FALSE

/area/corsat/theta/biodome/complex
	name = "\improper 西塔研究综合体"
	icon_state = "theta_complex"
	requires_power = TRUE

/area/corsat/theta/biodome/hydroeast
	name = "\improper 西塔东侧水培翼区"
	icon_state = "theta_hydro_east"
	requires_power = TRUE

/area/corsat/theta/biodome/hydrowest
	name = "\improper 西区水培翼"
	icon_state = "theta_hydro_west"
	requires_power = TRUE

/area/corsat/theta/airlock/west
	name = "\improper 西塞塔穹顶气闸"
	icon_state = "theta_airlock_west"

/area/corsat/theta/airlock/west/id
	name = "\improper 西区Theta身份检查点"
	icon_state = "corsat_id"

/area/corsat/theta/airlock/east
	name = "\improper 西塔穹顶东气闸"
	icon_state = "theta_airlock_east"

/area/corsat/theta/airlock/east/id
	name = "\improper 西塔东侧身份检查点"
	icon_state = "corsat_id"

/area/corsat/theta/airlock/control
	name = "\improper 西塔穹顶控制模块"
	icon_state = "theta_control"

//OMEGA SECTOR

/area/corsat/omega
	name = "\improper 欧米茄扇区"
	icon_state = "corsat_hull"
	ceiling = CEILING_METAL

/area/corsat/omega/biodome
	name = "\improper 欧米茄生物穹顶"
	icon_state = "omega_biodome"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/corsat/omega/biodome/one
	name = "\improper 生物穹顶欧米茄阿尔法"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/corsat/omega/biodome/two
	name = "\improper 生物穹顶欧米茄贝塔"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/corsat/omega/biodome/three
	name = "\improper 生物穹顶欧米茄 查理"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/corsat/omega/biodome/four
	name = "\improper 生化穹顶欧米伽德尔塔"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/corsat/omega/hangar
	name = "\improper 欧米茄着陆舱"
	icon_state = "omega_hangar"

/area/corsat/omega/hangar/office
	name = "\improper 欧米茄机库办公室"
	icon_state = "omega_hangar_office"

/area/corsat/omega/hangar/security
	name = "\improper 欧米茄机库安保"
	icon_state = "omega_hangar_security"

/area/corsat/omega/hallways
	name = "\improper 欧米茄区走廊"
	icon_state = "omega_hallway"

/area/corsat/omega/complex
	name = "\improper 欧米茄研究综合体"
	icon_state = "omega_complex"

/area/corsat/omega/containment
	name = "\improper 欧米茄研究收容区"
	icon_state = "omega_containment"

/area/corsat/omega/security
	name = "\improper 欧米茄安全中心"
	icon_state = "omega_security"

/area/corsat/omega/checkpoint
	name = "\improper 欧米茄权限检查点"
	icon_state = "omega_checkpoint"

/area/corsat/omega/offices
	name = "\improper 欧米茄办公室"
	icon_state = "omega_offices"

/area/corsat/omega/cargo
	name = "\improper 欧米茄货舱"
	icon_state = "omega_cargo"

/area/corsat/omega/maint
	name = "\improper 欧米茄维护区"
	icon_state = "omega_maintenance"

/area/corsat/omega/airlocknorth
	name = "\improper 欧米茄穹顶北部气闸"
	icon_state = "omega_airlock"

/area/corsat/omega/airlocknorth/id
	name = "\improper 欧米茄北部身份检查站"
	icon_state = "corsat_id"

/area/corsat/omega/control
	name = "\improper 欧米茄穹顶控制模块"
	icon_state = "omega_control"

/area/corsat/hangar_storage/research
	name = "\improper 机库储存区"
	icon_state = "omega_hangar"

/area/corsat/hangar_storage/research/ship
	name = "\improper 企业舰船"
	icon_state = "railcart"
	requires_power = FALSE

/area/corsat/dropzone/landingzoneone
	name = "\improper 机库存储区"
	icon_state = "flight_center"
	requires_power = FALSE

/area/corsat/dropzone/landingzonetwo
	name = "\improper 机库存储区"
	icon_state = "flight_center"

/area/corsat/dropzone/landingzonethree
	name = "\improper 机库储物区"
	icon_state = "flight_center"

//INACCESSIBLE

/area/corsat/inaccessible
	name = "\improper 未知地点"
	icon_state = "corsat_hull"
	ceiling = CEILING_METAL
	requires_power = FALSE
