/datum/loadout_item/secondary/gun/marine
	jobs_supported = list(SQUAD_MARINE, SQUAD_CORPSMAN, SQUAD_ENGINEER, SQUAD_LEADER, SQUAD_SMARTGUNNER, FIELD_COMMANDER, STAFF_OFFICER, CAPTAIN)
	item_whitelist = list(
		/obj/item/storage/holster/belt/pistol/standard_pistol = ITEM_SLOT_BELT,
		/obj/item/storage/backpack/marine/satchel = ITEM_SLOT_BACK,
		/obj/item/storage/backpack/marine = ITEM_SLOT_BACK,
		/obj/item/storage/backpack/lightpack = ITEM_SLOT_BACK,
		/obj/item/storage/backpack/marine/engineerpack = ITEM_SLOT_BACK,
		/obj/item/storage/backpack/marine/tech = ITEM_SLOT_BACK,
		/obj/item/storage/backpack/marine/corpsman = ITEM_SLOT_BACK,
	)
	req_desc = "Requires a pistol holster or some kind of back storage."

/datum/loadout_item/secondary/gun/marine/standard_pistol
	name = "P-14"
	desc = "P-14，由泰伦军械库生产。一把可靠的副武器，使用9x19毫米帕拉贝鲁姆自动弹药。射速良好，使用21发9毫米弹匣。"
	ui_icon = "tp14"
	item_typepath = /obj/item/weapon/gun/pistol/standard_pistol/standard
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/secondary/gun/marine/fc_pistol
	name = "P-1911A1-C pistol"
	desc = "The P-1911A1-C is a custom modified pistol with impressive stopping power for its size. \
	Light and easy to use one handed, it suffers from a small magazine size and no auto eject feature. Uses .45 ACP ammunition."
	ui_icon = "m1911c"
	item_typepath = /obj/item/weapon/gun/pistol/m1911/custom
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
	jobs_supported = list(FIELD_COMMANDER)

/datum/loadout_item/secondary/gun/marine/so_pistol
	name = "RT-3 pistol"
	desc = "RT-3 目标手枪，在整个殖民星区随处可见，是TGMC非战斗岗位的标准配枪。使用9毫米无壳弹药。"
	ui_icon = "rt3"
	item_typepath = /obj/item/weapon/gun/pistol/rt3
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
	jobs_supported = list(STAFF_OFFICER)

/datum/loadout_item/secondary/gun/marine/smart_pistol
	name = "SP-13 pistol"
	desc = "The SP-13 is a IFF-capable sidearm used by the TerraGov Marine Corps. Has good damage, penetration and magazine capacity. \
	Expensive to manufacture, this sophisticated pistol is only occassionally used by smartgunners, or some higher ranking officers who have the skills to use it. Uses 9x19mm Parabellum ammunition."
	ui_icon = "sp13"
	item_typepath = /obj/item/weapon/gun/pistol/smart_pistol
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
	jobs_supported = list(CAPTAIN)

/datum/loadout_item/secondary/gun/marine/standard_heavypistol
	name = "P-23"
	desc = "一把标准的P-23手枪，使用.45 ACP口径。弹匣容量较小，但威力更强。带有不可拆卸的激光瞄准器。使用.45弹匣。"
	ui_icon = "tp23"
	item_typepath = /obj/item/weapon/gun/pistol/standard_heavypistol/tactical

/datum/loadout_item/secondary/gun/marine/mod_four
	name = "MK88 Mod 4"
	desc = "An uncommon automatic handgun that fires 9mm armor piercing rounds and is capable of 3-round burst or automatic fire. \
	Light and easy to use one handed, but still a sidearm. Comes in a holster that fits on your waist or armor. Uses 9mm AP ammunition."
	ui_icon = "vp70"
	item_typepath = /obj/item/weapon/gun/pistol/vp70/tactical
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
	jobs_supported = list(SQUAD_LEADER, FIELD_COMMANDER, STAFF_OFFICER, CAPTAIN)

/datum/loadout_item/secondary/gun/marine/standard_revolver
	name = "TP-44"
	desc = "The R-44 standard combat revolver, produced by Terran Armories. A sturdy and hard hitting firearm that loads .44 Magnum rounds. \
	Holds 7 rounds in the cylinder. Due to an error in the cylinder rotation system the fire rate of the gun is much faster than intended, it ended up being billed as a feature of the system."
	ui_icon = "tp44"
	item_typepath = /obj/item/weapon/gun/revolver/standard_revolver
	loadout_item_flags = NONE

