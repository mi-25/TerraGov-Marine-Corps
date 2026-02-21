#define HOLDING (1<<0)
#define CONNECTED (1<<1)
#define EMPTY (1<<2)
#define LOW (1<<3)
#define MEDIUM (1<<4)
#define FULL (1<<5)
#define DANGER (1<<6)

/obj/machinery/portable_atmospherics/canister
	name = "储气罐"
	desc = "用于储存气体的罐体。"
	icon_state = "yellow"
	density = TRUE

	soft_armor = list(MELEE = 50, BULLET = 50, LASER = 50, ENERGY = 100, BOMB = 10, BIO = 100, FIRE = 80, ACID = 50)
	max_integrity = 250

	/// Used for determining if the sprite should be updated and how
	var/update_flags = NONE


/obj/machinery/portable_atmospherics/canister/nitrogen
	name = "n2 气罐"
	desc = "氮气。据称在某些方面有用。"
	icon_state = "red"

/obj/machinery/portable_atmospherics/canister/oxygen
	name = "氧气罐"
	desc = "氧气。人类生存的必需品。"
	icon_state = "blue"

/obj/machinery/portable_atmospherics/canister/air
	name = "气罐"
	desc = "预混空气。"
	icon_state = "grey"

/obj/machinery/portable_atmospherics/canister/phoron
	name = "等离子体罐"
	desc = "气态有毒等离子体。"
	icon_state = "orange"

/obj/machinery/portable_atmospherics/canister/nitrous_oxide
	name = "氧化亚氮气罐"
	desc = "压缩一氧化二氮。"
	icon_state = "redws"

/obj/machinery/portable_atmospherics/canister/co2
	name = "二氧化碳罐"
	desc = "二氧化碳，常用于提升异种引擎类型的发电功率。"
	icon_state = "black"

/obj/machinery/portable_atmospherics/canister/update_icon_state()
	. = ..()
	if(machine_stat & BROKEN)
		icon_state = "[icon_state]-1"


/obj/machinery/portable_atmospherics/canister/update_overlays()
	. = ..()
	if(machine_stat & BROKEN)
		return

	var/old_update_flags = update_flags
	update_flags = NONE

	if(holding)
		update_flags |= HOLDING
	if(connected_port)
		update_flags |= CONNECTED

	if(update_flags == old_update_flags)
		return
	if(update_flags & HOLDING)
		. += "can-open"
	if(update_flags & CONNECTED)
		. += "can-connector"
	if(update_flags & LOW)
		. += "can-o0"
		return
	if(update_flags & MEDIUM)
		. += "can-o1"
		return
	if(update_flags & FULL)
		. += "can-o2"
		return
	if(update_flags & DANGER)
		. += "can-o3"
		return


/obj/machinery/portable_atmospherics/canister/deconstruct(disassembled = TRUE, mob/living/blame_mob)
	if(!(atom_flags & NODECONSTRUCT))
		if(!(machine_stat & BROKEN))
			disconnect()
			machine_stat |= BROKEN
			density = FALSE
			playsound(src.loc, 'sound/effects/spray.ogg', 10, 1, -3)
			update_icon()
		if(disassembled)
			new /obj/item/stack/sheet/metal (loc, 10)
		else
			new /obj/item/stack/sheet/metal (loc, 5)
	return ..()

#undef HOLDING
#undef CONNECTED
#undef EMPTY
#undef LOW
#undef MEDIUM
#undef FULL
#undef DANGER
