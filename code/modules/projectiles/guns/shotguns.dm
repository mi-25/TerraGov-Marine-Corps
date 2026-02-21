/obj/item/weapon/gun/shotgun
	w_class = WEIGHT_CLASS_BULKY
	force = 14
	caliber = CALIBER_12G //codex
	max_chamber_items = 8 //codex
	load_method = SINGLE_CASING //codex
	icon = 'icons/obj/items/guns/shotguns.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/shotguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/shotguns_right_1.dmi',
	)
	gun_crosshair = 'icons/UI_Icons/gun_crosshairs/shotgun.dmi'
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/shotgun_empty.ogg'
	reload_sound = 'sound/weapons/guns/interact/shotgun_shell_insert.ogg'
	hand_reload_sound = 'sound/weapons/guns/interact/shotgun_shell_insert.ogg'
	cocked_sound = 'sound/weapons/guns/interact/shotgun_reload.ogg'
	opened_sound = 'sound/weapons/guns/interact/shotgun_open.ogg'
	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	reciever_flags = AMMO_RECIEVER_HANDFULS
	type_of_casings = "shell"
	allowed_ammo_types = list()
	aim_slowdown = 0.35
	wield_delay = 0.8 SECONDS //Shotguns are really easy to put up to fire, since they are designed for CQC (at least compared to a rifle)
	gun_skill_category = SKILL_SHOTGUNS
	item_map_variant_flags = NONE

	fire_delay = 0.6 SECONDS
	accuracy_mult = 1.15
	accuracy_mult_unwielded = 0.75
	scatter = 4
	scatter_unwielded = 10
	recoil = 2
	recoil_unwielded = 4
	movement_acc_penalty_mult = 2
	akimbo_scatter_mod = 8

	placed_overlay_iconstate = "shotgun"


//-------------------------------------------------------
//TACTICAL SHOTGUN

/obj/item/weapon/gun/shotgun/combat
	name = "\improper SH-221战术霰弹枪"
	desc = "纳米传讯SH-221霰弹枪，一款基于有数百年历史的贝内利M4霰弹枪的速射半自动霰弹枪。仅少量配发给地球政府殖民地海军陆战队。"
	equip_slot_flags = ITEM_SLOT_BACK
	icon_state = "mk221"
	worn_icon_state = "mk221"
	fire_sound = 'sound/weapons/guns/fire/shotgun_automatic.ogg'
	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	max_chamber_items = 9
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
		/obj/item/weapon/gun/grenade_launcher/underslung/invisible,
	)
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 19,"rail_x" = 10, "rail_y" = 21, "under_x" = 14, "under_y" = 16, "stock_x" = 14, "stock_y" = 16)
	starting_attachment_types = list(/obj/item/weapon/gun/grenade_launcher/underslung/invisible)

	fire_delay = 1.5 SECONDS
	accuracy_mult_unwielded = 0.5 //you need to wield this gun for any kind of accuracy
	scatter_unwielded = 10
	damage_mult = 0.75  //normalizing gun for vendors; damage reduced by 25% to compensate for faster fire rate; still higher DPS than T-32.
	recoil = 2
	recoil_unwielded = 4
	aim_slowdown = 0.4


//-------------------------------------------------------
//SH-39 semi automatic shotgun. Used by marines.

/obj/item/weapon/gun/shotgun/combat/standardmarine
	name = "\improper SH-39 战斗霰弹枪"
	desc = "地球政府军械库SH-39战斗霰弹枪是地球政府殖民地海军陆战队各小队中破门手和尖兵使用的半自动霰弹枪。使用12号口径霰弹。"
	force = 20 //Has a stock already
	equip_slot_flags = ITEM_SLOT_BACK
	icon = 'icons/obj/items/guns/shotguns64.dmi'
	icon_state = "t39"
	worn_icon_state = "t39"
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_sh39.ogg'
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/stock/t39stock,
	)

	attachable_offset = list("muzzle_x" = 41, "muzzle_y" = 20,"rail_x" = 15, "rail_y" = 20, "under_x" = 23, "under_y" = 12, "stock_x" = 11, "stock_y" = 14)
	starting_attachment_types = list(/obj/item/attachable/stock/t39stock)

	fire_delay = 1.4 SECONDS
	accuracy_mult = 1.05
	accuracy_mult_unwielded = 0.65
	scatter = 3
	scatter_unwielded = 12
	damage_mult = 0.7  //30% less damage. Faster firerate.
	recoil = 2
	recoil_unwielded = 4
	wield_delay = 1 SECONDS
	akimbo_additional_delay = 0.9

/obj/item/weapon/gun/shotgun/combat/standardmarine/beginner
	default_ammo_type = /datum/ammo/bullet/shotgun/slug
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/heavy_barrel, /obj/item/attachable/verticalgrip, /obj/item/attachable/stock/t39stock)

