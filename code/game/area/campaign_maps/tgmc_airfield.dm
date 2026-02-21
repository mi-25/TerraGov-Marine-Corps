//TGMC airfield areas
/area/campaign/tgmc_airfield
	area_flags = ALWAYS_RADIO
	icon_state = "lv-626"

/area/campaign/tgmc_airfield/outside
	name = "地面"
	icon_state = "green"
	always_unpowered = TRUE
	ambience = list('sound/ambience/ambigen10.ogg','sound/ambience/ambilava2.ogg')

/area/campaign/tgmc_airfield/outside/cave
	name = "洞穴"
	icon_state = "alarm_down"
	ceiling = CEILING_UNDERGROUND
	outside = FALSE

/area/campaign/tgmc_airfield/outside/cave/enclosed
	icon_state = "invi"
	ceiling = CEILING_DEEP_UNDERGROUND

/area/campaign/tgmc_airfield/outside/desert
	name = "中央沙漠"
	icon_state = "central"
	minimap_color = MINIMAP_AREA_CELL_MED

/area/campaign/tgmc_airfield/outside/desert/west
	name = "西部沙漠"
	icon_state = "west"

/area/campaign/tgmc_airfield/outside/desert/east
	name = "东部沙漠"
	icon_state = "east"

/area/campaign/tgmc_airfield/outside/desert/north
	name = "北部沙漠"
	icon_state = "north"

/area/campaign/tgmc_airfield/outside/desert/south
	name = "南部沙漠"
	icon_state = "south"

/area/campaign/tgmc_airfield/outside/dry_river
	name = "干河"
	icon_state = "blueold"

/area/campaign/tgmc_airfield/outside/west_base
	name = "西部基地地面"
	icon_state = "west2"
	always_unpowered = FALSE

/area/campaign/tgmc_airfield/outside/east_base
	name = "东部基地地面"
	icon_state = "east2"
	always_unpowered = FALSE

/area/campaign/tgmc_airfield/outside/airstrip_north
	name = "北部机场"
	icon_state = "runway"
	always_unpowered = FALSE

/area/campaign/tgmc_airfield/outside/airstrip_south
	name = "北部机场"
	icon_state = "runway2"
	always_unpowered = FALSE

/area/campaign/tgmc_airfield/base
	name = "人行道"
	icon_state = "dark"
	ambience = list('sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg')
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_COLONY

/area/campaign/tgmc_airfield/base/hangar_bay
	name = "机库"
	icon_state = "hangar_cas"
	minimap_color = MINIMAP_AREA_ENGI

/area/campaign/tgmc_airfield/base/hangar_bay/generator
	name = "发电机"
	icon_state = "substation"

/area/campaign/tgmc_airfield/base/barracks
	name = "西部营房"
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_LIVING

/area/campaign/tgmc_airfield/base/barracks/east
	name = "东部兵营"
	icon_state = "crew_quarters"

/area/campaign/tgmc_airfield/base/barracks/officer
	name = "军官宿舍"
	icon_state = "captain"

/area/campaign/tgmc_airfield/base/barracks/mess_hall
	name = "食堂"
	icon_state = "cafeteria"

/area/campaign/tgmc_airfield/base/command_center
	name = "指挥中心"
	icon_state = "observatory"
	minimap_color = MINIMAP_AREA_COMMAND

/area/campaign/tgmc_airfield/base/medical
	name = "医疗"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/campaign/tgmc_airfield/base/storage
	name = "仓储仓库"
	icon_state = "auxstorage"
	minimap_color = MINIMAP_AREA_REQ

/area/campaign/tgmc_airfield/base/security_checkpoint
	name = "西部安全检查站"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/area/campaign/tgmc_airfield/base/security_checkpoint/east
	name = "东部安检点"
	icon_state = "checkpoint1"

/area/campaign/tgmc_airfield/base/armory
	name = "军械库"
	icon_state = "armory"
	minimap_color = MINIMAP_AREA_SEC

/area/campaign/tgmc_airfield/base/armory_workshop
	name = "军械库工坊"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_ENGI

/area/campaign/tgmc_airfield/base/water_purification
	name = "净水中心"
	icon_state = "decontamination"
	minimap_color = MINIMAP_AREA_ENGI
