/obj/item/phone
	name = "红色电话"
	desc = "如果出了什么差错..."
	icon = 'icons/obj/items/items.dmi'
	icon_state = "red_phone"
	force = 3
	throwforce = 2
	throw_speed = 1
	throw_range = 4
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("calls", "rings")
	hitsound = 'sound/weapons/ring.ogg'

/obj/item/clock
	name = "数字时钟"
	desc = "一个电池驱动的时钟，能保持时间误差在5秒左右……它从来就没那么准过。"
	icon = 'icons/obj/device.dmi'
	icon_state = "digital_clock"
	force = 3
	throwforce = 2
	throw_speed = 1
	throw_range = 4
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clock/examine(mob/user, distance, infix, suffix)
	. = ..()
	. += "The [src] reads: [GLOB.current_date_string] - [stationTimestamp()]"

/obj/item/bananapeel
	name = "香蕉皮"
	desc = "一根香蕉的果皮。"
	icon = 'icons/obj/items/harvest.dmi'
	icon_state = "banana_peel"
	worn_icon_state = "banana_peel"
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 4
	throw_range = 20

/obj/item/bananapeel/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/slippery, 0.4 SECONDS, 0.2 SECONDS)

/obj/item/gift
	name = "礼物"
	desc = "一个包装好的物品。"
	icon = 'icons/obj/items/items.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/items/containers_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/containers_right.dmi',
	)
	icon_state = "gift3"
	var/size = 3
	var/obj/item/gift = null
	worn_icon_state = "gift"
	w_class = WEIGHT_CLASS_BULKY

/obj/item/staff
	name = "巫师法杖"
	desc = "似乎是巫师使用的一根法杖。"
	icon = 'icons/obj/wizard.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/items/toys_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/toys_right.dmi',
	)
	icon_state = "staff"
	force = 3
	throwforce = 5
	throw_speed = 1
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("bludgeons", "whacks", "disciplines")

/obj/item/staff/broom
	name = "扫帚"
	desc = "用于清扫，以及在夜晚狂笑着飞行。黑猫不包含在内。"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "broom"

/obj/item/skub
	desc = "这是斯库布。"
	name = "斯库布"
	icon = 'icons/obj/items/items.dmi'
	icon_state = "skub"
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("skubs")

/obj/item/ectoplasm
	name = "灵质"
	desc = "诡异"
	gender = PLURAL
	icon = 'icons/obj/wizard.dmi'
	icon_state = "ectoplasm"

/obj/item/minerupgrade
	name = "矿工升级"
	desc = "子类型物品，不应存在。"
	icon = 'icons/obj/mining_drill.dmi'
	icon_state = "mining_drill_reinforceddisplay"
	w_class = WEIGHT_CLASS_NORMAL
	/// Used to determine the type of upgrade the miner is going to receive. Has to be a string which is defined in miner.dm or it won't work.
	var/uptype

/obj/item/minerupgrade/reinforcement
	name = "强化部件箱"
	desc = "一个高度折叠的强化组件箱，用于替换普通采矿井中使用的脆弱组件。"
	icon_state = "mining_drill_reinforceddisplay"
	uptype = "reinforced components"

/obj/item/minerupgrade/overclock
	name = "高效钻头"
	desc = "一个装有几个泵和一把大型钻头的箱子，用于替换普通矿井中的标准钻头以实现更快开采。"
	icon_state = "mining_drill_overclockeddisplay"
	uptype = "high-efficiency drill"

/obj/item/minerupgrade/automatic
	name = "采矿电脑"
	desc = "一台小型计算机，可自动化管理采矿井，减少人工监督需求。"
	icon_state = "mining_drill_automaticdisplay"
	uptype = "mining computer"

/obj/item/ai_target_beacon
	name = "AI已链接远程目标指示器"
	desc = "一套小型伺服电机和齿轮组，与电池、天线和电路板相连。将其安装到迫击炮上，可让舰载AI远程瞄准。"
	icon = 'icons/obj/items/items.dmi'
	icon_state = "modkit"

/obj/item/rosary
	name = "念珠"
	desc = "一串小型的赤铁矿珠银制念珠"
	icon = 'icons/obj/items/items.dmi'
	icon_state = "rosary"
	worn_icon_state = "rosary"
	w_class = WEIGHT_CLASS_TINY

/obj/item/album
	name = "\improper 相册"
	desc = "一本装满某人重要回忆的相册。"
	icon = 'icons/obj/items/paper.dmi'
	icon_state = "album"
	w_class = WEIGHT_CLASS_SMALL
