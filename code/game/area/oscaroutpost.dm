/area/oscar_outpost
	name = "奥斯卡前哨站"
	icon_state = "green"
	ceiling = CEILING_METAL

/area/oscar_outpost/base
	name = "奥斯卡前哨集结区"
	icon_state = "north"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	outside = FALSE

/area/oscar_outpost/outside
	name = "未使用"
	icon_state = "green"
	ceiling = CEILING_NONE

	requires_power = TRUE
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE
	outside = TRUE

/area/oscar_outpost/outside/north
	name = "奥斯卡前哨站北区"
	icon_state = "north"

/area/oscar_outpost/outside/west
	name = "奥斯卡前哨站西区"
	icon_state = "west"

/area/oscar_outpost/outside/east
	name = "奥斯卡前哨站东区"
	icon_state = "east"

/area/oscar_outpost/outside/northeast
	name = "奥斯卡前哨站东北区"
	icon_state = "east"

/area/oscar_outpost/outside/northwest
	name = "奥斯卡前哨站西北区"
	icon_state = "west"

/area/oscar_outpost/outside/south
	name = "奥斯卡前哨站南站"
	icon_state = "south"

/area/oscar_outpost/outside/underground
	name = "奥斯卡前哨站地下"
	icon_state = "south"
	ceiling = CEILING_DEEP_UNDERGROUND

/area/oscar_outpost/outside/rock
	name = "封闭区域"
	icon_state = "transparent"
	ceiling = CEILING_DEEP_UNDERGROUND
	area_flags = CANNOT_NUKE

/area/oscar_outpost/outside/road
	name = "奥斯卡前哨站道路"
	icon_state = "south"

/area/oscar_outpost/village
	name = "奥斯卡前哨站北部村庄"
	icon_state = "green"
	ceiling = CEILING_METAL
	outside = TRUE

/area/oscar_outpost/village/south
	name = "奥斯卡前哨站南部村庄"
	icon_state = "green"
	ceiling = CEILING_METAL

/area/oscar_outpost/village/east
	name = "奥斯卡前哨站东部村庄"
	icon_state = "green"
	ceiling = CEILING_METAL

/area/oscar_outpost/village/central
	name = "奥斯卡前哨站东部村庄"
	icon_state = "green"
	ceiling = CEILING_METAL

/area/oscar_outpost/village/fairgrounds
	name = "奥斯卡前哨站游乐场"
	icon_state = "green"
	ceiling = CEILING_NONE
	requires_power = FALSE

/area/oscar_outpost/village/abandonedbase
	name = "奥斯卡前哨基地泽塔"
	icon_state = "green"
	ceiling = CEILING_UNDERGROUND_METAL
	outside = FALSE

/area/oscar_outpost/village/abandonedbase/tadlandingzone
	name = "奥斯卡前哨基地泽塔着陆区"
	icon_state = "green"
	ceiling = CEILING_NONE
	outside = TRUE
