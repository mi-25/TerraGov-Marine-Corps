/mob/living/simple_animal/corgi
	name = "\improper 柯基犬"
	real_name = "corgi"
	desc = "这是一只柯基犬。"
	icon = 'icons/mob/pets.dmi'
	icon_state = "corgi"
	icon_living = "corgi"
	icon_dead = "corgi_dead"
	response_help = "pets"
	response_disarm = "bops"
	response_harm = "kicks"
	speak = list("YAP", "Woof!", "Bark!", "AUUUUUU")
	speak_emote = list("barks", "woofs")
	emote_hear = list("barks!", "woofs!", "yaps.","pants.")
	emote_see = list("shakes its head.", "chases its tail.","shivers.")
	speak_chance = 1
	turns_per_move = 10

/mob/living/simple_animal/corgi/german_shepherd
	name = "\improper 德国牧羊犬"
	real_name = "german shepherd"
	desc = "这是一只德国牧羊犬。"
	icon = 'icons/mob/pets.dmi'
	icon_state = "german_shep"
	icon_living = "german_shep"
	icon_dead = "german_shep_dead"


/mob/living/simple_animal/corgi/ranger
	name = "游骑兵"
	real_name = "Ranger"
	gender = MALE
	desc = "这是游骑兵，你友善而凶猛的朋友。它见识过异形的恐怖，所以最好对它友善点。<b>游骑兵带路</b>！"
	icon_state = "ranger"
	icon_living = "ranger"
	icon_dead = "ranger_dead"
	health = 300
	maxHealth = 300 //Foreshadowing the health of other K9


/mob/living/simple_animal/corgi/bullterrier
	name = "\improper 蛮牛梗犬"
	real_name = "bull terrier"
	desc = "这是一只蛮牛犬。是那只广告狗吗？"
	icon = 'icons/mob/pets.dmi'
	icon_state = "bullterrier"
	icon_living = "bullterrier"
	icon_dead = "bullterrier_dead"


/mob/living/simple_animal/corgi/walten
	name = "沃尔顿·克莱门茨"
	gender = MALE
	desc = "长官，这位是首席沃尔顿·克莱门茨。他常驻医疗区，因为这里也是他的领地。他的随从们身着刷手服以控制细菌传播，他们用抚摸和零食作为报酬。如果他患上慢性阻塞性肺病也无需担心，因为他保持着健康饮食——以黑咖啡为主，并执行包含充足有氧运动和拉伸的训练计划。他每日关注的是账目管理；必须高度关注他的零食供应是否充足。祝您今日顺利，陆战队员。"
	icon = 'icons/mob/pets.dmi'
	icon_state = "walten"
	icon_living = "walten"
	icon_dead = "walten_dead"
	health = 300


/mob/living/simple_animal/corgi/exoticcorgi
	name = "异种柯基"
	desc = "可爱又多彩！"
	icon_state = "corgigrey"
	icon_living = "corgigrey"
	icon_dead = "corgigrey_dead"


/mob/living/simple_animal/corgi/exoticcorgi/Initialize(mapload)
	. = ..()
	var/newcolor = rgb(rand(0, 255), rand(0, 255), rand(0, 255))
	add_atom_colour(newcolor, FIXED_COLOR_PRIORITY)


/mob/living/simple_animal/corgi/ian
	name = "伊恩"
	real_name = "Ian"
	gender = MALE
	desc = "这是人事主管心爱的柯基犬。"
	response_help = "pets"
	response_disarm = "bops"
	response_harm = "kicks"


/mob/living/simple_animal/corgi/narsie
	name = "纳尔斯-伊安"
	desc = "Ia! Ia!"
	icon_state = "narsian"
	icon_living = "narsian"
	icon_dead = "narsian_dead"


/mob/living/simple_animal/corgi/narsie/Life(seconds_per_tick, times_fired)
	. = ..()
	for(var/mob/living/simple_animal/P in range(1, src))
		if(P == src || !prob(5))
			continue

		visible_message(span_warning("[src] 吞噬了 [P]！"), \
		"<span class='cult big bold'>DELICIOUS SOULS</span>")
		playsound(src, 'sound/effects/phasein.ogg', 75, TRUE)
		P.gib()


/mob/living/simple_animal/corgi/puppy
	name = "\improper 柯基幼犬"
	real_name = "corgi"
	desc = "是只柯基幼犬！"
	icon_state = "puppy"
	icon_living = "puppy"
	icon_dead = "puppy_dead"
	density = FALSE
	allow_pass_flags = PASS_MOB
	pass_flags = PASS_MOB
	mob_size = MOB_SIZE_SMALL


/mob/living/simple_animal/corgi/puppy/mrwiggles
	name = "威格尔斯先生"
	real_name = "Mr. Wiggles"
	desc = "是威格尔斯先生！"


/mob/living/simple_animal/corgi/puppy/void
	name = "\improper 虚空幼犬"
	real_name = "voidy"
	desc = "一只被深空能量灌注的柯基幼犬。它正回望着你……"
	icon_state = "void_puppy"
	icon_living = "void_puppy"
	icon_dead = "void_puppy_dead"


/mob/living/simple_animal/corgi/lisa
	name = "丽莎"
	real_name = "Lisa"
	gender = FEMALE
	desc = "她正在把你撕碎。"
	icon_state = "lisa"
	icon_living = "lisa"
	icon_dead = "lisa_dead"
	response_help = "pets"
	response_disarm = "bops"
	response_harm = "kicks"
