//All the harvester weapons go in here

//Vali Sword
/obj/item/weapon/sword/harvester
	name = "\improper HP-S 收割者刀片"
	desc = "地球政府殖民地海军陆战队实验型高能点-奇点'收割者'刃。一种先进武器，牺牲纯粹力量以换取装载特定试剂时施加多种削弱效果的能力。装载后激活以准备单次效果使用。当连接至瓦利系统时，它还能从击中的外星生命体中采集物质。"
	icon = 'icons/obj/items/weapons/vali.dmi'
	icon_state = "vali_sword"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/weapons/vali_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/weapons/vali_right.dmi',
	)
	worn_icon_state = "vali_sword"
	force = 60
	attack_speed = 12
	w_class = WEIGHT_CLASS_BULKY

/obj/item/weapon/sword/harvester/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/harvester)

/obj/item/weapon/sword/harvester/equipped(mob/user, slot)
	. = ..()
	toggle_item_bump_attack(user, TRUE)

/obj/item/weapon/sword/harvester/dropped(mob/user)
	. = ..()
	toggle_item_bump_attack(user, FALSE)

//Vali Knife
/obj/item/weapon/combat_knife/harvester
	name = "\improper HP-S 收割者匕首"
	desc = "地球政府殖民地海军陆战队实验型高能点-奇点'收割者'匕首。HP-S收割者刀片的高级版本，缩小至标准配发靴刀尺寸。它以收割者刀片的尺寸和威力为代价换取更小的形态，附带副作用是化学储存容量极小，但仍保留对目标施加虚弱效果的能力。装载后激活以准备单次效果使用。当连接至瓦利系统时，它还能从击中的外星生命体中采集物质。"
	icon = 'icons/obj/items/weapons/vali.dmi'
	icon_state = "vali_knife"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/weapons/vali_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/weapons/vali_right.dmi',
	)
	worn_icon_state = "vali_knife"
	w_class = WEIGHT_CLASS_SMALL
	force = 25
	throwforce = 15
	throw_speed = 3
	throw_range = 6
	attack_speed = 8
	sharp = IS_SHARP_ITEM_ACCURATE
	hitsound = 'sound/weapons/slash.ogg'

/obj/item/weapon/combat_knife/harvester/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/harvester, 5)

/obj/item/weapon/combat_knife/harvester/equipped(mob/user, slot)
	. = ..()
	toggle_item_bump_attack(user, TRUE)

/obj/item/weapon/combat_knife/harvester/dropped(mob/user)
	. = ..()
	toggle_item_bump_attack(user, FALSE)

//Vali Spear
/obj/item/weapon/twohanded/spear/tactical/harvester
	name = "\improper HP-S 收割者长矛"
	desc = "地球政府殖民地海军陆战队实验型高指向性奇点'收割者'长矛。一种先进武器，牺牲纯粹力量以换取装载特定试剂时施加多种削弱效果的能力。装载后激活以准备单次效果使用。当连接至瓦利系统时，它还能从击中的外星生命体中采集物质。"
	icon = 'icons/obj/items/weapons/vali.dmi'
	icon_state = "vali_spear"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/weapons/vali_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/weapons/vali_right.dmi',
	)
	worn_icon_state = "vali_spear"
	force = 32
	force_activated = 60
	throwforce = 60

/obj/item/weapon/twohanded/spear/tactical/harvester/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/harvester)

//Vali Claymore (That thing was too big to be called a sword. Too big, too thick, too heavy, and too rough, it was more like a large hunk of iron.)
/obj/item/weapon/twohanded/glaive/harvester
	name = "\improper HP-S 收割者阔剑"
	desc = "地球政府殖民地海军陆战队实验型高能点-奇点'收割者'刃。一种先进武器，牺牲纯粹力量以换取装载特定试剂时施加多种削弱效果的能力。装载后激活以准备单次效果使用。当连接到瓦利系统时，它还能从击中的外星生命体中采集物质。此特定版本经过放大以适应旧世界阔剑的设计。只需握紧剑柄即可激活。"
	icon = 'icons/obj/items/weapons/vali.dmi'
	icon_state = "vali_claymore"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/weapons/vali_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/weapons/vali_right.dmi',
	)
	worn_icon_state = "vali_claymore"
	attack_speed = 24
	resistance_flags = NONE

/obj/item/weapon/twohanded/glaive/harvester/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/harvester, 60)

/obj/item/weapon/twohanded/glaive/harvester/wield(mob/user)
	. = ..()
	if(!.)
		return
	toggle_item_bump_attack(user, TRUE)

/obj/item/weapon/twohanded/glaive/harvester/unwield(mob/user)
	. = ..()
	if(!.)
		return
	toggle_item_bump_attack(user, FALSE)
