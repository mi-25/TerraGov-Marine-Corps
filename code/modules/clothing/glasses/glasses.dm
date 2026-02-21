
/obj/item/clothing/glasses
	name = "护目镜"
	icon = 'icons/obj/clothing/glasses.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/clothing/glasses_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/clothing/glasses_right.dmi',
	)
	w_class = WEIGHT_CLASS_SMALL
	var/prescription = FALSE
	var/toggleable = FALSE
	active = TRUE
	inventory_flags = COVEREYES
	equip_slot_flags = ITEM_SLOT_EYES
	armor_protection_flags = EYES
	var/deactive_state = "degoggles"
	var/vision_flags = NONE
	var/invis_view = SEE_INVISIBLE_LIVING
	var/invis_override = 0 //Override to allow glasses to set higher than normal see_invis
	/// A percentage of how much rgb to "max" on the lighting plane
	/// This lets us brighten darkness without washing out bright color
	var/lighting_cutoff = null
	/// Similar to lighting_cutoff, except it has individual r g and b components in the same 0-100 scale
	var/list/color_cutoffs = null
	var/goggles = FALSE
	///Sound played on activate() when turning on
	var/activation_sound = 'sound/items/googles_on.ogg'
	///Sound played on activate() when turning off
	var/deactivation_sound = 'sound/items/googles_off.ogg'
	///Color to use for the HUD tint; leave null if no tint
	var/tint

/obj/item/clothing/glasses/examine_descriptor(mob/user)
	return "eyewear"

/obj/item/clothing/glasses/examine_tags(mob/user)
	. = ..()
	if(prescription)
		.["prescription"] = "It will help reduce symptoms of nearsightedness when worn."

/obj/item/clothing/glasses/Initialize(mapload)
	. = ..()
	if(active && toggleable)	//For glasses that spawn active
		active = FALSE
		activate()

/obj/item/clothing/glasses/update_icon_state()
	. = ..()
	icon_state = active ? initial(icon_state) : deactive_state

/obj/item/clothing/glasses/update_clothing_icon()
	if (ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_glasses()

//Glasses can still be toggled if held in the hand if the player wishes to
/obj/item/clothing/glasses/attack_self(mob/user)
	if(can_interact(user))
		activate(user)

//Just call the activate() directly instead of needing to call attack_self()
/obj/item/clothing/glasses/ui_action_click(mob/user, datum/action/item_action/action)
	//In case someone in the future adds a non-toggle action to a child type
	if(istype(action, /datum/action/item_action/toggle))
		activate(user)
		//Always return TRUE for toggles so that the UI button icon updates
		return TRUE

	return activate(user)

///Toggle the functions of the glasses
/obj/item/clothing/glasses/proc/activate(mob/user)
	SIGNAL_HANDLER
	if(!toggleable)
		return
	active = !active

	if(active && activation_sound)
		playsound(get_turf(src), activation_sound, 15)
	else if(!active && deactivation_sound)
		playsound(get_turf(src), deactivation_sound, 15)

	update_icon()	//Found out the hard way this has to be before update_inv_glasses()
	user?.update_inv_glasses()
	user?.update_sight()

	return active	//For the UI button update

/obj/item/clothing/glasses/science
	name = "科研护目镜"
	desc = "这护目镜毫无用处！可用作安全护目镜。"
	icon_state = "purple"
	worn_icon_state = "glasses"

/obj/item/clothing/glasses/eyepatch
	name = "眼罩"
	desc = "哟呵。"
	icon_state = "eyepatch"
	worn_icon_state = "eyepatch"
	armor_protection_flags = NONE

/obj/item/clothing/glasses/eyepatch/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/clothing/glasses/hud/health))
		var/obj/item/clothing/glasses/hud/medpatch/P = new
		to_chat(user, span_notice("你将医疗HUD投影仪固定在眼罩内侧。"))
		qdel(I)
		qdel(src)
		user.put_in_hands(P)
	else if(istype(I, /obj/item/clothing/glasses/meson))
		var/obj/item/clothing/glasses/meson/eyepatch/P = new
		to_chat(user, span_notice("你将介子投影仪固定在眼罩内侧。"))
		qdel(I)
		qdel(src)
		user.put_in_hands(P)

		update_icon()


/obj/item/clothing/glasses/monocle
	name = "单片眼镜"
	desc = "多么时髦的单片眼镜！"
	icon_state = "monocle"
	armor_protection_flags = NONE

