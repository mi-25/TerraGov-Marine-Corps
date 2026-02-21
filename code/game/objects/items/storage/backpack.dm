/*
* Backpack
*/

/obj/item/storage/backpack
	name = "背包"
	desc = "你将它背在背上，用来存放物品。"
	icon_state = "backpack"
	icon = 'icons/obj/items/storage/backpack.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/backpacks_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/backpacks_right.dmi',
	)
	worn_icon_state = "backpack"
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		)
	w_class = WEIGHT_CLASS_BULKY
	equip_slot_flags = ITEM_SLOT_BACK	//ERROOOOO
	storage_type = /datum/storage/backpack

/obj/item/storage/backpack/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(storage_datum.use_sound)
		playsound(loc, storage_datum.use_sound, 15, 1, 6)

/obj/item/storage/backpack/equipped(mob/user, slot)
	if(slot == SLOT_BACK)
		mouse_opacity = 2 //so it's easier to click when properly equipped.
		if(storage_datum.use_sound)
			playsound(loc, storage_datum.use_sound, 15, 1, 6)
	return ..()

/obj/item/storage/backpack/dropped(mob/user)
	mouse_opacity = initial(mouse_opacity)
	return ..()

/obj/item/storage/backpack/vendor_equip(mob/user)
	..()
	return user.equip_to_appropriate_slot(src)

/*
* Backpack Types
*/

/obj/item/storage/backpack/holding
	name = "次元袋"
	desc = "一个能打开通往蓝空间局部口袋的背包。"
	icon_state = "holdingpack"
	storage_type = /datum/storage/backpack/holding

/obj/item/storage/backpack/holding/attackby(obj/item/I, mob/user, params)
	if(!istype(I, /obj/item/storage/backpack/holding))
		return ..()
	to_chat(user, span_warning("两件设备的超空间接口发生冲突并出现故障。"))
	qdel(I)

/obj/item/storage/backpack/santabag
	name = "圣诞老人的礼物袋"
	desc = "太空圣诞老人用这个给太空里所有乖孩子送玩具！哇，真够大的！"
	icon_state = "giftbag0"
	worn_icon_state = "giftbag"
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/backpack/santabag

/obj/item/storage/backpack/cultpack
	name = "战利品架"
	desc = "它既能用来携带额外装备，也能自豪地宣告你的疯狂。"
	icon_state = "cultpack"

/obj/item/storage/backpack/clown
	name = "咯咯·冯·霍恩克顿"
	desc = "这是由 Honk! Co. 制造的背包。"
	icon_state = "clownpack"

/obj/item/storage/backpack/corpsman
	name = "医疗背包"
	desc = "这是一个专为无菌环境设计的背包。"
	icon_state = "medicalpack"

/obj/item/storage/backpack/security
	name = "安全背包"
	desc = "这是一个非常坚固的背包。"
	icon_state = "securitypack"

/obj/item/storage/backpack/captain
	name = "舰长的背包"
	desc = "这是专为军官设计的特殊背包。"
	icon_state = "captainpack"

/obj/item/storage/backpack/industrial
	name = "工业背包"
	desc = "这是一个为空间站日常艰苦生活设计的耐用背包。"
	icon_state = "engiepack"
	worn_icon_state = "engiepack"

/obj/item/storage/backpack/toxins
	name = "实验室背包"
	desc = "这是一款专为实验室和其他科研机构设计的轻便背包。"
	icon_state = "toxpack"

/obj/item/storage/backpack/hydroponics
	name = "草药师背包"
	desc = "这是一个绿色的背包，有许多口袋可以存放植物和工具。"
	icon_state = "hydpack"

/obj/item/storage/backpack/genetics
	name = "遗传学家背包"
	desc = "这是一个配备了软盘槽和其他工作工具的背包。"
	icon_state = "genpack"

/obj/item/storage/backpack/virology
	name = "无菌背包"
	desc = "这是一个无菌背包，能够抵御不同病原体渗入其织物。"
	icon_state = "viropack"

/obj/item/storage/backpack/chemistry
	name = "化学背包"
	desc = "这是一个橙色的背包，专为容纳烧杯、药瓶和瓶子而设计。"
	icon_state = "chempack"

/*
* Satchel Types
*/

/obj/item/storage/backpack/satchel
	name = "皮革挎包"
	desc = "这是一个用优质皮革制成的非常精致的挎包。"
	icon_state = "satchel"
	storage_type = /datum/storage/backpack/satchel

