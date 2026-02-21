//----- Marine ship walls ---//
/turf/closed/wall/mainship
	name = "船体"
	desc = "一大块用于分隔房间和构成舰船的金属。"
	icon = 'icons/turf/walls/testwall.dmi'
	icon_state = "testwall-0"
	walltype = "testwall"

	max_integrity = 3000 //Wall will break down to girders if damage reaches this point

	max_temperature = 28000 //K, walls will take damage if they're next to a fire hotter than this

	opacity = TRUE
	density = TRUE

	base_icon_state = "testwall"
	///do we have bits of decoration to add to the walls?
	var/decorated_wall = TRUE

/* this completely breaks hull walls in HvH, will fix in a separate pr because wall overlays are horribly shitcode
/turf/closed/wall/mainship/smooth_icon()
	. = ..()
	cut_overlays()
	if(decorated_wall)
		var/r1 = rand(0,10) //Make a random chance for this to happen
		var/r2 = rand(0,3) // Which wall if we do choose it
		if(length(canSmoothWith) && !CHECK_MULTIPLE_BITFIELDS(smoothing_junction, (WEST_JUNCTION)))
			return
		if(CHECK_MULTIPLE_BITFIELDS(smoothing_junction, (SOUTH_JUNCTION)) || !CHECK_MULTIPLE_BITFIELDS(smoothing_junction, (EAST_JUNCTION)))
			return
		if(r1 == 9 || r1 == 10)
			add_overlay("[r2]")
*/

//turf/closed/wall/mainship/update_icon()

/turf/closed/wall/mainship/outer
	name = "外层船体"
	desc = "一大块用于分隔太空与舰船的金属"
	//icon_state = "testwall0_debug" //Uncomment to check hull in the map editor.
	walltype = "testwall"
	resistance_flags = RESIST_ALL //Impossible to destroy or even damage. Used for outer walls that would breach into space, potentially some special walls
	icon_state = "wall-invincible"
	decorated_wall = FALSE

/turf/closed/wall/mainship/outer/reinforced
	name = "强化船体"

/turf/closed/wall/mainship/outer/canterbury
	smoothing_groups = list(SMOOTH_GROUP_CANTERBURY)
	canSmoothWith = list(
		SMOOTH_GROUP_AIRLOCK,
		SMOOTH_GROUP_WINDOW_FRAME,
		SMOOTH_GROUP_WINDOW_FULLTILE,
		SMOOTH_GROUP_SHUTTERS,
		SMOOTH_GROUP_CANTERBURY,
	)

/turf/closed/wall/mainship/white
	icon = 'icons/turf/walls/wwall.dmi'
	base_icon_state = "wwall"
	icon_state = "wwall-0"
	decorated_wall = FALSE

/turf/closed/wall/mainship/gray
	walltype = "gwall"
	icon = 'icons/turf/walls/gwall.dmi'
	base_icon_state = "gwall"
	icon_state = "gwall-0"

/turf/closed/wall/mainship/gray/outer
	name = "外层船体"
	desc = "一大块用于分隔太空与舰船的金属"
	walltype = "gwall"
	resistance_flags = RESIST_ALL
	icon_state = "wall-invincible"
	decorated_wall = FALSE

/turf/closed/wall/mainship/white/canterbury //For ship smoothing.
	smoothing_groups = list(SMOOTH_GROUP_CANTERBURY)
	canSmoothWith = list(
		SMOOTH_GROUP_AIRLOCK,
		SMOOTH_GROUP_WINDOW_FRAME,
		SMOOTH_GROUP_WINDOW_FULLTILE,
		SMOOTH_GROUP_SHUTTERS,
		SMOOTH_GROUP_CANTERBURY,
	)

/turf/closed/wall/mainship/research
	resistance_flags = UNACIDABLE
	decorated_wall = FALSE

/turf/closed/wall/mainship/white/outer
	name = "外船体"
	desc = "一大块用于分隔太空与舰船的金属"
	icon_state = "wall-invincible"
	resistance_flags = RESIST_ALL

/turf/closed/wall/mainship/research/containment/wall
	icon = 'icons/turf/mainshipwalls.dmi'
	name = "细胞壁"
	walltype = null
	smoothing_flags = NONE
	decorated_wall = FALSE

/turf/closed/wall/mainship/research/containment/wall/corner
	icon_state = "containment_wall_corner"

/turf/closed/wall/mainship/research/containment/wall/divide
	icon_state = "containment_wall_divide"

