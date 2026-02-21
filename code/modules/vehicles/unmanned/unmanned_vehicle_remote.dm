/obj/item/unmanned_vehicle_remote
	name = "手持载具控制器"
	desc = "用于控制无人载具。<br>点击您想要控制的载具与控制器进行链接。"
	icon = 'icons/obj/device.dmi'
	icon_state = "multitool2"
	w_class = WEIGHT_CLASS_SMALL
	///reference to the unmanned vehicle that we're connected to or remote control
	var/obj/vehicle/unmanned/vehicle

/obj/item/unmanned_vehicle_remote/Destroy()
	. = ..()
	clear_vehicle()

/obj/item/unmanned_vehicle_remote/afterattack(atom/target, mob/user, flag)
	if(!istype(target, /obj/vehicle/unmanned))
		return ..()
	if(vehicle)
		SEND_SIGNAL(src, COMSIG_REMOTECONTROL_UNLINK)
		if(vehicle == target)
			to_chat(user, span_notice("你已将[target]从[src]断开连接。"))
			clear_vehicle()
			return
		clear_vehicle()
	vehicle = target
	if(vehicle.controlled)
		to_chat(user, "<span class='warning'>已有其他单位正在控制此载具</span>")
		vehicle = null
		return
	vehicle.on_link(src)
	AddComponent(/datum/component/remote_control, target, vehicle.turret_type, vehicle.can_interact)
	to_chat(user, span_notice("你将[target]链接到[src]。"))
	RegisterSignal(target, COMSIG_QDELETING, PROC_REF(clear_vehicle))
	return ..()

/obj/item/unmanned_vehicle_remote/attack_self(mob/user)
	if(SEND_SIGNAL(src, COMSIG_REMOTECONTROL_TOGGLE, user))
		return
	return ..()

///Wrapper to clear reference on target vehicle deletion
/obj/item/unmanned_vehicle_remote/proc/clear_vehicle()
	SIGNAL_HANDLER
	if(!vehicle)
		return
	UnregisterSignal(vehicle, COMSIG_QDELETING)
	vehicle.on_unlink(src)
	vehicle = null