/obj/item/weapon/gun/shotgun/combat/masterkey
	name = "下挂霰弹枪"
	desc = "一种可安装在武器上的三发霰弹枪。可使用任何标准12号霰弹装填。短枪管设计大幅降低了弹药效能，但使其能够作为枪械配件使用。"
	icon = 'icons/obj/items/guns/attachments/gun.dmi'
	icon_state = "masterkey"
	max_chamber_items = 2
	attachable_allowed = list()
	starting_attachment_types = list()
	slot = ATTACHMENT_SLOT_UNDER
	attach_delay = 3 SECONDS
	detach_delay = 3 SECONDS
	gun_features_flags = GUN_IS_ATTACHMENT|GUN_AMMO_COUNTER|GUN_ATTACHMENT_FIRE_ONLY|GUN_WIELDED_STABLE_FIRING_ONLY|GUN_CAN_POINTBLANK|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	damage_mult = 0.6 // 40% less damage, but MUCH higher falloff.
	scatter = 3
	fire_delay = 2 SECONDS
	pixel_shift_x = 14
	pixel_shift_y = 18

	wield_delay_mod = 0.2 SECONDS

//-------------------------------------------------------
//DOUBLE SHOTTY

/obj/item/weapon/gun/shotgun/double
	name = "双管霰弹枪"
	desc = "一把古老但坚固设计的上下双管霰弹枪。使用12号口径霰弹，但一次只能装填2发。"
	equip_slot_flags = ITEM_SLOT_BACK
	icon_state = "dshotgun"
	worn_icon_state = "dshotgun"
	max_chamber_items = 2 //codex
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_sh34.ogg'
	reload_sound = 'sound/weapons/guns/interact/shotgun_db_insert.ogg'
	cocked_sound = null //We don't want this.
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/reddot,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/flashlight/under,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	reciever_flags = AMMO_RECIEVER_TOGGLES_OPEN|AMMO_RECIEVER_TOGGLES_OPEN_EJECTS|AMMO_RECIEVER_HANDFULS
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 21,"rail_x" = 15, "rail_y" = 22, "under_x" = 21, "under_y" = 16, "stock_x" = 21, "stock_y" = 16)

	fire_delay = 0.2 SECONDS
	burst_delay = 2
	scatter = 4
	scatter_unwielded = 8
	recoil = 2
	recoil_unwielded = 4
	aim_slowdown = 0.6
	damage_mult = 0.7

/obj/item/weapon/gun/shotgun/double/sawn
	name = "锯短霰弹枪"
	desc = "一把双管霰弹枪，其枪管经过人为缩短以降低射程，从而增强近距离作战潜力。"
	icon_state = "sshotgun"
	worn_icon_state = "sshotgun"
	equip_slot_flags = ITEM_SLOT_BELT
	attachable_allowed = list()
	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 20,"rail_x" = 11, "rail_y" = 22, "under_x" = 18, "under_y" = 16, "stock_x" = 18, "stock_y" = 16)
	damage_mult = 1
	damage_falloff_mult = 2
	fire_delay = 0.2 SECONDS
	accuracy_mult = 0.9
	scatter = 4
	scatter_unwielded = 10
	recoil = 3
	recoil_unwielded = 5

//-------------------------------------------------------
//MARINE DOUBLE SHOTTY

/obj/item/weapon/gun/shotgun/double/marine
	name = "\improper SH-34双管霰弹枪"
	desc = "一把设计古老但坚固的双管霰弹枪，由地球政府殖民地海军陆战队使用。由于有枪管爆裂的报告，同时发射双管的能力已被禁用。使用12号霰弹，但一次只能装填2发。"
	equip_slot_flags = ITEM_SLOT_BACK
	icon_state = "ts34"
	worn_icon_state = "ts34"
	max_chamber_items = 2 //codex
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_sh34.ogg'
	hand_reload_sound = 'sound/weapons/guns/interact/shotgun_db_insert.ogg'
	cocked_sound = null //We don't want this.
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/scope/mini,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 17,"rail_x" = 15, "rail_y" = 19, "under_x" = 21, "under_y" = 13, "stock_x" = 13, "stock_y" = 16)

	fire_delay = 0.65 SECONDS
	burst_amount = 1
	scatter = 3
	scatter_unwielded = 10
	recoil = 0.5
	recoil_unwielded = 3


//-------------------------------------------------------
//PUMP SHOTGUN
//Shotguns in this category will need to be pumped each shot.

/obj/item/weapon/gun/shotgun/pump
	name = "\improper V10 泵动式霰弹枪"
	desc = "经典设计，采用过时的霰弹枪框架。V10将近距离火力与长期可靠性相结合。\n<b>需要泵动，这是特殊动作键。</b>"
	equip_slot_flags = ITEM_SLOT_BACK
	icon_state = "v10"
	worn_icon_state = "v10"
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	cocked_sound = 'sound/weapons/guns/interact/shotgun_pump.ogg'
	max_chamber_items = 8
	cock_delay = 1.4 SECONDS

	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	reciever_flags = AMMO_RECIEVER_HANDFULS|AMMO_RECIEVER_REQUIRES_UNIQUE_ACTION|AMMO_RECIEVER_UNIQUE_ACTION_LOCKS
	cocked_message = "You rack the pump."
	cock_locked_message = "The pump is locked! Fire it first!"
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 18,"rail_x" = 10, "rail_y" = 21, "under_x" = 20, "under_y" = 14, "stock_x" = 20, "stock_y" = 14)

	fire_delay = 2 SECONDS
	scatter_unwielded = 10
	recoil = 2
	recoil_unwielded = 4
	aim_slowdown = 0.45

