/obj/item/attachable/suppressor
	name = "消音器"
	desc = "一个带有排气口的小管，用于排出噪音和气体。\n不能完全消音武器，但能使其安静得多，并略微提高精度和稳定性，代价是降低弹道速度。"
	icon_state = "suppressor"
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	slot = ATTACHMENT_SLOT_MUZZLE
	silence_mod = TRUE
	pixel_shift_y = 16
	attach_shell_speed_mod = -1
	accuracy_mod = 0.1
	recoil_mod = -2
	scatter_mod = -2
	recoil_unwielded_mod = -3
	scatter_unwielded_mod = -2
	damage_falloff_mod = 0.1

/obj/item/attachable/suppressor/unremovable
	attach_features_flags = NONE

/obj/item/attachable/suppressor/unremovable/invisible
	icon_state = ""

/obj/item/attachable/suppressor/unremovable/invisible/Initialize(mapload, ...)
	. = ..()

/obj/item/attachable/bayonet
	name = "\improper M-22刺刀"
	desc = "一把锋利的刀，是地球政府殖民地海军陆战队的标准配发战斗刀，可以随意安装到多种武器上，或作为标准刀具使用。"
	icon_state = "bayonetknife"
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/weapons/melee_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/weapons/melee_right.dmi',
	)
	force = 25
	throwforce = 20
	throw_speed = 3
	throw_range = 6
	attack_speed = 8
	sharp = IS_SHARP_ITEM_ACCURATE
	hitsound = 'sound/weapons/slash.ogg'
	attack_verb = list("slashes", "stabs", "slices", "tears", "rips", "dices", "cuts")

	attach_delay = 1 SECONDS
	detach_delay = 1 SECONDS
	slot = ATTACHMENT_SLOT_MUZZLE
	pixel_shift_x = 14
	pixel_shift_y = 18
	melee_mod = 25
	accuracy_mod = -0.05
	accuracy_unwielded_mod = -0.1
	size_mod = 1
	variants_by_parent_type = list(/obj/item/weapon/gun/shotgun/pump/t35 = "bayonetknife_t35")

/obj/item/attachable/bayonet/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/scalping)

/obj/item/attachable/bayonet/som
	name = "\improper S20火星之子刺刀"
	desc = "一把大型刀具，是火星之子的标准制式战斗刀。可随意安装到多种武器上，也可作为普通刀具使用。"
	icon_state = "bayonetknife_som"
	worn_icon_state = "bayonetknife"
	force = 30

/obj/item/attachable/bayonet/converted
	name = "刺刀"
	desc = "一种锋利的刀刃，可安装在武器上。除伤害意图外，可用于手动刺击任何目标。安装后会略微降低枪支的精确度。"
	icon_state = "bayonet"
	force = 20
	throwforce = 10
	pixel_shift_x = 14
	pixel_shift_y = 18

/obj/item/attachable/bayonet/converted/screwdriver_act(mob/living/user, obj/item/I)
	to_chat(user, span_notice("你将刺刀改装回了战斗刀。"))
	if(loc == user)
		user.dropItemToGround(src)
	var/obj/item/weapon/combat_knife/knife = new(loc)
	user.put_in_hands(knife) //This proc tries right, left, then drops it all-in-one.
	if(knife.loc != user) //It ended up on the floor, put it whereever the old flashlight is.
		knife.forceMove(loc)
	qdel(src)

/obj/item/attachable/extended_barrel
	name = "加长枪管"
	desc = "加长枪管通过增强稳定性和冲击波暴露，可减少散射，提高精度和枪口初速。"
	slot = ATTACHMENT_SLOT_MUZZLE
	icon_state = "ebarrel"
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	attach_shell_speed_mod = 1
	accuracy_mod = 0.15
	accuracy_unwielded_mod = 0.1
	scatter_mod = -1
	size_mod = 1
	variants_by_parent_type = list(
		/obj/item/weapon/gun/rifle/som = "ebarrel_big",
		/obj/item/weapon/gun/rifle/som_big = "ebarrel_big",
		/obj/item/weapon/gun/smg/som = "ebarrel_big",
		/obj/item/weapon/gun/shotgun/pump/t35 = "ebarrel_big",
	)

/obj/item/attachable/heavy_barrel
	name = "枪管充能器"
	desc = "一种安装在枪口的加长枪管，带有小型聚能装药，能大幅提升子弹速度。\n显著提高弹道速度并减少伤害衰减。"
	slot = ATTACHMENT_SLOT_MUZZLE
	icon_state = "hbarrel"
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	attach_shell_speed_mod = 2
	accuracy_mod = -0.05
	damage_falloff_mod = -0.2

/obj/item/attachable/compensator
	name = "后坐力补偿器"
	desc = "一种枪口配件，通过将排出的气体向上引导来减少后坐力和散射。\n无论武器是否被手持，都能显著降低后坐力和散射。"
	slot = ATTACHMENT_SLOT_MUZZLE
	icon_state = "comp"
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	pixel_shift_x = 17
	scatter_mod = -3
	recoil_mod = -2
	scatter_unwielded_mod = -3
	recoil_unwielded_mod = -2
	variants_by_parent_type = list(
		/obj/item/weapon/gun/rifle/som = "comp_big",
		/obj/item/weapon/gun/rifle/som_big = "comp_big",
		/obj/item/weapon/gun/smg/som = "comp_big",
		/obj/item/weapon/gun/shotgun/som = "comp_big",
		/obj/item/weapon/gun/shotgun/pump/t35 = "comp_big",
		/obj/item/weapon/gun/revolver/standard_magnum = "t76comp"
	)

