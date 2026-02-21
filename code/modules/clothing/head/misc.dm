

/obj/item/clothing/head/centhat
	name = "\improper 中央司令部 帽子"
	icon_state = "centcom"
	desc = "当皇帝的感觉真不错。"
	worn_icon_state = "centhat"
	siemens_coefficient = 0.9
	armor_protection_flags = NONE

/obj/item/clothing/head/hairflower
	name = "发饰花别针"
	icon_state = "hairflower"
	desc = "闻起来不错。"
	worn_icon_state = "hairflower"
	armor_protection_flags = NONE
	w_class = WEIGHT_CLASS_TINY

/obj/item/clothing/head/powdered_wig
	name = "假发粉"
	desc = "一顶扑粉假发。"
	icon_state = "pwig"
	worn_icon_state = "pwig"

/obj/item/clothing/head/that
	name = "高顶礼帽"
	desc = "这是一顶看起来像阿米什风格的帽子。"
	icon_state = "tophat"
	worn_icon_state = "that"
	siemens_coefficient = 0.9
	armor_protection_flags = NONE

/obj/item/clothing/head/redcoat
	name = "红衫军帽"
	icon_state = "redcoat"
	desc = "<i>'我猜是个红发。'</i>"
	armor_protection_flags = NONE

/obj/item/clothing/head/plaguedoctorhat
	name = "瘟疫医生帽"
	desc = "这曾是瘟疫医生使用的物品。现在基本没什么用了。"
	icon_state = "plaguedoctor"
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	armor_protection_flags = NONE

/obj/item/clothing/head/hasturhood
	name = "哈斯塔兜帽"
	desc = "这简直时髦得无法形容"
	icon_state = "hasturhood"
	inventory_flags = COVEREYES
	inv_hide_flags = HIDEEARS|HIDEALLHAIR
	armor_protection_flags = HEAD|FACE|EYES

/obj/item/clothing/head/nursehat
	name = "护士帽"
	desc = "它允许快速识别受过训练的医疗人员。"
	icon_state = "nursehat"
	siemens_coefficient = 0.9
	armor_protection_flags = NONE

/obj/item/clothing/head/syndicatefake
	name = "红色太空头盔复制品"
	icon_state = "syndicate"
	worn_icon_state = "syndicate"
	desc = "一个塑料仿制的辛迪加特工太空头盔，戴上它你看起来就像个真正的凶残辛迪加特工！这只是个玩具，不能在太空中使用！"
	inventory_flags = COVEREYES|COVERMOUTH
	inv_hide_flags = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR
	siemens_coefficient = 2
	armor_protection_flags = HEAD|FACE|EYES
	anti_hug = 1

/obj/item/clothing/head/cueball
	name = "光头头盔"
	desc = "一个大型、无特征的白色球体，设计用于戴在头上。这东西到底要怎么才能看到外面？"
	icon_state = "cueball"
	inv_hide_flags = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR
	worn_icon_state="cueball"
	inventory_flags = NONE
	armor_protection_flags = HEAD|FACE|EYES

/obj/item/clothing/head/greenbandanna
	name = "绿色头巾"
	desc = "这是一条绿色头巾，带有精细的纳米技术衬里。"
	icon_state = "greenbandanna"
	worn_icon_state = "greenbandanna"
	inventory_flags = NONE
	inv_hide_flags = NONE
	armor_protection_flags = NONE

/obj/item/clothing/head/cardborg
	name = "卡博格头盔"
	desc = "用板条箱制成的头盔。"
	icon_state = "cardborg_h"
	worn_icon_state = "cardborg_h"
	inventory_flags = COVERMOUTH|COVEREYES
	inv_hide_flags = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR
	armor_protection_flags = HEAD|FACE|EYES

/obj/item/clothing/head/justice
	name = "正义帽"
	desc = "为正义而战！"
	icon_state = "justicered"
	worn_icon_state = "justicered"
	inventory_flags = COVERMOUTH|COVEREYES
	inv_hide_flags = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR

/obj/item/clothing/head/flatcap
	name = "平顶帽"
	desc = "一顶工人的帽子。"
	icon_state = "flat_cap"
	worn_icon_state = "detective"
	siemens_coefficient = 0.9

/obj/item/clothing/head/pirate
	name = "海盗帽"
	desc = "哟呵。"
	icon_state = "pirate"
	worn_icon_state = "pirate"
	armor_protection_flags = NONE

/obj/item/clothing/head/hgpiratecap
	name = "海盗帽"
	desc = "哟嚯。"
	icon_state = "hgpiratecap"
	worn_icon_state = "hgpiratecap"
	armor_protection_flags = NONE
	item_flags = SYNTH_RESTRICTED
	soft_armor = list(MELEE = 50, BULLET = 80, LASER = 50, ENERGY = 10, BOMB = 50, BIO = 0, FIRE = 10, ACID = 10)

/obj/item/clothing/head/bandanna/brown
	name = "棕色头巾"
	desc = "通常由重武器操作员、雇佣兵和侦察兵佩戴，头巾是一种轻便舒适的帽子。"
	icon_state = "bandanna_brown"
	worn_icon_state = "bandanna_brown"

