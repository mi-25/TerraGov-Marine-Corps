
//-------------------------------------------------------
//ENERGY GUNS/ETC

/obj/item/weapon/gun/energy
	icon = 'icons/obj/items/guns/energy.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/energy_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/energy_right_1.dmi',
	)
	attachable_allowed = list()
	rounds_per_shot = 10 //100 shots.
	gun_features_flags = GUN_AMMO_COUNTER|GUN_AMMO_COUNT_BY_SHOTS_REMAINING|GUN_NO_PITCH_SHIFT_NEAR_EMPTY
	general_codex_key = "energy weapons"

	placed_overlay_iconstate = "laser"
	reciever_flags = AMMO_RECIEVER_MAGAZINES|AMMO_RECIEVER_DO_NOT_EJECT_HANDFULS|AMMO_RECIEVER_CYCLE_ONLY_BEFORE_FIRE
	default_ammo_type = /obj/item/cell/lasgun
	allowed_ammo_types = list(/obj/item/cell/lasgun)
	muzzle_flash = null

/obj/item/weapon/gun/energy/get_current_rounds(obj/item/mag)
	var/obj/item/cell/lasgun/cell = mag
	return cell?.charge

/obj/item/weapon/gun/energy/adjust_current_rounds(obj/item/mag, new_rounds)
	var/obj/item/cell/lasgun/cell = mag
	cell?.charge += new_rounds

/obj/item/weapon/gun/energy/get_max_rounds(obj/item/mag)
	var/obj/item/cell/lasgun/cell = mag
	return cell?.maxcharge

/obj/item/weapon/gun/energy/get_magazine_default_ammo(obj/item/mag)
	return null

/obj/item/weapon/gun/energy/get_magazine_features_flags(obj/item/mag)
	var/obj/item/cell/lasgun/cell = mag
	return cell ? cell.magazine_features_flags : NONE
//based off of basegun proc, should work.
/obj/item/weapon/gun/energy/get_magazine_overlay(obj/item/mag)
	var/obj/item/cell/lasgun/cell = mag
	return cell?.bonus_overlay
//based off of basegun proc, should work.
/obj/item/weapon/gun/energy/get_magazine_reload_delay(obj/item/mag)
	var/obj/item/cell/lasgun/cell = mag
	return cell?.reload_delay

/obj/item/weapon/gun/energy/taser
	name = "电击枪"
	desc = "一种先进的电击装置，能够发射电离电球。用于非致命性制服。"
	icon_state = "taser"
	worn_icon_state = "taser"
	muzzle_flash = null //TO DO.
	fire_sound = 'sound/weapons/guns/fire/taser.ogg'
	ammo_datum_type = /datum/ammo/energy/taser
	default_ammo_type = /obj/item/cell/lasgun/lasrifle
	allowed_ammo_types = list(/obj/item/cell/lasgun/lasrifle)
	rounds_per_shot = 500
	gun_features_flags = GUN_AMMO_COUNTER|GUN_ALLOW_SYNTHETIC|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_AMMO_COUNT_BY_SHOTS_REMAINING
	gun_skill_category = SKILL_PISTOLS
	movement_acc_penalty_mult = 0


	fire_delay = 10
	accuracy_mult = 1.15
	scatter = 2
	scatter_unwielded = 1

/obj/item/weapon/gun/energy/taser/able_to_fire(mob/living/user)
	. = ..()
	if (!.)
		return
	if(user.skills.getRating(SKILL_POLICE) < SKILL_POLICE_MP)
		to_chat(user, span_warning("你似乎不知道如何使用[src]..."))
		return FALSE

//-------------------------------------------------------
//Lasguns

/obj/item/weapon/gun/energy/lasgun
	name = "\improper 激光枪"
	desc = "一款基于激光的枪械。使用能量电池。"
	reload_sound = 'sound/weapons/guns/interact/rifle_reload.ogg'
	fire_sound = 'sound/weapons/guns/fire/laser.ogg'
	load_method = CELL //codex
	ammo_datum_type = /datum/ammo/energy/lasgun
	equip_slot_flags = ITEM_SLOT_BACK
	muzzleflash_iconstate = "muzzle_flash_laser"
	w_class = WEIGHT_CLASS_BULKY
	force = 15
	overcharge = FALSE
	gun_features_flags = GUN_CAN_POINTBLANK|GUN_ENERGY|GUN_AMMO_COUNTER|GUN_AMMO_COUNT_BY_SHOTS_REMAINING|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_SHOWS_AMMO_REMAINING
	reciever_flags = AMMO_RECIEVER_MAGAZINES|AMMO_RECIEVER_AUTO_EJECT|AMMO_RECIEVER_DO_NOT_EJECT_HANDFULS|AMMO_RECIEVER_CYCLE_ONLY_BEFORE_FIRE
	aim_slowdown = 0.75
	wield_delay = 1.2 SECONDS
	gun_skill_category = SKILL_RIFLES
	muzzle_flash_color = COLOR_LASER_RED

	fire_delay = 3
	accuracy_mult = 1.1
	accuracy_mult_unwielded = 0.6
	scatter_unwielded = 80 //Heavy and unwieldy
	damage_falloff_mult = 0.5
	akimbo_scatter_mod = 8

/obj/item/weapon/gun/energy/lasgun/unique_action(mob/user, dont_operate = FALSE)
	QDEL_NULL(in_chamber)
	if(ammo_diff == null)
		to_chat(user, "[icon2html(src, user)] 你需要合适的镜片来启用过载模式。")
		return
	if(overcharge == FALSE)
		if(!length(chamber_items))
			playsound(user, 'sound/machines/buzz-two.ogg', 15, 0, 2)
			to_chat(user, span_warning("你试图开启[src]的过载模式，但未装载电池。"))
			return
		if(rounds < ENERGY_OVERCHARGE_AMMO_COST)
			playsound(user, 'sound/machines/buzz-two.ogg', 15, 0, 2)
			to_chat(user, span_warning("你试图开启[src]的过载模式，但你的电池组电量不足，无法执行此操作。"))
			return
		//While overcharge is active, double ammo consumption, and
		playsound(user, 'sound/weapons/emitter.ogg', 5, 0, 2)
		charge_cost = ENERGY_OVERCHARGE_AMMO_COST
		ammo_datum_type = ammo_diff
		fire_delay += 7 // 1 shot per second fire rate
		fire_sound = 'sound/weapons/guns/fire/laser3.ogg'
		to_chat(user, "[icon2html(src, user)] You [overcharge? "<B>disable</b>" : "<B>enable</b>" ] [src]'s overcharge mode.")
		overcharge = TRUE
	else
		playsound(user, 'sound/weapons/emitter2.ogg', 5, 0, 2)
		charge_cost = ENERGY_STANDARD_AMMO_COST
		ammo_datum_type = /datum/ammo/energy/lasgun/M43
		fire_delay -= 7
		fire_sound = 'sound/weapons/guns/fire/laser.ogg'
		to_chat(user, "[icon2html(src, user)] You [overcharge? "<B>disable</b>" : "<B>enable</b>" ] [src]'s overcharge mode.")
		overcharge = FALSE

	user?.hud_used.update_ammo_hud(src, get_ammo_list(), get_display_ammo_count())

	return TRUE

