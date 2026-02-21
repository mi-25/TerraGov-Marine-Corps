//Food items that are eaten normally and don't leave anything behind.
/obj/item/reagent_containers/food/snacks/burger
	icon = 'icons/obj/items/food/burgers.dmi'
	icon_state = "hburger"
	bitesize = 3
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("bun" = 2, "beef patty" = 4)

/obj/item/reagent_containers/food/snacks/burger/fishburger
	name = "鱼排三明治"
	desc = "就像有鲤鱼在某个地方叫喊……把我的鱼肉汉堡还给我，把那条鲤鱼给我。"
	icon_state = "fishburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("bun" = 4, "fish" = 4)

/obj/item/reagent_containers/food/snacks/burger/tofu
	name = "豆腐汉堡"
	desc = "那..是什么肉？"
	icon_state = "tofuburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("bun" = 4, "tofu" = 4)

/obj/item/reagent_containers/food/snacks/burger/roburger
	name = "轨道轰炸"
	desc = "生菜是唯一的有机成分。哔。"
	icon_state = "roburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("bun" = 4, "lettuce" = 2, "sludge" = 1)


/obj/item/reagent_containers/food/snacks/burger/roburgerbig
	name = "roburger"
	desc = "这块巨大的肉饼看起来像是有毒。哔。"
	icon_state = "roburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 11, /datum/reagent/consumable/nutriment/vitamin = 15)
	tastes = list("bun" = 4, "lettuce" = 2, "sludge" = 1)


/obj/item/reagent_containers/food/snacks/burger/appendix
	name = "附录汉堡"
	desc = "尝起来像阑尾炎。"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 6)
	icon_state = "appendixburger"
	tastes = list("bun" = 4, "grass" = 2)

/obj/item/reagent_containers/food/snacks/burger/xeno
	name = "异形汉堡"
	desc = "闻起来有腐蚀性。尝起来像异端。"
	icon_state = "xburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("bun" = 4, "acid" = 4)


/obj/item/reagent_containers/food/snacks/burger/human
	name = "人肉汉堡"
	desc = "一个血淋淋的汉堡。"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("bun" = 2, "long pig" = 4)

/obj/item/reagent_containers/food/snacks/burger/bearger
	name = "蛮牛"
	desc = "生吃最美味。"
	icon_state = "bearger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 5)

/obj/item/reagent_containers/food/snacks/burger/clown
	name = "小丑汉堡"
	desc = "这味道有点怪……"
	icon_state = "clownburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 6)


/obj/item/reagent_containers/food/snacks/burger/mime
	name = "默剧汉堡"
	desc = "它的味道无法用语言形容。"
	icon_state = "mimeburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/protein = 9, /datum/reagent/consumable/nutriment/vitamin = 4, /datum/reagent/consumable/nothing = 6)

/obj/item/reagent_containers/food/snacks/burger/brain
	name = "脑浆汉堡"
	desc = "一个长相奇特的汉堡。它看起来几乎是有知觉的。"
	icon_state = "brainburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/medicine/alkysine = 6, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/consumable/nutriment/protein = 6)
	tastes = list("bun" = 4, "brains" = 2)

/obj/item/reagent_containers/food/snacks/burger/red
	name = "红汉堡"
	desc = "完美掩盖它已烧成焦炭的事实。"
	icon_state = "cburger"
	color = COLOR_RED
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 4)

/obj/item/reagent_containers/food/snacks/burger/orange
	name = "橙色汉堡"
	desc = "不含果汁。"
	icon_state = "cburger"
	color = COLOR_ORANGE
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 4)

/obj/item/reagent_containers/food/snacks/burger/yellow
	name = "黄色汉堡"
	desc = "明亮直至最后一刻。"
	icon_state = "cburger"
	color = COLOR_YELLOW
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 4)

/obj/item/reagent_containers/food/snacks/burger/green
	name = "绿色汉堡"
	desc = "这不是腐肉，是彩绘肉！"
	icon_state = "cburger"
	color = COLOR_GREEN
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 4)

/obj/item/reagent_containers/food/snacks/burger/blue
	name = "蓝色汉堡"
	desc = "这蓝色稀有吗？"
	icon_state = "cburger"
	color = COLOR_BLUE
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 4)

/obj/item/reagent_containers/food/snacks/burger/purple
	name = "紫色汉堡"
	desc = "既高贵又低俗。"
	icon_state = "cburger"
	color = COLOR_PURPLE
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 4)

/obj/item/reagent_containers/food/snacks/burger/black
	name = "黑汉堡"
	desc = "这煮过头了。"
	icon_state = "cburger"
	color = COLOR_ALMOST_BLACK
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 4)

/obj/item/reagent_containers/food/snacks/burger/white
	name = "白堡"
	desc = "美味的钛合金！"
	icon_state = "cburger"
	color = COLOR_WHITE
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 4)

