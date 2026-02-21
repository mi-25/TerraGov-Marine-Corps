#define PRIMORDIAL_TIER_ONE "Primordial Tier One"
#define PRIMORDIAL_TIER_TWO "Primordial Tier Two"
#define PRIMORDIAL_TIER_THREE "Primordial Tier Three"
#define PRIMORDIAL_TIER_FOUR "Primordial Tier Four"

GLOBAL_LIST_INIT(upgrade_categories, list("Buildings", "Defences", "Xenos"))//, "Primordial"))//uncomment to unlock globally
GLOBAL_LIST_INIT(tier_to_primo_upgrade, list(
	XENO_TIER_ONE = PRIMORDIAL_TIER_ONE,
	XENO_TIER_TWO = PRIMORDIAL_TIER_TWO,
	XENO_TIER_THREE = PRIMORDIAL_TIER_THREE,
	XENO_TIER_FOUR = PRIMORDIAL_TIER_FOUR,
))

/datum/hive_purchases
	interaction_flags = INTERACT_UI_INTERACT
	///Flat list of upgrades we can buy
	var/list/buyable_upgrades = list()
	///Assocative list name = upgraderef
	var/list/datum/hive_upgrade/upgrades_by_name = list()

// ***************************************
// *********** UI for hive store/blessing menu
// ***************************************

///Initializing hive status with all relevant to be purchased upgrades.
/datum/hive_purchases/proc/setup_upgrades()
	for(var/type in subtypesof(/datum/hive_upgrade))
		var/datum/hive_upgrade/upgrade = new type
		if(upgrade.name == "Error upgrade") //defaultname just skip it its probably organisation
			continue
		if(!(SSticker.mode.xeno_abilities_flags & upgrade.gamemode_flags))
			continue
		buyable_upgrades += upgrade
		upgrades_by_name[upgrade.name] = upgrade

/datum/hive_purchases/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "BlessingMenu", "Queen Mothers Blessings")
		ui.open()

/datum/hive_purchases/ui_state(mob/user)
	return GLOB.conscious_state

/datum/hive_purchases/ui_assets(mob/user)
	. = ..()
	. += get_asset_datum(/datum/asset/spritesheet/blessingmenu)

/datum/hive_purchases/ui_data(mob/user)
	. = ..()

	var/mob/living/carbon/xenomorph/X = user

	.["upgrades"] = list()
	for(var/datum/hive_upgrade/upgrade AS in buyable_upgrades)
		.["upgrades"] += list(list("name" = upgrade.name, "desc" = upgrade.desc, "category" = upgrade.category,\
		"cost" = upgrade.psypoint_cost, "times_bought" = upgrade.times_bought, "iconstate" = upgrade.icon, "istactical" =  (upgrade.upgrade_flags & UPGRADE_FLAG_USES_TACTICAL)))
	.["strategicpoints"] = SSpoints.xeno_strategic_points_by_hive[X.hive.hivenumber]
	.["tacticalpoints"] = SSpoints.xeno_tactical_points_by_hive[X.hive.hivenumber]

/datum/hive_purchases/ui_static_data(mob/user)
	. = ..()
	.["categories"] = GLOB.upgrade_categories

/datum/hive_purchases/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	switch(action)
		if("buy")
			var/buying = params["buyname"]
			var/datum/hive_upgrade/upgrade = upgrades_by_name[buying]
			var/mob/living/carbon/xenomorph/user = usr
			if(!upgrade.can_buy(user, FALSE))
				return
			if(!upgrade.on_buy(user))
				return
			log_game("[key_name(user)] has purchased \a [upgrade] Blessing for [upgrade.psypoint_cost] psypoints for the [user.hive.hivenumber] hive")
			if(upgrade.upgrade_flags & UPGRADE_FLAG_MESSAGE_HIVE)
				xeno_message("[user] has purchased \a [upgrade] Blessing", "xenoannounce", 5, user.hivenumber)

