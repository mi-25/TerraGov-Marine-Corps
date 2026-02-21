/datum/outfit/quick
	///Description of the loadout
	var/desc = "Description here"
	///How much of this loadout there is. infinite by default
	var/quantity = -1
	///What job this loadout is associated with. Used for tabs and access.
	var/jobtype = "Squad Marine"
	///Restricts loadouts to a specific job. Set to false to allow any job to take the loadout.
	var/require_job = TRUE
	///Secondary weapon
	var/secondary_weapon

/datum/outfit/quick/equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	//Start with uniform,suit,backpack for additional slots. Deletes any existing equipped item to avoid accidentally losing half your loadout. Not suitable for standard gamemodes!
	if(w_uniform)
		qdel(H.w_uniform)
	if(wear_suit)
		qdel(H.wear_suit)
	if(back)
		qdel(H.back)
	if(belt)
		qdel(H.belt)
	if(gloves)
		qdel(H.gloves)
	if(shoes)
		qdel(H.shoes)
	if(head)
		qdel(H.head)
	if(mask)
		qdel(H.wear_mask)
	if(ears)
		qdel(H.wear_ear)
	if(glasses)
		qdel(H.glasses)
	if(suit_store)
		qdel(H.s_store)
	if(l_hand)
		qdel(H.l_hand)

	if(r_hand)
		qdel(H.r_hand)

	return ..()

////TGMC/////

//Base TGMC outfit
/datum/outfit/quick/tgmc
	name = "地球政府殖民地海军陆战队基地"
	desc = "这是所有地球政府殖民地海军陆战队快速供应商套装的基类路径。你不应该看到这个。"

//Base TGMC marine outfit
/datum/outfit/quick/tgmc/marine
	name = "地球政府殖民地海军陆战队陆战队员"
	jobtype = "Squad Marine"

	ears = /obj/item/radio/headset/mainship/marine
	w_uniform = /obj/item/clothing/under/marine/black_vest
	shoes = /obj/item/clothing/shoes/marine/full
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/heavy/shield
	gloves = /obj/item/clothing/gloves/marine
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/modular/m10x
	r_pocket = /obj/item/storage/pouch/firstaid/combat_patrol
	l_pocket = /obj/item/storage/pouch/grenade/combat_patrol
	back = /obj/item/storage/backpack/marine/satchel

	suit_contents = list(
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/isotonic = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
	)

	head_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/combat = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = 1,
	)

/datum/outfit/quick/tgmc/marine/standard_assaultrifle
	name = "AR-12步枪手"
	desc = "经典的步枪手。配备AR-12突击步枪（带下挂榴弹发射器）、重型护甲以及充足的手雷和弹药。可靠的全能型角色。"

	suit_store = /obj/item/weapon/gun/rifle/standard_assaultrifle/rifleman
	belt = /obj/item/storage/belt/marine/t12

	backpack_contents = list(
		/obj/item/weapon/shield/riot/marine/deployable = 1,
		/obj/item/ammo_magazine/packet/p10x24mm = 1,
		/obj/item/ammo_magazine/pistol/standard_heavypistol = 2,
		/obj/item/weapon/gun/pistol/standard_heavypistol/tactical = 1,
		/obj/item/storage/box/MRE = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/sticky = 2,
		/obj/item/explosive/grenade = 2,
		/obj/item/explosive/grenade/incendiary = 1,
	)


/datum/outfit/quick/tgmc/marine/standard_laserrifle
	name = "激光步枪手"
	desc = "当弹道武器力不从心时，激光步枪搭配微型喷火器和重型护甲。激光对火星之子护甲更有效，但无法造成骨折和器官损伤。"

	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_rifle/rifleman
	belt = /obj/item/storage/belt/marine/te_cells

	backpack_contents = list(
		/obj/item/cell/lasgun/lasrifle = 3,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_pistol/tactical = 1,
		/obj/item/storage/box/MRE = 1,
	)

	webbing_contents = list(
		/obj/item/ammo_magazine/flamer_tank/mini = 2,
		/obj/item/explosive/grenade = 2,
		/obj/item/tool/extinguisher/mini = 1,
	)


/datum/outfit/quick/tgmc/marine/standard_carbine
	name = "AR-18步枪手"
	desc = "现代一线步枪兵。配备带下挂榴弹发射器的AR-18卡宾枪、重型护甲以及充足的手雷和弹药。相比AR-12拥有更好的机动性和伤害输出，但弹匣容量较小，远距离性能较差。"

	suit_store = /obj/item/weapon/gun/rifle/standard_carbine/standard
	belt = /obj/item/storage/belt/marine/t18

	backpack_contents = list(
		/obj/item/ammo_magazine/packet/p10x24mm = 1,
		/obj/item/ammo_magazine/pistol/standard_heavypistol = 2,
		/obj/item/ammo_magazine/rifle/standard_carbine = 1,
		/obj/item/weapon/gun/pistol/standard_heavypistol/tactical = 1,
		/obj/item/storage/box/MRE = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/sticky = 2,
		/obj/item/explosive/grenade = 2,
		/obj/item/explosive/grenade/incendiary = 1,
	)


/datum/outfit/quick/tgmc/marine/combat_rifle
	name = "AR-11 步枪手"
	desc = "老派步枪兵。装备AR-11战斗步枪与重型护甲，并携带大量手雷和弹药。拥有大容量弹匣和全射程致命火力输出，但相比更现代的武器缺少许多枪械配件选项，且操作略显笨重。"

	suit_store = /obj/item/weapon/gun/rifle/tx11/standard
	belt = /obj/item/storage/belt/marine/combat_rifle

	backpack_contents = list(
		/obj/item/ammo_magazine/packet/p492x34mm = 2,
		/obj/item/ammo_magazine/pistol/standard_heavypistol = 2,
		/obj/item/weapon/gun/pistol/standard_heavypistol/tactical = 1,
		/obj/item/storage/box/MRE = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade = 3,
		/obj/item/explosive/grenade/incendiary = 1,
		/obj/item/tool/extinguisher/mini = 1,
	)


/datum/outfit/quick/tgmc/marine/standard_battlerifle
	name = "BR-64 步枪手"
	desc = "为挑剔的步枪手提供的更强火力。配备BR-64战斗步枪（带下挂榴弹发射器）、重型护甲以及充足的弹药和手雷。更高的伤害和穿透力，代价是武器更为笨重。"

	suit_store = /obj/item/weapon/gun/rifle/standard_br/standard
	belt = /obj/item/storage/belt/marine/standard_battlerifle

	backpack_contents = list(
		/obj/item/weapon/shield/riot/marine/deployable = 1,
		/obj/item/ammo_magazine/packet/p10x265mm = 1,
		/obj/item/ammo_magazine/pistol/standard_heavypistol = 2,
		/obj/item/weapon/gun/pistol/standard_heavypistol/tactical = 1,
		/obj/item/storage/box/MRE = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/sticky = 2,
		/obj/item/explosive/grenade = 2,
		/obj/item/explosive/grenade/incendiary = 1,
	)


/datum/outfit/quick/tgmc/marine/standard_skirmishrifle
	name = "AR-21 步枪手"
	desc = "以较低射速为代价换取更强的制止力。配备AR-21突击步枪（带下挂榴弹发射器）、重型护甲以及大量手雷和弹药。其重型弹药对精准射击者给予回报。"

	suit_store = /obj/item/weapon/gun/rifle/standard_skirmishrifle/standard
	belt = /obj/item/storage/belt/marine/standard_skirmishrifle

	backpack_contents = list(
		/obj/item/weapon/shield/riot/marine/deployable = 1,
		/obj/item/ammo_magazine/packet/p10x25mm = 1,
		/obj/item/ammo_magazine/pistol/standard_heavypistol = 2,
		/obj/item/weapon/gun/pistol/standard_heavypistol/tactical = 1,
		/obj/item/storage/box/MRE = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/sticky = 2,
		/obj/item/explosive/grenade = 2,
		/obj/item/explosive/grenade/incendiary = 1,
	)


/datum/outfit/quick/tgmc/marine/alf_shocktrooper
	name = "ALF-51B 突击兵"
	desc = "突击强攻型装备。配备ALF-51B型机枪卡宾枪、由Mk.II'泰尔'模块强化的重型护甲，以及大量手雷和弹药。提供卓越的火力输出和超强防护，但ALF-51B的紧凑尺寸导致其存在严重的伤害衰减问题。最适合近距离作战。"

	head = /obj/item/clothing/head/modular/m10x/tyr
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/heavy/tyr_two
	suit_store = /obj/item/weapon/gun/rifle/alf_machinecarbine/assault
	belt = /obj/item/storage/belt/marine/alf_machinecarbine

	backpack_contents = list(
		/obj/item/ammo_magazine/rifle/alf_machinecarbine = 2,
		/obj/item/weapon/gun/pistol/standard_heavypistol/tactical = 1,
		/obj/item/storage/box/MRE = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = 1,
		/obj/item/explosive/plastique = 1,
		/obj/item/tool/extinguisher/mini = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade = 2,
		/obj/item/explosive/grenade/flashbang/stun = 1,
		/obj/item/ammo_magazine/pistol/standard_heavypistol = 2,
	)


/datum/outfit/quick/tgmc/marine/standard_machinegunner
	name = "MG-60机枪手"
	desc = "TGMC 可靠的老黄牛。配备 MG-60 机枪、两脚架、重型装甲和一些基本建筑物资。擅长固守阵地和提供火力支援，但牺牲了一些机动性。"

	belt = /obj/item/storage/belt/sparepouch
	suit_store = /obj/item/weapon/gun/rifle/standard_gpmg/machinegunner
	l_pocket = /obj/item/storage/pouch/construction

	backpack_contents = list(
		/obj/item/weapon/shield/riot/marine/deployable = 1,
		/obj/item/ammo_magazine/standard_gpmg = 1,
		/obj/item/weapon/gun/pistol/standard_heavypistol/tactical = 1,
		/obj/item/ammo_magazine/pistol/standard_heavypistol = 3,
	)

	belt_contents = list(
		/obj/item/ammo_magazine/standard_gpmg = 3,
	)

	webbing_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/explosive/grenade/smokebomb = 2,
		/obj/item/explosive/grenade/incendiary = 1,
		/obj/item/explosive/grenade/flashbang/stun = 1,
	)

	l_pocket_contents = list(
		/obj/item/tool/shovel/etool = 1,
		/obj/item/stack/sandbags_empty/half = 1,
		/obj/item/stack/sandbags/large_stack = 1,
		/obj/item/stack/barbed_wire/half_stack = 1,
	)