/obj/item/reagent_containers/food/snacks/burger/spell
	name = "法术 汉堡"
	desc = "这绝对是艾·纳斯。"
	icon_state = "spellburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 10)
	tastes = list("bun" = 4, "magic" = 2)

/obj/item/reagent_containers/food/snacks/burger/bigbite
	name = "巨无霸汉堡"
	desc = "忘掉巨无霸吧。这才是未来！"
	icon_state = "bigbiteburger"
	filling_color = "#E3D681"
	list_reagents = list(/datum/reagent/consumable/nutriment = 14, /datum/reagent/consumable/sodiumchloride = 2)
	bitesize = 3
	tastes = list("bun" = 4)

/obj/item/reagent_containers/food/snacks/burger/jelly
	name = "果冻汉堡"
	desc = "烹饪佳肴..？"
	icon_state = "jellyburger"
	tastes = list("bun" = 4, "jelly" = 2)

/obj/item/reagent_containers/food/snacks/burger/jelly/slime
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 6)

/obj/item/reagent_containers/food/snacks/burger/jelly/cherry
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/cherryjelly = 6, /datum/reagent/consumable/nutriment/vitamin = 6)

/obj/item/reagent_containers/food/snacks/burger/fivealarm
	name = "五级警报汉堡"
	desc = "烫！烫！"
	icon_state = "fivealarmburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/capsaicin = 5, /datum/reagent/consumable/capsaicin/condensed = 5, /datum/reagent/consumable/nutriment/vitamin = 6)

/obj/item/reagent_containers/food/snacks/burger/rat
	name = "鼠肉汉堡"
	desc = "基本如你所料..."
	icon_state = "ratburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 2)

/obj/item/reagent_containers/food/snacks/burger/baseball
	name = "本垒打棒球汉堡"
	desc = "它还是温热的。冒出的蒸汽看起来像棒球。"
	icon_state = "baseball"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 2)

/obj/item/reagent_containers/food/snacks/burger/baconburger
	name = "培根汉堡"
	desc = "所有美国元素的完美结合。"
	icon_state = "baconburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("bacon" = 4, "bun" = 2)

/obj/item/reagent_containers/food/snacks/burger/empoweredburger
	name = "强化汉堡"
	desc = "真是令人震惊的美味，如果你靠电力维生的话。"
	icon_state = "empoweredburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("bun" = 2, "pure electricity" = 4)

/obj/item/reagent_containers/food/snacks/burger/catburger
	name = "猫肉汉堡"
	desc = "终于这些猫和猫人派上用场了！"
	icon_state = "catburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/protein = 3, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("bun" = 4, "meat" = 2, "cat" = 2)

/obj/item/reagent_containers/food/snacks/burger/crab
	name = "蟹肉汉堡"
	desc = "一块美味的蟹肉饼，夹在面包中间。"
	icon_state = "crabburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("bun" = 2, "crab meat" = 4)

/obj/item/reagent_containers/food/snacks/burger/soylent
	name = "索伦特汉堡"
	desc = "一款使用升级再造的低价值生物质制成的环保汉堡。"
	icon_state = "soylentburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("bun" = 2, "assistant" = 4)

/obj/item/reagent_containers/food/snacks/burger/cheese
	name = "芝士汉堡"
	desc = "这个高贵的汉堡骄傲地披着金色的奶酪外衣。"
	icon_state = "cheeseburger"
	tastes = list("bun" = 2, "beef patty" = 4, "cheese" = 3)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 7, /datum/reagent/consumable/nutriment/vitamin = 2)

/obj/item/reagent_containers/food/snacks/burger/cheese/Initialize(mapload)
	. = ..()
	if(prob(33))
		icon_state = "cheeseburgeralt"

/obj/item/reagent_containers/food/snacks/burger/chicken
	name = "鸡肉三明治" //Apparently the proud people of Americlapstan object to this thing being called a burger. Apparently McDonald's just calls it a burger in Europe as to not scare and confuse us.
	desc = "一份美味的鸡肉三明治，据说这款美食的收益被用于将太空边疆地区的缴械行为定为犯罪。"
	icon_state = "chickenburger"
	tastes = list("bun" = 2, "chicken" = 4, "God's covenant" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 7, /datum/reagent/consumable/nutriment/vitamin = 1)

/obj/item/reagent_containers/food/snacks/burger/crazy
	name = "疯狂汉堡"
	desc = "这看起来像是某个穿着风衣的疯癫小丑会做出来的食物。"
	icon_state = "crazyburger"
	tastes = list("bun" = 2, "beef patty" = 4, "cheese" = 2, "beef soaked in chili" = 3, "a smoking flare" = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/capsaicin = 3, /datum/reagent/consumable/capsaicin/condensed = 3, /datum/reagent/consumable/nutriment/vitamin = 6)

// empty burger you can customize
/obj/item/reagent_containers/food/snacks/burger/empty
	name = "汉堡"
	icon_state = "custburg"
	tastes = list("bun")
	desc = "一个疯狂厨师制作的疯狂定制汉堡。"

