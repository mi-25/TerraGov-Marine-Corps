/obj/item/fishing
	name = "钓鱼道具"
	icon = 'icons/obj/items/fishing.dmi'
	icon_state = "worm"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/items/toys_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/toys_right.dmi',
		)
	force = 0

/obj/item/fishing/reel
	name = "红色卷轴"
	desc = "一卷红色钓鱼线。"
	icon_state = "reel_red"

/obj/item/fishing/reel/blue
	name = "蓝色卷轴"
	desc = "一卷蓝色钓鱼线。"
	icon_state = "reel_blue"

/obj/item/fishing/reel/white
	name = "白色卷轴"
	desc = "一卷白色钓鱼线。"
	icon_state = "reel_white"

/obj/item/fishing/reel/green
	name = "绿色卷轴"
	desc = "一卷绿色钓鱼线。"
	icon_state = "reel_green"

/obj/item/fishing/bait_can
	name = "诱饵罐"
	desc = "里面会有什么呢？"
	icon_state = "bait_can_closed"

/obj/item/fishing/bait_can/open
	desc = "满是蠕虫。"
	icon_state = "bait_can_open"

/obj/item/fishing/bait_can/empty
	desc = "其内容物已被清空。"
	icon_state = "bait_can_empty"

/obj/item/fishing/hook
	name = "钩爪"
	desc = "末端非常锋利尖锐。"
	icon_state = "hook"

/obj/item/fishing/hook/rescue
	name = "救援钩"
	desc = "包含双倍钩爪，精度更高。"
	icon_state = "rescue_hook"

/obj/item/fishing/worm
	name = "蠕虫"
	desc = "它还在抽搐。"
	icon_state = "worm"

/obj/item/fishing/lure
	name = "引诱"
	desc = "它带有浮力，并且附有鱼饵。"
	icon_state = "lure"

/obj/item/fishing/rod
	name = "鱼竿"
	desc = "你可以用这个钓鱼。"
	icon_state = "fishing_rod"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/fishing_rod_lefthand.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/fishing_rod_righthand.dmi',
	)
	worn_icon_state = "rod"
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	force = 8
	w_class = WEIGHT_CLASS_HUGE

/obj/item/fishing/rod/telescopic
	name = "伸缩鱼竿"
	icon_state = "telescopic_fishing_rod"

/obj/item/fishing/fish
	name = "金鱼"
	desc = "尝起来怪怪的。"
	icon_state = "goldfish"
	force = 2

/obj/item/fishing/fish/guppy
	name = "孔雀鱼"
	desc = "味道有点怪。"
	icon_state = "guppyfish"

/obj/item/fishing/fish/jelly
	name = "水母"
	desc = "这个有点透明。"
	icon_state = "jellyfish"

/obj/item/fishing/fish/puffer
	name = "河豚"
	desc = "它永久性地肿胀着。"
	icon_state = "pufferfish"

/obj/item/fishing/fish/lanternfish
	name = "灯笼鱼"
	desc = "通常发现于海洋深处。"
	icon_state = "lanternfish"

/obj/item/fishing/fish/crab
	name = "螃蟹"
	desc = "它似乎已经死了。"
	icon_state = "crab"

/obj/item/fishing/fish/starfish
	name = "海星"
	desc = "这些是在海滩上发现的。"
	icon_state = "starfish"

/obj/item/fishing/fish/firefish
	name = "火鱼"
	desc = "具有异域色彩。"
	icon_state = "firefish"
