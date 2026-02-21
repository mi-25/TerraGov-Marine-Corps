//FEB 2024 NOTE: some of these are missing loading_sounds, fix it before using these ingame
//Special ammo magazines for hardpoint modules. Some may not be here since you can use normal magazines on them
/obj/item/ammo_magazine/tank
	icon = 'icons/obj/items/ammo/tank.dmi'
	magazine_flags = NONE
	///loading sound to play when
	var/loading_sound
	///callout name for when user loads ("HE, Up!")
	var/callout_name

/obj/item/ammo_magazine/tank/ltb_cannon
	name = "请求105毫米高爆弹"
	desc = "一枚105毫米高爆弹，装有致命的爆炸装药。"
	caliber = CALIBER_105MM
	icon_state = "ltb"
	w_class = WEIGHT_CLASS_GIGANTIC
	default_ammo = /datum/ammo/rocket/ltb
	max_rounds = 1
	loading_sound = 'sound/vehicles/weapons/ltb_reload.ogg'
	callout_name = "HE"

/obj/item/ammo_magazine/tank/ltb_cannon/heavy
	name = "HE+炮弹（105毫米）"
	desc = "一枚105毫米高爆炮弹，装填了威力极强的爆炸装药。"
	default_ammo = /datum/ammo/rocket/ltb/heavy
	magazine_flags = MAGAZINE_NOT_FABRICABLE
	callout_name = "HE"

/obj/item/ammo_magazine/tank/ltb_cannon/apfds
	name = "请求装填APFDS弹（105毫米）"
	desc = "一枚105毫米穿甲弹，具有卓越的初速和穿透特性。能够穿透墙壁和目标。"
	icon_state = "ltb_apfds"
	default_ammo = /datum/ammo/bullet/tank_apfds
	callout_name = "Sabot"

/obj/item/ammo_magazine/tank/ltb_cannon/canister
	name = "请求105毫米罐装弹"
	desc = "一枚用于摧毁软目标的105毫米霰弹。其装载的数百颗小金属球在弹道上模仿了霰弹枪的射击效果。"
	icon_state = "ltb_canister"
	default_ammo = /datum/ammo/tx54/tank_canister
	callout_name = "Canister"

/obj/item/ammo_magazine/tank/ltb_cannon/canister/incendiary
	name = "请求燃烧弹罐装弹（105毫米）"
	desc = "一枚用于摧毁软目标的105毫米霰弹。其装载的燃烧弹片在弹道上模仿了霰弹枪的射击效果。"
	icon_state = "ltb_canister_incend"
	default_ammo = /datum/ammo/tx54/tank_canister/incendiary
	callout_name = "Incendiary"

/obj/item/ammo_magazine/tank/ltaap_chaingun
	name = "\improper LTA-AP 链式机枪弹匣"
	desc = "主武器链炮弹匣。"
	caliber = CALIBER_762X51
	icon_state = "ltaap"
	w_class = WEIGHT_CLASS_GIGANTIC
	default_ammo = /datum/ammo/bullet/minigun/ltaap
	max_rounds = 150
	loading_sound = 'sound/weapons/guns/interact/working_the_bolt.ogg'

/obj/item/ammo_magazine/tank/ltaap_chaingun/hv
	name = "\improper LTA-AP HV 链炮弹匣"
	desc = "主武器链炮弹匣。装填有高速、非敌我识别弹。"
	icon_state = "ltaap_hv"
	default_ammo = /datum/ammo/bullet/minigun/ltaap/hv
	max_rounds = 200
	magazine_flags = MAGAZINE_REFILLABLE|MAGAZINE_NOT_FABRICABLE

/obj/item/ammo_magazine/tank/autocannon
	name = "灌木丛猎手机炮穿甲弹盒（30毫米）"
	desc = "一门自动炮的100发弹箱。装载穿甲弹。"
	caliber = CALIBER_30X17MM
	icon_state = "tank_autocannon_ap"
	max_rounds = 50
	default_ammo = /datum/ammo/bullet/tank_autocannon_ap
	loading_sound = 'sound/vehicles/weapons/tank_autocannon_reload.ogg'
	callout_name = "Sabot"