/obj/item/reagent_containers/food/snacks/burger/plain
	name = "汉堡"
	desc = "每顿营养早餐的基石。"
	icon_state = "hburger"
	filling_color = "#D63C3C"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	tastes = list("bun" = 4, "meat" = 2)
	bitesize = 2

/obj/item/reagent_containers/food/snacks/burger/plain/Initialize(mapload)
	. = ..()
	if(prob(1))
		playsound(src, 'sound/effects/smoke.ogg', 50, TRUE)
		visible_message(span_warning("哦，天哪！[src] 被毁了！但是，如果……？"))
		name = "蒸火腿"
		desc = pick("Ahh, CMO, welcome. I hope you're prepared for an unforgettable luncheon!",
		"And you call these steamed hams despite the fact that they are obviously microwaved?",
		"TGMC Marine Corp? At this time of shift, in this time of year, in this sector of space, localized entirely within your freezer?",
		"You know, these hamburgers taste quite similar to the ones they have at the Maltese Falcon.")

/obj/item/reagent_containers/food/snacks/burger/packaged_burger
	name = "包装芝士汉堡"
	desc = "一份湿漉漉的微波汉堡。包装上没有标明加热时间。由纳米传讯公司包装。"
	icon = 'icons/obj/items/food/mre.dmi'
	icon_state = "burger"
	bitesize = 3
	package = TRUE
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/sodiumchloride = 2)
	tastes = list("bun" = 4, "soy protein" = 2) //Cheap fridge burgers.

/obj/item/reagent_containers/food/snacks/burger/packaged_burger/attack_self(mob/user as mob)
	if (package)
		playsound(src.loc,'sound/effects/pageturn2.ogg', 15, 1)
		to_chat(user, span_notice("你撕开了软乎乎的汉堡包装纸！"))
		package = FALSE
		icon = 'icons/obj/items/food/burgers.dmi'
		icon_state = "hburger"

// Human Burger + cheese wedge = cheeseburger
/obj/item/reagent_containers/food/snacks/burger/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/reagent_containers/food/snacks/cheesewedge))
		new /obj/item/reagent_containers/food/snacks/burger/cheese(src)
		to_chat(user, "你做了一个芝士汉堡。")
		qdel(I)
		qdel(src)


// Burger + cheese wedge = cheeseburger
/obj/item/reagent_containers/food/snacks/burger/plain/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/reagent_containers/food/snacks/cheesewedge))
		new /obj/item/reagent_containers/food/snacks/burger/cheese(src)
		to_chat(user, "你制作了一个芝士汉堡。")
		qdel(I)
		qdel(src)

/obj/item/reagent_containers/food/snacks/burger/human
	name = "汉堡"
	desc = "一个血淋淋的汉堡。"
	icon_state = "hburger"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	tastes = list("bun" = 4, "tender meat" = 2)
	bitesize = 2

/obj/item/reagent_containers/food/snacks/burger/bun
	name = "包子"
	desc = "任何一款像样的汉堡的基础。"
	icon_state = "bun"
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 4)
	tastes = list("bun" = 1) // the bun tastes of bun.

/obj/item/reagent_containers/food/snacks/burger/bun/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return
	// Bun + meatball = burger
	if(istype(I, /obj/item/reagent_containers/food/snacks/meatball))
		new /obj/item/reagent_containers/food/snacks/burger/plain(src)
		to_chat(user, "你做了一个汉堡。")
		qdel(I)
		qdel(src)

	// Bun + cutlet = hamburger
	else if(istype(I, /obj/item/reagent_containers/food/snacks/cutlet))
		new /obj/item/reagent_containers/food/snacks/burger/plain(src)
		to_chat(user, "你做了一个汉堡。")
		qdel(I)
		qdel(src)

	// Bun + sausage = hotdog
	else if(istype(I, /obj/item/reagent_containers/food/snacks/sausage))
		new /obj/item/reagent_containers/food/snacks/hotdog(src)
		to_chat(user, "你做了一个热狗。")
		qdel(I)
		qdel(src)

/obj/item/reagent_containers/food/snacks/burger/superbite
	name = "超级巨无霸汉堡"
	desc = "这汉堡堆得像座山。食物！"
	icon_state = "superbiteburger"
	filling_color = "#CCA26A"
	bitesize = 7
	volume = 100
	list_reagents = list(/datum/reagent/consumable/nutriment = 25, /datum/reagent/consumable/nutriment/protein = 40, /datum/reagent/consumable/nutriment/vitamin = 12)
	tastes = list("bun" = 4, "type two diabetes" = 10, "grease" = 1)

/obj/item/reagent_containers/food/snacks/burger/ghostburger
	name = "幽灵汉堡"
	desc = "吓人！看起来不太管饱。"
	icon = 'icons/obj/items/food/burgers.dmi'
	icon_state = "ghostburger"
	filling_color = "#FFF2FF"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	bitesize = 2
	tastes = list("bun" = 4, "ectoplasm" = 2)
