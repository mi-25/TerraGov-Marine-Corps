//Generic parent object.
//---------------------------------------------------

/obj/item/weapon/gun/revolver
	equip_slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_NORMAL
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/guns/pistols_left_1.dmi',
		slot_r_hand_str = 'icons/mob/inhands/guns/pistols_right_1.dmi',
	)
	fire_sound = 'sound/weapons/guns/fire/44mag.ogg'
	reload_sound = 'sound/weapons/guns/interact/revolver_spun.ogg'
	cocked_sound = 'sound/weapons/guns/interact/revolver_cocked.ogg'
	unload_sound = 'sound/weapons/guns/interact/revolver_unload.ogg'
	opened_sound = 'sound/weapons/guns/interact/revolver_unload.ogg'
	icon = 'icons/obj/items/guns/pistols.dmi'
	hand_reload_sound = 'sound/weapons/guns/interact/revolver_load.ogg'
	type_of_casings = "bullet"
	load_method = SINGLE_CASING|SPEEDLOADER //codex
	gun_features_flags = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_SMOKE_PARTICLES
	actions_types = list(/datum/action/item_action/aim_mode)
	aim_speed_modifier = 0.75
	aim_fire_delay = 0.25 SECONDS
	wield_delay = 0.4 SECONDS
	gun_skill_category = SKILL_PISTOLS

	reciever_flags = AMMO_RECIEVER_HANDFULS|AMMO_RECIEVER_ROTATES_CHAMBER|AMMO_RECIEVER_TOGGLES_OPEN|AMMO_RECIEVER_TOGGLES_OPEN_EJECTS
	max_chamber_items = 7
	allowed_ammo_types = list(/obj/item/ammo_magazine/revolver)

	movement_acc_penalty_mult = 3
	fire_delay = 2
	accuracy_mult_unwielded = 0.85
	scatter_unwielded = 15
	recoil = 0
	recoil_unwielded = 1

	placed_overlay_iconstate = "revolver"

	///If the gun is able to play Russian Roulette
	var/russian_roulette = FALSE //God help you if you do this.
	///Whether the chamber can be spun for Russian Roulette. If False the chamber can be spun.
	var/catchworking = TRUE

//-------------------------------------------------------
//R-44 COMBAT REVOLVER

/obj/item/weapon/gun/revolver/standard_revolver
	name = "\improper R-44战斗左轮手枪"
	desc = "R-44标准战斗左轮手枪，由泰伦军械库生产。这是一种坚固耐用、威力强大的枪械，使用.44马格南弹药。转轮弹巢可容纳7发子弹。由于转轮旋转系统存在设计缺陷，该枪的实际射速远高于预期，最终被宣传为该系统的特色功能。"
	icon_state = "tp44"
	worn_icon_state = "tp44"
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_r44.ogg'
	caliber = CALIBER_44 //codex
	max_chamber_items = 7 //codex
	default_ammo_type = /obj/item/ammo_magazine/revolver/standard_revolver
	allowed_ammo_types = list(/obj/item/ammo_magazine/revolver/standard_revolver)
	force = 8
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/gyro,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/lace,
		/obj/item/attachable/buildasentry,
	)
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 19,"rail_x" = 13, "rail_y" = 23, "under_x" = 22, "under_y" = 14, "stock_x" = 22, "stock_y" = 19)
	fire_delay = 0.15 SECONDS
	akimbo_additional_delay = 0.6 // Ends up as 0.249, so it'll get moved up to 0.25.
	accuracy_mult_unwielded = 0.85
	accuracy_mult = 1
	scatter = -1
	recoil_unwielded = 0.75

/obj/item/weapon/gun/revolver/standard_revolver/Initialize(mapload, spawn_empty)
	. = ..()
	if(round(rand(1, 10), 1) != 1)
		return
	base_gun_icon = "tp44cool"
	update_icon()

//-------------------------------------------------------
//RUSSIAN REVOLVER //Based on the 7.62mm Russian revolvers.