/obj/item/storage/backpack/satchel/withwallet/Initialize(mapload, ...)
	. = ..()
	new /obj/item/storage/wallet/random( src )

/obj/item/storage/backpack/satchel/som
	name = "采矿挎包"
	desc = "一款可追溯至采矿殖民地时期的挎包。"
	icon_state = "som_satchel"
	worn_icon_state = "som_satchel"

/obj/item/storage/backpack/satchel/norm
	name = "挎包"
	desc = "一个时髦的挎包。"
	icon_state = "satchel-norm"

/obj/item/storage/backpack/satchel/rugged
	name = "挎包"
	desc = "一款适用于各类工人的耐用挎包。"
	icon_state = "satchel-norm"

/obj/item/storage/backpack/satchel/eng
	name = "工业挎包"
	desc = "一个带有额外口袋的结实挎包。"
	icon_state = "satchel-eng"

/obj/item/storage/backpack/satchel/med
	name = "医疗挎包"
	desc = "医疗部门使用的无菌挎包。"
	icon_state = "satchel-med"

/obj/item/storage/backpack/satchel/vir
	name = "病毒学家挎包"
	desc = "一个带有病毒学家配色的无菌挎包。"
	icon_state = "satchel-vir"

/obj/item/storage/backpack/satchel/chem
	name = "化学家挎包"
	desc = "带有化学家颜色的无菌挎包。"
	icon_state = "satchel-chem"

/obj/item/storage/backpack/satchel/gen
	name = "遗传学家挎包"
	desc = "一个无菌的遗传学家配色挎包。"
	icon_state = "satchel-gen"

/obj/item/storage/backpack/satchel/tox
	name = "科学家挎包"
	desc = "用于存放研究材料。"
	icon_state = "satchel-tox"

/obj/item/storage/backpack/satchel/sec
	name = "安全挎包"
	desc = "一个坚固的挎包，用于满足安保相关需求。"
	icon_state = "satchel-sec"

/obj/item/storage/backpack/satchel/hyd
	name = "水培挎包"
	desc = "一个用于植物相关工作的绿色挎包。"
	icon_state = "satchel_hyd"

/obj/item/storage/backpack/satchel/cap
	name = "舰长的挎包"
	desc = "军官专用挎包。"
	icon_state = "satchel-cap"

/obj/item/storage/backpack/satchel/pmc
	name = "PMC胸挂"
	desc = "纳米传讯PMC承包商使用的重型胸挂。"
	icon_state = "pmc_chestrig"

//ERT backpacks.
/obj/item/storage/backpack/ert
	name = "应急响应小组背包"
	desc = "一个带有很多口袋的宽敞背包，供应急响应小组成员使用。"
	icon_state = "ert_commander"

//Commander
/obj/item/storage/backpack/ert/commander
	name = "应急响应小组指挥官背包"
	desc = "一个宽敞的背包，带有许多口袋，由应急响应队指挥官佩戴。"

//Security
/obj/item/storage/backpack/ert/security
	name = "应急响应小组安保背包"
	desc = "一个宽敞的背包，带有许多口袋，由应急响应小组的安保人员佩戴。"
	icon_state = "ert_security"

//Engineering
/obj/item/storage/backpack/ert/engineer
	name = "应急响应小组工程兵背包"
	desc = "一个宽敞的背包，带有许多口袋，由应急响应队的工程人员佩戴。"
	icon_state = "ert_engineering"

//Medical
/obj/item/storage/backpack/ert/medical
	name = "应急响应队医疗背包"
	desc = "一个宽敞的背包，带有许多口袋，由应急响应队的医疗人员佩戴。"
	icon_state = "ert_medical"


/*========================== MARINE BACKPACKS ================================
==========================================================================*/

/obj/item/storage/backpack/marine
	name = "\improper 轻型IMP背包"
	desc = "地球政府殖民地海军陆战队标准配发背包。专为向战场输送装备而设计。"
	icon_state = "marinepack"
	worn_icon_state = "marinepack"

/obj/item/storage/backpack/marine/standard
	name = "\improper 轻型IMP背包"
	desc = "地球政府殖民地海军陆战队标准配发背包。专为向战场输送装备而设计。"

/obj/item/storage/backpack/marine/corpsman
	name = "\improper 地球政府殖民地海军陆战队卫生兵背包"
	desc = "地球政府殖民地海军陆战队卫生兵的标准配发背包。你可以通过插入来为除颤器充电。"
	icon_state = "marinepackm"
	worn_icon_state = "marinepackm"
	var/obj/item/cell/high/cell //Starts with a high capacity energy cell.
	var/icon_skin

