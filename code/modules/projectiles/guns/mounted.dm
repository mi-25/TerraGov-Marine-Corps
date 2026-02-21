///box for storage of ammo and gun
/obj/item/storage/box/hsg_102
	name = "\improper HSG-102 板条箱"
	desc = "一个巨大且生锈的金属箱。它看起来没怎么使用过。顶部有褪色的字样写着：'这是一把HSG-102重型智能机枪'。上面还有许多其他警告标签，但已经褪色得无法辨认。"
	icon = 'icons/obj/items/ammo/machinegun.dmi'
	icon_state = "hsg102_crate"
	w_class = WEIGHT_CLASS_HUGE

/obj/item/storage/box/hsg_102/Initialize(mapload)
	. = ..()
	storage_datum.storage_slots = 7
	storage_datum.storage_type_limits = list(
		/obj/item/weapon/gun/hsg_102,
		/obj/item/ammo_magazine/hsg_102,
	)

/obj/item/storage/box/hsg_102/PopulateContents()
	new /obj/item/weapon/gun/hsg_102(src) //gun itself
	new /obj/item/ammo_magazine/hsg_102(src) //ammo for the gun

///HSG-102, now with full auto. It is not a superclass of deployed guns, however there are a few varients.
/obj/item/weapon/gun/hsg_102
	name = "\improper HSG-102 车载重型智能机枪"
	desc = "HSG-102重型机枪，过于沉重，没有三脚架无法持握或操作。具备敌我识别功能。无需额外操作，只需用Ctrl+点击部署。部署后可用喷枪修复。"

	w_class = WEIGHT_CLASS_HUGE
	equip_slot_flags = ITEM_SLOT_BACK
	icon = 'icons/obj/machines/deployable/heavy_smartgun.dmi'
	icon_state = "turret"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/misc_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/misc_right_1.dmi',
	)

	fire_sound = 'sound/weapons/guns/fire/hmg2.ogg'
	reload_sound = 'sound/weapons/guns/interact/minigun_cocked.ogg'

	default_ammo_type = /obj/item/ammo_magazine/hsg_102

	scatter = 10
	deployed_scatter_change = -10
	fire_delay = 0.25 SECONDS

	burst_amount = 3
	burst_delay = 0.1 SECONDS
	extra_delay = 1 SECONDS
	accuracy_mult = 1.2 //it's got a bipod
	burst_accuracy_bonus = 1
	burst_scatter_mult = 0

	item_flags = IS_DEPLOYABLE|TWOHANDED
	gun_features_flags = GUN_AMMO_COUNTER|GUN_DEPLOYED_FIRE_ONLY|GUN_WIELDED_FIRING_ONLY|GUN_IFF|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOMATIC)

	attachable_allowed = list(
		/obj/item/attachable/scope/unremovable/hsg_102,
	)

	starting_attachment_types = list(
		/obj/item/attachable/scope/unremovable/hsg_102,
	)

	allowed_ammo_types = list(
		/obj/item/ammo_magazine/hsg_102,
	)

	deploy_time = 5 SECONDS
	undeploy_time = 3 SECONDS
	deployable_item = /obj/machinery/deployable/mounted

	max_integrity = 200
	soft_armor = list(MELEE = 0, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 100, FIRE = 0, ACID = 20)

///Unmovable ship mounted version.
/obj/item/weapon/gun/hsg_102/hsg_nest
	name = "\improper HSG-102重型智能机枪巢"
	desc = "一门HSG-102重型智能机枪架设在一个加固的小型支柱上，周围堆有沙袋，为您提供满足所有防御需求的简易机枪阵地。</span>"
	icon_state = "entrenched"

	default_ammo_type = /obj/item/ammo_magazine/hsg_102/hsg_nest

	attachable_allowed = list(/obj/item/attachable/scope/unremovable/hsg_102/nest)
	starting_attachment_types = list(
		/obj/item/attachable/scope/unremovable/hsg_102/nest,
	)

	allowed_ammo_types = list(
		/obj/item/ammo_magazine/hsg_102,
		/obj/item/ammo_magazine/hsg_102/hsg_nest,
	)
	item_flags = IS_DEPLOYABLE|TWOHANDED|DEPLOYED_NO_PICKUP|DEPLOY_ON_INITIALIZE
	soft_armor = list(MELEE = 0, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 100, FIRE = 0, ACID = 0)

/obj/item/weapon/gun/hsg_102/hsg_nest/sandless
	icon_state = "entrenched_sandless"

//-------------------------------------------------------
//MG-2005 mounted minigun