/obj/item/weapon/gun/shotgun/pump/standard
	starting_attachment_types = list(
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/bayonet/converted,
	)

/obj/item/weapon/gun/shotgun/pump/freelancer
	starting_attachment_types = list(
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/gyro,
	)

//-------------------------------------------------------
//A shotgun, how quaint.
/obj/item/weapon/gun/shotgun/pump/cmb
	name = "\improper SH-12 圣骑士泵动式霰弹枪"
	desc = "一把九发泵动式霰弹枪。一种用于狩猎、家庭防卫和警务工作的霰弹枪，存在许多版本，几乎任何人都可以使用。"
	icon = 'icons/obj/items/guns/shotguns64.dmi'
	icon_state = "pal12"
	worn_icon_state = "pal12"
	fire_sound = 'sound/weapons/guns/fire/shotgun_cmb.ogg'
	reload_sound = 'sound/weapons/guns/interact/shotgun_cmb_insert.ogg'
	cocked_sound = 'sound/weapons/guns/interact/shotgun_cmb_pump.ogg'
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/compensator,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/stock/pal12,
	)
	item_map_variant_flags = NONE
	attachable_offset = list("muzzle_x" = 38, "muzzle_y" = 19,"rail_x" = 14, "rail_y" = 19, "under_x" = 37, "under_y" = 16, "stock_x" = 15, "stock_y" = 14)
	starting_attachment_types = list(
		/obj/item/attachable/stock/pal12,
	)

	fire_delay = 1.5 SECONDS
	damage_mult = 0.75
	accuracy_mult = 1.25
	accuracy_mult_unwielded = 1
	scatter_unwielded = 10
	recoil = 0 // It has a stock. It's on the sprite.
	recoil_unwielded = 0
	cock_delay = 1.2 SECONDS
	aim_slowdown = 0.4

/obj/item/weapon/gun/shotgun/pump/cmb/mag_harness
	starting_attachment_types = list(
		/obj/item/attachable/stock/pal12,
		/obj/item/attachable/magnetic_harness,
	)

//-------------------------------------------------------
//A shotgun, how quaint.
/obj/item/weapon/gun/shotgun/pump/trenchgun
	name = "\improper L-4034 堑壕枪"
	desc = "一把六发泵动式霰弹枪。一种用于狩猎、家庭防卫和警务工作的霰弹枪，存在多种版本，几乎被所有人使用。"
	icon = 'icons/obj/items/guns/shotguns64.dmi'
	icon_state = "trenchgun"
	worn_icon_state = "trenchgun"
	cock_animation = "trenchgun_pump"
	fire_sound = 'sound/weapons/guns/fire/trenchgun.ogg'
	reload_sound = 'sound/weapons/guns/interact/shotgun_cmb_insert.ogg'
	cocked_sound = 'sound/weapons/guns/interact/trenchgun_pump.ogg'
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/compensator,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/stock/trenchgun,
	)
	item_map_variant_flags = NONE
	attachable_offset = list("muzzle_x" = 34, "muzzle_y" = 19,"rail_x" = 12, "rail_y" = 21, "under_x" = 37, "under_y" = 16, "stock_x" = 0, "stock_y" = 12)
	starting_attachment_types = list(
		/obj/item/attachable/stock/trenchgun,
	)

	fire_delay = 1.2 SECONDS
	max_chamber_items = 5
	damage_mult = 0.75
	accuracy_mult_unwielded = 1

	scatter = 4
	min_scatter = 4
	scatter_increase = 8
	scatter_decay = 3
	scatter_decay_unwielded = 1

	scatter_unwielded = 10
	recoil = 0 // It has a stock. It's on the sprite.
	recoil_unwielded = 0
	cock_delay = 1.2 SECONDS
	aim_slowdown = 0.55

/obj/item/weapon/gun/shotgun/pump/trenchgun/icc_leader
	starting_attachment_types = list(
		/obj/item/attachable/stock/trenchgun,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/compensator,
	)

//------------------------------------------------------
// ML-101 Heavy Shotgun

