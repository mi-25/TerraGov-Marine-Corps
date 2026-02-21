/*******************************************************************************
WEAPONS
*******************************************************************************/

/datum/supply_packs/weapons
	group = "Weapons"
	containertype = /obj/structure/closet/crate/weapon

/datum/supply_packs/weapons/sentry
	name = "ST-571 基地防御哨戒炮"
	contains = list(/obj/item/storage/box/crate/sentry)
	cost = 400

/datum/supply_packs/weapons/sentry_ammo
	name = "ST-571 哨戒炮弹药"
	contains = list(/obj/item/ammo_magazine/sentry)
	cost = 100

/datum/supply_packs/weapons/minisentry
	name = "ST-580点防御哨戒炮"
	contains = list(/obj/item/storage/box/crate/minisentry)
	cost = 400

/datum/supply_packs/weapons/minisentry_ammo
	name = "ST-580 点防御哨戒炮弹药"
	contains = list(/obj/item/ammo_magazine/minisentry)
	cost = 100

/datum/supply_packs/weapons/sentry_shotgun
	name = "SHT-573 霰弹枪哨戒炮"
	contains = list(/obj/item/storage/box/crate/sentry_shotgun)
	cost = 400

/datum/supply_packs/weapons/sentry_shotgun_ammo
	name = "SHT-573 霰弹枪 哨戒炮 弹药"
	contains = list(/obj/item/ammo_magazine/sentry/shotgun)
	cost = 100

/datum/supply_packs/weapons/sentry_sniper
	name = "SST-574狙击型哨戒炮"
	contains = list(/obj/item/storage/box/crate/sentry_sniper)
	cost = 600

/datum/supply_packs/weapons/sentry_sniper_ammo
	name = "SST-574狙击型哨戒炮弹药"
	contains = list(/obj/item/ammo_magazine/sentry/sniper)
	cost = 100

/datum/supply_packs/weapons/sentry_flamer
	name = "SFT-575喷火器哨戒炮"
	contains = list(/obj/item/storage/box/crate/sentry_flamer)
	cost = 400

/datum/supply_packs/weapons/sentry_flamer_ammo
	name = "SFT-575 喷火器哨戒炮弹药"
	contains = list(/obj/item/ammo_magazine/sentry/flamer)
	cost = 150

/datum/supply_packs/weapons/sentry_laser
	name = "SLT-576 激光哨戒炮"
	contains = list(/obj/item/storage/box/crate/sentry_laser)
	cost = 400

/datum/supply_packs/weapons/sentry_laser_ammo
	name = "SLT-576 激光哨戒炮弹药"
	contains = list(/obj/item/ammo_magazine/sentry/laser)
	cost = 200

/datum/supply_packs/weapons/buildasentry
	name = "哨戒炮组装枪械配件系统"
	contains = list(
		/obj/item/attachable/buildasentry,
	)
	cost = 250

/datum/supply_packs/weapons/hsg_102_emplacement
	name = "HSG-102 架设式重型智能机枪"
	contains = list(/obj/item/storage/box/hsg_102)
	cost = 600

/datum/supply_packs/weapons/hsg_102
	name = "HSG-102 架设式重型智能机枪弹药"
	contains = list(/obj/item/ammo_magazine/hsg_102)
	cost = 30

/datum/supply_packs/weapons/minigun_emplacement
	name = "MG-2005 车载式转管机枪"
	contains = list(/obj/item/weapon/gun/standard_minigun)
	cost = 600

/datum/supply_packs/weapons/minigun_ammo
	name = "MG-2005 车载机枪弹药"
	contains = list(/obj/item/ammo_magazine/heavy_minigun)
	cost = 30

/datum/supply_packs/weapons/autocannon_emplacement
	name = "ATR-22 车载防空炮"
	contains = list(/obj/item/weapon/gun/standard_auto_cannon)
	cost = 700

/datum/supply_packs/weapons/ac_hv
	name = "ATR-22高速弹药"
	contains = list(/obj/item/ammo_magazine/auto_cannon)
	cost = 40

/datum/supply_packs/weapons/ac_flak
	name = "ATR-22智能引爆弹药"
	contains = list(/obj/item/ammo_magazine/auto_cannon/flak)
	cost = 40

/datum/supply_packs/weapons/ags_emplacement
	name = "AGLS-37 车载自动榴弹发射器"
	contains = list(/obj/item/weapon/gun/standard_agls)
	cost = 700

