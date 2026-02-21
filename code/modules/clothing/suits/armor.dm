
/obj/item/clothing/suit/armor
	inventory_flags = BLOCKSHARPOBJ
	armor_protection_flags = CHEST|GROIN
	cold_protection_flags = CHEST|GROIN
	heat_protection_flags = CHEST|GROIN
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6
	w_class = WEIGHT_CLASS_HUGE
	allowed = list(/obj/item/weapon/gun)//Guns only.


/obj/item/clothing/suit/armor/mob_can_equip(mob/user, slot, warning = TRUE, override_nodrop = FALSE, bitslot = FALSE)
	. = ..()
	if(!.)
		return FALSE

	if(!ishuman(user))
		return TRUE

	var/mob/living/carbon/human/H = user
	if(!H.w_uniform)
		to_chat(H, span_warning("你需要穿着内衣才能装备这个。"))
		return FALSE



//armored vest

/obj/item/clothing/suit/armor/vest
	name = "防弹背心"
	desc = "一件能提供一定防护的防弹背心。"
	icon_state = "armor"
	worn_icon_state = "armor"
	blood_overlay_type = "armor"
	permeability_coefficient = 0.8
	armor_protection_flags = CHEST
	soft_armor = list(MELEE = 20, BULLET = 30, LASER = 25, ENERGY = 10, BOMB = 15, BIO = 0, FIRE = 10, ACID = 10)
	allowed = list (
		/obj/item/weapon/gun,
		/obj/item/flashlight,
		/obj/item/binoculars,
		/obj/item/weapon/combat_knife,
		/obj/item/attachable/bayonet,
		/obj/item/storage/holster/blade
	)

/obj/item/clothing/suit/armor/vest/admiral
	name = "上将夹克"
	desc = "一件带有金色徽章的装甲夹克"
	icon_state = "admiral_jacket"
	worn_icon_state = "admiral_jacket"
	armor_protection_flags = CHEST|GROIN|ARMS
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/clothing/suit/armor/vest/security
	name = "安保护甲"
	desc = "一件能提供一定防护的防弹背心。"
	icon_state = "armorsec"
	worn_icon_state = "armorsec"
	slowdown = SLOWDOWN_ARMOR_MEDIUM //prevents powergaming marine by swapping armor.

/obj/item/clothing/suit/armor/vest/warden
	name = "典狱长夹克"
	desc = "一件带有银色军衔徽章和标识的装甲夹克。"
	icon_state = "warden_jacket"
	worn_icon_state = "warden_jacket"
	armor_protection_flags = CHEST|GROIN|ARMS

/obj/item/clothing/suit/armor/bulletproof
	name = "防弹背心"
	desc = "一件擅长防护穿戴者免受高速实体弹丸伤害的防弹背心。"
	icon_state = "bulletproof"
	worn_icon_state = "bulletproof"
	blood_overlay_type = "armor"
	armor_protection_flags = CHEST
	soft_armor = list(MELEE = 30, BULLET = 75, LASER = 15, ENERGY = 15, BOMB = 30, BIO = 0, FIRE = 0, ACID = 15)
	hard_armor = list(MELEE = 0, BULLET = 20, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 5)
	siemens_coefficient = 0.7
	permeability_coefficient = 0.9
	equip_delay_self = 20
	unequip_delay_self = 20
	allowed = list(
		/obj/item/weapon/gun/,
		/obj/item/flashlight,
		/obj/item/storage/holster/blade,
		/obj/item/storage/holster/belt/pistol/m4a3,
		/obj/item/storage/holster/belt/m44,
	)

/obj/item/clothing/suit/armor/riot
	name = "防暴服"
	desc = "一套带有厚重衬垫的盔甲，用于防护近战攻击。看起来可能会妨碍行动。"
	icon_state = "riot"
	worn_icon_state = "swat"
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	slowdown = 1.2
	soft_armor = list(MELEE = 65, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 0, BIO = 0, FIRE = 10, ACID = 10)
	inventory_flags = BLOCKSHARPOBJ
	inv_hide_flags = HIDEJUMPSUIT
	item_flags = SYNTH_RESTRICTED
	siemens_coefficient = 0.5
	permeability_coefficient = 0.7
	equip_delay_self = 20
	unequip_delay_self = 20

/obj/item/clothing/suit/armor/swat
	name = "特警护甲"
	desc = "一套重型装甲服，可抵御中等程度伤害。用于特种作战。"
	icon_state = "deathsquad"
	worn_icon_state = "swat"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS
	allowed = list(/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/baton,/obj/item/restraints/handcuffs,/obj/item/tank/emergency_oxygen)
	slowdown = 1
	soft_armor = list(MELEE = 50, BULLET = 60, LASER = 50, ENERGY = 25, BOMB = 50, BIO = 100, FIRE = 25, ACID = 25)
	inventory_flags = BLOCKSHARPOBJ|NOPRESSUREDMAGE
	item_flags = SYNTH_RESTRICTED
	inv_hide_flags = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	cold_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6


/obj/item/clothing/suit/armor/swat/officer
	name = "军官夹克"
	desc = "特种作战中使用的装甲夹克。"
	icon_state = "detective"
	worn_icon_state = "det_suit"
	blood_overlay_type = "coat"
	inventory_flags = NONE
	inv_hide_flags = NONE
	armor_protection_flags = CHEST|ARMS