/obj/item/storage/backpack/marine/corpsman/Initialize(mapload, ...)
	. = ..()
	cell = new
	icon_skin = icon_state
	update_icon()

/obj/item/storage/backpack/marine/corpsman/proc/use_charge(mob/user, amount = 0, mention_charge = TRUE)
	var/warning = ""
	if(amount > cell.charge)
		playsound(src, 'sound/machines/buzz-two.ogg', 25, 1)
		if(cell.charge)
			warning = "<span class='warning'>[src]'s defibrillator recharge unit buzzes a warning, its battery only having enough power to partially recharge the defibrillator for [cell.charge] amount. "
		else
			warning = "<span class='warning'>[src]'s defibrillator recharge unit buzzes a warning, as its battery is completely depleted of charge. "
	else
		playsound(src, 'sound/machines/ping.ogg', 25, 1)
		warning = "<span class='notice'>[src]'s defibrillator recharge unit cheerfully pings as it successfully recharges the defibrillator. "
	cell.charge -= min(cell.charge, amount)
	if(mention_charge)
		to_chat(user, span_notice("[warning]<b>剩余电量：[cell.charge]/[cell.maxcharge]</b>"))
	update_icon()

/obj/item/storage/backpack/marine/corpsman/examine(mob/user)
	. = ..()
	if(cell)
		. += span_notice("Its defibrillator recharge unit has a loaded power cell and its readout counter is active. <b>Charge Remaining: [cell.charge]/[cell.maxcharge]</b>")
	else
		. += span_warning("Its defibrillator recharge unit does not have a power cell installed!")

/obj/item/storage/backpack/marine/corpsman/update_icon_state()
	. = ..()
	icon_state = icon_skin
	if(cell?.charge >= 0)
		switch(PERCENT(cell.charge/cell.maxcharge))
			if(75 to INFINITY)
				icon_state += "_100"
			if(50 to 74.9)
				icon_state += "_75"
			if(25 to 49.9)
				icon_state += "_50"
			if(0.1 to 24.9)
				icon_state += "_25"
	else
		icon_state += "_0"

/obj/item/storage/backpack/marine/corpsman/MouseDrop_T(obj/item/W, mob/living/user) //Dragging the defib/power cell onto the backpack will trigger its special functionality.
	var/obj/item/defibrillator/defib
	if(istype(W, /obj/item/defibrillator))
		defib = W
	else if(istype(W, /obj/item/clothing/gloves/defibrillator))
		var/obj/item/clothing/gloves/defibrillator/defib_gloves = W
		defib = defib_gloves.internal_defib
	if(defib)
		if(cell)
			var/charge_difference = defib.dcell.maxcharge - defib.dcell.charge
			if(charge_difference) //If the defib has less than max charge, recharge it.
				use_charge(user, charge_difference) //consume an appropriate amount of charge
				defib.dcell.charge += min(charge_difference, cell.charge) //Recharge the defibrillator battery with the lower of the difference between its present and max cap, or the remaining charge
				defib.update_icon()
			else
				to_chat(user, span_warning("这台除颤器已经充满电了！"))
		else
			to_chat(user, span_warning("[src]的除颤器充电单元没有安装电池！"))
	else if(istype(W, /obj/item/cell))
		if(user.drop_held_item())
			W.loc = src
			var/replace_install = "You replace the cell in [src]'s defibrillator recharge unit."
			if(!cell)
				replace_install = "You install a cell in [src]'s defibrillator recharge unit."
			else
				cell.update_icon()
				user.put_in_hands(cell)
			cell = W
			to_chat(user, span_notice("[replace_install] <b>剩余电量：[cell.charge]/[cell.maxcharge]</b>"))
			playsound(user, 'sound/weapons/guns/interact/rifle_reload.ogg', 25, 1, 5)
			update_icon()
	return ..()


/obj/item/storage/backpack/marine/tech
	name = "\improper TGMC 技术员背包"
	desc = "地球政府殖民地海军陆战队技术员的标准配发背包。专门设计用于容纳哨戒炮和HSG-102部署部件。"
	icon_state = "marinepackt"
	worn_icon_state = "marinepackt"
	storage_type = /datum/storage/backpack/tech

/obj/item/storage/backpack/marine/satchel
	name = "\improper TGMC 挎包"
	desc = "一些地球政府殖民地海军陆战队士兵和支援人员携带的重型挎包。"
	icon_state = "marinesat"
	worn_icon_state = "marinesat"
	storage_type = /datum/storage/backpack/satchel