/obj/item/attachable/sniperbarrel
	name = "狙击枪管"
	icon_state = "sniperbarrel" // missing icon?
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	desc = "重型枪管。无法拆卸。"
	slot = ATTACHMENT_SLOT_MUZZLE
	attach_features_flags = NONE
	accuracy_mod = 0.15
	scatter_mod = -3

/obj/item/attachable/smartbarrel
	name = "智能机枪枪管"
	icon_state = "smartbarrel"
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	desc = "重型旋转枪管。无法移除。"
	slot = ATTACHMENT_SLOT_MUZZLE
	attach_features_flags = NONE

/obj/item/attachable/focuslens
	name = "M43聚焦透镜"
	desc = "将光束导向一个专用透镜，使激光枪能在过载时发射致命的聚焦光束，使其更像一把高伤害的狙击枪。"
	slot = ATTACHMENT_SLOT_MUZZLE
	icon_state = "focus"
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	pixel_shift_x = 17
	pixel_shift_y = 13
	ammo_mod = /datum/ammo/energy/lasgun/M43/overcharge
	damage_mod = -0.15

/obj/item/attachable/widelens
	name = "M43广角镜"
	desc = "将透镜分裂为三片，使激光枪在过载时能发射致命的近距离散射，效果类似传统的霰弹枪弹丸。"
	slot = ATTACHMENT_SLOT_MUZZLE
	icon_state = "wide"
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	pixel_shift_x = 18
	pixel_shift_y = 15
	ammo_mod = /datum/ammo/energy/lasgun/M43/blast
	damage_mod = -0.15

/obj/item/attachable/heatlens
	name = "M43热成像镜"
	desc = "调整激光的强度和频率。这会以牺牲直接伤害和穿透力为代价，使你的目标着火。"
	slot = ATTACHMENT_SLOT_MUZZLE
	icon_state = "heat"
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	pixel_shift_x = 18
	pixel_shift_y = 16
	ammo_mod = /datum/ammo/energy/lasgun/M43/heat
	damage_mod = -0.15

/obj/item/attachable/efflens
	name = "M43高效镜片"
	desc = "使镜片更小更轻，让激光枪的能量利用效率大幅提升。\n降低激光枪的能量输出。"
	slot = ATTACHMENT_SLOT_MUZZLE
	icon_state = "efficient"
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	pixel_shift_x = 18
	pixel_shift_y = 14
	charge_mod = -5

/obj/item/attachable/sx16barrel
	name = "SX-16枪管"
	desc = "SX-16的标准枪管。无法拆卸。"
	slot = ATTACHMENT_SLOT_MUZZLE
	icon_state = "sx16barrel" // missing icon?
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	attach_features_flags = NONE

/obj/item/attachable/pulselens
	name = "M43脉冲透镜"
	desc = "搅动透镜，使激光枪能够以高速率发射。\n允许武器自动射击。"
	slot = ATTACHMENT_SLOT_MUZZLE
	icon_state = "pulse"
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	pixel_shift_x = 18
	pixel_shift_y = 15
	damage_mod = -0.15
	gun_firemode_list_mod = list(GUN_FIREMODE_AUTOMATIC)

/obj/item/attachable/sgbarrel
	name = "SG-29 枪管"
	icon_state = "sg29barrel"
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	desc = "重型枪管。无法拆卸。"
	slot = ATTACHMENT_SLOT_MUZZLE
	attach_features_flags = NONE

/obj/item/attachable/lace
	name = "手枪蕾丝"
	desc = "一条简单的腕带，可缠绕在你的手腕上。"
	icon_state = "lace"
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	slot = ATTACHMENT_SLOT_MUZZLE //so you cannot have this and RC at once aka balance
	attach_features_flags = ATTACH_REMOVABLE|ATTACH_ACTIVATION
	attachment_action_type = /datum/action/item_action/toggle

/obj/item/attachable/lace/activate(mob/living/user, turn_off)
	if(lace_deployed)
		REMOVE_TRAIT(master_gun, TRAIT_NODROP, PISTOL_LACE_TRAIT)
		to_chat(user, span_notice("你感觉[src]从手腕上松脱了！"))
		playsound(user, 'sound/weapons/fistunclamp.ogg', 25, 1, 7)
		icon_state = "lace"
	else if(turn_off)
		return
	else
		if(user.do_actions)
			return
		to_chat(user, span_notice("你部署了[src]。"))
		ADD_TRAIT(master_gun, TRAIT_NODROP, PISTOL_LACE_TRAIT)
		to_chat(user, span_warning("你感觉到[src]扣在了你的手腕上！"))
		playsound(user, 'sound/weapons/fistclamp.ogg', 25, 1, 7)
		icon_state = "lace-on"

	lace_deployed = !lace_deployed

	update_icon()
	return TRUE

/obj/item/attachable/at45barrel
	name = "\improper CC/AT45 枪管"
	icon_state = "at45barrel"
	icon = 'icons/obj/items/guns/attachments/muzzle.dmi'
	desc = "重型枪管。无法拆卸。"
	slot = ATTACHMENT_SLOT_MUZZLE
	attach_features_flags = NONE
