/*!
 * Any loadout that is intended for the new player loadout vendor
 */

///When making new loadouts, remember to also add the typepath to the list under init_beginner_loadouts() or else it won't show up in the vendor

/datum/outfit/quick/beginner
	name = "新手基础装备"
	desc = "新手的基础装备。你不应该看到这个。"
	jobtype = "Squad Marine"

	w_uniform = /obj/item/clothing/under/marine
	shoes = /obj/item/clothing/shoes/marine/full
	wear_suit = /obj/item/clothing/suit/modular/xenonauten
	gloves = /obj/item/clothing/gloves/marine/black
	mask = /obj/item/clothing/mask/bandanna
	head = /obj/item/clothing/head/modular/m10x
	r_pocket = /obj/item/storage/pouch/medkit/firstaid
	l_pocket = /obj/item/storage/holster/flarepouch/full
	back = /obj/item/storage/backpack/marine/satchel
	belt = /obj/item/storage/belt/marine
	ears = /obj/item/radio/headset/mainship/marine

	head_contents = list(
		/obj/item/reagent_containers/food/snacks/protein_pack = 2,
	)


/datum/outfit/quick/beginner/marine/rifleman
	name = "步枪兵"
	desc = "A typical rifleman for the marines. \
	Wields the AR-12, a versatile all-rounder assault rifle with a powerful underbarrel grenade launcher attached. \
	Also carries the strong P-23 sidearm and a variety of flares, medical equipment, and more for every situation."

	wear_suit = /obj/item/clothing/suit/modular/xenonauten/hodgrenades
	head = /obj/item/clothing/head/modular/m10x/hod
	w_uniform = /obj/item/clothing/under/marine/holster
	suit_store = /obj/item/weapon/gun/rifle/standard_assaultrifle/medic
	l_hand = /obj/item/paper/tutorial/beginner_rifleman

	backpack_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
		/obj/item/ammo_magazine/rifle/standard_assaultrifle = 3,
	)

	suit_contents = list(
		/obj/item/explosive/grenade = 6,
	)

	belt_contents = list(
		/obj/item/ammo_magazine/rifle/standard_assaultrifle = 6,
	)

	webbing_contents = list(
		/obj/item/ammo_magazine/pistol/standard_heavypistol = 3,
		/obj/item/weapon/gun/pistol/standard_heavypistol/beginner = 1,
	)

/datum/outfit/quick/beginner/marine/machinegunner
	name = "机枪手"
	desc = "The king of suppressive fire. Uses the MG-60, a fully automatic 200 round machine gun with a bipod attached. \
	Excels at denying large areas to the enemy and eliminating those who refuse to leave."

	wear_suit = /obj/item/clothing/suit/modular/xenonauten/heavy/tyr_onegeneral
	head = /obj/item/clothing/head/modular/m10x/tyr
	w_uniform = /obj/item/clothing/under/marine/black_vest
	back = /obj/item/storage/backpack/marine/standard
	belt = /obj/item/storage/belt/sparepouch
	suit_store = /obj/item/weapon/gun/rifle/standard_gpmg/beginner
	mask = /obj/item/clothing/mask/rebreather
	l_hand = /obj/item/paper/tutorial/beginner_machinegunner

	backpack_contents = list(
		/obj/item/ammo_magazine/standard_gpmg = 8,
	)

	suit_contents = list(
		/obj/item/weapon/gun/pistol/plasma_pistol = 2,
	)

	belt_contents = list(
		/obj/item/ammo_magazine/standard_gpmg = 3,
	)

	webbing_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
		/obj/item/storage/box/m94 = 2,
	)


