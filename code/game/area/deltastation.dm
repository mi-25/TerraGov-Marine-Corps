// Station areas and shuttles

/area/deltastation/
	name = "站点区域"
	icon = 'icons/turf/areas_station.dmi'
	icon_state = "station"

//Maintenance

/area/deltastation/maintenance
	name = "通用维护"
	minimap_color = MINIMAP_AREA_COLONY

//Maintenance - Departmental

/area/deltastation/maintenance/department/chapel
	name = "教堂维护区"
	icon_state = "maint_chapel"

/area/deltastation/maintenance/department/chapel/monastery
	name = "修道院维护"
	icon_state = "maint_monastery"

/area/deltastation/maintenance/department/crew_quarters/bar
	name = "酒吧维护"
	icon_state = "maint_bar"

/area/deltastation/maintenance/department/crew_quarters/dorms
	name = "宿舍区维护"
	icon_state = "maint_dorms"

/area/deltastation/maintenance/department/eva
	name = "EVA 维护"
	icon_state = "maint_eva"

/area/deltastation/maintenance/department/eva/abandoned
	name = "废弃的舱外活动装备储存室"

/area/deltastation/maintenance/department/electrical
	name = "电气维护"
	icon_state = "maint_electrical"
	minimap_color = MINIMAP_AREA_ENGI

/area/deltastation/maintenance/department/engine/atmos
	name = "大气维护区"
	icon_state = "maint_atmos"

/area/deltastation/maintenance/department/security
	name = "安保维护"
	icon_state = "maint_sec"

/area/deltastation/maintenance/department/security/upper
	name = "上层安保维护区"

/area/deltastation/maintenance/department/security/brig
	name = "禁闭室维护区"
	icon_state = "maint_brig"

/area/deltastation/maintenance/department/medical
	name = "医疗区维护通道"
	icon_state = "medbay_maint"

/area/deltastation/maintenance/department/medical/central
	name = "中央医疗舱维护区"
	icon_state = "medbay_maint_central"

/area/deltastation/maintenance/department/medical/morgue
	name = "太平间维护"
	icon_state = "morgue_maint"

/area/deltastation/maintenance/department/science
	name = "科学部维护区"
	icon_state = "maint_sci"

/area/deltastation/maintenance/department/science/central
	name = "中央科学维护区"
	icon_state = "maint_sci_central"

/area/deltastation/maintenance/department/cargo
	name = "货物维护区"
	icon_state = "maint_cargo"

/area/deltastation/maintenance/department/bridge
	name = "舰桥维护"
	icon_state = "maint_bridge"

/area/deltastation/maintenance/department/engine
	name = "工程维护"
	icon_state = "maint_engi"

/area/deltastation/maintenance/department/science/xenobiology
	name = "异形生物学维护"
	icon_state = "xenomaint"

//Maintenance - Generic Tunnels

/area/deltastation/maintenance/aft
	name = "后部维护区"
	icon_state = "aftmaint"

/area/deltastation/maintenance/aft/upper
	name = "上层后部维护区"
	icon_state = "upperaftmaint"

/area/deltastation/maintenance/aft/greater //use greater variants of area definitions for when the station has two different sections of maintenance on the same z-level. Can stand alone without "lesser". This one means that this goes more fore/north than the "lesser" maintenance area.
	name = "大型后部维修区"
	icon_state = "greateraftmaint"

/area/deltastation/maintenance/aft/lesser //use lesser variants of area definitions for when the station has two different sections of maintenance on the same z-level in conjunction with "greater" (just because it follows better). This one means that this goes more aft/south than the "greater" maintenance area.
	name = "次要后部维护区"
	icon_state = "lesseraftmaint"

/area/deltastation/maintenance/central
	name = "中央维护区"
	icon_state = "centralmaint"

/area/deltastation/maintenance/central/greater
	name = "中央主维护区"
	icon_state = "greatercentralmaint"

/area/deltastation/maintenance/central/lesser
	name = "次级中央维护区"
	icon_state = "lessercentralmaint"

/area/deltastation/maintenance/fore
	name = "前部维护区"
	icon_state = "foremaint"

/area/deltastation/maintenance/fore/upper
	name = "上层前部维护区"
	icon_state = "upperforemaint"

/area/deltastation/maintenance/fore/greater
	name = "大型前部维护区"
	icon_state = "greaterforemaint"

/area/deltastation/maintenance/fore/lesser
	name = "次级前部维护区"
	icon_state = "lesserforemaint"

/area/deltastation/maintenance/starboard
	name = "右舷维护区"
	icon_state = "starboardmaint"

/area/deltastation/maintenance/starboard/upper
	name = "上层右舷维护区"
	icon_state = "upperstarboardmaint"

/area/deltastation/maintenance/starboard/central
	name = "中央右舷维护区"
	icon_state = "centralstarboardmaint"

/area/deltastation/maintenance/starboard/greater
	name = "右舷主维护区"
	icon_state = "greaterstarboardmaint"

/area/deltastation/maintenance/starboard/lesser
	name = "次要右舷维护区"
	icon_state = "lesserstarboardmaint"