/obj/item/storage/backpack/marine/satchel/green
	name = "\improper TGMC 挎包"
	icon_state = "marinesat_green"

/obj/item/storage/backpack/marine/corpsman/satchel
	name = "\improper TGMC 卫生兵挎包"
	desc = "部分TGMC卫生兵携带的重型挎包。可通过插入方式为除颤器充电。"
	icon_state = "marinesatm"
	worn_icon_state = "marinesatm"
	storage_type = /datum/storage/backpack/satchel
	cell = /obj/item/cell/apc

/obj/item/storage/backpack/marine/satchel/tech
	name = "\improper 地球政府殖民地海军陆战队技术员挎包"
	desc = "部分TGMC技术员使用的重型挎包。可容纳ST-580点防御哨戒炮及其弹药。"
	icon_state = "marinesatt"
	worn_icon_state = "marinesatt"
	storage_type = /datum/storage/backpack/satchel/tech

/obj/item/storage/backpack/marine/smock
	name = "\improper M3狙击手罩衫"
	desc = "专为狙击手设计的罩衫，口袋齐全，满足你的一切狙击需求。"
	icon_state = "smock"
	storage_type = /datum/storage/backpack/no_delay

/obj/item/storage/backpack/marine/duffelbag
	name = "\improper 地球政府殖民地海军陆战队 行李袋"
	desc = "A hard to reach backpack with no draw delay but is hard to access. \
	Any squadmates can easily access the storage with right-click."
	icon = 'icons/obj/items/storage/duffelbag.dmi'
	icon_state = "duffel"
	worn_icon_state = "duffel"
	storage_type = /datum/storage/backpack/duffelbag

/obj/item/storage/backpack/marine/duffelbag/equipped(mob/equipper, slot)
	. = ..()
	if(slot == SLOT_BACK)
		RegisterSignal(equipper, COMSIG_CLICK_RIGHT, PROC_REF(on_rclick_duffel_wearer))
		RegisterSignal(equipper, COMSIG_MOVABLE_MOVED, PROC_REF(on_wearer_move))
		for(var/mob/M AS in storage_datum.content_watchers)
			storage_datum.close(M)

/obj/item/storage/backpack/marine/duffelbag/unequipped(mob/unequipper, slot)
	. = ..()
	UnregisterSignal(unequipper, list(COMSIG_CLICK_RIGHT, COMSIG_MOVABLE_MOVED))

/obj/item/storage/backpack/marine/duffelbag/Adjacent(atom/neighbor, atom/target, atom/movable/mover)
	if(item_flags & IN_INVENTORY && loc.Adjacent(neighbor)) //Special check to ensure that worn duffels are adjacent
		return TRUE
	return ..()

///Allows non-wearers to access this inventory
/obj/item/storage/backpack/marine/duffelbag/proc/on_rclick_duffel_wearer(datum/source, mob/clicker)
	SIGNAL_HANDLER
	if(clicker == loc || !source.Adjacent(clicker)) //Wearer can't use this to bypass restrictions
		return
	storage_datum.open(clicker)

///Closes the duffelbag when our wearer moves if it's worn on user's back
/obj/item/storage/backpack/marine/duffelbag/proc/on_wearer_move(datum/source)
	SIGNAL_HANDLER
	if(!iscarbon(source))
		return
	var/mob/living/carbon/carbon_user = source
	if(carbon_user.back == src && carbon_user.s_active == storage_datum)
		storage_datum.close(carbon_user)

/datum/storage/backpack/duffelbag
	access_delay = 0

/datum/storage/backpack/duffelbag/put_storage_in_hand(datum/source, obj/over_object, mob/living/carbon/human/user)
	//Taking off the duffelbag has a channel
	if(user.back != parent || !do_after(user, 3 SECONDS))
		return

	switch(over_object.name)
		if("r_hand")
			INVOKE_ASYNC(src, PROC_REF(put_item_in_r_hand), source, user)
		if("l_hand")
			INVOKE_ASYNC(src, PROC_REF(put_item_in_l_hand), source, user)

/datum/storage/backpack/duffelbag/open(mob/user)
	if(!iscarbon(user))
		return TRUE
	var/mob/living/carbon/carbon_user = user
	if(carbon_user.back == parent && !do_after(carbon_user, 2 SECONDS))
		return TRUE
	return ..()