/obj/item/ammo_magazine/tank/autocannon/high_explosive
	name = "灌木丛猎手自动炮高爆弹箱（30毫米）"
	desc = "一门自动炮的100发弹箱。装有高爆弹。"
	icon_state = "tank_autocannon_he"
	default_ammo = /datum/ammo/rocket/tank_autocannon_he
	callout_name = "HE"

/obj/item/ammo_magazine/tank/flamer
	name = "喷火器弹匣"
	desc = "次要武器喷火器弹匣"
	caliber = CALIBER_FUEL_THICK
	icon_state = "flametank_large"
	icon = 'icons/obj/items/ammo/flamer.dmi'
	w_class = WEIGHT_CLASS_GIGANTIC
	default_ammo = /datum/ammo/flamethrower/tank_flamer
	max_rounds = 120

/obj/item/ammo_magazine/tank/secondary_cupola
	name = "HSG-102 炮塔弹匣"
	desc = "一个次要武器机枪弹匣"
	caliber = CALIBER_10X28
	icon_state = "cupola"
	loading_sound = 'sound/weapons/guns/interact/working_the_bolt.ogg'
	w_class = WEIGHT_CLASS_GIGANTIC
	default_ammo = /datum/ammo/bullet/cupola
	max_rounds = 75

/obj/item/ammo_magazine/tank/tank_glauncher
	name = "手雷发射器弹匣"
	desc = "副武器手雷弹匣"
	caliber = CALIBER_40MM
	icon_state = "glauncher_2"
	w_class = WEIGHT_CLASS_GIGANTIC
	default_ammo = /datum/ammo/grenade_container
	max_rounds = 10

/obj/item/ammo_magazine/tank/tank_glauncher/update_icon_state()
	if(current_rounds >= max_rounds)
		icon_state = "glauncher_2"
	else if(current_rounds <= 0)
		icon_state = "glauncher_0"
	else
		icon_state = "glauncher_1"

/obj/item/ammo_magazine/tank/tank_slauncher
	name = "烟雾发射器弹匣"
	desc = "支援武器手雷弹匣"
	caliber = CALIBER_40MM
	icon_state = "slauncher_1"
	w_class = WEIGHT_CLASS_GIGANTIC
	default_ammo = /datum/ammo/grenade_container/smoke
	max_rounds = 6

/obj/item/ammo_magazine/tank/tank_slauncher/update_icon_state()
	icon_state = "slauncher_[current_rounds <= 0 ? "0" : "1"]"

//SOM tank
/obj/item/ammo_magazine/tank/volkite_carronade
	name = "沃尔基特卡隆炮电池"
	desc = "一种重型、一次性电池，用于为火山炮提供动力。"
	caliber = CALIBER_84MM
	icon_state = "som_tank_cell"
	w_class = WEIGHT_CLASS_GIGANTIC
	default_ammo = /datum/ammo/energy/volkite/heavy
	max_rounds = 3

/obj/item/ammo_magazine/tank/particle_lance
	name = "粒子长矛能量电池"
	desc = "一种重型、一次性电池，用于为坦克搭载的粒子炮供能。"
	caliber = CALIBER_84MM
	icon_state = "particle_lance_cell"
	w_class = WEIGHT_CLASS_GIGANTIC
	default_ammo = /datum/ammo/energy/particle_lance
	max_rounds = 1
	loading_sound = 'sound/vehicles/weapons/ltb_reload.ogg'

/obj/item/ammo_magazine/tank/secondary_mlrs
	name = "\improper MLRS弹匣"
	desc = "次要武器MLRS弹匣。装有自导高爆火箭弹。"
	caliber = CALIBER_40MM
	icon_state = "secondary_mlrs"
	w_class = WEIGHT_CLASS_GIGANTIC
	default_ammo = /datum/ammo/rocket/homing
	max_rounds = 12

