/obj/item/attachable/verticalgrip
	name = "垂直握把"
	desc = "一款定制改进的前握把，可提升精度，适度加快瞄准移动速度，减少后坐力，尤其是在点射时减少散射。\n然而，它也会增加武器尺寸，略微增加举枪延迟，并使非举枪状态下的射击更加笨拙。"
	icon_state = "verticalgrip"
	icon = 'icons/obj/items/guns/attachments/underbarrel.dmi'
	wield_delay_mod = 0.2 SECONDS
	size_mod = 1
	slot = ATTACHMENT_SLOT_UNDER
	pixel_shift_x = 20
	accuracy_mod = 0.1
	recoil_mod = -2
	scatter_mod = -3
	burst_scatter_mod = -1
	accuracy_unwielded_mod = -0.05
	scatter_unwielded_mod = 3
	aim_speed_mod = -0.1
	aim_mode_movement_mult = -0.2

/obj/item/attachable/angledgrip
	name = "斜握把"
	desc = "定制改进型前握把，可减少后坐力，并加快举枪速度。\n但也会增加武器尺寸，并略微妨碍非双手持握射击。"
	icon_state = "angledgrip"
	icon = 'icons/obj/items/guns/attachments/underbarrel.dmi'
	wield_delay_mod = -0.3 SECONDS
	size_mod = 1
	slot = ATTACHMENT_SLOT_UNDER
	pixel_shift_x = 20
	recoil_mod = -1
	scatter_mod = 2
	accuracy_unwielded_mod = -0.1
	scatter_unwielded_mod = 1

/obj/item/attachable/gyro
	name = "陀螺稳定器"
	desc = "一套用于在点射或移动时稳定武器的配重平衡系统，尤其适用于单手射击。大幅降低移动对精度的惩罚。显著减少点射散布、后坐力和总体散布。通过提高移动射击精度，让你在瞄准时能更快移动。"
	icon_state = "gyro"
	icon = 'icons/obj/items/guns/attachments/underbarrel.dmi'
	slot = ATTACHMENT_SLOT_UNDER
	scatter_mod = -1
	recoil_mod = -2
	movement_acc_penalty_mod = -2
	accuracy_unwielded_mod = 0.1
	scatter_unwielded_mod = -2
	recoil_unwielded_mod = -1
	aim_mode_movement_mult = -0.5

/obj/item/attachable/lasersight
	name = "激光瞄准镜"
	desc = "枪管下方安装的激光瞄准器。显著提升单手持枪精度，并大幅降低非双手持握时的精度惩罚。"
	icon_state = "lasersight"
	icon = 'icons/obj/items/guns/attachments/underbarrel.dmi'
	slot = ATTACHMENT_SLOT_UNDER
	pixel_shift_x = 17
	pixel_shift_y = 17
	accuracy_mod = 0.1
	accuracy_unwielded_mod = 0.15

/obj/item/attachable/burstfire_assembly
	name = "点射组件"
	desc = "一种机制重组套件，允许武器进行全自动射击，或者如果武器已具备此能力，则增加每次连发的射弹数量。\n会增加散布并降低精度。"
	icon_state = "rapidfire"
	icon = 'icons/obj/items/guns/attachments/underbarrel.dmi'
	slot = ATTACHMENT_SLOT_UNDER
	burst_mod = 2
	burst_scatter_mod = 1
	burst_accuracy_mod = -0.1

/obj/item/attachable/autosniperbarrel
	name = "自动狙击枪管"
	icon_state = "t81barrel"
	icon = 'icons/obj/items/guns/attachments/underbarrel.dmi'
	desc = "重型枪管。无法拆卸。"
	slot = ATTACHMENT_SLOT_UNDER
	attach_features_flags = NONE
	pixel_shift_x = 7
	pixel_shift_y = 14
	accuracy_mod = 0
	scatter_mod = -1
