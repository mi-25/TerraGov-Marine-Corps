/obj/machinery/marine_selector
	name = "\improper 理论陆战队员选择器"
	desc = ""
	icon = 'icons/obj/machines/vending.dmi'
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	req_access = null
	req_one_access = null
	interaction_flags = INTERACT_MACHINE_TGUI

	idle_power_usage = 60
	active_power_usage = 3000
	light_range = 1.5
	light_power = 0.5
	light_color = LIGHT_COLOR_BLUE

	var/gives_webbing = FALSE
	var/vendor_role //to be compared with job.type to only allow those to use that machine.
	var/squad_tag = ""
	var/use_points = FALSE
	var/lock_flags = SQUAD_LOCK|JOB_LOCK

	var/icon_vend
	var/icon_deny

	var/list/categories
	var/list/listed_products

/obj/machinery/marine_selector/Initialize(mapload)
	. = ..()
	update_icon()

/obj/machinery/marine_selector/update_icon()
	. = ..()
	if(is_operational())
		set_light(initial(light_range))
	else
		set_light(0)

/obj/machinery/marine_selector/update_icon_state()
	. = ..()
	if(is_operational())
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-off"

/obj/machinery/marine_selector/update_overlays()
	. = ..()
	if(!is_operational() || !icon_state)
		return
	. += emissive_appearance(icon, "[icon_state]_emissive", src)

/obj/machinery/marine_selector/can_interact(mob/user)
	. = ..()
	if(!.)
		return FALSE

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(!allowed(H))
			to_chat(user, span_warning("访问被拒绝。您的指定角色无权使用此设备。"))
			return FALSE

		var/obj/item/card/id/user_id = H.get_idcard()
		if(!istype(user_id)) //not wearing an ID
			return FALSE

		if(user_id.registered_name != H.real_name)
			return FALSE

		if(lock_flags & JOB_LOCK && vendor_role && !istype(H.job, vendor_role))
			to_chat(user, span_warning("访问被拒绝。此贩卖机受到严格限制。"))
			return FALSE

		if(lock_flags & SQUAD_LOCK && (!H.assigned_squad || (squad_tag && H.assigned_squad.name != squad_tag)))
			to_chat(user, span_warning("访问被拒绝。您所属的小队无权操作此设备。"))
			return FALSE

	return TRUE

/obj/machinery/marine_selector/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)

	if(!ui)
		ui = new(user, src, "MarineSelector", name)
		ui.open()

/obj/machinery/marine_selector/ui_static_data(mob/user)
	. = list()
	.["displayed_records"] = list()

	for(var/c in categories)
		.["displayed_records"][c] = list()

	.["vendor_name"] = name
	.["show_points"] = use_points


	for(var/i in listed_products)
		var/list/myprod = listed_products[i]
		var/category = myprod[1]
		var/p_name = myprod[2]
		var/p_cost = myprod[3]
		var/atom/productpath = i

		LAZYADD(.["displayed_records"][category], list(list("prod_index" = i, "prod_name" = p_name, "prod_color" = myprod[4], "prod_cost" = p_cost, "prod_desc" = initial(productpath.desc))))

/obj/machinery/marine_selector/ui_data(mob/user)
	. = list()

	var/obj/item/card/id/I = user.get_idcard()
	var/list/buy_choices = I?.marine_buy_choices
	var/obj/item/card/id/dogtag/full/ptscheck = new /obj/item/card/id/dogtag/full

	.["cats"] = list()
	for(var/cat in GLOB.marine_selector_cats)
		if(!length(buy_choices))
			break
		.["cats"][cat] = list(
			"remaining" = buy_choices[cat],
			"total" = GLOB.marine_selector_cats[cat],
			"choice" = "choice",
			)

	for(var/cat in I?.marine_points)
		.["cats"][cat] = list(
			"remaining_points" = I?.marine_points[cat],
			"total_points" = ptscheck?.marine_points[cat],
			"choice" = "points",
			)

