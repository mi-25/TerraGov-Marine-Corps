
//-------------------------------------------------------
//M4A3 PISTOL

/obj/item/ammo_magazine/pistol/standard_pistol
	name = "\improper P-14弹匣（9毫米）"
	desc = "一个手枪弹匣。"
	caliber = CALIBER_9X19
	icon_state = "tp14"
	icon_state_mini = "mag_pistol"
	max_rounds = 21
	w_class = WEIGHT_CLASS_SMALL
	default_ammo = /datum/ammo/bullet/pistol

//-------------------------------------------------------
//PP-7 Plasma Pistol
/obj/item/ammo_magazine/pistol/plasma_pistol
	name = "\improper PP-7 等离子体电池"
	desc = "PP-7等离子体手枪的能量电池。"
	caliber = CALIBER_PLASMA
	icon_state = "tx7"
	max_rounds = 10
	w_class = WEIGHT_CLASS_SMALL
	default_ammo = /datum/ammo/energy/plasma_pistol
	magazine_flags = NONE
	icon_state_mini = "mag_plasma"

//-------------------------------------------------------
//RT-3 PISTOL

/obj/item/ammo_magazine/pistol
	name = "\improper RT-3 弹匣 (9mm)"
	desc = "一个手枪弹匣。"
	caliber = CALIBER_9X19
	icon_state = "m4a3"
	icon = 'icons/obj/items/ammo/pistol.dmi'
	max_rounds = 14
	w_class = WEIGHT_CLASS_SMALL
	default_ammo = /datum/ammo/bullet/pistol
	icon_state_mini = "mag_pistol_orange"

/obj/item/ammo_magazine/pistol/hp
	name = "\improper M4A3 空尖弹弹匣 (9毫米)"
	icon_state = "m4a3_hp"
	default_ammo = /datum/ammo/bullet/pistol/hollow
	icon_state_mini = "mag_pistol_blue"

/obj/item/ammo_magazine/pistol/ap
	name = "\improper M4A3 穿甲弹匣 (9mm)"
	icon_state = "m4a3_ap"
	default_ammo = /datum/ammo/bullet/pistol/ap
	icon_state_mini = "mag_pistol_green"

/obj/item/ammo_magazine/pistol/incendiary
	name = "\improper M4A3燃烧弹匣（9毫米）"
	icon_state = "m4a3_incendiary"
	default_ammo = /datum/ammo/bullet/pistol/incendiary
	icon_state_mini = "mag_pistol_red"

/obj/item/ammo_magazine/pistol/extended
	name = "\improper M4A3 加长弹匣（9毫米）"
	max_rounds = 24
	icon_state = "m4a3_ext"
	icon_state_mini = "mag_pistol_yellow"

//-------------------------------------------------------
//P-1911

/obj/item/ammo_magazine/pistol/m1911
	name = "\improper P-1911 弹匣 (.45)"
	default_ammo = /datum/ammo/bullet/pistol/heavy
	caliber = CALIBER_45ACP
	icon_state = "1911"
	icon_state_mini = "mag_pistol_normal"
	max_rounds = 10



//-------------------------------------------------------
//P-23

/obj/item/ammo_magazine/pistol/standard_heavypistol
	name = "\improper P-23 弹匣 (.45)"
	default_ammo = /datum/ammo/bullet/pistol/heavy
	caliber = CALIBER_45ACP
	icon_state = ".45"
	icon_state_mini = "mag_pistol"
	max_rounds = 14


//-------------------------------------------------------
//Beretta 92FS, the gun McClane carries around in Die Hard. Very similar to the service pistol, all around.

/obj/item/ammo_magazine/pistol/g22
	name = "\improper P-22弹匣（9毫米）"
	caliber = CALIBER_9X19
	icon_state = "g22"
	icon_state_mini = "mag_pistol_normal"
	max_rounds = 15
	default_ammo = /datum/ammo/bullet/pistol

/obj/item/ammo_magazine/pistol/g22tranq
	name = "\improper G22 麻醉弹匣（9毫米）"
	caliber = CALIBER_9X19_TRANQUILIZER
	icon_state = "g22"
	icon_state_mini = "mag_pistol_normal"
	max_rounds = 12
	default_ammo = /datum/ammo/bullet/pistol/tranq