/obj/item/weapon/gun/revolver/upp
	name = "\improper N-Y 7.62毫米左轮手枪"
	desc = "Nagant-Yamasaki 7.62是一款由一群可疑的非美国人联合设计的致命武器。它常见于罪犯或雇佣兵之手。"
	icon_state = "ny762"
	worn_icon_state = "ny762"
	caliber = CALIBER_762X38 //codex
	max_chamber_items = 7 //codex
	fire_sound = 'sound/weapons/guns/fire/ny.ogg'
	default_ammo_type = /obj/item/ammo_magazine/revolver/upp
	allowed_ammo_types = list(/obj/item/ammo_magazine/revolver/upp)
	force = 8
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/compensator,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/lace,
	)
	attachable_offset = list("muzzle_x" = 28, "muzzle_y" = 21,"rail_x" = 14, "rail_y" = 23, "under_x" = 24, "under_y" = 19, "stock_x" = 24, "stock_y" = 19)

	damage_mult = 1.05
	scatter_unwielded = 12
	recoil_unwielded = 0


//-------------------------------------------------------
//A generic 357 revolver. With a twist.

/obj/item/weapon/gun/revolver/small
	name = "\improper 自由混战'回弹'左轮手枪"
	desc = "一把由法尔费尔梅里亚制造的纤巧型.357左轮手枪。从古代到未来，永恒的设计。这把枪以其奇特的弹药而闻名，子弹会不断从墙壁上反弹。这从缺陷变成了特色。"
	icon_state = "rebota"
	worn_icon_state = "sw357"
	caliber = CALIBER_357 //codex
	max_chamber_items = 6 //codex
	fire_sound = 'sound/weapons/guns/fire/revolver.ogg'
	default_ammo_type = /obj/item/ammo_magazine/revolver/small
	allowed_ammo_types = list(/obj/item/ammo_magazine/revolver/small)
	force = 6
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/scope,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/lace,
	)
	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 19,"rail_x" = 12, "rail_y" = 21, "under_x" = 20, "under_y" = 15, "stock_x" = 20, "stock_y" = 15)

	recoil_unwielded = 0


//-------------------------------------------------------
//Mateba is pretty well known. The cylinder folds up instead of to the side. This has a non-marine version and a marine version.

/obj/item/weapon/gun/revolver/mateba
	name = "\improper R-24'马特巴'自动左轮手枪"
	desc = "R-24是一种相当罕见的自动左轮手枪，由地球政府殖民地海军陆战队配发，仅少量配发给后方人员和军官。它利用后坐力旋转弹巢。使用重型.454口径子弹。"
	icon_state = "mateba"
	worn_icon_state = "mateba"
	fire_animation = "mateba_fire"
	muzzleflash_iconstate = "muzzle_flash"
	caliber = CALIBER_454 //codex
	max_chamber_items = 6 //codex
	fire_sound = 'sound/weapons/guns/fire/mateba.ogg'
	default_ammo_type = /obj/item/ammo_magazine/revolver/mateba
	allowed_ammo_types = list(/obj/item/ammo_magazine/revolver/mateba)
	force = 15
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/lace,
		/obj/item/attachable/buildasentry,
	)

	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 19,"rail_x" = 8, "rail_y" = 23, "under_x" = 24, "under_y" = 15, "stock_x" = 22, "stock_y" = 15)

	fire_delay = 0.2 SECONDS
	aim_fire_delay = 0.3 SECONDS
	accuracy_mult = 1.15
	scatter = 0
	accuracy_mult_unwielded = 0.8
	akimbo_additional_delay = 0.9 // Akimbo only gives more shots.
	scatter_unwielded = 7

/obj/item/weapon/gun/revolver/mateba/notmarine
	name = "\improper 马特巴自动左轮手枪"
	desc = "马特巴是一款威力强大、射速迅捷的左轮手枪，利用自身后坐力驱动转轮旋转。使用.454口径弹药。"


/obj/item/weapon/gun/revolver/mateba/custom
	name = "\improper R-24 自动左轮手枪 特种型"
	desc = "马特巴是一款威力强大、射速迅捷的左轮手枪，利用自身后坐力驱动转轮旋转。这把枪似乎倾注了更多心血与呵护。使用.454口径弹药。"
	icon_state = "mateba"
	worn_icon_state = "mateba"

//-------------------------------------------------------
//MARSHALS REVOLVER

