/*********MARINES***********/


/obj/item/clothing/under/marine
	name = "\improper TGMC 制服"
	desc = "一套标准配发的、凯夫拉编织、经过危险品测试、电磁场增强的陆战队制服。你怀疑它并不像宣传的那样坚固耐用。"
	siemens_coefficient = 0.9
	icon = 'icons/obj/clothing/uniforms/marine_uniforms.dmi'
	icon_state = "marine_jumpsuit"
	worn_icon_list = list(
		slot_w_uniform_str = 'icons/mob/clothing/uniforms/marine_uniforms.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	has_sensor = 2
	adjustment_variants = list(
		"Rolled Sleeves" = "_d",
		"No Sleeves" = "_h",
		"No Top" = "_r",
	)

/obj/item/clothing/under/marine/black_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/marine/brown_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/brown_vest)

/obj/item/clothing/under/marine/corpman_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/white_vest)

/obj/item/clothing/under/marine/holster
	starting_attachments = list(/obj/item/armor_module/storage/uniform/holster)

/obj/item/clothing/under/marine/hyperscale
	name = "\improper 8E变色龙TGMC制服"
	desc = "一件标准配发的、凯夫拉编织、经过危险品测试、电磁场增强的陆战队制服，但可以用迷彩油彩上色！你怀疑它并不像广告宣传的那么坚固。"
	icon_state = "hyperscale_marine_jumpsuit"
	worn_icon_state = "hyperscale_marine_jumpsuit"
	greyscale_colors = ARMOR_PALETTE_BLACK
	greyscale_config = /datum/greyscale_config/marine_uniform
	colorable_colors = LEGACY_ARMOR_PALETTES_LIST
	colorable_allowed = ICON_STATE_VARIANTS_ALLOWED|PRESET_COLORS_ALLOWED

//Squad colored turtlenecks
/obj/item/clothing/under/marine/squad/neck
	name = "\improper TGMC 德尔塔 高领衫"
	desc = "一件标准配发的蓝色地球政府殖民地海军陆战队高领衫。"
	icon_state = "delta_merc"
	adjustment_variants = list(
		"Rolled Sleeves" = "_d",
	)

/obj/item/clothing/under/marine/squad/neck/delta
	name = "\improper TGMC 德尔塔 高领衫"
	desc = "一件标准配发的TGMC蓝色高领衫，略带一丝英勇气息。"
	icon_state = "delta_merc"

/obj/item/clothing/under/marine/squad/neck/charlie
	name = "\improper 地球政府殖民地海军陆战队 查理 高领衫"
	desc = "一件标准配发的TGMC紫色高领衫，让你想起良好的小队协同对任务成败至关重要。"
	icon_state = "charlie_merc"

/obj/item/clothing/under/marine/squad/neck/bravo
	name = "\improper TGMC 布拉沃 高领衫"
	desc = "一件标准配发的TGMC黄色高领衫，你突然开始思考如何稍微改进前线作战基地。"
	icon_state = "bravo_merc"

/obj/item/clothing/under/marine/squad/neck/alpha
	name = "\improper 地球政府殖民地海军陆战队 阿尔法 高领衫"
	desc = "一件标准配发的红色地球政府殖民地海军陆战队高领衫，穿上它，你感觉仿佛能直面整个世界及其带来的一切挑战。"
	icon_state = "alpha_merc"

// camo things stuff yeah!

/obj/item/clothing/under/marine/camo
	name = "\improper TGMC 迷彩作训服（丛林）"
	icon_state = "m_marine_jumpsuit"

/obj/item/clothing/under/marine/camo/snow
	name = "\improper TGMC 雪地迷彩作战服"
	icon_state = "s_marine_jumpsuit"

/obj/item/clothing/under/marine/camo/desert
	name = "\improper TGMC 沙漠迷彩作训服"
	icon_state = "d_marine_jumpsuit"

/obj/item/clothing/under/marine/corpsman
	name = "\improper TGMC 卫生兵作训服"
	desc = "一套标准配发的、凯夫拉编织、经过危险品测试、电磁场增强的战斗卫生兵作训服。你怀疑它并不像广告宣传的那样坚固耐用。"
	icon_state = "marine_medic"