/obj/machinery/marine_selector/ui_act(action, list/params)
	. = ..()
	if(.)
		return
	switch(action)
		if("vend")
			if(!allowed(usr))
				to_chat(usr, span_warning("访问被拒绝。"))
				if(icon_deny)
					flick(icon_deny, src)
				return

			var/idx = text2path(params["vend"])
			var/obj/item/card/id/user_id = usr.get_idcard()

			var/list/L = listed_products[idx]
			var/item_category = L[1]
			var/cost = L[3]

			if(!(user_id.id_flags & CAN_BUY_LOADOUT)) //If you use the quick-e-quip, you cannot also use the GHMMEs
				to_chat(usr, span_warning("访问被拒绝。您已领取过一套装备。"))
				return FALSE
			if(use_points && (item_category in user_id.marine_points) && user_id.marine_points[item_category] < cost)
				to_chat(usr, span_warning("点数不足。"))
				if(icon_deny)
					flick(icon_deny, src)
				return

			var/turf/T = loc
			if(length(T.contents) > 25)
				to_chat(usr, span_warning("地面太杂乱，清理出一些空间。"))
				if(icon_deny)
					flick(icon_deny, src)
				return

			if(item_category in user_id.marine_buy_choices)
				if(user_id.marine_buy_choices[item_category] && GLOB.marine_selector_cats[item_category])
					user_id.marine_buy_choices[item_category] -= 1
				else
					if(cost == 0)
						to_chat(usr, span_warning("你无法再从该类别购买物品。"))
						return

			var/list/vended_items = list()

			if (ispath(idx, /obj/effect/vendor_bundle))
				var/obj/effect/vendor_bundle/bundle = new idx(loc, FALSE)
				vended_items += bundle.spawned_gear
				qdel(bundle)
			else
				vended_items += new idx(loc)

			playsound(src, SFX_VENDING, 25, 0)

			if(icon_vend)
				flick(icon_vend, src)

			use_power(active_power_usage)

			if(item_category == CAT_STD && !issynth(usr))
				var/mob/living/carbon/human/H = usr
				if(!istype(H.job, /datum/job/terragov/command/fieldcommander))
					vended_items += new /obj/item/radio/headset/mainship/marine(loc, H.assigned_squad, vendor_role)
					if(istype(H.job, /datum/job/terragov/squad/leader))
						vended_items += new /obj/item/hud_tablet(loc, vendor_role, H.assigned_squad)
						vended_items += new /obj/item/squad_transfer_tablet(loc)

			for (var/obj/item/vended_item in vended_items)
				vended_item.on_vend(usr, faction, auto_equip = TRUE)

			if(use_points && (item_category in user_id.marine_points))
				user_id.marine_points[item_category] -= cost
			. = TRUE
			user_id.id_flags |= USED_GHMME

/obj/machinery/marine_selector/clothes
	name = "\improper GHMME 自动储物柜"
	desc = "一个连接着标准制式军服和护甲巨型存储单元的自动化储物柜。"
	icon_state = "marineuniform"
	icon_vend = "marineuniform-vend"
	icon_deny = "marineuniform-deny"
	vendor_role = /datum/job/terragov/squad/standard
	use_points = TRUE
	categories = list(
		CAT_STD = 1,
		CAT_GLA = 1,
		CAT_HEL = 1,
		CAT_AMR = 1,
		CAT_BAK = 1,
		CAT_WEB = 1,
		CAT_BEL = 1,
		CAT_POU = 2,
		CAT_MOD = 1,
		CAT_ARMMOD = 1,
		CAT_MAS = 1,
	)

/obj/machinery/marine_selector/clothes/Initialize(mapload)
	. = ..()
	listed_products = GLOB.marine_clothes_listed_products + GLOB.marine_gear_listed_products

/obj/machinery/marine_selector/clothes/alpha
	squad_tag = "Alpha"
	req_access = list(ACCESS_MARINE_ALPHA)

/obj/machinery/marine_selector/clothes/bravo
	squad_tag = "Bravo"
	req_access = list(ACCESS_MARINE_BRAVO)

/obj/machinery/marine_selector/clothes/charlie
	squad_tag = "Charlie"
	req_access = list(ACCESS_MARINE_CHARLIE)

/obj/machinery/marine_selector/clothes/delta
	squad_tag = "Delta"
	req_access = list(ACCESS_MARINE_DELTA)


/obj/machinery/marine_selector/clothes/engi
	name = "\improper GHMME 自动化工程师储物柜"
	req_access = list(ACCESS_MARINE_ENGPREP)
	vendor_role = /datum/job/terragov/squad/engineer
	gives_webbing = FALSE

/obj/machinery/marine_selector/clothes/engi/Initialize(mapload)
	. = ..()
	listed_products = GLOB.engineer_clothes_listed_products

/obj/machinery/marine_selector/clothes/engi/alpha
	squad_tag = "Alpha"
	req_access = list(ACCESS_MARINE_ENGPREP, ACCESS_MARINE_ALPHA)

/obj/machinery/marine_selector/clothes/engi/bravo
	squad_tag = "Bravo"
	req_access = list(ACCESS_MARINE_ENGPREP, ACCESS_MARINE_BRAVO)

/obj/machinery/marine_selector/clothes/engi/charlie
	squad_tag = "Charlie"
	req_access = list(ACCESS_MARINE_ENGPREP, ACCESS_MARINE_CHARLIE)

/obj/machinery/marine_selector/clothes/engi/delta
	squad_tag = "Delta"
	req_access = list(ACCESS_MARINE_ENGPREP, ACCESS_MARINE_DELTA)

/obj/machinery/marine_selector/clothes/engi/valhalla
	vendor_role = /datum/job/fallen/marine/engineer
	resistance_flags = INDESTRUCTIBLE
	lock_flags = JOB_LOCK

/obj/machinery/marine_selector/clothes/medic
	name = "\improper GHMME 自动化卫生兵储物柜"
	req_access = list(ACCESS_MARINE_MEDPREP)
	vendor_role = /datum/job/terragov/squad/corpsman
	gives_webbing = FALSE


/obj/machinery/marine_selector/clothes/medic/Initialize(mapload)
	. = ..()
	listed_products = GLOB.medic_clothes_listed_products

/obj/machinery/marine_selector/clothes/medic/alpha
	squad_tag = "Alpha"
	req_access = list(ACCESS_MARINE_MEDPREP, ACCESS_MARINE_ALPHA)

/obj/machinery/marine_selector/clothes/medic/bravo
	squad_tag = "Bravo"
	req_access = list(ACCESS_MARINE_MEDPREP, ACCESS_MARINE_BRAVO)

