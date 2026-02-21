// ***************************************
// *********** Bull charge types
// ***************************************

/datum/action/ability/activable/xeno/bull_charge
	name = "Plow Charge"
	action_icon_state = "bull_charge"
	action_icon = 'icons/Xeno/actions/bull.dmi'
	desc = "当你击中宿主时，将其撞开并继续不受阻碍地冲锋。冲锋的力量还会解除他们的武装。"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_BULLCHARGE,
	)
	var/new_charge_type = CHARGE_BULL


/datum/action/ability/activable/xeno/bull_charge/on_selection()
	SEND_SIGNAL(owner, COMSIG_XENOACTION_TOGGLECHARGETYPE, new_charge_type)


/datum/action/ability/activable/xeno/bull_charge/headbutt
	name = "Headbutt Charge"
	action_icon_state = "bull_headbutt"
	action_icon = 'icons/Xeno/actions/bull.dmi'
	desc = "当你击中宿主时，会停止冲锋并用头撞击他们，将其甩投到空中并使其眩晕一段时间。"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_BULLHEADBUTT,
	)
	new_charge_type = CHARGE_BULL_HEADBUTT

/datum/action/ability/activable/xeno/bull_charge/gore
	name = "Gore Charge"
	action_icon_state = "bull_gore"
	action_icon = 'icons/Xeno/actions/bull.dmi'
	desc = "当你击中宿主时，会停止冲锋，同时刺穿并注入奥泽洛梅林。"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_BULLGORE,
	)
	new_charge_type = CHARGE_BULL_GORE
