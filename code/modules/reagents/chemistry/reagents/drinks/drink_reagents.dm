/datum/reagent/consumable/orangejuice
	name = "Orange Juice-橙汁"
	description = "Both delicious AND rich in Vitamin C, what more do you need?"
	color = "#E78108" // rgb: 231, 129, 8
	taste_description = "oranges"
	default_container = /obj/item/reagent_containers/cup/glass/bottle/juice/orangejuice

/datum/reagent/consumable/tomatojuice
	name = "Tomato Juice-番茄汁"
	description = "Tomatoes made into juice. What a waste of big, juicy tomatoes, huh?"
	color = "#731008" // rgb: 115, 16, 8
	taste_description = "tomatoes"
	default_container = /obj/item/reagent_containers/cup/glass/bottle/juice/tomatojuice

/datum/reagent/consumable/limejuice
	name = "Lime Juice-青柠汁"
	description = "The sweet-sour juice of limes."
	color = "#365E30" // rgb: 54, 94, 48
	taste_description = "unbearable sourness"
	default_container = /obj/item/reagent_containers/cup/glass/bottle/juice/limejuice

/datum/reagent/consumable/carrotjuice
	name = "Carrot Juice-胡萝卜汁"
	description = "It is just like a carrot but without crunching."
	color = "#973800" // rgb: 151, 56, 0
	taste_description = "carrots"

/datum/reagent/consumable/carrotjuice/on_mob_life(mob/living/L, metabolism)
	L.adjust_blurriness(-1)
	L.adjust_blindness(-1)
	if(current_cycle > 20)
		if(prob(current_cycle-10) && iscarbon(L))
			var/mob/living/carbon/C = L
			C.disabilities &= ~NEARSIGHTED
	return ..()

/datum/reagent/consumable/berryjuice
	name = "Berry Juice-浆果汁"
	description = "A delicious blend of several different kinds of berries."
	color = "#863333" // rgb: 134, 51, 51
	taste_description = "berries"

/datum/reagent/consumable/applejuice
	name = "Apple Juice-苹果汁"
	description = "The sweet juice of an apple, fit for all ages."
	color = "#ECFF56" // rgb: 236, 255, 86
	taste_description = "apples"

/datum/reagent/consumable/poisonberryjuice
	name = "Poison Berry Juice-毒莓果汁"
	description = "A tasty juice blended from various kinds of very deadly and toxic berries."
	color = "#863353" // rgb: 134, 51, 83
	taste_description = "berries"

/datum/reagent/consumable/poisonberryjuice/on_mob_life(mob/living/L, metabolism)
	L.adjustToxLoss(1)
	return ..()

/datum/reagent/consumable/watermelonjuice
	name = "Watermelon Juice-西瓜汁"
	description = "Delicious juice made from watermelon."
	color = "#863333" // rgb: 134, 51, 51
	taste_description = "juicy watermelon"

/datum/reagent/consumable/lemonjuice
	name = "Lemon Juice-柠檬汁"
	description = "This juice is VERY sour."
	color = "#863333" // rgb: 175, 175, 0
	taste_description = "sourness"

/datum/reagent/consumable/banana
	name = "Banana Juice-香蕉汁"
	description = "The raw essence of a banana. HONK"
	color = "#863333" // rgb: 175, 175, 0
	taste_description = "banana"

/datum/reagent/consumable/nothing
	name = "Nothing-无"
	description = "Absolutely nothing."
	taste_description = "nothing"

/datum/glass_style/shot_glass/nothing
	required_drink_type = /datum/reagent/consumable/nothing
	icon_state = "shotglass"

/datum/reagent/consumable/laughter
	name = "Laughter-笑声"
	description = "Some say that this is the best medicine, but recent studies have proven that to be untrue."
	custom_metabolism = INFINITY
	color = "#FF4DD2"
	taste_description = "laughter"

/datum/reagent/consumable/laughter/on_mob_life(mob/living/carbon/M)
	M.emote("laugh")
	return ..()

/datum/reagent/consumable/superlaughter
	name = "Super Laughter-超级欢笑"
	description = "Funny until you're the one laughing."
	custom_metabolism = 1.5 * REAGENTS_METABOLISM
	color = "#FF4DD2"
	taste_description = "laughter"

