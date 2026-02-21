/mob/living/carbon/human/Login()
	. = ..()
	species?.handle_login_special(src)

	if(HAS_TRAIT(src, TRAIT_IS_RESURRECTING))
		to_chat(src, span_notice("正在复活，保持不动..."))

	if(SStts.tts_enabled && !voice)
		voice = random_tts_voice()
