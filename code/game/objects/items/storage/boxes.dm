/*
*	Everything derived from the common cardboard box.
*	Basically everything except the original is a kit (starts full).
*
*	Contains:
*		Empty box, starter boxes (survival/engineer),
*		Latex glove and sterile mask boxes,
*		Syringe, beaker, dna injector boxes,
*		Blanks, flashbangs, and EMP grenade boxes,
*		Tracking and chemical implant boxes,
*		Prescription glasses and drinking glass boxes,
*		Condiment bottle and silly cup boxes,
*		Donkpocket and monkeycube boxes,
*		ID and security PDA cart boxes,
*		Handcuff, mousetrap, and pillbottle boxes,
*		Snap-pops and matchboxes,
*		Replacement light boxes.
*
*		For syndicate call-ins see uplink_kits.dm
*
*  EDITED BY APOPHIS 09OCT2015 to prevent in-game abuse of boxes.
*/

#define BOX_OVERLAY_SHIFT_X 6
#define BOX_OVERLAY_SHIFT_Y 4 //one less than the 6x5 sprite to make them overlap on each other a bit.

#define BOX_MAGAZINE_OFFSET_X 5
#define BOX_MAGAZINE_OFFSET_Y 11
#define BOX_MAGAZINE_COLUMNS 4
#define BOX_MAGAZINE_ROWS 2

#define BOX_MAGAZINE_COMPACT_OFFSET_X 7
#define BOX_MAGAZINE_COMPACT_OFFSET_Y 10
#define BOX_MAGAZINE_COMPACT_COLUMNS 3
#define BOX_MAGAZINE_COMPACT_ROWS 2

#define BOX_GRENADE_OFFSET_X 7
#define BOX_GRENADE_OFFSET_Y 10
#define BOX_GRENADE_COLUMNS 3
#define BOX_GRENADE_ROWS 2

/obj/item/storage/box
	name = "板条箱"
	desc = "这只是一个普通的箱子。"
	icon_state = "box"
	icon = 'icons/obj/items/storage/box.dmi'
	worn_icon_state = "syringe_kit"
	w_class = WEIGHT_CLASS_BULKY //Changed becuase of in-game abuse
	var/obj/item/spawn_type
	var/spawn_number
	storage_type = /datum/storage/box

/obj/item/storage/box/Initialize(mapload, ...)
	. = ..()
	if(spawn_type)
		if(!(spawn_type in storage_datum.can_hold))
			// must be set before parent init for typecacheof
			var/list/new_hold_list = storage_datum.can_hold + spawn_type
			storage_datum.set_holdable(can_hold_list = list(new_hold_list))
	if(spawn_type)
		for(var/i in 1 to spawn_number)
			new spawn_type(src)

/obj/item/storage/box/survival
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/box/survival/PopulateContents()
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/emergency_oxygen(src)

/obj/item/storage/box/engineer/PopulateContents()
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/emergency_oxygen/engi(src)

/obj/item/storage/box/gloves
	name = "乳胶手套盒"
	desc = "内含白色手套。"
	icon_state = "latex"
	spawn_type = /obj/item/clothing/gloves/latex
	spawn_number = 7
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/box/masks
	name = "无菌口罩盒"
	desc = "这个箱子里装着无菌口罩。"
	icon_state = "sterile"
	spawn_type = /obj/item/clothing/mask/surgical
	spawn_number = 7
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/box/syringes
	name = "注射器盒"
	desc = "装满注射器的箱子。"
	spawn_type = /obj/item/reagent_containers/syringe
	spawn_number = 7
	icon_state = "syringe"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/box/beakers
	name = "烧杯盒"
	icon_state = "beaker"
	spawn_type = /obj/item/reagent_containers/glass/beaker
	spawn_number = 7
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/box/flashbangs
	name = "闪光震撼弹箱（警告）"
	desc = "<B>警告：这些装置极其危险，反复使用可能导致失明或失聪。</B>"
	icon_state = "flashbang"
	spawn_type = /obj/item/explosive/grenade/flashbang
	spawn_number = 7
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/box/emps
	name = "一盒电磁脉冲手雷"
	desc = "装有5枚电磁脉冲手雷的箱子。"
	icon_state = "flashbang"
	spawn_type = /obj/item/explosive/grenade/emp
	spawn_number = 5

/obj/item/storage/box/rxglasses
	name = "处方眼镜盒"
	desc = "这个盒子里装着书呆子眼镜。"
	icon_state = "glasses"
	spawn_type = /obj/item/clothing/glasses/regular
	spawn_number = 7
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/box/drinkingglasses
	name = "一箱玻璃杯"
	desc = "上面印有酒杯的图案。"
	spawn_type = /obj/item/reagent_containers/cup/glass/drinkingglass
	spawn_number = 6

/obj/item/storage/box/condimentbottles
	name = "调味品瓶盒"
	desc = "上面有一大片番茄酱污渍。"
	spawn_type = /obj/item/reagent_containers/food/condiment
	spawn_number = 6

/obj/item/storage/box/cups
	name = "纸杯盒"
	desc = "它的正面印有纸杯的图案。"
	spawn_type = /obj/item/reagent_containers/food/drinks/sillycup
	spawn_number = 7

/obj/item/storage/box/donkpockets
	name = "一盒顿克口袋饼"
	desc = "<B>使用说明：</B> <I>放入微波炉加热。若七分钟内未食用，产品将冷却。</I>"
	icon_state = "donk_kit"
	spawn_type = /obj/item/reagent_containers/food/snacks/donkpocket
	spawn_number = 6
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/box/monkeycubes
	name = "猴子方块盒"
	desc = "Drymate牌猴子方块。加水即可！"
	icon = 'icons/obj/items/food/packaged.dmi'
	icon_state = "monkeycubebox"
	spawn_type = /obj/item/reagent_containers/food/snacks/monkeycube/wrapped
	spawn_number = 5

/obj/item/storage/box/monkeycubes/farwacubes
	name = "法瓦方块盒"
	desc = "德莱美特牌法瓦方块，从阿多米星发货。只需加水！"
	spawn_type = /obj/item/reagent_containers/food/snacks/monkeycube/wrapped/farwacube