/obj/item/clothing/glasses/material
	name = "光学材料扫描仪"
	desc = "非常令人困惑的眼镜。"
	icon_state = "material"
	worn_icon_state = "glasses"
	actions_types = list(/datum/action/item_action/toggle)
	toggleable = 1
	vision_flags = SEE_OBJS

/obj/item/clothing/glasses/regular
	name = "\improper 标准处方眼镜"
	desc = "军方可能称它们为制式处方眼镜，但你心里清楚——这就是防呆眼镜。"
	icon_state = "glasses"
	worn_icon_state = "glasses"
	prescription = TRUE

/obj/item/clothing/glasses/regular/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/clothing/glasses/hud/health))
		var/obj/item/clothing/glasses/hud/medglasses/P = new
		to_chat(user, span_notice("你将医疗HUD投影仪固定在了眼镜内侧。"))
		qdel(I)
		qdel(src)
		user.put_in_hands(P)

		update_icon()

/obj/item/clothing/glasses/regular/hipster
	name = "处方眼镜"
	desc = "由 Uncool. Co. 制作。"
	icon_state = "hipster_glasses"
	worn_icon_state = "hipster_glasses"

/obj/item/clothing/glasses/threedglasses
	desc = "很久以前，人们用这种眼镜让屏幕上的图像呈现三维效果。"
	name = "3D眼镜"
	icon_state = "3d"
	worn_icon_state = "3d"
	armor_protection_flags = NONE

/obj/item/clothing/glasses/gglasses
	name = "绿色护目镜"
	desc = "森林绿眼镜，就像策划阴谋诡计时会戴的那种。"
	icon_state = "gglasses"
	worn_icon_state = "gglasses"
	armor_protection_flags = NONE

/obj/item/clothing/glasses/mgoggles
	name = "陆战队弹道护目镜"
	desc = "标准配发的TGMC护目镜。主要用于装饰头盔。"
	icon_state = "mgoggles"
	worn_icon_state = "mgoggles"
	soft_armor = list(MELEE = 40, BULLET = 40, LASER = 0, ENERGY = 15, BOMB = 35, BIO = 10, FIRE = 30, ACID = 30)
	equip_slot_flags = ITEM_SLOT_EYES|ITEM_SLOT_MASK
	goggles = TRUE
	w_class = WEIGHT_CLASS_TINY


/obj/item/clothing/glasses/mgoggles/prescription
	name = "处方陆战队防弹护目镜"
	desc = "标准配发的TGMC护目镜。主要用于装饰头盔。内含处方镜片，以防你不确定它们是否很逊。"
	prescription = TRUE

/obj/item/clothing/glasses/mgoggles/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/clothing/glasses/hud/health))
		if(prescription)
			var/obj/item/clothing/glasses/hud/medgoggles/prescription/P = new
			to_chat(user, span_notice("你将医疗HUD投影仪固定在护目镜内侧。"))
			qdel(I)
			qdel(src)
			user.put_in_hands(P)
		else
			var/obj/item/clothing/glasses/hud/medgoggles/S = new
			to_chat(user, span_notice("你将医疗HUD投影仪固定在护目镜内侧。"))
			qdel(I)
			qdel(src)
			user.put_in_hands(S)
	else if(istype(I, /obj/item/clothing/glasses/meson))
		if(prescription)
			var/obj/item/clothing/glasses/meson/enggoggles/prescription/P = new
			to_chat(user, span_notice("你将光学介子扫描仪固定在护目镜内侧。"))
			qdel(I)
			qdel(src)
			user.put_in_hands(P)
		else
			var/obj/item/clothing/glasses/meson/enggoggles/S = new
			to_chat(user, span_notice("你将光学介子扫描仪固定在护目镜内侧。"))
			qdel(I)
			qdel(src)
			user.put_in_hands(S)

		update_icon()

/obj/item/clothing/glasses/m42_goggles
	name = "\improper M42侦察瞄准镜"
	desc = "M42侦察步枪用头戴式耳机与护目镜系统。可高亮显示周围环境影像。点击切换。"
	icon = 'icons/obj/clothing/glasses.dmi'
	icon_state = "m56_goggles"
	deactive_state = "m56_goggles_0"
	vision_flags = SEE_TURFS
	toggleable = 1
	actions_types = list(/datum/action/item_action/toggle)



