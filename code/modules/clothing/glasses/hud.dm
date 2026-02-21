/obj/item/clothing/glasses/hud
	name = "抬头显示器"
	desc = "一个能（几乎）实时提供重要信息的抬头显示器。"
	atom_flags = null //doesn't protect eyes because it's a monocle, duh
	///The hud type(s) to give this type of glasses
	var/hud_type
	///The user wearing the glasses
	var/mob/living/carbon/human/affected_user

/obj/item/clothing/glasses/hud/examine_descriptor(mob/user)
	return "HUD"

/obj/item/clothing/glasses/hud/Destroy()
	if(affected_user)
		deactivate_hud()
	return ..()


/obj/item/clothing/glasses/hud/equipped(mob/user, slot)
	if(!ishuman(user))
		return ..()
	if(slot == SLOT_GLASSES)
		if(active)
			activate_hud(user)
	else if(affected_user)
		deactivate_hud(user)
	return ..()


/obj/item/clothing/glasses/hud/dropped(mob/user)
	if(affected_user)
		deactivate_hud(user)
	return ..()


/obj/item/clothing/glasses/hud/activate(mob/user)
	//Run the activation stuff BEFORE getting to the HUD de/activations
	. = ..()

	if(!ishuman(user))
		return

	var/mob/living/carbon/human/hud_user = user
	if(hud_user.glasses != src)
		return

	if(active)
		activate_hud(hud_user)
	else
		deactivate_hud(hud_user)

///Activates the hud(s) these glasses have
/obj/item/clothing/glasses/hud/proc/activate_hud(mob/living/carbon/human/user)
	affected_user = user
	if(islist(hud_type))
		for(var/hud in hud_type)
			var/datum/atom_hud/hud_datum = GLOB.huds[hud]
			hud_datum.add_hud_to(affected_user)
	else
		var/datum/atom_hud/hud_datum = GLOB.huds[hud_type]
		hud_datum.add_hud_to(affected_user)

///Deactivates the hud(s) these glasses have
/obj/item/clothing/glasses/hud/proc/deactivate_hud(mob/user)
	if(islist(hud_type))
		for(var/hud in hud_type)
			var/datum/atom_hud/hud_datum = GLOB.huds[hud]
			hud_datum.remove_hud_from(affected_user)
	else
		var/datum/atom_hud/hud_datum = GLOB.huds[hud_type]
		hud_datum.remove_hud_from(affected_user)
	affected_user = null


/obj/item/clothing/glasses/hud/health
	name = "\improper 健康伴侣抬头显示器"
	desc = "一种抬头显示器，可扫描视野内的人类并提供其健康状况的准确数据。该投影仪可安装在兼容的眼镜上。"
	icon_state = "healthhud"
	deactive_state = "degoggles_med"
	armor_protection_flags = NONE
	toggleable = TRUE
	hud_type = DATA_HUD_MEDICAL_ADVANCED
	actions_types = list(/datum/action/item_action/toggle)
	species_exception = list(/datum/species/robot)
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/glasses.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/glasses_bravada.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/glasses_charlit.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/glasses_alpharii.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/glasses_deltad.dmi')
	prescription = TRUE

/obj/item/clothing/glasses/hud/medgoggles
	name = "\improper HealthMate 弹道护目镜"
	desc = "标准配发的TGMC护目镜。这副护目镜已内置健康伴侣HUD投影仪。"
	icon_state = "medgoggles"
	worn_icon_state = "medgoggles"
	deactive_state = "degoggles_medgoggles"
	toggleable = TRUE
	hud_type = DATA_HUD_MEDICAL_ADVANCED
	actions_types = list(/datum/action/item_action/toggle)
	species_exception = list(/datum/species/robot)
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/glasses.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/glasses_bravada.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/glasses_charlit.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/glasses_alpharii.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/glasses_deltad.dmi')
	soft_armor = list(MELEE = 40, BULLET = 40, LASER = 0, ENERGY = 15, BOMB = 35, BIO = 10, FIRE = 30, ACID = 30)
	equip_slot_flags = ITEM_SLOT_EYES
	goggles = TRUE

/obj/item/clothing/glasses/hud/medgoggles/prescription
	name = "\improper HealthMate 处方弹道护目镜"
	desc = "标准配发的TGMC处方护目镜。这副护目镜已内置健康伴侣HUD投影仪。"
	prescription = TRUE