/datum/hive_upgrade
	///name of the upgrade, string, used in ui
	var/name = "Error upgrade"
	///desc of the upgrade, string, used in ui
	var/desc = "Error upgrade description"
	///name of the category it belongs to, string, used in ui
	var/category = "ERROR CATEGORY"
	///Psy point cost, float
	var/psypoint_cost = 10
	///upgrade flag var
	var/upgrade_flags = NONE
	///gamemode flags to whether this upgrade is purchasable
	var/gamemode_flags = ABILITY_ALL_GAMEMODE
	///int of the times we bought this upgrade
	var/times_bought = 0
	///string for UI icon in buyable_icons.dmi for this upgrade
	var/icon = "larvasilo"

/**
 * Buys the upgrade and applies its effects
 * returns true on success false on fail
 * Arguments:
 * * buyer: Xeno trying to buy this upgrade
 */
/datum/hive_upgrade/proc/on_buy(mob/living/carbon/xenomorph/buyer)
	SHOULD_CALL_PARENT(TRUE)
	if(upgrade_flags & UPGRADE_FLAG_USES_TACTICAL)
		SSpoints.xeno_tactical_points_by_hive[buyer.hivenumber] -= psypoint_cost
	else
		SSpoints.xeno_strategic_points_by_hive[buyer.hivenumber] -= psypoint_cost
	times_bought++
	return TRUE

/**
 * Whether we can buy this upgrade, used to set the menu button as grey or not
 * returns true on can false on cannot
 * Arguments:
 * * buyer: Xeno trying to buy this upgrade
 * * silent: whether to send error messages to the buyer
 */
/datum/hive_upgrade/proc/can_buy(mob/living/carbon/xenomorph/buyer, silent = TRUE)
	SHOULD_CALL_PARENT(TRUE)
	if((upgrade_flags & UPGRADE_FLAG_ONETIME) && times_bought)
		if(!silent)
			to_chat(buyer, span_xenowarning("你已经购买过这个祝福了！"))
		return FALSE
	var/points_requirement = (upgrade_flags & UPGRADE_FLAG_USES_TACTICAL) ? SSpoints.xeno_tactical_points_by_hive[buyer.hivenumber] : SSpoints.xeno_strategic_points_by_hive[buyer.hivenumber]
	if(points_requirement < psypoint_cost)
		if(!silent)
			to_chat(buyer, span_xenowarning("You need [points_requirement] more [(upgrade_flags & UPGRADE_FLAG_USES_TACTICAL) ? "tactical" : "strategic"] points to request this blessing!"))
		return FALSE
	var/datum/hive_status/buyer_hive = GLOB.hive_datums[buyer.hivenumber]
	if((upgrade_flags & UPGRADE_FLAG_MUST_BE_HIVE_RULER) && buyer_hive.living_xeno_ruler != buyer)
		if(!silent)
			to_chat(buyer, span_xenonotice("你必须是一名统治者才能购买这个！"))
		return FALSE
	return TRUE

/datum/hive_upgrade/building
	category = "Buildings"
	///The type of building created
	var/building_type
	///Building time, in seconds. 10 by default.
	var/building_time = 10 SECONDS

/datum/hive_upgrade/building/can_buy(mob/living/carbon/xenomorph/buyer, silent)
	. = ..()
	if(!.)
		return
	var/turf/buildloc = get_turf(buyer)
	if(!buildloc)
		return FALSE

	if(!buildloc.is_weedable())
		if(!silent)
			to_chat(buyer, span_warning("这里不能这么做。"))
		return FALSE

	var/obj/alien/weeds/alien_weeds = locate() in buildloc

	if(!alien_weeds)
		if(!silent)
			to_chat(buyer, span_warning("我们只能在菌毯上建造。必须先找到一些树脂才能开始建造！"))
		return FALSE

	if(!buildloc.check_alien_construction(buyer, silent, building_type) || !buildloc.check_disallow_alien_fortification(buyer, silent))
		return FALSE

