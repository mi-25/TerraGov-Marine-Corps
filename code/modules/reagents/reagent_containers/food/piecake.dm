//Food items that are eaten normally and don't leave anything behind.
/obj/item/reagent_containers/food/snacks/pastries
	name = "零食"
	desc = "美味"
	icon = 'icons/obj/items/food/piecake.dmi'
	icon_state = null

/obj/item/reagent_containers/food/snacks/sliceable/pastries
	name = "零食"
	desc = "美味"
	icon = 'icons/obj/items/food/piecake.dmi'
	icon_state = null

/obj/item/reagent_containers/food/snacks/pastries/pie
	name = "香蕉奶油派"
	desc = "就像回到了家乡，小丑星球！HONK！"
	icon_state = "pie"
	trash = /obj/item/trash/plate
	filling_color = "#FBFFB8"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/banana = 5)
	tastes = list("pie" = 1)
	bitesize = 3

/obj/item/reagent_containers/food/snacks/pastries/pie/throw_impact(atom/hit_atom)
	. = ..()
	if(!.)
		return
	new /obj/effect/decal/cleanable/pie_smudge(loc)
	visible_message(span_warning("[src.name] 啪嗒一声。"),span_warning("You hear a splat."))
	qdel(src)

/obj/item/reagent_containers/food/snacks/pastries/berryclafoutis
	name = "浆果克拉芙缇"
	desc = "没有黑鸟，这是个好兆头。"
	icon_state = "berryclafoutis"
	trash = /obj/item/trash/plate
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/berryjuice = 5)
	tastes = list("pie" = 1, "blackberries" = 1)
	bitesize = 3

