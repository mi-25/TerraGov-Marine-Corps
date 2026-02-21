/**
	Modular armor

	Modular armor consists of a a suit and helmet.
	The suit is able to have a storage, module, and 3x armor attachments (chest, arms, and legs)
	Helmets only have a single module slot.

	Suits have a single action, which is to toggle the flashlight.
	Helmets have diffrnet actions based on what module you have installed.

*/
/obj/item/clothing/suit/modular
	name = "\improper 耶格尔XM-02战斗外骨骼"
	desc = "专为搭载多种模块化装甲组件和支援系统而设计。它预装了轻型装甲板和肩灯。点击框架并选择组件来安装装甲部件。使用Alt+点击移除任何已安装的附件。"
	icon = 'icons/mob/modular/modular_armor.dmi'
	icon_state = "underarmor"
	worn_icon_state = "underarmor"
	item_state_worn = TRUE
	worn_icon_list = list(slot_wear_suit_str = 'icons/mob/modular/modular_armor.dmi')

	atom_flags = CONDUCT
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	item_flags = SYNTH_RESTRICTED|IMPEDE_JETPACK
	/// What is allowed to be equipped in suit storage
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/instrument,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/weapon/sword,
		/obj/item/storage/holster/belt,
		/obj/item/storage/belt/knifepouch,
		/obj/item/weapon/twohanded,
		/obj/item/tool/pickaxe/plasmacutter,
		/obj/item/tool/shovel/etool,
		/obj/item/weapon/energy/sword,
	)
	equip_slot_flags = ITEM_SLOT_OCLOTHING
	w_class = WEIGHT_CLASS_BULKY
	equip_delay_self = 2 SECONDS
	unequip_delay_self = 1 SECONDS

	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
	siemens_coefficient = 0.9
	permeability_coefficient = 1
	gas_transfer_coefficient = 1

	actions_types = list(/datum/action/item_action/toggle/suit_toggle/light)

	attachments_by_slot = list(
		ATTACHMENT_SLOT_CHESTPLATE,
		ATTACHMENT_SLOT_SHOULDER,
		ATTACHMENT_SLOT_KNEE,
		ATTACHMENT_SLOT_MODULE,
		ATTACHMENT_SLOT_STORAGE,
		ATTACHMENT_SLOT_BADGE,
		ATTACHMENT_SLOT_BELT,
	)
	attachments_allowed = list(
		/obj/item/armor_module/armor/chest/marine,
		/obj/item/armor_module/armor/legs/marine,
		/obj/item/armor_module/armor/arms/marine,

		/obj/item/armor_module/armor/chest/marine/skirmisher,
		/obj/item/armor_module/armor/legs/marine/skirmisher,
		/obj/item/armor_module/armor/arms/marine/skirmisher,

		/obj/item/armor_module/armor/chest/marine/skirmisher/scout,
		/obj/item/armor_module/armor/legs/marine/scout,
		/obj/item/armor_module/armor/arms/marine/scout,

		/obj/item/armor_module/armor/chest/marine/skirmisher/trooper,
		/obj/item/armor_module/armor/legs/marine/trooper,
		/obj/item/armor_module/armor/arms/marine/trooper,

		/obj/item/armor_module/armor/chest/marine/assault,
		/obj/item/armor_module/armor/legs/marine/assault,
		/obj/item/armor_module/armor/arms/marine/assault,

		/obj/item/armor_module/armor/chest/marine/eva,
		/obj/item/armor_module/armor/legs/marine/eva,
		/obj/item/armor_module/armor/arms/marine/eva,

		/obj/item/armor_module/armor/chest/marine/assault/eod,
		/obj/item/armor_module/armor/legs/marine/eod,
		/obj/item/armor_module/armor/arms/marine/eod,

		/obj/item/armor_module/armor/chest/marine/helljumper,
		/obj/item/armor_module/armor/legs/marine/helljumper,
		/obj/item/armor_module/armor/arms/marine/helljumper,

		/obj/item/armor_module/armor/chest/marine/ranger,
		/obj/item/armor_module/armor/legs/marine/ranger,
		/obj/item/armor_module/armor/arms/marine/ranger,

		/obj/item/armor_module/armor/chest/marine/mjolnir,
		/obj/item/armor_module/armor/legs/marine/mjolnir,
		/obj/item/armor_module/armor/arms/marine/mjolnir,

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
	)
	light_range = 5

	///Uniform type that is allowed to be worn with this.
	var/allowed_uniform_type = /obj/item/clothing/under/marine