/datum/hive_upgrade/building/on_buy(mob/living/carbon/xenomorph/buyer)
	if(!do_after(buyer, building_time, NONE, buyer, BUSY_ICON_BUILD))
		return FALSE

	if(!can_buy(buyer, FALSE))
		return FALSE

	var/atom/built = new building_type(get_turf(buyer), buyer.hivenumber)
	to_chat(buyer, span_notice("我们消耗 [psypoint_cost] 点灵能点数建造了 [built]。"))
	log_game("[buyer] has built \a [built] in [AREACOORD(built)], spending [psypoint_cost] psy points in the process")
	xeno_message("[buyer] has built \a [built] at [get_area(built)]!", "xenoannounce", 5, buyer.hivenumber)
	return ..()

/datum/hive_upgrade/building/silo
	name = "Larva Silo"
	desc = "建造一个能随时间生成异形幼虫的孵化巢。"
	psypoint_cost = RESIN_SILO_PRICE
	icon = "larvasilo"
	gamemode_flags = ABILITY_NUCLEARWAR
	building_type = /obj/structure/xeno/silo

/datum/hive_upgrade/building/silo/can_buy(mob/living/carbon/xenomorph/buyer, silent = TRUE)
	. = ..()
	if(!.)
		return

	var/turf/buildloc = get_turf(buyer)
	if(!buildloc)
		return FALSE

	if(buildloc.density)
		if(!silent)
			to_chat(buyer, span_xenowarning("你无法在密集区域建造！"))
		return FALSE

	for(var/hive in GLOB.xeno_resin_silos_by_hive)
		for(var/silo in hive)
			if(get_dist(silo, buyer) < 15)
				to_chat(buyer, span_xenowarning("另一座孵化巢距离过近！"))
				return FALSE

/datum/hive_upgrade/building/evotower
	name = "Evolution Tower"
	desc = "建造一座塔，每座塔使进化点数生成速率增加0.2，成熟度点数生成速率增加0.4。"
	psypoint_cost = EVOLUTION_TOWER_PRICE
	icon = "evotower"
	gamemode_flags = ABILITY_NUCLEARWAR
	building_type = /obj/structure/xeno/evotower

/datum/hive_upgrade/building/psychictower
	name = "Psychic Relay"
	desc = "建造一座塔，增加更高阶级异形的可用槽位数量。"
	psypoint_cost = PSYCHIC_RELAY_PRICE
	icon = "maturitytower"
	gamemode_flags = ABILITY_NUCLEARWAR
	building_type = /obj/structure/xeno/psychictower

/datum/hive_upgrade/building/pherotower
	name = "Pheromone Tower"
	desc = "建造一座可散发选定类型信息素的塔。"
	psypoint_cost = PHEROMONE_TOWER_PRICE
	icon = "pherotower"
	gamemode_flags = ABILITY_NUCLEARWAR
	upgrade_flags = UPGRADE_FLAG_USES_TACTICAL
	building_type = /obj/structure/xeno/pherotower
	building_time = 5 SECONDS

/datum/hive_upgrade/building/spawner
	name = "Spawner"
	desc = "建造一个会随时间生成AI异形的孵化器"
	psypoint_cost = SPAWNER_PRICE
	icon = "spawner"
	gamemode_flags = ABILITY_NUCLEARWAR
	upgrade_flags = UPGRADE_FLAG_USES_TACTICAL
	building_type = /obj/structure/xeno/spawner

/datum/hive_upgrade/building/acid_pool
	name = "Acid Pool"
	desc = "建造一个水池，允许异形在其中休息时恢复破甲。"
	psypoint_cost = ACID_POOL_PRICE
	icon = "pool"
	gamemode_flags = ABILITY_NUCLEARWAR
	upgrade_flags = UPGRADE_FLAG_USES_TACTICAL
	building_type = /obj/structure/xeno/acid_pool

/datum/hive_upgrade/building/acid_pool/can_buy(mob/living/carbon/xenomorph/buyer, silent = TRUE)
	. = ..()
	if(!.)
		return

	var/turf/buildloc = get_turf(buyer)
	if(!buildloc)
		return FALSE

	if(buildloc.density)
		if(!silent)
			to_chat(buyer, span_xenowarning("你无法在密集区域建造！"))
		return FALSE

