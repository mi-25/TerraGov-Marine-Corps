#define DISK_CYCLE_REWARD_MIN 100
#define DISK_CYCLE_REWARD_MAX 300


// -- Print disk computer
/obj/item/circuitboard/computer/nuke_disk_generator
	name = "电路板（核弹盘生成器）"
	build_path = /obj/machinery/computer/code_generator/nuke

/obj/machinery/computer/code_generator/nuke
	name = "核弹盘生成器"
	desc = "用于获取核认证码并将其打印到磁盘上的安全终端。"
	icon_state = "computer"
	screen_overlay = "nuke_red"
	broken_icon = "computer_red_broken"
	interaction_flags = INTERACT_MACHINE_TGUI
	circuit = /obj/item/circuitboard/computer/nuke_disk_generator
	technobabble = list(
		"Booting up terminal-  -Terminal running",
		"Establishing link to offsite mainframe- Link established",
		"WARNING, DIRECTORY CORRUPTED, running search algorithms- nuke_fission_timing.exe found",
		"Invalid credentials, upgrading permissions through TGMC military override- Permissions upgraded, nuke_fission_timing.exe available",
		"Downloading nuke_fission_timing.exe to removable storage- nuke_fission_timing.exe downloaded to floppy disk, getting ready to print",
		"Program downloaded to disk. Have a nice day."
	)
	///The type of disk we're printing
	var/disk_type

/obj/machinery/computer/code_generator/nuke/Initialize(mapload)
	. = ..()

	if(!disk_type)
		WARNING("disk_type is required to be set before init")
		return INITIALIZE_HINT_QDEL

	GLOB.nuke_disk_generators += src
	RegisterSignal(SSdcs, COMSIG_GLOB_DROPSHIP_HIJACKED, PROC_REF(set_broken))

/obj/machinery/computer/code_generator/nuke/Destroy()
	GLOB.nuke_disk_generators -= src
	return ..()

/obj/machinery/computer/code_generator/nuke/complete_segment()
	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	deltimer(current_timer)
	current_timer = null
	completed_segments = min(completed_segments + 1, total_segments)

	update_minimap_icon()
	running = FALSE

	if(completed_segments == total_segments)
		say("程序检索成功。待命打印中...")
		return

	say("程序运行已结束！待命中...")

	if(iscrashgamemode(SSticker.mode))
		if(iszombiecrashgamemode(SSticker.mode))
			global_rally_zombies(src, TRUE)
		for(var/mob/living/carbon/human/human AS in GLOB.human_mob_list)
			if(!human.job)
				continue
			var/obj/item/card/id/user_id =  human.get_idcard()
			if(!user_id)
				continue
			for(var/i in user_id.marine_points)
				user_id.marine_points[i] += 2
		return

	// Requisitions points bonus per cycle.
	var/disk_cycle_reward = DISK_CYCLE_REWARD_MIN + ((DISK_CYCLE_REWARD_MAX - DISK_CYCLE_REWARD_MIN) * (SSmonitor.maximum_connected_players_count / HIGH_PLAYER_POP))
	disk_cycle_reward = ROUND_UP(clamp(disk_cycle_reward, DISK_CYCLE_REWARD_MIN, DISK_CYCLE_REWARD_MAX))

	SSpoints.supply_points[FACTION_TERRAGOV] += disk_cycle_reward
	SSpoints.dropship_points += disk_cycle_reward/10
	GLOB.round_statistics.points_from_objectives += disk_cycle_reward

	say("程序执行已奖励 [disk_cycle_reward] 补给点！")

/obj/machinery/computer/code_generator/nuke/start_final(mob/user)
	busy = TRUE

	user.visible_message(span_notice("[user] 将一张软盘插入 [src] 并开始输入……"),
	span_notice("You insert a floppy disk into the [src] and begin to type..."))
	if(!do_after(user, printing_time, NONE, src, BUSY_ICON_GENERIC, null, null, CALLBACK(src, TYPE_PROC_REF(/datum, process))))
		busy = FALSE
		return

	new disk_type(get_turf(src))
	visible_message(span_notice("[src] 哔哔作响，吐出了一张 [key_color] 软盘！"))
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_DISK_GENERATED, src)
	busy = FALSE

/obj/machinery/computer/code_generator/nuke/red
	name = "红色核弹盘生成器"
	disk_type = /obj/item/disk/nuclear/red
	key_color = "red"

/obj/machinery/computer/code_generator/nuke/green
	name = "绿色核弹盘生成器"
	screen_overlay = "nuke_green"
	broken_icon = "computer_broken"
	disk_type = /obj/item/disk/nuclear/green
	key_color = "green"

/obj/machinery/computer/code_generator/nuke/blue
	name = "蓝色核弹盘生成器"
	screen_overlay = "nuke_blue"
	broken_icon = "computer_blue_broken"
	disk_type = /obj/item/disk/nuclear/blue
	key_color = "blue"

//list of disk gens we want to spawn for nuke related gamemodes. Could just use subtypes, but using a list in case more gen related stuff is added in the future
GLOBAL_LIST_INIT(nuke_disk_generator_types, list(
	/obj/machinery/computer/code_generator/nuke/red,
	/obj/machinery/computer/code_generator/nuke/green,
	/obj/machinery/computer/code_generator/nuke/blue,
))

/obj/structure/nuke_disk_candidate
	icon = 'icons/obj/machines/computer.dmi'
	icon_state = "nuke_rand"
	name = "电脑"
	desc = "一台布满灰尘的旧电脑。看起来已经无法使用了。"
	density = TRUE
	anchored = TRUE
	resistance_flags = RESIST_ALL
	///This list contains disk set keys this list as associated with. Keys must be contained in the map's json combined with their weight. Intended to be at least 3 disks per key. Supports more, does NOT support less.
	var/list/set_associations = list("basic") //These are set by mappers via map vars. Setting this one as its base type so people can skip that part if they only have 3 disks on a map.
	///This will FORCE this disk location to exist for these specific sets. Please do not force more than 3 for a set or I will scream at you.
	var/list/force_for_sets = list() //Mapper var. Edit in map.

//Randomised spawn points for nuke disk generators
/obj/structure/nuke_disk_candidate/Initialize(mapload)
	. = ..()
	GLOB.nuke_disk_spawn_locs += src
	icon_state = "computer"

/obj/structure/nuke_disk_candidate/Destroy()
	GLOB.nuke_disk_spawn_locs -= src
	return ..()
