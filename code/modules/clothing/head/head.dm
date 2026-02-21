/obj/item/clothing/head
	name = "头部"
	icon = 'icons/obj/clothing/headwear/hats.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/clothing/hats_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/clothing/hats_right.dmi',
	)
	armor_protection_flags = HEAD
	equip_slot_flags = ITEM_SLOT_HEAD
	w_class = WEIGHT_CLASS_SMALL
	blood_sprite_state = "helmetblood"
	attachments_by_slot = list(ATTACHMENT_SLOT_BADGE)
	attachments_allowed = list(/obj/item/armor_module/armor/badge)
	var/anti_hug = 0

/obj/item/clothing/head/update_clothing_icon()
	if (ismob(loc))
		var/mob/M = loc
		M.update_inv_head()

/obj/item/clothing/head/update_greyscale(list/colors, update)
	. = ..()
	if(!greyscale_config)
		return
	worn_icon_list = list(slot_head_str = icon)

/obj/item/clothing/head/beanie
	name = "\improper TGMC 针织帽"
	desc = "一顶标准的军用无檐帽，通常由非战斗军事人员和支持人员佩戴，不过偶尔也会出现在前线。因其舒适贴身而广受欢迎。"
	icon = 'icons/obj/clothing/headwear/marine_hats.dmi'
	worn_icon_list = list(
		slot_head_str = 'icons/mob/clothing/headwear/marine_hats.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	icon_state = "beanie_cargo"
	inv_hide_flags = HIDETOPHAIR
	soft_armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 10, BIO = 5, FIRE = 5, ACID = 5)


/obj/item/clothing/head/tgmcberet
	name = "\improper 深灰色贝雷帽"
	desc = "通常由地球政府殖民地海军陆战队的战地军官佩戴的帽子。偶尔它们也会流传到下级，落入班长和受勋的普通士兵手中。"
	icon = 'icons/obj/clothing/headwear/marine_hats.dmi'
	worn_icon_list = list(
		slot_head_str = 'icons/mob/clothing/headwear/marine_hats.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	icon_state = "beret"
	soft_armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 10, BIO = 5, FIRE = 5, ACID = 5)
	item_map_variant_flags = NONE
	armor_features_flags = ARMOR_NO_DECAP

/obj/item/clothing/head/tgmcberet/tan
	name = "\improper 棕褐色贝雷帽"
	icon_state = "berettan"
	item_map_variant_flags = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT)

/obj/item/clothing/head/tgmcberet/red
	name = "\improper 红色徽章贝雷帽"
	icon_state = "beretred"
	item_map_variant_flags = NONE

/obj/item/clothing/head/tgmcberet/red2
	name = "\improper 红色贝雷帽"
	icon_state = "beretred2"
	item_map_variant_flags = NONE

/obj/item/clothing/head/tgmcberet/red2/erp
	name = "\improper ERP 红色贝雷帽"
	desc = "ERP认证的改进型红色贝雷帽设计，这块小布料如何拥有如此出色的衬垫是ERP严格保守的秘密。"
	soft_armor = MARINE_ARMOR_MEDIUM

/obj/item/clothing/head/tgmcberet/red2/erp/masterprankster
	desc = "ERP认证的红色贝雷帽改进设计，这块小布料为何有如此出色的衬垫，是ERP严格保守的秘密。只有恶作剧大师才能持有它！"
	icon_state = "beretred"

/obj/item/clothing/head/tgmcberet/bloodred
	name = "\improper 血红色贝雷帽"
	icon_state = "bloodred_beret"
	item_map_variant_flags = NONE

/obj/item/clothing/head/tgmcberet/blueberet
	name = "\improper 蓝色贝雷帽"
	icon_state = "blue_beret"
	item_map_variant_flags = NONE

/obj/item/clothing/head/tgmcberet/darkgreen
	name = "\improper 深绿色贝雷帽"
	icon_state = "darkgreen_beret"
	item_map_variant_flags = NONE