/obj/item/clothing/under/marine/corpsman/corpman_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/white_vest)

/obj/item/clothing/under/marine/engineer
	name = "\improper TGMC 工程兵作训服"
	desc = "一套标准配发的、凯夫拉编织、经过危险品测试、电磁场增强的战斗工程兵作训服。你怀疑它并不像宣传的那样坚固耐用。"
	icon_state = "marine_engineer"

/obj/item/clothing/under/marine/engineer/black_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/marine/jaeger
	name = "\improper TGMC 机甲驾驶员连体服"
	desc = "一件标准配发的、凯夫拉编织、经过危险品测试、电磁场增强的陆战队制服。你怀疑它并不像宣传的那样坚固耐用。"
	siemens_coefficient = 0.9
	icon_state = "marine_undersuit"
	adjustment_variants = list()
	has_sensor = 2
	item_map_variant_flags = null

/obj/item/clothing/under/marine/mp
	name = "宪兵制服"
	desc = "一套标准配发的、凯夫拉编织、经过危险品测试、电磁场增强的军警制服。你怀疑它并不像宣传的那样坚固耐用。"
	icon_state = "MP_jumpsuit"
	adjustment_variants = list()

/obj/item/clothing/under/marine/orion_fatigue
	name = "\improper 猎户座作战服"
	desc = "源自猎户座军事前哨。专为舰船和城市环境设计，用于侦察、潜行和撤离行动。内置仅使用者可闻的卡带播放器，以帮助消磨任何可能的漫长等待时间。它们是资金过剩理念的典范，至少外观很整洁。新兵训练营刚毕业的列兵很可能用他E-1级别的薪水在基地超市购买这款装备，因为它看起来太战术酷了。"
	icon_state = "orion_fatigues"
	worn_icon_state = "orion_fatigues"
	adjustment_variants = list(
		"Down" = "_d",
	)

/obj/item/clothing/under/marine/orion_fatigue/black_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/marine/red_fatigue
	name = "\improper 大红迷彩服"
	desc = "源自大红星。专为干燥、低湿度和类火星环境设计，用于侦察、潜行和撤离行动。内置仅使用者可闻的卡带播放器，帮助消磨任何可能的漫长等待时间。它们让你感觉与沙漠融为一体，由灼热骄阳锻造而成。传闻它能将你的汗液和尿液回收为饮用水！"
	icon_state = "red_fatigues"
	worn_icon_state = "red_fatigues"
	adjustment_variants = list(
		"Down" = "_d",
	)

/obj/item/clothing/under/marine/red_fatigue/black_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/marine/lv_fatigue
	name = "\improper LV-624 作战服"
	desc = "源自LV-624。专为潮湿、高湿度和丛林环境设计，用于侦察、潜行和撤离行动。内置仅使用者可闻的卡带播放器，以帮助在可能的长时等待中消磨时间。某处，有人在背景中播放着《幸运之子》，空气中弥漫着凝固汽油弹和橙剂的气味……"
	icon_state = "lv_fatigues"
	worn_icon_state = "lv_fatigues"
	adjustment_variants = list(
		"Down" = "_d",
	)

/obj/item/clothing/under/marine/lv_fatigue/black_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/marine/striped
	name = "\improper 条纹迷彩服"
	desc = "一套简单的迷彩裤和条纹衬衫。"
	icon_state = "marine_striped"
	worn_icon_state = "marine_striped"
	adjustment_variants = list()

/obj/item/clothing/under/marine/striped/black_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/marine/black_suit
	name = "\improper 陆战队黑色制服"
	desc = "一套合身的黑色西装，不知为何正好是你的尺码。"
	icon_state = "marine_suit"
	worn_icon_state = "marine_suit"
	adjustment_variants = list()
/obj/item/clothing/under/marine/officer
	name = "陆战队军官制服"
	desc = "一件凯夫拉编织、经过危险品测试、电磁场增强，却又格外柔软轻便的军官制服。你怀疑它并不像广告宣传的那么'格外考究'。"
	icon_state = "officertanclothes"
	worn_icon_state = "officertanclothes"
	adjustment_variants = list()

