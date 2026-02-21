/obj/item/tank/jetpack
	name = "喷气背包（空）"
	desc = "一罐压缩气体，用于在零重力区域提供推进力。请谨慎使用。"
	icon_state = "jetpack"
	w_class = WEIGHT_CLASS_BULKY
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/backpacks_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/backpacks_right.dmi',
	)
	worn_icon_state = "jetpack"
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD


/obj/item/tank/jetpack/void
	name = "虚空喷气背包（氧气）"
	desc = "它在真空中运作良好。"
	icon_state = "jetpack-void"
	worn_icon_state = "jetpack-void"


/obj/item/tank/jetpack/oxygen
	name = "喷气背包（氧气）"
	desc = "一罐压缩氧气，用于在零重力区域提供推进力。请谨慎使用。"
	icon_state = "jetpack"
	worn_icon_state = "jetpack"


/obj/item/tank/jetpack/carbondioxide
	name = "喷气背包（二氧化碳）"
	desc = "一罐压缩二氧化碳，用于零重力区域的推进。涂成黑色以表明不应作为内部呼吸气源使用。"
	distribute_pressure = 0
	icon_state = "jetpack-black"
	worn_icon_state = "jetpack-black"
