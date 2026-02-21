

// ***********************************************************
// Foods that are produced from hydroponics ~~~~~~~~~~
// Data from the seeds carry over to these grown foods
// ***********************************************************

//Grown foods
//Subclass so we can pass on values
/obj/item/reagent_containers/food/snacks/grown
	var/plantname
	var/potency = -1
	icon = 'icons/obj/items/harvest.dmi'

/obj/item/reagent_containers/food/snacks/grown/Initialize(mapload, newpotency)
	. = ..()

	if(!tastes)
		tastes = list("[name]" = 1)
	if (!isnull(newpotency))
		potency = newpotency

	if(!isnull(plantname))
		var/datum/seed/S = GLOB.seed_types[plantname]
		if(!S || !S.chems)
			return

		potency = S.potency

		for(var/rid in S.chems)
			var/list/reagent_data = S.chems[rid]
			var/rtotal = reagent_data[1]
			if(length(reagent_data) > 1 && potency > 0)
				rtotal += round(potency/reagent_data[2])
			if(reagents)
				reagents.add_reagent(rid, max(1, rtotal))

	if(reagents.total_volume > 0)
		bitesize = 1+round(reagents.total_volume / 2, 1)


/obj/item/reagent_containers/food/snacks/grown/corn
	name = "ear of corn"
	desc = "需要一些黄油！"
	plantname = "corn"
	icon_state = "corn"
	potency = 40
	filling_color = "#FFEE00"
	trash = /obj/item/corncob

/obj/item/reagent_containers/food/snacks/grown/cherries
	name = "cherries"
	desc = "绝佳的配料！"
	icon_state = "cherry"
	filling_color = "#FF0000"
	gender = PLURAL
	plantname = "cherry"

/obj/item/reagent_containers/food/snacks/grown/poppy
	name = "poppy"
	desc = "长久以来，它被用作休息、和平与死亡的象征。"
	icon_state = "poppy"
	potency = 30
	filling_color = "#CC6464"
	plantname = "poppies"

/obj/item/reagent_containers/food/snacks/grown/harebell
	name = "harebell"
	desc = "我将装点你凄凉的坟茔：你绝不会缺少那如你面容般苍白的报春花，也不会缺少那如你血脉般湛蓝的风铃草；不，还有那野蔷薇的叶片，它的芬芳——恕我直言——也胜不过你吐息间的馨香。"
	icon_state = "harebell"
	potency = 1
	filling_color = "#D4B2C9"
	plantname = "harebells"

/obj/item/reagent_containers/food/snacks/grown/potato
	name = "potato"
	desc = "煮了它们！捣烂它们！把它们炖进汤里！"
	icon_state = "potato"
	potency = 25
	filling_color = "#E6E8DA"
	plantname = "potato"

/obj/item/reagent_containers/food/snacks/grown/potato/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(iscablecoil(I))
		var/obj/item/stack/cable_coil/C = I
		if(!C.use(5))
			return

		to_chat(user, span_notice("你将一些电缆连接到土豆上，然后将其滑入电池外壳内。"))
		var/obj/item/cell/potato/pocell = new /obj/item/cell/potato(user.loc)
		pocell.maxcharge = potency * 10
		pocell.charge = pocell.maxcharge
		qdel(src)

	else if(istype(I, /obj/item/tool/kitchen/utensil/knife))
		new /obj/item/reagent_containers/food/snacks/rawsticks(src)
		to_chat(user, "你切好了土豆。")
		qdel(src)

/obj/item/reagent_containers/food/snacks/grown/grapes
	name = "bunch of grapes"
	desc = "营养丰富！"
	icon_state = "grapes"
	filling_color = "#A332AD"
	plantname = "grapes"

/obj/item/reagent_containers/food/snacks/grown/greengrapes
	name = "bunch of green grapes"
	desc = "营养丰富！"
	icon_state = "greengrapes"
	potency = 25
	filling_color = "#A6FFA3"
	plantname = "greengrapes"

/obj/item/reagent_containers/food/snacks/grown/peanut
	name = "peanut"
	desc = "该死！"
	icon_state = "peanut"
	filling_color = "857e27"
	potency = 25
	plantname = "peanut"