/obj/item/clothing/under/marine/officer/warden
	name = "陆战队军官制服"
	desc = "一件凯夫拉编织、经过危险品测试、电磁场增强，却又格外柔软轻便的军官制服。你怀疑它并不像广告宣传的那么高级。"
	icon_state = "wardentanclothes"
	worn_icon_state = "wardentanclothes"

/obj/item/clothing/under/marine/officer/hos
	name = "陆战队军官制服"
	desc = "一件凯夫拉编织、经过危险品测试、电磁场增强，却又格外柔软轻便的军官制服。你怀疑它并不像广告宣传的那么'格外考究'。"
	icon_state = "hostanclothes"
	worn_icon_state = "hostanclothes"

/obj/item/clothing/under/marine/officer/warrant
	name = "宪兵司令制服"
	desc = "一件标准配发的、凯夫拉编织的、经过危险品测试的、电磁场增强的制服，由守序善良的准尉穿着。你怀疑它并不像宣传的那样坚固耐用。"
	icon_state = "WO_jumpsuit"
	worn_icon_state = "WO_jumpsuit"

/obj/item/clothing/under/marine/officer/logistics
	name = "陆战队军官制服"
	desc = "地球政府殖民地海军陆战队补给军官的标准制式制服，采用凯夫拉编织面料，经过危险品测试，并增强了电磁场防护功能。为陆战队争光。"
	icon_state = "BO_jumpsuit"
	item_map_variant_flags = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT)

/obj/item/clothing/under/marine/officer/ro_suit
	name = "补给军官制服"
	desc = "一件合身、凯夫拉编织、经过危险品测试、电磁场增强的补给军官制服。你怀疑它并不像广告宣传的那么坚固。"
	icon_state = "RO_jumpsuit"
	adjustment_variants = list()

/obj/item/clothing/under/marine/officer/pilot
	name = "飞行员飞行服"
	desc = "一件标准配发、凯夫拉编织、经过危险品测试、电磁场增强、适合生存的飞行员飞行服。带领陆战队员们飞向荣耀。"
	icon_state = "pilot_flightsuit"
	cold_protection_flags = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	item_map_variant_flags = null
	adjustment_variants = list(
		"Half" = "_h",
	)

/obj/item/clothing/under/marine/officer/mech
	name = "机甲驾驶员制服"
	desc = "一件标准配发的、凯夫拉编织、经过危险品测试、电磁场增强的制服，供机甲驾驶员穿着。虽不如钛合金机器人那般令人印象深刻，但也足够胜任。"
	icon_state = "marine_mech_pilot"

/obj/item/clothing/under/marine/officer/assault_crewman
	name = "突击队员制服"
	desc = "一件标准配发的碳纤维制服，专为操作重型设备优化。感觉像是上个年代传下来的旧货。"
	icon_state = "marine_assault_crewman"

/obj/item/clothing/under/marine/officer/transport_crewman
	name = "运输船员制服"
	desc = "一件标准配发的舒适制服，专为整天坐着设计。"
	icon_state = "marine_transport_crewman"

/obj/item/clothing/under/marine/officer/bridge
	name = "参谋军官制服"
	desc = "一件标准配发的、凯夫拉编织的、经过危险品测试的、电磁场增强的参谋军官制服。为海军争光。"
	icon_state = "BO_jumpsuit"
	item_map_variant_flags = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT)

/obj/item/clothing/under/marine/officer/exec
	name = "战地指挥官制服"
	desc = "一件由TGMC战地军官穿着的特制、凯夫拉编织、防化测试、电磁场增强的装备。你怀疑它并不像宣传的那样坚固。"
	icon_state = "XO_jumpsuit"
	item_map_variant_flags = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT)