//-------------------------------------------------------
//DEAGLE //DEAGLE BRAND DEAGLE

/obj/item/ammo_magazine/pistol/heavy
	name = "\improper 沙漠之鹰弹匣 (.50)"
	default_ammo = /datum/ammo/bullet/pistol/superheavy
	caliber = CALIBER_50AE
	icon_state = "50ae"
	max_rounds = 7



//-------------------------------------------------------
//MAUSER MERC PISTOL //Inspired by the Makarov.

/obj/item/ammo_magazine/pistol/c99t
	name = "\improper PK-9 麻醉弹匣 (.22)"
	default_ammo = /datum/ammo/bullet/pistol/tranq
	caliber = CALIBER_22LR
	icon_state = "pk-9_tranq"
	max_rounds = 8
	icon_state_mini = "mag_pistol_green"

/obj/item/ammo_magazine/pistol/c99
	name = "\improper PK-9 空尖弹弹匣 (.22)"
	default_ammo = /datum/ammo/bullet/pistol/hollow
	caliber = CALIBER_22LR
	icon_state = "pk-9"
	icon_state_mini = "mag_pistol_orange"
	max_rounds = 12

//-------------------------------------------------------
//PIZZACHIMP PROTECTION

/obj/item/ammo_magazine/pistol/holdout
	name = "小型手枪弹匣 (.22)"
	desc = "一个出奇小的弹匣，装填.22弹道子弹。不是柯尔布利，但也差不多了。"
	default_ammo = /datum/ammo/bullet/pistol/tiny
	caliber = CALIBER_22LR
	icon_state = ".22"
	icon_state_mini = "mag_pistol_normal"
	max_rounds = 5
	w_class = WEIGHT_CLASS_TINY

//-------------------------------------------------------
//P-17.

/obj/item/ammo_magazine/pistol/standard_pocketpistol
	name = "\improper P-17袖珍手枪穿甲弹匣（.380）"
	desc = "P-17手枪使用的.380 ACP弹道子弹弹匣，尺寸出奇地小。"
	default_ammo = /datum/ammo/bullet/pistol/tiny/ap
	caliber = CALIBER_380ACP
	icon_state = "tp17"
	icon_state_mini = "mag_pistol"
	max_rounds = 8
	w_class = WEIGHT_CLASS_TINY

//-------------------------------------------------------
//Automag. .50.

/obj/item/ammo_magazine/pistol/highpower
	name = "\improper 高威力弹匣 (.50 AE)"
	default_ammo = /datum/ammo/bullet/pistol/superheavy
	caliber = CALIBER_50AE
	icon_state = "m4a3" //PLACEHOLDER
	icon_state_mini = "mag_pistol_normal"
	max_rounds = 13

//-------------------------------------------------------
//VP70 //Not actually the VP70, but it's more or less the same thing. VP70 was the standard sidearm in Aliens though.

/obj/item/ammo_magazine/pistol/vp70
	name = "\improper 88M4穿甲弹匣（9毫米）"
	default_ammo = /datum/ammo/bullet/pistol/ap
	caliber = CALIBER_9X19
	icon_state = "88m4"
	icon_state_mini = "mag_pistol"
	max_rounds = 18

//-------------------------------------------------------
//VP78

/obj/item/ammo_magazine/pistol/vp78
	name = "\improper VP78弹匣（9毫米）"
	default_ammo = /datum/ammo/bullet/pistol/squash
	caliber = CALIBER_9X19
	icon_state = "50ae"
	max_rounds = 18

//-------------------------------------------------------
//MK90M5 standard PMC pistol

/obj/item/ammo_magazine/pistol/mk90
	name = "\improper MK90M4 穿甲弹匣 (9毫米)"
	default_ammo = /datum/ammo/bullet/pistol/ap
	caliber = CALIBER_9X19
	icon_state = "90m4"
	icon_state_mini = "mag_pistol"
	max_rounds = 20

/obj/item/ammo_magazine/pistol/mk90/extended
	name = "\improper MK90M4 加长穿甲弹匣（9毫米）"
	icon_state = "90m4_extended"
	max_rounds = 35
