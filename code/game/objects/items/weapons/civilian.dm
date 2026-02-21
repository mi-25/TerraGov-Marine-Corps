/obj/item/weapon/ice_axe
	name = "冰镐"
	desc = "一种多用途的登山和攀冰工具，被登山者和心怀不满的殖民者在冰封环境中使用。"
	icon_state = "ice_pick"
	worn_icon_state = "ice_pick"
	icon = 'icons/obj/items/weapons/civilian.dmi'
	force = 50
	penetration = 15
	attack_speed = 13
	w_class = WEIGHT_CLASS_NORMAL
	equip_slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_BELT
	edge = TRUE
	sharp = IS_SHARP_ITEM_BIG
	atom_flags = CONDUCT
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacks", "stabs", "jabs", "tears", "gores", "cuts")

/obj/item/weapon/axe
	name = "斧头"
	desc = "某种大型、充满威胁的斧头。看起来更像是中世纪而非现代工具，它绝对能造成一些伤害。"
	icon_state = "hatchet_broad"
	worn_icon_state = "hatchet_broad"
	icon = 'icons/obj/items/weapons/civilian.dmi'
	force = 65
	throwforce = 50
	attack_speed = 9
	w_class = WEIGHT_CLASS_BULKY
	equip_slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_BELT
	edge = TRUE
	sharp = IS_SHARP_ITEM_BIG
	atom_flags = CONDUCT
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("chops", "attacks", "slashes", "stabs", "jabs", "slices", "tears", "gores", "rips", "dices", "cuts", "hacks")

/obj/item/weapon/cleaver
	name = "砍肉刀"
	desc = "一把用于劈开血肉与骨骼的大砍刀。"
	icon_state = "cleaver"
	worn_icon_state = "hatchet_broad"
	icon = 'icons/obj/items/weapons/civilian.dmi'
	force = 55
	throwforce = 50
	attack_speed = 9
	equip_slot_flags = ITEM_SLOT_BELT
	edge = TRUE
	sharp = IS_SHARP_ITEM_BIG
	atom_flags = CONDUCT
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("cleaves", "chops", "attacks", "slashes", "slices", "tears", "gores", "rips", "dices", "cuts", "hacks")

/obj/item/weapon/pipe
	name = "金属管"
	desc = "一根沉重的金属管。看起来很适合用来敲打东西。"
	icon_state = "lead_pipe"
	worn_icon_state = "lead_pipe"
	icon = 'icons/obj/items/weapons/civilian.dmi'
	force = 50
	attack_speed = 10
	w_class = WEIGHT_CLASS_NORMAL
	equip_slot_flags = ITEM_SLOT_BELT
	atom_flags = CONDUCT
	attack_verb = list("smashes", "attacks", "bashes", "thrashes", "smacks", "beats", "brutalises", "bludgeon", "pummels")

/obj/item/weapon/pipe/alt
	icon_state = "lead_pipe_alt"
	worn_icon_state = "lead_pipe_alt"

/obj/item/weapon/pipe/tire_iron
	name = "撬胎棒"
	desc = "一根撬胎棒。你可以用它来换轮胎，如果你不是在用它砸脑袋的话。"
	icon_state = "tire_iron"
	worn_icon_state = "tire_iron"

/obj/item/weapon/brass_knuckle
	name = "指虎"
	desc = "指虎。让你的拳头更有滋味。"
	icon_state = "knuckles"
	worn_icon_state = "knuckles"
	icon = 'icons/obj/items/weapons/civilian.dmi'
	force = 18
	attack_speed = CLICK_CD_UNARMED //same as punching
	w_class = WEIGHT_CLASS_SMALL
	equip_slot_flags = ITEM_SLOT_BELT
	atom_flags = CONDUCT
	hitsound = SFX_PUNCH
	attack_verb = list("punches", "smashes", "attacks", "bashes", "thrashes", "smacks", "beats", "brutalises", "bludgeon", "pummels")

/obj/item/weapon/brass_knuckle/weighted
	name = "加重指虎"
	desc = "指虎。这副感觉格外沉重。"
	icon_state = "knuckles_weighted"
	worn_icon_state = "knuckles_weighted"
	force = 25
	attack_speed = CLICK_CD_MELEE

/obj/item/weapon/brass_knuckle/spiked
	name = "尖刺黄铜指虎"
	desc = "一副指虎。这副指虎上装有锋利的金属尖刺。"
	icon_state = "knuckles_spike"
	worn_icon_state = "knuckles_spike"
	force = 25
	sharp = IS_SHARP_ITEM_SIMPLE