/datum/supply_packs/weapons/ags_highexplo
	name = "AGLS-37 AGL 高爆手雷"
	contains = list(/obj/item/ammo_magazine/standard_agls)
	cost = 40

/datum/supply_packs/weapons/ags_frag
	name = "AGLS-37 AGL 破片手雷"
	contains = list(/obj/item/ammo_magazine/standard_agls/fragmentation)
	cost = 40

/datum/supply_packs/weapons/ags_incendiary
	name = "AGLS-37 AGL 白磷手雷"
	contains = list(/obj/item/ammo_magazine/standard_agls/incendiary)
	cost = 40

/datum/supply_packs/weapons/ags_flare
	name = "AGLS-37 AGL 照明手雷"
	contains = list(/obj/item/ammo_magazine/standard_agls/flare)
	cost = 30

/datum/supply_packs/weapons/ags_cloak
	name = "AGLS-37 AGL 伪装手雷"
	contains = list(/obj/item/ammo_magazine/standard_agls/cloak)
	cost = 30

/datum/supply_packs/weapons/antitankgun
	name = "AT-36反坦克炮"
	contains = list(/obj/item/weapon/gun/standard_atgun)
	cost = 800

/datum/supply_packs/weapons/antitankgunammo
	name = "AT-36 反坦克高爆穿甲弹 (x3)"
	contains = list(
		/obj/item/ammo_magazine/standard_atgun,
		/obj/item/ammo_magazine/standard_atgun,
		/obj/item/ammo_magazine/standard_atgun,
	)
	cost = 40

/datum/supply_packs/weapons/antitankgunammo/apcr
	name = "AT-36 反坦克高爆穿甲弹（x3）"
	contains = list(
		/obj/item/ammo_magazine/standard_atgun/apcr,
		/obj/item/ammo_magazine/standard_atgun/apcr,
		/obj/item/ammo_magazine/standard_atgun/apcr,
	)
	cost = 40

/datum/supply_packs/weapons/antitankgunammo/he
	name = "AT-36 反坦克高爆弹（x3）"
	contains = list(
		/obj/item/ammo_magazine/standard_atgun/he,
		/obj/item/ammo_magazine/standard_atgun/he,
		/obj/item/ammo_magazine/standard_atgun/he,
	)
	cost = 40

/datum/supply_packs/weapons/antitankgunammo/beehive
	name = "AT-36 反坦克榴弹蜂巢弹（x3）"
	contains = list(
		/obj/item/ammo_magazine/standard_atgun/beehive,
		/obj/item/ammo_magazine/standard_atgun/beehive,
		/obj/item/ammo_magazine/standard_atgun/beehive,
	)
	cost = 40

/datum/supply_packs/weapons/antitankgunammo/incendiary
	name = "AT-36 反坦克高爆燃烧弹 (x3)"
	contains = list(
		/obj/item/ammo_magazine/standard_atgun/incend,
		/obj/item/ammo_magazine/standard_atgun/incend,
		/obj/item/ammo_magazine/standard_atgun/incend,
	)
	cost = 40

/datum/supply_packs/weapons/flak_gun
	name = "FK-88 防空炮"
	contains = list(/obj/item/weapon/gun/heavy_isg)
	cost = 1000

/datum/supply_packs/weapons/flak_he
	name = "FK-88 高爆防空炮弹"
	contains = list(/obj/item/ammo_magazine/heavy_isg/he)
	cost = 50

/datum/supply_packs/weapons/flak_sabot
	name = "FK-88 高爆穿甲脱壳弹"
	contains = list(/obj/item/ammo_magazine/heavy_isg/sabot)
	cost = 50

/datum/supply_packs/weapons/heavy_laser_emplacement
	name = "TE-9001 架设式重型激光炮"
	contains = list(/obj/item/weapon/gun/energy/lasgun/lasrifle/heavy_laser/deployable)
	cost = 400


/datum/supply_packs/weapons/heavy_laser_ammo
	name = "TE-9001 车载重型激光电池"
	contains = list(/obj/item/cell/lasgun/heavy_laser)
	cost = 15

/datum/supply_packs/weapons/tesla
	name = "特斯拉电击步枪"
	contains = list(/obj/item/weapon/gun/energy/lasgun/lasrifle/tesla)
	cost = 600

/datum/supply_packs/weapons/plasma_cells
	name = "WML等离子体能量电池（x3）"
	contains = list(
		/obj/item/cell/lasgun/plasma,
		/obj/item/cell/lasgun/plasma,
		/obj/item/cell/lasgun/plasma,
	)
	cost = 100

