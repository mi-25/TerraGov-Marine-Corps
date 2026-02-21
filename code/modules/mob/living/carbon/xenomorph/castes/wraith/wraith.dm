/mob/living/carbon/xenomorph/wraith
	caste_base_type = /datum/xeno_caste/wraith
	name = "Wraith"
	desc = "一个长着奇怪触须的外星生物。它周围的空气像热浪般扭曲闪烁。"
	icon = 'icons/Xeno/castes/wraith.dmi'
	icon_state = "Wraith Walking"
	bubble_icon = "alienleft"
	health = 150
	maxHealth = 150
	plasma_stored = 150
	pixel_x = -16
	tier = XENO_TIER_TWO
	upgrade = XENO_UPGRADE_NORMAL
	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/vent_crawl,
	)
