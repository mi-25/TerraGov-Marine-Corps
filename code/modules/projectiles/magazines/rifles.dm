//-------------------------------------------------------
//M41A PULSE RIFLE AMMUNITION

/obj/item/ammo_magazine/rifle/
	name = "\improper PR-412 弹匣 (10x24mm)"
	desc = "一个10毫米突击步枪弹匣。"
	caliber = CALIBER_10X24_CASELESS
	icon_state = "m412"
	icon = 'icons/obj/items/ammo/rifle.dmi'
	icon_state_mini = "mag_rifle"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 40

/obj/item/ammo_magazine/rifle/extended
	name = "\improper PR-412 加长弹匣 (10x24mm)"
	desc = "一个10毫米突击步枪加长弹匣。"
	icon_state = "m412_ext"
	icon_state_mini = "mag_rifle_big_yellow"
	max_rounds = 60
	bonus_overlay = "m412_ex"

/obj/item/ammo_magazine/rifle/incendiary
	name = "\improper PR-412 燃烧弹匣（10x24mm）"
	desc = "一个10毫米突击步枪弹匣。"
	icon_state = "m412_incendiary"
	icon_state_mini = "mag_rifle_big_red"
	default_ammo = /datum/ammo/bullet/rifle/incendiary
	bonus_overlay = "m412_incend"

/obj/item/ammo_magazine/rifle/ap
	name = "\improper PR-412 穿甲弹匣（10x24mm）"
	desc = "一个10毫米穿甲弹匣。"
	icon_state = "m412_ap"
	icon_state_mini = "mag_rifle_big_green"
	default_ammo = /datum/ammo/bullet/rifle/ap
	bonus_overlay = "m412_ap"

//-------------------------------------------------------
//T18 Carbine

/obj/item/ammo_magazine/rifle/standard_carbine
	name = "\improper AR-18 弹匣 (10x24mm)"
	desc = "一个10毫米卡宾枪弹匣。"
	caliber = CALIBER_10X24_CASELESS
	icon_state = "t18"
	icon_state_mini = "mag_rifle_big"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 36

/obj/item/ammo_magazine/rifle/standard_carbine/ap
	name = "\improper AR-18 穿甲弹匣 (10x24mm)"
	desc = "一个10毫米突击卡宾枪弹匣，装有轻型穿甲弹。"
	icon_state = "t18_ap"
	icon_state_mini = "mag_rifle_big_green"
	default_ammo = /datum/ammo/bullet/rifle/hv
	bonus_overlay = "t18_ap"

//-------------------------------------------------------
//T12 Assault Rifle

/obj/item/ammo_magazine/rifle/standard_assaultrifle
	name = "\improper AR-12 弹匣 (10x24mm)"
	desc = "一个10毫米突击步枪弹匣。"
	caliber = CALIBER_10X24_CASELESS
	icon_state = "t12"
	icon_state_mini = "mag_rifle_big"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 50

/obj/item/ammo_magazine/rifle/standard_assaultrifle/ap
	name = "\improper AR-12 穿甲弹匣 (10x24mm)"
	desc = "一个10毫米突击步枪弹匣，装有轻型穿甲弹。"
	icon_state = "t12_ap"
	icon_state_mini = "mag_rifle_big_green"
	default_ammo = /datum/ammo/bullet/rifle/hv
	bonus_overlay = "t12_ap"

//-------------------------------------------------------
//T37 DMR

/obj/item/ammo_magazine/rifle/standard_dmr
	name = "\improper DMR-37 弹匣 (10x27mm)"
	desc = "一个10毫米精确射手步枪弹匣。"
	caliber = CALIBER_10x27_CASELESS
	icon_state = "t37"
	icon_state_mini = "mag_rifle_big"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/bullet/rifle/standard_dmr
	max_rounds = 20

//-------------------------------------------------------
//T64 BR

/obj/item/ammo_magazine/rifle/standard_br
	name = "\improper BR-64弹匣（10x26.5mm）"
	desc = "一个10毫米战斗步枪弹匣。"
	caliber = CALIBER_10x265_CASELESS
	icon_state = "t64"
	icon_state_mini = "mag_rifle_big"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/bullet/rifle/standard_br
	max_rounds = 36

//-------------------------------------------------------
//M41A TRUE AND ORIGINAL

/obj/item/ammo_magazine/rifle/m41a
	name = "\improper PR-11 弹匣 (10x24mm)"
	desc = "PR-11脉冲步枪的半矩形弹匣。"
	icon_state = "m41a"
	icon_state_mini = "mag_rifle_big_light"
	max_rounds = 95


//-------------------------------------------------------
//Kalashnikov rifles

/obj/item/ammo_magazine/rifle/mpi_km
	name = "\improper MPi-KM 弹匣 (7.62x39mm)"
	desc = "一个40发7.62x39毫米弹匣，适用于卡拉什尼科夫系列枪械。"
	caliber = CALIBER_762X39
	icon_state = "ak_40"
	icon_state_mini = "mag_rifle_brown"
	bonus_overlay = "ak_40"
	default_ammo = /datum/ammo/bullet/rifle/mpi_km
	max_rounds = 40
	scatter_mod = 2
	aim_speed_mod = 0.1
	wield_delay_mod = 0.1 SECONDS