/obj/item/clothing/under/marine/officer/exec/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/marine/officer/command
	name = "舰长制服"
	desc = "一套特制、熨烫平整、凯夫拉编织、经过危险品测试、电磁场增强的地球政府海军舰长制服。光是看它一眼都可能让你被送上军事法庭。"
	icon_state = "CO_jumpsuit"
	item_map_variant_flags = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT)

/obj/item/clothing/under/marine/officer/admiral
	name = "海军上将制服"
	desc = "舰队上将所穿的制服。采用深黑色调，带有微光效果。织物结构看起来足够坚固，能提供一定的轻量防护。"
	worn_icon_state = "admiral_jumpsuit"

/obj/item/clothing/under/marine/officer/ce
	name = "首席舰船工程师制服"
	desc = "一款引擎友好、凯夫拉编织、经过危险品测试、电磁场增强的舰船工程师制服。你怀疑它并不像广告宣传的那样坚固耐用。"
	icon_state = "EC_jumpsuit"
	adjustment_variants = list(
		"Half" = "_h",
	)

/obj/item/clothing/under/marine/officer/engi
	name = "工程兵制服"
	desc = "一件引擎友好、凯夫拉编织、防化测试、电磁场增强的首席舰船工程师制服。你怀疑它并不像广告宣传的那样坚固。"
	icon_state = "E_jumpsuit"
	adjustment_variants = list(
		"Half" = "_h",
	)

/obj/item/clothing/under/marine/officer/researcher
	name = "研究员服装"
	desc = "一套正式而舒适的服装，学者与研究员皆宜。"
	icon_state = "research_jumpsuit"

/obj/item/clothing/under/marine/whites
	name = "\improper 地球政府殖民地海军陆战队白色礼服"
	desc = "一套标准配发的地球政府殖民地海军陆战队白色礼服。面料中的浆料有些磨人，但与你在新兵训练营毕业典礼上首次穿上它时感受到的自豪相比，这根本不算什么。不过腰身似乎不太合身。"
	siemens_coefficient = 0.9
	icon_state = "marine_whites" //with thanks to Manezinho
	worn_icon_state = "marine_whites" //with thanks to Manezinho
	adjustment_variants = list()

/obj/item/clothing/under/marine/service
	name = "\improper TGMC 常服"
	desc = "一套标准配发的地球政府殖民地海军陆战队常服。有时你会讨厌穿它，因为这会让你想起在步兵学校时不得不穿着它去见委任军官。这是你在非部署状态、在办公室工作时穿着的服装。腰身似乎不太合身。"
	siemens_coefficient = 0.9
	icon_state = "marine_service" //with thanks to Fitz 'Pancake' Sholl
	worn_icon_state = "marine_service" //with thanks to Fitz 'Pancake' Sholl

/*=========================RESPONDERS================================*/


/*=========================Imperium=================================*/

