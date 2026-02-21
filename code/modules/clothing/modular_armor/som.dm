//SOM modular armour

/obj/item/clothing/suit/modular/som
	name = "\improper 火星之子中型战斗护甲"
	desc = "M-21战斗装甲通常由火星之子步兵使用。它采用特殊的轻质合金，在提供良好防护的同时仅对使用者的机动性造成轻微影响。Alt+点击以移除已安装的配件。使用它来切换内置手电筒。"
	soft_armor = list(MELEE = 45, BULLET = 65, LASER = 60, ENERGY = 60, BOMB = 50, BIO = 50, FIRE = 55, ACID = 50)
	icon = 'icons/mob/modular/som_armor.dmi'
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/modular/som_armor.dmi',
		slot_l_hand_str = 'icons/mob/inhands/clothing/suits_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/clothing/suits_right.dmi',
	)
	icon_state = "som_medium"
	worn_icon_state = "som_medium"
	slowdown = SLOWDOWN_ARMOR_MEDIUM

	attachments_allowed = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/module/valkyrie_autodoc/som,
		/obj/item/armor_module/module/fire_proof/som,
		/obj/item/armor_module/module/tyr_extra_armor/som,
		/obj/item/armor_module/module/mimir_environment_protection/som,
		/obj/item/armor_module/module/hlin_explosive_armor,
		/obj/item/armor_module/module/eshield/som,
		/obj/item/armor_module/module/eshield/som/overclocked,
		/obj/item/armor_module/storage/general,
		/obj/item/armor_module/storage/ammo_mag,
		/obj/item/armor_module/storage/engineering,
		/obj/item/armor_module/storage/medical,
		/obj/item/armor_module/storage/general/som,
		/obj/item/armor_module/storage/engineering/som,
		/obj/item/armor_module/storage/medical/som,
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

/obj/item/clothing/suit/modular/som/engineer
	starting_attachments = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/storage/engineering,
	)

/obj/item/clothing/suit/modular/som/medic
	starting_attachments = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/storage/general/som,
	)

/obj/item/clothing/suit/modular/som/medstorage
	starting_attachments = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/storage/medical/som,
	)

/obj/item/clothing/suit/modular/som/shield
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/som,
		/obj/item/armor_module/storage/medical/som,
	)

/obj/item/clothing/suit/modular/som/shield_overclocked
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/som/overclocked,
		/obj/item/armor_module/storage/medical/som,
	)

/obj/item/clothing/suit/modular/som/shield_overclocked/medic
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/som/overclocked,
		/obj/item/armor_module/storage/general/som,
	)

/obj/item/clothing/suit/modular/som/shield_overclocked/engineer
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/som/overclocked,
		/obj/item/armor_module/storage/engineering,
	)

/obj/item/clothing/suit/modular/som/light
	name = "\improper 火星之子侦察兵护甲"
	desc = "M-11侦察护甲是一款轻量化护甲，能在提供合理防护的同时将负重降至最低。通常配备于侦察兵或其他通常不会直接暴露在火力下的特种单位。Alt+点击可移除附件物品。使用可开关内置手电筒。"
	soft_armor = list(MELEE = 35, BULLET = 55, LASER = 50, ENERGY = 50, BOMB = 45, BIO = 45, FIRE = 50, ACID = 40)
	icon_state = "som_light"
	worn_icon_state = "som_light"
	slowdown = SLOWDOWN_ARMOR_LIGHT

/obj/item/clothing/suit/modular/som/light/shield
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/som,
		/obj/item/armor_module/storage/medical/som,
	)

/obj/item/clothing/suit/modular/som/light/shield_overclocked
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/som/overclocked,
		/obj/item/armor_module/storage/medical/som,
	)

/obj/item/clothing/suit/modular/som/light/shield_overclocked/medic
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/som/overclocked,
		/obj/item/armor_module/storage/general/som,
	)

/obj/item/clothing/suit/modular/som/light/shield_overclocked/engineer
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/som/overclocked,
		/obj/item/armor_module/storage/engineering,
	)

/obj/item/clothing/suit/modular/som/light/engineer
	starting_attachments = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/storage/engineering,
	)

/obj/item/clothing/suit/modular/som/light/medic
	starting_attachments = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/storage/general/som,
	)


/obj/item/clothing/suit/modular/som/heavy
	name = "\improper 火星之子重型战斗护甲"
	desc = "一套火星之子突击部队穿戴的M-31重型作战护甲标准套装。提供卓越的防护性能，但会略微降低机动性。Alt+点击可移除附件物品。使用可切换内置手电筒。"
	soft_armor = list(MELEE = 50, BULLET = 70, LASER = 65, ENERGY = 65, BOMB = 55, BIO = 55, FIRE = 60, ACID = 55)
	icon_state = "som_heavy"
	worn_icon_state = "som_heavy"
	slowdown = SLOWDOWN_ARMOR_HEAVY