/datum/hive_upgrade/building/acid_jaws
	name = "Acid Jaws"
	desc = "构建一个酸液巨口，使蜂巢能够从远处轰炸敌人。必须放置在户外。"
	psypoint_cost = ACID_JAWS_PRICE
	icon = "jaws"
	gamemode_flags = ABILITY_NUCLEARWAR
	upgrade_flags = UPGRADE_FLAG_USES_TACTICAL
	building_type = /obj/structure/xeno/acid_maw/acid_jaws

/datum/hive_upgrade/building/acid_jaws/can_buy(mob/living/carbon/xenomorph/buyer, silent = TRUE)
	. = ..()
	if(!.)
		return

	for(var/atom/thing in GLOB.xeno_acid_jaws_by_hive[buyer.hivenumber])
		if(thing.type != building_type)
			continue
		if(!silent)
			to_chat(buyer, span_xenowarning("我们已经有一个了！"))
		return FALSE

	var/turf/buildloc = get_turf(buyer)
	if(!buildloc)
		return FALSE

	if(buildloc.density)
		if(!silent)
			to_chat(buyer, span_xenowarning("你无法在密集区域建造！"))
		return FALSE
	var/area/buildzone = get_area(buyer)
	if(buildzone.ceiling >= CEILING_UNDERGROUND)
		if(!silent)
			to_chat(buyer, span_xenowarning("我们需要开阔空间才能让这个结构轰炸敌人！"))
		return FALSE

/datum/hive_upgrade/building/mutation_chamber
	/// The maximum amount of buildings that can exist before being disallowed from buying more.
	var/max_chambers = MUTATION_CHAMBER_MAXIMUM

/datum/hive_upgrade/building/mutation_chamber/can_buy(mob/living/carbon/xenomorph/buyer, silent = TRUE)
	. = ..()
	if(!.)
		return FALSE
	if(!(SSticker.mode?.round_type_flags & MODE_MUTATIONS_OBTAINABLE) && !HAS_TRAIT(buyer, TRAIT_VALHALLA_XENO))
		if(!silent)
			to_chat(buyer, span_xenowarning("蜂巢无权购买此建筑。"))
		return FALSE

/datum/hive_upgrade/building/mutation_chamber/shell
	name = "Shell Mutation Chamber"
	desc = "建造一个允许异形购买生存突变的腔室。最多建造3个结构以提升突变强度。"
	icon = "shell"
	psypoint_cost = MUTATION_SHELL_CHAMBER_COST
	building_type = /obj/structure/xeno/mutation_chamber/shell

/datum/hive_upgrade/building/mutation_chamber/shell/can_buy(mob/living/carbon/xenomorph/buyer, silent = TRUE)
	. = ..()
	if(!.)
		return FALSE
	if(length(buyer.hive.shell_chambers) >= max_chambers)
		if(!silent)
			to_chat(buyer, span_xenowarning("蜂巢无法支持超过[max_chambers]个活跃的孵化室！"))
		return FALSE

/datum/hive_upgrade/building/mutation_chamber/spur
	name = "Spur Mutation Chamber"
	desc = "建造一个允许异形购买攻击变异的腔室。建造最多3个结构以提升变异威力。"
	icon = "spur"
	psypoint_cost = MUTATION_SPUR_CHAMBER_COST
	building_type = /obj/structure/xeno/mutation_chamber/spur

/datum/hive_upgrade/building/mutation_chamber/spur/can_buy(mob/living/carbon/xenomorph/buyer, silent = TRUE)
	. = ..()
	if(!.)
		return FALSE
	if(length(buyer.hive.spur_chambers) >= max_chambers)
		if(!silent)
			to_chat(buyer, span_xenowarning("蜂巢无法支持超过[max_chambers]个活跃的刺棘腔室！"))
		return FALSE