/area/deltastation/maintenance/starboard/aft
	name = "后部右舷维护区"
	icon_state = "asmaint"

/area/deltastation/maintenance/starboard/fore
	name = "前部右舷维护区"
	icon_state = "fsmaint"

/area/deltastation/maintenance/port
	name = "港口维护"
	icon_state = "portmaint"

/area/deltastation/maintenance/port/central
	name = "中央港口维护区"
	icon_state = "centralportmaint"

/area/deltastation/maintenance/port/greater
	name = "大型港口维护区"
	icon_state = "greaterportmaint"

/area/deltastation/maintenance/port/lesser
	name = "次要港口维护区"
	icon_state = "lesserportmaint"

/area/deltastation/maintenance/port/aft
	name = "后部左舷维护区"
	icon_state = "apmaint"

/area/deltastation/maintenance/port/fore
	name = "前部左舷维护区"
	icon_state = "fpmaint"

/area/deltastation/maintenance/tram
	name = "主轨道电车维护"

/area/deltastation/maintenance/tram/left
	name = "\improper 港口电车地下通道"
	icon_state = "mainttramL"

/area/deltastation/maintenance/tram/mid
	name = "\improper 中央电车地下通道"
	icon_state = "mainttramM"

/area/deltastation/maintenance/tram/right
	name = "\improper 右舷电车地下通道"
	icon_state = "mainttramR"

//Maintenance - Discrete Areas
/area/deltastation/maintenance/disposal
	name = "废物处理"
	icon_state = "disposal"

/area/deltastation/maintenance/disposal/incinerator
	name = "\improper 焚化炉"
	icon_state = "incinerator"

/area/deltastation/maintenance/space_hut
	name = "\improper 太空小屋"
	icon_state = "spacehut"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_CAVES
	outside = FALSE
	requires_power = FALSE

/area/deltastation/maintenance/space_hut/cabin
	name = "废弃小屋"

/area/deltastation/maintenance/space_hut/plasmaman
	name = "\improper 废弃等离子体人友好启动"

/area/deltastation/maintenance/space_hut/observatory
	name = "\improper 太空观测站"

//Radation storm shelter
/area/deltastation/maintenance/radshelter
	name = "\improper 辐射风暴避难所"
	icon_state = "radstorm_shelter"

/area/deltastation/maintenance/radshelter/medical
	name = "\improper 医疗辐射风暴避难所"

/area/deltastation/maintenance/radshelter/sec
	name = "\improper 安全辐射风暴避难所"

/area/deltastation/maintenance/radshelter/service
	name = "\improper 服务区辐射风暴避难所"

/area/deltastation/maintenance/radshelter/civil
	name = "\improper 平民辐射风暴避难所"

/area/deltastation/maintenance/radshelter/sci
	name = "\improper 科学部辐射风暴避难所"

/area/deltastation/maintenance/radshelter/cargo
	name = "\improper 货舱辐射风暴避难所"


//Hallway

/area/deltastation/hallway
	icon_state = "hall"

/area/deltastation/hallway/primary
	name = "\improper 主走廊"
	icon_state = "primaryhall"

/area/deltastation/hallway/primary/aft
	name = "\improper 舰尾主走廊"
	icon_state = "afthall"

/area/deltastation/hallway/primary/fore
	name = "\improper 前部主走廊"
	icon_state = "forehall"

/area/deltastation/hallway/primary/starboard
	name = "\improper 右舷主走廊"
	icon_state = "starboardhall"

/area/deltastation/hallway/primary/port
	name = "\improper 港口主走廊"
	icon_state = "porthall"

/area/deltastation/hallway/primary/central
	name = "\improper 中央主走廊"
	icon_state = "centralhall"

/area/deltastation/hallway/primary/central/fore
	name = "\improper 前部中央主走廊"
	icon_state = "hallCF"

/area/deltastation/hallway/primary/central/aft
	name = "\improper 舰尾中央主走廊"
	icon_state = "hallCA"

/area/deltastation/hallway/primary/upper
	name = "\improper 中央上层主走廊"
	icon_state = "centralhall"

/area/deltastation/hallway/primary/tram
	name = "\improper 主轨道电车"

/area/deltastation/hallway/primary/tram/left
	name = "\improper 港口电车码头"
	icon_state = "halltramL"

/area/deltastation/hallway/primary/tram/center
	name = "\improper 中央电车停靠站"
	icon_state = "halltramM"

/area/deltastation/hallway/primary/tram/right
	name = "\improper 右舷电车停靠站"
	icon_state = "halltramR"

/area/deltastation/hallway/secondary // This shouldn't be used, but it gives an icon for the enviornment tree in the map editor
	icon_state = "secondaryhall"

/area/deltastation/hallway/secondary/command
	name = "\improper 指挥走廊"
	icon_state = "bridge_hallway"

/area/deltastation/hallway/secondary/construction
	name = "\improper 施工区域"
	icon_state = "construction"

/area/deltastation/hallway/secondary/construction/engineering
	name = "\improper 工程走廊"

/area/deltastation/hallway/secondary/exit
	name = "\improper 逃生穿梭机走廊"
	icon_state = "escape"