/datum/outfit/quick/tgmc/marine/medium_machinegunner
	name = "MG-27 机枪手"
	desc = "当你需要携带最大的枪械时。配备MG-27机枪和微型瞄准镜，以及一把MR-25冲锋枪作为副武器，还有中型护甲和少量建筑物资。提供毁灭性的火力，尽管是静态的。"

	belt = /obj/item/storage/holster/m25
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/shield
	suit_store = /obj/item/weapon/gun/standard_mmg/machinegunner
	l_pocket = /obj/item/storage/pouch/construction
	glasses = /obj/item/clothing/glasses/mgoggles

	backpack_contents = list(
		/obj/item/ammo_magazine/standard_mmg = 3,
		/obj/item/explosive/grenade/smokebomb = 2,
		/obj/item/explosive/grenade/flashbang/stun = 1,
	)

	webbing_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/ammo_magazine/smg/m25 = 4,
	)

	l_pocket_contents = list(
		/obj/item/tool/shovel/etool = 1,
		/obj/item/stack/sandbags_empty/half = 1,
		/obj/item/stack/sandbags/large_stack = 1,
		/obj/item/stack/barbed_wire/half_stack = 1,
	)

	belt_contents = list(
		/obj/item/weapon/gun/smg/m25/holstered = 1,
	)


/datum/outfit/quick/tgmc/marine/standard_lasermg
	name = "激光机枪手"
	desc = "干净利落的火力压制。配备下挂榴弹发射器和重型护甲的激光机枪。作为机枪而言相对轻便，可变射击模式使其成为灵活而危险的武器。激光对火星之子护甲更有效，但无法造成骨折和器官损伤。"

	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_mlaser/patrol
	belt = /obj/item/storage/belt/marine/te_cells

	backpack_contents = list(
		/obj/item/cell/lasgun/lasrifle = 3,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_pistol/tactical = 1,
		/obj/item/storage/box/MRE = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/incendiary = 1,
		/obj/item/explosive/grenade = 3,
		/obj/item/tool/extinguisher/mini = 1,
	)

/datum/outfit/quick/tgmc/marine/pyro
	name = "FL-84 喷火器操作员"
	desc = "用于焚烧敌人，有时也烧友军。装备有FL-84喷火器和宽口喷嘴、SMG-25副武器、升级了'苏尔特'防火模块的重型护甲，以及一个燃料背罐。能极快地烧毁大片区域，既可逼出敌人，也可掩护侧翼。但行动非常缓慢，远程效果不佳，且若过度使用会迅速耗尽所有可用燃料。"

	wear_suit = /obj/item/clothing/suit/modular/xenonauten/heavy/surt
	mask = /obj/item/clothing/mask/gas/tactical
	head = /obj/item/clothing/head/modular/m10x/surt
	belt = /obj/item/storage/holster/m25
	back = /obj/item/ammo_magazine/flamer_tank/backtank
	suit_store = /obj/item/weapon/gun/flamer/big_flamer/marinestandard/wide

	webbing_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/ammo_magazine/smg/m25/extended = 3,
		/obj/item/ammo_magazine/packet/p10x20mm = 1,
	)

	belt_contents = list(
		/obj/item/weapon/gun/smg/m25 = 1,
	)


/datum/outfit/quick/tgmc/marine/standard_shotgun
	name = "SH-35 侦察型"
	desc = "为了在近距离交火中占据优势。配备SH-35霰弹枪，可使用鹿弹和箭弹，一把MP-19手枪，大量手雷以及带有尖端'斯瓦林'护盾模块的轻型护甲。提供卓越的机动性和毁灭性的近距离火力，但在持续火力压制下会显得力不从心。"

	wear_suit = /obj/item/clothing/suit/modular/xenonauten/light/shield
	suit_store = /obj/item/weapon/gun/shotgun/pump/t35/standard
	belt = /obj/item/storage/belt/shotgun/mixed

	backpack_contents = list(
		/obj/item/ammo_magazine/smg/standard_machinepistol = 3,
		/obj/item/ammo_magazine/packet/p10x20mm = 1,
		/obj/item/explosive/plastique = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/synaptizine = 1,
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/weapon/gun/smg/standard_machinepistol/compact = 1,
	)

	webbing_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/binoculars = 1,
		/obj/item/explosive/grenade/incendiary = 1,
		/obj/item/explosive/grenade = 2,
	)


/datum/outfit/quick/tgmc/marine/standard_lasercarbine
	name = "激光卡宾枪侦察型"
	desc = "高机动性轻步兵。配备带下挂榴弹发射器的激光卡宾枪和激光手枪副武器，大量手雷以及配备尖端'斯瓦林'护盾模块的轻甲。机动性极佳，但不适合持久作战。"

	wear_suit = /obj/item/clothing/suit/modular/xenonauten/light/shield
	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_carbine/scout
	belt = /obj/item/storage/belt/marine/te_cells

	backpack_contents = list(
		/obj/item/cell/lasgun/lasrifle = 3,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_pistol/tactical = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/synaptizine = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = 1,
		/obj/item/explosive/plastique = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/sticky = 3,
		/obj/item/storage/box/MRE = 1,
		/obj/item/binoculars = 1,
	)


/datum/outfit/quick/tgmc/marine/light_carbine
	name = "AR-18 侦察型"
	desc = "高伤害与高机动性。配备AR-18卡宾枪及下挂榴弹发射器、搭载前沿'斯瓦林'护盾模块的轻型护甲，以及充足的手雷和弹药。出色的机动性和火力输出，但弹匣容量小，且护盾未激活时护甲薄弱，意味着此装备配置最适合采用打了就跑的战术。"

	wear_suit = /obj/item/clothing/suit/modular/xenonauten/light/shield
	suit_store = /obj/item/weapon/gun/rifle/standard_carbine/scout
	belt = /obj/item/storage/belt/marine/t18

	backpack_contents = list(
		/obj/item/ammo_magazine/packet/p10x24mm = 2,
		/obj/item/ammo_magazine/rifle/standard_carbine = 1,
		/obj/item/weapon/gun/pistol/standard_heavypistol/tactical = 1,
		/obj/item/storage/box/MRE = 1,
		/obj/item/explosive/plastique = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/sticky = 3,
		/obj/item/ammo_magazine/pistol/standard_heavypistol = 2,
	)


/datum/outfit/quick/tgmc/marine/shield_tank
	name = "SMG-25 守护者冲锋枪"
	desc = "专业弹道拦截者。配备SMG-25冲锋枪、TL-172防御盾牌以及搭载'泰尔'模块的重型护甲。设计用于吸收尽可能多的来袭伤害以保护你那些脆弱的战友，但你的机动性和伤害输出会显著降低。另请注意：TL-172卓越的热容量意味着它对火星之子的伏尔克武器具有异常出色的防御效果。"

	head = /obj/item/clothing/head/modular/m10x/tyr
	glasses = /obj/item/clothing/glasses/welding
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/heavy/tyr_two
	suit_store = /obj/item/weapon/gun/smg/m25/magharness
	belt = /obj/item/storage/belt/marine/secondary
	r_hand = /obj/item/weapon/shield/riot/marine

	backpack_contents = list(
		/obj/item/tool/extinguisher = 1,
		/obj/item/tool/weldingtool/largetank = 1,
		/obj/item/ammo_magazine/smg/m25/extended = 1,
		/obj/item/ammo_magazine/packet/p10x20mm = 2,
		/obj/item/explosive/grenade/smokebomb/cloak = 1,
		/obj/item/storage/box/MRE = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/sticky = 2,
		/obj/item/explosive/grenade/incendiary = 1,
		/obj/item/explosive/grenade = 2,
	)


/datum/outfit/quick/tgmc/marine/machete
	name = "突击陆战队员"
	desc = "这看起来不像标准装备……配备了SMG-25冲锋枪、砍刀和重型起重喷气背包，以及搭载了'斯瓦林'护盾模块的轻型护甲。不清楚为何会出现在这里，但它具备出色的机动性，对于任何你能实际接近的目标都可能造成毁灭性打击。"

	wear_suit = /obj/item/clothing/suit/modular/xenonauten/light/shield
	back = /obj/item/jetpack_marine/heavy
	belt = /obj/item/storage/holster/blade/machete/full
	suit_store = /obj/item/weapon/gun/smg/m25/magharness

	webbing_contents = list(
		/obj/item/ammo_magazine/smg/m25/extended = 2,
		/obj/item/ammo_magazine/smg/m25 = 3,
	)


/datum/outfit/quick/tgmc/marine/scout
	name = "BR-8 侦察型"
	desc = "IFF侦察兵。装备有BR-8步枪和大量手雷，以及配备尖端'斯瓦林'护盾模块的轻型护甲。提供良好的机动性和强大的IFF（敌我识别）伤害，但BR-8在近距离难以发挥，且轻型护甲在持续火力下会迅速失效。"
	quantity = 2

	wear_suit = /obj/item/clothing/suit/modular/xenonauten/light/shield
	suit_store = /obj/item/weapon/gun/rifle/tx8/scout
	belt = /obj/item/storage/belt/marine/tx8

	backpack_contents = list(
		/obj/item/ammo_magazine/smg/standard_machinepistol = 3,
		/obj/item/weapon/gun/smg/standard_machinepistol/scanner = 1,
		/obj/item/ammo_magazine/rifle/tx8 = 2,
	)

	webbing_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/binoculars = 1,
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/explosive/grenade/m15 = 2,
	)


//Base TGMC engineer outfit
/datum/outfit/quick/tgmc/engineer
	name = "地球政府殖民地海军陆战队工程兵"
	jobtype = "Squad Engineer"

	ears = /obj/item/radio/headset/mainship/marine
	glasses = /obj/item/clothing/glasses/meson
	w_uniform = /obj/item/clothing/under/marine/engineer/black_vest
	shoes = /obj/item/clothing/shoes/marine/full
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/engineer
	gloves = /obj/item/clothing/gloves/marine/insulated
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/modular/m10x/welding
	r_pocket = /obj/item/storage/pouch/firstaid/combat_patrol
	l_pocket = /obj/item/storage/pouch/tools/full
	back = /obj/item/storage/backpack/marine/engineerpack

	suit_contents = list(
		/obj/item/circuitboard/apc = 1,
		/obj/item/cell/high = 1,
		/obj/item/stack/sheet/plasteel/medium_stack = 1,
		/obj/item/stack/sheet/metal/large_stack = 1,
		/obj/item/stack/barbed_wire/half_stack = 1,
	)

	head_contents = list(
		/obj/item/explosive/plastique = 2,
	)