/datum/outfit/quick/beginner/marine/marksman
	name = "神射手"
	desc = "Quality over quantity. Equipped with the DMR-37, an accurate long-range designated marksman rifle with a scope attached. \
	While subpar in close quarters, the precision of the DMR is unmatched, exceeding at taking out threats from afar."

	wear_suit = /obj/item/clothing/suit/modular/xenonauten/lightmedical
	head = /obj/item/clothing/head/modular/style/boonie
	w_uniform = /obj/item/clothing/under/marine/holster
	belt = /obj/item/belt_harness/marine
	l_pocket = /obj/item/storage/pouch/magazine/large
	r_pocket = /obj/item/storage/pouch/magazine/large
	suit_store = /obj/item/weapon/gun/rifle/standard_dmr/beginner
	mask = /obj/item/clothing/mask/breath
	l_hand = /obj/item/paper/tutorial/beginner_marksman

	backpack_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
		/obj/item/ammo_magazine/rifle/standard_dmr = 3,
	)

	suit_contents = list(
		/obj/item/storage/pill_bottle/bicaridine = 1,
		/obj/item/storage/pill_bottle/kelotane = 1,
		/obj/item/storage/pill_bottle/tricordrazine = 1,
		/obj/item/storage/pill_bottle/tramadol = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/dylovene = 1,
	)

	webbing_contents = list(
		/obj/item/ammo_magazine/pistol/vp70 = 3,
		/obj/item/weapon/gun/pistol/vp70/beginner = 1,
	)

	l_pocket_contents = list(
		/obj/item/ammo_magazine/rifle/standard_dmr = 3,
	)

	r_pocket_contents = list(
		/obj/item/ammo_magazine/rifle/standard_dmr = 3,
	)


/datum/outfit/quick/beginner/marine/shotgunner
	name = "霰弹枪手"
	desc = "Up close and personal. Wields the SH-39, a semi-automatic shotgun loaded with slugs. \
	An absolute monster at short to mid range, the shotgun will do heavy damage to any target hit, as well as stunning them briefly, staggering them, and knocking them back."

	w_uniform = /obj/item/clothing/under/marine/holster
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/lightgeneral
	suit_store = /obj/item/weapon/gun/shotgun/combat/standardmarine/beginner
	belt = /obj/item/storage/belt/shotgun
	head = /obj/item/clothing/head/modular/m10x/freyr
	gloves = /obj/item/clothing/gloves/marine/fingerless
	mask = /obj/item/clothing/mask/gas/tactical/coif
	l_hand = /obj/item/paper/tutorial/beginner_shotgunner

	backpack_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
		/obj/item/ammo_magazine/handful/slug = 4,
		/obj/item/reagent_containers/hypospray/autoinjector/inaprovaline = 1,
	)

	suit_contents = list(
		/obj/item/storage/box/m94 = 2,
	)

	belt_contents = list(
		/obj/item/ammo_magazine/handful/slug = 14,
	)

	webbing_contents = list(
		/obj/item/ammo_magazine/pistol/plasma_pistol = 3,
		/obj/item/weapon/gun/pistol/plasma_pistol/beginner = 1,
	)

/datum/outfit/quick/beginner/marine/shocktrooper
	name = "突击兵"
	desc = "The bleeding edge of the corps. \
	Equipped with the experimental battery-fed laser rifle, featuring four different modes that can be freely swapped between, with an underbarrel flamethrower for area denial and clearing mazes."

	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_rifle/medic
	glasses = /obj/item/clothing/glasses/sunglasses/fake/big
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/lightgeneral
	head = /obj/item/clothing/head/modular/style/cap
	mask = /obj/item/clothing/mask/gas/modular/skimask
	r_pocket = /obj/item/cell/lasgun/volkite/powerpack/marine
	w_uniform = /obj/item/clothing/under/marine/corpman_vest
	shoes = /obj/item/clothing/shoes/marine
	l_hand = /obj/item/paper/tutorial/beginner_shocktrooper

	backpack_contents = list(
		/obj/item/storage/pill_bottle/dylovene = 1,
		/obj/item/ammo_magazine/flamer_tank/mini = 6,
		/obj/item/reagent_containers/hypospray/autoinjector/inaprovaline = 1,
	)

	suit_contents = list(
		/obj/item/storage/box/m94 = 2,
	)

	belt_contents = list(
		/obj/item/cell/lasgun/lasrifle = 6,
	)

	webbing_contents = list(
		/obj/item/storage/pill_bottle/bicaridine = 1,
		/obj/item/storage/pill_bottle/kelotane = 1,
		/obj/item/storage/pill_bottle/tricordrazine = 1,
		/obj/item/storage/pill_bottle/tramadol = 1,
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
	)

	shoe_contents = list(
		/obj/item/storage/box/MRE = 1,
	)