/turf/closed/wall/mainship/research/containment/wall/south
	icon_state = "containment_wall_s"

/turf/closed/wall/mainship/research/containment/wall/west
	icon_state = "containment_wall_w"

/turf/closed/wall/mainship/research/containment/wall/connect_e
	icon_state = "containment_wall_connect_e"

/turf/closed/wall/mainship/research/containment/wall/connect3
	icon_state = "containment_wall_connect3"

/turf/closed/wall/mainship/research/containment/wall/connect_w
	icon_state = "containment_wall_connect_w"

/turf/closed/wall/mainship/research/containment/wall/connect_w2
	icon_state = "containment_wall_connect_w2"

/turf/closed/wall/mainship/research/containment/wall/east
	icon_state = "containment_wall_e"

/turf/closed/wall/mainship/research/containment/wall/north
	icon_state = "containment_wall_n"

/turf/closed/wall/mainship/research/containment/wall/connect_e2
	icon_state = "containment_wall_connect_e2"

/turf/closed/wall/mainship/research/containment/wall/connect_s1
	icon_state = "containment_wall_connect_s1"

/turf/closed/wall/mainship/research/containment/wall/connect_s2
	icon_state = "containment_wall_connect_s2"

/turf/closed/wall/mainship/research/containment/wall/purple
	name = "舱室舷窗"
	icon_state = "containment_window"
	opacity = FALSE


/turf/closed/wall/desert
	name = "墙"
	icon = 'icons/turf/walls/chigusa.dmi'
	icon_state = "chigusa-0"
	walltype = "chigusa"
	base_icon_state = "chigusa"

/turf/closed/wall/desert/invincible
	resistance_flags = RESIST_ALL
	icon_state = "wall-invincible"

/turf/closed/wall/kutjevo
	icon = 'icons/turf/walls/kutjevo_wall.dmi'
	icon_state = "kutjevo_wall-0"
	base_icon_state = "kutjevo_wall"

//tyson
/turf/closed/wall/tyson
	name = "外墙"
	resistance_flags = RESIST_ALL

/turf/closed/wall/tyson/airlock
	name = "锈蚀的气闸门"
	icon = 'icons/obj/doors/Doorext.dmi'
	icon_state = "door_locked"

/turf/closed/wall/tyson/airlock/maint
	icon = 'icons/obj/doors/Doormaint.dmi'

/turf/closed/wall/tyson/poddoor
	name = "锈蚀的舱门"
	icon = 'icons/obj/doors/rapid_pdoor.dmi'
	icon_state = "pdoor1"

/turf/closed/wall/tyson/r_wall
	icon_state = "rwall"

//Sulaco walls.
/turf/closed/wall/sulaco
	name = "船体"
	desc = "用于在太空船上分隔房间与寒冷真空的巨大金属块。"
	icon = 'icons/turf/walls/sulaco.dmi'
	icon_state = "sulaco-0"
	base_icon_state = "sulaco"
	color = "#616161"

	max_integrity = 3000
	max_temperature = 28000 //K, walls will take damage if they're next to a fire hotter than this
	walltype = "sulaco" //Changes all the sprites and icons.


/turf/closed/wall/sulaco/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			ChangeTurf(/turf/open/floor/plating)
		if(EXPLODE_HEAVY)
			if(prob(75))
				take_damage(rand(100, 250), BRUTE, BOMB)
			else
				dismantle_wall(1, 1)
		if(EXPLODE_LIGHT)
			take_damage(rand(0, 250), BRUTE, BOMB)


/turf/closed/wall/sulaco/hull
	name = "外层船体"
	desc = "加固的外层船体，可能是为了防止船体破损"
	walltype = "sulaco"
	resistance_flags = RESIST_ALL
	icon_state = "wall-invincible"

/turf/closed/wall/sulaco/unmeltable
	resistance_flags = RESIST_ALL
	icon_state = "wall-invincible"

/turf/closed/wall/sulaco/unmeltable/ex_act(severity) //Should make it indestructable
	return

/turf/closed/wall/sulaco/unmeltable/fire_act(burn_level)
	return

/turf/closed/wall/sulaco/unmeltable/attackby(obj/item/I, mob/user, params) //This should fix everything else. No cables, etc
	return

/turf/closed/wall/indestructible
	name = "墙"
	icon = 'icons/turf/walls.dmi'
	icon_state = "riveted"
	opacity = TRUE
	resistance_flags = RESIST_ALL
	smoothing_flags = NONE

/turf/closed/wall/indestructible/ex_act(severity)
	return