/area/deltastation/hallway/secondary/exit/departure_lounge
	name = "\improper 出发休息室"
	icon_state = "escape_lounge"

/area/deltastation/hallway/secondary/entry
	name = "\improper 抵达穿梭机走廊"
	icon_state = "entry"

/area/deltastation/hallway/secondary/service
	name = "\improper 服务走廊"
	icon_state = "hall_service"

//Command

/area/deltastation/command
	name = "指挥"
	icon_state = "command"
	minimap_color = MINIMAP_AREA_COMMAND

/area/deltastation/command/bridge
	name = "\improper 舰桥"
	icon_state = "bridge"

/area/deltastation/command/meeting_room
	name = "\improper 高级军官会议室"
	icon_state = "meeting"

/area/deltastation/command/meeting_room/council
	name = "\improper 议会厅"
	icon_state = "meeting"

/area/deltastation/command/corporate_showroom
	name = "\improper 企业展示厅"
	icon_state = "showroom"

/area/deltastation/command/heads_quarters
	icon_state = "heads_quarters"

/area/deltastation/command/heads_quarters/captain
	name = "\improper 舰长办公室"
	icon_state = "captain"

/area/deltastation/command/heads_quarters/captain/private
	name = "\improper 舰长室"
	icon_state = "captain_private"

/area/deltastation/command/heads_quarters/ce
	name = "\improper 首席工程师办公室"
	icon_state = "ce_office"

/area/deltastation/command/heads_quarters/cmo
	name = "\improper 首席医疗官办公室"
	icon_state = "cmo_office"

/area/deltastation/command/heads_quarters/hop
	name = "\improper 人事主管办公室"
	icon_state = "hop_office"

/area/deltastation/command/heads_quarters/hos
	name = "\improper 安保主管办公室"
	icon_state = "hos_office"

/area/deltastation/command/heads_quarters/rd
	name = "\improper 研究主管办公室"
	icon_state = "rd_office"

/area/deltastation/command/heads_quarters/qm
	name = "\improper 军需官办公室"
	icon_state = "qm_office"

//Command - Teleporters

/area/deltastation/command/teleporter
	name = "\improper 传送室"
	icon_state = "teleporter"

/area/deltastation/command/gateway
	name = "\improper 传送门"
	icon_state = "gateway"

//Commons

/area/deltastation/commons
	name = "\improper 船员设施"
	icon_state = "commons"
	minimap_color = MINIMAP_AREA_LIVING

/area/deltastation/commons/dorms
	name = "\improper 宿舍区"
	icon_state = "dorms"

/area/deltastation/commons/dorms/barracks
	name = "\improper 睡眠营房"

/area/deltastation/commons/dorms/barracks/male
	name = "\improper 男性睡眠舱区"
	icon_state = "dorms_male"

/area/deltastation/commons/dorms/barracks/female
	name = "\improper 女性睡眠营房"
	icon_state = "dorms_female"

/area/deltastation/commons/dorms/laundry
	name = "\improper 洗衣房"
	icon_state = "laundry_room"

/area/deltastation/commons/toilet
	name = "\improper 宿舍卫生间"
	icon_state = "toilet"

/area/deltastation/commons/toilet/auxiliary
	name = "\improper 辅助卫生间"
	icon_state = "toilet"

/area/deltastation/commons/toilet/locker
	name = "\improper 储物柜式厕所"
	icon_state = "toilet"

/area/deltastation/commons/toilet/restrooms
	name = "\improper 洗手间"
	icon_state = "toilet"

/area/deltastation/commons/locker
	name = "\improper 更衣室"
	icon_state = "locker"

/area/deltastation/commons/lounge
	name = "\improper 酒吧休息室"
	icon_state = "lounge"

/area/deltastation/commons/fitness
	name = "\improper 健身房"
	icon_state = "fitness"
	minimap_color = MINIMAP_AREA_LIVING

/area/deltastation/commons/fitness/locker_room
	name = "\improper 男女通用更衣室"
	icon_state = "locker"

/area/deltastation/commons/fitness/locker_room/male
	name = "\improper 男更衣室"
	icon_state = "locker_male"

/area/deltastation/commons/fitness/locker_room/female
	name = "\improper 女更衣室"
	icon_state = "locker_female"

/area/deltastation/commons/fitness/recreation
	name = "\improper 娱乐区"
	icon_state = "rec"

/area/deltastation/commons/fitness/recreation/entertainment
	name = "\improper 娱乐中心"
	icon_state = "entertainment"

// Commons - Vacant Rooms
/area/deltastation/commons/vacant_room
	name = "\improper 空置房间"
	icon_state = "vacant_room"

/area/deltastation/commons/vacant_room/office
	name = "\improper 空置办公室"
	icon_state = "vacant_office"

/area/deltastation/commons/vacant_room/commissary
	name = "\improper 空置的军需处"
	icon_state = "vacant_commissary"

//Commons - Storage
/area/deltastation/commons/storage

/area/deltastation/commons/storage/tools
	name = "\improper 辅助工具储存柜"
	icon_state = "tool_storage"

/area/deltastation/commons/storage/primary
	name = "\improper 主要工具储存区"
	icon_state = "primary_storage"

