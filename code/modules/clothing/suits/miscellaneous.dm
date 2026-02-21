/*
* Contains:
*		Lasertag
*		Costume
*		Misc
*/

/*
* Lasertag
*/
/obj/item/clothing/suit/bluetag
	name = "蓝色激光标签护甲"
	desc = "蓝色荣耀，全站同享。"
	icon_state = "bluetag"
	worn_icon_state = "bluetag"
	blood_overlay_type = "armor"
	armor_protection_flags = CHEST
	allowed = list (/obj/item/weapon/gun)
	siemens_coefficient = 3

/obj/item/clothing/suit/redtag
	name = "红色激光标签护甲"
	desc = "据说能跑得更快。"
	icon_state = "redtag"
	worn_icon_state = "redtag"
	blood_overlay_type = "armor"
	armor_protection_flags = CHEST
	allowed = list (/obj/item/weapon/gun)
	siemens_coefficient = 3

/*
* Costume
*/
/obj/item/clothing/suit/pirate
	name = "海盗大衣"
	desc = "哟呵。"
	icon_state = "pirate"
	worn_icon_state = "pirate"
	armor_protection_flags = CHEST|ARMS


/obj/item/clothing/suit/hgpirate
	name = "海盗舰长大衣"
	desc = "哟呵。"
	icon_state = "hgpirate"
	worn_icon_state = "hgpirate"
	inv_hide_flags = HIDEJUMPSUIT
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS
	item_flags = SYNTH_RESTRICTED
	soft_armor = list(MELEE = 60, BULLET = 90, LASER = 60, ENERGY = 20, BOMB = 25, BIO = 10, FIRE = 20, ACID = 20)

/obj/item/clothing/suit/hgpirate/noarmor
	name = "破烂的海盗舰长外套"
	item_flags = NONE
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)

/obj/item/clothing/suit/cyborg_suit
	name = "赛博格装甲"
	desc = "一套赛博格服装的套装。"
	icon_state = "death"
	worn_icon_state = "death"
	atom_flags = CONDUCT
	inv_hide_flags = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

/obj/item/clothing/suit/johnny_coat
	name = "约翰尼~~ 大衣"
	desc = "约翰尼~~"
	icon_state = "johnny"
	worn_icon_state = "johnny"

/obj/item/clothing/suit/justice
	name = "正义护甲"
	desc = "这看起来简直太荒谬了。"
	icon_state = "justice"
	worn_icon_state = "justice"
	inv_hide_flags = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	armor_protection_flags = CHEST|GROIN|ARMS|HANDS|LEGS|FEET

/obj/item/clothing/suit/judgerobe
	name = "法官长袍"
	desc = "这件长袍象征着权威。"
	icon_state = "judge"
	worn_icon_state = "judge"
	armor_protection_flags = CHEST|GROIN|LEGS|ARMS
	allowed = list(/obj/item/storage/fancy/cigarettes,/obj/item/spacecash)
	inv_hide_flags = HIDEJUMPSUIT

/obj/item/clothing/suit/wcoat
	name = "马甲"
	desc = "为了追求优雅而致命的乐趣。"
	icon_state = "vest"
	worn_icon_state = "wcoat"
	blood_overlay_type = "armor"
	armor_protection_flags = CHEST|GROIN


/obj/item/clothing/suit/storage/apron/overalls
	name = "连体工作服"
	desc = "一套牛仔背带裤。"
	icon_state = "overalls"
	worn_icon_state = "overalls"
	armor_protection_flags = CHEST|GROIN|LEGS


/obj/item/clothing/suit/syndicatefake
	name = "红色太空服复制品"
	icon_state = "syndicate"
	worn_icon_state = "space_suit_syndicate"
	desc = "一件塑料仿制的辛迪加太空服，穿上它你看起来就像个真正的辛迪加杀手！这只是个玩具，不能在太空中使用！"
	w_class = WEIGHT_CLASS_NORMAL
	allowed = list(/obj/item/flashlight,/obj/item/tank/emergency_oxygen,/obj/item/toy)
	inv_hide_flags = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	armor_protection_flags = CHEST|GROIN|ARMS|HANDS|LEGS|FEET

/obj/item/clothing/suit/hastur
	name = "哈斯塔长袍"
	desc = "非人可着之袍"
	icon_state = "hastur"
	worn_icon_state = "hastur"
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS
	inv_hide_flags = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT


