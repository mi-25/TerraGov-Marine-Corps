//No relation to slugcat

/mob/living/simple_animal/catslug
	name = "猫蛞蝓"
	desc = "这是一只猫……来自另一个星球的东西，也许来自另一个世界。你觉得它并不危险，但你不能确定。研究员应该更了解这种生物。"
	icon = 'icons/mob/pets.dmi'
	icon_state = "catslug"
	icon_living = "catslug"
	icon_dead = "catslug_dead"
	gender = MALE
	emote_see = list("stares at the ceiling.", "shivers.", "looks at the marines.", "looks at the research paper.")
	speak_chance = 1
	turns_per_move = 5
	pass_flags = PASS_LOW_STRUCTURE
	response_help = "hugs"
	response_disarm = "rudely paps"
	response_harm = "kicks"

/mob/living/simple_animal/catslug/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/companion)

/mob/living/simple_animal/catslug/newt
	name = "蝾螈"
	real_name = "Newt"
	desc = "你想起在另一份PPT演示中，军方喜欢用纽特作为当前异形威胁中的幸存者案例。研究人员在其同类中发现了这个可怜的小东西，很可能被异形开膛破肚了。谁知道纽特是不是她族群的最后幸存者。"
	icon_state = "catslug"
	icon_living = "catslug"
	icon_dead = "catslug_dead"
	gender = FEMALE