/datum/storage/backpack/duffelbag/attempt_draw_object(mob/living/carbon/user, start_from_left)
	if(user.back == parent && user.s_active != src)
		to_chat(user, span_notice("你无法从背上的[parent]中取出任何物品。"))
		return
	return ..()

//CLOAKS

/obj/item/storage/backpack/marine/satchel/officer_cloak
	name = "军官斗篷"
	desc = "一件符合军官身份的潇洒斗篷。"
	icon_state = "officer_cloak" //with thanks to Baystation12
	worn_icon_state = "officer_cloak" //with thanks to Baystation12

/obj/item/storage/backpack/marine/satchel/captain_cloak
	name = "舰长斗篷"
	desc = "一件华丽的斗篷，上面详细记录着你的诸多功绩。"
	icon_state = "commander_cloak" //with thanks to Baystation12
	worn_icon_state = "commander_cloak" //with thanks to Baystation12

/obj/item/storage/backpack/marine/satchel/officer_cloak_red
	name = "军官斗篷 - 红色"
	desc = "一件符合军官身份的潇洒斗篷，带有精美的红色镶边。"
	icon_state = "officer_cloak_red" //with thanks to Baystation12
	worn_icon_state = "officer_cloak_red" //with thanks to Baystation12

/obj/item/storage/backpack/marine/satchel/captain_cloak_red
	name = "舰长披风 - 红色"
	desc = "一件华丽的斗篷，饰以你诸多成就的细节，配有精美的红色镶边。"
	icon_state = "commander_cloak_red" //with thanks to Baystation12
	worn_icon_state = "commander_cloak_red" //with thanks to Baystation12


// Scout Cloak
/obj/item/storage/backpack/marine/satchel/scout_cloak
	name = "\improper M68热光学斗篷"
	desc = "这件斗篷提供的轻型热力抑制器和光学迷彩效果弱于标准TGMC吉利服。作为交换，它可以穿在战斗护甲外面，并为穿戴者提供高机动性和对多种环境的适应性。可作为挎包使用。"
	icon_state = "scout_cloak"
	var/camo_active = 0
	var/camo_active_timer = 0
	var/camo_cooldown_timer = null
	var/camo_last_stealth = null
	var/camo_last_shimmer = null
	var/camo_energy = 100
	var/mob/living/carbon/human/wearer = null
	var/shimmer_alpha = SCOUT_CLOAK_RUN_ALPHA
	var/stealth_delay = null
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/storage/backpack/marine/satchel/scout_cloak/Destroy()
	camo_off()
	return ..()

/obj/item/storage/backpack/marine/satchel/scout_cloak/dropped(mob/user)
	camo_off(user)
	wearer = null
	STOP_PROCESSING(SSprocessing, src)
	return ..()

/obj/item/storage/backpack/marine/satchel/scout_cloak/attack_self(mob/user)
	. = ..()
	camouflage()

/obj/item/storage/backpack/marine/satchel/scout_cloak/process()
	if(!wearer)
		camo_off()
		return
	else if(wearer.stat != CONSCIOUS)
		camo_off(wearer)
		return

	stealth_delay = world.time - SCOUT_CLOAK_STEALTH_DELAY
	if(camo_last_shimmer > stealth_delay) //Shimmer after taking aggressive actions; no energy regeneration
		wearer.alpha = shimmer_alpha //50% invisible
	else if(camo_last_stealth > stealth_delay ) //We have an initial reprieve at max invisibility allowing us to reposition; no energy recovery during this time
		wearer.alpha = SCOUT_CLOAK_STILL_ALPHA
		return
	//Stationary stealth
	else if( wearer.last_move_intent < stealth_delay ) //If we're standing still and haven't shimmed in the past 3 seconds we become almost completely invisible
		wearer.alpha = SCOUT_CLOAK_STILL_ALPHA //95% invisible
		camo_adjust_energy(wearer, SCOUT_CLOAK_ACTIVE_RECOVERY)

///Handles the wearer moving with the cloak active
/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/handle_movement(mob/living/carbon/human/source, atom/old_loc, movement_dir, forced, list/old_locs)
	SIGNAL_HANDLER
	if(!camo_active)
		return
	if(camo_last_shimmer > world.time - SCOUT_CLOAK_STEALTH_DELAY) //Shimmer after taking aggressive actions
		source.alpha = SCOUT_CLOAK_RUN_ALPHA
		camo_adjust_energy(source, SCOUT_CLOAK_RUN_DRAIN)
	else if(camo_last_stealth > world.time - SCOUT_CLOAK_STEALTH_DELAY) //We have an initial reprieve at max invisibility allowing us to reposition, albeit at a high drain rate
		source.alpha = SCOUT_CLOAK_STILL_ALPHA
		camo_adjust_energy(source, SCOUT_CLOAK_RUN_DRAIN)
	else if(source.m_intent == MOVE_INTENT_WALK)
		source.alpha = SCOUT_CLOAK_WALK_ALPHA
		camo_adjust_energy(source, SCOUT_CLOAK_WALK_DRAIN)
	else
		source.alpha = SCOUT_CLOAK_RUN_ALPHA
		camo_adjust_energy(source, SCOUT_CLOAK_RUN_DRAIN)