/datum/hive_upgrade/building/mutation_chamber/veil
	name = "Veil Mutation Chamber"
	desc = "建造一个允许异形购买实用突变的腔室。最多建造3个结构以提升突变强度。"
	icon = "veil"
	psypoint_cost = MUTATION_VEIL_CHAMBER_COST
	building_type = /obj/structure/xeno/mutation_chamber/veil

/datum/hive_upgrade/building/mutation_chamber/veil/can_buy(mob/living/carbon/xenomorph/buyer, silent = TRUE)
	. = ..()
	if(!.)
		return FALSE
	if(length(buyer.hive.veil_chambers) >= max_chambers)
		if(!silent)
			to_chat(buyer, span_xenowarning("蜂巢无法维持超过[max_chambers]个活跃的菌毯室！"))
		return FALSE

/datum/hive_upgrade/building/tunnel
	building_type = /obj/structure/xeno/tunnel

	name = "Tunnel"
	desc = "放置一个隧道入口，允许快速重新部署"
	icon = "tunnel"
	psypoint_cost = 75
	gamemode_flags = ABILITY_NUCLEARWAR
	upgrade_flags = UPGRADE_FLAG_USES_TACTICAL

/datum/hive_upgrade/building/tunnel/on_buy(mob/living/carbon/xenomorph/buyer)
	. = ..()
	if(!.)
		return
	playsound(get_turf(buyer), 'sound/weapons/pierce.ogg', 25, 1)

/datum/hive_upgrade/defence
	category = "Defences"

/datum/hive_upgrade/defence/turret
	name = "Acid Turret"
	desc = "在你脚下放置一座酸液喷射树脂炮塔。必须距离其他炮塔至少6格，不能靠近迷雾，且位于菌毯区域。"
	icon = "acidturret"
	psypoint_cost = XENO_ACID_TURRET_PRICE
	gamemode_flags = ABILITY_NUCLEARWAR
	upgrade_flags = UPGRADE_FLAG_USES_TACTICAL
	///How long to build one turret
	var/build_time = 10 SECONDS
	///What type of turret is built
	var/turret_type = /obj/structure/xeno/xeno_turret

/datum/hive_upgrade/defence/turret/can_buy(mob/living/carbon/xenomorph/buyer, silent = TRUE)
	. = ..()
	if(!.)
		return
	var/turf/T = get_turf(buyer)
	var/mob/living/carbon/xenomorph/blocker = locate() in T
	if(blocker && blocker != buyer && blocker.stat != DEAD)
		if(!silent)
			to_chat(buyer, span_xenowarning("无法建造，[blocker]挡住了去路！"))
		return FALSE

	if(!T.is_weedable())
		return FALSE

	if(!buyer.loc_weeds_type)
		if(!silent)
			to_chat(buyer, span_xenowarning("这里没有菌毯！"))
		return FALSE

	if(!T.check_alien_construction(buyer, silent, /obj/structure/xeno/xeno_turret) || !T.check_disallow_alien_fortification(buyer))
		return FALSE

	for(var/obj/structure/xeno/xeno_turret/turret AS in GLOB.xeno_resin_turrets_by_hive[buyer.hivenumber])
		if(get_dist(turret, buyer) < XENO_TURRET_EXCLUSION_RANGE)
			if(!silent)
				to_chat(buyer, span_xenowarning("另一座炮塔距离太近！"))
			return FALSE

	return TRUE

/datum/hive_upgrade/defence/turret/on_buy(mob/living/carbon/xenomorph/buyer)
	if(!do_after(buyer, build_time, NONE, buyer, BUSY_ICON_BUILD))
		return FALSE

	if(!can_buy(buyer, FALSE))
		return FALSE

	to_chat(buyer, span_xenowarning("我们建造了一座新的酸液炮塔，在此过程中消耗了[psypoint_cost]点灵能点数"))
	new turret_type(get_turf(buyer), buyer.hivenumber)

	log_game("[buyer] built a turret in [AREACOORD(buyer)], spending [psypoint_cost] psy points in the process")
	xeno_message("[buyer] has built a new turret at [get_area(buyer)]!", "xenoannounce", 5, buyer.hivenumber)

	return ..()

