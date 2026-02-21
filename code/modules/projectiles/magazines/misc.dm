/obj/item/ammo_magazine/packet
	name = "某种弹药的箱子"
	desc = "一个装有某种弹药的包裹。"
	icon = 'icons/obj/items/ammo/packet.dmi'
	icon_state_mini = "ammo_packet"
	w_class = WEIGHT_CLASS_NORMAL
	fill_delay = 1.5 SECONDS

/obj/item/ammo_magazine/packet/attack_hand_alternate(mob/living/user)
	. = ..()
	if(current_rounds <= 0)
		balloon_alert(user, "空")
		return
	create_handful(user)

/obj/item/ammo_magazine/packet/p10x24mm
	name = "10x24mm 弹药箱"
	desc = "装有150发10x24毫米无壳弹的弹药箱。"
	caliber = CALIBER_10X24_CASELESS
	icon_state = "10x24mm"
	default_ammo = /datum/ammo/bullet/rifle
	current_rounds = 150
	max_rounds = 150

/obj/item/ammo_magazine/packet/pnato
	name = "5.56x45mm 弹药箱"
	desc = "一个装有150发5.56x45mm子弹的盒子。"
	caliber = CALIBER_556X45
	icon_state = "556mm"
	default_ammo = /datum/ammo/bullet/rifle
	current_rounds = 150
	max_rounds = 150

/obj/item/ammo_magazine/packet/pwarsaw
	name = "7.62x39毫米弹药箱"
	desc = "一个装有120发7.62x39毫米子弹的盒子。"
	caliber = CALIBER_762X39
	icon_state = "7.62x39mm"
	default_ammo = /datum/ammo/bullet/rifle/mpi_km
	current_rounds = 120
	max_rounds = 120

/obj/item/ammo_magazine/packet/p10x265mm
	name = "10x26.5mm弹药箱"
	desc = "一个装有100发10x26.5毫米无壳弹的弹药箱。"
	caliber = CALIBER_10x265_CASELESS
	icon_state = "10x265mm"
	default_ammo = /datum/ammo/bullet/rifle/standard_br
	current_rounds = 100
	max_rounds = 100

/obj/item/ammo_magazine/packet/p10x27mm
	name = "10x27毫米弹药箱"
	desc = "一个装有100发10x27毫米无壳弹的弹药箱。"
	caliber = CALIBER_10x27_CASELESS
	icon_state = "10x27mm"
	default_ammo = /datum/ammo/bullet/rifle/standard_dmr
	current_rounds = 100
	max_rounds = 100

/obj/item/ammo_magazine/packet/p10x25mm
	name = "10x25毫米弹药箱"
	desc = "一个装有125发10x25毫米无壳弹的弹药箱。"
	caliber = CALIBER_10X25_CASELESS
	icon_state = "10x25mm"
	default_ammo = /datum/ammo/bullet/rifle/heavy
	current_rounds = 125
	max_rounds = 125

/obj/item/ammo_magazine/packet/p492x34mm
	name = "4.92x34毫米弹药箱"
	desc = "一个装有210发4.92x34毫米无壳弹的弹箱。"
	caliber = CALIBER_492X34_CASELESS
	icon_state = "4.92x34mm"
	default_ammo = /datum/ammo/bullet/rifle/hv
	current_rounds = 210
	max_rounds = 210

/obj/item/ammo_magazine/packet/p86x70mm
	name = "8.6x70毫米弹药箱"
	desc = "一个装有50发8.6x70毫米无壳弹的弹箱。"
	caliber = CALIBER_86X70
	icon_state = "86x70mm"
	default_ammo = /datum/ammo/bullet/sniper/pfc
	current_rounds = 50
	max_rounds = 50

/obj/item/ammo_magazine/packet/smart_minigun
	name = "SG-85 弹药箱"
	desc = "一个塞得满满当当的沉重容器，里面装有供SG-85能量弹匣使用的500发弹药。"
	icon_state = "smartminigun"
	default_ammo = /datum/ammo/bullet/smart_minigun
	caliber = CALIBER_10x26_CASELESS
	current_rounds = 500
	max_rounds = 500
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/ammo_magazine/packet/smart_targetrifle
	name = "10x27毫米高速弹匣盒"
	desc = "一个装有200发10x27毫米智能弹的弹药箱。"
	icon_state = "smarttargetrifle"
	default_ammo = /datum/ammo/bullet/smarttargetrifle
	caliber = CALIBER_10x27_CASELESS
	current_rounds = 200
	max_rounds = 200

/obj/item/ammo_magazine/packet/smart_spottingrifle
	name = "12.7毫米智能马格南弹匣盒"
	desc = "一个装有25发12.7毫米观测步枪弹的弹药箱。"
	icon_state = "smartspottingrifle"
	default_ammo = /datum/ammo/bullet/spottingrifle
	caliber = CALIBER_12x7
	current_rounds = 25
	max_rounds = 25

/obj/item/ammo_magazine/packet/scout_rifle
	name = "一盒A19高速弹道弹"
	desc = "一个装有150发A19高压高速弹的弹药箱。"
	icon_state = "tx8"
	default_ammo = /datum/ammo/bullet/rifle/tx8
	caliber = CALIBER_10X28_CASELESS
	current_rounds = 150
	max_rounds = 150

/obj/item/ammo_magazine/packet/autosniper
	name = "一盒低压8.6x70毫米弹药"
	desc = "一个装有120发8.6x70毫米低速弹的盒子。"
	icon_state = "t81"
	default_ammo = /datum/ammo/bullet/sniper/auto
	caliber = CALIBER_86X70
	current_rounds = 100
	max_rounds = 100

