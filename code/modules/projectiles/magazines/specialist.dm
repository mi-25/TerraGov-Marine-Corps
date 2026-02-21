//SNIPER RIFLES
//Keyword rifles. They are subtype of rifles, but still contained here as a specialist weapon.

/obj/item/ammo_magazine/sniper
	name = "\improper SR-26 弹匣 (10x28mm)"
	desc = "一弹匣反器材步枪弹药。"
	caliber = CALIBER_10X28
	icon_state = "t26"
	icon = 'icons/obj/items/ammo/sniper.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	max_rounds = 15
	default_ammo = /datum/ammo/bullet/sniper
	reload_delay = 3
	icon_state_mini = "mag_sniper"

/obj/item/ammo_magazine/sniper/incendiary
	name = "\improper SR-26 燃烧弹匣 (10x28mm)"
	default_ammo = /datum/ammo/bullet/sniper/incendiary
	icon_state = "t26_inc"
	icon_state_mini = "mag_sniper_red"
	bonus_overlay = "t26_incend"

/obj/item/ammo_magazine/sniper/flak
	name = "\improper SR-26 防空弹匣 (10x28mm)"
	default_ammo = /datum/ammo/bullet/sniper/flak
	icon_state = "t26_flak"
	icon_state_mini = "mag_sniper_blue"
	bonus_overlay = "t26_flak"

//SVD //Based on the actual Dragunov sniper rifle.

/obj/item/ammo_magazine/sniper/svd
	name = "\improper SVD弹匣（7.62x54mmR）"
	desc = "SVD狙击步枪的大口径弹匣。"
	caliber = CALIBER_762X54
	icon_state = "svd"
	default_ammo = /datum/ammo/bullet/sniper/svd
	max_rounds = 10
	icon_state_mini = "mag_rifle"

//tx8 magazines

/obj/item/ammo_magazine/rifle/tx8
	name = "\improper 高速弹匣（10x28mm）"
	desc = "一弹匣用于BR-8战斗步枪的超压高速弹。BR-8战斗步枪是唯一能装填这种子弹的枪械。"
	icon_state = "tx8"
	icon = 'icons/obj/items/ammo/sniper.dmi'
	caliber = CALIBER_10X28_CASELESS
	default_ammo = /datum/ammo/bullet/rifle/tx8
	max_rounds = 25
	icon_state_mini = "mag_rifle_big"

/obj/item/ammo_magazine/rifle/tx8/incendiary
	name = "\improper 高速燃烧弹弹匣（10x28mm）"
	desc = "一匣用于BR-8战斗步枪的超压高速燃烧弹。BR-8战斗步枪是唯一能装填这种子弹的枪械。"
	caliber = CALIBER_10X28_CASELESS
	icon_state = "tx8_incend"
	default_ammo = /datum/ammo/bullet/rifle/tx8/incendiary
	icon_state_mini = "mag_rifle_big_red"
	bonus_overlay = "tx8_incend"

/obj/item/ammo_magazine/rifle/tx8/impact
	name = "\improper 高速冲击弹匣（10x28mm）"
	desc = "一匣用于BR-8战斗步枪的超压高速冲击弹。BR-8战斗步枪是唯一能装填这种子弹的枪械。"
	icon_state = "tx8_impact"
	default_ammo = /datum/ammo/bullet/rifle/tx8/impact
	icon_state_mini = "mag_rifle_big_blue"
	bonus_overlay = "tx8_impact"

//-------------------------------------------------------
//M5 RPG

/obj/item/ammo_magazine/rocket
	name = "\improper 通用高爆火箭"
	desc = "所有火箭弹药的劣质前身，不适合正常使用。你到底是怎么搞到这玩意的？"
	caliber = CALIBER_84MM
	icon_state = "rocket_he"
	icon = 'icons/obj/items/ammo/rocket.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	magazine_flags = MAGAZINE_REFUND_IN_CHAMBER
	max_rounds = 1
	default_ammo = /datum/ammo/rocket
	reload_delay = 60

