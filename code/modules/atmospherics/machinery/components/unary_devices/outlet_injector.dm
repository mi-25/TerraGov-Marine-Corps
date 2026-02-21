/obj/machinery/atmospherics/components/unary/outlet_injector
	icon_state = "inje_map-2"

	name = "空气注射器"
	desc = "装有阀门和泵。"

	use_power = IDLE_POWER_USE
	can_unwrench = FALSE
	shift_underlay_only = FALSE

	resistance_flags = UNACIDABLE

	var/injecting = 0

	var/volume_rate = 50

	var/id = null

	level = 1
	layer = GAS_SCRUBBER_LAYER

	pipe_state = "injector"


/obj/machinery/atmospherics/components/unary/outlet_injector/update_icon_nopipes()
	cut_overlays()
	if(showpipe)
		// everything is already shifted so don't shift the cap
		add_overlay(getpipeimage(icon, "inje_cap", initialize_directions))

	if(!nodes[1] || !on || !is_operational())
		icon_state = "inje_off"
	else
		icon_state = "inje_on"

/obj/machinery/atmospherics/components/unary/outlet_injector/power_change()
	var/old_stat = machine_stat
	..()
	if(old_stat != machine_stat)
		update_icon()


/obj/machinery/atmospherics/components/unary/outlet_injector/can_unwrench(mob/user)
	. = ..()
	if(. && on && is_operational())
		to_chat(user, span_warning("你无法拆卸[src]，请先关闭它！"))
		return FALSE

// mapping

/obj/machinery/atmospherics/components/unary/outlet_injector/layer1
	piping_layer = 1
	icon_state = "inje_map-1"

/obj/machinery/atmospherics/components/unary/outlet_injector/layer3
	piping_layer = 2
	icon_state = "inje_map-2"

/obj/machinery/atmospherics/components/unary/outlet_injector/on
	on = TRUE

/obj/machinery/atmospherics/components/unary/outlet_injector/on/layer1
	piping_layer = 1
	icon_state = "inje_map-1"

/obj/machinery/atmospherics/components/unary/outlet_injector/on/layer3
	piping_layer = 2
	icon_state = "inje_map-2"

/obj/machinery/atmospherics/components/unary/outlet_injector/atmos
	on = TRUE
	volume_rate = 200

/obj/machinery/atmospherics/components/unary/outlet_injector/atmos/atmos_waste
	name = "大气废物排放注入器"

/obj/machinery/atmospherics/components/unary/outlet_injector/atmos/engine_waste
	name = "引擎排气口喷射器"

/obj/machinery/atmospherics/components/unary/outlet_injector/atmos/toxin_input
	name = "等离子体罐输入喷射器"

/obj/machinery/atmospherics/components/unary/outlet_injector/atmos/oxygen_input
	name = "氧气罐输入注入器"

/obj/machinery/atmospherics/components/unary/outlet_injector/atmos/nitrogen_input
	name = "氮气罐输入注入器"

/obj/machinery/atmospherics/components/unary/outlet_injector/atmos/mix_input
	name = "混合罐输入注射器"

/obj/machinery/atmospherics/components/unary/outlet_injector/atmos/nitrous_input
	name = "一氧化二氮罐输入注射器"

/obj/machinery/atmospherics/components/unary/outlet_injector/atmos/air_input
	name = "空气混合罐输入注入器"

/obj/machinery/atmospherics/components/unary/outlet_injector/atmos/carbon_input
	name = "二氧化碳罐输入注入器"

/obj/machinery/atmospherics/components/unary/outlet_injector/atmos/incinerator_input
	name = "焚化室输入注入器"

/obj/machinery/atmospherics/components/unary/outlet_injector/atmos/toxins_mixing_input
	name = "毒素混合输入注射器"