/obj/item/ammo_magazine/packet/standardautoshotgun
	name = "一盒16号口径霰弹枪独头弹"
	desc = "一个装有16号口径独头弹的盒子，看起来能装进SH-15里。"
	icon_state = "16g_slug"
	default_ammo = /datum/ammo/bullet/shotgun/tx15_slug
	caliber = CALIBER_16G
	current_rounds = 60
	max_rounds = 60

/obj/item/ammo_magazine/packet/standardautoshotgun/flechette
	name = "一盒16号霰弹枪箭弹"
	desc = "一个装有16号霰弹的盒子，看起来能装进SH-15里。"
	icon_state = "16g_flech"
	default_ammo = /datum/ammo/bullet/shotgun/tx15_flechette

// pistol packets

/obj/item/ammo_magazine/packet/p9mm
	name = "9毫米弹包"
	desc = "一个装有70发9毫米子弹的弹包。"
	caliber = CALIBER_9X19
	icon_state = "9mm"
	current_rounds = 70
	max_rounds = 70
	w_class = WEIGHT_CLASS_SMALL
	default_ammo = /datum/ammo/bullet/pistol

/obj/item/ammo_magazine/packet/magnum
	name = ".44马格南弹包"
	desc = "一包装有49发.44马格南子弹。"
	icon_state = "44_mag" //Maybe change this
	default_ammo = /datum/ammo/bullet/revolver/tp44
	caliber = CALIBER_44
	current_rounds = 49
	max_rounds = 49
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_magazine/packet/mateba
	name = "一包.454卡苏尔弹"
	desc = "一包包含42发.454卡索尔弹的弹药。"
	icon_state = "454"
	default_ammo = /datum/ammo/bullet/revolver/highimpact
	w_class = WEIGHT_CLASS_SMALL
	caliber = CALIBER_454
	current_rounds = 42
	max_rounds = 42

/obj/item/ammo_magazine/packet/acp
	name = "一包.45 ACP手枪弹"
	desc = "一个装有50发.45 ACP手枪弹的弹包。"
	icon_state = "45_acp"
	default_ammo = /datum/ammo/bullet/pistol/heavy
	w_class = WEIGHT_CLASS_SMALL
	caliber = CALIBER_45ACP
	current_rounds = 50
	max_rounds = 50

/obj/item/ammo_magazine/packet/p9mmap
	name = "9毫米穿甲弹弹匣"
	desc = "一个装有70发9毫米穿甲弹的弹包。"
	icon_state = "9mm_ap"
	default_ammo = /datum/ammo/bullet/pistol/ap
	w_class = WEIGHT_CLASS_SMALL
	caliber = CALIBER_9X19
	current_rounds = 70
	max_rounds = 70

/obj/item/ammo_magazine/packet/p10x26mm
	name = "10x26毫米弹药包"
	desc = "一包100发10x26毫米无壳弹。"
	icon_state = "10x26mm"
	caliber = CALIBER_10x26_CASELESS
	default_ammo = /datum/ammo/bullet/rifle/machinegun
	w_class = WEIGHT_CLASS_SMALL
	current_rounds = 100
	max_rounds = 100

/obj/item/ammo_magazine/packet/p10x20mm
	name = "10x20毫米弹药包"
	desc = "一个装有240发10x20毫米无壳弹的弹药包。"
	icon_state = "10x20mm"
	caliber = CALIBER_10X20_CASELESS
	default_ammo = /datum/ammo/bullet/smg
	w_class = WEIGHT_CLASS_SMALL
	current_rounds = 240
	max_rounds = 240

/obj/item/ammo_magazine/packet/p10x20mm/ap
	name = "10x20毫米穿甲弹包"
	desc = "一个装有240发10x20毫米无壳穿甲弹的弹药包。"
	icon_state = "10x20mm_ap"
	default_ammo = /datum/ammo/bullet/smg/ap

/obj/item/ammo_magazine/packet/p4570
	name = ".45-70 弹包"
	desc = "一个装有50发.45-70政府型弹药的弹包。"
	caliber = CALIBER_4570
	icon_state = "45-70"
	icon_state_mini = "ammo_packet_blue"
	default_ammo = /datum/ammo/bullet/rifle/repeater
	w_class = WEIGHT_CLASS_SMALL
	current_rounds = 50
	max_rounds = 50

/obj/item/ammo_magazine/packet/pthreeightyacp
	name = ".380 ACP 弹包"
	desc = "一包包含210发.380 ACP子弹。"
	caliber = CALIBER_380ACP
	icon_state = "380_acp"
	default_ammo = /datum/ammo/bullet/pistol/tiny/ap
	w_class = WEIGHT_CLASS_SMALL
	current_rounds = 210
	max_rounds = 210

/obj/item/ammo_magazine/packet/p41ae
	name = ".41 AE 弹包"
	desc = "一个装有160发.41 AE子弹的弹包。"
	caliber = CALIBER_41AE
	icon_state = "41AE"
	default_ammo = /datum/ammo/bullet/smg/heavy
	w_class = WEIGHT_CLASS_SMALL
	current_rounds = 165
	max_rounds = 165

/obj/item/ammo_magazine/packet/p41ae_squashhead
	name = ".41 AE 空尖弹包"
	desc = "一个装有160发.41 AE南瓜头弹的弹包。"
	caliber = CALIBER_41AE
	icon_state = "41AE_squash"
	default_ammo = /datum/ammo/bullet/smg/squash
	w_class = WEIGHT_CLASS_SMALL
	current_rounds = 165
	max_rounds = 165