/obj/item/clothing/suit/modular/som/heavy/pyro
	starting_attachments = list(
		/obj/item/armor_module/module/fire_proof/som,
		/obj/item/armor_module/storage/medical/som,
	)

/obj/item/clothing/suit/modular/som/heavy/pyro/genstorage
	starting_attachments = list(
		/obj/item/armor_module/module/fire_proof/som,
		/obj/item/armor_module/storage/general/som,
	)

/obj/item/clothing/suit/modular/som/heavy/lorica
	starting_attachments = list(
		/obj/item/armor_module/module/tyr_extra_armor/som,
		/obj/item/armor_module/storage/medical/som,
	)

/obj/item/clothing/suit/modular/som/heavy/lorica/medic
	starting_attachments = list(
		/obj/item/armor_module/module/tyr_extra_armor/som,
		/obj/item/armor_module/storage/general/som,
	)

/obj/item/clothing/suit/modular/som/heavy/lorica/engineer
	starting_attachments = list(
		/obj/item/armor_module/module/tyr_extra_armor/som,
		/obj/item/armor_module/storage/engineering/som,
	)

/obj/item/clothing/suit/modular/som/heavy/mithridatius
	starting_attachments = list(
		/obj/item/armor_module/module/mimir_environment_protection/som,
		/obj/item/armor_module/storage/medical/som,
	)

/obj/item/clothing/suit/modular/som/heavy/shield
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/som,
		/obj/item/armor_module/storage/medical/som,
	)

/obj/item/clothing/suit/modular/som/heavy/shield_overclocked
	starting_attachments = list(
		/obj/item/armor_module/module/eshield/som/overclocked,
		/obj/item/armor_module/storage/medical/som,
	)

/obj/item/clothing/suit/modular/som/heavy/leader
	name = "\improper 火星之子戈耳工式突击护甲"
	desc = "一套笨重的重型战斗装甲，M-35'戈耳工'装甲能为使用者提供卓越的防护，同时不会严重限制机动性。由于显著的制造和维护需求，通常只见于火星之子指挥官或其最精锐的战斗单位。你需要强大的火力才能击穿它。Alt-点击以移除附件物品。使用它来切换内置手电筒。"
	soft_armor = list(MELEE = 60, BULLET = 75, LASER = 70, ENERGY = 70, BOMB = 60, BIO = 55, FIRE = 65, ACID = 55)
	icon_state = "som_leader"
	worn_icon_state = "som_leader"

	siemens_coefficient = 0.4
	permeability_coefficient = 0.5
	gas_transfer_coefficient = 0.5
	attachments_allowed = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/module/valkyrie_autodoc/som,
		/obj/item/armor_module/module/fire_proof/som,
		/obj/item/armor_module/module/mimir_environment_protection/som,
		/obj/item/armor_module/module/hlin_explosive_armor,
		/obj/item/armor_module/module/eshield/som,
		/obj/item/armor_module/module/eshield/som/overclocked,
		/obj/item/armor_module/storage/general,
		/obj/item/armor_module/storage/ammo_mag,
		/obj/item/armor_module/storage/engineering,
		/obj/item/armor_module/storage/medical,
		/obj/item/armor_module/storage/general/som,
		/obj/item/armor_module/storage/engineering/som,
		/obj/item/armor_module/storage/medical/som,
		/obj/item/armor_module/storage/injector,
		/obj/item/armor_module/storage/grenade,
		/obj/item/armor_module/storage/integrated,
		/obj/item/armor_module/armor/badge,
	)

/obj/item/clothing/suit/modular/som/heavy/leader/valk
	starting_attachments = list(
		/obj/item/armor_module/module/valkyrie_autodoc/som,
		/obj/item/armor_module/storage/medical/som,
	)

/obj/item/clothing/suit/modular/som/heavy/leader/officer
	desc = "一套厚重的重型战斗装甲，M-35'戈尔贡'装甲能为使用者提供卓越的防护，同时不会严重限制机动性。这套装甲上的金色标记表明它由一名高级战地军官穿着。你需要强大的火力才能击穿它。Alt-点击以移除附件物品。使用它来切换内置手电筒。"
	icon_state = "som_officer"
	worn_icon_state = "som_officer"
	starting_attachments = list(
		/obj/item/armor_module/module/valkyrie_autodoc/som,
		/obj/item/armor_module/storage/medical/som,
	)

//helmet

