/mob/living/simple_animal/crab
	name = "螃蟹"
	desc = "免费螃蟹！"
	icon_state = "crab"
	icon_living = "crab"
	icon_dead = "crab_dead"
	speak_emote = list("clicks")
	emote_hear = list("clicks.")
	emote_see = list("clacks.")
	speak_chance = 1
	turns_per_move = 5
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "stomps"
	stop_automated_movement = TRUE
	friendly = "pinches"


/mob/living/simple_animal/crab/Coffee
	name = "咖啡"
	real_name = "Coffee"
	desc = "是咖啡，另一只宠物！"
	gender = FEMALE
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "stomps"


/mob/living/simple_animal/crab/evil
	name = "邪恶螃蟹"
	real_name = "Evil Crab"
	desc = "令人不安，对吧？它肯定在策划什么邪恶的勾当……"
	icon_state = "evilcrab"
	icon_living = "evilcrab"
	icon_dead = "evilcrab_dead"
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "stomps"


/mob/living/simple_animal/crab/kreb
	name = "克雷布"
	desc = "这是一只真正的螃蟹。其他螃蟹都只是伪装成嘎巴克的！"
	real_name = "Kreb"
	icon_state = "kreb"
	icon_living = "kreb"
	icon_dead = "kreb_dead"
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "stomps"


/mob/living/simple_animal/crab/evil/kreb
	name = "邪恶克雷布"
	real_name = "Evil Kreb"
	icon_state = "evilkreb"
	icon_living = "evilkreb"
	icon_dead = "evilkreb_dead"
