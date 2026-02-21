////////////////////////////////////////////////////////////////////////////////
/// HYPOSPRAY
////////////////////////////////////////////////////////////////////////////////

/obj/item/reagent_containers/hypospray
	name = "注射器"
	desc = "海波注射器是一种无菌、空气针头可重复使用的自动注射器，用于快速向患者注射药物，剂量可自定义。"
	icon = 'icons/obj/items/syringe.dmi'
	worn_icon_state = "hypo"
	icon_state = "hypo"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(1, 3, 5, 10, 15, 20, 30, 60)
	volume = 60
	reagent_flags = OPENCONTAINER
	equip_slot_flags = ITEM_SLOT_BELT
	item_flags = NOBLUDGEON
	w_class = WEIGHT_CLASS_SMALL
	var/skilllock = 1
	var/inject_mode = HYPOSPRAY_INJECT_MODE_INJECT
	var/core_name = "hypospray"
	///If we add a custom label, our name becomes "[core_name] ([label])"
	var/label = null
	/// Small description appearing as an overlay
	var/description_overlay = ""

/obj/item/reagent_containers/hypospray/proc/empty(mob/user)
	if(tgui_alert(user, "Are you sure you want to empty [src]?", "Flush [src]:", list("Yes", "No")) != "Yes")
		return
	if(isturf(user.loc))
		user.balloon_alert(user, "清空注射器。")
		reagents.reaction(user.loc)
		reagents.clear_reagents()

/obj/item/reagent_containers/hypospray/afterattack(atom/A, mob/living/user)
	if(!istype(user))
		return FALSE
	if(!in_range(A, user) || !user.Adjacent(A))
		return FALSE

	if(istype(A, /obj/item/storage/pill_bottle) && is_open_container()) //this should only run if its a pillbottle
		var/obj/item/storage/pill_bottle/bottle = A
		if(reagents.total_volume >= volume)
			balloon_alert(user, "注射器已满。")
			return  //early returning if its full

		if(!length(bottle.contents))
			return //early returning if its empty
		var/obj/item/pill = bottle.contents[1]

		if((pill.reagents.total_volume + reagents.total_volume) > volume)
			balloon_alert(user, "装不下了。")
			return // so it doesnt let people have hypos more filled than their volume
		pill.reagents.trans_to(src, pill.reagents.total_volume)

		to_chat(user, span_notice("你将[bottle]中的[pill]溶解在[src]中。"))
		bottle.storage_datum.remove_from_storage(pill,null,user)
		qdel(pill)
		return

	//For drawing reagents, will check if it's possible to draw, then draws.
	if(inject_mode == HYPOSPRAY_INJECT_MODE_DRAW)
		can_draw_reagent(A, user, FALSE)
		return

	if(!reagents.total_volume)
		balloon_alert(user, "注射器已空。")
		return
	if(iscarbon(A))
		var/mob/living/carbon/C = A
		if((C.species.species_flags & NO_CHEM_METABOLIZATION) || (C.species.species_flags & IS_SYNTHETIC))
			C.balloon_alert(user, "无法注入（机器人）")
			return
	if(!A.is_injectable() && !ismob(A))
		A.balloon_alert(user, "无法填充。")
		return
	if(skilllock && user.skills.getRating(SKILL_MEDICAL) < SKILL_MEDICAL_NOVICE)
		user.visible_message(span_notice("[user] 笨手笨脚地摸索着如何使用[src]。"),
		span_notice("You fumble around figuring out how to use the [src]."))
		if(!do_after(user, SKILL_TASK_EASY, NONE, A, BUSY_ICON_UNSKILLED) || (!in_range(A, user) || !user.Adjacent(A)))
			return
	if(ismob(A))
		var/mob/M = A
		if(!M.can_inject(user, TRUE, user.zone_selected, TRUE))
			return
		if(M.faction != user.faction && !M.incapacitated())
			user.visible_message(span_notice("[user]试图用[src]给[M]注射。"),
			span_notice("You attempt to inject [M] with [src]."))
			if(!do_after(user, SKILL_TASK_VERY_EASY, NONE, A, BUSY_ICON_HOSTILE) || (!in_range(A, user) || !user.Adjacent(A)))
				return

	var/list/injected = list()
	for(var/datum/reagent/R in reagents.reagent_list)
		injected += R.name
	log_combat(user, A, "injected", src, "Reagents: [english_list(injected)]")

	if(ismob(A))
		var/mob/M = A
		balloon_alert(user, "注入[M]")
		to_chat(M, span_warning("你感到一阵轻微的刺痛！")) // inject self doubleposting
		record_reagent_consumption(min(amount_per_transfer_from_this, reagents.total_volume), injected, user, M)

	// /mob/living/carbon/human/attack_hand causes
	// changeNext_move(7) which creates a delay
	// This line overrides the delay, and will absolutely break everything
	user.changeNext_move(3) // please don't break the game

	playsound(loc, 'sound/items/hypospray.ogg', 50, 1)
	reagents.reaction(A, INJECT, min(amount_per_transfer_from_this, reagents.total_volume) / reagents.total_volume)
	var/trans = reagents.trans_to(A, amount_per_transfer_from_this)
	to_chat(user, span_notice("已注射 [trans] 单位。 [src] 中剩余 [reagents.total_volume] 单位。")) // better to not balloon

	return TRUE