/obj/item/ammo_magazine/rifle/mpi_km/plum
	desc = "一个用于卡拉什尼科夫系列枪械的7.62x39毫米弹匣。这个弹匣带有旧式的梅子色涂层。"
	icon_state = "ak_40_plum"
	icon_state_mini = "mag_rifle_darkpurple"
	bonus_overlay = "ak_40_plum"

/obj/item/ammo_magazine/rifle/mpi_km/black
	desc = "一个用于卡拉什尼科夫系列枪械的7.62x39毫米弹匣。这个弹匣采用了现代黑色聚合物表面处理。"
	icon_state = "ak_40_black"
	icon_state_mini = "mag_rifle"
	bonus_overlay = "ak_40_black"

/obj/item/ammo_magazine/rifle/mpi_km/carbine
	name = "\improper V-34弹匣（7.62x39mm）"
	desc = "一个30发7.62x39毫米弹匣，适用于卡拉什尼科夫系列枪械。"
	icon_state = "ak_30"
	icon_state_mini = "mag_rifle_brown"
	bonus_overlay = "ak_30"
	max_rounds = 30
	scatter_mod = 0
	aim_speed_mod = 0
	wield_delay_mod = 0

/obj/item/ammo_magazine/rifle/mpi_km/carbine/plum
	desc = "一个30发7.62x39毫米弹匣，适用于卡拉什尼科夫系列枪械。这个弹匣带有旧式的梅子色涂层。"
	icon_state = "ak_30_plum"
	icon_state_mini = "mag_rifle_darkpurple"
	bonus_overlay = "ak_30_plum"

/obj/item/ammo_magazine/rifle/mpi_km/carbine/black
	desc = "一个30发7.62x39毫米弹匣，适用于卡拉什尼科夫系列枪械。这款采用了现代黑色聚合物表面处理。"
	icon_state = "ak_30_black"
	icon_state_mini = "mag_rifle"
	bonus_overlay = "ak_30_black"

/obj/item/ammo_magazine/rifle/mpi_km/extended
	name = "\improper MPi-KM 加长弹匣 (7.62x39mm)"
	desc = "一个60发7.62x39毫米卡拉什尼科夫弹匣。这个弹匣格外沉重。"
	icon_state = "ak47_ext"
	icon_state_mini = "mag_rifle"
	bonus_overlay = "ak47_ex"
	max_rounds = 60
	aim_speed_mod = 0.2
	wield_delay_mod = 0.2

// RPD

/obj/item/ammo_magazine/rifle/lmg_d
	name = "\improper lMG-D 弹鼓（7.62x39mm）"
	desc = "一个100发7.62x39毫米卡拉什尼科夫弹鼓，无法适配大多数卡拉什尼科夫步枪，因为它专为弹链供弹型号设计。"
	caliber = CALIBER_762X39
	default_ammo = /datum/ammo/bullet/rifle/mpi_km
	icon_state = "rpd"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	icon_state_mini = "mag_drum_big"
	bonus_overlay = "rpd_100"
	max_rounds = 100

//-------------------------------------------------------
//DP-27

/obj/item/ammo_magazine/rifle/dpm
	name = "\improper 捷格加廖夫弹鼓穿甲弹匣（7.62x39mm）"
	desc = "德格佳廖夫机枪的弹鼓弹匣。"
	caliber = CALIBER_762X39
	icon_state = "dp27"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	default_ammo = /datum/ammo/bullet/rifle/ap
	max_rounds = 47
	icon_state_mini = "dpm"

//-------------------------------------------------------
//M16 RIFLE

/obj/item/ammo_magazine/rifle/m16
	name = "\improper M16弹匣（5.56x45mm）"
	desc = "M16突击步枪平台的5.56x45毫米弹匣。"
	caliber = CALIBER_556X45
	icon_state = "m16" //PLACEHOLDER
	icon_state_mini = "mag_rifle_big"
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 30 //Also comes in 30 and 100 round Beta-C mag.

//-------------------------------------------------------
//FAMAS RIFLE

/obj/item/ammo_magazine/rifle/famas
	name = "\improper FAMAS弹匣（5.56x45mm）"
	desc = "FAMAS突击步枪的5.56x45mm弹匣。"
	caliber = CALIBER_556X45
	icon_state = "famas"
	icon_state_mini = "mag_rifle_greyblue"
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 24

//-------------------------------------------------------
//MG-42 Light Machine Gun

/obj/item/ammo_magazine/standard_lmg
	name = "\improper MG-42弹鼓（10x24mm）"
	desc = "MG-42轻机枪的弹鼓弹匣。"
	icon_state = "t42"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	icon_state_mini = "mag_drum"
	caliber = CALIBER_10X24_CASELESS
	default_ammo = /datum/ammo/bullet/rifle
	w_class = WEIGHT_CLASS_NORMAL
	max_rounds = 120