/obj/item/clothing/under/marine/imperial
	name = "\improper 帝国制服"
	desc = "这件制服几乎分发给帝国里的每一位士兵。"
	adjustment_variants = list() // don't disrespect the EMPEROR!
	icon = 'icons/obj/clothing/uniforms/ert_uniforms.dmi'
	icon_state = "guardjumpsuit"
	worn_icon_list = list(
		slot_w_uniform_str = 'icons/mob/clothing/uniforms/ert_uniforms.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	worn_icon_state = "guardjumpsuit"
	soft_armor = list(MELEE = 10, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 10, BIO = 10, FIRE = 10, ACID = 10)

/obj/item/clothing/under/marine/imperial/commissar
	name = "\improper 政委制服"
	desc = "政委的华丽制服。"
	adjustment_variants = list() // don't disrespect the EMPEROR!
	icon_state = "commissar_uniform"
	worn_icon_state = "commissar_uniform"
	soft_armor = list(MELEE = 10, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 10, BIO = 10, FIRE = 10, ACID = 10)

/obj/item/clothing/under/marine/veteran //none of these are actual used by marines
	icon = 'icons/obj/clothing/uniforms/ert_uniforms.dmi'
	worn_icon_list = list(
		slot_w_uniform_str = 'icons/mob/clothing/uniforms/ert_uniforms.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	adjustment_variants = list()

/obj/item/clothing/under/marine/veteran/pmc
	name = "\improper PMC作战服"
	desc = "一套白色的作战服，专为私人安保承包商设计。纳米传讯公司的标志醒目地印在制服上。"
	icon_state = "pmc_jumpsuit"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/marine/veteran/pmc/holster
	starting_attachments = list(/obj/item/armor_module/storage/uniform/holster)

/obj/item/clothing/under/marine/veteran/pmc/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)
/obj/item/clothing/under/marine/veteran/pmc/leader
	name = "\improper PMC 作战服"
	desc = "一套白色的作战服，专为私人安保承包商设计。纳米传讯公司的标志醒目地印在制服上，并配有金色的装饰点缀。"
	icon_state = "officer_jumpsuit"

/obj/item/clothing/under/marine/veteran/pmc/leader/holster
	starting_attachments = list(/obj/item/armor_module/storage/uniform/holster)

/obj/item/clothing/under/marine/veteran/pmc/commando
	name = "\improper PMC 突击队制服"
	desc = "纳米传讯精英突击队员穿戴的装甲制服。它在保持轻便舒适的同时提供了良好的防护。"
	icon_state = "commando_jumpsuit"
	soft_armor = list(MELEE = 10, BULLET = 10, LASER = 10, ENERGY = 20, BOMB = 10, BIO = 10, FIRE = 20, ACID = 20)
	has_sensor = 0
	starting_attachments = list(/obj/item/armor_module/storage/uniform/holster/deathsquad)

/obj/item/clothing/under/marine/veteran/UPP
	name = "\improper 联合太空鳞翅目作战服"
	desc = "一套使用已久的联合太空鳞翅目作战服，为鳞翅目海盗大规模生产。"
	icon_state = "upp_uniform"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	has_sensor = 0

/obj/item/clothing/under/marine/veteran/UPP/medic
	name = "\improper 联合太空鳞翅目医疗兵作战服"
	icon_state = "upp_uniform_medic"

//Freelancers

/obj/item/clothing/under/marine/veteran/freelancer
	name = "自由佣兵作训服"
	desc = "一套宽松的作训服，非常适合非正式佣兵穿着。散发着火药、玉米糖浆的气味，还沾满了油脂和清酒的污渍。"
	icon_state = "freelancer_uniform"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	has_sensor = 0
	starting_attachments = list(/obj/item/armor_module/storage/uniform/brown_vest)

/obj/item/clothing/under/marine/veteran/freelancer/medic
	name = "自由佣兵卫生兵作训服"
	desc = "一套宽松的作训服，非常适合非正式佣兵穿着。比普通作训服状态好得多，而且没那么难闻。"
	icon_state = "freelancer_uniform_medic"
	starting_attachments = list(/obj/item/armor_module/storage/uniform/white_vest)

/*===========================HELGHAST - MERCENARY================================*/

/obj/item/clothing/under/marine/veteran/mercenary
	name = "佣兵作战服"
	desc = "一套米色制服，配有红色臂章。坚固厚实，气势逼人。上面印着一个神秘的徽章。"
	icon_state = "mercenary_heavy_uniform"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	soft_armor = list(MELEE = 10, BULLET = 10, LASER = 0, ENERGY = 0, BOMB = 10, BIO = 1, FIRE = 0, ACID = 0)

/obj/item/clothing/under/marine/veteran/mercenary/miner
	name = "佣兵矿工服"
	desc = "一套米色西装，配有红色臂章。其丝滑细密的编织几乎掩盖了它的真实用途。一个神秘的徽章醒目地装饰其上。"
	icon_state = "mercenary_miner_uniform"

/obj/item/clothing/under/marine/veteran/mercenary/engineer
	name = "佣兵工程兵作训服"
	desc = "一套蓝色制服，点缀着黄色装饰。这种在作战服上难得一见的剪裁工艺堪称杰作。一个神秘的徽章闪耀其上。"
	icon_state = "mercenary_engineer_uniform"


////// Civilians /////////


/obj/item/clothing/under/pizza
	name = "披萨配送制服"
	desc = "一件不合身、略有污渍的披萨配送飞行员制服。散发着奶酪的气味。"
	icon_state = "redshirt2"
	worn_icon_state = "r_suit"
	has_sensor = 0

/obj/item/clothing/under/colonist
	name = "殖民者制服"
	desc = "一件时尚的灰绿色连体服——殖民者的标准配置。"
	icon_state = "colonist"
	has_sensor = 2

/obj/item/clothing/under/colonist/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/CM_uniform
	name = "殖民地治安官制服"
	desc = "蓝色衬衫与卡其色长裤——殖民地执法官的正式制服。"
	icon_state = "marshal"
	has_sensor = 2

/obj/item/clothing/under/liaison_suit
	name = "联络官的棕色西装"
	desc = "一套挺括时尚的浅棕色西装，常见于纳米传讯公司的商务人士。精湛剪裁，专为让你看起来像个混蛋而设计。"
	icon_state = "liaison_regular"

/obj/item/clothing/under/liaison_suit/outing
	name = "联络官制服"
	desc = "一件休闲装，由带领衬衫和马甲组成。看起来像是你周末会穿的，或者去废弃殖民地时会穿的衣服。"
	icon_state = "liaison_outing"

/obj/item/clothing/under/liaison_suit/formal
	name = "企业联络官的白色西装"
	desc = "一套正式的白色西装，适合出席葬礼、公司晚宴，或两者兼而有之。它挺括如板，却能让你感觉像是从劳斯莱斯里款款而出。"
	icon_state = "liaison_formal"

/obj/item/clothing/under/liaison_suit/suspenders
	name = "联络官制服"
	desc = "一件带衣领的衬衫，搭配一副背带。纳米传讯员工穿着它提出尖锐问题。隐约散发着雪茄和拙劣演技的气味。"
	icon_state = "liaison_suspenders"

/obj/item/clothing/under/liaison_suit/galaxy_blue
	name = "\improper 灵魂之虚"
	desc = "一套由星辰与高速气体构成的装甲。它诉说着宇宙与深不可测的浩瀚。唯有最顶尖的精英方能获得。"
	icon_state = "liaison_galaxy_blue" // Thanks to Manezinho

/obj/item/clothing/under/liaison_suit/galaxy_red
	name = "\improper 脉冲枪"
	desc = "一套星光与高速气体构成的战甲。它诉说着恒星聚变与重返大气层的灼烧。唯有最顶尖的战士方能获得。"
	icon_state = "liaison_galaxy_red" // Thanks to Manezinho

/obj/item/clothing/under/rank/chef/exec
	name = "\improper 纳米传讯防护服"
	desc = "一件正式的白色内衬服。"
	adjustment_variants = list()

/obj/item/clothing/under/rank/synthetic
	name = "\improper 地球政府殖民地海军陆战队支援制服"
	desc = "专为合成人船员设计的简易制服。"
	icon_state = "rdalt"
	adjustment_variants = list()

/obj/item/clothing/under/som
	name = "\improper 火星之子制服"
	desc = "火星之子军事人员的标准制服。其设计明显源自旧采矿殖民地使用的采矿服。"
	icon = 'icons/obj/clothing/uniforms/ert_uniforms.dmi'
	icon_state = "som_uniform"
	worn_icon_list = list(
		slot_w_uniform_str = 'icons/mob/clothing/uniforms/ert_uniforms.dmi',
		slot_l_hand_str = 'icons/mob/inhands/clothing/uniforms_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/clothing/uniforms_right.dmi',
	)
	worn_icon_state = "som_uniform"
	has_sensor = FALSE

/obj/item/clothing/under/som/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/brown_vest)


