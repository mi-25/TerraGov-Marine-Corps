/obj/item/weapon/banhammer
	desc = "一把封禁锤"
	name = "封禁锤"
	icon = 'icons/obj/items/items.dmi'
	icon_state = "toyhammer"
	equip_slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	throw_speed = 7
	throw_range = 15
	attack_verb = list("bans")

/obj/item/weapon/banhammer/attack(mob/M as mob, mob/user as mob)
	to_chat(M, "<font color='red'><b>你已被[user]无理由封禁<b></font>")
	to_chat(user, "<font color='red'> 你已 <b>封禁</b> [M]</font>")

/obj/item/weapon/banhammer/suicide_act(mob/user)
	user.visible_message(span_danger("[user]正在用[name]击打[p_them()]自己！看起来[user.p_theyre()]想把自己从生命中除名。"))
	return (BRUTELOSS|FIRELOSS|TOXLOSS|OXYLOSS)

/obj/item/weapon/nullrod
	name = "圣物"
	desc = "一根纯黑曜石制成的长杆，它的存在本身就能干扰并削弱超自然现象的力量。"
	icon_state = "nullrod"
	worn_icon_state = "nullrod"
	equip_slot_flags = ITEM_SLOT_BELT
	force = 15
	throw_speed = 1
	throw_range = 4
	throwforce = 10
	w_class = WEIGHT_CLASS_SMALL

/obj/item/weapon/nullrod/suicide_act(mob/user)
	user.visible_message(span_danger("[user]正在用[name]刺穿[p_them()]自己！看起来[user.p_theyre()]试图自杀。"))
	return (BRUTELOSS|FIRELOSS)

/obj/item/weapon/harpoon
	name = "鱼叉"
	sharp = IS_SHARP_ITEM_SIMPLE
	edge = 0
	desc = "目标出现！"
	icon_state = "harpoon"
	worn_icon_state = "harpoon"
	force = 20
	throwforce = 15
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("jabs","stabs","rips")

/obj/item/weapon/baseballbat
	name = "木质棒球棒"
	desc = "一根大型木质棒球棒。常用于殖民地娱乐活动，但也用作自卫手段。通常由暴徒和恶棍携带。"
	icon_state = "woodbat"
	worn_icon_state = "woodbat"
	sharp = 0
	edge = 0
	w_class = WEIGHT_CLASS_NORMAL
	force = 20
	throw_speed = 3
	throw_range = 7
	throwforce = 7
	attack_verb = list("smashes", "beats", "slams", "strikes", "smashes", "batters", "cracks")
	hitsound = 'sound/weapons/genhit3.ogg'

/obj/item/weapon/baseballbat/equipped(mob/user, slot)
	. = ..()
	user.AddComponent(/datum/component/throw_parry, null, TRUE, src)

/obj/item/weapon/baseballbat/dropped(mob/user)
	. = ..()
	user.remove_component(/datum/component/throw_parry)

/obj/item/weapon/baseballbat/on_parry_throw(atom/reflector, atom/movable/thrown)
	reflector.visible_message(span_warning("[reflector]用[src]砸碎了[thrown]！"))
	playsound(src, 'sound/weapons/base_ball_bat_hit.ogg', 60, 1, 10)

/obj/item/weapon/baseballbat/metal
	name = "金属棒球棍"
	desc = "一根大型金属棒球棍。相比其木质表亲，金属球棍能提供更强的打击力。通常被暴徒和恶棍携带。"
	icon_state = "metalbat"
	worn_icon_state = "metalbat"
	force = 25
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/butterfly
	name = "蝴蝶刀"
	desc = "一把基础金属刀刃，隐藏于轻质塑钢握柄中。折叠后小巧便携，足以放入口袋。"
	icon = 'icons/obj/items/weapons/knives.dmi'
	icon_state = "butterflyknife"
	worn_icon_state = null
	hitsound = null
	w_class = WEIGHT_CLASS_TINY
	force = 8
	sharp = 0
	edge = 0
	throw_speed = 3
	throw_range = 4
	throwforce = 7
	attack_verb = list("pats", "taps")
	attack_speed = 4

/obj/item/weapon/butterfly/attack_self(mob/user)
	active = !active
	if(active)
		to_chat(user, span_notice("你甩出了[src]。"))
		playsound(user, 'sound/weapons/flipblade.ogg', 15, 1)
		force = 15
		throwforce = 12
		edge = TRUE
		sharp = IS_SHARP_ITEM_ACCURATE
		hitsound = 'sound/weapons/bladeslice.ogg'
		icon_state += "_open"
		w_class = WEIGHT_CLASS_NORMAL
		attack_verb = list("attacks", "slashes", "stabs", "slices", "tears", "rips", "dices", "cuts")
		return
	to_chat(user, span_notice("[src]现在可以隐藏了。"))
	force = initial(force)
	edge = FALSE
	sharp = IS_NOT_SHARP_ITEM
	hitsound = initial(hitsound)
	icon_state = initial(icon_state)
	w_class = initial(w_class)
	attack_verb = initial(attack_verb)

/obj/item/weapon/butterfly/switchblade
	name = "弹簧刀"
	desc = "一把带有金色雕花的经典弹簧刀。光是握着它，就让你感觉自己像个黑帮分子。"
	icon_state = "switchblade"

/obj/item/weapon/wirerod
	name = "线缆杆"
	desc = "一根杆子，顶端缠绕着一些电线。很容易在顶部安装东西。"
	icon_state = "wiredrod"
	worn_icon_state = "rods"
	icon = 'icons/obj/items/weapons/batons.dmi'
	atom_flags = CONDUCT
	force = 8
	throwforce = 10
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("hits", "bludgeons", "whacks", "bonks")

/obj/item/weapon/wirerod/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/shard))
		var/obj/item/weapon/twohanded/spear/S = new

		user.put_in_hands(S)
		to_chat(user, span_notice("你用电缆将玻璃碎片固定在杆子顶端。"))
		qdel(I)
		qdel(src)
		update_icon()
