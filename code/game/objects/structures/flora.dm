/obj/structure/flora
	anchored = TRUE
	max_integrity = 25
	coverage = 30
	hit_sound = 'sound/effects/natural/vegetation_hit.ogg'
	var/on_fire = FALSE
	///number of icon variants this object has
	var/icon_variants = NONE

/obj/structure/flora/Initialize(mapload)
	. = ..()
	if(icon_variants)
		icon_state = "[initial(icon_state)]_[rand(1, icon_variants)]"

/obj/structure/flora/footstep_override(atom/movable/source, list/footstep_overrides)
	//set at the flora level, but the connection is only set where desired
	footstep_overrides[FOOTSTEP_VEGETATION] = layer

/obj/structure/flora/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			qdel(src)
		if(EXPLODE_HEAVY)
			if(prob(70))
				qdel(src)
		if(EXPLODE_LIGHT)
			if(prob(50))
				qdel(src)
		if(EXPLODE_WEAK)
			if(prob(10))
				qdel(src)

/obj/structure/flora/fire_act(burn_level)
	take_damage(burn_level, BURN, FIRE)

//TREES

/obj/structure/flora/tree
	name = "树"
	desc = "一棵大树。"
	density = TRUE
	pixel_x = -16
	max_integrity = 500
	layer = ABOVE_TREE_LAYER
	allow_pass_flags = PASS_PROJECTILE|PASS_AIR
	resistance_flags = XENO_DAMAGEABLE
	hit_sound = 'sound/effects/natural/woodhit.ogg'
	///How many logs you get from felling this tree
	var/log_amount = 10

/obj/structure/flora/tree/add_debris_element()
	AddElement(/datum/element/debris, DEBRIS_WOOD, -40, 5)

/obj/structure/flora/tree/Initialize(mapload)
	. = ..()
	AddTransparencyComponent()

//Adds the transparency component, exists to be overridden for different args.
/obj/structure/flora/tree/proc/AddTransparencyComponent()
	AddComponent(/datum/component/largetransparency)

/obj/structure/flora/tree/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			take_damage(500, BRUTE, BOMB)
		if(EXPLODE_HEAVY)
			take_damage(rand(140, 300), BRUTE, BOMB)
		if(EXPLODE_LIGHT)
			take_damage(rand(50, 100), BRUTE, BOMB)
		if(EXPLODE_WEAK)
			take_damage(rand(25, 50), BRUTE, BOMB)
	START_PROCESSING(SSobj, src)


/obj/structure/flora/tree/deconstruct(disassembled = TRUE, mob/living/blame_mob)
	density = FALSE
	var/obj/structure/flora/stump/S = new(loc)
	S.name = "[name] stump"
	return ..()


/obj/structure/flora/tree/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(!I.sharp && I.force <= 0)
		return

	if(I.hitsound)
		playsound(get_turf(src), I.hitsound, 50, 0, 0)

	user.visible_message(span_notice("[user]开始用[I]砍倒[src]。"),span_notice("You begin to cut down [src] with [I]."), "You hear the sound of sawing.")
	var/cut_force = min(1, I.force)
	var/cutting_time = clamp(10, 20, 100 / cut_force) SECONDS
	if(!do_after(user, cutting_time , NONE, src, BUSY_ICON_BUILD))
		return

	user.visible_message(span_notice("[user]用[I]击倒了[src]。"),span_notice("You fell [src] with the [I]."), "You hear the sound of a tree falling.")
	playsound(get_turf(src), 'sound/effects/meteorimpact.ogg', 10 , 0, 0)
	for(var/i in 1 to log_amount)
		new /obj/item/grown/log(get_turf(src))

	var/obj/structure/flora/stump/S = new(loc)
	S.name = "[name] stump"

	qdel(src)

/obj/structure/flora/tree/fire_act(burn_level)
	take_damage(burn_level * 0.3, BURN, FIRE)


/obj/structure/flora/tree/update_overlays()
	. = ..()
	if(on_fire)
		. += image(icon, "fire")

/obj/structure/flora/stump
	name = "树桩"
	desc = "这代表了我们尽可能多地砍伐树木的承诺。"
	icon = 'icons/obj/flora/deadtrees.dmi'
	icon_state = "tree_stump"
	density = FALSE
	pixel_x = -16

/obj/structure/flora/tree/pine
	name = "松树"
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine"
	icon_variants = 3