/obj/item/reagent_containers/food/snacks/pastries/bearypie
	name = "熊派"
	desc = "没有棕熊，这是个好兆头。"
	icon_state = "bearypie"
	list_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("pie" = 1, "meat" = 1, "salmon" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/carrotcake
	name = "胡萝卜蛋糕"
	desc = "某只狡猾兔子的最爱甜点。不是谎言。"
	icon_state = "carrotcake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/carrotcakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 25, /datum/reagent/consumable/carrotjuice = 10)
	filling_color = "#FFD675"
	tastes = list("cake" = 5, "sweetness" = 2, "carrot" = 1)

/obj/item/reagent_containers/food/snacks/pastries/carrotcakeslice
	name = "胡萝卜蛋糕切片"
	desc = "胡萝卜蛋糕切片，胡萝卜对眼睛有益！这可不是谎言。"
	icon_state = "carrotcake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#FFD675"
	bitesize = 2
	tastes = list("cake" = 5, "sweetness" = 2, "carrot" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/braincake
	name = "脑蛋糕"
	desc = "一个软趴趴的蛋糕状物体。"
	icon_state = "braincake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/braincakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 25, /datum/reagent/medicine/alkysine = 10)
	filling_color = "#E6AEDB"
	tastes = list("cake" = 5, "sweetness" = 2, "brains" = 1)

/obj/item/reagent_containers/food/snacks/pastries/braincakeslice
	name = "脑蛋糕切片"
	desc = "让我告诉你关于朊病毒的事。它们可美味了。"
	icon_state = "braincakeslice"
	trash = /obj/item/trash/plate
	filling_color = "#E6AEDB"
	bitesize = 2
	tastes = list("cake" = 5, "sweetness" = 2, "brains" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/cheesecake
	name = "芝士蛋糕"
	desc = "极度危险。"
	icon_state = "cheesecake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/cheesecakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 25)
	filling_color = "#FAF7AF"
	tastes = list("cake" = 4, "cream cheese" = 3)

/obj/item/reagent_containers/food/snacks/pastries/cheesecakeslice
	name = "芝士蛋糕切片"
	desc = "纯正奶酪满足感"
	icon_state = "cheesecake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#FAF7AF"
	bitesize = 2
	tastes = list("cake" = 4, "cream cheese" = 3)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/plaincake
	name = "香草蛋糕"
	desc = "一个普通的蛋糕，不是谎言。"
	icon_state = "plaincake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/plaincakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 20)
	filling_color = "#F7EDD5"
	tastes = list("vanilla" = 1, "sweetness" = 2,"cake" = 5)

/obj/item/reagent_containers/food/snacks/pastries/plaincakeslice
	name = "香草蛋糕切片"
	desc = "只是一块蛋糕，足够大家分了。"
	icon_state = "plaincake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#F7EDD5"
	bitesize = 2
	tastes = list("vanilla" = 1, "sweetness" = 2,"cake" = 5)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/orangecake
	name = "橙色蛋糕"
	desc = "添加了橙子的蛋糕。"
	icon_state = "orangecake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/orangecakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 20)
	filling_color = "#FADA8E"
	tastes = list("cake" = 5, "sweetness" = 2, "oranges" = 2)

/obj/item/reagent_containers/food/snacks/pastries/orangecakeslice
	name = "橙子蛋糕切片"
	desc = "只是一块蛋糕，足够大家分了。"
	icon_state = "orangecake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#FADA8E"
	bitesize = 2
	tastes = list("cake" = 5, "sweetness" = 2, "oranges" = 2)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/limecake
	name = "青柠蛋糕"
	desc = "添加了青柠的蛋糕。"
	icon_state = "limecake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/limecakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 20)
	filling_color = "#CBFA8E"
	tastes = list("cake" = 5, "sweetness" = 2, "unbearable sourness" = 2)

/obj/item/reagent_containers/food/snacks/pastries/limecakeslice
	name = "青柠蛋糕切片"
	desc = "只是一块蛋糕，足够大家分享。"
	icon_state = "limecake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#CBFA8E"
	bitesize = 2
	tastes = list("cake" = 5, "sweetness" = 2, "unbearable sourness" = 2)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/lemoncake
	name = "柠檬蛋糕"
	desc = "添加了柠檬的蛋糕。"
	icon_state = "lemoncake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/lemoncakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 20)
	filling_color = "#FAFA8E"
	tastes = list("cake" = 5, "sweetness" = 2, "sourness" = 2)

/obj/item/reagent_containers/food/snacks/pastries/lemoncakeslice
	name = "柠檬蛋糕切片"
	desc = "只是一块蛋糕，足够大家分了。"
	icon_state = "lemoncake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#FAFA8E"
	bitesize = 2
	tastes = list("cake" = 5, "sweetness" = 2, "sourness" = 2)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/chocolatecake
	name = "巧克力蛋糕"
	desc = "添加了巧克力的蛋糕"
	icon_state = "chocolatecake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/chocolatecakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 20)
	filling_color = "#805930"
	tastes = list("cake" = 5, "sweetness" = 1, "chocolate" = 4)

/obj/item/reagent_containers/food/snacks/pastries/chocolatecakeslice
	name = "巧克力蛋糕切片"
	desc = "只是一块蛋糕，足够大家分了。"
	icon_state = "chocolatecake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#805930"
	bitesize = 2
	tastes = list("cake" = 5, "sweetness" = 1, "chocolate" = 4)


/obj/item/reagent_containers/food/snacks/sliceable/pastries/birthdaycake
	name = "生日蛋糕"
	desc = "生日快乐..."
	icon_state = "birthdaycake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/birthdaycakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/sprinkles = 10)
	filling_color = "#FFD6D6"
	tastes = list("cake" = 5, "sweetness" = 1)

/obj/item/reagent_containers/food/snacks/pastries/birthdaycakeslice
	name = "生日蛋糕切片"
	desc = "一片你的生日蛋糕"
	icon_state = "birthdaycakeslice"
	trash = /obj/item/trash/plate
	filling_color = "#FFD6D6"
	bitesize = 2
	tastes = list("cake" = 5, "sweetness" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/birthdaycake/energy
	name = "能量蛋糕"
	desc = "足够一整支核弹特工小队的热量。"
	icon_state = "energycake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/energycakeslice
	hitsound = 'sound/weapons/blade1.ogg'
	list_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/sprinkles = 10, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("cake" = 3, "a Vlad's Salad" = 1)

/obj/item/reagent_containers/food/snacks/pastries/energycakeslice
	name = "生日蛋糕切片"
	desc = "一片你的生日蛋糕"
	icon_state = "energycakeslice"
	trash = /obj/item/trash/plate
	filling_color = "#FFD6D6"
	bitesize = 2
	tastes = list("cake" = 5, "sweetness" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/applecakes
	name = "苹果蛋糕"
	desc = "以苹果为中心装饰的蛋糕。"
	icon_state = "applecake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/applecakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 10)
	tastes = list("cake" = 5, "sweetness" = 1, "apple" = 1)

/obj/item/reagent_containers/food/snacks/pastries/applecakeslice
	name = "苹果蛋糕切片"
	desc = "一片苹果蛋糕。"
	icon_state = "applecakeslice"
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 10)
	tastes = list("cake" = 5, "sweetness" = 1, "apple" = 1)

/obj/item/reagent_containers/food/snacks/pastries/sliceableslimecake
	name = "史莱姆蛋糕"
	desc = "用史莱姆做的蛋糕。可能没通电。"
	icon_state = "slimecake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/slimecakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("cake" = 5, "sweetness" = 1, "slime" = 1)

/obj/item/reagent_containers/food/snacks/pastries/slimecakeslice
	name = "史莱姆蛋糕"
	desc = "用史莱姆制成的蛋糕切片。对你的健康只有略微改善。"
	icon_state = "slimecake_slice"
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("cake" = 5, "sweetness" = 1, "slime" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/pumpkinspicecake
	name = "南瓜香料蛋糕"
	desc = "空心蛋糕，内含真南瓜。"
	icon_state = "pumpkinspicecake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/pumpkinspicecakesslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("cake" = 5, "sweetness" = 1, "pumpkin" = 1)

/obj/item/reagent_containers/food/snacks/pastries/pumpkinspicecakesslice
	name = "南瓜香料蛋糕切片"
	desc = "一片香辣美味的南瓜派。"
	icon_state = "pumpkinspicecakeslice"
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("cake" = 5, "sweetness" = 1, "pumpkin" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/bsvc
	name = "黑莓草莓香草蛋糕"
	desc = "一块普通蛋糕，里面填满了黑莓和草莓的混合馅料！"
	icon_state = "blackbarry_strawberries_cake_vanilla_cake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/pumpkinspicecakesslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("blackberry" = 2, "strawberries" = 2, "vanilla" = 2, "sweetness" = 2, "cake" = 3)

/obj/item/reagent_containers/food/snacks/pastries/bsvcslice
	name = "草莓巧克力蛋糕切片"
	desc = "一块蛋糕切片，上面点缀着五颗草莓。不知为何，这种蛋糕的摆盘方式对 SELF 中的人工智能来说，具有一种特别的视觉吸引力。" //yes, I know the one referenced has cherries, but I'm not implementing a new cake today.
	icon_state = "liars_slice"
	tastes = list("strawberries" = 2, "chocolate" = 2, "sweetness" = 2, "cake" = 3)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/holy_cake
	name = "天使蛋糕"
	desc = "为天使和牧师准备的蛋糕！内含圣水。"
	icon_state = "holy_cake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/holy_cakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 3, /datum/reagent/water/holywater = 10)
	tastes = list("cake" = 5, "sweetness" = 1, "clouds" = 1)

/obj/item/reagent_containers/food/snacks/pastries/holy_cakeslice
	name = "天使蛋糕切片"
	desc = "一片天堂般的蛋糕。"
	icon_state = "holy_cake_slice"
	tastes = list("cake" = 5, "sweetness" = 1, "clouds" = 1)

/obj/item/reagent_containers/food/snacks/pastries/holy_cakeslice
	name = "天使蛋糕切片"
	desc = "一片天堂般的蛋糕。"
	icon_state = "holy_cake_slice"
	tastes = list("cake" = 5, "sweetness" = 1, "clouds" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/poundcake
	name = "磅蛋糕"
	desc = "一种压缩蛋糕，用于快速填饱肚子。"
	icon_state = "pound_cake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/poundcakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 60, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("cake" = 5, "sweetness" = 1, "batter" = 1)

/obj/item/reagent_containers/food/snacks/pastries/poundcakeslice
	name = "磅蛋糕切片"
	desc = "一片浓缩蛋糕，专为快速填饱肚子而制。"
	icon_state = "pound_cake_slice"
	list_reagents = list(/datum/reagent/consumable/nutriment = 9, /datum/reagent/consumable/nutriment/vitamin = 0.5)
	tastes = list("cake" = 5, "sweetness" = 5, "batter" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/hardware_cake
	name = "硬件蛋糕"
	desc = "一块所谓的'蛋糕'，由电子板制成，还会漏酸液……"
	icon_state = "hardware_cake"
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/toxin/acid = 15)
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/hardware_cakelice
	tastes = list("acid" = 3, "metal" = 4, "glass" = 5)

/obj/item/reagent_containers/food/snacks/pastries/hardware_cakelice
	name = "硬件蛋糕切片"
	desc = "一块电子板和一些酸液。"
	icon_state = "hardware_cake_slice"
	tastes = list("acid" = 3, "metal" = 4, "glass" = 5)
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 1, /datum/reagent/toxin/acid = 3)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/vanilla_cake
	name = "香草蛋糕"
	desc = "香草糖霜蛋糕。"
	icon_state = "vanillacake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/hardware_cakelice
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/consumable/sugar = 15, /datum/reagent/consumable/vanilla = 15)
	tastes = list("cake" = 1, "sugar" = 1, "vanilla" = 10)

/obj/item/reagent_containers/food/snacks/pastries/cakeslicevanilla_slice
	name = "香草蛋糕切片"
	desc = "一片香草糖霜蛋糕。"
	icon_state = "vanillacake_slice"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 1, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/vanilla = 3)
	tastes = list("cake" = 1, "sugar" = 1, "vanilla" = 10)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/clown_cake
	name = "小丑蛋糕"
	desc = "一个画着小丑脸的滑稽蛋糕。"
	icon_state = "clowncake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/cakesliceclown_slice
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/consumable/sugar = 15)
	tastes = list("cake" = 1, "sugar" = 1, "joy" = 10)

/obj/item/reagent_containers/food/snacks/pastries/cakesliceclown_slice
	name = "小丑蛋糕切片"
	desc = "一碟糟糕的笑话，配上傻气的道具。"
	icon_state = "clowncake_slice"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 1, /datum/reagent/consumable/sugar = 3)
	tastes = list("cake" = 1, "sugar" = 1, "joy" = 10)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/trumpet
	name = "太空蛋糕"
	desc = "太空人的霜糖喇叭蛋糕。"
	icon_state = "trumpetcake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/cakeslicetrumpet
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/consumable/milk = 5, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/consumable/berryjuice = 5)
	tastes = list("cake" = 4, "violets" = 2, "jam" = 2)

/obj/item/reagent_containers/food/snacks/pastries/cakeslicetrumpet
	name = "太空蛋糕"
	desc = "太空人的霜糖喇叭蛋糕。"
	icon_state = "trumpetcakeslice"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 1, /datum/reagent/consumable/milk = 1, /datum/reagent/consumable/nutriment/vitamin = 1, /datum/reagent/consumable/berryjuice = 1)
	tastes = list("cake" = 4, "violets" = 2, "jam" = 2)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/brioche
	name = "布里欧修蛋糕"
	desc = "一圈甜美的糖霜面包圈。"
	icon_state = "briochecake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/cakeslicebrioche
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("cake" = 4, "butter" = 2, "cream" = 1)