/datum/hive_upgrade/defence/turret/sticky
	name = "Sticky Resin Turret"
	desc = "在你脚下放置一个粘性喷射树脂炮塔。必须距离其他炮塔至少6格，不能靠近迷雾，且位于菌毯区域。"
	icon = "resinturret"
	psypoint_cost = XENO_RESIN_TURRET_PRICE
	turret_type = /obj/structure/xeno/xeno_turret/sticky

/datum/hive_upgrade/defence/gargoyle
	name = "Gargoyle"
	desc = "建造一个石像鬼，当敌人接近时会向你发出警报。"
	psypoint_cost = GARGOYLE_PRICE
	icon = "gargoyle"
	gamemode_flags = NONE
	upgrade_flags = UPGRADE_FLAG_USES_TACTICAL

/datum/hive_upgrade/defence/gargoyle/can_buy(mob/living/carbon/xenomorph/buyer, silent)
	. = ..()
	if(!.)
		return
	var/turf/buildloc = get_turf(buyer)
	if(!buildloc)
		return FALSE

	if(!buildloc.is_weedable())
		if(!silent)
			to_chat(buyer, span_warning("这里不能这么做。"))
		return FALSE

	var/obj/alien/weeds/alien_weeds = locate() in buildloc

	if(!alien_weeds)
		if(!silent)
			to_chat(buyer, span_warning("我们只能在菌毯上塑形。在开始建造前，我们必须找到一些树脂！"))
		return FALSE

	if(!buildloc.check_alien_construction(buyer, silent, /obj/structure/xeno/resin_gargoyle) || !buildloc.check_disallow_alien_fortification(buyer, silent))
		return FALSE

/datum/hive_upgrade/defence/gargoyle/on_buy(mob/living/carbon/xenomorph/buyer)
	if(!do_after(buyer, 3 SECONDS, NONE, buyer, BUSY_ICON_BUILD))
		return FALSE

	if(!can_buy(buyer, FALSE))
		return FALSE

	var/turf/buildloc = get_turf(buyer)

	var/atom/built = new /obj/structure/xeno/resin_gargoyle(buildloc, buyer.hivenumber, buyer)
	to_chat(buyer, span_notice("我们消耗 [psypoint_cost] 点灵能点数建造了 [built]。"))
	log_game("[buyer] has built \a [built] in [AREACOORD(buildloc)], spending [psypoint_cost] psy points in the process")
	xeno_message("[buyer] has built \a [built] at [get_area(buildloc)]!", "xenoannounce", 5, buyer.hivenumber)
	return ..()

/datum/hive_upgrade/xenos
	category = "Xenos"

/datum/hive_upgrade/primordial
	category = "Xenos"
	upgrade_flags = UPGRADE_FLAG_ONETIME|UPGRADE_FLAG_MESSAGE_HIVE|UPGRADE_FLAG_MUST_BE_HIVE_RULER

/datum/hive_upgrade/primordial/tier_four
	name = PRIMORDIAL_TIER_FOUR
	desc = "解锁最终阶级的原始形态"
	psypoint_cost = ANY_PRIMORDIAL_PRICE
	icon = "primoqueen"

/datum/hive_upgrade/primordial/tier_three
	name = PRIMORDIAL_TIER_THREE
	desc = "解锁第三阶级的原始形态"
	psypoint_cost = ANY_PRIMORDIAL_PRICE
	icon = "primorav"

/datum/hive_upgrade/primordial/tier_two
	name = PRIMORDIAL_TIER_TWO
	desc = "解锁第二阶级的原始形态"
	psypoint_cost = ANY_PRIMORDIAL_PRICE
	icon = "primowarrior"

/datum/hive_upgrade/primordial/tier_one
	name = PRIMORDIAL_TIER_ONE
	desc = "解锁第一阶级的原始形态"
	psypoint_cost = ANY_PRIMORDIAL_PRICE
	icon = "primosent"