/obj/item/weapon/gun/standard_minigun
	name = "\improper MG-2005 车载转管机枪"
	desc = "MG-2005 架设式转管机枪原理简单，它能以极快的速度倾泻大量子弹，将异形群撕成碎片。"

	w_class = WEIGHT_CLASS_HUGE
	equip_slot_flags = ITEM_SLOT_BACK
	icon = 'icons/obj/machines/deployable/minigun.dmi'
	icon_state = "minigun"
	caliber = CALIBER_762X51

	fire_sound = 'sound/weapons/guns/fire/minigun.ogg'
	reload_sound = 'sound/weapons/guns/interact/minigun_cocked.ogg'

	default_ammo_type = /obj/item/ammo_magazine/heavy_minigun

	scatter = 10
	deployed_scatter_change = -8
	fire_delay = 0.10 SECONDS
	windup_delay = 0.4 SECONDS
	windup_sound = 'sound/weapons/guns/fire/tank_minigun_start.ogg'

	item_flags = IS_DEPLOYABLE|TWOHANDED
	gun_features_flags = GUN_AMMO_COUNTER|GUN_DEPLOYED_FIRE_ONLY|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	aim_time = 2 SECONDS
	aim_fire_delay = 0.05 SECONDS

	attachable_allowed = list(/obj/item/attachable/scope/unremovable/hsg_102)

	starting_attachment_types = list(/obj/item/attachable/scope/unremovable/hsg_102)

	allowed_ammo_types = list(/obj/item/ammo_magazine/heavy_minigun)

	deploy_time = 5 SECONDS
	undeploy_time = 3 SECONDS
	deployable_item = /obj/machinery/deployable/mounted

	max_integrity = 300
	soft_armor = list(MELEE = 0, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 100, FIRE = 0, ACID = 20)

///Unmovable ship mounted version.
/obj/item/weapon/gun/standard_minigun/nest
	name = "\improper MG-2005 型架设式加特林机枪巢"
	desc = "一挺MG-2005型加特林机枪，安装在一个由沙袋加固的小型支柱上。"
	icon = 'icons/obj/machines/deployable/minigun.dmi'
	icon_state = "minigun_nest"

	item_flags = IS_DEPLOYABLE|TWOHANDED|DEPLOYED_NO_PICKUP|DEPLOY_ON_INITIALIZE

	attachable_allowed = list(/obj/item/attachable/scope/unremovable/hsg_102/nest)

	starting_attachment_types = list(/obj/item/attachable/scope/unremovable/hsg_102/nest)

	soft_armor = list(MELEE = 0, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 100, FIRE = 0, ACID = 20)

//-------------------------------------------------------
//ATR-22 mounted heavy anti-air gun

/obj/item/weapon/gun/standard_auto_cannon
	name = "\improper ATR-22 车载防空炮"
	desc = "ATR-22是一款后坐式20毫米自动炮，设计用于对抗低空飞行目标，但它也能在中距离高效打击地面目标，尽管其后坐力使得几乎不可能命中近距离目标。它的弹道能撕裂装甲敌人或墙壁等硬目标。两个炮管可以同时而非依次开火，但这样做会带来巨大的散布惩罚。"
	w_class = WEIGHT_CLASS_HUGE
	equip_slot_flags = ITEM_SLOT_BACK
	icon = 'icons/obj/machines/deployable/atr22.dmi'
	icon_state = "atr22"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/misc_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/misc_right_1.dmi',
	)
	fire_sound = SFX_AC_FIRE
	reload_sound = 'sound/weapons/guns/interact/minigun_cocked.ogg'

	default_ammo_type = /obj/item/ammo_magazine/auto_cannon

	scatter = 10
	deployed_scatter_change = -10
	fire_delay = 0.4 SECONDS
	burst_amount = 12
	burst_delay = 0.2 SECONDS
	burst_scatter_mult = 0.65
	extra_delay = 1.5 SECONDS

	item_flags = IS_DEPLOYABLE|TWOHANDED|DEPLOYED_NO_PICKUP|DEPLOY_ON_INITIALIZE
	gun_features_flags = GUN_AMMO_COUNTER|GUN_DEPLOYED_FIRE_ONLY|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC, GUN_FIREMODE_BURSTFIRE, GUN_FIREMODE_AUTOBURST)

	attachable_allowed = list(/obj/item/attachable/scope/unremovable/standard_atgun)

	starting_attachment_types = list(/obj/item/attachable/scope/unremovable/standard_atgun)

	allowed_ammo_types = list(
		/obj/item/ammo_magazine/auto_cannon,
		/obj/item/ammo_magazine/auto_cannon/flak,
	)

	undeploy_time = 2000 SECONDS
	deployable_item = /obj/machinery/deployable/mounted/moveable/auto_cannon

	max_integrity = 500
	soft_armor = list(MELEE = 60, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 100, FIRE = 0, ACID = 0)

