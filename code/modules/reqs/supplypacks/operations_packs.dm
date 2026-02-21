/*******************************************************************************
OPERATIONS
*******************************************************************************/
/datum/supply_packs/operations
	group = "Operations"
	containertype = /obj/structure/closet/crate

/datum/supply_packs/operations/beacons_supply
	name = "补给信标"
	contains = list(/obj/item/supply_beacon)
	cost = 100

/datum/supply_packs/operations/fulton_extraction_pack
	name = "富尔顿回收包"
	contains = list(/obj/item/fulton_extraction_pack)
	cost = 100

/datum/supply_packs/operations/tank_fulton
	name = "重型载具富尔顿回收包"
	contains = list(/obj/item/fulton_extraction_pack/tank)
	cost = 400

/datum/supply_packs/operations/autominer
	name = "自动采矿机升级"
	contains = list(/obj/item/minerupgrade/automatic)
	cost = 50

/datum/supply_packs/operations/miningwelloverclock
	name = "矿井加固升级"
	contains = list(/obj/item/minerupgrade/reinforcement)
	cost = 50

/datum/supply_packs/operations/miningwellresistance
	name = "矿井超频升级"
	contains = list(/obj/item/minerupgrade/overclock)
	cost = 50

/datum/supply_packs/operations/binoculars_tactical
	name = "战术望远镜板条箱"
	contains = list(
		/obj/item/binoculars/tactical,
		/obj/item/encryptionkey/cas,
	)
	cost = 300
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/pinpointer
	name = "异形建筑追踪板条箱"
	contains = list(/obj/item/pinpointer)
	cost = 200
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/xeno_iff_tag
	name = "异形敌我识别标签板条箱" //Intended for corrupted or friendly rounies as rounds sometimes turn out. Avoid abuse or I'll have to admin-only it, which is no fun!
	notes = "Contains an IFF tag used to mark a xenomorph as friendly to IFF systems. Warning: Nanotrasen is not responsible for incidents related to attaching this to hostile entities."
	contains = list(/obj/item/xeno_iff_tag)
	access = ACCESS_MARINE_BRIDGE //Better be safe.
	cost = 130

/datum/supply_packs/operations/flare_crate
	name = "剩余信号弹板条箱"
	contains = list(/obj/structure/largecrate/supply/supplies/flares)
	cost = 75

/datum/supply_packs/operations/deployable_camera
	name = "3个可部署摄像头"
	contains = list(
		/obj/item/deployable_camera,
		/obj/item/deployable_camera,
		/obj/item/deployable_camera,
	)
	cost = 20

/datum/supply_packs/operations/exportpad
	name = "ASRS 超空间出口点"
	contains = list(/obj/machinery/exportpad)
	cost = 300

/datum/supply_packs/operations/warhead_cluster
	name = "集束轨道弹头"
	contains = list(/obj/structure/ob_ammo/warhead/cluster)
	cost = 200
	access = ACCESS_MARINE_ENGINEERING
	containertype = /obj/structure/closet/crate/secure/explosives
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/warhead_explosive
	name = "HE轨道弹头"
	contains = list(/obj/structure/ob_ammo/warhead/explosive)
	cost = 300
	access = ACCESS_MARINE_ENGINEERING
	containertype = /obj/structure/closet/crate/secure/explosives
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/warhead_incendiary
	name = "燃烧弹轨道弹头"
	contains = list(/obj/structure/ob_ammo/warhead/incendiary)
	cost = 200
	access = ACCESS_MARINE_ENGINEERING
	containertype = /obj/structure/closet/crate/secure/explosives
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/warhead_plasmaloss
	name = "等离子体抽取轨道弹头"
	contains = list(/obj/structure/ob_ammo/warhead/plasmaloss)
	cost = 150
	access = ACCESS_MARINE_ENGINEERING
	containertype = /obj/structure/closet/crate/secure/explosives
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/ob_fuel
	name = "固体燃料"
	contains = list(/obj/structure/ob_ammo/ob_fuel)
	cost = 50
	access = ACCESS_MARINE_ENGINEERING
	containertype = /obj/structure/closet/crate/secure/explosives
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/droppod
	name = "宙斯轨道空投舱"
	contains = list(/obj/structure/droppod)
	containertype = null
	cost = 50

/datum/supply_packs/operations/droppod_leader
	name = "宙斯指令空降舱"
	contains = list(/obj/structure/droppod/leader)
	containertype = null
	cost = 100

/datum/supply_packs/operations/researchcomp
	name = "研究控制台"
	contains = list(/obj/machinery/researchcomp)
	containertype = null
	cost = 200

/datum/supply_packs/operations/supply_tablet
	name = "补给平板"
	contains = list(/obj/item/supplytablet)
	cost = 50

/datum/supply_packs/operations/tadpole_electronics
	name = "蝌蚪号导航电子设备"
	contains = list(/obj/item/circuitboard/tadpole)
	cost = 750

/datum/supply_packs/operations/rappel_rope
	name = "蝌蚪号速降系统绳索"
	contains = list(/obj/item/spare_cord)
	cost = 300