/datum/reagent/consumable/potato_juice
	name = "Potato Juice-土豆汁"
	description = "Juice of the potato. Bleh."
	nutriment_factor = 1 * FOOD_METABOLISM
	color = "#302000" // rgb: 48, 32, 0
	taste_description = "irish sadness"

/datum/reagent/consumable/pickle
	name = "Pickle Juice-腌黄瓜汁"
	description = "More accurately, this is the brine the pickle was floating in"
	nutriment_factor = 1
	color = "#302000" // rgb: 48, 32, 0
	taste_description = "vinegar brine"

/datum/reagent/consumable/grapejuice
	name = "Grape Juice-葡萄汁"
	description = "The juice of a bunch of grapes. Guaranteed non-alcoholic."
	color = "#290029" // dark purple
	taste_description = "grape soda"

/datum/reagent/consumable/plumjuice
	name = "Plum Juice-李子汁"
	description = "Refreshing and slightly acidic beverage."
	color = "#b6062c"
	taste_description = "plums"

/datum/reagent/consumable/milk
	name = "Milk-牛奶"
	description = "An opaque white liquid produced by the mammary glands of mammals."
	color = "#DFDFDF" // rgb: 223, 223, 223
	taste_description = "milk"

/datum/reagent/consumable/soymilk
	name = "Soy Milk-豆奶"
	description = "An opaque white liquid made from soybeans."
	color = "#DFDFC7" // rgb: 223, 223, 199
	taste_description = "soy milk"

/datum/reagent/consumable/cream
	name = "Cream-奶油"
	description = "The fatty, still liquid part of milk. Why don't you mix this with sum scotch, eh?"
	color = "#DFD7AF" // rgb: 223, 215, 175
	taste_description = "creamy milk"
	default_container = /obj/item/reagent_containers/cup/glass/bottle/juice/cream

/datum/reagent/consumable/coffee
	name = "Coffee-咖啡"
	description = "Coffee is a brewed drink prepared from roasted seeds, commonly called coffee beans, of the coffee plant."
	color = "#482000" // rgb: 72, 32, 0
	nutriment_factor = 0
	overdose_threshold = REAGENTS_OVERDOSE * 2
	overdose_crit_threshold = REAGENTS_OVERDOSE_CRITICAL * 3
	custom_metabolism = REAGENTS_METABOLISM * 5 //1u/tick
	adj_dizzy = -5
	adj_drowsy = -3
	adj_sleepy = -2
	adj_temp = 20
	taste_description = "bitterness"
	purge_rate = 2
	trait_flags = TACHYCARDIC

/datum/reagent/consumable/coffee/overdose_process(mob/living/L, metabolism)
	L.apply_damage(0.2, TOX)
	L.jitter(2)
	if(prob(5) && ishuman(L))
		var/mob/living/carbon/human/H = L
		var/datum/internal_organ/heart/E = H.get_organ_slot(ORGAN_SLOT_HEART)
		if(E)
			E.take_damage(1, TRUE)
		L.emote(pick("twitch", "blink_r", "shiver"))

/datum/reagent/consumable/coffee/overdose_crit_process(mob/living/L, metabolism)
	L.apply_damage(0.5, TOX)
	L.jitter(5)
	if(prob(5) && L.stat != UNCONSCIOUS)
		to_chat(L, span_warning("你痉挛着昏了过去！"))
		L.Unconscious(10 SECONDS)
	if(prob(30) && ishuman(L))
		var/mob/living/carbon/human/H = L
		var/datum/internal_organ/heart/E = H.get_organ_slot(ORGAN_SLOT_HEART)
		if(E)
			E.take_damage(1, TRUE)

/datum/reagent/consumable/tea
	name = "Tea-茶"
	description = "Tasty black tea, it has antioxidants, it's good for you!"
	color = "#101000" // rgb: 16, 16, 0
	nutriment_factor = 0
	taste_description = "tart black tea"
	default_container = /obj/item/reagent_containers/cup/glass/mug/tea
	adj_dizzy = - 2
	adj_drowsy = -1
	adj_sleepy = -1
	adj_temp = 10