/obj/item/weapon/gun/revolver/cmb
	name = "\improper CMB 自动左轮手枪"
	desc = "一把使用.357马格南弹药的自动左轮手枪。通常配发给纳米传讯安保人员。它具有连发模式。目前正在地球及其他殖民地的其他左轮手枪中进行试用。"
	icon_state = "cmb"
	worn_icon_state = "cmb"
	caliber = CALIBER_357 //codex
	max_chamber_items = 6 //codex
	fire_sound = 'sound/weapons/guns/fire/revolver_light.ogg'
	default_ammo_type = /obj/item/ammo_magazine/revolver/cmb
	allowed_ammo_types = list(/obj/item/ammo_magazine/revolver/cmb)
	force = 12
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/quickfire,
		/obj/item/attachable/compensator,
		/obj/item/attachable/lace,
	)
	attachable_offset = list("muzzle_x" = 29, "muzzle_y" = 22,"rail_x" = 11, "rail_y" = 25, "under_x" = 20, "under_y" = 18, "stock_x" = 20, "stock_y" = 18)

	fire_delay = 0.15 SECONDS
	scatter_unwielded = 12
	burst_amount = 3
	burst_delay = 0.1 SECONDS
	damage_mult = 1.05

//-------------------------------------------------------
//The Judge, a shotgun and revolver in one

/obj/item/weapon/gun/revolver/judge
	name = "\improper '法官'左轮手枪"
	desc = "一把极其罕见的左轮手枪，采用超大弹膛设计，能够发射.45长弹，但牺牲了射速。普通子弹没有射程衰减，且几乎没有散射。由于枪管较短，发射的鹿弹散布范围很大。"
	icon_state = "judge"
	worn_icon_state = "m44"
	fire_animation = "judge_fire"
	caliber = CALIBER_45L //codex
	max_chamber_items = 5 //codex
	default_ammo_type = /obj/item/ammo_magazine/revolver/judge
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/revolver/judge,
		/obj/item/ammo_magazine/revolver/judge/buckshot,
	)
	force = 8
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/quickfire,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/scope,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/lace,
	)
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 22,"rail_x" = 17, "rail_y" = 22, "under_x" = 22, "under_y" = 17, "stock_x" = 22, "stock_y" = 19)

	fire_delay = 0.8 SECONDS
	scatter = 8 // Only affects buckshot considering marksman has -15 scatter.
	damage_falloff_mult = 1.2

//-------------------------------------------------------
// The R-76 Magnum. Fires a big round, equal to a slug. Has a windup.

/obj/item/weapon/gun/revolver/standard_magnum
	name = "\improper R-76 KC 马格南"
	desc = "R-76马格南是TGMC使用的一款绝对凶悍的手枪，传闻称由于其极不实用的特性，它是由某位将军作为洗钱计划而创造的。威力巨大，建议搭配其枪托配件使用。使用12.7毫米口径弹药。"
	icon = 'icons/obj/items/guns/pistols64.dmi'
	icon_state = "t76"
	worn_icon_state = "t76"
	fire_animation = "t76_fire"
	caliber = CALIBER_12x7 //codex
	max_chamber_items = 5 //codex
	default_ammo_type = /obj/item/ammo_magazine/revolver/standard_magnum
	allowed_ammo_types = list(/obj/item/ammo_magazine/revolver/standard_magnum)
	force = 8
	actions_types = null
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/lace,
		/obj/item/attachable/stock/t76,
		/obj/item/attachable/scope/standard_magnum,
	)
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 19,"rail_x" = 15, "rail_y" = 23, "under_x" = 22, "under_y" = 15, "stock_x" = 10, "stock_y" = 18)
	windup_delay = 0.5 SECONDS
	aim_slowdown = 0.1
	windup_sound = 'sound/weapons/guns/fire/t76_start.ogg'
	fire_sound = 'sound/weapons/guns/fire/tgmc/kinetic/gun_r76.ogg'
	fire_delay = 0.75 SECONDS
	akimbo_additional_delay = 0.6
	accuracy_mult_unwielded = 0.85
	accuracy_mult = 1
	scatter_unwielded = 5
	scatter = 2
	recoil = 2
	recoil_unwielded = 3

	starting_attachment_types = list(/obj/item/attachable/stock/t76)