/obj/machinery/marine_selector/clothes/medic/charlie
	squad_tag = "Charlie"
	req_access = list(ACCESS_MARINE_MEDPREP, ACCESS_MARINE_CHARLIE)

/obj/machinery/marine_selector/clothes/medic/delta
	squad_tag = "Delta"
	req_access = list(ACCESS_MARINE_MEDPREP, ACCESS_MARINE_DELTA)

/obj/machinery/marine_selector/clothes/medic/valhalla
	vendor_role = /datum/job/fallen/marine/corpsman
	resistance_flags = INDESTRUCTIBLE
	lock_flags = JOB_LOCK

/obj/machinery/marine_selector/clothes/smartgun
	name = "\improper GHMME 自动化智能机枪手储物柜"
	req_access = list(ACCESS_MARINE_SMARTPREP)
	vendor_role = /datum/job/terragov/squad/smartgunner
	gives_webbing = FALSE

/obj/machinery/marine_selector/clothes/smartgun/Initialize(mapload)
	. = ..()
	listed_products = GLOB.smartgunner_clothes_listed_products

/obj/machinery/marine_selector/clothes/smartgun/alpha
	squad_tag = "Alpha"
	req_access = list(ACCESS_MARINE_SMARTPREP, ACCESS_MARINE_ALPHA)

/obj/machinery/marine_selector/clothes/smartgun/bravo
	squad_tag = "Bravo"
	req_access = list(ACCESS_MARINE_SMARTPREP, ACCESS_MARINE_BRAVO)

/obj/machinery/marine_selector/clothes/smartgun/charlie
	squad_tag = "Charlie"
	req_access = list(ACCESS_MARINE_SMARTPREP, ACCESS_MARINE_CHARLIE)

/obj/machinery/marine_selector/clothes/smartgun/delta
	squad_tag = "Delta"
	req_access = list(ACCESS_MARINE_SMARTPREP, ACCESS_MARINE_DELTA)

/obj/machinery/marine_selector/clothes/smartgun/valhalla
	vendor_role = /datum/job/fallen/marine/smartgunner
	resistance_flags = INDESTRUCTIBLE
	lock_flags = JOB_LOCK

/obj/machinery/marine_selector/clothes/leader
	name = "\improper GHMME 自动化班长装备柜"
	req_access = list(ACCESS_MARINE_LEADER)
	vendor_role = /datum/job/terragov/squad/leader
	gives_webbing = FALSE

/obj/machinery/marine_selector/clothes/leader/Initialize(mapload)
	. = ..()
	listed_products = GLOB.leader_clothes_listed_products

/obj/machinery/marine_selector/clothes/leader/alpha
	squad_tag = "Alpha"
	req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_ALPHA)

/obj/machinery/marine_selector/clothes/leader/bravo
	squad_tag = "Bravo"
	req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_BRAVO)

/obj/machinery/marine_selector/clothes/leader/charlie
	squad_tag = "Charlie"
	req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_CHARLIE)

/obj/machinery/marine_selector/clothes/leader/delta
	squad_tag = "Delta"
	req_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_DELTA)

/obj/machinery/marine_selector/clothes/leader/valhalla
	vendor_role = /datum/job/fallen/marine/leader
	resistance_flags = INDESTRUCTIBLE
	lock_flags = JOB_LOCK

/obj/machinery/marine_selector/clothes/valhalla
	vendor_role = /datum/job/fallen/marine/standard
	resistance_flags = INDESTRUCTIBLE
	lock_flags = JOB_LOCK

/obj/machinery/marine_selector/clothes/commander
	name = "\improper GHMME 自动化指挥官储物柜"
	req_access = list(ACCESS_MARINE_COMMANDER)
	vendor_role = /datum/job/terragov/command/fieldcommander
	lock_flags = JOB_LOCK
	gives_webbing = FALSE

/obj/machinery/marine_selector/clothes/commander/valhalla
	vendor_role = /datum/job/fallen/marine/fieldcommander
	resistance_flags = INDESTRUCTIBLE
	lock_flags = JOB_LOCK

