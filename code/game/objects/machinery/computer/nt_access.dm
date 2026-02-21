// -- generate override code computer
//TODO: Make a parent computer to remove all the nuke disk copy paste
/obj/item/circuitboard/computer/nt_access
	name = "电路板（核弹盘生成器）"
	build_path = /obj/machinery/computer/code_generator/nt_access

/obj/effect/landmark/campaign_structure/nt_access
	name = "红色纳米传讯安保覆盖终端"
	icon = 'icons/obj/structures/campaign/tall_structures.dmi'
	icon_state = "terminal_red"
	mission_types = list(/datum/campaign_mission/destroy_mission/base_rescue)
	spawn_object = /obj/machinery/computer/code_generator/nt_access/red

/obj/effect/landmark/campaign_structure/nt_access/blue
	name = "蓝色纳米传讯安保覆盖终端"
	icon_state = "terminal_blue"
	spawn_object = /obj/machinery/computer/code_generator/nt_access/blue


/obj/machinery/computer/code_generator/nt_access
	name = "纳米传讯安保覆盖终端"
	desc = "用于生成安全覆盖代码。"
	icon = 'icons/obj/structures/campaign/tall_structures.dmi'
	icon_state = "terminal_red"
	screen_overlay = "terminal_overlay"
	circuit = /obj/item/circuitboard/computer/nt_access
	use_power = NO_POWER_USE
	layer = ABOVE_MOB_LAYER
	ui_style = "NtAccessTerminal"

	segment_time = 1 MINUTES
	start_time = 5 SECONDS
	total_segments = 5

	technobabble = list(
		"Booting up terminal-  -Terminal running",
		"Establishing link to planetary mainframe- Link established",
		"WARNING, DIRECTORY CORRUPTED, running search algorithms- lockdown_override.exe found",
		"Invalid credentials, upgrading permissions through SOM rootkit- Permissions upgraded, lockdown_override.exe available",
		"lockdown_override.exe running - Generating new security lockdown override code",
		"Security lockdown override code sent to NT installation: Aubrey Gamma 16. Have a nice day."
	)

/obj/machinery/computer/code_generator/nt_access/Initialize(mapload)
	. = ..()
	GLOB.campaign_structures += src

/obj/machinery/computer/code_generator/nt_access/Destroy()
	GLOB.campaign_structures -= src
	return ..()

/obj/machinery/computer/code_generator/nt_access/update_icon_state()
	return

/obj/machinery/computer/code_generator/nt_access/start_segment(mob/user)
	. = ..()
	if(!.)
		return
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_CAMPAIGN_NT_OVERRIDE_RUNNING, src)

/obj/machinery/computer/code_generator/nt_access/complete_segment()
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_CAMPAIGN_NT_OVERRIDE_STOP_RUNNING, src)
	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	deltimer(current_timer)
	current_timer = null
	completed_segments = min(completed_segments + 1, total_segments)
	update_minimap_icon()
	running = FALSE

	if(completed_segments == total_segments)
		visible_message(span_notice("[src] 发出哔哔声，表示安全覆盖代码已准备就绪，可以发送。"))
		return

	visible_message(span_notice("[src] 发出哔哔声，其程序需要关注。"))

/obj/machinery/computer/code_generator/nt_access/start_final(mob/user)
	busy = TRUE

	user.visible_message("[user] 启动了发送 [key_color] 安全覆盖指令的程序。", "You started a program to send the [key_color] security override command.")
	if(!do_after(user, start_time, NONE, src, BUSY_ICON_GENERIC, null, null, CALLBACK(src, TYPE_PROC_REF(/datum, process))))
		busy = FALSE
		return

	visible_message(span_notice("[src] 在发送完安全覆盖指令后发出哔哔声。"))
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_CAMPAIGN_NT_OVERRIDE_CODE, key_color)
	busy = FALSE
	set_disabled()

/obj/machinery/computer/code_generator/nt_access/red
	name = "红色纳米传讯安保覆盖终端"
	key_color = MISSION_CODE_RED

/obj/machinery/computer/code_generator/nt_access/green
	name = "绿色纳米传讯安保超控终端"
	icon_state = "terminal_green"
	key_color = MISSION_CODE_GREEN

/obj/machinery/computer/code_generator/nt_access/blue
	name = "蓝色纳米传讯安保超控终端"
	icon_state = "terminal_blue"
	key_color = MISSION_CODE_BLUE