/obj/item/clothing/suit/imperium_monk
	name = "帝国僧侣"
	desc = "你今天干掉异形了吗？"
	icon_state = "imperium_monk"
	worn_icon_state = "imperium_monk"
	armor_protection_flags = HEAD|CHEST|GROIN|LEGS|FEET|ARMS
	inv_hide_flags = HIDESHOES|HIDEJUMPSUIT


/obj/item/clothing/suit/chickensuit
	name = "鸡装"
	desc = "一件由古老帝国KFC在很久以前制造的套装。"
	icon_state = "chickensuit"
	worn_icon_state = "chickensuit"
	armor_protection_flags = CHEST|ARMS|GROIN|LEGS|FEET
	inv_hide_flags = HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 2


/obj/item/clothing/suit/monkeysuit
	name = "猴子服"
	desc = "一套看起来像灵长类动物的服装"
	icon_state = "monkeysuit"
	worn_icon_state = "monkeysuit"
	armor_protection_flags = CHEST|ARMS|GROIN|LEGS|FEET|HANDS
	inv_hide_flags = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 2


/obj/item/clothing/suit/holidaypriest
	name = "节日牧师"
	desc = "这是个愉快的假期，我的孩子。"
	icon_state = "holidaypriest"
	worn_icon_state = "holidaypriest"
	armor_protection_flags = CHEST|GROIN|LEGS|ARMS
	inv_hide_flags = HIDEJUMPSUIT


/obj/item/clothing/suit/cardborg
	name = "卡博格套装"
	desc = "一个普通的纸板箱，侧面开了几个洞。"
	icon_state = "cardborg"
	worn_icon_state = "cardborg"
	armor_protection_flags = CHEST|GROIN
	inv_hide_flags = HIDEJUMPSUIT


/obj/item/clothing/suit/white_dress_jacket
	name = "白色礼服夹克"
	desc = "与您的白色礼服相得益彰的完美白色外套。"
	icon_state = "white_dress_jacket" //with thanks to Baystation12
	worn_icon_state = "white_dress_jacket" //with thanks to Baystation12

	allowed = list(
		/obj/item/instrument,
		/obj/item/storage/holster/blade,
		/obj/item/weapon/sword,
		/obj/item/weapon/twohanded,
	)


/obj/item/clothing/suit/straight_jacket
	name = "拘束衣"
	desc = "一套完全限制穿戴者行动的拘束服。"
	icon_state = "straight_jacket"
	worn_icon_state = "straight_jacket"
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	inv_hide_flags = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT


/obj/item/clothing/suit/straight_jacket/equipped(mob/living/carbon/user, slot)
	if(slot == SLOT_WEAR_SUIT)
		ENABLE_BITFIELD(user.restrained_flags, RESTRAINED_STRAIGHTJACKET)
		user.stop_pulling() //Can't pull if restrained.
		if(user.handcuffed) //Keep the cuffs on.
			user.drop_all_held_items()
		user.update_action_buttons() //Certain action buttons will no longer be usable.
		RegisterSignal(src, COMSIG_ITEM_DROPPED, PROC_REF(on_removal))
	return ..()


/obj/item/clothing/suit/straight_jacket/proc/on_removal(datum/source, mob/living/user)
	SIGNAL_HANDLER
	DISABLE_BITFIELD(user.restrained_flags, RESTRAINED_STRAIGHTJACKET)
	UnregisterSignal(src, COMSIG_ITEM_DROPPED)


/obj/item/clothing/suit/ianshirt
	name = "衬衫"
	desc = "一件破旧但出奇舒适的T恤，上面印着伊恩的图案。虽然不至于说穿上它就像被拥抱一样，但感觉也差不多了。很适合穿着睡觉。"
	icon_state = "ianshirt"
	worn_icon_state = "ianshirt"
	armor_protection_flags = CHEST|ARMS

//Blue suit jacket toggle
/obj/item/clothing/suit/suit/verb/toggle()
	set name = "Toggle Jacket Buttons"
	set category = "IC.Object"
	set src in usr

	if(!usr.canmove || usr.stat || usr.restrained())
		return 0

	if(src.icon_state == "suitjacket_blue_open")
		src.icon_state = "suitjacket_blue"
		src.worn_icon_state = "suitjacket_blue"
		to_chat(usr, "你扣上了西装外套的纽扣。")
	else if(src.icon_state == "suitjacket_blue")
		src.icon_state = "suitjacket_blue_open"
		src.worn_icon_state = "suitjacket_blue_open"
		to_chat(usr, "你解开了西装外套的纽扣。")
	else
		to_chat(usr, "你扣上了[src]上一些想象中的纽扣。")
		return
	update_clothing_icon()

