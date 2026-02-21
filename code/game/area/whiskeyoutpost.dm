/area/whiskey_outpost
	name = "威士忌前哨站"
	icon_state = "green"
	ceiling = CEILING_METAL

/area/whiskey_outpost/outside
	name = "未使用"
	icon_state = "green"
	ceiling = CEILING_NONE

	requires_power = TRUE
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE
	outside = FALSE


/area/whiskey_outpost/outside/north
	name = "威士忌前哨站北区"
	icon_state = "north"

/area/whiskey_outpost/outside/west
	name = "威士忌前哨站西区"
	icon_state = "west"

/area/whiskey_outpost/outside/east
	name = "威士忌前哨站东区"
	icon_state = "east"

/area/whiskey_outpost/outside/south
	name = "威士忌前哨站南侧"
	icon_state = "south"

/area/whiskey_outpost/outside/rock
	name = "封闭区域"
	icon_state = "transparent"
	area_flags = CANNOT_NUKE