/obj/item/reagent_containers/hypospray/afterattack_alternate(atom/A, mob/living/user)
	if(!istype(user))
		return FALSE
	if(!in_range(A, user) || !user.Adjacent(A)) //So we arent drawing reagent from a container behind a window
		return FALSE
	can_draw_reagent(A, user, TRUE) //Always draws reagents on right click

///If it's possible to draw from something. Will draw_blood() when targetting a carbon, or draw_reagent() when targetting a non-carbon
/obj/item/reagent_containers/hypospray/proc/can_draw_reagent(atom/A, mob/living/user)
	if(!A.reagents)
		return FALSE
	if(reagents.holder_full())
		balloon_alert(user, "注射器已满。")
		inject_mode = HYPOSPRAY_INJECT_MODE_INJECT
		update_icon() //So we now display as Inject
		return FALSE
	if(!A.reagents.total_volume)
		balloon_alert(user, "注射器已空。")
		return
	if(!A.is_drawable())
		balloon_alert(user, "无法移除试剂。")
		return

	if(iscarbon(A))
		draw_blood(A, user)
		return TRUE

	if(isobj(A)) //if not mob
		draw_reagent(A, user)
		return TRUE

///Checks if the carbon has blood, then tries to draw blood from it
/obj/item/reagent_containers/hypospray/proc/draw_blood(atom/A, mob/living/user)
	var/amount = min(reagents.maximum_volume - reagents.total_volume, amount_per_transfer_from_this)
	var/mob/living/carbon/C = A
	if(C.get_blood_id() && reagents.has_reagent(C.get_blood_id()))
		balloon_alert(user, "已有血液样本。")
		return
	if(!C.blood_type)
		balloon_alert(user, "无法定位血液。")
		return
	if(C.blood_volume <= BLOOD_VOLUME_SURVIVE)
		balloon_alert(user, "没有血液可抽取。")
		return
	if(ishuman(C))
		var/mob/living/carbon/human/H = C
		if(H.species.species_flags & NO_BLOOD)
			balloon_alert(user, "无法定位血液。")
			return
		else
			C.take_blood(src,amount)
	else
		C.take_blood(src,amount)
	reagents.handle_reactions()
	user.visible_message("<span clas='warning'>[user] 从 [A] 身上采集了一份血样。</span>",
						span_notice("You take a blood sample from [A]."), null, 4)
	on_reagent_change()

