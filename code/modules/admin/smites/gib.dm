/// Gibs the target
/datum/smite/gib
	name = "肢解"

/datum/smite/gib/effect(client/user, mob/living/target)
	. = ..()
	target.gib()