/datum/loadout_item/secondary/gun/marine/highpower
	name = "Highpower"
	desc = "一把强大的半自动手枪，使用威力巨大的.50 AE口径子弹。数百年来一直被执法部门和犯罪分子使用，最近通过这款新型号得以重现。"
	ui_icon = "highpower"
	item_typepath = /obj/item/weapon/gun/pistol/highpower/standard
	loadout_item_flags = NONE

/datum/loadout_item/secondary/gun/marine/laser_pistol
	name = "TE-P"
	desc = "A TerraGov standard issue laser pistol abbreviated as TE-P. It has an integrated charge selector for normal, heat and taser settings. \
	Uses standard Terra Experimental (abbreviated as TE) power cells. \
	As with all TE Laser weapons, they use a lightweight alloy combined without the need for bullets any longer decreases their weight and aiming speed quite some vs their ballistic counterparts."
	ui_icon = "default"
	item_typepath = /obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_pistol/tactical
	loadout_item_flags = NONE

/datum/loadout_item/secondary/gun/marine/standard_machinepistol
	name = "MP-19"
	desc = "Equipped with a motion sensor. The MP-19 is the TerraGov Marine Corps standard-issue machine pistol. It's known for it's low recoil and scatter when used one handed. \
	It's usually carried by specialized troops who do not have the space to carry a much larger gun like medics and engineers. It uses 10x20mm caseless rounds."
	ui_icon = "t19"
	item_typepath = /obj/item/weapon/gun/smg/standard_machinepistol/scanner
	purchase_cost = 15
	item_whitelist = list(
		/obj/item/storage/backpack/marine/satchel = ITEM_SLOT_BACK,
		/obj/item/storage/backpack/marine = ITEM_SLOT_BACK,
		/obj/item/storage/backpack/lightpack = ITEM_SLOT_BACK,
	)
	req_desc = "Requires some kind of back storage."

/datum/loadout_item/secondary/gun/marine/standard_smg
	name = "SMG-25"
	desc = "RivArms SMG-25冲锋枪，一款经典设计的更新。一种能够有效单手使用的轻型枪械，是中近距离交战的理想选择。使用10x20mm弹药，配备大容量弹匣。"
	ui_icon = "m25"
	item_typepath = /obj/item/weapon/gun/smg/m25/holstered
	item_whitelist = list(/obj/item/storage/holster/m25 = ITEM_SLOT_BELT)
	req_desc = "Requires an SMG-25 holster and either a MG-27, FL-84 or MG-100."
	jobs_supported = list(SQUAD_MARINE)

/datum/loadout_item/secondary/gun/marine/standard_smg/item_checks(datum/outfit_holder/outfit_holder)
	. = ..()
	if(!.)
		return
	for(var/typepath in list(LOADOUT_ITEM_MG27, LOADOUT_ITEM_TGMC_FLAMER, LOADOUT_ITEM_TGMC_MINIGUN))
		if(outfit_holder.equipped_things["[ITEM_SLOT_SUITSTORE]"].item_typepath == typepath)
			return TRUE
	return FALSE

/datum/loadout_item/secondary/gun/marine/standard_smg/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	. = ..()
	var/datum/loadout_item/suit_store/main_gun/primary = holder.equipped_things["[ITEM_SLOT_SUITSTORE]"]
	var/obj/item/storage/pouch/magazine/mag_pouch = wearer.r_store
	var/ammo_type = /obj/item/ammo_magazine/smg/m25
	if(istype(mag_pouch) && (!istype(primary) || !(primary.ammo_type in mag_pouch.storage_datum.can_hold)))
		wearer.equip_to_slot_or_del(new ammo_type, SLOT_IN_R_POUCH)
		wearer.equip_to_slot_or_del(new ammo_type, SLOT_IN_R_POUCH)
		wearer.equip_to_slot_or_del(new ammo_type, SLOT_IN_R_POUCH)
	mag_pouch = wearer.l_store
	if(wearer.skills.getRating(SKILL_SMGS) >= SKILL_SMGS_TRAINED)
		ammo_type = /obj/item/ammo_magazine/smg/m25/ap
	if(istype(mag_pouch) && (!istype(primary) || !(primary.ammo_type in mag_pouch.storage_datum.can_hold)))
		wearer.equip_to_slot_or_del(new ammo_type, SLOT_IN_L_POUCH)
		wearer.equip_to_slot_or_del(new ammo_type, SLOT_IN_L_POUCH)
		wearer.equip_to_slot_or_del(new ammo_type, SLOT_IN_L_POUCH)

