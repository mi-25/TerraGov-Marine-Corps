//Basic two handed weapons without complicated extra behavior

/obj/item/weapon/twohanded/fireaxe
	name = "消防斧"
	desc = "说真的，这简直是疯子的武器。谁会想到用斧头来对抗火焰？"
	icon_state = "fireaxe"
	worn_icon_state = "fireaxe"
	force = 35
	sharp = IS_SHARP_ITEM_BIG
	edge = TRUE
	equip_slot_flags = ITEM_SLOT_BELT|ITEM_SLOT_BACK
	atom_flags = CONDUCT
	item_flags = TWOHANDED
	force_activated = 80
	attack_verb = list("attacks", "chops", "cleaves", "tears", "cuts")

/obj/item/weapon/twohanded/fireaxe/wield(mob/user)
	. = ..()
	if(!.)
		return
	pry_capable = IS_PRY_CAPABLE_SIMPLE

/obj/item/weapon/twohanded/fireaxe/unwield(mob/user)
	. = ..()
	if(!.)
		return
	pry_capable = 0

/obj/item/weapon/twohanded/glaive
	name = "战争长戟"
	icon_state = "glaive"
	worn_icon_state = "glaive"
	desc = "一把巨大而有力的刀刃，安装在金属杆上。武器上刻有神秘的文字。"
	force = 28
	equip_slot_flags = ITEM_SLOT_BACK
	force_activated = 90
	penetration = 20
	throwforce = 65
	throw_speed = 3
	edge = 1
	sharp = IS_SHARP_ITEM_BIG
	atom_flags = CONDUCT
	attack_verb = list("slices", "slashes", "jabs", "tears", "gores")
	resistance_flags = UNACIDABLE
	attack_speed = 16

/obj/item/weapon/twohanded/glaive/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	playsound(loc, 'sound/weapons/bladeslice.ogg', 25, 1)
	return ..()

/obj/item/weapon/twohanded/glaive/damaged
	name = "战争长戟"
	desc = "一把巨大的强力刀刃，安装在金属杆上。武器上刻有神秘的文字。这把武器年代久远，并且遭受了严重的酸液损伤，几乎无法使用。"
	force = 18
	force_activated = 28

/obj/item/weapon/twohanded/sledgehammer
	name = "大锤"
	desc = "一把沉重的锤子，很适合砸石头，但考虑到当前情况，它或许也能当件趁手的武器。"
	icon_state = "sledgehammer"
	worn_icon_state = "sledgehammer"
	force = 35
	equip_slot_flags = ITEM_SLOT_BACK
	atom_flags = CONDUCT
	item_flags = TWOHANDED
	force_activated = 95
	penetration = 10
	attack_speed = 20
	attack_verb = list("attacks", "wallops", "smashes", "shatters", "bashes")

/obj/item/weapon/twohanded/sledgehammer/wield(mob/user)
	. = ..()
	if(!.)
		return
	toggle_item_bump_attack(user, TRUE)

/obj/item/weapon/twohanded/sledgehammer/unwield(mob/user)
	. = ..()
	if(!.)
		return
	toggle_item_bump_attack(user, FALSE)
