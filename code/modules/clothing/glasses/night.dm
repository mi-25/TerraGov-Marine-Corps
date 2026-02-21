
// nightvision goggles

/obj/item/clothing/glasses/night
	name = "夜视镜"
	desc = "你现在完全能在黑暗中视物了！"
	species_exception = list(/datum/species/robot)
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/glasses.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/glasses_bravada.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/glasses_charlit.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/glasses_alpharii.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/glasses_deltad.dmi')
	icon_state = "night"
	worn_icon_state = "glasses"
	lighting_cutoff = LIGHTING_CUTOFF_MEDIUM
	toggleable = TRUE


/obj/item/clothing/glasses/night/tx8
	name = "\improper BR-8 战斗瞄准镜"
	desc = "BR-8战斗步枪的耳机与夜视镜系统。可高亮显示周围环境。点击切换。"
	icon = 'icons/obj/clothing/glasses.dmi'
	icon_state = "m56_goggles"
	deactive_state = "m56_goggles_0"
	vision_flags = SEE_TURFS
	toggleable = 1
	actions_types = list(/datum/action/item_action/toggle)


/obj/item/clothing/glasses/night/m42_night_goggles
	name = "\improper M42侦察瞄准镜"
	desc = "M42侦察步枪用头戴式耳机与夜视镜系统。可高亮显示周围环境影像。点击切换。"
	icon = 'icons/obj/clothing/glasses.dmi'
	icon_state = "m56_goggles"
	deactive_state = "m56_goggles_0"
	vision_flags = SEE_TURFS
	toggleable = 1
	actions_types = list(/datum/action/item_action/toggle)


/obj/item/clothing/glasses/night/m42_night_goggles/upp
	name = "\improper 9型精英护目镜"
	desc = "联合太空鳞翅目部队使用的耳机与夜视镜系统。可高亮显示周围环境影像。点击切换。"
	icon_state = "upp_goggles"
	deactive_state = "upp_goggles_0"

/obj/item/clothing/glasses/night/sectoid
	name = "异形透镜"
	desc = "一层覆盖在异形眼睛上的厚重黑色涂层，使其能够在黑暗中视物。"
	icon_state = "alien_lens"
	worn_icon_state = "alien_lens"
	lighting_cutoff = LIGHTING_CUTOFF_FULLBRIGHT
	item_flags = DELONDROP
	toggleable = FALSE
	active = TRUE

/obj/item/clothing/glasses/night/sectoid/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, SECTOID_TRAIT)

/obj/item/clothing/glasses/night/m56_goggles
	name = "\improper KTLD头戴式瞄准镜"
	desc = "专为与KTLD武器（如SG型武器）配对设计的头戴式耳机和护目镜系统。配备低分辨率短程成像仪，可查看地形。"
	icon = 'icons/obj/clothing/glasses.dmi'
	icon_state = "m56_goggles"
	deactive_state = "m56_goggles_0"
	toggleable = TRUE
	actions_types = list(/datum/action/item_action/toggle)
	vision_flags = SEE_TURFS

/obj/item/clothing/glasses/night/m56_goggles/activate(mob/user)
	. = ..()
	if(!user)
		return
	if(active)
		SEND_SIGNAL(user, COMSIG_KTLD_ACTIVATED, src)
		RegisterSignal(user, COMSIG_ITEM_ZOOM, PROC_REF(activate))
	else
		UnregisterSignal(user, COMSIG_ITEM_ZOOM)

/obj/item/clothing/glasses/night/m56_goggles/equipped(mob/user, slot)
	. = ..()
	if(!active)
		return
	RegisterSignal(user, COMSIG_ITEM_ZOOM, PROC_REF(activate))

/obj/item/clothing/glasses/night/m56_goggles/unequipped(mob/unequipper, slot)
	. = ..()
	UnregisterSignal(unequipper, COMSIG_ITEM_ZOOM)

/obj/item/clothing/glasses/night/sunglasses
	name = "\improper KTLD太阳镜"
	desc = "一副设计师太阳镜。这副眼镜已配备KTLD头戴式瞄准具。"
	icon = 'icons/obj/clothing/glasses.dmi'
	icon_state = "m56sunglasses"
	worn_icon_state = "m56sunglasses"
	deactive_state = "degoggles_mesonsunglasses"
	toggleable = TRUE
	actions_types = list(/datum/action/item_action/toggle)
	vision_flags = SEE_TURFS
	prescription = TRUE

/obj/item/clothing/glasses/night/optgoggles
	name = "\improper 光学成像弹道护目镜"
	desc = "标准配发的TGMC护目镜。这副护目镜已配备内部光学成像扫描仪。"
	icon_state = "optgoggles"
	worn_icon_state = "optgoggles"
	deactive_state = "degoggles_optgoggles"
	toggleable = TRUE
	actions_types = list(/datum/action/item_action/toggle)
	species_exception = list(/datum/species/robot)
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/glasses.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/glasses_bravada.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/glasses_charlit.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/glasses_alpharii.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/glasses_deltad.dmi')
	equip_slot_flags = ITEM_SLOT_EYES
	goggles = TRUE

/obj/item/clothing/glasses/night/optgoggles/prescription
	name = "\improper 光学成像处方防弹护目镜"
	desc = "标准配发的TGMC处方护目镜。这副护目镜配备了内置光学成像扫描仪。"
	prescription = TRUE

/obj/item/clothing/glasses/night/vsd
	name = "\improper CM-12夜视镜"
	desc = "VSD标准制式夜视镜！带来额外的战术酷炫感！Crash Core与你的上级军官对失明和灼伤概不负责。"
	icon = 'icons/mob/clothing/eyes.dmi'
	icon_state = "vsd_nvg"
	worn_icon_state = "vsd_nvg"
	deactive_state = "vsd_nvg_off"
	toggleable = TRUE
	actions_types = list(/datum/action/item_action/toggle)
	tint = COLOR_VERY_SOFT_YELLOW
	worn_layer = COLLAR_LAYER

/obj/item/clothing/glasses/night/vsd/alt
	name = "\improper CM-13 夜视面罩"
	desc = "VSD夜视面罩，专为中型装甲变体设计的枪械配件。Crash Core与你的上级军官对失明和灼伤概不负责。"
	icon_state = "vsd_alt"
	worn_icon_state = "vsd_alt"
	deactive_state = "vsd_alt_off"