/obj/machinery/deployable/mounted/moveable/auto_cannon
	resistance_flags = XENO_DAMAGEABLE|UNACIDABLE
	coverage = 85 //has a shield

//-------------------------------------------------------
//TE-9001 mounted heavy laser

/obj/item/weapon/gun/energy/lasgun/lasrifle/heavy_laser
	name = "\improper TE-9001 架设式重型激光炮"
	desc = "TE-9001 架设式重型激光器是一种非敌我识别重型激光器，其威力足以在命中点引发大规模火焰，该武器在区域拒止方面表现卓越，并具备侧向直射能力。"

	w_class = WEIGHT_CLASS_HUGE
	equip_slot_flags = ITEM_SLOT_BACK
	icon = 'icons/obj/machines/deployable/heavy_laser.dmi'
	icon_state = "heavylaser"

	fire_sound = 'sound/weapons/guns/fire/tank_flamethrower.ogg'
	reload_sound = 'sound/weapons/guns/interact/minigun_cocked.ogg'

	default_ammo_type = /obj/item/cell/lasgun/heavy_laser
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/heavy_laser

	scatter = 10
	deployed_scatter_change = -10
	fire_delay = 0.7 SECONDS

	item_flags = IS_DEPLOYABLE|TWOHANDED|DEPLOYED_NO_PICKUP|DEPLOY_ON_INITIALIZE
	gun_features_flags = GUN_AMMO_COUNTER|GUN_DEPLOYED_FIRE_ONLY|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES|GUN_AMMO_COUNT_BY_SHOTS_REMAINING
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)

	attachable_allowed = list(/obj/item/attachable/scope/unremovable/hsg_102/nest)

	starting_attachment_types = list(/obj/item/attachable/scope/unremovable/hsg_102/nest)

	allowed_ammo_types = list(/obj/item/cell/lasgun/heavy_laser)

	deploy_time = 5 SECONDS
	undeploy_time = 3 SECONDS
	deployable_item = /obj/machinery/deployable/mounted

	max_integrity = 400
	soft_armor = list(MELEE = 0, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 100, FIRE = 0, ACID = 0)

	mode_list = list(
		"Standard" = /datum/lasrifle/heavy_laser/standard,
		"Shatter Burst" = /datum/lasrifle/heavy_laser/burst,
		"Ricochet" = /datum/lasrifle/heavy_laser/ricochet,
	)

/datum/lasrifle/heavy_laser/standard
	rounds_per_shot = 15
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/heavy_laser
	fire_delay = 0.7 SECONDS
	burst_amount = 1
	fire_sound = 'sound/weapons/guns/fire/tank_flamethrower.ogg'
	message_to_user = "You set the heavy laser to glob mode."
	fire_mode = GUN_FIREMODE_SEMIAUTO
	radial_icon_state = "laser_overcharge"
	description = "Fires a laser glob that ignites things on hit."

/datum/lasrifle/heavy_laser/burst
	rounds_per_shot = 5
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/shatter/heavy_laser
	fire_delay = 1 SECONDS
	burst_amount = 3
	fire_sound = 'sound/weapons/guns/fire/Laser Rifle Standard.ogg'
	message_to_user = "You set the heavy laser to burst fire mode."
	fire_mode = GUN_FIREMODE_AUTOBURST
	icon_state = "heavylaser"
	description = "Fires a rapid pulse laser, dealing mediocre damage and shattering armor, but suffers from increased scatter and poorer falloff."

/datum/lasrifle/heavy_laser/ricochet
	rounds_per_shot = 15
	fire_delay = 0.5 SECONDS
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/ricochet/four
	fire_sound = 'sound/weapons/guns/fire/laser3.ogg'
	message_to_user = "You set the heavy laser to ricochet mode."
	fire_mode = GUN_FIREMODE_SEMIAUTO
	icon_state = "heavylaser"
	radial_icon_state = "laser_ricochet"
	description = "Fires an experiment laser pulse capable of bouncing off many wall surfaces. The laser increases in potency when bouncing, before collapsing entirely after exceeding its threshold."

/obj/item/weapon/gun/energy/lasgun/lasrifle/heavy_laser/deployable
	icon_state = "heavylaser_deployable"
	item_flags = IS_DEPLOYABLE|TWOHANDED

//-------------------------------------------------------
//FK-88 mounted heavy infantry support gun