/datum/reagent/consumable/lemonade
	name = "Lemonade-柠檬水"
	description = "Sweet, tangy lemonade. Good for the soul."
	color = "#FFE978"
	taste_description = "sunshine and summertime"
	adj_temp = - 5
	targ_temp = BODYTEMP_NORMAL - 5

/datum/reagent/consumable/tea/arnold_palmer
	name = "Arnold Palmer-阿诺德·帕尔默"
	description = "Encourages the patient to go golfing."
	color = "#FFB766"
	nutriment_factor = 5
	taste_description = "bitter tea"

/datum/reagent/consumable/hot_ice_coffee
	name = "Hot Ice Coffee-热冰咖啡"
	description = "Coffee with pulsing ice shards"
	color = "#102838" // rgb: 16, 40, 56
	nutriment_factor = 0
	taste_description = "bitter coldness and a hint of smoke"

/datum/reagent/consumable/space_cola
	name = "Cola-可乐"
	description = "A refreshing beverage."
	color = "#100800" // rgb: 16, 8, 0
	taste_description = "cola"
	adj_drowsy = -2
	adj_sleepy = -1
	adj_temp = - 5
	targ_temp = BODYTEMP_NORMAL - 5

/datum/reagent/consumable/roy_rogers
	name = "Roy Rogers-罗伊·罗杰斯"
	description = "A sweet fizzy drink."
	color = "#53090B"
	taste_description = "fruity overlysweet cola"

/datum/reagent/consumable/nuka_cola
	name = "Nuka Cola-核子可乐"
	description = "Cola, cola never changes."
	color = "#100800" // rgb: 16, 8, 0
	taste_description = "the future"
	adj_sleepy = -2
	adj_drowsy = -10
	adj_dizzy = 5
	adj_temp = - 5
	targ_temp = BODYTEMP_NORMAL - 5

/datum/reagent/consumable/nuka_cola/on_mob_life(mob/living/L, metabolism)
	L.jitter(10)
	L.set_drugginess(30)
	return ..()

/datum/reagent/consumable/rootbeer
	name = "root beer-根汁汽水"
	description = "A delightfully bubbly root beer, filled with so much sugar that it can actually speed up the user's trigger finger."
	color = "#181008" // rgb: 24, 16, 8
	nutriment_factor = 5
	custom_metabolism = 2 * REAGENTS_METABOLISM
	taste_description = "a monstrous sugar rush"
		/// If we activated the effect
	var/effect_enabled = FALSE

/datum/reagent/consumable/grey_bull
	name = "Grey Bull-灰色蛮牛"
	description = "Grey Bull, it gives you gloves!"
	color = "#EEFF00" // rgb: 238, 255, 0
	taste_description = "carbonated oil"

/datum/reagent/consumable/spacemountainwind
	name = "SM Wind-SM 风"
	description = "Blows right through you like a space wind."
	color = "#102000" // rgb: 16, 32, 0
	taste_description = "sweet citrus soda"
	adj_drowsy = -7
	adj_sleepy = -1
	adj_temp = - 5
	targ_temp = BODYTEMP_NORMAL - 5

/datum/reagent/consumable/dr_gibb
	name = "Dr. Gibb-吉布医生"
	description = "A delicious blend of 42 different flavours."
	color = "#102000" // rgb: 16, 32, 0
	taste_description = "cherry soda" // FALSE ADVERTISING
	adj_drowsy = -6
	adj_temp = - 5
	targ_temp = BODYTEMP_NORMAL - 5

/datum/reagent/consumable/space_up
	name = "Space-Up-太空兴奋剂"
	description = "Tastes like a hull breach in your mouth."
	color = COLOR_VIBRANT_LIME // rgb: 0, 255, 0
	taste_description = "cherry soda"
	adj_temp = - 8
	targ_temp = BODYTEMP_NORMAL - 10

/datum/reagent/consumable/lemon_lime
	name = "Lemon Lime-柠檬青柠"
	description = "A tangy substance made of 0.5% natural citrus!"
	color = "#8CFF00" // rgb: 135, 255, 0
	taste_description = "tangy lime and lemon soda"
	adj_temp = - 8
	targ_temp = BODYTEMP_NORMAL - 10

