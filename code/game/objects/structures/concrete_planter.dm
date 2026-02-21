/obj/structure/concrete_planter
	name = "混凝土固定式种植槽"
	desc = "一个装饰性的混凝土花盆。"
	icon = 'icons/obj/structures/prop/concrete_planter.dmi'
	icon_state = "planter"
	density = TRUE
	resistance_flags = XENO_DAMAGEABLE
	allow_pass_flags = PASS_LOW_STRUCTURE|PASSABLE|PASS_WALKOVER
	coverage = 80

/obj/structure/concrete_planter/Initialize(mapload)
	. = ..()
	setDir(dir)
	var/static/list/connections = list(
		COMSIG_OBJ_TRY_ALLOW_THROUGH = PROC_REF(can_climb_over),
	)
	AddElement(/datum/element/connect_loc, connections)

/obj/structure/concrete_planter/setDir(newdir)
	. = ..()
	if(dir & (EAST|WEST))
		pixel_x = -4
		bound_width = 32
		bound_height = 64
	else
		pixel_y = -7
		bound_width = 64
		bound_height = 32

/obj/structure/concrete_planter/seat
	name = "混凝土固定式种植槽"
	desc = "一个装饰性的混凝土花盆，附带座位。座椅采用合成皮革包裹，随着时间流逝已经褪色。"
	icon_state = "planter_seats"

/obj/structure/concrete_planter/double_seat
	name = "混凝土固定式种植槽"
	desc = "一个装饰性的混凝土花盆，两侧都附有座位。座椅采用合成皮革制成，随着时间的推移已经褪色。"
	icon_state = "planter_double_seats"
