// Surgery Tools
/obj/item/tool/surgery
	icon = 'icons/obj/items/surgery_tools.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/surgery_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/surgery_right.dmi',
	)
	attack_speed = 11 //Used to be 4 which made them attack insanely fast.

/obj/item/tool/surgery/retractor
	name = "牵开器"
	desc = "收回物品。"
	icon_state = "retractor"
	atom_flags = CONDUCT
	w_class = WEIGHT_CLASS_SMALL

/obj/item/tool/surgery/hemostat
	name = "止血钳"
	desc = "你觉得你以前见过这个。"
	icon_state = "hemostat"
	atom_flags = CONDUCT
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("attacks", "pinches")

/obj/item/tool/surgery/cautery
	name = "烧灼器"
	desc = "这能止血。"
	icon_state = "cautery"
	atom_flags = CONDUCT
	w_class = WEIGHT_CLASS_TINY
	attack_verb = list("burns")

/obj/item/tool/surgery/surgicaldrill
	name = "手术钻"
	desc = "你可以用这个物品进行钻探。明白了吗？"
	icon_state = "drill"
	hitsound = 'sound/weapons/circsawhit.ogg'
	atom_flags = CONDUCT
	force = 15
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("drills")

/obj/item/tool/surgery/surgicaldrill/suicide_act(mob/user)
	user.visible_message(span_danger("[user] presses the [name] to [user.p_their()] [pick("temple","chest")] and activates it! It looks like [user.p_theyre()] trying to commit suicide!"))
	return (BRUTELOSS)

/obj/item/tool/surgery/scalpel
	name = "手术刀"
	desc = "切，切，再切。"
	icon_state = "scalpel"
	atom_flags = CONDUCT
	force = 20
	sharp = IS_SHARP_ITEM_ACCURATE
	edge = 1
	w_class = WEIGHT_CLASS_TINY
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	attack_verb = list("attacks", "slashes", "stabs", "slices", "tears", "rips", "dices", "cuts")

/obj/item/tool/surgery/scalpel/suicide_act(mob/user)
	user.visible_message(pick(span_danger("[user] is slitting [user.p_their()] wrists with the [name]! It looks like [user.p_theyre()] trying to commit suicide."), \
							span_danger("[user] is slitting [user.p_their()] throat with the [name]! It looks like [user.p_theyre()] trying to commit suicide."), \
							span_danger("[user] is slitting [user.p_their()] stomach open with the [name]! It looks like [user.p_theyre()] trying to commit seppuku.")))
	return (BRUTELOSS)

/*
* Researchable Scalpels
*/
/obj/item/tool/surgery/scalpel/laser3
	name = "激光手术刀"
	desc = "一把配备了定向激光的手术刀，用于更精确的切割，同时防止血液进入手术区域。这看起来是精密能量切割器具的巅峰之作！"
	icon_state = "scalpel_laser3_on"
	damtype = BURN
	force = 15

/obj/item/tool/surgery/scalpel/manager
	name = "切口管理系统"
	desc = "外科医生身体的真正延伸，这一奇迹能瞬间并彻底准备好切口，以便立即开始治疗步骤。"
	icon_state = "scalpel_manager_on"
	force = 7.5

/*
* Circular Saw
*/
/obj/item/tool/surgery/circular_saw
	name = "圆锯"
	desc = "重型切割专用。"
	icon_state = "saw"
	hitsound = 'sound/weapons/circsawhit.ogg'
	atom_flags = CONDUCT
	force = 30
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 9
	throw_speed = 3
	throw_range = 5
	attack_verb = list("attacks", "slashes", "saws", "cuts")
	sharp = IS_SHARP_ITEM_BIG
	edge = 1

//misc, formerly from code/defines/weapons.dm
/obj/item/tool/surgery/bonegel
	name = "骨胶"
	icon_state = "bone-gel"
	force = 0
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 1

/obj/item/tool/surgery/FixOVein
	name = "静脉修复器"
	icon_state = "fixovein"
	force = 0
	throwforce = 1
	w_class = WEIGHT_CLASS_SMALL
	var/usage_amount = 10

/obj/item/tool/surgery/bonesetter
	name = "骨骼固定器"
	icon_state = "bonesetter"
	force = 8
	throwforce = 9
	throw_speed = 3
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("attacks", "hits", "bludgeons")

/obj/item/tool/surgery/suture
	name = "手术缝合线"
	icon_state = "suture"
	force = 3
	throwforce = 0
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("needles", "sews", "stabs")

/obj/item/tool/surgery/surgical_membrane
	name = "手术膜"
	icon_state = "surgical_membrane"
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_SMALL
