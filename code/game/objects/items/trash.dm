//Items labled as 'trash' for the trash bag.

/obj/item/trash
	icon = 'icons/obj/items/trash.dmi'
	w_class = WEIGHT_CLASS_SMALL
	desc = "这简直是垃圾。"

/obj/item/trash/raisins
	name = "4no raisins"
	icon_state= "4no_raisins"

/obj/item/trash/pillpacket
	name = "压皱的药片包装"
	desc = "治疗了大量伤害后，空置的医疗包被放置妥当"
	icon = 'icons/obj/items/trash.dmi'
	icon_state = "pillpacketempty"

/obj/item/trash/candy
	name = "糖果"
	icon_state= "candy"

/obj/item/trash/cheesie
	name = "芝士味喇叭"
	icon_state = "cheesie_honkers"

/obj/item/trash/chips
	name = "芯片"
	icon_state = "chips"

/obj/item/trash/popcorn
	name = "爆米花"
	icon_state = "popcorn"

/obj/item/trash/sosjerky
	name = "Scaredy's 私人珍藏牛肉干"
	icon_state = "sosjerky"

/obj/item/trash/syndi_cakes
	name = "辛迪蛋糕"
	icon_state = "syndi_cakes"

/obj/item/trash/waffles
	name = "华夫饼"
	icon_state = "waffles"

/obj/item/trash/plate
	name = "护甲板"
	icon_state = "plate"

/obj/item/trash/snack_bowl
	name = "零食碗"
	icon_state = "snack_bowl"

/obj/item/trash/pistachios
	name = "开心果包"
	icon_state = "pistachios_pack"

/obj/item/trash/semki
	name = "塞姆基背包"
	icon_state = "semki_pack"

/obj/item/trash/tray
	name = "托盘"
	icon_state = "tray"

/obj/item/trash/candle
	name = "蜡烛"
	icon = 'icons/obj/items/candle.dmi'
	icon_state = "candle4"

/obj/item/trash/can
	name = "压扁的罐子"
	icon_state = "cola"
	resistance_flags = NONE

/obj/item/trash/liquidfood
	name = "\improper 流食口粮"
	icon_state = "liquidfood"

/obj/item/trash/burger
	name = "汉堡包装纸"
	icon_state = "burger"
	desc = "一层曾经装着芝士汉堡的油腻塑料薄膜。由纳米传讯公司包装。"

/obj/item/trash/buritto
	name = "卷饼包装纸"
	icon_state = "burrito"
	desc = "一股恶臭的塑料薄膜，曾经装着微波炉玉米煎饼。由纳米传讯公司包装。"

/obj/item/trash/hotdog
	name = "热狗包装纸"
	icon_state = "hotdog"
	desc = "曾用来包装热狗的陈旧塑料薄膜。由纳米传讯公司包装。"

/obj/item/trash/kepler
	name = "开普勒封装器"
	icon_state = "kepler"

/obj/item/trash/eat
	name = "EAT能量棒包装纸"
	icon_state = "eat"

/obj/item/trash/fortunecookie
	name = "幸运饼干签语"
	icon_state = "fortune" //Thank you Alterist

/obj/item/trash/fortunecookie/Initialize(mapload, ...)
	. = ..()
	desc = "The fortune reads. <br>[span_tip("[pick(SSstrings.get_list_from_file("tips/marine"))]")]"

/obj/item/trash/c_tube
	name = "纸板管"
	desc = "一个纸板……做的管子。"
	icon = 'icons/obj/stack_objects.dmi'
	icon_state = "c_tube"
	throwforce = 1
	throw_speed = 4
	throw_range = 5


/obj/item/trash/cigbutt
	name = "烟蒂"
	desc = "一根脏兮兮的旧烟蒂。"
	icon = 'icons/obj/clothing/masks.dmi'
	icon_state = "cigbutt"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1

/obj/item/trash/cigbutt/Initialize(mapload, ...)
	. = ..()
	pixel_x = rand(-10,10)
	pixel_y = rand(-10,10)
	transform = turn(transform,rand(0,360))

/obj/item/trash/cigbutt/cigarbutt
	name = "烟蒂"
	desc = "一根发霉的旧雪茄烟蒂。"
	icon_state = "cigarbutt"


