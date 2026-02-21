/mob/living/carbon/xenomorph/defiler
	caste_base_type = /datum/xeno_caste/defiler
	name = "Defiler"
	desc = "一个体型庞大、肌肉发达的异形，浑身布满滴着粘液的尖刺和漏气的背脊排气孔。"
	icon = 'icons/Xeno/castes/defiler.dmi'
	icon_state = "Defiler Walking"
	bubble_icon = "alienroyal"
	health = 225
	maxHealth = 225
	plasma_stored = 400
	pixel_x = -16
	tier = XENO_TIER_THREE
	upgrade = XENO_UPGRADE_NORMAL
	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/vent_crawl,
	)
