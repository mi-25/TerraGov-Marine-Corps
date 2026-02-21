#define BLOOD_VOLUME_NOT_IDEAL 450

/// Drains targets blood
/datum/smite/bloodless
	name = "失血"

/datum/smite/bloodless/effect(client/user, mob/living/target)
	. = ..()

	if (!ishuman(target))
		to_chat(user, span_warning("异形血液受到异形女王的保护，你这傻家伙。中止。"), confidential = TRUE)
		return

	var/bloodlossamount = tgui_input_list(usr, "How much blood should [target] lose?", "Bloodloss amount", list("A little", "A lot", "So fucking much", "FUCK THIS DUDE"))
	to_chat(target, span_userdanger("你感觉皮肤逐渐苍白，血液正在流失……"), confidential = TRUE)

	switch (bloodlossamount)
		if("A little")
			target.set_blood_volume(BLOOD_VOLUME_NOT_IDEAL) //80% blood
		if("A lot")
			target.set_blood_volume(BLOOD_VOLUME_OKAY) //60% blood
		if("So fucking much")
			target.set_blood_volume(BLOOD_VOLUME_BAD) //40% blood
		if("FUCK THIS DUDE")
			target.set_blood_volume(BLOOD_VOLUME_SURVIVE) //20% blood

#undef BLOOD_VOLUME_NOT_IDEAL