/obj/item/clothing/suit/modular/apply_custom(mutable_appearance/standing, inhands, icon_used, state_used)
	if(inhands)
		return
	. = ..()
	if(!attachments_by_slot[ATTACHMENT_SLOT_STORAGE] || !istype(attachments_by_slot[ATTACHMENT_SLOT_STORAGE], /obj/item/armor_module/storage))
		return standing
	var/obj/item/armor_module/storage/storage_module = attachments_by_slot[ATTACHMENT_SLOT_STORAGE]
	if(!storage_module.show_storage)
		return standing
	for(var/obj/item/stored AS in storage_module.contents)
		standing.overlays += mutable_appearance(storage_module.show_storage_icon, icon_state = initial(stored.icon_state))
	return standing

/obj/item/clothing/suit/modular/mob_can_equip(mob/user, slot, warning = TRUE, override_nodrop = FALSE, bitslot = FALSE)
	if(slot == SLOT_WEAR_SUIT && ishuman(user))
		var/mob/living/carbon/human/H = user
		var/obj/item/clothing/under/undersuit = H.w_uniform
		if(!istype(undersuit, allowed_uniform_type))
			to_chat(user, span_warning("你必须穿着陆战队连体服才能装备此物品。"))
			return FALSE
	return ..()

/obj/item/clothing/suit/modular/attack_self(mob/user)
	. = ..()
	if(.)
		return
	if(!isturf(user.loc))
		to_chat(user, span_warning("你无法在[user.loc]中打开灯。"))
		return
	if(TIMER_COOLDOWN_RUNNING(src, COOLDOWN_ARMOR_LIGHT) || !ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.wear_suit != src)
		return
	if(turn_light(user, !light_on) == CHECKS_PASSED)
		return TRUE

/obj/item/clothing/suit/modular/item_action_slot_check(mob/user, slot)
	if(!light_range) // No light no ability
		return FALSE
	if(!ishuman(user))
		return FALSE
	if(slot != SLOT_WEAR_SUIT)
		return FALSE
	return TRUE //only give action button when armor is worn.

/obj/item/clothing/suit/modular/get_mechanics_info()
	. = ..()
	. += "<br><br />This is a piece of modular armor, It can equip different attachments.<br />"
	. += "<br>It currently has [attachments_by_slot[ATTACHMENT_SLOT_MODULE] ? "a" : "no" ] module installed.</br>"
	. += "<ul>"
	. += "<li>[attachments_by_slot[ATTACHMENT_SLOT_MODULE]]</li>"
	. += "</ul>"

	if(attachments_by_slot[ATTACHMENT_SLOT_CHESTPLATE])
		. += "<br> It has a [attachments_by_slot[ATTACHMENT_SLOT_CHESTPLATE]] installed."
	if(attachments_by_slot[ATTACHMENT_SLOT_SHOULDER])
		. += "<br> It has a [attachments_by_slot[ATTACHMENT_SLOT_SHOULDER]] installed."
	if(attachments_by_slot[ATTACHMENT_SLOT_KNEE])
		. += "<br> It has a [attachments_by_slot[ATTACHMENT_SLOT_KNEE]] installed."
	if(attachments_by_slot[ATTACHMENT_SLOT_STORAGE])
		. += "<br> It has a [attachments_by_slot[ATTACHMENT_SLOT_STORAGE]] installed."

