/obj/item/mecha_parts/mecha_equipment/armor/booster
	name = "中型助推器"
	desc = "决定冲刺速度和力量。平衡选项。将冲刺消耗设为200，冲刺距离设为3，每步冲刺消耗设为50。"
	icon_state = "armor_melee"
	iconstate_name = "armor_melee"
	protect_name = "Medium Booster"
	mech_flags = EXOSUIT_MODULE_GREYSCALE|EXOSUIT_MODULE_VENDABLE
	armor_mod = list()
	slowdown = 0
	weight = 65
	///move delay we remove from the mech when sprinting with actuator overload
	var/speed_mod = 1
	/// How much energy we use when we dash
	var/dash_consumption = 200
	/// How many tiles our dash carries us
	var/dash_range = 3
	/// how much energy we use per step when boosting
	var/boost_consumption = 55
	///cooldown between dash activations
	var/dash_cooldown = 4 SECONDS

/obj/item/mecha_parts/mecha_equipment/armor/booster/attach(obj/vehicle/sealed/mecha/M, attach_right)
	. = ..()
	chassis.overload_step_energy_drain_min = boost_consumption
	chassis.leg_overload_coeff = 0 // forces min usage
	chassis.dash_power_consumption = dash_consumption
	chassis.dash_range = dash_range
	chassis.speed_mod = speed_mod
	chassis.dash_cooldown = dash_cooldown

/obj/item/mecha_parts/mecha_equipment/armor/booster/detach(atom/moveto)
	chassis.overload_step_energy_drain_min = initial(chassis.overload_step_energy_drain_min)
	chassis.leg_overload_coeff = initial(chassis.leg_overload_coeff)
	chassis.dash_power_consumption = initial(chassis.dash_power_consumption)
	chassis.dash_range = initial(chassis.dash_range)
	chassis.speed_mod = 0
	chassis.dash_cooldown = initial(chassis.dash_cooldown)
	return ..()


/obj/item/mecha_parts/mecha_equipment/armor/booster/lightweight
	name = "轻型助推器"
	desc = "决定冲刺速度和力量。轻量化选项。将冲刺消耗设为300，冲刺距离设为4，每步冲刺消耗设为25。提供约一半的速度加成。"
	icon_state = "armor_acid"
	iconstate_name = "armor_acid"
	protect_name = "Lightweight Booster"
	weight = 30
	dash_consumption = 300
	speed_mod = 0.5
	dash_range = 5
	boost_consumption = 35
	dash_cooldown = 7 SECONDS

/obj/item/mecha_parts/mecha_equipment/generator/greyscale
	name = "等离子体引擎"
	desc = "一款为地球政府殖民地海军陆战队先进机甲外骨骼设计的先进纳米传讯等离子体引擎核心原型。针对能量存储进行了优化。"
	icon_state = "phoron_engine"
	mech_flags = EXOSUIT_MODULE_GREYSCALE|EXOSUIT_MODULE_VENDABLE
	rechargerate = 0
	slowdown = 0
	max_fuel = 0
	weight = 180
	/// cell type to attach. this does the actual passive energy regen, if we have it
	var/cell_type = /obj/item/cell/mecha

/obj/item/mecha_parts/mecha_equipment/generator/greyscale/attach(obj/vehicle/sealed/mecha/M, attach_right)
	. = ..()
	M.add_cell(new cell_type)

/obj/item/mecha_parts/mecha_equipment/generator/greyscale/detach(atom/moveto)
	chassis.add_cell() //replaces with a standard high cap that does not have built in recharge
	return ..()

/obj/item/mecha_parts/mecha_equipment/generator/greyscale/heavy
	name = "聚变引擎"
	desc = "一个高度实验性的等离子体聚变核心。专为能量生成优化。"
	icon_state = "phoron_engine_adv"
	weight = 110
	cell_type = /obj/item/cell/mecha/medium

/obj/item/mecha_parts/mecha_equipment/melee_core
	name = "近战核心"
	desc = "一个蓝空间猎户座-斯佩尔科夫转换器。通过你懒得去理解的科学原理，它能让机甲更快，并使它们的武器能够汲取更多能量，从而更具威胁性。然而，其代价是无法使用弹道和激光武器。"
	icon_state = "melee_core"
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	equipment_slot = MECHA_UTILITY

/obj/item/mecha_parts/mecha_equipment/melee_core/attach(obj/vehicle/sealed/mecha/M, attach_right)
	. = ..()
	ADD_TRAIT(M, TRAIT_MELEE_CORE, REF(src))

/obj/item/mecha_parts/mecha_equipment/melee_core/detach(atom/moveto)
	REMOVE_TRAIT(chassis, TRAIT_MELEE_CORE, REF(src))
	return ..()


/obj/item/mecha_parts/mecha_equipment/ability
	name = "通用机甲能力"
	desc = "你不应该看到这个"
	equipment_slot = MECHA_UTILITY
	///if given, a single flag of who we want this ability to be granted to
	var/flag_controller = NONE
	///typepath of ability we want to grant
	var/ability_to_grant