//-------------------------------------------------------
//M43 Sunfury Lasgun MK1

/obj/item/weapon/gun/energy/lasgun/M43
	name = "\improper M43 日怒激光枪 MK1"
	desc = "一款精准、无后坐力的激光战斗步枪，配备集成式能量选择器。适用于远距离交战。由于其高度模块化的透镜系统，在LR-73列装之前，它一直是TGMC士兵的标准激光步枪。"
	force = 20 //Large and hefty! Includes stock bonus.
	icon_state = "m43"
	worn_icon_state = "m43"
	max_shots = 50 //codex stuff
	load_method = CELL //codex stuff
	ammo_datum_type = /datum/ammo/energy/lasgun/M43
	rounds_per_shot = ENERGY_STANDARD_AMMO_COST
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/focuslens,
		/obj/item/attachable/widelens,
		/obj/item/attachable/heatlens,
		/obj/item/attachable/efflens,
		/obj/item/attachable/pulselens,
		/obj/item/attachable/stock/lasgun,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_ENERGY|GUN_AMMO_COUNT_BY_SHOTS_REMAINING|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_SHOWS_AMMO_REMAINING
	starting_attachment_types = list(/obj/item/attachable/stock/lasgun)
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 18,"rail_x" = 12, "rail_y" = 23, "under_x" = 23, "under_y" = 15, "stock_x" = 22, "stock_y" = 12)
	ammo_level_icon = "m43"
	accuracy_mult_unwielded = 0.5 //Heavy and unwieldy; you don't one hand this.
	scatter_unwielded = 100 //Heavy and unwieldy; you don't one hand this.
	damage_falloff_mult = 0.25
	fire_delay = 3

//variant without ugl attachment
/obj/item/weapon/gun/energy/lasgun/M43/stripped
	starting_attachment_types = list()


//-------------------------------------------------------
//Deathsquad-only gun -- Model 2419 pulse rifle, the M19C4.

/obj/item/weapon/gun/energy/lasgun/pulse
	name = "\improper M19C4脉冲能量步枪"
	desc = "一款重型多用途能量武器，采用脉冲式光束生成技术，可发射强力激光冲击。因其结构复杂且造价高昂，除特种部队及前线作战人员外鲜少列装。此为仅配发给资产保护部队及纳米传讯海外精英小队的测试型号。"
	force = 23 //Slightly more heftier than the M43, but without the stock.
	icon_state = "m19c4"
	worn_icon_state = "m19c4"
	fire_sound = 'sound/weapons/guns/fire/pulseenergy.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/vp70_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/m41a_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m4ra_reload.ogg'
	max_shots = 100//codex stuff
	load_method = CELL //codex stuff
	ammo_datum_type = /datum/ammo/energy/lasgun/pulsebolt
	muzzleflash_iconstate = "muzzle_flash_pulse"
	rounds_per_shot = ENERGY_STANDARD_AMMO_COST
	muzzle_flash_color = COLOR_PULSE_BLUE
	default_ammo_type = /obj/item/cell/lasgun/pulse
	allowed_ammo_types = list(/obj/item/cell/lasgun/pulse)

	equip_slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_BELT
	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_ENERGY|GUN_AMMO_COUNT_BY_SHOTS_REMAINING|GUN_NO_PITCH_SHIFT_NEAR_EMPTY
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 18,"rail_x" = 12, "rail_y" = 23, "under_x" = 23, "under_y" = 15, "stock_x" = 22, "stock_y" = 12)
	ammo_level_icon = "m19c4"
	fire_delay = 4
	burst_delay = 0.2 SECONDS
	accuracy_mult = 1.15
	accuracy_mult_unwielded = 0.95
	scatter_unwielded = 25
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	gun_firemode = GUN_FIREMODE_AUTOMATIC

/obj/item/weapon/gun/energy/lasgun/pulse/Initialize(mapload, spawn_empty)
	. = ..()
	AddComponent(/datum/component/reequip, list(SLOT_BELT)) //Innate mag harness, no more free pulse rifles for you >:(

//-------------------------------------------------------
//A practice version of M43, only for memes

/obj/item/weapon/gun/energy/lasgun/M43/practice
	name = "\improper M43-P 日怒激光枪 MK1"
	desc = "一款基于过时M43设计的精准无后坐力激光战斗步枪。仅接受训练用能量电池，且没有充电选择器。使用能量电池而非弹道弹匣。"
	force = 8 //Well, it's not complicted compared to the original.
	ammo_datum_type = /datum/ammo/energy/lasgun/M43/practice
	attachable_allowed = list(/obj/item/attachable/stock/lasgun/practice)
	starting_attachment_types = list(/obj/item/attachable/stock/lasgun/practice)
	muzzle_flash_color = COLOR_DISABLER_BLUE

	damage_falloff_mult = 1
	fire_delay = 0.35 SECONDS
	aim_slowdown = 0.35

/obj/item/weapon/gun/energy/lasgun/M43/practice/unique_action(mob/user)
	return

/obj/item/weapon/gun/energy/lasgun/lasrifle
	name = "\improper LR-73 激光步枪 MK2"
	desc = "一款多功能激光步枪，配备集成模式选择器。适用于任何情况。使用能量电池而非弹道弹匣。"
	icon = 'icons/obj/items/guns/energy64.dmi'
	icon_state = "tx73"
	worn_icon_state = "tx73"
	max_shots = 50 //codex stuff
	ammo_datum_type = /datum/ammo/energy/lasgun/marine
	rounds_per_shot = 12
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/scope/mini,
	)
	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_ENERGY|GUN_AMMO_COUNT_BY_SHOTS_REMAINING|GUN_NO_PITCH_SHIFT_NEAR_EMPTY
	attachable_offset = list("muzzle_x" = 34, "muzzle_y" = 14,"rail_x" = 18, "rail_y" = 18, "under_x" = 23, "under_y" = 10, "stock_x" = 22, "stock_y" = 12)
	ammo_level_icon = "tx73"
	accuracy_mult_unwielded = 0.5 //Heavy and unwieldy; you don't one hand this.
	scatter_unwielded = 100 //Heavy and unwieldy; you don't one hand this.
	damage_falloff_mult = 0.25
	fire_delay = 2
	default_ammo_type = /obj/item/cell/lasgun/lasrifle
	allowed_ammo_types = list(/obj/item/cell/lasgun/lasrifle, /obj/item/cell/lasgun/lasrifle/recharger)
	/// A list of available modes this gun can switch to
	var/list/datum/lasrifle/mode_list = list()
	/// The index of the current mode selected, used for non radial mode switches
	var/mode_index = 1