/obj/item/storage/box/monkeycubes/stokcubes
	name = "斯托克方块盒"
	desc = "德莱美特牌浓缩汤块，从莫格斯星运来。只需加水！"
	spawn_type = /obj/item/reagent_containers/food/snacks/monkeycube/wrapped/stokcube

/obj/item/storage/box/monkeycubes/neaeracubes
	name = "异形方块盒"
	desc = "Drymate牌尼亚拉方块，从贾贡4号星运来。只需加水！"
	spawn_type = /obj/item/reagent_containers/food/snacks/monkeycube/wrapped/neaeracube

/obj/item/storage/box/ids
	name = "备用身份牌盒"
	desc = "有这么多空白的身份牌。"
	icon_state = "id"
	spawn_type = /obj/item/card/id
	spawn_number = 7

/obj/item/storage/box/ids/dogtag
	name = "备用狗牌盒"
	desc = "有这么多空白的狗牌。"
	icon_state = "id"
	spawn_type = /obj/item/card/id/dogtag
	spawn_number = 7

/obj/item/storage/box/handcuffs
	name = "手铐盒"
	desc = "装满手铐的箱子。"
	icon_state = "handcuff"
	spawn_type = /obj/item/restraints/handcuffs
	spawn_number = 7

/obj/item/storage/box/zipcuffs
	name = "一盒约束带"
	desc = "装满拉链手铐的箱子。"
	icon_state = "handcuff"
	spawn_type = /obj/item/restraints/handcuffs/zip
	spawn_number = 14

/obj/item/storage/box/mousetraps
	name = "一盒害虫克星捕鼠器"
	desc = "<B><FONT color='red'>警告：</FONT></B> <I>请置于儿童接触不到的地方</I>。"
	icon_state = "mousetraps"
	spawn_type = /obj/item/assembly/mousetrap
	spawn_number = 6

/obj/item/storage/box/pillbottles
	name = "药瓶盒"
	desc = "它的正面印有药瓶的图案。"
	spawn_type = /obj/item/storage/pill_bottle
	spawn_number = 7

/obj/item/storage/box/snappops
	name = "啪嗒盒"
	desc = "八包欢乐！适合8岁及以上。不适合儿童。"
	icon = 'icons/obj/items/toy.dmi'
	icon_state = "spbox"
	spawn_type = /obj/item/toy/snappop
	spawn_number = 8

/obj/item/storage/box/snappops/Initialize(mapload, ...)
	. = ..()
	storage_datum.max_storage_space = 8

/obj/item/storage/box/matches
	name = "火柴盒"
	desc = "一小盒'太空专用'高级火柴。"
	icon = 'icons/obj/items/cigarettes.dmi'
	icon_state = "matchbox"
	worn_icon_state = "zippo"
	w_class = WEIGHT_CLASS_TINY
	equip_slot_flags = ITEM_SLOT_BELT
	spawn_type = /obj/item/tool/match
	spawn_number = 14

/obj/item/storage/box/matches/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/tool/match))
		var/obj/item/tool/match/M = I

		if(M.heat || M.burnt)
			return ..()

		if(prob(50))
			playsound(loc, 'sound/items/matchstick_lit.ogg', 15, 1)
			M.light_match()
		else
			playsound(loc, 'sound/items/matchstick_hit.ogg', 15, 1)
		return TRUE
	else
		return ..()

/obj/item/storage/box/autoinjectors
	name = "注射器盒"
	desc = "装有自动注射器。"
	icon_state = "syringe"
	spawn_type = /obj/item/reagent_containers/hypospray/autoinjector/tricordrazine
	spawn_number = 7

/obj/item/storage/box/quickclot
	name = "快速凝血注射器盒"
	desc = "内含快速凝血自动注射器。"
	icon_state = "syringe"
	spawn_type = /obj/item/reagent_containers/hypospray/autoinjector/quickclot
	spawn_number = 7

/obj/item/storage/box/lights
	name = "灯泡替换盒"
	icon_state = "light"
	desc = "这个盒子的内部形状设计得只能容纳灯管和灯泡。"
	worn_icon_state = "syringe_kit"
	spawn_type = /obj/item/light_bulb/bulb
	spawn_number = 21
	storage_type = /datum/storage/box/lights

/obj/item/storage/box/lights/bulbs // mapping placeholder

/obj/item/storage/box/lights/tubes
	name = "替换管盒"
	icon_state = "lighttube"
	w_class = WEIGHT_CLASS_NORMAL
	spawn_type = /obj/item/light_bulb/tube/large
	spawn_number = 21

/obj/item/storage/box/lights/mixed
	name = "替换灯泡盒"
	icon_state = "lightmixed"

/obj/item/storage/box/lights/mixed/Initialize(mapload, ...)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/light_bulb/tube/large,
		/obj/item/light_bulb/bulb,
	))

	for(var/i in 1 to 14)
		new /obj/item/light_bulb/tube/large(src)
	for(var/i in 1 to 7)
		new /obj/item/light_bulb/bulb(src)

/obj/item/storage/box/trampop
	name = "一盒 Tram-pops"
	desc = "也许你表现好的话，医生会奖励你一个。"
	icon_state = "trampop"
	spawn_type = /obj/item/reagent_containers/food/snacks/lollipop/tramadol
	spawn_number = 14
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/box/combat_lolipop
	name = "一盒通讯棒棒糖"
	desc = "一小盒棒棒糖，内含能缓慢治愈你的混合试剂。建议吮吸而非直接食用。"
	icon_state = "lolipop_box_generic"
	spawn_type = /obj/item/reagent_containers/food/snacks/lollipop/combat
	spawn_number = 10
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/box/combat_lolipop/Initialize(mapload, ...)
	. = ..()
	storage_datum.draw_mode = TRUE

/obj/item/storage/box/combat_lolipop/tricord
	name = "一盒三氯氰胺棒棒糖"
	desc = "一小盒棒棒糖，里面混有缓慢释放的三效宁。建议含服，而非直接咀嚼。"
	icon_state = "lolipop_box_tricord"
	spawn_type = /obj/item/reagent_containers/food/snacks/lollipop/tricord

/obj/item/storage/box/combat_lolipop/tramadol
	name = "一盒 Tram-pops"
	desc = "一小盒棒棒糖，内含曲马多成分以帮助缓解疼痛，建议含服而非咀嚼。"
	icon_state = "lolipop_box_tramadol"
	spawn_type = /obj/item/reagent_containers/food/snacks/lollipop/tramadol/combat