///Activates the cloak
/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/camouflage()
	if (usr.incapacitated(TRUE))
		return

	var/mob/living/carbon/human/M = usr
	if (!istype(M))
		return

	if (M.back != src)
		to_chat(M, "<span class='warning'>你必须穿着斗篷才能激活它！</span>")
		return

	if (camo_active)
		camo_off(usr)
		return

	//other sources of cloaking
	if(SEND_SIGNAL(M, COMSIG_MOB_ENABLE_STEALTH) & STEALTH_ALREADY_ACTIVE)
		to_chat(M, span_warning("你已经处于隐形状态了！"))
		return FALSE

	if (camo_cooldown_timer)
		to_chat(M, "<span class='warning'>你的热光学迷彩仍在重新校准！将在 [(camo_cooldown_timer - world.time) * 0.1] 秒后准备就绪。</span>")
		return

	camo_active = TRUE
	camo_last_stealth = world.time
	wearer = M

	M.visible_message("[M] 凭空消失了！", span_notice("You activate your cloak's camouflage."))
	playsound(M.loc,'sound/effects/cloak_scout_on.ogg', 15, 1)

	stealth_delay = world.time - SCOUT_CLOAK_STEALTH_DELAY
	if(camo_last_shimmer > stealth_delay) //Shimmer after taking aggressive actions
		wearer.alpha = shimmer_alpha //50% invisible
	else
		wearer.alpha = SCOUT_CLOAK_STILL_ALPHA

	if (M.smokecloaked)
		M.smokecloaked = FALSE
	else
		GLOB.huds[DATA_HUD_SECURITY_ADVANCED].remove_from_hud(M)
		GLOB.huds[DATA_HUD_BASIC].remove_from_hud(M)
		GLOB.huds[DATA_HUD_XENO_INFECTION].remove_from_hud(M)
		GLOB.huds[DATA_HUD_XENO_HEART].remove_from_hud(M)

	addtimer(CALLBACK(src, PROC_REF(on_cloak)), 1)
	RegisterSignal(M, COMSIG_HUMAN_DAMAGE_TAKEN, PROC_REF(damage_taken))
	RegisterSignals(M, list(
		COMSIG_MOB_GUN_FIRED,
		COMSIG_MOB_GUN_AUTOFIRED,
		COMSIG_MOB_ATTACHMENT_FIRED,
		COMSIG_MOB_THROW,
		COMSIG_MOB_ITEM_ATTACK), PROC_REF(action_taken))

	START_PROCESSING(SSprocessing, src)
	RegisterSignal(wearer, COMSIG_MOVABLE_MOVED, PROC_REF(handle_movement))

	return TRUE

///Sig handler for other sources of cloaking
/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/on_other_activate()
	SIGNAL_HANDLER
	return STEALTH_ALREADY_ACTIVE


