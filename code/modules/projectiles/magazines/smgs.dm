/obj/item/ammo_magazine/smg
	name = "\improper 冲锋枪弹匣"
	desc = "一个冲锋枪弹匣。"
	default_ammo = /datum/ammo/bullet/smg
	max_rounds = 30
	icon = 'icons/obj/items/ammo/submachinegun.dmi'
	icon_state_mini = "mag_smg"

//-------------------------------------------------------
//M25 SMG ammo

/obj/item/ammo_magazine/smg/m25
	name = "\improper SMG-25 弹匣 (10x20mm)"
	desc = "一个10x20毫米无壳冲锋枪弹匣。"
	caliber = CALIBER_10X20_CASELESS
	icon_state = "m25"
	max_rounds = 60
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_magazine/smg/m25/ap
	name = "\improper SMG-25 穿甲弹匣 (10x20mm)"
	icon_state = "m25_ap"
	default_ammo = /datum/ammo/bullet/smg/ap
	icon_state_mini = "mag_smg_green"
	bonus_overlay = "m25_ap"

/obj/item/ammo_magazine/smg/m25/extended
	name = "\improper SMG-25 加长弹匣 (10x20mm)"
	icon_state = "m25_ext"
	max_rounds = 90
	icon_state_mini = "mag_smg_yellow"
	bonus_overlay = "m25_ex"

//-------------------------------------------------------
//MP-19 Machinepistol ammo

/obj/item/ammo_magazine/smg/standard_machinepistol
	name = "\improper MP-19 冲锋手枪弹匣 (10x20mm)"
	desc = "一个10x20毫米无壳弹冲锋手枪弹匣。"
	caliber = CALIBER_10X20_CASELESS
	icon_state = "t19"
	icon_state_mini = "mag_smg"
	max_rounds = 30
	w_class = WEIGHT_CLASS_SMALL

//-------------------------------------------------------
//SMG-90 SMG ammo

/obj/item/ammo_magazine/smg/standard_smg
	name = "\improper SMG-90冲锋枪弹匣（10x20mm）"
	desc = "一个10x20毫米无壳冲锋枪弹匣。"
	caliber = CALIBER_10X20_CASELESS
	icon_state = "t90"
	max_rounds = 80
	w_class = WEIGHT_CLASS_SMALL
	icon_state_mini = "mag_t90"

/obj/item/ammo_magazine/smg/standard_smg/ap
	name = "\improper SMG-90冲锋枪穿甲弹匣（10x20mm）"
	desc = "一个10x20毫米无壳穿甲冲锋枪弹匣。"
	icon_state = "t90_ap"
	default_ammo = /datum/ammo/bullet/smg/ap

//-------------------------------------------------------
//SMG-45 SMG ammo

/obj/item/ammo_magazine/smg/standard_heavysmg
	name = "\improper SMG-45 弹匣 (.41 AE)"
	desc = "一个.41 AE无壳冲锋枪弹匣。"
	default_ammo = /datum/ammo/bullet/smg/heavy
	caliber = CALIBER_41AE
	icon_state = "t45"
	max_rounds = 55
	w_class = WEIGHT_CLASS_SMALL
	icon_state_mini = "mag_heavy_smg"
	bonus_overlay = "t45_mag"

/obj/item/ammo_magazine/smg/standard_heavysmg/squashhead
	name = "\improper SMG-45 碎甲弹弹匣 (.41 AE)"
	desc = "一种.41 AE无壳冲锋枪弹匣，接触时会引发微型爆炸，基本上能撕碎任何目标的护甲。"
	default_ammo = /datum/ammo/bullet/smg/squash
	icon_state = "t45_sh"
	icon_state_mini = "mag_heavy_smg_yellow"
	bonus_overlay = "t45_mag_sh"

//-------------------------------------------------------
//RA-VAL, PMC SMG

/obj/item/ammo_magazine/smg/val
	name = "\improper RA-VAL弹匣（9x39mm）"
	desc = "一个9x39毫米冲锋枪弹匣。"
	default_ammo = /datum/ammo/bullet/smg/val
	caliber = CALIBER_9X39
	icon_state = "val"
	max_rounds = 50
	w_class = WEIGHT_CLASS_SMALL
	icon_state_mini = "mag_heavy_smg"

//-------------------------------------------------------
//SMG-27, based on the SMG-27, based on the M7.

/obj/item/ammo_magazine/smg/mp7
	name = "\improper SMG-27 弹匣 (4.6x30mm)"
	desc = "SMG-27冲锋枪的4.6毫米弹匣。"
	default_ammo = /datum/ammo/bullet/smg/ap
	caliber = CALIBER_46X30
	icon_state = "mp7"
	icon_state_mini = "mag_smg"
	max_rounds = 30


//-------------------------------------------------------
//SKORPION //Based on the same thing.

/obj/item/ammo_magazine/smg/skorpion
	name = "\improper CZ-81 弹匣 (.32ACP)"
	desc = "CZ-81的.32ACP口径弹匣。"
	caliber = CALIBER_32ACP
	icon_state = "skorpion"
	icon_state_mini = "mag_smg_dark"
	max_rounds = 20 //Can also be 10.


//-------------------------------------------------------
//PPSH //Based on the PPSh-41.