////////// MARINES BOXES //////////////////////////


/obj/item/storage/box/explosive_mines
	name = "\improper M20地雷箱"
	desc = "一个装有反人员近程地雷的安全箱。"
	icon_state = "minebox"
	w_class = WEIGHT_CLASS_NORMAL
	spawn_type = /obj/item/explosive/mine
	spawn_number = 5

/obj/item/storage/box/explosive_mines/Initialize(mapload, ...)
	. = ..()
	storage_datum.max_storage_space = 10

/obj/item/storage/box/explosive_mines/update_icon_state()
	. = ..()
	icon_state = initial(icon_state)
	if(!length(contents))
		icon_state += "_e"

/obj/item/storage/box/explosive_mines/large
	name = "\improper M20地雷箱"
	desc = "一个装有反人员近程地雷的大型安全箱。"
	icon_state = "minebox"
	spawn_type = /obj/item/explosive/mine
	spawn_number = 10

/obj/item/storage/box/explosive_mines/large/Initialize(mapload, ...)
	. = ..()
	storage_datum.max_storage_space = 20

/obj/item/storage/box/explosive_mines/pmc
	name = "\improper M20P 地雷箱"
	spawn_type = /obj/item/explosive/mine/pmc

/obj/item/storage/box/explosive_mines/antitank
	name = "\improper M92 地雷箱"
	desc = "一个装有反坦克近炸地雷的安全箱。"
	icon_state = "atminebox"
	spawn_type = /obj/item/explosive/mine/anti_tank
	spawn_number = 5

/obj/item/storage/box/m94
	name = "\improper M40 FLDP 照明弹包"
	desc = "一包七枚M40 FLDP照明弹。由TGMC陆战队员携带，用于照亮普通TNR肩灯无法触及的黑暗区域。可从下挂式榴弹发射器发射。"
	icon_state = "m40"
	w_class = WEIGHT_CLASS_SMALL
	spawn_type = /obj/item/explosive/grenade/flare
	spawn_number = 14

/obj/item/storage/box/m94/Initialize(mapload, ...)
	. = ..()
	storage_datum.max_storage_space = 14

/obj/item/storage/box/m94/update_icon_state()
	. = ..()
	icon_state = initial(icon_state)
	if(!length(contents))
		icon_state += "_e"

/obj/item/storage/box/m94/cas
	name = "\improper M50 CFDP信号包"
	desc = "一包七枚 M40 CFPD 信号照明弹。用于为火力支援标记位置。可从下挂式榴弹发射器发射。"
	icon_state = "m50"
	spawn_type = /obj/item/explosive/grenade/flare/cas

//ITEMS-----------------------------------//
/obj/item/storage/box/lightstick
	name = "荧光棒盒"
	desc = "内含蓝色荧光棒。"
	icon_state = "lightstick"
	spawn_type = /obj/item/lightstick
	spawn_number = 7

/obj/item/storage/box/lightstick/red
	desc = "内含红色荧光棒。"
	icon_state = "lightstick2"
	spawn_type = /obj/item/lightstick/red
	spawn_number = 7

/obj/item/storage/box/MRE
	name = "\improper TGMC 单兵即食口粮"
	desc = "即食口粮，专为战场环境设计，其保质期远超陆战队员的平均作战寿命二十年。"
	icon_state = "mealpack"
	w_class = WEIGHT_CLASS_SMALL
	///If our MRE is opened, it gets a new icon
	var/isopened = 0
	storage_type = /datum/storage/box/mre

/obj/item/storage/box/MRE/PopulateContents()
	var/entree = pick("boneless pork ribs", "grilled chicken", "pizza square", "spaghetti", "chicken tenders")
	var/side = pick("meatballs", "cheese spread", "beef turnover", "mashed potatoes")
	var/snack = pick("biscuit", "pretzels", "peanuts", "cracker")
	var/desert = pick("spiced apples", "chocolate brownie", "sugar cookie", "choco bar", "crayon")
	name = "[initial(name)] ([entree])"
	new /obj/item/reagent_containers/food/snacks/packaged_meal(src, entree)
	new /obj/item/reagent_containers/food/snacks/packaged_meal(src, side)
	new /obj/item/reagent_containers/food/snacks/packaged_meal(src, snack)
	new /obj/item/reagent_containers/food/snacks/packaged_meal(src, desert)

/obj/item/storage/box/MRE/update_icon_state()
	. = ..()
	if(!isopened)
		isopened = 1
		icon_state += "opened"

/obj/item/storage/box/MRE/som
	name = "\improper 火星之子 MFR"
	desc = "一份火星野战口粮，保证每一口都带有火星的味道。"
	icon_state = "som_mealpack"

/obj/item/storage/box/MRE/som/Initialize(mapload, ...)
	. = ..()
	storage_datum.trash_item = /obj/item/trash/mre/som

/**
 * # fillable box
 *
 * Deployable box with fancy visuals of its contents
 * Visual content defined in the icon_state_mini var in /obj/item
 * All other visuals that do not have a icon_state_mini defined are in var/assoc_overlay
 */
/obj/item/storage/box/visual
	name = "通用板条箱"
	desc = "这个箱子能够容纳多种多样的补给品。"
	icon = 'icons/obj/items/storage/storage_boxes.dmi'
	icon_state = "mag_box"
	worn_icon_state = "mag_box"
	w_class = WEIGHT_CLASS_HUGE
	slowdown = 0.4 // Big unhandly box
	///Assoc list of how much weight every item type takes. Used to determine how many overlays to make.
	var/list/contents_weight = list()
	///Initial pixel_x offset of the overlays.
	var/overlay_pixel_x = BOX_MAGAZINE_OFFSET_X
	///Initial pixel_y offset of the overlays.
	var/overlay_pixel_y = BOX_MAGAZINE_OFFSET_Y
	///Amount of columns in the overlay grid.
	var/amt_horizontal = BOX_MAGAZINE_COLUMNS
	///Amount of rows in the overlay grid.
	var/amt_vertical = BOX_MAGAZINE_ROWS
	///Amount of pixels to shift each overlay for each column.
	var/shift_x = BOX_OVERLAY_SHIFT_X
	///Amount of pixels to shift each overlay for each row.
	var/shift_y = BOX_OVERLAY_SHIFT_Y
	///Whether or not the box is deployed on the ground
	var/deployed = FALSE
	///Amount of different items in the box.
	var/variety = 0
	///Amount of weight a single overlay can cover.
	var/overlay_w_class = 0
	///Total max amount of overlay spaces
	var/max_overlays = 0
	///Overlay icon_state to display on the box when it is closed
	var/closed_overlay
	///Overlay icon_state to display on the box when it is open
	var/open_overlay
	storage_type = /datum/storage/box/visual

