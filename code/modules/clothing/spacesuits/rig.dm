//Regular rig suits
/obj/item/clothing/head/helmet/space/rig
	name = "硬质护甲头盔"
	desc = "专为在危险低压环境中工作而设计的特殊头盔。"
	icon_state = "rig-civilian"
	soft_armor = list(MELEE = 40, BULLET = 5, LASER = 20, ENERGY = 5, BOMB = 35, BIO = 100, FIRE = 5, ACID = 5)
	allowed = list(/obj/item/flashlight)
	var/brightness_on = 4 //luminosity when on
	var/on = FALSE
	actions_types = list(/datum/action/item_action/toggle)
	heat_protection_flags = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/space/rig/attack_self(mob/user)
	if(!isturf(user.loc))
		to_chat(user, "在[user.loc]中时无法打开灯")
		return
	on = !on

	if(on)
		set_light(brightness_on,brightness_on)
		icon_state = "[initial(icon_state)]_light"
	else
		set_light(0)
		icon_state = initial(icon_state)

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_head()

	update_action_button_icons()

/obj/item/clothing/suit/space/rig
	name = "硬质护甲"
	desc = "专为超越真空环境的危险环境设计的特殊太空服。提供比标准太空服更强的防护。"
	icon_state = "rig-civilian"
	slowdown = 1
	soft_armor = list(MELEE = 40, BULLET = 5, LASER = 20, ENERGY = 5, BOMB = 35, BIO = 100, FIRE = 5, ACID = 5)
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit)
	heat_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE

//Engineering rig
/obj/item/clothing/head/helmet/space/rig/engineering
	name = "工程硬质防护服头盔"
	desc = "专为在危险低压环境中工作设计的特殊头盔。具备辐射防护功能。"
	icon_state = "rig-engineering"
	soft_armor = list(MELEE = 40, BULLET = 5, LASER = 20, ENERGY = 5, BOMB = 35, BIO = 100, FIRE = 5, ACID = 5)

/obj/item/clothing/suit/space/rig/engineering
	name = "工程硬质防护服"
	desc = "一套特殊防护服，可抵御危险的低压环境。具备辐射屏蔽功能。"
	icon_state = "rig-engineering"
	slowdown = 1
	soft_armor = list(MELEE = 40, BULLET = 5, LASER = 20, ENERGY = 5, BOMB = 35, BIO = 100, FIRE = 5, ACID = 5)
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/storage/bag/ore,/obj/item/t_scanner,/obj/item/tool/pickaxe, /obj/item/tool/rcd)

//Chief Engineer's rig
/obj/item/clothing/head/helmet/space/rig/engineering/chief
	name = "高级硬质护甲头盔"
	desc = "专为在危险低压环境中作业设计的高级头盔。表面高度抛光，闪耀光泽。"
	icon_state = "rig-white"

/obj/item/clothing/suit/space/rig/engineering/chief
	icon_state = "rig-white"
	name = "高级硬质护甲"
	desc = "一套能在危险低压环境中提供防护的先进防护服。表面抛光处理，光泽明亮。"

//Mining rig
/obj/item/clothing/head/helmet/space/rig/mining
	name = "采矿硬质头盔"
	desc = "专为在危险低压环境中工作而设计的特殊头盔。配有加固护板。"
	icon_state = "rig-mining"
	soft_armor = list(MELEE = 50, BULLET = 5, LASER = 20, ENERGY = 5, BOMB = 55, BIO = 100, FIRE = 5, ACID = 5)

/obj/item/clothing/suit/space/rig/mining
	icon_state = "rig-mining"
	name = "采矿硬质防护服"
	desc = "一套能在危险低压环境中提供防护的特制防护服。配有加固护甲板。"
	soft_armor = list(MELEE = 50, BULLET = 5, LASER = 20, ENERGY = 5, BOMB = 55, BIO = 100, FIRE = 5, ACID = 5)
	allowed = list(/obj/item/flashlight,/obj/item/tank/emergency_oxygen,/obj/item/suit_cooling_unit,/obj/item/weapon/twohanded/sledgehammer)
	equip_delay_self = 20
	unequip_delay_self = 20

//Syndicate rig
/obj/item/clothing/head/helmet/space/rig/syndi
	name = "血红色硬质护甲头盔"
	desc = "专为特种作战设计的先进头盔。戈莱克斯掠夺者所有。"
	icon_state = "rig-syndie"
	soft_armor = list(MELEE = 60, BULLET = 50, LASER = 30, ENERGY = 15, BOMB = 35, BIO = 100, FIRE = 15, ACID = 15)
	siemens_coefficient = 0.6