/area/deltastation/commons/storage/art
	name = "\improper 美术用品储藏室"
	icon_state = "art_storage"

/area/deltastation/commons/storage/emergency/starboard
	name = "\improper 右舷应急储物舱"
	icon_state = "emergency_storage"

/area/deltastation/commons/storage/emergency/port
	name = "\improper 港口应急储存室"
	icon_state = "emergency_storage"

/area/deltastation/commons/storage/mining
	name = "\improper 公共采矿存储区"
	icon_state = "mining_storage"

//Service

/area/deltastation/service
	minimap_color = MINIMAP_AREA_LIVING

/area/deltastation/service/cafeteria
	name = "\improper 食堂"
	icon_state = "cafeteria"

/area/deltastation/service/barber
	name = "\improper 理发师"
	icon_state = "barber"

/area/deltastation/service/kitchen
	name = "\improper 厨房"
	icon_state = "kitchen"

/area/deltastation/service/kitchen/coldroom
	name = "\improper 厨房冷藏室"
	icon_state = "kitchen_cold"

/area/deltastation/service/kitchen/diner
	name = "\improper 餐厅"
	icon_state = "diner"

/area/deltastation/service/kitchen/abandoned
	name = "\improper 废弃厨房"
	icon_state = "abandoned_kitchen"

/area/deltastation/service/bar
	name = "\improper 酒吧"
	icon_state = "bar"

/area/deltastation/service/bar/atrium
	name = "\improper 中庭"
	icon_state = "bar"

/area/deltastation/service/bar/backroom
	name = "\improper 酒吧后室"
	icon_state = "bar_backroom"

/area/deltastation/service/electronic_marketing_den
	name = "\improper 电子营销窝点"
	icon_state = "abandoned_marketing_den"

/area/deltastation/service/abandoned_gambling_den
	name = "\improper 废弃赌场"
	icon_state = "abandoned_gambling_den"

/area/deltastation/service/abandoned_gambling_den/gaming
	name = "\improper 废弃游戏窝点"
	icon_state = "abandoned_gaming_den"

/area/deltastation/service/theater
	name = "\improper 剧院"
	icon_state = "theatre"

/area/deltastation/service/theater/abandoned
	name = "\improper 废弃剧院"
	icon_state = "abandoned_theatre"

/area/deltastation/service/library
	name = "\improper 图书馆"
	icon_state = "library"

/area/deltastation/service/library/lounge
	name = "\improper 图书馆休息室"
	icon_state = "library_lounge"

/area/deltastation/service/library/artgallery
	name = "\improper 艺术画廊"
	icon_state = "library_gallery"

/area/deltastation/service/library/private
	name = "\improper 图书馆私人研究室"
	icon_state = "library_gallery_private"

/area/deltastation/service/library/upper
	name = "\improper 图书馆上层"
	icon_state = "library"

/area/deltastation/service/library/printer
	name = "\improper 图书馆打印机室"
	icon_state = "library"

/area/deltastation/service/library/abandoned
	name = "\improper 废弃图书馆"
	icon_state = "abandoned_library"

/area/deltastation/service/chapel
	name = "\improper 礼拜堂"
	icon_state = "chapel"

/area/deltastation/service/chapel/monastery
	name = "\improper 修道院"

/area/deltastation/service/chapel/office
	name = "\improper 礼拜堂办公室"
	icon_state = "chapeloffice"

/area/deltastation/service/chapel/asteroid
	name = "\improper 小行星礼拜堂"
	icon_state = "explored"

/area/deltastation/service/chapel/asteroid/monastery
	name = "\improper 修道院小行星"

/area/deltastation/service/chapel/dock
	name = "\improper 礼拜堂码头"
	icon_state = "construction"

/area/deltastation/service/chapel/storage
	name = "\improper 礼拜堂仓库"
	icon_state = "chapelstorage"

/area/deltastation/service/chapel/funeral
	name = "\improper 教堂悼念室"
	icon_state = "chapelfuneral"

/area/deltastation/service/lawoffice
	name = "\improper 法律办公室"
	icon_state = "law"

/area/deltastation/service/janitor
	name = "\improper 清洁工具间"
	icon_state = "janitor"

/area/deltastation/service/hydroponics
	name = "水培"
	icon_state = "hydro"

/area/deltastation/service/hydroponics/upper
	name = "上层水培区"
	icon_state = "hydro"

/area/deltastation/service/hydroponics/garden
	name = "花园"
	icon_state = "garden"

/area/deltastation/service/hydroponics/garden/abandoned
	name = "\improper 废弃花园"
	icon_state = "abandoned_garden"

/area/deltastation/service/hydroponics/garden/monastery
	name = "\improper 修道院花园"
	icon_state = "hydro"

//Engineering

/area/deltastation/engineering
	icon_state = "engie"
	minimap_color = MINIMAP_AREA_ENGI

/area/deltastation/engineering/engine_smes
	name = "\improper 工程SMES"
	icon_state = "engine_smes"

/area/deltastation/engineering/main
	name = "工程部"
	icon_state = "engine"

/area/deltastation/engineering/hallway
	name = "工程走廊"
	icon_state = "engine_hallway"