/obj/structure/flora/tree/xmas
	icon = 'icons/obj/flora/pinetrees.dmi'
	name = "圣诞树"
	icon_state = "pine_c"
	icon_variants = NONE
	resistance_flags = null

/obj/structure/flora/tree/xmas/presents
	icon_state = "pinepresents"
	desc = "一棵装饰精美的圣诞树。树下有礼物！"
	var/gift_type = /obj/item/gift/marine
	var/list/ckeys_that_took = list()

/obj/structure/flora/tree/xmas/presents/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(!user.ckey)
		return

	if(ckeys_that_took[user.ckey])
		to_chat(user, span_warning("没有写着你名字的礼物。"))
		return
	to_chat(user, span_warning("翻找了一会儿，你找到了一个写着你名字的礼物！"))
	ckeys_that_took[user.ckey] = TRUE
	var/obj/item/G = new gift_type(src)
	user.put_in_hands(G)

/obj/structure/flora/tree/dead
	icon = 'icons/obj/flora/deadtrees.dmi'
	icon_state = "tree"
	icon_variants = 6

/obj/structure/flora/tree/dead/AddTransparencyComponent()
	AddComponent(/datum/component/largetransparency, 0, 1, 0, 0)

/obj/structure/flora/tree/dead/drought
	name = "枯树"
	desc = "一棵枯树。它可能经历过更好的时光。"
	icon = 'icons/obj/flora/tall_trees.dmi'
	icon_state = "dead_tree"
	icon_variants = 3

/obj/structure/flora/tree/joshua
	name = "约书亚树"
	desc = "一棵高大的树木，树干上覆盖着尖刺状的针叶。"
	icon = 'icons/obj/flora/joshuatree.dmi'
	icon_state = "joshua"
	icon_variants = 4

/obj/structure/flora/tree/jungle
	name = "丛林树"
	icon_state = "tree"
	desc = "这严重阻碍了你对丛林的视野。"
	icon = 'icons/obj/flora/jungletrees.dmi'
	pixel_x = -48
	pixel_y = -20

/obj/structure/flora/tree/jungle/AddTransparencyComponent()
	AddComponent(/datum/component/largetransparency, -1, 1, 2, 2)

/obj/structure/flora/tree/jungle/small
	pixel_y = 0
	pixel_x = -32
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_variants = 6

/obj/structure/flora/tree/jungle/small/AddTransparencyComponent()
	AddComponent(/datum/component/largetransparency)

//GRASS

/obj/structure/flora/grass
	name = "草"
	icon = 'icons/obj/flora/snowflora.dmi'
	anchored = TRUE

/obj/structure/flora/grass/brown
	icon_state = "snowgrass_bb"
	icon_variants = 3

/obj/structure/flora/grass/green
	icon_state = "snowgrass_gb"
	icon_variants = 3

/obj/structure/flora/grass/both
	icon_state = "snowgrassall"
	icon_variants = 3

//grayscale tall grass
/obj/structure/flora/grass/tallgrass
	name = "高草丛"
	icon = 'icons/obj/flora/tallgrass.dmi'
	icon_state = "tallgrass"
	plane = GAME_PLANE
	opacity = TRUE
	color = "#7a8c54"

/obj/structure/flora/grass/tallgrass/Initialize(mapload)
	. = ..()
	var/static/list/connections = list(
		COMSIG_FIND_FOOTSTEP_SOUND = TYPE_PROC_REF(/atom/movable, footstep_override),
	)
	AddElement(/datum/element/connect_loc, connections)
	AddComponent(/datum/component/submerge_modifier, 10)

/obj/structure/flora/grass/tallgrass/footstep_override(atom/movable/source, list/footstep_overrides)
	footstep_overrides[FOOTSTEP_GRASS] = layer

/obj/structure/flora/grass/tallgrass/tallgrasscorner
	name = "高草丛"
	icon_state = "tallgrass_corner"

/obj/structure/flora/grass/tallgrass/hideable
	layer = ABOVE_OBJ_LAYER

/obj/structure/flora/grass/tallgrass/hideable/tallgrasscorner
	icon_state = "tallgrass_corner"

/obj/structure/flora/grass/tallgrass/autosmooth
	name = "高草丛"
	icon = 'icons/obj/flora/smooth/tall_grass.dmi'
	icon_state = "tallgrass-icon"
	base_icon_state = "tallgrass"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_TALL_GRASS)
	canSmoothWith = list(
		SMOOTH_GROUP_TALL_GRASS,
		SMOOTH_GROUP_ASTEROID_WARNING,
		SMOOTH_GROUP_SURVIVAL_TITANIUM_WALLS,
		SMOOTH_GROUP_MINERAL_STRUCTURES,
		SMOOTH_GROUP_WINDOW_FULLTILE,
		SMOOTH_GROUP_FLORA,
		SMOOTH_GROUP_WINDOW_FRAME,
	)

