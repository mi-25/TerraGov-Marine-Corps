/datum/action/skill/issue_order
	name = "下达命令"
	skill_name = SKILL_LEADERSHIP
	action_icon = 'icons/mob/order_icons.dmi'
	skill_min = SKILL_LEAD_TRAINED
	var/order_type = null

/datum/action/skill/issue_order/give_action(mob/M)
	. = ..()
	RegisterSignals(M, list(COMSIG_SKILL_ORDER_SENT, COMSIG_SKILL_ORDER_OFF_CD), PROC_REF(update_button_icon))

/datum/action/skill/issue_order/remove_action(mob/M)
	. = ..()
	UnregisterSignal(M, list(COMSIG_CIC_ORDER_SENT, COMSIG_CIC_ORDER_OFF_CD))

/datum/action/skill/issue_order/ai_should_start_consider()
	return TRUE

/datum/action/skill/issue_order/ai_should_use(atom/target)
	if(!can_use_action())
		return FALSE
	return TRUE

/datum/action/skill/issue_order/can_use_action(silent, override_flags, selecting)
	. = ..()
	if(!.)
		return
	if(owner.stat || TIMER_COOLDOWN_RUNNING(owner, COOLDOWN_SKILL_ORDERS))
		return FALSE

/datum/action/skill/issue_order/action_activate()
	var/mob/living/carbon/human/human = owner
	if(istype(human))
		human.issue_order(order_type)
	TIMER_COOLDOWN_START(owner, COOLDOWN_SKILL_ORDERS, SKILL_ORDER_COOLDOWN)
	addtimer(CALLBACK(src, PROC_REF(on_cooldown_finish)), SKILL_ORDER_COOLDOWN + 1)
	SEND_SIGNAL(owner, COMSIG_SKILL_ORDER_SENT)

/datum/action/skill/issue_order/update_button_icon()
	var/mob/living/carbon/human/human = owner
	if(!istype(human))
		return
	action_icon_state = "[order_type]"
	return ..()

/datum/action/skill/issue_order/handle_button_status_visuals()
	var/mob/living/carbon/human/human = owner
	if(!istype(human))
		return
	if(TIMER_COOLDOWN_RUNNING(human, COOLDOWN_SKILL_ORDERS))
		button.color = rgb(255,0,0,255)
	else
		button.color = rgb(255,255,255,255)

///Lets any other orders know when we're off CD
/datum/action/skill/issue_order/proc/on_cooldown_finish()
	SEND_SIGNAL(owner, COMSIG_SKILL_ORDER_OFF_CD, src)

/datum/action/skill/issue_order/move
	name = "下达移动命令"
	order_type = AURA_HUMAN_MOVE
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_KB_MOVEORDER,
	)

/datum/action/skill/issue_order/move/ai_should_use(atom/target)
	return FALSE //test only
	//the fact the only arg is the current walk to target is not ideal... add a new arg of goal_node?

/datum/action/skill/issue_order/hold
	name = "发布扣押令"
	order_type = AURA_HUMAN_HOLD
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_KB_HOLDORDER,
	)

/datum/action/skill/issue_order/hold/ai_should_use(atom/target)
	if(!isliving(target))
		return FALSE
	var/mob/living/living_target = target
	if(living_target.faction == owner.faction)
		return FALSE
	if(living_target.stat)
		return FALSE
	return ..()

/datum/action/skill/issue_order/focus
	name = "发布任务指令"
	order_type = AURA_HUMAN_FOCUS
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_KB_FOCUSORDER,
	)

/datum/action/skill/issue_order/focus/ai_should_use(atom/target)
	return FALSE //test only

/datum/action/skill/toggle_orders
	name = "显示/隐藏命令选项"
	skill_name = SKILL_LEADERSHIP
	skill_min = SKILL_LEAD_TRAINED
	var/orders_visible = TRUE
	action_icon_state = "hide_order"

