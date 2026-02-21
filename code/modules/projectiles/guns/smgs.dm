/obj/item/weapon/gun/smg
	icon = 'icons/obj/items/guns/submachineguns.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/submachineguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/submachineguns_right_1.dmi',
	)
	fire_sound = 'sound/weapons/guns/fire/smg_light.ogg'
	unload_sound = 'sound/weapons/guns/interact/smg_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/smg_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/smg_cocked.ogg'
	type_of_casings = "bullet"
	load_method = MAGAZINE //codex
	force = 8
	w_class = WEIGHT_CLASS_BULKY
	wield_delay = 0.6 SECONDS
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)
	gun_skill_category = SKILL_SMGS

	fire_delay = 0.3 SECONDS
	burst_amount = 3
	recoil_unwielded = 0.5
	akimbo_additional_delay = 0.2
	akimbo_scatter_mod = 8

//-------------------------------------------------------
// MP-19 Machinepistol. It fits here more.

/obj/item/weapon/gun/smg/standard_machinepistol
	name = "\improper MP-19 冲锋手枪"
	desc = "MP-19是地球政府殖民地海军陆战队标准配发的冲锋手枪。它以单手持握时后坐力低、散射小而闻名。通常由没有空间携带更大枪支的特种部队人员携带，例如卫生兵和工程兵。它使用10x20mm无壳弹。"
	icon_state = "t19"
	worn_icon_state = "t19"
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_mp19.ogg'
	caliber = CALIBER_10X20_CASELESS
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_AUTOBURST)
	max_shells = 30
	equip_slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_BELT
	type_of_casings = null
	default_ammo_type = /obj/item/ammo_magazine/smg/standard_machinepistol
	allowed_ammo_types = list(/obj/item/ammo_magazine/smg/standard_machinepistol)

	w_class = WEIGHT_CLASS_NORMAL
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/foldable/t19stock,
		/obj/item/attachable/compensator,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/gyro,
		/obj/item/attachable/motiondetector,
	)
	starting_attachment_types = list(/obj/item/attachable/foldable/t19stock)

	attachable_offset = list("muzzle_x" = 29, "muzzle_y" = 19,"rail_x" = 9, "rail_y" = 21, "under_x" = 21, "under_y" = 15, "stock_x" = -4, "stock_y" = 16)

	accuracy_mult = 1.1
	accuracy_mult_unwielded = 0.9
	recoil_unwielded = 0
	fire_delay = 0.15 SECONDS

	scatter = 0
	scatter_unwielded = 4

	aim_slowdown = 0.15
	movement_acc_penalty_mult = 2

	akimbo_scatter_mod = 24
	burst_amount = 5
	burst_delay = 0.1 SECONDS
	akimbo_additional_delay = 20 // Literally do not even bother to try

/obj/item/weapon/gun/smg/standard_machinepistol/compact
	starting_attachment_types = list(/obj/item/attachable/foldable/t19stock, /obj/item/attachable/reddot, /obj/item/attachable/compensator, /obj/item/attachable/lasersight)

/obj/item/weapon/gun/smg/standard_machinepistol/vgrip
	starting_attachment_types = list(/obj/item/attachable/foldable/t19stock, /obj/item/attachable/reddot, /obj/item/attachable/compensator, /obj/item/attachable/verticalgrip)

/obj/item/weapon/gun/smg/standard_machinepistol/scanner
	starting_attachment_types = list(/obj/item/attachable/foldable/t19stock, /obj/item/attachable/motiondetector, /obj/item/attachable/compensator, /obj/item/attachable/lasersight)

//-------------------------------------------------------
// War is hell. Not glorious.