//-------------------------------------------------------
//MK100M5 PMC gyrojet pistol

/obj/item/ammo_magazine/pistol/mk100_gyrojet
	name = "\improper MK100M5 '抑制者'弹匣 (15x50mm)"
	desc = "一把陀螺喷射手枪弹匣。"
	default_ammo = /datum/ammo/bullet/pistol/gyrojet
	caliber = CALIBER_15X50
	icon_state = "100m5"
	max_rounds = 10

//-------------------------------------------------------
//SOM pistol

/obj/item/ammo_magazine/pistol/som
	name = "\improper V-11穿甲弹匣（9毫米）"
	default_ammo = /datum/ammo/bullet/pistol/ap
	caliber = CALIBER_9X19
	icon_state = "v11"
	icon_state_mini = "mag_pistol_normal"
	max_rounds = 18

/obj/item/ammo_magazine/pistol/som/incendiary
	name = "\improper V-11燃烧弹匣（9毫米）"
	icon_state = "v11_incend"
	default_ammo = /datum/ammo/bullet/pistol/incendiary
	icon_state_mini = "mag_pistol_red"

/obj/item/ammo_magazine/pistol/som/extended
	name = "\improper V-11 加长弹匣（9毫米）"
	max_rounds = 30
	icon_state = "v11_extended"
	icon_state_mini = "mag_pistol_yellow"

//-------------------------------------------------------
//PL-5

/obj/item/ammo_magazine/pistol/icc_dpistol
	name = "\improper PL-5 弹匣 (.45)"
	default_ammo = /datum/ammo/bullet/pistol/heavy
	caliber = CALIBER_45ACP
	icon_state = "pl5"
	icon_state_mini = "mag_pistol"
	max_rounds = 18

//-------------------------------------------------------

//A better version of the VP78, with more rounds per magazine. Probably the best pistol around, but takes no attachments.


/obj/item/ammo_magazine/pistol/auto9
	name = "\improper 自动9型弹匣（9毫米）"
	default_ammo = /datum/ammo/bullet/pistol/squash
	caliber = CALIBER_9X19
	icon_state = "tp17"
	icon_state_mini = "mag_pistol"
	max_rounds = 50


//-------------------------------------------------------
//The first rule of monkey pistol is we don't talk about monkey pistol.
/obj/item/ammo_magazine/pistol/chimp
	name = "\improper CHIMP70弹匣（.70M）"
	default_ammo = /datum/ammo/bullet/pistol/mankey
	caliber = CALIBER_70MANKEY
	icon_state = "c70"
	icon_state_mini = "Rule One: donotspeakofthis"
	max_rounds = 300

//SP-13 (Calico)
/obj/item/ammo_magazine/pistol/standard_pistol/smart_pistol
	name = "\improper SP-13 弹匣 (9mm 穿甲弹)"
	caliber = CALIBER_9X19
	icon_state = "tx13"
	icon_state_mini = "mag_pistol_orange"
	max_rounds = 40
	w_class = WEIGHT_CLASS_SMALL
	default_ammo = /datum/ammo/bullet/pistol/ap

//-------------------------------------------------------
// knife
/obj/item/ammo_magazine/pistol/knife
	name = "\improper 弹道刀头（刀片）"
	default_ammo = /datum/ammo/bullet/pistol
	caliber = CALIBER_ALIEN
	icon_state = "knife"
	icon_state_mini = "knife"
	max_rounds = 1

//XM104 cylinder placed in pistols
/obj/item/ammo_magazine/pistol/xmdivider
	name = "\improper XM104 转轮弹巢（.357）"
	desc = "XM104转轮手枪，装填定制.357燃烧弹。"
	default_ammo = /datum/ammo/bullet/revolver/heavy/incen
	max_rounds = 6
	caliber = CALIBER_357
	icon_state = "xm104"
	icon_state_mini = "xm104"

//c96

/obj/item/ammo_magazine/pistol/vsd_pistol
	name = "\improper C96 '防暴'弹匣"
	default_ammo = /datum/ammo/bullet/pistol/ap
	caliber = CALIBER_9X19
	icon_state = "c96"
	icon_state_mini = "mag_pistol_normal"
	max_rounds = 15