/obj/item/ammo_magazine/rocket/attack_self(mob/user)
	if(current_rounds > 0)
		to_chat(user, span_notice("里面还有导弹呢！"))
		return
	to_chat(user, span_notice("你开始拆解空的培养舱框架..."))
	if(!do_after(user, 10, NONE, src))
		return
	user.visible_message("[user] 拆解了火箭发射管框架。",span_notice("You take apart the empty frame."))
	var/obj/item/stack/sheet/metal/metal = new(get_turf(user))
	metal.amount = 2
	user.drop_held_item()
	qdel(src)

/obj/item/ammo_magazine/rocket/update_name(updates)
	. = ..()
	if(current_rounds > 0)
		return
	name = "空火箭框架"

/obj/item/ammo_magazine/rocket/update_desc(updates)
	. = ..()
	if(current_rounds > 0)
		return
	desc = "一枚用过的火箭弹管。激活它以拆解并获得一些材料。"

/obj/item/ammo_magazine/rocket/update_icon_state()
	. = ..()
	if(current_rounds > 0)
		return
	icon_state = istype(src, /obj/item/ammo_magazine/rocket/m57a4) ? "quad_rocket_e" : "rocket_e"

//-------------------------------------------------------
//RL-152

/obj/item/ammo_magazine/rocket/sadar
	name = "\improper 84毫米'L-G'高爆火箭弹"
	desc = "RL-152火箭发射器的弹头。携带一枚标准高爆弹头，爆炸威力可观。由于采用激光制导，它会精确命中你瞄准的位置，但弹头内部空间需容纳制导系统，导致装药量有所减少。弹头耗尽后，可拆解此框架进行回收。"
	caliber = CALIBER_84MM
	icon_state = "rocket_he"
	w_class = WEIGHT_CLASS_NORMAL
	max_rounds = 1
	default_ammo = /datum/ammo/rocket/he
	reload_delay = 60
	bonus_overlay = "rocket_he"

/obj/item/ammo_magazine/rocket/sadar/unguided
	name = "\improper 84毫米'无制导'高爆火箭"
	desc = "RL-152火箭发射器使用的弹头。携带一枚标准的爆炸弹头，引爆后产生爆炸。它完全不具备制导能力，因此属于'无制导'类型，这使得它可以搭载更大的有效载荷，且熟练的操作者能够命中激光制导火箭完全无法触及的远距离目标。弹头耗尽后，可使用此框架将其拆解。"
	icon_state = "rocket_he_unguided"
	default_ammo = /datum/ammo/rocket/he/unguided

/obj/item/ammo_magazine/rocket/sadar/ap
	name = "\improper 84毫米'L-G'反装甲火箭弹"
	desc = "AP火箭弹的发射管，其内部弹头为导弹辅助动能穿甲弹，能对命中的内部目标造成毁灭性打击，但对周围装甲无效。空管时，可用此框架进行拆解。"
	icon_state = "rocket_ap"
	default_ammo = /datum/ammo/rocket/ap
	bonus_overlay = "rocket_ap"

/obj/item/ammo_magazine/rocket/sadar/wp
	name = "\improper 84毫米'L-G'白磷火箭弹"
	desc = "一种破坏力极强的弹头，命中时会爆发出致命的火焰。由于采用激光制导，它会精确命中你瞄准的位置，但由于内部需要为此预留空间，其有效载荷较小。手持时使用可将其拆解。"
	icon_state = "rocket_wp"
	default_ammo = /datum/ammo/rocket/wp
	bonus_overlay = "rocket_wp"

/obj/item/ammo_magazine/rocket/sadar/wp/unguided
	name = "\improper 84毫米'无制导'白磷火箭"
	desc = "一种极具破坏性的弹头，撞击时会爆发出致命的火焰。它完全无制导，因此是'哑弹'，其优势在于更大的整体有效载荷，熟练的操作员可以进行更远距离的打击，这是激光制导火箭完全无法企及的。手持使用以拆解它。"
	icon_state = "rocket_wp_unguided"
	default_ammo = /datum/ammo/rocket/wp/unguided

//-------------------------------------------------------
//RL-160 recoilless rifle

/obj/item/ammo_magazine/rocket/recoilless
	name = "\improper 67毫米高爆弹"
	desc = "RL-160无后坐力步枪用高爆弹。在小范围内造成剧烈爆炸。需要专用储存容器携带。"
	caliber = CALIBER_67MM
	icon_state = "shell"
	w_class = WEIGHT_CLASS_BULKY
	max_rounds = 1
	default_ammo = /datum/ammo/rocket/recoilless
	reload_delay = 30

