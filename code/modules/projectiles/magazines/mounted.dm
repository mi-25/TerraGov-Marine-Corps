///Default ammo for the HSG-102.
/obj/item/ammo_magazine/hsg_102
	name = "HSG-102 弹鼓（10x30mm 无壳弹）"
	desc = "一盒300发10x30毫米无壳钨芯弹，用于HSG-102重型智能机枪。"
	w_class = WEIGHT_CLASS_NORMAL
	icon_state = "hsg102"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	magazine_flags = NONE
	caliber = CALIBER_10X30
	max_rounds = 300
	default_ammo = /datum/ammo/bullet/machinegun
	reload_delay = 5 SECONDS
	icon_state_mini = "mag_hmg"

///This is the one that comes in the mapbound and dropship mounted version of the HSG-102, it has a stupid amount of ammo. Even more than the ammo counter can display.
/obj/item/ammo_magazine/hsg_102/hsg_nest
	max_rounds = 500

/obj/item/ammo_magazine/heavymachinegun
	name = "HMG-08 弹鼓（10x30mm 无壳弹）"
	desc = "一盒500发10x28毫米无壳钨芯弹，用于HMG-08架设式重机枪。这玩意儿可能塞不进你的背包。把它挂在腰带上或背在背上。"
	w_class = WEIGHT_CLASS_BULKY
	equip_slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_BELT
	icon_state = "mg08"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	icon_state_mini = "mag_drum_big_green"
	magazine_flags = NONE
	caliber = CALIBER_10X28
	max_rounds = 500
	default_ammo = /datum/ammo/bullet/machinegun
	reload_delay = 10 SECONDS

/obj/item/ammo_magazine/heavymachinegun/small
	name = "HMG-08 弹匣箱（10x30毫米无壳弹）"
	desc = "一盒250发10x28毫米无壳钨芯弹，用于HMG-08架设式重机枪。"
	w_class = WEIGHT_CLASS_NORMAL
	equip_slot_flags = ITEM_SLOT_BELT
	icon_state = "mg08_small"
	icon_state_mini = "mag_hmg"
	max_rounds = 250
	reload_delay = 5 SECONDS

/obj/item/ammo_magazine/standard_mmg
	name = "MG-27 弹匣（10x27毫米无壳弹）"
	desc = "一盒150发10x27毫米无壳弹，用于MG-27中型机枪。"
	w_class = WEIGHT_CLASS_NORMAL
	icon_state = "t27"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	icon_state_mini = "mag_drum_big_armygreen"
	magazine_flags = NONE
	caliber = CALIBER_10x27_CASELESS
	max_rounds = 150
	default_ammo = /datum/ammo/bullet/rifle/heavy
	reload_delay = 1 SECONDS

/obj/item/ammo_magazine/standard_agls
	name = "AGLS-37 高爆弹匣（40毫米无壳弹）"
	desc = "一个装有30发40毫米无壳高爆手雷的弹药箱，用于AGLS-37自动榴弹发射器。"
	w_class = WEIGHT_CLASS_NORMAL
	icon_state = "ags"
	icon = 'icons/obj/items/ammo/artillery.dmi'
	magazine_flags = NONE
	caliber = CALIBER_40MM
	max_rounds = 30
	default_ammo = /datum/ammo/grenade_container/ags_grenade
	reload_delay = 4 SECONDS

/obj/item/ammo_magazine/standard_agls/fragmentation
	name = "AGLS-37 破片弹匣（40毫米无壳弹）"
	desc = "一个装有30发40毫米无壳破片手雷的弹药箱，用于AGLS-37自动榴弹发射器。"
	icon_state = "ags_frag"
	default_ammo = /datum/ammo/ags_shrapnel

/obj/item/ammo_magazine/standard_agls/incendiary
	name = "AGLS-37 白磷弹匣（40毫米无壳弹）"
	desc = "一个装有30发40毫米无壳白磷手雷的弹药箱，用于AGLS-37自动榴弹发射器。"
	icon_state = "ags_incend"
	default_ammo = /datum/ammo/ags_shrapnel/incendiary