/datum/loadout_item/secondary/gun/marine/db_shotgun
	name = "SH-34 shotgun"
	desc = "一把设计古老但坚固的双管霰弹枪，由地球政府殖民地海军陆战队使用，装填鹿弹。作为需要强大制止力时的强力副武器，并不常见。"
	ui_icon = "tx34"
	item_typepath = /obj/item/weapon/gun/shotgun/double/marine
	item_whitelist = list(/obj/item/storage/holster/belt/ts34 = ITEM_SLOT_BELT)
	req_desc = "Requires a shotgun holster."
	jobs_supported = list(SQUAD_SMARTGUNNER)

/datum/loadout_item/secondary/gun/marine/db_shotgun/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/ammo_magazine/shotgun/buckshot, SLOT_IN_HOLSTER)
	wearer.equip_to_slot_or_del(new item_typepath(wearer), SLOT_IN_HOLSTER)
	default_load(wearer, loadout, holder)

//non-standard
/datum/loadout_item/secondary/machete
	name = "Machete"
	desc = "最新一期《TGMC砍刀》。非常适合清理偏远殖民地的丛林或灌木，或者砍开头颅。常见于侦察兵和追踪者手中，但难以与常规装备一同携带。"
	ui_icon = "machete"
	jobs_supported = list(SQUAD_MARINE, SQUAD_LEADER, SQUAD_SMARTGUNNER)
	item_typepath = /obj/item/weapon/sword/machete
	item_whitelist = list(/obj/item/storage/holster/blade/machete = ITEM_SLOT_BELT)
	req_desc = "Requires a scabbard."

/datum/loadout_item/secondary/machete/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new item_typepath(wearer), SLOT_IN_HOLSTER)
	default_load(wearer, loadout, holder)

/datum/loadout_item/secondary/machete/officer
	name = "Officers sword"
	desc = "这似乎是一把相当古老的刀，保养得很好，很可能是一件家族传家宝。奇怪的是，尽管它可能并非用于战斗，但刀刃锋利，并不钝。"
	ui_icon = "machete"
	jobs_supported = list(FIELD_COMMANDER)
	item_typepath = /obj/item/weapon/sword/officersword
	item_whitelist = list(/obj/item/storage/holster/blade/officer = ITEM_SLOT_BELT)
	req_desc = "Requires a scabbard."

//kits
/datum/loadout_item/secondary/kit/mirage_nades
	name = "Mirage nades"
	desc = "三枚幻影手雷，能在不经意间为粗心的对手制造绝佳的干扰。"
	ui_icon = "grenade"
	jobs_supported = list(SQUAD_MARINE, SQUAD_CORPSMAN, SQUAD_ENGINEER, SQUAD_LEADER, SQUAD_SMARTGUNNER, FIELD_COMMANDER)

/datum/loadout_item/secondary/kit/mirage_nades/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/mirage, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/mirage, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/mirage, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/he_nades
	name = "HE nades"
	desc = "三枚高爆手雷，威力更足。"
	ui_icon = "grenade"
	jobs_supported = list(SQUAD_MARINE, SQUAD_CORPSMAN, SQUAD_ENGINEER, SQUAD_LEADER, SQUAD_SMARTGUNNER, FIELD_COMMANDER)

/datum/loadout_item/secondary/kit/he_nades/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/deploy_shield
	name = "Deployable shield"
	desc = "两个可部署的盾牌。可用作坚固的便携式路障，或在紧急情况下用作盾牌。"
	ui_icon = "riot_shield"
	jobs_supported = list(SQUAD_MARINE, SQUAD_CORPSMAN, SQUAD_ENGINEER, SQUAD_LEADER, SQUAD_SMARTGUNNER, FIELD_COMMANDER)

/datum/loadout_item/secondary/kit/deploy_shield/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/weapon/shield/riot/marine/deployable, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/weapon/shield/riot/marine/deployable, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/binoculars
	name = "Tac binos"
	desc = "战术望远镜，用于侦察位置并在可用时呼叫火力支援。"
	ui_icon = "default"
	purchase_cost = 20
	jobs_supported = list(SQUAD_MARINE, SQUAD_CORPSMAN, SQUAD_ENGINEER, SQUAD_SMARTGUNNER)

