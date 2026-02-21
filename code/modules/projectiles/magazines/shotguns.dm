//-------------------------------------------------------
//Generic shotgun magazines. Only three of them, since all shotguns can use the same ammo unless we add other gauges.

/*
Shotguns don't really use unique "ammo" like other guns. They just load from a pool of ammo and generate the projectile
on the go. There's also buffering involved. But, we do need the ammo to check handfuls type, and it's nice to have when
you're looking back on the different shotgun projectiles available. In short of it, it's not needed to have more than
one type of shotgun ammo, but I think it helps in referencing it. ~N
*/
/obj/item/ammo_magazine/shotgun
	name = "一盒12号霰弹枪独头弹"
	desc = "装满重型霰弹枪弹的盒子。永恒的经典。12号口径。"
	icon_state = "slugs"
	icon = 'icons/obj/items/ammo/shotgun.dmi'
	default_ammo = /datum/ammo/bullet/shotgun/slug
	caliber = CALIBER_12G //All shotgun rounds are 12g right now.
	max_rounds = 25 // Real shotgun boxes are usually 5 or 25 rounds. This works with the new system, five handfuls.
	w_class = WEIGHT_CLASS_BULKY // Can't throw it in your pocket, friend.
	icon_state_mini = "slugs"

/obj/item/ammo_magazine/shotgun/incendiary
	name = "12号口径燃烧独头弹盒"
	desc = "一个装满自爆燃烧霰弹枪弹药的盒子。12号口径。"
	icon_state = "incendiary"
	default_ammo = /datum/ammo/bullet/shotgun/incendiary
	icon_state_mini = "incendiary"

/obj/item/ammo_magazine/shotgun/buckshot
	name = "12号鹿弹弹匣"
	desc = "一个装满鹿弹霰弹枪弹的盒子。12号口径。"
	icon_state = "buckshot"
	default_ammo = /datum/ammo/bullet/shotgun/buckshot
	icon_state_mini = "buckshot"

/obj/item/ammo_magazine/shotgun/flechette
	name = "12号霰弹箭弹箱"
	desc = "装满霰弹枪箭弹的弹药箱。12号口径。"
	icon_state = "flechette"
	default_ammo = /datum/ammo/bullet/shotgun/flechette
	icon_state_mini = "flechette"

/obj/item/ammo_magazine/shotgun/beanbag
	name = "12号口径豆袋弹盒"
	desc = "一个装满豆袋弹霰弹枪弹的盒子，用于非致命人群控制。12号口径。"
	icon_state = "beanbag"
	default_ammo = /datum/ammo/bullet/shotgun/beanbag
	icon_state_mini = "beanbag"

/obj/item/ammo_magazine/shotgun/tracker
	name = "12号径追踪弹弹匣"
	desc = "装满追踪者霰弹枪弹的盒子。12号口径。"
	icon_state = "tracking"
	default_ammo = /datum/ammo/bullet/shotgun/tracker
	icon_state_mini = "tracking"

/obj/item/ammo_magazine/shotgun/blank
	name = "12号口径空包弹盒"
	desc = "装满空包弹的霰弹枪弹盒。12号口径。"
	icon_state = "blank"
	default_ammo = /datum/ammo/bullet/shotgun/blank
	icon_state_mini = "blank"

/obj/item/ammo_magazine/rifle/bolt
	name = "7.62x54mmR 步枪弹匣盒"
	desc = "装满步枪弹道的板条箱。"
	icon_state = "7.62" //Thank you Alterist
	icon = 'icons/obj/items/ammo/packet.dmi'
	default_ammo = /datum/ammo/bullet/sniper/svd
	caliber = CALIBER_762X54 //Cyka Blyat
	max_rounds = 20 // Real rifle boxes are usually 20 rounds. This works with the new system, four handfuls.
	w_class = WEIGHT_CLASS_SMALL // CAN throw it in your pocket, friend.
	icon_state_mini = "mosin"

/obj/item/ammo_magazine/rifle/boltclip //Nearly 1:1 copy of above
	name = "7.62x54mmR 步枪弹匣"
	desc = "一个装满步枪弹道的可抛弃式弹夹。"
	icon_state = "clip"
	default_ammo = /datum/ammo/bullet/sniper/svd
	caliber = CALIBER_762X54
	max_rounds = 4
	w_class = WEIGHT_CLASS_SMALL
	icon_state_mini = "clips"

/obj/item/ammo_magazine/rifle/martini
	name = "一盒 .557/440 步枪弹"
	desc = "装满步枪弹道的板条箱。"
	icon_state = ".557"
	icon = 'icons/obj/items/ammo/packet.dmi'
	default_ammo = /datum/ammo/bullet/sniper/martini
	caliber = CALIBER_557
	max_rounds = 20
	w_class = WEIGHT_CLASS_SMALL
	icon_state_mini = "martini"

/obj/item/ammo_magazine/pistol/derringer
	name = ".40 边缘发火手枪弹盒"
	desc = "装满手枪弹道的盒子。"
	icon_state = "derringer"
	icon = 'icons/obj/items/ammo/packet.dmi'
	default_ammo = /datum/ammo/bullet/pistol/superheavy/derringer
	caliber = CALIBER_41RIM
	max_rounds = 10
	w_class = WEIGHT_CLASS_SMALL
	icon_state_mini = "ammo_packet"

/obj/item/ammo_magazine/shotgun/mbx900
	name = ".410 破甲弹盒"
	desc = "一个装满 .410 脱壳弹的盒子。"
	icon_state = "mbx900_sabot"
	default_ammo = /datum/ammo/bullet/shotgun/mbx900_sabot
	caliber = CALIBER_410
	max_rounds = 25
	w_class = WEIGHT_CLASS_NORMAL
	icon_state_mini = "mbx900_sabot"

/obj/item/ammo_magazine/shotgun/mbx900/buckshot
	name = ".410鹿弹弹匣"
	desc = "一个装满.410鹿弹的盒子。"
	icon_state = "mbx900_buckshot"
	default_ammo = /datum/ammo/bullet/shotgun/mbx900_buckshot
	icon_state_mini = "mbx900_buckshot"

/obj/item/ammo_magazine/shotgun/mbx900/tracking
	name = ".410追踪弹盒"
	desc = "一个装满 .410 追踪弹的盒子。"
	icon_state = "mbx900_tracker"
	default_ammo = /datum/ammo/bullet/shotgun/mbx900_tracker
	icon_state_mini = "mbx900_tracker"

/obj/item/ammo_magazine/shotgun/heavy_buckshot
	name = "6号鹿弹弹匣"
	desc = "一个装满鹿弹散布霰弹枪弹的盒子。6号口径。"
	caliber = CALIBER_6G
	icon_state = "heavy_shotgun_buckshot"
	default_ammo = /datum/ammo/bullet/shotgun/heavy_buckshot
	icon_state_mini = "buckshot_heavy"

/obj/item/ammo_magazine/shotgun/barrikada
	name = "一盒6号口径'巴里卡达'霰弹"
	desc = "一个装满高速霰弹枪独头弹的盒子，绰号'巴里卡达'。据称能击穿几乎所有东西，包括坦克引擎。6号口径。"
	caliber = CALIBER_6G
	icon_state = "heavy_shotgun_barrikada"
	default_ammo = /datum/ammo/bullet/shotgun/barrikada_slug
	icon_state_mini = "barrikada"
