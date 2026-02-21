/obj/machinery/factory
	name = "通用根加热器"
	desc = "你不应该看到这个。"
	icon = 'icons/obj/factory/factory_machines.dmi'
	icon_state = "heater_inactive"
	density = TRUE
	anchored = FALSE // start off unanchored so its easier to move
	resistance_flags = XENO_DAMAGEABLE
	atom_flags = PREVENT_CONTENTS_EXPLOSION
	///process type we will use to determine what step of the production process this machine will do
	var/process_type = FACTORY_MACHINE_HEATER
	///Time in ticks that this machine takes to process one item
	var/cooldown_time = 1 SECONDS
	///Curent item being processed
	var/obj/item/factory_part/held_item
	///Icon state displayed while something is being processed in the machine
	var/processiconstate = "heater"
	COOLDOWN_DECLARE(process_cooldown)

/obj/machinery/factory/Initialize(mapload)
	. = ..()
	add_overlay(image(icon, "direction_arrow"))

/obj/machinery/factory/Destroy()
	QDEL_NULL(held_item)
	return ..()

/obj/machinery/factory/examine(mob/user, distance, infix, suffix)
	. = ..()
	. += "It is currently facing [dir2text(dir)] and [anchored ? "" : "un"]secured."
	. += "Processes one package every [cooldown_time / 10] seconds."

/obj/machinery/factory/wrench_act(mob/living/user, obj/item/I)
	anchored = !anchored
	balloon_alert(user, "[anchored ? "" : "un"]anchored")
	playsound(loc, 'sound/items/ratchet.ogg', 25, 1)

/obj/machinery/factory/screwdriver_act(mob/living/user, obj/item/I)
	setDir(turn(dir, 90))
	balloon_alert(user, "面向[dir2text(dir)]")

/obj/machinery/factory/Bumped(atom/movable/bumper)
	. = ..()
	if(!isitem(bumper))
		return
	if(!(bumper.dir & dir))//need to be bumping into the back
		return
	if(!anchored)
		return
	if(!isfactorypart(bumper))
		bumper.forceMove(get_step(src, pick(GLOB.alldirs)))//just find a random tile and throw it there to stop it from clogging
		return
	if(!COOLDOWN_FINISHED(src, process_cooldown))
		return
	bumper.forceMove(src)
	held_item = bumper
	COOLDOWN_START(src, process_cooldown, cooldown_time)
	if(processiconstate && icon_state != processiconstate)//avoid resetting the animation
		icon_state = processiconstate
	addtimer(CALLBACK(src, PROC_REF(finish_process)), cooldown_time)

///Once the timer for processing is over this resets the machine and spits out the new result
/obj/machinery/factory/proc/finish_process()
	var/turf/target = get_step(src, dir)
	held_item.forceMove(target)
	if(held_item.next_machine == process_type)
		held_item.advance_stage()
	if(!locate(held_item.type) in get_step(src, REVERSE_DIR(dir)))
		icon_state = initial(icon_state)

	held_item = null

/obj/machinery/factory/heater
	name = "工业加热器"
	desc = "工业级加热器"

/obj/machinery/factory/flatter
	name = "工业压平机"
	desc = "工业级平板"
	icon_state = "flatter_inactive"
	processiconstate = "flatter"
	process_type = FACTORY_MACHINE_FLATTER

/obj/machinery/factory/cutter
	name = "工业切割器"
	desc = "工业级切割器"
	icon_state = "cutter_inactive"
	processiconstate = "cutter"
	process_type = FACTORY_MACHINE_CUTTER

/obj/machinery/factory/former
	name = "工业型"
	desc = "工业级成型机"
	icon_state = "former_inactive"
	processiconstate = "former"
	process_type = FACTORY_MACHINE_FORMER

/obj/machinery/factory/reconstructor
	name = "原子重构器"
	desc = "工业级成型机"
	icon_state = "reconstructor_inactive"
	processiconstate = "reconstructor"
	process_type = FACTORY_MACHINE_CONSTRUCTOR

/obj/machinery/factory/driller
	name = "工业钻机"
	desc = "工业级钻机"
	icon_state = "driller_inactive"
	processiconstate = "driller"
	process_type = FACTORY_MACHINE_DRILLER

/obj/machinery/factory/galvanizer
	name = "工业电镀机"
	desc = "工业级电镀机"
	icon_state = "galvanizer_inactive"
	processiconstate = "galvanizer"
	process_type = FACTORY_MACHINE_GALVANIZER

/obj/machinery/factory/compressor
	name = "工业压缩机"
	desc = "工业级压缩机"
	icon_state = "compressor_inactive"
	processiconstate = "compressor"
	process_type = FACTORY_MACHINE_COMPRESSOR
