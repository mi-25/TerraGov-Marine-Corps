//this machine does nothing
/obj/machinery/disease2/diseaseanalyser
	name = "疾病分析仪"
	icon = 'icons/obj/machines/virology.dmi'
	icon_state = "analyser"
	anchored = TRUE
	density = TRUE


/obj/machinery/computer/pandemic
	name = "泛用型疾病检测与流行病控制 2200"
	density = TRUE
	anchored = TRUE
	icon = 'icons/obj/machines/chemical_machines.dmi'
	icon_state = "mixer0"
	layer = BELOW_OBJ_LAYER
	circuit = /obj/item/circuitboard/computer/pandemic