/datum/outfit/quick/beginner/marine/hazmat
	name = "防化服"
	desc = "Designed for danger. \
	Wields the AR-11, a powerful yet innacurate assault rifle with high magazine size and an equipped tactical sensor that detects enemies through smoke and walls. \
	Wears Mimir combat armor, rendering the user immune to the dangerous toxic gas possessed by many xenomorphs."

	head = /obj/item/clothing/head/modular/m10x/mimir
	suit_store = /obj/item/weapon/gun/rifle/tx11/freelancertwo
	back = /obj/item/storage/backpack/marine/standard
	w_uniform = /obj/item/clothing/under/marine/black_vest
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/mimir
	mask = /obj/item/clothing/mask/rebreather/scarf
	belt = /obj/item/belt_harness/marine
	l_hand = /obj/item/paper/tutorial/beginner_hazmat

	backpack_contents = list(
		/obj/item/ammo_magazine/rifle/tx11 = 8,
	)

	suit_contents = list(
		/obj/item/ammo_magazine/rifle/tx11 = 2,
	)

	webbing_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
		/obj/item/storage/box/m94 = 2,
	)


/datum/outfit/quick/beginner/marine/cqc
	name = "近身格斗"
	desc = "Swift and lethal. \
	Equipped with the AR-18, a lightweight carbine with a rapid-fire burst mode. Designed for maximum mobility, soldiers are able to rush in, assault the enemy, and retreat before they can respond."

	suit_store = /obj/item/weapon/gun/rifle/standard_carbine/beginner
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/lightgeneral
	w_uniform = /obj/item/clothing/under/marine/black_vest
	head = /obj/item/clothing/head/modular/style/beret
	glasses = /obj/item/clothing/glasses/mgoggles
	l_hand = /obj/item/paper/tutorial/beginner_cqc

	backpack_contents = list(
		/obj/item/ammo_magazine/rifle/standard_carbine = 5,
	)

	suit_contents = list(
		/obj/item/ammo_magazine/rifle/standard_carbine = 2,
	)

	belt_contents = list(
		/obj/item/ammo_magazine/rifle/standard_carbine = 6,
	)

	webbing_contents = list(
		/obj/item/storage/box/MRE = 1,
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
		/obj/item/storage/box/m94 = 2,
	)


/datum/outfit/quick/beginner/marine/chad //Ya gotta be if you pick this loadout
	name = "掷弹兵"
	desc = "Explosive area denial. \
	Uses the GL-70, a six shot semi-automatic grenade launcher, loaded with HEDP high explosive grenades. \
	Boasts unmatched power, though heavy caution is advised to avoid harming friendlies."

	wear_suit = /obj/item/clothing/suit/modular/xenonauten/heavy/grenadier
	suit_store = /obj/item/weapon/gun/grenade_launcher/multinade_launcher/beginner
	l_pocket = /obj/item/storage/pouch/grenade
	r_pocket = /obj/item/storage/pouch/grenade
	belt = /obj/item/storage/belt/grenade
	mask = /obj/item/clothing/mask/gas
	w_uniform = /obj/item/clothing/under/marine/corpman_vest
	head = /obj/item/clothing/head/modular/m10x/hod
	shoes = /obj/item/clothing/shoes/marine
	l_hand = /obj/item/paper/tutorial/beginner_chad

	backpack_contents = list(
		/obj/item/explosive/grenade = 7,
		/obj/item/reagent_containers/hypospray/autoinjector/inaprovaline = 1,
	)

	suit_contents = list(
		/obj/item/explosive/grenade = 6,
	)

	belt_contents = list(
		/obj/item/explosive/grenade = 9,
	)

	webbing_contents = list(
		/obj/item/storage/pill_bottle/bicaridine = 1,
		/obj/item/storage/pill_bottle/kelotane = 1,
		/obj/item/storage/pill_bottle/tricordrazine = 1,
		/obj/item/storage/pill_bottle/tramadol = 1,
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
	)

	shoe_contents = list(
		/obj/item/weapon/gun/shotgun/double/derringer = 1,
	)

	l_pocket_contents = list(
		/obj/item/explosive/grenade = 6,
	)

	r_pocket_contents = list(
		/obj/item/explosive/grenade = 6,
	)


