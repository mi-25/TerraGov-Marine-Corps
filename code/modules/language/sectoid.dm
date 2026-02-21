/datum/language/sectoid
	name = "灵语"
	desc = "一种由思维产生的灵能发射构成的语言，对于未经训练、无法在精神层面解密的人来说，听起来就像是混乱的胡言乱语。"
	speech_verb = "emits"
	ask_verb = "questions"
	exclaim_verb = "shrieks"
	whisper_verb = "faintly emits"
	flags = LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD | TONGUELESS_SPEECH
	key = "p"
	sentence_chance = 0
	default_priority = 80
	syllables = list("<font face='Wingdings'>wreh<font face='Verdana'>",
		"<font face='Wingdings'>breh<font face='Verdana'>",
		"<font face='Wingdings'>ayy<font face='Verdana'>",
		"<font face='Wingdings'>gji<font face='Verdana'>",
		"<font face='Wingdings'>pks<font face='Verdana'>",
		"<font face='Wingdings'>jok<font face='Verdana'>",
	)
	icon_state = "aphasia"
