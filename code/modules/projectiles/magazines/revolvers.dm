
//external magazines

/obj/item/ammo_magazine/revolver
	name = "\improper R-44 马格南快速装弹器（.44）"
	desc = "左轮手枪快速装弹器。"
	default_ammo = /datum/ammo/bullet/revolver
	equip_slot_flags = NONE
	caliber = CALIBER_44
	icon_state = "m44"
	icon = 'icons/obj/items/ammo/revolver.dmi'
	icon_state_mini = "mag_revolver_bronze"
	w_class = WEIGHT_CLASS_SMALL
	max_rounds = 6

/obj/item/ammo_magazine/revolver/marksman
	name = "\improper R-44 神射手快速装弹器（.44口径）"
	default_ammo = /datum/ammo/bullet/revolver/marksman
	caliber = CALIBER_44
	icon_state = "m_m44"
	icon_state_mini = "mag_revolver_bronze_red"

/obj/item/ammo_magazine/revolver/heavy
	name = "\improper R-44 PW-MX 快速装弹器 (.44)"
	default_ammo = /datum/ammo/bullet/revolver/heavy
	caliber = CALIBER_44
	icon_state = "h_m44"
	icon_state_mini = "mag_revolver_bronze_purple"

/obj/item/ammo_magazine/revolver/standard_revolver
	name = "\improper R-44 马格南快速装弹器（.44）"
	desc = "左轮手枪快速装弹器。"
	default_ammo = /datum/ammo/bullet/revolver/tp44
	equip_slot_flags = NONE
	caliber = CALIBER_44
	icon_state = "tp44"
	icon_state_mini = "mag_revolver"
	w_class = WEIGHT_CLASS_SMALL
	max_rounds = 7

/obj/item/ammo_magazine/revolver/upp
	name = "\improper N-Y 快速装弹器（7.62x38mmR）"
	default_ammo = /datum/ammo/bullet/revolver/small
	caliber = CALIBER_762X38
	icon_state = "ny762"
	icon_state_mini = "mag_revolver_blue"


/obj/item/ammo_magazine/revolver/small
	name = "\improper '博特' .357快速装弹器(.357)"
	desc = "一个装填了特殊 .357 子弹的转轮手枪快速装弹器，子弹命中后会反弹。在友军和亲属周围要小心！"
	default_ammo = /datum/ammo/bullet/revolver/ricochet/four
	caliber = CALIBER_357
	icon_state = "sw357"
	icon_state_mini = "mag_revolver_greyred"
	max_rounds = 6

/obj/item/ammo_magazine/revolver/mateba
	name = "\improper 马特巴快速装弹器（.454）"
	default_ammo = /datum/ammo/bullet/revolver/highimpact
	caliber = CALIBER_454
	icon_state = "mateba"
	icon_state_mini = "mag_revolver"
	max_rounds = 6

/obj/item/ammo_magazine/revolver/cmb
	name = "\improper CMB 左轮手枪快速装弹器（.357）"
	default_ammo = /datum/ammo/bullet/revolver/small
	caliber = CALIBER_357
	icon_state = "cmb"
	icon_state_mini = "mag_revolver_greypurple"
	max_rounds = 6

/obj/item/ammo_magazine/revolver/judge
	name = "\improper 法官速装器（.45L）"
	desc = "一把用于'法官'左轮手枪的快速装弹器，这些子弹采用高速推进剂，几乎无散射和衰减。"
	default_ammo = /datum/ammo/bullet/revolver/judge
	caliber = CALIBER_45L
	max_rounds = 5
	icon_state = "m_m44"
	icon_state_mini = "mag_revolver_bronze_red"

/obj/item/ammo_magazine/revolver/judge/buckshot
	name = "\improper 法官型鹿弹快速装填器（.45L）"
	desc = "一把用于'法官'左轮手枪的快速装弹器，内部装填微型弹丸，散布范围大但近战伤害高。"
	default_ammo = /datum/ammo/bullet/shotgun/mbx900_buckshot
	caliber = CALIBER_45L
	icon_state = "h_m44"
	icon_state_mini = "mag_revolver_bronze_purple"

/obj/item/ammo_magazine/revolver/standard_magnum
	name = "\improper R-76 快速装弹器（12.7毫米）"
	desc = "R-76麦格农左轮快速装弹器，小心你的肩膀，击中中等体型目标时通常会使其眩晕。"
	default_ammo = /datum/ammo/bullet/revolver/t76
	max_rounds = 5
	caliber = CALIBER_12x7
	icon_state = "t76"
	icon_state_mini = "mag_revolver_red"

// Single action army revolver ammunition.  Base class is unused.

/obj/item/ammo_magazine/revolver/single_action
	name = "\improper 单动左轮快速装弹器（.44口径）"
	desc = "单动式左轮手枪快速装弹器。"
	default_ammo = /datum/ammo/bullet/revolver
	equip_slot_flags = NONE
	caliber = CALIBER_44
	icon_state = "m44"
	icon = 'icons/obj/items/ammo/revolver.dmi'
	icon_state_mini = "mag_revolver_bronze"
	w_class = WEIGHT_CLASS_SMALL
	max_rounds = 6

/obj/item/ammo_magazine/revolver/single_action/m44
	name = "\improper R-44 SAA 马格南快速装弹器（.44）"
	desc = "一个 R-44 SAA 左轮手枪快速装弹器。"
	default_ammo = /datum/ammo/bullet/revolver
	equip_slot_flags = NONE
	caliber = CALIBER_44
	icon_state = "m44"
	icon = 'icons/obj/items/ammo/revolver.dmi'
	icon_state_mini = "mag_revolver_bronze"
	w_class = WEIGHT_CLASS_SMALL
	max_rounds = 6
