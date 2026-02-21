#define HIGHLIGHT_VARIANTS "highlight_variants"
#define HOOD "hood"

/obj/item/armor_module/armor/cape
	name = "\improper 6E变色龙斗篷"
	desc = "一款改进自7E徽章设计的变色斗篷，这款斗篷能呈现两种颜色，满足你所有的时尚需求。它还配备了隔热层，因此也能当作毯子使用。\n与面部彩绘互动可进行染色和更改样式。可附着在制服上。激活它以切换兜帽状态。"
	icon_state = "cape"
	slot = ATTACHMENT_SLOT_CAPE
	attachment_layer = CAPE_LAYER
	prefered_slot = SLOT_W_UNIFORM
	greyscale_config = /datum/greyscale_config/cape
	attach_features_flags = ATTACH_REMOVABLE|ATTACH_SAME_ICON|ATTACH_APPLY_ON_MOB|ATTACH_ACTIVATION|ATTACH_NO_HANDS
	attach_delay = 0 SECONDS
	detach_delay = 0 SECONDS
	secondary_color = TRUE
	attachments_by_slot = list(ATTACHMENT_SLOT_CAPE_HIGHLIGHT)
	starting_attachments = list(/obj/item/armor_module/armor/cape_highlight)
	attachments_allowed = list(
		/obj/item/armor_module/armor/cape_highlight,
		/obj/item/armor_module/armor/cape_highlight/kama,
	)
	colorable_allowed = PRESET_COLORS_ALLOWED|ICON_STATE_VARIANTS_ALLOWED
	current_variant = "normal"
	icon_state_variants = list(
		"scarf round" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list("none"),
		),
		"scarf tied" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list("none"),
		),
		"scarf" = list(
			HOOD = TRUE,
			HIGHLIGHT_VARIANTS = list(
				"scarf",
				"none",
			),
		),
		"striped" = list(
			HOOD = TRUE,
			HIGHLIGHT_VARIANTS = list("none"),
		),
		"geist" = list(
			HOOD = TRUE,
			HIGHLIGHT_VARIANTS = list("none"),
		),
		"ghille" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list("none"),
		),
		"ghille (left)" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list("none"),
		),
		"ghille (right)" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list("none"),
		),
		"ghille (alt)" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list("none"),
		),
		"drifter" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list("none"),
		),
		"normal" = list(
			HOOD = TRUE,
			HIGHLIGHT_VARIANTS = list(
				"normal",
				"normal (alt)",
				"none",
			),
		),
		"short" = list(
			HOOD = TRUE,
			HIGHLIGHT_VARIANTS = list(
				"short",
				"none",
			),
		),
		"short (old)" = list(
			HOOD = TRUE,
			HIGHLIGHT_VARIANTS = list("none"),
		),
		"shredded" = list(
			HOOD = TRUE,
			HIGHLIGHT_VARIANTS = list(
				"shredded",
				"none",
			),
		),
		"half" = list(
			HOOD = TRUE,
			HIGHLIGHT_VARIANTS = list(
				"half",
				"none",
			),
		),
		"full" = list(
			HOOD = TRUE,
			HIGHLIGHT_VARIANTS = list(
				"full",
				"none",
			),
		),
		"back" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list(
				"back",
				"none",
			),
		),
		"cover" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list(
				"cover",
				"none",
			),
		),
		"cover (alt)" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list(
				"cover (alt)",
				"none",
			),
		),
		"shoal" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list(
				"shoal",
				"none",
			),
		),
		"shoal (back)" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list(
				"shoal (back)",
				"none",
			),
		),
		"shoal (alt)" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list(
				"shoal (alt)",
				"none",
			),
		),
		"rapier (right)" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list(
				"rapier (right)",
				"none",
			),
		),
		"rapier (left)" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list(
				"rapier (left)",
				"none",
			),
		),
	)

	///True if the hood is up, false if not.
	var/hood = FALSE

/obj/item/armor_module/armor/cape/update_icon_state()
	. = ..()
	var/obj/item/armor_module/highlight = attachments_by_slot[ATTACHMENT_SLOT_CAPE_HIGHLIGHT]
	if(hood)
		icon_state = initial(icon_state) + "_[current_variant]_h"
		worn_icon_state = initial(worn_icon_state) + "_[current_variant]_h"
	else
		icon_state = initial(icon_state) + "_[current_variant]"
		worn_icon_state = initial(worn_icon_state) + "_[current_variant]"
	highlight?.update_icon()
	if(parent)
		parent.update_clothing_icon()

/obj/item/armor_module/armor/cape/activate(mob/living/user)
	. = ..()
	hood = !hood
	update_icon()
	update_greyscale()
	user.update_inv_w_uniform()