/obj/item/weapon/gun/heavy_isg
	name = "\improper FK-88 架设式防空炮"
	desc = "FK-88是一门大型火炮，官方用途是应对大型危险野生动物或失控人群，这门炮绝对会让任何进入其火力线的东西度过非常糟糕的一天。需要相当长的时间来校准射击。使用15厘米炮弹。"

	w_class = WEIGHT_CLASS_HUGE
	equip_slot_flags = ITEM_SLOT_BACK
	icon = 'icons/obj/machines/deployable/fk88.dmi'
	icon_state = "isg"
	fire_sound = 'sound/weapons/guns/fire/tank_cannon1.ogg'
	reload_sound = 'sound/weapons/guns/interact/tat36_reload.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/launcher_empty.ogg'

	default_ammo_type = /obj/item/ammo_magazine/heavy_isg/he
	max_shells = 1 //codex
	caliber = CALIBER_15CM // codex

	scatter = 10
	deployed_scatter_change = -10
	fire_delay = 10 SECONDS

	item_flags = IS_DEPLOYABLE|TWOHANDED|DEPLOYED_NO_PICKUP|DEPLOY_ON_INITIALIZE|DEPLOYED_ANCHORED_FIRING_ONLY
	gun_features_flags = GUN_AMMO_COUNTER|GUN_DEPLOYED_FIRE_ONLY|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_SEMIAUTO)

	attachable_allowed = list(/obj/item/attachable/scope/unremovable/standard_atgun)

	starting_attachment_types = list(/obj/item/attachable/scope/unremovable/standard_atgun)

	allowed_ammo_types = list(
		/obj/item/ammo_magazine/heavy_isg/he,
		/obj/item/ammo_magazine/heavy_isg/sabot,
	)

	deploy_time = 6 SECONDS
	undeploy_time = 3 SECONDS
	deployable_item = /obj/machinery/deployable/mounted/moveable/isg

	max_integrity = 800
	soft_armor = list(MELEE = 60, BULLET = 60, LASER = 60, ENERGY = 50, BOMB = 50, BIO = 100, FIRE = 0, ACID = 0)

/obj/machinery/deployable/mounted/moveable/isg
	coverage = 90 // Has a shield.
	anchor_time = 4 SECONDS
	has_anchored_sprite = TRUE
	pixel_x = -16
	pixel_y = -11

///This is my meme version, the first version of the HSG-102 to have auto-fire, revel in its presence.
/obj/item/weapon/gun/hsg_102/death
	name = "\improper '死亡化身'重机枪"
	desc = "它看起来像一把普通的HSG-102，但枪身两侧和顶部隐约闪烁着古老的发光铭文。它在渴求鲜血。"

	aim_slowdown = 3
	scatter = 30
	deployed_scatter_change = -27

	fire_delay = 0.5
	burst_amount = 3
	burst_delay = 0.1 SECONDS

	aim_slowdown = 3
	wield_delay = 5 SECONDS

	gun_features_flags = GUN_AMMO_COUNTER|GUN_IFF|GUN_SMOKE_PARTICLES

// This is a deployed IFF-less MACHINEGUN, has 500 rounds, drums do not fit anywhere but your belt slot and your back slot. But it has 500 rounds. That's nice.

/obj/item/weapon/gun/heavymachinegun
	name = "\improper HMG-08 重型机枪"
	desc = "这是一把绝对的怪物级武器，一挺由某个疯狂的军械师现代化改造的水冷式重机枪，并配有一套轮式枪架。考虑到轮式枪架部件的混杂，你觉得它可能来自该枪的另一个型号。这是扼守要道的巅峰之作。使用盒式弹箱，可容纳500发10x28mm无壳弹。不具备敌我识别功能。建议仔细瞄准。部署后可用喷枪修复。按住Alt键并右键单击可解除固定或重新固定。"
	w_class = WEIGHT_CLASS_HUGE
	equip_slot_flags = ITEM_SLOT_BACK
	icon = 'icons/obj/machines/deployable/mg08.dmi'
	icon_state = "mg08"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/misc_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/misc_right_1.dmi',
	)

	fire_sound = 'sound/weapons/guns/fire/mg08.ogg'
	reload_sound = 'sound/weapons/guns/interact/minigun_cocked.ogg'
	caliber = CALIBER_10X28

	default_ammo_type = /obj/item/ammo_magazine/heavymachinegun
	allowed_ammo_types = list(/obj/item/ammo_magazine/heavymachinegun, /obj/item/ammo_magazine/heavymachinegun/small)

	scatter = 10
	deployed_scatter_change = -8
	fire_delay = 0.2 SECONDS
	accuracy_mult = 1.1 //it's mounted

	burst_amount = 1

	item_flags = IS_DEPLOYABLE|TWOHANDED
	gun_features_flags = GUN_AMMO_COUNTER|GUN_DEPLOYED_FIRE_ONLY|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)

	attachable_allowed = list(
		/obj/item/attachable/scope/unremovable/heavymachinegun,
	)

	starting_attachment_types = list(
		/obj/item/attachable/scope/unremovable/heavymachinegun,
	)

	deploy_time = 8 SECONDS
	undeploy_time = 3 SECONDS
	deployable_item = /obj/machinery/deployable/mounted/moveable

	max_integrity = 200
	soft_armor = list(MELEE = 0, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 100, FIRE = 0, ACID = 20)