/obj/item/mecha_parts/mecha_equipment/ability/attach(obj/vehicle/sealed/mecha/M, attach_right)
	. = ..()
	if(flag_controller)
		M.initialize_controller_action_type(ability_to_grant, flag_controller)
	else
		M.initialize_passenger_action_type(ability_to_grant)

/obj/item/mecha_parts/mecha_equipment/ability/detach(atom/moveto)
	if(flag_controller)
		chassis.destroy_controller_action_type(ability_to_grant, flag_controller)
	else
		chassis.destroy_passenger_action_type(ability_to_grant)
	return ..()

/obj/item/mecha_parts/mecha_equipment/ability/zoom
	name = "增强缩放"
	desc = "一个放大模块，能让驾驶员看得比标准光学设备远得多。不包含夜视功能。"
	icon_state = "zoom"
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	ability_to_grant = /datum/action/vehicle/sealed/mecha/mech_zoom

/obj/item/mecha_parts/mecha_equipment/ability/smoke
	name = "通用烟雾模块"
	ability_to_grant = /datum/action/vehicle/sealed/mecha/mech_smoke
	///smoke type to spawn when this ability is activated
	var/smoke_type
	///size of smoke cloud that spawns
	var/size = 6
	///duration of smoke cloud that spawns
	var/duration = 8

/obj/item/mecha_parts/mecha_equipment/ability/smoke/attach(obj/vehicle/sealed/mecha/M, attach_right)
	. = ..()
	var/datum/effect_system/smoke_spread/smoke = new smoke_type
	smoke.set_up(size, M, duration)
	smoke.attach(M)
	M.smoke_system = smoke
	M.smoke_charges = initial(M.smoke_charges)

/obj/item/mecha_parts/mecha_equipment/ability/smoke/detach(atom/moveto)
	var/datum/effect_system/smoke_spread/bad/oldsmoke = new
	oldsmoke.set_up(3, chassis)
	oldsmoke.attach(chassis)
	chassis.smoke_system = oldsmoke
	return ..()

/obj/item/mecha_parts/mecha_equipment/ability/smoke/tanglefoot
	name = "缠足发生器"
	desc = "一种能够释放大量非致命性气体的缠足烟雾发生器，会吸干任何接触到的异形生物的能量。"
	icon_state = "tfoot_gas"
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	ability_to_grant = /datum/action/vehicle/sealed/mecha/mech_smoke
	smoke_type = /datum/effect_system/smoke_spread/plasmaloss

/obj/item/mecha_parts/mecha_equipment/ability/smoke/cloak_smoke
	name = "烟雾发生器"
	desc = "一种多管发射模块，能产生大量遮蔽烟雾来掩护附近的友军。可惜的是，巨大的机器人用它来隐藏还是太困难了。"
	icon_state = "smoke_gas"
	mech_flags = EXOSUIT_MODULE_GREYSCALE
	ability_to_grant = /datum/action/vehicle/sealed/mecha/mech_smoke
	smoke_type = /datum/effect_system/smoke_spread/tactical

/obj/item/mecha_parts/mecha_equipment/ability/assault_armor
	name = "突击护甲"
	desc = "一个激光核心，允许核心净化时在机甲周围发射激光爆发。充能时会减慢机甲速度。"
	weight = 80
	icon_state = "assaultarmor"
	mech_flags = EXOSUIT_MODULE_GREYSCALE|EXOSUIT_MODULE_VENDABLE
	ability_to_grant = /datum/action/vehicle/sealed/mecha/assault_armor

/obj/item/mecha_parts/mecha_equipment/ability/cloak
	name = "隐形模块"
	desc = "机甲隐形装置。隐形时无法开火，且隐形会消耗能量。"
	weight = 70
	icon_state = "cloak"
	mech_flags = EXOSUIT_MODULE_GREYSCALE|EXOSUIT_MODULE_VENDABLE
	ability_to_grant = /datum/action/vehicle/sealed/mecha/cloak

/obj/item/mecha_parts/mecha_equipment/ability/overboost
	name = "过载模块"
	desc = "机甲过载推进装置。允许超载腿部蓄能器向指定方向冲刺，击退被机甲撞到的任何人。"
	weight = 70
	icon_state = "overboost"
	mech_flags = EXOSUIT_MODULE_GREYSCALE|EXOSUIT_MODULE_VENDABLE
	ability_to_grant = /datum/action/vehicle/sealed/mecha/overboost

/obj/item/mecha_parts/mecha_equipment/ability/pulsearmor
	name = "脉冲护甲模块"
	desc = "一个机甲模块，激活时会产生一个缓慢衰减的护盾。激活需要消耗能量。"
	weight = 70
	icon_state = "pulsearmor"
	mech_flags = EXOSUIT_MODULE_GREYSCALE|EXOSUIT_MODULE_VENDABLE
	ability_to_grant = /datum/action/vehicle/sealed/mecha/pulsearmor