/obj/item/weapon/gun/smg/standard_smg
	name = "\improper SMG-90冲锋枪"
	desc = "SMG-90是地球政府殖民地海军陆战队的标准制式冲锋枪。以其紧凑的尺寸和在战场上的易用性而闻名。通常由希望携带轻量级枪械进行突击的部队使用。它使用10x20毫米无壳弹。"
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_smg90.ogg'
	icon_state = "t90"
	worn_icon_state = "t90"
	caliber = CALIBER_10X20_CASELESS //codex
	max_shells = 80 //codex
	equip_slot_flags = ITEM_SLOT_BACK
	wield_delay = 0.7 SECONDS
	force = 20
	type_of_casings = null
	default_ammo_type = /obj/item/ammo_magazine/smg/standard_smg
	allowed_ammo_types = list(/obj/item/ammo_magazine/smg/standard_smg, /obj/item/ammo_magazine/smg/standard_smg/ap)
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/compensator,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 15,"rail_x" = 22, "rail_y" = 22, "under_x" = 17, "under_y" = 15, "stock_x" = 24, "stock_y" = 10)
	aim_fire_delay = 0.1 SECONDS
	aim_speed_modifier = 0.55
	accuracy_mult = 1.05
	accuracy_mult_unwielded = 0.9
	scatter = 1
	fire_delay = 0.15 SECONDS
	scatter_unwielded = 8
	aim_slowdown = 0.2
	burst_amount = 0

	placed_overlay_iconstate = "t90"

/obj/item/weapon/gun/smg/standard_smg/breacher
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness)

/obj/item/weapon/gun/smg/standard_smg/nonstandard
	starting_attachment_types = list(/obj/item/attachable/reddot)

/obj/item/weapon/gun/smg/standard_smg/tactical
	starting_attachment_types = list(/obj/item/attachable/compensator, /obj/item/attachable/reddot, /obj/item/attachable/lasersight)

/obj/item/weapon/gun/smg/standard_smg/freelancer
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/lasersight)
	default_ammo_type = /obj/item/ammo_magazine/smg/standard_smg/ap
//-------------------------------------------------------
//Da slapper.

/obj/item/weapon/gun/smg/standard_heavysmg
	name = "\improper SMG-45重型冲锋枪"
	desc = "SMG-45是地球政府殖民地海军陆战队使用的一款比通常更重的冲锋枪。以其在小巧枪身内蕴含的强大威力而闻名。通常由希望携带轻量级枪械进行突击、同时又能造成可观伤害的部队使用，但其在远距离作战中表现不佳。它使用.41 AE无壳弹。"
	icon = 'icons/obj/items/guns/submachineguns64.dmi'
	icon_state = "t45"
	worn_icon_state = "t45"
	caliber = CALIBER_41AE //codex
	max_shells = 55 //codex
	fire_sound = 'sound/weapons/guns/fire/skorpevo.ogg'
	unload_sound = 'sound/weapons/guns/interact/mp5_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/mp5_reload.ogg'
	equip_slot_flags = ITEM_SLOT_BACK
	type_of_casings = null
	default_ammo_type = /obj/item/ammo_magazine/smg/standard_heavysmg
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/smg/standard_heavysmg,
		/obj/item/ammo_magazine/smg/standard_heavysmg/squashhead,
	)
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/compensator,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/burstfire_assembly,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/gyro,
	)

	attachable_offset = list("muzzle_x" = 43, "muzzle_y" = 19,"rail_x" = 22, "rail_y" = 23, "under_x" = 32, "under_y" = 14, "stock_x" = 24, "stock_y" = 16)
	aim_fire_delay = 0.1 SECONDS

	aim_slowdown = 0.25
	accuracy_mult = 1.15
	accuracy_mult_unwielded = 0.85
	fire_delay = 0.25 SECONDS
	burst_delay =  0.2 SECONDS
	burst_amount = 3
	scatter = 2
	scatter_unwielded = 11
	akimbo_additional_delay = 0.4

//-------------------------------------------------------
//M-25 SMG