/obj/item/clothing/suit/space/rig/syndi
	icon_state = "rig-syndie"
	name = "血红色硬质护甲"
	desc = "一套在执行特种行动时提供防护的高级护甲。戈莱克斯掠夺者所有。"
	slowdown = 1
	w_class = WEIGHT_CLASS_NORMAL
	soft_armor = list(MELEE = 60, BULLET = 50, LASER = 30, ENERGY = 15, BOMB = 35, BIO = 100, FIRE = 15, ACID = 15)
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/baton,/obj/item/weapon/energy/sword,/obj/item/restraints/handcuffs)
	siemens_coefficient = 0.6


//Wizard Rig
/obj/item/clothing/head/helmet/space/rig/wizard
	name = "宝石镶嵌式硬质护甲头盔"
	desc = "一顶镶嵌着奇异宝石的头盔，散发着魔法能量。"
	icon_state = "rig-wiz"
	resistance_flags = UNACIDABLE
	soft_armor = list(MELEE = 40, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 35, BIO = 100, FIRE = 20, ACID = 20)
	siemens_coefficient = 0.7

/obj/item/clothing/suit/space/rig/wizard
	icon_state = "rig-wiz"
	name = "宝石镶嵌式硬质护甲"
	desc = "一件镶嵌着宝石的奇异套装，散发着魔法能量。"
	slowdown = 1
	w_class = WEIGHT_CLASS_NORMAL
	resistance_flags = UNACIDABLE
	soft_armor = list(MELEE = 40, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 35, BIO = 100, FIRE = 20, ACID = 20)
	siemens_coefficient = 0.7

//Medical Rig
/obj/item/clothing/head/helmet/space/rig/medical
	name = "医疗硬质头盔"
	desc = "专为在危险低压环境中工作而设计的特殊头盔。具有轻微的辐射防护能力。"
	icon_state = "rig-medical"
	soft_armor = list(MELEE = 30, BULLET = 5, LASER = 20, ENERGY = 5, BOMB = 25, BIO = 100, FIRE = 5, ACID = 5)

/obj/item/clothing/suit/space/rig/medical
	icon_state = "rig-medical"
	name = "医疗硬质防护服"
	desc = "一套特殊的防护服，可抵御危险的低压环境。提供轻微的辐射防护。"
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/storage/firstaid,/obj/item/healthanalyzer,/obj/item/stack/medical)
	soft_armor = list(MELEE = 30, BULLET = 5, LASER = 20, ENERGY = 5, BOMB = 25, BIO = 100, FIRE = 5, ACID = 5)

	//Security
/obj/item/clothing/head/helmet/space/rig/security
	name = "安全硬质头盔"
	desc = "专为在危险低压环境中工作而设计的特殊头盔。额外增加了一层装甲。"
	icon_state = "rig-sec"
	soft_armor = list(MELEE = 60, BULLET = 10, LASER = 30, ENERGY = 5, BOMB = 45, BIO = 100, FIRE = 5, ACID = 5)
	siemens_coefficient = 0.7

/obj/item/clothing/suit/space/rig/security
	icon_state = "rig-sec"
	name = "安保硬质护甲"
	desc = "一套特殊的防护服，能抵御危险的低压环境。额外增加了一层装甲。"
	soft_armor = list(MELEE = 60, BULLET = 10, LASER = 30, ENERGY = 5, BOMB = 45, BIO = 100, FIRE = 5, ACID = 5)
	allowed = list(/obj/item/weapon/gun,/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/weapon/baton)
	siemens_coefficient = 0.7


//Atmospherics Rig (BS12)
/obj/item/clothing/head/helmet/space/rig/atmos
	desc = "专为危险低压环境作业设计的特殊头盔。具备增强的热防护性能和轻微的辐射屏蔽能力。"
	name = "大气防护服头盔"
	icon_state = "rig-atmos"
	soft_armor = list(MELEE = 40, BULLET = 5, LASER = 20, ENERGY = 5, BOMB = 35, BIO = 100, FIRE = 5, ACID = 5)
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/space/rig/atmos
	desc = "一套特殊防护服，可抵御危险的低压环境。具备增强的热防护性能和轻微的辐射屏蔽能力。"
	icon_state = "rig-atmos"
	name = "大气防护服"
	soft_armor = list(MELEE = 40, BULLET = 5, LASER = 20, ENERGY = 5, BOMB = 35, BIO = 100, FIRE = 5, ACID = 5)
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