/area/deltastation/engineering/atmos
	name = "大气系统"
	icon_state = "atmos"

/area/deltastation/engineering/atmos/upper
	name = "上层大气处理区"

/area/deltastation/engineering/atmos/project
	name = "\improper 大气处理项目室"
	icon_state = "atmos_projectroom"

/area/deltastation/engineering/atmos/pumproom
	name = "\improper 大气泵房"
	icon_state = "atmos_pump_room"

/area/deltastation/engineering/atmos/mix
	name = "\improper 大气混合室"
	icon_state = "atmos_mix"

/area/deltastation/engineering/atmos/storage
	name = "\improper 大气储存室"
	icon_state = "atmos_storage"

/area/deltastation/engineering/atmos/storage/gas
	name = "\improper 大气气体储存"
	icon_state = "atmos_storage_gas"

/area/deltastation/engineering/atmos/office
	name = "\improper 大气办公室"
	icon_state = "atmos_office"

/area/deltastation/engineering/atmos/hfr_room
	name = "\improper 大气处理室"
	icon_state = "atmos_HFR"

/area/deltastation/engineering/atmospherics_engine
	name = "\improper 大气引擎"
	icon_state = "atmos_engine"

/area/deltastation/engineering/lobby
	name = "\improper 工程大厅"
	icon_state = "engi_lobby"

/area/deltastation/engineering/supermatter
	name = "\improper 超物质引擎"
	icon_state = "engine_sm"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	outside = FALSE
	requires_power = FALSE

/area/deltastation/engineering/supermatter/room
	name = "\improper 超物质引擎室"
	icon_state = "engine_sm_room"
	requires_power = TRUE

/area/deltastation/engineering/break_room
	name = "\improper 工程大厅"
	icon_state = "engine_break"

/area/deltastation/engineering/gravity_generator
	name = "\improper 重力发生器室"
	icon_state = "grav_gen"

/area/deltastation/engineering/storage
	name = "工程仓库"
	icon_state = "engine_storage"

/area/deltastation/engineering/storage_shared
	name = "共享工程存储"
	icon_state = "engine_storage_shared"

/area/deltastation/engineering/transit_tube
	name = "\improper 运输管道"
	icon_state = "transit_tube"

/area/deltastation/engineering/storage/tech
	name = "技术存储区"
	icon_state = "tech_storage"

/area/deltastation/engineering/storage/tcomms
	name = "通讯设备储存室"
	icon_state = "tcom_storage"

//Engineering - Construction

/area/deltastation/construction
	name = "\improper 施工区域"
	icon_state = "construction"
	minimap_color = MINIMAP_AREA_ENGI

/area/deltastation/construction/mining/aux_base
	name = "辅助基地建设"
	icon_state = "aux_base_construction"

/area/deltastation/construction/storage_wing
	name = "\improper 储物翼"
	icon_state = "storage_wing"

//Solars

/area/deltastation/solars
	icon_state = "panels"
	requires_power = FALSE
	minimap_color = MINIMAP_AREA_ENGI

/area/deltastation/solars/fore
	name = "\improper 前部太阳能阵列"
	icon_state = "panelsF"

/area/deltastation/solars/aft
	name = "\improper 后部太阳能阵列"
	icon_state = "panelsAF"

/area/deltastation/solars/aux/port
	name = "\improper 左舷辅助太阳能阵列"
	icon_state = "panelsA"

/area/deltastation/solars/aux/starboard
	name = "\improper 右舷船首辅助太阳能阵列"
	icon_state = "panelsA"

/area/deltastation/solars/starboard
	name = "\improper 右舷太阳能阵列"
	icon_state = "panelsS"

/area/deltastation/solars/starboard/aft
	name = "\improper 右舷后部太阳能阵列"
	icon_state = "panelsAS"

/area/deltastation/solars/starboard/fore
	name = "\improper 右舷船首太阳能阵列"
	icon_state = "panelsFS"

/area/deltastation/solars/port
	name = "\improper 港口太阳能阵列"
	icon_state = "panelsP"

/area/deltastation/solars/port/aft
	name = "\improper 左舷后部太阳能阵列"
	icon_state = "panelsAP"

/area/deltastation/solars/port/fore
	name = "\improper 左舷太阳能阵列"
	icon_state = "panelsFP"

/area/deltastation/solars/aisat
	name = "\improper AI卫星太阳能板"
	icon_state = "panelsAI"


//Solar Maint

/area/deltastation/maintenance/solars
	name = "太阳能维护区"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/deltastation/maintenance/solars/port
	name = "索拉尔港维护区"
	icon_state = "SolarcontrolP"

/area/deltastation/maintenance/solars/port/aft
	name = "左舷后部太阳能维护区"
	icon_state = "SolarcontrolAP"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	outside = FALSE

/area/deltastation/maintenance/solars/port/fore
	name = "左舷船首太阳能维护区"
	icon_state = "SolarcontrolFP"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	outside = FALSE

/area/deltastation/maintenance/solars/starboard
	name = "右舷太阳能维护区"
	icon_state = "SolarcontrolS"

