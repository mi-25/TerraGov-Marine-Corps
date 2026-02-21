// Metnal Operation instruments
/obj/item/instrument/jukebox
	icon = 'icons/obj/metnal_objects.dmi'
	name = "点唱机"
	desc = "哇，这东西可真够古老的！"
	icon_state = "jukebox"
	// allowed_instrument_ids = "r3celeste"
	// var/use_power = IDLE_POWER_USE
	// var/idle_power_usage = 0
	var/wrenchable = FALSE
	anchored = TRUE
	// interaction_flags = INTERACT_MACHINE_DEFAULT
	// use_power = IDLE_POWER_USE
	density = TRUE
	// idle_power_usage = 2
	light_range = 2
	light_power = 0.5
	light_color = LIGHT_COLOR_EMISSIVE_GREEN

/obj/item/instrument/jukebox/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/instrument/jukebox/update_overlays()
	. = ..()
	. += emissive_appearance(icon, "[icon_state]_emissive", src, alpha = src.alpha)

// knife flute sprite
/obj/item/instrument/macheteflute

	name = "洛比的砍刀"
	desc = "这把定制砍刀的刀柄和刀身上都有孔洞，会发出忧郁的声音。"
	icon = 'icons/obj/metnal_objects.dmi'
	icon_state = "knife_flute"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/items/instruments_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/instruments_right.dmi',
		slot_s_store_str = 'icons/mob/instruments_back.dmi',
		)
	worn_icon_state = "machete"
	allowed_instrument_ids = "recorder"
	force = 65
	attack_speed = 12
	w_class = WEIGHT_CLASS_BULKY
	throwforce = 10
	sharp = IS_SHARP_ITEM_BIG
	edge = 1
	attack_verb = list("attacks", "slashes", "stabs", "slices", "tears", "rips", "dices", "cuts")
	hitsound = 'sound/weapons/bladeslice.ogg'

// rocks
/obj/structure/rock/large/obsidian
	name = "岩石"
	desc = "由火山熔岩冷却形成的发光黑曜石碎片。"
	icon = 'icons/obj/metnal_objects.dmi'
	icon_state = "obsidian_1"
	density = FALSE
/obj/structure/rock/small/obsidian
	name = "岩石"
	desc = "由火山熔岩冷却形成的发光黑曜石碎片。"
	icon = 'icons/obj/metnal_objects.dmi'
	icon_state = "obsidian_2"
	density = FALSE
/obj/structure/rock/medium/obsidian
	name = "岩石"
	desc = "由火山熔岩冷却形成的发光黑曜石碎片。"
	icon = 'icons/obj/metnal_objects.dmi'
	icon_state = "obsidian_3"
	density = FALSE