/datum/reagent/consumable/pwr_game
	name = "Pwr Game-权力游戏"
	description = "The only drink with the PWR that true gamers crave."
	color = "#9385bf" // rgb: 58, 52, 75
	taste_description = "sweet and salty tang"

/datum/reagent/consumable/shamblers
	name = "Shambler's Juice-蹒跚者之饮"
	description = "~Shake me up some of that Shambler's Juice!~"
	color = "#f00060" // rgb: 94, 0, 38
	taste_description = "carbonated metallic soda"

/datum/reagent/consumable/sodawater
	name = "Soda Water-苏打水"
	description = "A can of club soda. Why not make a scotch and soda?"
	color = "#619494" // rgb: 97, 148, 148
	taste_description = "carbonated water"
	adj_dizzy = -5
	adj_drowsy = -1
	adj_temp = - 5
	targ_temp = BODYTEMP_NORMAL - 5

/datum/reagent/consumable/tonic
	name = "Tonic Water-汤力水"
	description = "It tastes strange but at least the quinine keeps the Space Malaria at bay."
	color = "#0064C8" // rgb: 0, 100, 200
	taste_description = "tart and fresh"
	adj_dizzy = - 5
	adj_drowsy = -2
	adj_sleepy = -1
	adj_temp = - 5
	targ_temp = BODYTEMP_NORMAL - 5

/datum/reagent/consumable/wellcheers
	name = "Wellcheers-威乐奇"
	description = "A strange purple drink, smelling of saltwater. Somewhere in the distance, you hear seagulls."
	color = "#762399" // rgb: 118, 35, 153
	taste_description = "grapes and the fresh open sea"

/datum/reagent/consumable/monkey_energy
	name = "Monkey Energy-猴子能量"
	description = "The only drink that will make you unleash the ape."
	color = "#f39b03" // rgb: 243, 155, 3
	overdose_threshold = 60
	taste_description = "barbecue and nostalgia"

/datum/reagent/consumable/ice
	name = "Ice-冰"
	description = "Frozen water, your dentist wouldn't like you chewing this."
	reagent_state = SOLID
	color = "#619494" // rgb: 97, 148, 148
	taste_description = "ice"
	default_container = /obj/item/reagent_containers/cup/glass/ice
	adj_temp = - 7
	targ_temp = BODYTEMP_NORMAL - 15

/datum/reagent/consumable/coffee/soy_latte
	name = "Soy Latte-大豆拿铁"
	description = "A nice and tasty beverage while you are reading your hippie books."
	color = "#cc6404" // rgb: 204,100,4
	taste_description = "creamy coffee"
	adj_sleepy = 0
	adj_temp = 5

/datum/reagent/consumable/coffee/cafe_latte
	name = "Cafe Latte-咖啡拿铁"
	description = "A nice, strong and tasty beverage while you are reading."
	color = "#cc6404" // rgb: 204,100,4
	taste_description = "bitter cream"
	adj_sleepy = 0
	adj_temp = 5

/datum/reagent/consumable/doctor_delight
	name = "The Doctor's Delight-医生的喜悦"
	description = "A gulp a day keeps the Medibot away!... Or so the advertisements claim, anyway."
	color = "#FF8CFF" // rgb: 255, 140, 255
	taste_description = "homely fruit"
	custom_metabolism = REAGENTS_METABOLISM * 0.25 //Twice the rate of paracetamol
	adj_dizzy = - 10

/datum/reagent/consumable/cinderella
	name = "Cinderella-灰姑娘"
	description = "Most definitely a fruity alcohol cocktail to have while partying with your friends."
	color = "#FF6A50"
	taste_description = "sweet tangy fruit"

/datum/reagent/consumable/cherryshake
	name = "Cherry Shake-樱桃奶昔"
	description = "A cherry flavored milkshake."
	color = "#FFB6C1"
	nutriment_factor = 4
	taste_description = "creamy tart cherry"

