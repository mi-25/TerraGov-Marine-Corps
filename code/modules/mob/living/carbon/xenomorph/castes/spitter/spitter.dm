/mob/living/carbon/xenomorph/spitter
	caste_base_type = /datum/xeno_caste/spitter
	name = "Spitter"
	desc = "某种令人作呕、渗出粘液的外星生物。"
	icon = 'icons/Xeno/castes/spitter.dmi'
	icon_state = "Spitter Walking"
	bubble_icon = "alienroyal"
	health = 180
	maxHealth = 180
	plasma_stored = 150
	pixel_x = -16
	tier = XENO_TIER_TWO
	upgrade = XENO_UPGRADE_NORMAL
	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/vent_crawl,
	)

/mob/living/carbon/xenomorph/spitter/globadier
	caste_base_type = /datum/xeno_caste/spitter/globadier
	name = "Globadier"
	desc = "一只畸形的喷射者。其背部携带着某种酸液。"