/turf/closed/wall/indestructible/fire_act(burn_level)
	return

/turf/closed/wall/indestructible/mineral
	name = "坚不可摧的岩石"
	icon_state = "rock_dark"

/turf/closed/wall/indestructible/bulkhead
	name = "舱壁"
	desc = "这是一扇大型金属舱壁。"
	icon_state = "hull"

/turf/closed/wall/indestructible/fakeglass
	name = "窗口"
	icon_state = "fakewindows"
	opacity = FALSE

/turf/closed/wall/indestructible/splashscreen
	name = "太空站13"
	plane = SPLASHSCREEN_PLANE
	icon_state = ""
	pixel_x = -64

INITIALIZE_IMMEDIATE(/turf/closed/wall/indestructible/splashscreen)
/turf/closed/wall/indestructible/splashscreen/Initialize(mapload, ...)
	. = ..()
	var/prefix = "icons/misc/lobby_art/"
	var/list/lobby_art = flist(prefix)
	if(!length(lobby_art))
		return
	icon = icon("[prefix]" + pick(lobby_art))

/turf/closed/wall/indestructible/other
	icon_state = "r_wall"

// Mineral Walls

/turf/closed/wall/mineral
	name = "矿物墙"
	desc = "这不应该存在"
	icon_state = ""
	resistance_flags = UNACIDABLE
	var/mineral
	var/last_event = 0
	var/active = null

/turf/closed/wall/mineral/gold
	name = "金墙"
	desc = "一面镀金的墙壁。真炫！"
	icon = 'icons/turf/walls.dmi'
	icon_state = "gold-0"
	base_icon_state = "gold"
	walltype = "gold"
	mineral = "gold"

/turf/closed/wall/mineral/silver
	name = "银墙"
	desc = "一面带有银色镀层的墙壁。闪闪发亮！"
	icon_state = "silver0"
	walltype = "silver"
	mineral = "silver"
	//var/electro = 0.75
	//var/shocked = null

/turf/closed/wall/mineral/diamond
	name = "钻石墙"
	desc = "一面带有菱形钢板的墙壁。你这个怪物。"
	icon_state = "diamond0"
	walltype = "diamond"
	mineral = "diamond"


/turf/closed/wall/mineral/sandstone
	name = "砂岩墙"
	desc = "带有砂岩覆层的墙壁。"
	icon_state = "sandstone0"
	walltype = "sandstone"
	mineral = "sandstone"

/turf/closed/wall/mineral/uranium
	name = "铀墙"
	desc = "一面带有铀板的墙壁。这大概不是个好主意。"
	icon_state = "uranium0"
	walltype = "uranium"
	mineral = "uranium"

/turf/closed/wall/mineral/phoron
	name = "等离子体墙"
	desc = "一面带有等离子体镀层的墙壁。这绝对是个坏主意。"
	icon_state = "phoron0"
	walltype = "phoron"
	mineral = "phoron"





//Misc walls

/turf/closed/wall/cult
	name = "墙"
	desc = "墙上的纹路在你试图聚焦时似乎开始移动。你感到一阵恶心。"
	icon = 'icons/turf/walls/cult.dmi'
	icon_state = "cult-0"
	walltype = "cult"
	base_icon_state = "cult"
	color = "#88574b"

/turf/closed/wall/clock
	name = "黄铜墙"
	desc = "由黄铜精心打造而成的坚固墙壁，上面刻着复杂的图案。凝视它时，一种奇异的自豪感在你心中油然而生。"
	icon_state = "clockwork_wall"

/turf/closed/wall/vault
	icon_state = "rockvault"

/turf/closed/wall/vault/Initialize(mapload, type)
	. = ..()
	icon_state = "[type]vault"

/turf/closed/wall/desertcavewall
	name = "洞壁"
	icon = 'icons/turf/desertdam_map.dmi'
	icon_state = "cavewall0"
	walltype = "cavewall"

/turf/closed/wall/desertcavewall/add_debris_element()
	AddElement(/datum/element/debris, DEBRIS_ROCK, -40, 5, 1)

//Prison wall

/turf/closed/wall/prison
	name = "金属墙"
	icon = 'icons/turf/walls/gorg_prison_wall_two.dmi'
	icon_state = "metal-0"
	walltype = "metal"
	base_icon_state = "metal"



//Wood wall

/turf/closed/wall/wood
	name = "木墙"
	icon = 'icons/turf/walls/woodwall.dmi'
	icon_state = "woodwall-0"
	base_icon_state = "woodwall"
	walltype = "woodwall"
	explosion_block = 1