/datum/outfit/quick/tgmc/engineer/rrengineer
	name = "火箭专家"
	desc = "带上大家伙。配备AR-18卡宾枪和RL-160火箭发射器，以及标准工程兵装备。对敌方步兵群或轻型装甲效果极佳，但弹药有限。"
	quantity = 2

	suit_store = /obj/item/weapon/gun/rifle/standard_carbine/engineer
	back = /obj/item/storage/holster/backholster/rpg/low_impact
	belt = /obj/item/storage/belt/marine/t18

	webbing_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/explosive/grenade/chem_grenade/razorburn_large = 1,
		/obj/item/explosive/grenade/smokebomb = 1,
	)


/datum/outfit/quick/tgmc/engineer/sentry
	name = "哨戒炮技术员"
	desc = "手持多把武器，火力远超双手所能掌控。配备 AR-12 突击步枪，带微型喷火器，外加两座微型哨戒炮和标准工程兵装备。使用者可通过合理部署，快速建立坚固据点并封锁区域。"

	suit_store = /obj/item/weapon/gun/rifle/standard_assaultrifle/engineer
	belt = /obj/item/storage/belt/marine/t12

	backpack_contents = list(
		/obj/item/weapon/gun/sentry/mini/combat_patrol = 2,
		/obj/item/ammo_magazine/minisentry = 2,
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
	)

	webbing_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/ammo_magazine/flamer_tank/mini = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/explosive/grenade/chem_grenade/razorburn_large = 1,
		/obj/item/explosive/grenade/smokebomb = 1,
	)

/datum/outfit/quick/tgmc/engineer/demolition
	name = "爆破专家"
	desc = "轰隆作响，震撼全场。配备SH-15自动霰弹枪、下挂榴弹发射器，以及令人印象深刻的地雷、炸药包和手雷阵列，外加标准工程兵装备。擅长爆破清除任何障碍，并通过布雷限制敌方行动。"

	suit_store = /obj/item/weapon/gun/rifle/standard_autoshotgun/engineer
	back = /obj/item/storage/backpack/marine/tech
	belt = /obj/item/storage/belt/marine/auto_shotgun

	backpack_contents = list(
		/obj/item/minelayer = 1,
		/obj/item/storage/box/explosive_mines/large = 1,
		/obj/item/storage/box/explosive_mines = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/detpack = 3,
		/obj/item/explosive/plastique = 2,
		/obj/item/storage/box/MRE = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
		/obj/item/explosive/grenade/smokebomb = 1,
	)

	webbing_contents = list(
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/assembly/signaler = 1,
		/obj/item/explosive/grenade/sticky = 3,
	)


//Base TGMC corpsman outfit
/datum/outfit/quick/tgmc/corpsman
	name = "地球政府殖民地海军陆战队卫生兵"
	jobtype = "Squad Corpsman"

	belt = /obj/item/storage/belt/lifesaver/quick
	ears = /obj/item/radio/headset/mainship/marine
	glasses = /obj/item/clothing/glasses/hud/health
	w_uniform = /obj/item/clothing/under/marine/corpsman/corpman_vest
	shoes = /obj/item/clothing/shoes/marine/full
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/mimir
	gloves = /obj/item/clothing/gloves/marine
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/modular/m10x/mimir
	r_pocket = /obj/item/storage/pouch/magazine/large
	l_pocket = /obj/item/storage/pouch/grenade/combat_patrol
	back = /obj/item/storage/backpack/marine/corpsman

	suit_contents = list(
		/obj/item/tool/extinguisher = 1,
		/obj/item/defibrillator = 1,
	)

	head_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/isotonic = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/neuraline = 1,
	)

	webbing_contents = list(
		/obj/item/bodybag/cryobag = 1,
		/obj/item/roller = 1,
		/obj/item/tweezers_advanced = 1,
		/obj/item/reagent_containers/hypospray/advanced/nanoblood = 1,
		/obj/item/storage/pill_bottle/spaceacillin = 1,
		/obj/item/reagent_containers/hypospray/advanced/combat_advanced = 1,
	)


/datum/outfit/quick/tgmc/corpsman/standard_medic
	name = "AR-12 卫生兵"
	desc = "让战友们持续战斗。装备 AR-12 突击步枪，带下挂榴弹发射器，拥有一系列强大的工具来治疗你的小队，以及'密米尔'生化防护模块，让你能在危险环境中继续行动。医疗后送已无可能，你就是战友们与过早牺牲之间的唯一屏障。"

	suit_store = /obj/item/weapon/gun/rifle/standard_assaultrifle/medic

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = 2,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = 2,
		/obj/item/explosive/grenade = 1,
		/obj/item/explosive/grenade/sticky = 2,
		/obj/item/explosive/grenade/incendiary = 1,
		/obj/item/ammo_magazine/packet/p10x24mm = 1,
		/obj/item/ammo_magazine/rifle/standard_assaultrifle = 3,
	)

	r_pocket_contents = list(
		/obj/item/ammo_magazine/rifle/standard_assaultrifle = 3,
	)


/datum/outfit/quick/tgmc/corpsman/standard_smg
	name = "SMG-90 卫生兵"
	desc = "让所有人保持战斗状态。装备SMG-90冲锋枪以保持良好机动性，拥有一系列用于治疗队友的出色工具，以及一个'米米尔'生化防护模块，让你能在危险环境中持续作业。既然医疗后送已无可能，你就是你的战友们与过早阵亡之间的唯一屏障。"

	suit_store = /obj/item/weapon/gun/smg/standard_smg/tactical

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = 2,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = 2,
		/obj/item/ammo_magazine/smg/standard_smg = 5,
		/obj/item/explosive/grenade = 2,
		/obj/item/explosive/grenade/incendiary = 2,
		/obj/item/ammo_magazine/packet/p10x20mm = 1,
	)

	r_pocket_contents = list(
		/obj/item/ammo_magazine/smg/standard_smg = 3,
	)


/datum/outfit/quick/tgmc/corpsman/standard_skirmishrifle
	name = "AR-21 卫生兵"
	desc = "让战友们持续战斗。装备 AR-21 突击步枪，带下挂榴弹发射器，拥有强大的治疗工具套装，以及'密米尔'生化防护模块，让你能在危险环境中继续行动。医疗后送已无可能，你就是战友们与过早阵亡之间的唯一屏障。"

	suit_store = /obj/item/weapon/gun/rifle/standard_skirmishrifle/standard

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = 2,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = 2,
		/obj/item/explosive/grenade = 2,
		/obj/item/explosive/grenade/sticky = 2,
		/obj/item/ammo_magazine/packet/p10x25mm = 1,
		/obj/item/ammo_magazine/rifle/standard_skirmishrifle = 3,
	)

	r_pocket_contents = list(
		/obj/item/ammo_magazine/rifle/standard_skirmishrifle = 3,
	)


/datum/outfit/quick/tgmc/corpsman/auto_shotgun
	name = "SH-15 卫生兵"
	desc = "让战友们持续战斗。配备SH-15自动霰弹枪及下挂手雷发射器，拥有强大的团队治疗工具套装，以及'米米尔'生化防护模块，让你能在危险环境中持续作战。医疗后送已无可能，你就是战友们与过早牺牲之间的唯一屏障。"

	suit_store = /obj/item/weapon/gun/rifle/standard_autoshotgun/engineer

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = 2,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = 2,
		/obj/item/explosive/grenade = 2,
		/obj/item/explosive/grenade/sticky = 2,
		/obj/item/explosive/grenade/incendiary = 1,
		/obj/item/ammo_magazine/rifle/tx15_slug = 2,
		/obj/item/ammo_magazine/rifle/tx15_flechette = 1,
	)

	r_pocket_contents = list(
		/obj/item/ammo_magazine/rifle/tx15_slug = 1,
		/obj/item/ammo_magazine/rifle/tx15_flechette = 2,
	)


/datum/outfit/quick/tgmc/corpsman/laser_medic
	name = "激光步枪卫生兵"
	desc = "让战友们保持战斗状态。配备一把带微型喷火器的激光步枪，一套用于治疗团队的强大工具，以及一个'米米尔'生化防护模块，让你能在危险环境中持续作业。既然医疗后送已无可能，你就是战友们与过早阵亡之间的唯一屏障。"

	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_rifle/medic

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = 2,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = 2,
		/obj/item/ammo_magazine/flamer_tank/mini = 2,
		/obj/item/cell/lasgun/lasrifle = 5,
	)

	r_pocket_contents = list(
		/obj/item/cell/lasgun/lasrifle = 3,
	)


/datum/outfit/quick/tgmc/corpsman/laser_carbine
	name = "激光卡宾枪卫生兵"
	desc = "让战友们持续战斗。配备一把带下挂榴弹发射器的激光卡宾枪，一套用于治疗队友的强力工具，以及一个'米米尔'生化防护模块，让你能在危险环境中继续行动。医疗后送已无可能，你就是战友们与过早阵亡之间的唯一屏障。"

	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_carbine/scout

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = 2,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = 2,
		/obj/item/explosive/grenade/sticky = 2,
		/obj/item/explosive/grenade = 2,
		/obj/item/cell/lasgun/lasrifle = 4,
	)

	r_pocket_contents = list(
		/obj/item/cell/lasgun/lasrifle = 3,
	)


//Base TGMC smartgunner outfit
/datum/outfit/quick/tgmc/smartgunner
	name = "地球政府殖民地海军陆战队智能机枪手"
	jobtype = "Squad Smartgunner"

	belt = /obj/item/belt_harness/marine
	ears = /obj/item/radio/headset/mainship/marine
	glasses = /obj/item/clothing/glasses/night/m56_goggles
	w_uniform = /obj/item/clothing/under/marine/black_vest
	shoes = /obj/item/clothing/shoes/marine/full
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/heavy/tyr_two
	gloves = /obj/item/clothing/gloves/marine
	mask = /obj/item/clothing/mask/gas/tactical
	head = /obj/item/clothing/head/modular/m10x/tyr
	r_pocket = /obj/item/storage/pouch/firstaid/combat_patrol
	l_pocket = /obj/item/storage/pouch/grenade/combat_patrol
	back = /obj/item/storage/backpack/marine/satchel

	suit_contents = list(
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/isotonic = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
	)

	head_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/combat = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = 1,
	)


/datum/outfit/quick/tgmc/smartgunner/standard_sg
	name = "SG29 智能机枪手"
	desc = "一把比普通熊或陆战队员更聪明的枪。配备了SG-29智能机枪和装有'泰尔'额外装甲模块的重型装甲，SG凭借其敌我识别弹药负责提供机动、精准的火力支援。"

	suit_store = /obj/item/weapon/gun/rifle/standard_smartmachinegun/patrol

	backpack_contents = list(
		/obj/item/ammo_magazine/standard_smartmachinegun = 4,
		/obj/item/weapon/gun/pistol/vp70/tactical = 1,
	)

	webbing_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/ammo_magazine/pistol/vp70 = 4,
	)