/obj/item/reagent_containers/food/snacks/grown/cabbage
	name = "cabbage"
	desc = "呃呃呃呃呃呃。卷心菜。"
	icon_state = "cabbage"
	potency = 25
	filling_color = "#A2B5A1"
	plantname = "cabbage"

/obj/item/reagent_containers/food/snacks/grown/berries
	name = "bunch of berries"
	desc = "营养丰富！"
	icon_state = "berrypile"
	filling_color = "#C2C9FF"
	plantname = "berries"

/obj/item/reagent_containers/food/snacks/grown/plastellium
	name = "clump of plastellium"
	desc = "嗯，需要处理一下"
	icon_state = "plastellium"
	filling_color = "#C4C4C4"
	plantname = "plastic"

/obj/item/reagent_containers/food/snacks/grown/glowberries
	name = "bunch of glow-berries"
	desc = "营养丰富！"
	var/brightness_on = 2 //luminosity when on
	filling_color = "#D3FF9E"
	icon_state = "glowberrypile"
	plantname = "glowberries"

/obj/item/reagent_containers/food/snacks/grown/cocoapod
	name = "cocoa pod"
	desc = "可研磨成可可粉。"
	icon_state = "cocoapod"
	potency = 50
	filling_color = "#9C8E54"
	plantname = "cocoa"

/obj/item/reagent_containers/food/snacks/grown/sugarcane
	name = "sugarcane"
	desc = "病态的甜腻。"
	icon_state = "sugarcane"
	potency = 50
	filling_color = "#C0C9AD"
	plantname = "sugarcane"

/obj/item/reagent_containers/food/snacks/grown/poisonberries
	name = "bunch of poison-berries"
	desc = "味道好到让你死而无憾！"
	icon_state = "poisonberrypile"
	gender = PLURAL
	potency = 15
	filling_color = "#B422C7"
	plantname = "poisonberries"

/obj/item/reagent_containers/food/snacks/grown/deathberries
	name = "bunch of death-berries"
	desc = "味道好到让你死而无憾！"
	icon_state = "deathberrypile"
	gender = PLURAL
	potency = 50
	filling_color = "#4E0957"
	plantname = "deathberries"

/obj/item/reagent_containers/food/snacks/grown/ambrosiavulgaris
	name = "ambrosia vulgaris branch"
	desc = "这是一种含有多种治疗化学物质的微毒性植物。"
	icon_state = "ambrosiavulgaris"
	potency = 10
	filling_color = "#125709"
	plantname = "ambrosia"

/obj/item/reagent_containers/food/snacks/grown/ambrosiadeus
	name = "ambrosia deus branch"
	desc = "这种植物既能刺激你，也能让你入睡。使用时请小心。"
	icon_state = "ambrosiadeus"
	potency = 10
	filling_color = "#229E11"
	plantname = "ambrosiadeus"

/obj/item/reagent_containers/food/snacks/grown/apple
	name = "apple"
	desc = "这是一小片伊甸园。"
	icon_state = "apple"
	potency = 15
	filling_color = "#DFE88B"
	plantname = "apple"

/obj/item/reagent_containers/food/snacks/grown/apple/poisoned
	name = "apple"
	desc = "这是一小片伊甸园。"
	icon_state = "apple"
	potency = 15
	filling_color = "#B3BD5E"
	plantname = "poisonapple"

/obj/item/reagent_containers/food/snacks/grown/goldapple
	name = "golden apple"
	desc = "苹果上刻着'卡利斯蒂'这个词。"
	icon_state = "goldapple"
	potency = 15
	filling_color = "#F5CB42"
	plantname = "goldapple"

/obj/item/reagent_containers/food/snacks/grown/watermelon
	name = "watermelon"
	desc = "里面装满了水润精华。"
	icon_state = "watermelon"
	potency = 10
	filling_color = "#FA2863"
	slice_path = /obj/item/reagent_containers/food/snacks/watermelonslice
	slices_num = 5
	plantname = "watermelon"

/obj/item/reagent_containers/food/snacks/grown/pumpkin
	name = "pumpkin"
	desc = "它体型庞大，令人恐惧。"
	icon_state = "pumpkin"
	potency = 10
	filling_color = "#FAB728"
	plantname = "pumpkin"