/obj/item/clothing/suit/modular/examine(mob/user)
	. = ..()
	var/armor_info
	var/obj/item/clothing/suit/modular/wear_modular_suit = src
	if(wear_modular_suit.attachments_by_slot[ATTACHMENT_SLOT_CHESTPLATE])
		armor_info += "	- [wear_modular_suit.attachments_by_slot[ATTACHMENT_SLOT_CHESTPLATE]].\n"
	if(wear_modular_suit.attachments_by_slot[ATTACHMENT_SLOT_SHOULDER])
		armor_info += "	- [wear_modular_suit.attachments_by_slot[ATTACHMENT_SLOT_SHOULDER]].\n"
	if(wear_modular_suit.attachments_by_slot[ATTACHMENT_SLOT_KNEE])
		armor_info += "	- [wear_modular_suit.attachments_by_slot[ATTACHMENT_SLOT_KNEE]].\n"
	if(wear_modular_suit.attachments_by_slot[ATTACHMENT_SLOT_STORAGE])
		armor_info += "	- [wear_modular_suit.attachments_by_slot[ATTACHMENT_SLOT_STORAGE]].\n"
	if(wear_modular_suit.attachments_by_slot[ATTACHMENT_SLOT_MODULE])
		armor_info += "	- [wear_modular_suit.attachments_by_slot[ATTACHMENT_SLOT_MODULE]].\n"
	if(armor_info)
		. += "	It has the following attachments:"
		. += armor_info

/obj/item/clothing/suit/modular/rownin
	name = "\improper 罗宁骨架"
	desc = "轻型护甲，如果你还能这么称呼它的话，专为追求机动性而牺牲防护的陆战队员设计。Alt+点击可移除附件物品。使用它来开关内置手电筒。"
	icon_state = "rownin_skeleton"
	worn_icon_state = "rownin_skeleton"
	allowed_uniform_type = /obj/item/clothing/under
	attachments_allowed = list(
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
	)

/obj/item/clothing/suit/modular/rownin/erp
	name = "\improper ERP 骷髅"
	desc = "改良版的罗宁骨架，提供更出色、更有趣且更易恶作剧的设计。哦，还有改进的装甲，不过这部分没那么重要。Alt+左键点击可移除已安装的物品。使用它来切换内置手电筒。"
	soft_armor = MARINE_ARMOR_MEDIUM
	slowdown = SLOWDOWN_ARMOR_MEDIUM

	allowed_uniform_type = /obj/item/clothing/under/rank/clown/erp

/obj/item/clothing/suit/modular/hardsuit_exoskeleton
	name = "\improper 弗莱克特克斯 WY-01 模块化外骨骼"
	desc = "弗莱克特克斯动力公司全新推出的模块化硬质外骨骼，专为与猎手机甲模块完全兼容而设计。配备预装轻型装甲板和肩部照明灯。通过点击框架与组件来安装装甲部件。使用Alt+点击可移除任何已安装的附件。"
	icon_state = "exoskeleton"
	worn_icon_state = "exoskeleton"
	greyscale_config = /datum/greyscale_config/exoskeleton
	colorable_allowed = PRESET_COLORS_ALLOWED
	colorable_colors = LEGACY_ARMOR_PALETTES_LIST
	greyscale_colors = ARMOR_PALETTE_BLACK
	allowed_uniform_type = /obj/item/clothing/under
	attachments_allowed = list(

		/obj/item/armor_module/armor/chest/marine/hardsuit/syndicate_markfive,
		/obj/item/armor_module/armor/arms/marine/hardsuit_arms/syndicate_markfive,
		/obj/item/armor_module/armor/legs/marine/hardsuit_legs/syndicate_markfive,

		/obj/item/armor_module/armor/chest/marine/hardsuit/syndicate_markthree,
		/obj/item/armor_module/armor/arms/marine/hardsuit_arms/syndicate_markthree,
		/obj/item/armor_module/armor/legs/marine/hardsuit_legs/syndicate_markthree,

		/obj/item/armor_module/armor/chest/marine/hardsuit/syndicate_markone,
		/obj/item/armor_module/armor/arms/marine/hardsuit_arms/syndicate_markone,
		/obj/item/armor_module/armor/legs/marine/hardsuit_legs/syndicate_markone,

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
	)