/datum/outfit/quick/tgmc/smartgunner/minigun_sg
	name = "SG85智能机枪手"
	desc = "比理智更多的子弹。装备有SG-85智能加特林机枪、MP-19副武器，以及加装了'泰尔'额外装甲模块的重型护甲，还有一大堆子弹。适用于你想倾泻火力洪流的场合。尽量别把弹药打光。"

	belt = /obj/item/storage/belt/sparepouch
	suit_store = /obj/item/weapon/gun/minigun/smart_minigun/motion_detector
	back = /obj/item/ammo_magazine/minigun_powerpack/smartgun

	belt_contents = list(
		/obj/item/ammo_magazine/packet/smart_minigun = 2,
		/obj/item/weapon/gun/smg/standard_machinepistol/compact = 1,
	)

	webbing_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/ammo_magazine/smg/standard_machinepistol = 4,
	)

/datum/outfit/quick/tgmc/smartgunner/target_rifle
	name = "SG62智能机枪手"
	desc = "灵活性与精准性。配备SG-62智能目标步枪和搭载'泰尔'附加装甲模块的重型护甲。集成的观测步枪配备多种灵活的弹药类型，结合高伤害、穿透力和敌我识别功能，构成了一个危险的火力支援配置。"

	belt = /obj/item/storage/belt/marine/target_rifle
	suit_store = /obj/item/weapon/gun/rifle/standard_smarttargetrifle/motion

	backpack_contents = list(
		/obj/item/ammo_magazine/rifle/standard_spottingrifle/incendiary = 2,
		/obj/item/ammo_magazine/rifle/standard_spottingrifle/tungsten = 2,
		/obj/item/ammo_magazine/pistol/vp70 = 3,
		/obj/item/weapon/gun/pistol/vp70/tactical = 1,
	)

	webbing_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/ammo_magazine/rifle/standard_spottingrifle/highimpact = 4,
	)


//Base TGMC leader outfit
/datum/outfit/quick/tgmc/leader
	name = "地球政府殖民地海军陆战队班长"
	jobtype = "Squad Leader"

	ears = /obj/item/radio/headset/mainship/marine
	glasses = /obj/item/clothing/glasses/hud/health
	w_uniform = /obj/item/clothing/under/marine/black_vest
	shoes = /obj/item/clothing/shoes/marine/full
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/heavy/leader
	gloves = /obj/item/clothing/gloves/marine
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/modular/m10x/leader
	r_pocket = /obj/item/storage/pouch/firstaid/combat_patrol_leader
	l_pocket = /obj/item/storage/pouch/grenade/combat_patrol
	back = /obj/item/storage/backpack/lightpack

	suit_contents = list(
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/isotonic = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
	)

	head_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/combat = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = 1,
	)


/datum/outfit/quick/tgmc/leader/standard_assaultrifle
	name = "AR-12 巡逻队长"
	desc = "下达命令。配备AR-12突击步枪（带下挂榴弹发射器）、大量手雷，以及可部署摄像头等支援装备，还有带'瓦尔基里'自动医疗模块的重型护甲。凭借你的装备和号令天赋，能为你的小队提供出色的支援。"

	suit_store = /obj/item/weapon/gun/rifle/standard_assaultrifle/rifleman
	belt = /obj/item/storage/belt/marine/t12

	backpack_contents = list(
		/obj/item/deployable_camera = 1,
		/obj/item/ammo_magazine/packet/p10x24mm = 1,
		/obj/item/explosive/plastique = 2,
		/obj/item/explosive/grenade/smokebomb/cloak = 1,
		/obj/item/explosive/grenade/incendiary = 1,
		/obj/item/storage/box/MRE = 1,
		/obj/item/ammo_magazine/pistol/vp70 = 2,
		/obj/item/weapon/gun/pistol/vp70/tactical = 1,
		/obj/item/tool/extinguisher/mini = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/sticky = 2,
		/obj/item/explosive/grenade = 2,
		/obj/item/binoculars/fire_support/campaign = 1,
	)

/datum/outfit/quick/tgmc/leader/standard_assaultrifle/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/hud_tablet(H, /datum/job/terragov/squad/leader, H.assigned_squad), SLOT_IN_BACKPACK)

/datum/outfit/quick/tgmc/leader/standard_carbine
	name = "AR-18 巡逻队长"
	desc = "下达命令。配备带有等离子体手枪配件的AR-18卡宾枪、大量手雷，以及带有'瓦尔基里'自动医疗模块的重型护甲。凭借你的装备和下达命令的才能，你可以为你的小队提供出色的支援，同时在中距离造成可观的伤害。"

	suit_store = /obj/item/weapon/gun/rifle/standard_carbine/plasma_pistol
	belt = /obj/item/storage/belt/marine/t18

	backpack_contents = list(
		/obj/item/ammo_magazine/pistol/plasma_pistol = 3,
		/obj/item/ammo_magazine/packet/p10x24mm = 1,
		/obj/item/explosive/plastique = 2,
		/obj/item/explosive/grenade/smokebomb/cloak = 1,
		/obj/item/storage/box/MRE = 1,
		/obj/item/ammo_magazine/pistol/vp70 = 2,
		/obj/item/weapon/gun/pistol/vp70/tactical = 1,
		/obj/item/tool/extinguisher/mini = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade = 2,
		/obj/item/explosive/grenade/m15 = 1,
		/obj/item/explosive/grenade/incendiary = 1,
		/obj/item/binoculars/fire_support/campaign = 1,
	)


/datum/outfit/quick/tgmc/leader/combat_rifle
	name = "AR-11 巡逻队长"
	desc = "下达命令。配备AR-11战斗步枪、大量手雷，以及带有'瓦尔基里'自动医疗模块的重型装甲。凭借你的装备和下达命令的才能，你可以在所有距离上提供出色的支援，并对小队提供极佳的支持。"

	suit_store = /obj/item/weapon/gun/rifle/tx11/standard
	belt = /obj/item/storage/belt/marine/combat_rifle

	backpack_contents = list(
		/obj/item/deployable_camera = 2,
		/obj/item/ammo_magazine/packet/p492x34mm = 1,
		/obj/item/explosive/plastique = 2,
		/obj/item/explosive/grenade/smokebomb/cloak = 1,
		/obj/item/storage/box/MRE = 1,
		/obj/item/ammo_magazine/pistol/vp70 = 2,
		/obj/item/weapon/gun/pistol/vp70/tactical = 1,
		/obj/item/tool/extinguisher/mini = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade = 2,
		/obj/item/explosive/grenade/m15 = 1,
		/obj/item/explosive/grenade/incendiary = 1,
		/obj/item/binoculars/fire_support/campaign = 1,
	)

/datum/outfit/quick/tgmc/leader/combat_rifle/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/hud_tablet(H, /datum/job/terragov/squad/leader, H.assigned_squad), SLOT_IN_BACKPACK)

/datum/outfit/quick/tgmc/leader/standard_battlerifle
	name = "BR-64巡逻队长"
	desc = "下达命令。配备有带下挂榴弹发射器的BR-64战斗步枪、大量手雷，以及带有'瓦尔基里'自动医疗模块的重型护甲。与更常见的步枪相比，这款战斗步枪提供了更高的伤害和穿透力，同时保留了AR-11所不具备的榴弹发射器。"

	suit_store = /obj/item/weapon/gun/rifle/standard_br/standard
	belt = /obj/item/storage/belt/marine/standard_battlerifle

	backpack_contents = list(
		/obj/item/ammo_magazine/packet/p10x265mm = 2,
		/obj/item/explosive/plastique = 2,
		/obj/item/explosive/grenade/smokebomb/cloak = 1,
		/obj/item/explosive/grenade/incendiary = 1,
		/obj/item/storage/box/MRE = 1,
		/obj/item/ammo_magazine/pistol/vp70 = 2,
		/obj/item/weapon/gun/pistol/vp70/tactical = 1,
		/obj/item/tool/extinguisher = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade = 2,
		/obj/item/explosive/grenade/sticky = 2,
		/obj/item/binoculars/fire_support/campaign = 1,
	)


/datum/outfit/quick/tgmc/leader/auto_shotgun
	name = "SH-15 巡逻队长"
	desc = "下达命令。配备SH-15自动霰弹枪、大量手雷，以及带有'瓦尔基里'自动医疗模块的重型护甲。凭借你的装备和下达命令的才能，你能为你的小队提供出色的支援，兼具强大的伤害和控制能力。"

	suit_store = /obj/item/weapon/gun/rifle/standard_autoshotgun/plasma_pistol
	belt = /obj/item/storage/belt/marine/auto_shotgun

	backpack_contents = list(
		/obj/item/ammo_magazine/rifle/tx15_slug = 1,
		/obj/item/ammo_magazine/rifle/tx15_flechette = 1,
		/obj/item/ammo_magazine/pistol/plasma_pistol = 3,
		/obj/item/explosive/plastique = 2,
		/obj/item/storage/box/MRE = 1,
		/obj/item/ammo_magazine/pistol/vp70 = 2,
		/obj/item/weapon/gun/pistol/vp70/tactical = 1,
		/obj/item/tool/extinguisher = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/m15 = 2,
		/obj/item/explosive/grenade/incendiary = 1,
		/obj/item/explosive/grenade/smokebomb/cloak = 1,
		/obj/item/binoculars/fire_support/campaign = 1,
	)


/datum/outfit/quick/tgmc/leader/standard_laserrifle
	name = "激光步枪巡逻队长"
	desc = "下达命令。配备一把带下挂榴弹发射器的激光步枪，以更好地对抗火星之子部队的装甲，还带有可部署摄像头等支援装备，以及一套配备'瓦尔基里'自动医疗模块的重型护甲。凭借你的装备和号令天赋，能为你的小队提供卓越的支援。"

	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_rifle/rifleman
	belt = /obj/item/storage/belt/marine/te_cells

	backpack_contents = list(
		/obj/item/deployable_camera = 2,
		/obj/item/cell/lasgun/lasrifle = 1,
		/obj/item/explosive/plastique = 2,
		/obj/item/explosive/grenade/smokebomb/cloak = 1,
		/obj/item/storage/box/MRE = 1,
		/obj/item/ammo_magazine/pistol/vp70 = 2,
		/obj/item/weapon/gun/pistol/vp70/tactical = 1,
		/obj/item/tool/extinguisher/mini = 1,
	)

	webbing_contents = list(
		/obj/item/ammo_magazine/flamer_tank/mini = 2,
		/obj/item/explosive/grenade = 2,
		/obj/item/binoculars/fire_support/campaign = 1,
	)

/datum/outfit/quick/tgmc/leader/standard_laserrifle/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/hud_tablet(H, /datum/job/terragov/squad/leader, H.assigned_squad), SLOT_IN_BACKPACK)