//welding goggles

/obj/item/clothing/glasses/welding
	name = "焊接护目镜"
	desc = "保护眼睛免受焊接伤害，已获疯狂科学家协会认证。"
	icon_state = "welding-g"
	worn_icon_state = "welding-g"
	actions_types = list(/datum/action/item_action/toggle)
	inventory_flags = COVEREYES
	eye_protection = 2
	activation_sound = null
	deactivation_sound = null
	toggleable = TRUE

/obj/item/clothing/glasses/welding/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/clothing_tint, TINT_5, TRUE)

/obj/item/clothing/glasses/welding/verb/verbtoggle()
	set category = "IC.Object"
	set name = "Adjust welding goggles"
	set src in usr

	if(!usr.incapacitated())
		activate(usr)

/obj/item/clothing/glasses/welding/activate(mob/user)
	. = ..()
	if(active)
		flip_down(user)
	else
		flip_up(user)

	//This sends a signal that toggles the tint component's effects
	toggle_item_state(user)

///Toggle the welding goggles on
/obj/item/clothing/glasses/welding/proc/flip_up(mob/user)
	DISABLE_BITFIELD(inventory_flags, COVEREYES)
	DISABLE_BITFIELD(armor_protection_flags, EYES)
	eye_protection = 0
	update_icon()
	if(user)
		to_chat(user, "你将[src]从脸上推开。")

///Toggle the welding goggles off
/obj/item/clothing/glasses/welding/proc/flip_down(mob/user)
	ENABLE_BITFIELD(inventory_flags, COVEREYES)
	ENABLE_BITFIELD(armor_protection_flags, EYES)
	eye_protection = initial(eye_protection)
	update_icon()
	if(user)
		to_chat(user, "你将[src]翻下以保护眼睛。")

/obj/item/clothing/glasses/welding/update_icon_state()
	icon_state = "[initial(icon_state)][!active ? "up" : ""]"

/obj/item/clothing/glasses/welding/flipped/Initialize(mapload)	//spawn in flipped up.
	. = ..()
	activate()
	AddComponent(/datum/component/clothing_tint, TINT_5, FALSE)

/obj/item/clothing/glasses/welding/superior
	name = "高级焊接护目镜"
	desc = "采用更昂贵材料制成的焊接护目镜，奇怪的是闻起来有股土豆味。"
	icon_state = "rwelding-g"
	worn_icon_state = "rwelding-g"

/obj/item/clothing/glasses/welding/superior/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/clothing_tint, TINT_4)

//sunglasses

/obj/item/clothing/glasses/sunglasses
	desc = "采用古老技术制造的护目镜，能提供基础的眼部防护。增强型护光镜片可阻挡多种强光。"
	name = "太阳镜"
	icon_state = "sun"
	worn_icon_state = "sunglasses"
	eye_protection = 1

/obj/item/clothing/glasses/sunglasses/Initialize(mapload)
	. = ..()
	if(eye_protection)
		AddComponent(/datum/component/clothing_tint, TINT_3)

/obj/item/clothing/glasses/sunglasses/blindfold
	name = "眼罩"
	desc = "覆盖眼部，阻碍视线。"
	icon_state = "blindfold"
	worn_icon_state = "blindfold"
	eye_protection = 2

/obj/item/clothing/glasses/sunglasses/blindfold/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/clothing_tint, TINT_BLIND)

/obj/item/clothing/glasses/sunglasses/prescription
	name = "处方太阳镜"
	prescription = TRUE

/obj/item/clothing/glasses/sunglasses/big
	desc = "采用古老技术制造的护目镜，能提供基础的眼部防护。其增大的护盾能有效阻挡多数闪光。"
	icon_state = "bigsunglasses"
	worn_icon_state = "bigsunglasses"

/obj/item/clothing/glasses/sunglasses/big/prescription
	name = "处方太阳镜"
	prescription = TRUE

/obj/item/clothing/glasses/sunglasses/fake
	desc = "一副设计师太阳镜。看起来似乎无法阻挡闪光。"
	eye_protection = 0