/obj/item/weapon/gun/shotgun/pump/icc_heavyshotgun
	name = "\improper ML-101重型泵动式霰弹枪"
	desc = "奇怪的是在霰弹枪上使用了线膛枪管。ML-101霰弹枪被ICC人员部队用于在近距离摧毁目标。使用6号口径弹壳。\n<b>需要泵动，这是独特动作键。</b>"
	equip_slot_flags = ITEM_SLOT_BACK
	icon = 'icons/obj/items/guns/shotguns64.dmi'
	icon_state = "ks23"
	worn_icon_state = "ks23"
	caliber = CALIBER_6G //codex
	default_ammo_type = /datum/ammo/bullet/shotgun/heavy_buckshot
	fire_sound = 'sound/weapons/guns/fire/ks23.ogg'
	reload_sound = 'sound/weapons/guns/interact/ks23_insert.ogg'
	cocked_sound = 'sound/weapons/guns/interact/ks23_pump.ogg'
	max_chamber_items = 5
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/stock/icc_heavyshotgun,
		/obj/item/attachable/motiondetector,
	)

	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 18,"rail_x" = 9, "rail_y" = 21, "under_x" = 18, "under_y" = 12, "stock_x" = 0, "stock_y" = 12)
	item_map_variant_flags = NONE

	starting_attachment_types = list(
		/obj/item/attachable/stock/icc_heavyshotgun,
	)

	fire_delay = 2.75 SECONDS
	scatter_unwielded = 10
	recoil = 0 // It has a stock. It's on the sprite.
	recoil_unwielded = 0
	aim_slowdown = 0.65
	wield_delay = 0.95 SECONDS
	cock_delay = 1.4 SECONDS
	damage_falloff_mult = 0.5 // Rifled barrel, also has more slug variety

/obj/item/weapon/gun/shotgun/pump/icc_heavyshotgun/icc_leader
	starting_attachment_types = list(
		/obj/item/attachable/stock/icc_heavyshotgun,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/compensator,
	)

//------------------------------------------------------
//A hacky bolt action rifle. in here for the "pump" or bolt working action.

/obj/item/weapon/gun/shotgun/pump/bolt
	name = "\improper 莫辛-纳甘步枪"
	desc = "一把莫辛-纳甘步枪，光是看着它你就能感受到那层厚厚的枪油。在那些头脑简单的殖民者和法外之徒口中，它通常被戏称为'湿乎乎的土豆'。"
	icon = 'icons/obj/items/guns/marksman64.dmi'
	icon_state = "mosin"
	worn_icon_state = "mosin"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/marksman_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/marksman_right_1.dmi',
	)
	gun_crosshair = 'icons/UI_Icons/gun_crosshairs/sniper.dmi'
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_mosin.ogg'
	fire_rattle = 'sound/weapons/guns/fire/tgmc/kinetic/gun_mosin_low.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/sniper_empty.ogg'
	reload_sound = 'sound/weapons/guns/interact/mosin_reload.ogg'
	caliber = CALIBER_762X54 //codex
	load_method = SINGLE_CASING //codex
	max_chamber_items = 4 //codex
	default_ammo_type = /datum/ammo/bullet/sniper/svd
	allowed_ammo_types = list(/obj/item/ammo_magazine/rifle/boltclip)
	gun_skill_category = SKILL_RIFLES
	cocked_sound = 'sound/weapons/guns/interact/working_the_bolt.ogg'
	cocked_message = "You work the bolt."
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/mosin,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
		/obj/item/attachable/stock/mosin,
	)
	item_map_variant_flags = NONE
	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	attachable_offset = list("muzzle_x" = 37, "muzzle_y" = 18,"rail_x" = 14, "rail_y" = 19, "under_x" = 19, "under_y" = 14, "stock_x" = 15, "stock_y" = 12)
	starting_attachment_types = list(
		/obj/item/attachable/scope/mosin,
		/obj/item/attachable/stock/mosin,
	)
	actions_types = list(/datum/action/item_action/aim_mode)
	force = 20
	aim_fire_delay = 0.75 SECONDS
	aim_speed_modifier = 0.8

	fire_delay = 1.75 SECONDS
	accuracy_mult = 1.15
	accuracy_mult_unwielded = 0.7
	scatter = -1
	scatter_unwielded = 12
	recoil = -3
	recoil_unwielded = 4
	cock_delay = 1.2 SECONDS
	aim_slowdown = 1
	wield_delay = 1.4 SECONDS
	movement_acc_penalty_mult = 4.5

	placed_overlay_iconstate = "wood"

/obj/item/weapon/gun/shotgun/pump/bolt/unscoped
	starting_attachment_types = list(/obj/item/attachable/stock/mosin)

//***********************************************************
// Martini Henry

/obj/item/weapon/gun/shotgun/double/martini
	name = "\improper 马蒂尼-亨利杠杆式步枪"
	desc = "一把杠杆式步枪，可容纳一发.557/440球形弹。无论是猎象还是猎杀异形，其出枪速度都使其成为完美的选择。"
	equip_slot_flags = ITEM_SLOT_BACK
	icon = 'icons/obj/items/guns/marksman64.dmi'
	icon_state = "martini"
	worn_icon_state = "martini"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/marksman_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/marksman_right_1.dmi',
	)
	gun_crosshair = 'icons/UI_Icons/gun_crosshairs/sniper.dmi'
	shell_eject_animation = "martini_flick"
	caliber = CALIBER_557 //codex
	muzzle_flash_lum = 7
	max_chamber_items = 1 //codex
	ammo_datum_type = /datum/ammo/bullet/sniper/martini
	default_ammo_type = /datum/ammo/bullet/sniper/martini
	gun_skill_category = SKILL_RIFLES
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_martinihenry.ogg'
	reload_sound = 'sound/weapons/guns/interact/martini_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/martini_cocked.ogg'
	opened_sound = 'sound/weapons/guns/interact/martini_open.ogg'
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	attachable_offset = list("muzzle_x" = 45, "muzzle_y" = 23,"rail_x" = 17, "rail_y" = 25, "under_x" = 19, "under_y" = 14, "stock_x" = 15, "stock_y" = 12)
	aim_slowdown = 0.35
	aim_time = 0.5 SECONDS


	fire_delay = 1 SECONDS

	scatter = -25
	scatter_unwielded = 20

	recoil = 2
	recoil_unwielded = 4

	aim_slowdown = 1
	wield_delay = 1.2 SECONDS
	movement_acc_penalty_mult = 5

	placed_overlay_iconstate = "wood"
	damage_mult = 1