/obj/item/clothing/under/som/medic
	name = "\improper SOM医疗制服"
	desc = "火星之子军事人员的标准制服。其设计明显源自旧采矿殖民地使用的采矿服。这件带有医疗标识。"
	icon_state = "som_uniform_medic"
	worn_icon_state = "som_uniform_medic"

/obj/item/clothing/under/som/medic/vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/white_vest)

/obj/item/clothing/under/som/medic/vest/black
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/som/veteran
	name = "\improper 火星之子老兵制服"
	desc = "火星之子军事人员的标准制服。其设计明显源自旧采矿殖民地使用的采矿服。这件带有专家身份的标识。"
	icon_state = "som_uniform_veteran"
	worn_icon_state = "som_uniform_veteran"

/obj/item/clothing/under/som/veteran/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/brown_vest)

/obj/item/clothing/under/som/leader
	name = "\improper 火星之子军官制服"
	desc = "火星之子军事人员的标准制服。其设计明显源自旧采矿殖民地使用的采矿服。这件带有领导标识。"
	icon_state = "som_uniform_leader"
	worn_icon_state = "som_uniform_leader"

/obj/item/clothing/under/som/leader/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/brown_vest)

/obj/item/clothing/under/som/officer
	name = "\improper 火星之子军官制服"
	desc = "火星之子军官的独特黑色制服。通常由初级军官穿着。"
	icon_state = "som_officer_uniform"
	worn_icon_state = "som_officer_uniform"
	adjustment_variants = list()