/obj/item/weapon/gun/smg/m25
	name = "\improper SMG-25冲锋枪"
	desc = "RivArms SMG-25冲锋枪，一款经典设计的更新。一种能够有效单手使用的轻型枪械，非常适合近中距离交战。使用10x20mm弹药，配备高容量弹匣。"
	icon = 'icons/obj/items/guns/submachineguns64.dmi'
	icon_state = "m25"
	worn_icon_state = "m25"
	caliber = CALIBER_10X20_CASELESS //codex
	max_shells = 60 //codex
	fire_sound = 'sound/weapons/guns/fire/mp5.ogg'
	unload_sound = 'sound/weapons/guns/interact/mp5_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/mp5_reload.ogg'
	equip_slot_flags = ITEM_SLOT_BACK
	type_of_casings = null
	default_ammo_type = /obj/item/ammo_magazine/smg/m25
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/smg/m25,
		/obj/item/ammo_magazine/smg/m25/ap,
		/obj/item/ammo_magazine/smg/m25/extended,
	)
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/compensator,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/burstfire_assembly,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/gyro,
	)

	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 17,"rail_x" = 9, "rail_y" = 20, "under_x" = 24, "under_y" = 14, "stock_x" = 24, "stock_y" = 16)

	accuracy_mult = 1.1
	accuracy_mult_unwielded = 0.95
	scatter = 4
	fire_delay = 0.2 SECONDS
	scatter_unwielded = 10
	aim_slowdown = 0.15
	burst_amount = 3
	akimbo_additional_delay = 0.4
	damage_falloff_mult = 0.9

/obj/item/weapon/gun/smg/m25/holstered
	starting_attachment_types = list(/obj/item/attachable/reddot, /obj/item/attachable/compensator, /obj/item/attachable/gyro)

/obj/item/weapon/gun/smg/m25/magharness
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/compensator, /obj/item/attachable/gyro)

/obj/item/weapon/gun/smg/m25/vgrip
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/compensator, /obj/item/attachable/verticalgrip)

/obj/item/weapon/gun/smg/m25/plasma
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/compensator, /obj/item/weapon/gun/pistol/plasma_pistol)

/obj/item/weapon/gun/smg/m25/elite
	name = "\improper SMG-25B2冲锋枪"
	desc = "RivArms SMG-25冲锋枪，B2型。配备一体式枪管充电器。这种可靠的武器发射穿甲10x20毫米弹药，由精锐部队使用。"
	icon_state = "m25b2"
	worn_icon_state = "m25b2"
	fire_sound = 'sound/weapons/guns/fire/smg_heavy.ogg'
	default_ammo_type = /obj/item/ammo_magazine/smg/m25/ap
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/compensator,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/burstfire_assembly,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/gyro,
	)

	item_map_variant_flags = NONE

	burst_amount = 4
	accuracy_mult = 1.1
	accuracy_mult_unwielded = 1
	damage_mult = 1.2
	aim_slowdown = 0.2
	scatter = 3

/obj/item/weapon/gun/smg/m25/elite/pmc
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/flashlight/under)

/obj/item/weapon/gun/smg/m25/elite/suppressed
	icon_state = "m25"
	worn_icon_state = "m25"
	starting_attachment_types = list(/obj/item/attachable/suppressor, /obj/item/attachable/magnetic_harness, /obj/item/attachable/verticalgrip)

/obj/item/weapon/gun/smg/m25/elite/suppressed/breacher
	starting_attachment_types = list(/obj/item/attachable/suppressor, /obj/item/attachable/magnetic_harness, /obj/item/attachable/gyro)

//-------------------------------------------------------
//SMG-27, based on the grease gun

/obj/item/weapon/gun/smg/mp7
	name = "\improper SMG-27冲锋枪"
	desc = "一种可追溯至数百年前的古老设计，SMG-27在其时代曾十分普遍。如今，它作为廉价的计算机打印复制品或家族传家宝而用途有限，尽管它不知何故落入了殖民地叛乱分子手中。"
	icon_state = "mp7"
	worn_icon_state = "mp7"
	caliber = CALIBER_46X30 //codex
	max_shells = 30 //codex
	fire_sound = 'sound/weapons/guns/fire/mp7.ogg'
	default_ammo_type = /obj/item/ammo_magazine/smg/mp7
	allowed_ammo_types = list(/obj/item/ammo_magazine/smg/mp7)
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
	)

	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 18,"rail_x" = 12, "rail_y" = 21, "under_x" = 28, "under_y" = 17, "stock_x" = 28, "stock_y" = 17)

	fire_delay = 0.3 SECONDS
	burst_delay = 0.2 SECONDS
	burst_amount = 4
	accuracy_mult_unwielded = 0.9
	scatter = 5
	scatter_unwielded = 10
	damage_mult = 1.2

//-------------------------------------------------------
//SKORPION //Based on the same thing.

