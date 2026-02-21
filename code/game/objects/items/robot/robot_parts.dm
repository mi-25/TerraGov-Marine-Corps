/obj/item/robot_parts
	name = "机器人部件"
	icon = 'icons/obj/items/robot_parts.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/engineering_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/engineering_right.dmi',
	)
	worn_icon_state = "buildpipe"
	icon_state = "blank"
	atom_flags = CONDUCT
	equip_slot_flags = ITEM_SLOT_BELT
	var/list/part

/obj/item/robot_parts/l_arm
	name = "机器人左臂"
	desc = "包裹着伪肌肉的骨骼肢体，带有低导电性外壳。"
	icon_state = "l_arm"
	part = list(BODY_ZONE_L_ARM, BODY_ZONE_PRECISE_L_HAND)

/obj/item/robot_parts/r_arm
	name = "机器人右臂"
	desc = "包裹着伪肌肉的骨骼肢体，配有低导电性外壳。"
	icon_state = "r_arm"
	part = list(BODY_ZONE_R_ARM, BODY_ZONE_PRECISE_R_HAND)

/obj/item/robot_parts/l_leg
	name = "机器人左腿"
	desc = "包裹着伪肌肉的骨骼肢体，配有低传导性外壳。"
	icon_state = "l_leg"
	part = list(BODY_ZONE_L_LEG, BODY_ZONE_PRECISE_L_FOOT)

/obj/item/robot_parts/r_leg
	name = "机器人右腿"
	desc = "包裹着伪肌肉的骨骼肢体，配有低传导性外壳。"
	icon_state = "r_leg"
	part = list(BODY_ZONE_R_LEG, BODY_ZONE_PRECISE_R_FOOT)

/obj/item/robot_parts/chest
	name = "机器人躯干"
	desc = "一个装有赛博格逻辑板的加固箱，留有标准电源单元的空间。"
	icon_state = "chest"

/obj/item/robot_parts/head
	name = "机器人头部"
	desc = "标准强化脑壳，带有脊柱插接神经接口和传感器万向节。"
	icon_state = "head"

/obj/item/robot_parts/robot_suit
	name = "机器人内骨骼"
	desc = "一个复杂的金属骨架，带有标准肢体接口和仿生肌肉锚点。"
	icon_state = "robo_suit"

/obj/item/robot_parts/biotic
	name = "生化肢体"
	icon = 'icons/mob/human_races/r_human.dmi'
	atom_flags = NONE

/obj/item/robot_parts/biotic/l_arm
	name = "生化左臂"
	desc = "一个生化肢体。"
	icon_state = "l_arm"
	part = list(BODY_ZONE_L_ARM, BODY_ZONE_PRECISE_L_HAND)

/obj/item/robot_parts/biotic/r_arm
	name = "生化右臂"
	desc = "一个生化肢体。"
	icon_state = "r_arm"
	part = list(BODY_ZONE_R_ARM, BODY_ZONE_PRECISE_R_HAND)

/obj/item/robot_parts/biotic/l_leg
	name = "生化左腿"
	desc = "生化义肢。"
	icon_state = "l_leg"
	part = list(BODY_ZONE_L_LEG, BODY_ZONE_PRECISE_L_FOOT)

/obj/item/robot_parts/biotic/r_leg
	name = "生化右腿"
	desc = "生化肢体。"
	icon_state = "r_leg"
	part = list(BODY_ZONE_R_LEG, BODY_ZONE_PRECISE_R_FOOT)