/datum/outfit/quick/tgmc/leader/oicw
	name = "AR-55 巡逻队长"
	desc = "下达命令。配备AR-55 OICW步枪，其集成式榴弹发射器备有充足手雷，另配有可部署摄像头等支援装备，以及搭载'瓦尔基里'自动医疗模块的重型护甲。凭借你的装备和发号施令的才能，能为你的小队提供卓越支援。"
	quantity = 2

	suit_store = /obj/item/weapon/gun/rifle/tx55/combat_patrol
	belt = /obj/item/storage/belt/marine/oicw

	backpack_contents = list(
		/obj/item/ammo_magazine/packet/p10x24mm = 2,
		/obj/item/ammo_magazine/rifle/standard_carbine = 2,
		/obj/item/ammo_magazine/rifle/tx54 = 2,
		/obj/item/weapon/gun/pistol/vp70/tactical = 1,
		/obj/item/tool/extinguisher = 1,
	)

	webbing_contents = list(
		/obj/item/ammo_magazine/pistol/vp70 = 2,
		/obj/item/storage/box/MRE = 1,
		/obj/item/explosive/plastique = 1,
		/obj/item/binoculars/fire_support/campaign = 1,
	)


//// SOM loadouts ////

//Base SOM outfit
/datum/outfit/quick/som
	name = "火星之子基地"
	desc = "这是所有火星之子快速供应商装备的基础类型路径。你不应该看到这个。"

//Base SOM marine outfit
/datum/outfit/quick/som/marine
	name = "火星之子陆战队员"
	jobtype = "SOM Squad Standard"

	ears = /obj/item/radio/headset/mainship/som
	w_uniform = /obj/item/clothing/under/som/webbing
	shoes = /obj/item/clothing/shoes/marine/som/knife
	wear_suit = /obj/item/clothing/suit/modular/som/shield
	gloves = /obj/item/clothing/gloves/marine/som
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/modular/som
	r_pocket = /obj/item/storage/pouch/firstaid/som/combat_patrol
	l_pocket = /obj/item/storage/pouch/grenade/som/combat_patrol
	back = /obj/item/storage/backpack/satchel/som

	suit_contents = list(
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/isotonic = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
	)

	head_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/combat = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = 1,
	)


/datum/outfit/quick/som/marine/standard_assaultrifle
	name = "V-31 步兵"
	desc = "典型的火星之子步兵。装备有V-31突击步枪，集成'微型手雷'导轨发射器，中型护甲和精选的手雷。导轨发射器发射的手雷需在飞行途中解除保险，因此在近距离效果不佳，但在中距离提供了显著的战术选择。"

	suit_store = /obj/item/weapon/gun/rifle/som/standard
	belt = /obj/item/storage/belt/marine/som/som_rifle

	backpack_contents = list(
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/ammo_magazine/pistol/som = 2,
		/obj/item/weapon/gun/pistol/som/standard = 1,
		/obj/item/ammo_magazine/rifle/som = 2,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 1,
		/obj/item/ammo_magazine/handful/micro_grenade = 1,
		/obj/item/ammo_magazine/handful/micro_grenade/dragonbreath = 1,
		/obj/item/ammo_magazine/handful/micro_grenade/cluster = 1,
		/obj/item/ammo_magazine/handful/micro_grenade/smoke_burst = 1,
	)


/datum/outfit/quick/som/marine/mpi
	name = "MPI_KM 步兵"
	desc = "对旧日时光的呼唤。配备MPI_KM突击步枪，带有下挂式榴弹发射器和大量手雷。这款老式武器在最初的火星叛乱期间曾是常见景象，MPI步枪出色的制止力、可靠性以及浓厚的怀旧情怀，意味着尽管年代久远，它仍能在一些火星之子成员中见到使用。"

	suit_store = /obj/item/weapon/gun/rifle/mpi_km/black/grenadier
	belt = /obj/item/storage/belt/marine/som/mpi_black

	backpack_contents = list(
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/ammo_magazine/pistol/som = 2,
		/obj/item/weapon/gun/pistol/som/standard = 1,
		/obj/item/ammo_magazine/rifle/mpi_km/black = 2,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 4,
		/obj/item/explosive/grenade/incendiary/som = 1,
	)


/datum/outfit/quick/som/marine/light_carbine
	name = "V-34 轻步兵"
	desc = "机动性强且危险。配备V-34卡宾枪、带有'神盾'护盾模块的轻型护甲以及大量手雷。V-34是一款古老武器的现代化升级版，在最初的火星叛乱期间曾是常见装备。非常可靠，在轻巧紧凑的构型中具备出色的制止力。作为VX-32的廉价替代品投入使用。"

	wear_suit = /obj/item/clothing/suit/modular/som/light/shield
	suit_store = /obj/item/weapon/gun/rifle/som_carbine/black/standard
	belt = /obj/item/storage/belt/marine/som/carbine_black

	backpack_contents = list(
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/ammo_magazine/pistol/som = 2,
		/obj/item/weapon/gun/pistol/som/standard = 1,
		/obj/item/ammo_magazine/rifle/mpi_km/carbine/black = 2,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 4,
		/obj/item/explosive/grenade/incendiary/som = 1,
	)


/datum/outfit/quick/som/marine/scout
	name = "V-21 轻步兵"
	desc = "高机动侦察配置。配备V-21冲锋枪，其可变射速在正确持握时可实现极高射速；轻型护甲搭载'神盾'护盾模块，并配备精选手雷组合。具备卓越机动性与炽烈火力，但在持久交战中可能力不从心——轻甲防护与V-21的高射速消耗可能成为致命短板。"

	wear_suit = /obj/item/clothing/suit/modular/som/light/shield
	suit_store = /obj/item/weapon/gun/smg/som/scout
	belt = /obj/item/storage/belt/marine/som/som_smg

	backpack_contents = list(
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/ammo_magazine/pistol/som = 2,
		/obj/item/weapon/gun/pistol/som/standard = 1,
		/obj/item/ammo_magazine/smg/som = 3,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 2,
		/obj/item/explosive/grenade/incendiary/som = 2,
		/obj/item/binoculars = 1,
	)


/datum/outfit/quick/som/marine/shotgunner
	name = "V-51 先锋"
	desc = "用于近距离遭遇战。配备V-51半自动霰弹枪、带有'神盾'护盾模块的轻型护甲以及大量手雷选择。提供良好的机动性和危险的近战火力。"

	belt = /obj/item/storage/belt/shotgun/som/mixed
	wear_suit = /obj/item/clothing/suit/modular/som/light/shield
	suit_store = /obj/item/weapon/gun/shotgun/som/standard

	backpack_contents = list(
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/ammo_magazine/pistol/som = 3,
		/obj/item/weapon/gun/pistol/som/standard = 1,
		/obj/item/explosive/grenade/flashbang/stun = 2,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 2,
		/obj/item/explosive/grenade/incendiary/som = 2,
		/obj/item/binoculars = 1,
	)


/datum/outfit/quick/som/marine/pyro
	name = "V-62 喷火器操作员"
	desc = "闻起来像是胜利的味道。装备了V-62焚化器和宽口喷嘴，V-11配备用于快速连发，重型装甲升级了'哈迪斯'防火模块，以及一个燃料背罐。拥有优于平均水平的射程，并能快速焚毁大片区域。它受到显著的减速影响，缺少集成灭火器，且无节制的使用可能导致迅速耗尽所有可用燃料。"

	head = /obj/item/clothing/head/modular/som/hades
	wear_suit = /obj/item/clothing/suit/modular/som/heavy/pyro
	belt = /obj/item/storage/holster/belt/pistol/m4a3/som
	back = /obj/item/ammo_magazine/flamer_tank/backtank
	suit_store = /obj/item/weapon/gun/flamer/som/mag_harness

	webbing_contents = list(
		/obj/item/ammo_magazine/pistol/som/extended = 2,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/explosive/grenade/som = 1,
	)

	belt_contents = list(
		/obj/item/weapon/gun/pistol/som/burst = 1,
		/obj/item/ammo_magazine/pistol/som/extended = 6,
	)


/datum/outfit/quick/som/marine/breacher
	name = "V-21 破门者"
	desc = "重型装甲破门配置。配备V-21冲锋枪，具备可变射速功能，正确持握时可实现极高射速；同时装备重型装甲、登舰盾牌以及精选手雷组合。提供卓越防护能力，但伤害输出可能不足，尤其在远距离作战时更为明显。"

	glasses = /obj/item/clothing/glasses/welding
	wear_suit = /obj/item/clothing/suit/modular/som/heavy/shield
	suit_store = /obj/item/weapon/gun/smg/som/one_handed
	belt = /obj/item/storage/belt/marine/som/som_smg
	r_hand = /obj/item/weapon/shield/riot/marine/som

	backpack_contents = list(
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/tool/weldingtool/largetank = 1,
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/russian_red = 1,
		/obj/item/ammo_magazine/smg/som = 4,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 2,
		/obj/item/explosive/grenade/incendiary/som = 2,
		/obj/item/explosive/grenade/flashbang/stun = 1,
	)


/datum/outfit/quick/som/marine/breacher_melee
	name = "近战破门手"
	desc = "当需要彻底摒弃任何隐蔽性时，这就是你的选择。配备'洛里卡'增强型重型护甲，并装备一把用于破开重型护甲的巨型双手破门斧。若使用得当，它还能提供一定程度的防护。"

	head = /obj/item/clothing/head/modular/som/lorica
	wear_suit = /obj/item/clothing/suit/modular/som/heavy/lorica
	suit_store = /obj/item/weapon/twohanded/fireaxe/som
	belt = /obj/item/storage/holster/belt/pistol/m4a3/som

	backpack_contents = list(
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/ammo_magazine/pistol/som = 2,
		/obj/item/explosive/plastique = 3,
		/obj/item/tool/extinguisher = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/synaptizine = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/russian_red = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 4,
		/obj/item/explosive/grenade/incendiary/som = 1,
	)

	belt_contents = list(
		/obj/item/weapon/gun/pistol/som/burst = 1,
		/obj/item/ammo_magazine/pistol/som/extended = 6,
	)


/datum/outfit/quick/som/marine/machine_gunner
	name = "V-41 机枪手"
	desc = "重型静态火力支援。配备V-41机枪、V-11手枪连发模式及基础建筑物资。虽然通常不符合火星之子强调机动性与进攻性的标准战术原则，但V-41常见于防御阵地或二线部队——在这些场合，其较差的机动性相较于持续火力输出而言只是次要缺陷。"

	suit_store = /obj/item/weapon/gun/rifle/som_mg/standard
	belt = /obj/item/storage/holster/belt/pistol/m4a3/som
	l_pocket = /obj/item/storage/pouch/construction/som

	backpack_contents = list(
		/obj/item/ammo_magazine/som_mg = 4,
		/obj/item/tool/extinguisher = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 2,
		/obj/item/explosive/grenade/smokebomb/som = 1,
		/obj/item/explosive/grenade/smokebomb/satrapine = 1,
		/obj/item/storage/box/MRE/som = 1,
	)

	l_pocket_contents = list(
		/obj/item/tool/shovel/etool = 1,
		/obj/item/stack/sandbags_empty/half = 1,
		/obj/item/stack/sandbags/large_stack = 1,
		/obj/item/stack/barbed_wire/half_stack = 1,
	)

	belt_contents = list(
		/obj/item/weapon/gun/pistol/som/burst = 1,
		/obj/item/ammo_magazine/pistol/som/extended = 6,
	)