/obj/item/ammo_magazine/rocket/recoilless/light
	name = "\improper 67毫米轻型高爆弹"
	desc = "RL-160无后坐力步枪用轻型爆破弹。能在广阔区域内引发轻度爆炸。由于装药量较轻，射程比同类炮弹更远。需要专用储存容器携带。"
	icon_state = "shell_le"
	default_ammo = /datum/ammo/rocket/recoilless/light
	reload_delay = 10

/obj/item/ammo_magazine/rocket/recoilless/low_impact
	name = "\improper 67毫米轻型高爆弹"
	desc = "RL-160无后坐力步枪用轻型爆破弹。能在广阔区域引发轻度爆炸，但冲击伤害较低。由于装药量轻，射程比同类炮弹更远。需要专用储存容器携带。"
	icon_state = "shell_le"
	default_ammo = /datum/ammo/rocket/recoilless/low_impact
	reload_delay = 10

/obj/item/ammo_magazine/rocket/recoilless/heat
	name = "\improper 67毫米破甲弹"
	desc = "RL-160无后坐力步枪使用的高爆反坦克弹。发射穿透性弹头，不会爆炸。对所有类型的敌人造成中等伤害，但不会破甲。需要专用储存容器携带。"
	icon_state = "shell_heat"
	default_ammo = /datum/ammo/rocket/recoilless/heat

/obj/item/ammo_magazine/rocket/recoilless/heam
	name = "\improper 67毫米高爆反装甲炮弹"
	desc = "RL-160无后坐力步枪使用的高爆反机甲炮弹。发射专门设计用于穿透机甲装甲的穿甲弹，但对其他目标精度较差。需要专用存储装置携带。"
	icon_state = "shell_heat"
	default_ammo = /datum/ammo/rocket/recoilless/heat/mech

/obj/item/ammo_magazine/rocket/recoilless/smoke
	name = "\improper 67毫米化学（烟雾）弹"
	desc = "RL-160无后坐力步枪的化学弹。发射低速弹用于近距离施放化学气体，友军因低速易于躲避。此弹头含有浓密的遮蔽烟雾。需要专用储存容器携带。"
	icon_state = "shell_smoke"
	default_ammo = /datum/ammo/rocket/recoilless/chemical

/obj/item/ammo_magazine/rocket/recoilless/cloak
	name = "\improper 67毫米化学（隐形）炮弹"
	desc = "RL-160无后坐力步枪的化学弹。发射低速弹用于近距离施放化学气体，友军因低速易于躲避。此弹头含有高级遮蔽烟雾。需要专用储存容器携带。"
	icon_state = "shell_cloak"
	default_ammo = /datum/ammo/rocket/recoilless/chemical/cloak

/obj/item/ammo_magazine/rocket/recoilless/plasmaloss
	name = "\improper 67毫米化学（缠足）炮弹"
	desc = "RL-160无后坐力步枪的化学弹。发射低速弹用于近距离施放化学气体，友军因弹速较低能轻易躲避。此弹头含有消耗等离子体的缠足烟雾。需要专用储存容器携带。"
	icon_state = "shell_tanglefoot"
	default_ammo = /datum/ammo/rocket/recoilless/chemical/plasmaloss

//-------------------------------------------------------
//one use rpg

/obj/item/ammo_magazine/rocket/oneuse
	name = "\improper 68毫米高爆弹"
	desc = "用于在返回军械库后重新装填一次性火箭弹的火箭弹。"
	caliber = CALIBER_68MM
	icon_state = "rocket"
	w_class = WEIGHT_CLASS_BULKY
	max_rounds = 1
	default_ammo = /datum/ammo/rocket/oneuse
	reload_delay = 30

/obj/item/ammo_magazine/rocket/oneuse/anti_tank
	default_ammo = /datum/ammo/rocket/recoilless/heat/mech

//-------------------------------------------------------
//M5 RPG'S MEAN FUCKING COUSIN