/obj/item/weapon/gun/revolver/standard_magnum/fancy
	starting_attachment_types = list()
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/lace,
		/obj/item/attachable/stock/t76,
		/obj/item/attachable/scope/standard_magnum,
		/obj/item/attachable/compensator,
	)

/obj/item/weapon/gun/revolver/standard_magnum/fancy/gold
	desc = "一把镀金的R-76马格南手枪，确保它既极其昂贵又极其不实用。R-76马格南是地球政府殖民地海军陆战队使用的一款绝对的猛兽级手枪，传闻称它是由某位将军为了洗钱而制造的，纯粹是因为这款枪械的极度不实用性。威力巨大，建议配合其枪托配件使用。使用12.7毫米口径弹药。"
	icon_state = "g_t76"
	worn_icon_state = "g_t76"
	fire_animation = "g_t76_fire"

/obj/item/weapon/gun/revolver/standard_magnum/fancy/silver
	desc = "一把镀银的R-76马格南手枪，以确保它既极其昂贵又极其不实用。R-76马格南是地球政府殖民地海军陆战队使用的一款绝对的猛兽级手枪，有传言称，由于这款枪械的极度不实用性，它是由某位将军作为洗钱计划而创造的。威力巨大，建议搭配其枪托配件使用。使用12.7毫米口径弹药。"
	icon_state = "s_t76"
	worn_icon_state = "s_t76"
	fire_animation = "s_t76_fire"

/obj/item/weapon/gun/revolver/standard_magnum/fancy/nickle
	desc = "一把镀镍的R-76马格南手枪，拥有更雅致的表面处理。R-76马格南是TGMC使用的一款绝对的猛兽级手枪，有传言称，由于这款枪械极不实用，它是由某位将军作为洗钱计划而创造的。威力巨大，建议配合其枪托配件使用。使用12.7毫米口径弹药。"
	icon_state = "n_t76"
	worn_icon_state = "n_t76"
	fire_animation = "n_t76_fire"

//Single action revolvers below
//---------------------------------------------------

/obj/item/weapon/gun/revolver/single_action //This town aint big enuf fer the two of us
	name = "单动式左轮手枪"
	desc = "你不应该看到这个。"
	reload_sound = 'sound/weapons/guns/interact/revolver_cocked.ogg'
	cocked_sound = 'sound/weapons/guns/interact/revolver_cocked.ogg'
	default_ammo_type = /obj/item/ammo_magazine/revolver/standard_revolver
	allowed_ammo_types = list(/obj/item/ammo_magazine/revolver/standard_revolver)
	reciever_flags = AMMO_RECIEVER_HANDFULS|AMMO_RECIEVER_ROTATES_CHAMBER|AMMO_RECIEVER_TOGGLES_OPEN|AMMO_RECIEVER_TOGGLES_OPEN_EJECTS|AMMO_RECIEVER_REQUIRES_UNIQUE_ACTION|AMMO_RECIEVER_UNIQUE_ACTION_LOCKS
	cocked_message = "You prime the hammer."
	cock_delay = 0



//-------------------------------------------------------
//R-44, based off the SAA.

/obj/item/weapon/gun/revolver/single_action/m44
	name = "\improper R-44 SAA 左轮手枪"
	desc = "一种偶尔由民间执法部门携带的罕见左轮手枪，明显基于现代化的单动式陆军左轮。每次射击后需手动扳动击锤。使用.44马格南子弹。"
	icon_state = "m44"
	worn_icon_state = "m44"
	caliber = CALIBER_44 //codex
	max_chamber_items = 6
	default_ammo_type = /obj/item/ammo_magazine/revolver/single_action/m44
	allowed_ammo_types = list(/obj/item/ammo_magazine/revolver/single_action/m44, /obj/item/ammo_magazine/revolver/marksman, /obj/item/ammo_magazine/revolver/heavy)
	force = 8
	attachable_allowed = list(
		/obj/item/attachable/bayonet/converted,
		/obj/item/attachable/reddot,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/quickfire,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/scope,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/lace,
	)
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 22,"rail_x" = 17, "rail_y" = 22, "under_x" = 22, "under_y" = 17, "stock_x" = 22, "stock_y" = 19)

	fire_delay = 0.15 SECONDS
	damage_mult = 1.1
