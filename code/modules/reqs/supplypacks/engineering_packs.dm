/*******************************************************************************
ENGINEERING
*******************************************************************************/
/datum/supply_packs/engineering
	group = "Engineering"
	containertype = /obj/structure/closet/crate/supply

/datum/supply_packs/engineering/powerloader
	name = "RPL-Y 货物装载机"
	contains = list(/obj/vehicle/ridden/powerloader)
	cost = 200
	containertype = null

/datum/supply_packs/engineering/sandbags
	name = "50个空沙袋"
	contains = list(/obj/item/stack/sandbags_empty/full)
	cost = 100

/datum/supply_packs/engineering/metal50
	name = "50张金属板"
	contains = list(/obj/item/stack/sheet/metal/large_stack)
	cost = 200

/datum/supply_packs/engineering/plas50
	name = "50块塑钢板"
	contains = list(/obj/item/stack/sheet/plasteel/large_stack)
	cost = 400

/datum/supply_packs/engineering/glass50
	name = "50块玻璃板"
	contains = list(/obj/item/stack/sheet/glass/glass/large_stack)
	cost = 100

/datum/supply_packs/engineering/wood50
	name = "50块木板"
	contains = list(/obj/item/stack/sheet/wood/large_stack)
	cost = 100

/datum/supply_packs/engineering/plasmacutter
	name = "等离子切割器"
	contains = list(/obj/item/tool/pickaxe/plasmacutter/)
	cost = 300

/datum/supply_packs/engineering/quikdeploycade
	name = "快速部署路障"
	contains = list(/obj/item/quikdeploy/cade)
	cost = 30

/datum/supply_packs/engineering/pacman
	name = "P.A.C.M.A.N. 便携式发电机"
	contains = list(/obj/machinery/power/port_gen/pacman)
	cost = 150
	containertype = null

/datum/supply_packs/engineering/phoron
	name = "30 张等离子体板材"
	contains = list(/obj/item/stack/sheet/mineral/phoron/medium_stack)
	cost = 200

/datum/supply_packs/engineering/electrical
	name = "电气维护物资"
	contains = list(
		/obj/item/storage/toolbox/electrical,
		/obj/item/clothing/gloves/insulated,
		/obj/item/cell,
		/obj/item/cell/high,
	)
	cost = 50

/datum/supply_packs/engineering/mechanical
	name = "机械维护板条箱"
	contains = list(
		/obj/item/storage/belt/utility/full,
		/obj/item/storage/belt/utility/full,
		/obj/item/storage/belt/utility/full,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/suit/storage/hazardvest/lime,
		/obj/item/clothing/suit/storage/hazardvest/blue,
		/obj/item/clothing/head/welding,
		/obj/item/clothing/head/welding,
		/obj/item/clothing/head/hardhat,
	)
	cost = 100

/datum/supply_packs/engineering/fueltank
	name = "燃料罐"
	contains = list(/obj/structure/reagent_dispensers/fueltank)
	cost = 100
	containertype = null

/datum/supply_packs/engineering/watertank
	name = "水箱"
	contains = list(/obj/structure/reagent_dispensers/watertank)
	cost = 50
	containertype = null

/datum/supply_packs/engineering/inflatable
	name = "充气路障"
	notes = "Contains 3 doors and 4 walls"
	contains = list(/obj/item/storage/briefcase/inflatable)
	cost = 50

/datum/supply_packs/engineering/lightbulbs
	name = "备用照明灯"
	notes = "Contains 14 tubes, 7 bulbs"
	contains = list(/obj/item/storage/box/lights/mixed)
	cost = 50

/datum/supply_packs/engineering/foam_grenade
	name = "泡沫手雷"
	contains = list(/obj/item/explosive/grenade/chem_grenade/metalfoam)
	cost = 30

/datum/supply_packs/engineering/floodlight
	name = "可部署式泛光灯"
	contains = list(/obj/item/deployable_floodlight)
	cost = 30

/datum/supply_packs/engineering/advanced_generator
	name = "无线电力发生器"
	contains = list(/obj/machinery/power/port_gen/pacman/mobile_power)
	cost = 200

/datum/supply_packs/engineering/teleporter
	name = "传送器基座"
	contains = list(/obj/effect/teleporter_linker)
	cost = 500

/datum/supply_packs/engineering/tesla_turret
	name = "特斯拉炮塔"
	contains = list(/obj/item/tesla_turret)
	cost = 400