/datum/action/skill/toggle_orders/action_activate()
	var/mob/living/carbon/human/H = owner
	if(!istype(H))
		return
	if(orders_visible)
		orders_visible = FALSE
		action_icon_state = "show_order"
		for(var/datum/action/skill/issue_order/action in owner.actions)
			action.hidden = TRUE
	else
		orders_visible = TRUE
		action_icon_state = "hide_order"
		for(var/datum/action/skill/issue_order/action in owner.actions)
			action.hidden = FALSE
	owner.update_action_buttons()


///Actually issues an Order
/mob/living/carbon/human/verb/issue_order(command_aura as null|text)
	set hidden = TRUE

	if(skills.getRating(SKILL_LEADERSHIP) < SKILL_LEAD_TRAINED)
		to_chat(src, span_warning("你没有足够的领导能力来下达命令。"))
		return

	if(stat)
		to_chat(src, span_warning("你无法在当前状态下下达命令。"))
		return

	if(IsMute())
		to_chat(src, span_warning("你被禁言时无法下达命令。"))
		return

	if(TIMER_COOLDOWN_RUNNING(src, COOLDOWN_SKILL_ORDERS))
		to_chat(src, span_warning("你刚刚下达过命令。冷静一下。"))
		return

	if(!command_aura)
		command_aura = tgui_input_list(src, "Choose an order", items = command_aura_allowed + "help")
		if(command_aura == "help")
			to_chat(src, span_notice("<br>命令会在短时间内为附近陆战队员提供增益效果，随后进入冷却，具体如下：<br><B>前进</B> - 提升机动性和闪避弹道的几率。<br><B>坚守</B> - 提升对疼痛和战斗创伤的抵抗力。<br><B>专注</B> - 提升枪械精度和有效射程。<br>"))
			return
		if(!command_aura)
			return

	if(TIMER_COOLDOWN_RUNNING(src, COOLDOWN_SKILL_ORDERS))
		to_chat(src, span_warning("你刚刚下达过命令。冷静一下。"))
		return

	if(!(command_aura in command_aura_allowed))
		return
	var/aura_strength = skills.getRating(SKILL_LEADERSHIP) - 1
	var/aura_target = pick_order_target()
	SSaura.add_emitter(aura_target, command_aura, aura_strength + 4, aura_strength, SKILL_ORDER_DURATION, faction)

	var/message = ""
	switch(command_aura)
		if("move")
			var/image/move = image('icons/mob/talk.dmi', src, icon_state = "order_move")
			message = pick("GET MOVING!", "GO, GO, GO!", "WE ARE ON THE MOVE!", "MOVE IT!", "DOUBLE TIME!", "ONWARDS!", "MOVE MOVE MOVE!", "ON YOUR FEET!", "GET A MOVE ON!", "ON THE DOUBLE!", "ROLL OUT!", "LET'S GO, LET'S GO!", "MOVE OUT!", "LEAD THE WAY!", "FORWARD!", "COME ON, MOVE!", "HURRY, GO!")
			say(message)
			add_emote_overlay(move)
		if("hold")
			var/image/hold = image('icons/mob/talk.dmi', src, icon_state = "order_hold")
			message = pick("DUCK AND COVER!", "HOLD THE LINE!", "HOLD POSITION!", "STAND YOUR GROUND!", "STAND AND FIGHT!", "TAKE COVER!", "COVER THE AREA!", "BRACE FOR COVER!", "BRACE!", "INCOMING!")
			say(message)
			add_emote_overlay(hold)
		if("focus")
			var/image/focus = image('icons/mob/talk.dmi', src, icon_state = "order_focus")
			message = pick("FOCUS FIRE!", "PICK YOUR TARGETS!", "CENTER MASS!", "CONTROLLED BURSTS!", "AIM YOUR SHOTS!", "READY WEAPONS!", "TAKE AIM!", "LINE YOUR SIGHTS!", "LOCK AND LOAD!", "GET READY TO FIRE!")
			say(message)
			add_emote_overlay(focus)

///Choose what we're sending a buff order through
/mob/living/carbon/human/proc/pick_order_target()
	//If we're in overwatch, use the camera eye
	if(istype(remote_control, /mob/camera/aiEye/remote/hud/overwatch))
		return remote_control
	return src