/obj/item/reagent_containers/food/snacks/grown/pumpkin/attackby(obj/item/I, mob/user, param)
	. = ..()
	if(.)
		return

	if(I.sharp == IS_SHARP_ITEM_ACCURATE || I.sharp == IS_SHARP_ITEM_BIG)
		to_chat(user, span_notice("你在[src]上刻了一张脸！"))
		new /obj/item/clothing/head/pumpkinhead(user.loc)
		qdel(src)

/obj/item/reagent_containers/food/snacks/grown/lime
	name = "lime"
	desc = "太酸了，你的脸都会扭曲。"
	icon_state = "lime"
	potency = 20
	filling_color = "#28FA59"
	plantname = "lime"

/obj/item/reagent_containers/food/snacks/grown/lemon
	name = "lemon"
	desc = "当生活给你柠檬时，要庆幸它们不是酸橙。"
	icon_state = "lemon"
	potency = 20
	filling_color = "#FAF328"
	plantname = "lemon"

/obj/item/reagent_containers/food/snacks/grown/orange
	name = "orange"
	desc = "这是一种味道浓烈的水果。"
	icon_state = "orange"
	potency = 20
	filling_color = "#FAAD28"
	plantname = "orange"

/obj/item/reagent_containers/food/snacks/grown/whitebeet
	name = "white-beet"
	desc = "你打不过白甲虫。"
	icon_state = "whitebeet"
	potency = 15
	filling_color = "#FFFCCC"
	plantname = "whitebeet"

/obj/item/reagent_containers/food/snacks/grown/banana
	name = "banana"
	desc = "这是绝佳的喜剧道具。"
	icon_state = "banana"
	worn_icon_state = "banana"
	filling_color = "#FCF695"
	trash = /obj/item/bananapeel
	plantname = "banana"

/obj/item/reagent_containers/food/snacks/grown/chili
	name = "chili"
	desc = "好辣！等等……它在烧我！！"
	icon_state = "chilipepper"
	filling_color = "#FF0000"
	plantname = "chili"

/obj/item/reagent_containers/food/snacks/grown/eggplant
	name = "eggplant"
	desc = "里面说不定有只鸡？"
	icon_state = "eggplant"
	filling_color = "#550F5C"
	plantname = "eggplant"

/obj/item/reagent_containers/food/snacks/grown/soybeans
	name = "soybeans"
	desc = "味道很淡，但可能性无限……"
	gender = PLURAL
	filling_color = "#E6E8B7"
	icon_state = "soybeans"
	plantname = "soybean"

/obj/item/reagent_containers/food/snacks/grown/tomato
	name = "tomato"
	desc = "我说'番茄'，你说'西红柿'。"
	icon_state = "tomato"
	filling_color = "#FF0000"
	potency = 10
	plantname = "tomato"

/obj/item/reagent_containers/food/snacks/grown/tomato/throw_impact(atom/hit_atom)
	. = ..()
	if(!.)
		return
	new/obj/effect/decal/cleanable/tomato_smudge(src.loc)
	src.visible_message(span_notice("[src.name]已被压扁。"),span_moderate("You hear a smack."))
	qdel(src)


/obj/item/reagent_containers/food/snacks/grown/killertomato
	name = "killer-tomato"
	desc = "我说'番茄'，你说'番茄'……哦天哪它在啃我的腿！！"
	icon_state = "killertomato"
	filling_color = "#FF0000"
	potency = 30
	plantname = "killertomato"

/obj/item/reagent_containers/food/snacks/grown/bloodtomato
	name = "blood-tomato"
	desc = "太血腥了……太……太……血腥了……啊啊啊！！！！"
	icon_state = "bloodtomato"
	potency = 10
	filling_color = "#FF0000"
	plantname = "bloodtomato"

/obj/item/reagent_containers/food/snacks/grown/bloodtomato/throw_impact(atom/hit_atom)
	. = ..()
	if(!.)
		return
	new/obj/effect/decal/cleanable/blood/splatter(src.loc)
	src.visible_message(span_notice("[src.name]已被压扁。"),span_moderate("You hear a smack."))
	src.reagents.reaction(get_turf(hit_atom))
	for(var/atom/A in get_turf(hit_atom))
		src.reagents.reaction(A)
	qdel(src)


