/// Inflicts crippling brain damage on the target
/datum/smite/brain_damage
	name = "脑损伤"

/datum/smite/brain_damage/effect(client/user, mob/living/target)
	. = ..()

	if (!ishuman(target))
		to_chat(user, span_warning("必须对人类使用。"), confidential = TRUE)
		return
		
	to_chat(target, span_userdanger("你的心智在存在的重压下崩溃了，你再也无法承受了。"), confidential = TRUE)
	target.adjustBrainLoss(BRAIN_DAMAGE_DEATH - 1, BRAIN_DAMAGE_DEATH - 1)