//-------------------------------------------------------
//MG-60 General Purpose Machine Gun

/obj/item/ammo_magazine/standard_gpmg
	name = "\improper MG-60通用机枪弹链箱（10x26mm）"
	desc = "MG-60通用机枪的弹链箱。"
	icon_state = "t60"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	icon_state_mini = "mag_gpmg"
	caliber = CALIBER_10x26_CASELESS
	default_ammo = /datum/ammo/bullet/rifle/machinegun
	w_class = WEIGHT_CLASS_NORMAL
	max_rounds = 200
	reload_delay = 3 SECONDS

//-------------------------------------------------------
//PR-412L1 HEAVY PULSE RIFLE

/obj/item/ammo_magazine/m412l1_hpr
	name = "\improper PR-412L1 弹匣盒（10x24mm）"
	desc = "PR-412L1重型脉冲步枪使用的半矩形弹匣。"
	icon_state = "m412l1"
	icon = 'icons/obj/items/ammo/rifle.dmi'
	icon_state_mini = "mag_box"
	caliber = CALIBER_10X24_CASELESS
	default_ammo = /datum/ammo/bullet/rifle
	w_class = WEIGHT_CLASS_NORMAL
	max_rounds = 200

//-------------------------------------------------------
//UPP TYPE 71 RIFLE

/obj/item/ammo_magazine/rifle/type71
	name = "\improper 71型弹匣（7.62x39mm）"
	desc = "适用于71式步枪的7.62x39毫米弹匣。"
	caliber = CALIBER_762X39
	icon_state = "type_71"
	icon_state_mini = "mag_rifle_big"
	default_ammo = /datum/ammo/bullet/rifle/mpi_km
	max_rounds = 42

//-------------------------------------------------------
//PMC PR-416
/obj/item/ammo_magazine/rifle/m416
	name = "\improper RA-SH-416 弹匣 (10x25mm 穿甲弹)"
	desc = "一个10x25毫米穿甲弹匣。"
	caliber = CALIBER_10X25_CASELESS
	icon_state = "pr416"
	icon_state_mini = "mag_rifle_big"
	default_ammo = /datum/ammo/bullet/rifle/heavy/ap
	max_rounds = 40


//TX-16 AUTOMATIC SHOTGUN

/obj/item/ammo_magazine/rifle/tx15_flechette
	name = "\improper SH-15 霰弹弹匣（16号口径）"
	desc = "一个16号口径箭弹弹匣，用于SH-15。"
	caliber = CALIBER_16G
	icon_state = "tx15_flechette"
	icon_state_mini = "mag_tx15_flechette"
	default_ammo = /datum/ammo/bullet/shotgun/tx15_flechette
	max_rounds = 12
	bonus_overlay = "tx15_flech"

/obj/item/ammo_magazine/rifle/tx15_slug
	name = "\improper SH-15独头弹弹匣（16号口径）"
	desc = "一盒16号口径独头弹弹匣，适用于SH-15。"
	caliber = CALIBER_16G
	icon_state = "tx15_slug"
	icon_state_mini = "mag_tx15_slug"
	default_ammo = /datum/ammo/bullet/shotgun/tx15_slug
	max_rounds = 12
	bonus_overlay = "tx15_slug"

//-------------------------------------------------------
//SMARTMACHINEGUN AMMUNITION

/obj/item/ammo_magazine/standard_smartmachinegun
	name = "\improper SG-29 弹鼓"
	desc = "一个宽大的弹鼓弹匣，精心装填了10x26毫米专用智能弹药。"
	caliber = CALIBER_10x26_CASELESS
	icon_state = "sg29"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	icon_state_mini = "mag_sg29"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/bullet/smartmachinegun
	max_rounds = 250
	reload_delay = 2.5 SECONDS

/obj/item/ammo_magazine/smart_gpmg
	name = "\improper SG-60 弹匣箱（10x26mm 空尖弹）"
	desc = "SG-60机枪的弹链箱。"
	icon_state = "sg60"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	icon_state_mini = "mag_gpmg"
	caliber = CALIBER_10x26_CASELESS
	default_ammo = /datum/ammo/bullet/smartmachinegun
	w_class = WEIGHT_CLASS_NORMAL
	max_rounds = 250
	reload_delay = 3 SECONDS

//-------------------------------------------------------
//SMART TARGET RIFLE AMMUNITION

/obj/item/ammo_magazine/rifle/standard_smarttargetrifle
	name = "\improper SG-62弹匣（10x27mm高压弹）"
	desc = "一个装满10x27毫米专用智能弹的弹匣。"
	caliber = CALIBER_10x27_CASELESS
	icon_state = "sg62"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/bullet/smarttargetrifle
	max_rounds = 40
	icon_state_mini = "mag_rifle"

//-------------------------------------------------------
//SPOTTING RIFLE AMMUNITION