/obj/item/reagent_containers/food/snacks/grown/bluetomato
	name = "blue-tomato"
	desc = "我说蓝莓，你说蓝莓。"
	icon_state = "bluetomato"
	potency = 10
	filling_color = "#586CFC"
	plantname = "bluetomato"

/obj/item/reagent_containers/food/snacks/grown/bluetomato/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/slippery, 0.8 SECONDS, 0.5 SECONDS)

/obj/item/reagent_containers/food/snacks/grown/bluetomato/throw_impact(atom/hit_atom)
	. = ..()
	if(!.)
		return
	new/obj/effect/decal/cleanable/blood/oil(src.loc)
	src.visible_message(span_notice("[src.name]已被压扁。"),span_moderate("You hear a smack."))
	src.reagents.reaction(get_turf(hit_atom))
	for(var/atom/A in get_turf(hit_atom))
		src.reagents.reaction(A)
	qdel(src)

/obj/item/reagent_containers/food/snacks/grown/wheat
	name = "wheat"
	desc = "唉……小麦……谷物？"
	gender = PLURAL
	icon_state = "wheat"
	filling_color = "#F7E186"
	plantname = "wheat"

/obj/item/reagent_containers/food/snacks/grown/ricestalk
	name = "rice stalk"
	desc = "见到你很高兴。"
	gender = PLURAL
	icon_state = "rice"
	filling_color = "#FFF8DB"
	plantname = "rice"

/obj/item/reagent_containers/food/snacks/grown/kudzupod
	name = "kudzu pod"
	desc = "<I>葛藤</I>：一种入侵物种，其藤蔓会迅速蔓延并缠绕接触到的任何物体。"
	icon_state = "kudzupod"
	filling_color = "#59691B"
	plantname = "kudzu"

/obj/item/reagent_containers/food/snacks/grown/icepepper
	name = "ice-pepper"
	desc = "这是一种突变品种的辣椒"
	icon_state = "icepepper"
	potency = 20
	filling_color = "#66CEED"
	plantname = "icechili"

/obj/item/reagent_containers/food/snacks/grown/carrot
	name = "carrot"
	desc = "对眼睛有好处！"
	icon_state = "carrot"
	potency = 10
	filling_color = "#FFC400"
	plantname = "carrot"

/obj/item/reagent_containers/food/snacks/grown/mushroom/reishi
	name = "reishi"
	desc = "<I>灵芝</I>：一种被认为有助于缓解压力的特殊真菌。"
	icon_state = "reishi"
	potency = 10
	filling_color = "#FF4800"
	plantname = "reishi"

/obj/item/reagent_containers/food/snacks/grown/mushroom/amanita
	name = "fly amanita"
	desc = "<I>毒蝇伞</I>：熟记有毒蘑菇。只采摘你认识的蘑菇。"
	icon_state = "amanita"
	potency = 10
	filling_color = "#FF0000"
	plantname = "amanita"

/obj/item/reagent_containers/food/snacks/grown/mushroom/angel
	name = "destroying angel"
	desc = "<I>毒蝇伞</I>：充满阿尔法毒伞肽的剧毒担子菌门真菌。"
	icon_state = "angel"
	potency = 35
	filling_color = "#FFDEDE"
	plantname = "destroyingangel"

/obj/item/reagent_containers/food/snacks/grown/mushroom/libertycap
	name = "liberty-cap"
	desc = "<I>裸盖菇</I>：解放你自己！"
	icon_state = "libertycap"
	potency = 15
	filling_color = "#F714BE"
	plantname = "libertycap"

/obj/item/reagent_containers/food/snacks/grown/mushroom/plumphelmet
	name = "plump-helmet"
	desc = "<I>普卢姆斯·赫尔姆斯</I>：圆润、柔软，而且如此诱人~"
	icon_state = "plumphelmet"
	filling_color = "#F714BE"
	plantname = "plumphelmet"

/obj/item/reagent_containers/food/snacks/grown/mushroom/walkingmushroom
	name = "walking mushroom"
	desc = "<I>羽翼行者</I>：伟大行走的开端。"
	icon_state = "walkingmushroom"
	filling_color = "#FFBFEF"
	potency = 30
	plantname = "walkingmushroom"

