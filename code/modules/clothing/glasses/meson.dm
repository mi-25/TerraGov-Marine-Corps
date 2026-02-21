
//meson goggles

/obj/item/clothing/glasses/meson
	name = "光学介子扫描仪"
	desc = "用于保护使用者眼睛免受有害电磁辐射伤害，也可用作通用安全护目镜。不足以作为焊接防护装备。"
	icon_state = "meson"
	worn_icon_state = "meson"
	deactive_state = "degoggles_meson"
	species_exception = list(/datum/species/robot)
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/glasses.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/glasses_bravada.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/glasses_charlit.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/glasses_alpharii.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/glasses_deltad.dmi')
	actions_types = list(/datum/action/item_action/toggle)
	toggleable = 1
	vision_flags = SEE_TURFS // todo replace with tgs TRAIT_MESON_VISION


/obj/item/clothing/glasses/meson/prescription
	name = "处方光学介子扫描仪"
	desc = "用于保护使用者眼睛免受有害电磁辐射，也可用作安全护目镜。包含处方镜片。"
	prescription = 1

/obj/item/clothing/glasses/meson/enggoggles
	name = "\improper 光学介子弹道护目镜"
	desc = "标准配发的TGMC护目镜。这副护目镜已内置光学介子扫描仪。"
	icon_state = "enggoggles"
	worn_icon_state = "enggoggles"
	deactive_state = "degoggles_enggoggles"
	equip_slot_flags = ITEM_SLOT_EYES
	goggles = TRUE

/obj/item/clothing/glasses/meson/enggoggles/prescription
	name = "\improper 光学介子处方弹道护目镜"
	desc = "标准配发的TGMC处方护目镜。这副护目镜已内置光学介子扫描仪。"
	prescription = TRUE

/obj/item/clothing/glasses/meson/eyepatch
	name = "\improper 介子眼罩"
	desc = "装有介子扫描仪接口的眼罩。专为残疾和/或硬核工程师设计。"
	icon_state = "patchmeson"
	deactive_state = "degoggles_medpatch"
	species_exception = list(/datum/species/robot)
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/glasses.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/glasses_bravada.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/glasses_charlit.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/glasses_alpharii.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/glasses_deltad.dmi')
	toggleable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/glasses/meson/sunglasses
	name = "\improper 介子护目镜"
	desc = "一副设计师太阳镜。这副眼镜配备了光学介子扫描仪。"
	icon_state = "mesonsunglasses"
	worn_icon_state = "mesonsunglasses"
	deactive_state = "degoggles_mesonsunglasses"
	prescription = TRUE
