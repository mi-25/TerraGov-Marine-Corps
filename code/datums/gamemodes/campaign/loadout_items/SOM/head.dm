/datum/loadout_item/helmet/som_standard
	name = "Infantry helmet"
	desc = "火星之子作战部队配备的标准作战头盔。采用先进聚合物制成，在提供高效防护的同时不影响视野。"
	item_typepath = /obj/item/clothing/head/modular/som
	jobs_supported = list(SOM_SQUAD_MARINE)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/helmet/som_standard/medic
	jobs_supported = list(SOM_SQUAD_CORPSMAN)

/datum/loadout_item/helmet/som_standard/medic/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/russian_red, SLOT_IN_HEAD)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/russian_red, SLOT_IN_HEAD)

/datum/loadout_item/helmet/som_veteran
	name = "Veteran helmet"
	desc = "火星之子战斗专家配备的标准作战头盔。采用尖端材料，为更宝贵的大脑提供更强防护。"
	item_typepath = /obj/item/clothing/head/modular/som/veteran
	jobs_supported = list(SOM_SQUAD_VETERAN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/helmet/gorgon
	name = "Gorgon helmet"
	desc = "专为戈尔贡式突击护甲设计，提供卓越防护。通常见于火星之子指挥官或其最精锐的战斗单位。"
	item_typepath = /obj/item/clothing/head/modular/som/leader
	jobs_supported = list(SOM_SQUAD_LEADER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/helmet/gorgon/fc
	name = "Gorgon helmet"
	desc = "专为戈耳工式突击装甲设计，提供卓越防护。此件带有金色标记，表明其属于高级战地军官。"
	item_typepath = /obj/item/clothing/head/modular/som/leader/officer
	jobs_supported = list(SOM_FIELD_COMMANDER)

/datum/loadout_item/helmet/som_surt
	name = "'Hades' incendiary insulation system helmet"
	desc = "标准战斗头盔，带有哈迪斯防火模块。"
	req_desc = "Requires a suit with a Hades module."
	item_typepath = /obj/item/clothing/head/modular/som/hades
	jobs_supported = list(SOM_SQUAD_MARINE)
	item_whitelist = list(/obj/item/clothing/suit/modular/som/heavy/pyro = ITEM_SLOT_OCLOTHING)

/datum/loadout_item/helmet/som_tyr
	name = "'Lorica' armor reinforcement system helmet"
	desc = "A bulky helmet paired with the 'Lorica' armor module, designed for outstanding protection at the cost of significant weight and reduced flexibility. \
	Substantial additional armor improves protection against all damage."
	req_desc = "Requires a suit with a Lorica module."
	ui_icon = "lorica"
	item_typepath = /obj/item/clothing/head/modular/som/lorica
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_VETERAN)
	item_whitelist = list(
		/obj/item/clothing/suit/modular/som/heavy/lorica = ITEM_SLOT_OCLOTHING,
		/obj/item/clothing/suit/modular/som/heavy/lorica/medic = ITEM_SLOT_OCLOTHING,
		/obj/item/clothing/suit/modular/som/heavy/lorica/engineer = ITEM_SLOT_OCLOTHING,
	)

/datum/loadout_item/helmet/som_tyr/medic
	jobs_supported = list(SOM_SQUAD_CORPSMAN)
	loadout_item_flags = NONE

/datum/loadout_item/helmet/som_tyr/medic/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/russian_red, SLOT_IN_HEAD)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/russian_red, SLOT_IN_HEAD)

/datum/loadout_item/helmet/som_tyr/engineer
	jobs_supported = list(SOM_SQUAD_ENGINEER)
	loadout_item_flags = NONE

/datum/loadout_item/helmet/som_tyr/engineer/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_HEAD)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_HEAD)

/datum/loadout_item/helmet/som_tyr/universal
	jobs_supported = list(SOM_SQUAD_MARINE, SOM_SQUAD_CORPSMAN, SOM_SQUAD_ENGINEER, SOM_SQUAD_VETERAN, SOM_SQUAD_LEADER, SOM_FIELD_COMMANDER)
	loadout_item_flags = NONE

/datum/loadout_item/helmet/som_mimir
	name = "'Mithridatius' hostile environment protection helmet"
	desc = "标准战斗头盔，集成米特里达提乌斯'米斯'敌对环境防护模块。"
	req_desc = "Requires a suit with a Mithridatius environmental protection module."
	item_typepath = /obj/item/clothing/head/modular/som/bio
	jobs_supported = list(SOM_SQUAD_VETERAN)
	item_whitelist = list(/obj/item/clothing/suit/modular/som/heavy/mithridatius = ITEM_SLOT_OCLOTHING)

/datum/loadout_item/helmet/som_engineer
	name = "Engineer helmet"
	desc = "专为战斗工程兵设计的特种头盔，主要特点是集成了焊接面罩。"
	item_typepath = /obj/item/clothing/head/modular/som/engineer
	jobs_supported = list(SOM_SQUAD_ENGINEER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/helmet/som_engineer/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_HEAD)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_HEAD)
