// Slumbridge Area Code

/area/slumbridge/caves
	name = "洞穴"
	icon_state = "cave"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambisin4.ogg')
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE

/area/slumbridge/caves/rock
	name = "封闭区域"
	icon_state = "transparent"
	area_flags = CANNOT_NUKE

/area/slumbridge/caves/rock/nearlz
	icon_state = "blue"

/area/slumbridge/caves/northeastcaves
	name = "\improper 东北洞穴"
	icon_state = "northeast2"

/area/slumbridge/caves/northeastcaves/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/slumbridge/caves/southwestcaves
	name = "\improper 西南洞穴"
	icon_state = "southwest2"

/area/slumbridge/caves/southeastcaves
	name = "\improper 东南洞穴"
	icon_state = "southeast2"

/area/slumbridge/caves/southeastcaves/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/slumbridge/caves/northwestcaves
	name = "\improper 西北洞穴"
	icon_state = "northwest2"

/area/slumbridge/caves/mining
	name = "\improper 小行星带"
	icon_state = "mining"
	always_unpowered = FALSE

/area/slumbridge/caves/mining/dropship
	name = "\improper 未知运输船"
	icon_state = "blue"
	ceiling = CEILING_METAL
	always_unpowered = FALSE

/area/slumbridge/caves/minedrock
	name = "\improper 已开采的岩石"
	icon_state = "mining_production"
	ceiling = CEILING_UNDERGROUND

/area/slumbridge/outside
	name = "殖民地地面"
	icon_state = "green"
	ceiling = CEILING_NONE
	always_unpowered = TRUE

/area/slumbridge/outside/northeast
	name = "\improper 东北草原"
	icon_state = "away"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/slumbridge/outside/northeast/bridges
	icon_state = "away"
	outside = FALSE
	ceiling = CEILING_UNDERGROUND

/area/slumbridge/outside/northwest
	name = "\improper 西北沙漠"
	icon_state = "away4"
	minimap_color = MINIMAP_AREA_COLONY

/area/slumbridge/outside/northwest/nearlz

/area/slumbridge/outside/southwest
	name = "\improper 西南雪原"
	icon_state = "away1"
	minimap_color = MINIMAP_AREA_PREP
	max_ambience_cooldown = 180 SECONDS
	min_ambience_cooldown = 180 SECONDS
	ambience = list('sound/ambience/ambispace.ogg')
	temperature = ICE_COLONY_TEMPERATURE

/area/slumbridge/outside/southwest/nearlz

/area/slumbridge/outside/southeast
	name = "\improper 东南丛林"
	icon_state = "away2"
	ambience = list('sound/ambience/jungle_amb1.ogg')
	minimap_color = MINIMAP_AREA_JUNGLE

/area/slumbridge/inside
	name = "殖民地建设"
	icon_state = "red"
	ceiling = CEILING_METAL
	outside = FALSE

/area/slumbridge/inside/sombase
	name = "火星之子基地"
	ceiling = CEILING_UNDERGROUND
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/slumbridge/inside/sombase/east
	name = "\improper 火星之子基地右舷"
	ceiling = CEILING_DEEP_UNDERGROUND
	icon_state = "syndie-ship"

/area/slumbridge/inside/sombase/west
	name = "\improper 火星之子基地港口"
	icon_state = "syndie-control"

/area/slumbridge/inside/sombase/hangar
	name = "\improper 火星之子基地机库"
	icon_state = "syndie-elite"

/area/slumbridge/inside/houses
	name = "草原住宅区"
	minimap_color = MINIMAP_AREA_COLONY

/area/slumbridge/inside/houses/nwcargo
	name = "货物储存区"
	icon_state = "primarystorage"

/area/slumbridge/inside/houses/swcargo
	name = "货物检查点"
	icon_state = "quart"

/area/slumbridge/inside/houses/recreational
	name = "娱乐广场"
	icon_state = "crew_quarters"

/area/slumbridge/inside/houses/dorms
	name = "宿舍区"
	icon_state = "Sleep"

/area/slumbridge/inside/houses/surgery
	name = "宿舍医疗区"
	icon_state = "medbay3"

/area/slumbridge/inside/houses/surgery/garbledradio
	ceiling = CEILING_UNDERGROUND

/area/slumbridge/inside/houses/car
	name = "重型装备仓库"
	icon_state = "garage"

/area/slumbridge/inside/zeta
	name = "研究实验室"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/slumbridge/inside/zeta/north
	ceiling = CEILING_DEEP_UNDERGROUND
	icon_state = "toxlab"

/area/slumbridge/inside/zeta/south
	ceiling = CEILING_UNDERGROUND
	name = "研究实验室门厅"
	icon_state = "xeno_lab"

/area/slumbridge/inside/zeta/entrance
	name = "研究实验室入口"
	icon_state = "engine"

/area/slumbridge/inside/engi
	name = "工程"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/slumbridge/inside/engi/engineroom
	name = "工程部主管室"
	icon_state = "substation"

