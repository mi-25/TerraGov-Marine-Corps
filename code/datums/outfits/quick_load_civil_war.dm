/*!
 * Any loadout that is intended for civil war vendors.
 */

///When making new loadouts, remember to also add the typepath to the list under init_civil_war_loadouts() or else it won't show up in the vendor

/datum/outfit/quick/civil_war
	name = "内战基地"
	desc = "红衫军与蓝衫军配置基础。"
	require_job = FALSE

	shoes = /obj/item/clothing/shoes/marinechief
	head = /obj/item/clothing/head/redcoat
	belt = /obj/item/storage/belt/shotgun/martini/full
	back = /obj/item/weapon/gun/shotgun/double/martini
	r_pocket = /obj/item/storage/pouch/firstaid
	l_pocket = /obj/item/storage/holster/flarepouch/full

	r_pocket_contents = list(
		/obj/item/storage/pill_bottle/tramadol = 1,
		/obj/item/stack/medical/heal_pack/gauze = 2,
		/obj/item/stack/medical/heal_pack/ointment = 2,
		/obj/item/stack/medical/splint = 1,
	)

/datum/outfit/quick/civil_war/bluecoat
	name = "蓝衣兵"
	jobtype = "Bluecoat"
	desc = "冲锋！让那些红衫军见识见识你们的独立精神！"

	w_uniform = /obj/item/clothing/under/marine/striped
	mask = /obj/item/clothing/mask/bandanna/delta

/datum/outfit/quick/civil_war/redcoat
	name = "红衫军"
	jobtype = "Redcoat"
	desc = "天佑女王！让那些叛军见识帝国的力量！"

	w_uniform = /obj/item/clothing/under/redcoat
	mask = /obj/item/clothing/mask/bandanna/alpha
