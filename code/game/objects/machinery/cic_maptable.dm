
/atom/movable/screen/maptable_extras
	/// minimap action this extra button is owned by
	var/obj/machinery/cic_maptable/maptable

/atom/movable/screen/maptable_extras/Destroy()
	maptable = null
	return ..()

/atom/movable/screen/maptable_extras/minimap_z_indicator
	icon = 'icons/mob/screen_ai.dmi'
	icon_state = "zindicator"
	screen_loc = ui_ai_floor_indicator

///sets the currently indicated relative floor
/atom/movable/screen/maptable_extras/minimap_z_indicator/proc/set_indicated_z(newz)
	if(!newz)
		return
	var/list/linked_zs = SSmapping.get_connected_levels(newz)
	if(!length(linked_zs))
		return
	linked_zs = sort_list(linked_zs, /proc/cmp_numeric_asc)
	var/relativez = linked_zs.Find(newz)
	var/text = "Floor<br/>[relativez]"
	maptext = MAPTEXT_TINY_UNICODE("<div align='center' valign='middle' style='position:relative; top:0px; left:0px'>[text]</div>")

/atom/movable/screen/maptable_extras/minimap_z_up
	name = "向上移动"
	icon = 'icons/mob/screen_ai.dmi'
	icon_state = "up"
	mouse_over_pointer = MOUSE_HAND_POINTER
	screen_loc = ui_ai_godownup

/atom/movable/screen/maptable_extras/minimap_z_up/Click(location,control,params)
	flick("uppressed",src)
	var/currentz = maptable.targetted_zlevel
	var/list/linked_zs = SSmapping.get_connected_levels(currentz)
	if(!length(linked_zs))
		return
	linked_zs = sort_list(linked_zs, /proc/cmp_numeric_asc)
	var/relativez = linked_zs.Find(currentz)
	if(relativez == length(linked_zs))
		return //topmost z with nothing above. we still play effects just dont do anything
	maptable.change_targeted_z(null, ++currentz)


/atom/movable/screen/maptable_extras/minimap_z_down
	name = "下去"
	icon = 'icons/mob/screen_ai.dmi'
	icon_state = "down"
	mouse_over_pointer = MOUSE_HAND_POINTER
	screen_loc = ui_ai_godownup

/atom/movable/screen/maptable_extras/minimap_z_down/Click(location,control,params)
	flick("downpressed",src)
	var/currentz = maptable.targetted_zlevel
	var/list/linked_zs = SSmapping.get_connected_levels(currentz)
	if(!length(linked_zs))
		return
	linked_zs = sort_list(linked_zs, /proc/cmp_numeric_asc)
	var/relativez = linked_zs.Find(currentz)
	if(relativez == 1)
		return //bottommost z with nothing below. we still play effects just dont do anything
	maptable.change_targeted_z(null, --currentz)


/obj/machinery/cic_maptable
	name = "地图桌"
	desc = "显示当前目标位置地图的表格"
	icon = 'icons/obj/machines/computer.dmi'
	icon_state = "maptable"
	interaction_flags = INTERACT_MACHINE_DEFAULT
	use_power = IDLE_POWER_USE
	density = TRUE
	idle_power_usage = 2
	light_range = 2
	light_power = 0.5
	light_color = LIGHT_COLOR_BLUE
	var/screen_overlay = "maptable_screen"
	///flags that we want to be shown when you interact with this table
	var/minimap_flag = MINIMAP_FLAG_MARINE
	///by default Zlevel 2, groundside is targetted
	var/targetted_zlevel = 2
	///minimap obj ref that we will display to users
	var/atom/movable/screen/minimap/map
	///button granted when you're on a multiz level that lets you check above and below you
	var/atom/movable/screen/maptable_extras/minimap_z_indicator/z_indicator
	///button granted when you're on a multiz level that lets you check above and below you
	var/atom/movable/screen/maptable_extras/minimap_z_up/z_up
	///button granted when you're on a multiz level that lets you check above and below you
	var/atom/movable/screen/maptable_extras/minimap_z_down/z_down
	///List of currently interacting mobs
	var/list/mob/interactees = list()