/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/on_cloak()
	if(wearer)
		anim(wearer.loc,wearer,'icons/mob/mob.dmi',,"cloak",,wearer.dir)

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/on_decloak()
	if(wearer)
		anim(wearer.loc,wearer,'icons/mob/mob.dmi',,"uncloak",,wearer.dir)

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/camo_off(mob/user)
	if(wearer)
		UnregisterSignal(wearer, COMSIG_MOB_ENABLE_STEALTH)
	if(!user)
		camo_active = FALSE
		wearer = null
		STOP_PROCESSING(SSprocessing, src)
		return FALSE

	if(!camo_active)
		return FALSE

	camo_active = FALSE

	user.visible_message(span_warning("[user.name] 闪烁着显形了！"), span_danger("Your cloak's camouflage has deactivated!"))
	playsound(user.loc,'sound/effects/cloak_scout_off.ogg', 15, 1)
	user.alpha = initial(user.alpha)

	GLOB.huds[DATA_HUD_SECURITY_ADVANCED].add_to_hud(user)
	GLOB.huds[DATA_HUD_BASIC].add_to_hud(user)
	GLOB.huds[DATA_HUD_XENO_INFECTION].add_to_hud(user)
	GLOB.huds[DATA_HUD_XENO_HEART].add_to_hud(user)

	addtimer(CALLBACK(src, PROC_REF(on_decloak)), 1)

	var/cooldown = round( (initial(camo_energy) - camo_energy) / SCOUT_CLOAK_INACTIVE_RECOVERY * 10) //Should be 20 seconds after a full depletion with inactive recovery at 5
	if(cooldown)
		camo_cooldown_timer = world.time + cooldown //recalibration and recharge time scales inversely with charge remaining
		to_chat(user, "<span class='warning'>你的热光学迷彩正在重新校准！将在[(camo_cooldown_timer - world.time) * 0.1]秒后准备就绪。")
		process_camo_cooldown(user, cooldown)

	UnregisterSignal(user, list(
		COMSIG_HUMAN_DAMAGE_TAKEN,
		COMSIG_MOB_GUN_FIRED,
		COMSIG_MOB_GUN_AUTOFIRED,
		COMSIG_MOB_ATTACHMENT_FIRED,
		COMSIG_MOB_THROW,
		COMSIG_MOB_ITEM_ATTACK,
		COMSIG_MOVABLE_MOVED,
		))
	STOP_PROCESSING(SSprocessing, src)

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/process_camo_cooldown(mob/living/user, cooldown)
	if(!camo_cooldown_timer)
		return
	addtimer(CALLBACK(src, PROC_REF(cooldown_finished)), cooldown)

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/cooldown_finished()
	camo_cooldown_timer = null
	camo_energy = initial(camo_energy)
	playsound(loc,'sound/effects/EMPulse.ogg', 25, 0, 1)
	if(wearer)
		to_chat(wearer, span_danger("你的热光学迷彩已重新校准，可以再次启动隐形。"))

/obj/item/storage/backpack/marine/satchel/scout_cloak/examine(mob/user)
	. = ..()
	if(user != wearer) //Only the wearer can see these details.
		return
	var/list/details = list()
	details +=("It has [camo_energy]/[initial(camo_energy)] charge. </br>")

	if(camo_cooldown_timer)
		details +=("It will be ready in [(camo_cooldown_timer - world.time) * 0.1] seconds. </br>")

	if(camo_active)
		details +=("It's currently active.</br>")

	. += span_warning("[details.Join(" ")]")

/obj/item/storage/backpack/marine/satchel/scout_cloak/item_action_slot_check(mob/user, slot)
	if(!ishuman(user))
		return FALSE
	if(slot != SLOT_BACK)
		return FALSE
	return TRUE

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/camo_adjust_energy(mob/user, drain = SCOUT_CLOAK_WALK_DRAIN)
	camo_energy = clamp(camo_energy - drain,0,initial(camo_energy))

	if(!camo_energy) //Turn off the camo if we run out of energy.
		to_chat(user, span_danger("你的热光学迷彩能量不足，无法保持激活状态。"))
		camo_off(user)

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/damage_taken(datum/source, damage)
	SIGNAL_HANDLER
	var/mob/living/carbon/human/wearer = source
	if(damage >= 15)
		to_chat(wearer, span_danger("你的隐形护盾因受损而闪烁！"))
		apply_shimmer()

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/action_taken() //This is used by multiple signals passing different parameters.
	SIGNAL_HANDLER
	to_chat(wearer, span_danger("你的隐形因你的行动而闪烁！"))
	apply_shimmer()

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/apply_shimmer()
	camo_last_shimmer = world.time //Reduces transparency to 50%
	wearer.alpha = max(wearer.alpha,shimmer_alpha)

/obj/item/storage/backpack/marine/satchel/scout_cloak/sniper
	name = "\improper M68-B 热光学迷彩斗篷"
	icon_state = "smock"
	desc = "M68-B热光学斗篷是为狙击手定制的变体型号，可在静止状态下实现更快、更优异的隐蔽效果，但会牺牲移动中的隐蔽能力。该装备专为搭配轻量化M3侦察战斗装甲设计。可作为挎包使用。"
	shimmer_alpha = SCOUT_CLOAK_RUN_ALPHA * 0.5 //Half the normal shimmer transparency.

/obj/item/storage/backpack/marine/satchel/scout_cloak/sniper/handle_movement(mob/living/carbon/human/source, atom/old_loc, movement_dir, forced, list/old_locs)
	if(!camo_active)
		return
	source.alpha = initial(source.alpha) //Sniper variant has *no* mobility stealth, but no drain on movement either

