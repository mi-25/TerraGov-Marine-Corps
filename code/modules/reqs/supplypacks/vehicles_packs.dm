/*******************************************************************************
VEHICLES
*******************************************************************************/

/datum/supply_packs/vehicles
	group = "Vehicles"
	containertype = /obj/structure/closet/crate/weapon

/datum/supply_packs/vehicles/motorbike
	name = "全地形摩托车"
	cost = 400
	contains = list(/obj/vehicle/ridden/motorbike)
	containertype = null

/datum/supply_packs/vehicles/sidecar
	name = "摩托车边斗升级"
	cost = 200
	contains = list(/obj/item/sidecar)

/datum/supply_packs/vehicles/jerrycan
	name = "油桶"
	cost = 100
	contains = list(/obj/item/reagent_containers/jerrycan)

/datum/supply_packs/vehicles/droid_combat
	name = "装备武器的战斗机器人"
	contains = list(/obj/vehicle/unmanned/droid)
	cost = 400
	containertype = null

/datum/supply_packs/vehicles/droid_scout
	name = "侦察无人机"
	contains = list(/obj/vehicle/unmanned/droid/scout)
	cost = 300
	containertype = null

/datum/supply_packs/vehicles/droid_powerloader
	name = "动力装载机机器人"
	contains = list(/obj/vehicle/unmanned/droid/ripley)
	cost = 300
	containertype = null

/datum/supply_packs/vehicles/droid_weapon
	name = "机器人武器"
	contains = list(/obj/item/uav_turret/droid)
	cost = 200
	containertype = /obj/structure/closet/crate/weapon

/datum/supply_packs/vehicles/tiny_uv
	name = "'石龙子'微型无人载具"
	contains = list(/obj/item/deployable_vehicle/tiny)
	cost = 50

/datum/supply_packs/vehicles/light_uv
	name = "'鬣蜥'轻型无人载具"
	contains = list(/obj/vehicle/unmanned)
	cost = 300

/datum/supply_packs/vehicles/medium_uv
	name = "'壁虎'中型无人载具"
	contains = list(/obj/vehicle/unmanned/medium)
	cost = 500

/datum/supply_packs/vehicles/heavy_uv
	name = "'科莫多'重型无人载具"
	contains = list(/obj/vehicle/unmanned/heavy)
	cost = 700

/datum/supply_packs/vehicles/uv_light_weapon
	name = "轻型紫外武器"
	contains = list(/obj/item/uav_turret)
	cost = 200
	containertype = /obj/structure/closet/crate/weapon

/datum/supply_packs/vehicles/uv_heavy_weapon
	name = "重型紫外线武器"
	contains = list(/obj/item/uav_turret/heavy)
	cost = 200
	containertype = /obj/structure/closet/crate/weapon

/datum/supply_packs/vehicles/uv_claw
	name = "紫外线爪模块"
	contains = list(/obj/item/uav_turret/claw)
	cost = 50
	containertype = /obj/structure/closet/crate/weapon

/datum/supply_packs/vehicles/uv_light_ammo
	name = "轻型紫外弹药 - 11x35毫米"
	contains = list(/obj/item/ammo_magazine/box11x35mm)
	cost = 30
	containertype = /obj/structure/closet/crate/ammo

/datum/supply_packs/vehicles/uv_heavy_ammo
	name = "重型紫外线弹药 - 12x40毫米"
	contains = list(/obj/item/ammo_magazine/box12x40mm)
	cost = 30
	containertype = /obj/structure/closet/crate/ammo

/datum/supply_packs/vehicles/vehicle_remote
	name = "载具遥控器"
	contains = list(/obj/item/unmanned_vehicle_remote)
	cost = 10
	containertype = /obj/structure/closet/crate

/datum/supply_packs/vehicles/mounted_hsg
	name = "机载HSG-102重型智能机枪"
	contains = list(/obj/structure/dropship_equipment/shuttle/weapon_holder/machinegun)
	cost = 500

