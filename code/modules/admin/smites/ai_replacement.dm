//Hugely buffs the mob
/datum/smite/ai_replacement
	name = "由AI替换"

/datum/smite/ai_replacement/effect(client/user, mob/living/carbon/C)
	. = ..()
	C.replace_by_ai()