/datum/lasrifle
	///how much power the gun uses on this mode when shot.
	var/rounds_per_shot = 0
	///the ammo datum this mode is.
	var/datum/ammo/ammo_datum_type = null
	///how long it takes between each shot of that mode, same as gun fire delay.
	var/fire_delay = 0
	///Gives guns a burst amount, editable.
	var/burst_amount = 0
	///heat amount per shot
	var/heat_per_fire = 0
	///The gun firing sound of this mode
	var/fire_sound = null
	///What message it sends to the user when you switch to this mode.
	var/message_to_user = "" // todo delete me I'm useless
	///Used to change the gun firemode, like automatic, semi-automatic and burst.
	var/fire_mode = GUN_FIREMODE_SEMIAUTO
	///what to change the gun icon_state to when switching to this mode.
	var/icon_state = "tx73"
	///Which icon file the radial menu will use.
	var/radial_icon = 'icons/mob/radial.dmi'
	///The icon state the radial menu will use.
	var/radial_icon_state = "laser"
	///windup before firing
	var/windup_delay = 0
	///codex description
	var/description = ""

//TODO this proc should be generic so that you dont have to manually copy paste the default mode onto the item
/obj/item/weapon/gun/energy/lasgun/lasrifle/unique_action(mob/user)
	if(!user)
		CRASH("switch_modes called with no user.")

	var/datum/lasrifle/choice
	var/list/available_modes = list()
	if(user?.client?.prefs.toggles_gameplay & RADIAL_LASERGUNS)
		for(var/mode in mode_list)
			available_modes += list("[mode]" = image(icon = initial(mode_list[mode].radial_icon), icon_state = initial(mode_list[mode].radial_icon_state)))

		choice = mode_list[show_radial_menu(user, user, available_modes, null, 64, tooltips = TRUE)]
		mode_index = 0
	else
		for(var/mode_key AS in mode_list)
			available_modes += mode_key

		mode_index = WRAP(mode_index + 1, 1, length(mode_list)+1)
		choice = mode_list[available_modes[mode_index]]

	if(!choice)
		return

	if(HAS_TRAIT(src, TRAIT_GUN_BURST_FIRING))
		return

	playsound(user, 'sound/weapons/emitter.ogg', 5, FALSE, 2)

	shots_fired = 0
	gun_firemode = initial(choice.fire_mode)
	gun_firemode_list = list(gun_firemode)
	ammo_datum_type = initial(choice.ammo_datum_type)
	fire_delay = initial(choice.fire_delay)
	burst_amount = initial(choice.burst_amount)
	fire_sound = initial(choice.fire_sound)
	rounds_per_shot = initial(choice.rounds_per_shot)
	windup_delay = initial(choice.windup_delay)
	heat_per_fire = initial(choice.heat_per_fire)
	SEND_SIGNAL(src, COMSIG_GUN_BURST_SHOTS_TO_FIRE_MODIFIED, burst_amount)
	SEND_SIGNAL(src, COMSIG_GUN_AUTOFIREDELAY_MODIFIED, fire_delay)
	SEND_SIGNAL(src, COMSIG_GUN_FIRE_MODE_TOGGLE, initial(choice.fire_mode), user.client)

	base_gun_icon = initial(choice.icon_state)
	update_icon()
	to_chat(user, initial(choice.message_to_user))
	user?.hud_used.update_ammo_hud(src, get_ammo_list(), get_display_ammo_count())

	if(!in_chamber || !length(chamber_items))
		return
	QDEL_NULL(in_chamber)

	in_chamber = get_ammo_object(chamber_items[current_chamber_position])

//Tesla gun
/obj/item/weapon/gun/energy/lasgun/lasrifle/tesla
	name = "\improper 地球政府实验型特斯拉电击步枪"
	desc = "一把地球实验型能量步枪，发射电球，能电击附近的所有目标，旨在从内部耗尽不明生物的等离子体，限制其能力。与所有TE激光武器一样，它们采用轻质合金，且不再需要子弹，相比其弹道武器同类，显著减轻了重量并提高了瞄准速度。使用标准地球实验型（TE）能量电池。"
	icon_state = "tesla"
	worn_icon_state = "tesla"
	reload_sound = 'sound/weapons/guns/interact/standard_laser_rifle_reload.ogg'
	fire_sound = 'sound/weapons/guns/fire/tesla.ogg'
	ammo_datum_type = /datum/ammo/energy/tesla
	equip_slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	default_ammo_type = /obj/item/cell/lasgun/lasrifle
	allowed_ammo_types = list(/obj/item/cell/lasgun/lasrifle, /obj/item/cell/lasgun/lasrifle/recharger)
	gun_features_flags = GUN_WIELDED_FIRING_ONLY|GUN_ENERGY|GUN_AMMO_COUNTER|GUN_AMMO_COUNT_BY_SHOTS_REMAINING|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_SHOWS_AMMO_REMAINING
	muzzle_flash_color = COLOR_TESLA_BLUE
	ammo_level_icon = "tesla"
	max_shots = 6 //codex stuff
	rounds_per_shot = 100
	fire_delay = 4 SECONDS
	turret_flags = TURRET_INACCURATE
	attachable_allowed = list(
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
	)

	mode_list = list(
		"Standard" = /datum/lasrifle/tesla_mode/standard,
		"Focused" = /datum/lasrifle/tesla_mode/focused,
	)

/datum/lasrifle/tesla_mode/standard
	rounds_per_shot = 100
	ammo_datum_type = /datum/ammo/energy/tesla
	fire_delay = 4 SECONDS
	fire_sound = 'sound/weapons/guns/fire/tesla.ogg'
	message_to_user = "You set the tesla shock rifle's power mode mode to standard."
	fire_mode = GUN_FIREMODE_SEMIAUTO
	icon_state = "tesla"
	description = "Fires a slow moving ball of energy that shocks any living thing nearby. Minimal damage, but drains plasma rapidly from xenomorphs."

/datum/lasrifle/tesla_mode/focused
	rounds_per_shot = 100
	ammo_datum_type = /datum/ammo/energy/tesla/focused
	fire_delay = 4 SECONDS
	fire_sound = 'sound/weapons/guns/fire/tesla.ogg'
	message_to_user = "You set the tesla shock rifle's power mode mode to focused."
	fire_mode = GUN_FIREMODE_SEMIAUTO
	icon_state = "tesla"
	radial_icon_state = "laser_overcharge"
	description = "Fires an sophisticated IFF tesla ball, but with reduces shock range."

//TE Tier 1 Series//

//TE Standard Laser rifle