/turf/closed/wall/wood/add_debris_element()
	AddElement(/datum/element/debris, DEBRIS_WOOD, -40, 5)

// Reinforced Wood Wall

/turf/closed/wall/wood/reinforced
	name = "强化木墙"
	desc = "加固木墙"
	icon = 'icons/turf/walls/woodrwall.dmi'
	icon_state = "wall-reinforced"
	base_icon_state = "woodrwall"
	walltype = "woodrwall"
	max_integrity = 3000
	explosion_block = 4

/turf/closed/wall/dark_colony
	icon = 'icons/turf/walls/dark_col_wall.dmi'
	icon_state = "dark_col_wall-0"

/turf/closed/wall/brick
	name = "砖墙"
	desc = "一面由风化砖块砌成的墙。"
	icon = 'icons/turf/walls/brick.dmi'
	icon_state = "wall-0"
	walltype = "wall"
	base_icon_state = "wall"

/turf/closed/wall/variable
	icon_state = "wall-0"
	///the different tileset paths for this turf
	var/list/icon_path_variants = list()

/turf/closed/wall/variable/Initialize(mapload, ...)
	. = ..()
	icon = pick(icon_path_variants)

/turf/closed/wall/variable/adobe
	name = "土坯墙"
	desc = "一堵由土坯砖砌成的墙。"
	icon_state = "wall-0"
	icon = 'icons/turf/walls/adobe.dmi'
	walltype = "wall"
	base_icon_state = "wall"
	icon_path_variants = list(
		'icons/turf/walls/adobe.dmi',
		'icons/turf/walls/adobe_1.dmi',
		'icons/turf/walls/adobe_2.dmi',
		'icons/turf/walls/adobe_3.dmi',
	)

/turf/closed/wall/variable/siding
	name = "侧墙"
	desc = "一面破旧的木墙。"
	icon = 'icons/turf/walls/siding.dmi'
	icon_state = "wall-0"
	walltype = "wall"
	base_icon_state = "wall"
	icon_path_variants = list(
		'icons/turf/walls/siding.dmi',
		'icons/turf/walls/siding_1.dmi',
		'icons/turf/walls/siding_2.dmi',
		'icons/turf/walls/siding_3.dmi',
	)

/turf/closed/wall/variable/siding/red
	icon = 'icons/turf/walls/siding_red.dmi'
	icon_path_variants = list(
		'icons/turf/walls/siding_red.dmi',
		'icons/turf/walls/siding_red_1.dmi',
		'icons/turf/walls/siding_red_2.dmi',
		'icons/turf/walls/siding_red_3.dmi',
	)

/turf/closed/wall/urban
	name = "裸露金属墙壁"
	desc = "一面厚重而粗犷的金属墙壁。表面光秃秃的，给人以压迫感。"
	icon = 'icons/turf/walls/urban_wall_regular.dmi'
	icon_state = "urban_wall_regular-0"
	walltype = "wall"
	base_icon_state = "urban_wall_regular"

/turf/closed/wall/urban/colony/ribbed
	name = "裸露金属墙壁"
	desc = "一面厚重而粗犷的金属墙壁。表面光秃秃的，令人望而生畏。"
	icon = 'icons/turf/walls/hybrisa_colony_walls.dmi'
	icon_state = "wall-reinforced"
	walltype = "wall"
	base_icon_state = "hybrisa_colony_walls"

/turf/closed/wall/urban/colony/engineering/ribbed
	name = "裸露金属墙壁"
	desc = "一面厚重而粗犷的金属墙壁。表面光秃秃的，令人望而生畏。"
	icon = 'icons/turf/walls/hybrisa_colony_walls.dmi'
	icon_state = "wall-reinforced"
	walltype = "wall"
	base_icon_state = "hybrisa_colony_walls"

/turf/closed/wall/hangar
	name = "奇怪的金属墙壁"
	desc = "构成一艘未知古老飞船船体的近乎坚不可摧的墙壁。"
	icon = 'icons/turf/walls/engineer_walls.dmi'
	icon_state = "engineer_walls-0"
	walltype = "wall"
	base_icon_state = "engineer_walls"

/turf/closed/wall/elevator
	name = "电梯墙壁"
	desc = "构成电梯船体的近乎坚不可摧的墙壁。"
	icon = 'icons/turf/walls/elevator_wall.dmi'
	icon_state = "elevator_wall-0"
	walltype = "wall"
	base_icon_state = "elevator_wall"