/area/deltastation/maintenance/solars/starboard/aft
	name = "右舷后部太阳能维护区"
	icon_state = "SolarcontrolAS"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	outside = FALSE

/area/deltastation/maintenance/solars/starboard/fore
	name = "右舷船首太阳能维护区"
	icon_state = "SolarcontrolFS"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	outside = FALSE

//MedBay

/area/deltastation/medical
	name = "医疗"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/deltastation/medical/abandoned
	name = "\improper 废弃医疗站"
	icon_state = "abandoned_medbay"
/area/deltastation/medical/medbay/central
	name = "医疗舱中央"
	icon_state = "med_central"

/area/deltastation/medical/medbay/lobby
	name = "\improper 医疗舱大厅"
	icon_state = "med_lobby"

//Medbay is a large area, these additional areas help level out APC load.

/area/deltastation/medical/medbay/aft
	name = "医疗舱后部"
	icon_state = "med_aft"

/area/deltastation/medical/storage
	name = "医疗舱储藏室"
	icon_state = "med_storage"

/area/deltastation/medical/paramedic
	name = "医疗调度"
	icon_state = "paramedic"

/area/deltastation/medical/office
	name = "\improper 医疗办公室"
	icon_state = "med_office"

/area/deltastation/medical/break_room
	name = "\improper 医疗休息室"
	icon_state = "med_break"

/area/deltastation/medical/coldroom
	name = "\improper 医疗冷藏室"
	icon_state = "kitchen_cold"

/area/deltastation/medical/patients_rooms
	name = "\improper 病房"
	icon_state = "patients"

/area/deltastation/medical/patients_rooms/room_a
	name = "病房A"
	icon_state = "patients"

/area/deltastation/medical/patients_rooms/room_b
	name = "B号病房"
	icon_state = "patients"

/area/deltastation/medical/virology
	name = "病毒学"
	icon_state = "virology"

/area/deltastation/medical/morgue
	name = "\improper 停尸房"
	icon_state = "morgue"

/area/deltastation/medical/chemistry
	name = "化学"
	icon_state = "chem"

/area/deltastation/medical/pharmacy
	name = "\improper 药房"
	icon_state = "pharmacy"

/area/deltastation/medical/surgery
	name = "\improper 手术室"
	icon_state = "surgery"

/area/deltastation/medical/surgery/fore
	name = "\improper 前手术室"
	icon_state = "foresurgery"

/area/deltastation/medical/surgery/aft
	name = "\improper 舰尾手术室"
	icon_state = "aftsurgery"

/area/deltastation/medical/surgery/theatre
	name = "\improper 大型手术室"
	icon_state = "surgerytheatre"
/area/deltastation/medical/cryo
	name = "低温休眠舱"
	icon_state = "cryo"

/area/deltastation/medical/exam_room
	name = "\improper 检查室"
	icon_state = "exam_room"

/area/deltastation/medical/treatment_center
	name = "\improper 医疗区治疗中心"
	icon_state = "exam_room"

/area/deltastation/medical/psychology
	name = "\improper 心理诊疗室"
	icon_state = "psychology"

//Security

/area/deltastation/security
	name = "安保"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/area/deltastation/security/office
	name = "\improper 安保办公室"
	icon_state = "security"

/area/deltastation/security/lockers
	name = "\improper 安保更衣室"
	icon_state = "securitylockerroom"

/area/deltastation/security/brig
	name = "\improper 禁闭室"
	icon_state = "brig"

/area/deltastation/security/holding_cell
	name = "\improper 拘留室"
	icon_state = "holding_cell"

/area/deltastation/security/medical
	name = "\improper 安保医疗"
	icon_state = "security_medical"

/area/deltastation/security/brig/upper
	name = "\improper 禁闭室观察台"
	icon_state = "upperbrig"

/area/deltastation/security/courtroom
	name = "\improper 法庭"
	icon_state = "courtroom"

/area/deltastation/security/prison
	name = "\improper 监狱区"
	icon_state = "sec_prison"

//Rad proof
/area/deltastation/security/prison/toilet
	name = "\improper 监狱马桶"
	icon_state = "sec_prison_safe"

// Rad proof
/area/deltastation/security/prison/safe
	name = "\improper 监狱区牢房"
	icon_state = "sec_prison_safe"

/area/deltastation/security/prison/upper
	name = "\improper 上层监狱区"
	icon_state = "prison_upper"

/area/deltastation/security/prison/visit
	name = "\improper 监狱探视区"
	icon_state = "prison_visit"

/area/deltastation/security/prison/rec
	name = "\improper 监狱娱乐室"
	icon_state = "prison_rec"

/area/deltastation/security/prison/mess
	name = "\improper 监狱食堂"
	icon_state = "prison_mess"

/area/deltastation/security/prison/work
	name = "\improper 监狱工作间"
	icon_state = "prison_work"

/area/deltastation/security/prison/shower
	name = "\improper 监狱淋浴间"
	icon_state = "prison_shower"

/area/deltastation/security/prison/workout
	name = "\improper 监狱健身房"
	icon_state = "prison_workout"

/area/deltastation/security/prison/garden
	name = "\improper 监狱花园"
	icon_state = "prison_garden"

