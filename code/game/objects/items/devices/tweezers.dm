/obj/item/tweezers
	name = "医用镊子"
	desc = "用于从患者体内取出弹片的医用镊子。"
	icon = 'icons/obj/items/surgery_tools.dmi'
	icon_state = "tweezers"
	worn_icon_state = "tweezers"
	item_flags = NOBLUDGEON
	w_class = WEIGHT_CLASS_SMALL

/obj/item/tweezers/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/shrapnel_removal, 10 SECONDS)

/obj/item/tweezers_advanced
	name = "\improper ESR-12"
	desc = "能量化破片移除工具专为快速清除受害者体内大量破片而设计。极其痛苦。"
	icon = 'icons/obj/items/surgery_tools.dmi'
	icon_state = "predator_bone-gel"
	worn_icon_state = "predator_bone-gel"
	item_flags = NOBLUDGEON
	w_class = WEIGHT_CLASS_SMALL

/obj/item/tweezers_advanced/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/shrapnel_removal, 1 SECONDS, 12 SECONDS)