//***********************************************************
// Derringer

/obj/item/weapon/gun/shotgun/double/derringer
	name = "\improper R-2395 德林格手枪"
	desc = "R-2395德林格手枪几个世纪以来一直是经典之作。这款最新型号将等离子体推进火药与经典设计相结合，打造出一款几乎不留任何机会的刺杀武器。"
	icon_state = "derringer"
	worn_icon_state = "tp17"
	icon = 'icons/obj/items/guns/pistols.dmi'
	gun_skill_category = SKILL_PISTOLS
	w_class = WEIGHT_CLASS_TINY
	caliber = CALIBER_41RIM //codex
	muzzle_flash_lum = 5
	max_chamber_items = 2 //codex
	ammo_datum_type = /datum/ammo/bullet/pistol/superheavy/derringer
	default_ammo_type = /datum/ammo/bullet/pistol/superheavy/derringer
	fire_sound = 'sound/weapons/guns/fire/mateba.ogg'
	reload_sound = 'sound/weapons/guns/interact/shotgun_db_insert.ogg'
	cocked_sound = 'sound/weapons/guns/interact/martini_cocked.ogg'
	opened_sound = 'sound/weapons/guns/interact/martini_open.ogg'
	attachable_allowed = list()
	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES

	fire_delay = 0.2 SECONDS
	scatter = 0
	scatter_unwielded = 0
	recoil = 0
	recoil_unwielded = 0
	aim_slowdown = 0
	wield_delay = 0.3 SECONDS
	damage_mult = 1

/obj/item/weapon/gun/shotgun/double/derringer/Initialize(mapload)
	. = ..()
	if(round(rand(1, 10), 1) != 1)
		return
	base_gun_icon = "derringerw"
	update_icon()

//***********************************************************
// Yee Haw it's a cowboy lever action gun!

/obj/item/weapon/gun/shotgun/pump/lever
	name = "杠杆式步枪"
	desc = "一把.44马格南杠杆式步枪，带有侧面装填口。它的射速较低，但在狩猎中威力十足。"
	icon = 'icons/obj/items/guns/shotguns.dmi'
	icon_state = "mares_leg"
	worn_icon_state = "mares_leg"
	gun_crosshair = 'icons/UI_Icons/gun_crosshairs/rifle.dmi'
	fire_sound = 'sound/weapons/guns/fire/leveraction.ogg'//I like how this one sounds.
	dry_fire_sound = 'sound/weapons/guns/fire/sniper_empty.ogg'
	reload_sound = 'sound/weapons/guns/interact/mosin_reload.ogg'
	caliber = CALIBER_44 //codex
	load_method = SINGLE_CASING //codex
	max_chamber_items = 9 //codex
	default_ammo_type = /datum/ammo/bullet/revolver/tp44
	gun_skill_category = SKILL_RIFLES
	cocked_sound = 'sound/weapons/guns/interact/ak47_cocked.ogg'//good enough for now.
	cocked_message = "You work the lever."
	item_map_variant_flags = NONE
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/bayonet/converted,
	)
	attachable_offset = list("muzzle_x" = 50, "muzzle_y" = 21,"rail_x" = 8, "rail_y" = 21, "under_x" = 37, "under_y" = 16, "stock_x" = 20, "stock_y" = 14)
	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES

	fire_delay = 0.8 SECONDS
	accuracy_mult = 1.2
	accuracy_mult_unwielded = 0.7
	scatter = 2
	scatter_unwielded = 7
	recoil = 2
	recoil_unwielded = 4
	cock_delay = 0.6 SECONDS


// ***********************************************
// Leicester Rifle. The gun that won the west.