/obj/item/reagent_containers/food/snacks/pastries/cakeslicebrioche
	name = "布里欧修蛋糕切片"
	desc = "美味甜面包。谁还需要别的呢？"
	icon_state = "briochecake_slice"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("cake" = 4, "butter" = 2, "cream" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/pavlova
	name = "帕夫洛娃"
	desc = "一份甜美的浆果蛋白酥皮蛋糕。源自新西兰，却以一位俄罗斯芭蕾舞者命名……而且科学证明，它在晚宴上最受欢迎！"
	icon_state = "pavlova"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/cakeslicepavlova
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("meringue" = 5, "creaminess" = 1, "berries" = 1)

/obj/item/reagent_containers/food/snacks/pastries/cakeslicepavlova
	name = "帕夫洛娃蛋糕切片"
	desc = "一块开裂的帕芙洛娃蛋糕切片，上面堆满了浆果。你甚至切得如此巧妙，让更多浆果落在了你的那片上，多么令人愉悦的狡猾。"
	icon_state = "pavlova_slice"
	tastes = list("meringue" = 5, "creaminess" = 1, "berries" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/fruitcake
	name = "英式水果蛋糕"
	desc = "一块上好的蛋糕，对吧？"
	icon_state = "fruitcake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/cakeslicefruit
	list_reagents = list(/datum/reagent/consumable/nutriment = 15, /datum/reagent/consumable/sugar = 10, /datum/reagent/consumable/cherryjelly = 5, )
	tastes = list("dried fruit" = 5, "treacle" = 2, "christmas" = 2)

/obj/item/reagent_containers/food/snacks/pastries/fruitcake
	name = "英式水果蛋糕"
	desc = "一块上好的蛋糕，对吧？"
	icon_state = "fruitcake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/cakeslicefruit
	list_reagents = list(/datum/reagent/consumable/nutriment = 15, /datum/reagent/consumable/sugar = 10, /datum/reagent/consumable/cherryjelly = 5, )
	tastes = list("dried fruit" = 5, "treacle" = 2, "christmas" = 2)

/obj/item/reagent_containers/food/snacks/pastries/fruitcake/Initialize(mapload)
	. = ..()
	icon_state = "[base_icon_state][rand(1,3)]"

/obj/item/reagent_containers/food/snacks/pastries/cakeslicefruit
	name = "英式水果蛋糕切片"
	desc = "这一刀可真够劲，是吧？"
	icon_state = "fruitcake_slice1"
	base_icon_state = "fruitcake_slice"
	tastes = list("dried fruit" = 5, "treacle" = 2, "christmas" = 2)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/dulcedebatata
	name = "红薯蜜饯片"
	desc = "一片甜美的红薯果冻。"
	icon_state = "dulcedebatataslice"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/dulcedebatataslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("jelly" = 1, "sweet potato" = 1)

/obj/item/reagent_containers/food/snacks/pastries/dulcedebatataslice
	name = "红薯甜点"
	desc = "用红薯制成的美味果冻。"
	icon_state = "dulcedebatata"
	list_reagents = list(/datum/reagent/consumable/nutriment = 14, /datum/reagent/consumable/nutriment/vitamin = 8)
	tastes = list("jelly" = 1, "sweet potato" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/baklava
	name = "巴拉克拉法帽"
	desc = "由坚果层和薄面包制成的美味健康零食。"
	icon_state = "baklava"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/baklavaslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("nuts" = 1, "pie" = 1)

/obj/item/reagent_containers/food/snacks/pastries/baklavaslice
	name = "巴克拉瓦甜点"
	desc = "由坚果层和薄面包制成的美味健康零食的一部分"
	icon_state = "baklavaslice"
	list_reagents = list(/datum/reagent/consumable/nutriment = 14, /datum/reagent/consumable/nutriment/vitamin = 8)
	tastes = list("nuts" = 1, "pie" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/frenchsilkpie
	name = "法式丝绸派"
	desc = "一款奢华的派，内馅是奶油巧克力慕斯，顶部覆盖着一层打发奶油和巧克力碎屑。可切片。"
	icon_state = "frenchsilkpie"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/frenchsilkpieslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("pie" = 1, "smooth chocolate" = 1, "whipped cream" = 1)

/obj/item/reagent_containers/food/snacks/pastries/frenchsilkpieslice
	name = "法式丝绸派切片"
	desc = "一片法式丝绸派，内馅是巧克力慕斯，顶部覆盖着打发奶油和巧克力碎屑。美味到足以让你落泪。"
	icon_state = "frenchsilkpieslice"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("pie" = 1, "smooth chocolate" = 1, "whipped cream" = 1)

/obj/item/reagent_containers/food/snacks/pastries/applepie
	name = "苹果派"
	desc = "一个馅饼，里面装着甜蜜的爱……或者是苹果。"
	icon_state = "applepie"
	filling_color = "#E0EDC5"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4)
	bitesize = 3
	tastes = list("pie" = 1, "apple" = 1)

/obj/item/reagent_containers/food/snacks/pastries/frostypie
	name = "霜冻馅饼"
	desc = "尝起来像蓝色和寒冷。"
	icon_state = "frostypie"
	filling_color = "#0b8c91"
	list_reagents = list(/datum/reagent/consumable/nutriment = 14, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("mint" = 1, "pie" = 1)

/obj/item/reagent_containers/food/snacks/pastries/cherrypie
	name = "樱桃派"
	desc = "味道好极了，让大男人都落泪。"
	icon_state = "cherrypie"
	filling_color = "#FF525A"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/cherryjelly = 4)
	bitesize = 3
	tastes = list("pie" = 7, "Nicole Paige Brooks" = 2)

/obj/item/reagent_containers/food/snacks/pastries/appletart
	name = "黄金苹果酥皮挞"
	desc = "一道美味的甜点，无法通过金属探测器。"
	icon_state = "gappletart"
	trash = /obj/item/trash/plate
	filling_color = "#FFFF00"
	list_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/gold = 5)
	bitesize = 3
	tastes = list("pie" = 1, "apple" = 1, "expensive metal" = 1)

/obj/item/reagent_containers/food/snacks/pastries/grapetart
	name = "葡萄挞"
	desc = "一道美味的甜点，让你想起那瓶未曾酿造的葡萄酒。"
	icon_state = "grapetart"
	trash = /obj/item/trash/plate
	filling_color = "#4e0455"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 4)
	bitesize = 3
	tastes = list("pie" = 1, "grape" = 1)

/obj/item/reagent_containers/food/snacks/pastries/mimetart
	name = "默剧演员"
	desc = "..."
	icon_state = "mimetart"
	filling_color = "#e8e1e9"
	trash = /obj/item/trash/plate
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/consumable/nothing = 10)
	tastes = list("nothing" = 3)