///Checks if a container is drawable, then draw reagents from the container
/obj/item/reagent_containers/hypospray/proc/draw_reagent(atom/A, mob/living/user)
	var/trans = A.reagents.trans_to(src, amount_per_transfer_from_this)
	balloon_alert(user, "填充[trans]单位。")

	on_reagent_change()

/obj/item/reagent_containers/hypospray/on_reagent_change()
	if(reagents.holder_full())
		inject_mode = HYPOSPRAY_INJECT_MODE_INJECT
	update_icon()

/obj/item/reagent_containers/hypospray/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	update_icon()

/obj/item/reagent_containers/hypospray/on_enter_storage(mob/user, slot)
	. = ..()
	update_icon()

/obj/item/reagent_containers/hypospray/pickup(mob/user)
	. = ..()
	update_icon()

/obj/item/reagent_containers/hypospray/dropped(mob/user)
	. = ..()
	update_icon()

/obj/item/reagent_containers/hypospray/update_overlays()
	. = ..()
	if(isturf(loc) || !description_overlay)
		return
	var/mutable_appearance/desc = mutable_appearance('icons/misc/12x12.dmi')
	desc.pixel_w = 16
	desc.maptext = MAPTEXT(description_overlay)
	desc.maptext_width = 16
	. += desc

/obj/item/reagent_containers/hypospray/unique_action(mob/user, special_treatment)
	ui_interact(user)

/obj/item/reagent_containers/hypospray/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Hypospray", name)
		ui.open()

/obj/item/reagent_containers/hypospray/ui_data(mob/user)
	var/list/data = list()

	data["IsAdvanced"] = liquifier
	data["InjectMode"] = inject_mode
	data["CurrentLabel"] = label
	data["CurrentTag"] = description_overlay
	data["TransferAmount"] = amount_per_transfer_from_this

	return data

/obj/item/reagent_containers/hypospray/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("ActivateAutolabeler")
			var/mob/user = usr
			var/str = copytext(reject_bad_text(input(user,"Hypospray label text?", "Set label", "")), 1, MAX_NAME_LEN)
			if(!length(str))
				user.balloon_alert(user, "无效文本。")
				return
			balloon_alert(user, "标记为'[str]'。")
			name = "[core_name] ([str])"
			label = str

		if("ActivateTagger")
			var/mob/user = usr
			var/str = copytext(reject_bad_text(input(user,"Hypospray tag text?", "Set tag", "")), 1, MAX_NAME_HYPO)
			if(!length(str))
				user.balloon_alert(user, "无效文本。")
				return
			user.balloon_alert(user, "你将 [src] 标记为'[str]'。")
			description_overlay = str
			update_icon()

		if("ToggleMode")
			if(inject_mode)
				to_chat(usr, span_notice("[src]已设置为抽取模式。现在将抽取试剂。"))

			else
				to_chat(usr, span_notice("[src] 已设置为注射模式。现在将注射试剂。"))
			inject_mode = !inject_mode
			update_icon()

		if("SetTransferAmount")
			var/N = tgui_input_list(usr, "Amount per transfer from this:", "[src]", possible_transfer_amounts)
			if(!N)
				return

			amount_per_transfer_from_this = N

		if("EmptyHypospray")
			empty(usr)

/obj/item/reagent_containers/hypospray/advanced
	name = "高级注射器"
	desc = "注射器是一种无菌、空气针头的可重复使用自动注射器，用于快速向患者注射可定制剂量的药物。配备内部试剂分析仪、数字标签机和2字母标记器。非常方便。"
	core_name = "hypospray"
	icon_state = "hypo"
	reagent_flags = REFILLABLE|DRAINABLE
	liquifier = TRUE

/obj/item/reagent_containers/hypospray/advanced/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	if(action == "DisplayReagentContent")
		to_chat(usr, display_reagents())
		return TRUE

