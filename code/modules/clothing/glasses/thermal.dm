
// thermal goggles

/obj/item/clothing/glasses/thermal
	name = "光学热成像扫描仪"
	desc = "热成像眼镜。"
	icon_state = "thermal"
	worn_icon_state = "glasses"
	toggleable = 1
	vision_flags = SEE_MOBS // todo replace with tgs TRAIT_THERMAL_VISION
	lighting_cutoff = LIGHTING_CUTOFF_MEDIUM
	eye_protection = -1
	deactive_state = "goggles_off"

/obj/item/clothing/glasses/thermal/emp_act(severity)
	. = ..()
	if(ishuman(loc))
		var/mob/living/carbon/human/M = src.loc
		to_chat(M, span_warning("光学热成像扫描仪过载，闪瞎了你的眼睛！"))
		if(M.glasses == src)
			M.blind_eyes(3)
			M.blur_eyes(5)
			M.disabilities |= NEARSIGHTED
			spawn(100)
				M.disabilities &= ~NEARSIGHTED

/obj/item/clothing/glasses/thermal/syndi	//These are now a traitor item, concealed as mesons.	-Pete
	name = "光学介子扫描仪"
	desc = "用于透过任何物体观察墙壁、地板等结构。"
	icon_state = "meson"
	actions_types = list(/datum/action/item_action/toggle)


/obj/item/clothing/glasses/thermal/monocle
	name = "热核"
	desc = "单片热成像镜。"
	icon_state = "thermoncle"
	atom_flags = null //doesn't protect eyes because it's a monocle, duh
	toggleable = 0
	armor_protection_flags = NONE

/obj/item/clothing/glasses/thermal/eyepatch
	name = "光学热成像眼罩"
	desc = "内置热成像功能的眼罩"
	icon_state = "eyepatch"
	worn_icon_state = "eyepatch"
	toggleable = 0
	armor_protection_flags = NONE

/obj/item/clothing/glasses/thermal/jensen
	name = "光学热成像植入体"
	desc = "一套可植入式镜片，旨在增强你的视觉能力"
	icon_state = "thermalimplants"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/items/containers_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/containers_right.dmi',
	)
	worn_icon_state = "syringe_kit"
	toggleable = 0

/obj/item/clothing/glasses/thermal/m64_thermal_goggles
	name = "\improper M64 追踪瞄准镜"
	desc = "一套专为追踪专家设计的耳机和热成像护目镜系统。可对生物体进行热成像。点击切换。"
	icon = 'icons/obj/clothing/glasses.dmi'
	icon_state = "m56_goggles"
	deactive_state = "m56_goggles_0"
	actions_types = list(/datum/action/item_action/toggle)