/area/deltastation/security/processing
	name = "\improper 劳工穿梭机停靠区"
	icon_state = "sec_labor_processing"

/area/deltastation/security/processing/cremation
	name = "\improper 安全焚化炉"
	icon_state = "sec_cremation"

/area/deltastation/security/interrogation
	name = "\improper 审讯室"
	icon_state = "interrogation"

/area/deltastation/security/warden
	name = "禁闭室控制台"
	icon_state = "warden"

/area/deltastation/security/detectives_office
	name = "\improper 侦探办公室"
	icon_state = "detective"

/area/deltastation/security/detectives_office/private_investigators_office
	name = "\improper 私家侦探事务所"
	icon_state = "investigate_office"

/area/deltastation/security/range
	name = "\improper 射击场"
	icon_state = "firingrange"

/area/deltastation/security/execution
	icon_state = "execution_room"

/area/deltastation/security/execution/transfer
	name = "\improper 转运中心"
	icon_state = "sec_processing"

/area/deltastation/security/execution/education
	name = "\improper 囚犯教化室"

/area/deltastation/security/checkpoint
	name = "\improper 安全检查站"
	icon_state = "checkpoint"

/area/deltastation/security/checkpoint/auxiliary
	icon_state = "checkpoint_aux"

/area/deltastation/security/checkpoint/escape
	icon_state = "checkpoint_esc"

/area/deltastation/security/checkpoint/supply
	name = "安全哨站 - 货舱"
	icon_state = "checkpoint_supp"

/area/deltastation/security/checkpoint/engineering
	name = "工程安全哨所"
	icon_state = "checkpoint_engi"

/area/deltastation/security/checkpoint/medical
	name = "安保哨站 - 医疗舱"
	icon_state = "checkpoint_med"

/area/deltastation/security/checkpoint/medical/medsci
	name = "安全哨站 - 医疗科研区"

/area/deltastation/security/checkpoint/science
	name = "科研区 - 安全哨站"
	icon_state = "checkpoint_sci"

/area/deltastation/security/checkpoint/science/research
	name = "安全哨所 - 研究部"
	icon_state = "checkpoint_res"

/area/deltastation/security/checkpoint/customs
	name = "海关"
	icon_state = "customs_point"

/area/deltastation/security/checkpoint/customs/auxiliary
	name = "辅助海关"
	icon_state = "customs_point_aux"

/area/deltastation/security/checkpoint/customs/fore
	name = "海关前哨"
	icon_state = "customs_point_fore"

/area/deltastation/security/checkpoint/customs/aft
	name = "船尾海关"
	icon_state = "customs_point_aft"

//Cargo

/area/deltastation/cargo
	name = "补给军官"
	icon_state = "quart"
	minimap_color = MINIMAP_AREA_CELL_HIGH

/area/deltastation/cargo/sorting
	name = "\improper 配送办公室"
	icon_state = "cargo_delivery"

/area/deltastation/cargo/warehouse
	name = "\improper 仓库"
	icon_state = "cargo_warehouse"

/area/deltastation/cargo/drone_bay
	name = "\improper 工蜂舱"
	icon_state = "cargo_drone"

/area/deltastation/cargo/warehouse/upper
	name = "\improper 上层仓库"

/area/deltastation/cargo/office
	name = "\improper 补给办公室"
	icon_state = "cargo_office"

/area/deltastation/cargo/storage
	name = "\improper 货舱"
	icon_state = "cargo_bay"

/area/deltastation/cargo/lobby
	name = "\improper 货舱大厅"
	icon_state = "cargo_lobby"

/area/deltastation/cargo/miningdock
	name = "\improper 采矿码头"
	icon_state = "mining_dock"

/area/deltastation/cargo/miningdock/cafeteria
	name = "\improper 采矿食堂"
	icon_state = "mining_cafe"

/area/deltastation/cargo/miningdock/oresilo
	name = "\improper 采矿矿石筒仓存储"
	icon_state = "mining_silo"

/area/deltastation/cargo/miningoffice
	name = "\improper 采矿办公室"
	icon_state = "mining"

//Science

/area/deltastation/science
	name = "\improper 科学部"
	icon_state = "science"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/deltastation/science/lobby
	name = "\improper 科学大厅"
	icon_state = "science_lobby"

/area/deltastation/science/lower
	name = "\improper 下层科学部"
	icon_state = "lower_science"

/area/deltastation/science/breakroom
	name = "\improper 科研休息室"
	icon_state = "science_breakroom"

/area/deltastation/science/lab
	name = "研发部"
	icon_state = "research"

/area/deltastation/science/xenobiology
	name = "\improper 异形生物学实验室"
	icon_state = "xenobio"

/area/deltastation/science/xenobiology/hallway
	name = "\improper 异形生物学走廊"
	icon_state = "xenobio_hall"

/area/deltastation/science/cytology
	name = "\improper 细胞学实验室"
	icon_state = "cytology"

// Use this for the main lab. If test equipment, storage, etc is also present use this one too.
/area/deltastation/science/ordnance
	name = "\improper 军械实验室"
	icon_state = "ord_main"

/area/deltastation/science/ordnance/office
	name = "\improper 军械办公室"
	icon_state = "ord_office"