/obj/item/reagent_containers/hypospray/advanced/update_icon_state()
	. = ..()
	if(!reagents?.total_volume)
		icon_state = "[initial(icon_state)]_0"
		return
	var/percent = round((reagents.total_volume / volume) * 100)
	switch(percent)
		if(0 to 9)
			icon_state = initial(icon_state)
		if(10 to 24)
			icon_state = "[initial(icon_state)]_10"
		if(25 to 49)
			icon_state = "[initial(icon_state)]_25"
		if(50 to 64)
			icon_state = "[initial(icon_state)]_50"
		if(65 to 79)
			icon_state = "[initial(icon_state)]_65"
		if(80 to 90)
			icon_state = "[initial(icon_state)]_80"
		if(91 to INFINITY)
			icon_state = "[initial(icon_state)]_100"

/obj/item/reagent_containers/hypospray/advanced/update_overlays()
	. = ..()

	if(reagents?.total_volume)
		var/image/filling = image('icons/obj/reagentfillings.dmi', src, "[icon_state]10")

		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if(0 to 9)
				filling.icon_state = "[initial(icon_state)]-10"
			if(10 to 24)
				filling.icon_state = "[initial(icon_state)]10"
			if(25 to 49)
				filling.icon_state = "[initial(icon_state)]25"
			if(50 to 64)
				filling.icon_state = "[initial(icon_state)]50"
			if(65 to 79)
				filling.icon_state = "[initial(icon_state)]65"
			if(80 to 90)
				filling.icon_state = "[initial(icon_state)]80"
			if(91 to INFINITY)
				filling.icon_state = "[initial(icon_state)]100"

		filling.color = mix_color_from_reagents(reagents.reagent_list)
		. += filling

	if(ismob(loc))
		var/injoverlay
		switch(inject_mode)
			if(HYPOSPRAY_INJECT_MODE_DRAW)
				injoverlay = "draw"
			if(HYPOSPRAY_INJECT_MODE_INJECT)
				injoverlay = "inject"
		. += injoverlay

/obj/item/reagent_containers/hypospray/advanced/examine(mob/user as mob)
	. = ..()
	if(get_dist(user,src) > 2)
		. += span_warning("You're too far away to see [src]'s reagent display!")
		return
	. += span_notice("Use to inject into yourself. Unique Action to open the hypospray menu.")

	. += display_reagents(user)

/// The proc display_reagents controls the information utilised in the hypospray menu/. Specifically how much of a chem there is, what percent that entails, and what type of chem it is if that is a known chem.
/obj/item/reagent_containers/hypospray/advanced/proc/display_reagents(mob/user)
	if(isnull(reagents))
		return
	var/list/dat = list()
	dat += "\n \t [span_notice("<b>Total Reagents:</b> [reagents.total_volume]/[volume]. <b>Dosage Size:</b> [min(reagents.total_volume, amount_per_transfer_from_this)]")]</br>"
	if(length(reagents.reagent_list) > 0)
		for (var/datum/reagent/R in reagents.reagent_list)
			var/percent = round(R.volume / max(0.01 , reagents.total_volume * 0.01),0.01)
			var/dose = round(min(reagents.total_volume, amount_per_transfer_from_this) * percent * 0.01,0.01)
			if(R.scannable)
				dat += "\n \t <b>[R]:</b> [R.volume]|[percent]% <b>Amount per dose:</b> [dose]</br>"
			else
				dat += "\n \t <b>Unknown:</b> [R.volume]|[percent]% <b>Amount per dose:</b> [dose]</br>"
	return span_notice("[src]'s reagent display shows the following contents: [dat.Join(" ")]")


/obj/item/reagent_containers/hypospray/advanced/bicaridine
	name = "比卡瑞丁注射器"
	desc = "装有比卡立丁的皮下注射器。一种治疗割伤和瘀伤的化学药剂。"
	list_reagents = list(
		/datum/reagent/medicine/bicaridine = 60,
	)
	description_overlay = "Bi"
	item_flags = CAN_REFILL