/obj/item/clothing/head/tgmcberet/green
	name = "\improper 绿色贝雷帽"
	icon_state = "beretgreen"
	item_map_variant_flags = NONE

/obj/item/clothing/head/tgmcberet/snow
	name = "\improper 白色贝雷帽"
	icon_state = "beretsnow"
	item_map_variant_flags = NONE

/obj/item/clothing/head/tgmcberet/wo
	name = "\improper 宪兵司令贝雷帽"
	desc = "一顶饰有中尉徽章的贝雷帽。它闪烁着腐败权力的光芒，还沾着一抹甜甜圈的污渍。"
	icon_state = "beretwo"
	soft_armor = list(MELEE = 15, BULLET = 50, LASER = 50, ENERGY = 15, BOMB = 50, BIO = 5, FIRE = 50, ACID = 5)
	item_map_variant_flags = NONE

/obj/item/clothing/head/tgmcberet/fc
	name = "\improper 战地指挥官贝雷帽"
	desc = "一顶印有战地指挥官徽章的贝雷帽。所有注视它的人都会感受到忠诚与勇气的感召。"
	icon_state = "beretfc"
	soft_armor = list(MELEE = 50, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 10, BIO = 5, FIRE = 50, ACID = 50)
	item_map_variant_flags = NONE


/obj/item/clothing/head/tgmccap
	name = "\improper 地球政府殖民地海军陆战队舰长"
	desc = "班长和工程兵偶尔佩戴的休闲帽。虽然其战斗功能有限，但有些人更喜欢佩戴它，而不是标准配发的头盔。"
	icon_state = "cap"
	icon = 'icons/obj/clothing/headwear/marine_hats.dmi'
	worn_icon_list = list(
		slot_head_str = 'icons/mob/clothing/headwear/marine_hats.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	soft_armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 10, BIO = 5, FIRE = 5, ACID = 5)
	var/flipped_cap = FALSE
	var/base_cap_icon
	item_map_variant_flags = (ITEM_ICE_VARIANT)


/obj/item/clothing/head/tgmccap/verb/fliphat()
	set name = "Flip hat"
	set category = "IC.Object"
	set src in usr
	if(!isliving(usr))
		return
	if(usr.incapacitated())
		return

	flipped_cap = !flipped_cap
	if(flipped_cap)
		to_chat(usr, "你把帽子反戴了！看起来像个傻瓜。")
		icon_state = base_cap_icon + "_b"
	else
		to_chat(usr, "你把帽子转回正面。这样好多了。")
		icon_state = base_cap_icon

	update_clothing_icon()


/obj/item/clothing/head/tgmccap/ro
	name = "\improper TGMC军官帽"
	desc = "通常由地球政府殖民地海军陆战队军官佩戴的帽子。虽然其战斗功能有限，但有些人更愿意佩戴它，而不是标准配发的头盔。"
	icon_state = "rocap"

/obj/item/clothing/head/tgmccap/ro/navy
	name = "\improper TGMC海军军官帽"
	desc = "通常由地球政府殖民地海军陆战队军官佩戴的帽子。这次是漂亮的海军蓝色调。"
	icon_state = "navycap"

/obj/item/clothing/head/tgmccap/req
	name = "\improper TGMC 补给上限"
	desc = "这是一顶花哨的帽子，配给一位不那么花哨的军事补给文员。"
	icon_state = "cargocap"
	item_map_variant_flags = null


/obj/item/clothing/head/boonie
	name = "奔尼帽"
	desc = "战术酷炫科技的巅峰之作。"
	icon_state = "booniehat"
	worn_icon_state = "booniehat"
	soft_armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 10, BIO = 5, FIRE = 5, ACID = 5)

/obj/item/clothing/head/ornamented_cap
	name = "\improper 装饰帽"
	desc = "一顶带有护目镜的装饰帽。这顶帽子后部似乎被撕裂了。"
	icon_state = "ornamented_cap"
	icon = 'icons/obj/clothing/headwear/marine_hats.dmi'
	worn_icon_list = list(
		slot_head_str = 'icons/mob/clothing/headwear/marine_hats.dmi'
	)
	soft_armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 10, BIO = 5, FIRE = 5, ACID = 5)
	armor_features_flags = ARMOR_NO_DECAP

