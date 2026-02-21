/mob/living/simple_animal/hostile/bear
	name = "太空熊"
	desc = "你不需要比太空熊跑得快，只需要跑赢你的队友就行。"
	icon_state = "bear"
	icon_living = "bear"
	icon_dead = "bear_dead"
	icon_gib = "bear_gib"
	speak = list("RAWR!","Rawr!","GRR!","Growl!")
	speak_emote = list("growls", "roars")
	emote_hear = list("rawrs.","grumbles.","grawls.")
	emote_taunt = list("stares ferociously", "stomps")
	speak_chance = 1
	taunt_chance = 25
	turns_per_move = 5
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	maxHealth = 60
	health = 60

	obj_damage = 60
	melee_damage = 25
	attacktext = "claws"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	friendly = "bear hugs"


/mob/living/simple_animal/hostile/bear/Hudson
	name = "哈德森"
	gender = MALE
	desc = "令人畏惧的法外之徒，这家伙是个十足的麻烦人物。"


/mob/living/simple_animal/hostile/bear/snow
	name = "太空北极熊"
	icon_state = "snowbear"
	icon_living = "snowbear"
	icon_dead = "snowbear_dead"
	desc = "这是一头北极熊，在太空中，但并非真的在太空中。"


/mob/living/simple_animal/hostile/bear/russian
	name = "战斗熊"
	desc = "一头凶猛的棕熊，身披装甲板，肩甲上饰有黄色轮廓的红色五角星。"
	icon_state = "combatbear"
	icon_living = "combatbear"
	icon_dead = "combatbear_dead"
	melee_damage = 35
	armour_penetration = 20
	health = 120
	maxHealth = 120