/obj/item/reagent_containers/hypospray/advanced/kelotane
	name = "凯洛坦注射器"
	desc = "装有凯洛坦的皮下注射器。一种治疗烧伤的化学药剂。"
	list_reagents = list(
		/datum/reagent/medicine/kelotane = 60,
	)
	description_overlay = "Ke"
	item_flags = CAN_REFILL

/obj/item/reagent_containers/hypospray/advanced/tramadol
	name = "曲马多注射器"
	desc = "装有曲马多的注射器。一种能麻痹疼痛的化学物质。"
	list_reagents = list(
		/datum/reagent/medicine/tramadol = 60,
	)
	description_overlay = "Ta"
	item_flags = CAN_REFILL

/obj/item/reagent_containers/hypospray/advanced/tricordrazine
	name = "三卡德拉嗪注射器"
	desc = "一支装有特里科德拉嗪的注射器。这种化学物质能治疗割伤、瘀伤、烧伤、中毒和缺氧。"
	list_reagents = list(
		/datum/reagent/medicine/tricordrazine = 60,
	)
	description_overlay = "Ti"
	item_flags = CAN_REFILL

/obj/item/reagent_containers/hypospray/advanced/dylovene
	name = "地洛芬高压注射器"
	desc = "装有迪洛芬的注射器。这种化学物质能治疗中毒并清除毒素，但会在此过程中降低耐力。"
	list_reagents = list(
		/datum/reagent/medicine/dylovene = 60,
	)
	description_overlay = "Dy"
	item_flags = CAN_REFILL

/obj/item/reagent_containers/hypospray/advanced/inaprovaline
	name = "伊那普洛林注射器"
	desc = "一支装有依那普利林的注射器。"
	amount_per_transfer_from_this = 15
	list_reagents = list(
		/datum/reagent/medicine/inaprovaline = 60,
	)
	description_overlay = "In"

/obj/item/reagent_containers/hypospray/advanced/meralyne
	name = "梅拉林注射器"
	desc = "一支装有梅拉林的注射器。这是一种能够快速治愈割伤和瘀伤的高级化学品。"
	amount_per_transfer_from_this = 5
	list_reagents = list(
		/datum/reagent/medicine/meralyne = 60,
	)
	description_overlay = "Mr"

/obj/item/reagent_containers/hypospray/advanced/dermaline
	name = "德马林注射器"
	desc = "装有皮肤素的注射器。一种能快速治愈烧伤的先进化学品。"
	amount_per_transfer_from_this = 5
	list_reagents = list(
		/datum/reagent/medicine/dermaline = 60,
	)
	description_overlay = "Dr"

/obj/item/reagent_containers/hypospray/advanced/combat_advanced
	name = "高级战斗注射器"
	desc = "一种装有多种高级治疗和止痛化学药剂的高压注射器。专为实战环境设计。"
	list_reagents = list(
		/datum/reagent/medicine/meralyne = 20,
		/datum/reagent/medicine/dermaline = 20,
		/datum/reagent/medicine/tramadol = 20,
	)
	description_overlay = "Av"

/obj/item/reagent_containers/hypospray/advanced/meraderm
	name = "梅拉德尔姆注射器"
	desc = "装有梅拉林和德玛林的皮下注射器。"
	list_reagents = list(
		/datum/reagent/medicine/meralyne = 30,
		/datum/reagent/medicine/dermaline = 30,
	)
	description_overlay = "MD"

/obj/item/reagent_containers/hypospray/advanced/oxycodone
	name = "羟考酮注射器"
	desc = "一支装有羟考酮的注射器。这是一种先进但极易上瘾的化学物质，几乎能完全消除疼痛和休克。"
	list_reagents = list(/datum/reagent/medicine/oxycodone = 60)
	description_overlay = "Ox"

