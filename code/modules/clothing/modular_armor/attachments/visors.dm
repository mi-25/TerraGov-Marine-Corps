/**
 *  Visors
 *  Visors are slightly different than the other armor types. They allow emissives. If visor_emissive_on is TRUE then it will be applying an emissve to it.
 * 	If allow_emissive is TRUE, Right clicking the Parent item will toggle the emissive.
*/

/obj/item/armor_module/armor/visor
	name = "标准护目镜"
	icon_state = "visor"
	slot = ATTACHMENT_SLOT_VISOR
	attach_features_flags = ATTACH_SAME_ICON|ATTACH_APPLY_ON_MOB
	greyscale_config = /datum/greyscale_config/visors
	greyscale_colors = VISOR_PALETTE_GOLD
	colorable_colors = VISOR_PALETTES_LIST
	secondary_color = TRUE
	item_map_variant_flags = NONE

	///whether this helmet should be using its emissive overlay or not
	var/visor_emissive_on = TRUE
	///Whether or not the helmet is allowed to turn its emissive on or off.
	var/allow_emissive = TRUE

/obj/item/armor_module/armor/visor/on_attach(obj/item/attaching_to, mob/user)
	. = ..()
	RegisterSignal(parent, COMSIG_ATOM_ATTACK_HAND_ALTERNATE, PROC_REF(toggle_emissive))
	if(visor_emissive_on)
		parent.AddElement(/datum/element/special_clothing_overlay/modular_helmet_visor, HEAD_LAYER, icon_state, icon)
	update_icon()

/obj/item/armor_module/armor/visor/on_detach(obj/item/detaching_from, mob/user)
	UnregisterSignal(parent, COMSIG_ATOM_ATTACK_HAND_ALTERNATE)
	parent.RemoveElement(/datum/element/special_clothing_overlay/modular_helmet_visor, HEAD_LAYER, icon_state, icon)
	update_icon()
	return ..()

///Toggles the visors emmisiveness if allowed.
/obj/item/armor_module/armor/visor/proc/toggle_emissive(datum/source, mob/living/user)
	SIGNAL_HANDLER
	if(!allow_emissive|| (parent && user.get_inactive_held_item() != parent) || (!parent && user.get_inactive_held_item() != src))
		return
	visor_emissive_on = !visor_emissive_on
	if(visor_emissive_on)
		parent?.AddElement(/datum/element/special_clothing_overlay/modular_helmet_visor, HEAD_LAYER, icon_state, icon)
	else
		parent?.RemoveElement(/datum/element/special_clothing_overlay/modular_helmet_visor, HEAD_LAYER, icon_state, icon)
	to_chat(user, span_notice("You turn [ visor_emissive_on ? "on" : "off" ] \the [src]'s internal lighting."))
	update_icon()
	parent.update_icon()
	return COMPONENT_NO_ATTACK_HAND

/obj/item/armor_module/armor/visor/extra_examine(datum/source, mob/user)
	. = ..()
	if(!allow_emissive)
		return
	to_chat(user, "右键点击头盔以切换面罩内部照明。")

/obj/item/armor_module/armor/visor/marine
	name = "\improper 耶格尔式步兵护目镜"
	desc = "耶格尔模块化头盔的护目镜枪械配件。这款专为步兵级头盔设计。"
	icon_state = "infantry_visor"

/obj/item/armor_module/armor/visor/marine/skirmisher
	name = "\improper 游骑兵式样 斥候护目镜"
	desc = "耶格尔模块化头盔的护目镜枪械配件。这款专为突击兵级头盔设计。"
	icon_state = "skirmisher_visor"

/obj/item/armor_module/armor/visor/marine/scout
	name = "\improper 耶格尔式侦察护目镜"
	desc = "耶格尔模块化头盔的护目镜枪械配件。这款专为侦察兵型头盔设计。"
	icon_state = "scout_visor"

/obj/item/armor_module/armor/visor/marine/helljumper
	name = "\improper 耶格型地狱伞兵护目镜"
	desc = "耶格尔模块化头盔的护目镜枪械配件。这款专为地狱伞兵级头盔设计。"
	icon_state = "helljumper_visor"

/obj/item/armor_module/armor/visor/marine/ranger
	name = "\improper 游侠型耶格护目镜"
	desc = "耶格模块化头盔的护目镜枪械配件。这款专为游骑兵级头盔设计。"
	icon_state = "ranger_visor"
	colorable_allowed = COLOR_WHEEL_ALLOWED|PRESET_COLORS_ALLOWED

