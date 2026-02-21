
/obj/structure/fluff/tram_rail
	name = "电车导轨"
	desc = "适合电车，不适合滑冰。"
	icon = 'icons/obj/tram/tram_rails.dmi'
	icon_state = "rail"
	layer = TRAM_RAIL_LAYER
	plane = FLOOR_PLANE
	resistance_flags =  ALL
	obj_flags = NONE

/obj/structure/fluff/tram_rail/floor
	name = "有轨电车导轨防护罩"
	icon_state = "rail_floor"

/obj/structure/fluff/tram_rail/end
	icon_state = "railend"

/obj/structure/fluff/tram_rail/electric
	desc = "适合有轨电车，不适合滑板。这是一条动力导轨。"

/obj/structure/fluff/tram_rail/anchor
	name = "电车轨道锚"
	icon_state = "anchor"

/obj/structure/fluff/tram_rail/electric/anchor
	name = "电车轨道锚"
	icon_state = "anchor"

/obj/structure/fluff/tram_rail/electric/attack_hand(mob/living/user, list/modifiers)
	if(user.electrocute_act(75, src))
		do_sparks(5, TRUE, src)