/obj/item/ammo_magazine/rocket/m57a4
	name = "\improper 84毫米温压火箭弹阵列"
	desc = "RL-57四联发射器的温压火箭发射管。在手中激活可在用尽时获得一些金属。火箭的直接命中伤害不高，但火焰效果很强。"
	caliber = CALIBER_ROCKETARRAY
	icon_state = "quad_rocket"
	max_rounds = 4
	default_ammo = /datum/ammo/rocket/wp/quad
	reload_delay = 10 SECONDS

/obj/item/ammo_magazine/rocket/m57a4/ds
	name = "\improper 84毫米温压火箭阵列"
	desc = "RL-57四联发射器使用的温压火箭弹管。用尽时在手中激活可获得一些金属。有巨大的红色标记..."
	caliber = CALIBER_ROCKETARRAY
	icon_state = "quad_rocket"
	max_rounds = 4
	default_ammo = /datum/ammo/rocket/wp/quad/ds
	reload_delay = 2 SECONDS

/obj/item/ammo_magazine/internal/launcher/rocket/m57a4
	desc = "RL-57温压发射器的内置发射管。"
	caliber = CALIBER_ROCKETARRAY
	default_ammo = /datum/ammo/rocket/wp/quad
	max_rounds = 4

/obj/item/ammo_magazine/internal/launcher/rocket/m57a4/ds
	default_ammo = /datum/ammo/rocket/wp/quad/ds

//SOM RPG
/obj/item/ammo_magazine/rocket/som
	name = "\improper 84毫米高爆火箭弹"
	desc = "V-71火箭发射器的高爆弹头。能在可观区域内引发强烈爆炸。"
	icon_state = "rpg_he"
	default_ammo = /datum/ammo/rocket/som
	reload_delay = 2 SECONDS
	bonus_overlay = "rpg_he"

/obj/item/ammo_magazine/rocket/som/light
	name = "\improper 84毫米轻型高爆火箭弹"
	desc = "V-71火箭发射器使用的轻型爆炸弹头。能在广阔区域引发轻度爆炸，但冲击伤害较低。"
	icon_state = "rpg_le"
	default_ammo = /datum/ammo/rocket/som/light
	reload_delay = 1 SECONDS
	bonus_overlay = "rpg_le"

/obj/item/ammo_magazine/rocket/som/heat
	name = "\improper 84毫米破甲火箭弹"
	desc = "V-71火箭发射器使用的高爆反装甲弹头。专为穿透最坚固的装甲而设计。"
	icon_state = "rpg_heat"
	default_ammo = /datum/ammo/rocket/som/heat
	bonus_overlay = "rpg_heat"

/obj/item/ammo_magazine/rocket/som/thermobaric
	name = "\improper 84毫米温压火箭弹"
	desc = "V-71火箭发射器使用的温压弹头。能在中等范围内引发剧烈的燃料空气爆炸。"
	icon_state = "rpg_thermobaric"
	default_ammo = /datum/ammo/rocket/som/thermobaric
	bonus_overlay = "rpg_thermobaric"

/obj/item/ammo_magazine/rocket/som/rad
	name = "\improper 84毫米辐射火箭弹"
	desc = "V-71火箭发射器的辐照弹头。释放毁灭性的毫秒级辐射脉冲，使爆炸半径内的所有目标丧失行动能力。"
	icon_state = "rpg_rad"
	default_ammo = /datum/ammo/rocket/som/rad
	bonus_overlay = "rpg_rad"

/obj/item/ammo_magazine/rocket/som/incendiary
	name = "\improper 84毫米燃烧火箭弹"
	desc = "V-71火箭发射器使用的燃烧弹头。释放白磷弹头，在中等爆炸半径内燃烧一切目标。"
	icon_state = "rpg_incendiary"
	default_ammo = /datum/ammo/rocket/wp/quad/som
	bonus_overlay = "rpg_incendiary"

//ICC RPG
/obj/item/ammo_magazine/rocket/icc
	name = "\improper 84毫米高爆弹发射管"
	desc = "MP-IRL火箭发射器使用的高爆弹头。能在可观范围内引发强烈爆炸。"
	icon_state = "icc_he"
	default_ammo = /datum/ammo/rocket/som
	reload_delay = 2 SECONDS
	bonus_overlay = "iccrpg_he"