/obj/structure/flora/grass/tallgrass/autosmooth/desert
	color = "#ffbd72"

/obj/structure/flora/grass/tallgrass/autosmooth/desert/Initialize(mapload)
	. = ..()
	layer = ABOVE_OBJ_LAYER //do this here instead of on type so it doesn't layer over things in map editor

//bushes
/obj/structure/flora/bush
	name = "灌木丛"
	icon = 'icons/obj/flora/snowflora.dmi'
	icon_state = "snowbush"
	anchored = TRUE
	icon_variants = 6

/obj/structure/flora/pottedplant
	name = "盆栽植物"
	icon = 'icons/obj/flora/plants.dmi'
	icon_state = "plant-05"

/obj/structure/flora/pottedplant/one
	icon_state = "plant-01"

/obj/structure/flora/pottedplant/two
	icon_state = "plant-02"

/obj/structure/flora/pottedplant/three
	icon_state = "plant-03"

/obj/structure/flora/pottedplant/four
	icon_state = "plant-04"

/obj/structure/flora/pottedplant/five
	icon_state = "plant-05"

/obj/structure/flora/pottedplant/six
	icon_state = "plant-06"

/obj/structure/flora/pottedplant/seven
	icon_state = "plant-07"

/obj/structure/flora/pottedplant/eight
	icon_state = "plant-08"

/obj/structure/flora/pottedplant/nine
	icon_state = "plant-09"

/obj/structure/flora/pottedplant/ten
	icon_state = "plant-10"

/obj/structure/flora/pottedplant/eleven
	icon_state = "plant-11"

/obj/structure/flora/pottedplant/twelve
	icon_state = "plant-12"

/obj/structure/flora/pottedplant/thirteen
	icon_state = "plant-13"

/obj/structure/flora/pottedplant/fourteen
	icon_state = "plant-14"

/obj/structure/flora/pottedplant/fifteen
	icon_state = "plant-15"

/obj/structure/flora/pottedplant/sixteen
	icon_state = "plant-16"

/obj/structure/flora/pottedplant/seventeen
	icon_state = "plant-17"

/obj/structure/flora/pottedplant/eighteen
	icon_state = "plant-18"

/obj/structure/flora/pottedplant/nineteen
	icon_state = "plant-19"

/obj/structure/flora/pottedplant/twenty
	icon_state = "plant-19"

/obj/structure/flora/pottedplant/twentyone
	icon_state = "plant-21"

/obj/structure/flora/pottedplant/twentytwo
	icon_state = "plant-22"

/obj/structure/flora/pottedplant/twentythree
	icon_state = "plant-23"

/obj/structure/flora/pottedplant/twentyfour
	icon_state = "plant-24"

/obj/structure/flora/pottedplant/twentyfive
	icon_state = "plant-25"

/obj/structure/flora/pottedplant/twentyfive
	icon_state = "plant-26"

//newbushes

/obj/structure/flora/ausbushes
	name = "灌木丛"
	icon = 'icons/obj/flora/ausflora.dmi'
	icon_state = "firstbush"
	anchored = TRUE
	icon_variants = 4

/obj/structure/flora/ausbushes/reedbush
	icon_state = "reedbush"

/obj/structure/flora/ausbushes/leafybush
	icon_state = "leafybush"
	icon_variants = 3

/obj/structure/flora/ausbushes/palebush
	icon_state = "palebush"

/obj/structure/flora/ausbushes/stalkybush
	icon_state = "stalkybush"
	icon_variants = 3

/obj/structure/flora/ausbushes/grassybush
	icon_state = "grassybush"

/obj/structure/flora/ausbushes/yellowbush
	icon_state = "yellowbush"
	icon_variants = 5

/obj/structure/flora/ausbushes/fernybush
	icon_state = "fernybush"
	icon_variants = 3

/obj/structure/flora/ausbushes/sunnybush
	icon_state = "sunnybush"
	icon_variants = 3

/obj/structure/flora/ausbushes/genericbush
	icon_state = "genericbush"

/obj/structure/flora/ausbushes/pointybush
	icon_state = "pointybush"