/obj/machinery/marine_selector/clothes/commander/Initialize(mapload)
	. = ..()
	listed_products = list(
		/obj/effect/vendor_bundle/basic_commander = list(CAT_STD, "Standard kit", 0, "white"),
		/obj/effect/vendor_bundle/basic_jaeger_commander = list(CAT_STD, "Essential Jaeger Kit", 0, "white"),
		/obj/effect/vendor_bundle/xenonauten_light/leader = list(CAT_AMR, "Xenonauten light armor kit", 0, "orange"),
		/obj/effect/vendor_bundle/xenonauten_medium/leader = list(CAT_AMR, "Xenonauten medium armor kit", 0, "orange"),
		/obj/effect/vendor_bundle/xenonauten_heavy/leader = list(CAT_AMR, "Xenonauten heavy armor kit", 0, "orange"),
		/obj/item/clothing/suit/modular/jaeger/light = list(CAT_AMR, "Jaeger Scout light exo", 0, "orange"),
		/obj/item/clothing/suit/modular/jaeger/light/skirmisher = list(CAT_AMR, "Jaeger Skirmisher light exo", 0, "orange"),
		/obj/item/clothing/suit/modular/jaeger = list(CAT_AMR, "Jaeger Infantry medium exo", 0, "orange"),
		/obj/item/clothing/suit/modular/jaeger/eva = list(CAT_AMR, "Jaeger EVA medium exo", 0, "orange"),
		/obj/item/clothing/suit/modular/jaeger/heavy = list(CAT_AMR, "Jaeger Gungnir heavy exo", 0, "orange"),
		/obj/item/clothing/suit/modular/jaeger/heavy/assault = list(CAT_AMR, "Jaeger Assault heavy exo", 0, "orange"),
		/obj/item/clothing/suit/modular/jaeger/heavy/eod = list(CAT_AMR, "Jaeger EOD heavy exo", 0, "orange"),
		/obj/item/storage/backpack/marine/satchel = list(CAT_BAK, "Satchel", 0, "black"),
		/obj/item/storage/backpack/marine/standard = list(CAT_BAK, "Backpack", 0, "black"),
		/obj/item/storage/holster/blade/machete/full = list(CAT_BAK, "Machete scabbard", 0, "black"),
		/obj/item/armor_module/storage/uniform/black_vest = list(CAT_WEB, "Tactical black vest", 0, "black"),
		/obj/item/armor_module/storage/uniform/webbing = list(CAT_WEB, "Tactical webbing", 0, "black"),
		/obj/item/armor_module/storage/uniform/holster = list(CAT_WEB, "Shoulder handgun holster", 0, "black"),
		/obj/item/storage/belt/marine = list(CAT_BEL, "Standard ammo belt", 0, "black"),
		/obj/item/storage/belt/shotgun = list(CAT_BEL, "Shotgun ammo belt", 0, "black"),
		/obj/item/storage/belt/knifepouch = list(CAT_BEL, "Knives belt", 0, "black"),
		/obj/item/storage/holster/belt/pistol/standard_pistol = list(CAT_BEL, "Pistol belt", 0, "black"),
		/obj/item/storage/holster/belt/revolver/standard_revolver = list(CAT_BEL, "Revolver belt", 0, "black"),
		/obj/item/storage/belt/sparepouch = list(CAT_BEL, "G8 general utility pouch", 0, "black"),
		/obj/item/belt_harness/marine = list(CAT_BEL, "Belt Harness", 0, "black"),
		/obj/item/armor_module/module/welding = list(CAT_HEL, "Jaeger welding module", 0, "orange"),
		/obj/item/armor_module/module/binoculars = list(CAT_HEL, "Jaeger binoculars module", 0, "orange"),
		/obj/item/armor_module/module/artemis = list(CAT_HEL, "Jaeger Freyr module", 0, "orange"),
		/obj/item/armor_module/module/antenna = list(CAT_HEL, "Jaeger Antenna module", 0, "orange"),
		/obj/item/clothing/head/tgmcberet/fc = list(CAT_HEL, "FC Beret", 0, "black"),
		/obj/item/armor_module/storage/medical = list(CAT_MOD, "Medical Storage Module", 0, "black"),
		/obj/item/armor_module/storage/injector = list(CAT_MOD, "Injector Storage Module", 0, "black"),
		/obj/item/armor_module/storage/general = list(CAT_MOD, "General Purpose Storage Module", 0, "black"),
		/obj/item/armor_module/storage/engineering = list(CAT_MOD, "Engineering Storage Module", 0, "black"),
		/obj/item/armor_module/storage/grenade = list(CAT_MOD, "Grenade Storage Module", 0, "black"),
		/obj/item/storage/pouch/shotgun = list(CAT_POU, "Shotgun shell pouch", 0, "black"),
		/obj/item/storage/pouch/general/large = list(CAT_POU, "General pouch", 0, "black"),
		/obj/item/storage/pouch/magazine/large = list(CAT_POU, "Magazine pouch", 0, "black"),
		/obj/item/storage/holster/flarepouch/full = list(CAT_POU, "Flare pouch", 0, "black"),
		/obj/item/storage/pouch/medical_injectors/standard = list(CAT_POU, "Combat injector pouch", 0,"orange"),
		/obj/item/storage/pouch/medkit/firstaid = list(CAT_POU, "Firstaid pouch", 0, "orange"),
		/obj/item/storage/pouch/tools/full = list(CAT_POU, "Tool pouch (tools included)", 0, "black"),
		/obj/item/storage/pouch/grenade/slightlyfull = list(CAT_POU, "Grenade pouch (grenades included)", 0,"black"),
		/obj/item/storage/pouch/construction/full = list(CAT_POU, "Construction pouch (materials included)", 0, "black"),
		/obj/item/storage/pouch/magazine/pistol/large = list(CAT_POU, "Pistol magazine pouch", 0, "black"),
		/obj/item/storage/pouch/pistol = list(CAT_POU, "Sidearm pouch", 0, "black"),
		/obj/item/storage/pouch/explosive = list(CAT_POU, "Explosive pouch", 0, "black"),
		/obj/effect/vendor_bundle/mimir = list(CAT_ARMMOD, "Mark 1 Mimir Resistance set", 0,"black"),
		/obj/item/armor_module/module/ballistic_armor = list(CAT_ARMMOD, "Hod Accident Prevention Plating", 0,"black"),
		/obj/effect/vendor_bundle/tyr = list(CAT_ARMMOD, "Mark 1 Tyr extra armor set", 0,"black"),
		/obj/item/armor_module/module/better_shoulder_lamp = list(CAT_ARMMOD, "Baldur light armor module", 0,"black"),
		/obj/effect/vendor_bundle/vali = list(CAT_ARMMOD, "Vali chemical enhancement set", 0,"black"),
		/obj/item/armor_module/module/eshield = list(CAT_ARMMOD, "Svalinn Energy Shield System", 0 , "black"),
		/obj/item/armor_module/module/mirage = list(CAT_ARMMOD, "Loki Illusion Module", 0, "black"),
		/obj/item/armor_module/module/armorlock = list(CAT_ARMMOD, "Thor Armorlock Module", 0, "black"),
		/obj/item/clothing/mask/gas = list(CAT_MAS, "Transparent gas mask", 0,"black"),
		/obj/item/clothing/mask/gas/tactical = list(CAT_MAS, "Tactical gas mask", 0,"black"),
		/obj/item/clothing/mask/gas/tactical/coif = list(CAT_MAS, "Tactical coifed gas mask", 0,"black"),
		/obj/item/clothing/mask/rebreather/scarf = list(CAT_MAS, "Heat absorbent coif", 0, "black"),
		/obj/item/clothing/mask/rebreather = list(CAT_MAS, "Rebreather", 0, "black"),
	)



