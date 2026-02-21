// ***************************************
// *********** Modular Style Line
// ***************************************
/obj/item/clothing/suit/modular/style
	name = "\improper 滴注"
	desc = "他们这身行头，还挺潮。"
	item_map_variant_flags = NONE
	allowed_uniform_type = /obj/item/clothing/under
	icon = 'icons/obj/clothing/suits/marine_suits.dmi'
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/clothing/suits/marine_suits.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	attachments_allowed = list(
// Armor Modules
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/module/valkyrie_autodoc,
		/obj/item/armor_module/module/fire_proof,
		/obj/item/armor_module/module/tyr_extra_armor,
		/obj/item/armor_module/module/tyr_extra_armor/mark1,
		/obj/item/armor_module/module/mimir_environment_protection,
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
		/obj/item/armor_module/module/hlin_explosive_armor,
		/obj/item/armor_module/module/ballistic_armor,
		/obj/item/armor_module/module/chemsystem,
		/obj/item/armor_module/module/eshield,
		/obj/item/armor_module/module/mirage,
		/obj/item/armor_module/module/armorlock,
// Storage Modules
		/obj/item/armor_module/storage/general,
		/obj/item/armor_module/storage/ammo_mag,
		/obj/item/armor_module/storage/engineering,
		/obj/item/armor_module/storage/medical,
		/obj/item/armor_module/storage/general/som,
		/obj/item/armor_module/storage/engineering/som,
		/obj/item/armor_module/storage/medical/som,
		/obj/item/armor_module/storage/injector,
		/obj/item/armor_module/storage/grenade,
		/obj/item/armor_module/storage/integrated,
		/obj/item/armor_module/armor/badge,
// Equalizer Modules
		/obj/item/armor_module/module/style/light_armor,
		/obj/item/armor_module/module/style/medium_armor,
		/obj/item/armor_module/module/style/heavy_armor,
	)

	var/codex_info = {"<BR>This item is part of the <b>Style Line.</b><BR>
	<BR>The <b>Style Line</b> is a line of equipment designed to provide as much style as possible without compromising the user's protection.
	This line of equipment accepts <b>Equalizer modules</b>, which allow the user to alter any given piece of equipment's protection according to their preferences.<BR>"}

/obj/item/clothing/suit/modular/style/get_mechanics_info()
	. = ..()
	. += jointext(codex_info, "<br>")

/obj/item/clothing/suit/modular/style/leather_jacket
	name = "\improper 皮夹克"
	desc = "一件时尚夹克。穿出你的风格。"
	icon_state = "leather_jacket"
	worn_icon_state = "leather_jacket_worn"
	icon_state_variants = list(
		"normal",
		"webbing",
	)
	current_variant = "normal"
	greyscale_colors = ARMOR_PALETTE_BLACK
	greyscale_config = /datum/greyscale_config/duster/leather_jacket
	colorable_colors = LEGACY_ARMOR_PALETTES_LIST
	colorable_allowed = ICON_STATE_VARIANTS_ALLOWED|PRESET_COLORS_ALLOWED

/obj/item/clothing/suit/modular/style/duster
	name = "\improper 风衣"
	desc = "一件轻便、宽松的可染色长外套，适合那些想要更多风格的人。"
	icon_state = "duster"
	worn_icon_state = "duster_worn"
	greyscale_colors = ARMOR_PALETTE_BLACK
	greyscale_config = /datum/greyscale_config/duster
	colorable_colors = LEGACY_ARMOR_PALETTES_LIST
	colorable_allowed = PRESET_COLORS_ALLOWED

// ***************************************
//  Modular hats
/obj/item/clothing/head/modular/style
	name = "\improper 好帽子"
	desc = "好帽子啊兄弟。你从哪找到的？"
	item_map_variant_flags = ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_DESERT_VARIANT
	attachments_allowed = list(
		/obj/item/armor_module/armor/badge,
		/obj/item/armor_module/storage/helmet,
		/obj/item/armor_module/armor/stylehat_badge,
		/obj/item/armor_module/armor/stylehat_badge/classic,
		/obj/item/armor_module/armor/stylehat_badge/ushanka,
	)
	attachments_by_slot = list(
		ATTACHMENT_SLOT_VISOR,
		ATTACHMENT_SLOT_STORAGE,
		ATTACHMENT_SLOT_HEAD_MODULE,
		ATTACHMENT_SLOT_BADGE,
		ATTACHMENT_SLOT_CAPE_HIGHLIGHT,
	)

	greyscale_config = /datum/greyscale_config/style_hat
	colorable_allowed = PRESET_COLORS_ALLOWED

	visorless_offset_y = 0

	inv_hide_flags = NONE

	soft_armor = list(MELEE = 50, BULLET = 70, LASER = 70, ENERGY = 60, BOMB = 50, BIO = 50, FIRE = 50, ACID = 60)
	starting_attachments = list(/obj/item/armor_module/storage/helmet)



//marine hats
/obj/item/clothing/head/modular/style/beret
	name = "地球政府殖民地海军陆战队贝雷帽"
	desc = "TGMC使用的一种军帽，通常被认为是最具标志性的军用头饰。通常为高级军官保留，但偶尔也会流传到下级，落入班长和受勋士兵手中。"
	icon_state = "beret_inhand"
	worn_icon_state = "beret"
	starting_attachments = list(/obj/item/armor_module/storage/helmet, /obj/item/armor_module/armor/stylehat_badge)
	inv_hide_flags = HIDE_EXCESS_HAIR


/obj/item/clothing/head/modular/style/classic_beret
	name = "地球政府殖民地海军陆战队贝雷帽（经典款）"
	desc = "TGMC使用的一种军帽，通常被认为是最具标志性的军用头饰。通常为高级军官保留，但偶尔也会流传到下级，落入班长和受勋士兵手中。这款是经典款式。"
	icon_state = "classic_beret_inhand"
	worn_icon_state = "classic_beret"
	starting_attachments = list(/obj/item/armor_module/storage/helmet, /obj/item/armor_module/armor/stylehat_badge/classic)
	inv_hide_flags = HIDE_EXCESS_HAIR

/obj/item/clothing/head/modular/style/boonie
	name = "地球政府殖民地海军陆战队丛林帽"
	desc = "TGMC使用的丛林帽，专为阳光强烈或植被茂密环境下的行动而设计。"
	icon_state = "boonie_inhand"
	worn_icon_state = "boonie"
	inv_hide_flags = HIDE_EXCESS_HAIR

/obj/item/clothing/head/modular/style/cap
	name = "地球政府殖民地海军陆战队舰长"
	desc = "地球政府殖民地海军陆战队常用的巡逻帽，款式时尚且颜色多样。主要用来遮挡阳光和避开军官。"
	icon_state = "cap_inhand"
	worn_icon_state = "cap"
	inv_hide_flags = HIDE_EXCESS_HAIR


/obj/item/clothing/head/modular/style/slouchhat
	name = "地球政府殖民地海军陆战队软帽"
	desc = "一顶软塌帽，让你感觉身处澳洲内陆，不是吗？帽子内侧印有'地球政府殖民地海军陆战队财产'的标记。"
	icon_state = "slouch_inhand"
	worn_icon_state = "slouch"
	inv_hide_flags = HIDE_EXCESS_HAIR

/obj/item/clothing/head/modular/style/ushanka
	name = "TGMC 乌沙帽"
	desc = "地球政府殖民地海军陆战队使用的舒适乌沙帽。即使在最严酷的北极环境中也能让你保持温暖。"
	icon_state = "ushanka_inhand"
	worn_icon_state = "ushanka"
	starting_attachments = list(/obj/item/armor_module/storage/helmet, /obj/item/armor_module/armor/stylehat_badge/ushanka)
	inv_hide_flags = HIDE_EXCESS_HAIR


/obj/item/clothing/head/modular/style/campaignhat
	name = "地球政府殖民地海军陆战队战役帽"
	desc = "一顶军帽，光是看着它就能感受到这顶帽子散发出的威胁气息。"
	icon_state = "campaign_inhand"
	worn_icon_state = "campaign"
	inv_hide_flags = HIDE_EXCESS_HAIR


/obj/item/clothing/head/modular/style/beanie
	name = "地球政府殖民地海军陆战队针织帽"
	desc = "一顶毛线帽，光是看着它就会让你感觉自己像个'乌萨马'，或者用更好的说法——一种现代现象，人们一旦戴上毛线帽就突然需要去卧推。"
	icon_state = "beanie_inhand"
	worn_icon_state = "beanie"
	inv_hide_flags = HIDE_EXCESS_HAIR

/obj/item/clothing/head/modular/style/headband
	name = "地球政府殖民地海军陆战队头带"
	desc = "一条头带。既能防止汗水流入眼睛，也能让你看起来更酷。"
	icon_state = "headband_inhand"
	worn_icon_state = "headband"


/obj/item/clothing/head/modular/style/bandana
	name = "地球政府殖民地海军陆战队头巾"
	desc = "一条戴在头上的头巾。后系带上印有TGMC标记，而且那个结似乎永远不会松开。"
	icon_state = "headbandana_inhand"
	worn_icon_state = "headbandana"
	inv_hide_flags = HIDE_EXCESS_HAIR

// style masks
/obj/item/clothing/mask/gas/modular/skimask
	name = "滑雪面罩"
	desc = "一款时尚的滑雪面罩，可重新染色。光是看着它就能让你感觉自己像个特工。"
	icon_state = "ski_inhand"
	worn_icon_state = "ski"
	inv_hide_flags = HIDEALLHAIR|HIDEEARS
	item_map_variant_flags = ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_DESERT_VARIANT
	greyscale_config = /datum/greyscale_config/style_hat


/obj/item/clothing/mask/gas/modular/coofmask
	name = "战斗面罩"
	desc = "CFCC是一款优质、准备就绪且时尚的面罩，随时准备……遮住你的脸。"
	icon_state = "coof_inhand"
	worn_icon_state = "coof"
	item_map_variant_flags = ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_DESERT_VARIANT
	greyscale_config = /datum/greyscale_config/style_hat