/obj/structure/flora/ausbushes/lavendergrass
	icon_state = "lavendergrass"

/obj/structure/flora/ausbushes/ywflowers
	icon_state = "ywflowers"
	icon_variants = 3

/obj/structure/flora/ausbushes/brflowers
	icon_state = "brflowers"
	icon_variants = 3

/obj/structure/flora/ausbushes/ppflowers
	icon_state = "ppflowers"
	icon_variants = 3

/obj/structure/flora/ausbushes/sparsegrass
	icon_state = "sparsegrass"
	icon_variants = 3

/obj/structure/flora/ausbushes/fullgrass
	icon_state = "fullgrass"
	icon_variants = 3


//Desert (Desert Dam)
//*********************//
// Generic undergrowth //
//*********************//
/obj/structure/flora/desert
	anchored = TRUE
	icon = 'icons/obj/flora/dam.dmi'

//GRASS
/obj/structure/flora/desert/grass
	name = "草"
	icon_state = "lightgrass"
	icon_variants = 12

/obj/structure/flora/desert/grass/heavy
	icon_state = "heavygrass"
	icon_variants = 16

//BUSHES
/obj/structure/flora/desert/bush
	name = "灌木丛"
	desc = "一丛矮小的灌木。"
	icon_state = "tree"
	icon_variants = 4

//CACTUS
/obj/structure/flora/desert/cactus
	name = "仙人掌"
	desc = "这是一株带刺的小仙人掌。"
	icon_state = "cactus"
	icon_variants = 12

/obj/structure/flora/desert/cactus/multiple
	name = "仙人掌"
	icon_state = "cacti"


//Jungle (Whiskey Outpost)

//*********************//
// Generic undergrowth //
//*********************//

/obj/structure/flora/jungle
	name = "丛林植被"
	icon = 'icons/turf/ground_map.dmi'
	layer = ABOVE_MOB_LAYER

/obj/structure/flora/jungle/shrub
	name = "丛林植被"
	desc = "相当茂密的灌木丛，需要锋利的工具和坚定的决心才能清理掉。"
	icon_state = "grass4"

/obj/structure/flora/jungle/plantbot1
	name = "奇怪的树"
	desc = "某种怪异的异形树木。它渗出一种令人作呕的黄色树液。"
	icon_state = "plantbot1"

/obj/structure/flora/jungle/plantbot1/alien
	icon_state = "alienplant1"

/obj/structure/flora/jungle/planttop1
	name = "奇怪的树"
	desc = "某种怪异的异形树木。它渗出一种令人作呕的黄色树液。"
	icon_state = "planttop1"

/obj/structure/flora/jungle/bush
	name = "丛林灌木丛"
	desc = "一株小型多叶植物。"
	icon_state = "bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_variants = 9
	layer = OBJ_LAYER

/obj/structure/flora/jungle/grass
	name = "丛林草"
	desc = "某种草类物种。"
	icon_state = "grass"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_variants = 5
	layer = OBJ_LAYER

/obj/structure/flora/jungle/grass/thin
	icon_state = "grass_thin"

/obj/structure/flora/jungle/large_bush
	name = "大型植物"
	desc = "一株大型多叶植物。"
	icon_state = "bush"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	layer = ABOVE_MOB_LAYER
	pixel_x = -16
	pixel_y = -8
	icon_variants = 3

/obj/structure/flora/jungle/large_bush/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/largetransparency, 0, 0, 0, 1)

	var/static/list/connections = list(
		COMSIG_FIND_FOOTSTEP_SOUND = TYPE_PROC_REF(/atom/movable, footstep_override),
	)
	AddElement(/datum/element/connect_loc, connections)

/obj/structure/flora/jungle/vines
	name = "藤蔓"
	desc = "一团扭曲的藤蔓。"
	icon = 'icons/effects/spacevines.dmi'
	icon_state = "Light2"

/obj/structure/flora/jungle/vines/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(I.sharp != IS_SHARP_ITEM_BIG || !isliving(user))
		return

	var/mob/living/L = user

	to_chat(L, span_warning("你用\the [I]切开了\the [src]。"))
	L.do_attack_animation(src, used_item = I)
	playsound(src, 'sound/effects/natural/vegetation_hit.ogg', 25, 1)
	qdel(src)

/obj/structure/flora/jungle/vines/Initialize(mapload)
	. = ..()
	icon_state = pick("Light1","Light2","Light3")

/obj/structure/flora/jungle/vines/heavy
	desc = "一团粗壮、盘绕的扭曲藤蔓。"
	opacity = TRUE

