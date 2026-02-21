/* Windoor (window door) assembly -Nodrak
* Step 1: Create a windoor out of rglass
* Step 2: Add r-glass to the assembly to make a secure windoor (Optional)
* Step 3: Rotate or Flip the assembly to face and open the way you want
* Step 4: Wrench the assembly in place
* Step 5: Add cables to the assembly
* Step 6: Set access for the door.
* Step 7: Screwdriver the door to complete
*/


/obj/structure/windoor_assembly
	icon = 'icons/obj/doors/windoor.dmi'

	name = "风门组件"
	icon_state = "l_windoor_assembly01"
	anchored = FALSE
	density = FALSE
	dir = NORTH
	obj_flags = CAN_BE_HIT | BLOCKS_CONSTRUCTION_DIR
	allow_pass_flags = PASS_GLASS|PASS_AIR
	atom_flags = ON_BORDER

	var/obj/item/circuitboard/airlock/electronics = null

	//Vars to help with the icon's name
	var/facing = "l"	//Does the windoor open to the left or right?
	var/secure = ""		//Whether or not this creates a secure windoor
	var/state = "01"	//How far the door assembly has progressed in terms of sprites

/obj/structure/windoor_assembly/Initialize(mapload, start_dir=NORTH, constructed=0)
	. = ..()
	if(constructed)
		state = "01"
		anchored = FALSE
	switch(start_dir)
		if(NORTH, SOUTH, EAST, WEST)
			setDir(start_dir)
		else //If the user is facing northeast. northwest, southeast, southwest or north, default to north
			setDir(NORTH)
	var/static/list/connections = list(
		COMSIG_ATOM_EXIT = PROC_REF(on_try_exit),
	)
	AddElement(/datum/element/connect_loc, connections)

/obj/structure/windoor_assembly/setDir(newdir)
	. = ..()
	update_icon()

/obj/structure/windoor_assembly/update_icon_state()
	. = ..()
	icon_state = "[facing]_[secure]windoor_assembly[state]"