/datum/supply_packs/weapons/plasma_smg
	name = "PL-51 等离子体冲锋枪"
	contains = list(/obj/item/weapon/gun/energy/lasgun/lasrifle/plasma/smg)
	cost = 400

/datum/supply_packs/weapons/plasma_rifle
	name = "PL-38等离子步枪"
	contains = list(/obj/item/weapon/gun/energy/lasgun/lasrifle/plasma/rifle)
	cost = 350

/datum/supply_packs/weapons/plasma_cannon
	name = "PL-96等离子炮"
	contains = list(/obj/item/weapon/gun/energy/lasgun/lasrifle/plasma/cannon)
	cost = 400

/datum/supply_packs/weapons/tx54
	name = "GL-54 空爆手雷发射器"
	contains = list(/obj/item/weapon/gun/rifle/tx54)
	cost = 300

/datum/supply_packs/weapons/tx54_airburst
	name = "GL-54 空爆手雷弹匣"
	contains = list(/obj/item/ammo_magazine/rifle/tx54)
	cost = 20

/datum/supply_packs/weapons/tx54_incendiary
	name = "GL-54燃烧手雷弹匣"
	contains = list(/obj/item/ammo_magazine/rifle/tx54/incendiary)
	cost = 60

/datum/supply_packs/weapons/tx54_smoke
	name = "GL-54战术烟雾手雷弹匣"
	contains = list(/obj/item/ammo_magazine/rifle/tx54/smoke)
	cost = 12

/datum/supply_packs/weapons/tx54_smoke/dense
	name = "GL-54 浓烟手雷弹匣"
	contains = list(/obj/item/ammo_magazine/rifle/tx54/smoke/dense)
	cost = 8

/datum/supply_packs/weapons/tx54_smoke/tangle
	name = "GL-54 缠足手雷弹匣"
	contains = list(/obj/item/ammo_magazine/rifle/tx54/smoke/tangle)
	cost = 48

/datum/supply_packs/weapons/tx55
	name = "AR-55 OICW 步枪"
	contains = list(/obj/item/weapon/gun/rifle/tx55)
	cost = 525

/datum/supply_packs/weapons/recoillesskit
	name = "RL-160无后坐力步枪套件"
	contains = list(/obj/item/storage/holster/backholster/rpg/full)
	cost = 400
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/shell_regular
	name = "RL-160 高爆火箭弹"
	contains = list(/obj/item/ammo_magazine/rocket/recoilless)
	cost = 30
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/shell_le
	name = "RL-160 RR LE 弹"
	contains = list(/obj/item/ammo_magazine/rocket/recoilless/light)
	cost = 30
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/shell_heat
	name = "RL-160 破甲弹"
	contains = list(/obj/item/ammo_magazine/rocket/recoilless/heat)
	cost = 30
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/shell_smoke
	name = "RL-160 红磷烟雾弹"
	contains = list(/obj/item/ammo_magazine/rocket/recoilless/smoke)
	cost = 30
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/shell_smoke
	name = "RL-160 隐身弹壳"
	contains = list(/obj/item/ammo_magazine/rocket/recoilless/cloak)
	cost = 30
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/shell_smoke
	name = "RL-160 RR 缠足弹"
	contains = list(/obj/item/ammo_magazine/rocket/recoilless/plasmaloss)
	cost = 30
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/pepperball
	name = "PB-12胡椒球枪"
	contains = list(/obj/item/weapon/gun/rifle/pepperball)
	cost = 100

/datum/supply_packs/weapons/bricks
	name = "砖块"
	contains = list(/obj/item/weapon/brick)
	cost = 10

/datum/supply_packs/weapons/railgun
	name = "SR-220 导轨炮"
	contains = list(/obj/item/weapon/gun/rifle/railgun)
	cost = 400

/datum/supply_packs/weapons/railgun_ammo
	name = "SR-220 导轨炮脱壳穿甲弹"
	contains = list(/obj/item/ammo_magazine/railgun)
	cost = 30

/datum/supply_packs/weapons/railgun_ammo/hvap
	name = "SR-220 磁轨炮高速穿甲弹"
	contains = list(/obj/item/ammo_magazine/railgun/hvap)

/datum/supply_packs/weapons/railgun_ammo/smart
	name = "SR-220 导轨炮智能穿甲 SAP 弹"
	contains = list(/obj/item/ammo_magazine/railgun/smart)