/obj/item/clothing/head/bandanna/grey
	name = "灰色头巾"
	desc = "展现你灵魂中阴暗的一面。"
	icon_state = "bandanna_grey"
	worn_icon_state = "bandanna_grey"

/obj/item/clothing/head/bandanna/red
	name = "红色头巾"
	desc = "当一切轰然倒塌，内心痛苦难当。"
	icon_state = "bandanna_red"
	worn_icon_state = "bandanna_red"

/obj/item/clothing/head/bowler
	name = "圆顶礼帽"
	desc = "先生们，精英登舰！"
	icon_state = "bowler"
	worn_icon_state = "bowler"
	armor_protection_flags = NONE

//stylish bs12 hats

/obj/item/clothing/head/bowlerhat
	name = "圆顶礼帽"
	icon_state = "bowler_hat"
	worn_icon_state = "bowler_hat"
	desc = "专为绅士打造。"
	armor_protection_flags = NONE

/obj/item/clothing/head/beaverhat
	name = "海狸皮帽"
	icon_state = "beaver_hat"
	worn_icon_state = "beaver_hat"
	desc = "柔软的毛毡材质让这顶帽子既舒适又优雅。"

/obj/item/clothing/head/boaterhat
	name = "船夫帽"
	icon_state = "boater_hat"
	worn_icon_state = "boater_hat"
	desc = "夏日时尚的终极之选。"

/obj/item/clothing/head/fedora
	name = "\improper 软呢帽"
	icon_state = "fedora"
	worn_icon_state = "fedora"
	desc = "一顶锋利又时髦的帽子。"

/obj/item/clothing/head/feathertrilby
	name = "\improper 羽毛软呢帽"
	icon_state = "feather_trilby"
	worn_icon_state = "feather_trilby"
	desc = "一顶带有羽毛的锋利时尚帽子。"

/obj/item/clothing/head/fez
	name = "\improper 土耳其毡帽"
	icon_state = "fez"
	worn_icon_state = "fez"
	desc = "你应该戴一顶土耳其毡帽。土耳其毡帽很酷。"

//end bs12 hats

/obj/item/clothing/head/witchwig
	name = "女巫假发"
	desc = "咿呀~嘿嘿嘿嘿嘿嘿！"
	icon_state = "witch"
	worn_icon_state = "witch"
	inventory_flags = NONE
	inv_hide_flags = HIDEALLHAIR
	siemens_coefficient = 2

/obj/item/clothing/head/chicken
	name = "鸡套装头部"
	desc = "嘎！"
	icon_state = "chickenhead"
	worn_icon_state = "chickensuit"
	inventory_flags = NONE
	inv_hide_flags = HIDEALLHAIR
	siemens_coefficient = 2
	armor_protection_flags = HEAD|FACE|EYES

/obj/item/clothing/head/xenos
	name = "异形头盔"
	icon_state = "xenos"
	worn_icon_state = "xenos_helm"
	desc = "由异形几丁质外皮制成的头盔。"
	inventory_flags = COVERMOUTH|COVEREYES|BLOCKSHARPOBJ
	inv_hide_flags = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR
	siemens_coefficient = 2
	armor_protection_flags = HEAD|FACE|EYES
	anti_hug = 10 //Lel

/obj/item/clothing/head/white_dress
	name = "白色礼服帽"
	desc = "你的礼服白色军帽。"
	icon_state = "white_dress" //with thanks to Baystation12
	worn_icon_state = "white_dress" //with thanks to Baystation12

/obj/item/clothing/head/garrisoncap
	name = "船形帽"
	desc = "你的常服军便帽。它让你想起了女性外阴的阴唇。"
	icon_state = "garrisoncap" //with thanks to Fitz 'Pancake' Sholl
	worn_icon_state = "garrisoncap" //with thanks to Fitz 'Pancake' Sholl

/obj/item/clothing/head/servicecap
	name = "军帽"
	desc = "你的常服军帽。理论上这是军官的，但基地商店里到处都是这种帽子，何不拿一顶呢？"
	icon_state = "servicecap" //with thanks to Fitz 'Pancake' Sholl
	worn_icon_state = "servicecap" //with thanks to Fitz 'Pancake' Sholl

/obj/item/clothing/head/serviceberet
	name = "勤务贝雷帽"
	desc = "你的常服贝雷帽。这感觉像是比你级别高得多的人才会戴的东西。"
	icon_state = "beret_service"
	worn_icon_state = "beret_service"

/obj/item/clothing/head/servicecampaignhat
	name = "服役纪念帽"
	desc = "你的军礼服配套的军帽。光是看着它，你就能感受到那股扑面而来的威慑气息。"
	icon_state = "campaignhat_service"
	worn_icon_state = "campaignhat_service"

/obj/item/clothing/head/serviceushanka
	name = "军用乌沙帽"
	desc = "您的常服配套的乌沙帽。当您需要在零下温度进行阅兵时使用。"
	icon_state = "ushanaka_service"
	worn_icon_state = "ushanaka_service"

/obj/item/clothing/head/techpriest
	name = "技术神甫兜帽"
	desc = "赞美欧姆弥赛亚！"
	icon_state = "tp_hood"
	worn_icon_state = "tp_hood"
	inv_hide_flags = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR
	armor_protection_flags = HEAD|FACE|EYES