/obj/item/ammo_magazine/standard_agls/flare
	name = "AGLS-37 照明弹弹匣（40毫米无壳弹）"
	desc = "一个装有30发40毫米无壳照明弹的弹药箱，用于AGLS-37自动榴弹发射器。"
	icon_state = "ags_flare"
	default_ammo = /datum/ammo/grenade_container/ags_grenade/flare

/obj/item/ammo_magazine/standard_agls/cloak
	name = "AGLS-37 隐形弹匣（40毫米无壳弹）"
	desc = "一个装有30发40毫米无壳遮蔽手雷的弹药箱，用于AGLS-37自动榴弹发射器。"
	icon_state = "ags_cloak"
	default_ammo = /datum/ammo/grenade_container/ags_grenade/cloak

/obj/item/ammo_magazine/standard_atgun
	name = "AT-36 穿甲高爆弹（37毫米炮弹）"
	desc = "37毫米轻型反坦克炮弹。可穿透墙壁和防御工事，命中目标后爆炸，有效载荷和威力低于常规炮弹。"
	w_class = WEIGHT_CLASS_BULKY
	icon_state = "at36"
	icon = 'icons/obj/items/ammo/artillery.dmi'
	worn_icon_state = "at36"
	magazine_flags = MAGAZINE_REFUND_IN_CHAMBER
	caliber = CALIBER_37MM
	max_rounds = 1
	default_ammo = /datum/ammo/rocket/atgun_shell
	reload_delay = 2 SECONDS

/obj/item/ammo_magazine/standard_atgun/apcr
	name = "AT-36 穿甲弹（37毫米炮弹）"
	desc = "37毫米钨芯穿甲弹，专为轻型反坦克炮设计，能穿透几乎所有目标，但不会留下大洞。"
	icon_state = "at36_apcr"
	worn_icon_state = "at36_apcr"
	default_ammo = /datum/ammo/rocket/atgun_shell/apcr

/obj/item/ammo_magazine/standard_atgun/he
	name = "AT-36 高爆弹（37毫米炮弹）"
	desc = "37毫米轻型反坦克炮炮弹，专为摧毁防御工事设计，高装药量使其速度较慢，但能留下相当可观的弹孔。"
	icon_state = "at36_he"
	worn_icon_state = "at36_he"
	default_ammo = /datum/ammo/rocket/atgun_shell/he

/obj/item/ammo_magazine/standard_atgun/beehive
	name = "AT-36 蜂巢（37毫米炮弹）"
	desc = "37毫米轻型反坦克炮弹，专为杀伤步兵设计，轻量装药赋予其中等速度。能将任何人打成筛子。"
	icon_state = "at36_beehive"
	worn_icon_state = "at36_beehive"
	default_ammo = /datum/ammo/rocket/atgun_shell/beehive

/obj/item/ammo_magazine/standard_atgun/incend
	name = "AT-36 凝固汽油弹（37毫米炮弹）"
	desc = "37毫米轻型反坦克炮弹，专为点燃战场而设计，轻量装药赋予其中等速度。能将任何目标烤成焦炭。"
	icon_state = "at36_incend"
	worn_icon_state = "at36_incend"
	default_ammo = /datum/ammo/rocket/atgun_shell/beehive/incend

/obj/item/ammo_magazine/heavy_minigun
	name = "MG-2005 弹匣（7.62x51mm）"
	desc = "MG-2005 架设式转管机枪的 1000 发弹药箱。"
	w_class = WEIGHT_CLASS_BULKY
	icon_state = "minigun"
	icon = 'icons/obj/items/ammo/misc.dmi'
	magazine_flags = NONE
	caliber = CALIBER_762X51
	max_rounds = 1000
	default_ammo = /datum/ammo/bullet/minigun
	reload_delay = 10 SECONDS

/obj/item/ammo_magazine/auto_cannon
	name = "自动炮高速弹匣(20毫米)"
	desc = "一盒100发用于ATR-22架设式自动炮的高速20毫米炮弹。可穿透人员和掩体。"
	w_class = WEIGHT_CLASS_NORMAL
	icon_state = "ac"
	icon = 'icons/obj/items/ammo/artillery.dmi'
	worn_icon_state = "ac"
	magazine_flags = NONE
	caliber = CALIBER_20
	max_rounds = 100
	default_ammo = /datum/ammo/bullet/auto_cannon
	reload_delay = 4 SECONDS

