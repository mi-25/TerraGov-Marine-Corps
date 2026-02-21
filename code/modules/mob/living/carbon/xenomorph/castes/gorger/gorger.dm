/mob/living/carbon/xenomorph/gorger
	caste_base_type = /datum/xeno_caste/gorger
	name = "Gorger"
	desc = "一个体型庞大、肌肉发达的异形，似乎比其他同类拥有更强的生命力。"
	icon = 'icons/Xeno/castes/gorger.dmi'
	icon_state = "Gorger Walking"
	health = 600
	maxHealth = 600
	plasma_stored = 100
	pixel_x = -16
	tier = XENO_TIER_THREE
	upgrade = XENO_UPGRADE_NORMAL
	mob_size = MOB_SIZE_BIG
	bubble_icon = "alienroyal"

/mob/living/carbon/xenomorph/gorger/Initialize(mapload)
	. = ..()
	GLOB.huds[DATA_HUD_XENO_HEART].add_hud_to(src)