/obj/item/reagent_containers/food/snacks/pastries/berrytart
	name = "浆果挞"
	desc = "多种小浆果铺在薄饼皮上的美味甜点。"
	icon_state = "berrytart"
	filling_color = "#a46cac"
	trash = /obj/item/trash/plate
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("pie" = 1, "berries" = 2)

/obj/item/reagent_containers/food/snacks/pastries/cocolavatart
	name = "巧克力熔岩挞"
	desc = "一道美味的巧克力甜点，内含流心。" //But it doesn't even contain chocolate...
	icon_state = "cocolavatart"
	filling_color = "#522700"
	trash = /obj/item/trash/plate
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("pie" = 1, "dark chocolate" = 3)


/obj/item/reagent_containers/food/snacks/pastries/meatpie
	name = "肉馅饼"
	icon_state = "meatpie"
	desc = "一份老式理发师配方，美味极了！"
	trash = /obj/item/trash/plate
	filling_color = "#948051"
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	tastes = list("pie" = 1, "meat" = 1)
	bitesize = 2

/obj/item/reagent_containers/food/snacks/pastries/tofupie
	name = "豆腐派"
	icon_state = "meatpie"
	desc = "美味的豆腐派。"
	trash = /obj/item/trash/plate
	filling_color = "#FFFEE0"
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	tastes = list("pie" = 1, "tofu" = 1)
	bitesize = 2