/obj/item/weapon/gun/smg/skorpion
	name = "\improper CZ-81冲锋枪"
	desc = "一款坚固耐用的20世纪火器，兼具手枪和冲锋枪特性。使用20发弹匣发射.32ACP口径弹药。"
	icon = 'icons/obj/items/guns/submachineguns64.dmi'
	icon_state = "skorpion"
	worn_icon_state = "skorpion"
	caliber = CALIBER_32ACP //codex
	max_shells = 20 //codex
	equip_slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_NORMAL
	fire_sound = 'sound/weapons/guns/fire/skorpion.ogg'
	unload_sound = 'sound/weapons/guns/interact/skorpion_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/skorpion_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/skorpion_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/smg/skorpion
	allowed_ammo_types = list(/obj/item/ammo_magazine/smg/skorpion)
	attachable_allowed = list(
		/obj/item/attachable/foldable/skorpion_stock,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/magnetic_harness,
	)
	starting_attachment_types = list(/obj/item/attachable/foldable/skorpion_stock)
	attachable_offset = list("muzzle_x" = 29, "muzzle_y" = 21,"rail_x" = 10, "rail_y" = 24, "under_x" = 23, "under_y" = 15, "stock_x" = -21, "stock_y" = -1)

	burst_delay = 0.1 SECONDS
	accuracy_mult = 1.1
	accuracy_mult_unwielded = 0.9
	scatter = 2
	scatter_unwielded = 6
	fire_delay = 0.1 SECONDS
	aim_slowdown = 0.3
	wield_delay = 0.5 SECONDS

/obj/item/weapon/gun/smg/skorpion/mag_harness
	starting_attachment_types = list(/obj/item/attachable/foldable/skorpion_stock, /obj/item/attachable/magnetic_harness)

//-------------------------------------------------------
//PPSH //Based on the PPSh-41.

/obj/item/weapon/gun/smg/ppsh
	name = "\improper PPSh-17b 冲锋枪"
	desc = "PPSh-17b 或称'帕帕沙'是 20 世纪苏联型号冲锋枪的复制品，多年来被许多恐怖组织仿制。尽管其单发威力较小，但其可靠性、极高的耐用性和高射速在用户手中证明是有用的。"
	icon = 'icons/obj/items/guns/submachineguns64.dmi'
	icon_state = "ppsh"
	worn_icon_state = "ppsh"
	caliber = CALIBER_762X25 //codex
	max_shells = 42 //codex
	equip_slot_flags = ITEM_SLOT_BACK
	fire_sound = 'sound/weapons/guns/fire/ppsh.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/ppsh_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/ppsh_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/ppsh_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/ppsh_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/smg/ppsh
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/smg/ppsh,
		/obj/item/ammo_magazine/smg/ppsh/extended,
	)
	attachable_allowed = list(
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/stock/ppsh,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/gyro,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/foldable/bipod,
	)

	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES
	attachable_offset = list("muzzle_x" = 38, "muzzle_y" = 19,"rail_x" = 13, "rail_y" = 21, "under_x" = 26, "under_y" = 15, "stock_x" = 19, "stock_y" = 13)
	aim_fire_delay = 0.15 SECONDS
	aim_speed_modifier = 2.5

	starting_attachment_types = list(
		/obj/item/attachable/stock/ppsh,
	)

	fire_delay = 0.1 SECONDS
	burst_amount = 1
	accuracy_mult = 1.05
	accuracy_mult_unwielded = 0.8
	akimbo_additional_delay = 0.5

	min_scatter = 2
	min_scatter_unwielded = 3
	max_scatter = 15
	max_scatter_unwielded = 25
	scatter_increase = 2
	scatter_increase_unwielded = 8
	scatter_decay = 0.5
	scatter_decay_unwielded = 0.1

//-------------------------------------------------------
//GENERIC UZI //Based on the uzi submachinegun, of course.