/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_rifle
	name = "\improper 地球实验型激光步枪"
	desc = "一把地球实验型激光步枪，简称TE-R。拥有多种射击模式，提供战术灵活性。使用标准地球实验型（简称TE）能量电池。与所有TE激光武器一样，它们采用轻质合金制造，且不再需要子弹，这使其重量和瞄准速度相比弹道武器有显著提升。"
	reload_sound = 'sound/weapons/guns/interact/standard_laser_rifle_reload.ogg'
	fire_sound = 'sound/weapons/guns/fire/Laser Rifle Standard.ogg'
	icon_state = "ter"
	worn_icon_state = "ter"
	max_shots = 60
	ammo_datum_type = /datum/ammo/energy/lasgun/marine
	rounds_per_shot = 10
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	turret_flags = TURRET_INACCURATE
	ammo_level_icon = "te"
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope/mini,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/flamer/hydro_cannon,
		/obj/item/attachable/gyro,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/foldable/bipod,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_ENERGY|GUN_AMMO_COUNTER|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_AMMO_COUNT_BY_SHOTS_REMAINING
	attachable_offset = list("muzzle_x" = 40, "muzzle_y" = 17,"rail_x" = 22, "rail_y" = 21, "under_x" = 29, "under_y" = 10, "stock_x" = 22, "stock_y" = 12)

	aim_slowdown = 0.4
	wield_delay = 0.7 SECONDS
	scatter = 0
	scatter_unwielded = 10
	fire_delay = 0.2 SECONDS
	accuracy_mult_unwielded = 0.55
	damage_falloff_mult = 0.2
	mode_list = list(
		"Standard" = /datum/lasrifle/energy_rifle_mode/standard,
		"Overcharge" = /datum/lasrifle/energy_rifle_mode/overcharge,
		"Weakening" = /datum/lasrifle/energy_rifle_mode/weakening,
		"Microwave" = /datum/lasrifle/energy_rifle_mode/microwave,
	)

/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_rifle/rifleman
	starting_attachment_types = list(/obj/item/attachable/bayonet/converted, /obj/item/attachable/reddot, /obj/item/weapon/gun/flamer/mini_flamer)

/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_rifle/medic
	starting_attachment_types = list(/obj/item/attachable/bayonet/converted, /obj/item/attachable/magnetic_harness, /obj/item/weapon/gun/flamer/mini_flamer)

/datum/lasrifle/energy_rifle_mode/standard
	rounds_per_shot = 10
	ammo_datum_type = /datum/ammo/energy/lasgun/marine
	fire_delay = 0.2 SECONDS
	fire_sound = 'sound/weapons/guns/fire/Laser Rifle Standard.ogg'
	message_to_user = "You set the laser rifle's charge mode to standard fire."
	fire_mode = GUN_FIREMODE_AUTOMATIC
	icon_state = "ter"
	description = "Fire a standard automatic laser pulse. Better armour penetration and sunder than common projectiles."


/datum/lasrifle/energy_rifle_mode/overcharge
	rounds_per_shot = 24
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/overcharge
	fire_delay = 0.45 SECONDS
	fire_sound = 'sound/weapons/guns/fire/Laser overcharge standard.ogg'
	message_to_user = "You set the laser rifle's charge mode to overcharge."
	fire_mode = GUN_FIREMODE_AUTOMATIC
	icon_state = "ter"
	radial_icon_state = "laser_overcharge"
	description = "Fires a powerful overcharged laser pulse. Deals heavy damage with superior penetration at the cost of slower fire rate."

/datum/lasrifle/energy_rifle_mode/weakening
	rounds_per_shot = 24
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/weakening
	fire_delay = 0.4 SECONDS
	fire_sound = 'sound/weapons/guns/fire/laser.ogg'
	message_to_user = "You set the laser rifle's charge mode to weakening."
	fire_mode = GUN_FIREMODE_AUTOMATIC
	icon_state = "ter"
	radial_icon_state = "laser_disabler"
	description = "Fires a pulse of energy that inflicts slowdown, and deals stamina damage to humans, or drains plasma from xenomorphs."


/datum/lasrifle/energy_rifle_mode/microwave
	rounds_per_shot = 30
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/microwave
	fire_delay = 0.45 SECONDS
	fire_sound = 'sound/weapons/guns/fire/laser_rifle_2.ogg'
	message_to_user = "You set the laser rifle's charge mode to microwave."
	fire_mode = GUN_FIREMODE_AUTOMATIC
	icon_state = "ter"
	radial_icon_state = "laser_microwave"
	description = "Fires a deadly pulse of microwave radiation, dealing moderate damage but applying a 'microwave' effect that deals strong damage over time."

///TE Standard Laser Pistol

/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_pistol
	name = "\improper 地球政府实验型激光手枪"
	desc = "地球政府标准制式激光手枪，简称TE-P。配备集成式充能选择器，可在常规、加热和电击模式间切换。使用标准地球实验型（简称TE）能量电池。与所有TE激光武器一样，采用轻质合金制造，且无需使用弹道弹药，相比弹道武器显著减轻了重量并提升了瞄准速度。"
	reload_sound = 'sound/weapons/guns/interact/standard_laser_pistol_reload.ogg'
	fire_sound = 'sound/weapons/guns/fire/Laser Pistol Standard.ogg'
	icon_state = "tep"
	worn_icon_state = "tep"
	w_class = WEIGHT_CLASS_NORMAL
	equip_slot_flags = ITEM_SLOT_BELT
	gun_skill_category = SKILL_PISTOLS
	max_shots = 20 //codex stuff
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/pistol
	ammo_level_icon = null
	rounds_per_shot = 30
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/lace,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight/under,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_ENERGY|GUN_AMMO_COUNTER|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_AMMO_COUNT_BY_SHOTS_REMAINING
	attachable_offset = list("muzzle_x" = 23, "muzzle_y" = 22,"rail_x" = 12, "rail_y" = 22, "under_x" = 16, "under_y" = 14, "stock_x" = 22, "stock_y" = 12)

	akimbo_additional_delay = 0.9
	wield_delay = 0.4 SECONDS
	scatter = 2
	scatter_unwielded = 4
	fire_delay = 0.15 SECONDS
	accuracy_mult = 1
	accuracy_mult_unwielded = 0.9
	damage_falloff_mult = 0.2
	aim_slowdown = 0
	mode_list = list(
		"Standard" = /datum/lasrifle/energy_pistol_mode/standard,
		"Heat" = /datum/lasrifle/energy_pistol_mode/heat,
		"Disabler" = /datum/lasrifle/energy_pistol_mode/disabler,
	)

/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_pistol/tactical
	starting_attachment_types = list(/obj/item/attachable/reddot, /obj/item/attachable/lasersight)

/datum/lasrifle/energy_pistol_mode/standard
	rounds_per_shot = 30
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/pistol
	fire_delay = 0.15 SECONDS
	fire_sound = 'sound/weapons/guns/fire/Laser Pistol Standard.ogg'
	message_to_user = "You set the laser pistol's charge mode to standard fire."
	fire_mode = GUN_FIREMODE_AUTOMATIC
	icon_state = "tep"
	description = "Fires a standard laser pulse. Moderate damage."