/obj/machinery/marine_selector/clothes/synth
	name = "M57 合成人装备贩卖机"
	desc = "一台连接着小型存储单元的自动化合成人装备贩卖机。"
	icon_state = "synth"
	icon_vend = "synth-vend"
	icon_deny = "synth-deny"
	vendor_role = /datum/job/terragov/silicon/synthetic
	lock_flags = JOB_LOCK

/obj/machinery/marine_selector/clothes/synth/valhalla
	vendor_role = /datum/job/fallen/marine/synthetic
	resistance_flags = INDESTRUCTIBLE


/obj/machinery/marine_selector/clothes/synth/Initialize(mapload)
	. = ..()
	listed_products = GLOB.synthetic_clothes_listed_products

////////////////////// Gear ////////////////////////////////////////////////////////



/obj/machinery/marine_selector/gear
	name = "\improper NEXUS 自动化装备架"
	desc = "连接着巨型存储单元的自动化装备架。"
	icon_state = "marinearmory"
	use_points = TRUE

/obj/machinery/marine_selector/gear/medic
	name = "\improper NEXUS 自动化医疗设备架"
	desc = "一个自动化的装备架，连接着庞大的医疗物资存储库。"
	icon_state = "medic"
	icon_vend = "medic-vend"
	icon_deny = "medic-deny"
	vendor_role = /datum/job/terragov/squad/corpsman
	req_access = list(ACCESS_MARINE_MEDPREP)

/obj/machinery/marine_selector/gear/medic/Initialize(mapload)
	. = ..()
	listed_products = GLOB.medic_gear_listed_products

/obj/machinery/marine_selector/gear/medic/valhalla
	vendor_role = /datum/job/fallen/marine/corpsman
	resistance_flags = INDESTRUCTIBLE
	lock_flags = JOB_LOCK

/obj/machinery/marine_selector/gear/engi
	name = "\improper NEXUS自动化工程设备架"
	desc = "一个自动化的装备架，连接着庞大的工程物资存储库。"
	icon_state = "engineer"
	icon_vend = "engineer-vend"
	icon_deny = "engineer-deny"
	vendor_role = /datum/job/terragov/squad/engineer
	req_access = list(ACCESS_MARINE_ENGPREP)

/obj/machinery/marine_selector/gear/engi/Initialize(mapload)
	. = ..()
	listed_products = GLOB.engineer_gear_listed_products

/obj/machinery/marine_selector/gear/engi/valhalla
	vendor_role = /datum/job/fallen/marine/engineer
	resistance_flags = INDESTRUCTIBLE
	lock_flags = JOB_LOCK

/obj/machinery/marine_selector/gear/smartgun
	name = "\improper NEXUS 自动智能机枪装备架"
	desc = "一个自动化的装备架，连接着一个庞大的智能机枪相关物资存储库。"
	icon_state = "smartgunner"
	icon_vend = "smartgunner-vend"
	icon_deny = "smartgunner-deny"
	vendor_role = /datum/job/terragov/squad/smartgunner
	req_access = list(ACCESS_MARINE_SMARTPREP)

/obj/machinery/marine_selector/gear/smartgun/Initialize(mapload)
	. = ..()
	listed_products = GLOB.smartgunner_gear_listed_products

/obj/machinery/marine_selector/gear/smartgun/valhalla
	vendor_role = /datum/job/fallen/marine/smartgunner
	resistance_flags = INDESTRUCTIBLE
	lock_flags = JOB_LOCK

/obj/machinery/marine_selector/gear/leader
	name = "\improper NEXUS 自动化班长装备架"
	desc = "一个自动装备架，连接着一个储存基础猫群驱赶设备的巨大仓库。"
	icon_state = "squadleader"
	icon_vend = "squadleader-vend"
	icon_deny = "squadleader-deny"
	vendor_role = /datum/job/terragov/squad/leader
	req_access = list(ACCESS_MARINE_LEADER)