/obj/item/reagent_containers/hypospray/advanced/hypervene
	name = "超静脉注射器"
	desc = "一支装有海珀文的注射器。这是一种能迅速清除体内所有化学物质和毒素的药剂。"
	amount_per_transfer_from_this = 3
	list_reagents = list(
		/datum/reagent/hypervene = 60,
	)
	description_overlay = "Hy"

/obj/item/reagent_containers/hypospray/advanced/nanoblood
	name = "纳米血液注射器"
	desc = "装有纳米血液的注射器。一种能快速恢复血液的化学物质，代价是造成轻微毒性伤害。"
	amount_per_transfer_from_this = 5
	list_reagents = list(
		/datum/reagent/medicine/nanoblood = 60,
	)
	description_overlay = "Na"

/obj/item/reagent_containers/hypospray/advanced/peridaxonplus
	name = "过氧化氢+皮下注射器"
	desc = "装有派瑞达松增强剂的注射器，这种化学物质能治疗器官损伤，但会导致毒素积累。使用时需配合解毒剂。！切勿在激烈战斗中使用！"
	amount_per_transfer_from_this = 3
	list_reagents = list(
		/datum/reagent/medicine/peridaxon_plus = 20,
		/datum/reagent/medicine/hyronalin = 40,
	)
	description_overlay = "Pe+"

/obj/item/reagent_containers/hypospray/advanced/peridaxonplus_medkit
	name = "过氧化氢+皮下注射器"
	desc = "装有派瑞达松增效剂（Peridaxon Plus）的注射器，这是一种能治愈器官但会导致毒素累积的化学物质。使用时需配合解毒剂。！切勿在激烈战斗中使用！"
	amount_per_transfer_from_this = 3
	list_reagents = list(
		/datum/reagent/medicine/peridaxon_plus = 6,
		/datum/reagent/medicine/hyronalin = 12,
	)
	description_overlay = "Pe+"

/obj/item/reagent_containers/hypospray/advanced/quickclotplus
	name = "快速凝血剂+ 皮下注射器"
	desc = "装有速凝剂+的注射器，这是一种旨在消除内出血的化学制剂。请与抗毒素配合使用。！切勿在战斗中使用！"
	amount_per_transfer_from_this = 5
	list_reagents = list(
		/datum/reagent/medicine/quickclotplus = 60,
	)
	description_overlay = "Qk+"

/obj/item/reagent_containers/hypospray/advanced/quickclotplus_medkit
	name = "快速凝血剂+ 皮下注射器"
	desc = "装有速凝剂+的注射器，这是一种旨在消除内出血的化学制剂。需与抗毒素配合使用。！切勿在战斗中使用！"
	amount_per_transfer_from_this = 5
	list_reagents = list(
		/datum/reagent/medicine/quickclotplus = 30,
	)
	description_overlay = "Qk+"

/obj/item/reagent_containers/hypospray/advanced/synaptizine
	name = "突触刺激素注射器"
	desc = "装有辛那普提嗪的注射器，这是一种强效兴奋剂，能改善心血管功能，需谨慎使用。"
	amount_per_transfer_from_this = 3
	list_reagents = list(
		/datum/reagent/medicine/synaptizine = 20,
		/datum/reagent/medicine/hyronalin = 40,
	)
	description_overlay = "Sy"

/obj/item/reagent_containers/hypospray/advanced/big
	name = "大型注射器"
	desc = "MK2医疗注射器，容量更大，可容纳更多试剂。配备内置试剂分析仪、数字标签机和双字母标记器，非常方便。此型号为120单位版本。"
	worn_icon_state = "hypomed"
	icon_state = "hypomed"
	core_name = "hypospray"
	volume = 120
	possible_transfer_amounts = list(1, 3, 5, 10, 15, 20, 30, 60, 120)

/obj/item/reagent_containers/hypospray/advanced/big/bicaridine
	name = "大型双卡因注射器"
	desc = "装有比卡立丁的注射器。一种治疗割伤和瘀伤的化学药剂。"
	list_reagents = list(
		/datum/reagent/medicine/bicaridine = 120,
	)
	description_overlay = "Bi"