//-------------------------------------------------------
//MG-27 Medium Machine Gun

/obj/item/weapon/gun/standard_mmg
	name = "\improper MG-27中型机枪"
	desc = "MG-27是SG-29那款老旧的、不带敌我识别功能的表亲，专为短时间内快速精准的机枪射击而设计。你可以站着使用它，但这可不是个好主意。实战中请使用三脚架。它使用10x27毫米弹药箱。"
	equip_slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	icon = 'icons/obj/machines/deployable/mounted_machinegun.dmi'
	icon_state = "t27"
	worn_icon_state = "t27"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/machineguns_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/machineguns_right_1.dmi',
	)
	caliber = CALIBER_10x27_CASELESS // codex
	max_shells = 150 //codex
	force = 40
	aim_slowdown = 1.2
	wield_delay = 2.2 SECONDS
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_mg27.ogg'
	fire_rattle = 'sound/weapons/guns/fire/tgmc/kinetic/gun_mg27_low.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	unload_sound = 'sound/weapons/guns/interact/T42_unload.ogg'
	reload_sound = 'sound/weapons/guns/interact/T42_reload.ogg'
	default_ammo_type = /obj/item/ammo_magazine/standard_mmg
	allowed_ammo_types = list(/obj/item/ammo_magazine/standard_mmg)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/som,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope/unremovable/mmg,
		/obj/item/attachable/stock/t27,
	)

	starting_attachment_types = list(/obj/item/attachable/stock/t27)
	attachable_offset = list("muzzle_x" = 45, "muzzle_y" = 19,"rail_x" = 18, "rail_y" = 24, "under_x" = 28, "under_y" = 13, "stock_x" = 0, "stock_y" = 0)

	item_flags = IS_DEPLOYABLE|TWOHANDED
	gun_features_flags = GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	deployable_item = /obj/machinery/deployable/mounted
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	aim_fire_delay = 0.05 SECONDS
	aim_speed_modifier = 5
	soft_armor = list(MELEE = 0, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 100, FIRE = 0, ACID = 0)


	scatter = 30 // you're not firing this standing.
	deployed_scatter_change = -70 // innumerable amount of reduced scatter when deployed,
	recoil = 2
	scatter_unwielded = 45
	accuracy_mult = 1.1 //it's got a bipod
	fire_delay = 0.15 SECONDS
	burst_amount = 1
	deploy_time = 1 SECONDS
	damage_falloff_mult = 0.25
	undeploy_time = 0.5 SECONDS
	max_integrity = 200
	actions_types = list(/datum/action/item_action/aim_mode)

/obj/item/weapon/gun/standard_mmg/toggle_auto_aim_mode(mob/living/carbon/human/user) //somewhat redundant, but just for clarity to the user
	if(!(item_flags & IS_DEPLOYED))
		user.balloon_alert(user, "未部署")
		return
	return ..()

/obj/item/weapon/gun/standard_mmg/toggle_aim_mode(mob/living/carbon/human/user)
	if(!HAS_TRAIT(src, TRAIT_GUN_IS_AIMING) && !(item_flags & IS_DEPLOYED))
		user.balloon_alert(user, "未部署")
		return
	return ..()

/obj/item/weapon/gun/standard_mmg/machinegunner
	starting_attachment_types = list(/obj/item/attachable/stock/t27, /obj/item/attachable/scope/unremovable/mmg)