/obj/item/storage/box/visual/Initialize(mapload, ...)
	. = ..()

/obj/item/storage/box/visual/Destroy()
	contents_weight = null
	return ..()

/// Updates certain vars used primarily (but not exclusively) for the creation of the overlays.
/obj/item/storage/box/visual/proc/update_stats()
	SHOULD_CALL_PARENT(TRUE)
	max_overlays = amt_horizontal * amt_vertical
	overlay_w_class = FLOOR(storage_datum.max_storage_space / max_overlays, 1)
	update_icon() //Getting the closed_overlay onto it

/obj/item/storage/box/visual/examine(mob/user, distance, infix, suffix)
	. = ..()
	if (!deployed && !(loc == user)) //Closed and not in your possession
		return
	if(variety > max_overlays) //Too much shit inside, a literal clusterfuck of supplies
		. += "It's too cluttered with all of these supplies inside."
		return
	if(variety <= 0) //empy
		. += "It is empty!"
		return
	. += "It contains:"
	for(var/obj/item/I AS in contents_weight)
		if(contents_weight[I] < overlay_w_class)
			. += "A bit of: [initial(I.name)]."
		else if(contents_weight[I] < 3 * overlay_w_class)
			. += "Some of: [initial(I.name)]."
		else
			. += "A lot of: [initial(I.name)]."

/obj/item/storage/box/visual/attack_self(mob/user)
	update_stats()
	deployed = TRUE
	user.dropItemToGround(src)
	update_icon()
	pixel_x = 0 //Big sprite so lets not shift it around.
	pixel_y = 0

/obj/item/storage/box/visual/attack_hand(mob/living/user)
	if(loc == user)
		storage_datum.open(user) //Always show content when holding box
		return

	if(!deployed)
		update_stats()
		user.put_in_hands(src)
		return

	else if(deployed)
		storage_datum.draw_mode = variety == 1? TRUE: FALSE //If only one type of item in box, then quickdraw it.
		if(storage_datum.draw_mode && ishuman(user) && length(contents))
			var/obj/item/I = contents[length(contents)]
			I.attack_hand(user)
			return
		storage_datum.open(user)

/obj/item/storage/box/visual/MouseDrop(atom/over_object)
	if(!deployed)
		return

	if(!ishuman(over_object))
		return

	var/mob/living/carbon/human/H = over_object
	if(H == usr && !H.incapacitated() && Adjacent(H) && H.put_in_hands(src))
		deployed = FALSE
		update_icon()

/obj/item/storage/box/visual/update_icon_state()
	. = ..()

	variety = 0

	//Fill assoc list of every item type in the crate and have it's value be the total weight it takes up.
	contents_weight = list()
	for(var/obj/item/I AS in contents)
		if(!contents_weight[I.type])
			contents_weight[I.type] = 0
			variety++
		contents_weight[I.type] += I.w_class

	if(!deployed)
		icon_state = "[initial(icon_state)]"
		return
	if(variety > max_overlays) // Too many items inside so lets make it cluttered
		icon_state = "[initial(icon_state)]_mixed"
		return

	icon_state = "[initial(icon_state)]_open"

/obj/item/storage/box/visual/update_overlays()
	. = ..()

	if(!deployed)
		icon_state = "[initial(icon_state)]"
		if(closed_overlay)
			. += mutable_appearance('icons/obj/items/storage/storage_boxes.dmi', closed_overlay)
		return // We early return here since we don't draw the insides when it's closed.

	if(open_overlay)
		. += mutable_appearance('icons/obj/items/storage/storage_boxes.dmi', open_overlay)

	if(variety > max_overlays) // Too many items inside so lets make it cluttered
		return

	//Determine the amount of overlays to draw
	var/total_overlays = 0
	for(var/object in contents_weight)
		total_overlays += 1 + FLOOR(contents_weight[object] / overlay_w_class, 1)

	//In case 6 overlays are for a LMG and then someone adds 7 unique tiny items into the mix
	var/overlay_overflow = max(0, total_overlays - max_overlays)

	//The Xth overlay being drawed.
	var/current_iteration = 1

	for(var/obj_typepath in contents_weight) //Max [total_overlays] items in contents_weight since otherwise the icon_state would be "mixed"
		var/overlays_to_draw = 1 + FLOOR(contents_weight[obj_typepath] / overlay_w_class, 1) //Always draw at least 1 icon per unique item and add additional icons if it takes a lot of weight inside.
		if(overlay_overflow)//This makes sure no matter the configuration, every item will get at least 1 spot in the mix.
			var/adjustment = min(overlay_overflow, overlays_to_draw - 1)
			overlay_overflow -= adjustment
			overlays_to_draw -= adjustment
			total_overlays -= adjustment

		for(var/i = 1 to overlays_to_draw) //Same item type, but now we actually draw them since we know how many to draw
			var/imagepixel_w = overlay_pixel_x + FLOOR((current_iteration / amt_vertical) - 0.01, 1) * shift_x //Shift to the right only after all vertical spaces are occupied.
			var/imagepixel_z = overlay_pixel_y + min(amt_vertical - WRAP(current_iteration - 1, 0, amt_vertical) - 1, total_overlays - current_iteration) * shift_y //Vertical shifting that draws the top overlays first if applicable
			//Getting the mini icon_state to display
			var/obj/item/relateditem = obj_typepath

			var/mutable_appearance/new_overlay = mutable_appearance('icons/obj/items/items_mini.dmi', initial(relateditem.icon_state_mini))
			new_overlay.pixel_w = imagepixel_w
			new_overlay.pixel_z = imagepixel_z
			. += new_overlay
			current_iteration++

// --MAG BOXES--
/obj/item/storage/box/visual/magazine
	name = "弹药箱"
	desc = "这个箱子能够容纳多种补给品，主要是军用级弹药。"
	icon_state = "mag_box"
	storage_type = /datum/storage/box/visual/magazine