/obj/machinery/marine_selector/gear/leader/Initialize(mapload)
	. = ..()
	listed_products = GLOB.leader_gear_listed_products

/obj/machinery/marine_selector/gear/leader/valhalla
	vendor_role = /datum/job/fallen/marine/leader
	resistance_flags = INDESTRUCTIBLE
	lock_flags = JOB_LOCK

/obj/machinery/marine_selector/gear/commander
	name = "\improper NEXUS 自动化指挥装备架"
	desc = "一个自动化装备架，连接着一个巨大的先进猫群驱赶装置存储单元。"
	icon_state = "squadleader"
	icon_vend = "squadleader-vend"
	icon_deny = "squadleader-deny"
	vendor_role = /datum/job/terragov/command/fieldcommander
	req_access = list(ACCESS_MARINE_COMMANDER)
	lock_flags = JOB_LOCK

/obj/machinery/marine_selector/gear/commander/Initialize(mapload)
	. = ..()
	listed_products = GLOB.commander_gear_listed_products

/obj/machinery/marine_selector/gear/commander/valhalla
	vendor_role = /datum/job/fallen/marine/fieldcommander
	resistance_flags = INDESTRUCTIBLE
	lock_flags = JOB_LOCK

///Spawns a set of objects from specified typepaths. For vendors to spawn multiple items while only needing one path.
/obj/effect/vendor_bundle
	///The set of typepaths to spawn
	var/list/gear_to_spawn
	///Records the gear objects that have been spawned, so vendors can see what they just vended
	var/list/spawned_gear

///Spawns the gear from this vendor_bundle. Deletes itself after spawning gear; can be disabled to check what has been spawned (must then delete the bundle yourself)
/obj/effect/vendor_bundle/Initialize(mapload, autodelete = TRUE)
	. = ..()
	LAZYINITLIST(gear_to_spawn)
	for(var/typepath in gear_to_spawn)
		LAZYADD(spawned_gear, new typepath(loc))
	if (autodelete)
		qdel(src)

/obj/effect/vendor_bundle/basic
	gear_to_spawn = list(
		/obj/item/clothing/under/marine,
		/obj/item/clothing/shoes/marine/full,
		/obj/item/clothing/gloves/marine,
		/obj/item/storage/box/MRE,
		/obj/item/paper/tutorial/medical,
		/obj/item/paper/tutorial/mechanics,
	)

/obj/effect/vendor_bundle/basic_jaeger
	gear_to_spawn = list(
		/obj/item/clothing/under/marine/jaeger,
		/obj/item/clothing/shoes/marine/full,
		/obj/item/clothing/gloves/marine,
		/obj/item/storage/box/MRE,
		/obj/item/facepaint/green,
		/obj/item/paper/tutorial/medical,
		/obj/item/paper/tutorial/mechanics,
	)

/obj/effect/vendor_bundle/basic_smartgunner
	gear_to_spawn = list(
		/obj/item/clothing/under/marine,
		/obj/item/clothing/shoes/marine/full,
		/obj/item/clothing/gloves/marine,
		/obj/item/storage/box/MRE,
	)

/obj/effect/vendor_bundle/basic_jaeger_smartgunner
	gear_to_spawn = list(
		/obj/item/clothing/under/marine/jaeger,
		/obj/item/clothing/shoes/marine/full,
		/obj/item/clothing/gloves/marine,
		/obj/item/storage/box/MRE,
		/obj/item/facepaint/green,
	)

/obj/effect/vendor_bundle/basic_squadleader
	gear_to_spawn = list(
		/obj/item/clothing/under/marine,
		/obj/item/clothing/shoes/marine/full,
		/obj/item/clothing/gloves/marine,
		/obj/item/storage/box/MRE,
	)

/obj/effect/vendor_bundle/basic_jaeger_squadleader
	gear_to_spawn = list(
		/obj/item/clothing/under/marine/jaeger,
		/obj/item/clothing/shoes/marine/full,
		/obj/item/clothing/gloves/marine,
		/obj/item/storage/box/MRE,
		/obj/item/facepaint/green,
	)

/obj/effect/vendor_bundle/basic_medic
	gear_to_spawn = list(
		/obj/item/clothing/under/marine/corpsman,
		/obj/item/clothing/shoes/marine/full,
		/obj/item/clothing/gloves/marine,
		/obj/item/storage/box/MRE,
	)

/obj/effect/vendor_bundle/basic_jaeger_medic
	gear_to_spawn = list(
		/obj/item/clothing/under/marine/jaeger,
		/obj/item/clothing/shoes/marine/full,
		/obj/item/clothing/gloves/marine,
		/obj/item/storage/box/MRE,
		/obj/item/facepaint/green,
	)

/obj/effect/vendor_bundle/basic_engineer
	gear_to_spawn = list(
		/obj/item/clothing/under/marine/engineer,
		/obj/item/clothing/shoes/marine/full,
		/obj/item/storage/box/MRE,
	)

/obj/effect/vendor_bundle/basic_jaeger_engineer
	gear_to_spawn = list(
		/obj/item/clothing/under/marine/jaeger,
		/obj/item/clothing/shoes/marine/full,
		/obj/item/storage/box/MRE,
		/obj/item/facepaint/green,
	)