/obj/item/clothing/head/slouch
	name = "\improper TGMC 软顶帽"
	desc = "一顶漂亮的软檐帽，一些地球政府殖民地海军陆战队员在炎热天气的行星上或仅仅为了风格而佩戴。虽然其战斗功能有限，但有些人更喜欢佩戴它，而不是标准配发的头盔。"
	icon_state = "slouch_hat"
	icon = 'icons/obj/clothing/headwear/marine_hats.dmi'
	worn_icon_list = list(
		slot_head_str = 'icons/mob/clothing/headwear/marine_hats.dmi',
	)
	soft_armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 10, BIO = 5, FIRE = 5, ACID = 5)

/obj/item/clothing/head/headband
	name = "\improper 青色头带"
	desc = "TGMC中非正统武器操作员常佩戴的头巾。虽然不提供任何防护，但佩戴起来确实比标准头盔舒适。提供两种时尚颜色。"
	icon = 'icons/obj/clothing/headwear/marine_hats.dmi'
	worn_icon_list = list(
		slot_head_str = 'icons/mob/clothing/headwear/marine_hats.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	icon_state = "headband"
	soft_armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 10, BIO = 5, FIRE = 5, ACID = 5)
	armor_features_flags = ARMOR_NO_DECAP

/obj/item/clothing/head/headband/red
	name = "\improper 红色头带"
	icon_state = "headbandred"

/obj/item/clothing/head/headband/rambo
	name = "\improper 鲜红色头带"
	desc = "它在风中飘扬，桀骜不驯，如同佩戴它的那个人。"
	icon_state = "headband_rambo"

/obj/item/clothing/head/headband/snake
	name = "\improper 黑色头带"
	desc = "传奇士兵头带的复制品。可惜它还不能提供无限弹药。暂时还不能。"
	icon_state = "headband_snake"


/obj/item/clothing/head/headset
	name = "\improper TGMC 耳机"
	desc = "通常由无线电操作员和军官使用的耳机。这个看起来出了故障。"
	icon_state = "headset"
	icon = 'icons/obj/clothing/headwear/marine_hats.dmi'
	worn_icon_list = list(
		slot_head_str = 'icons/mob/clothing/headwear/marine_hats.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)

/obj/item/clothing/head/cmo
	name = "\improper 首席医疗官帽"
	desc = "一顶颇为精致的帽子，通常由那些希望获得医疗权威感的人佩戴。"
	icon_state = "cmohat"

/obj/item/clothing/head/securitycap
	name = "安全帽"
	desc = "安保人员常戴的帽子，舒适且带有轻量护甲。"
	icon_state = "security_cap"
	icon = 'icons/obj/clothing/hats.dmi'
	soft_armor = list(MELEE = 15, BULLET = 25, LASER = 20, ENERGY = 20, BOMB = 5, BIO = 5, FIRE = 15, ACID = 5)

/*============================BERETS=================================*/
//Berets have armor, so they have their own category. PMC caps are helmets, so they're in helmets.dm.

/obj/item/clothing/head/beret/marine
	name = "陆战队军官贝雷帽"
	desc = "一顶印有地球政府殖民地海军陆战队徽章的贝雷帽。它散发着敬意与权威。"
	icon_state = "hosberet"
	soft_armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 10, BIO = 5, FIRE = 5, ACID = 5)
	inventory_flags = BLOCKSHARPOBJ

/obj/item/clothing/head/beret/marine/captain
	name = "舰长贝雷帽"
	desc = "一顶饰有舰长徽章的贝雷帽。佩戴者可能会感受到责任的重担压在头上和肩上。"
	icon_state = "centcomcaptain"

/obj/item/clothing/head/beret/marine/chiefofficer
	name = "首席军官贝雷帽"
	desc = "一顶饰有中校徽章的贝雷帽。它散发着黑暗气息，可能会腐蚀灵魂。"
	icon_state = "hosberet"