/datum/outfit/quick/beginner/engineer
	jobtype = "Squad Engineer"

	w_uniform = /obj/item/clothing/under/marine/brown_vest
	shoes = /obj/item/clothing/shoes/marine
	gloves = /obj/item/clothing/gloves/marine/insulated
	l_pocket = /obj/item/storage/pouch/tools

	suit_contents = list(
		/obj/item/stack/sheet/plasteel/medium_stack = 1,
		/obj/item/stack/sheet/metal/large_stack = 1,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/chem_grenade/razorburn_small = 1,
		/obj/item/circuitboard/apc = 1,
		/obj/item/tool/handheld_charger/hicapcell = 1,
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
	)

	shoe_contents = list(
		/obj/item/storage/box/MRE = 1,
	)

	l_pocket_contents = list(
		/obj/item/tool/screwdriver = 1,
		/obj/item/tool/wirecutters = 1,
		/obj/item/tool/wrench = 1,
		/obj/item/tool/crowbar = 1,
		/obj/item/tool/weldingtool/hugetank = 1,
	)


/datum/outfit/quick/beginner/engineer/builder
	name = "工程兵标准装备"
	desc = "天生就是干这个的。装备了海量金属，有你在场，路障短缺绝无可能。"

	suit_store = /obj/item/weapon/gun/rifle/standard_lmg/beginner
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/heavy/mimirengi
	mask = /obj/item/clothing/mask/gas/tactical
	head = /obj/item/clothing/head/modular/m10x/mimir
	back = /obj/item/storage/backpack/marine/radiopack
	belt = /obj/item/belt_harness/marine
	glasses = /obj/item/clothing/glasses/welding/superior
	l_hand = /obj/item/paper/tutorial/builder

	backpack_contents = list(
		/obj/item/stack/sandbags_empty/full = 1,
		/obj/item/tool/shovel/etool = 1,
		/obj/item/storage/box/m94 = 1,
		/obj/item/ammo_magazine/standard_lmg = 5,
		/obj/item/explosive/plastique = 1,
	)

	suit_contents = list(
		/obj/item/stack/sheet/metal/large_stack = 3,
		/obj/item/stack/sheet/metal/small_stack = 2,
		/obj/item/stack/sheet/plasteel/large_stack = 1,
	)


/datum/outfit/quick/beginner/engineer/burnitall
	name = "喷火器"
	desc = "献给那些真正热爱看世界燃烧的人。配备激光卡宾枪和火焰喷射器，确保你的敌人无一幸免。"

	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_carbine/beginner
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/engineer
	mask = /obj/item/clothing/mask/gas/tactical/coif
	head = /obj/item/clothing/head/modular/m10x/superiorwelding
	back = /obj/item/storage/holster/backholster/flamer
	glasses = /obj/item/clothing/glasses/meson
	l_hand = /obj/item/paper/tutorial/flamer

	backpack_contents = list(
		/obj/item/weapon/gun/flamer/big_flamer/marinestandard/engineer/beginner = 1,
		/obj/item/storage/box/explosive_mines/large = 1,
		/obj/item/tool/extinguisher = 1,
		/obj/item/explosive/plastique = 2,
		/obj/item/tool/shovel/etool = 1,
	)

	suit_contents = list(
		/obj/item/stack/sheet/metal/medium_stack = 1,
		/obj/item/circuitboard/apc = 1,
		/obj/item/tool/multitool = 1,
	)

	belt_contents = list(
		/obj/item/cell/lasgun/lasrifle = 6,
	)


/datum/outfit/quick/beginner/engineer/pcenjoyer
	name = "等离子体切割器"
	desc = "为露天爱好者准备。配备等离子切割器，你将能够切割所有胆敢出现在你附近的各种墙壁和障碍物。"

	suit_store = /obj/item/tool/pickaxe/plasmacutter
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/engineer
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/modular/m10x/superiorwelding
	back = /obj/item/storage/backpack/marine/engineerpack
	belt = /obj/item/belt_harness/marine
	glasses = /obj/item/clothing/glasses/meson
	l_hand = /obj/item/paper/tutorial/plasmacutter

	backpack_contents = list(
		/obj/item/weapon/gun/smg/standard_machinepistol/compact = 1,
		/obj/item/ammo_magazine/smg/standard_machinepistol = 6,
	)

	suit_contents = list(
		/obj/item/stack/sheet/metal/large_stack = 2,
		/obj/item/stack/sheet/metal/small_stack = 1,
	)

	head_contents = list(
		/obj/item/explosive/plastique = 1,
	)