/obj/item/ammo_magazine/rocket/icc/light
	name = "\improper 84毫米轻型爆破发射管"
	desc = "MP-IRL火箭发射器使用的轻型爆炸弹头。能在广阔区域引发轻度爆炸，但冲击伤害较低。"
	icon_state = "icc_le"
	default_ammo = /datum/ammo/rocket/som/light
	reload_delay = 1 SECONDS
	bonus_overlay = "iccrpg_le"

/obj/item/ammo_magazine/rocket/icc/heat
	name = "\improper 84毫米破甲弹发射管"
	desc = "MP-IRL火箭发射器使用的高爆反装甲弹头。专为穿透最坚固的装甲而设计。"
	icon_state = "icc_heat"
	default_ammo = /datum/ammo/rocket/som/heat
	bonus_overlay = "iccrpg_heat"

/obj/item/ammo_magazine/rocket/icc/thermobaric
	name = "\improper 84毫米温压弹发射管"
	desc = "MP-IRL火箭发射器使用的温压弹头。能在中等区域内引发剧烈的燃料空气爆炸。"
	icon_state = "icc_thermobaric"
	default_ammo = /datum/ammo/rocket/som/thermobaric
	bonus_overlay = "iccrpg_thermobaric"

//VSD RPG

/obj/item/ammo_magazine/rocket/vsd/he
	name = "\improper 84毫米高爆'反人员'火箭"
	desc = "84毫米高爆反人员炮弹。专为用爆炸清除敌方人员而设计。"
	icon_state = "c153_he"
	default_ammo = /datum/ammo/rocket/som
	reload_delay = 2 SECONDS
	bonus_overlay = "c153_he"

/obj/item/ammo_magazine/rocket/vsd/incendiary
	name = "\improper 84毫米燃烧'反人员'火箭"
	desc = "84毫米燃烧反人员炮弹。专为用高温清除敌方人员而设计。"
	icon_state = "c153_incendiary"
	default_ammo = /datum/ammo/rocket/wp/quad/som
	bonus_overlay = "c153_incendiary"

/obj/item/ammo_magazine/rocket/vsd/chemical
	name = "\improper 84毫米化学弹头'反人员'火箭"
	desc = "化学弹头84毫米反人员炮弹。设计用于通过窒息空气清除敌方人员。"
	icon_state = "c153_chemical"
	default_ammo = /datum/ammo/rocket/recoilless/chemical/harmgas/vsd
	bonus_overlay = "c153_chemical"

/obj/item/ammo_magazine/rocket/vsd/heat
	name = "\improper 84毫米破甲'反坦克'火箭弹"
	desc = "一枚84毫米高爆反坦克弹。设计用于穿透和/或使敌方坦克产生崩落效应。"
	icon_state = "c153_at"
	default_ammo = /datum/ammo/rocket/som/heat
	bonus_overlay = "c153_at"

// railgun

/obj/item/ammo_magazine/railgun
	name = "导轨炮炮弹（尾翼稳定脱壳穿甲弹）"
	desc = "一个装有钨芯弹的弹筒，用于导轨炮。弹筒上标有APDS字样。这种弹药能穿透大多数装甲，但不会留下太大的弹孔。"
	caliber = CALIBER_RAILGUN
	magazine_flags = MAGAZINE_REFUND_IN_CHAMBER
	icon_state = "railgun"
	icon = 'icons/obj/items/ammo/misc.dmi'
	default_ammo = /datum/ammo/bullet/railgun
	max_rounds = 1
	reload_delay = 20 //Hard to reload.
	w_class = WEIGHT_CLASS_NORMAL
	icon_state_mini = "mag_railgun"

/obj/item/ammo_magazine/railgun/hvap
	name = "导轨炮炮弹（高速穿甲）"
	desc = "一个装有钨制弹丸的弹筒，用于导轨炮内。弹筒上标有HVAP字样。这种弹药的穿甲能力不如其他类型的导轨炮弹筒，但能在目标装甲上留下可观的破口。"
	icon_state = "railgun_hvap"
	icon_state_mini = "mag_railgun_blue"
	default_ammo = /datum/ammo/bullet/railgun/hvap