/obj/item/storage/box/visual/magazine/compact
	name = "紧凑型弹匣盒"
	desc = "一个设计精良的箱子，专门用于存放大量弹药。"
	icon_state = "mag_box_small"
	overlay_pixel_x = BOX_MAGAZINE_COMPACT_OFFSET_X
	overlay_pixel_y = BOX_MAGAZINE_COMPACT_OFFSET_Y
	amt_horizontal = BOX_MAGAZINE_COMPACT_COLUMNS
	amt_vertical = BOX_MAGAZINE_COMPACT_ROWS
	storage_type = /datum/storage/box/visual/magazine/compact

/obj/item/storage/box/visual/magazine/compact/update_stats()
	for(var/item_path in storage_datum.can_hold)
		var/obj/item/I = item_path
		if(I)
			storage_datum.max_storage_space = max(initial(I.w_class) * storage_datum.storage_slots, storage_datum.max_storage_space)
			storage_datum.max_w_class = max(initial(I.w_class), storage_datum.max_w_class)
	return ..()

// --PREFILLED MAG BOXES--

// -Pistol-

/obj/item/storage/box/visual/magazine/compact/standard_pistol
	name = "P-14 弹匣盒"
	desc = "专门设计用于容纳大量P-14弹匣的盒子。"
	closed_overlay = "mag_box_small_overlay_p14"

/obj/item/storage/box/visual/magazine/compact/standard_pistol/Initialize(mapload, ...)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/pistol/standard_pistol,
	))

/obj/item/storage/box/visual/magazine/compact/standard_pistol/full
	spawn_number = 40
	spawn_type = /obj/item/ammo_magazine/pistol/standard_pistol

/obj/item/storage/box/visual/magazine/compact/standard_heavypistol
	name = "P-23 弹匣盒"
	desc = "一个专门设计用于容纳大量P-23弹匣的盒子。"
	closed_overlay = "mag_box_small_overlay_p23"

/obj/item/storage/box/visual/magazine/compact/standard_heavypistol/Initialize(mapload, ...)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/pistol/standard_heavypistol,
	))

/obj/item/storage/box/visual/magazine/compact/standard_heavypistol/full
	spawn_number = 40
	spawn_type = /obj/item/ammo_magazine/pistol/standard_heavypistol

/obj/item/storage/box/visual/magazine/compact/standard_revolver
	name = "R-44快速装弹器盒"
	desc = "专为存放大量R-44快速装弹器而设计的盒子。"
	closed_overlay = "mag_box_small_overlay_r44"

/obj/item/storage/box/visual/magazine/compact/standard_revolver/Initialize(mapload, ...)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/revolver/standard_revolver,
	))

/obj/item/storage/box/visual/magazine/compact/standard_revolver/full
	spawn_number = 40
	spawn_type = /obj/item/ammo_magazine/revolver/standard_revolver

/obj/item/storage/box/visual/magazine/compact/standard_pocketpistol
	name = "P-17 弹匣盒"
	desc = "专门设计用于容纳大量P-17弹匣的盒子。"
	closed_overlay = "mag_box_small_overlay_p17"

/obj/item/storage/box/visual/magazine/compact/standard_pocketpistol/Initialize(mapload, ...)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/pistol/standard_pocketpistol,
	))

/obj/item/storage/box/visual/magazine/compact/standard_pocketpistol/full
	spawn_number = 40
	spawn_type = /obj/item/ammo_magazine/pistol/standard_pocketpistol

/obj/item/storage/box/visual/magazine/compact/vp70
	name = "88M4 弹匣盒"
	desc = "专门设计用于容纳大量88M4弹匣的箱子。"
	closed_overlay = "mag_box_small_overlay_88m4"

/obj/item/storage/box/visual/magazine/compact/vp70/Initialize(mapload, ...)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/pistol/vp70,
	))

/obj/item/storage/box/visual/magazine/compact/vp70/full
	spawn_number = 40
	spawn_type = /obj/item/ammo_magazine/pistol/vp70


/obj/item/storage/box/visual/magazine/compact/derringer
	name = ".40 边缘发火弹药包盒"
	desc = "一个专门设计用于存放大量.40边缘发火弹药包的盒子。"
	closed_overlay = "mag_box_small_overlay_derringer"

/obj/item/storage/box/visual/magazine/compact/derringer/Initialize(mapload, ...)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/pistol/derringer,
	))

/obj/item/storage/box/visual/magazine/compact/derringer/full
	spawn_number = 40
	spawn_type = /obj/item/ammo_magazine/pistol/derringer

/obj/item/storage/box/visual/magazine/compact/plasma_pistol
	name = "PP-7 等离子体电池盒"
	desc = "专门设计用于存放大量PP-7等离子体电池的箱子。"
	closed_overlay = "mag_box_small_overlay_pp7"

/obj/item/storage/box/visual/magazine/compact/plasma_pistol/Initialize(mapload, ...)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/pistol/plasma_pistol,
	))

/obj/item/storage/box/visual/magazine/compact/plasma_pistol/full
	spawn_number = 40
	spawn_type = /obj/item/ammo_magazine/pistol/plasma_pistol

// -SMG-

/obj/item/storage/box/visual/magazine/compact/standard_smg
	name = "SMG-90 冲锋枪弹匣箱"
	desc = "专为存放大量SMG-90冲锋枪弹匣设计的箱子。"
	closed_overlay = "mag_box_small_overlay_smg90"

/obj/item/storage/box/visual/magazine/compact/standard_smg/Initialize(mapload, ...)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/smg/standard_smg,
	))

/obj/item/storage/box/visual/magazine/compact/standard_smg/full
	spawn_number = 40
	spawn_type = /obj/item/ammo_magazine/smg/standard_smg

/obj/item/storage/box/visual/magazine/compact/standard_machinepistol
	name = "MP-19 弹匣箱"
	desc = "专门设计用于容纳大量MP-19弹匣的盒子。"
	closed_overlay = "mag_box_small_overlay_mp19"

/obj/item/storage/box/visual/magazine/compact/standard_machinepistol/Initialize(mapload, ...)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/smg/standard_machinepistol,
	))

/obj/item/storage/box/visual/magazine/compact/standard_machinepistol/full
	spawn_number = 40
	spawn_type = /obj/item/ammo_magazine/smg/standard_machinepistol