/obj/item/clothing/under/som/officer/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/som/officer/senior
	name = "\improper 火星之子军官制服"
	desc = "火星之子军官标志性的黑色夹克制服。通常由高级军官穿着。"
	icon_state = "som_senior_officer_uniform"
	worn_icon_state = "som_senior_officer_uniform"

/obj/item/clothing/under/icc
	name = "\improper 30型制服"
	desc = "ICC军事人员的标准制服。其设计显然具有双重用途，既可作为战斗服，也适合在舰船上执行日常任务。"
	icon = 'icons/obj/clothing/uniforms/ert_uniforms.dmi'
	icon_state = "icc"
	worn_icon_list = list(
		slot_w_uniform_str = 'icons/mob/clothing/uniforms/ert_uniforms.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	worn_icon_state = "icc"
	has_sensor = FALSE

/obj/item/clothing/under/icc/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/brown_vest)

/obj/item/clothing/under/sectoid
	name = "灵能场"
	desc = "一片无形的能量场，它能保护穿戴者，但无法同时穿戴任何衣物。"
	icon = 'icons/effects/effects.dmi'
	icon_state = "shield-blue"
	item_flags = DELONDROP

/obj/item/clothing/under/sectoid/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, SECTOID_TRAIT)

/obj/item/clothing/under/marine/robotic
	name = "机器人装甲服挂载"
	desc = "用于在战斗机器人上安装设备的附加结构装甲板。"
	worn_icon_state = "chest_rig"
	icon_state = "chest_rig"
	adjustment_variants = list()
	species_exception = list(/datum/species/robot)

/obj/item/clothing/under/marine/robotic/mob_can_equip(mob/user, slot, warning = TRUE, override_nodrop = FALSE, bitslot = FALSE)
	. = ..()
	if(!isrobot(user))
		to_chat(user, span_warning("你无法装备此物品，因为它需要在你的身体上安装固定螺丝！"))
		return FALSE

/obj/item/clothing/under/marine/robotic/black_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/marine/robotic/brown_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/brown_vest)

/obj/item/clothing/under/marine/robotic/corpman_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/white_vest)

/obj/item/clothing/under/marine/robotic/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/webbing)

/obj/item/clothing/under/marine/robotic/holster
	starting_attachments = list(/obj/item/armor_module/storage/uniform/holster)

/obj/item/clothing/under/marine/specops
	name = "战术高领衫"
	desc = "一件配发给特种作战单位的TGMC高领毛衣"
	icon = 'icons/mob/clothing/uniforms/ert_uniforms.dmi'
	icon_state = "specops_uniform"
	worn_icon_list = list(
		slot_w_uniform_str = 'icons/mob/clothing/uniforms/ert_uniforms.dmi',
	)
	starting_attachments = list(/obj/item/armor_module/storage/uniform/holster)
	worn_icon_state = "specops_uniform"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	has_sensor = 0