/datum/supply_packs/weapons/tx8
	name = "BR-8侦察步枪"
	contains = list(/obj/item/weapon/gun/rifle/tx8)
	cost = TX8_PRICE
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/scout_regular
	name = "BR-8侦察步枪弹匣"
	contains = list(/obj/item/ammo_magazine/rifle/tx8)
	cost = 20
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/scout_regular_box
	name = "BR-8 侦察步枪弹药箱"
	contains = list(/obj/item/ammo_magazine/packet/scout_rifle)
	cost = 50
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/scout_impact
	name = "BR-8侦察步枪冲击弹匣"
	contains = list(/obj/item/ammo_magazine/rifle/tx8/impact)
	cost = 40
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/scout_incendiary
	name = "BR-8侦察步枪燃烧弹匣"
	contains = list(/obj/item/ammo_magazine/rifle/tx8/incendiary)
	cost = 40
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/thermobaric
	name = "RL-57 四联热压发射器"
	contains = list(/obj/item/weapon/gun/launcher/rocket/m57a4/t57)
	cost = 500
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/thermobaric_wp
	name = "RL-57温压火箭阵列"
	contains = list(/obj/item/ammo_magazine/rocket/m57a4)
	cost = 50
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/specdemo
	name = "RL-152 SADAR 火箭发射器"
	contains = list(/obj/item/weapon/gun/launcher/rocket/sadar)
	cost = SADAR_PRICE
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/rpg_regular
	name = "RL-152 SADAR 高爆火箭弹"
	contains = list(/obj/item/ammo_magazine/rocket/sadar)
	cost = 50
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/rpg_regular_unguided
	name = "RL-152 SADAR 高爆火箭弹（无制导）"
	contains = list(/obj/item/ammo_magazine/rocket/sadar/unguided)
	cost = 50
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/rpg_ap
	name = "RL-152 SADAR 穿甲火箭弹"
	contains = list(/obj/item/ammo_magazine/rocket/sadar/ap)
	cost = 60
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/rpg_wp
	name = "RL-152 SADAR 白磷火箭弹"
	contains = list(/obj/item/ammo_magazine/rocket/sadar/wp)
	cost = 40
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/rpg_wp_unguided
	name = "RL-152 SADAR 白磷火箭弹（非制导）"
	contains = list(/obj/item/ammo_magazine/rocket/sadar/wp/unguided)
	cost = 40
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/zx76
	name = "ZX-76双管连发霰弹枪"
	contains = list(/obj/item/weapon/gun/shotgun/zx76)
	cost = ZX_PRICE

/datum/supply_packs/weapons/shotguntracker
	name = "12号径追踪弹"
	contains = list(/obj/item/ammo_magazine/shotgun/tracker)
	cost = 50
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/incendiaryslugs
	name = "燃烧弹霰弹盒"
	contains = list(/obj/item/ammo_magazine/shotgun/incendiary)
	cost = 100
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/autosniper
	name = "SR-81 敌我识别自动狙击套件"
	contains = list(/obj/item/weapon/gun/rifle/standard_autosniper)
	cost = 500
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/autosniper_regular
	name = "SR-81 敌我识别狙击弹匣"
	contains = list(/obj/item/ammo_magazine/rifle/autosniper)
	cost = 30
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/autosniper_packet
	name = "SR-81 敌我识别狙击弹药箱"
	contains = list(/obj/item/ammo_magazine/packet/autosniper)
	cost = 50
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/antimaterial
	name = "SR-26 反器材步枪（AMR）套件"
	contains = list(/obj/item/weapon/gun/rifle/sniper/antimaterial)
	cost = AMR_PRICE
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/antimaterial_ammo
	name = "SR-26 AMR 弹匣"
	contains = list(/obj/item/ammo_magazine/sniper)
	cost = 30
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/antimaterial_incend_ammo
	name = "SR-26 AMR 燃烧弹弹匣"
	contains = list(/obj/item/ammo_magazine/sniper/incendiary)
	cost = 30
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/antimaterial_flak_ammo
	name = "SR-26 AMR 防空弹匣"
	contains = list(/obj/item/ammo_magazine/sniper/flak)
	cost = 30
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/specminigun
	name = "MG-100 复仇者 转轮机枪"
	contains = list(/obj/item/weapon/gun/minigun)
	cost = MINIGUN_PRICE

/datum/supply_packs/weapons/minigun
	name = "MG-100 复仇者转轮机枪电源包"
	contains = list(/obj/item/ammo_magazine/minigun_powerpack)
	cost = 50