/obj/item/weapon/gun/shotgun/pump/lever/repeater
	name = "\improper 莱斯特连发枪"
	desc = "他们说这是赢得西部的枪。但太空是截然不同的边疆，使用.45-70政府型弹药。"
	icon = 'icons/obj/items/guns/marksman64.dmi'
	icon_state = "leicrepeater"
	worn_icon_state = "leicrepeater"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/marksman_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/marksman_right_1.dmi',
	)
	gun_crosshair = 'icons/UI_Icons/gun_crosshairs/rifle.dmi'
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_repeater.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/sniper_empty.ogg'
	reload_sound = 'sound/weapons/guns/interact/mosin_reload.ogg'
	caliber = CALIBER_4570 //codex
	load_method = SINGLE_CASING //codex
	max_chamber_items = 13 //codex
	default_ammo_type = /datum/ammo/bullet/rifle/repeater
	gun_skill_category = SKILL_RIFLES
	cocked_sound = 'sound/weapons/guns/interact/ak47_cocked.ogg'//good enough for now.
	item_map_variant_flags = NONE
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
	)
	attachable_offset = list ("muzzle_x" = 45, "muzzle_y" = 23,"rail_x" = 21, "rail_y" = 23, "under_x" = 19, "under_y" = 14, "stock_x" = 15, "stock_y" = 12)
	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	aim_fire_delay = 0.3 SECONDS
	aim_speed_modifier = 2

	fire_delay = 1 SECONDS
	accuracy_mult = 1
	accuracy_mult_unwielded = 0.8
	damage_falloff_mult = 0.5
	scatter = -5
	scatter_unwielded = 7
	recoil = 0
	recoil_unwielded = 2
	cock_delay = 0.2 SECONDS
	aim_slowdown = 0.6
	movement_acc_penalty_mult = 5

/obj/item/weapon/gun/shotgun/pump/lever/repeater/beginner
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/bayonet/converted)

//------------------------------------------------------
//MBX900 Lever Action Shotgun
/obj/item/weapon/gun/shotgun/pump/lever/mbx900
	name = "\improper MBX杠杆式霰弹枪"
	desc = "一把.410口径的杠杆式霰弹枪，射击速度几乎与操作杠杆的速度一样快。因其毁灭性且极其可靠的设计而闻名。"
	icon_state = "mbx900"
	worn_icon_state = "mbx900"
	fire_sound = 'sound/weapons/guns/fire/shotgun_light.ogg'//I like how this one sounds.
	dry_fire_sound = 'sound/weapons/guns/fire/sniper_empty.ogg'
	reload_sound = 'sound/weapons/guns/interact/mosin_reload.ogg'
	caliber = CALIBER_410
	load_method = SINGLE_CASING
	max_chamber_items = 9
	default_ammo_type = /datum/ammo/bullet/shotgun/mbx900_buckshot
	gun_skill_category = SKILL_SHOTGUNS
	cocked_sound = 'sound/weapons/guns/interact/ak47_cocked.ogg'

	attachable_allowed = list(
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/foldable/bipod,
		/obj/item/attachable/compensator,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/gyro,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/reddot,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/marine,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/verticalgrip,
	)
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 17,"rail_x" = 12, "rail_y" = 19, "under_x" = 27, "under_y" = 16, "stock_x" = 0, "stock_y" = 0)

	item_map_variant_flags = NONE

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	fire_delay = 0.6 SECONDS
	accuracy_mult = 1.2
	cock_delay = 0.2 SECONDS

//------------------------------------------------------
//SH-35 Pump shotgun
/obj/item/weapon/gun/shotgun/pump/t35
	name = "\improper SH-35 泵动式霰弹枪"
	desc = "地球政府军械库 SH-35 是地球政府殖民地海军陆战队使用的霰弹枪。当有人需要比大多数人更适合近距离作战的工具时，或者作为你背上的应急备用武器时，它被用作近战工具。使用 12 号口径霰弹。\n<b>需要泵动，这是独特动作键。</b>"
	equip_slot_flags = ITEM_SLOT_BACK
	icon = 'icons/obj/items/guns/shotguns64.dmi'
	icon_state = "t35"
	worn_icon_state = "t35"
	cock_animation = "t35_pump"
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_sh35.ogg'
	max_chamber_items = 8
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/foldable/t35stock,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
	)
	starting_attachment_types = list(/obj/item/attachable/foldable/t35stock)

	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 18,"rail_x" = 9, "rail_y" = 21, "under_x" = 18, "under_y" = 12, "stock_x" = -3, "stock_y" = 16)
	item_map_variant_flags = NONE

	fire_delay = 2 SECONDS
	scatter_unwielded = 10
	recoil = 2
	recoil_unwielded = 4
	aim_slowdown = 0.45
	cock_delay = 1.4 SECONDS

	placed_overlay_iconstate = "t35"

//buckshot variants
/obj/item/weapon/gun/shotgun/pump/t35/pointman
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	starting_attachment_types = list(/obj/item/attachable/foldable/t35stock, /obj/item/attachable/motiondetector, /obj/item/attachable/angledgrip, /obj/item/attachable/bayonet/converted)

/obj/item/weapon/gun/shotgun/pump/t35/standard
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	starting_attachment_types = list(/obj/item/attachable/foldable/t35stock, /obj/item/attachable/angledgrip, /obj/item/attachable/magnetic_harness, /obj/item/attachable/bayonet/converted)