/obj/item/ammo_magazine/rifle/standard_spottingrifle
	name = "\improper SG-153 弹匣 (12.7毫米智能马格南)"
	desc = "一个装满12.7毫米致命智能弹的弹匣，除了威力巨大外别无他用。"
	caliber = CALIBER_12x7
	icon_state = "sg153"
	icon_state_mini = "mag_rifle"
	w_class = WEIGHT_CLASS_SMALL
	default_ammo = /datum/ammo/bullet/spottingrifle
	max_rounds = 5

/obj/item/ammo_magazine/rifle/standard_spottingrifle/highimpact
	name = "\improper SG-153 高冲击弹匣（12.7毫米智能马格南）"
	desc = "一个装满12.7毫米高冲击智能弹的弹匣，这些子弹很可能会使任何被击中的目标踉跄并减速。"
	icon_state = "sg153_hi"
	icon_state_mini = "mag_rifle_blue"
	default_ammo = /datum/ammo/bullet/spottingrifle/highimpact

/obj/item/ammo_magazine/rifle/standard_spottingrifle/heavyrubber
	name = "\improper SG-153重型橡胶弹匣（12.7毫米智能马格南）"
	desc = "一个装满12.7毫米重型橡胶智能弹的弹匣，这些子弹很可能会击晕并击退任何被它们击中的目标。"
	icon_state = "sg153_hr"
	icon_state_mini = "mag_rifle_red"
	default_ammo = /datum/ammo/bullet/spottingrifle/heavyrubber

/obj/item/ammo_magazine/rifle/standard_spottingrifle/plasmaloss
	name = "\improper SG-153 缠足弹弹匣（12.7毫米智能马格南）"
	desc = "一个装满12.7毫米智能子弹的弹匣，弹头涂有'缠足'毒药，这些子弹会耗尽被击中目标的能量。"
	icon_state = "sg153_pl"
	icon_state_mini = "mag_rifle_purple"
	default_ammo = /datum/ammo/bullet/spottingrifle/plasmaloss

/obj/item/ammo_magazine/rifle/standard_spottingrifle/tungsten
	name = "\improper SG-153 钨制弹匣（12.7毫米智能马格南）"
	desc = "一个装满12.7毫米钨芯智能弹的弹匣，这些子弹会猛烈击退任何被击中的目标。"
	icon_state = "sg153_tg"
	icon_state_mini = "mag_rifle_green"
	default_ammo = /datum/ammo/bullet/spottingrifle/tungsten

/obj/item/ammo_magazine/rifle/standard_spottingrifle/incendiary
	name = "\improper SG-153 燃烧弹匣（12.7毫米智能马格南）"
	desc = "一个装满12.7毫米智能燃烧弹的弹匣，这些子弹会点燃任何它们击中的目标。"
	icon_state = "sg153_ic"
	icon_state_mini = "mag_rifle_orange"
	default_ammo = /datum/ammo/bullet/spottingrifle/incendiary

/obj/item/ammo_magazine/rifle/standard_spottingrifle/flak
	name = "\improper SG-153 破片弹匣（12.7毫米智能马格南）"
	desc = "一个装满12.7毫米防空智能弹的弹匣，这些弹药在接触有机目标时会空爆，对目标附近小范围区域造成伤害。"
	icon_state = "sg153_fl"
	icon_state_mini = "mag_rifle_cyan"
	default_ammo = /datum/ammo/bullet/spottingrifle/flak

//-------------------------------------------------------
//SMARTRIFLE AMMUNITION

/obj/item/ammo_magazine/rifle/standard_smartrifle
	name = "\improper SG-25弹匣（10x26mm空尖弹）"
	desc = "一个10毫米突击步枪弹匣。"
	caliber = CALIBER_10x26_CASELESS
	icon_state = "sg25"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/bullet/smartmachinegun
	max_rounds = 100
	icon_state_mini = "mag_rifle_big"


//-------------------------------------------------------
//Sectoid Rifle

/obj/item/ammo_magazine/rifle/sectoid_rifle
	name = "异形步枪等离子体弹匣"
	desc = "一个装满强力等离子体弹的弹匣。里面的弹药看起来与你见过的任何东西都不同。"
	caliber = CALIBER_ALIEN
	icon_state = "alien_rifle"
	icon_state_mini = "mag_rifle_alien"
	default_ammo = /datum/ammo/energy/sectoid_plasma
	max_rounds = 20

//-------------------------------------------------------
//Marine magazine sniper, or the SR-127.
/obj/item/ammo_magazine/rifle/chamberedrifle
	name = "SR-127 栓动步枪弹匣"
	desc = "一个装满8.6x70毫米步枪弹的弹匣，用于SR-127步枪。"
	caliber = CALIBER_86X70
	icon_state = "tl127"
	icon = 'icons/obj/items/ammo/sniper.dmi'
	icon_state_mini = "mag_rifle_big"
	default_ammo = /datum/ammo/bullet/sniper/pfc
	max_rounds = 10
	bonus_overlay = "tl127_mag"

