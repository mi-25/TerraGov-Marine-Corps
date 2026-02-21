GLOBAL_LIST_EMPTY(elevator_doors)

/obj/machinery/door/window/elevator
	name = "电梯门"
	desc = "防止像你这样的白痴掉进敞开的电梯井里。"
	icon_state = "left"
	base_state = "left"

/obj/machinery/door/window/elevator/right
	icon_state = "right"
	base_state = "right"

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/door/window/elevator/left, 0)
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/door/window/elevator/right, 0)