/datum/outfit/quick/beginner/engineer/point_sentry
	name = "哨戒炮先锋"
	desc = "完美的机动护卫。配备点防御哨戒炮和箭弹霰弹枪，你是保护医疗人员或封锁侧翼的理想工程兵。"

	suit_store = /obj/item/weapon/gun/shotgun/pump/t35/beginner/flechette
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/mirage_engineer
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/modular/m10x/superiorwelding
	back = /obj/item/storage/backpack/marine/engineerpack
	belt = /obj/item/storage/belt/shotgun/flechette
	glasses = /obj/item/clothing/glasses/meson
	l_hand = /obj/item/paper/tutorial/point_sentry

	backpack_contents = list(
		/obj/item/storage/box/m94 = 3,
		/obj/item/ammo_magazine/minisentry = 2,
		/obj/item/weapon/gun/sentry/mini = 1,
	)

	suit_contents = list(
		/obj/item/stack/sheet/metal/large_stack = 1,
		/obj/item/stack/sheet/plasteel/small_stack = 1,
		/obj/item/cell/high = 1,
		/obj/item/explosive/plastique = 1,
	)

/datum/outfit/quick/beginner/engineer/mortar
	name = "迫击炮火力支援"
	desc = "为那些在远处欢呼的人准备。配备迫击炮包、测距仪和AR11步枪，你是提供火力支援和巩固阵地的完美人选。"
	suit_store = /obj/item/weapon/gun/rifle/tx11/freelancerone
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/engineer
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/modular/m10x/superiorwelding
	back = /obj/item/storage/holster/backholster/mortar/full
	glasses = /obj/item/clothing/glasses/meson
	l_hand = /obj/item/paper/tutorial/mortar

	backpack_contents = list(
		/obj/item/mortal_shell/he = 5,
		/obj/item/mortal_shell/incendiary = 4,
		/obj/item/mortal_shell/plasmaloss = 4,
	)

	suit_contents = list(
		/obj/item/stack/sheet/metal/large_stack = 2,
		/obj/item/stack/sheet/plasteel/medium_stack = 1,
		/obj/item/circuitboard/apc = 1,
		/obj/item/cell/high = 1,
	)

	belt_contents = list(
		/obj/item/ammo_magazine/rifle/tx11 = 6,
	)

	webbing_contents = list(
		/obj/item/explosive/grenade/chem_grenade/razorburn_small = 1,
		/obj/item/compass = 1,
		/obj/item/binoculars/tactical/range = 1,
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
	)

/datum/outfit/quick/beginner/corpsman
	jobtype = "Squad Corpsman"

	shoes = /obj/item/clothing/shoes/marine
	w_uniform = /obj/item/clothing/under/marine/corpsman/corpman_vest
	glasses = /obj/item/clothing/glasses/hud/health
	r_hand = /obj/item/medevac_beacon

	shoe_contents = list(
		/obj/item/storage/box/MRE = 1,
	)


/datum/outfit/quick/beginner/corpsman/lifesaver
	name = "标准救生员"
	desc = "Miracle in progress. \
	Wields the bolt action Leicaster Repeater, and is equipped with a large variety of medicine for keeping the entire corps topped up and in the fight."

	suit_store = /obj/item/weapon/gun/shotgun/pump/lever/repeater/beginner
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/mimirinjector
	gloves = /obj/item/clothing/gloves/defibrillator
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/modular/m10x/mimir
	r_pocket = /obj/item/storage/pouch/medkit/medic
	l_pocket = /obj/item/storage/pouch/shotgun
	back = /obj/item/storage/backpack/marine/corpsman
	belt = /obj/item/storage/belt/lifesaver/beginner
	l_hand = /obj/item/paper/tutorial/lifesaver

	backpack_contents = list(
		/obj/item/storage/box/m94 = 3,
		/obj/item/ammo_magazine/packet/p4570 = 7,
		/obj/item/tool/extinguisher/mini = 2,
	)

	suit_contents = list(
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = 3,
		/obj/item/reagent_containers/hypospray/autoinjector/dexalinplus = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = 3,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = 3,
	)

	webbing_contents = list(
		/obj/item/roller = 1,
		/obj/item/bodybag/cryobag = 1,
		/obj/item/reagent_containers/hypospray/advanced/oxycodone = 1,
		/obj/item/reagent_containers/hypospray/advanced/nanoblood = 1,
		/obj/item/roller/medevac = 1,
		/obj/item/tweezers = 1,
	)

	l_pocket_contents = list(
		/obj/item/ammo_magazine/handful/repeater = 4,
	)

