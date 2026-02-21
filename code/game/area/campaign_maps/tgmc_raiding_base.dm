
/area/campaign/tgmc_raiding
	icon_state = "cliff_blocked"
	area_flags = ALWAYS_RADIO

//Colony
/area/campaign/tgmc_raiding/colony
	icon_state = "red"

/area/campaign/tgmc_raiding/colony/outdoor
	name = "\improper 中央殖民地广场"
	ceiling = CEILING_NONE
	always_unpowered = TRUE

/area/campaign/tgmc_raiding/colony/outdoor/northeast
	name = "\improper 殖民地东北区域"
	icon_state = "northeast"

/area/campaign/tgmc_raiding/colony/outdoor/east
	name = "\improper 东部殖民地地面"
	icon_state = "east"

/area/campaign/tgmc_raiding/colony/outdoor/southeast
	name = "\improper 殖民地东南区"
	icon_state = "southeast"

/area/campaign/tgmc_raiding/colony/outdoor/south
	name = "\improper 殖民地南部区域"
	icon_state = "south"

/area/campaign/tgmc_raiding/colony/outdoor/southwest
	name = "\improper 殖民地西南区"
	icon_state = "southwest"

//Colony Buildings

/area/campaign/tgmc_raiding/colony/indoor
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_COLONY

/area/campaign/tgmc_raiding/colony/indoor/southwest_shed
	name = "\improper 西南维护棚"
	icon_state = "panelsA"

/area/campaign/tgmc_raiding/colony/indoor/housing
	icon_state = "crew_quarters"
	minimap_color = MINIMAP_AREA_LIVING

/area/campaign/tgmc_raiding/colony/indoor/housing/southwest
	name = "\improper 殖民地西南住宅区"

/area/campaign/tgmc_raiding/colony/indoor/housing/southeast
	name = "\improper 东南殖民地住宅区"

/area/campaign/tgmc_raiding/colony/indoor/housing/east
	name = "\improper 东区殖民地住宅"

/area/campaign/tgmc_raiding/colony/indoor/freezer
	name = "\improper 殖民地肉类冷藏库"
	icon_state = "kitchen"

/area/campaign/tgmc_raiding/colony/indoor/engineering
	name = "\improper 殖民地工程"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI

/area/campaign/tgmc_raiding/colony/indoor/engineering/storage
	name = "\improper 殖民地工程仓库"
	icon_state = "engine_storage"

/area/campaign/tgmc_raiding/colony/indoor/garage
	name = "\improper 殖民地车库"
	icon_state = "garage"

/area/campaign/tgmc_raiding/colony/indoor/supermarket
	name = "\improper 殖民地超市"
	icon_state = "disposal"

/area/campaign/tgmc_raiding/colony/indoor/hydroponics
	name = "\improper 殖民地水培农场"
	icon_state = "hydro"

/area/campaign/tgmc_raiding/colony/indoor/laundry
	name = "\improper 殖民地洗衣房"
	icon_state = "locker"

/area/campaign/tgmc_raiding/colony/indoor/bar
	name = "\improper 殖民地酒吧"
	icon_state = "bar"

/area/campaign/tgmc_raiding/colony/indoor/toolbox
	name = "\improper 殖民地工具箱储存箱"
	icon_state = "engine_waste"

/area/campaign/tgmc_raiding/colony/indoor/storage
	name = "\improper 殖民地储存穹顶"
	icon_state = "storage"
	minimap_color = MINIMAP_AREA_REQ

/area/campaign/tgmc_raiding/colony/indoor/chapel
	name = "\improper 殖民地礼拜堂"
	icon_state = "chapel"

/area/campaign/tgmc_raiding/colony/indoor/security
	name = "\improper 殖民地安保"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/area/campaign/tgmc_raiding/colony/indoor/dome
	name = "\improper 殖民地东北穹顶"
	icon_state = "construction"

/area/campaign/tgmc_raiding/colony/indoor/station
	name = "\improper 殖民地地铁站"
	icon_state = "hangar"
	minimap_color = MINIMAP_AREA_LZ

/area/campaign/tgmc_raiding/colony/indoor/bathroom
	name = "\improper 殖民地卫生间"
	icon_state = "toilet"

//Underground

/area/campaign/tgmc_raiding/underground
	name = "\improper 地下"
	icon_state = "cave"
	ceiling = CEILING_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES

/area/campaign/tgmc_raiding/underground/tunnel
	icon_state = "shuttlegrn"
	minimap_color = MINIMAP_AREA_LZ

/area/campaign/tgmc_raiding/underground/tunnel/east
	name = "\improper 东侧地铁隧道"

/area/campaign/tgmc_raiding/underground/tunnel/central
	name = "\improper 中央地铁隧道"