/obj/item/ammo_magazine/railgun/smart
	name = "导轨炮罐（智能穿甲）"
	desc = "一个装有钨制弹丸的弹筒，用于导轨炮内。弹筒上标有SAP字样。这种弹药由于智能弹药的低初速而穿透力较差，但会因冲击力使目标显著踉跄并眩晕。"
	icon_state = "railgun_smart"
	icon_state_mini = "mag_railgun_green"
	default_ammo = /datum/ammo/bullet/railgun/smart

// SRX-42 PMC sniper railgun

/obj/item/ammo_magazine/railgun/pmc
	name = "SRX-42 弹匣（尾翼稳定脱壳穿甲弹）"
	desc = "一个装有钨芯弹的弹匣，用于SRX-42轨道炮。弹匣上标有APDS字样。这种弹药能穿透大多数装甲，但留下的弹孔不大。"
	icon = 'icons/obj/items/ammo/sniper.dmi'
	icon_state = "m42r"
	icon_state_mini = "mag_rifle_big"
	max_rounds = 4

/obj/item/ammo_magazine/railgun/pmc/smart
	name = "SRX-42 弹匣（智能穿甲弹）"
	desc = "一个装有钨弹的弹匣，用于SRX-42轨道炮。弹匣上标有SAP字样。这种弹药由于智能弹药的低初速而穿透力较差，但冲击力会使目标严重踉跄和眩晕。"
	icon_state = "m42r_smart"
	icon_state_mini = "mag_rifle_big_green"
	default_ammo = /datum/ammo/bullet/railgun/smart
	bonus_overlay = "m42r_smart"

/obj/item/ammo_magazine/railgun/pmc/hvap
	name = "SRX-42弹匣（高速穿甲弹）"
	desc = "一个装有钨弹的弹匣，用于SRX-42轨道炮。弹匣上标有HVAP字样。这种弹药的穿透力不如其他轨道炮弹匣类型，但会在目标装甲上留下一个相当大的孔洞。"
	icon_state = "m42r_hvap"
	icon_state_mini = "mag_rifle_big_blue"
	default_ammo = /datum/ammo/bullet/railgun/hvap
	bonus_overlay = "m42r_hvap"


// pepperball

/obj/item/ammo_magazine/rifle/pepperball
	name = "胡椒弹罐（SAN弹）"
	desc = "一个装有弹丸的罐体，用于胡椒球枪内。"
	caliber = CALIBER_PEPPERBALL
	icon_state = "pepperball"
	icon = 'icons/obj/items/ammo/misc.dmi'
	default_ammo = /datum/ammo/bullet/pepperball
	max_rounds = 100
	w_class = WEIGHT_CLASS_NORMAL
	icon_state_mini = "mag_pepperball"

/obj/item/ammo_magazine/rifle/pepperball/pepperball_mini
	name = "小型胡椒弹罐（SAN弹）"
	desc = "微型胡椒球枪用小型气罐。"
	icon_state = "pepperball_mini"
	default_ammo = /datum/ammo/bullet/pepperball/pepperball_mini
	max_rounds = 20
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_magazine/minigun_powerpack
	name = "\improper MG-100 复仇者动力背包"
	desc = "一个重型加固背包，内装支援设备、能量电池和MG-100加特林系统的备用弹药。\n点击左上角的图标为你的MG-100重新装弹。"
	icon_state = "powerpack"
	worn_icon_state = "powerpack"
	icon = 'icons/obj/items/ammo/powerpack.dmi'
	atom_flags = CONDUCT
	equip_slot_flags = ITEM_SLOT_BACK
	magazine_flags = MAGAZINE_WORN
	w_class = WEIGHT_CLASS_HUGE
	default_ammo = /datum/ammo/bullet/minigun
	current_rounds = 500
	max_rounds = 500
	item_map_variant_flags = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT)

/obj/item/ammo_magazine/minigun_powerpack/fancy
	icon_state = "powerpack_fancy"
	item_map_variant_flags = null

/obj/item/ammo_magazine/minigun_powerpack/merc
	icon_state = "powerpack_merc"
	item_map_variant_flags = null

