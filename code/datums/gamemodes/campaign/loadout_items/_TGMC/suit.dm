/datum/loadout_item/suit_slot
	item_slot = ITEM_SLOT_OCLOTHING

/datum/loadout_item/suit_slot/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/stack/medical/heal_pack/gauze, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/stack/medical/heal_pack/ointment, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/isotonic, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/quickclot, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/dylovene, SLOT_IN_SUIT)

/datum/loadout_item/suit_slot/empty
	name = "no suit"
	desc = ""
	ui_icon = "empty"
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
	jobs_supported = list(
		SQUAD_MARINE,
		SQUAD_CORPSMAN,
		SQUAD_ENGINEER,
		SQUAD_SMARTGUNNER,
		SQUAD_LEADER,
		FIELD_COMMANDER,
		STAFF_OFFICER,
		CAPTAIN,
		SOM_SQUAD_MARINE,
		SOM_SQUAD_CORPSMAN,
		SOM_SQUAD_ENGINEER,
		SOM_SQUAD_VETERAN,
		SOM_SQUAD_LEADER,
		SOM_FIELD_COMMANDER,
		SOM_STAFF_OFFICER,
		SOM_COMMANDER,
	)


/datum/loadout_item/suit_slot/light_shield
	name = "L shield armor"
	desc = "轻型装甲，配备斯瓦林护盾模块。提供出色的机动性，但防护能力较低。"
	ui_icon = "light_armour_shield"
	req_desc = "Requires a light helmet."
	item_typepath = /obj/item/clothing/suit/modular/tdf/light/shield
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER)

/datum/loadout_item/suit_slot/light_shield/overclocked
	desc = "轻型护甲，配备斯瓦林护盾模块。提供出色的机动性，但防护较低。护盾模块已超频以提升性能。"
	item_typepath = /obj/item/clothing/suit/modular/tdf/light/shield_overclocked
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER)
	loadout_item_flags = null

/datum/loadout_item/suit_slot/light_shield/overclocked/medic
	item_typepath = /obj/item/clothing/suit/modular/tdf/light/shield_overclocked/medic
	jobs_supported = list(SQUAD_CORPSMAN)

/datum/loadout_item/suit_slot/light_shield/overclocked/medic/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/tool/extinguisher, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/defibrillator, SLOT_IN_SUIT)

/datum/loadout_item/suit_slot/light_shield/overclocked/engineer
	item_typepath = /obj/item/clothing/suit/modular/tdf/light/shield_overclocked/engineer
	jobs_supported = list(SQUAD_ENGINEER)

/datum/loadout_item/suit_slot/light_shield/overclocked/engineer/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/circuitboard/apc, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/cell/high, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/plasteel/large_stack, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_SUIT)

/datum/loadout_item/suit_slot/medium_shield
	name = "M shield armor"
	desc = "中等护甲，配备斯瓦林护盾模块。提供均衡的机动性与防护。"
	ui_icon = "medium_armour_shield"
	req_desc = "Requires a medium helmet."
	item_typepath = /obj/item/clothing/suit/modular/tdf/shield
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER)

/datum/loadout_item/suit_slot/medium_shield/overclocked
	desc = "中等护甲，配备斯瓦林护盾模块。提供均衡的机动性与防护。"
	item_typepath = /obj/item/clothing/suit/modular/tdf/shield_overclocked
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER)
	loadout_item_flags = null

/datum/loadout_item/suit_slot/medium_shield/overclocked/medic
	item_typepath = /obj/item/clothing/suit/modular/tdf/shield_overclocked/medic
	jobs_supported = list(SQUAD_CORPSMAN)

/datum/loadout_item/suit_slot/medium_shield/overclocked/medic/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/tool/extinguisher, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/defibrillator, SLOT_IN_SUIT)

/datum/loadout_item/suit_slot/medium_shield/overclocked/engineer
	item_typepath = /obj/item/clothing/suit/modular/tdf/shield_overclocked/engineer
	jobs_supported = list(SQUAD_ENGINEER)

/datum/loadout_item/suit_slot/medium_shield/overclocked/engineer/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/circuitboard/apc, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/cell/high, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/plasteel/large_stack, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_SUIT)

/datum/loadout_item/suit_slot/heavy_shield
	name = "H shield armor"
	desc = "重型装甲，配备斯瓦林护盾模块。提供卓越防护但机动性较低。护盾模块已超频以提升性能。"
	ui_icon = "heavy_armour_shield"
	req_desc = "Requires a heavy or smartgunner helmet."
	item_typepath = /obj/item/clothing/suit/modular/tdf/heavy/shield
	item_whitelist = list(
		/obj/item/clothing/head/modular/tdf/heavy = ITEM_SLOT_HEAD,
		/obj/item/clothing/head/modular/tdf/sg = ITEM_SLOT_HEAD,
	)
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/suit_slot/heavy_shield/overclocked
	desc = "重型装甲，配备斯瓦林护盾模块。提供卓越防护但机动性较低。护盾模块已超频以提升性能。"
	item_typepath = /obj/item/clothing/suit/modular/tdf/heavy/shield_overclocked
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER)
	loadout_item_flags = null

/datum/loadout_item/suit_slot/heavy_shield/leader
	item_whitelist = list(
	)
	item_typepath = /obj/item/clothing/suit/modular/tdf/heavy/leader/shield
	jobs_supported = list(SQUAD_LEADER, FIELD_COMMANDER)

