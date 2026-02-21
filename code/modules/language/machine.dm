/datum/language/machine
	name = "已编码音频语言"
	desc = "一种由合成人和赛博格开发的高效编码音调语言。"
	speech_verb = "whistles"
	ask_verb = "chirps"
	exclaim_verb = "whistles loudly"
	sing_verb = "whistles melodically"
	spans = list(SPAN_ROBOT)
	key = "6"
	flags = NO_STUTTER
	syllables = list("beep", "beep", "beep", "beep", "beep", "boop", "boop", "boop", "bop", "bop", "dee", "dee", "doo",\
					"doo", "hiss", "hss", "buzz", "buzz", "bzz", "ksssh", "keey", "wurr", "wahh", "tzzz")
	space_chance = 10
	default_priority = 90

	icon_state = "eal"


/datum/language/machine/get_random_name()
	return pick(SSstrings.get_list_from_file("names/ai"))