/datum/reagent/consumable/bluecherryshake
	name = "Blue Cherry Shake-蓝色樱桃奶昔"
	description = "An exotic milkshake."
	color = "#00F1FF"
	nutriment_factor = 4
	taste_description = "creamy blue cherry"

/datum/reagent/consumable/vanillashake
	name = "Vanilla Shake-香草奶昔"
	description = "A vanilla flavored milkshake. The basics are still good."
	color = "#E9D2B2"
	nutriment_factor = 4
	taste_description = "sweet creamy vanilla"

/datum/reagent/consumable/caramelshake
	name = "Caramel Shake-焦糖奶昔"
	description = "A caramel flavored milkshake. Your teeth hurt looking at it."
	color = "#E17C00"
	nutriment_factor = 5
	taste_description = "sweet rich creamy caramel"

/datum/reagent/consumable/choccyshake
	name = "Chocolate Shake-巧克力奶昔"
	description = "A frosty chocolate milkshake."
	color = "#541B00"
	nutriment_factor = 4
	taste_description = "sweet creamy chocolate"

/datum/reagent/consumable/strawberryshake
	name = "Strawberry Shake-草莓奶昔"
	description = "A strawberry milkshake."
	color = "#ff7b7b"
	nutriment_factor = 4
	taste_description = "sweet strawberries and milk"

/datum/reagent/consumable/bananashake
	name = "Banana Shake-香蕉奶昔"
	description = "A banana milkshake. Stuff that clowns drink at their honkday parties."
	color = "#f2d554"
	nutriment_factor = 4
	taste_description = "thick banana"

/datum/reagent/consumable/pumpkin_latte
	name = "Pumpkin Latte-南瓜拿铁"
	description = "A mix of pumpkin juice and coffee."
	color = "#F4A460"
	nutriment_factor = 1.5
	taste_description = "creamy pumpkin"

/datum/reagent/consumable/gibbfloats
	name = "Gibb Floats-漂浮的碎块"
	description = "Ice cream on top of a Dr. Gibb glass."
	color = "#B22222"
	nutriment_factor = 1.5
	taste_description = "creamy cherry"

/datum/reagent/consumable/pumpkinjuice
	name = "Pumpkin Juice-南瓜汁"
	description = "Juiced from real pumpkin."
	color = "#FFA500"
	taste_description = "pumpkin"

/datum/reagent/consumable/blumpkinjuice
	name = "Blumpkin Juice-布隆普金果汁"
	description = "Juiced from real blumpkin."
	color = "#00BFFF"
	taste_description = "a mouthful of pool water"

/datum/reagent/consumable/triple_citrus
	name = "Triple Citrus-三重柑橘"
	description = "A solution."
	color = "#EEFF00"
	taste_description = "extreme bitterness"

/datum/reagent/consumable/grape_soda
	name = "Grape Soda-葡萄汽水"
	description = "Beloved by children and teetotalers."
	color = "#E6CDFF"
	taste_description = "grape soda"

/datum/reagent/consumable/milk/chocolate_milk
	name = "Chocolate Milk-巧克力牛奶"
	description = "Milk for cool kids."
	color = "#7D4E29"
	taste_description = "chocolate milk"

/datum/reagent/consumable/hot_coco
	name = "Hot Coco-热可可"
	description = "Made with love! And coco beans."
	nutriment_factor = 1
	color = "#403010" // rgb: 64, 48, 16
	adj_temp = 15
	taste_description = "creamy chocolate"

/datum/reagent/consumable/italian_coco
	name = "Italian Hot Chocolate-意大利热巧克力"
	description = "Made with love! You can just imagine a happy Nonna from the smell."
	nutriment_factor = 4
	color = "#57372A"
	taste_description = "thick creamy chocolate"

/datum/reagent/consumable/menthol
	name = "Menthol-薄荷醇"
	description = "Alleviates coughing symptoms one might have."
	color = "#80AF9C"
	taste_description = "mint"
	default_container = /obj/item/reagent_containers/cup/glass/bottle/juice/menthol

/datum/reagent/consumable/grenadine
	name = "Grenadine-格勒纳丁"
	description = "Not cherry flavored!"
	color = "#EA1D26"
	taste_description = "sweet pomegranates"