/datum/supply_packs/vehicles/minigun_nest
	name = "空降艇搭载型MG-2005转管机枪"
	contains = list(/obj/structure/dropship_equipment/shuttle/weapon_holder/minigun)
	cost = 750

/datum/supply_packs/vehicles/mounted_heavy_laser
	name = "机载 TE-9001 重型激光炮"
	contains = list(/obj/structure/dropship_equipment/shuttle/weapon_holder/heavylaser)
	cost = 400

/datum/supply_packs/vehicles/hsg_ammo
	name = "机载HSG-102重型智能机枪弹药"
	contains = list(/obj/item/ammo_magazine/hsg_102/hsg_nest)
	cost = 100
	containertype = /obj/structure/closet/crate/ammo

/datum/supply_packs/vehicles/minigun_ammo
	name = "空降舱挂载MG-2005转轮机炮弹药"
	contains = list(/obj/item/ammo_magazine/heavy_minigun)
	cost = 30
	containertype = /obj/structure/closet/crate/ammo

/datum/supply_packs/vehicles/hl_ammo
	name = "机载 TE-9001 重型激光弹药（x3）"
	contains = list(/obj/item/cell/lasgun/heavy_laser, /obj/item/cell/lasgun/heavy_laser, /obj/item/cell/lasgun/heavy_laser)
	cost = 50
	containertype = /obj/structure/closet/crate/ammo

/datum/supply_packs/vehicles/bfg_cannon
	name = "车载式BFG 9500"
	contains = list(/obj/item/armored_weapon/bfg)
	cost = 1600

/datum/supply_packs/vehicles/bfg_rounds
	name = "坦克BFG反物质容器"
	contains = list(/obj/item/ammo_magazine/tank/bfg)
	cost = 200

/datum/supply_packs/vehicles/ltb_he_shell
	name = "请求高爆坦克炮弹"
	contains = list(/obj/item/ammo_magazine/tank/ltb_cannon)
	cost = 10

/datum/supply_packs/vehicles/ltb_apfds_shell
	name = "LTB APFDS 坦克炮弹"
	contains = list(/obj/item/ammo_magazine/tank/ltb_cannon/apfds)
	cost = 10

/datum/supply_packs/vehicles/ltb_canister_shell
	name = "LTB 罐装坦克炮弹"
	contains = list(/obj/item/ammo_magazine/tank/ltb_cannon/canister)
	cost = 10

/datum/supply_packs/vehicles/secondary_flamer_tank
	name = "喷洒喷火器燃料罐"
	contains = list(/obj/item/ammo_magazine/tank/secondary_flamer_tank)
	cost = 10

/datum/supply_packs/vehicles/ltaap_rounds
	name = "LTAAP 坦克弹匣"
	contains = list(/obj/item/ammo_magazine/tank/ltaap_chaingun)
	cost = 10

/datum/supply_packs/vehicles/autocannon_ap_rounds
	name = "灌木丛猎手机炮穿甲弹弹药箱"
	contains = list(/obj/item/ammo_magazine/tank/autocannon)
	cost = 10

/datum/supply_packs/vehicles/autocannon_he_rounds
	name = "灌木丛猎手自动炮高爆弹药箱"
	contains = list(/obj/item/ammo_magazine/tank/autocannon/high_explosive)
	cost = 10

/datum/supply_packs/vehicles/cupola_rounds
	name = "炮塔坦克弹匣"
	contains = list(/obj/item/ammo_magazine/tank/secondary_cupola)
	cost = 10

/datum/supply_packs/vehicles/tow_rocket
	name = "TOW导弹"
	contains = list(/obj/item/ammo_magazine/tank/tow_missile)
	cost = 5 // marginally cheaper due to being a single loader

/datum/supply_packs/vehicles/microrocket_pod
	name = "微型火箭弹舱"
	contains = list(/obj/item/ammo_magazine/tank/microrocket_rack)
	cost = 10

/datum/supply_packs/vehicles/repairpack
	name = "机甲维修包"
	contains = list(/obj/item/repairpack)
	cost = 10
