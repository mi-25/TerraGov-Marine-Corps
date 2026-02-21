/obj/structure/platform
	name = "平台"
	desc = "一个方形金属表面，由四条腿支撑。"
	icon = 'icons/obj/structures/platforms.dmi'
	icon_state = "platform"
	coverage = 10
	density = TRUE
	layer = BELOW_OBJ_LAYER
	atom_flags = ON_BORDER
	interaction_flags = INTERACT_CHECK_INCAPACITATED
	allow_pass_flags = PASS_LOW_STRUCTURE|PASSABLE|PASS_WALKOVER
	climbable = TRUE
	resistance_flags = XENO_DAMAGEABLE

/obj/structure/platform/Initialize(mapload)
	. = ..()
	update_icon()
	icon_state = null

	var/static/list/connections = list(
		COMSIG_ATOM_EXIT = PROC_REF(on_try_exit),
		COMSIG_OBJ_TRY_ALLOW_THROUGH = PROC_REF(can_climb_over),
	)
	AddElement(/datum/element/connect_loc, connections)

/obj/structure/platform/update_overlays()
	. = ..()
	var/image/new_overlay

	if(dir & EAST)
		new_overlay = image(icon, src, "[initial(icon_state)]_overlay", layer, EAST)
		new_overlay.pixel_x = 32
		. += new_overlay

	if(dir & WEST)
		new_overlay = image(icon, src, "[initial(icon_state)]_overlay", layer, WEST)
		new_overlay.pixel_x = -32
		. += new_overlay

	if(dir & NORTH)
		new_overlay = image(icon, src, "[initial(icon_state)]_overlay", layer, NORTH)
		new_overlay.pixel_y = 32
		new_overlay.layer = ABOVE_MOB_LAYER //perspective
		. += new_overlay

	if(dir & SOUTH)
		new_overlay = image(icon, src, "[initial(icon_state)]_overlay", layer, SOUTH)
		new_overlay.pixel_y = -32
		. += new_overlay

	if(CHECK_MULTIPLE_BITFIELDS(dir, NORTHEAST))
		new_overlay = image(icon, src, "[initial(icon_state)]_overlay", layer, NORTHEAST)
		new_overlay.pixel_y = 32
		new_overlay.pixel_x = 32
		new_overlay.layer = ABOVE_MOB_PLATFORM_LAYER
		. += new_overlay

	if(CHECK_MULTIPLE_BITFIELDS(dir, NORTHWEST))
		new_overlay = image(icon, src, "[initial(icon_state)]_overlay", layer, NORTHWEST)
		new_overlay.pixel_y = 32
		new_overlay.pixel_x = -32
		new_overlay.layer = ABOVE_MOB_PLATFORM_LAYER
		. += new_overlay

	if(CHECK_MULTIPLE_BITFIELDS(dir, SOUTHEAST))
		new_overlay = image(icon, src, "[initial(icon_state)]_overlay", layer, SOUTHEAST)
		new_overlay.pixel_y = -32
		new_overlay.pixel_x = 32
		. += new_overlay

	if(CHECK_MULTIPLE_BITFIELDS(dir, SOUTHWEST))
		new_overlay = image(icon, src, "[initial(icon_state)]_overlay", layer, SOUTHWEST)
		new_overlay.pixel_y = -32
		new_overlay.pixel_x = -32
		. += new_overlay

/obj/structure/platform/nondense
	density = FALSE
	climbable = FALSE
	coverage = 0

/obj/structure/platform/rockcliff
	icon_state = "rockcliff"
	name = "岩石峭壁"
	desc = "由石块和岩石构成的陡峭悬崖，看起来可以攀爬。"

/obj/structure/platform/rockcliff/orange
	icon_state = "rockcliff_orange"

/obj/structure/platform/rockcliff/red
	icon_state = "rockcliff_red"

/obj/structure/platform/rockcliff/icycliff
	icon_state = "icerock"

/obj/structure/platform/rockcliff/icycliff/nondense
	density = FALSE
	climbable = FALSE
	coverage = 0

/obj/structure/platform/metalplatform
	icon_state = "metalplatform"

/obj/structure/platform/metalplatform/nondense
	density = FALSE
	climbable = FALSE
	coverage = 0