/datum/reagent/consumable/parsnipjuice
	name = "Parsnip Juice-防风草汁"
	description = "Why..."
	color = "#FFA500"
	taste_description = "parsnip"

/datum/reagent/consumable/pineapplejuice
	name = "Pineapple Juice-菠萝汁"
	description = "Tart, tropical, and hotly debated."
	color = "#F7D435"
	taste_description = "pineapple"
	default_container = /obj/item/reagent_containers/cup/glass/bottle/juice/pineapplejuice

/datum/reagent/consumable/peachjuice //Intended to be extremely rare due to being the limiting ingredients in the blazaam drink
	name = "Peach Juice-桃汁"
	description = "Just peachy."
	color = "#E78108"
	taste_description = "peaches"

/datum/reagent/consumable/cream_soda
	name = "Cream Soda-奶油苏打"
	description = "A classic space-American vanilla flavored soft drink."
	color = "#dcb137"
	taste_description = "fizzy vanilla"

/datum/reagent/consumable/sol_dry
	name = "Sol Dry-索尔·德莱"
	description = "A soothing, mellow drink made from ginger."
	color = "#f7d26a"
	taste_description = "sweet ginger spice"

/datum/reagent/consumable/shirley_temple
	name = "Shirley Temple-秀兰·邓波儿"
	description = "Here you go little girl, now you can drink like the adults."
	color = "#F43724"
	taste_description = "sweet cherry syrup and ginger spice"

/datum/reagent/consumable/red_queen
	name = "Red Queen-红后"
	description = "DRINK ME."
	color = "#e6ddc3"
	taste_description = "wonder"

/datum/reagent/consumable/bungojuice
	name = "Bungo Juice-笨果汁"
	color = "#F9E43D"
	description = "Exotic! You feel like you are on vacation already."
	taste_description = "succulent bungo"

/datum/reagent/consumable/prunomix
	name = "Pruno Mixture-私酿酒混合物"
	color = "#E78108"
	description = "Fruit, sugar, yeast, and water pulped together into a pungent slurry."
	taste_description = "garbage"

/datum/reagent/consumable/aloejuice
	name = "Aloe Juice-芦荟汁"
	color = "#A3C48B"
	description = "A healthy and refreshing juice."
	taste_description = "vegetable"

/datum/reagent/consumable/agua_fresca
	name = "Agua Fresca-清新果汁"
	description = "A refreshing watermelon agua fresca. Perfect on a day at the holodeck."
	color = "#D25B66"
	taste_description = "cool refreshing watermelon"

/datum/reagent/consumable/mushroom_tea
	name = "Mushroom Tea-蘑菇茶"
	description = "A savoury glass of tea made from polypore mushroom shavings, originally native to Tizira."
	color = "#674945" // rgb: 16, 16, 0
	nutriment_factor = 0
	taste_description = "mushrooms"

//Moth Stuff
/datum/reagent/consumable/toechtauese_juice
	name = "Töchtaüse Juice-托克托斯果汁"
	description = "An unpleasant juice made from töchtaüse berries. Best made into a syrup, unless you enjoy pain."
	color = "#554862"
	nutriment_factor = 0
	taste_description = "fiery itchy pain"

/datum/reagent/consumable/toechtauese_syrup
	name = "Töchtaüse Syrup-托克托斯糖浆"
	description = "A harsh spicy and bitter syrup, made from töchtaüse berries. Useful as an ingredient, both for food and cocktails."
	color = "#554862"
	nutriment_factor = 0
	taste_description = "sugar, spice, and nothing nice"

/datum/reagent/consumable/strawberry_banana
	name = "strawberry banana smoothie-草莓香蕉奶昔"
	description = "A classic smoothie made from strawberries and bananas."
	color = "#FF9999"
	nutriment_factor = 0
	taste_description = "strawberry and banana"

/datum/reagent/consumable/berry_blast
	name = "berry blast smoothie-浆果冲击冰沙"
	description = "A classic smoothie made from mixed berries."
	color = "#A76DC5"
	nutriment_factor = 0
	taste_description = "mixed berry"