/obj/item/ammo_magazine/rifle/chamberedrifle/flak
	name = "SR-127 栓动步枪 破片弹匣"
	desc = "一个装满8.6x70毫米步枪破片弹的弹匣，用于SR-127步枪。"
	icon_state = "tl127_flak"
	icon_state_mini = "mag_rifle_big_blue"
	default_ammo = /datum/ammo/bullet/sniper/pfc/flak
	bonus_overlay = "tl127_flak"

//-------------------------------------------------------
//Marine magazine automatic sniper, or the SR-81.
/obj/item/ammo_magazine/rifle/autosniper
	name = "\improper SR-81 自动狙击步枪弹匣"
	desc = "一个装满低压8.6x70毫米步枪弹的弹匣，用于SR-81步枪。"
	caliber = CALIBER_86X70
	icon_state = "t81"
	icon_state_mini = "mag_rifle_greyblue"
	default_ammo = /datum/ammo/bullet/sniper/auto
	max_rounds = 20

//-------------------------------------------------------
//G-11, AR-11
/obj/item/ammo_magazine/rifle/tx11
	name = "\improper AR-11 战斗步枪弹匣"
	desc = "一个装满4.92×34毫米步枪弹的弹匣，用于AR-11步枪。"
	caliber = CALIBER_492X34_CASELESS
	icon_state = "tx11"
	icon_state_mini = "mag_tx11"
	default_ammo = /datum/ammo/bullet/rifle/hv
	max_rounds = 70

//-------------------------------------------------------
//AR-21
/obj/item/ammo_magazine/rifle/standard_skirmishrifle
	name = "\improper AR-21 突击步枪弹匣"
	desc = "一个装满10x25毫米步枪弹的弹匣，用于AR-21步枪。"
	caliber = CALIBER_10X25_CASELESS
	icon_state = "t21"
	icon_state_mini = "mag_rifle"
	default_ammo = /datum/ammo/bullet/rifle/heavy
	max_rounds = 40

//ALF-51B

/obj/item/ammo_magazine/rifle/alf_machinecarbine
	name = "\improper ALF-51B 弹匣盒 (10x25mm)"
	desc = "ALF-51B 机枪卡宾枪的弹匣。"
	icon_state = "t60"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	icon_state_mini = "mag_gpmg"
	caliber = CALIBER_10X25_CASELESS
	default_ammo = /datum/ammo/bullet/rifle/som_machinegun
	w_class = WEIGHT_CLASS_NORMAL
	max_rounds = 80
	reload_delay = 1 SECONDS

//-------------------------------------------------------
//MKH98

/obj/item/ammo_magazine/rifle/mkh
	name = "\improper MKH-98 风暴步枪弹匣"
	desc = "一个装有7.62X39步枪弹的弹匣，用于MKH。"
	caliber = CALIBER_762X39
	icon_state = "mkh98"
	icon_state_mini = "mag_rifle_greyblue"
	default_ammo = /datum/ammo/bullet/rifle/heavy
	max_rounds = 30

//-------------------------------------------------------
//GL-54
/obj/item/ammo_magazine/rifle/tx54
	name = "\improper 20毫米空爆手雷弹匣"
	desc = "一个装有空爆手雷的20毫米弹匣。适用于GL-54或AR-55。"
	caliber = CALIBER_20MM
	icon_state = "tx54_airburst"
	icon_state_mini = "mag_sniper_blue"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/tx54
	max_rounds = 8
	greyscale_config = /datum/greyscale_config/ammo
	greyscale_colors = COLOR_AMMO_AIRBURST

/obj/item/ammo_magazine/rifle/tx54/he
	name = "\improper 20毫米高爆手雷弹匣"
	desc = "一个装有高爆手雷的20毫米弹匣。适用于GL-54或AR-55。"
	default_ammo = /datum/ammo/tx54/he
	icon_state = "tx54_airburst"
	icon_state_mini = "mag_sniper_red"
	greyscale_colors = COLOR_AMMO_HIGH_EXPLOSIVE

/obj/item/ammo_magazine/rifle/tx54/incendiary
	name = "\improper 20毫米燃烧手雷弹匣"
	desc = "一个装有燃烧手雷的20毫米弹匣。适用于GL-54或AR-55。"
	default_ammo = /datum/ammo/tx54/incendiary
	icon_state = "tx54_airburst"
	icon_state_mini = "mag_sniper_orange"
	greyscale_colors = COLOR_AMMO_INCENDIARY

/obj/item/ammo_magazine/rifle/tx54/smoke
	name = "\improper 20毫米战术烟雾手雷弹匣"
	desc = "一个装有战术烟雾手雷的20毫米弹匣。适用于GL-54或AR-55。"
	default_ammo = /datum/ammo/tx54/smoke
	icon_state = "tx54_airburst"
	icon_state_mini = "mag_sniper_green"
	greyscale_colors = COLOR_AMMO_TACTICAL_SMOKE

