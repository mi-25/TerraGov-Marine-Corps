/*******************************************************************************
EXPLOSIVES
*******************************************************************************/
/datum/supply_packs/explosives
	containertype = /obj/structure/closet/crate/ammo
	group = "Explosives"

/datum/supply_packs/explosives/explosives_mines
	name = "阔剑地雷"
	notes = "Contains 5 mines"
	contains = list(/obj/item/storage/box/explosive_mines)
	cost = 150

/datum/supply_packs/explosives/explosives_minelayer
	name = "M21 APRDS'布雷器'"
	contains = list(/obj/item/minelayer)
	cost = 50

/datum/supply_packs/explosives/explosives_razor
	name = "剃刀燃烧手雷板条箱"
	notes = "Contains 25 razor burns"
	contains = list(/obj/item/storage/box/visual/grenade/razorburn)
	cost = 500

/datum/supply_packs/explosives/explosives_sticky
	name = "M40粘性炸药手雷板条箱"
	notes = "Contains 25 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/sticky)
	cost = 300

/datum/supply_packs/explosives/explosives_smokebomb
	name = "M40 HSDP 烟雾弹手雷板条箱"
	notes = "Contains 25 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/smokebomb)
	cost = 300

/datum/supply_packs/explosives/explosives_hedp
	name = "M40 HEDP 高爆手雷板条箱"
	notes = "Contains 25 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/frag)
	cost = 300

/datum/supply_packs/explosives/explosives_hidp
	name = "M40 HIDP 燃烧手雷板条箱"
	notes = "Contains 25 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/incendiary)
	cost = 350


/datum/supply_packs/explosives/explosives_cloaker
	name = "M45 隐身手雷板条箱"
	notes = "Contains 25 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/cloaker)
	cost = 300

/datum/supply_packs/explosives/explosives_antigas
	name = "M40-AG防毒手雷板条箱"
	notes = "Cotains 25 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/antigas)
	cost = 600

/datum/supply_packs/explosives/explosives_cloak
	name = "M40-2 SCDP 手雷板条箱"
	notes = "Contains 25 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/cloak)
	cost = 300

/datum/supply_packs/explosives/explosives_lasburster
	name = "M80激光爆破手雷板条箱"
	notes = "Contains 25 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/lasburster)
	cost = 300

/datum/supply_packs/explosives/explosives_m15
	name = "M15破片手雷板条箱"
	notes = "Contains 25 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/M15)
	cost = 350

/datum/supply_packs/explosives/explosives_trailblazer
	name = "M45 开拓者手雷板条箱"
	notes = "Contains 25 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/trailblazer)
	cost = 500

/datum/supply_packs/explosives/explosives_hsdp
	name = "M40 HSDP白磷手雷板条箱"
	notes = "Contains 15 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/phosphorus)
	cost = 1000

/datum/supply_packs/explosives/explosives_hefa
	name = "M25 HEFA 手雷板条箱"
	notes = "Contains 25 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/hefa)
	cost = 500

/datum/supply_packs/explosives/plastique
	name = "C4塑胶炸药"
	contains = list(/obj/item/explosive/plastique)
	cost = 30

/datum/supply_packs/explosives/plastique_incendiary
	name = "EX-62 成吉思汗燃烧弹"
	contains = list(/obj/item/explosive/plastique/genghis_charge)
	cost = 150
	available_against_xeno_only = TRUE

/datum/supply_packs/explosives/detpack
	name = "爆破炸药包"
	contains = list(/obj/item/detpack)
	cost = 50

/datum/supply_packs/explosives/mortar
	name = "T-50S 迫击炮板条箱"
	contains = list(/obj/item/mortar_kit)
	cost = 250

/datum/supply_packs/explosives/mortar_ammo_he
	name = "T-50S迫击炮高爆弹（x2）"
	contains = list(/obj/item/mortal_shell/he, /obj/item/mortal_shell/he)
	cost = 10

/datum/supply_packs/explosives/mortar_ammo_incend
	name = "T-50S迫击炮燃烧弹（x2）"
	contains = list(/obj/item/mortal_shell/incendiary, /obj/item/mortal_shell/incendiary)
	cost = 10

/datum/supply_packs/explosives/mortar_ammo_flare
	name = "T-50S 迫击炮照明弹（x2）"
	notes = "Can be fired out of the MG-100Y howitzer, as well."
	contains = list(/obj/item/mortal_shell/flare, /obj/item/mortal_shell/flare)
	cost = 5

/datum/supply_packs/explosives/mortar_ammo_smoke
	name = "T-50S 迫击炮烟雾弹 (x2)"
	contains = list(/obj/item/mortal_shell/smoke, /obj/item/mortal_shell/smoke)
	cost = 5

/datum/supply_packs/explosives/mortar_ammo_plasmaloss
	name = "T-50S迫击炮缠足弹"
	contains = list(/obj/item/mortal_shell/plasmaloss)
	cost = 10
	available_against_xeno_only = TRUE

/datum/supply_packs/explosives/mlrs
	name = "TA-40L 多管火箭系统"
	contains = list(/obj/item/mortar_kit/mlrs)
	cost = 450

/datum/supply_packs/explosives/mlrs_rockets
	name = "TA-40L 多管火箭发射系统高爆火箭弹包（x16）"
	contains = list(/obj/item/storage/box/mlrs_rockets)
	cost = 60

/datum/supply_packs/explosives/mlrs_rockets_gas
	name = "TA-40L 多管火箭发射系统 X-50 火箭弹包（x16）"
	contains = list(/obj/item/storage/box/mlrs_rockets/gas)
	cost = 60

/datum/supply_packs/explosives/mlrs_rockets_cloak
	name = "TA-40L MLRS S-2 隐形火箭弹包（x16）"
	contains = list(/obj/item/storage/box/mlrs_rockets/cloak)
	cost = 50

/datum/supply_packs/explosives/mlrs_rockets_incendiary
	name = "TA-40L 多管火箭发射系统燃烧火箭弹包（x16）"
	contains = list(/obj/item/storage/box/mlrs_rockets/incendiary)
	cost = 60

/datum/supply_packs/explosives/howitzer
	name = "MG-100Y榴弹炮"
	contains = list(/obj/item/mortar_kit/howitzer)
	cost = 600

/datum/supply_packs/explosives/howitzer_ammo_he
	name = "MG-100Y榴弹炮高爆弹"
	contains = list(/obj/item/mortal_shell/howitzer/he)
	cost = 40

/datum/supply_packs/explosives/howitzer_ammo_incend
	name = "MG-100Y榴弹炮燃烧弹"
	contains = list(/obj/item/mortal_shell/howitzer/incendiary)
	cost = 40

/datum/supply_packs/explosives/howitzer_ammo_wp
	name = "MG-100Y榴弹炮白磷烟雾弹"
	contains = list(/obj/item/mortal_shell/howitzer/white_phos)
	cost = 60

/datum/supply_packs/explosives/howitzer_ammo_plasmaloss
	name = "MG-100Y榴弹炮绊脚弹"
	contains = list(/obj/item/mortal_shell/howitzer/plasmaloss)
	cost = 60
	available_against_xeno_only = TRUE

/datum/supply_packs/explosives/ai_target_module
	name = "AI火炮瞄准模块"
	contains = list(/obj/item/ai_target_beacon)
	cost = 100
	available_against_xeno_only = TRUE

/datum/supply_packs/explosives/tactical_binos
	name = "测距望远镜板条箱"
	contains = list(
		/obj/item/binoculars/tactical/range,
		/obj/item/encryptionkey/cas,
	)
	cost = 200
	available_against_xeno_only = TRUE