/datum/outfit/quick/som/marine/charger
	name = "冲锋步兵"
	desc = "火星之子的未来步兵。装备有伏尔克充能枪、中型护甲和多种手雷。伏尔克武器异常危险，尤其对护甲薄弱或密集的敌人。充能枪是火星之子的主要近/中程武器，机动性良好，必要时可（较困难地）单手使用。"
	quantity = 4

	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/charger/magharness
	belt = /obj/item/storage/belt/marine/som/volkite

	backpack_contents = list(
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/ammo_magazine/pistol/som = 2,
		/obj/item/weapon/gun/pistol/som/standard = 1,
		/obj/item/cell/lasgun/volkite = 2,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 2,
		/obj/item/explosive/grenade/incendiary/som = 2,
		/obj/item/tool/extinguisher/mini = 1,
	)


//Base SOM engineer outfit
/datum/outfit/quick/som/engineer
	name = "火星之子工程兵"
	jobtype = "SOM Squad Engineer"

	ears = /obj/item/radio/headset/mainship/som
	w_uniform = /obj/item/clothing/under/som/webbing
	shoes = /obj/item/clothing/shoes/marine/som/knife
	wear_suit = /obj/item/clothing/suit/modular/som/engineer
	gloves = /obj/item/clothing/gloves/marine/som/insulated
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/modular/som/engineer
	glasses = /obj/item/clothing/glasses/meson
	r_pocket = /obj/item/storage/pouch/firstaid/som/combat_patrol
	l_pocket = /obj/item/storage/pouch/tools/som/full
	back = /obj/item/storage/backpack/lightpack/som

	suit_contents = list(
		/obj/item/circuitboard/apc = 1,
		/obj/item/cell/high = 1,
		/obj/item/stack/sheet/plasteel/medium_stack = 1,
		/obj/item/stack/sheet/metal/large_stack = 1,
		/obj/item/stack/barbed_wire/half_stack = 1,
	)

	head_contents = list(
		/obj/item/explosive/plastique = 2,
	)


/datum/outfit/quick/som/engineer/standard_assaultrifle
	name = "V-31 工程兵"
	desc = "战场工程师；负责构筑与摧毁。配备带集成'微型手雷'导轨发射器的V-31突击步枪、中型护甲、可部署的COPE哨戒炮及多种爆炸物。拥有各类用于战场建造、维修或实施爆破的补给装备。是均衡战斗力量中宝贵的支援资产。导轨发射器发射需在飞行途中解除保险的手雷，因此在近距离效果不佳，但为中距离作战提供了显著的战术选择。"

	suit_store = /obj/item/weapon/gun/rifle/som/standard
	belt = /obj/item/storage/belt/marine/som/som_rifle

	backpack_contents = list(
		/obj/item/tool/extinguisher = 1,
		/obj/item/assembly/signaler = 1,
		/obj/item/detpack = 4,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/cope = 1,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/explosive/plastique = 2,
	)

	webbing_contents = list(
		/obj/item/ammo_magazine/handful/micro_grenade = 1,
		/obj/item/ammo_magazine/handful/micro_grenade/dragonbreath = 1,
		/obj/item/ammo_magazine/handful/micro_grenade/cluster = 2,
		/obj/item/explosive/grenade/smokebomb/satrapine = 1,
	)


/datum/outfit/quick/som/engineer/mpi
	name = "MPI-KM 工程兵"
	desc = "战场工程师；负责构筑与拆除。配备MPI_KM突击步枪、中型护甲、可部署的COPE哨戒炮以及多种爆炸物。拥有各类用于战场构筑、维修或实施爆破的补给与装备。是均衡战斗力量中宝贵的支援资产。这款旧式武器在最初的火星叛乱期间曾是常见景象，MPI良好的制止力、可靠性以及浓厚的怀旧情怀，意味着尽管年代久远，它仍能在部分火星之子成员中见到使用。"

	suit_store = /obj/item/weapon/gun/rifle/mpi_km/black/magharness
	belt = /obj/item/storage/belt/marine/som/mpi_black

	backpack_contents = list(
		/obj/item/tool/extinguisher = 1,
		/obj/item/assembly/signaler = 1,
		/obj/item/detpack = 4,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/cope = 1,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/explosive/plastique = 2,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 3,
		/obj/item/explosive/grenade/smokebomb/som = 1,
		/obj/item/explosive/grenade/smokebomb/satrapine = 1,
	)


/datum/outfit/quick/som/engineer/standard_carbine
	name = "V-34 工程兵"
	desc = "战场工程师；负责构筑与拆除。配备V-34卡宾枪、中型护甲、可部署的COPE哨戒炮及多种爆炸物。拥有各类补给和装备，可在战场上进行建造、维修或实施爆破。是均衡战斗力量中宝贵的支援资产。V-34是一款老式武器的现代化升级版，在最初的火星叛乱期间曾是常见装备。非常可靠，在轻巧紧凑的枪身中具备出色的制止力。作为VX-32更廉价的替代品投入服役。"

	suit_store = /obj/item/weapon/gun/rifle/som_carbine/black/standard
	belt = /obj/item/storage/belt/marine/som/carbine_black

	backpack_contents = list(
		/obj/item/tool/extinguisher = 1,
		/obj/item/assembly/signaler = 1,
		/obj/item/detpack = 4,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/cope = 1,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/explosive/plastique = 2,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 3,
		/obj/item/explosive/grenade/smokebomb/som = 1,
		/obj/item/explosive/grenade/smokebomb/satrapine = 1,
	)


/datum/outfit/quick/som/engineer/standard_smg
	name = "V-21 工程兵"
	desc = "战场工程师；负责构筑与拆除。配备V-21冲锋枪，其可变射速在正确持握时可提供极高的火力输出，另有中型护甲、可部署的COPE哨戒炮及多种爆炸物选择。拥有各类补给与装备，可在战场上进行建造、维修或实施爆破作业。是均衡战斗力量中宝贵的支援资产。"

	suit_store = /obj/item/weapon/gun/smg/som/support
	belt = /obj/item/storage/belt/marine/som/som_smg

	backpack_contents = list(
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/assembly/signaler = 1,
		/obj/item/detpack = 3,
		/obj/item/ammo_magazine/smg/som = 2,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/cope = 1,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/explosive/plastique = 2,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/smokebomb/som = 2,
		/obj/item/explosive/grenade/flashbang/stun = 1,
		/obj/item/explosive/grenade/som = 1,
		/obj/item/explosive/grenade/smokebomb/satrapine = 1,
	)

/datum/outfit/quick/som/engineer/standard_shotgun
	name = "V-51 工程兵"
	desc = "战场工程师；负责构筑与拆除。配备V-51半自动霰弹枪、中型护甲、可部署的COPE哨戒炮及多种爆炸物。拥有各类用于战场建造、维修或实施爆破的补给与装备。是完善战斗力量中宝贵的支援资产。"

	belt = /obj/item/storage/belt/shotgun/som/flechette
	suit_store = /obj/item/weapon/gun/shotgun/som/support

	backpack_contents = list(
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/assembly/signaler = 1,
		/obj/item/detpack = 3,
		/obj/item/ammo_magazine/handful/buckshot = 2,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/cope = 1,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/explosive/plastique = 2,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/smokebomb/som = 2,
		/obj/item/explosive/grenade/flashbang/stun = 1,
		/obj/item/explosive/grenade/som = 1,
		/obj/item/explosive/grenade/smokebomb/satrapine = 1,
	)


//Base SOM medic outfit
/datum/outfit/quick/som/medic
	name = "火星之子小队卫生兵"
	jobtype = "SOM Squad Medic"

	belt = /obj/item/storage/belt/lifesaver/som/quick
	ears = /obj/item/radio/headset/mainship/som
	w_uniform = /obj/item/clothing/under/som/medic/vest
	shoes = /obj/item/clothing/shoes/marine/som/knife
	wear_suit = /obj/item/clothing/suit/modular/som/medic
	gloves = /obj/item/clothing/gloves/marine/som
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/modular/som
	glasses = /obj/item/clothing/glasses/hud/health
	r_pocket = /obj/item/storage/pouch/magazine/large/som
	l_pocket = /obj/item/storage/pouch/grenade/som/combat_patrol
	back = /obj/item/storage/backpack/lightpack/som

	suit_contents = list(
		/obj/item/tool/extinguisher = 1,
		/obj/item/defibrillator = 1,
	)

	head_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = 1,
	)

	webbing_contents = list(
		/obj/item/roller = 1,
		/obj/item/tweezers_advanced = 1,
		/obj/item/storage/pill_bottle/spaceacillin = 1,
		/obj/item/reagent_containers/hypospray/advanced/nanoblood = 1,
		/obj/item/bodybag/cryobag = 1,
		/obj/item/reagent_containers/hypospray/advanced/combat_advanced = 1,
	)


/datum/outfit/quick/som/medic/standard_assaultrifle
	name = "V-31 卫生兵"
	desc = "让你的战友们活着并保持战斗力。装备有V-31突击步枪，集成'微型手雷'导轨发射器，中型护甲和精选的手雷。携带大量医疗物资，班卫生兵对维持作战能力至关重要。导轨发射器发射的手雷需要在飞行途中解除保险，因此在近距离效果不佳，但在中距离提供了重要的战术选择。"

	suit_store = /obj/item/weapon/gun/rifle/som/standard

	backpack_contents = list(
		/obj/item/ammo_magazine/rifle/som = 3,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/ammo_magazine/handful/micro_grenade/smoke_burst = 1,
		/obj/item/ammo_magazine/handful/micro_grenade/dragonbreath = 1,
		/obj/item/ammo_magazine/handful/micro_grenade = 2,
		/obj/item/reagent_containers/hypospray/autoinjector/oxycodone = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/russian_red = 2,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = 1,
	)

	r_pocket_contents = list(
		/obj/item/ammo_magazine/rifle/som = 3,
	)