/obj/item/weapon/gun/smg/uzi
	name = "\improper SMG-2冲锋枪"
	desc = "这款冲锋枪设计廉价、制造可靠，尽管年代久远却依然实用。将快慢机调至全自动模式可获得最大火力。如果你真的想大干一场，不妨用上两把。"
	icon_state = "uzi"
	worn_icon_state = "uzi"
	caliber = CALIBER_9X19 //codex
	max_shells = 32 //codex
	fire_sound = 'sound/weapons/guns/fire/uzi.ogg'
	unload_sound = 'sound/weapons/guns/interact/uzi_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/uzi_reload.ogg'
	cocked_sound = 'sound/weapons/guns/interact/uzi_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/smg/uzi
	allowed_ammo_types = list(/obj/item/ammo_magazine/smg/uzi, /obj/item/ammo_magazine/smg/uzi/extended)
	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 20,"rail_x" = 11, "rail_y" = 27, "under_x" = 22, "under_y" = 16, "stock_x" = 22, "stock_y" = 16)

	fire_delay = 0.15 SECONDS
	burst_amount = 4
	accuracy_mult_unwielded = 0.9
	scatter = 0
	scatter_unwielded = 4
	aim_slowdown = 0.15
	wield_delay = 0.4 SECONDS

/obj/item/weapon/gun/smg/uzi/mag_harness
	default_ammo_type = /obj/item/ammo_magazine/smg/uzi/extended
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness)

//-------------------------------------------------------
// SOM SMG

/obj/item/weapon/gun/smg/som
	name = "\improper V-21冲锋枪"
	desc = "V-21是火星之子使用的主要冲锋枪，设计为可单手或双手有效使用，并具有可变射速。当以全速射击时，除非正确握持，否则其性能会严重下降，而较低射速在必要时仍可单手有效使用。它使用10x20毫米无壳弹。"
	icon_state = "v21"
	icon = 'icons/obj/items/guns/submachineguns64.dmi'
	worn_icon_state = "v21"
	caliber = CALIBER_10X20_CASELESS
	max_shells = 50
	equip_slot_flags = ITEM_SLOT_BACK
	type_of_casings = null
	default_ammo_type = /obj/item/ammo_magazine/smg/som
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/smg/som,
		/obj/item/ammo_magazine/smg/som/ap,
		/obj/item/ammo_magazine/smg/som/incendiary,
		/obj/item/ammo_magazine/smg/som/extended,
		/obj/item/ammo_magazine/smg/som/rad,
	)
	fire_sound = 'sound/weapons/guns/fire/vector_fire.ogg'
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_AUTOBURST) //full auto, fuller auto

	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/compensator,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
	)

	attachable_offset = list("muzzle_x" = 38, "muzzle_y" = 20,"rail_x" = 13, "rail_y" = 22, "under_x" = 31, "under_y" = 15, "stock_x" = 24, "stock_y" = 10)

	fire_delay = 0.15 SECONDS
	aim_slowdown = 0.15
	wield_delay = 0.6 SECONDS

	accuracy_mult = 1.05
	accuracy_mult_unwielded = 0.9

	recoil = 0
	recoil_unwielded = 0.5

	scatter = 2
	scatter_unwielded = 8

	burst_amount = 1
	burst_delay = 0.1 SECONDS
	extra_delay = 0.1 SECONDS
	autoburst_delay = 0.1 SECONDS //this makes it fuller auto
	burst_accuracy_bonus = -0.3
	burst_scatter_mult = 15

	akimbo_additional_delay = 0.7

/obj/item/weapon/gun/smg/som/scout
	starting_attachment_types = list(
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/compensator,
		/obj/item/attachable/motiondetector,
	)

/obj/item/weapon/gun/smg/som/one_handed
	starting_attachment_types = list(
		/obj/item/attachable/lasersight,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
	)

/obj/item/weapon/gun/smg/som/veteran
	default_ammo_type = /obj/item/ammo_magazine/smg/som/ap
	starting_attachment_types = list(
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/compensator,
		/obj/item/attachable/reddot,
	)

/obj/item/weapon/gun/smg/som/support
	starting_attachment_types = list(
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/compensator,
		/obj/item/attachable/magnetic_harness,
	)

/obj/item/weapon/gun/smg/som/basic
	starting_attachment_types = list(
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/magnetic_harness,
	)

//-------------------------------------------------------
// PL-38, ICC Machinepistol

