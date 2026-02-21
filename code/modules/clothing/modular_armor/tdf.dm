//tdf modular armour

/obj/item/clothing/suit/modular/tdf
	name = "\improper 骑士级中型护甲"
	desc = "骑士中型战斗护甲是TDF步兵的标准配发护甲。提供良好防护，同时对使用者的机动性影响较小。Alt+点击移除已安装的配件。使用它来切换内置手电筒。"
	soft_armor = MARINE_ARMOR_MEDIUM
	icon = 'icons/mob/modular/tdf_armor.dmi'
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/modular/tdf_armor.dmi',
		slot_l_hand_str = 'icons/mob/inhands/clothing/suits_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/clothing/suits_right.dmi',
	)
	icon_state = "tdf_medium"
	worn_icon_state = "tdf_medium"
	slowdown = SLOWDOWN_ARMOR_MEDIUM

	attachments_allowed = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/module/valkyrie_autodoc,
		/obj/item/armor_module/module/fire_proof,
		/obj/item/armor_module/module/tyr_extra_armor,
		/obj/item/armor_module/module/tyr_extra_armor/mark1,
		/obj/item/armor_module/module/mimir_environment_protection,
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
		/obj/item/armor_module/module/hlin_explosive_armor,
		/obj/item/armor_module/module/eshield,
		/obj/item/armor_module/module/eshield/overclocked,
		/obj/item/armor_module/module/mirage,
		/obj/item/armor_module/module/armorlock,
		/obj/item/armor_module/storage/general,
		/obj/item/armor_module/storage/ammo_mag,
		/obj/item/armor_module/storage/engineering,
		/obj/item/armor_module/storage/medical,
		/obj/item/armor_module/storage/general,
		/obj/item/armor_module/storage/engineering,
		/obj/item/armor_module/storage/medical,
		/obj/item/armor_module/storage/injector,
		/obj/item/armor_module/storage/grenade,
		/obj/item/armor_module/storage/integrated,
		/obj/item/armor_module/armor/badge,
	)

	icon_state_variants = list(
		"black",
	)
	current_variant = "black"

	allowed_uniform_type = /obj/item/clothing/under
	starting_attachments = list(/obj/item/armor_module/storage/helmet)

/obj/item/clothing/suit/modular/tdf/hodgrenades
	starting_attachments = list(
		/obj/item/armor_module/module/ballistic_armor,
		/obj/item/armor_module/storage/grenade,
	)

/obj/item/clothing/suit/modular/tdf/engineer
	starting_attachments = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/storage/engineering,
	)

/obj/item/clothing/suit/modular/tdf/lightmedical
	starting_attachments = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/lightgeneral
	starting_attachments = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/storage/general,
	)

/obj/item/clothing/suit/modular/tdf/mimir
	starting_attachments = list(
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
		/obj/item/armor_module/storage/general,
	)

/obj/item/clothing/suit/modular/tdf/mimirinjector
	starting_attachments = list(
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
		/obj/item/armor_module/storage/injector,
	)

/obj/item/clothing/suit/modular/tdf/shield
	starting_attachments = list(
		/obj/item/armor_module/module/eshield,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/shield_overclocked
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/overclocked,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/shield_overclocked/medic
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/overclocked,
		/obj/item/armor_module/storage/general,
	)

/obj/item/clothing/suit/modular/tdf/shield_overclocked/engineer
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/overclocked,
		/obj/item/armor_module/storage/engineering,
	)

/obj/item/clothing/suit/modular/tdf/valk
	starting_attachments = list(
		/obj/item/armor_module/module/valkyrie_autodoc,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/light
	name = "\improper 兵卒级轻型护甲"
	desc = "兵卒轻型战斗装甲是TDF侦察单位和突击单位配发的标准装备，旨在保持机动性。提供良好防护的同时对使用者的机动性影响较小。Alt+点击可移除附件物品。使用可切换内置手电筒。"
	soft_armor = MARINE_ARMOR_LIGHT
	icon_state = "tdf_light"
	worn_icon_state = "tdf_light"
	slowdown = SLOWDOWN_ARMOR_LIGHT

/obj/item/clothing/suit/modular/tdf/light/shield
	starting_attachments = list(
		/obj/item/armor_module/module/eshield,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/light/shield_overclocked
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/overclocked,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/light/shield_overclocked/medic
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/overclocked,
		/obj/item/armor_module/storage/general,
	)

/obj/item/clothing/suit/modular/tdf/light/shield_overclocked/engineer
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/overclocked,
		/obj/item/armor_module/storage/engineering,
	)