/obj/item/ammo_magazine/tank/coilgun
	name = "线圈炮射弹"
	desc = "一套用于坦克线圈炮的极高密度动能穿甲弹。"
	caliber = CALIBER_84MM
	icon_state = "coilgun"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/rocket/coilgun/holder //this doesn't strictly matter since its overridden
	max_rounds = 1
	loading_sound = 'sound/vehicles/weapons/coilgun_cycle.ogg'

/obj/item/ammo_magazine/tank/secondary_flamer_tank
	name = "凝固汽油流罐"
	desc = "一个装有车载副喷火器燃料的燃料箱。这种燃料箱内的混合物流动性更强，但单次喷射覆盖的面积较小。"
	caliber = CALIBER_FUEL_THICK
	icon_state = "sflamer"
	max_rounds = 150
	default_ammo = /datum/ammo/flamethrower/armored_spray

// ICC Recon Tank
/obj/item/ammo_magazine/tank/sarden_clip
	name = "EM-2600'萨登'穿甲脱壳弹夹（30毫米）"
	desc = "EM-2600 自动炮的 7 发弹夹。装有穿甲弹。"
	caliber = CALIBER_30X17MM
	icon_state = "sarden_clip_apds"
	max_rounds = 7
	default_ammo = /datum/ammo/bullet/sarden

/obj/item/ammo_magazine/tank/sarden_clip/high_explosive
	name = "EM-2600'萨登'高爆弹匣（30毫米）"
	desc = "EM-2600 自动炮的 7 发弹夹。装有高爆弹。"
	caliber = CALIBER_30X17MM
	icon_state = "sarden_clip_apds"
	max_rounds = 7
	default_ammo = /datum/ammo/bullet/sarden/high_explosive

/obj/item/ammo_magazine/tank/icc_lowvel_cannon
	name = "EM-2500 破甲弹（76毫米）"
	desc = "一枚76毫米破甲弹，用于打击硬目标。"
	caliber = CALIBER_76MM
	icon_state = "icc_lvrt_cannon_heat"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/rocket/icc_lowvel_heat
	max_rounds = 1
	loading_sound = 'sound/vehicles/weapons/ltb_reload.ogg'

/obj/item/ammo_magazine/tank/icc_lowvel_cannon/high_explosive
	name = "EM-2500 高爆弹（76毫米）"
	desc = "一枚76毫米高爆弹，用于打击大型软目标群。"
	caliber = CALIBER_76MM
	icon_state = "icc_lvrt_cannon_heat"
	default_ammo = /datum/ammo/rocket/icc_lowvel_high_explosive
	max_rounds = 1
	loading_sound = 'sound/vehicles/weapons/ltb_reload.ogg'

/obj/item/ammo_magazine/tank/tow_missile
	name = "\improper TOW-III导弹"
	desc = "用于副TOW发射器的TOw-III型制导导弹。"
	caliber = CALIBER_68MM
	icon_state = "seekerammo"
	w_class = WEIGHT_CLASS_GIGANTIC
	default_ammo = /datum/ammo/rocket/homing/tow
	max_rounds = 1
	loading_sound = 'sound/weapons/guns/interact/launcher_reload.ogg'

/obj/item/ammo_magazine/tank/microrocket_rack
	name = "微型火箭弹舱架"
	desc = "一个3x2的挂架，装有高爆自导微型火箭弹。"
	caliber = CALIBER_32MM
	icon_state = "secondary_rocketpod"
	w_class = WEIGHT_CLASS_GIGANTIC
	default_ammo = /datum/ammo/rocket/homing/microrocket
	max_rounds = 6
	loading_sound = 'sound/weapons/guns/interact/launcher_reload.ogg'

/obj/item/ammo_magazine/tank/bfg
	name = "\improper BFG反物质容器"
	desc = "一个装有反物质用于BFG弹丸的反物质约束舱。切勿打开，否则有爆炸危险。"
	icon_state = "bfg"
	w_class = WEIGHT_CLASS_GIGANTIC
	caliber = CALIBER_ANTIMATTER
	default_ammo = /datum/ammo/energy/bfg
	max_rounds = 1
	loading_sound = 'sound/vehicles/weapons/ltb_reload.ogg'