/obj/effect/vendor_bundle/basic_commander
	gear_to_spawn = list(
		/obj/item/clothing/under/marine,
		/obj/item/clothing/shoes/marine/full,
		/obj/item/storage/box/MRE,
	)

/obj/effect/vendor_bundle/basic_jaeger_commander
	gear_to_spawn = list(
		/obj/item/clothing/under/marine/jaeger,
		/obj/item/clothing/shoes/marine/full,
		/obj/item/storage/box/MRE,
		/obj/item/facepaint/green,
	)

/obj/effect/vendor_bundle/medic
	gear_to_spawn = list(
		/obj/item/bodybag/cryobag,
		/obj/item/defibrillator,
		/obj/item/healthanalyzer,
		/obj/item/roller/medevac,
		/obj/item/medevac_beacon,
		/obj/item/roller,
		/obj/item/tweezers,
		/obj/item/reagent_containers/hypospray/advanced/oxycodone,
		/obj/item/storage/firstaid/adv,
		/obj/item/clothing/glasses/hud/health,
	)

/obj/effect/vendor_bundle/stretcher
	desc = "地球政府殖民地海军陆战队标准配发的卫生兵医疗后送担架。附带一个额外的信标，但多张病床可以链接至同一个信标。"
	gear_to_spawn = list(
		/obj/item/roller/medevac,
		/obj/item/medevac_beacon,
	)

/obj/effect/vendor_bundle/engi
	gear_to_spawn = list(
		/obj/item/explosive/plastique,
		/obj/item/explosive/grenade/chem_grenade/razorburn_small,
		/obj/item/clothing/gloves/marine/insulated,
		/obj/item/cell/high,
		/obj/item/lightreplacer,
		/obj/item/circuitboard/apc,
	)

/obj/effect/vendor_bundle/smartgunner
	gear_to_spawn = list(
		/obj/item/clothing/glasses/night/m56_goggles,
	)

/obj/effect/vendor_bundle/leader
	gear_to_spawn = list(
		/obj/item/explosive/plastique,
		/obj/item/supply_beacon,
		/obj/item/supply_beacon,
		/obj/item/whistle,
		/obj/item/compass,
		/obj/item/binoculars/tactical,
		/obj/item/pinpointer,
		/obj/item/clothing/glasses/hud/health,
	)

/obj/effect/vendor_bundle/commander
	gear_to_spawn = list(
		/obj/item/explosive/plastique,
		/obj/item/supply_beacon,
		/obj/item/healthanalyzer,
		/obj/item/roller/medevac,
		/obj/item/medevac_beacon,
		/obj/item/whistle,
		/obj/item/clothing/glasses/hud/health,
	)

/obj/effect/vendor_bundle/synth
	gear_to_spawn = list(
		/obj/item/stack/sheet/plasteel/medium_stack,
		/obj/item/stack/sheet/metal/large_stack,
		/obj/item/tool/weldingtool/hugetank,
		/obj/item/tool/handheld_charger,
		/obj/item/defibrillator,
		/obj/item/medevac_beacon,
		/obj/item/roller/medevac,
		/obj/item/roller,
		/obj/item/bodybag/cryobag,
		/obj/item/reagent_containers/hypospray/advanced/oxycodone,
		/obj/item/tweezers,
		/obj/item/cell/high,
		/obj/item/circuitboard/apc,
		/obj/item/tool/soap,
	)

/obj/effect/vendor_bundle/white_dress
	name = "全套地球政府殖民地海军陆战队白色礼服制服"
	desc = "一套标准配发的地球政府殖民地海军陆战队白色礼服。面料中的浆料有些磨人，但与你从新兵训练营毕业首次穿上它时感受到的自豪相比，这根本不算什么。不过腰身似乎不太合身。"
	gear_to_spawn = list(
		/obj/item/clothing/under/marine/whites,
		/obj/item/clothing/suit/white_dress_jacket,
		/obj/item/clothing/head/white_dress,
		/obj/item/clothing/shoes/white,
		/obj/item/clothing/gloves/white,
	)

/obj/effect/vendor_bundle/service_uniform
	name = "全套地球政府殖民地海军陆战队常服"
	desc = "一套标准配发的地球政府殖民地海军陆战队常服。有时候你讨厌穿它，因为这会让你想起在步兵学校时不得不穿着它去见委任军官。这是你在非部署状态、在办公室工作时穿着的服装。腰身似乎不太合身。"
	gear_to_spawn = list(
		/obj/item/clothing/under/marine/service,
		/obj/item/clothing/head/garrisoncap,
		/obj/item/clothing/head/servicecap,
		/obj/item/clothing/shoes/marine/full,
	)

/obj/effect/vendor_bundle/jaeger_light
	desc = "一套轻型侦察型机甲护甲，包括护甲服和头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/marine/scout,
		/obj/item/clothing/suit/modular/jaeger/light,
	)

/obj/effect/vendor_bundle/jaeger_skirmish
	desc = "一套轻型游骑兵式样的机甲护甲，包含护甲套装和头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/marine/skirmisher,
		/obj/item/clothing/suit/modular/jaeger/light/skirmisher,
	)

/obj/effect/vendor_bundle/jaeger_infantry
	desc = "一套中型步兵型杰格装甲，包含装甲服和头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/marine,
		/obj/item/clothing/suit/modular/jaeger,
	)