/area/campaign/tgmc_raiding/underground/tunnel/south
	name = "\improper 南侧地铁隧道"

/area/campaign/tgmc_raiding/underground/tunnel/west
	name = "\improper 西侧地铁隧道"

/area/campaign/tgmc_raiding/underground/tunnel/station
	name = "\improper 西北地铁站"
	icon_state = "hangar"

/area/campaign/tgmc_raiding/underground/security
	name = "\improper 陆战队安保"
	icon_state = "brig"
	minimap_color = MINIMAP_AREA_SEC

/area/campaign/tgmc_raiding/underground/security/central_outpost
	name = "\improper 中央安全前哨站"

/area/campaign/tgmc_raiding/underground/security/south_outpost
	name = "\improper 南侧安全前哨"

/area/campaign/tgmc_raiding/underground/engineering
	name = "\improper 工程"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/campaign/tgmc_raiding/underground/engineering/filtration
	name = "\improper 水过滤系统"
	icon_state = "blue2"

/area/campaign/tgmc_raiding/underground/command
	name = "\improper 中央指挥部"
	icon_state = "observatory"
	minimap_color = MINIMAP_AREA_COMMAND

/area/campaign/tgmc_raiding/underground/command/east
	name = "\improper 东部指挥部办公室"
	icon_state = "ai_upload"

/area/campaign/tgmc_raiding/underground/command/captain
	name = "\improper 舰长办公室"
	icon_state = "captain"

/area/campaign/tgmc_raiding/underground/medbay
	name = "\improper 医疗舱"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/campaign/tgmc_raiding/underground/living
	minimap_color = MINIMAP_AREA_LIVING

/area/campaign/tgmc_raiding/underground/living/barracks
	name = "\improper 营房"
	icon_state = "crew_quarters"

/area/campaign/tgmc_raiding/underground/living/cafeteria
	name = "\improper 食堂"
	icon_state = "cafeteria"

/area/campaign/tgmc_raiding/underground/living/bathroom
	name = "\improper 中央卫生间"
	icon_state = "toilet"

/area/campaign/tgmc_raiding/underground/living/bathroom/south
	name = "\improper 南侧卫生间"

/area/campaign/tgmc_raiding/underground/living/laundry
	name = "\improper 陆战队洗衣房"
	icon_state = "fitness"

/area/campaign/tgmc_raiding/underground/living/boxing
	name = "\improper 拳击台"
	icon_state = "fitness"

/area/campaign/tgmc_raiding/underground/living/chapel
	name = "\improper 陆战队礼拜堂"
	icon_state = "chapeloffice"

/area/campaign/tgmc_raiding/underground/living/library
	name = "\improper 陆战队图书馆"
	icon_state = "library"

/area/campaign/tgmc_raiding/underground/living/offices
	name = "\improper 西北办公室"
	icon_state = "showroom"

/area/campaign/tgmc_raiding/underground/general
	icon_state = "purple"
	minimap_color = MINIMAP_AREA_COLONY

/area/campaign/tgmc_raiding/underground/general/firing_range
	name = "\improper 射击场"

/area/campaign/tgmc_raiding/underground/general/prep
	name = "\improper 陆战队准备"

/area/campaign/tgmc_raiding/underground/general/hallway
	name = "\improper 中央基地走廊"
	icon_state = "hallC1"

/area/campaign/tgmc_raiding/underground/general/hallway/west
	name = "\improper 西基地走廊"

/area/campaign/tgmc_raiding/underground/general/hallway/east
	name = "\improper 东基地走廊"

/area/campaign/tgmc_raiding/underground/cargo
	name = "\improper 货舱码头"
	icon_state = "eva"
	minimap_color = MINIMAP_AREA_REQ

/area/campaign/tgmc_raiding/underground/cargo/storage
	name = "\improper 货物储存区"
	icon_state = "auxstorage"

/area/campaign/tgmc_raiding/underground/maintenance
	icon_state = "maintcentral"

/area/campaign/tgmc_raiding/underground/maintenance/north
	name = "\improper 北侧维护区"

/area/campaign/tgmc_raiding/underground/maintenance/kitchen
	name = "\improper 厨房维护"

/area/campaign/tgmc_raiding/underground/maintenance/laundry
	name = "\improper 洗衣房维护"

/area/campaign/tgmc_raiding/underground/maintenance/security
	name = "\improper 安保维护"

/area/campaign/tgmc_raiding/underground/maintenance/filtration
	name = "\improper 过滤系统维护"

/area/campaign/tgmc_raiding/underground/maintenance/cargo
	name = "\improper 货舱维护区"

/area/campaign/tgmc_raiding/underground/maintenance/prep
	name = "\improper 准备维护"

/area/campaign/tgmc_raiding/underground/maintenance/sewer
	name = "\improper 污水隧道"
	icon_state = "blue2"