/obj/item/clothing/suit/modular/vsd_exoskeleton
	name = "\improper 坠毁核心 MT/P 模块化外骨骼"
	desc = "CrashCore工业模块化硬质外骨骼，用于支撑'超重型'装甲系统，并设计为与'猎兵'模块完全兼容。附带预装的轻型装甲板和肩灯。通过点击框架并选择组件来安装装甲部件。使用Alt+点击移除任何已安装的物品。"
	icon_state = "exoskeleton"
	worn_icon_state = "exoskeleton"
	greyscale_config = /datum/greyscale_config/vsd_hardsuit/exoskeleton
	colorable_allowed = PRESET_COLORS_ALLOWED
	colorable_colors = ARMOR_PALETTES_LIST
	greyscale_colors = ARMOR_PALETTE_BLACK
	allowed_uniform_type = /obj/item/clothing/under
	attachments_allowed = list(

		/obj/item/armor_module/armor/chest/marine/vsd_hardsuit,
		/obj/item/armor_module/armor/arms/marine/vsd_hardsuit,
		/obj/item/armor_module/armor/legs/marine/vsd_hardsuit,

		/obj/item/armor_module/armor/chest/marine/vsd_hardsuit/clementia,
		/obj/item/armor_module/armor/arms/marine/vsd_hardsuit/clementia,
		/obj/item/armor_module/armor/legs/marine/vsd_hardsuit/clementia,

		/obj/item/armor_module/armor/chest/marine/vsd_hardsuit/hephaestus,
		/obj/item/armor_module/armor/arms/marine/vsd_hardsuit/hephaestus,
		/obj/item/armor_module/armor/legs/marine/vsd_hardsuit/hephaestus,

		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/module/valkyrie_autodoc,
		/obj/item/armor_module/module/fire_proof,
		/obj/item/armor_module/module/mimir_environment_protection,
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
		/obj/item/armor_module/module/hlin_explosive_armor,
		/obj/item/armor_module/module/ballistic_armor,
		/obj/item/armor_module/module/chemsystem,
		/obj/item/armor_module/module/eshield,
		/obj/item/armor_module/module/mirage,
		/obj/item/armor_module/module/armorlock,

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
	)

/** Core helmet module */
/obj/item/clothing/head/modular
	name = "耶格尔式头盔"
	desc = "通常与耶格尔战斗外骨骼搭配使用。可在头盔硬点上安装实用功能模块。"
	icon_state = "helm"
	worn_icon_state = "helm"
	item_state_worn = TRUE

	greyscale_config = /datum/greyscale_config/armor_mk1
	greyscale_colors = ARMOR_PALETTE_BLACK

	armor_protection_flags = HEAD
	armor_features_flags = ARMOR_NO_DECAP
	inventory_flags = BLOCKSHARPOBJ
	inv_hide_flags = HIDEEARS|HIDE_EXCESS_HAIR
	allowed = null
	equip_slot_flags = ITEM_SLOT_HEAD
	w_class = WEIGHT_CLASS_NORMAL

	soft_armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 15, BIO = 15, FIRE = 15, ACID = 15)

	attachments_by_slot = list(
		ATTACHMENT_SLOT_VISOR,
		ATTACHMENT_SLOT_STORAGE,
		ATTACHMENT_SLOT_HEAD_MODULE,
		ATTACHMENT_SLOT_BADGE,
	)
	attachments_allowed = list(
		/obj/item/armor_module/module/tyr_head,
		/obj/item/armor_module/module/fire_proof_helmet,
		/obj/item/armor_module/module/mimir_environment_protection/mimir_helmet,
		/obj/item/armor_module/module/mimir_environment_protection/mimir_helmet/mark1,
		/obj/item/armor_module/module/welding,
		/obj/item/armor_module/module/welding/superior,
		/obj/item/armor_module/module/binoculars,
		/obj/item/armor_module/module/binoculars/artemis_mark_two,
		/obj/item/armor_module/module/artemis,
		/obj/item/armor_module/module/antenna,
		/obj/item/armor_module/module/night_vision,
		/obj/item/armor_module/storage/helmet,
		/obj/item/armor_module/armor/badge,
	)



	colorable_colors = LEGACY_ARMOR_PALETTES_LIST
	colorable_allowed = PRESET_COLORS_ALLOWED

	///Pixel offset on the X axis for how the helmet sits on the mob without a visor.
	var/visorless_offset_x = 0
	///Pixel offset on the Y axis for how the helmet sits on the mob without a visor.
	var/visorless_offset_y = -1