/obj/item/ammo_magazine/rifle/tx54/smoke/dense
	name = "\improper 20毫米烟雾手雷弹匣"
	desc = "一个装有烟雾手雷的20毫米弹匣。适用于GL-54或AR-55。"
	default_ammo = /datum/ammo/tx54/smoke/dense
	icon_state = "tx54_airburst"
	icon_state_mini = "mag_sniper_cyan"
	greyscale_colors = COLOR_AMMO_SMOKE

/obj/item/ammo_magazine/rifle/tx54/smoke/tangle
	name = "\improper 20毫米缠足手雷弹匣"
	desc = "一个装有绊脚手雷的20毫米弹匣。适用于GL-54或AR-55。"
	default_ammo = /datum/ammo/tx54/smoke/tangle
	icon_state = "tx54_airburst"
	icon_state_mini = "mag_sniper_purple"
	greyscale_colors = COLOR_AMMO_TANGLEFOOT

/obj/item/ammo_magazine/rifle/tx54/smoke/acid
	name = "\improper 20毫米酸液烟雾手雷弹匣"
	desc = "一个装有酸液手雷的20毫米弹匣。适用于GL-54或AR-55。"
	default_ammo = /datum/ammo/tx54/smoke/acid
	icon_state = "tx54_airburst"
	icon_state_mini = "mag_sniper_green"
	greyscale_colors = COLOR_AMMO_ACID

/obj/item/ammo_magazine/rifle/tx54/razor
	name = "\improper 20毫米剃刀燃烧手雷弹匣"
	desc = "一个装有剃刀燃烧手雷的20毫米弹匣。适用于GL-54或AR-55。"
	default_ammo = /datum/ammo/tx54/razor
	icon_state = "tx54_airburst"
	icon_state_mini = "mag_sniper_yellow"
	greyscale_colors = COLOR_AMMO_RAZORBURN

//-------------------------------------------------------
//Garand
/obj/item/ammo_magazine/rifle/garand
	name = "C1加兰德漏夹"
	desc = "一个装满.30口径步枪弹的漏夹，用于C1加兰德步枪。"
	caliber = CALIBER_3006
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "garand"
	icon_state_mini = "clips"
	default_ammo = /datum/ammo/bullet/rifle/garand
	max_rounds = 8

//-------------------------------------------------------
//V-31 SOM rifle

/obj/item/ammo_magazine/rifle/som
	name = "\improper V-31弹匣 (10x24mm)"
	desc = "为V-31设计的10毫米步枪弹匣。"
	caliber = CALIBER_10X24_CASELESS
	icon_state = "v31"
	icon_state_mini = "mag_thin_cyan"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 50

/obj/item/ammo_magazine/rifle/som/ap
	name = "\improper V-31穿甲弹匣（10x24mm）"
	desc = "为V-31设计的10毫米步枪弹匣，装有穿甲弹。"
	caliber = CALIBER_10X24_CASELESS
	icon_state = "v31_ap"
	icon_state_mini = "mag_thin_green"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/bullet/rifle/hv
	max_rounds = 50

/obj/item/ammo_magazine/rifle/som/incendiary
	name = "\improper V-31燃烧弹弹匣（10x24mm）"
	desc = "为V-31设计的10毫米步枪弹匣，装有燃烧弹。"
	icon_state = "v31_incend"
	icon_state_mini = "mag_thin_red"
	default_ammo = /datum/ammo/bullet/rifle/incendiary

/obj/item/ammo_magazine/rifle/som_big
	name = "\improper V-35弹匣 (10x27mm)"
	desc = "专为V-35设计的10毫米步枪弹匣。"
	caliber = CALIBER_10x27_CASELESS
	icon_state = "v35"
	base_ammo_icon = "v35"
	icon_state_mini = "mag_rifle_big_yellowtip"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/bullet/rifle/som_big
	max_rounds = 20
	bonus_overlay = "v35_mag"
	magazine_flags = MAGAZINE_REFILLABLE|MAGAZINE_SHOW_AMMO

/obj/item/ammo_magazine/rifle/som_big/incendiary
	name = "\improper V-35燃烧弹匣（10x27mm）"
	desc = "为V-35设计的10毫米步枪弹匣，装有燃烧弹药。"
	icon_state = "v35_incend"
	icon_state_mini = "mag_rifle_big_red_yellow"
	default_ammo = /datum/ammo/bullet/rifle/som_big/incendiary
	bonus_overlay = "v35_incend"

/obj/item/ammo_magazine/rifle/som_big/anti_armour
	name = "\improper V-35 反坦克弹匣 (10x27mm)"
	desc = "为V-35设计的10毫米步枪弹匣，装填强力的反装甲弹药。对载具造成显著伤害，并能击穿部分掩体。"
	icon_state = "v35_at"
	icon_state_mini = "mag_rifle_big_blue_yellow"
	default_ammo = /datum/ammo/bullet/rifle/som_big/anti_armour
	bonus_overlay = "v35_at"

//-------------------------------------------------------
//V-41 Machine Gun