/obj/structure/platform/trench
	icon_state = "platformtrench"
	name = "战壕墙"
	desc = "一组粗切木板构成挖掘战壕的侧壁。"

/obj/structure/platform/trench/nondense
	density = FALSE
	climbable = FALSE
	coverage = 0

/obj/structure/platform/adobe
	name = "砖墙"
	desc = "一堵低矮的土坯砖墙。"
	icon_state = "adobe"

/obj/structure/platform/adobe/nondense
	density = FALSE
	climbable = FALSE
	coverage = 0

//decorative corner platform bits
/obj/structure/platform_decoration
	name = "平台"
	desc = "一个方形金属表面，由四条腿支撑。"
	icon = 'icons/obj/structures/platforms.dmi'
	icon_state = "platform_deco"
	atom_flags = ON_BORDER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/platform_decoration/Initialize(mapload)
	. = ..()
	switch(dir)
		if(NORTH)
			layer = ABOVE_MOB_PLATFORM_LAYER
		if(SOUTH)
			layer = ABOVE_MOB_PLATFORM_LAYER
		if(SOUTHEAST)
			layer = ABOVE_MOB_PLATFORM_LAYER
		if(SOUTHWEST)
			layer = ABOVE_MOB_PLATFORM_LAYER

/obj/structure/platform_decoration/rockcliff_deco
	icon_state = "rockcliff_deco"
	name = "岩石峭壁"
	desc = "由石块和岩石构成的陡峭悬崖，看起来可以攀爬。"

/obj/structure/platform_decoration/rockcliff_deco/orange
	icon_state = "rockcliff_orange_deco"

/obj/structure/platform_decoration/rockcliff_deco/red
	icon_state = "rockcliff_red_deco"

/obj/structure/platform_decoration/rockcliff_deco/icycliff_deco
	icon_state = "icerock_deco"

/obj/structure/platform_decoration/metalplatform_deco
	icon_state = "metalplatform_deco"

/obj/structure/platform_decoration/adobe_deco
	icon_state = "adobe_deco"


/// Hybrisa Platforms

/obj/structure/platform/hybrisa
	icon_state = "hybrisa"

/obj/structure/platform_decoration/hybrisa
	icon_state = "hybrisa"

/obj/structure/platform/urban
	max_integrity = 120

/obj/structure/platform/urban/engineer
	icon_state = "engineer_platform"
	name = "凸起的金属边缘"
	desc =  "一个抬高的金属平台，常用于将区域抬高至其他区域之上，或建造桥梁。你或许可以爬上去。"

/obj/structure/platform_decoration/urban/engineer_corner
	name = "抬起的金属角"
	desc = "看起来像是一块凸起的金属边缘，常用于在非欧几里得二维空间中营造出高度错觉。但你并不知道这些，你只是个拿着步枪的太空人。"
	icon_state = "engineer_platform_deco"

/obj/structure/platform_decoration/urban/engineer_cornerbits
	name = "抬起的金属角"
	desc = "看起来像是一块凸起的金属边缘，常用于在非欧几里得二维空间中营造出高度错觉。但你并不知道这些，你只是个拿着步枪的太空人。"
	icon_state = "engineer_platform_platformcorners"


/obj/structure/platform/urban/rockdark
	icon_state = "kutjevo_rockdark"
	name = "凸起的岩石边缘"
	desc = "一堆石块和岩石，提供了充足的抓握和攀爬机会。表明高度变化。你或许可以爬上去。"

/obj/structure/platform_decoration/urban/rockdark
	name = "凸起的岩石角落"
	desc = "一堆石头和岩石，覆盖在一些恰好1米长、易于攀爬的齐胸高墙体的边缘。"
	icon_state = "kutjevo_rock_decodark"


/obj/structure/platform/urban/metalplatform1
	icon_state = "hybrisastone"
	name = "凸起的金属边缘"
	desc = "一个抬高的金属平台，通常用于将区域提升到其他区域之上。你或许可以爬上去。"

/obj/structure/platform_decoration/urban/metalplatformdeco1
	icon_state = "hybrisastone_deco"
	name = "抬起的金属角"
	desc = "一个抬高的金属平台，常用于将区域提升至其他区域之上。这是转角处。"