/obj/item/clothing/under/vsd
	name = "\improper VSD连体服"
	desc = "维雅切斯拉夫安保分队的标准制服，采用凯夫拉纤维编织，带有血迹标记。"
	icon = 'icons/mob/clothing/uniforms/ert_uniforms.dmi'
	icon_state = "vsd_uniform_main"
	worn_icon_state = "vsd_uniform_main"
	worn_icon_list = list(
		slot_w_uniform_str = 'icons/mob/clothing/uniforms/ert_uniforms.dmi',
	)
	has_sensor = FALSE

/obj/item/clothing/under/vsd/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/vsd/medic
	starting_attachments = list(/obj/item/armor_module/storage/uniform/white_vest)

/obj/item/clothing/under/vsd/alt
	icon_state = "vsd_uniform_alt"
	worn_icon_state = "vsd_uniform_alt"

/obj/item/clothing/under/vsd/alt/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/vsd/alt/white_webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/white_vest)

/obj/item/clothing/under/vsd/officer
	desc = "维雅切斯拉夫安保分队军官的标准制服，采用凯夫拉纤维编织，带有血迹标记。"
	icon_state = "vsd_uniform_officer"
	worn_icon_state = "vsd_uniform_officer"

/obj/item/clothing/under/vsd/officer/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/vsd/secondary
	icon_state = "vsd_uniform_secondary"
	worn_icon_state = "vsd_uniform_secondary"

/obj/item/clothing/under/vsd/secondary/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/vsd/upp
	desc = "这是维雅切斯拉夫安保分队某支队的标准制服，其配色令人感到似曾相识。"
	icon_state = "upp_retired"
	worn_icon_state = "upp_retired"

/obj/item/clothing/under/vsd/upp/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/vsd/upp/white_webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/white_vest)

/obj/item/clothing/under/vsd/upp/alt
	icon_state = "upp_secondary"
	worn_icon_state = "upp_secondary"

/obj/item/clothing/under/vsd/upp/alt/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/vsd/upp/alt/white_webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/white_vest)

/obj/item/clothing/under/vsd/upp/officer
	desc = "这是维雅切斯拉夫安保分队军官的标准制服，其配色令人感到似曾相识。"
	icon_state = "upp_retired_officer"
	worn_icon_state = "upp_retired_officer"

/obj/item/clothing/under/vsd/upp/officer/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/vsd/shirt
	name = "VSD衬衫"
	icon_state = "vsd_shirt"
	worn_icon_state = "vsd_shirt"

/obj/item/clothing/under/vsd/shirt/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/vsd/juggernaut
	name = "VSD连体服"
	icon_state = "vsd_alt_juggernaut"
	worn_icon_state = "vsd_alt_juggernaut"

/obj/item/clothing/under/vsd/juggernaut/webbing
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

//TDF
/obj/item/clothing/under/tdf
	name = "\improper 殖民地解放阵线制服"
	desc = "TDF 军事人员的标准制服。采用标志性的蓝色设计，易于识别，代表了 TDF。"
	icon = 'icons/obj/clothing/uniforms/ert_uniforms.dmi'
	icon_state = "tdf_uniform"
	worn_icon_list = list(
		slot_w_uniform_str = 'icons/mob/clothing/uniforms/ert_uniforms.dmi',
		slot_l_hand_str = 'icons/mob/inhands/clothing/uniforms_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/clothing/uniforms_right.dmi',
	)
	worn_icon_state = "tdf_uniform"
	siemens_coefficient = 0.9
	has_sensor = 2

/obj/item/clothing/under/tdf/black_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/black_vest)

/obj/item/clothing/under/tdf/brown_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/brown_vest)

/obj/item/clothing/under/tdf/corpman_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/white_vest)

/obj/item/clothing/under/tdf/holster
	starting_attachments = list(/obj/item/armor_module/storage/uniform/holster)

/obj/item/clothing/under/tdf/medic
	icon_state = "tdf_uniform_medic"
	worn_icon_state = "tdf_uniform_medic"

/obj/item/clothing/under/tdf/medic/corpman_vest
	starting_attachments = list(/obj/item/armor_module/storage/uniform/white_vest)