/obj/item/ammo_magazine/auto_cannon/flak
	name = "自动炮智能引爆弹匣（20毫米）"
	desc = "一盒80发用于ATR-22架设式自动炮的20毫米智能引爆炮弹。命中目标后引爆。"
	icon_state = "ac_flak"
	worn_icon_state = "ac_flak"
	default_ammo = /datum/ammo/bullet/auto_cannon/flak

/obj/item/cell/lasgun/heavy_laser
	name = "重型武器激光电池"
	desc = "一个装有足够电荷的电池，能为TE-9001提供能量。此电池无法充电。"
	w_class = WEIGHT_CLASS_BULKY
	maxcharge = 225
	reload_delay = 5 SECONDS
	icon_state = "hl"
	charge_overlay = null

/obj/item/ammo_magazine/heavy_isg
	name = "FK-88 炮弹（155毫米炮弹）"
	desc = "FK-88 高射炮使用的 15 厘米炮弹。你到底是怎么搞到这玩意的？"
	icon_state = "isg"
	icon = 'icons/obj/items/ammo/artillery.dmi'
	worn_icon_state = "isg"
	w_class = WEIGHT_CLASS_BULKY
	magazine_flags = MAGAZINE_REFUND_IN_CHAMBER
	caliber = CALIBER_15CM
	max_rounds = 1
	reload_delay = 8 SECONDS
	default_ammo = /datum/ammo/rocket/heavy_isg

/obj/item/ammo_magazine/heavy_isg/he
	name = "FK-88 高爆弹（155毫米炮弹）"
	desc = "FK-88 高射炮使用的 15 厘米高爆弹。用另一只手右键点击可在非制导与制导模式间切换。"
	default_ammo = /datum/ammo/rocket/heavy_isg
	var/guided = TRUE

/obj/item/ammo_magazine/heavy_isg/he/attack_hand_alternate(mob/living/user)
	if(guided)
		default_ammo = /datum/ammo/rocket/heavy_isg/unguided
		balloon_alert(user, "你将炮弹切换为无制导模式")
		guided = FALSE
	else
		default_ammo = /datum/ammo/rocket/heavy_isg
		balloon_alert(user, "你将炮弹切换为制导模式")
		guided = TRUE

/obj/item/ammo_magazine/heavy_isg/sabot
	name = "FK-88 尾翼稳定脱壳穿甲弹（155毫米炮弹）"
	desc = "FK-88 高射炮使用的 15 厘米 APFDS 炮弹，内含一枚大型金属弹头，以高超音速发射，能轻易穿透几乎所有物体并贯穿而过。需要一定的最小射程才能稳定弹道并准确命中目标，能在绝大多数物体上留下一个干净的穿孔。"
	icon_state = "isg_sabot"
	default_ammo = /datum/ammo/bullet/heavy_isg_apfds

///Default ammo for the ML-91 and its export variants.
/obj/item/ammo_magazine/icc_hmg
	name = "KRD-61ES 弹匣（10x30mm 无壳弹）"
	desc = "一盒300发10x30毫米无壳钨芯弹，用于KRD-61E型重型智能机枪。"
	w_class = WEIGHT_CLASS_NORMAL
	icon_state = "kord"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	magazine_flags = NONE
	caliber = CALIBER_10X30
	max_rounds = 300
	default_ammo = /datum/ammo/bullet/machinegun
	reload_delay = 5 SECONDS
	icon_state_mini = "mag_hmg"

/obj/item/ammo_magazine/at45
	name = "CC/AT45 弹鼓（10x30mm 无壳弹）"
	desc = "为CC/AT45装填的10x30毫米无壳弹弹鼓。"
	w_class = WEIGHT_CLASS_NORMAL
	icon_state = "at45"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	magazine_flags = NONE
	caliber = CALIBER_10X30
	max_rounds = 300
	default_ammo = /datum/ammo/bullet/machinegun
	reload_delay = 5 SECONDS
	icon_state_mini = "mag_hmg"