/datum/lasrifle/energy_pistol_mode/disabler
	rounds_per_shot = 80
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/pistol/disabler
	fire_delay = 10
	fire_sound = 'sound/weapons/guns/fire/disabler.ogg'
	message_to_user = "You set the laser pistol's charge mode to disabler fire."
	fire_mode = GUN_FIREMODE_AUTOMATIC
	icon_state = "tep"
	radial_icon_state = "laser_disabler"
	description = "Fires a disabling pulse that drains stamina. Ineffective against xenomorphs."

/datum/lasrifle/energy_pistol_mode/heat
	rounds_per_shot = 100
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/pistol/heat
	fire_delay = 0.5 SECONDS
	fire_sound = 'sound/weapons/guns/fire/laser3.ogg'
	message_to_user = "You set the laser pistol's charge mode to wave heat."
	fire_mode = GUN_FIREMODE_AUTOMATIC
	icon_state = "tep"
	radial_icon_state = "laser_heat"
	description = "Fires an incendiary laser pulse that ignites living targets."

//TE Standard Laser Carbine

/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_carbine
	name = "\improper 地球实验型激光卡宾枪"
	desc = "一把地球政府标准制式激光卡宾枪，简称TE-C。拥有多种射击模式以提供战术灵活性。使用标准地球实验型（缩写为TE）能量电池。与所有TE激光武器一样，它们采用轻质合金制造，且不再需要弹道武器所需的子弹，这使其重量和瞄准速度相比弹道武器有显著提升。"
	reload_sound = 'sound/weapons/guns/interact/standard_laser_rifle_reload.ogg'
	fire_sound = 'sound/weapons/guns/fire/Laser Rifle Standard.ogg'
	icon_state = "tec"
	worn_icon_state = "tec"
	max_shots = 50
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/carbine
	rounds_per_shot = 12
	gun_firemode = GUN_FIREMODE_AUTOBURST
	gun_firemode_list = list(GUN_FIREMODE_AUTOBURST)
	ammo_level_icon = "te"
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/flamer/hydro_cannon,
		/obj/item/attachable/gyro,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/flashlight/under,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_ENERGY|GUN_AMMO_COUNTER|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_AMMO_COUNT_BY_SHOTS_REMAINING
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 18,"rail_x" = 17, "rail_y" = 21, "under_x" = 23, "under_y" = 10, "stock_x" = 22, "stock_y" = 12)

	aim_slowdown = 0.2
	wield_delay = 0.5 SECONDS
	scatter = 1
	scatter_unwielded = 10
	fire_delay = 0.2 SECONDS
	burst_amount = 4
	burst_delay = 0.1 SECONDS
	extra_delay = 0.15 SECONDS
	autoburst_delay = 0.35 SECONDS
	accuracy_mult = 1
	accuracy_mult_unwielded = 0.65
	damage_falloff_mult = 0.5
	movement_acc_penalty_mult = 4
	mode_list = list(
		"Auto burst standard" = /datum/lasrifle/energy_carbine_mode/auto_burst,
		"Spread" = /datum/lasrifle/energy_carbine_mode/base/spread,
		"Impact" = /datum/lasrifle/energy_carbine_mode/base/impact,
		"Cripple" = /datum/lasrifle/energy_carbine_mode/base/cripple,
	)

/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_carbine/scout
	starting_attachment_types = list(
		/obj/item/attachable/reddot,
		/obj/item/weapon/gun/grenade_launcher/underslung,
	)

/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_carbine/mag_harness
	starting_attachment_types = list(
		/obj/item/attachable/magnetic_harness,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/bayonet/converted,
	)

/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_carbine/gyro
	starting_attachment_types = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/gyro,
	)

/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_carbine/beginner
	starting_attachment_types = list(
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/bayonet/converted,
	)

/datum/lasrifle/energy_carbine_mode/auto_burst
	rounds_per_shot = 12
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/carbine
	fire_delay = 0.2 SECONDS
	burst_amount = 4
	fire_sound = 'sound/weapons/guns/fire/Laser Rifle Standard.ogg'
	message_to_user = "You set the laser carbine's charge mode to standard auto burst fire."
	fire_mode = GUN_FIREMODE_AUTOBURST
	icon_state = "tec"
	description = "Fires a rapid pulse laser, dealing good damage per second, but suffers from increased scatter and poorer falloff."

/datum/lasrifle/energy_carbine_mode/base/spread
	rounds_per_shot = 50
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/blast
	fire_delay = 1.5 SECONDS
	burst_amount = 1
	fire_sound = 'sound/weapons/guns/fire/Laser Carbine Scatter.ogg'
	message_to_user = "You set the laser carbine's charge mode to spread."
	fire_mode = GUN_FIREMODE_SEMIAUTO
	icon_state = "tec"
	radial_icon_state = "laser_spread"
	description = "Fire a 3 strong laser pulse dealing heavy damage with good penetration, but with a very slow rate of fire."

/datum/lasrifle/energy_carbine_mode/base/impact
	rounds_per_shot = 50
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/impact
	fire_delay = 1 SECONDS
	burst_amount = 1
	fire_sound = 'sound/weapons/guns/fire/laser3.ogg'
	message_to_user = "You set the laser carbine's charge mode to impact."
	fire_mode = GUN_FIREMODE_SEMIAUTO
	icon_state = "tec"
	radial_icon_state = "laser_impact"
	description = "Fires an experimental laser pulse designed to apply significant kinetic force on a target, applying strong knockback, but modest direct damage."

/datum/lasrifle/energy_carbine_mode/base/cripple
	rounds_per_shot = 15
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/cripple
	fire_delay = 0.3 SECONDS
	burst_amount = 1
	fire_sound = 'sound/weapons/guns/fire/laser.ogg'
	message_to_user = "You set the laser carbine's charge mode to cripple."
	fire_mode = GUN_FIREMODE_AUTOMATIC
	icon_state = "tec"
	radial_icon_state = "laser_disabler"
	description = "Fires a laser pulse dealing moderate damage and slowdown."

//TE Standard Sniper