/obj/item/clothing/head/beret/marine/chiefofficer/sa
	name = "空间特工贝雷帽"
	desc = "一顶带有空间特工徽章的贝雷帽。"

/obj/item/clothing/head/beret/marine/techofficer
	name = "技术军官贝雷帽"
	desc = "一顶饰有中尉徽章的贝雷帽。它散发着某种难以言喻的高效感……"
	icon_state = "e_beret_badge"

/obj/item/clothing/head/beret/marine/logisticsofficer
	name = "后勤军官贝雷帽"
	desc = "一顶饰有中尉徽章的贝雷帽。它令人肃然起敬。"
	icon_state = "hosberet"

/*=========================PROTECTIVE===============================
=======================================================================*/

/obj/item/clothing/head/ushanka
	name = "乌沙帽"
	desc = "西伯利亚的冬天正合适，对吧？"
	icon_state = "ushankadown"
	worn_icon_state = "ushankadown"
	soft_armor = list(MELEE = 35, BULLET = 35, LASER = 20, ENERGY = 10, BOMB = 10, BIO = 0, FIRE = 10, ACID = 10)
	cold_protection_flags = HEAD
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	inventory_flags = BLOCKSHARPOBJ
	inv_hide_flags = HIDEEARS|HIDETOPHAIR
	anti_hug = 1

/obj/item/clothing/head/ushanka/attack_self(mob/user as mob)
	. = ..()
	if(icon_state == "ushankadown")
		icon_state = "ushankaup"
		worn_icon_state = "ushankaup"
		to_chat(user, "你将乌沙帽的护耳翻了上去。")
	else
		icon_state = "ushankadown"
		worn_icon_state = "ushankadown"
		to_chat(user, "你将乌沙帽的耳罩放了下来。")


/obj/item/clothing/head/bearpelt
	name = "熊皮帽"
	desc = "模糊。"
	icon_state = "bearpelt"
	siemens_coefficient = 2
	anti_hug = 4
	armor_protection_flags = HEAD|CHEST|ARMS
	soft_armor = list(MELEE = 90, BULLET = 70, LASER = 45, ENERGY = 55, BOMB = 45, BIO = 10, FIRE = 55, ACID = 55)
	cold_protection_flags = HEAD|CHEST|ARMS
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	inventory_flags = BLOCKSHARPOBJ
	inv_hide_flags = HIDEEARS|HIDETOPHAIR