/obj/item/armor_module/armor/visor/marine/traditional
	name = "\improper 游侠传统型耶格尔护目镜"
	desc = "耶格尔模块化头盔的护目镜枪械配件。这款专为传统游骑兵级头盔设计。"
	icon_state = "traditional_visor"
	colorable_allowed = COLOR_WHEEL_ALLOWED|PRESET_COLORS_ALLOWED

/obj/item/armor_module/armor/visor/marine/trooper
	name = "\improper 耶格式样突击队员面罩"
	desc = "耶格模块化头盔的护目镜配件。此款专为突击兵级头盔设计。"
	icon_state = "trooper_visor"
	colorable_allowed = COLOR_WHEEL_ALLOWED|PRESET_COLORS_ALLOWED

/obj/item/armor_module/armor/visor/marine/mjolnir
	name = "\improper 耶格尔型雷神之锤护目镜"
	desc = "耶格尔模块化头盔的护目镜配件。这款专为雷神级头盔设计。"
	icon_state = "mjolnir_visor"
	colorable_allowed = COLOR_WHEEL_ALLOWED|PRESET_COLORS_ALLOWED

/obj/item/armor_module/armor/visor/marine/mjolnir_open
	name = "\improper 耶格式开放型雷神护面"
	desc = "耶格尔模块化头盔的护目镜配件。这款专为雷神级头盔设计。"
	icon_state = "mjolnir_open_visor"
	colorable_allowed = COLOR_WHEEL_ALLOWED|PRESET_COLORS_ALLOWED

/obj/item/armor_module/armor/visor/marine/eva
	name = "\improper 耶格式样EVA护目镜"
	desc = "耶格模块化头盔的护目镜配件。这款专为EVA级头盔设计。"
	icon_state = "eva_visor"

/obj/item/armor_module/armor/visor/marine/eva/skull
	name = "\improper 耶格式样EVA颅骨面罩"
	icon_state = "eva_visor"
	attachments_by_slot = list(ATTACHMENT_SLOT_CAPE_HIGHLIGHT)
	attachments_allowed = list(/obj/item/armor_module/armor/visor_glyph)
	starting_attachments = list(/obj/item/armor_module/armor/visor_glyph)

/obj/item/armor_module/armor/visor/marine/assault
	name = "\improper 耶格式突击护目镜"
	desc = "耶格尔模块化头盔的护目镜配件。这款专为突击型头盔设计。"
	icon_state = "assault_visor"

/obj/item/armor_module/armor/visor/marine/eod
	name = "\improper 耶格尔式排爆护目镜"
	desc = "耶格尔模块化头盔的护目镜枪械配件。这款专为EOD级头盔设计。"
	icon_state = "eod_visor"
	colorable_allowed = COLOR_WHEEL_ALLOWED|PRESET_COLORS_ALLOWED

/obj/item/armor_module/armor/visor/marine/gungnir
	name = "\improper 耶格尔型冈格尼尔护目镜"
	desc = "耶格尔模块化头盔的护目镜枪械配件。这款专为冈格尼尔级头盔设计。"
	icon_state = "gugnir"
	greyscale_config = /datum/greyscale_config/visors/greyscale
	colorable_allowed = COLOR_WHEEL_ALLOWED
	greyscale_colors = LIGHT_COLOR_GREEN

//Robots
/obj/item/armor_module/armor/visor/marine/robot
	name = "\improper XN-1 上装甲板面罩"
	desc = "XN-1上装甲板的护目镜枪械配件。"
	icon_state = "r_medium"
	colorable_allowed = COLOR_WHEEL_ALLOWED|PRESET_COLORS_ALLOWED

/obj/item/armor_module/armor/visor/marine/robot/light
	name = "\improper XN-1-L 上装甲板面罩"
	desc = "XN-1-L 上装甲板的护目镜枪械配件。"
	icon_state = "r_light"

/obj/item/armor_module/armor/visor/marine/robot/heavy
	name = "\improper XN-1-H 上装甲板护目镜"
	desc = "XN-1-H 上装甲板的护目镜枪械配件。"
	icon_state = "r_heavy"


//Xenonaut
/obj/item/armor_module/armor/visor/marine/xenonaut
	name = "\improper 异形探索者重型面罩"
	desc = "异形重盔的护目镜配件"
	icon_state = "xenonaut"