/obj/item/trash/tgmc_tray
	name = "\improper 地球政府殖民地海军陆战队托盘"
	desc = "已完成服役期"
	icon_state = "MREtray"

/obj/item/trash/boonie
	name = "奔尼帽包布"
	desc = "一个薄荷绿色的包装纸。让你想起了另一个涉及薄荷绿色的糟糕决定，但你想不起来具体是什么了……"
	icon_state = "boonie_trash"

/obj/item/trash/chunk
	name = "区块条框"
	desc = "一块能量棒的空包装盒。重量明显减轻。"
	icon_state = "chunk_trash"

/obj/item/trash/barcaridine
	name = "巴卡拉丁棒包装纸"
	desc = "一个巴卡拉丁能量棒的空包装纸。你注意到内层有几个医疗标签。你不太确定自己是否在意这个。"
	icon_state = "barcardine_trash"

/obj/item/trash/berrybar
	name = "浆果能量棒包装纸"
	desc = "一个浆果能量棒的空包装纸。你注意到内包装上有几个医疗标签和成分说明，但你不确定自己是否在意这些。"
	icon_state = "berrybar_trash"

/obj/item/trash/mre
	name = "\improper 压碎的TGMC单兵即食口粮"
	desc = "它已为地球政府殖民地海军陆战队尽了自己的职责。你呢？"
	icon = 'icons/obj/items/trash.dmi'
	icon_state = "mealpackempty"

/obj/item/trash/mre/som
	name = "\improper 碎裂的火星之子MFR"
	desc = "它已为火星之子尽了自己的职责。你呢？"
	icon_state = "som_mealpackempty"

/obj/item/trash/nt_chips
	name = "\improper 纳米传讯胡椒薯片"
	icon_state = "nt_chips_pepper"
	desc = "一个油腻的空袋子，曾经装着纳米传讯薯片。"

/obj/item/trash/nt_chips/pepper
	name = "\improper 纳米传讯胡椒薯片"
	icon_state = "nt_chips_pepper"
	desc = "一个油腻的空袋子，曾经装着纳米传讯胡椒薯片。"

/obj/item/trash/crushed_cup
	name = "压碎的杯子"
	desc = "一个被压扁毁坏的杯子。现在它只是无用的垃圾。真是浪费。"
	icon_state = "crushed_solocup"
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	attack_verb = list("bludgeons", "whacks", "slaps")

/obj/item/trash/trashbag
	name = "垃圾袋"
	desc = "这是重型黑色聚合物材质。是时候清理垃圾了！"
	icon_state = "ztrashbag"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1

/obj/item/trash/crushed_wbottle
	name = "压扁的水瓶"
	desc = "纳米传讯公司灌装的'春泉'牌高价水。"
	icon_state = "waterbottle_crushed"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1

/obj/item/trash/crushed_bottle
	name = "压碎的瓶子"
	desc = "一个被压碎的瓶子，很难看清标签。"
	icon_state = "blank_can_crushed"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1

/obj/item/trash/crushed_bottle/beer
	icon_state = "beer_crushed"

/obj/item/trash/crushed_bottle/ale
	icon_state = "ale_crushed"

/obj/item/trash/crushed_bottle/fruitbeer
	icon_state = "fruit_beer_crushed"

/obj/item/trash/crushed_bottle/sodawater
	icon_state = "soda_water_crushed"

/obj/item/trash/crushed_bottle/tonic
	icon_state = "tonic_crushed"

/obj/item/trash/crushed_bottle/purple_can
	icon_state = "purple_can_crushed"

/obj/item/trash/crushed_bottle/cola
	icon_state = "cola_crushed"

/obj/item/trash/crushed_bottle/grapesoda
	icon_state = "grapesoda_crushed"

/obj/item/trash/crushed_bottle/icetea
	icon_state = "ice_tea_can_crushed"

/obj/item/trash/crushed_bottle/thirteenloko
	icon_state = "thirteen_loko_crushed"

/obj/item/trash/crushed_bottle/spacemount
	icon_state = "space_mountain_wind_crushed"

/obj/item/trash/crushed_bottle/drgibb
	icon_state = "dr_gibb_crushed"

/obj/item/trash/crushed_bottle/starkist
	icon_state = "starkist_crushed"

/obj/item/trash/crushed_bottle/spaceup
	icon_state = "space-up_crushed"