/area/deltastation/science/ordnance/storage
	name = "\improper 军械库"
	icon_state = "ord_storage"

/area/deltastation/science/ordnance/burnchamber
	name = "\improper 弹药焚化室"
	icon_state = "ord_burn"
	requires_power = FALSE

/area/deltastation/science/ordnance/freezerchamber
	name = "\improper 弹药冷冻室"
	icon_state = "ord_freeze"
	requires_power = FALSE

// Room for equipments and such
/area/deltastation/science/ordnance/testlab
	name = "\improper 军械测试实验室"
	icon_state = "ord_test"

/area/deltastation/science/ordnance/bomb
	name = "\improper 军械爆炸地点"
	icon_state = "ord_boom"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE
	outside = FALSE
	always_unpowered = TRUE

/area/deltastation/science/genetics
	name = "\improper 基因实验室"
	icon_state = "geneticssci"

/area/deltastation/science/server
	name = "\improper 研究部服务器机房"
	icon_state = "server"

/area/deltastation/science/circuits
	name = "\improper 电路实验室"
	icon_state = "cir_lab"

/area/deltastation/science/explab
	name = "\improper 实验实验室"
	icon_state = "exp_lab"

// Useless room
/area/deltastation/science/auxlab
	name = "\improper 辅助实验室"
	icon_state = "aux_lab"

/area/deltastation/science/auxlab/firing_range
	name = "\improper 研究射击场"

/area/deltastation/science/robotics
	name = "机器人技术"
	icon_state = "robotics"

/area/deltastation/science/robotics/mechbay
	name = "\improper 机甲库"
	icon_state = "mechbay"

/area/deltastation/science/robotics/lab
	name = "\improper 机器人实验室"
	icon_state = "ass_line"

/area/deltastation/science/research
	name = "\improper 研究部"
	icon_state = "science"

/area/deltastation/science/research/abandoned
	name = "\improper 废弃研究实验室"
	icon_state = "abandoned_sci"

// Telecommunications Satellite

/area/deltastation/tcommsat
	icon_state = "tcomsatcham"
	minimap_color = MINIMAP_AREA_COMMAND

/area/deltastation/tcommsat/computer
	name = "\improper 通讯控制室"
	icon_state = "tcomsatcomp"

/area/deltastation/tcommsat/server
	name = "\improper 电信服务器机房"
	icon_state = "tcomsatcham"

/area/deltastation/tcommsat/server/upper
	name = "\improper 上层电信服务器室"

//Telecommunications - On Station

/area/deltastation/comms
	name = "\improper 通讯中继器"
	icon_state = "tcomsatcham"

/area/deltastation/server
	name = "\improper 通讯服务器室"
	icon_state = "server"

//External Hull Access
/area/deltastation/maintenance/external
	name = "\improper 外部船体通道"
	icon_state = "amaint"

/area/deltastation/maintenance/external/aft
	name = "\improper 船尾外部船体通道"

/area/deltastation/maintenance/external/port
	name = "\improper 外部船体通道入口"

/area/deltastation/maintenance/external/port/bow
	name = "\improper 左舷外部船体通道"

/area/deltastation/external/landingzone
	name = "\improper 德尔塔站着陆区"
	icon_state = "ship"
	minimap_color = MINIMAP_AREA_LZ

/area/deltastation/asteroidcaves
	name = "未知区域"
	icon_state = "asteroid"
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	ambience = list('sound/ambience/ambicave.ogg', 'sound/ambience/ambilava1.ogg', 'sound/ambience/ambilava2.ogg', 'sound/ambience/ambilava3.ogg')
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE


/area/deltastation/asteroidcaves/rock
	name = "封闭区域"
	icon_state = "transparent"
	area_flags = CANNOT_NUKE

/area/deltastation/asteroidcaves/northcaves

/area/deltastation/asteroidcaves/northcaves/garbledradio

/area/deltastation/asteroidcaves/northeastcaves

/area/deltastation/asteroidcaves/westerncaves

/area/deltastation/asteroidcaves/westerncaves/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/deltastation/asteroidcaves/easterntunnel
	ceiling = CEILING_UNDERGROUND

/area/deltastation/asteroidcaves/securitycaves
	ceiling = CEILING_UNDERGROUND

/area/deltastation/asteroidcaves/southtunnel
	ceiling = CEILING_UNDERGROUND

/area/deltastation/asteroidcaves/exteriorasteroids
	icon_state = "asteroidexterior"

/area/deltastation/asteroidcaves/ship
	name = "废弃飞船"
	icon_state = "ship"
	always_unpowered = FALSE
	minimap_color = MINIMAP_AREA_SHIP

/area/deltastation/asteroidcaves/ship/two

/area/deltastation/asteroidcaves/derelictnortheast
	icon_state = "derelict"
	always_unpowered = FALSE

/area/deltastation/asteroidcaves/derelictwest
	icon_state = "derelict"
	always_unpowered = FALSE
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/deltastation/asteroidcaves/derelictsatellite

/area/deltastation/asteroidcaves/southlz
	ceiling = CEILING_NONE
	requires_power = FALSE
	outside = TRUE