/obj/machinery/cic_maptable/Initialize(mapload)
	. = ..()
	z_indicator = new
	z_indicator.maptable = src
	z_up = new
	z_up.maptable = src
	z_down = new
	z_down.maptable = src
	RegisterSignal(SSdcs, COMSIG_GLOB_CAMPAIGN_MISSION_LOADED, PROC_REF(change_targeted_z))
	update_appearance(UPDATE_ICON)

/obj/machinery/cic_maptable/Destroy()
	map = null
	QDEL_NULL(z_indicator)
	QDEL_NULL(z_up)
	QDEL_NULL(z_down)
	return ..()

/obj/machinery/cic_maptable/update_icon()
	. = ..()
	if(machine_stat & (BROKEN|DISABLED|NOPOWER))
		set_light(0)
	else
		set_light(initial(light_range))

/obj/machinery/cic_maptable/update_overlays()
	. = ..()
	if(machine_stat & (BROKEN|DISABLED|NOPOWER))
		return
	. += emissive_appearance(icon, screen_overlay, src, alpha = src.alpha)
	. += mutable_appearance(icon, screen_overlay, alpha = src.alpha)

/obj/machinery/cic_maptable/interact(mob/user)
	. = ..()
	if(.)
		return
	if(interact_checks(user))
		return TRUE
	if(!map)
		map = SSminimaps.fetch_minimap_object(targetted_zlevel, minimap_flag)
	user.client.screen += map
	if(length(SSmapping.get_connected_levels(targetted_zlevel)) > 1)
		user.client.screen += z_indicator
		user.client.screen += z_up
		user.client.screen += z_down
		z_indicator.set_indicated_z(targetted_zlevel)
	interactees += user
	if(isobserver(user))
		RegisterSignal(user, COMSIG_MOVABLE_MOVED, PROC_REF(on_move))

///Returns true if something prevents the user from interacting with this. used mainly with the drawtable
/obj/machinery/cic_maptable/proc/interact_checks(mob/user)
	if(!user.client)
		return TRUE

//Bugfix to handle cases for ghosts/observers that dont automatically close uis on move.
/obj/machinery/cic_maptable/proc/on_move(mob/dead/observer/source, oldloc)
	SIGNAL_HANDLER
	if(!istype(source))
		CRASH("on_move called by non observer")
	if(Adjacent(source))
		return
	UnregisterSignal(source, COMSIG_MOVABLE_MOVED)
	source.unset_interaction()

///Updates the z-level this maptable views
/obj/machinery/cic_maptable/proc/change_targeted_z(datum/source, new_z)
	SIGNAL_HANDLER
	if(!isnum(new_z))
		return
	var/list/old_interactors = interactees.Copy()
	for(var/mob/user AS in old_interactors)
		on_unset_interaction(user)
	map = null
	targetted_zlevel = new_z
	z_indicator.set_indicated_z(targetted_zlevel)
	for(var/mob/user AS in old_interactors)
		interact(user)

/obj/machinery/cic_maptable/on_unset_interaction(mob/user)
	. = ..()
	interactees -= user
	user?.client?.screen -= map
	user?.client?.screen -= z_indicator
	user?.client?.screen -= z_up
	user?.client?.screen -= z_down

/obj/machinery/cic_maptable/attack_ai(mob/living/silicon/ai/user)
	if(!(user in interactees))
		interact(user)
	else
		user.unset_interaction()

/obj/machinery/cic_maptable/droppod_maptable
	name = "雅典娜战术地图控制台"
	desc = "一张显示行星表面行动区域的地图，专门用于揭示可能的空降舱投放区域。这对于观察前线位置和陆战队部署尤为有用，让任何准备空降的人员都能决定着陆地点。祈祷你的陆地导航技能足够扎实，不会迷路吧！"
	icon_state = "droppodtable"
	screen_overlay = "droppodtable_emissive"