/obj/item/reagent_containers/food/snacks/pastries/amanita_pie
	name = "毒蝇伞馅饼"
	desc = "香甜可口的毒馅饼。"
	icon_state = "amanita_pie"
	filling_color = "#FFCCCC"
	tastes = list("pie" = 1, "mushroom" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/toxin/amatoxin = 3, /datum/reagent/consumable/psilocybin = 1)
	bitesize = 3

/obj/item/reagent_containers/food/snacks/pastries/plump_pie
	name = "饱满馅饼"
	desc = "我打赌你肯定喜欢用胖头盔做的东西！"
	icon_state = "plump_pie"
	filling_color = "#B8279B"
	list_reagents = list(/datum/reagent/consumable/nutriment = 8)
	tastes = list("pie" = 1, "mushroom" = 1)
	bitesize = 2


/obj/item/reagent_containers/food/snacks/pastries/plump_pie/Initialize(mapload)
	. = ..()
	var/fey = prob(10)
	if(fey)
		name = "特级丰满馅饼"
		desc = "微波炉被一股奇异的情绪笼罩！它烹饪出了一个非凡的丰满馅饼！"
		reagents.add_reagent(/datum/reagent/medicine/tricordrazine, 5)

/obj/item/reagent_containers/food/snacks/pastries/xemeatpie
	name = "异形派"
	icon_state = "xenomeatpie"
	desc = "美味的肉馅饼。可能是异端。"
	trash = /obj/item/trash/plate
	filling_color = "#43DE18"
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	tastes = list("pie" = 1, "meat" = 1, "acid" = 1)
	bitesize = 2