/obj/item/weapon/gun/shotgun/pump/t35/back_slot //we need an apparent dupe due to uses in assoc lists
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	starting_attachment_types = list(/obj/item/attachable/foldable/t35stock, /obj/item/attachable/angledgrip, /obj/item/attachable/magnetic_harness, /obj/item/attachable/bayonet/converted)

/obj/item/weapon/gun/shotgun/pump/t35/nonstandard
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	starting_attachment_types = list(/obj/item/attachable/foldable/t35stock, /obj/item/attachable/angledgrip, /obj/item/attachable/magnetic_harness)

/obj/item/weapon/gun/shotgun/pump/t35/beginner
	default_ammo_type = /datum/ammo/bullet/shotgun/slug
	starting_attachment_types = list(/obj/item/attachable/foldable/t35stock, /obj/item/attachable/gyro, /obj/item/attachable/magnetic_harness, /obj/item/attachable/bayonet/converted)

/obj/item/weapon/gun/shotgun/pump/t35/beginner/flechette
	default_ammo_type = /datum/ammo/bullet/shotgun/flechette
	starting_attachment_types = list(/obj/item/attachable/foldable/t35stock, /obj/item/attachable/verticalgrip, /obj/item/attachable/magnetic_harness, /obj/item/attachable/bayonet/converted)

/obj/item/weapon/gun/shotgun/pump/t35/vgrip
	starting_attachment_types = list(/obj/item/attachable/foldable/t35stock, /obj/item/attachable/verticalgrip, /obj/item/attachable/magnetic_harness, /obj/item/attachable/bayonet)

//-------------------------------------------------------
//THE MYTH, THE GUN, THE LEGEND, THE DEATH, THE ZX

/obj/item/weapon/gun/shotgun/zx76
	name = "\improper ZX-76 突击霰弹枪"
	desc = "ZX-76突击霰弹枪，一款极其罕见的双管半自动战斗霰弹枪，具备双发模式。可能是近身格斗的无冕之王。拥有9发内置弹匣。"
	icon = 'icons/obj/items/guns/shotguns64.dmi'
	icon_state = "zx-76"
	worn_icon_state = "zx-76"
	equip_slot_flags = ITEM_SLOT_BACK
	max_chamber_items = 9 //codex
	caliber = CALIBER_12G //codex
	load_method = SINGLE_CASING //codex
	fire_sound = 'sound/weapons/guns/fire/shotgun_light.ogg'
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	aim_slowdown = 0.45
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/lasersight,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/grenade_launcher/underslung,
	)

	attachable_offset = list("muzzle_x" = 40, "muzzle_y" = 17,"rail_x" = 12, "rail_y" = 23, "under_x" = 29, "under_y" = 12, "stock_x" = 13, "stock_y" = 15)

	fire_delay = 1.75 SECONDS
	damage_mult = 0.9
	wield_delay = 0.95 SECONDS
	burst_amount = 2
	burst_delay = 0.01 SECONDS //basically instantaneous two shots
	extra_delay = 0.5 SECONDS
	scatter = 1
	burst_scatter_mult = 2 // 2x4=8
	accuracy_mult = 1
	autobalance_monitor_value = ZX_PRICE

/obj/item/weapon/gun/shotgun/zx76/standard
	starting_attachment_types = list(/obj/item/attachable/bayonet/converted, /obj/item/attachable/magnetic_harness, /obj/item/attachable/verticalgrip)

/obj/item/weapon/gun/shotgun/zx76/valhalla
	autobalance_monitor_value = null

//-------------------------------------------------------
//V-51 SOM shotgun


/obj/item/weapon/gun/shotgun/som
	name = "\improper V-51 战斗霰弹枪"
	desc = "V-51是火星之子使用的主要霰弹枪。虽然射速比其他一些半自动霰弹枪慢，但威力更强。"
	equip_slot_flags = ITEM_SLOT_BACK
	icon_state = "v51"
	icon = 'icons/obj/items/guns/shotguns64.dmi'
	worn_icon_state = "v51"
	fire_sound = SFX_SHOTGUN_SOM
	dry_fire_sound = 'sound/weapons/guns/fire/v51_empty.ogg'
	reload_sound = 'sound/weapons/guns/interact/v51_load.ogg'
	hand_reload_sound = 'sound/weapons/guns/interact/v51_load.ogg'
	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	max_chamber_items = 9
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/compensator,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/reddot,
	)
	attachable_offset = list("muzzle_x" = 45, "muzzle_y" = 18,"rail_x" = 26, "rail_y" = 22, "under_x" = 38, "under_y" = 12, "stock_x" = 14, "stock_y" = 16)

	fire_delay = 1.8 SECONDS
	accuracy_mult = 1.15
	accuracy_mult_unwielded = 0.6
	scatter = 4
	scatter_unwielded = 16
	damage_mult = 0.85
	recoil = 1
	recoil_unwielded = 4
	aim_slowdown = 0.35
	wield_delay = 0.85 SECONDS

/obj/item/weapon/gun/shotgun/som/pointman
	starting_attachment_types = list(/obj/item/attachable/bayonet/som, /obj/item/attachable/motiondetector)