/datum/reagent/consumable/funky_monkey
	name = "funky monkey smoothie-时髦猴子奶昔"
	description = "A classic smoothie made from chocolate and bananas."
	color = "#663300"
	nutriment_factor = 0
	taste_description = "chocolate and banana"

/datum/reagent/consumable/green_giant
	name = "green giant smoothie-绿色巨人奶昔"
	description = "A green vegetable smoothie, made without vegetables."
	color = COLOR_VERY_DARK_LIME_GREEN
	nutriment_factor = 0
	taste_description = "green, just green"

/datum/reagent/consumable/melon_baller
	name = "melon baller smoothie-西瓜球冰沙"
	description = "A classic smoothie made from melons."
	color = "#D22F55"
	nutriment_factor = 0
	taste_description = "fresh melon"

/datum/reagent/consumable/vanilla_dream
	name = "vanilla dream smoothie-香草梦幻思慕雪"
	description = "A classic smoothie made from vanilla and fresh cream."
	color = "#FFF3DD"
	nutriment_factor = 0
	taste_description = "creamy vanilla"

/datum/reagent/consumable/cucumberjuice
	name = "Cucumber Juice-黄瓜汁"
	description = "Ordinary cucumber juice, nothing from the fantasy world."
	color = "#6cd87a"
	taste_description = "light cucumber"

/datum/reagent/consumable/cucumberlemonade
	name = "Cucumber Lemonade-黄瓜柠檬水"
	description = "Cucumber juice, sugar, and soda; what else do I need?"
	color = "#6cd87a"
	taste_description = "citrus soda with cucumber"

/datum/reagent/consumable/mississippi_queen
	name = "Mississippi Queen-密西西比女王"
	description = "If you think you're so hot, how about a victory drink?"
	color = "#d4422f" // rgb: 212,66,47
	taste_description = "sludge seeping down your throat"

/datum/reagent/consumable/t_letter
	name = "T"
	description = "You expected to find this in a soup, but this is fine too."
	color = "#583d09" // rgb: 88, 61, 9
	taste_description = "one of your 26 favorite letters"

/datum/reagent/consumable/hakka_mate
	name = "Hakka-Mate-哈卡伴侣"
	description = "A Martian-made yerba mate soda, dragged straight out of the pits of a hacking convention."
	color = "#c4b000"
	taste_description = "bubbly yerba mate"

/datum/reagent/consumable/coconut_milk
	name = "Coconut Milk-椰子奶"
	description = "A versatile milk substitute that's perfect for everything from cooking to making cocktails."
	color = "#DFDFDF"
	taste_description = "milky coconut"

/datum/reagent/consumable/melon_soda
	name = "Melon Soda-西瓜汽水"
	description = "A neon green hit of nostalgia."
	color = "#6FEB48"
	taste_description = "fizzy melon"

/datum/reagent/consumable/volt_energy
	name = "24-Volt Energy-24伏能量"
	description = "An artificially coloured and flavoured electric energy drink, in lanternfruit flavour. Made for ethereals, by ethereals."
	color = "#99E550"
	taste_description = "sour pear"

//---- TGMC Drinks

/datum/reagent/consumable/suoto
	name = "Souto Classic-经典苏打"
	description = "A fruit flavored soda canned in Havana"
	color = "#802b00"
	taste_description = "sour soda"
	taste_multi = 2

/datum/reagent/consumable/suoto/cherry
	name = "Souto Cherry-Souto 樱桃味"
	description = "Now with more artificial flavors! Canned in Havanna"
	color = "#800000"
	taste_description = "bittersweet soda"

/datum/reagent/consumable/grapesoda
	name = "Grape Soda-葡萄汽水"
	description = "Grapes made into a fine drank."
	color = "#421C52" // rgb: 98, 57, 53
	adj_drowsy = -3
	taste_description = "grape soda"