/obj/item/ammo_magazine/som_mg
	name = "\improper V-41 弹匣（10x26mm）"
	desc = "V-41机枪的弹鼓弹匣。"
	icon_state = "v41"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	icon_state_mini = "mag_drum_big_long"
	caliber = CALIBER_10x26_CASELESS
	default_ammo = /datum/ammo/bullet/rifle/som_machinegun
	w_class = WEIGHT_CLASS_NORMAL
	max_rounds = 200
	reload_delay = 3 SECONDS

//-------------------------------------------------------
//L-11 Sharpshooter Rifle

/obj/item/ammo_magazine/rifle/icc_sharpshooter
	name = "\improper L-11 神射手步枪弹匣（10x27mm）"
	desc = "一个10毫米精确射手步枪弹匣。"
	caliber = CALIBER_10x27_CASELESS
	icon_state = "l11"
	icon_state_mini = "mag_rifle"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/bullet/rifle/standard_dmr
	max_rounds = 20

//-------------------------------------------------------
//L-15 Battlecarbine
/obj/item/ammo_magazine/rifle/icc_battlecarbine
	name = "\improper L-15战斗卡宾枪弹匣（10x25毫米）"
	desc = "一个为L-15步枪装填10x25mm步枪弹的弹匣。"
	caliber = CALIBER_10X25_CASELESS
	icon_state = "l15"
	icon_state_mini = "mag_rifle"
	default_ammo = /datum/ammo/bullet/rifle/heavy
	max_rounds = 30

//-------------------------------------------------------
//ML-12 Confrontation Rifle
/obj/item/ammo_magazine/rifle/icc_confrontationrifle
	name = "\improper ML-12 战斗卡宾枪弹匣 (10x28mm)"
	desc = "一个为ML-12步枪装填的10x28毫米穿甲步枪弹匣。"
	caliber = CALIBER_10X28_CASELESS
	icon_state = "ml12"
	icon_state_mini = "mag_rifle_big"
	default_ammo = /datum/ammo/bullet/rifle/icc_confrontationrifle
	max_rounds = 25

//-------------------------------------------------------
//ML-41 Autoshotgun
/obj/item/ammo_magazine/rifle/icc_autoshotgun
	name = "\improper ML-41自动霰弹枪箭弹鼓形弹匣（12G）"
	desc = "为ML-41装填的12G箭弹弹匣。"
	caliber = CALIBER_12G
	icon_state = "ml41"
	default_ammo = /datum/ammo/bullet/shotgun/flechette
	max_rounds = 16
	icon_state_mini = "mag_rifle"

/obj/item/ammo_magazine/rifle/icc_autoshotgun/frag
	name = "\improper ML-41自动霰弹枪破片弹鼓（12G）"
	desc = "一个为ML-41装填的12G破片弹弹匣。"
	caliber = CALIBER_12G
	icon_state = "ml41_frag"
	default_ammo = /datum/ammo/bullet/shotgun/frag
	max_rounds = 12

//-------------------------------------------------------
//L-88 Assault Carbine
/obj/item/ammo_magazine/rifle/icc_assaultcarbine
	name = "\improper L-88 突击卡宾枪弹匣（5.56x45mm）"
	desc = "一个为L-88系列枪械装填5.56x45毫米步枪弹的弹匣。"
	caliber = CALIBER_556X45
	icon_state = "aug"
	icon_state_mini = "mag_rifle_olive"
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 30

/obj/item/ammo_magazine/rifle/icc_assaultcarbine/export
	name = "\improper EM-88 突击卡宾枪弹匣（5.56x45mm）"
	desc = "一个装有5.56x45毫米步枪弹的弹匣，适用于EM-88系列枪械。"

//-------------------------------------------------------
//ML-41 Assault Machiengun
/obj/item/ammo_magazine/icc_mg
	name = "\improper ML-41通用机枪弹链盒（10x26mm）"
	desc = "ML-41突击机枪的弹链箱。"
	icon_state = "minimi"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	icon_state_mini = "mag_gpmg"
	caliber = CALIBER_10x26_CASELESS
	default_ammo = /datum/ammo/bullet/rifle/machinegun
	w_class = WEIGHT_CLASS_NORMAL
	max_rounds = 150
	reload_delay = 2 SECONDS

// This is a 'belt'.
/obj/item/ammo_magazine/icc_mg/belt
	name = "\improper ML-41通用机枪背包弹匣（10x26mm）"
	desc = "ML-41 的弹匣包，用于在内部携带弹药。"
	icon_state = "minimi_belt"
	equip_slot_flags = ITEM_SLOT_BELT
	magazine_flags = MAGAZINE_WORN
	w_class = WEIGHT_CLASS_HUGE
	max_rounds = 750

/obj/item/ammo_magazine/icc_mg/packet
	name = "10x26mm弹药箱"
	desc = "一个装有500发10x26毫米无壳弹的弹药箱。"
	icon_state = "minimi"
	icon_state_mini = "ammo_packet"
	icon = 'icons/obj/items/ammo/packet.dmi'
	current_rounds = 500
	max_rounds = 500