/obj/item/weapon/gun/clf_heavyrifle
	name = "\improper PTR-41/1785 反机甲枪"
	desc = "PTR-41/1785 是一款针对装甲目标进行现代化改造的低端解决方案，虽然可以站立使用，但这显然不是个好主意。建议在部署两脚架时使用。它使用 14.5 毫米高速子弹，无论哪个不幸的灵魂被击中，都肯定会留下一个洞。"
	w_class = WEIGHT_CLASS_BULKY
	icon = 'icons/obj/machines/deployable/clf_heavyrifle.dmi'
	icon_state = "ptrs"
	worn_icon_state = "ptrs"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/special_left_64.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/special_right_64.dmi',
	)
	inhand_x_dimension = 64
	inhand_y_dimension = 32
	caliber = CALIBER_14X5 // codex
	max_shells = 5 //codex
	max_chamber_items = 5
	force = 30
	fire_sound = 'sound/weapons/guns/fire/ptrs.ogg'
	dry_fire_sound = 'sound/weapons/guns/fire/m41a_empty.ogg'
	reload_sound = 'sound/weapons/guns/interact/shotgun_shell_insert.ogg'
	hand_reload_sound = 'sound/weapons/guns/interact/shotgun_shell_insert.ogg'
	cocked_sound = 'sound/weapons/guns/interact/shotgun_reload.ogg'
	opened_sound = 'sound/weapons/guns/interact/shotgun_open.ogg'
	gun_features_flags = GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_WIELDED_STABLE_FIRING_ONLY
	reciever_flags = AMMO_RECIEVER_HANDFULS
	default_ammo_type = /datum/ammo/bullet/sniper/clf_heavyrifle
	attachable_allowed = list(
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/stock/clf_heavyrifle,
		/obj/item/attachable/scope,
	)

	starting_attachment_types = list(/obj/item/attachable/stock/clf_heavyrifle)
	attachable_offset = list("muzzle_x" = 45, "muzzle_y" = 19,"rail_x" = 18, "rail_y" = 24, "under_x" = 28, "under_y" = 13, "stock_x" = 8, "stock_y" = 0)

	item_flags = IS_DEPLOYABLE|TWOHANDED
	gun_features_flags = GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY
	deployable_item = /obj/machinery/deployable/mounted
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	actions_types = list(/datum/action/item_action/aim_mode)
	aim_fire_delay = 2 SECONDS
	aim_speed_modifier = 3
	soft_armor = list(MELEE = 0, BULLET = 50, LASER = 0, ENERGY = 0, BOMB = 50, BIO = 100, FIRE = 0, ACID = 0)


	scatter = 16
	deployed_scatter_change = -16
	recoil = 4
	scatter_unwielded = 45
	accuracy_mult = 1
	burst_amount = 1
	fire_delay = 1.35 SECONDS
	aim_slowdown = 2
	deploy_time = 1 SECONDS // Meant to be used by ERT's
	undeploy_time = 0.25 SECONDS
	movement_acc_penalty_mult = 20 // Good luck hitting on the move, bruv

//-------------------------------------------------------
//AT-36 Anti Tank Gun

/obj/item/weapon/gun/standard_atgun
	name = "\improper AT-36 反坦克炮"
	desc = "AT-36是一种轻型双用途反坦克及反人员武器，由地球政府殖民地海军陆战队使用。用于在短时间内摧毁轻型车辆或掩体。最好由两人操作。它配有轮子可以移动，并集成了弹药架。一旦部署就无法收回！它使用多种类型的37毫米炮弹箱。按住Alt键并右键点击以固定，使其无法被任何人移动，再次按住Alt键并右键点击则可移动它。"
	w_class = WEIGHT_CLASS_BULKY
	icon = 'icons/obj/machines/deployable/at36.dmi'
	icon_state = "at36"
	worn_icon_state = "at36"
	caliber = CALIBER_37MM // codex
	max_shells = 1 //codex
	fire_sound = 'sound/weapons/guns/fire/tat36.ogg'
	reload_sound = 'sound/weapons/guns/interact/tat36_reload.ogg'
	default_ammo_type = /obj/item/ammo_magazine/standard_atgun
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/standard_atgun,
		/obj/item/ammo_magazine/standard_atgun/apcr,
		/obj/item/ammo_magazine/standard_atgun/he,
		/obj/item/ammo_magazine/standard_atgun/beehive,
		/obj/item/ammo_magazine/standard_atgun/incend,
	)
	attachable_offset = list("muzzle_x" = 45, "muzzle_y" = 20,"rail_x" = 18, "rail_y" = 22, "under_x" = 28, "under_y" = 13, "stock_x" = 0, "stock_y" = 0)
	starting_attachment_types = list(/obj/item/attachable/scope/unremovable/standard_atgun)
	attachable_allowed = list(/obj/item/attachable/scope/unremovable/standard_atgun)

	item_flags = IS_DEPLOYABLE|TWOHANDED|DEPLOYED_NO_PICKUP|DEPLOY_ON_INITIALIZE|DEPLOYED_NO_ROTATE_ANCHORED|DEPLOYED_ANCHORED_FIRING_ONLY
	gun_features_flags = GUN_AMMO_COUNTER|GUN_DEPLOYED_FIRE_ONLY|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES

	gun_firemode_list = list(GUN_FIREMODE_SEMIAUTO)
	aim_time = 6 SECONDS
	reciever_flags = AMMO_RECIEVER_MAGAZINES|AMMO_RECIEVER_AUTO_EJECT
	soft_armor = list(MELEE = 60, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 100, FIRE = 0, ACID = 0)

	scatter = 0
	recoil = 3
	fire_delay = 3 SECONDS
	burst_amount = 1
	undeploy_time = 2000 SECONDS
	max_integrity = 500
	deployable_item = /obj/machinery/deployable/mounted/moveable/atgun