/obj/item/clothing/head/modular/apply_custom(mutable_appearance/standing, inhands, icon_used, state_used)
	if(inhands)
		return
	. = ..()
	if(attachments_by_slot[ATTACHMENT_SLOT_STORAGE] && istype(attachments_by_slot[ATTACHMENT_SLOT_STORAGE], /obj/item/armor_module/storage))
		var/obj/item/armor_module/storage/storage_module = attachments_by_slot[ATTACHMENT_SLOT_STORAGE]
		if(storage_module.show_storage)
			for(var/obj/item/stored AS in storage_module.contents)
				if(istype(stored, /obj/item/ammo_magazine/handful))
					standing.overlays += mutable_appearance(storage_module.show_storage_icon, icon_state = stored.icon_state, layer = COLLAR_LAYER)
				else
					standing.overlays += mutable_appearance(storage_module.show_storage_icon, icon_state = initial(stored.icon_state), layer = COLLAR_LAYER)
	if(attachments_by_slot[ATTACHMENT_SLOT_VISOR])
		return standing
	standing.pixel_x = visorless_offset_x
	standing.pixel_y = visorless_offset_y
	return standing

/obj/item/clothing/head/modular/update_icon(updates)
	. = ..()
	update_clothing_icon()

/obj/item/clothing/head/modular/get_mechanics_info()
	. = ..()
	. += "<br><br />This is a piece of modular armor, It can equip different attachments.<br />"
	. += "<br>It currently has [attachments_by_slot[ATTACHMENT_SLOT_HEAD_MODULE] ? attachments_by_slot[ATTACHMENT_SLOT_HEAD_MODULE] : "nothing"] installed."

/obj/item/clothing/head/modular/examine(mob/user)
	. = ..()
	var/armor_info
	var/obj/item/clothing/head/modular/wear_modular_suit = src
	if(wear_modular_suit.attachments_by_slot[ATTACHMENT_SLOT_HEAD_MODULE])
		armor_info += "	- [wear_modular_suit.attachments_by_slot[ATTACHMENT_SLOT_HEAD_MODULE]].\n"
	if(armor_info)
		. += "	It has the following attachments:"
		. += armor_info

/** Colorable masks */
/obj/item/clothing/mask/gas/modular
	name = "样式面具"
	desc = "一个酷炫时尚的面具，通过某种神秘魔法阻挡气体攻击。怎么做到的？谁知道呢。你到底是怎么搞到这玩意的？"
	breathy = FALSE
	icon_state = "gas_alt"
	worn_icon_state = "gas_alt"
	worn_icon_list = list(slot_wear_mask_str)
	item_state_worn = TRUE
	greyscale_colors = ARMOR_PALETTE_BLACK

	colorable_colors = LEGACY_ARMOR_PALETTES_LIST
	colorable_allowed = PRESET_COLORS_ALLOWED


