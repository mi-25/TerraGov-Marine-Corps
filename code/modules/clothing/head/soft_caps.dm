/obj/item/clothing/head/soft
	name = "补给上限"
	desc = "这是一顶品味不佳的黄色棒球帽。"
	icon_state = "cargosoft"
	worn_icon_state = "cargosoft"
	inventory_flags = COVEREYES
	var/cap_color = "cargo"
	var/flipped = 0
	siemens_coefficient = 0.9
	armor_protection_flags = NONE

/obj/item/clothing/head/soft/dropped()
	icon_state = "[cap_color]soft"
	flipped=0
	..()

/obj/item/clothing/head/soft/verb/flip()
	set category = "IC.Object"
	set name = "Flip cap"
	set src in usr
	if(!usr.incapacitated())
		src.flipped = !src.flipped
		if(src.flipped)
			icon_state = "[cap_color]soft_flipped"
			to_chat(usr, "你把帽子反戴过来。")
		else
			icon_state = "[cap_color]soft"
			to_chat(usr, "你将帽子翻回正常位置。")
		update_clothing_icon()	//so our mob-overlays update

/obj/item/clothing/head/soft/red
	name = "红帽"
	desc = "这是一顶品味不佳的红色棒球帽。"
	icon_state = "redsoft"
	cap_color = "red"

/obj/item/clothing/head/soft/blue
	name = "蓝色贝雷帽"
	desc = "这是一顶品味不佳的蓝色棒球帽。"
	icon_state = "bluesoft"
	cap_color = "blue"

/obj/item/clothing/head/soft/green
	name = "绿色贝雷帽"
	desc = "这是一顶品味欠佳的绿色棒球帽。"
	icon_state = "greensoft"
	cap_color = "green"

/obj/item/clothing/head/soft/yellow
	name = "黄帽"
	desc = "这是一顶品味不佳的黄色棒球帽。"
	icon_state = "yellowsoft"
	cap_color = "yellow"

/obj/item/clothing/head/soft/grey
	name = "灰帽"
	desc = "这是一顶品味优雅的灰色棒球帽。"
	icon_state = "greysoft"
	cap_color = "grey"

/obj/item/clothing/head/soft/orange
	name = "橙色贝雷帽"
	desc = "这是一顶品味不佳的橙色棒球帽。"
	icon_state = "orangesoft"
	cap_color = "orange"

/obj/item/clothing/head/soft/mime
	name = "白帽"
	desc = "这是一顶品味不佳的白色棒球帽。"
	icon_state = "mimesoft"
	cap_color = "mime"

/obj/item/clothing/head/soft/purple
	name = "紫色菌帽"
	desc = "这是一顶品味不佳的紫色棒球帽。"
	icon_state = "purplesoft"
	cap_color = "purple"

/obj/item/clothing/head/soft/rainbow
	name = "彩虹帽"
	desc = "这是一顶色彩鲜艳的彩虹色棒球帽。"
	icon_state = "rainbowsoft"
	cap_color = "rainbow"

/obj/item/clothing/head/soft/sec
	name = "安保帽"
	desc = "这是一顶品味出众的红色棒球帽。"
	icon_state = "secsoft"
	cap_color = "sec"

/obj/item/clothing/head/soft/sec/corp
	name = "企业安保帽"
	desc = "这是企业配色的棒球帽。"
	icon_state = "corpsoft"
	cap_color = "corp"



//marine cap

/obj/item/clothing/head/soft/marine
	name = "陆战队士官帽"
	desc = "这是一顶由先进防弹纤维制成的软帽。无法防止头上起包。"
	icon_state = "greysoft"
	cap_color = "grey"
	soft_armor = list(MELEE = 35, BULLET = 35, LASER = 35, ENERGY = 15, BOMB = 10, BIO = 0, FIRE = 15, ACID = 15)
	inventory_flags = BLOCKSHARPOBJ

/obj/item/clothing/head/soft/marine/alpha
	name = "阿尔法班班长帽"
	icon_state = "redsoft"
	cap_color = "red"

/obj/item/clothing/head/soft/marine/beta
	name = "布拉沃班班长帽"
	icon_state = "yellowsoft"
	cap_color = "yellow"

/obj/item/clothing/head/soft/marine/charlie
	name = "查理班班长帽"
	icon_state = "purplesoft"
	cap_color = "purple"

/obj/item/clothing/head/soft/marine/delta
	name = "德尔塔班班长帽"
	icon_state = "bluesoft"
	cap_color = "blue"

/obj/item/clothing/head/soft/marine/mp
	name = "陆战队宪兵军士帽"
	icon_state = "greensoft"
	cap_color = "green"