/datum/outfit/quick/beginner/corpsman/hypobelt
	name = "标准型次腰带"
	desc = "Putting the combat in combat medic. \
	Wields the pump action SH-35 shotgun, and is equipped with a belt full of hyposprays for rapidly treating patients in bad condition."

	suit_store = /obj/item/weapon/gun/shotgun/pump/t35/beginner
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/light/lightmedical
	gloves = /obj/item/clothing/gloves/healthanalyzer
	mask = /obj/item/clothing/mask/gas/modular/coofmask
	head = /obj/item/clothing/head/modular/m10x/antenna
	r_pocket = /obj/item/storage/pouch/medkit/medic
	l_pocket = /obj/item/storage/pouch/shotgun
	back = /obj/item/storage/backpack/marine/corpsman
	belt = /obj/item/storage/belt/hypospraybelt/beginner
	l_hand = /obj/item/paper/tutorial/hypobelt

	backpack_contents = list(
		/obj/item/ammo_magazine/handful/slug = 6,
		/obj/item/storage/box/m94 = 3,
		/obj/item/tool/extinguisher/mini = 1,
		/obj/item/defibrillator = 1,
		/obj/item/reagent_containers/food/snacks/protein_pack = 1,
	)

	suit_contents = list(
		/obj/item/roller = 1,
		/obj/item/bodybag/cryobag = 1,
		/obj/item/reagent_containers/hypospray/advanced/oxycodone = 1,
		/obj/item/roller/medevac = 1,
		/obj/item/tweezers = 1,
	)

	webbing_contents = list(
		/obj/item/stack/medical/splint = 6,
	)

	l_pocket_contents = list(
		/obj/item/ammo_magazine/handful/slug = 4,
	)


/datum/outfit/quick/beginner/smartgunner
	jobtype = "Squad Smartgunner"

	w_uniform = /obj/item/clothing/under/marine/black_vest
	shoes = /obj/item/clothing/shoes/marine
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/lightgeneral
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/modular/m10x/antenna
	belt = /obj/item/belt_harness/marine
	glasses = /obj/item/clothing/glasses/night/m56_goggles

	shoe_contents = list(
		/obj/item/storage/box/MRE = 1,
	)


/datum/outfit/quick/beginner/smartgunner/sg29
	name = "标准智能机枪"
	desc = "Tactical support fire. \
	Uses the SG-29, a specialist light machine gun that will shoot through your allies, \
	equipped with a tactical sensor to detect enemies through smoke, walls, and darkness."

	suit_store = /obj/item/weapon/gun/rifle/standard_smartmachinegun/pmc
	l_hand = /obj/item/paper/tutorial/smartmachinegunner

	backpack_contents = list(
		/obj/item/ammo_magazine/standard_smartmachinegun = 3,
		/obj/item/weapon/gun/pistol/plasma_pistol = 1,
		/obj/item/explosive/grenade/smokebomb/cloak = 1,
		/obj/item/reagent_containers/hypospray/autoinjector/inaprovaline = 1,
	)

	suit_contents = list(
		/obj/item/tool/extinguisher = 1,
		/obj/item/ammo_magazine/standard_smartmachinegun = 1,
	)

	webbing_contents = list(
		/obj/item/storage/box/m94 = 3,
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
	)


/datum/outfit/quick/beginner/smartgunner/sg85
	name = "标准智能转管机枪"
	desc = "Lead wall! Wields the SG-85, a specialist minigun that holds one thousand rounds and can shoot through your allies, \
	equipped with a tactical sensor to detect enemies through smoke, walls, and darkness."

	suit_store = /obj/item/weapon/gun/minigun/smart_minigun/motion_detector
	back = /obj/item/ammo_magazine/minigun_powerpack/smartgun
	l_hand = /obj/item/paper/tutorial/smartminigunner

	suit_contents = list(
		/obj/item/ammo_magazine/packet/smart_minigun = 2,
	)

	webbing_contents = list(
		/obj/item/storage/box/m94 = 3,
		/obj/item/stack/medical/heal_pack/gauze = 1,
		/obj/item/stack/medical/heal_pack/ointment = 1,
	)
