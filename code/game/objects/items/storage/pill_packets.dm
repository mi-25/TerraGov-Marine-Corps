// Pill packets, basically pill bottles you can't put pills back into.

/obj/item/storage/pill_bottle/packet
	name = "药片包"
	desc = "内含药片。一旦取出便无法放回。"
	icon_state = "packet_canister"
	greyscale_config = null //So that we get packets and not pill bottles.
	storage_type = /datum/storage/pill_bottle/packet
	///Color of the pips on top of the pill packet
	var/pip_color = "#0066ff" //default color because I like this color

/obj/item/storage/pill_bottle/packet/update_overlays()
	. = ..()
	var/image/overlay = image('icons/obj/items/chemistry.dmi', src, "packet_canister[length(contents)]")
	overlay.color = pip_color
	. += overlay

/obj/item/storage/pill_bottle/packet/bicaridine
	name = "比卡瑞丁药片包"
	desc = "本包装内含比卡瑞丁药片。用于治疗轻微割伤。一旦取出便无法放回。一次最多服用2片。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/bicaridine
	pip_color = COLOR_PACKET_BICARIDINE

/obj/item/storage/pill_bottle/packet/kelotane
	name = "凯洛坦药片包"
	desc = "本包装内含凯洛坦药片。用于治疗表面烧伤。一旦取出便无法放回。一次最多服用2片。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/kelotane
	pip_color = COLOR_PACKET_KELOTANE

/obj/item/storage/pill_bottle/packet/tramadol
	name = "曲马多药片包"
	desc = "本包装内含曲马多药片。用作中等强度的止痛药。一旦取出便无法放回。一次最多服用2片。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/tramadol
	pip_color = COLOR_PACKET_TRAMADOL

/obj/item/storage/pill_bottle/packet/tricordrazine
	name = "三卡德嗪药片包"
	desc = "本包装内含三氯唑啉药片。可轻微治愈所有类型的伤害。一旦取出便无法放回。每次最多服用2片。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/tricordrazine
	pip_color = COLOR_PACKET_TRICORDRAZINE

/obj/item/storage/pill_bottle/packet/dylovene
	name = "地洛芬药片包"
	desc = "本包装内含迪洛芬药片。用于清除毒素并治疗毒素伤害。一旦取出便无法放回。一次服用不得超过2片。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/dylovene
	pip_color = COLOR_PACKET_DYLOVENE

/obj/item/storage/pill_bottle/packet/paracetamol
	name = "扑热息痛药片包"
	desc = "本包装内含扑热息痛药片，亦称泰诺。这是一种长效但效果轻微的止痛药。一旦取出便无法放回。长时间内服用不得超过4片。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/paracetamol
	pip_color = COLOR_PACKET_PARACETAMOL

/obj/item/storage/pill_bottle/packet/isotonic
	name = "等渗药丸包"
	desc = "内含等渗溶液的药片。用于刺激血液再生。一旦取出便无法放回。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/isotonic
	pip_color = COLOR_PACKET_ISOTONIC

/obj/item/storage/pill_bottle/packet/leporazine
	name = "勒波拉嗪药片包"
	desc = "本包装内含勒波拉嗪药片。能快速稳定患者的体内温度。一旦取出就无法放回。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/leporazine
	pip_color = COLOR_PACKET_LEPORAZINE

/obj/item/storage/pill_bottle/packet/russian_red
	name = "俄式红色药丸包"
	desc = "这个包装内装有俄罗斯红药片。用于在没有卫生兵的情况下进行战场急救。一旦取出就无法放回。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/russian_red
	pip_color = COLOR_PACKET_RUSSIAN_RED

/obj/item/storage/pill_bottle/packet/ryetalyn
	name = "瑞塔林药片包装"
	desc = "本包装内含莱特林药片。用于提供对抗血液毒素的防护。一旦取出便无法放回。一次最多服用2片。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/ryetalyn
	pip_color = COLOR_PACKET_RYETALYN
