/datum/loadout_item/helmet
	item_slot = ITEM_SLOT_HEAD
	ui_icon = "helmet"

/datum/loadout_item/helmet/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat, SLOT_IN_HEAD)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_HEAD)

/datum/loadout_item/helmet/empty
	name = "no helmet"
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


/datum/loadout_item/helmet/standard
	name = "L Helmet"
	desc = "标准TDF作战头盔。佩戴于头部以获得最佳效果。"
	req_desc = "Requires a light armor suit."
	item_typepath = /obj/item/clothing/head/modular/tdf
	jobs_supported = list(SQUAD_MARINE)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
	item_whitelist = list(
		/obj/item/clothing/suit/modular/tdf/light/shield = ITEM_SLOT_OCLOTHING,
		/obj/item/clothing/suit/modular/tdf/light/shield_overclocked = ITEM_SLOT_OCLOTHING,
	)

/datum/loadout_item/helmet/medium
	name = "M Helmet"
	desc = "标准TDF作战头盔。佩戴于头部以获得最佳效果。"
	req_desc = "Requires a medium armor suit."
	item_typepath = /obj/item/clothing/head/modular/tdf/medium
	jobs_supported = list(SQUAD_MARINE)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION
	item_whitelist = list(
		/obj/item/clothing/suit/modular/tdf/shield = ITEM_SLOT_OCLOTHING,
		/obj/item/clothing/suit/modular/tdf/shield_overclocked = ITEM_SLOT_OCLOTHING,
	)

/datum/loadout_item/helmet/heavy
	name = "H Helmet"
	desc = "一顶沉重的TDF战斗头盔。戴在头上效果最佳。"
	req_desc = "Requires a heavy armor suit."
	item_typepath = /obj/item/clothing/head/modular/tdf/heavy
	jobs_supported = list(SQUAD_MARINE)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
	item_whitelist = list(
		/obj/item/clothing/suit/modular/tdf/heavy/shield = ITEM_SLOT_OCLOTHING,
		/obj/item/clothing/suit/modular/tdf/heavy/shield_overclocked = ITEM_SLOT_OCLOTHING,
	)

/datum/loadout_item/helmet/leader
	name = "Leader Helmet"
	desc = "保护升级大脑的升级头盔。"
	item_typepath = /obj/item/clothing/head/modular/tdf/leader
	jobs_supported = list(SQUAD_LEADER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/helmet/fcdr
	name = "FCDR Helmet"
	desc = "保护升级大脑的升级头盔。"
	item_typepath = /obj/item/clothing/head/modular/tdf/leader/fcdr
	jobs_supported = list(FIELD_COMMANDER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/helmet/surt
	name = "Surt helmet"
	desc = "标准战斗头盔，配备苏尔特防火模块。"
	req_desc = "Requires a suit with a Surt module."
	item_typepath = /obj/item/clothing/head/modular/tdf/pyro
	jobs_supported = list(SQUAD_MARINE)
	item_whitelist = list(/obj/item/clothing/suit/modular/tdf/heavy/surt = ITEM_SLOT_OCLOTHING)

/datum/loadout_item/helmet/smartgunner
	name = "SG Helmet"
	desc = "标准SG战斗头盔。佩戴于头部以获得最佳效果。"
	item_typepath = /obj/item/clothing/head/modular/tdf/sg
	jobs_supported = list(SQUAD_SMARTGUNNER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION

/datum/loadout_item/helmet/tyr
	name = "H Tyr Helmet"
	desc = "标准战斗头盔，配备泰尔增强装甲模块。"
	req_desc = "Requires a suit with a Tyr module."
	ui_icon = "tyr"
	item_typepath = /obj/item/clothing/head/modular/tdf/heavy/tyr
	jobs_supported = list(SQUAD_MARINE)
	item_whitelist = list(
		/obj/item/clothing/suit/modular/tdf/heavy/tyr_two = ITEM_SLOT_OCLOTHING,
		/obj/item/clothing/suit/modular/tdf/heavy/tyr_two/corpsman = ITEM_SLOT_OCLOTHING,
		/obj/item/clothing/suit/modular/tdf/heavy/tyr_two/engineer = ITEM_SLOT_OCLOTHING,
	)

/datum/loadout_item/helmet/tyr/smartgunner
	item_typepath = /obj/item/clothing/head/modular/tdf/sg/tyr
	jobs_supported = list(SQUAD_SMARTGUNNER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/helmet/tyr/corpsman
	jobs_supported = list(SQUAD_CORPSMAN)
	loadout_item_flags = NONE

/datum/loadout_item/helmet/tyr/corpsman/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/neuraline, SLOT_IN_HEAD)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/neuraline, SLOT_IN_HEAD)

/datum/loadout_item/helmet/tyr/engineer
	jobs_supported = list(SQUAD_ENGINEER)
	loadout_item_flags = NONE

/datum/loadout_item/helmet/tyr/engineer/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_HEAD)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_HEAD)

/datum/loadout_item/helmet/tyr/universal
	jobs_supported = list(SQUAD_MARINE, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER)
	loadout_item_flags = NONE

/datum/loadout_item/helmet/white_dress
	name = "Dress Cap"
	desc = "你的礼服白帽。骄傲是你的盾牌，因为这东西不是。"
	item_typepath = /obj/item/clothing/head/white_dress
	jobs_supported = list(SQUAD_MARINE, SQUAD_CORPSMAN, SQUAD_ENGINEER, SQUAD_SMARTGUNNER, SQUAD_LEADER, FIELD_COMMANDER, STAFF_OFFICER, CAPTAIN)

/datum/loadout_item/helmet/mimir
	name = "Mimir helmet"
	desc = "标准作战头盔，配备米米尔环境防护模块。"
	req_desc = "Requires a suit with a Mimir module."
	item_typepath = /obj/item/clothing/head/modular/tdf/medic
	jobs_supported = list(SQUAD_CORPSMAN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/helmet/mimir/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/neuraline, SLOT_IN_HEAD)
	wearer.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/neuraline, SLOT_IN_HEAD)

/datum/loadout_item/helmet/engineer
	name = "Engi Helmet"
	desc = "标准战斗头盔，配备焊接模块。"
	item_typepath = /obj/item/clothing/head/modular/tdf/engi/welding
	jobs_supported = list(SQUAD_ENGINEER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/helmet/engineer/post_equip(mob/living/carbon/human/wearer, datum/outfit/quick/loadout, datum/outfit_holder/holder)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_HEAD)
	wearer.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_HEAD)

/datum/loadout_item/helmet/field_commander_beret
	name = "FC beret"
	desc = "一顶印有战地指挥官徽章的贝雷帽。它能让所有注视它的人心生忠诚与勇气。"
	item_typepath = /obj/item/clothing/head/tgmcberet/fc
	jobs_supported = list(FIELD_COMMANDER)

/datum/loadout_item/helmet/staff_officer_cap
	name = "Officer cap"
	desc = "通常由地球政府殖民地海军陆战队军官佩戴的帽子。虽然其战斗功能有限，但有些人更愿意佩戴它，而不是标准配发的头盔。"
	item_typepath = /obj/item/clothing/head/tgmccap/ro
	jobs_supported = list(STAFF_OFFICER)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE

/datum/loadout_item/helmet/captain_beret
	name = "Captain Beret"
	desc = "舰长佩戴的贝雷帽。你本以为它会更加华丽。"
	item_typepath = /obj/item/clothing/head/tgmcberet/tan
	jobs_supported = list(CAPTAIN)
	loadout_item_flags = LOADOUT_ITEM_ROUNDSTART_OPTION|LOADOUT_ITEM_DEFAULT_CHOICE