/obj/item/ammo_magazine/smg/ppsh
	name = "\improper PPSh-17b 弹匣 (7.62x25mm)"
	desc = "PPSh冲锋枪的弹鼓弹匣。"
	default_ammo = /datum/ammo/bullet/smg
	w_class = WEIGHT_CLASS_SMALL
	caliber = CALIBER_762X25
	icon_state = "ppsh"
	icon_state_mini = "mag_smg"
	max_rounds = 42
	bonus_overlay = "ppsh_standard"


/obj/item/ammo_magazine/smg/ppsh/extended
	name = "\improper PPSh-17b 弹鼓（7.62x25mm）"
	icon_state = "ppsh_ext"
	icon_state_mini = "mag_drum_yellow"
	w_class = WEIGHT_CLASS_NORMAL
	max_rounds = 78
	bonus_overlay = "ppsh_ex"
	aim_speed_mod = 0.2

//-------------------------------------------------------
//GENERIC UZI //Based on the uzi submachinegun, of course.

/obj/item/ammo_magazine/smg/uzi
	name = "\improper SMG-2 弹匣 (9mm)"
	desc = "SMG-2冲锋枪的弹匣。"
	caliber = CALIBER_9X21
	icon_state = "uzi"
	icon_state_mini = "mag_smg_dark"
	max_rounds = 32

/obj/item/ammo_magazine/smg/uzi/extended
	name = "\improper GAL9 加长弹匣（9毫米）"
	icon_state = "uzi_ext"
	max_rounds = 50
	bonus_overlay = "uzi_ex"
	icon_state_mini = "mag_smg_dark"

//-------------------------------------------------------
//V-21 SOM SMG

/obj/item/ammo_magazine/smg/som
	name = "\improper V-21冲锋枪弹匣（10x20mm）"
	desc = "一个10x20毫米无壳冲锋枪弹匣。"
	caliber = CALIBER_10X20_CASELESS
	icon_state = "v21"
	icon_state_mini = "mag_smg"
	max_rounds = 50
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_magazine/smg/som/ap
	name = "\improper V-21 AP 冲锋枪弹匣（10x20mm）"
	desc = "一个10x20毫米无壳冲锋枪弹匣，装填穿甲弹。"
	icon_state = "v21_ap"
	default_ammo = /datum/ammo/bullet/smg/ap
	icon_state_mini = "mag_smg_green"

/obj/item/ammo_magazine/smg/som/incendiary
	name = "\improper V-21 燃烧冲锋枪弹匣（10x20毫米）"
	desc = "一个10x20毫米无壳冲锋枪弹匣，装填燃烧弹。"
	icon_state = "v21_incend"
	default_ammo = /datum/ammo/bullet/smg/incendiary
	icon_state_mini = "mag_smg_red"

/obj/item/ammo_magazine/smg/som/extended
	name = "\improper V-21 冲锋枪加长弹匣（10x20mm）"
	desc = "一个加长的10x20毫米无壳冲锋枪弹匣。"
	icon_state = "v21_extended"
	max_rounds = 75
	icon_state_mini = "mag_smg_yellow"
	w_class = WEIGHT_CLASS_NORMAL
	aim_speed_mod = 0.1

/obj/item/ammo_magazine/smg/som/rad
	name = "\improper V-21放射性冲锋枪弹匣（10x20mm）"
	desc = "一个10x20毫米无壳冲锋枪弹匣，装有放射性弹药。请小心处理。"
	icon_state = "v21_rad"
	default_ammo = /datum/ammo/bullet/smg/rad
	icon_state_mini = "mag_smg_greenyellow"

//-------------------------------------------------------
//PL-38, ICC Machinepistol

/obj/item/ammo_magazine/smg/icc_machinepistol
	name = "\improper PL-38 穿甲冲锋手枪弹匣 (10x20mm)"
	desc = "一个10x20毫米无壳穿甲冲锋手枪弹匣。"
	caliber = CALIBER_10X20_CASELESS
	icon_state = "pl38"
	icon_state_mini = "mag_smg_dark"
	default_ammo = /datum/ammo/bullet/smg/ap
	max_rounds = 32
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_magazine/smg/icc_machinepistol/hp
	name = "\improper PL-38 HP 冲锋手枪弹匣 (10x20mm)"
	desc = "一个10x20毫米无壳空尖弹冲锋手枪弹匣。"
	caliber = CALIBER_10X20_CASELESS
	icon_state = "pl38_hp"
	icon_state_mini = "mag_smg_dark_blue"
	default_ammo = /datum/ammo/bullet/smg/hollow
	max_rounds = 32
	w_class = WEIGHT_CLASS_SMALL

//-------------------------------------------------------
//L-40, ICC PDW

/obj/item/ammo_magazine/smg/icc_pdw
	name = "\improper L-40 AP 个人防卫武器弹匣（4.6毫米）"
	desc = "一个4.6毫米无壳穿甲PDW弹匣。"
	caliber = CALIBER_46X30
	icon_state = "l40"
	icon_state_mini = "mag_smg_dark"
	default_ammo = /datum/ammo/bullet/smg/ap/hv
	max_rounds = 45
	w_class = WEIGHT_CLASS_SMALL

//------------------------------------------------------
//C17 riot PDW

/obj/item/ammo_magazine/smg/vsd_pdw
	name = "\improper C17 弹鼓（.45 ACP）"
	desc = "一个穿甲型.45 ACP无壳冲锋枪弹匣。"
	default_ammo = /datum/ammo/bullet/smg/ap/hv
	caliber = CALIBER_45ACP
	icon_state = "ppsh_ext"
	max_rounds = 55
	w_class = WEIGHT_CLASS_SMALL
	icon_state_mini = "mag_drum_yellow"