/obj/machinery/deployable/mounted/moveable/atgun
	resistance_flags = XENO_DAMAGEABLE|UNACIDABLE
	coverage = 85 //has a shield
	anchor_time = 1 SECONDS
	///The internal storage of our atgun
	var/obj/item/storage/atgun_ammo_rack/sponson = /obj/item/storage/atgun_ammo_rack

/obj/item/storage/atgun_ammo_rack
	storage_type = /datum/storage/internal/ammo_rack

/obj/machinery/deployable/mounted/moveable/atgun/Destroy()
	if(sponson)
		QDEL_NULL(sponson)
	return ..()

/obj/machinery/deployable/mounted/moveable/atgun/Initialize(mapload)
	. = ..()
	sponson = new sponson(src)

/obj/machinery/deployable/mounted/moveable/atgun/attackby(obj/item/I, mob/user, params)
	var/obj/item/weapon/gun/standard_atgun/internal_gun = get_internal_item()
	if(user.interactee == src && (I.type in internal_gun?.allowed_ammo_types))
		balloon_alert(user, "正在操作！")
		return

	if(!sponson.attackby(I, user, params))
		return ..()

/obj/machinery/deployable/mounted/moveable/atgun/attack_hand_alternate(mob/living/user)
	if(user.interactee == src)
		balloon_alert(user, "正在操作！")
		return

	return sponson.attack_hand_alternate(user)

/obj/machinery/deployable/mounted/moveable/atgun/MouseDrop(atom/over, src_location, over_location, src_control, over_control, params)
	if(!ishuman(usr) || usr.lying_angle || usr.incapacitated())
		return FALSE

	if(usr.interactee == src)
		balloon_alert(usr, "正在操作！")
		return

	if(over == usr && Adjacent(usr)) //This must come before the screen objects only block
		sponson.storage_datum.open(usr)
		return FALSE

/obj/machinery/deployable/mounted/moveable/atgun/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			take_damage(800, BRUTE, BOMB)
		if(EXPLODE_HEAVY)
			take_damage(rand(150, 200), BRUTE, BOMB)
		if(EXPLODE_LIGHT)
			take_damage(rand(50, 100), BRUTE, BOMB)
		if(EXPLODE_WEAK)
			take_damage(rand(25, 50), BRUTE, BOMB)

//AGLS-37, or Automatic Grenade Launching System 37, a fully automatic mounted grenade launcher that fires fragmentation and HE shells, can't be turned.

/obj/item/weapon/gun/standard_agls
	name = "\improper AGLS-37 考瑟自动榴弹发射器"
	desc = "AGLS-37自动榴弹发射系统。它太重了，没有三脚架无法手持或操作。背面写着：'如果你或你的朋友失去了身体部件，Kauser没有义务为你购买新的。'\n可通过Ctrl+点击部署。部署后可用喷枪修复。"
	w_class = WEIGHT_CLASS_HUGE
	equip_slot_flags = ITEM_SLOT_BACK
	caliber = CALIBER_40MM
	icon = 'icons/obj/machines/deployable/agls.dmi'
	icon_state = "agls"
	fire_sound = 'sound/weapons/guns/fire/agls.ogg'
	reload_sound = 'sound/weapons/guns/interact/minigun_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/standard_agls
	scatter = 0
	fire_delay = 1.1 SECONDS
	burst_amount = 0
	accuracy_mult = 1.2
	item_flags = IS_DEPLOYABLE|TWOHANDED
	gun_features_flags = GUN_AMMO_COUNTER|GUN_DEPLOYED_FIRE_ONLY|GUN_WIELDED_FIRING_ONLY
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)

	attachable_allowed = list(
		/obj/item/attachable/scope/unremovable/standard_atgun,
	)

	starting_attachment_types = list(
		/obj/item/attachable/scope/unremovable/standard_atgun,
	)

	allowed_ammo_types = list(
		/obj/item/ammo_magazine/standard_agls,
		/obj/item/ammo_magazine/standard_agls/fragmentation,
		/obj/item/ammo_magazine/standard_agls/incendiary,
		/obj/item/ammo_magazine/standard_agls/flare,
		/obj/item/ammo_magazine/standard_agls/cloak,
	)

	deploy_time = 6 SECONDS
	undeploy_time = 3 SECONDS
	deployable_item = /obj/machinery/deployable/mounted


	max_integrity = 300
	soft_armor = list(MELEE = 0, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 100, FIRE = 0, ACID = 20)

