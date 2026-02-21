/obj/machinery/mining
	icon = 'icons/obj/mining_drill.dmi'
	anchored = FALSE
	use_power = 0 //The drill takes power directly from a cell.
	density = TRUE
	layer = ABOVE_MOB_LAYER //So it draws over mobs in the tile north of it.

/obj/machinery/mining/drill
	name = "矿钻钻头"
	desc = "一台巨大的钻机。"
	icon_state = "mining_drill"

/obj/machinery/mining/drill/braced
	anchored = TRUE
	icon_state = "mining_drill_braced"

/obj/machinery/mining/brace
	name = "矿钻支架"
	desc = "工业钻机的机械支架。看起来足有两英尺厚。"
	icon_state = "mining_brace"

/obj/machinery/mining/brace/active
	name = "主动式采矿钻机支架"
	icon_state = "mining_brace_active"
	anchored = TRUE
	