//nice one jpr~
/datum/reagent/consumable/coffee/atomiccoffee
	name = "Atomic Coffee-原子咖啡"
	description = "This coffee is a brewed drink prepared from roasted seeds and enriched from use in atomic coffemaker. Consume in moderation"
	color = "#482000" // rgb: 72, 32, 0
	nutriment_factor = 0
	overdose_threshold = REAGENTS_OVERDOSE * 2
	overdose_crit_threshold = REAGENTS_OVERDOSE_CRITICAL * 3
	custom_metabolism = REAGENTS_METABOLISM * 5 //1u/tick
	adj_dizzy = -5
	adj_drowsy = -3
	adj_sleepy = -2
	adj_temp = 20
	taste_description = "bitterness"
	purge_list = list(/datum/reagent/consumable/frostoil, /datum/reagent/medicine/oxycodone)
	purge_rate = 2
	trait_flags = TACHYCARDIC

/datum/reagent/consumable/atomiccoffee/on_mob_add(mob/living/L, metabolism)
	. = ..()
	L.add_movespeed_modifier(type, TRUE, 0, NONE, TRUE, -0.2)

/datum/reagent/consumable/atomiccoffee/on_mob_delete(mob/living/L, metabolism)
	L.remove_movespeed_modifier(type)
	var/amount = (current_cycle * 0.5) // 15/cup
	L.adjustStaminaLoss(amount)

/datum/reagent/consumable/atomiccoffee/on_mob_life(mob/living/L, metabolism)
	switch(current_cycle)
		if(1 to 10)
			L.adjustStaminaLoss(-effect_str)
		if(11 to 30)
			L.adjustStaminaLoss(-0.5*effect_str)
		if(11 to 60)
			L.adjustStaminaLoss(-0.25*effect_str)
			L.jitter(1)
		if(61 to 150)
			L.adjustStaminaLoss(0.25*effect_str)
			L.apply_damage(5, TOX)
			L.jitter(2)
		if(151 to INFINITY)
			L.adjustStaminaLoss(2.5*effect_str)
			L.apply_damage(10, TOX) //You're having a bad day.
			L.jitter(5)
	return ..()

/datum/reagent/consumable/coffee/icecoffee
	name = "Iced Coffee-冰咖啡"
	description = "Coffee and ice, refreshing and cool."
	color = "#102838" // rgb: 16, 40, 56
	taste_description = "bitter coldness"
	adj_temp = 5
	targ_temp = BODYTEMP_NORMAL - 5

/datum/reagent/consumable/tea/icetea
	name = "Iced Tea-冰茶"
	description = "No relation to a certain rap artist/ actor."
	color = "#104038" // rgb: 16, 64, 56
	taste_description = "sweet tea"
	adj_temp = - 5
	targ_temp = BODYTEMP_NORMAL - 5

/datum/reagent/consumable/kiraspecial
	name = "Kira Special-基拉特制"
	description = "Long live the guy who everyone had mistaken for a girl. Baka!"
	color = "#CCCC99" // rgb: 204, 204, 153
	taste_description = "fruity sweetness"
	adj_temp = - 5
	targ_temp = BODYTEMP_NORMAL - 5

/datum/reagent/consumable/brownstar
	name = "Brown Star-棕星"
	description = "It's not what it sounds like..."
	color = "#9F3400" // rgb: 159, 052, 000
	taste_description = "orange and cola soda"
	adj_temp = - 2
	targ_temp = BODYTEMP_NORMAL - 5

/datum/reagent/consumable/milkshake
	name = "Milkshake-奶昔"
	description = "Glorious brainfreezing mixture."
	color = "#AEE5E4" // rgb" 174, 229, 228
	taste_description = "creamy vanilla"
	adj_temp = - 9
	targ_temp = BODYTEMP_NORMAL - 10

/datum/reagent/consumable/milkshake/on_mob_life(mob/living/L, metabolism)
	if(prob(1))
		L.emote("shiver")
	if(holder.has_reagent(/datum/reagent/consumable/capsaicin))
		holder.remove_reagent(/datum/reagent/consumable/capsaicin, 2)
	return ..()

/datum/reagent/consumable/rewriter
	name = "Rewriter-重写器"
	description = "The secret of the sanctuary of the Librarian..."
	color = "#485000" // rgb:72, 080, 0
	taste_description = "a bad night out"
	adj_temp = - 5
	targ_temp = BODYTEMP_NORMAL - 5

/datum/reagent/consumable/rewriter/on_mob_life(mob/living/L, metabolism)
	L.jitter(5)
	return ..()