/obj/machinery/cic_maptable/som_maptable
	icon_state = "som_console"
	screen_overlay = "som_maptable_screen"
	minimap_flag = MINIMAP_FLAG_MARINE_SOM
	light_color = LIGHT_COLOR_FLARE

/obj/machinery/cic_maptable/no_flags
	minimap_flag = NONE

//Exactly the same but you can draw on the map
/obj/machinery/cic_maptable/drawable
	desc = "一张显示当前目标位置地图并允许在上面绘制的桌子"
	/// List of references to the tools we will be using to shape what the map looks like
	var/list/atom/movable/screen/drawing_tools = list(
		/atom/movable/screen/minimap_tool/draw_tool/red,
		/atom/movable/screen/minimap_tool/draw_tool/yellow,
		/atom/movable/screen/minimap_tool/draw_tool/purple,
		/atom/movable/screen/minimap_tool/draw_tool/blue,
		/atom/movable/screen/minimap_tool/draw_tool/erase,
		/atom/movable/screen/minimap_tool/label,
		/atom/movable/screen/minimap_tool/clear,
	)

/obj/machinery/cic_maptable/drawable/Initialize(mapload)
	. = ..()
	var/static/list/connections = list(
		COMSIG_OBJ_TRY_ALLOW_THROUGH = PROC_REF(can_climb_over),
	)
	AddElement(/datum/element/connect_loc, connections)

	var/list/atom/movable/screen/actions = list()
	for(var/path in drawing_tools)
		actions += new path(null, null, targetted_zlevel, minimap_flag)
	drawing_tools = actions

/obj/machinery/cic_maptable/drawable/Destroy()
	. = ..()
	QDEL_LIST(drawing_tools)

/obj/machinery/cic_maptable/drawable/examine(mob/user)
	. = ..()
	. += span_warning("Note that abuse may result in a command role ban.")

/obj/machinery/cic_maptable/drawable/interact_checks(mob/user)
	. = ..()
	if(.)
		return

/obj/machinery/cic_maptable/drawable/interact(mob/user)
	. = ..()
	if(.)
		return
	if(user.skills.getRating(SKILL_LEADERSHIP) < SKILL_LEAD_EXPERT)
		return
	if(is_banned_from(user.client.ckey, GLOB.roles_allowed_minimap_draw))
		to_chat(user, span_boldwarning("你已被禁止担任指挥职务。在禁令解除前，你无法使用权限提取功能。"))
		return
	user.client.screen += drawing_tools

/obj/machinery/cic_maptable/drawable/on_unset_interaction(mob/user)
	. = ..()
	user?.client?.screen -= drawing_tools
	user?.client?.mouse_pointer_icon = null
	for(var/atom/movable/screen/minimap_tool/tool AS in drawing_tools)
		tool.UnregisterSignal(user, list(COMSIG_MOB_MOUSEDOWN, COMSIG_MOB_MOUSEUP))

///Updates the z-level this maptable views
/obj/machinery/cic_maptable/drawable/change_targeted_z(datum/source, new_z)
	. = ..()

	for(var/atom/movable/screen/minimap_tool/tool AS in drawing_tools)
		tool.zlevel = new_z
		tool.set_zlevel(new_z, tool.minimap_flag)

/obj/machinery/cic_maptable/drawable/big
	icon = 'icons/obj/structures/prop/mainship_96.dmi'
	layer = ABOVE_OBJ_LAYER
	pixel_x = -16
	pixel_y = -14
	coverage = 75
	allow_pass_flags = PASS_LOW_STRUCTURE|PASSABLE|PASS_WALKOVER
	bound_width = 64

/obj/machinery/cic_maptable/drawable/big/Initialize(mapload)
	. = ..()
	var/static/list/connections = list(
		COMSIG_OBJ_TRY_ALLOW_THROUGH = PROC_REF(can_climb_over),
	)
	AddElement(/datum/element/connect_loc, connections)

/obj/machinery/cic_maptable/drawable/big/som
	minimap_flag = MINIMAP_FLAG_MARINE_SOM
	screen_overlay = "som_maptable_screen"
	light_color = LIGHT_COLOR_FLARE
	light_range = 3