/obj/item/storage/box/visual/magazine/compact/pepperball
	name = "胡椒弹气罐箱"
	desc = "专门设计用于存放大量胡椒弹罐的箱子。"
	closed_overlay = "mag_box_small_overlay_pepperball"

/obj/item/storage/box/visual/magazine/compact/pepperball/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/rifle/pepperball,
	))

/obj/item/storage/box/visual/magazine/compact/pepperball/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/pepperball


/obj/item/storage/box/visual/magazine/compact/standard_heavysmg
	name = "SMG-45 冲锋枪弹匣盒"
	desc = "专门用于存放大量SMG-45冲锋枪弹匣的箱子。"
	closed_overlay = "mag_box_small_overlay_smg45"

/obj/item/storage/box/visual/magazine/compact/standard_heavysmg/Initialize(mapload, ...)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/smg/standard_heavysmg,
	))

/obj/item/storage/box/visual/magazine/compact/standard_heavysmg/full
	spawn_number = 40
	spawn_type = /obj/item/ammo_magazine/smg/standard_heavysmg

/obj/item/storage/box/visual/magazine/compact/standard_heavysmg/squash
	name = "SMG-45 压制弹匣箱"
	desc = "专门设计用于容纳大量SMG-45冲锋枪弹匣的箱子。"
	closed_overlay = "mag_box_small_overlay_smg45_squash"

/obj/item/storage/box/visual/magazine/compact/standard_heavysmg/squash/full
	spawn_number = 40
	spawn_type = /obj/item/ammo_magazine/smg/standard_heavysmg/squashhead

// -Rifle-

/obj/item/storage/box/visual/magazine/compact/standard_assaultrifle
	name = "AR-12 弹匣箱"
	desc = "专门设计用于容纳大量AR-12弹匣的盒子。"
	closed_overlay = "mag_box_small_overlay_ar12"

/obj/item/storage/box/visual/magazine/compact/standard_assaultrifle/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/rifle/standard_assaultrifle,
	))

/obj/item/storage/box/visual/magazine/compact/standard_assaultrifle/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/standard_assaultrifle

/obj/item/storage/box/visual/magazine/compact/standard_carbine
	name = "AR-18 弹匣箱"
	desc = "专门设计用于容纳大量AR-18弹匣的盒子。"
	closed_overlay = "mag_box_small_overlay_ar18"

/obj/item/storage/box/visual/magazine/compact/standard_carbine/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/rifle/standard_carbine,
	))

/obj/item/storage/box/visual/magazine/compact/standard_carbine/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/standard_carbine

/obj/item/storage/box/visual/magazine/compact/standard_skirmishrifle
	name = "AR-21 弹匣盒"
	desc = "专门设计用于容纳大量AR-21弹匣的盒子。"
	closed_overlay = "mag_box_small_overlay_ar21"

/obj/item/storage/box/visual/magazine/compact/standard_skirmishrifle/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/rifle/standard_skirmishrifle,
	))

/obj/item/storage/box/visual/magazine/compact/standard_skirmishrifle/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/standard_skirmishrifle

/obj/item/storage/box/visual/magazine/compact/ar11
	name = "AR-11 弹匣箱"
	desc = "专门设计用于容纳大量AR-11弹匣的箱子。"
	closed_overlay = "mag_box_small_overlay_ar11"

/obj/item/storage/box/visual/magazine/compact/ar11/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/rifle/tx11,
	))

/obj/item/storage/box/visual/magazine/compact/ar11/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/tx11

/obj/item/storage/box/visual/magazine/compact/martini
	name = "马蒂尼-亨利弹药包盒"
	desc = "专为存放大量马提尼弹药包而设计的箱子。"
	closed_overlay = "mag_box_small_overlay_martini"

/obj/item/storage/box/visual/magazine/compact/martini/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/rifle/martini,
	))

/obj/item/storage/box/visual/magazine/compact/martini/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/martini

/obj/item/storage/box/visual/magazine/compact/sh15
	name = "SH-15 弹匣箱"
	desc = "专门设计用于容纳大量SH-15弹匣的盒子。"
	closed_overlay = "mag_box_small_overlay_sh15"

/obj/item/storage/box/visual/magazine/compact/sh15/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/rifle/tx15_flechette,
		/obj/item/ammo_magazine/rifle/tx15_slug,
	))

/obj/item/storage/box/visual/magazine/compact/sh15/flechette
	name = "SH-15 飞镖弹匣盒"
	closed_overlay = "mag_box_small_overlay_sh15_flechette"

/obj/item/storage/box/visual/magazine/compact/sh15/flechette/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/tx15_flechette

/obj/item/storage/box/visual/magazine/compact/sh15/slug
	name = "SH-15独头弹弹匣盒"
	closed_overlay = "mag_box_small_overlay_sh15_slug"

/obj/item/storage/box/visual/magazine/compact/sh15/slug/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/tx15_slug

// sh410
/obj/item/storage/box/visual/magazine/compact/sh410
	name = "SH-410 弹匣盒"
	desc = "专门设计用于容纳大量SH-410弹匣的盒子。"
	closed_overlay = "mag_box_small_overlay_sh410"

/obj/item/storage/box/visual/magazine/compact/sh410/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/rifle/sh410_buckshot,
		/obj/item/ammo_magazine/rifle/sh410_sabot,
		/obj/item/ammo_magazine/rifle/sh410_tracker,
	))

/obj/item/storage/box/visual/magazine/compact/sh410/buckshot
	name = "SH-410 鹿弹弹匣盒"
	closed_overlay = "mag_box_small_overlay_sh410_buckshot"

/obj/item/storage/box/visual/magazine/compact/sh410/buckshot/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/sh410_buckshot

/obj/item/storage/box/visual/magazine/compact/sh410/sabot
	name = "SH-410 脱壳弹弹匣盒"
	closed_overlay = "mag_box_small_overlay_sh410_sabot"

/obj/item/storage/box/visual/magazine/compact/sh410/sabot/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/sh410_sabot

/obj/item/storage/box/visual/magazine/compact/sh410/tracker
	name = "SH-410 追踪器弹匣盒"
	closed_overlay = "mag_box_small_overlay_sh410_tracker"

/obj/item/storage/box/visual/magazine/compact/sh410/tracker/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/sh410_tracker

