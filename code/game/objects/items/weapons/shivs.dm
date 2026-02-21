/obj/item/weapon/shiv
	name = "玻璃匕首"
	icon = 'icons/obj/items/weapons/knives.dmi'
	icon_state = "shiv"
	desc = "一把临时制作的玻璃匕首。"
	attack_verb = list("shanks", "shivs", "slashes", "stabs", "cuts", "rips")
	hitsound = 'sound/weapons/slash.ogg'
	atom_flags = CONDUCT
	sharp = IS_SHARP_ITEM_ACCURATE
	edge = TRUE
	force = 25
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 6
	throw_speed = 3
	throw_range = 6

/obj/item/weapon/shiv/Initialize(mapload)
	. = ..()
	force += rand(-10, 10)

/obj/item/weapon/shiv/plasma
	icon_state = "plasmashiv"
	desc = "一把临时制作的等离子体玻璃刀。"

/obj/item/weapon/shiv/titanium
	icon_state = "titaniumshiv"
	desc = "一把临时制作的钛合金刀。"

/obj/item/weapon/shiv/plastitanium
	icon_state = "plastitaniumshiv"
	desc = "一把临时制作的塑钛玻璃刀。"
