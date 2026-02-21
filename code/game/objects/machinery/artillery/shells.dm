// Shells themselves //

/obj/item/mortal_shell
	name = "\improper 80毫米迫击炮弹"
	desc = "一枚未标记的80毫米迫击炮弹，可能是个弹壳。"
	icon = 'icons/obj/items/ammo/artillery.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/weapons/ammo_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/weapons/ammo_right.dmi',
	)
	icon_state = "mortar"
	w_class = WEIGHT_CLASS_SMALL
	atom_flags = CONDUCT
	///Ammo datum typepath that the shell uses
	var/ammo_type

/obj/item/mortal_shell/he
	name = "\improper 80毫米高爆迫击炮弹"
	desc = "一枚80毫米迫击炮弹，装有高爆炸药。"
	icon_state = "mortar_he"
	ammo_type = /datum/ammo/mortar

/obj/item/mortal_shell/incendiary
	name = "\improper 80毫米燃烧迫击炮弹"
	desc = "一枚80毫米迫击炮弹，装有凝固汽油装药。"
	icon_state = "mortar_inc"
	ammo_type = /datum/ammo/mortar/incend

/obj/item/mortal_shell/smoke
	name = "\improper 80毫米烟雾迫击炮弹"
	desc = "一枚80毫米迫击炮弹，装有烟雾散布剂。可以相对安全地向陆战队员发射。比典型的80毫米炮弹要纤细得多。"
	icon_state = "mortar_smk"
	ammo_type = /datum/ammo/mortar/smoke

/obj/item/mortal_shell/plasmaloss
	name = "\improper 80毫米缠结迫击炮弹"
	desc = "一枚80毫米迫击炮弹，装有消耗等离子体的缠足气体。可以相对安全地向陆战队员发射。"
	icon_state = "mortar_fsh"
	ammo_type = /datum/ammo/mortar/smoke/plasmaloss

/obj/item/mortal_shell/flare
	name = "\improper 80毫米照明弹迫击炮弹"
	desc = "一枚80毫米迫击炮弹，装有照明弹，比典型的80毫米炮弹要纤细得多。可从大型火炮中发射。"
	icon_state = "mortar_flr"
	ammo_type = /datum/ammo/mortar/flare

/obj/item/mortal_shell/howitzer
	name = "\improper 150毫米炮弹"
	desc = "一枚未标记的150毫米炮弹，可能是弹壳。"
	icon_state = "howitzer"
	w_class = WEIGHT_CLASS_BULKY

/obj/item/mortal_shell/howitzer/he
	name = "\improper 150毫米高爆炮弹"
	desc = "一枚150毫米高爆装药炮弹，被这玩意儿击中，绝对会度过一个非常、非常糟糕的一天。"
	ammo_type = /datum/ammo/mortar/howi

/obj/item/mortal_shell/howitzer/plasmaloss
	name = "\improper 150毫米'缠足'炮弹"
	desc = "一枚150毫米炮弹，装载有毒麻醉气体，被其命中的目标将逐渐丧失行动能力。伴随一次小型中度爆炸。"
	icon_state = "howitzer_plasmaloss"
	ammo_type = /datum/ammo/mortar/smoke/howi/plasmaloss

/obj/item/mortal_shell/howitzer/incendiary
	name = "\improper 150毫米燃烧炮弹"
	desc = "一枚150毫米炮弹，装填了炸药，用于穿透轻型结构，然后烧毁另一侧的任何目标。它会毁掉他们的一天和皮肤。"
	icon_state = "howitzer_incend"
	ammo_type = /datum/ammo/mortar/howi/incend

/obj/item/mortal_shell/howitzer/white_phos
	name = "\improper 150毫米白磷'标记'炮弹"
	desc = "一枚150毫米炮弹，装载着'标记'气体，能将击中的一切点燃。被它命中的目标，其皮肤与未来都将毁于一旦，足以引发战争罪法庭的传唤。"
	icon_state = "howitzer_wp"
	ammo_type = /datum/ammo/mortar/smoke/howi/wp

/obj/item/mortal_shell/rocket
	ammo_type = /datum/ammo/mortar/rocket

/obj/item/mortal_shell/rocket/incend
	ammo_type = /datum/ammo/mortar/rocket/incend

/obj/item/mortal_shell/rocket/minelaying
	ammo_type = /datum/ammo/mortar/rocket/minelayer

/obj/item/mortal_shell/rocket/mlrs
	name = "\improper 60毫米火箭弹"
	desc = "一枚装载炸药的60毫米火箭弹，旨在用于高散布的饱和火力覆盖。"
	icon_state = "mlrs"
	ammo_type = /datum/ammo/mortar/rocket/mlrs

/obj/item/mortal_shell/rocket/mlrs/gas
	name = "\improper 60毫米'X-50'火箭弹"
	desc = "一枚装载致命X-50气体的60毫米火箭，会耗尽任何不幸身处其中之物的能量与生命。"
	icon_state = "mlrs_gas"
	ammo_type = /datum/ammo/mortar/rocket/smoke/mlrs

/obj/item/mortal_shell/rocket/mlrs/cloak
	name = "\improper 60毫米'S-2'型隐形火箭"
	desc = "一枚装载了隐形烟雾的60毫米火箭弹，采用先进的化学技术，能够隐藏烟雾内的所有友方单位。"
	icon_state = "mlrs_cloak"
	ammo_type = /datum/ammo/mortar/rocket/smoke/mlrs/cloak

/obj/item/mortal_shell/rocket/mlrs/incendiary
	name = "\improper 60毫米燃烧火箭"
	desc = "一枚60毫米火箭弹，装载燃烧弹头，附带少量爆炸效果。"
	icon_state = "mlrs_incendiary"
	ammo_type = /datum/ammo/mortar/rocket/mlrs/incendiary
