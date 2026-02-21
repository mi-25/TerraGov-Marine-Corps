/obj/vehicle/sealed/mecha/combat/phazon
	desc = "这是一台法扎恩动力外骨骼。这是纳米传讯科学研究的巅峰与骄傲，它采用了最前沿的蓝空科技和昂贵的材料。"
	name = "\improper 法扎"
	icon_state = "phazon"
	base_icon_state = "phazon"
	move_delay = 2
	dir_in = 2 //Facing South.
	step_energy_drain = 3
	max_integrity = 200
	soft_armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 30, BIO = 0, FIRE = 100, ACID = 100)
	max_temperature = 25000
	wreckage = /obj/structure/mecha_wreckage/phazon
	mech_type = EXOSUIT_MODULE_PHAZON
	force = 15
	max_equip_by_category = list(
		MECHA_UTILITY = 1,
		MECHA_POWER = 1,
		MECHA_ARMOR = 2,
	)
	phase_state = "phazon-phase"

/obj/vehicle/sealed/mecha/combat/phazon/generate_actions()
	. = ..()
	initialize_passenger_action_type(/datum/action/vehicle/sealed/mecha/mech_toggle_phasing)
	initialize_passenger_action_type(/datum/action/vehicle/sealed/mecha/mech_switch_damtype)

/datum/action/vehicle/sealed/mecha/mech_switch_damtype
	name = "重新配置手臂微工具阵列"
	action_icon_state = "mech_damtype_brute"

/datum/action/vehicle/sealed/mecha/mech_switch_damtype/action_activate(trigger_flags)
	if(!owner || !chassis || !(owner in chassis.occupants))
		return
	var/new_damtype
	switch(chassis.damtype)
		if(TOX)
			new_damtype = BRUTE
			chassis.balloon_alert(owner, "你的拳击现在会造成钝击伤害")
		if(BRUTE)
			new_damtype = BURN
			chassis.balloon_alert(owner, "你的拳击现在会造成灼烧伤害")
		if(BURN)
			new_damtype = TOX
			chassis.balloon_alert(owner,"你的拳击现在会造成毒素伤害")
	chassis.damtype = new_damtype
	action_icon_state = "mech_damtype_[new_damtype]"
	playsound(chassis, 'sound/mecha/mechmove01.ogg', 50, TRUE)
	update_button_icon()

/datum/action/vehicle/sealed/mecha/mech_toggle_phasing
	name = "切换相位"
	action_icon_state = "mech_phasing_off"

/datum/action/vehicle/sealed/mecha/mech_toggle_phasing/action_activate(trigger_flags)
	if(!owner || !chassis || !(owner in chassis.occupants))
		return
	chassis.phasing = chassis.phasing ? "" : "phasing"
	action_icon_state = "mech_phasing_[chassis.phasing ? "on" : "off"]"
	chassis.balloon_alert(owner, "[chassis.phasing ? "enabled" : "disabled"] phasing")
	update_button_icon()
