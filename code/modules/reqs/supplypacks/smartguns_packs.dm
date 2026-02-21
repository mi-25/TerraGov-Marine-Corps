/*******************************************************************************
SMARTGUNS
*******************************************************************************/
/datum/supply_packs/smartguns
	group = "Smartguns"
	containertype = /obj/structure/closet/crate/smart

/datum/supply_packs/smartguns/smartgun
	name = "SG-29智能机枪"
	contains = list(/obj/item/weapon/gun/rifle/standard_smartmachinegun)
	cost = 400

/datum/supply_packs/smartguns/smartgun_ammo
	name = "SG-29 弹鼓"
	contains = list(/obj/item/ammo_magazine/standard_smartmachinegun)
	cost = 50

/datum/supply_packs/smartguns/smart_minigun
	name = "SG-85智能加特林机枪"
	contains = list(/obj/item/weapon/gun/minigun/smart_minigun)
	cost = 400

/datum/supply_packs/smartguns/smart_minigun_ammo
	name = "SG-85 弹药箱"
	contains = list(/obj/item/ammo_magazine/packet/smart_minigun)
	cost = 50

/datum/supply_packs/smartguns/smart_minigun_powerpack
	name = "SG-85 动力背包"
	contains = list(/obj/item/ammo_magazine/minigun_powerpack/smartgun)
	cost = 150

/datum/supply_packs/smartguns/smarttarget_rifle
	name = "SG-62智能目标步枪"
	contains = list(/obj/item/weapon/gun/rifle/standard_smarttargetrifle)
	cost = 400

/datum/supply_packs/smartguns/smarttarget_rifle_ammo
	name = "SG-62智能目标步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/standard_smarttargetrifle)
	cost = 35

/datum/supply_packs/smartguns/smarttarget_rifle_ammo_bin
	name = "SG-62智能目标步枪弹药箱"
	contains = list(/obj/item/ammo_magazine/packet/smart_targetrifle)
	cost = 50

/datum/supply_packs/smartguns/smartspotting_rifle_ammo_bin
	name = "SG-153 观测步枪弹药箱"
	contains = list(/obj/item/ammo_magazine/packet/smart_spottingrifle)
	cost = 50

/datum/supply_packs/smartguns/spotting_rifle_ammo
	name = "SG-153 观测步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/standard_spottingrifle)
	cost = 15

/datum/supply_packs/smartguns/spotting_rifle_ammo/highimpact
	name = "SG-153 高冲击力观测步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/standard_spottingrifle/highimpact)

/datum/supply_packs/smartguns/spotting_rifle_ammo/heavyrubber
	name = "SG-153重型橡胶标记步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/standard_spottingrifle/heavyrubber)

/datum/supply_packs/smartguns/spotting_rifle_ammo/plasmaloss
	name = "SG-153 缠足弹定位步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/standard_spottingrifle/plasmaloss)

/datum/supply_packs/smartguns/spotting_rifle_ammo/tungsten
	name = "SG-153 钨芯观测步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/standard_spottingrifle/tungsten)

/datum/supply_packs/smartguns/spotting_rifle_ammo/flak
	name = "SG-153 防空识别步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/standard_spottingrifle/flak)

/datum/supply_packs/smartguns/spotting_rifle_ammo/incendiary
	name = "SG-153 燃烧指示步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/standard_spottingrifle/incendiary)