/obj/item/clothing/glasses/hud/medpatch
	name = "\improper 医疗贴片HUD"
	desc = "一种抬头显示器，可扫描视野内的人类并提供其健康状况的准确数据。专为行动不便和/或追求个性的卫生兵设计。"
	icon_state = "medpatchhud"
	deactive_state = "degoggles_medpatch"
	species_exception = list(/datum/species/robot)
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/glasses.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/glasses_bravada.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/glasses_charlit.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/glasses_alpharii.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/glasses_deltad.dmi')
	toggleable = TRUE
	hud_type = DATA_HUD_MEDICAL_ADVANCED
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/glasses/hud/medglasses
	name = "\improper HealthMate 标准处方眼镜"
	desc = "标准配发的TGMC制式处方眼镜。这副眼镜已内置健康伴侣HUD投影仪。"
	icon_state = "medglasses"
	worn_icon_state = "medglasses"
	deactive_state = "degoggles_medglasses"
	species_exception = list(/datum/species/robot)
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/glasses.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/glasses_bravada.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/glasses_charlit.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/glasses_alpharii.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/glasses_deltad.dmi')
	prescription = TRUE
	toggleable = TRUE
	hud_type = DATA_HUD_MEDICAL_ADVANCED
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/glasses/hud/medsunglasses
	name = "\improper 健康伴侣太阳镜"
	desc = "一副设计师太阳镜。这副眼镜配备了内置的HealthMate HUD投影仪。"
	icon_state = "medsunglasses"
	worn_icon_state = "medsunglasses"
	deactive_state = "degoggles_medsunglasses"
	species_exception = list(/datum/species/robot)
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/glasses.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/glasses_bravada.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/glasses_charlit.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/glasses_alpharii.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/glasses_deltad.dmi')
	prescription = TRUE
	toggleable = TRUE
	hud_type = DATA_HUD_MEDICAL_ADVANCED
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/glasses/hud/security
	name = "\improper 巡逻伙伴抬头显示器"
	desc = "一种抬头显示器，可扫描视野内的人类并提供其身份状态和安全记录的准确数据。"
	species_exception = list(/datum/species/robot)
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/glasses.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/glasses_bravada.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/glasses_charlit.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/glasses_alpharii.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/glasses_deltad.dmi')
	icon_state = "securityhud"
	deactive_state = "degoggles_sec"
	toggleable = 1
	armor_protection_flags = NONE
	hud_type = DATA_HUD_SECURITY_ADVANCED
	actions_types = list(/datum/action/item_action/toggle)
	var/global/list/jobs[0]

/obj/item/clothing/glasses/hud/security/jensenshades
	name = "增强护目镜"
	desc = "偏振式生物神经护目镜，旨在增强您的视觉。"
	icon_state = "jensenshades"
	worn_icon_state = "jensenshades"
	vision_flags = SEE_MOBS
	toggleable = 0
	actions_types = null

/obj/item/clothing/glasses/hud/xenohud
	name = "异形伴侣HUD"
	desc = "一个可扫描附近异形数据的抬头显示器。"
	icon_state = "securityhud"
	deactive_state = "degoggles_sec"
	species_exception = list(/datum/species/robot)
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/glasses.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/glasses_bravada.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/glasses_charlit.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/glasses_alpharii.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/glasses_deltad.dmi')
	armor_protection_flags = NONE
	toggleable = TRUE
	hud_type = DATA_HUD_XENO_STATUS
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/glasses/hud/painhud
	name = "痛觉HUD"
	desc = "扫描人类痛觉与感知健康状况的抬头显示器。"
	icon_state = "securityhud"
	deactive_state = "degoggles_sec"
	species_exception = list(/datum/species/robot)
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/glasses.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/glasses_bravada.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/glasses_charlit.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/glasses_alpharii.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/glasses_deltad.dmi')
	toggleable = TRUE
	hud_type = DATA_HUD_MEDICAL_PAIN
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/glasses/hud/sa
	name = "空间特工的太阳镜"
	desc = "空间特工佩戴的眼镜。"
	icon_state = "sun"
	worn_icon_state = "sunglasses"
	eye_protection = 2
	hud_type = list(DATA_HUD_MEDICAL_OBSERVER, DATA_HUD_XENO_STATUS, DATA_HUD_SECURITY_ADVANCED, DATA_HUD_SQUAD_TERRAGOV, DATA_HUD_SQUAD_SOM, DATA_HUD_ORDER)
	vision_flags = SEE_TURFS|SEE_MOBS|SEE_OBJS
	lighting_cutoff = LIGHTING_CUTOFF_FULLBRIGHT
	activation_sound = null
	deactivation_sound = null

/obj/item/clothing/glasses/hud/sa/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/clothing_tint, TINT_NONE)

/obj/item/clothing/glasses/hud/sa/nodrop
	desc = "空间特工佩戴的眼镜。一旦摘下就会自我销毁！"
	item_flags = DELONDROP