/obj/item/clothing/head/uppcap
	name = "\improper 联合太空鳞翅目装甲帽"
	desc = "联合太空鳞翅目用于隐蔽行动的标准头部装备，低级海盗也常佩戴。"
	icon = 'icons/obj/clothing/headwear/ert_headwear.dmi'
	icon_state = "upp_cap"
	worn_icon_list = list(
		slot_head_str = 'icons/mob/clothing/headwear/ert_headwear.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	siemens_coefficient = 2
	//anti_hug = 2
	armor_protection_flags = HEAD
	soft_armor = list(MELEE = 50, BULLET = 50, LASER = 50, ENERGY = 55, BOMB = 50, BIO = 50, FIRE = 55, ACID = 55)
	cold_protection_flags = HEAD
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	inventory_flags = BLOCKSHARPOBJ
	inv_hide_flags = HIDEEARS
	armor_features_flags = ARMOR_NO_DECAP

/obj/item/clothing/head/uppcap/beret
	name = "\improper 联合太空鳞翅目装甲贝雷帽"
	icon_state = "upp_beret"

/obj/item/clothing/head/militia
	name = "\improper 民兵装甲兜帽"
	desc = "一些民兵部队使用的大型兜帽，旨在边境地区提供隐蔽性。由于生产中使用的高强度纤维，提供了一定的头部防护。"
	icon = 'icons/obj/clothing/headwear/ert_headwear.dmi'
	worn_icon_list = list(
		slot_head_str = 'icons/mob/clothing/headwear/ert_headwear.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	icon_state = "rebel_hood"
	siemens_coefficient = 2
	armor_protection_flags = HEAD|CHEST
	soft_armor = list(MELEE = 50, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 50, FIRE = 50, ACID = 50)
	cold_protection_flags = HEAD
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	inventory_flags = BLOCKSHARPOBJ
	inv_hide_flags = HIDEEARS|HIDETOPHAIR
	armor_features_flags = ARMOR_NO_DECAP

/obj/item/clothing/head/admiral
	name = "\improper 装甲海军上将帽"
	desc = "一顶结实的海军上将帽。比看起来更坚固。请别像个混混一样把它换成头盔。"
	icon_state = "admiral_helmet"
	siemens_coefficient = 2
	armor_protection_flags = HEAD
	soft_armor = list(MELEE = 60, BULLET = 60, LASER = 45, ENERGY = 55, BOMB = 55, BIO = 10, FIRE = 55, ACID = 55)
	cold_protection_flags = HEAD
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	inventory_flags = BLOCKSHARPOBJ
	inv_hide_flags = HIDEEARS

/obj/item/clothing/head/commissar
	name = "\improper 政委帽"
	desc = "帝国陆军政委佩戴的军帽。这顶帽子似乎散发着权威的气息。"
	worn_icon_list = list(
		slot_head_str = 'icons/mob/clothing/headwear/ert_headwear.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	icon = 'icons/obj/clothing/headwear/ert_headwear.dmi'
	icon_state = "commissar_cap"
	soft_armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 15, BIO = 10, FIRE = 20, ACID = 20)
	armor_features_flags = ARMOR_NO_DECAP

/obj/item/clothing/head/strawhat
	name = "\improper 草帽"
	desc = "一顶外衬杜拉线材的帽子，保留了草帽标志性的经典外观。在星际泡沫区中随处可见。"
	worn_icon_list = list(
		slot_head_str = 'icons/mob/clothing/headwear/ert_headwear.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	icon = 'icons/obj/clothing/headwear/ert_headwear.dmi'
	icon_state = "straw_hat"
	soft_armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 15, BIO = 10, FIRE = 20, ACID = 20)

/obj/item/clothing/head/vsd
	name = "\improper 撞击者MT/45装甲帽"
	desc = "CrashCore 赞助的带凯夫拉纤维的帽子，配有耳机。"
	worn_icon_list = list(
		slot_head_str = 'icons/mob/clothing/headwear/ert_headwear.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	icon = 'icons/mob/clothing/headwear/ert_headwear.dmi'
	icon_state = "vsd_cap"
	worn_icon_state = "vsd_cap"
	soft_armor = list(MELEE = 50, BULLET = 50, LASER = 50, ENERGY = 55, BOMB = 50, BIO = 50, FIRE = 55, ACID = 55)
	armor_features_flags = ARMOR_NO_DECAP

/obj/item/clothing/head/vsd/beret
	name = "\improper 撞击者MT/45 维亚切斯拉夫装甲贝雷帽"
	desc = "采用凯夫拉面料制成的CrashCore赞助贝雷帽，常见于维亚切斯拉夫班长和军官。"
	icon_state = "vsd_beret"
	worn_icon_state = "vsd_beret"
	icon = 'icons/mob/clothing/headwear/ert_headwear.dmi'
	worn_icon_list = list(
		slot_head_str = 'icons/mob/clothing/headwear/ert_headwear.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)

/obj/item/clothing/head/vsd/beret_alt
	name = "\improper 撞击者MT/45维亚切斯拉夫装甲贝雷帽"
	desc = "采用凯夫拉面料制成的CrashCore赞助贝雷帽，常见于维亚切斯拉夫班长和军官。"
	icon_state = "usl_beret"
	worn_icon_state = "usl_beret"
	icon = 'icons/mob/clothing/headwear/ert_headwear.dmi'
	worn_icon_list = list(
		slot_head_str = 'icons/mob/clothing/headwear/ert_headwear.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