/obj/item/weapon/gun/shotgun/som/standard
	starting_attachment_types = list(/obj/item/attachable/bayonet/som, /obj/item/attachable/magnetic_harness, /obj/item/attachable/flashlight/under)

/obj/item/weapon/gun/shotgun/som/back_slot
	starting_attachment_types = list(/obj/item/attachable/bayonet/som, /obj/item/attachable/magnetic_harness, /obj/item/attachable/flashlight/under)

/obj/item/weapon/gun/shotgun/som/support
	default_ammo_type = /datum/ammo/bullet/shotgun/flechette
	starting_attachment_types = list(/obj/item/attachable/bayonet/som, /obj/item/attachable/magnetic_harness)

/obj/item/weapon/gun/shotgun/som/burst
	name = "\improper V-51B突击霰弹枪"
	desc = "V-51B定制型。标准火星之子霰弹枪的升级版本，具备连发模式和炫酷涂装。既罕见又致命。"
	icon_state = "v51b"
	burst_amount = 2
	burst_delay = 0.5 SECONDS
	extra_delay = -0.2 SECONDS
	damage_mult = 1
	default_ammo_type = /datum/ammo/bullet/shotgun/flechette

/obj/item/weapon/gun/shotgun/som/burst/pointman
	default_ammo_type = /datum/ammo/bullet/shotgun/flechette
	starting_attachment_types = list(/obj/item/attachable/bayonet/som, /obj/item/attachable/motiondetector)

/obj/item/weapon/gun/shotgun/som/burst/ert
	default_ammo_type = /datum/ammo/bullet/shotgun/flechette
	starting_attachment_types = list(/obj/item/attachable/bayonet/som, /obj/item/attachable/magnetic_harness, /obj/item/attachable/flashlight/under)

//-------------------------------------------------------
//Inbuilt launcher for the V-31
/obj/item/weapon/gun/shotgun/micro_grenade
	name = "\improper VA-61微型导轨发射器"
	desc = "一门内置的轨道炮，用于发射所谓的'微型手雷'。通过使用轨道炮技术，弹丸无需任何推进剂，从而极大地增加了有效载荷的可用空间。"
	icon_state = "va61"
	icon = 'icons/obj/items/guns/attachments/gun.dmi'
	fire_sound = 'sound/weapons/guns/fire/pred_plasma_shot.ogg'
	max_chamber_items = 2
	gun_features_flags = GUN_IS_ATTACHMENT|GUN_AMMO_COUNTER|GUN_ATTACHMENT_FIRE_ONLY|GUN_WIELDED_STABLE_FIRING_ONLY|GUN_WIELDED_FIRING_ONLY
	attach_features_flags = NONE
	slot = ATTACHMENT_SLOT_STOCK
	default_ammo_type = /datum/ammo/bullet/micro_rail/airburst
	caliber = CALIBER_10G_RAIL
	type_of_casings = null

	fire_delay = 1.5 SECONDS
	accuracy_mult = 1.1
	scatter = 0
	recoil = 1

// KSG

/obj/item/weapon/gun/shotgun/pump/ksg
	name = "\improper L12泵动式霰弹枪"
	desc = "一把十四发容量的泵动式霰弹枪。令人叹为观止。发射12号霰弹，其十四发的容量使其在清房时游刃有余。侧面贴有标签，上书：'仅限近战使用！！'"
	icon = 'icons/obj/items/guns/shotguns64.dmi'
	icon_state = "l12"
	worn_icon_state = "l12"
	cock_animation = "l12_pump"
	fire_sound = 'sound/weapons/guns/fire/shotgun_heavy.ogg'
	reload_sound = 'sound/weapons/guns/interact/shotgun_cmb_insert.ogg'
	cocked_sound = 'sound/weapons/guns/interact/trenchgun_pump.ogg'
	default_ammo_type = /datum/ammo/bullet/shotgun/buckshot
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/compensator,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/verticalgrip,
	)
	item_map_variant_flags = NONE
	attachable_offset = list("muzzle_x" = 49, "muzzle_y" = 21,"rail_x" = 19, "rail_y" = 24, "under_x" = 40, "under_y" = 16, "stock_x" = 0, "stock_y" = 12)

	fire_delay = 2 SECONDS
	max_chamber_items = 14
	damage_mult = 0.85
	accuracy_mult_unwielded = 1

	scatter = 6
	min_scatter = 4
	scatter_increase = 8
	scatter_decay = 3
	scatter_decay_unwielded = 1

	scatter_unwielded = 10
	recoil = 0
	recoil_unwielded = 0
	cock_delay = 1.2 SECONDS
	aim_slowdown = 0.55

/obj/item/weapon/gun/shotgun/pump/ksg/standard
	starting_attachment_types = list(/obj/item/attachable/reddot, /obj/item/attachable/verticalgrip, /obj/item/attachable/compensator,)

/obj/item/weapon/gun/shotgun/pump/ksg/support
	starting_attachment_types = list(/obj/item/attachable/motiondetector, /obj/item/attachable/flashlight/under, /obj/item/attachable/compensator,)
