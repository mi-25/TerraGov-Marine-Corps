/obj/item/facepaint
	gender = PLURAL
	name = "定制套件"
	desc = "一套用于定制各类护甲和服装的套件。附赠面部迷彩！"
	icon = 'icons/obj/items/cosmetics.dmi'
	icon_state = "camo"
	var/paint_color = "green"
	w_class = WEIGHT_CLASS_TINY
	var/uses = 100

/obj/item/facepaint/green
	name = "绿色定制套件"
	paint_color = "green"
	icon_state = "green_camo"


/obj/item/facepaint/brown
	name = "棕色定制套件"
	paint_color = "brown"
	icon_state = "brown_camo"

/obj/item/facepaint/black
	name = "黑色定制套件"
	desc = "一套用于定制各类护甲和服装的套件。附赠眼部伪装油彩！"
	paint_color = "black"
	icon_state = "black_camo"

/obj/item/facepaint/sniper
	name = "全身定制套件"
	paint_color = "full"
	icon_state = "full_camo"


/obj/item/facepaint/attack(mob/M, mob/user)
	. = ..()
	if(!ishuman(M))
		to_chat(user, span_warning("这没有人类的面孔..."))
		return

	var/mob/living/carbon/human/attacked_human = M
	if(attacked_human.makeup_style)	//if they already have lipstick on
		to_chat(user, span_warning("你得先用纸把旧漆擦掉！"))
		return

	if(attacked_human != user && attacked_human.client)
		user.visible_message(span_notice("[user]正试图将[src]敷在[attacked_human]的脸上..."), span_notice("You attempt to apply [src] on [attacked_human]..."))
		if(tgui_alert(attacked_human, "Apply makeup", "Will you allow [user] to paint your face?", list("Yes","No")) != "Yes")
			return
		if(!user || loc != user || !user.Adjacent(attacked_human))
			return

	paint_face(attacked_human, user)

///Handles applying the makeup
/obj/item/facepaint/proc/paint_face(mob/living/carbon/human/H, mob/user)
	if(!H || !user)
		return //In case they're passed as null.
	user.visible_message(span_notice("[user]小心翼翼地将[src]敷在[H]的脸上。"), \
						span_notice("You apply [src]."))
	H.makeup_style = paint_color
	H.alpha = max(0, initial(H.alpha) - 1) // decreases your alpha by 1
	H.update_body()
	uses--
	if(!uses)
		user.temporarilyRemoveItemFromInventory(src)
		user.update_inv_l_hand(0)
		user.update_inv_r_hand()
		qdel(src)
