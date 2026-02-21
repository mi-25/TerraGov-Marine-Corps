/obj/structure/displaycase
	name = "展示柜"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "glassbox1"
	desc = "一个展示珍贵物品的陈列柜。它似乎在引诱你去踢它。"
	density = TRUE
	anchored = TRUE
	resistance_flags = UNACIDABLE
	max_integrity = 30
	var/occupied = 1
	var/destroyed = 0

/obj/structure/displaycase/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			deconstruct(FALSE)
		if(EXPLODE_HEAVY)
			take_damage(15, BRUTE, BOMB)
		if(EXPLODE_LIGHT)
			take_damage(5, BRUTE, BOMB)
		if(EXPLODE_WEAK)
			take_damage(5, BRUTE, BOMB)


/obj/structure/displaycase/update_icon_state()
	. = ..()
	if(destroyed)
		icon_state = "glassboxb[occupied]"
	else
		icon_state = "glassbox[occupied]"


/obj/structure/displaycase/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	if(destroyed && occupied)
		to_chat(user, span_notice("你关闭了箱子内置的悬浮力场。"))
		occupied = FALSE
		update_icon()
		return

	visible_message(span_warning("[user]踢了展示柜。"), span_notice("You kick the display case."))
	take_damage(2, BRUTE, MELEE)

//Quick destroyed case.
/obj/structure/displaycase/destroyed
	icon_state = "glassboxb0"
	max_integrity = 0
	occupied = FALSE
	destroyed = TRUE
	coverage = 0