/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_sniper
	name = "\improper 地球政府实验型激光狙击步枪"
	desc = "T-ES，一款地球实验型标准制式激光狙击步枪，拥有多种强力射击模式，尽管缺少瞄准模式可能限制其战术灵活性。使用标准地球实验型（简称TE）能量电池。与所有TE激光武器一样，它们采用轻质合金制造，且不再需要子弹，这使其重量和瞄准速度相比弹道武器同类产品有显著降低。"
	reload_sound = 'sound/weapons/guns/interact/standard_laser_sniper_reload.ogg'
	fire_sound = 'sound/weapons/guns/fire/Laser Sniper Standard.ogg'
	icon_state = "tes"
	worn_icon_state = "tes"
	w_class = WEIGHT_CLASS_BULKY
	max_shots = 20
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/sniper
	rounds_per_shot = 30
	damage_falloff_mult = 0
	gun_firemode = GUN_FIREMODE_SEMIAUTO
	gun_firemode_list = list(GUN_FIREMODE_SEMIAUTO)

	ammo_level_icon = "te"
	icon_overlay_x_offset = -1
	icon_overlay_y_offset = -3
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope/laser_sniper_scope,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/attachable/motiondetector,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/flamer/hydro_cannon,
		/obj/item/attachable/gyro,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/foldable/bipod,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_ENERGY|GUN_AMMO_COUNTER|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_AMMO_COUNT_BY_SHOTS_REMAINING
	attachable_offset = list("muzzle_x" = 41, "muzzle_y" = 18,"rail_x" = 19, "rail_y" = 19, "under_x" = 28, "under_y" = 8, "stock_x" = 22, "stock_y" = 12)
	starting_attachment_types = list(/obj/item/attachable/scope/laser_sniper_scope)

	aim_slowdown = 0.7
	wield_delay = 0.9 SECONDS
	scatter = -4
	scatter_unwielded = 10
	fire_delay = 0.8 SECONDS
	accuracy_mult = 1.2
	accuracy_mult_unwielded = 0.5
	movement_acc_penalty_mult = 6
	mode_list = list(
		"Standard" = /datum/lasrifle/energy_sniper_mode/standard,
		"Heat" = /datum/lasrifle/energy_sniper_mode/heat,
		"Shatter" = /datum/lasrifle/energy_sniper_mode/shatter,
		"Ricochet" = /datum/lasrifle/energy_sniper_mode/ricochet,
	)

/datum/lasrifle/energy_sniper_mode/standard
	rounds_per_shot = 30
	fire_delay = 0.8 SECONDS
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/sniper
	fire_sound = 'sound/weapons/guns/fire/Laser Sniper Standard.ogg'
	message_to_user = "You set the sniper rifle's charge mode to standard fire."
	fire_mode = GUN_FIREMODE_SEMIAUTO
	icon_state = "tes"
	description = "Fires a single strong laser pulse, with good damage and penetration, and no falloff."

/datum/lasrifle/energy_sniper_mode/heat
	rounds_per_shot = 100
	fire_delay = 1 SECONDS
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/sniper_heat
	fire_sound = 'sound/weapons/guns/fire/laser3.ogg'
	message_to_user = "You set the sniper rifle's charge mode to wave heat."
	fire_mode = GUN_FIREMODE_SEMIAUTO
	icon_state = "tes"
	radial_icon_state = "laser_heat"
	description = "Fires an incendiary laser pulse, designed to ignite victims at range."

/datum/lasrifle/energy_sniper_mode/shatter
	rounds_per_shot = 100
	fire_delay = 1 SECONDS
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/shatter
	fire_sound = 'sound/weapons/guns/fire/laser_rifle_2.ogg'
	message_to_user = "You set the sniper rifle's charge mode to shatter."
	fire_mode = GUN_FIREMODE_SEMIAUTO
	icon_state = "tes"
	radial_icon_state = "laser_charge"
	description = "Fires a devestating laser pulse that significantly degrades the victims armor, at the cost of lower direct damage."

/datum/lasrifle/energy_sniper_mode/ricochet
	rounds_per_shot = 45
	fire_delay = 0.8 SECONDS
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/ricochet/four
	fire_sound = 'sound/weapons/guns/fire/laser3.ogg'
	message_to_user = "You set the sniper rifle's charge mode to ricochet."
	fire_mode = GUN_FIREMODE_SEMIAUTO
	icon_state = "tes"
	radial_icon_state = "laser_ricochet"
	description = "Fires an experiment laser pulse capable of bouncing off many wall surfaces. The laser increases in potency when bouncing, before collapsing entirely after exceeding its threshold."

// TE Standard MG

/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_mlaser
	name = "\improper 地球实验型激光机枪"
	desc = "地球实验型标准制式激光机枪，陆战队员常称之为TE-M。高效调制器确保TE-M拥有极高的射击次数，多种射击模式使其成为灵活的步兵支援武器。使用标准地球实验型（简称TE）能量电池。与所有TE激光武器一样，它们采用轻质合金制造，且不再需要子弹，相比弹道武器显著降低了重量并提升了瞄准速度。"
	reload_sound = 'sound/weapons/guns/interact/standard_machine_laser_reload.ogg'
	fire_sound = 'sound/weapons/guns/fire/Laser Rifle Standard.ogg'
	icon_state = "tem"
	worn_icon_state = "tem"
	w_class = WEIGHT_CLASS_BULKY
	gun_skill_category = SKILL_HEAVY_WEAPONS
	max_shots = 150 //codex stuff
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/autolaser
	rounds_per_shot = 4
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	ammo_level_icon = "te"
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope/mini,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/weapon/gun/flamer/hydro_cannon,
		/obj/item/attachable/gyro,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/foldable/bipod,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_ENERGY|GUN_AMMO_COUNTER|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_AMMO_COUNT_BY_SHOTS_REMAINING
	attachable_offset = list("muzzle_x" = 41, "muzzle_y" = 15,"rail_x" = 22, "rail_y" = 24, "under_x" = 30, "under_y" = 8, "stock_x" = 22, "stock_y" = 12)

	aim_slowdown = 0.7
	wield_delay = 1 SECONDS
	scatter = 1
	fire_delay = 0.2 SECONDS
	burst_delay = 0.25 SECONDS
	accuracy_mult = 1
	accuracy_mult_unwielded = 0.3
	scatter_unwielded = 30
	movement_acc_penalty_mult = 6
	damage_falloff_mult = 0.3
	windup_sound = 'sound/weapons/guns/fire/laser_charge_up.ogg'
	mode_list = list(
		"Standard" = /datum/lasrifle/energy_mg_mode/standard,
		"Burst" = /datum/lasrifle/energy_mg_mode/standard/burst,
		"Charge" = /datum/lasrifle/energy_mg_mode/standard/charge,
		"Melting" = /datum/lasrifle/energy_mg_mode/standard/melting,
	)

/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_mlaser/apply_gun_modifiers(atom/movable/projectile/projectile_to_fire, atom/target, firer)
	. = ..()
	if((gun_firemode == GUN_FIREMODE_BURSTFIRE) && shots_fired) //this specifically boosts the burst fire mode
		projectile_to_fire.damage *= (1 + shots_fired)

/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_mlaser/patrol
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/weapon/gun/grenade_launcher/underslung, /obj/item/attachable/bayonet/converted)