/datum/outfit/quick/som/medic/mpi
	name = "MPI_KM 卫生兵"
	desc = "让你的战友们活着并保持战斗力。配备MPI_KM突击步枪、中型护甲和多种手雷。携带大量医疗物资，班卫生兵对维持作战能力至关重要。这款老式武器在最初的火星叛乱期间随处可见，MPI良好的制止力、可靠性以及浓厚的怀旧情怀意味着，尽管年代久远，它仍能在一些火星之子成员中看到使用。"

	suit_store = /obj/item/weapon/gun/rifle/mpi_km/black/magharness

	backpack_contents = list(
		/obj/item/ammo_magazine/rifle/mpi_km/black = 4,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/explosive/grenade/som = 3,
		/obj/item/reagent_containers/hypospray/autoinjector/oxycodone = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/russian_red = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = 1,
	)

	r_pocket_contents = list(
		/obj/item/ammo_magazine/rifle/mpi_km/black = 3,
	)


/datum/outfit/quick/som/medic/standard_carbine
	name = "V-34 卫生兵"
	desc = "让你的战友们活着并保持战斗力。装备V-34卡宾枪和中型护甲，拥有强大的火力和机动性，但弹药经济性和射程较差。携带大量医疗物资，班卫生兵对维持部队战斗力至关重要。V-34是一款老式武器的现代化升级版，在最初的火星叛乱期间曾是常见装备。非常可靠，小巧轻便的枪身却拥有出色的停止作用。作为VX-32的廉价替代品而投入使用。"

	suit_store = /obj/item/weapon/gun/rifle/som_carbine/black/standard

	backpack_contents = list(
		/obj/item/ammo_magazine/rifle/mpi_km/carbine/black = 4,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/explosive/grenade/som = 3,
		/obj/item/reagent_containers/hypospray/autoinjector/oxycodone = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/russian_red = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = 1,
	)

	r_pocket_contents = list(
		/obj/item/ammo_magazine/rifle/mpi_km/carbine/black = 3,
	)


/datum/outfit/quick/som/medic/standard_smg
	name = "V-21 卫生兵"
	desc = "让你的战友们活着并保持战斗力。配备V-21冲锋枪，具有可变射速，正确使用时能提供极高的火力输出，中等护甲和精选的手雷。携带大量医疗物资，班卫生兵对维持部队作战能力至关重要。"

	suit_store = /obj/item/weapon/gun/smg/som/support

	backpack_contents = list(
		/obj/item/ammo_magazine/smg/som = 6,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/explosive/grenade/som = 3,
		/obj/item/reagent_containers/hypospray/autoinjector/oxycodone = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/russian_red = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = 1,
	)

	r_pocket_contents = list(
		/obj/item/ammo_magazine/smg/som = 3,
	)


/datum/outfit/quick/som/medic/standard_shotgun
	name = "V-51 卫生兵"
	desc = "让你的战友们活着并保持战斗力。配备V-51半自动霰弹枪、中型护甲和多种手雷选择。携带大量医疗物资，班卫生兵对维持作战能力至关重要。"

	r_pocket = /obj/item/storage/pouch/shotgun/som
	suit_store = /obj/item/weapon/gun/shotgun/som/support

	backpack_contents = list(
		/obj/item/ammo_magazine/handful/flechette = 7,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/explosive/grenade/som = 2,
		/obj/item/reagent_containers/hypospray/autoinjector/oxycodone = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/russian_red = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = 1,
	)

	r_pocket_contents = list(
		/obj/item/ammo_magazine/handful/flechette = 4,
	)


//Base SOM veteran outfit
/datum/outfit/quick/som/veteran
	name = "火星之子小队老兵"
	jobtype = "SOM Squad Veteran"

	ears = /obj/item/radio/headset/mainship/som
	w_uniform = /obj/item/clothing/under/som/veteran/webbing
	shoes = /obj/item/clothing/shoes/marine/som/knife
	wear_suit = /obj/item/clothing/suit/modular/som/heavy/shield
	gloves = /obj/item/clothing/gloves/marine/som/veteran
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/modular/som/veteran
	glasses = /obj/item/clothing/glasses/meson
	r_pocket = /obj/item/storage/pouch/firstaid/som/combat_patrol
	l_pocket = /obj/item/storage/pouch/grenade/som/combat_patrol
	back = /obj/item/storage/backpack/satchel/som

	suit_contents = list(
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/isotonic = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
	)

	head_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/russian_red = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = 1,
	)


/datum/outfit/quick/som/veteran/standard_assaultrifle
	name = "V-31 老兵步兵"
	desc = "全副武装的火星之子精英。配备V-31突击步枪，集成'微型手雷'导轨发射器，重型护甲，多种手雷以及穿甲弹药。对抗重装甲目标表现出色，同时充足的手雷储备提供了更强的战术灵活性。"

	back = /obj/item/storage/backpack/lightpack/som
	suit_store = /obj/item/weapon/gun/rifle/som/veteran
	belt = /obj/item/storage/belt/marine/som/som_rifle_ap

	backpack_contents = list(
		/obj/item/explosive/plastique = 1,
		/obj/item/ammo_magazine/pistol/som = 2,
		/obj/item/weapon/gun/pistol/som/standard = 1,
		/obj/item/ammo_magazine/rifle/som/ap = 2,
		/obj/item/explosive/grenade/som = 2,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/ammo_magazine/handful/micro_grenade/smoke_burst = 1,
	)

	webbing_contents = list(
		/obj/item/ammo_magazine/handful/micro_grenade = 1,
		/obj/item/ammo_magazine/handful/micro_grenade/dragonbreath = 2,
		/obj/item/ammo_magazine/handful/micro_grenade/cluster = 2,
	)


/datum/outfit/quick/som/veteran/standard_smg
	name = "V-21 老兵步兵"
	desc = "近距离高伤害、高速度。配备V-21冲锋枪，具有可变射速，正确使用时能实现极高的射速，重型护甲，多种手雷和穿甲弹药。提供出色的近中程火力，尤其对抗重甲目标，且机动性出人意料。"

	suit_store = /obj/item/weapon/gun/smg/som/veteran
	belt = /obj/item/storage/belt/marine/som/som_smg_ap

	backpack_contents = list(
		/obj/item/explosive/plastique = 1,
		/obj/item/ammo_magazine/pistol/som = 2,
		/obj/item/weapon/gun/pistol/som/standard = 1,
		/obj/item/ammo_magazine/smg/som/ap = 3,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 2,
		/obj/item/explosive/grenade/incendiary/som = 1,
		/obj/item/explosive/grenade/flashbang/stun = 1,
		/obj/item/storage/box/MRE/som = 1,
	)


/datum/outfit/quick/som/veteran/breacher
	name = "冲锋老兵破门手"
	desc = "重型装甲破门配置。配备一把便于单手持用的沃尔凯特充能枪，重型装甲升级了洛里卡装甲强化件，一面登舰盾牌和精选手榴弹。提供顶级防护和致命的近距离火力。"

	head = /obj/item/clothing/head/modular/som/lorica
	glasses = /obj/item/clothing/glasses/welding
	wear_suit = /obj/item/clothing/suit/modular/som/heavy/lorica
	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/charger/somvet
	belt = /obj/item/storage/belt/marine/som/volkite
	r_hand = /obj/item/weapon/shield/riot/marine/som

	backpack_contents = list(
		/obj/item/tool/weldingtool/largetank = 1,
		/obj/item/explosive/plastique = 3,
		/obj/item/cell/lasgun/volkite = 3,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 2,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/explosive/grenade/incendiary/som = 1,
		/obj/item/tool/extinguisher/mini = 1,
	)


/datum/outfit/quick/som/veteran/charger
	name = "冲锋老兵步兵"
	desc = "装备精良、装甲厚重的火星之子精英。配备带运动传感器和陀螺稳定器的伏尔克充能枪，便于单手使用，身着重型护甲，并携带多种手雷。伏尔克武器极其危险，尤其对护甲薄弱或密集的敌人。充能枪是火星之子主要的近/中程武器，机动性良好，可（较困难地）单手使用。"

	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/charger/scout
	belt = /obj/item/storage/belt/marine/som/volkite

	backpack_contents = list(
		/obj/item/ammo_magazine/pistol/som = 2,
		/obj/item/weapon/gun/pistol/som/standard = 1,
		/obj/item/explosive/plastique = 1,
		/obj/item/cell/lasgun/volkite = 2,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 2,
		/obj/item/explosive/grenade/incendiary/som = 1,
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/storage/box/MRE/som = 1,
	)

/datum/outfit/quick/som/veteran/caliver
	name = "卡利弗老兵步兵"
	desc = "装备精良、护甲厚重的火星之子精英。配备火山式卡利弗枪、重型护甲和多种手雷。火山武器极其危险，尤其对护甲薄弱或密集的敌人。卡利弗枪在所有射程都能提供致命火力。谨慎接近。"

	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/caliver/standard
	belt = /obj/item/storage/belt/marine/som/volkite

	backpack_contents = list(
		/obj/item/ammo_magazine/pistol/som = 2,
		/obj/item/weapon/gun/pistol/som/standard = 1,
		/obj/item/explosive/plastique = 1,
		/obj/item/cell/lasgun/volkite = 2,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 2,
		/obj/item/explosive/grenade/incendiary/som = 1,
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/storage/box/MRE/som = 1,
	)

/datum/outfit/quick/som/veteran/caliver_pack
	name = "卡利弗老兵步枪手"
	desc = "全副武装的火星之子精英。配备带运动传感器的伏尔克卡利弗枪、重型护甲、大量手雷以及一个背部自充能电源。伏尔克武器极其危险，尤其对护甲薄弱或密集的敌人。卡利弗枪在所有射程都提供致命火力，电源包允许持续射击，但长时间使用后，充能可能跟不上武器需求。"
	quantity = 2

	belt = /obj/item/storage/belt/grenade/som
	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/caliver/tacsensor
	l_pocket = /obj/item/storage/pouch/pistol/som
	back = /obj/item/cell/lasgun/volkite/powerpack

	belt_contents = list(
		/obj/item/explosive/grenade/smokebomb/som = 2,
		/obj/item/explosive/grenade/smokebomb/satrapine = 2,
		/obj/item/explosive/grenade/flashbang/stun = 2,
		/obj/item/explosive/grenade/som = 2,
		/obj/item/explosive/grenade/incendiary/som = 1,
	)

	webbing_contents = list(
		/obj/item/ammo_magazine/pistol/som = 3,
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/storage/box/MRE/som = 1,
	)

	l_pocket_contents = list(
		/obj/item/weapon/gun/pistol/som/standard = 1,
	)