//pyjamas
//originally intended to be pinstripes >.>

/obj/item/clothing/under/bluepyjamas
	name = "蓝色睡衣"
	desc = "略显老式的睡衣。"
	icon_state = "blue_pyjamas"
	worn_icon_state = "blue_pyjamas"
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS

/obj/item/clothing/under/redpyjamas
	name = "红色睡衣"
	desc = "略显老式的睡衣。"
	icon_state = "red_pyjamas"
	worn_icon_state = "red_pyjamas"
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS

//coats

/obj/item/clothing/suit/leathercoat
	name = "皮大衣"
	desc = "一件又长又厚的黑色皮大衣。"
	icon_state = "leathercoat"
	worn_icon_state = "leathercoat"

/obj/item/clothing/suit/browncoat
	name = "棕色皮大衣"
	desc = "一件棕色的长款皮大衣。"
	icon_state = "browncoat"
	worn_icon_state = "browncoat"

/obj/item/clothing/suit/neocoat
	name = "黑色外套"
	desc = "一件飘逸的黑色外套。"
	icon_state = "neocoat"
	worn_icon_state = "neocoat"

/obj/item/clothing/suit/xenos
	name = "异形防护服"
	desc = "一套由几丁质异形外皮制成的防护服。"
	icon_state = "xenos"
	worn_icon_state = "xenos_helm"
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	inv_hide_flags = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 2
//swimsuit
/obj/item/clothing/under/swimsuit/
	siemens_coefficient = 1
	armor_protection_flags = NONE

/obj/item/clothing/under/swimsuit/black
	name = "黑色泳衣"
	desc = "一件老式黑色泳衣。"
	icon_state = "swim_black"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/blue
	name = "蓝色泳衣"
	desc = "一件老式的蓝色泳衣。"
	icon_state = "swim_blue"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/purple
	name = "紫色泳衣"
	desc = "一件老式的紫色泳衣。"
	icon_state = "swim_purp"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/green
	name = "绿色泳衣"
	desc = "一件老式的绿色泳衣。"
	icon_state = "swim_green"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/red
	name = "红色泳衣"
	desc = "一件老式的红色泳衣。"
	icon_state = "swim_red"
	siemens_coefficient = 1

/obj/item/clothing/suit/poncho
	name = "斗篷"
	desc = "一件简单舒适的斗篷。"
	icon_state = "classicponcho"

/obj/item/clothing/suit/poncho/green
	name = "绿色雨披"
	desc = "经典的、非种族主义的雨披。这款是绿色的。"
	icon_state = "greenponcho"

/obj/item/clothing/suit/poncho/red
	name = "红色斗篷"
	desc = "经典的、非种族主义的雨披。这件是红色的。"
	icon_state = "redponcho"

/obj/item/clothing/suit/storage/bomber
	name = "轰炸机夹克"
	desc = "一件破旧的二战皮制轰炸机夹克。"
	icon_state = "bomber"
	armor_protection_flags = CHEST|ARMS
	cold_protection_flags = CHEST|ARMS
	min_cold_protection_temperature = T0C
	siemens_coefficient = 0.7
	allowed = list (
		/obj/item/flashlight,
		/obj/item/binoculars,
		/obj/item/weapon/combat_knife,
		/obj/item/attachable/bayonet,
		/obj/item/storage/holster/blade
	)

/obj/item/clothing/suit/replica
	name = "仿制护甲"
	desc = "殖民地民兵常用护甲的复制品。"
	icon = 'icons/obj/clothing/suits/ert_suits.dmi'
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/clothing/suits/marine_armor.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	icon_state = "rebel_armor"
	worn_icon_state = "rebel_armor"
	armor_protection_flags = CHEST|GROIN|LEGS

/obj/item/clothing/suit/techpriest
	name = "技术神甫长袍"
	desc = "赞美万机之神！"
	icon_state = "tp_bodyrobes"
	worn_icon_state = "tp_bodyrobes"
	armor_protection_flags = CHEST|GROIN|LEGS|ARMS