/datum/supply_packs/weapons/mmg
	name = "MG-27中型机枪"
	contains = list(/obj/item/weapon/gun/standard_mmg)
	cost = 100

/datum/supply_packs/weapons/hmg
	name = "HMG-08重机枪"
	contains = list(/obj/item/weapon/gun/heavymachinegun)
	cost = 400

/datum/supply_packs/weapons/hmg_ammo
	name = "HMG-08重机枪弹鼓"
	contains = list(/obj/item/ammo_magazine/heavymachinegun)
	cost = 70

/datum/supply_packs/weapons/hmg_ammo_small
	name = "HMG-08重机枪弹箱"
	contains = list(/obj/item/ammo_magazine/heavymachinegun/small)
	cost = 40

/datum/supply_packs/weapons/flamethrower
	name = "FL-84 喷火器"
	contains = list(/obj/item/weapon/gun/flamer/big_flamer/marinestandard)
	cost = 150

/datum/supply_packs/weapons/napalm
	name = "FL-84标准燃料罐"
	contains = list(/obj/item/ammo_magazine/flamer_tank/large)
	cost = 60

/datum/supply_packs/weapons/napalm_X
	name = "FL-84 X型燃料罐"
	contains = list(/obj/item/ammo_magazine/flamer_tank/large/X)
	cost = 300

/datum/supply_packs/weapons/back_fuel_tank
	name = "标准背包燃料罐"
	contains = list(/obj/item/ammo_magazine/flamer_tank/backtank)
	cost = 200

/datum/supply_packs/weapons/back_fuel_tank_x
	name = "X燃料背包燃料罐"
	contains = list(/obj/item/ammo_magazine/flamer_tank/backtank/X)
	cost = 600

/datum/supply_packs/weapons/fueltank
	name = "X燃料罐"
	contains = list(/obj/structure/reagent_dispensers/fueltank/xfuel)
	cost = 600
	containertype = null

/datum/supply_packs/weapons/rpgoneuse
	name = "RL-72一次性火箭筒"
	contains = list(/obj/item/weapon/gun/launcher/rocket/oneuse)
	cost = 100
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/mateba
	name = "马特巴自动转轮手枪腰带"
	contains = list(/obj/item/storage/holster/belt/mateba/full)
	notes = "Contains 6 speedloaders"
	cost = 150
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/mateba_ammo
	name = "马特巴快速装弹器"
	contains = list(/obj/item/ammo_magazine/revolver/mateba)
	cost = 30
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/mateba_packet
	name = "马特巴.454卡塞尔数据包"
	contains = list(/obj/item/ammo_magazine/packet/mateba)
	cost = 120
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/magnum
	name = "R-76 马格南"
	contains = list(/obj/item/weapon/gun/revolver/standard_magnum)
	notes = "Ammo is contained within normal marine vendors."
	cost = 75
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/standard_ammo
	name = "剩余标准弹药板条箱"
	notes = "Contains 22 ammo boxes of a wide variety which come prefilled. You lazy bum."
	contains = list(/obj/structure/largecrate/supply/ammo/standard_ammo)
	containertype = null
	cost = 200

/datum/supply_packs/weapons/pfcflak
	name = "SR-127 防空弹匣"
	contains = list(/obj/item/ammo_magazine/rifle/chamberedrifle/flak)
	cost = 50
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/rechargemag
	name = "地球政府实验型 TE-X 充电电池"
	contains = list(/obj/item/cell/lasgun/lasrifle/recharger)
	cost = 60

/datum/supply_packs/weapons/xray_gun
	name = "地球政府实验型 TE-X 激光步枪"
	contains = list(/obj/item/weapon/gun/energy/lasgun/lasrifle/xray)
	cost = 400

/datum/supply_packs/weapons/rocketsledge
	name = "火箭撬"
	contains = list(/obj/item/weapon/twohanded/rocketsledge)
	cost = 850

/datum/supply_packs/weapons/chainsaw
	name = "链锯"
	contains = list(/obj/item/weapon/twohanded/chainsaw)
	cost = 500

/datum/supply_packs/weapons/smart_pistol
	name = "SP-13智能冲锋手枪"
	contains = list(/obj/item/weapon/gun/pistol/smart_pistol)
	cost = 250

/datum/supply_packs/weapons/smart_pistol_ammo
	name = "SP-13智能冲锋手枪弹药"
	contains = list(/obj/item/ammo_magazine/pistol/standard_pistol/smart_pistol)
	cost = 10