/obj/item/clothing/head/modular/som
	name = "\improper 火星之子步兵头盔"
	desc = "火星之子作战部队配备的标准作战头盔。采用先进聚合物制造，在提供高效防护的同时不影响视野。"
	icon = 'icons/mob/modular/som_helmets.dmi'
	worn_icon_list = list(
		slot_head_str = 'icons/mob/modular/som_helmets.dmi',
		slot_l_hand_str = 'icons/mob/inhands/clothing/hats_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/clothing/hats_right.dmi',
	)
	icon_state = "som_helmet"
	worn_icon_state = "som_helmet"
	soft_armor = list(MELEE = 45, BULLET = 65, LASER = 60, ENERGY = 60, BOMB = 50, BIO = 50, FIRE = 55, ACID = 50)
	inv_hide_flags = HIDEEARS|HIDEALLHAIR
	armor_protection_flags = HEAD|FACE|EYES
	attachments_allowed = list(
		/obj/item/armor_module/module/binoculars,
		/obj/item/armor_module/module/binoculars/artemis_mark_two,
		/obj/item/armor_module/module/artemis,
		/obj/item/armor_module/module/antenna,
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

/obj/item/clothing/head/modular/som/engineer
	name = "\improper 火星之子工程头盔"
	desc = "专为战斗工程兵设计的特种头盔，主要特点是集成了焊接面罩。"
	icon_state = "som_helmet_engineer"
	worn_icon_state = "som_helmet_engineer"
	attachments_allowed = list(
		/obj/item/armor_module/storage/helmet,
		/obj/item/armor_module/armor/badge,
		/obj/item/armor_module/module/welding/som,
	)
	starting_attachments = list(/obj/item/armor_module/storage/helmet, /obj/item/armor_module/module/welding/som)

/obj/item/clothing/head/modular/som/bio
	name = "\improper SOM生化危害头盔"
	desc = "这款专用头盔由火星之子人员佩戴，用于应对危险的化学、放射性或其他有害物质。这些物质通常由火星之子自身释放。"
	icon_state = "som_helmet_bio"
	worn_icon_state = "som_helmet_bio"
	soft_armor = list(MELEE = 45, BULLET = 65, LASER = 60, ENERGY = 60, BOMB = 50, BIO = 75, FIRE = 50, ACID = 70)
	siemens_coefficient = 0.1
	permeability_coefficient = 0
	gas_transfer_coefficient = 0.1
	attachments_allowed = list(
		/obj/item/armor_module/storage/helmet,
		/obj/item/armor_module/armor/badge,
	)

/obj/item/clothing/head/modular/som/hades
	name = "\improper 冥王头盔系统"
	desc = "与'冥王'装甲模块配套的头盔，旨在显著提升对火焰的防护能力，同时不牺牲常规耐久性。"
	icon_state = "som_helmet_light"
	worn_icon_state = "som_helmet_light"
	soft_armor = list(MELEE = 35, BULLET = 65, LASER = 60, ENERGY = 60, BOMB = 50, BIO = 50, FIRE = 95, ACID = 40)
	attachments_allowed = list(
		/obj/item/armor_module/storage/helmet,
		/obj/item/armor_module/armor/badge,
	)

/obj/item/clothing/head/modular/som/veteran
	name = "\improper 火星之子老兵头盔"
	desc = "火星之子战斗专家使用的标准作战头盔。采用尖端材料，为更宝贵的大脑提供更强防护。"
	soft_armor = list(MELEE = 50, BULLET = 70, LASER = 65, ENERGY = 65, BOMB = 55, BIO = 55, FIRE = 60, ACID = 55)

/obj/item/clothing/head/modular/som/lorica
	name = "\improper 洛里卡头盔系统"
	desc = "一款与'洛里卡'装甲模块配套的笨重头盔，旨在提供卓越防护，但代价是显著增加的重量和降低的灵活性。大幅增强的额外装甲提升了针对所有伤害类型的防护能力。"
	icon_state = "som_helmet_lorica"
	worn_icon_state = "som_helmet_lorica"
	soft_armor = list(MELEE = 60, BULLET = 80, LASER = 80, ENERGY = 80, BOMB = 65, BIO = 55, FIRE = 70, ACID = 60)
	attachments_allowed = list(
		/obj/item/armor_module/storage/helmet,
		/obj/item/armor_module/armor/badge,
	)

/obj/item/clothing/head/modular/som/leader
	name = "\improper 火星之子 戈耳工式头盔"
	desc = "专为戈尔贡式突击装甲设计，提供卓越防护。通常见于火星之子指挥官或其最精锐的战斗单位。"
	icon_state = "som_helmet_leader"
	worn_icon_state = "som_helmet_leader"
	soft_armor = list(MELEE = 60, BULLET = 75, LASER = 70, ENERGY = 70, BOMB = 60, BIO = 55, FIRE = 65, ACID = 55)
	attachments_allowed = list(
		/obj/item/armor_module/module/binoculars,
		/obj/item/armor_module/module/binoculars/artemis_mark_two,
		/obj/item/armor_module/module/artemis,
		/obj/item/armor_module/module/antenna,
		/obj/item/armor_module/storage/helmet,
		/obj/item/armor_module/armor/badge,
	)

/obj/item/clothing/head/modular/som/leader/officer
	desc = "专为戈耳工式突击装甲设计，提供卓越防护。此件带有金色标记，表明其属于高级战地军官。"
	icon_state = "som_helmet_officer"
	worn_icon_state = "som_helmet_officer"
