/obj/item/hud_tablet
	name = "平视显示平板"
	desc = "一个平板电脑，可实时查看多个耳机摄像头的画面"
	icon_state = "req_tablet_off"
	equip_slot_flags = ITEM_SLOT_POCKET
	w_class = WEIGHT_CLASS_SMALL
	interaction_flags = INTERACT_MACHINE_TGUI
	/// How far can these tablets see around the cameras
	var/max_view_dist = 3
	var/obj/machinery/camera/active_camera
	/// Used to keep a cache of the last location visible on the camera
	var/turf/last_turf
	var/list/network = list("marine")
	// Stuff needed to render the map
	var/const/default_map_size = 15
	var/atom/movable/screen/map_view/camera/cam_screen

/obj/item/hud_tablet/Initialize(mapload, rank, datum/squad/squad)
	. = ..()
	if(rank)
		var/dat = "marine"
		switch(rank)
			if(/datum/job/terragov/squad/leader)
				if(squad)
					switch(squad.name)
						if("Alpha")
							dat += " alpha"
							network = list("alpha")
						if("Bravo")
							dat += " bravo"
							network = list("bravo")
						if("Charlie")
							dat += " charlie"
							network = list("charlie")
						if("Delta")
							dat += " delta"
							network = list("delta")
						else
							var/lowername = lowertext(squad.name)
							dat = dat + " " + lowername
							network = list(lowername)
				dat += " squad leader's"
			if(/datum/job/terragov/command/captain)
				dat += " captain's"
				network = list("marinesl", "marine", "marinemainship")
			if(/datum/job/terragov/command/fieldcommander)
				dat += " field commander's"
				network = list("marinesl", "marine")
			if(/datum/job/terragov/command/pilot)
				dat += " pilot's"
				network = list("dropship1")
			if(/datum/job/terragov/command/transportofficer)
				dat += " transport officer's"
				network = list("dropship2")
		name = dat + " hud tablet"
	// Convert networks to lowercase
	for(var/i in network)
		network -= i
		network += lowertext(i)
	// Map name has to start and end with an A-Z character,
	// and definitely NOT with a square bracket or even a number.
	// I wasted 6 hours on this. :agony:

	cam_screen = new
	cam_screen.generate_view("hud_tablet_[REF(src)]_map")

/obj/item/hud_tablet/Destroy()
	QDEL_NULL(cam_screen)
	return ..()

/obj/item/hud_tablet/proc/get_available_cameras()
	var/list/L = list()
	for(var/i in GLOB.cameranet.cameras)
		var/obj/machinery/camera/C = i
		L.Add(C)
	var/list/valid_cams = list()
	for(var/obj/machinery/camera/C in L)
		if(!C.network)
			stack_trace("Camera in a cameranet has no camera network")
			continue
		if(!(islist(C.network)))
			stack_trace("Camera in a cameranet has a non-list camera network")
			continue
		if(!C.c_tag || C.c_tag == "Unknown")
			continue // dropped headsets havee an unknown tag
		var/list/tempnetwork = C.network & network
		if(length(tempnetwork))
			valid_cams[ref(C)] += C
	return valid_cams

/obj/item/hud_tablet/interact(mob/user)
	if(!allowed(user))
		to_chat(user, span_warning("访问被拒绝，未授权用户。"))
		return TRUE
	return ..()

/obj/item/hud_tablet/ui_interact(mob/user, datum/tgui/ui)
	// Update UI
	ui = SStgui.try_update_ui(user, src, ui)

	// Update the camera, showing static if necessary and updating data if the location has moved.
	update_active_camera_screen()

	if(!ui)
		// Open UI
		ui = new(user, src, "CameraConsole", name)
		ui.open()
		// Register map objects
		cam_screen.display_to(user, ui.window)

/obj/item/hud_tablet/ui_close(mob/user)
	. = ..()
	// Unregister map objects
	cam_screen.hide_from(user)