/obj/item/ammo_magazine/minigun_powerpack/smartgun
	name = "\improper SG-85 动力背包"
	desc = "一个经过强化的背包，内部装有经过敌我识别系统改造的弹药、内置微型发电机以及广泛的冷却系统，这些使得SG-85加特林机枪能够正常运作。\n在背包本身上使用SG-85以连接它们。"
	icon_state = "powerpack_sg"
	magazine_flags = MAGAZINE_WORN|MAGAZINE_REFILLABLE
	default_ammo = /datum/ammo/bullet/smart_minigun
	current_rounds = 1000
	max_rounds = 1000
	caliber = CALIBER_10x26_CASELESS
	item_map_variant_flags = null

//"External magazine" for the wheelchair-mounted minigun
/obj/item/ammo_magazine/minigun_wheelchair
	name = "MG-100 复仇者机枪弹药架"
	desc = "一个装满弹药的箱子。似乎是专门为供弹系统设计的。"
	icon = 'icons/obj/items/ammo/misc.dmi'
	icon_state = "minigun"
	atom_flags = CONDUCT
	magazine_flags = MAGAZINE_REFILLABLE
	equip_slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	default_ammo = /datum/ammo/bullet/minigun
	current_rounds = 1000
	max_rounds = 1000
	reload_delay = 0.75 SECONDS

/obj/item/ammo_magazine/bike_minigun
	name = "MG-100 复仇者机枪弹药架"
	desc = "一个装满弹药的箱子。似乎是专门为供弹系统设计的。"
	icon = 'icons/obj/items/ammo/misc.dmi'
	icon_state = "minigun"
	w_class = WEIGHT_CLASS_HUGE
	default_ammo = /datum/ammo/bullet/minigun_light
	current_rounds = 750
	max_rounds = 750
	reload_delay = 0.75 SECONDS

/obj/item/ammo_magazine/bike_autocannon
	name = "架设式AC-32自动炮弹药架"
	desc = "一个装满弹药的箱子。似乎是专门设计用于装填系统的。"
	icon = 'icons/obj/items/ammo/misc.dmi'
	icon_state = "minigun"
	w_class = WEIGHT_CLASS_HUGE
	default_ammo = /datum/ammo/bullet/bike_autocannon
	current_rounds = 150
	max_rounds = 150
	reload_delay = 0.75 SECONDS

// ICC coilgun

/obj/item/ammo_magazine/rifle/icc_coilgun
	name = "线圈炮弹匣"
	desc = "一个装有用于线圈炮的钨合金弹药的罐体。很可能能穿透几乎所有东西。"
	caliber = CALIBER_RAILGUN
	icon_state = "coilgun"
	default_ammo = /datum/ammo/bullet/coilgun
	max_rounds = 5
	reload_delay = 10
	icon_state_mini = "mag_dmr"

// VSD autocannon

/obj/item/ammo_magazine/rifle/vsd_autocannon
	name = "CC/AT32 自动炮霰弹"
	desc = "一个装有20毫米炮弹的弹罐，用于CC/AT32。最好别站在它的射击路径上。"
	caliber = CALIBER_20
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	icon_state = "at32"
	default_ammo = /datum/ammo/bullet/auto_cannon
	max_rounds = 100
	reload_delay = 10
	icon_state_mini = "mag_dmr"

/obj/item/ammo_magazine/rifle/vsd_autocannon/explosive
	name = "CC/AT32 自动炮高爆弹链"
	desc = "一个装有CC/AT32使用的40毫米炮弹的弹罐。最好别站在它的射击路线上。"
	caliber = CALIBER_20
	icon_state = "at32_he"
	default_ammo = /datum/ammo/bullet/auto_cannon/flak
	max_rounds = 100
	reload_delay = 10
	icon_state_mini = "mag_dmr"

/obj/item/ammo_magazine/rifle/vsd_autocannon/at
	name = "CC/AT32 自动炮 实心弹 弹链"
	desc = "一个装有数发特殊20毫米炮弹的弹罐，用于CC/AT32。最好别站在它的射击路径上。"
	caliber = CALIBER_20
	icon_state = "at32_at"
	default_ammo = /datum/ammo/bullet/auto_cannon/anti_tank
	max_rounds = 30
	reload_delay = 10
	icon_state_mini = "mag_dmr"
