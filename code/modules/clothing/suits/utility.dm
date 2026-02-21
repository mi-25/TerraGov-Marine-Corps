/*
* Contains:
*		Fire protection
*		Bomb protection
*		Radiation protection
*/

/*
* Fire protection
*/

/obj/item/clothing/suit/fire
	name = "防火服"
	desc = "一套能防护火焰和高温的防护服。"
	icon_state = "firesuit"
	worn_icon_state = "firesuit"
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 90, ACID = 0)
	w_class = WEIGHT_CLASS_BULKY//bulky item
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.50
	item_flags = IMPEDE_JETPACK
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/flashlight,/obj/item/tank/emergency_oxygen,/obj/item/tool/extinguisher)
	slowdown = 1
	inventory_flags = NOPRESSUREDMAGE
	inv_hide_flags = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	heat_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	cold_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/suit/fire/heavy
	name = "防火服"
	desc = "一套能抵御极端火焰和高温的防护服。"
	icon_state = "atmos_firesuit"
	worn_icon_state = "atmos_firesuit"
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 120, ACID = 0)
	w_class = WEIGHT_CLASS_BULKY
	slowdown = 1.5

/*
* Bomb protection
*/
/obj/item/clothing/head/bomb_hood
	name = "爆炸风帽"
	desc = "用于爆炸情况。"
	icon_state = "bombsuit"
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 100, BIO = 0, FIRE = 0, ACID = 0)
	inventory_flags = COVEREYES|COVERMOUTH
	inv_hide_flags = HIDEFACE|HIDEMASK|HIDEEARS|HIDEALLHAIR
	armor_protection_flags = HEAD|FACE|EYES
	siemens_coefficient = 0


/obj/item/clothing/suit/bomb_suit
	name = "防爆服"
	desc = "专为处理爆炸物时安全设计的防护服。"
	icon_state = "bombsuit"
	worn_icon_state = "bombsuit"
	w_class = WEIGHT_CLASS_BULKY//bulky item
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	slowdown = 2
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 100, BIO = 0, FIRE = 0, ACID = 0)
	inv_hide_flags = HIDEJUMPSUIT
	heat_protection_flags = CHEST|GROIN
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0

/obj/item/clothing/head/bomb_hood/security
	icon_state = "bombsuitsec"
	worn_icon_state = "bombsuitsec"
	armor_protection_flags = HEAD

/obj/item/clothing/suit/bomb_suit/security
	icon_state = "bombsuitsec"
	worn_icon_state = "bombsuitsec"
	allowed = list(/obj/item/weapon/gun,/obj/item/weapon/baton,/obj/item/restraints/handcuffs)
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/*
* Radiation protection
*/
/obj/item/clothing/head/radiation
	name = "辐射防护兜帽"
	icon_state = "rad"
	desc = "具有辐射防护性能的头罩。标签：含铅材质，请勿食用绝缘层"
	inventory_flags = COVEREYES|COVERMOUTH
	inv_hide_flags = HIDEFACE|HIDEMASK|HIDEEARS|HIDEALLHAIR
	armor_protection_flags = HEAD|FACE|EYES
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 60, FIRE = 0, ACID = 0)


/obj/item/clothing/suit/radiation
	name = "防辐射服"
	desc = "一套能防护辐射的防护服。标签：含铅绝缘材料，请勿食用。"
	icon_state = "rad"
	worn_icon_state = "rad_suit"
	w_class = WEIGHT_CLASS_BULKY//bulky item
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.50
	armor_protection_flags = CHEST|GROIN|LEGS|ARMS|HANDS|FEET
	allowed = list(/obj/item/flashlight,/obj/item/tank/emergency_oxygen,/obj/item/clothing/head/radiation,/obj/item/clothing/mask/gas)
	slowdown = 1.5
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 60, FIRE = 0, ACID = 0)
	inv_hide_flags = HIDEJUMPSUIT
