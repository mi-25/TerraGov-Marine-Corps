
/obj/structure/supply_drop
	name = "补给投放板"
	desc = "将未固定的补给放在此处，以便舰桥监控军官将其投放到人员头顶。"
	icon = 'icons/turf/decals.dmi'
	icon_state = "stripe_box_thick"
	anchored = TRUE
	density = FALSE
	resistance_flags = RESIST_ALL
	layer = ABOVE_NORMAL_TURF_LAYER
	faction = FACTION_TERRAGOV

/obj/structure/supply_drop/Initialize(mapload)
	. = ..()
	GLOB.supply_pad_list += src

/obj/structure/supply_drop/Destroy()
	GLOB.supply_pad_list -= src
	return ..()