/obj/item/weapon/gun/smg/icc_machinepistol
	name = "\improper PL-38 冲锋手枪"
	desc = "PL-38是一款由ICCAF后方人员使用的冲锋手枪，它在紧凑的尺寸下提供了中远距离的可靠性能，但射速在本类别中偏慢。它使用10x20mm无壳弹。"
	icon = 'icons/obj/items/guns/submachineguns64.dmi'
	icon_state = "pl38"
	worn_icon_state = "pl38"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/submachineguns_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/submachineguns_right_64.dmi',
	)

	inhand_x_dimension = 64
	inhand_y_dimension = 32

	caliber = CALIBER_10X20_CASELESS //codex
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_AUTOBURST)
	max_shells = 32 //codex
	equip_slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_BELT
	type_of_casings = null
	default_ammo_type = /obj/item/ammo_magazine/smg/icc_machinepistol
	allowed_ammo_types = list(/obj/item/ammo_magazine/smg/icc_machinepistol, /obj/item/ammo_magazine/smg/icc_machinepistol/hp)
	fire_sound = SFX_MP38_FIRE
	unload_sound = 'sound/weapons/guns/interact/mp38_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/mp38_reload.ogg'

	w_class = WEIGHT_CLASS_NORMAL
	attachable_allowed = list(
		/obj/item/attachable/foldable/icc_machinepistol,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/foldable/t19stock,
		/obj/item/attachable/compensator,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/gyro,
		/obj/item/attachable/motiondetector,
	)
	starting_attachment_types = list(/obj/item/attachable/foldable/icc_machinepistol)

	attachable_offset = list("muzzle_x" = 29, "muzzle_y" = 19,"rail_x" = 9, "rail_y" = 21, "under_x" = 21, "under_y" = 15, "stock_x" = -4, "stock_y" = 16)

	burst_amount = 1
	accuracy_mult = 1.1
	accuracy_mult_unwielded = 0.65
	recoil_unwielded = 0
	fire_delay = 0.2 SECONDS

	scatter = 2
	scatter_unwielded = 5
	aim_slowdown = 0.2
	wield_delay = 0.55 SECONDS

/obj/item/weapon/gun/smg/icc_machinepistol/medic
	starting_attachment_types = list(/obj/item/attachable/foldable/icc_machinepistol, /obj/item/attachable/magnetic_harness, /obj/item/attachable/verticalgrip, /obj/item/attachable/extended_barrel)

//-------------------------------------------------------
// L-40, ICC PDW

/obj/item/weapon/gun/smg/icc_pdw
	name = "\improper L-40 个人防卫武器"
	desc = "L-40是ICCAF的主要冲锋枪，因其穿甲高速弹而通常被称为'PDW'，虽然具备足够的远程性能，但主要针对近距离战斗进行了调校。它使用4.6毫米高速无壳弹。"
	icon = 'icons/obj/items/guns/submachineguns64.dmi'
	icon_state = "l40"
	worn_icon_state = "l40"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/submachineguns_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/submachineguns_right_64.dmi',
	)

	inhand_x_dimension = 64
	inhand_y_dimension = 32

	caliber = CALIBER_46X30
	max_shells = 45
	equip_slot_flags = ITEM_SLOT_BACK
	type_of_casings = null
	default_ammo_type = /obj/item/ammo_magazine/smg/icc_pdw
	allowed_ammo_types = list(/obj/item/ammo_magazine/smg/icc_pdw)
	fire_sound = 'sound/weapons/guns/fire/vector_fire.ogg'
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)

	attachable_allowed = list(
		/obj/item/attachable/stock/icc_pdw,
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/compensator,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung/mpi/removeable,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
	)
	starting_attachment_types = list(/obj/item/attachable/stock/icc_pdw)

	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 17,"rail_x" = 13, "rail_y" = 20, "under_x" = 31, "under_y" = 13, "stock_x" = 9, "stock_y" = 10)
	aim_fire_delay = 0.1 SECONDS
	aim_speed_modifier = 0.55

	burst_amount = 1
	fire_delay = 0.15 SECONDS
	aim_slowdown = 0.25
	wield_delay = 0.6 SECONDS

	accuracy_mult = 1.05
	accuracy_mult_unwielded = 0.9

	recoil = 0
	recoil_unwielded = 0.5

	scatter = 3
	scatter_unwielded = 8
	damage_falloff_mult = 1.5