/datum/loadout_item/suit_slot/heavy_shield/overclocked/leader
	item_whitelist = list(
	)
	item_typepath = /obj/item/clothing/suit/modular/tdf/heavy/leader/shield_overclocked
	jobs_supported = list(SQUAD_LEADER, FIELD_COMMANDER)

/datum/loadout_item/suit_slot/heavy_surt
	name = "H Surt armor"
	desc = "重型护甲，配备苏尔特防火模块。提供卓越的防护和近乎完全的火焰免疫，但机动性较差。"
	ui_icon = "heavy_armour"
	req_desc = "Requires a FL-84 flamethrower."
	item_typepath = /obj/item/clothing/suit/modular/tdf/heavy/surt
	jobs_supported = list(SQUAD_MARINE)
	item_whitelist = list(/obj/item/weapon/gun/flamer/big_flamer/marinestandard/wide = ITEM_SLOT_SUITSTORE)

/datum/loadout_item/suit_slot/heavy_tyr
	name = "H Tyr armor"
	desc = "重型装甲，配备泰尔额外装甲模块。提供惊人的防护能力，代价是机动性进一步降低。"
	req_desc = "Requires a ALF-51B or SMG-25."
	ui_icon = "tyr"
	item_typepath = /obj/item/clothing/suit/modular/tdf/heavy/tyr_two
	jobs_supported = list(SQUAD_MARINE)
	item_whitelist = list(
		/obj/item/weapon/gun/rifle/alf_machinecarbine/assault = ITEM_SLOT_SUITSTORE,
		/obj/item/weapon/gun/smg/m25/magharness = ITEM_SLOT_SUITSTORE,
		/obj/item/storage/holster/blade/machete/full_alt = ITEM_SLOT_SUITSTORE,
	)

/datum/loadout_item/suit_slot/heavy_tyr/smartgunner
	jobs_supported = list(SQUAD_SMARTGUNNER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
	item_whitelist = null
	req_desc = null

/datum/loadout_item/suit_slot/heavy_tyr/medic
	item_typepath = /obj/item/clothing/suit/modular/tdf/heavy/tyr_two/corpsman
	jobs_supported = list(SQUAD_CORPSMAN)
	loadout_item_flags = null
	item_whitelist = null
	req_desc = null

/datum/loadout_item/suit_slot/heavy_tyr/medic/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/tool/extinguisher, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/defibrillator, SLOT_IN_SUIT)

/datum/loadout_item/suit_slot/heavy_tyr/engineer
	item_typepath = /obj/item/clothing/suit/modular/tdf/heavy/tyr_two/engineer
	jobs_supported = list(SQUAD_ENGINEER)
	loadout_item_flags = null
	item_whitelist = null
	req_desc = null

/datum/loadout_item/suit_slot/heavy_tyr/engineer/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/circuitboard/apc, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/cell/high, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/plasteel/large_stack, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_SUIT)

/datum/loadout_item/suit_slot/heavy_tyr/universal
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER)
	loadout_item_flags = NONE
	item_whitelist = null
	req_desc = null

/datum/loadout_item/suit_slot/medium_valk
	name = "M Valkyrie armor"
	desc = "中等护甲，配备瓦尔基里自动医疗模块。提供可观的防护、强大的自动医疗辅助，但机动性一般。"
	ui_icon = "medium_armour"
	item_typepath = /obj/item/clothing/suit/modular/tdf/valk
	jobs_supported = list(SQUAD_LEADER, FIELD_COMMANDER)

/datum/loadout_item/suit_slot/heavy_valk
	name = "H Valkyrie armor"
	desc = "重型装甲，配备瓦尔基里自动医疗模块。提供卓越的防护和强大的自动医疗辅助，但机动性降低。"
	ui_icon = "heavy_armour"
	item_typepath = /obj/item/clothing/suit/modular/tdf/heavy/leader
	jobs_supported = list(SQUAD_LEADER, FIELD_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/suit_slot/white_dress
	name = "Dress jacket"
	desc = "与您的白色礼服完美搭配的白色夹克。警告：与几乎所有武器不兼容。"
	item_typepath = /obj/item/clothing/suit/white_dress_jacket
	jobs_supported = list(SQUAD_MARINE, SQUAD_CORPSMAN, SQUAD_ENGINEER, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER, STAFF_OFFICER, CAPTAIN)

//corpsman
/datum/loadout_item/suit_slot/medium_mimir
	name = "M Mimir armor"
	desc = "中等护甲，配备米米尔环境防护模块。提供可观的防护能力，对化学攻击完全免疫，并增强辐射防护。机动性一般。"
	ui_icon = "medium_armour"
	item_typepath = /obj/item/clothing/suit/modular/tdf/mimir
	jobs_supported = list(SQUAD_CORPSMAN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/suit_slot/medium_mimir/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/tool/extinguisher, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/defibrillator, SLOT_IN_SUIT)

//engineer
/datum/loadout_item/suit_slot/medium_engineer
	name = "M armor"
	desc = "中等护甲，带有工程储物空间。提供均衡的防护和机动性。"
	ui_icon = "medium_armour"
	item_typepath = /obj/item/clothing/suit/modular/tdf/engineer
	jobs_supported = list(SQUAD_ENGINEER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/suit_slot/medium_engineer/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/circuitboard/apc, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/cell/high, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/plasteel/large_stack, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_SUIT)
	wearer.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_SUIT)