/obj/item/clothing/suit/armor/det_suit
	name = "护甲"
	desc = "一件带有侦探徽章的防弹背心。"
	icon_state = "detective-armor"
	worn_icon_state = "detective-armor"
	blood_overlay_type = "armor"
	armor_protection_flags = CHEST|GROIN
	item_flags = SYNTH_RESTRICTED
	soft_armor = list(MELEE = 50, BULLET = 15, LASER = 50, ENERGY = 10, BOMB = 25, BIO = 0, FIRE = 10, ACID = 10)

/obj/item/clothing/suit/armor/rugged
	name = "重型护甲"
	desc = "危险环境中作业人员使用的防护服。"
	icon_state = "swatarmor"
	worn_icon_state = "swatarmor"
	var/obj/item/weapon/gun/holstered = null
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	item_flags = SYNTH_RESTRICTED
	slowdown = 0
	soft_armor = list(MELEE = 50, BULLET = 40, LASER = 40, ENERGY = 40, BOMB = 50, BIO = 40, FIRE = 50, ACID = 50)
	siemens_coefficient = 0.7

/obj/item/clothing/suit/armor/patrol
	name = "安全巡逻护甲"
	desc = "一套供巡逻安保人员使用的轻型护甲。虽然比凯夫拉更先进，但重量更大，会略微降低穿戴者的移动速度。"
	icon_state = "security_patrol"
	worn_icon_state = "security_patrol"
	blood_overlay_type = "coat"
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	item_flags = SYNTH_RESTRICTED
	slowdown = 0.2
	soft_armor = list(MELEE = 20, BULLET = 40, LASER = 30, ENERGY = 30, BOMB = 30, BIO = 15, FIRE = 25, ACID = 15)
	siemens_coefficient = 0.9
	permeability_coefficient = 0.7
	equip_delay_self = 20
	unequip_delay_self = 20

/obj/item/clothing/suit/armor/sectoid
	name = "灵能场"
	desc = "一片无形的能量场，它能保护穿戴者，但无法同时穿戴任何衣物。"
	icon = 'icons/effects/effects.dmi'
	icon_state = "shield-blue"
	item_flags = DELONDROP
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	soft_armor = list(MELEE = 55, BULLET = 55, LASER = 35, ENERGY = 20, BOMB = 40, BIO = 40, FIRE = 40, ACID = 40)
	allowed = list()//how would you put a gun onto a field of energy?

/obj/item/clothing/suit/armor/sectoid/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, SECTOID_TRAIT)

/obj/item/clothing/suit/armor/sectoid/shield
	name = "强大的灵能场"
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	soft_armor = list(MELEE = 55, BULLET = 55, LASER = 35, ENERGY = 20, BOMB = 40, BIO = 40, FIRE = 40, ACID = 40)

/obj/item/clothing/suit/armor/sectoid/shield/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/shield/overhealth)


//All of the armor below is mostly unused


/obj/item/clothing/suit/armor/centcom
	name = "中央司令部护甲"
	desc = "一套能提供一定防护的护甲。"
	icon_state = "centcom"
	worn_icon_state = "centcom"
	w_class = WEIGHT_CLASS_BULKY//bulky item
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/weapon/gun,/obj/item/weapon/baton,/obj/item/restraints/handcuffs,/obj/item/tank/emergency_oxygen)
	inventory_flags = NONE
	inv_hide_flags = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	cold_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0

/obj/item/clothing/suit/armor/heavy
	name = "重型护甲"
	desc = "一套重型装甲服，可抵御中等程度的伤害。"
	icon_state = "heavy"
	worn_icon_state = "swat_suit"
	w_class = WEIGHT_CLASS_BULKY//bulky item
	gas_transfer_coefficient = 0.90
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	slowdown = 3
	inv_hide_flags = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 0

/obj/item/clothing/suit/armor/tdome
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	inv_hide_flags = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

/obj/item/clothing/suit/armor/tdome/red
	name = "雷霆穹顶护甲（红色）"
	desc = "红色装甲。"
	icon_state = "tdred"
	worn_icon_state = "tdred"
	siemens_coefficient = 1

/obj/item/clothing/suit/armor/tdome/green
	name = "雷霆穹顶护甲（绿色）"
	desc = "恶心护甲。"
	icon_state = "tdgreen"
	worn_icon_state = "tdgreen"
	siemens_coefficient = 1

/obj/item/clothing/suit/armor/hos
	name = "防弹大衣"
	desc = "一件采用特殊合金增强的大衣，兼具防护与时尚风格。"
	icon_state = "hos"
	worn_icon_state = "hos"
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS
	item_flags = SYNTH_RESTRICTED
	soft_armor = list(MELEE = 65, BULLET = 30, LASER = 50, ENERGY = 10, BOMB = 25, BIO = 0, FIRE = 10, ACID = 10)
	inventory_flags = NONE
	inv_hide_flags = HIDEJUMPSUIT
	siemens_coefficient = 0.6

/obj/item/clothing/suit/armor/hos/jensen
	name = "防弹风衣"
	desc = "一件经过特殊合金强化的风衣，兼具防护与时尚。"
	icon_state = "jensencoat"
	worn_icon_state = "jensencoat"
	inv_hide_flags = NONE
	siemens_coefficient = 0.6
	armor_protection_flags = CHEST|ARMS

