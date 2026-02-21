/obj/machinery/atmospherics/components/trinary/filter
	icon_state = "filter_off"
	density = FALSE

	name = "气体过滤器"
	desc = "非常适用于过滤气体。"

	can_unwrench = FALSE

	var/target_pressure = ONE_ATMOSPHERE
	var/filter_type = null

	construction_type = /obj/item/pipe/trinary/flippable
	pipe_state = "filter"


/obj/machinery/atmospherics/components/trinary/filter/update_overlays()
	. = ..()

	for(var/direction in GLOB.cardinals)
		if(!(direction & initialize_directions))
			continue
		var/obj/machinery/atmospherics/node = findConnecting(direction)

		var/image/cap
		if(node)
			cap = getpipeimage(icon, "cap", direction, node.pipe_color, piping_layer = piping_layer)
		else
			cap = getpipeimage(icon, "cap", direction, piping_layer = piping_layer)

		. += cap

	return ..()

/obj/machinery/atmospherics/components/trinary/filter/update_icon_nopipes()
	var/on_state = on && nodes[1] && nodes[2] && nodes[3] && is_operational()
	icon_state = "filter_[on_state ? "on" : "off"][flipped ? "_f" : ""]"

/obj/machinery/atmospherics/components/trinary/filter/power_change()
	var/old_stat = machine_stat
	..()
	if(machine_stat != old_stat)
		update_icon()

/obj/machinery/atmospherics/components/trinary/filter/can_unwrench(mob/user)
	. = ..()
	if(. && on && is_operational())
		to_chat(user, span_warning("你无法拆卸[src]，请先关闭它！"))
		return FALSE

// mapping

/obj/machinery/atmospherics/components/trinary/filter/layer1
	piping_layer = 1
	icon_state = "filter_off_map-1"
/obj/machinery/atmospherics/components/trinary/filter/layer3
	piping_layer = 3
	icon_state = "filter_off_map-3"

/obj/machinery/atmospherics/components/trinary/filter/on
	on = TRUE
	icon_state = "filter_on"

/obj/machinery/atmospherics/components/trinary/filter/on/layer1
	piping_layer = 1
	icon_state = "filter_on_map-1"
/obj/machinery/atmospherics/components/trinary/filter/on/layer3
	piping_layer = 3
	icon_state = "filter_on_map-3"

/obj/machinery/atmospherics/components/trinary/filter/flipped
	icon_state = "filter_off_f"
	flipped = TRUE

/obj/machinery/atmospherics/components/trinary/filter/flipped/layer1
	piping_layer = 1
	icon_state = "filter_off_f_map-1"
/obj/machinery/atmospherics/components/trinary/filter/flipped/layer3
	piping_layer = 3
	icon_state = "filter_off_f_map-3"

/obj/machinery/atmospherics/components/trinary/filter/flipped/on
	on = TRUE
	icon_state = "filter_on_f"

/obj/machinery/atmospherics/components/trinary/filter/flipped/on/layer1
	piping_layer = 1
	icon_state = "filter_on_f_map-1"
/obj/machinery/atmospherics/components/trinary/filter/flipped/on/layer3
	piping_layer = 3
	icon_state = "filter_on_f_map-3"

/obj/machinery/atmospherics/components/trinary/filter/atmos //Used for atmos waste loops
	on = TRUE
	icon_state = "filter_on"
/obj/machinery/atmospherics/components/trinary/filter/atmos/n2
	name = "氮气过滤器"
	filter_type = "n2"
/obj/machinery/atmospherics/components/trinary/filter/atmos/o2
	name = "氧气过滤器"
	filter_type = "o2"
/obj/machinery/atmospherics/components/trinary/filter/atmos/co2
	name = "二氧化碳过滤器"
	filter_type = "co2"
/obj/machinery/atmospherics/components/trinary/filter/atmos/n2o
	name = "一氧化二氮过滤器"
	filter_type = "n2o"
/obj/machinery/atmospherics/components/trinary/filter/atmos/plasma
	name = "等离子体过滤器"
	filter_type = "plasma"

/obj/machinery/atmospherics/components/trinary/filter/atmos/flipped //This feels wrong, I know
	icon_state = "filter_on_f"
	flipped = TRUE
/obj/machinery/atmospherics/components/trinary/filter/atmos/flipped/n2
	name = "氮气过滤器"
	filter_type = "n2"
/obj/machinery/atmospherics/components/trinary/filter/atmos/flipped/o2
	name = "氧气过滤器"
	filter_type = "o2"
/obj/machinery/atmospherics/components/trinary/filter/atmos/flipped/co2
	name = "二氧化碳过滤器"
	filter_type = "co2"
/obj/machinery/atmospherics/components/trinary/filter/atmos/flipped/n2o
	name = "一氧化二氮过滤器"
	filter_type = "n2o"
/obj/machinery/atmospherics/components/trinary/filter/atmos/flipped/plasma
	name = "等离子体过滤器"
	filter_type = "plasma"