/obj/item/storage/box/visual/magazine/compact/sectoid_rifle
	name = "可疑的发光盒子"
	desc = "一个散发着紫色光芒的盒子，顶部印着大大的'绝密'标签，还印着各种阴谋论调。真是满口胡言！"
	closed_overlay = "mag_box_small_overlay_sectoid_rifle"
	open_overlay = "mag_box_small_overlay_sectoid_rifle_open"

/obj/item/storage/box/visual/magazine/compact/sectoid_rifle/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/rifle/sectoid_rifle,
	))

/obj/item/storage/box/visual/magazine/compact/sectoid_rifle/examine(mob/user, distance, infix, suffix)
	. = ..()
	if(deployed)
		. += "The inside is smeared with some purple glowy goo. Better not touch it."

/obj/item/storage/box/visual/magazine/compact/sectoid_rifle/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/sectoid_rifle

// -Energy-

/obj/item/storage/box/visual/magazine/compact/lasrifle
	name = "地球政府实验电池盒"
	desc = "专为存放大量地球政府实验型电池而设计的箱子。"
	closed_overlay = "mag_box_small_overlay_te"

/obj/item/storage/box/visual/magazine/compact/lasrifle/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/cell/lasgun/lasrifle,
	))

/obj/item/storage/box/visual/magazine/compact/lasrifle/full
	spawn_number = 30
	spawn_type = /obj/item/cell/lasgun/lasrifle

// -Marksmen-

/obj/item/storage/box/visual/magazine/compact/standard_dmr
	name = "DMR-37 弹匣盒"
	desc = "专为存放大量DMR-37弹匣而设计的箱子。"
	closed_overlay = "mag_box_small_overlay_dmr37"

/obj/item/storage/box/visual/magazine/compact/standard_dmr/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/rifle/standard_dmr,
	))

/obj/item/storage/box/visual/magazine/compact/standard_dmr/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/standard_dmr

/obj/item/storage/box/visual/magazine/compact/standard_br
	name = "BR-64 弹匣箱"
	desc = "专门设计用于容纳大量BR-64弹匣的盒子。"
	closed_overlay = "mag_box_small_overlay_br64"

/obj/item/storage/box/visual/magazine/compact/standard_br/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/rifle/standard_br,
	))

/obj/item/storage/box/visual/magazine/compact/standard_br/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/standard_br

/obj/item/storage/box/visual/magazine/compact/chamberedrifle
	name = "SR-127 弹匣盒"
	desc = "专门设计用于容纳大量SR-127弹匣的盒子。"
	closed_overlay = "mag_box_small_overlay_sr127"

/obj/item/storage/box/visual/magazine/compact/chamberedrifle/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/rifle/chamberedrifle,
	))

/obj/item/storage/box/visual/magazine/compact/chamberedrifle/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/chamberedrifle

/obj/item/storage/box/visual/magazine/compact/mosin
	name = "莫辛纳甘弹药包"
	desc = "专为存放大量莫辛弹包而设计的箱子。"
	closed_overlay = "mag_box_small_overlay_mosin"

/obj/item/storage/box/visual/magazine/compact/mosin/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/rifle/bolt,
		/obj/item/ammo_magazine/rifle/boltclip,
	))

/obj/item/storage/box/visual/magazine/compact/mosin/packet/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/bolt

/obj/item/storage/box/visual/magazine/compact/mosin/clip/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/rifle/boltclip

// -Machinegun-

/obj/item/storage/box/visual/magazine/compact/standard_lmg
	name = "MG-42 弹鼓箱"
	desc = "一个专门设计用于容纳大量MG-42弹鼓的箱子。"
	closed_overlay = "mag_box_small_overlay_mg42"

/obj/item/storage/box/visual/magazine/compact/standard_lmg/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/standard_lmg,
	))

/obj/item/storage/box/visual/magazine/compact/standard_lmg/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/standard_lmg

/obj/item/storage/box/visual/magazine/compact/standard_gpmg
	name = "MG-60 弹匣箱"
	desc = "专门设计用于容纳大量MG-60弹匣的箱子。"
	closed_overlay = "mag_box_small_overlay_mg60"

/obj/item/storage/box/visual/magazine/compact/standard_gpmg/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/standard_gpmg,
	))

/obj/item/storage/box/visual/magazine/compact/standard_gpmg/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/standard_gpmg

/obj/item/storage/box/visual/magazine/compact/standard_mmg
	name = "MG-27 弹匣箱"
	desc = "专门设计用于容纳大量MG-27弹匣的箱子。"
	closed_overlay = "mag_box_small_overlay_mg27"

/obj/item/storage/box/visual/magazine/compact/standard_mmg/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/standard_mmg,
	))

/obj/item/storage/box/visual/magazine/compact/standard_mmg/full
	spawn_number = 30
	spawn_type = /obj/item/ammo_magazine/standard_mmg


/obj/item/storage/box/visual/magazine/compact/heavymachinegun
	name = "HMG-08 弹鼓箱"
	desc = "专为容纳大量HMG-08弹鼓而设计的箱子。"
	closed_overlay = "mag_box_small_overlay_hmg08"

/obj/item/storage/box/visual/magazine/compact/heavymachinegun/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 30
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/heavymachinegun,
	))

/obj/item/storage/box/visual/magazine/compact/heavymachinegun/full
	spawn_number = 10
	spawn_type = /obj/item/ammo_magazine/heavymachinegun

// --GRENADE BOXES--
/obj/item/storage/box/visual/grenade
	name = "手雷箱"
	desc = "这个盒子能够容纳多种类型的手雷。"
	icon_state = "grenade_box"
	overlay_pixel_x = BOX_GRENADE_OFFSET_X
	overlay_pixel_y = BOX_GRENADE_OFFSET_Y
	amt_horizontal = BOX_GRENADE_COLUMNS
	amt_vertical = BOX_GRENADE_ROWS
	storage_type = /datum/storage/box/visual/grenade

/obj/item/storage/box/visual/grenade/M15
	name = "\improper M15手雷箱"
	desc = "一个装有25枚M15破片手雷的安全箱。"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/m15
	closed_overlay = "grenade_box_overlay_m15"