//old jaeger
/obj/item/armor_module/armor/visor/marine/old
	name = "\improper 耶格尔式步兵护目镜"
	desc = "耶格尔模块化头盔的护目镜枪械配件。这款专为步兵级头盔设计。"
	icon_state = "infantry_visor_old"

/obj/item/armor_module/armor/visor/marine/old/skirmisher
	name = "\improper 耶格式样游骑兵护目镜"
	desc = "耶格尔模块化头盔的护目镜枪械配件。这款专为突击兵级头盔设计。"
	icon_state = "skirmisher_visor_old"

/obj/item/armor_module/armor/visor/marine/old/scout
	name = "\improper 耶格式侦察护目镜"
	desc = "耶格尔模块化头盔的护目镜枪械配件。这款专为侦察兵型头盔设计。"
	icon_state = "scout_visor_old"
	colorable_allowed = COLOR_WHEEL_ALLOWED|PRESET_COLORS_ALLOWED

/obj/item/armor_module/armor/visor/marine/old/eva
	name = "\improper 耶格式样舱外活动护目镜"
	desc = "耶格模块化头盔的护目镜枪械配件。这款专为EVA级头盔设计。"
	icon_state = "eva_visor_old"

/obj/item/armor_module/armor/visor/marine/old/eva/skull
	name = "\improper 耶格式样EVA颅骨面罩"
	icon_state = "eva_visor_old"
	attachments_by_slot = list(ATTACHMENT_SLOT_CAPE_HIGHLIGHT)
	attachments_allowed = list(/obj/item/armor_module/armor/visor_glyph/old)
	starting_attachments = list(/obj/item/armor_module/armor/visor_glyph/old)

/obj/item/armor_module/armor/visor/marine/old/assault
	name = "\improper 耶格尔式突击护目镜"
	desc = "耶格尔模块化头盔的护目镜配件。这款专为突击型头盔设计。"
	icon_state = "assault_visor_old"
	colorable_allowed = COLOR_WHEEL_ALLOWED|PRESET_COLORS_ALLOWED

/obj/item/armor_module/armor/visor/marine/old/eod
	name = "\improper 排爆型护目镜"
	desc = "耶格尔模块化头盔的护目镜枪械配件。这款专为EOD级头盔设计。"
	icon_state = "eod_visor_old"
	colorable_allowed = COLOR_WHEEL_ALLOWED|PRESET_COLORS_ALLOWED

//Hardsuit Helmet Visors
/obj/item/armor_module/armor/visor/marine/fourvisor
	name = "\improper FleckTex Mark V头盔护目镜"
	desc = "弗莱克特克斯 WY-01 系列模块化头盔的护目镜枪械配件。此款专为马克 V 型破门手头盔设计。"
	icon_state = "fourvisor_visor"

/obj/item/armor_module/armor/visor/marine/foureyevisor
	name = "\improper 弗莱克泰克斯 Mark III 头盔面罩"
	desc = "弗莱克泰克斯 WY-01 系列模块化头盔的护目镜枪械配件。此款专为 Mark III 掠夺者级头盔设计。"
	icon_state = "foureye_visor"

/obj/item/armor_module/armor/visor/marine/markonevisor
	name = "\improper FleckTex Mark I 头盔护目镜"
	desc = "弗莱克特克斯 WY-01 系列模块化头盔的护目镜枪械配件。这款专为马克 I 型掠夺者级头盔设计。"
	icon_state = "markone_visor"

//VSD hardsuit visor
/obj/item/armor_module/armor/visor/marine/phobos
	name = "\improper 撞击者MT/41'火卫一'头盔护目镜"
	desc = "Crasher MT/41系列模块化头盔的护目镜配件。此款专为'恐惧'头盔设计。"
	icon_state = "phobos_visor"

/obj/item/armor_module/armor/visor/marine/clementia
	name = "\improper 撞击者MT/41'克莱门蒂亚'头盔面罩"
	desc = "Crasher MT/41系列模块化头盔的护目镜配件。此款专为'克莱门蒂亚'型头盔设计。"
	icon_state = "clementia_visor"

/obj/item/armor_module/armor/visor/marine/hephaestus
	name = "\improper 撞击者MT/41'赫菲斯托斯'头盔面罩"
	desc = "Crasher MT/41系列模块化头盔的护目镜配件。此款专为'赫菲斯托斯'型头盔设计。"
	icon_state = "hephaestus_visor"

