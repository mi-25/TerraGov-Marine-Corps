// ICY CAVES AREAS
/area/icy_caves
	outside = FALSE

/area/icy_caves/caves
	name = "洞穴"
	icon_state = "away4"
	ceiling = CEILING_UNDERGROUND
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE

/area/icy_caves/caves/northern
	name = "北部洞穴"
	icon_state = "cave"
	ceiling = CEILING_DEEP_UNDERGROUND

/area/icy_caves/caves/crashed_ship
	name = "坠毁的飞船"
	icon_state = "red"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_SHIP
	always_unpowered = FALSE

/area/icy_caves/caves/chapel
	name = "纳尔西教堂"
	icon_state = "icy_chapel"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_LIVING_CAVE
	always_unpowered = FALSE

/area/icy_caves/caves/northwestmonorail
	name = "西北单轨车站"
	icon_state = "purple"
	ceiling = CEILING_DEEP_UNDERGROUND
	always_unpowered = FALSE

/area/icy_caves/caves/northwestmonorail/breakroom
	name = "西北单轨车站休息室"
	minimap_color = MINIMAP_AREA_LIVING_CAVE

/area/icy_caves/caves/northwestmonorail/hallway
	name = "西北单轨车站走廊"

/area/icy_caves/caves/northwestmonorail/morgue
	name = "西北单轨车站停尸房"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/icy_caves/caves/northwestmonorail/medbay
	name = "西北单轨车站医疗站"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/icy_caves/caves/underground_cafeteria
	name = "地下食堂"
	icon_state = "icy_undercaf"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_LIVING_CAVE
	always_unpowered = FALSE

/area/icy_caves/caves/cavesbrig
	name = "洞穴禁闭室"
	icon_state = "icy_cavesbrig"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_SEC_CAVE
	always_unpowered = FALSE

/area/icy_caves/caves/weapon_vault
	name = "洞穴武器库"
	icon_state = "icy_vault"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_SEC_CAVE
	always_unpowered = FALSE

/area/icy_caves/caves/alienstuff
	name = "外星生物与植物生命展览"
	icon_state = "icy_alienstuff"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE
	always_unpowered = FALSE

/area/icy_caves/caves/south
	name = "南部洞穴"
	icon_state = "cave"
	ceiling = CEILING_UNDERGROUND
	always_unpowered = FALSE

/area/icy_caves/caves/east
	name = "东部洞穴"
	icon_state = "cave"
	ceiling = CEILING_UNDERGROUND
	always_unpowered = FALSE

/area/icy_caves/caves/west
	name = "西部洞穴"
	icon_state = "cave"
	ceiling = CEILING_UNDERGROUND

/area/icy_caves/caves/rock
	name = "封闭区域"
	icon_state = "transparent"
	area_flags = CANNOT_NUKE

/area/icy_caves/outpost/
	name = "前哨站"
	icon_state = "Sleep"
	ceiling = CEILING_METAL

/area/icy_caves/outpost/dorms
	name = "宿舍区"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_LIVING

/area/icy_caves/outpost/engineering
	name = "工程部"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI

/area/icy_caves/outpost/garage
	name = "机库"
	icon_state = "garage"
	minimap_color = MINIMAP_AREA_REQ

/area/icy_caves/outpost/medbay
	name = "\improper 医疗舱"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/icy_caves/outpost/refinery
	name = "\improper 精炼厂"
	icon_state = "purple"
	minimap_color = MINIMAP_AREA_REQ

/area/icy_caves/outpost/security
	name = "\improper 安保"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/area/icy_caves/outpost/research
	name = "\improper 研究哨站"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/icy_caves/outpost/recreation
	name = "\improper 娱乐室"
	icon_state = "cafeteria"
	ceiling = CEILING_GLASS

/area/icy_caves/outpost/mining
	minimap_color = MINIMAP_AREA_REQ

/area/icy_caves/outpost/mining/west
	name = "\improper 西部矿区"
	icon_state = "blue"

/area/icy_caves/outpost/mining/east
	name = "\improper 东矿区"
	icon_state = "blue"

/area/icy_caves/outpost/kitchen
	name = "\improper 厨房"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_LIVING

/area/icy_caves/outpost/office
	name = "\improper 办公室"
	icon_state = "yellow"

/area/icy_caves/outpost/LZ1
	name = "\improper 一号着陆区"
	icon_state = "green"
	ceiling = CEILING_NONE
	minimap_color = MINIMAP_AREA_LZ

/area/icy_caves/outpost/LZ2
	name = "\improper 着陆区二"
	icon_state = "blue"
	ceiling = CEILING_NONE
	minimap_color = MINIMAP_AREA_LZ

/area/icy_caves/outpost/outside
	name = "\improper 殖民地地面"
	icon_state = "blue"
	ceiling = CEILING_NONE
	outside = TRUE

/area/icy_caves/outpost/outside/center
	name = "\improper 殖民地中央广场"