/area/slumbridge/inside/engi/south
	name = "工程舰尾"
	icon_state = "hallC2"

/area/slumbridge/inside/engi/central
	name = "工程兵中心"
	icon_state = "hallC1"

/area/slumbridge/inside/engi/west
	name = "工程港"
	icon_state = "hallP"

/area/slumbridge/inside/engi/engine
	name = "工程区"
	icon_state = "hallS"
	outside = TRUE
	ceiling = CEILING_NONE

/area/slumbridge/inside/hydrotreatment
	name = "\improper 水处理厂"
	icon_state = "decontamination"

/area/slumbridge/inside/prison
	name = "\improper 高度戒备监狱"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_SEC

/area/slumbridge/inside/prison/innerring
	name = "\improper 高安全等级内部区域"
	icon_state = "brig"

/area/slumbridge/inside/prison/outerringnorth
	name = "\improper 北部外围高安保区"
	icon_state = "sec_hos"

/area/slumbridge/inside/prison/outerringsouth
	name = "\improper 南部外围高安保区"
	icon_state = "sec_prison"

/area/slumbridge/inside/prison/outside
	icon_state = "security_sub"
	outside = TRUE
	ceiling = CEILING_NONE
	always_unpowered = TRUE

/area/slumbridge/inside/hydrotreatment/mining
	name = "\improper 采矿前哨站"
	icon_state = "mining_living"

/area/slumbridge/inside/colony
	name = "殖民地建设"
	icon_state = "away1"
	minimap_color = MINIMAP_AREA_LIVING

/area/slumbridge/inside/colony/pharmacy
	name = "殖民地药房"
	icon_state = "blue2"

/area/slumbridge/inside/colony/construction
	name = "殖民地建设"
	icon_state = "LP"

/area/slumbridge/inside/colony/hydro
	name = "殖民地水培农场"
	icon_state = "hydro"

/area/slumbridge/inside/colony/dorms
	name = "殖民地宿舍"
	icon_state = "crew_quarters"

/area/slumbridge/inside/colony/kitchen
	name = "殖民地厨房"
	icon_state = "kitchen"

/area/slumbridge/inside/colony/bar
	name = "殖民地酒吧"
	icon_state = "bar"

/area/slumbridge/inside/colony/vault
	name = "殖民地金库"
	icon_state = "observatory"

/area/slumbridge/inside/colony/oreprocess
	name = "殖民地矿石处理"
	icon_state = "unexplored"

/area/slumbridge/inside/colony/headoffice
	name = "殖民地主管办公室"
	icon_state = "conference"

/area/slumbridge/inside/colony/orestorage
	name = "殖民地仓库"
	icon_state = "storage"

/area/slumbridge/inside/medical
	name = "\improper 医疗设施"
	icon_state = "medbay3"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/slumbridge/inside/medical/foyer
	name = "\improper 医疗前厅"
	icon_state = "medbay2"

/area/slumbridge/inside/medical/storage
	name = "\improper 药品储存室"
	icon_state = "locker"

/area/slumbridge/inside/medical/morgue
	name = "\improper 停尸房"
	icon_state = "morgue"

/area/slumbridge/inside/medical/cmo
	name = "\improper 首席医疗官办公室"
	icon_state = "CMO"

/area/slumbridge/inside/medical/surgery
	name = "\improper 手术室"
	icon_state = "surgery"

/area/slumbridge/inside/medical/chemistry
	name = "\improper 化学"
	icon_state = "chem"

/area/slumbridge/inside/medical/southern
	name = "\improper 医疗休息室"
	icon_state = "LPS"

/area/slumbridge/inside/colony/southerndome
	name = "\improper 研究穹顶"
	icon_state = "toxmisc"

/area/slumbridge/inside/colony/northerndome
	name = "\improper 毒素穹顶"
	icon_state = "toxtest"

/area/slumbridge/inside/pmcdome
	name = "\improper PMC穹顶"
	icon_state = "Tactical"
	minimap_color = MINIMAP_AREA_MEDBAY_CAVE

/area/slumbridge/inside/pmcdome/nukevault
	name = "\improper PMC核弹金库"
	icon_state = "nuke_storage"
	always_unpowered = FALSE

/area/slumbridge/inside/pmcdome/weaponvault
	name = "\improper PMC武器库"
	icon_state = "armory"

/area/slumbridge/inside/pmcdome/dorms
	name = "\improper PMC 宿舍"
	icon_state = "Sleep"

/area/slumbridge/landingzoneone
	name = "一号着陆区"
	icon_state = "landingzone1"
	area_flags = NO_DROPPOD
	minimap_color = MINIMAP_AREA_LZ

/area/slumbridge/landingzonetwo
	name = "着陆区二号"
	icon_state = "landingzone2"
	area_flags = NO_DROPPOD
	minimap_color = MINIMAP_AREA_LZ

/area/slumbridge/console
	name = "\improper 穿梭机控制台"
	icon_state = "tcomsatcham"
	area_flags = NO_DROPPOD
	requires_power = FALSE