/datum/lasrifle/energy_mg_mode/standard
	rounds_per_shot = 4
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/autolaser
	fire_delay = 0.2 SECONDS
	fire_sound = 'sound/weapons/guns/fire/Laser Sniper Standard.ogg'
	message_to_user = "You set the machine laser's charge mode to standard fire."
	fire_mode = GUN_FIREMODE_AUTOMATIC
	icon_state = "tem"
	description = "Fires a rapid laser pulse with slightly reduced damage, but improved penetration and vastly improved energy efficiency."

/datum/lasrifle/energy_mg_mode/standard/burst
	rounds_per_shot = 8
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/autolaser/burst
	fire_delay = 0.45 SECONDS
	burst_amount = 4
	fire_sound = 'sound/weapons/guns/fire/Laser Carbine Scatter.ogg'
	message_to_user = "You set the machine laser's charge mode to burst."
	fire_mode = GUN_FIREMODE_BURSTFIRE
	icon_state = "tem"
	radial_icon_state = "laser_spread"
	description = "Fires a series of laser pulses in quick succession. Each pulse in a burst is more powerful than the last."


/datum/lasrifle/energy_mg_mode/standard/charge
	rounds_per_shot = 15
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/autolaser/charge
	fire_delay = 1 SECONDS
	fire_sound = 'sound/weapons/guns/fire/Laser overcharge standard.ogg'
	windup_delay = 0.5 SECONDS
	fire_mode = GUN_FIREMODE_AUTOMATIC
	message_to_user = "You set the machine laser's charge mode to charge."
	radial_icon_state = "laser_charge"
	description = "Fires a powerful laser pulse after a brief charge up."

/datum/lasrifle/energy_mg_mode/standard/melting
	rounds_per_shot = 18
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/autolaser/melting
	fire_delay = 0.45 SECONDS
	fire_sound = 'sound/weapons/guns/fire/laser_rifle_2.ogg'
	message_to_user = "You set the machine laser's charge mode to melting."
	radial_icon_state = "laser_heat"
	description = "Fires an unusual laser pulse that applies a melting effect which severely sunders xenomorph armor over time, as well as applying further damage."

// TE X-Ray

/obj/item/weapon/gun/energy/lasgun/lasrifle/xray
	name = "\improper 地球实验型X射线激光步枪"
	desc = "地球政府实验型X射线激光步枪，简称TE-X。它集成了普通和高能设置的充电选择器。使用标准地球政府实验型（简称TE）能量电池。与所有TE激光武器一样，它们采用轻质合金制造，且不再需要子弹，这使其重量和瞄准速度相比弹道步枪有显著提升。"
	reload_sound = 'sound/weapons/guns/interact/standard_laser_rifle_reload.ogg'
	fire_sound = 'sound/weapons/guns/fire/laser3.ogg'
	icon_state = "tex"
	worn_icon_state = "tex"
	max_shots = 40 //codex stuff
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/incendiary
	rounds_per_shot = 15
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope/mini,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/attachable/gyro,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/foldable/bipod,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_ENERGY|GUN_AMMO_COUNTER|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_AMMO_COUNT_BY_SHOTS_REMAINING
	attachable_offset = list("muzzle_x" = 40, "muzzle_y" = 19,"rail_x" = 20, "rail_y" = 21, "under_x" = 30, "under_y" = 13, "stock_x" = 22, "stock_y" = 14)
	ammo_level_icon = "tex"
	aim_slowdown = 0.4
	wield_delay = 0.7 SECONDS
	scatter = 0
	scatter_unwielded = 10
	fire_delay = 0.5 SECONDS
	accuracy_mult_unwielded = 0.55
	damage_falloff_mult = 0.3
	mode_list = list(
		"Standard" = /datum/lasrifle/energy_rifle_mode/xray,
		"Piercing" = /datum/lasrifle/energy_rifle_mode/xray/piercing,
	)

/datum/lasrifle/energy_rifle_mode/xray
	rounds_per_shot = 15
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/incendiary
	fire_delay = 0.5 SECONDS
	fire_sound = 'sound/weapons/guns/fire/laser3.ogg'
	message_to_user = "You set the xray rifle's charge mode to standard fire."
	fire_mode = GUN_FIREMODE_AUTOMATIC
	icon_state = "tex"
	radial_icon_state = "laser_heat"
	description = "Fires an incendiary laser pulse designed to ignite a victim."

/datum/lasrifle/energy_rifle_mode/xray/piercing
	rounds_per_shot = 30
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/xray
	fire_delay = 0.6 SECONDS
	fire_sound = 'sound/weapons/guns/fire/laser.ogg'
	message_to_user = "You set the xray rifle's charge mode to piercing mode."
	radial_icon_state = "laser"
	description = "Fires a powerful xray laser pulse. Completely penetrates a victims armour, as well as any solid substance in the way."