/obj/structure/platform_decoration/urban/metalplatformdeco2
	name = "抬起的金属角"
	desc = "一个抬高的金属平台，常用于将区域提升至其他区域之上。这是转角处。"
	icon_state = "strata_metalplatform_deco2"

/obj/structure/platform/urban/metalplatform2
	name = "凸起的金属边缘"
	desc = "一个抬高的金属平台，通常用于将区域提升至其他区域之上。你或许可以爬上去。"
	icon_state = "strata_metalplatform2"

/obj/structure/platform_decoration/urban/metalplatformdeco3
	name = "抬起的金属角"
	desc = "一个抬高的金属平台，常用于将区域提升至其他区域之上。这是转角处。"
	icon_state = "strata_metalplatform_deco3"

/obj/structure/platform/urban/metalplatform3
	name = "凸起的金属边缘"
	desc = "一个抬高的金属平台，通常用于将区域提升到其他区域之上。你或许可以爬上去。"
	icon_state = "strata_metalplatform3"

/obj/structure/platform/urban/metalplatform4
	icon_state = "hybrisaplatform"
	name = "抬升金属平台"
	desc = "一个抬高的金属平台，通常用于将区域提升至其他区域之上。你或许可以爬上去。"

/obj/structure/platform_decoration/urban/metalplatformdeco4
	icon_state = "hybrisaplatform_deco"
	name = "抬起的金属角"
	desc = "一个抬高的金属平台，通常用于将区域提升至其他区域之上。你或许可以爬上去。"

/obj/structure/platform/urban/metalplatform5
	icon_state = "hybrisaplatform2"
	name = "抬升金属平台"
	desc = "一个抬高的金属平台，通常用于将区域提升至其他区域之上。你或许可以爬上去。"

/obj/structure/platform_decoration/urban/metalplatformdeco5
	icon_state = "hybrisaplatform_deco2"
	name = "抬起的金属角"
	desc = "一个抬高的金属平台，通常用于将区域提升至其他区域之上。你或许可以爬上去。"

/obj/structure/platform/urban/metalplatform6
	icon_state = "hybrisaplatform3"
	name = "抬升金属平台"
	desc = "一个抬高的金属平台，通常用于将区域提升至其他区域之上。你或许可以爬上去。"

/obj/structure/platform/urban/metalplatformstair1
	icon_state = "hybrisaplatform_stair"
	name = "抬升金属平台"
	desc = "一个抬高的金属平台，通常用于将区域提升至其他区域之上。你或许可以爬上去。"

/obj/structure/platform/urban/metalplatformstair2
	icon_state = "hybrisaplatform_stair_alt"
	name = "抬升金属平台"
	desc = "一个抬高的金属平台，通常用于将区域提升到其他区域之上。你或许可以爬上去。"

/obj/structure/platform_decoration/urban/metalplatformdeco6
	icon_state = "hybrisaplatform_deco3"
	name = "抬起的金属角"
	desc = "一个抬高的金属平台，通常用于将区域提升到其他区域之上。你或许可以爬上去。"


/obj/structure/platform/mineral
	icon_state = "stone"

/obj/structure/platform_decoration/mineral
	icon_state = "stone_deco"

/obj/structure/platform/mineral/sandstone
	name = "砂岩平台"
	desc = "一个由砂岩构成的高台，侧面刻有看似古老的象形文字。"
	color = "#c6a480"

/obj/structure/platform/mineral/sandstone/runed
	name = "砂岩神庙平台"
	color = "#b29082"


/obj/structure/platform_decoration/mineral/sandstone
	name = "砂岩平台转角"
	desc = "一个由砂岩构成的平台角落，支撑着抬高的地面。侧面似乎刻有古老的象形文字。"
	color = "#c6a480"

/obj/structure/platform/shiva/catwalk
	icon_state = "shiva"
	name = "加厚橡胶绳平台"
	desc = "可靠的钢材与聚合物橡胶替代品。在寒冷天气下不会开裂。"

/obj/structure/platform_decoration/shiva/catwalk
	icon_state = "shiva_deco"
	name = "加厚橡胶绳平台"
	desc = "可靠的钢材与聚合物橡胶替代品。在寒冷天气下不会开裂。"

/obj/structure/platform_decoration/mineral/sandstone/runed
	name = "砂岩神庙平台转角"
	color = "#b29082"