/datum/loadout_item/secondary/kit/binoculars/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/binoculars/fire_support/campaign, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/tool/extinguisher/mini, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/tool/crowbar, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/cameras
	name = "Cameras"
	desc = "两个可部署摄像头和一个平视显示平板。用于远程监控，你的指挥军官可能也会觉得它有用。"
	ui_icon = "default"
	jobs_supported = list(SQUAD_LEADER)

/datum/loadout_item/secondary/kit/cameras/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/deployable_camera, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/deployable_camera, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/hud_tablet(wearer, /datum/job/terragov/squad/leader, wearer.assigned_squad), SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/tgmc_engineer
	jobs_supported = list(SQUAD_ENGINEER)

/datum/loadout_item/secondary/kit/tgmc_engineer/sentry
	name = "Sentry gun"
	desc = "一座点防御哨戒炮，附带备用弹药。因为更多的枪总是更好的。"
	ui_icon = "sentry"
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/secondary/kit/tgmc_engineer/sentry/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/weapon/gun/sentry/mini/combat_patrol, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/ammo_magazine/minisentry, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/tgmc_engineer/large_mines
	name = "Claymores"
	desc = "两大箱阔剑地雷。地雷在制造死亡区域或设置陷阱方面极为有效。防守时作用巨大。"
	ui_icon = "claymore"

/datum/loadout_item/secondary/kit/tgmc_engineer/large_mines/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/storage/box/explosive_mines/large, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/storage/box/explosive_mines/large, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/tgmc_engineer/materials
	name = "Metal/plasteel"
	desc = "一整叠金属和塑钢。用于最大规模的建造。"
	ui_icon = "materials"

/datum/loadout_item/secondary/kit/tgmc_engineer/materials/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/plasteel/large_stack, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/tgmc_engineer/detpack
	name = "Detpacks"
	desc = "炸药包，用于爆破。"
	ui_icon = "default"

/datum/loadout_item/secondary/kit/tgmc_engineer/detpack/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/detpack, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/detpack, SLOT_IN_BACKPACK)
	if(istype(wearer.back, /obj/item/storage/backpack/marine/tech))
		wearer.equip_to_slot_or_del(new /obj/item/detpack, SLOT_IN_BACKPACK)
	else
		wearer.equip_to_slot_or_del(new /obj/item/assembly/signaler, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/tgmc_engineer/razorburn
	name = "Razorburn"
	desc = "三罐剃刀燃烧剂，能快速制造大片剃刀铁丝网。'人人都嘲笑剃刀铁丝网，直到他们一边被子弹撕成碎片一边试图穿越它的时候。'——无名氏"
	ui_icon = "default"
	purchase_cost = 15

/datum/loadout_item/secondary/kit/tgmc_engineer/razorburn/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/chem_grenade/razorburn_large, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/chem_grenade/razorburn_small, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/chem_grenade/razorburn_small, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/tgmc_engineer/iguana
	name = "Iguana"
	desc = "A deployable Iguana remote control vehicle. Armed with a IFF enabled light cannon, this speedy vehicle enables the user to harass the enemy from a safe distance, or scout out areas for their team. \
	WARNING: comes with limited ammo and is easily destroyed. Deploy with caution."
	ui_icon = "default"
	purchase_cost = 75

/datum/loadout_item/secondary/kit/tgmc_engineer/iguana/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/deployable_vehicle, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/uav_turret, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/unmanned_vehicle_remote, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/tgmc_engineer/skink
	name = "Skink"
	desc = "A deployable Skink remote control vehicle. While lacking any weaponry, this speedy vehicle is perfect for slipping past enemy forces and gathering information. Comes with a spare and remote. \
	WARNING: exceedingly fragile. Keep away from open flames or explosives."
	ui_icon = "default"
	purchase_cost = 15

/datum/loadout_item/secondary/kit/tgmc_engineer/skink/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/deployable_vehicle/tiny, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/deployable_vehicle/tiny, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/unmanned_vehicle_remote, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/tgmc_corpsman
	jobs_supported = list(SQUAD_CORPSMAN)
	req_desc = "Requires a medical backpack."

/datum/loadout_item/secondary/kit/tgmc_corpsman/advanced
	name = "Advanced meds"
	desc = "一系列先进的医疗注射器，包含神经灵、再生酮和再生长剂，可用于治疗克隆损伤和肢体缺失。"
	ui_icon = "medkit"
	purchase_cost = 30

/datum/loadout_item/secondary/kit/tgmc_corpsman/advanced/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/quickclotplus, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/rezadone, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/neuraline, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/regrow, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/synaptizine, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/antitox_mix, SLOT_IN_BACKPACK)