/obj/item/weapon/gun/standard_agls/do_fire(obj/object_to_fire)
	. = ..()
	if(!.)
		return FALSE
	if(istype(in_chamber, /obj/item/ammo_magazine/standard_agls/incendiary))
		gun_user?.record_war_crime()

// Non-TGMC HMG

/obj/item/weapon/gun/icc_hmg
	name = "\improper KRD-61ES 车载重型机枪"
	desc = "KRD-61ES机枪是ML-91重机枪的出口型号。它过于沉重，没有三脚架无法手持或操作。无需额外操作，只需用Ctrl+点击即可部署。部署后可用喷灯进行维修。"
	icon = 'icons/obj/machines/deployable/mounted_machinegun.dmi'
	icon_state = "kord"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/misc_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/misc_right_1.dmi',
	)

	fire_sound = 'sound/weapons/guns/fire/hmg2.ogg'
	reload_sound = 'sound/weapons/guns/interact/minigun_cocked.ogg'

	w_class = WEIGHT_CLASS_HUGE
	equip_slot_flags = ITEM_SLOT_BACK

	scatter = 10
	deployed_scatter_change = -10
	accuracy_mult = 1.2 //it's got a bipod
	fire_delay = 0.25 SECONDS

	default_ammo_type = /obj/item/ammo_magazine/icc_hmg

	allowed_ammo_types = list(
		/obj/item/ammo_magazine/icc_hmg,
	)

	item_flags = IS_DEPLOYABLE|TWOHANDED
	gun_features_flags = GUN_AMMO_COUNTER|GUN_DEPLOYED_FIRE_ONLY|GUN_WIELDED_FIRING_ONLY|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	aim_fire_delay = 0.05 SECONDS
	aim_speed_modifier = 5

	attachable_allowed = list(
		/obj/item/attachable/scope/unremovable/hsg_102,
	)

	starting_attachment_types = list(
		/obj/item/attachable/scope/unremovable/hsg_102,
	)

	deploy_time = 1.5 SECONDS
	undeploy_time = 0.5 SECONDS
	deployable_item = /obj/machinery/deployable/mounted

	max_integrity = 200
	soft_armor = list(MELEE = 0, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 100, FIRE = 0, ACID = 20)

	allowed_ammo_types = list(
		/obj/item/ammo_magazine/icc_hmg,
	)

/obj/item/weapon/gun/at45
	name = "\improper CC/AT45重型智能机枪"
	desc = "CC/AT45，这是仅次于HSG102的最强重型智能机枪之一。它必须在部署后才能握持或使用。无需额外操作，只需用Ctrl+左键部署，即可开始扫射。部署后可用喷枪进行维修。"

	w_class = WEIGHT_CLASS_HUGE
	equip_slot_flags = ITEM_SLOT_BACK
	icon = 'icons/obj/machines/deployable/at45.dmi'
	icon_state = "at45"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/misc_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/misc_right_1.dmi',
	)

	fire_sound = 'sound/weapons/guns/fire/autocannon_2.ogg'
	reload_sound = 'sound/weapons/guns/interact/kt42_cocked.ogg'

	default_ammo_type = /obj/item/ammo_magazine/at45
	scatter = 10
	deployed_scatter_change = -10
	fire_delay = 0.35 SECONDS

	burst_amount = 3
	burst_delay = 0.1 SECONDS
	extra_delay = 1 SECONDS
	accuracy_mult = 1.2 //it's got a bipod
	burst_accuracy_bonus = 1
	burst_scatter_mult = 0

	item_flags = IS_DEPLOYABLE|TWOHANDED
	gun_features_flags = GUN_AMMO_COUNTER|GUN_DEPLOYED_FIRE_ONLY|GUN_WIELDED_FIRING_ONLY|GUN_IFF|GUN_SMOKE_PARTICLES
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)

	allowed_ammo_types = list(
		/obj/item/ammo_magazine/at45,
	)

	attachable_allowed = list(
		/obj/item/attachable/at45barrel,
		/obj/item/attachable/stock/at45stock,
	)

	starting_attachment_types = list(
		/obj/item/attachable/at45barrel,
		/obj/item/attachable/stock/at45stock,
	)
	attachable_offset = list("muzzle_x" = 56, "muzzle_y" = 16,"rail_x" = 18, "rail_y" = 24, "under_x" = 28, "under_y" = 13, "stock_x" = -11, "stock_y" = 0)

	deploy_time = 5 SECONDS
	undeploy_time = 3 SECONDS
	deployable_item = /obj/machinery/deployable/mounted

	max_integrity = 200
	soft_armor = list(MELEE = 0, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 100, FIRE = 0, ACID = 20)