// L26

/obj/item/ammo_magazine/rifle/vsd_mg
	name = "\improper L26 弹箱（5.56x45mm）"
	desc = "L26的200发弹箱。"
	caliber = CALIBER_556X45
	default_ammo = /datum/ammo/bullet/rifle
	icon_state = "l26"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	icon_state_mini = "mag_drum_big_long"
	bonus_overlay = "l26_100"
	max_rounds = 200

//CC/67

/obj/item/ammo_magazine/rifle/vsd_rifle
	name = "\improper CC/67弹匣（10x27mm）"
	desc = "一个10x27mm步枪弹匣。"
	caliber = CALIBER_10x27_CASELESS
	icon_state = "c550"
	icon_state_mini = "mag_rifle_big"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/bullet/rifle/standard_dmr
	max_rounds = 30

//CC/74

/obj/item/ammo_magazine/rifle/vsd_mg_main
	name = "\improper CC/74 弹鼓（7.62x39mm）"
	desc = "CC/74 的 150 发弹箱。"
	caliber = CALIBER_762X39
	default_ammo = /datum/ammo/bullet/rifle/heavy
	icon_state = "c74"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	icon_state_mini = "mag_gpmg"
	bonus_overlay = "c74_100"
	max_rounds = 150

//CC/67

/obj/item/ammo_magazine/rifle/vsd_carbine
	name = "\improper CC/67 弹匣（10x24mm）"
	desc = "一个10x27mm步枪弹匣。"
	caliber = CALIBER_10X24_CASELESS
	icon_state = "c67"
	icon_state_mini = "mag_rifle_big"
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 45



/obj/item/ammo_magazine/rifle/cb31
	name = "\improper CC/B/31 破门独头弹弹匣（12号口径）"
	desc = "一个16号口径独头弹弹匣，用于SH-15。"
	caliber = CALIBER_16G
	icon_state = "cb31"
	icon_state_mini = "mag_tx15_slug"
	default_ammo = /datum/ammo/bullet/shotgun/breaching
	max_rounds = 25
	bonus_overlay = "cb31"

//.410 autoshotgun ammo

/obj/item/ammo_magazine/rifle/sh410_sabot
	name = "\improper SH-410 脱壳弹弹匣（.410 口径）"
	desc = "一盒.410口径脱壳弹弹匣，适用于SH-410。"
	caliber = CALIBER_410_AUTOSHOTGUN
	icon_state = "sh410_sabot"
	icon_state_mini = "mag_sh410_sabot"
	default_ammo = /datum/ammo/bullet/shotgun/sh410_sabot
	max_rounds = 15
	bonus_overlay = "sh410_sabot"

/obj/item/ammo_magazine/rifle/sh410_buckshot
	name = "\improper SH-410 鹿弹弹匣（.410口径）"
	desc = "一盒.410口径鹿弹弹匣，适用于SH-410。"
	caliber = CALIBER_410_AUTOSHOTGUN
	icon_state = "sh410_buckshot"
	icon_state_mini = "mag_sh410_buckshot"
	default_ammo = /datum/ammo/bullet/shotgun/sh410_buckshot
	max_rounds = 15
	bonus_overlay = "sh410_buckshot"

/obj/item/ammo_magazine/rifle/sh410_tracker //fuck it why not
	name = "\improper SH-410 追踪弹匣（.410口径）"
	desc = "一弹匣.410口径追踪弹，用于SH-410...？"
	caliber = CALIBER_410_AUTOSHOTGUN
	icon_state = "sh410_tracker"
	icon_state_mini = "mag_sh410_tracker"
	default_ammo = /datum/ammo/bullet/shotgun/mbx900_tracker
	max_rounds = 15
	bonus_overlay = "sh410_tracker"

/obj/item/ammo_magazine/rifle/sh410_ricochet //bounce
	name = "\improper SH-410 跳弹弹匣（.410口径）"
	desc = "一弹匣.410口径跳弹弹，用于SH-410。它们最多能在表面上弹跳两次。"
	caliber = CALIBER_410_AUTOSHOTGUN
	icon_state = "sh410_ricochet"
	icon_state_mini = "mag_sh410_ricochet"
	default_ammo = /datum/ammo/bullet/shotgun/sh410_ricochet/two
	max_rounds = 15
	bonus_overlay = "sh410_ricochet"

/obj/item/ammo_magazine/rifle/sh410_gas //gas base
	name = "\improper SH-410 气体弹匣（.410口径）"
	desc = "一弹匣.410口径气体弹，用于SH-410。发射时会留下气体轨迹。"
	caliber = CALIBER_410_AUTOSHOTGUN
	icon_state = "sh410_gas"
	icon_state_mini = "mag_sh410_gas"
	default_ammo = /datum/ammo/bullet/shotgun/sh410_gas
	max_rounds = 15
	bonus_overlay = "sh410_gas"