/obj/item/armor_module/armor/cape/color_item(obj/item/facepaint/paint, mob/user)
	var/old_variant = current_variant
	. = ..()
	if(old_variant == current_variant)
		return
	if(parent)
		UnregisterSignal(parent, COMSIG_ITEM_EQUIPPED)
	icon_state_variants[current_variant][HOOD] ? ENABLE_BITFIELD(attach_features_flags, ATTACH_ACTIVATION) : DISABLE_BITFIELD(attach_features_flags, ATTACH_ACTIVATION)
	if(CHECK_BITFIELD(attach_features_flags, ATTACH_ACTIVATION) && parent)
		RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(handle_actions))
	var/obj/item/armor_module/highlight = attachments_by_slot[ATTACHMENT_SLOT_CAPE_HIGHLIGHT]
	if(!icon_state_variants[current_variant][HOOD])
		hood = FALSE
		highlight?.icon_state = initial(highlight.icon_state) + "_[highlight.current_variant]"
		if(ishuman(parent?.loc))
			LAZYREMOVE(actions_types, /datum/action/item_action/toggle)
			var/datum/action/item_action/toggle/old_action = locate(/datum/action/item_action/toggle) in actions
			old_action?.remove_action(user)
			actions = null
	if(!icon_state_variants[old_variant][HOOD] && icon_state_variants[current_variant][HOOD] && ishuman(parent?.loc))
		LAZYADD(actions_types, /datum/action/item_action/toggle)
		var/datum/action/item_action/toggle/new_action = new(src)
		if(toggle_signal)
			new_action.keybinding_signals = list(KEYBINDING_NORMAL = toggle_signal)
		new_action.give_action(user)
	highlight.current_variant = length(icon_state_variants[current_variant][HIGHLIGHT_VARIANTS]) ? icon_state_variants[current_variant][HIGHLIGHT_VARIANTS][1] : "none"
	highlight.icon_state_variants = icon_state_variants[current_variant][HIGHLIGHT_VARIANTS]
	ENABLE_BITFIELD(highlight.colorable_allowed, PRESET_COLORS_ALLOWED)
	update_icon()
	update_greyscale()
	highlight.update_icon()
	highlight.update_greyscale()
	user.update_inv_w_uniform()

/obj/item/armor_module/armor/cape/kama
	name = "\improper 6E变色龙袈裟"
	desc = "一款改进7E徽章设计的彩色腰布，这款腰布能呈现两种颜色，满足你所有的时尚需求。悬挂于腰带上，用于装饰下半身。\n与面部彩绘互动可改变颜色。可附着在制服上。"
	slot = ATTACHMENT_SLOT_KAMA
	attachment_layer = KAMA_LAYER
	attach_features_flags = ATTACH_REMOVABLE|ATTACH_SAME_ICON|ATTACH_APPLY_ON_MOB|ATTACH_NO_HANDS
	starting_attachments = list(/obj/item/armor_module/armor/cape_highlight/kama)
	greyscale_config = /datum/greyscale_config/cape
	icon_state_variants = list(
		"kama" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list(
				"kama",
			),
		),
		"kilt" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list(
				"kilt",
			),
		),
		"kilt (alt)" = list(
			HOOD = FALSE,
			HIGHLIGHT_VARIANTS = list(
				"kilt",
			),
		),
	)
	current_variant = "kama"


/obj/item/armor_module/armor/cape_highlight
	name = "披风高亮"
	desc = "对7E徽章设计的改进款披风，这款披风拥有六种颜色，满足你所有的时尚需求。这款披风变体更像是一条围巾。\n与面部迷彩互动可改变颜色。可附着在制服上。激活以切换兜帽状态。"
	icon_state = "highlight"
	slot = ATTACHMENT_SLOT_CAPE_HIGHLIGHT
	attach_features_flags = ATTACH_SAME_ICON|ATTACH_APPLY_ON_MOB|ATTACH_NO_HANDS
	colorable_allowed = PRESET_COLORS_ALLOWED|ICON_STATE_VARIANTS_ALLOWED|COLOR_WHEEL_ALLOWED
	greyscale_config = /datum/greyscale_config/cape_highlight
	secondary_color = TRUE
	greyscale_colors = VISOR_PALETTE_GOLD
	item_map_variant_flags = NONE
	colorable_colors = VISOR_PALETTES_LIST
	current_variant = "none"
	icon_state_variants = list(
		"none",
		"normal",
		"normal (alt)",
	)

/obj/item/armor_module/armor/cape_highlight/update_icon_state()
	. = ..()
	if(!parent)
		return
	var/obj/item/armor_module/armor/cape/cape_parent = parent
	if(cape_parent.hood)
		icon_state = initial(icon_state) + "_[current_variant]_h"
	else
		icon_state = initial(icon_state) + "_[current_variant]"


/obj/item/armor_module/armor/cape_highlight/handle_color(datum/source, mob/user, list/obj/item/secondaries)
	if(current_variant == "none" && (length(icon_state_variants) == 1))
		return
	return ..()



/obj/item/armor_module/armor/cape_highlight/kama
	greyscale_config = /datum/greyscale_config/cape_highlight
	colorable_allowed = PRESET_COLORS_ALLOWED
	current_variant = "kama"
	icon_state_variants = list()