/obj/item/reagent_containers/food/snacks/sliceable/pastries/applecake
	name = "苹果蛋糕"
	desc = "以苹果为中心装饰的蛋糕"
	icon_state = "applecake"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/applecakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 15)
	filling_color = "#EBF5B8"
	tastes = list ("cake" = 5, "sweetness" = 1, "apple" = 1)

/obj/item/reagent_containers/food/snacks/pastries/applecakeslice
	name = "苹果蛋糕切片"
	desc = "一片天堂般的蛋糕。"
	icon_state = "applecakeslice"
	trash = /obj/item/trash/plate
	filling_color = "#EBF5B8"
	bitesize = 2
	tastes = list("cake" = 5, "sweetness" = 1, "apple" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/pastries/pumpkinpie
	name = "南瓜派"
	desc = "秋日佳品。"
	icon_state = "pumpkinpie"
	slice_path = /obj/item/reagent_containers/food/snacks/pastries/pumpkinpieslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 15)
	filling_color = "#F5B951"
	tastes = list("pie" = 1, "pumpkin" = 1)

/obj/item/reagent_containers/food/snacks/pastries/pumpkinpieslice
	name = "南瓜派切片"
	desc = "一片南瓜派，顶部点缀着鲜奶油。完美。"
	icon_state = "pumpkinpieslice"
	trash = /obj/item/trash/plate
	filling_color = "#F5B951"
	bitesize = 2
	tastes = list("pie" = 1, "pumpkin" = 1)