/obj/item/storage/backpack/marine/satchel/scout_cloak/sniper/process()
	if(!wearer)
		camo_off()
		return
	else if(wearer.stat == DEAD)
		camo_off(wearer)
		return

	stealth_delay = world.time - SCOUT_CLOAK_STEALTH_DELAY * 0.5
	if(camo_last_shimmer > stealth_delay) //Shimmer after taking aggressive actions; no energy regeneration
		wearer.alpha = max(wearer.alpha, shimmer_alpha) //50% invisible
	//Stationary stealth
	else if( wearer.last_move_intent < stealth_delay ) //If we're standing still and haven't shimmed in the past 2 seconds we become almost completely invisible
		wearer.alpha = SCOUT_CLOAK_STILL_ALPHA //95% invisible
		camo_adjust_energy(wearer, SCOUT_CLOAK_ACTIVE_RECOVERY)

// Welder Backpacks //

/obj/item/storage/backpack/marine/engineerpack
	name = "\improper 地球政府殖民地海军陆战队技术员焊枪背包"
	desc = "地球政府殖民地海军陆战队技术员使用的专用背包。内置燃料罐，可快速为焊枪补充燃料。"
	icon_state = "engineerpack"
	worn_icon_state = "engineerpack"
	storage_type = /datum/storage/backpack/satchel
	///how much fuel we can hold
	var/max_fuel = 260

/obj/item/storage/backpack/marine/engineerpack/Initialize(mapload, ...)
	. = ..()
	AddComponent(/datum/component/fuel_storage, max_fuel)

/obj/item/storage/backpack/marine/engineerpack/som
	name = "\improper 火星之子技术员焊枪背包"
	desc = "火星之子技术员专用的背包。内置燃料罐，可快速为焊枪补充燃料。"
	icon_state = "som_engineer_pack"
	worn_icon_state = "som_engineer_pack"
	storage_type = /datum/storage/backpack/satchel

/obj/item/storage/backpack/lightpack
	name = "\improper 轻型战斗背包"
	desc = "一款用于远征和短程作战的轻便小型背包。"
	icon_state = "ERT_satchel"
	storage_type = /datum/storage/backpack/no_delay

/obj/item/storage/backpack/commando
	name = "突击背包"
	desc = "纳米传讯突击队员使用的一款重型背包。"
	icon_state = "commandopack"
	storage_type = /datum/storage/backpack/commando

/obj/item/storage/backpack/captain
	name = "陆战队舰长背包"
	desc = "这个背包里的东西是最高机密。"
	icon_state = "marinepack"
	storage_type = /datum/storage/backpack/captain

/obj/item/storage/backpack/lightpack/pmc
	name = "PMC背包"
	desc = "纳米传讯PMC承包商使用的一款重型背包。"
	icon_state = "pmc_bag"

/obj/item/storage/backpack/lightpack/som
	name = "采矿背包"
	desc = "一款可追溯至采矿殖民地时期的背包。"
	icon_state = "som_lightpack"
	worn_icon_state = "som_lightpack"

/obj/item/storage/backpack/lightpack/icc
	name = "\improper 莫德洛/190"
	desc = "一款为多种作战行动设计的小型轻便臀包，采用合成棕褐色纤维制成。"
	icon_state = "icc_bag"

/obj/item/storage/backpack/lightpack/icc/guard
	name = "\improper 莫德洛/190"
	desc = "专为多种作战行动设计的小型轻便臀包，采用合成黑色纤维制成。"
	icon_state = "icc_bag_guard"

/obj/item/storage/backpack/lightpack/vsd
	name = "\improper Crasher品牌战斗背包"
	desc = "一款来自21世纪的背包设计，在25世纪依然被证明是优秀的设计。"
	icon_state = "vsd_bag0"

/obj/item/storage/backpack/lightpack/freelancer
	name = "\improper 自由佣兵轻型战斗背包"
	desc = "一款为远征和短程行动设计的小型轻量背包。此款由MAGNUM佣兵制造。"
	icon_state = "freelancer_satchel"

/obj/item/storage/backpack/marine/corpsman/freelancer
	name = "\improper 自由佣兵卫生兵背包"
	desc = "MAGNUM卫生兵使用的背包。它比地球政府版本要轻得多。你可以通过插入来为除颤器充电。"
	icon_state = "freelancer_packm"
	storage_type = /datum/storage/backpack/no_delay