/obj/structure/windoor_assembly/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	switch(state)
		if("01")
			if(iswelder(I) && !anchored)
				var/obj/item/tool/weldingtool/WT = I
				if(!WT.remove_fuel(0, user))
					to_chat(user, span_notice("你需要更多焊接燃料来拆解风门组件。"))
					return

				user.visible_message("[user] 拆解了风门组件。", "You start to dissassemble the windoor assembly.")
				playsound(loc, 'sound/items/welder2.ogg', 25, 1)

				if(!do_after(user, 4 SECONDS, NONE, src, BUSY_ICON_BUILD))
					return

				if(!src || !WT.isOn())
					return
				to_chat(user, span_notice("你拆解了风门组件！"))
				new /obj/item/stack/sheet/glass/reinforced(get_turf(src), 5)
				if(secure)
					new /obj/item/stack/rods(get_turf(src), 4)
				qdel(src)

			//Wrenching an unsecure assembly anchors it in place. Step 4 complete
			else if(iswrench(I) && !anchored)
				playsound(loc, 'sound/items/ratchet.ogg', 25, 1)
				user.visible_message("[user]将风门组件固定在地板上。", "You start to secure the windoor assembly to the floor.")

				if(!do_after(user, 4 SECONDS, NONE, src, BUSY_ICON_BUILD))
					return

				to_chat(user, span_notice("你已成功固定好风门组件！"))
				anchored = TRUE
				if(secure)
					name = "已锚定安全风门组件"
				else
					name = "固定式风门组件"

			//Unwrenching an unsecure assembly un-anchors it. Step 4 undone
			else if(iswrench(I) && anchored)
				playsound(loc, 'sound/items/ratchet.ogg', 25, 1)
				user.visible_message("[user] 将风门组件从地板上拆下。", "You start to unsecure the windoor assembly to the floor.")

				if(!do_after(user, 4 SECONDS, NONE, src, BUSY_ICON_BUILD))
					return

				to_chat(user, span_notice("你已解除了气闸门组件的固定！"))
				anchored = FALSE

				if(secure)
					name = "安全风门组件"
				else
					name = "风门组件"

			//Adding plasteel makes the assembly a secure windoor assembly. Step 2 (optional) complete.
			else if(istype(I, /obj/item/stack/rods) && !secure)
				var/obj/item/stack/rods/R = I
				if(R.get_amount() < 4)
					to_chat(user, span_warning("你需要更多金属棒才能这样做。"))
					return

				to_chat(user, span_notice("你开始用金属棒加固风门。"))
				if(!do_after(user,4 SECONDS, NONE, src, BUSY_ICON_BUILD) || secure)
					return

				if(!R.use(4))
					return

				to_chat(user, span_notice("你加固了风门。"))
				secure = "secure_"
				if(anchored)
					name = "已锚定安全风门组件"
				else
					name = "安全风门组件"

			//Adding cable to the assembly. Step 5 complete.
			else if(iscablecoil(I) && anchored)
				user.visible_message("[user] 正在连接风门组件。", "You start to wire the windoor assembly.")

				var/obj/item/stack/cable_coil/CC = I
				if(!do_after(user, 4 SECONDS, NONE, src, BUSY_ICON_BUILD))
					return

				if(!CC.use(1))
					return

				to_chat(user, span_notice("你接通了风门的线路！"))
				state = "02"
				if(secure)
					name = "安全接线风门组件"
				else
					name = "有线风门组件"
		if("02")
			//Removing wire from the assembly. Step 5 undone.
			if(iswirecutter(I) && !electronics)
				playsound(loc, 'sound/items/wirecutter.ogg', 25, 1)
				user.visible_message("[user]切断了气闸组件的电线。", "You start to cut the wires from airlock assembly.")

				if(!do_after(user, 4 SECONDS, NONE, src, BUSY_ICON_BUILD))
					return

				to_chat(user, span_notice("你剪断了风门电线！"))
				new /obj/item/stack/cable_coil(get_turf(user), 1)
				state = "01"
				if(secure)
					name = "固定式风门组件"
				else
					name = "固定式风门组件"

			//Adding airlock electronics for access. Step 6 complete.
			else if(istype(I, /obj/item/circuitboard/airlock) && I.icon_state != "door_electronics_smoked")
				playsound(loc, 'sound/items/screwdriver.ogg', 25, 1)
				user.visible_message("[user] 将电子元件安装到气闸组件中。", "You start to install electronics into the airlock assembly.")

				if(!do_after(user, 4 SECONDS, NONE, src, BUSY_ICON_BUILD))
					return

				user.drop_held_item()
				I.forceMove(src)
				to_chat(user, span_notice("你已安装气闸电子元件！"))
				name = "即将完成的风门组件"
				electronics = I

			//Screwdriver to remove airlock electronics. Step 6 undone.
			else if(isscrewdriver(I) && electronics)
				playsound(loc, 'sound/items/screwdriver.ogg', 25, 1)
				user.visible_message("[user] 从气闸组件中拆除了电子元件。", "You start to uninstall electronics from the airlock assembly.")

				if(!do_after(user, 4 SECONDS, NONE, src, BUSY_ICON_BUILD))
					return

				if(!electronics)
					return

				to_chat(user, span_notice("你已经拆除了气闸门电子元件！"))
				if(secure)
					name = "安全布线气密门组件"
				else
					name = "有线风门组件"
				var/obj/item/circuitboard/airlock/ae = electronics
				electronics = null
				ae.forceMove(loc)

			//Crowbar to complete the assembly, Step 7 complete.
			else if(iscrowbar(I))
				if(!electronics)
					to_chat(user, span_warning("组装体缺少电子元件。"))
					return
				DIRECT_OUTPUT(user, browse(null, "window=windoor_access"))
				playsound(loc, 'sound/items/crowbar.ogg', 25, 1)
				user.visible_message("[user] 将风门撬入框架。", "You start prying the windoor into the frame.")

				if(!do_after(user, 4 SECONDS, NONE, src, BUSY_ICON_BUILD))
					return

				density = TRUE //Shouldn't matter but just incase
				to_chat(user, span_notice("你完成了气密门！"))

				if(secure)
					var/obj/machinery/door/window/secure/BR = new(loc)
					if(facing == "l")
						BR.icon_state = "leftsecureopen"
						BR.base_state = "leftsecure"
					else
						BR.icon_state = "rightsecureopen"
						BR.base_state = "rightsecure"
					BR.setDir(dir)
					BR.density = FALSE

					if(electronics.one_access)
						BR.req_access = null
						BR.req_one_access = electronics.conf_access
					else
						BR.req_access = electronics.conf_access
					BR.electronics = electronics
					electronics.forceMove(BR)
				else
					var/obj/machinery/door/window/WR = new(loc)
					if(facing == "l")
						WR.icon_state = "leftopen"
						WR.base_state = "left"
					else
						WR.icon_state = "rightopen"
						WR.base_state = "right"
					WR.setDir(dir)
					WR.density = FALSE

					if(electronics.one_access)
						WR.req_access = null
						WR.req_one_access = electronics.conf_access
					else
						WR.req_access = electronics.conf_access
					WR.electronics = electronics
					electronics.forceMove(WR)


				qdel(src)

	//Update to reflect changes(if applicable)
	update_icon()


//Rotates the windoor assembly clockwise
/obj/structure/windoor_assembly/verb/revrotate()
	set name = "Rotate Windoor Assembly"
	set category = "IC.Object"
	set src in oview(1)

	if (src.anchored)
		to_chat(usr, "它被固定在地板上；因此，你无法旋转它！")
		return 0
	setDir(turn(src.dir, 270))


//Flips the windoor assembly, determines whather the door opens to the left or the right
/obj/structure/windoor_assembly/verb/flip()
	set name = "Flip Windoor Assembly"
	set category = "IC.Object"
	set src in oview(1)

	if(src.facing == "l")
		to_chat(usr, "这扇风门现在将向右滑动。")
		src.facing = "r"
	else
		src.facing = "l"
		to_chat(usr, "这扇风门现在将向左滑动。")

	update_icon()

