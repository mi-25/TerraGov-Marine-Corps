
//These are shuttle areas; all subtypes are only used as teleportation markers, they have no actual function beyond that.
//Multi area shuttles are a thing now, use subtypes! ~ninjanomnom

/area/shuttle
	name = "穿梭机"
	requires_power = FALSE
	always_unpowered = FALSE
//	valid_territory = FALSE
	icon_state = "shuttle"
	// Loading the same shuttle map at a different time will produce distinct area instances.
	unique = FALSE

///area/shuttle/Initialize(mapload)
//	if(!canSmoothWithAreas)
//		canSmoothWithAreas = type
//	. = ..()

/area/shuttle/PlaceOnTopReact(list/new_baseturfs, turf/fake_turf_type, flags)
	. = ..()
	if(length(new_baseturfs) > 1 || fake_turf_type)
		return // More complicated larger changes indicate this isn't a player
	if(ispath(new_baseturfs[1], /turf/open/floor/plating))
		new_baseturfs.Insert(1, /turf/baseturf_skipover/shuttle)

////////////////////////////Single-area shuttles////////////////////////////
/area/shuttle/dropship/Initialize(mapload, ...)
	. = ..()
	var/area/area = get_area(src)
	area.area_flags |= MARINE_BASE

/area/shuttle/dropship/alamo
	name = "阿拉莫号运输船"

/area/shuttle/dropship/normandy
	name = "诺曼底号运输船"

/area/shuttle/dropship/triumph
	name = "胜利号运输船"

/area/shuttle/cas
	name = "秃鹫喷气机"

/area/shuttle/minidropship
	name = "蝌蚪号空降穿梭机"
	area_flags = NO_CONSTRUCTION

/area/shuttle/minidropship/Initialize(mapload, ...)
	. = ..()
	var/area/area = get_area(src)
	area.area_flags |= MARINE_BASE

/area/shuttle/ert
	name = "紧急响应小组"

/area/shuttle/ert/upp
	name = "火星之子"

/area/shuttle/ert/pmc
	name = "PMC 应急响应小组"

/area/shuttle/big_ert
	name = "大型紧急响应部队飞船"

/area/shuttle/ert/ufo
	name = "小型不明飞行物"

/area/shuttle/transit
	name = "超空间"
	desc = "哇哦哦哦哦"
	base_lighting_alpha = 255


/area/shuttle/escape_pod
	name = "逃生舱"
	minimap_color = MINIMAP_AREA_ESCAPE

/area/shuttle/custom
	name = "自定义玩家穿梭机"

/area/shuttle/arrival
	name = "抵达穿梭机"
	unique = TRUE  // SSjob refers to this area for latejoiners

/area/shuttle/pod_1
	name = "逃生舱一号"

/area/shuttle/pod_2
	name = "逃生舱二号"

/area/shuttle/pod_3
	name = "逃生舱三号"

/area/shuttle/pod_4
	name = "逃生舱四号"

/area/shuttle/mining
	name = "采矿穿梭机"

/area/shuttle/labor
	name = "劳改营穿梭机"

/area/shuttle/supply
	name = "补给穿梭机"

/area/shuttle/vehicle_supply
	name = "载具补给穿梭机"

/*
/area/shuttle/escape
	name = "紧急穿梭机"

/area/shuttle/escape/backup
	name = "备用紧急穿梭机"

/area/shuttle/escape/luxury
	name = "豪华紧急穿梭机"
	noteleport = TRUE

/area/shuttle/escape/arena
	name = "竞技场"
	noteleport = TRUE

/area/shuttle/escape/meteor
	name = "\proper 一台绑着引擎的流星"*/

/area/shuttle/transport
	name = "运输穿梭机"
//	blob_allowed = FALSE

/area/shuttle/assault_pod
	name = "钢铁之雨"
//	blob_allowed = FALSE

/area/shuttle/sbc_starfury
	name = "SBC 星怒号"
//	blob_allowed = FALSE

/area/shuttle/sbc_fighter1
	name = "SBC 战斗机 1"
//	blob_allowed = FALSE

/area/shuttle/sbc_fighter2
	name = "SBC 战斗机 2"
//	blob_allowed = FALSE

/area/shuttle/sbc_corvette
	name = "SBC 护卫舰"
//	blob_allowed = FALSE

/area/shuttle/syndicate_scout
	name = "辛迪加侦察兵"
//	blob_allowed = FALSE

/area/shuttle/caravan
//	blob_allowed = FALSE
	requires_power = TRUE

/area/shuttle/caravan/syndicate1
	name = "辛迪加战斗机"

/area/shuttle/caravan/syndicate2
	name = "辛迪加战斗机"

/area/shuttle/caravan/syndicate3
	name = "辛迪加空降艇"

/area/shuttle/caravan/pirate
	name = "海盗快艇"

/area/shuttle/caravan/freighter1
	name = "小型货船"

/area/shuttle/caravan/freighter2
	name = "小型货船"

/area/shuttle/caravan/freighter3
	name = "小型货船"

/area/shuttle/canterbury
	name = "坎特伯雷"
	requires_power = TRUE
	always_unpowered = FALSE

/area/shuttle/canterbury/Initialize(mapload, ...)
	. = ..()
	var/area/area = get_area(src)
	area.area_flags |= MARINE_BASE

/area/shuttle/canterbury/cic
	name = "作战信息中心"

/area/shuttle/canterbury/medical
	name = "医疗"

/area/shuttle/canterbury/general
	name = "坎特伯雷"
