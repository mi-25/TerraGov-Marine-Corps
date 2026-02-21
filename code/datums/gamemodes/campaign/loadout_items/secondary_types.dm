
/datum/loadout_item/secondary/kit //faction generic secondaries
	jobs_supported = list(
		SQUAD_MARINE,
		SQUAD_CORPSMAN,
		SQUAD_ENGINEER,
		SQUAD_SMARTGUNNER,
		SQUAD_LEADER,
		FIELD_COMMANDER,
		SOM_SQUAD_MARINE,
		SOM_SQUAD_CORPSMAN,
		SOM_SQUAD_ENGINEER,
		SOM_SQUAD_VETERAN,
		SOM_SQUAD_LEADER,
		SOM_FIELD_COMMANDER,
	)

/datum/loadout_item/secondary/kit/primary_ammo
	name = "Extra ammo"
	desc = "主武器的额外弹药。"
	ui_icon = "default"
	jobs_supported = list(
		SQUAD_MARINE,
		SQUAD_ENGINEER,
		SQUAD_SMARTGUNNER,
		SQUAD_LEADER,
		FIELD_COMMANDER,
		SOM_SQUAD_MARINE,
		SOM_SQUAD_ENGINEER,
		SOM_SQUAD_VETERAN,
		SOM_SQUAD_LEADER,
		SOM_FIELD_COMMANDER,
	)

/datum/loadout_item/secondary/kit/primary_ammo/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	var/datum/loadout_item/suit_store/main_gun/primary = holder.equipped_things["[ITEM_SLOT_SUITSTORE]"]
	if(!istype(primary))
		return
	wearer.equip_to_slot_or_del(new primary.ammo_type, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new primary.secondary_ammo_type, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/primary_ammo/default
	jobs_supported = list(SQUAD_CORPSMAN, SOM_SQUAD_CORPSMAN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/secondary/kit/emp_nades
	name = "EMP nades"
	desc = "三枚电磁脉冲手雷，对能量武器和机甲效果极佳。"
	ui_icon = "grenade"
	purchase_cost = 20

/datum/loadout_item/secondary/kit/emp_nades/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/emp, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/emp, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/emp, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/stun_nades
	name = "Stun nades"
	desc = "三枚眩晕手雷，能够使目标踉跄、减速并暂时致盲。"
	ui_icon = "stun_nade"

/datum/loadout_item/secondary/kit/stun_nades/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang/stun, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang/stun, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang/stun, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/antigas_nades
	name = "Antigas nades"
	desc = "三枚防毒手雷，能够彻底清除区域内的毒气。"
	ui_icon = "grenade"
	purchase_cost = 15

/datum/loadout_item/secondary/kit/antigas_nades/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/antigas, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/antigas, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/antigas, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/sandbags
	name = "Sandbags"
	desc = "沙袋，装满沙子。它们能挡住子弹，而不是你的脸。"
	ui_icon = "construction"

/datum/loadout_item/secondary/kit/sandbags/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sandbags/large_stack, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sandbags/large_stack, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/throwing_knives
	name = "Throwing knives"
	desc = "一些飞刀。你朝持枪的人扔过去，然后祈祷好运。"
	ui_icon = "default"

/datum/loadout_item/secondary/kit/throwing_knives/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/stack/throwing_knife, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/stack/throwing_knife, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/stack/throwing_knife, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/stack/throwing_knife, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/stack/throwing_knife, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/stack/throwing_knife, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/plastique
	name = "C4 pack"
	desc = "足以把你炸回过去的C4。或者至少能摧毁一些目标。"
	ui_icon = "default"

/datum/loadout_item/secondary/kit/plastique/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)

/datum/loadout_item/secondary/kit/anti_tank
	name = "Anti-tank"
	desc = "一次性反坦克火箭发射器，以及一箱反坦克地雷。如果你有装甲问题，这很管用。"
	ui_icon = "t72"
	purchase_cost = 30

/datum/loadout_item/secondary/kit/anti_tank/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/weapon/gun/launcher/rocket/oneuse/anti_tank, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/storage/box/explosive_mines/antitank, SLOT_IN_BACKPACK)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_BACKPACK)
