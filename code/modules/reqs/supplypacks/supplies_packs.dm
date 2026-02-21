/*******************************************************************************
SUPPLIES
*******************************************************************************/
/datum/supply_packs/supplies
	group = "Supplies"
	containertype = /obj/structure/closet/crate/supply

/datum/supply_packs/supplies/crayons
	name = "列兵吉姆特制蜡笔包"
	contains = list(/obj/item/storage/fancy/crayons)
	cost = 40

/datum/supply_packs/supplies/janitor
	name = "各类清洁用品"
	contains = list(
		/obj/item/reagent_containers/glass/bucket,
		/obj/item/reagent_containers/glass/bucket,
		/obj/item/reagent_containers/glass/bucket,
		/obj/item/tool/mop,
		/obj/item/tool/wet_sign,
		/obj/item/tool/wet_sign,
		/obj/item/tool/wet_sign,
		/obj/item/storage/bag/trash,
		/obj/item/reagent_containers/spray/cleaner,
		/obj/item/reagent_containers/glass/rag,
		/obj/item/explosive/grenade/chem_grenade/cleaner,
		/obj/item/explosive/grenade/chem_grenade/cleaner,
		/obj/item/explosive/grenade/chem_grenade/cleaner,
		/obj/structure/mopbucket,
		/obj/item/paper/janitor,
	)
	cost = 50

/datum/supply_packs/supplies/carpplush
	name = "鲤鱼玩偶"
	contains = list(/obj/item/toy/plush/carp)
	cost = 10

/datum/supply_packs/supplies/lizplush
	name = "蜥蜴玩偶"
	contains = list(/obj/item/toy/plush/lizard)
	cost = 10

/datum/supply_packs/supplies/slimeplush
	name = "史莱姆玩偶"
	contains = list(/obj/item/toy/plush/slime)
	cost = 10

/datum/supply_packs/supplies/mothplush
	name = "飞蛾玩偶"
	contains = list(/obj/item/toy/plush/moth)
	cost = 10

/datum/supply_packs/supplies/rounyplush
	name = "鲁尼毛绒玩具"
	contains = list(/obj/item/toy/plush/rouny)
	cost = 10

/datum/supply_packs/supplies/queenplushie
	name = "皇家异形女王玩偶"
	contains = list(/obj/item/toy/plush/royalqueen)
	cost = 10

/datum/supply_packs/supplies/games
	name = "游戏板条箱"
	contains = list(
		/obj/item/toy/beach_ball/basketball,
		/obj/item/toy/bikehorn,
		/obj/item/toy/spinningtoy,
		/obj/item/toy/dice/d20,
		/obj/item/toy/dice,
		/obj/item/toy/dice,
		/obj/item/toy/sword,
		/obj/item/toy/sword,
		/obj/item/toy/crossbow,
		/obj/item/toy/crossbow,
		/obj/item/toy/deck,
		/obj/item/toy/deck/kotahi,
	)
	cost = 80

/datum/supply_packs/supplies/games
	name = "治疗玩偶板条箱"
	contains = list(
		/obj/item/toy/plush/therapy_red,
		/obj/item/toy/plush/therapy_orange,
		/obj/item/toy/plush/therapy_yellow,
		/obj/item/toy/plush/therapy_green,
		/obj/item/toy/plush/therapy_blue,
		/obj/item/toy/plush/therapy_purple,
	)
	cost = 40

/datum/supply_packs/supplies/dollarten
	name = "10美元"
	contains = list(/obj/item/spacecash/c10)
	cost = 1

/datum/supply_packs/supplies/dollartwenty
	name = "20美元"
	contains = list(/obj/item/spacecash/c20)
	cost = 2

/datum/supply_packs/supplies/dollarfifty
	name = "50美元"
	contains = list(/obj/item/spacecash/c50)
	cost = 5

/datum/supply_packs/supplies/dollarhundred
	name = "100美元"
	contains = list(/obj/item/spacecash/c100)
	cost = 10

/datum/supply_packs/supplies/dollartwohundred
	name = "200美元"
	contains = list(/obj/item/spacecash/c200)
	cost = 20

/datum/supply_packs/supplies/dollarfivehundred
	name = "500美元"
	contains = list(/obj/item/spacecash/c500)
	cost = 50