/obj/item/reagent_containers/hypospray/advanced/big/kelotane
	name = "大型凯洛坦注射器"
	desc = "装有凯洛坦的皮下注射器。一种治疗烧伤的化学药剂。"
	list_reagents = list(
		/datum/reagent/medicine/kelotane = 120,
	)
	description_overlay = "Ke"

/obj/item/reagent_containers/hypospray/advanced/big/tramadol
	name = "大型曲马多注射器"
	desc = "装有曲马多的注射器。一种能麻痹疼痛的化学物质。"
	list_reagents = list(
		/datum/reagent/medicine/tramadol = 120,
	)
	description_overlay = "Ta"

/obj/item/reagent_containers/hypospray/advanced/big/tricordrazine
	name = "大型三卡德嗪注射器"
	desc = "一支装有特里科德拉嗪的注射器。这种化学物质能治疗割伤、瘀伤、烧伤、中毒和缺氧。"
	list_reagents = list(
		/datum/reagent/medicine/tricordrazine = 120,
	)
	description_overlay = "Ti"

/obj/item/reagent_containers/hypospray/advanced/big/combatmix
	name = "大型战斗混合注射器"
	desc = "一支装有战斗混合剂的注射枪。标签上写着 BKTT 40:40:20:20。"
	amount_per_transfer_from_this = 15
	list_reagents = list(
		/datum/reagent/medicine/bicaridine = 40,
		/datum/reagent/medicine/kelotane = 40,
		/datum/reagent/medicine/tramadol = 20,
		/datum/reagent/medicine/tricordrazine = 20,
	)
	description_overlay = "Cm"

/obj/item/reagent_containers/hypospray/advanced/big/dylovene
	name = "大型地洛芬注射器"
	desc = "一支装有迪洛芬的注射器。这种化学物质能治疗中毒并清除毒素，但在此过程中会降低耐力。"
	list_reagents = list(
		/datum/reagent/medicine/dylovene = 120,
	)
	description_overlay = "Dy"

/obj/item/reagent_containers/hypospray/advanced/big/inaprovaline
	name = "大型伊普罗维林注射器"
	desc = "一支装有依那普林的海波注射器。用于稳定和治疗危重病人的紧急化学品。"
	amount_per_transfer_from_this = 15
	list_reagents = list(
		/datum/reagent/medicine/inaprovaline = 120,
	)
	description_overlay = "In"

/obj/item/reagent_containers/hypospray/advanced/big/isotonic
	name = "大型等渗注射器"
	desc = "装有等渗液的注射器。一种有助于补充血液的化学物质。"
	list_reagents = list(
		/datum/reagent/medicine/saline_glucose = 120,
	)
	description_overlay = "Is"

/obj/item/reagent_containers/hypospray/advanced/big/spaceacillin
	name = "大型太空青霉素注射器"
	desc = "装有太空西林的海波注射器。一种对抗病毒和细菌感染的化学制剂。"
	list_reagents = list(
		/datum/reagent/medicine/spaceacillin = 120,
	)
	description_overlay = "Sp"

/obj/item/reagent_containers/hypospray/advanced/imialky
	name = "大型医用注射器"
	desc = "装有咪唑啉和烷基辛混合物的注射器。这些化学物质能治疗大脑、眼睛和耳朵的损伤。"
	amount_per_transfer_from_this = 5
	list_reagents = list(
		/datum/reagent/medicine/imidazoline = 48,
		/datum/reagent/medicine/alkysine = 12,
	)
	description_overlay = "Im"

/obj/item/reagent_containers/hypospray/advanced/big/quickclot
	name = "大型速凝注射器"
	desc = "装有速凝剂的海波注射器。这种化学物质能止住内出血并恢复血液。"
	list_reagents = list(
		/datum/reagent/medicine/quickclot = 120,
	)
	description_overlay = "Qk"