/obj/item/hud_tablet/ui_data()
	. = list()
	.["network"] = network
	.["activeCamera"] = null
	if(active_camera)
		.["activeCamera"] = list(
			name = active_camera.c_tag,
			status = active_camera.status,
			ref = ref(active_camera)
		)

/obj/item/hud_tablet/ui_static_data()
	var/list/data = list()
	data["mapRef"] = cam_screen.assigned_map
	var/list/cameras = get_available_cameras()
	data["cameras"] = list()
	for(var/obj/machinery/camera/camera_reference as anything in cameras)
		var/obj/machinery/camera/camera = cameras[camera_reference]
		data["cameras"] += list(camera.camera_ui_data())
	return data

/obj/item/hud_tablet/ui_act(action, params)
	. = ..()
	if(.)
		return

	if(action == "switch_camera")
		var/camera_reference = params["ref"]
		var/list/cameras = get_available_cameras()
		var/obj/machinery/camera/selected_camera

		active_camera = cameras[camera_reference]
		playsound(src, SFX_TERMINAL_TYPE, 25, FALSE)

		if(!selected_camera)
			return TRUE

		update_active_camera_screen()

		return TRUE

/obj/item/hud_tablet/proc/update_active_camera_screen()
	// Show static if can't use the camera
	if(!active_camera?.can_use())
		cam_screen.show_camera_static()
		return

	var/list/visible_turfs = list()

	// Is this camera located in or attached to a living thing? If so, assume the camera's loc is the living thing.
	var/cam_location = isliving(active_camera.loc) ? active_camera.loc : active_camera

	// If we're not forcing an update for some reason and the cameras are in the same location,
	// we don't need to update anything.
	// Most security cameras will end here as they're not moving.
	var/newturf = get_turf(cam_location)
	if(last_turf == newturf)
		return

	// Cameras that get here are moving, and are likely attached to some moving atom such as cyborgs.
	last_turf = get_turf(cam_location)

	for(var/turf/visible_turf in view(min(max_view_dist, active_camera.view_range), last_turf))
		visible_turfs += visible_turf

	var/list/bbox = get_bbox_of_atoms(visible_turfs)
	var/size_x = bbox[3] - bbox[1] + 1
	var/size_y = bbox[4] - bbox[2] + 1

	cam_screen.show_camera(visible_turfs, size_x, size_y)

/obj/item/hud_tablet/alpha
	name = "阿尔法HUD平板"
	network = list("alpha")

/obj/item/hud_tablet/bravo
	name = "布拉沃班平板"
	network = list("bravo")

/obj/item/hud_tablet/charlie
	name = "查理HUD平板"
	network = list("charlie")

/obj/item/hud_tablet/delta
	name = "德尔塔小队平板"
	network = list("delta")

/obj/item/hud_tablet/leadership
	name = "舰长的平视显示器平板"
	network = list("marinesl", "marine", "marinemainship")
	max_view_dist = WORLD_VIEW_NUM

/obj/item/hud_tablet/fieldcommand
	name = "战地指挥官的平视显示器平板"
	network = list("marinesl", "marine")
	max_view_dist = WORLD_VIEW_NUM

/obj/item/hud_tablet/pilot
	name = "飞行员的平视显示平板"
	network = list("dropship1")
	max_view_dist = WORLD_VIEW_NUM

/obj/item/hud_tablet/transportofficer
	name = "运输军官的平视显示器平板"
	network = list("dropship2")
	max_view_dist = WORLD_VIEW_NUM

/obj/item/hud_tablet/artillery
	name = "火炮命中指示平板"
	desc = "一款便捷的平板电脑，可实时接收多颗TGMC卫星的直播画面。提供战场上所有火炮的视野。每当开火时，会传输弹着点的视频，以便装填手或观测员观察命中情况。"
	network = list("terragovartillery") //This shows cameras of all mortars, so don't add this to HvH
	max_view_dist = WORLD_VIEW_NUM