/obj/item/weapon/gun/smg/icc_pdw/standard
	starting_attachment_types = list(/obj/item/attachable/stock/icc_pdw, /obj/item/attachable/magnetic_harness, /obj/item/attachable/verticalgrip, /obj/item/attachable/extended_barrel)

//-------------------------------------------------------
// C17 Riot PDW, no longer in use with the VSD

/obj/item/weapon/gun/smg/vsd_pdw
	name = "\improper C17防暴个人防卫武器"
	desc = "C17 PDW，由Crash Core制造，供民用。使用.45 ACP穿甲弹，配备55发弹鼓，精度和射速尚可。本意用于镇压监狱暴动，但造成的击杀比逮捕更多。"
	icon = 'icons/obj/items/guns/submachineguns.dmi'
	icon_state = "c17"
	worn_icon_state = "c17"
	caliber = CALIBER_45ACP //codex
	max_shells = 55 //codex
	fire_sound = 'sound/weapons/guns/fire/smg_light.ogg'
	unload_sound = 'sound/weapons/guns/interact/m16_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/m16_reload.ogg'
	equip_slot_flags = ITEM_SLOT_BACK
	type_of_casings = null
	default_ammo_type = /obj/item/ammo_magazine/smg/vsd_pdw
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/smg/vsd_pdw,
	)
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/compensator,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/burstfire_assembly,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/gyro,
	)

	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 18,"rail_x" = 14, "rail_y" = 21, "under_x" = 24, "under_y" = 15, "stock_x" = 24, "stock_y" = 16)
	aim_fire_delay = 0.1 SECONDS

	aim_slowdown = 0.25
	accuracy_mult = 0.55
	accuracy_mult_unwielded = 0.85
	fire_delay = 0.25 SECONDS
	burst_delay =  0.2 SECONDS
	burst_amount = 4
	scatter = 3
	scatter_unwielded = 11
	akimbo_additional_delay = 0.4

/obj/item/weapon/gun/smg/vsd_pdw/standard
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/verticalgrip, /obj/item/attachable/compensator)

/obj/item/weapon/gun/smg/vsd_pdw/medic
	starting_attachment_types = list(/obj/item/attachable/motiondetector, /obj/item/attachable/lasersight, /obj/item/attachable/extended_barrel)

//-------------------------------------------------------
// RA-VAL, PMC smg

/obj/item/weapon/gun/smg/val
	name = "\improper RA-VAL 冲锋枪"
	desc = "RA-VAL是一款比常规冲锋枪更重的武器，由纳米传讯承包商使用。以其在小巧体积内蕴含的强大威力而闻名。通常由那些希望携带轻量级枪械进行突击，同时又能造成可观伤害的部队使用。然而，由于使用9x39毫米口径的重型弹道弹药，它在远距离作战中表现不佳。"
	icon = 'icons/obj/items/guns/submachineguns64.dmi'
	icon_state = "val"
	worn_icon_state = "val"
	caliber = CALIBER_9X39 //codex
	max_shells = 50 //codex
	aim_slowdown = 0.25
	fire_sound = 'sound/weapons/guns/fire/skorpevo.ogg'
	unload_sound = 'sound/weapons/guns/interact/mp5_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/mp5_reload.ogg'
	equip_slot_flags = ITEM_SLOT_BACK
	type_of_casings = null
	default_ammo_type = /obj/item/ammo_magazine/smg/val
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/smg/val,
	)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/burstfire_assembly,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/attachable/gyro,
	)

	attachable_offset = list("muzzle_x" = 43, "muzzle_y" = 19,"rail_x" = 11, "rail_y" = 23, "under_x" = 22, "under_y" = 16, "stock_x" = 24, "stock_y" = 16)

	accuracy_mult = 1.15
	accuracy_mult_unwielded = 0.85
	fire_delay = 0.2 SECONDS
	burst_delay =  0.15 SECONDS
	burst_amount = 4
	scatter = 2
	scatter_unwielded = 11

/obj/item/weapon/gun/smg/val/pmc_standard
	starting_attachment_types = list(/obj/item/attachable/magnetic_harness, /obj/item/attachable/flashlight/under,)