/obj/item/reagent_containers/food/snacks/grown/mushroom/chanterelle
	name = "chanterelle cluster"
	desc = "<I>鸡油菌</I>：这些欢快的黄色小蘑菇看起来真美味！"
	icon_state = "chanterelle"
	filling_color = "#FFE991"
	plantname = "mushrooms"

/obj/item/reagent_containers/food/snacks/grown/mushroom/glowshroom
	name = "glowshroom cluster"
	desc = "<I>布雷格普罗克斯小菇</I>：这种蘑菇会在黑暗中发光。真的吗？"
	icon_state = "glowshroom"
	filling_color = "#DAFF91"
	potency = 30
	plantname = "glowshroom"

/obj/item/reagent_containers/food/snacks/grown/mushroom/glowshroom/attack_self(mob/user as mob)
	if(istype(user.loc,/turf/open/space))
		return
	var/obj/structure/glowshroom/planted = new /obj/structure/glowshroom(user.loc)

	planted.delay = 50
	planted.endurance = 100
	planted.potency = potency
	qdel(src)

	to_chat(user, span_notice("你种下了发光蘑菇。"))


// *************************************
// Complex Grown Object Defines -
// Putting these at the bottom so they don't clutter the list up. -Cheridan
// *************************************

/obj/item/reagent_containers/food/snacks/grown/bluespacetomato
	name = "blue-space tomato"
	desc = "润滑得如此彻底，你可能会滑穿时空。"
	icon_state = "bluespacetomato"
	potency = 20
	filling_color = "#91F8FF"
	plantname = "bluespacetomato"

/obj/item/reagent_containers/food/snacks/grown/bluespacetomato/throw_impact(atom/hit_atom)
	. = ..()
	if(!.)
		return
	var/mob/M = usr
	var/outer_teleport_radius = potency/10 //Plant potency determines radius of teleport.
	var/inner_teleport_radius = potency/15
	var/list/turfs = list()
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	if(inner_teleport_radius < 1) //Wasn't potent enough, it just splats.
		new/obj/effect/decal/cleanable/blood/oil(src.loc)
		src.visible_message(span_notice("[src.name]已被压扁。"),span_moderate("You hear a smack."))
		qdel(src)
		return
	for(var/turf/T in orange(M,outer_teleport_radius))
		if(T in orange(M,inner_teleport_radius)) continue
		if(istype(T,/turf/open/space)) continue
		if(T.density) continue
		if(T.x>world.maxx-outer_teleport_radius || T.x<outer_teleport_radius)	continue
		if(T.y>world.maxy-outer_teleport_radius || T.y<outer_teleport_radius)	continue
		turfs += T
	if(!length(turfs))
		var/list/turfs_to_pick_from = list()
		for(var/turf/T in orange(M,outer_teleport_radius))
			if(!(T in orange(M,inner_teleport_radius)))
				turfs_to_pick_from += T
		turfs += pick(/turf in turfs_to_pick_from)
	var/turf/picked = pick(turfs)
	if(!isturf(picked)) return
	switch(rand(1,2))//Decides randomly to teleport the thrower or the throwee.
		if(1) // Teleports the person who threw the tomato.
			s.set_up(3, 1, M)
			s.start()
			new/obj/effect/decal/cleanable/molten_item(M.loc) //Leaves a pile of goo behind for dramatic effect.
			M.loc = picked //
			s.set_up(3, 1, M)
			s.start() //Two set of sparks, one before the teleport and one after.
		if(2) //Teleports mob the tomato hit instead.
			for(var/mob/A in get_turf(hit_atom))//For the mobs in the tile that was hit...
				s.set_up(3, 1, A)
				s.start()
				new/obj/effect/decal/cleanable/molten_item(A.loc) //Leave a pile of goo behind for dramatic effect...
				A.loc = picked//And teleport them to the chosen location.
				s.set_up(3, 1, A)
				s.start()
	new/obj/effect/decal/cleanable/blood/oil(src.loc)
	src.visible_message(span_notice("[src.name] 已被压扁，导致时空扭曲。"),span_moderate("You hear a splat and a crackle."))
	qdel(src)

