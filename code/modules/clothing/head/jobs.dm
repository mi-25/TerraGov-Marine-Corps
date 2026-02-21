
//Bartender
/obj/item/clothing/head/chefhat
	name = "厨师帽"
	desc = "这是厨师用来防止头发掉进食物的帽子。从食堂的饭菜来看，这玩意儿根本没用。"
	icon_state = "chefhat"
	worn_icon_state = "chefhat"
	siemens_coefficient = 0.9

//Captain: This probably shouldn't be space-worthy
/obj/item/clothing/head/caphat
	name = "舰长帽"
	icon_state = "captain"
	desc = "当异形之王的感觉真不错。"
	worn_icon_state = "caphat"
	siemens_coefficient = 0.9
	anti_hug = 1

//Captain: This probably shouldn't be space-worthy
/obj/item/clothing/head/helmet/cap
	name = "舰长帽"
	desc = "你害怕佩戴它，因为它会带来疏忽。"
	icon_state = "capcap"
	inventory_flags = NONE
	inv_hide_flags = NONE
	cold_protection_flags = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.9
	armor_protection_flags = NONE

//Chaplain
/obj/item/clothing/head/chaplain_hood
	name = "牧师兜帽"
	desc = "这是覆盖头部的兜帽。它能在太空寒冬中为你保暖。"
	icon_state = "chaplain_hood"
	inventory_flags = COVEREYES
	inv_hide_flags = HIDEEARS|HIDEALLHAIR
	siemens_coefficient = 0.9
	armor_protection_flags = HEAD|EYES

//Chaplain
/obj/item/clothing/head/nun_hood
	name = "修女头巾"
	desc = "本星系最虔诚的信徒。"
	icon_state = "nun_hood"
	inventory_flags = COVEREYES
	inv_hide_flags = HIDEEARS|HIDEALLHAIR
	siemens_coefficient = 0.9

//Mime
/obj/item/clothing/head/beret
	name = "贝雷帽"
	desc = "贝雷帽，艺术家的最爱。"
	icon_state = "beret"
	siemens_coefficient = 0.9
	soft_armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 10, BIO = 5, FIRE = 5, ACID = 5)
	armor_features_flags = ARMOR_NO_DECAP

//Security
/obj/item/clothing/head/beret/sec
	name = "安全贝雷帽"
	desc = "一顶饰有安保徽章的贝雷帽。专为那些更注重风格而非安全的军官设计。"
	icon_state = "beret_badge"
/obj/item/clothing/head/beret/sec/alt
	name = "军官贝雷帽"
	desc = "一顶深蓝色贝雷帽，配有军官军衔徽章。适合那些更注重风格而非安全的军官。"
	icon_state = "officerberet"
/obj/item/clothing/head/beret/sec/hos
	name = "军官贝雷帽"
	desc = "一顶深蓝色贝雷帽，配有指挥官军衔徽章。适合那些更注重风格而非安全的军官。"
	icon_state = "hosberet"
/obj/item/clothing/head/beret/sec/warden
	name = "典狱长贝雷帽"
	desc = "一顶深蓝色贝雷帽，配有典狱长的军衔徽章。适合那些更注重风格而非安全的军官。"
	icon_state = "wardenberet"
/obj/item/clothing/head/beret/eng
	name = "工程兵贝雷帽"
	desc = "一顶印有工程徽章的贝雷帽。适合那些更注重风格而非安全的工程师。"
	icon_state = "e_beret_badge"

/obj/item/clothing/head/beret/jan
	name = "紫色贝雷帽"
	desc = "一顶时髦的紫色贝雷帽。"
	icon_state = "purpleberet"


//Medical
/obj/item/clothing/head/surgery
	name = "手术帽"
	desc = "手术帽，外科医生在手术时佩戴。防止他们的头发搔到你的内脏。"
	icon_state = "surgcap_blue"
	inv_hide_flags = HIDETOPHAIR

/obj/item/clothing/head/surgery/purple
	desc = "手术帽，外科医生在手术时佩戴。防止他们的头发搔到你的内脏。这顶是深紫色的。"
	icon_state = "surgcap_purple"

/obj/item/clothing/head/surgery/blue
	desc = "手术帽，外科医生在手术时佩戴。防止他们的头发搔到你的内脏。这顶是浅蓝色的。"
	icon_state = "surgcap_blue"

/obj/item/clothing/head/surgery/green
	desc = "手术帽，外科医生在手术时佩戴。防止他们的头发搔到你的内脏。这顶是深绿色的。"
	icon_state = "surgcap_green"



//Detective

/obj/item/clothing/head/det_hat
	name = "帽子"
	desc = "穿上这个的人会显得非常精明。"
	icon_state = "detective"
	allowed = list(/obj/item/reagent_containers/food/snacks/candy_corn, /obj/item/tool/pen)
	soft_armor = list(MELEE = 50, BULLET = 5, LASER = 25, ENERGY = 10, BOMB = 0, BIO = 0, FIRE = 10, ACID = 10)
	siemens_coefficient = 0.9
	armor_protection_flags = NONE

/obj/item/clothing/head/det_hat/black
	icon_state = "detective2"