/obj/item/clothing/glasses/sunglasses/fake/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/clothing/glasses/hud/health))
		var/obj/item/clothing/glasses/hud/medsunglasses/P = new
		to_chat(user, span_notice("你将医疗HUD投影仪固定在了眼镜内侧。"))
		qdel(I)
		qdel(src)
		user.put_in_hands(P)
	else if(istype(I, /obj/item/clothing/glasses/meson))
		var/obj/item/clothing/glasses/meson/sunglasses/P = new
		to_chat(user, span_notice("你将光学介子扫描仪固定在眼镜内侧。"))
		qdel(I)
		qdel(src)
		user.put_in_hands(P)
	else if(istype(I, /obj/item/clothing/glasses/night/m56_goggles))
		var/obj/item/clothing/glasses/night/sunglasses/P = new
		to_chat(user, span_notice("你将KTLD瞄准镜固定在眼镜内侧。"))
		qdel(I)
		qdel(src)
		user.put_in_hands(P)

		update_icon()

/obj/item/clothing/glasses/sunglasses/fake/prescription
	name = "处方太阳镜"
	prescription = TRUE

/obj/item/clothing/glasses/sunglasses/fake/big
	name = "大墨镜"
	desc = "一副比普通尺寸更大的设计师太阳镜。看起来似乎无法阻挡闪光。"
	icon_state = "bigsunglasses"
	worn_icon_state = "bigsunglasses"

/obj/item/clothing/glasses/sunglasses/fake/big/prescription
	name = "大号处方太阳镜"
	prescription = TRUE

/obj/item/clothing/glasses/sunglasses/sechud
	name = "抬头显示器太阳镜"
	desc = "带平视显示器的太阳镜。"
	icon_state = "sunhud"
	var/hud_type = DATA_HUD_SECURITY_ADVANCED

/obj/item/clothing/glasses/sunglasses/sechud/eyepiece
	name = "安全HUD视野"
	desc = "一款标准目镜，但经过改装，可向用户视觉显示安全信息。这使其在宪兵中颇为常见，尽管也存在其他型号。"
	icon_state = "securityhud"
	worn_icon_state = "securityhud"


/obj/item/clothing/glasses/sunglasses/sechud/equipped(mob/living/carbon/human/user, slot)
	if(slot == SLOT_GLASSES)
		var/datum/atom_hud/H = GLOB.huds[hud_type]
		H.add_hud_to(user)
	..()

/obj/item/clothing/glasses/sunglasses/sechud/dropped(mob/living/carbon/human/user)
	if(istype(user))
		if(src == user.glasses) //dropped is called before the inventory reference is updated.
			var/datum/atom_hud/H = GLOB.huds[hud_type]
			H.remove_hud_from(user)
	..()


/obj/item/clothing/glasses/sunglasses/sechud/tactical
	name = "战术HUD"
	desc = "内置战斗与安保信息的防闪光护目镜。"
	icon_state = "swatgoggles"

/obj/item/clothing/glasses/sunglasses/aviator
	name = "飞行员墨镜"
	desc = "一副飞行员墨镜。"
	icon_state = "aviator"
	worn_icon_state = "aviator"

/obj/item/clothing/glasses/sunglasses/aviator/yellow
	name = "飞行员墨镜"
	desc = "一副飞行员太阳镜。配有黄色镜片。"
	icon_state = "aviator_yellow"
	worn_icon_state = "aviator_yellow"

//todo rename this typepath so its not confused with glasses/night
/obj/item/clothing/glasses/night_vision
	name = "\improper BE-47 夜视镜"
	desc = "用于在低光条件下更清晰地观察并保持对周围环境的视野。"
	icon_state = "night_vision"
	deactive_state = "night_vision_off"
	worn_layer = COLLAR_LAYER	//The sprites are designed to render over helmets
	worn_item_state_slots = list()
	// Red with a tint of green
	color_cutoffs = list(40, 15, 10)
	vision_flags = SEE_TURFS
	toggleable = TRUE
	goggles = TRUE
	active = FALSE
	actions_types = list(/datum/action/item_action/toggle)
	activation_sound = 'sound/effects/nightvision.ogg'
	deactivation_sound = 'sound/machines/click.ogg'
	///The battery inside
	var/obj/item/cell/night_vision_battery/battery
	///How much energy this module needs when activated
	var/active_energy_cost = 4	//Little over 4 minutes of use
	///Looping sound to play
	var/datum/looping_sound/active_sound = /datum/looping_sound/scan_pulse
	///How loud the looping sound should be
	var/looping_sound_volume = 25

