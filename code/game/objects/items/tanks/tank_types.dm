/* Types of tanks!
* Contains:
*		Oxygen
*		Anesthetic
*		Air
*		Phoron
*		Emergency Oxygen
*/

/*
* Oxygen
*/
/obj/item/tank/oxygen
	name = "氧气罐"
	desc = "一罐氧气。"
	icon_state = "oxygen"
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD
	gas_type = GAS_TYPE_OXYGEN



/obj/item/tank/oxygen/yellow
	desc = "一罐氧气，这个是黄色的。"
	icon_state = "oxygen_f"

/obj/item/tank/oxygen/red
	desc = "一罐氧气，这个是红色的。"
	icon_state = "oxygen_fr"


/*
* Anesthetic
*/
/obj/item/tank/anesthetic
	name = "麻醉气罐"
	desc = "装有 N2O/O2 混合气体的储罐。"
	icon_state = "anesthetic"
	worn_icon_state = "anesthetic"
	gas_type = GAS_TYPE_N2O


/*
* Air
*/
/obj/item/tank/air
	name = "气罐"
	desc = "有人混编吗？"
	icon_state = "oxygen"


/*
* Phoron
*/
/obj/item/tank/phoron
	name = "等离子体罐"
	desc = "内含危险等离子体。请勿吸入。警告：极度易燃。"
	icon_state = "phoron"
	atom_flags = CONDUCT
	equip_slot_flags = NONE	//they have no straps!



/*
* Emergency Oxygen
*/
/obj/item/tank/emergency_oxygen
	name = "应急氧气罐"
	desc = "用于紧急情况。内含氧气极少，请尽量节省使用，直到真正需要时。"
	icon_state = "emergency"
	atom_flags = CONDUCT
	equip_slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_TINY
	force = 4
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD
	volume = 2 //Tiny. Real life equivalents only have 21 breaths of oxygen in them. They're EMERGENCY tanks anyway -errorage (dangercon 2011)
	gas_type = GAS_TYPE_OXYGEN
	pressure = 3*ONE_ATMOSPHERE
	pressure_full = 3*ONE_ATMOSPHERE


/obj/item/tank/emergency_oxygen/examine(mob/user)
	. = ..()
	if(pressure < 50 && loc==user)
		. += span_danger("The meter on [src] indicates you are almost out of air!")
		SEND_SOUND(user, sound('sound/effects/alert.ogg'))

/obj/item/tank/emergency_oxygen/engi
	name = "扩容应急氧气罐"
	icon_state = "emergency_engi"
	volume = 6
	pressure = 5*ONE_ATMOSPHERE
	pressure_full = 5*ONE_ATMOSPHERE

/obj/item/tank/emergency_oxygen/double
	name = "双联应急氧气罐"
	icon_state = "emergency_double"
	volume = 10
	pressure = 5*ONE_ATMOSPHERE
	pressure_full = 5*ONE_ATMOSPHERE

/*
* Nitrogen
*/
/obj/item/tank/nitrogen
	name = "氮气罐"
	desc = "一罐氮气。"
	icon_state = "oxygen_fr"
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD
	gas_type = GAS_TYPE_NITROGEN