/obj/item/clothing/suit/modular/tdf/light/lightmedical
	starting_attachments = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/heavy
	name = "\improper 主教级重型护甲"
	desc = "一件重型护甲。提供卓越的防护，但会略微降低机动性。Alt+点击以移除附件。使用它来切换内置手电筒。"
	soft_armor = MARINE_ARMOR_HEAVY
	icon_state = "tdf_heavy"
	worn_icon_state = "tdf_heavy"
	slowdown = SLOWDOWN_ARMOR_HEAVY

/obj/item/clothing/suit/modular/tdf/heavy/mimirengi
	starting_attachments = list(
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
		/obj/item/armor_module/storage/engineering,
	)

/obj/item/clothing/suit/modular/tdf/heavy/leader
	starting_attachments = list(
		/obj/item/armor_module/module/valkyrie_autodoc,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/heavy/tyr_onegeneral
	starting_attachments = list(
		/obj/item/armor_module/module/tyr_extra_armor/mark1,
		/obj/item/armor_module/storage/general,
	)

/obj/item/clothing/suit/modular/tdf/heavy/tyr_one
	starting_attachments = list(
		/obj/item/armor_module/module/tyr_extra_armor/mark1,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/heavy/tyr_two
	starting_attachments = list(
		/obj/item/armor_module/module/tyr_extra_armor,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/heavy/tyr_two/corpsman
	starting_attachments = list(
		/obj/item/armor_module/module/tyr_extra_armor,
		/obj/item/armor_module/storage/general,
	)

/obj/item/clothing/suit/modular/tdf/heavy/tyr_two/engineer
	starting_attachments = list(
		/obj/item/armor_module/module/tyr_extra_armor,
		/obj/item/armor_module/storage/engineering,
	)

/obj/item/clothing/suit/modular/tdf/heavy/grenadier //Literally grenades
	starting_attachments = list(
		/obj/item/armor_module/module/ballistic_armor,
		/obj/item/armor_module/storage/grenade,
	)

/obj/item/clothing/suit/modular/tdf/heavy/surt
	starting_attachments = list(
		/obj/item/armor_module/module/fire_proof,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/heavy/shield
	starting_attachments = list(
		/obj/item/armor_module/module/eshield,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/heavy/shield_overclocked
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/overclocked,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/heavy/leader
	name = "\improper 异形女王阶级领袖护甲"
	desc = "一件重型护甲。提供卓越的防护，但会略微降低机动性。Alt+点击以移除已安装的配件。使用它来开关内置手电筒。"
	icon_state = "tdf_leader"
	worn_icon_state = "tdf_leader"

/obj/item/clothing/suit/modular/tdf/heavy/leader/shield
	starting_attachments = list(
		/obj/item/armor_module/module/eshield,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/heavy/leader/shield_overclocked
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/overclocked,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/modular/tdf/robot
	name = "\improper 棍棒级重型底盘"
	desc = "专为TDF战斗机器人自行安装设计的重型装甲板。配有自密封螺栓，用于安装在内部的机器人所有者身上。Alt+点击移除已安装物品。使用它来切换内置手电筒。"
	species_exception = list(/datum/species/robot)
	icon_state = "tdf_robot"
	worn_icon_state = "tdf_robot"
	soft_armor = MARINE_ARMOR_HEAVY
	slowdown = SLOWDOWN_ARMOR_MEDIUM

/obj/item/clothing/suit/modular/tdf/robot/mob_can_equip(mob/user, slot, warning = TRUE, override_nodrop = FALSE, bitslot = FALSE)
	. = ..()
	if(!isrobot(user))
		to_chat(user, span_warning("你无法装备此物品，因为它需要在你的身体上安装固定螺栓！"))
		return FALSE

/obj/item/clothing/suit/modular/tdf/robot/shield_overclocked
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/overclocked,
		/obj/item/armor_module/storage/engineering,
	)

/obj/item/clothing/suit/modular/tdf/robot/tyr_two
	starting_attachments = list(
		/obj/item/armor_module/module/tyr_extra_armor,
		/obj/item/armor_module/storage/engineering,
	)


//helmet

/obj/item/clothing/head/modular/tdf
	name = "\improper 兵卒级头盔"
	desc = "TDF作战部队配备的标准作战头盔。配有集成式抬头显示器和增强现实系统，为穿戴者提供战场态势感知。"
	icon = 'icons/mob/modular/tdf_helmets.dmi'
	worn_icon_list = list(
		slot_head_str = 'icons/mob/modular/tdf_helmets.dmi',
		slot_l_hand_str = 'icons/mob/inhands/clothing/hats_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/clothing/hats_right.dmi',
	)
	icon_state = "tdf_helmet"
	worn_icon_state = "tdf_helmet"
	soft_armor = MARINE_ARMOR_MEDIUM
	inv_hide_flags = HIDEEARS|HIDEALLHAIR
	armor_protection_flags = HEAD|FACE|EYES
	attachments_allowed = list(
		/obj/item/armor_module/module/tyr_head,
		/obj/item/armor_module/module/fire_proof_helmet,
		/obj/item/armor_module/module/hod_head,
		/obj/item/armor_module/module/mimir_environment_protection/mimir_helmet,
		/obj/item/armor_module/module/mimir_environment_protection/mimir_helmet/mark1,
		/obj/item/armor_module/module/welding,
		/obj/item/armor_module/module/welding/superior,
		/obj/item/armor_module/module/binoculars,
		/obj/item/armor_module/module/binoculars/artemis_mark_two,
		/obj/item/armor_module/module/artemis,
		/obj/item/armor_module/module/antenna,
		/obj/item/armor_module/module/night_vision,
		/obj/item/armor_module/storage/helmet,
		/obj/item/armor_module/armor/badge,
	)
	greyscale_config = null
	starting_attachments = list(/obj/item/armor_module/storage/helmet)
	icon_state_variants = list(
		"black",
	)
	current_variant = "black"
	visorless_offset_y = 0

/obj/item/clothing/head/modular/tdf/hod
	starting_attachments = list(/obj/item/armor_module/storage/helmet, /obj/item/armor_module/module/hod_head)

/obj/item/clothing/head/modular/tdf/freyr
	starting_attachments = list(/obj/item/armor_module/storage/helmet, /obj/item/armor_module/module/artemis)

/obj/item/clothing/head/modular/tdf/antenna
	starting_attachments = list(/obj/item/armor_module/storage/helmet, /obj/item/armor_module/module/antenna)

/obj/item/clothing/head/modular/tdf/welding
	starting_attachments = list(/obj/item/armor_module/storage/helmet, /obj/item/armor_module/module/welding)

/obj/item/clothing/head/modular/tdf/superiorwelding
	starting_attachments = list(/obj/item/armor_module/storage/helmet, /obj/item/armor_module/module/welding/superior)

/obj/item/clothing/head/modular/tdf/mimir
	starting_attachments = list(/obj/item/armor_module/storage/helmet, /obj/item/armor_module/module/mimir_environment_protection/mimir_helmet/mark1)

/obj/item/clothing/head/modular/tdf/medium
	name = "\improper 骑士级头盔"
	icon_state = "tdf_helmet_medium"
	worn_icon_state = "tdf_helmet_medium"
	soft_armor = MARINE_ARMOR_HEAVY

/obj/item/clothing/head/modular/tdf/heavy
	name = "\improper 主教级头盔"
	desc = "一款与'提尔'装甲模块配套的厚重头盔，以显著增加重量和降低灵活性为代价，提供额外的防护。"
	icon_state = "tdf_helmet_heavy"
	worn_icon_state = "tdf_helmet_heavy"
	soft_armor = list(MELEE = 55, BULLET = 75, LASER = 75, ENERGY = 75, BOMB = 60, BIO = 60, FIRE = 55, ACID = 70)

/obj/item/clothing/head/modular/tdf/heavy/tyr
	soft_armor = list(MELEE = 60, BULLET = 80, LASER = 80, ENERGY = 75, BOMB = 60, BIO = 60, FIRE = 55, ACID = 75)

/obj/item/clothing/head/modular/tdf/pyro
	name = "\improper 小丑级头盔"
	desc = "一款配备集成式防毒面具和'苏尔特'防火装甲模块的笨重头盔，配发给TDF火焰喷射器操作员使用。"
	icon_state = "tdf_helmet_pyro"
	worn_icon_state = "tdf_helmet_pyro"
	soft_armor = list(MELEE = 45, BULLET = 65, LASER = 60, ENERGY = 60, BOMB = 50, BIO = 50, FIRE = 100, ACID = 50)

/obj/item/clothing/head/modular/tdf/leader
	name = "\improper 异形女王阶级头盔"
	desc = "为TDF班长及其他指挥单位设计的头盔，提供额外防护和舒适性。"
	icon_state = "tdf_helmet_leader"
	worn_icon_state = "tdf_helmet_leader"
	soft_armor = list(MELEE = 75, BULLET = 75, LASER = 75, ENERGY = 65, BOMB = 55, BIO = 55, FIRE = 55, ACID = 60)

/obj/item/clothing/head/modular/tdf/leader/fcdr
	name = "\improper 异形之王阶级头盔"
	icon_state = "tdf_helmet_fc"
	worn_icon_state = "tdf_helmet_fc"

/obj/item/clothing/head/modular/tdf/sg
	name = "\improper 工兵级头盔"
	desc = "装有传感器和瞄准计算机的头盔，用于辅助智能机枪射击目标。"
	icon_state = "tdf_helmet_sg"
	worn_icon_state = "tdf_helmet_sg"

/obj/item/clothing/head/modular/tdf/sg/tyr
	soft_armor = list(MELEE = 60, BULLET = 80, LASER = 80, ENERGY = 75, BOMB = 60, BIO = 60, FIRE = 55, ACID = 75)

/obj/item/clothing/head/modular/tdf/medic
	name = "\improper 心脏级头盔"
	desc = "一款独特的头盔，与'米米尔'装甲模块配对，提供额外的生化攻击防护，既能表明你的医疗兵身份，也能让你成为优先目标。"
	icon_state = "tdf_helmet_medic"
	worn_icon_state = "tdf_helmet_medic"
	soft_armor = list(MELEE = 45, BULLET = 65, LASER = 60, ENERGY = 60, BOMB = 50, BIO = 75, FIRE = 50, ACID = 70)

/obj/item/clothing/head/modular/tdf/engi
	name = "\improper 新兵级头盔"
	desc = "专为工程兵设计的头盔，配有内置焊接闪光防护系统。"
	icon_state = "tdf_helmet_engi"
	worn_icon_state = "tdf_helmet_engi"

/obj/item/clothing/head/modular/tdf/engi/welding
	starting_attachments = list(/obj/item/armor_module/storage/helmet, /obj/item/armor_module/module/welding)

/obj/item/clothing/head/modular/tdf/robot
	name = "\improper 棍棒级头盔"
	desc = "专为TDF战斗机器人上半身自行安装设计的重型装甲板。配有自密封螺栓，用于安装在内部的机器人所有者身上。"
	species_exception = list(/datum/species/robot)
	icon_state = "tdf_helmet_robot"
	worn_icon_state = "tdf_helmet_robot"
	soft_armor = list(MELEE = 60, BULLET = 80, LASER = 80, ENERGY = 80, BOMB = 60, BIO = 60, FIRE = 70, ACID = 70)

/obj/item/clothing/head/modular/tdf/robot/mob_can_equip(mob/user, slot, warning = TRUE, override_nodrop = FALSE, bitslot = FALSE)
	. = ..()
	if(!isrobot(user))
		to_chat(user, span_warning("你无法装备此物品，因为它需要在你的身体上安装固定螺栓！"))
		return FALSE