/obj/item/clothing/glasses/night_vision/Initialize(mapload)
	. = ..()
	//Start with a charged battery
	battery = new /obj/item/cell/night_vision_battery(src)
	active_sound = new active_sound()
	active_sound.volume = looping_sound_volume
	update_worn_state()

/obj/item/clothing/glasses/night_vision/examine(mob/user)
	. = ..()
	. += span_notice("This model drains [active_energy_cost] energy when active.")
	. += battery_status()
	. += "To eject the battery, [span_bold("[user.get_inactive_held_item() == src ? "click" : "ALT-click"]")] [src] with an empty hand. To insert a battery, [span_bold("click")] [src] with a compatible cell."

///Info regarding battery status; separate proc so that it can be displayed when examining the parent object
/obj/item/clothing/glasses/night_vision/proc/battery_status()
	if(battery)
		return span_notice("Battery: [battery.charge]/[battery.maxcharge]")
	return span_warning("No battery installed!")

/obj/item/clothing/glasses/night_vision/attack_hand(mob/living/user)
	if(user.get_inactive_held_item() == src && eject_battery(user))
		return
	return ..()

/obj/item/clothing/glasses/night_vision/AltClick(mob/user)
	if(!eject_battery(user))
		return ..()

/obj/item/clothing/glasses/night_vision/attackby(obj/item/I, mob/user, params)
	. = ..()
	insert_battery(I, user)

///Insert a battery, if checks pass
/obj/item/clothing/glasses/night_vision/proc/insert_battery(obj/item/I, mob/user)
	if(!istype(I, /obj/item/cell/night_vision_battery))
		return

	if(battery && (battery.charge > battery.maxcharge / 2))
		balloon_alert(user, "电池已安装！")
		return
	//Hot swap!
	eject_battery()

	user.temporarilyRemoveItemFromInventory(I)
	I.forceMove(src)
	battery = I
	return TRUE

///Eject the internal battery, if there is one
/obj/item/clothing/glasses/night_vision/proc/eject_battery(mob/user)
	if(user?.get_active_held_item() || !battery)
		return

	if(user)
		user.put_in_active_hand(battery)
	else
		battery.forceMove(get_turf(src))
	battery = null

	if(active)
		activate(user)

	return TRUE

/obj/item/clothing/glasses/night_vision/activate(mob/user)
	if(active)
		STOP_PROCESSING(SSobj, src)
		active_sound.stop(src)
	else
		if(!battery || battery.charge < active_energy_cost)
			if(user)
				balloon_alert(user, "没电了！")
			return FALSE	//Don't activate
		START_PROCESSING(SSobj, src)
		active_sound.start(src)

	update_worn_state(!active)	//The active var has not been toggled yet, so pass the opposite value
	return ..()

/obj/item/clothing/glasses/night_vision/process()
	if(!battery?.use(active_energy_cost))
		if(ismob(loc))	//If it's deactivated while being worn, pass on the reference to activate() so that the user's sight is updated
			activate(loc)
		else
			activate()
		return PROCESS_KILL

///Simple proc to update the worn state of the glasses; will use the active value by default if no argument passed
/obj/item/clothing/glasses/night_vision/proc/update_worn_state(state = active)
	worn_item_state_slots[slot_glasses_str] = initial(icon_state) + (state ? "" : "_off")

/obj/item/clothing/glasses/night_vision/unequipped(mob/unequipper, slot)
	. = ..()
	if(active)
		activate(unequipper)

/obj/item/clothing/glasses/night_vision/Destroy()
	QDEL_NULL(active_sound)
	return ..()

//So that the toggle button is only given when in the eyes slot
/obj/item/clothing/glasses/night_vision/item_action_slot_check(mob/user, slot)
	return CHECK_BITFIELD(slot, ITEM_SLOT_EYES)

/obj/item/clothing/glasses/night_vision/mounted
	name = "\improper BE-35 夜视护目镜"
	desc = "用于在低光条件下看得更清晰的护目镜。必须保持安装在头盔上。"
	icon_state = "night_vision_mounted"
	tint = COLOR_BLUE
	vision_flags = NONE
	active_energy_cost = 2	//A little over 7 minutes of use
	looping_sound_volume = 50

/obj/item/clothing/glasses/night_vision/mounted/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, NIGHT_VISION_GOGGLES_TRAIT)