/obj/effect/vendor_bundle/jaeger_eva
	desc = "一套中型EVA式样的机甲护甲，包含护甲服和头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/marine/eva,
		/obj/item/clothing/suit/modular/jaeger/eva,
	)

/obj/effect/vendor_bundle/jaeger_hell_jumper
	desc = "一套中型地狱伞兵式样的机甲护甲，包含护甲服和头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/marine/helljumper,
		/obj/item/clothing/suit/modular/jaeger/helljumper,
	)

/obj/effect/vendor_bundle/jaeger_ranger
	desc = "一套中型游骑兵式样的机甲护甲，包含护甲服和头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/marine/ranger,
		/obj/item/clothing/suit/modular/jaeger/ranger,
	)

/obj/effect/vendor_bundle/jaeger_gungnir
	desc = "一套重型冈尼尔型机甲装甲，包含装甲服和头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/marine/gungnir,
		/obj/item/clothing/suit/modular/jaeger/heavy,
	)

/obj/effect/vendor_bundle/jaeger_assault
	desc = "一套重型突击型机甲护甲，包含护甲套装和头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/marine/assault,
		/obj/item/clothing/suit/modular/jaeger/heavy/assault,
	)

/obj/effect/vendor_bundle/jaeger_eod
	desc = "一套重型排爆型机甲护甲，包含护甲服和头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/marine/eod,
		/obj/item/clothing/suit/modular/jaeger/heavy/eod,
	)

/obj/effect/vendor_bundle/xenonauten_light
	desc = "一套轻型的异形猎人式护甲，包括一件护甲服和一顶头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/m10x,
		/obj/item/clothing/suit/modular/xenonauten/light,
	)

/obj/effect/vendor_bundle/xenonauten_medium
	desc = "一套中等规格的异形作战护甲，包含护甲服和头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/m10x,
		/obj/item/clothing/suit/modular/xenonauten,
	)

/obj/effect/vendor_bundle/xenonauten_heavy
	desc = "一套重型异形猎人式护甲，包含护甲服和头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/m10x,
		/obj/item/clothing/suit/modular/xenonauten/heavy,
	)

/obj/effect/vendor_bundle/xenonauten_light/leader
	desc = "一套轻便的异形陆战队式护甲，包括一件护甲服和一顶高级头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/m10x/leader,
		/obj/item/clothing/suit/modular/xenonauten/light,
	)

/obj/effect/vendor_bundle/xenonauten_medium/leader
	desc = "一套中等规格的异形战士护甲，包含一件护甲服和一顶高级头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/m10x/leader,
		/obj/item/clothing/suit/modular/xenonauten,
	)

/obj/effect/vendor_bundle/xenonauten_heavy/leader
	desc = "一套重型异形猎人式护甲，包括一件护甲套装和一顶高级头盔。"
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/m10x/leader,
		/obj/item/clothing/suit/modular/xenonauten/heavy,
	)

/obj/effect/vendor_bundle/mimir
	desc = "一套防毒装备，用于保护穿戴者免受气体威胁。"
	gear_to_spawn = list(
		/obj/item/armor_module/module/mimir_environment_protection/mimir_helmet/mark1,
		/obj/item/clothing/mask/gas/tactical,
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
	)

/obj/effect/vendor_bundle/vali
	desc = "一套专为近距离作战和强化化学效能设计的特种装备。"
	gear_to_spawn = list(
		/obj/item/armor_module/module/chemsystem,
		/obj/item/storage/holster/blade/machete/full_harvester,
		/obj/item/paper/chemsystem,
	)

/obj/effect/vendor_bundle/tyr
	desc = "一套用于提升近距离作战持久性的专用装备。"
	gear_to_spawn = list(
		/obj/item/armor_module/module/tyr_head,
		/obj/item/armor_module/module/tyr_extra_armor/mark1,
	)

/obj/effect/vendor_bundle/robot/essentials
	gear_to_spawn = list(
		/obj/item/clothing/under/marine/robotic,
		/obj/item/tool/weldingtool,
		/obj/item/stack/cable_coil,

	)


/obj/effect/vendor_bundle/robot/essentials_smartgunner
	gear_to_spawn = list(
		/obj/item/clothing/under/marine/robotic,
		/obj/item/tool/weldingtool,
		/obj/item/stack/cable_coil,
	)

/obj/effect/vendor_bundle/robot/light_armor
	gear_to_spawn = list(
		/obj/item/clothing/suit/modular/robot/light,
		/obj/item/clothing/head/modular/robot/light,
	)

/obj/effect/vendor_bundle/robot/medium_armor
	gear_to_spawn = list(
		/obj/item/clothing/suit/modular/robot,
		/obj/item/clothing/head/modular/robot,
	)

/obj/effect/vendor_bundle/robot/heavy_armor
	gear_to_spawn = list(
		/obj/item/clothing/suit/modular/robot/heavy,
		/obj/item/clothing/head/modular/robot/heavy,
	)



#undef DEFAULT_TOTAL_BUY_POINTS
#undef MEDIC_TOTAL_BUY_POINTS
#undef ENGINEER_TOTAL_BUY_POINTS
#undef COMMANDER_TOTAL_BUY_POINTS
#undef SQUAD_LOCK
#undef JOB_LOCK