/obj/item/trash/crushed_bottle/lemonlime
	icon_state = "lemon-lime_crushed"

/obj/item/trash/crushed_bottle/boda
	icon_state = "boda_crushed"

/obj/item/trash/crushed_bottle/energydrink
	icon_state = "energy_drink_crushed"

/obj/item/trash/crushed_bottle/sixpackcrushed_1
	icon_state = "6_pack_1_crushed"

/obj/item/trash/crushed_bottle/soutoclassic
	icon_state = "souto_classic_crushed"

/obj/item/trash/crushed_bottle/soutocherry
	icon_state = "souto_cherry_crushed"

/obj/item/trash/crushed_bottle/soutolime
	icon_state = "souto_lime_crushed"

/obj/item/trash/crushed_bottle/soutogrape
	icon_state = "souto_grape_crushed"

/obj/item/trash/crushed_bottle/soutoblueraspberry
	icon_state = "souto_blueraspberry_crushed"

/obj/item/trash/crushed_bottle/soutopeach
	icon_state = "souto_peach_crushed"

/obj/item/trash/crushed_bottle/soutocranberry
	icon_state = "souto_cranberry_crushed"

/obj/item/trash/crushed_bottle/soutovanilla
	icon_state = "souto_vanilla_crushed"

/obj/item/trash/crushed_bottle/soutopineapple
	icon_state = "souto_pineapple_crushed"

/obj/item/trash/crushed_bottle/soutodietclassic
	icon_state = "souto_diet_classic_crushed"

/obj/item/trash/crushed_bottle/soutodietcherry
	icon_state = "souto_diet_cherry_crushed"

/obj/item/trash/crushed_bottle/soutodietlime
	icon_state = "souto_diet_lime_crushed"

/obj/item/trash/crushed_bottle/soutodietgrape
	icon_state = "souto_diet_grape_crushed"

/obj/item/trash/crushed_bottle/soutodietblueraspberry
	icon_state = "souto_diet_blueraspberry_crushed"

/obj/item/trash/crushed_bottle/soutodietpeach
	icon_state = "souto_diet_peach_crushed"

/obj/item/trash/crushed_bottle/soutodietcranberry
	icon_state = "souto_diet_cranberry_crushed"

/obj/item/trash/crushed_bottle/soutodietvanilla
	icon_state = "souto_diet_vanilla_crushed"

/obj/item/trash/crushed_bottle/soutodietpineapple
	icon_state = "souto_diet_pineapple_crushed"

// Cuppa Joe's Trash
/obj/item/trash/cuppa_joes/lid
	name = "乔咖啡杯盖"
	desc = "你有CuppaJoe的微笑吗？保持活力！冻干CuppaJoe咖啡。"
	icon_state = "coffeecuppajoelid"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1

/obj/item/trash/cuppa_joes/empty_cup
	name = "清空乔咖啡杯"
	desc = "你拥有CuppaJoe的微笑吗？保持活力！冻干CuppaJoe咖啡。"
	icon_state = "coffeecuppajoenolid"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1

/obj/item/trash/cuppa_joes/Initialize(mapload)
	. = ..()
	pixel_x = rand(-10,10)
	pixel_y = rand(-10,10)

// Cuppa Joes no random axis
/obj/item/trash/cuppa_joes_static/lid
	name = "乔咖啡杯盖"
	desc = "你有CuppaJoe的微笑吗？保持活力！冻干CuppaJoe咖啡。"
	icon_state = "coffeecuppajoelid"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1

/obj/item/trash/cuppa_joes_static/empty_cup
	name = "清空乔的咖啡杯"
	desc = "你拥有CuppaJoe的微笑吗？保持活力！冻干CuppaJoe咖啡。"
	icon_state = "coffeecuppajoenolid"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1

/obj/item/trash/cuppa_joes_static/empty_cup_stack
	name = "空杯乔咖啡杯堆"
	desc = "你有CuppaJoe的微笑吗？保持活力！冻干CuppaJoe咖啡。"
	icon_state = "coffeecuppajoestacknolid"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1

/obj/item/trash/cuppa_joes_static/lid_stack
	name = "乔氏咖啡杯盖叠"
	desc = "你有CuppaJoe微笑吗？保持活力！冻干CuppaJoe咖啡。"
	icon_state = "coffeecuppajoelidstack"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1
