/obj/item/assembly/control
	name = "防爆门控制器"
	desc = "一种小型电子设备，能够远程控制防爆门。"
	icon_state = "control"
	/// The ID of the blast door electronics to match to the ID of the blast door being used.
	var/id = null
	/// Cooldown of the door's controller. Updates when pressed (activate())
	var/cooldown = FALSE
	var/sync_doors = TRUE

/obj/item/assembly/control/examine(mob/user)
	. = ..()
	if(id)
		. += span_notice("Its channel ID is '[id]'.")