/obj/structure/flora/jungle/vines/heavy/Initialize(mapload)
	. = ..()
	icon_state = pick("Hvy1","Hvy2","Hvy3","Med1","Med2","Med3")


//drought map flora
/obj/structure/flora/drought
	icon = 'icons/obj/flora/desert_flora.dmi'

//GRASS
/obj/structure/flora/drought/grass
	name = "草"
	desc = "一些干枯的草。"
	icon_state = "drygrass"
	icon_variants = 15

/obj/structure/flora/drought/tall_cactus
	name = "仙人掌"
	desc = "一株高大、布满尖刺的仙人掌。"
	icon_state = "tall_cactus"
	icon_variants = 3
	density = TRUE
	resistance_flags = XENO_DAMAGEABLE
/obj/structure/flora/drought/short_cactus
	name = "仙人掌"
	desc = "一株矮小、带刺的仙人掌。"
	icon_state = "short_cactus"
	icon_variants = 3

/obj/structure/flora/drought/barrel_cactus
	name = "仙人掌"
	desc = "一株饱满多刺的仙人掌。"
	icon_state = "barrel"
	icon_variants = 6

/obj/structure/flora/drought/leafy_plant
	name = "种植"
	desc = "一株看起来坚韧的小植物。"
	icon_state = "leafy_plant"
	icon_variants = 3

/obj/structure/flora/drought/yucca
	name = "丝兰灌木"
	desc = "一株顽强的小灌木。据说它的花朵具有药用价值。"
	icon_state = "yucca"
	icon_variants = 2

/obj/structure/flora/drought/xander
	name = "亚历山大·布什"
	desc = "一种坚韧的小灌木。据说晒干后具有药用价值。"
	icon_state = "xander"
	icon_variants = 2

/obj/structure/flora/drought/broc
	name = "布罗克花树"
	desc = "一株小小的沙漠灌木。它看起来不太开心。"
	icon_state = "broc_flower"
	icon_variants = 2

/obj/structure/flora/drought/aster
	name = "紫菀灌木"
	desc = "一株坚韧的小灌木。它开出漂亮的蓝色花朵。"
	icon_state = "aster"
	icon_variants = 2

/obj/structure/flora/drought/ash
	name = "灰烬玫瑰"
	desc = "一株坚韧的小灌木，长着锋利的尖刺。其花朵因浓郁的香气而备受珍视。"
	icon_state = "ash_rose"
	icon_variants = 2

//cave flora
/obj/structure/flora/drought/shroom
	name = "菌毯"
	desc = "一小片棕色真菌。吃掉它们可能是个糟糕的主意。"
	icon_state = "shroom"
	icon_variants = 3

/obj/structure/flora/drought/shroom/glow
	name = "发光真菌"
	desc = "一小片发光真菌。吃它们绝对是个糟糕的主意。"
	icon_state = "glowshroom"

/obj/structure/flora/drought/shroom/blight
	name = "枯萎蘑菇"
	desc = "一小片枯萎蘑菇。剧毒。"
	icon_state = "blightshroom"

/obj/structure/flora/drought/shroom/brain
	name = "灰烬玫瑰"
	desc = "一小片脑菌。正确处理后显然很美味。"
	icon_state = "brainshroom"

/obj/structure/flora/drought/shroom/fire
	name = "灰烬玫瑰"
	desc = "一小片火焰蘑菇。实际上并不会引发火焰。"
	icon_state = "fireshroom"

/obj/structure/flora/drought/shroom/gut
	name = "灰烬玫瑰"
	desc = "一小片肠道蘑菇。据说会导致漫长而痛苦的死亡。"
	icon_state = "gutshroom"

/obj/structure/flora/drought/shroom/nara_root
	name = "灰烬玫瑰"
	desc = "一小片纳拉根真菌。据说具有治疗功效。"
	icon_state = "narashroom"

/obj/structure/flora/drought/shroom/lure_weed
	name = "诱捕菌毯"
	desc = "一株又长又坚韧的小真菌。"
	icon_state = "lureweed"

/obj/structure/flora/drought/broc/cave
	desc = "一株小型沙漠灌木。它在昏暗的光线下显得出奇地欢快。"
	icon_state = "broc_flower_cave"
	icon_variants = 2

/obj/structure/flora/drought/xander/cave
	desc = "一种坚韧的小植物。据说晒干后具有药用价值。"
	icon_state = "xander_cave"
	icon_variants = 2