//Martian death rays
/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite
	name = "伏尔基特枪"
	desc = "你不应该看到这把枪。"
	icon_state = "charger"
	worn_icon_state = "charger"
	ammo_level_icon = ""
	fire_sound = 'sound/weapons/guns/fire/volkite_1.ogg'
	dry_fire_sound = 'sound/weapons/guns/misc/error.ogg'
	unload_sound = 'sound/weapons/guns/interact/volkite_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/volkite_reload.ogg'
	max_shots = 50
	ammo_datum_type = /datum/ammo/energy/volkite
	rounds_per_shot = 24
	default_ammo_type = /obj/item/cell/lasgun/volkite
	allowed_ammo_types = list(/obj/item/cell/lasgun/volkite)
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_allowed = list()
	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_ENERGY|GUN_AMMO_COUNT_BY_SHOTS_REMAINING|GUN_SHOWS_LOADED
	attachable_offset = list("muzzle_x" = 34, "muzzle_y" = 14,"rail_x" = 18, "rail_y" = 18, "under_x" = 23, "under_y" = 10, "stock_x" = 22, "stock_y" = 12)

	accuracy_mult = 1
	scatter = -2
	recoil = 0
	accuracy_mult_unwielded = 0.5
	scatter_unwielded = 25
	recoil_unwielded = 3

	aim_slowdown = 0.35
	wield_delay = 0.6 SECONDS

	damage_falloff_mult = 0.9
	fire_delay = 0.2 SECONDS
	mode_list = list()

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/apply_custom(mutable_appearance/standing, inhands, icon_used, state_used)
	. = ..()
	if(rounds)
		var/mutable_appearance/emissive_overlay = emissive_appearance(icon_used, "[worn_icon_state]_emissive", src)
		standing.overlays.Add(emissive_overlay)

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta
	name = "\improper VX-12 蝰蛇"
	desc = "沃尔坎武器是火星武器制造业的骄傲，其构造是严格保守的秘密。它以利用其巨大的热能对有机目标进行爆燃而臭名昭著，能在一阵火焰爆炸中剧烈燃烧肉体，对任何不幸靠近的人来说都可能是致命的。这种'蛇形'手枪通常见于火星之子军官和一些士官手中，就其尺寸而言相当危险。"
	icon_state = "vx12"
	worn_icon_state = "vx12"
	w_class = WEIGHT_CLASS_NORMAL
	gun_skill_category = SKILL_PISTOLS
	max_shots = 15
	rounds_per_shot = 36
	ammo_datum_type = /datum/ammo/energy/volkite/medium
	default_ammo_type = /obj/item/cell/lasgun/volkite/small
	allowed_ammo_types = list(/obj/item/cell/lasgun/volkite/small)
	fire_sound = 'sound/weapons/guns/fire/volkite_3.ogg'
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	fire_delay = 0.35 SECONDS
	scatter = -1
	scatter_unwielded = 5
	accuracy_mult = 1.15
	accuracy_mult_unwielded = 0.9
	recoil_unwielded = 0
	movement_acc_penalty_mult = 2
	aim_slowdown = 0.1
	wield_delay = 0.4 SECONDS

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta/custom
	name = "\improper VX-12c 蝮蛇"
	desc = "'蛇形'手枪通常见于火星之子军官和部分士官手中，以其尺寸而言威力相当可观。这把武器似乎是经过定制改造的增强型号。"
	icon_state = "vx12c"
	worn_icon_state = "vx12"
	ammo_datum_type = /datum/ammo/energy/volkite/medium/custom
	max_shots = 27
	rounds_per_shot = 20
	scatter = -2
	scatter_unwielded = 4
	accuracy_mult = 1.25
	accuracy_mult_unwielded = 0.95

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/charger
	name = "\improper VX-32 充能器"
	desc = "沃尔坎武器是火星武器制造业的骄傲，其制造工艺是严格保守的秘密。它以利用巨大热能对有机目标进行爆燃而臭名昭著，能在火焰爆炸中剧烈燃烧肉体，对附近任何不幸的个体都可能是致命的。充电器是一种轻量级武器，射速高，专为高机动性和易于操作而设计。在较远距离上效果不佳。"
	icon_state = "charger"
	worn_icon_state = "charger"
	max_shots = 45
	rounds_per_shot = 32
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
	)
	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 13,"rail_x" = 9, "rail_y" = 23, "under_x" = 30, "under_y" = 10, "stock_x" = 22, "stock_y" = 12)
	scatter = 3
	accuracy_mult = 1.05
	accuracy_mult_unwielded = 0.9
	scatter_unwielded = 8
	recoil_unwielded = 1
	movement_acc_penalty_mult = 3
	damage_falloff_mult = 0.5

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/charger/magharness
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness)

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/charger/somvet
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/gyro)

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/charger/standard
	starting_attachment_types = list(/obj/item/attachable/reddot, /obj/item/attachable/lasersight)

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/charger/scout
	starting_attachment_types = list(/obj/item/attachable/motiondetector, /obj/item/attachable/gyro)

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/caliver
	name = "\improper VX-33 卡利弗"
	desc = "沃尔凯特武器是火星武器制造业的骄傲，其构造是严格保守的秘密。它以利用巨大的热能对有机目标进行爆燃而臭名昭著，能在火焰爆炸中剧烈燃烧肉体，对任何不幸靠近的人都可能是致命的。卡利弗是沃尔凯特家族的主要步枪，在大多数射程和情况下都有效。将能量包拖拽点击到枪上即可使用它来代替弹匣。"
	icon_state = "caliver"
	worn_icon_state = "caliver"
	inhand_x_dimension = 64
	inhand_y_dimension = 32
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/energy_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/energy_right_64.dmi',
	)
	fire_sound = 'sound/weapons/guns/fire/volkite_3.ogg'
	max_shots = 40
	ammo_datum_type = /datum/ammo/energy/volkite/medium
	rounds_per_shot = 36
	default_ammo_type = /obj/item/cell/lasgun/volkite
	allowed_ammo_types = list(
		/obj/item/cell/lasgun/volkite,
		/obj/item/cell/lasgun/volkite/powerpack,
	)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
	)
	attachable_offset = list("muzzle_x" = 38, "muzzle_y" = 13,"rail_x" = 9, "rail_y" = 24, "under_x" = 45, "under_y" = 11, "stock_x" = 22, "stock_y" = 12)
	accuracy_mult = 1.1
	aim_slowdown = 0.65
	damage_falloff_mult = 0.4
	wield_delay = 0.9 SECONDS
	fire_delay = 0.25 SECONDS

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/caliver/magharness
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness)

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/caliver/somvet
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/lasersight)

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/caliver/tacsensor
	starting_attachment_types = list(/obj/item/attachable/motiondetector, /obj/item/attachable/lasersight)

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/caliver/standard
	starting_attachment_types = list(/obj/item/attachable/reddot, /obj/item/attachable/lasersight)

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/culverin
	name = "\improper VX-42 卡尔弗林"
	desc = "沃尔坎武器是火星武器制造业的骄傲，其构造是严格保守的秘密。它以利用巨大的热能对有机目标进行爆燃而臭名昭著，在炽热的爆炸中剧烈燃烧肉体，对任何不幸靠近的人都可能是致命的。卡尔弗林炮是最大型的人携式沃尔坎武器，由于其连接在背部的动力背包，可以倾泻出惊人的火力洪流。将动力背包拖拽到枪上以装载。"
	icon_state = "culverin"
	worn_icon_state = "culverin"
	inhand_x_dimension = 64
	inhand_y_dimension = 32
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/energy_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/energy_right_64.dmi',
	)
	ammo_level_icon = null
	gun_skill_category = SKILL_HEAVY_WEAPONS
	max_shots = 120
	ammo_datum_type = /datum/ammo/energy/volkite/heavy
	rounds_per_shot = 30
	default_ammo_type = null
	allowed_ammo_types = list(/obj/item/cell/lasgun/volkite/powerpack)
	attachable_allowed = list(
		/obj/item/attachable/magnetic_harness,
	)
	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_ENERGY|GUN_AMMO_COUNT_BY_SHOTS_REMAINING|GUN_WIELDED_FIRING_ONLY|GUN_SHOWS_LOADED
	reciever_flags = AMMO_RECIEVER_MAGAZINES|AMMO_RECIEVER_DO_NOT_EJECT_HANDFULS|AMMO_RECIEVER_CYCLE_ONLY_BEFORE_FIRE
	attachable_offset = list("muzzle_x" = 34, "muzzle_y" = 14,"rail_x" = 11, "rail_y" = 29, "under_x" = 23, "under_y" = 10, "stock_x" = 22, "stock_y" = 12)
	aim_slowdown = 1
	wield_delay = 1.4 SECONDS
	fire_delay = 0.15 SECONDS
	scatter = 3
	accuracy_mult_unwielded = 0.4
	scatter_unwielded = 35
	recoil_unwielded = 5
	damage_falloff_mult = 0.4
	movement_acc_penalty_mult = 6

/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/culverin/magharness
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness)
