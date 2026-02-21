// Lava "Lavaland" Outpost

//Base Area

/area/lavaland
	name = "\improper 熔岩"
	icon_state = "lava"

/area/lavaland/lava
	name = "\improper 熔岩"
	icon_state = "lava"
	always_unpowered = TRUE

//Caves
/area/lavaland/cave //Parent
	name = "洞穴"
	icon_state ="lava"
	ceiling = CEILING_NONE
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE

/area/lavaland/cave/central
	name = "\improper 中央洞穴"
	icon_state = "lava_cave_c"

/area/lavaland/cave/north
	name = "\improper 北部洞穴"
	icon_state = "lava_cave_n"

/area/lavaland/cave/northeast
	name = "\improper 东北洞穴"
	icon_state = "lava_cave_ne"

/area/lavaland/cave/northwest
	name = "\improper 西北洞穴"
	icon_state = "lava_cave_nw"

/area/lavaland/cave/south
	name = "\improper 南部洞穴"
	icon_state = "lava_cave_s"
	ceiling = CEILING_DEEP_UNDERGROUND

/area/lavaland/cave/southeast
	name = "\improper 东南洞穴"
	icon_state = "lava_cave_se"
	ceiling = CEILING_DEEP_UNDERGROUND

/area/lavaland/cave/southwest
	name = "\improper 西南洞穴"
	icon_state = "lava_cave_sw"
	ceiling = CEILING_DEEP_UNDERGROUND

/area/lavaland/cave/east
	name = "\improper 东侧洞穴"
	icon_state = "lava_cave_e"

/area/lavaland/cave/west
	name = "\improper 西侧洞穴"
	icon_state = "lava_cave_w"

//Medical

/area/lavaland/medical
	name = "\improper 医疗诊所"
	icon_state = "lava_med"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_MEDBAY

/area/lavaland/medical/chemistry
	name = "\improper 医疗诊所化学室"
	icon_state = "lava_chem"

/area/lavaland/medical/cmo
	name = "\improper 首席医疗官办公室"
	icon_state = "lava_cmo"

//"Engineer"
/area/lavaland/engie // Parent
	name ="发电机"
	icon_state = "lava_engi"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_ENGI

/area/lavaland/engie/one
	name = "\improper 发电机一号"
	icon_state = "lava_eng1"

/area/lavaland/engie/two
	name = "\improper 二号发电机"
	icon_state = "lava_eng2"

/area/lavaland/engie/three
	name = "\improper 发电机三号"
	icon_state = "lava_eng3"

/area/lavaland/engie/refine
	name = "\improper 矿石处理设施"
	icon_state = "lava_eng4"

/area/lavaland/engie/engine
	name = "\improper 工程设施"
	icon_state = "lava_eng5"

//Security

/area/lavaland/security
	name = "\improper 监狱设施"
	icon_state = "lava_sec_prison"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_SEC

/area/lavaland/security/storage
	name = "\improper 监狱设施储藏室"
	icon_state = "lava_sec_secure"

/area/lavaland/security/infocenter
	name = "\improper 监狱设施信息中心"
	icon_state = "lava_sec"

/area/lavaland/security/nuke
	name = "\improper 紧急核裂变设施"
	icon_state = "lava_sec_nuke"

//Civilian

/area/lavaland/civilian
	name = "\improper 平民住宅区"
	icon_state = "lava_civ"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_LIVING

/area/lavaland/civilian/cook
	name = "\improper 民用厨房"
	icon_state = "lava_civ_cook"

/area/lavaland/civilian/botany
	name = "\improper 平民植物学"
	icon_state = "lava_civ_bot"

/area/lavaland/civilian/garden
	name = "\improper 民用花园"
	icon_state = "lava_civ_garden"

/area/lavaland/civilian/cargo
	name = "\improper 民用货物"
	icon_state = "lava_civ_cargo"
