/obj/item/assembly/control/transport
	/// The ID of the tram we're linked to
	var/specific_transport_id = TRAMSTATION_LINE_1
	/// Options to be passed with the requests to the transport subsystem
	var/options = NONE

/obj/item/assembly/control/transport/multitool_act(mob/living/user)
	var/list/available_platforms = list()
	for(var/obj/effect/landmark/transport/nav_beacon/tram/platform/platform as anything in SStransport.nav_beacons[specific_transport_id])
		LAZYADD(available_platforms, platform.name)

	var/selected_platform = tgui_input_list(user, "Set the platform ID", "Platform", available_platforms)
	var/obj/effect/landmark/transport/nav_beacon/tram/platform/change_platform
	for(var/obj/effect/landmark/transport/nav_beacon/tram/platform/destination as anything in SStransport.nav_beacons[specific_transport_id])
		if(destination.name == selected_platform)
			change_platform = destination
			break

	if(!change_platform || QDELETED(user) || QDELETED(src) || !user.incapacitated())
		return

	if(get_dist(change_platform, src) > 15)
		balloon_alert(user, "超出射程！")
		return

	id = change_platform.platform_code
	balloon_alert(user, "平台已变更")
	to_chat(user, span_notice("你将平台ID更改为[change_platform.name]。"))

/obj/item/assembly/control/transport/call_button
	name = "tram call button"
	desc = "用于将轨道电车召唤至当前位置的小型设备。"
	///ID to link to allow us to link to one specific tram in the world
	id = 0

/obj/item/assembly/control/transport/call_button/Initialize(mapload)
	. = ..()
	return INITIALIZE_HINT_LATELOAD

/obj/item/assembly/control/transport/call_button/LateInitialize()
	if(!id_tag)
		id_tag = assign_random_name()
	SStransport.hello(src, name, id_tag)
	RegisterSignal(SStransport, COMSIG_TRANSPORT_RESPONSE, PROC_REF(call_response))

/obj/item/assembly/control/transport/proc/call_response(controller, list/relevant, response_code, response_info)
	SIGNAL_HANDLER
	if(!LAZYFIND(relevant, src))
		return

	switch(response_code)
		if(REQUEST_SUCCESS)
			say("电车已呼叫至站台。")

		if(REQUEST_FAIL)
			switch(response_info)
				if(BROKEN_BEYOND_REPAIR)
					say("电车已发生灾难性故障。请寻找其他出行方式。")
				if(NOT_IN_SERVICE) //tram has no power or other fault, but it's not broken forever
					say("电车因电力中断或系统故障暂停服务。请联系最近的工程师检查电源和控制器。")
				if(INVALID_PLATFORM) //engineer needs to fix button
					say("按钮配置错误。请联络最近的工程师。")
				if(TRANSPORT_IN_USE)
					say("电车正在站内穿行，请稍候。")
				if(INTERNAL_ERROR)
					say("电车控制器错误。请联系最近拥有电信访问权限的工程师或船员重置控制器。")
				if(NO_CALL_REQUIRED) //already here
					say("电车已就位。请上车并选择目的地。")
				else
					say("电车控制器错误。请联系最近拥有电信访问权限的工程师或船员重置控制器。")

/obj/item/assembly/control/transport/call_button/activate()
	if(cooldown)
		return
	cooldown = TRUE
	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 2 SECONDS)

	// INVOKE_ASYNC(SStransport, TYPE_PROC_REF(/datum/controller/subsystem/processing/transport, call_request), src, specific_transport_id, id)
	SEND_SIGNAL(src, COMSIG_TRANSPORT_REQUEST, specific_transport_id, id)

/obj/machinery/button/transport/tram
	name = "tram request"
	desc = "呼叫轨道车的按钮。内部装有带扬声器的通话盒。"
	base_icon_state = "tram"
	icon_state = "tram"
	light_color = COLOR_DISPLAY_BLUE
	device_type = /obj/item/assembly/control/transport/call_button
	req_access = list()
	id = 0
	/// The ID of the tram we're linked to
	var/specific_transport_id = TRAMSTATION_LINE_1

/// We allow borgs to use the button locally, but not the AI remotely
/obj/machinery/button/transport/tram/attack_ai(mob/user)
	if(isAI(user) || machine_stat & PANEL_OPEN)
		return
	if(IsAdminGhost(user)) //admins and remote controls can use it at a distance
		return attack_hand(user)
	if(in_range(user, src))
		return attack_hand(user)
	else
		to_chat(user, span_warning("你距离太远，无法激活按钮！"))

/obj/machinery/button/transport/tram/setup_device()
	var/obj/item/assembly/control/transport/call_button/tram_device = device
	tram_device.id = id
	tram_device.specific_transport_id = specific_transport_id
	return ..()

/obj/machinery/button/transport/tram/examine(mob/user)
	. = ..()
	. += span_notice("There's a small inscription on the button...")
	. += span_notice("THIS CALLS THE TRAM! IT DOES NOT OPERATE IT! The console on the tram tells it where to go!")

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/button/transport/tram, 32)