/datum/outfit/quick/som/veteran/mpi
	name = "MPI_KM 老兵步兵"
	desc = "全副武装的火星之子精英，怀有怀旧情怀。配备MPI_KM突击步枪，带有下挂式榴弹发射器和大量手雷。这款旧式武器在最初的火星叛乱期间随处可见，MPI良好的制止力、可靠性以及浓厚的怀旧情结，意味着尽管年代久远，它仍被一些火星之子成员使用。"

	suit_store = /obj/item/weapon/gun/rifle/mpi_km/grenadier
	belt = /obj/item/storage/belt/marine/som/mpi_plum

	backpack_contents = list(
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/ammo_magazine/pistol/som = 2,
		/obj/item/weapon/gun/pistol/som/standard = 1,
		/obj/item/ammo_magazine/rifle/mpi_km/extended = 1,
		/obj/item/tool/extinguisher = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 4,
		/obj/item/explosive/grenade/incendiary/som = 1,
	)

/datum/outfit/quick/som/veteran/carbine
	name = "V-34 老兵步兵"
	desc = "装备精良、装甲厚重的火星之子精英，怀有怀旧情怀。配备一把祖传的V-34卡宾枪和大量手雷。这把老式武器在最初的火星叛乱期间被广泛使用，这一把被保存下来并代代相传。V-34在很大程度上已被VX-32超越，然而凭借其大口径弹药和良好的射速，它不容小觑。"

	suit_store = /obj/item/weapon/gun/rifle/som_carbine/mag_harness
	belt = /obj/item/storage/belt/marine/som/carbine

	backpack_contents = list(
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/ammo_magazine/pistol/som = 2,
		/obj/item/weapon/gun/pistol/som/standard = 1,
		/obj/item/ammo_magazine/rifle/mpi_km/carbine = 1,
		/obj/item/tool/extinguisher = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 4,
		/obj/item/explosive/grenade/incendiary/som = 1,
	)

/datum/outfit/quick/som/veteran/culverin
	name = "卡尔弗林资深机枪手"
	desc = "重装重型火力支援单位。装备有福尔基特长管炮和自充电背包动力单元，以及一把霰弹枪副武器。长管炮是火星之子已知部署的最强大人携武器。能够长时间倾泻惊人的火力压制。尽管背载式动力包具备自充电功能，但仍无法满足该武器巨大的能量需求，因此持续长时间使用会大幅降低武器效能。"
	quantity = 2

	belt = /obj/item/weapon/gun/shotgun/double/sawn
	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/culverin/magharness
	back = /obj/item/cell/lasgun/volkite/powerpack

	webbing_contents = list(
		/obj/item/ammo_magazine/handful/buckshot = 3,
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/storage/box/MRE/som = 1,
	)


/datum/outfit/quick/som/veteran/rocket_man
	name = "V-71火箭老兵"
	desc = "战争罪行从未如此简单。配备V-71火箭筒，拥有燃烧弹与辐射弹头，以及一把使用放射性弹药的V-21冲锋枪，重型护甲搭载'米特里达梯'环境防护系统，并携带辐射手雷。旨在激发敌方恐惧，以致命的燃烧与辐射效果使其丧失战斗力，提供卓越的反步兵支援。"
	quantity = 2

	head = /obj/item/clothing/head/modular/som/bio
	wear_suit = /obj/item/clothing/suit/modular/som/heavy/mithridatius
	suit_store = /obj/item/weapon/gun/smg/som/support
	belt = /obj/item/storage/belt/marine/som
	back = /obj/item/storage/holster/backholster/rpg/som/war_crimes
	l_pocket = /obj/item/storage/pouch/grenade/som

	belt_contents = list(
		/obj/item/ammo_magazine/smg/som = 2,
		/obj/item/ammo_magazine/smg/som/rad = 4,
	)

	webbing_contents = list(
		/obj/item/ammo_magazine/packet/p10x20mm = 1,
		/obj/item/ammo_magazine/smg/som/incendiary = 1,
		/obj/item/binoculars = 1,
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/storage/box/MRE/som = 1,
	)

	l_pocket_contents = list(
		/obj/item/explosive/grenade/smokebomb/satrapine = 3,
		/obj/item/explosive/grenade/rad = 3,
	)

/datum/outfit/quick/som/veteran/blinker
	name = "闪击突击老兵"
	desc = "近战突击型。配备闪烁驱动器和能量剑，轻装甲和备用V-11点射手枪。闪烁驱动器允许使用者进行短距离传送，但有一定风险，正确使用时能让他们轻松拉近距离消灭敌人。"
	quantity = 2

	wear_suit = /obj/item/clothing/suit/modular/som/light/shield
	belt = /obj/item/storage/holster/belt/pistol/m4a3/som
	suit_store = /obj/item/weapon/energy/sword/som
	back = /obj/item/blink_drive

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 3,
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/storage/box/MRE/som = 1,
	)

	belt_contents = list(
		/obj/item/weapon/gun/pistol/som/burst = 1,
		/obj/item/ammo_magazine/pistol/som/extended = 6,
	)


//Base SOM leader outfit
/datum/outfit/quick/som/squad_leader
	name = "火星之子班长"
	jobtype = "SOM Squad Leader"

	ears = /obj/item/radio/headset/mainship/som
	w_uniform = /obj/item/clothing/under/som/leader/webbing
	shoes = /obj/item/clothing/shoes/marine/som/knife
	wear_suit = /obj/item/clothing/suit/modular/som/heavy/leader/valk
	gloves = /obj/item/clothing/gloves/marine/som/veteran
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/modular/som/leader
	glasses = /obj/item/clothing/glasses/hud/health
	r_pocket = /obj/item/storage/pouch/firstaid/som/combat_patrol_leader
	l_pocket = /obj/item/storage/pouch/grenade/som/combat_patrol
	back = /obj/item/storage/backpack/satchel/som

	suit_contents = list(
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/isotonic = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
	)

	head_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/russian_red = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = 1,
	)


/datum/outfit/quick/som/squad_leader/standard_assaultrifle
	name = "V-31 班长"
	desc = "战术支援型。配备V-31突击步枪，集成'微型手雷'导轨发射器，装备'瓦尔基里'自动医疗模块的戈耳贡重型护甲，携带多种手雷及穿甲弹药。对重甲目标表现出色，同时充足的手雷储备提供了更强的战术灵活性。"

	back = /obj/item/storage/backpack/lightpack/som
	suit_store = /obj/item/weapon/gun/rifle/som/veteran
	belt = /obj/item/storage/belt/marine/som/som_rifle_ap

	backpack_contents = list(
		/obj/item/explosive/plastique = 3,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta = 1,
		/obj/item/ammo_magazine/rifle/som/ap = 2,
		/obj/item/ammo_magazine/handful/micro_grenade = 1,
		/obj/item/ammo_magazine/handful/micro_grenade/dragonbreath = 2,
		/obj/item/ammo_magazine/handful/micro_grenade/cluster = 2,
		/obj/item/ammo_magazine/handful/micro_grenade/smoke_burst = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 2,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/cell/lasgun/volkite/small = 1,
		/obj/item/binoculars/fire_support/campaign/som = 1,
	)

/datum/outfit/quick/som/squad_leader/standard_smg
	name = "V-21 班长"
	desc = "近距离高伤害、高速度。配备V-21冲锋枪，具有可变射速，在正确使用时能实现极高的射速；配备带有'瓦尔基里'自动医疗模块的戈耳工重型护甲、多种手雷和穿甲弹药。提供出色的近中程火力，尤其对抗重甲目标，且机动性出人意料地高。"

	suit_store = /obj/item/weapon/gun/smg/som/veteran
	belt = /obj/item/storage/belt/marine/som/som_smg_ap

	backpack_contents = list(
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta = 1,
		/obj/item/cell/lasgun/volkite/small = 1,
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/explosive/plastique = 2,
		/obj/item/ammo_magazine/smg/som/ap = 1,
		/obj/item/ammo_magazine/smg/som/incendiary = 2,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 3,
		/obj/item/explosive/grenade/flashbang/stun = 1,
		/obj/item/binoculars/fire_support/campaign/som = 1,
	)


/datum/outfit/quick/som/squad_leader/charger
	name = "冲锋队班长"
	desc = "适合偏爱近身作战的指挥官。配备带运动传感器和陀螺稳定器的伏尔凯特充能枪以优化单手持握，搭载瓦尔基里自动医疗模块的戈耳贡重型护甲，以及多种手榴弹。提供卓越的近中程火力，具备一流的生存能力。极度危险。"

	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/charger/scout
	belt = /obj/item/storage/belt/marine/som/volkite

	backpack_contents = list(
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta = 1,
		/obj/item/cell/lasgun/volkite/small = 1,
		/obj/item/tool/extinguisher = 1,
		/obj/item/explosive/plastique = 1,
		/obj/item/cell/lasgun/volkite = 2,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 2,
		/obj/item/binoculars/fire_support/campaign/som = 1,
		/obj/item/explosive/grenade/flashbang/stun = 1,
		/obj/item/storage/box/MRE/som = 1,
	)


/datum/outfit/quick/som/squad_leader/caliver
	name = "卡利弗班长"
	desc = "以优势火力取胜。配备沃尔凯特卡利弗步枪和运动传感器，装备'瓦尔基里'自动医疗模块的戈尔贡重型护甲，以及多种手雷。能在所有距离上造成出色伤害，并具备一流的生存能力。极其危险。"

	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/caliver/tacsensor
	belt = /obj/item/storage/belt/marine/som/volkite

	backpack_contents = list(
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta = 1,
		/obj/item/cell/lasgun/volkite/small = 1,
		/obj/item/tool/extinguisher = 1,
		/obj/item/explosive/plastique = 1,
		/obj/item/cell/lasgun/volkite = 2,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 2,
		/obj/item/binoculars/fire_support/campaign/som = 1,
		/obj/item/explosive/grenade/flashbang/stun = 1,
		/obj/item/storage/box/MRE/som = 1,
	)


/datum/outfit/quick/som/squad_leader/mpi
	name = "MPI_KM 班长"
	desc = "为怀旧的领导者准备。配备一把带下挂榴弹发射器的MPI_KM突击步枪、带有'瓦尔基里'自动医疗模块的戈耳贡重型护甲以及大量手雷。MPI是一款在最初的火星叛乱期间常见的旧式武器，其良好的制止力、可靠性以及浓厚的怀旧情怀意味着，尽管年代久远，它仍能在一些火星之子成员中看到使用。"

	suit_store = /obj/item/weapon/gun/rifle/mpi_km/grenadier
	belt = /obj/item/storage/belt/marine/som/mpi_plum

	backpack_contents = list(
		/obj/item/storage/box/MRE/som = 1,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta = 1,
		/obj/item/cell/lasgun/volkite/small = 2,
		/obj/item/ammo_magazine/rifle/mpi_km/extended = 1,
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/explosive/plastique = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/som = 4,
		/obj/item/binoculars/fire_support/campaign/som = 1,
	)