/obj/item/storage/box/visual/grenade/frag
	name = "\improper M40 HEDP 手雷箱"
	desc = "一个装有25枚M40 HEDP手雷的安全箱。高爆弹头，请勿存放在喷火器燃料附近。"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade
	closed_overlay = "grenade_box_overlay_hedp"

/obj/item/storage/box/visual/grenade/incendiary
	name = "\improper M40 HIDP 手雷箱"
	desc = "一个装有25枚M40 HIDP燃烧手雷的安全箱。警告：高度易燃！！"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/incendiary
	closed_overlay = "grenade_box_overlay_hidp"

/obj/item/storage/box/visual/grenade/cloaker
	name = "\improper M45 隐身手雷箱"
	desc = "一个装有25枚M45'潜行者'手雷的安全箱。警告：可能导致癌症！！！"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/sticky/cloaker
	closed_overlay = "grenade_box_overlay_M45_cloak"

/obj/item/storage/box/visual/grenade/trailblazer
	name = "\improper M45 开拓者手雷箱"
	desc = "一个装有25枚M45开拓者手雷的安全箱。警告：高度易燃！！！"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/sticky/trailblazer
	closed_overlay = "grenade_box_overlay_M45"

/obj/item/storage/box/visual/grenade/sticky
	name = "\improper M40粘性炸药手雷箱"
	desc = "一个装有25枚M40粘性装药手雷的安全箱。爆炸威力巨大且具有粘性。"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/sticky
	closed_overlay = "grenade_box_overlay_sticky"

/obj/item/storage/box/visual/grenade/phosphorus
	name = "\improper M40 HPDP 手雷箱"
	desc = "一个装有15枚M40 HPDP白磷手雷的安全箱。全排都能犯下战争罪！"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/phosphorus
	closed_overlay = "grenade_box_overlay_phosphorus"

/obj/item/storage/box/visual/grenade/phosphorus/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 25
	storage_datum.max_storage_space = 50

/obj/item/storage/box/visual/grenade/impact
	name = "\improper M40 IMDP 手雷箱"
	desc = "一个装有25枚M40 IMDP冲击手雷的安全箱。高爆型，请勿存放在喷火器燃料附近。"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/impact
	closed_overlay = "grenade_box_overlay_impact"

/obj/item/storage/box/visual/grenade/cloak
	name = "\improper M40-2 SCDP 手雷箱"
	desc = "一个装有25枚M40-2 SCDP隐蔽手雷的安全箱。不要盲目地向烟雾中射击。"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/smokebomb/cloak
	closed_overlay = "grenade_box_overlay_cloak"

/obj/item/storage/box/visual/grenade/smokebomb
	name = "\improper M40 HSDP 手雷箱"
	desc = "一个装有25枚M40 HSDP烟雾手雷的安全箱。不要盲目向烟雾中射击。"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/smokebomb
	closed_overlay = "grenade_box_overlay_smokebomb"

/obj/item/storage/box/visual/grenade/drain
	name = "\improper M40-T手雷箱"
	desc = "一个装有25枚M40-T毒气手雷的安全箱。在佩戴面罩的陆战队员周围使用100%安全。"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/smokebomb/drain
	closed_overlay = "grenade_box_overlay_drain"

/obj/item/storage/box/visual/grenade/antigas
	name = "\improper M40-AG 手雷箱"
	desc = "一个装有25枚M40-AG毒气手雷的安全箱。可快速清除敌方烟雾。"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/smokebomb/antigas
	closed_overlay = "grenade_box_overlay_antigas"

/obj/item/storage/box/visual/grenade/razorburn
	name = "剃刀燃烧手雷箱"
	desc = "一个装有15枚剃刀燃烧手雷的安全箱。用于快速侧翼覆盖。"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/chem_grenade/razorburn_small
	closed_overlay = "grenade_box_overlay_razorburn"

/obj/item/storage/box/visual/grenade/razorburn/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 25
	storage_datum.max_storage_space = 50

/obj/item/storage/box/visual/grenade/razorburn_large
	name = "剃刀燃烧弹罐箱"
	desc = "一个装有10个剃刀燃烧弹罐的安全箱。用于快速侧翼覆盖。"
	spawn_number = 10
	spawn_type = /obj/item/explosive/grenade/chem_grenade/razorburn_large
	closed_overlay = "grenade_box_overlay_razorburn_large"

/obj/item/storage/box/visual/grenade/razorburn_large/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 10

/obj/item/storage/box/visual/grenade/teargas
	name = "\improper M66催泪瓦斯手雷箱"
	desc = "一个装有25枚M66催泪瓦斯手雷的安全箱。用于防暴控制。"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/chem_grenade/teargas
	closed_overlay = "grenade_box_overlay_teargas"

/obj/item/storage/box/visual/grenade/lasburster
	name = "\improper M80激光爆破手雷箱"
	desc = "一个装有25枚M80激光爆破手雷的安全箱。"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/bullet/laser
	closed_overlay = "grenade_box_overlay_grenade_lasburster"

/obj/item/storage/box/visual/grenade/hefa
	name = "\improper M25 HEFA 手雷箱"
	desc = "一个装有25枚M25高爆破片手雷的安全箱。请务必远离极端高温和明火。"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/bullet/hefa
	closed_overlay = "grenade_box_overlay_grenade_hefa2"

/obj/item/storage/box/visual/grenade/training
	name = "\improper M07训练手雷箱"
	desc = "一个装有25枚M07训练手雷的安全箱。无害且可重复使用。"
	spawn_number = 25
	spawn_type = /obj/item/explosive/grenade/training
	closed_overlay = "grenade_box_overlay_training"

#undef BOX_OVERLAY_SHIFT_X
#undef BOX_OVERLAY_SHIFT_Y

#undef BOX_MAGAZINE_OFFSET_X
#undef BOX_MAGAZINE_OFFSET_Y
#undef BOX_MAGAZINE_COLUMNS
#undef BOX_MAGAZINE_ROWS

#undef BOX_MAGAZINE_COMPACT_OFFSET_X
#undef BOX_MAGAZINE_COMPACT_OFFSET_Y
#undef BOX_MAGAZINE_COMPACT_COLUMNS
#undef BOX_MAGAZINE_COMPACT_ROWS

#undef BOX_GRENADE_OFFSET_X
#undef BOX_GRENADE_OFFSET_Y
#undef BOX_GRENADE_COLUMNS
#undef BOX_GRENADE_ROWS
