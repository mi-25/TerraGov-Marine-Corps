/datum/language/aphasia
	name = "胡言乱语"
	desc = "据推测，任何大脑受损足够严重的人都能说这种语言。"
	speech_verb = "garbles"
	ask_verb = "mumbles"
	whisper_verb = "mutters"
	exclaim_verb = "screams incoherently"
	sing_verb = "gibbers"
	flags = LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	key = "i"
	syllables = list("m", "n", "gh", "h", "l", "s", "r", "a", "e", "i", "o", "u")
	space_chance = 20
	default_priority = 10
	icon_state = "aphasia"
