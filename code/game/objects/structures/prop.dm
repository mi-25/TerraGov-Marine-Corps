#define VENDOR_BROKEN "vendor_broken"
#define VENDOR_BLANK "vendor_blank"
//----- Marine ship machinery file -----//
// Put any new machines in here before map is released and everything moved to their proper positions.



//----- Marine ship props -----//
//Put any props that don't function properly, they could function in the future but for now are for looks. This system could be expanded for other maps too. ~Art

/obj/item/prop/mainship
	name = "通用舰船道具"
	desc = "此内容不应可见，如果在游戏回合中看到此信息并附带位置信息，请使用管理员帮助（AHELP）报告，代码为'ART-P03'。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "hangarbox"

/obj/machinery/prop/mainship
	name = "通用舰船道具"
	desc = "此内容不应可见，如果在回合中看到此内容并附带位置信息，请使用管理帮助（AHELP）报告'ART-P01'。"
	coverage = 15

/obj/machinery/prop/structurelattice
	name = "结构晶格"
	desc = "就像钢筋，但在太空里。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "structure_lattice"
	coverage = 50
	max_integrity = 750
	resistance_flags = XENO_DAMAGEABLE


/obj/machinery/prop/fuel_enhancer
	name = "燃料增效剂"
	desc = "一种用于运输船的燃料增强系统。它能提升燃料燃烧产生的推力，以实现更快速的航行。可安装在引擎连接点内。需要使用动力装载机来搬运。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "fuel_enhancer"
	coverage = 25
	max_integrity = 350
	resistance_flags = XENO_DAMAGEABLE


/obj/machinery/prop/mainship/hangar/dropship_part_fabricator

/obj/machinery/prop/computer
	name = "系统计算机"
	desc = "连接至舰船系统的小型计算机。"

	density = FALSE
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 20

	icon = 'icons/obj/machines/computer.dmi'
	icon_state = "computer_small"
	light_range = 1
	light_power = 0.5
	light_color = LIGHT_COLOR_BLUE
	///The actual screen sprite for this computer
	var/screen_overlay = "terminal_misc"
	///The destroyed computer sprite. Defaults based on the icon_state if not specified
	var/broken_icon

/obj/machinery/prop/computer/Initialize(mapload)
	. = ..()
	if(!broken_icon)
		broken_icon = "[initial(icon_state)]_broken"
	update_icon()

/obj/machinery/prop/computer/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			qdel(src)
		if(EXPLODE_HEAVY)
			if (prob(25))
				qdel(src)
				return
			if (prob(50))
				set_broken()
		if(EXPLODE_LIGHT)
			if (prob(25))
				set_broken()
		if(EXPLODE_WEAK)
			if (prob(15))
				set_broken()

/obj/machinery/prop/computer/proc/set_broken()
	machine_stat |= BROKEN
	update_icon()

/obj/machinery/prop/computer/update_icon()
	. = ..()
	if(machine_stat & (BROKEN|DISABLED|NOPOWER))
		set_light(0)
	else
		set_light(initial(light_range))

/obj/machinery/prop/computer/update_icon_state()
	. = ..()
	if(machine_stat & (BROKEN|DISABLED))
		icon_state = "[initial(icon_state)]_broken"
	else
		icon_state = initial(icon_state)

/obj/machinery/prop/computer/update_overlays()
	. = ..()
	if(!screen_overlay)
		return
	if(machine_stat & (BROKEN|DISABLED|NOPOWER))
		return
	. += emissive_appearance(icon, screen_overlay, src, alpha = src.alpha)
	. += mutable_appearance(icon, screen_overlay, alpha = src.alpha)

/obj/machinery/prop/computer/PC
	name = "个人终端"
	desc = "一台连接至舰船计算机网络的小型计算机。"
	icon_state = "terminal"
	screen_overlay = "terminal1"

/obj/machinery/prop/computer/aiupload
	name = "\improper AI上传控制台"
	desc = "用于上传法律至人工智能。"

	icon_state = "computer"
	screen_overlay = "aiupload"
	broken_icon = "computer_blue_broken"

/obj/machinery/prop/computer/dna
	icon_state = "computer"
	screen_overlay = "dna"
	broken_icon = "computer_blue_broken"

/obj/structure/prop/mainship/massdiver
	name = "质量驱动器"
	desc = "采用最先进的弹簧活塞玩具技术，现已登陆您附近的太空站。"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "mass_driver"

/obj/structure/prop/mainship/shieldwall
	name = "护盾墙发生器"
	desc = "一个护盾发生器。"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "shield_wall_gen"

/obj/structure/prop/mainship/dnascanner
	name = "\improper DNA扫描仪"
	desc = "它扫描DNA结构。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "scanner"

/obj/structure/prop/mainship/gateway
	name = "传送门"
	desc = "一座由未知之手建造的神秘传送门，它能实现超光速旅行，通往遥远之地。"
	icon = 'icons/obj/gateway.dmi'
	icon_state = "portal_frame"

/obj/structure/prop/mainship/gravitygenerator
	name = "重力发生器"
	desc = "一种在部署时能产生引力子场的装置。"
	icon = 'icons/obj/gravity_generator.dmi'
	icon_state = "on_8"

/obj/structure/prop/mainship/holobarrier
	name = "\improper 工程全息屏障"
	desc = "这项受资助的企业设计奇迹，这种全息屏障几乎完全抵抗大气流失以及近战或弹道损伤造成的退化。它也是由太空石棉制成，根据新版日内瓦公约属于非法。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "holosign_engi"
	density = TRUE
	resistance_flags = RESIST_ALL

/obj/structure/prop/mainship/gravestone
	name = "墓碑"
	desc = "这是一块墓碑，用于标记重要人物的埋葬地点。按F键向逝者致敬。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "gravestone1"
	density = TRUE
	resistance_flags = RESIST_ALL

/obj/structure/prop/mainship/gravestone/two
	icon_state = "gravestone2"

/obj/structure/prop/mainship/gravestone/three
	icon_state = "gravestone3"

/obj/structure/prop/mainship/holobarrier/passthrough
	name = "\improper 压力密封全息屏障"
	icon = 'icons/effects/effects.dmi'
	icon_state = "shield-blue"
	density = FALSE

/obj/structure/prop/mainship/deadai
	name = "\improper 已停用的人工智能"
	desc = "一台标准的硅基单元，被指派负责纳米传讯空间站的研究任务。这台已完全停用。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "ai_dead"
	density = TRUE
	resistance_flags = RESIST_ALL


/obj/structure/prop/mainship/deadai/Initialize(mapload)
	. = ..()
	icon_state = pick(
		"ai_dead",
		"ai-alien_dead",
		"ai-banned_dead",
		"ai-clown_dead",
		"ai-database_dead",
		"ai-glitchman_dead",
		"ai-goon_dead",
		"ai-house_dead",
		"ai-monochrome_dead",
		"ai-red_dead",
		"ai-red october_dead",
		"ai-static_dead",
		"ai-hades_dead",
	)

/obj/structure/prop/mainship/weapon_recharger
	name = "充能器"
	desc = "能量武器、PDA及其他设备的充电坞。闪烁的小灯表明此充电器无法使用。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "weapon_recharger"
	density = FALSE

//RND Props
/obj/machinery/prop/r_n_d/protolathe
	name = "原型制造机"
	icon = 'icons/obj/machines/research.dmi'
	desc = "原型制造机，过去曾用于打印工具等物品。"
	icon_state = "protolathe"

/obj/machinery/prop/computer/rdconsole
	name = "\improper 研发控制台"
	icon = 'icons/obj/machines/computer.dmi'
	desc = "研究控制台。"
	icon_state = "computer"
	screen_overlay = "rdcomp"
	broken_icon = "computer_blue_broken"

/obj/machinery/prop/r_n_d/server
	name = "\improper 研发服务器"
	icon = 'icons/obj/machines/research.dmi'
	desc = "研究服务器。"
	icon_state = "server"

/obj/machinery/prop/computer/rdservercontrol
	name = "\improper 研发服务器控制器"
	icon = 'icons/obj/machines/computer.dmi'
	desc = "负责所有研究工作。"
	icon_state = "computer"
	screen_overlay = "rdcomp"
	broken_icon = "computer_blue_broken"

/obj/machinery/prop/computer/communications
	name = "通讯控制台"
	desc = "这可用于各种重要功能。"
	screen_overlay = "comm"
	icon = 'icons/obj/machines/computer.dmi'

/obj/machinery/prop/computer/crew
	name = "船员监控计算机"
	desc = "用于监控大多数船员制服内置的活性生命体征传感器。"
	icon_state = "computer"
	screen_overlay = "crew"
	icon = 'icons/obj/machines/computer.dmi'

/obj/machinery/prop/r_n_d/server/alt
	name = "备用研发服务器"
	icon = 'icons/obj/machines/research.dmi'
	desc = "研究服务器。"
	icon_state = "server_alt"
//End RND props

//Nonpower using props

/obj/structure/prop/mainship
	name = "通用舰船道具"
	desc = "此内容不应可见，如果在回合中看到此内容并附带位置信息，请使用管理员帮助（AHELP）报告'ART-P02'。"
	density = TRUE
	anchored = TRUE
	coverage = 15

/obj/machinery/prop/autolathe
	name = "\improper 自动制造机"
	desc = "它过去曾用金属和玻璃制造物品。"
	icon_state = "autolathe"
	coverage = 30
	density = TRUE
	anchored = TRUE

/obj/structure/prop/mainship/minigun_crate
	name = "30毫米弹药板条箱"
	desc = "装满30毫米弹药的板条箱，用于登陆艇的某种武器吊舱。搬运它需要某种起重设备。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "30mm_crate"


/obj/structure/prop/mainship/mission_planning_system
	name = "\improper MPS IV 计算机"
	desc = "任务规划系统IV（MPS IV），是地球政府殖民地海军陆战队所有运输机飞行员在任务规划与航图绘制方面的一项增强。该系统完全能够根据作战需求，定制飞行路线和载荷配置。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "mps"

/obj/structure/prop/mainship/mission_planning_system/white
	icon_state = "mps_w"

/obj/structure/prop/mainship/mission_planning_system/black
	icon_state = "blackmps_b"

/obj/structure/prop/mainship/mapping_computer
	name = "\improper CMPS II 计算机"
	desc = "通用制图生产系统II型允许从卫星和舰船系统接收感官输入，以标准化的方式为所有地球政府殖民地海军陆战队飞行员生成行星地图。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "mapping_comp"

/obj/structure/prop/mainship/mapping_computer/white
	icon_state = "mapping_comp_w"

/obj/structure/prop/mainship/mapping_computer/black
	icon_state = "blackmapping_b_comp"

/obj/structure/prop/mainship/sensor_computer1
	name = "传感器计算机"
	desc = "这台IBM系列10计算机经过改装，用作舰船传感器计算机。虽然有些过时，但它仍能胜任其职责。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "sensor_comp1"

/obj/structure/prop/mainship/sensor_computer1/white
	icon_state = "sensor_comp_w"

/obj/structure/prop/mainship/sensor_computer1/black
	icon_state = "blacksensor_comp_b1"

/obj/structure/prop/mainship/sensor_computer1/sd
	name = "自毁状态计算机"

/obj/structure/prop/mainship/sensor_computer2
	name = "传感器计算机"
	desc = "经过改装用作舰船传感器计算机的IBM系列10型计算机。虽然有些过时，但仍能胜任其职责。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "sensor_comp2"

/obj/structure/prop/mainship/sensor_computer2/white
	icon_state = "sensor_comp_w2"

/obj/structure/prop/mainship/sensor_computer2/black
	icon_state = "blacksensor_comp_b2"

/obj/structure/prop/mainship/sensor_computer2/sd
	name = "自毁调节器"

/obj/structure/prop/mainship/sensor_computer3
	name = "传感器计算机"
	desc = "经过改装用作舰船传感器计算机的IBM系列10型计算机。虽然有些过时，但它仍能胜任其职责。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "sensor_comp3"

/obj/structure/prop/mainship/sensor_computer3/white
	icon_state = "sensor_comp_w3"

/obj/structure/prop/mainship/sensor_computer3/black
	icon_state = "blacksensor_comp_b3"

/obj/structure/prop/mainship/sensor_computer3/sd
	name = "温度调节器"

/obj/structure/prop/mainship/missile_tube
	name = "\improper Mk 33 反卫星发射器系统"
	desc = "冷发射管，可发射多种导弹。最常见的是用于攻击卫星和其他航天器的ASAAR-21'利剑IV'导弹，以及用于对地攻击的BGM-227'大锤'导弹。"
	icon = 'icons/obj/structures/prop/mainship_96.dmi'
	icon_state = "missiletubenorth"
	bound_width = 32
	bound_height = 96
	resistance_flags = UNACIDABLE

/obj/structure/prop/mainship/missile_tube/south
	icon_state = "missiletubesouth"

/obj/structure/prop/mainship/ship_memorial
	name = "胜利石板"
	desc = "一座纪念TGMC胜利和本舰阵亡陆战队员的舰船纪念碑。左侧石板上镌刻着辉煌的胜利史诗。右侧则列有为TGMC服役而战死的著名陆战队员名单。"
	icon = 'icons/obj/structures/prop//mainship_64.dmi'
	icon_state = "ship_memorial"
	bound_width = 64
	bound_height = 32
	resistance_flags = UNACIDABLE
	allow_pass_flags = NONE
	var/list/fallen_list

/obj/structure/prop/mainship/ship_memorial/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/dogtag))
		var/obj/item/dogtag/D = I
		if(D.fallen_names)
			to_chat(user, span_notice("你将[D]添加到[src]。"))
			if(!fallen_list)
				fallen_list = list()
			fallen_list += D.fallen_names
			qdel(D)
		return TRUE
	return ..()

/obj/structure/prop/mainship/ship_memorial/examine(mob/user)
	. = ..()
	if((isobserver(user) || ishuman(user)) && fallen_list)
		var/faltext = ""
		for(var/i = 1 to length(fallen_list))
			if(i != length(fallen_list))
				faltext += "[fallen_list[i]], "
			else
				faltext += fallen_list[i]
		. += "[span_notice("To our fallen marines:")] <b>[faltext]</b>."


/obj/structure/prop/mainship/particle_cannon
	name = "\improper 75厘米/140型马克74通用原子公司导轨炮"
	desc = "Mark 74 导轨炮是太空武器的顶尖产品。能够以每秒24公里的速度发射直径达四分之三米的炮弹。它还配备了全新设计的供弹系统，可以随时更换多种不同类型的弹种。"
	icon = 'icons/obj/machines/artillery.dmi'
	icon_state = "1"
	resistance_flags = UNACIDABLE


/obj/structure/prop/mainship/name_stencil
	name = "\improper TGMC，一艘TGMC级陆战队携带者武库舰"
	desc = "船体上印刻的船名。"
	icon = 'icons/obj/structures/prop/mainship_64.dmi'
	icon_state = "TGMC1"
	density = FALSE
	plane = FLOOR_PLANE
	layer = LOWER_RUNE_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	resistance_flags = UNACIDABLE

/obj/structure/prop/mainship/name_stencil/T
	icon_state = "TGMC1"

/obj/structure/prop/mainship/name_stencil/G
	icon_state = "TGMC2"

/obj/structure/prop/mainship/name_stencil/M
	icon_state = "TGMC3"

/obj/structure/prop/mainship/name_stencil/C
	icon_state = "TGMC4"

/obj/structure/prop/mainship/name_stencil/Initialize(mapload)
	. = ..()
	name = SSmapping.configs[SHIP_MAP].map_name


/obj/structure/prop/mainship/hangar_stencil
	name = "地板"
	desc = "机库地板上喷涂的大型编号，用于标识所属的运输机。"
	icon = 'icons/obj/structures/prop/mainship_96.dmi'
	icon_state = "dropship1"
	density = FALSE
	plane = FLOOR_PLANE
	layer = LOWER_RUNE_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/mainship/hangar_stencil/two
	icon_state = "dropship2"

/obj/structure/prop/mainship/hangar_stencil/three
	icon_state = "dropship3"

/obj/structure/prop/mainship/brokengen //all the aesthetics of having a generator without any of the function
	name = "\improper G-11地热发电机"
	desc = "一台热电发电机坐落在充满等离子体的钻孔上方。电池缺失，状态面板上滚动着奇怪的文字，你感觉这东西已经无法修复了。"
	icon = 'icons/turf/geothermal.dmi'
	icon_state = "destroyedgen"
	resistance_flags = RESIST_ALL //normal generators can't be destroyed, so for appearances our fake ones can't be destroyed either.

/obj/structure/prop/mainship/cannon_cables
	name = "\improper 火炮电缆"
	desc = "一些粗大的电缆。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "cannon_cables"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = BELOW_OBJ_LAYER

/obj/structure/prop/mainship/supermatter //functionally inert, but will consume mobs and objects
	name = "超物质晶体"
	desc = "一块奇特的半透明虹彩水晶。"
	icon = 'icons/obj/structures/prop/mainship_64.dmi'
	icon_state = "darkmatter"
	layer = BELOW_OBJ_LAYER
	light_range = 4
	resistance_flags = RESIST_ALL //no delaminations here


/obj/structure/prop/mainship/supermatter/proc/consume(atom/movable/consumed_object) //dust() and destroy living mobs, qdel thrown objects
	if(isliving(consumed_object))
		var/mob/living/consumed_mob = consumed_object
		consumed_mob.dust() //dust() plays a dusting animation and sets the mob to dead
	else if(isobj(consumed_object))
		qdel(consumed_object) //we cannot dust() objects so we just delete them

/obj/structure/prop/mainship/supermatter/Bumped(atom/movable/hit_object)
	if(isliving(hit_object)) //living objects get a nifty message about heat
		hit_object.visible_message(span_danger("\The [hit_object] 猛烈撞击 \the [src] 引发了共振……[hit_object.p_their()] 的身体开始发光并燃起火焰，随后化为灰烬！"),
			span_userdanger("You slam into \the [src] as your ears are filled with unearthly ringing. Your last thought is \"Oh, fuck.\""),
			span_hear("You hear an unearthly noise as a wave of heat washes over you."))
	else if(isobj(hit_object) && !iseffect(hit_object))
		hit_object.visible_message(span_danger("\The [hit_object] 撞上 \the [src] 并迅速化为灰烬。"), null,
			span_hear("You hear a loud crack as you are washed with a wave of heat."))
	else
		return

	playsound(get_turf(src), 'sound/effects/supermatter.ogg', 50, TRUE)
	consume(hit_object) //all bumped objects get consume() called on them

/obj/structure/prop/mainship/radiationcollector
	name = "辐射收集器阵列"
	desc = "一种利用辐射和等离子体产生能量的装置。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "radcollector"
	layer = BELOW_OBJ_LAYER
	resistance_flags = RESIST_ALL

/obj/structure/prop/mainship/invincibleshutter
	name = "\improper 重型防护板"
	desc = "一套厚重的防爆百叶窗。"
	icon = 'icons/obj/doors/mainship/blastdoors_shutters.dmi'
	icon_state = "shutter1"
	density = TRUE
	layer = BELOW_OBJ_LAYER
	light_range = 4
	resistance_flags = RESIST_ALL //no delaminations here
	allow_pass_flags = NONE
	opacity = TRUE

/obj/structure/prop/mainship/doorblocker //doors that exist only to block access, used mostly for valhalla omegastation
	name = "\improper 气闸门已封锁"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	resistance_flags = RESIST_ALL
	allow_pass_flags = NONE
	desc = "它打开又关上。"
	opacity = TRUE

/obj/structure/prop/mainship/doorblocker/maint
	name = "\improper 维护舱口"
	icon_state = "maint_locked"

/obj/structure/prop/mainship/doorblocker/external
	name = "\improper 外部气闸门"
	icon_state = "exit_locked"

/obj/structure/prop/mainship/doorblocker/engi
	name = "\improper 外部气闸门"
	icon_state = "engi_locked"

/obj/structure/prop/mainship/doorblocker/evac
	name = "\improper 撤离气闸"
	icon_state = "secure_locked"

/obj/structure/prop/mainship/doorblocker/command
	name = "\improper 指挥气闸"
	icon_state = "command_locked"

/obj/structure/prop/mainship/doorblocker/patrol_base
	name = "\improper 主气闸门"
	icon_state = "command_locked"

/obj/structure/prop/mainship/doorblocker/patrol_base/som
	icon_state = "security_locked"

/obj/structure/prop/mainship/doorblocker/patrol_base/wide_left
	icon_state = "secure_wide_left_locked"

/obj/structure/prop/mainship/doorblocker/patrol_base/wide_right
	icon_state = "secure_wide_right_locked"

/obj/structure/prop/mainship/telecomms
	name = "子空间广播器"
	desc = "一种强大的硬件设备，用于广播处理过的子空间信号。"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "broadcaster_send"

/obj/structure/prop/mainship/telecomms/hub
	name = "子空间广播器"
	desc = "一款用于发送/接收海量数据的强大硬件设备。"
	icon = 'icons/obj/machines/telecomms.dmi'
	icon_state = "hub"

/obj/structure/prop/mainship/telecomms/processor
	name = "处理器单元"
	desc = "这台机器用于处理大量信息。"
	icon = 'icons/obj/machines/telecomms.dmi'
	icon_state = "processor"

/obj/structure/prop/mainship/telecomms/bus
	name = "巴士主框架"
	desc = "一款用于快速传输海量数据的强大硬件设备。"
	icon = 'icons/obj/machines/telecomms.dmi'
	icon_state = "bus"

/obj/structure/prop/mainship/telecomms/broadcaster
	name = "子空间广播器"
	desc = "这台机器呈碟状，带有绿色指示灯。它用于探测和处理子空间无线电活动。"
	icon = 'icons/obj/machines/telecomms.dmi'
	icon_state = "broadcaster"

/obj/structure/prop/mainship/telecomms/receiver
	name = "子空间接收器"
	desc = "一种碟形机器，用于广播处理过的子空间信号。"
	icon = 'icons/obj/machines/telecomms.dmi'
	icon_state = "broadcast receiver"

/obj/structure/prop/mainship/telecomms/relay
	name = "通讯中继站"
	desc = "一款强大的硬件设备，用于远距离传输海量数据。"
	icon = 'icons/obj/machines/telecomms.dmi'
	icon_state = "relay"


/obj/structure/prop/mainship/suit_storage_prop
	name = "装备储存单元"
	desc = "一个工业级U-Stor-It存储单元，设计用于容纳各类太空服。其内置设备还允许用户通过紫外线净化循环对内部物品进行消毒。控制面板上悬挂着一个警告标签，写着'单元内部严禁存放生化物品'。这个单元似乎处于磁力锁定状态。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "suitstorageclose"

/obj/structure/prop/mainship/protolathe
	name = "装备储存单元"
	desc = "一台用于处理数据并生产部门专用工具的大型机器。一盏标有'服务器连接'的小型警告灯正在闪烁红光。"
	icon = 'icons/obj/machines/research.dmi'
	icon_state = "protolathe"

/obj/structure/prop/mainship/protolathe/engi
	name = "工程原型机"

/obj/structure/prop/mainship/protolathe/sci
	name = "研究用原型机"

/obj/structure/prop/mainship/protolathe/medical
	name = "医疗原型机"

/obj/structure/prop/mainship/protolathe/security
	name = "安保原型机"

/obj/structure/prop/mainship/protolathe/service
	name = "服务型原型机"

/obj/structure/prop/mainship/protolathe/cargo
	name = "货物原型机"

/obj/structure/prop/mainship/cannon_cables/ex_act()
	return

/obj/structure/prop/mainship/research
	icon = 'icons/obj/machines/research.dmi'

/obj/structure/prop/mainship/research/circuit_imprinter
	name = "电路印刷机"
	icon_state = "circuit_imprinter"
	desc = "制造用于建造机器的电路板。"

/obj/structure/prop/mainship/research/mechafab
	icon_state = "mechfab1"
	name = "外骨骼装配机"
	desc = "没有正在建造的东西。"

/obj/structure/prop/mainship/research/destructive_analyzer
	name = "破坏性分析仪"
	desc = "通过摧毁来学习科学！"
	icon_state = "d_analyzer"

/obj/structure/prop/mainship/research/tdoppler
	name = "超光速多普勒阵列"
	desc = "一种高精度的定向传感器阵列，用于测量衰变快子释放的量子。这些量子形成的镜像多普勒频移可以揭示阵列前方大范围内能量扰动的大小、位置和时间效应。"
	icon_state = "tdoppler"

/obj/structure/prop/mainship/research/explosivecompressor
	name = "异常精炼厂"
	desc = "一台能够通过内爆压缩原始异常核心制成成品神器的高级机器。同时配备了最先进的爆炸预测软件。"
	icon_state = "explosive_compressor"

/obj/structure/prop/mainship/research/tankcompressor
	name = "储罐压缩机"
	desc = "重型屏蔽式空气压缩机，设计用于将储罐加压至安全限值以上。"
	icon_state = "tank_compressor-open"

/obj/structure/prop/mainship/generator
	name = "力场发生器"
	desc = "一个大型热能电池，通电时可释放大量能量。"
	icon = 'icons/obj/machines/field_generator.dmi'
	icon_state = "Field_Gen"
	anchored = FALSE
	density = TRUE
	max_integrity = 500
	//100% immune to lasers and energy projectiles since it absorbs their energy.
	soft_armor = list(MELEE = 25, BULLET = 10, LASER = 100, ENERGY = 100, BOMB = 0, BIO = 0, FIRE = 50, ACID = 70)
	resistance_flags = RESIST_ALL

/obj/structure/prop/mainship/generator/shieldgen
	name = "防破盾护盾投射器"
	desc = "用于密封小型船体裂缝。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "shieldoff"

/obj/structure/prop/mainship/generator/tesla_coil
	name = "特斯拉线圈"
	desc = "为了联盟！"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "coil_open0"

/obj/structure/prop/mainship/generator/ground_rod
	name = "接地棒"
	desc = "防止区域被爱迪生之灾烧毁，对民间武装常用的手持特斯拉炮无效。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "grounding_rod_open0"

/obj/structure/prop/mainship/cannon_cable_connector
	name = "\improper 火炮电缆连接器"
	desc = "大型火炮电缆的连接器。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "cannon_cable_connector"
	density = TRUE

/obj/structure/prop/mainship/reflector
	name = "\improper 反射器"
	desc = "用于反射激光束的棱镜。"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "reflector_prop"
	density = TRUE
	anchored = FALSE
	resistance_flags = XENO_DAMAGEABLE

/obj/structure/prop/mainship/cannon_cable_connector/ex_act()
	return

/obj/structure/prop/mainship/prop_sec
	name = "安全官"
	desc = "一名纳米传讯安保人员正在警戒周边。他们看起来相当忙碌，没注意到你。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "secprop"
	resistance_flags = RESIST_ALL
	density = TRUE

/obj/structure/prop/mainship/prop_so
	name = "军官"
	desc = "负责当前行动的参谋军官，要么正忙于操作监控台，要么只是看着你和你的战友们，希望你们能够成功。话虽如此，最好还是别打扰他们。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "officerprop"
	resistance_flags = RESIST_ALL
	density = TRUE

/obj/structure/prop/mainship/prop_so/som
	icon_state = "officersomprop"

/obj/structure/prop/mainship/prop_tech
	name = "技术员"
	desc = "一位辛勤工作的技术员，负责维护基地的车辆以及基地本身。他们现在似乎正忙于调查某件事。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "techieprop"
	resistance_flags = RESIST_ALL
	density = TRUE

/obj/structure/prop/mainship/prop_tech/som
	name = "火星之子技术员"
	desc = "一名辛勤工作的火星之子技术员，负责维护基地的载具以及基地本身。他们此刻似乎正忙于调查某件事。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "SOM_technician"

/obj/structure/prop/mainship/prop_tech/som/alt
	icon_state = "SOM_technician_2"

/obj/structure/prop/mainship/prop_sominf
	name = "火星之子步兵"
	desc = "手持V-31突击步枪的标准火星之子步兵。虽然他们的面容被面罩遮蔽，但感觉你应该继续前进，而不是在此逗留。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "som_inf"
	resistance_flags = RESIST_ALL
	density = TRUE

/obj/structure/prop/mainship/prop_sominf/heavy
	name = "火星之子重装步兵"
	desc = "手持VX-32充能枪的重型火星之子步兵。虽然他们的面容被面罩遮蔽，但感觉你应该继续前进，而不是在此逗留。"
	icon_state = "SOM_heavy_armed"

/obj/structure/prop/mainship/prop_sominf/heavy/unarmed
	name = "火星之子重装步兵"
	desc = "重型火星之子步兵。最好别管他们在做什么。"
	icon_state = "SOM_heavy"

/obj/structure/prop/mainship/prop_sominf/lorica
	name = "火星之子重装步兵"
	desc = "身着重型洛里卡装甲的火星之子步兵，手持VX-32充能枪。他们看起来可不是在闹着玩的。"
	icon_state = "lorica_armed"

/obj/structure/prop/mainship/prop_sominf/lorica/unarmed
	name = "火星之子重装步兵"
	desc = "身着重型洛里卡装甲的火星之子步兵。他们看起来相当强悍。"
	icon_state = "lorica"

/obj/structure/prop/mainship/som_scientist
	name = "火星之子科学家"
	desc = "一名勤奋的火星之子科学家类型。看起来正在处理重要事务。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "SOM_scientist"
	resistance_flags = RESIST_ALL
	density = TRUE

/obj/structure/prop/mainship/som_scientist/alt
	icon_state = "SOM_scientist_2"

/obj/structure/prop/tdfcorpse
	name = "地球防卫军陆战队员"
	desc = "一名地球防卫军士兵。他们看起来状态不佳。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "tdfcorpse"
	allow_pass_flags = PASS_LOW_STRUCTURE|PASSABLE
	anchored = FALSE
	layer = ABOVE_OBJ_LAYER
	max_integrity = 100
	hit_sound = list('sound/effects/bone_break1.ogg','sound/weapons/wristblades_hit.ogg')
	coverage = 0

/obj/structure/prop/tdfcorpse/headshot
	desc = "一名地球防卫军士兵。这位看起来已经神志不清了。"
	icon_state = "tdfcorpseheadshot"

/obj/structure/prop/tdfcorpse/decap
	desc = "你的脑袋在哪？（你的脑袋在哪？）（你的脑袋在哪？）"
	icon_state = "tdfcorpsedecap"

/obj/structure/prop/manhole
	name = "检修口"
	desc = "这本来会是个洞，但上面盖了一大块金属板。"
	icon = 'icons/obj/structures/prop/urban/urbanrandomprops.dmi'
	icon_state = "wymanhole"
	allow_pass_flags = PASS_LOW_STRUCTURE|PASSABLE|PASS_WALKOVER
	resistance_flags = PROJECTILE_IMMUNE

/obj/structure/prop/fueltank
	name = "\improper 喷气燃料容器"
	desc = "用于储存大量燃料的容器。"
	icon = 'icons/obj/structures/prop/mainship_96.dmi'
	icon_state = "fueltank"
	bound_width = 96
	bound_height = 32
	density = TRUE
	layer = ABOVE_OBJ_LAYER
	allow_pass_flags = NONE
	resistance_flags = UNACIDABLE
	max_integrity = 500

/obj/structure/prop/fueltank/broken
	name = "\improper 破损的航空燃油容器"
	desc = "用于储存大量燃料的容器。"
	icon_state = "fueltank_broken"
	icon = 'icons/obj/structures/prop/mainship_96.dmi'

/obj/structure/prop/flag
	name = "\improper 地球政府旗帜"
	desc = "一面印有地球政府标志的旗帜。它看起来不像其他旗帜那样鼓舞人心。"
	icon = 'icons/obj/items/flags/plantable_flag_large.dmi'
	icon_state = "flag_tgmc_planted"
	allow_pass_flags = PASS_LOW_STRUCTURE|PASSABLE
	max_integrity = 100
	layer = ABOVE_OBJ_LAYER
	coverage = 0

/obj/structure/prop/flag/som
	name = "\improper 火星之子旗帜"
	desc = "一面印有火星之子标志的旗帜。它看起来不像其他旗帜那样鼓舞人心。"
	icon = 'icons/obj/items/flags/plantable_flag_large.dmi'
	icon_state = "flag_som_planted"

/obj/structure/prop/templedoor
	name = "奇异神庙"
	icon = 'icons/obj/doors/Doorsand.dmi'
	icon_state = "door_open"
	density = FALSE

/obj/structure/prop/oresilo
	name = "核心筒"
	desc = "一个集蓝空间存储与传输于一体的系统，用于满足殖民地的矿物分发需求。这个装置似乎已停用。"
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "silo"
	density = TRUE

/obj/structure/prop/mainship/propcarp
	name = "太空鲤鱼"
	desc = "一种凶猛、长着尖牙、形似鱼类的生物。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "carpprop"
	density = TRUE

/obj/structure/prop/mainship/propcarp/Initialize(mapload) //slightly randomize carp to simulate life
	. = ..()
	var/pickedrotate = pick(0,1,2,4,8,10)
	switch(pickedrotate) //prop carp can randomly move two tiles in any direction
		if(0) //1/6th chance of not moving in a random direction
			return
		if(1)
			dir = NORTH
			pixel_y = 64
		if(2)
			dir = SOUTH
			pixel_y = -64
		if(4)
			dir = EAST
			pixel_x = 64
		if(8)
			dir = WEST
			pixel_x = -64
		if(10)
			qdel(src)
		//remember that each carp must have at least 2 free spaces around them per carp, or they'll glitch into walls and/or each other

/obj/structure/prop/mainship/aislipprop
	name = "泡沫喷射器"
	desc = "一种可远程激活的用于人群控制的泡沫喷洒器。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "aislipper"
	density = FALSE
	resistance_flags = RESIST_ALL

/obj/structure/prop/mainship/turretprop
	name = "激光炮塔"
	desc = "由纳米传讯提供的点防御激光炮塔。这个看起来处于非活动状态。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "turretprop"
	resistance_flags = RESIST_ALL

/obj/structure/prop/mainship/tubeprop
	name = "气动管道"
	desc = "纳米传讯研究站上常用的气动运输管道。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "tubepropstraight"
	resistance_flags = RESIST_ALL
	layer = ABOVE_OBJ_LAYER //so our fake prop can visually pass under glass panels

/obj/structure/prop/mainship/tubeprop/decorative
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "decorative"
	resistance_flags = RESIST_ALL
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/mainship/tubeprop/end
	icon_state = "tubepropend"

/obj/structure/prop/mainship/tubeprop/diagonal
	icon_state = "tubepropdiagonal"

/obj/structure/prop/mainship/tubeprop/decorativediagonal
	icon_state = "decorative_diag"

/obj/structure/prop/mainship/tubeprop/tubejunction
	icon_state = "tubejunction"

/obj/structure/prop/mainship/tubeprop/tubecurved
	icon_state = "tubecurved"

/obj/structure/prop/mainship/meterprop/
	name = "米"
	desc = "那是个气体流量计。它能测量一些东西。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "propmeterempty"
	resistance_flags = RESIST_ALL
	density = FALSE

/obj/structure/prop/mainship/meterprop/empty
	icon_state = "propmeterempty"

/obj/structure/prop/mainship/meterprop/random
	icon_state = "propmeter"
	var/kpa //fake temperatures and pressures for our meter
	var/kelvin

/obj/structure/prop/mainship/meterprop/random/examine(mob/user)
	. = ..()
	. += span_notice("The pressure gauge reads [kpa] kPa; [kelvin] K ([kelvin - 273.15]°C)") //output fake kelvin and celsius on examine

/obj/structure/prop/mainship/meterprop/empty/examine(mob/user)
	. = ..()
	. += span_notice("The pressure gauge reads 0 kPa; 0 K (-273.15°C)") //output fake kelvin and celsius on examine

/obj/structure/prop/mainship/meterprop/random/Initialize(mapload)
	. = ..()
	kpa = randfloat(9.3, 21.4)
	kelvin = randfloat(10.3, 28.4)

/obj/structure/prop/mainship/pipeprop //does not init and so doesn't generate lag at all
	name = "管道"
	desc = "一段一米长的标准管道。"
	icon = 'icons/obj/atmospherics/pipes/simple.dmi'
	icon_state = "pipe11-2"
	density = FALSE
	layer = GAS_PIPE_VISIBLE_LAYER

/obj/structure/prop/mainship/pipeprop/manifold
	name = "管道歧管"
	desc = "由标准管道组成的歧管。"
	icon = 'icons/obj/atmospherics/pipes/manifold.dmi'
	icon_state = "manifold-2"

/obj/structure/prop/mainship/pipeprop/pump
	name = "管道集管"
	desc = "一种通过压力输送气体的泵。"
	icon = 'icons/obj/atmospherics/components/binary_devices.dmi'
	icon_state = "pump_map-2"

/obj/structure/prop/mainship/pipeprop/pump/on
	icon_state = "pump_on"
	layer = GAS_PUMP_LAYER

/obj/structure/prop/mainship/halfbuilt_mech
	name = "半组装机甲"
	desc = "一台半组装状态的机甲。它缺少肢体部件，维护舱口也敞开着。你最好别乱动它。"
	icon_state = ""
	pixel_x = -16
	/// selected parts you want displayed. remove parts if you dont want them
	var/selected_parts = list(
		MECH_GREY_TORSO = MECH_ASSAULT,
		MECH_GREY_LEGS = MECH_ASSAULT,
		MECH_GREY_L_ARM = MECH_ASSAULT,
	)

/obj/structure/prop/mainship/halfbuilt_mech/Initialize(mapload)
	. = ..()
	var/default_colors = MECH_GREY_PRIMARY_DEFAULT + MECH_GREY_SECONDARY_DEFAULT
	var/default_visor = MECH_GREY_VISOR_DEFAULT
	var/new_overlays = list()
	for(var/slot in selected_parts)
		var/datum/mech_limb/head/typepath = get_mech_limb(slot, selected_parts[slot])
		if(slot == MECH_GREY_L_ARM || slot == MECH_GREY_R_ARM)
			var/iconstate = "left"
			if(slot == MECH_GREY_R_ARM)
				iconstate = "right"
			new_overlays += iconstate2appearance(SSgreyscale.GetColoredIconByType(initial(typepath.greyscale_type), default_colors), iconstate)
			continue
		new_overlays += icon2appearance(SSgreyscale.GetColoredIconByType(initial(typepath.greyscale_type), default_colors))
		if(slot == MECH_GREY_HEAD)
			new_overlays += icon2appearance(SSgreyscale.GetColoredIconByType(initial(typepath.visor_config), default_visor))
	overlays = new_overlays

/obj/structure/prop/mainship/halfbuilt_mech/legs
	desc = "腿部。"
	selected_parts = list(
		MECH_GREY_LEGS = MECH_RECON,
	)

/obj/structure/prop/mainship/halfbuilt_mech/vanguard
	selected_parts = list(
		MECH_GREY_TORSO = MECH_VANGUARD,
		MECH_GREY_HEAD = MECH_VANGUARD,
		MECH_GREY_LEGS = MECH_VANGUARD,
		MECH_GREY_L_ARM = MECH_VANGUARD,
	)

/obj/structure/prop/mainship/halfbuilt_mech/vanguard_finished
	name = "先锋机甲"
	desc = "一款先进的先锋底盘机甲。这是军事装备领域的最新进展，仅服役了很短时间，尚未投入大规模生产。"
	selected_parts = list(
		MECH_GREY_TORSO = MECH_VANGUARD,
		MECH_GREY_HEAD = MECH_VANGUARD,
		MECH_GREY_LEGS = MECH_VANGUARD,
		MECH_GREY_L_ARM = MECH_VANGUARD,
		MECH_GREY_R_ARM = MECH_VANGUARD,
	)

/obj/structure/prop/mainship/chimney
	name = "壁炉"
	desc = "一个大型石砖壁炉。"
	icon = 'icons/obj/structures/prop/mainship_64.dmi'
	icon_state = "fireplace"

/obj/structure/prop/mainship/vat
	name = "停滞舱"
	desc = "用于储存人类的大型容器。"
	icon = 'icons/obj/machines/cryogenics2.dmi'
	icon_state = "cell_off"
	hit_sound = 'sound/effects/Glasshit.ogg'
	max_integrity = 120
	resistance_flags = XENO_DAMAGEABLE
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/mainship/vat/full
	icon_state = "cell_off_occupied"

/obj/structure/prop/mainship/vat/broken
	desc = "一个用于储存人类的大型容器。这个看起来已经无法使用了……"
	icon_state = "cell_broken"

/obj/structure/prop/mainship/vat/broken/bloody
	icon_state = "cell_bloody"

//items props

/obj/item/prop
	name = "通用舰船道具"
	desc = "此处不应可见，如果在游戏回合中看到此信息并附带位置信息，请使用管理员求助（AHELP）并注明代码'ART-P03'。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "hangarbox"

/obj/item/prop/organ
	name = "器官"
	desc = "看起来它可能只是掉出来了。它已经腐烂得太厉害，无法重新植入病人体内。"
	icon = 'icons/obj/items/organs.dmi'
	icon_state = "heart"

/obj/item/prop/organ/heart
	name = "心脏"
	icon_state = "heart-off"

/obj/item/prop/organ/brain
	name = "大脑"
	icon_state = "brain1"

/obj/item/prop/organ/appendix
	name = "附录"
	icon_state = "appendix"

/obj/item/prop/organ/lungs
	name = "肺部"
	icon_state = "lungs"

/obj/item/prop/organ/kidneys
	name = "肾脏"
	icon_state = "kidneys"

/obj/item/prop/organ/eyes
	name = "眼睛"
	icon_state = "eyes"

/obj/item/prop/organ/liver
	name = "肝脏"
	icon_state = "liver"

/obj/item/prop/aimodule
	name = "AI模块"
	desc = "用于为AI编程法则的AI模块。"
	icon_state = "std_mod"

/obj/item/prop/aimodule/Initialize(mapload)
	. = ..()
	name = pick("'Safeguard' AI Module'",
				"'OneHuman' AI Module",
				"'ProtectStation' AI Module",
				"'Quarantine' AI Module",
				"'OxygenIsToxicToHumans' AI Module",
				"'Freeform' AI Module",
				"\improper 'Remove Law' AI module",
				"\improper 'Reset' AI module",
				"'Purge' AI Module",
				"'Asimov' Core AI Module",
				"'Asimov++' Core AI Module",
				"'Corporate' Core AI Module",
				"'P.A.L.A.D.I.N. version 3.5e' Core AI Module",
				"'T.Y.R.A.N.T.' Core AI Module",
				"'Robo-Officer' Core AI Module",
				"'Antimov' Core AI Module",
				"'Freeform' Core AI Module",
				"'Mother Drone' Core AI Module",
				"'Robodoctor' Core AI Module",
				"'Reportertron' Core AI Module",
				"'Thermodynamic' Core AI Module",
				"'Live And Let Live' Core AI Module",
				"'Guardian of Balance' Core AI Module",
				"'Station Efficiency' Core AI Module",
				"'Peacekeeper' Core AI Module",
				"'H.O.G.A.N.' Core AI Module",
	)

/obj/item/prop/aicard
	name = "智能卡"
	desc = "人工智能存储设备。专利待批。"
	icon_state = "aicard"

/obj/item/prop/aicard/Initialize(mapload)
	. = ..()
	if(prob(50))
		icon_state = "aicard-404"

/obj/item/prop/dogtag
	name = "约翰·多伊" //generic name
	desc = "一名陆战队员的遗骸，早已逝去，愿他们安息。"
	icon = 'icons/obj/items/card.dmi'
	icon_state = "dogtag"

/obj/item/prop/dogtag/pfcjim
	name = "列兵吉姆的狗牌"
	desc = "不管列兵吉姆是谁，你都希望他能活着出来。"
	icon = 'icons/obj/items/card.dmi'
	icon_state = "dogtag"

/obj/item/prop/dogtag/random/Initialize(mapload)
	. = ..()
	name = GLOB.namepool[/datum/namepool].get_random_name(pick(MALE, FEMALE))

/obj/item/prop/paint
	name = "油漆桶"
	desc = "这是一个油漆桶。"
	icon_state = "paint_empty"
	icon = 'icons/obj/items/items.dmi'

/obj/item/prop/paint/red
	icon_state = "paint_red"

/obj/item/prop/paint/green
	icon_state = "paint_green"

/obj/item/prop/paint/neutral
	icon_state = "paint_neutral"

/obj/item/prop/paint/yellow
	icon_state = "paint_yellow"

/obj/item/prop/paint/black
	icon_state = "paint_black"

/obj/item/prop/paint/white
	icon_state = "paint_white"

/obj/item/prop/paint/blue
	icon_state = "paint_blue"

/obj/item/prop/paint/violet
	icon_state = "paint_violet"

///BROKEN MARINE VENDOR PROPS

/obj/structure/prop/brokenvendor
	name = "\improper 损坏的自动售货机"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	desc = "这台自动售货机的内部结构暴露在外且锈迹斑斑，你感觉这台机器已经没救了。"
	density = TRUE
	resistance_flags = XENO_DAMAGEABLE

/obj/structure/prop/brokenvendor/brokenweaponsrack
	icon_state = "marinearmory-broken"

/obj/structure/prop/brokenvendor/brokenuniformvendor
	name = "\improper 损坏的自动制服柜"
	icon_state = "marineuniform-broken"

/obj/structure/prop/brokenvendor/brokenuniformvendor/specialist
	name = "\improper 损坏的专家装备架"
	icon_state = "specialist-broken"
	desc = "你徒劳地研究着这具锈蚀的残骸，试图弄清这台自动售货机原本的模样，最终意识到这不过是白费力气。"

/obj/structure/prop/brokenvendor/brokenspecialistvendor/sg
	name = "\improper 损坏的自动智能机枪手储物柜"
	icon_state = "marineuniform-broken"

/obj/structure/prop/brokenvendor/brokenspecialistvendor/leader
	name = "\improper 损坏的自动班长装备柜"
	icon_state = "marineuniform-broken"

/obj/structure/prop/brokenvendor/brokenspecialistvendor/corpsman
	name = "\improper 损坏的自动卫生兵储物柜"
	icon_state = "marineuniform-broken"

/obj/structure/prop/brokenvendor/brokenspecialistvendor/engineer
	name = "\improper 损坏的自动工程师储物柜"
	icon_state = "marineuniform-broken"

/obj/structure/prop/brokenvendor/brokenmarinemedvendor
	icon_state = "marinemed-broken"

/obj/structure/prop/brokenvendor/brokennanomedvendor
	icon_state = "med-broken"

/obj/structure/prop/brokenvendor/brokencorpsmanvendor
	icon_state = "corpsmanvendor-broken"

/obj/structure/prop/brokenvendor/engivend
	icon_state = "engivend-broken"

/obj/structure/prop/brokenvendor/surplusclothes
	name = "\improper 损坏的剩余衣物贩卖机"
	icon_state = "surplus_clothes-broken"

/obj/structure/prop/brokenvendor/surplusarmor
	name = "\improper 破损护甲衣物贩卖机"
	icon_state = "surplus_armor-broken"

///BROKEN VEHICLE PROPS
/obj/structure/prop/vehicle
	icon = 'icons/obj/vehicles/64x64.dmi'
	density = TRUE
	resistance_flags = XENO_DAMAGEABLE
	max_integrity = 300
	coverage = 80
	soft_armor = list(MELEE = 0, BULLET = 50, LASER = 50, ENERGY = 65, BOMB = 30, BIO = 100, FIRE = 75, ACID = 0)

/obj/structure/prop/vehicle/van
	name = "范"
	desc = "一辆旧货车，看起来抛锚了。"
	icon_state = "van"
	bound_height = 32
	bound_width = 64

/obj/structure/prop/vehicle/van/Initialize(mapload)
	. = ..()
	if(dir & (NORTH|SOUTH))
		bound_height = 64
		bound_width = 32

/obj/structure/prop/vehicle/van/wreck
	icon_state = "van_wrecked"

/obj/structure/prop/vehicle/truck
	name = "卡车"
	desc = "一辆旧卡车，看起来抛锚了。"
	icon_state = "truck"
	bound_height = 32
	bound_width = 64

/obj/structure/prop/vehicle/truck/Initialize(mapload)
	. = ..()
	setDir(dir)

/obj/structure/prop/vehicle/truck/setDir(newdir)
	. = ..()
	if(dir & (WEST|EAST))
		bound_height = 32
		bound_width = 64
		pixel_x = 0
	else
		bound_height = 64
		bound_width = 32
		pixel_x = -16

/obj/structure/prop/vehicle/truck/damaged
	icon_state = "truck_damaged"

/obj/structure/prop/vehicle/truck/snow
	icon_state = "truck_snow"

/obj/structure/prop/vehicle/truck/truckcargo
	icon_state = "truck_cargo"
	max_integrity = 400

/obj/structure/prop/vehicle/truck/truckcargo/snow
	icon_state = "truck_cargo_snow"

/obj/structure/prop/vehicle/crane
	name = "起重机"
	desc = "一台旧起重机，看起来已经损坏了。"
	icon_state = "crane"
	bound_height = 64
	bound_width = 64
	max_integrity = 400

/obj/structure/prop/vehicle/crane/damaged
	icon_state = "crane_damaged"

/obj/structure/prop/vehicle/crane/wreck
	icon_state = "crane_wreck"

/obj/structure/prop/vehicle/crane/snow
	icon_state = "crane_snow"

/obj/structure/prop/vehicle/crane/cranecargo
	icon_state = "crane_cargo"
	max_integrity = 400

/obj/structure/prop/vehicle/crawler
	name = "爬行者"
	desc = "一台老旧的爬行者，看起来已经损坏了。"
	icon_state = "crawler"
	bound_height = 32
	bound_width = 64
	max_integrity = 400

/obj/structure/prop/vehicle/crawler/crawler_blue
	icon_state = "crawler_crate_b"

/obj/structure/prop/vehicle/crawler/crawler_red
	icon_state = "crawler_crate_r"

/obj/structure/prop/vehicle/crawler/crawler_green
	icon_state = "crawler_crate_g"

/obj/structure/prop/vehicle/crawler/crawler_fuel
	icon_state = "crawler_fuel"

/obj/structure/prop/vehicle/crawler/crawler_cargo
	icon_state = "crawler_cargo"

/obj/structure/prop/vehicle/big_truck
	name = "军用卡车"
	desc = "军用卡车，用于大批量运输装备或人员。"
	icon = 'icons/obj/vehicles/large_truck.dmi'
	icon_state = "truck"
	bound_height = 128
	bound_width = 128
	max_integrity = 700

/obj/structure/prop/vehicle/big_truck/Initialize(mapload)
	. = ..()
	setDir(dir)

/obj/structure/prop/vehicle/big_truck/setDir(dir)
	. = ..()
	if(dir & (NORTH|SOUTH))
		bound_height = 96
		bound_width = 32
		bound_x = 0
		bound_y = -32
		pixel_x = -32
		pixel_y = -32
	else
		bound_height = 32
		bound_width = 96
		bound_x = -32
		bound_y = 0
		pixel_x = -32
		pixel_y = -22

/obj/structure/prop/vehicle/big_truck/flat
	icon_state = "truck_flat"

/obj/structure/prop/vehicle/big_truck/enclosed
	icon_state = "truck_enclosed"

/obj/structure/prop/vehicle/big_truck/wrecked
	icon_state = "truck_wrecked"

/obj/structure/prop/vehicle/big_truck/flat_wrecked
	icon_state = "truck_flat_wrecked"

/obj/structure/prop/vehicle/big_truck/enclosed_wrecked
	icon_state = "truck_enclosed_wrecked"

/obj/structure/prop/vehicle/big_truck/tread
	icon_state = "truck_treads"

/obj/structure/prop/vehicle/big_truck/flat_tread
	icon_state = "truck_flat_treads"

/obj/structure/prop/vehicle/big_truck/enclosed_tread
	icon_state = "truck_enclosed_treads"

/obj/structure/prop/vehicle/big_truck/wrecked_tread
	icon_state = "truck_treads_wrecked"

/obj/structure/prop/vehicle/big_truck/flat_wrecked_tread
	icon_state = "truck_flat_treads_wrecked"

/obj/structure/prop/vehicle/big_truck/enclosed_wrecked_tread
	icon_state = "truck_enclosed_treads_wrecked"

/obj/structure/prop/vehicle/land_rover
	name = "兰德·罗孚"
	desc = "一辆轻型全地形装甲车。比步行强多了。"
	icon = 'icons/obj/vehicles/4x4.dmi'
	icon_state = "land_rover"
	density = TRUE
	allow_pass_flags = PASSABLE|PASS_WALKOVER
	max_integrity = 500

/obj/structure/prop/vehicle/land_rover/Initialize(mapload)
	. = ..()
	setDir(dir)
	var/static/list/connections = list(
		COMSIG_OBJ_TRY_ALLOW_THROUGH = PROC_REF(can_climb_over),
	)
	AddElement(/datum/element/connect_loc, connections)

/obj/structure/prop/vehicle/land_rover/setDir(newdir)
	. = ..()
	switch(dir)
		if(NORTH, SOUTH)
			bound_width = 64
			bound_height = 96
		if(WEST, EAST)
			bound_width = 96
			bound_height = 64

/obj/structure/prop/vehicle/land_rover/machinegun
	name = "装甲越野车"
	desc = "一辆全地形车，带有一些装甲板和一门固定机枪。可惜的是，机枪没有弹药，而且你也没有驾照。"
	icon_state = "land_rover_machinegun"
	max_integrity = 500
	soft_armor = list(MELEE = 0, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 0, BIO = 0, FIRE = 0, ACID = 50)

/obj/structure/prop/vehicle/apc_new
	name = "APC - 雅典娜"
	desc = "一种设计用于在战场上指挥和运输部队的无武装装甲运兵车。不知为何，它沿用了其前代的名字。它的车门是锁着的，而且你大概也不知道怎么开这东西。"
	icon = 'icons/obj/armored/3x3/apc.dmi'
	icon_state = "apc"
	density = TRUE
	allow_pass_flags = PASSABLE|PASS_WALKOVER
	max_integrity = 500
	soft_armor = list(MELEE = 75, BULLET = 75, LASER = 75, ENERGY = 75, BOMB = 25, BIO = 0, FIRE = 0, ACID = 75)

/obj/structure/prop/vehicle/apc_new/Initialize(mapload)
	. = ..()
	setDir(dir)
	var/static/list/connections = list(
		COMSIG_OBJ_TRY_ALLOW_THROUGH = PROC_REF(can_climb_over),
	)
	AddElement(/datum/element/connect_loc, connections)

/obj/structure/prop/vehicle/apc_new/setDir(newdir)
	. = ..()
	switch(dir)
		if(NORTH, SOUTH)
			bound_width = 96
			bound_height = 128
		if(WEST, EAST)
			bound_width = 128
			bound_height = 96

/obj/structure/prop/vehicle/tank
	name = "已退役的TAV - 犀牛"
	desc = "一辆已退役的坦克，所有推进方式均已禁用，入口也已密封。"
	icon = 'icons/obj/structures/prop/tank_vertical.dmi'
	icon_state = "tank_complete"
	bound_height = 128
	bound_width = 128
	resistance_flags = RESIST_ALL
	allow_pass_flags = PASSABLE|PASS_WALKOVER

/obj/structure/prop/vehicle/tank/Initialize(mapload)
	. = ..()
	var/static/list/connections = list(
		COMSIG_OBJ_TRY_ALLOW_THROUGH = PROC_REF(can_climb_over),
	)
	AddElement(/datum/element/connect_loc, connections)

/obj/structure/prop/vehicle/tank/north
	icon = 'icons/obj/structures/prop/tank_vertical.dmi'
	icon_state = "tank_complete"
	bound_height = 128
	bound_width = 96

/obj/structure/prop/vehicle/tank/north/base
	name = "已退役的战术突击载具 - 犀牛"
	desc = "一辆退役坦克的底盘。"
	icon_state = "tank_base"

/obj/structure/prop/vehicle/tank/north/altnorth
	icon_state = "tank_complete_alt"

/obj/structure/prop/vehicle/tank/east
	icon = 'icons/obj/structures/prop/tank_horizontal.dmi'
	icon_state = "tank_complete"
	bound_height = 96
	bound_width = 128

/obj/structure/prop/vehicle/tank/east/base
	name = "已退役的战术突击载具 - 犀牛"
	desc = "一辆退役坦克的底盘。"
	icon_state = "tank_base"

/obj/structure/prop/vehicle/tank/east/turret
	icon_state = "turret_viper"
	layer = TANK_TURRET_LAYER
	desc = "一辆退役坦克的炮塔。"

/obj/structure/prop/vehicle/tank/east/turret/complete
	icon_state = "turret_complete"

/obj/structure/prop/vehicle/tank/east/turretalt
	icon_state = "turret_cobra"
	layer = TANK_TURRET_LAYER
	desc = "一辆退役坦克的炮塔。"

/obj/structure/prop/vehicle/tank/east/barrel
	icon_state = "ltb_cannon_0"
	layer = ABOVE_MOB_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/vehicle/tank/east/barrel/broken
	icon_state = "ltb_cannon_1"

/obj/structure/prop/vehicle/tank/east/barrel/minigun
	icon_state = "ltaaap_minigun_0"

/obj/structure/prop/vehicle/tank/east/barrel/minigunbroken
	icon_state = "ltaaap_minigun_1"

/obj/structure/prop/vehicle/tank/east/alteast
	icon_state = "tank_complete_alt"

/obj/structure/prop/vehicle/tank/east/decoration
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = TANK_DECORATION_LAYER

/obj/structure/prop/vehicle/tank/east/decoration/treads
	icon_state = "treads_stationary"

/obj/structure/prop/vehicle/tank/east/decoration/damagedtreads
	icon_state = "damaged_hardpt_treads"

/obj/structure/prop/vehicle/tank/east/decoration/armor
	icon_state = "caustic_armor"

/obj/structure/prop/vehicle/tank/east/decoration/armor/causticarmor
	icon_state = "caustic_armor"

/obj/structure/prop/vehicle/tank/east/decoration/armor/concussivearmor
	icon_state = "concussive_armor"

/obj/structure/prop/vehicle/tank/east/decoration/armor/ballisticarmor
	icon_state = "ballistic_armor"

/obj/structure/prop/vehicle/tank/east/decoration/armor/paladinarmor
	icon_state = "paladin_armor"

/obj/structure/prop/vehicle/tank/east/decoration/damagedhardpoint
	icon_state = "damaged_hardpt_armor"

/obj/structure/prop/vehicle/tank/east/decoration/damagedhardpointframe
	icon_state = "damaged_hardpt_frame"

/obj/structure/prop/vehicle/tank/east/decoration/damagedhardpointturret
	icon_state = "damaged_hardpt_turret"

/obj/structure/prop/vehicle/tank/east/decoration/damagedhardpointone
	icon_state = "damaged_hardpt_primary"

/obj/structure/prop/vehicle/tank/east/decoration/damagedhardpointtwo
	icon_state = "damaged_hardpt_secondary"

/obj/structure/prop/vehicle/tank/east/decoration/damagedhardpointthree
	icon_state = "damaged_hardpt_support"

/obj/structure/prop/vehicle/tank/east/decoration/slaunchone
	icon_state = "slauncher_0"

/obj/structure/prop/vehicle/tank/east/decoration/slaunchtwo
	icon_state = "slauncher_1"

/obj/structure/prop/vehicle/tank/east/decoration/slaunchthree
	icon_state = "slauncher_2"

/obj/structure/prop/vehicle/tank/east/decoration/driveenhancerone
	icon_state = "odrive_enhancer_1"

/obj/structure/prop/vehicle/tank/east/decoration/driveenhancerzero
	icon_state = "odrive_enhancer_0"

/obj/structure/prop/vehicle/tank/east/decoration/flamer
	icon_state = "flamer_1"

/obj/structure/prop/vehicle/tank/east/decoration/glauncherone
	icon_state = "glauncher_1"

/obj/structure/prop/vehicle/tank/east/decoration/glauncherzero
	icon_state = "glauncher_0"

/obj/structure/prop/vehicle/tank/east/decoration/cupolaone
	icon_state = "hsg102cupola_1"

/obj/structure/prop/vehicle/tank/east/decoration/cupolazero
	icon_state = "hsg102cupola_0"

/obj/structure/prop/vehicle/tank/east/decoration/towlauncherone
	icon_state = "towlauncher_1"

/obj/structure/prop/vehicle/tank/east/decoration/towlauncherzero
	icon_state = "towlauncher_0"

/obj/structure/prop/vehicle/tank/east/decoration/warrayone
	icon_state = "warray_1"

/obj/structure/prop/vehicle/tank/east/decoration/warrayzero
	icon_state = "warray_0"

/obj/structure/prop/vehicle/tank/east/decoration/artmodone
	icon_state = "artillerymod_1"

/obj/structure/prop/vehicle/tank/east/decoration/artmodzero
	icon_state = "artillerymod_0"

/obj/structure/prop/vehicle/tank/east/armor/snowplow
	icon_state = "snowplow_0"

/obj/structure/prop/vehicle/tank/east/armor/snowplowone
	icon_state = "snowplow_1"

/obj/structure/prop/vehicle/tank/north/turret
	icon_state = "turret_viper"
	layer = TANK_TURRET_LAYER
	desc = "一辆退役坦克的炮塔。"

/obj/structure/prop/vehicle/tank/north/turret/complete
	icon_state = "turret_complete"

/obj/structure/prop/vehicle/tank/north/turretalt
	icon_state = "turret_cobra"
	layer = TANK_TURRET_LAYER
	desc = "一辆退役坦克的炮塔。"

/obj/structure/prop/vehicle/tank/north/barrel
	icon_state = "ltb_cannon_0"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/vehicle/tank/north/barrel/broken
	icon_state = "ltb_cannon_1"

/obj/structure/prop/vehicle/tank/north/barrel/minigun
	icon_state = "ltaaap_minigun_0"

/obj/structure/prop/vehicle/tank/north/barrel/minigunbroken
	icon_state = "ltaaap_minigun_1"

/obj/structure/prop/vehicle/tank/north/altnorth
	icon_state = "tank_complete_alt"

/obj/structure/prop/vehicle/tank/north/decoration
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = TANK_DECORATION_LAYER

/obj/structure/prop/vehicle/tank/north/decoration/treads
	icon_state = "treads_stationary"

/obj/structure/prop/vehicle/tank/north/decoration/damagedtreads
	icon_state = "damaged_hardpt_treads"

/obj/structure/prop/vehicle/tank/north/decoration/armor
	icon_state = "caustic_armor"

/obj/structure/prop/vehicle/tank/north/decoration/armor/causticarmor
	icon_state = "caustic_armor"

/obj/structure/prop/vehicle/tank/north/decoration/armor/concussivearmor
	icon_state = "concussive_armor"

/obj/structure/prop/vehicle/tank/north/decoration/armor/ballisticarmor
	icon_state = "ballistic_armor"

/obj/structure/prop/vehicle/tank/north/decoration/armor/paladinarmor
	icon_state = "paladin_armor"

/obj/structure/prop/vehicle/tank/north/decoration/damagedhardpoint
	icon_state = "damaged_hardpt_armor"

/obj/structure/prop/vehicle/tank/north/decoration/damagedhardpointframe
	icon_state = "damaged_hardpt_frame"

/obj/structure/prop/vehicle/tank/north/decoration/damagedhardpointturret
	icon_state = "damaged_hardpt_turret"

/obj/structure/prop/vehicle/tank/north/decoration/damagedhardpointone
	icon_state = "damaged_hardpt_primary"

/obj/structure/prop/vehicle/tank/north/decoration/damagedhardpointtwo
	icon_state = "damaged_hardpt_secondary"

/obj/structure/prop/vehicle/tank/north/decoration/damagedhardpointthree
	icon_state = "damaged_hardpt_support"

/obj/structure/prop/vehicle/tank/north/decoration/slaunchone
	icon_state = "slauncher_0"

/obj/structure/prop/vehicle/tank/north/decoration/slaunchtwo
	icon_state = "slauncher_1"

/obj/structure/prop/vehicle/tank/north/decoration/slaunchthree
	icon_state = "slauncher_2"

/obj/structure/prop/vehicle/tank/north/decoration/driveenhancerone
	icon_state = "odrive_enhancer_1"

/obj/structure/prop/vehicle/tank/north/decoration/driveenhancerzero
	icon_state = "odrive_enhancer_0"

/obj/structure/prop/vehicle/tank/north/decoration/flamer
	icon_state = "flamer_1"

/obj/structure/prop/vehicle/tank/north/decoration/glauncherone
	icon_state = "glauncher_1"

/obj/structure/prop/vehicle/tank/north/decoration/glauncherzero
	icon_state = "glauncher_0"

/obj/structure/prop/vehicle/tank/north/decoration/cupolaone
	icon_state = "hsg102cupola_1"

/obj/structure/prop/vehicle/tank/north/decoration/cupolazero
	icon_state = "hsg102cupola_0"

/obj/structure/prop/vehicle/tank/north/decoration/towlauncherone
	icon_state = "towlauncher_1"

/obj/structure/prop/vehicle/tank/north/decoration/towlauncherzero
	icon_state = "towlauncher_0"

/obj/structure/prop/vehicle/tank/north/decoration/warrayone
	icon_state = "warray_1"

/obj/structure/prop/vehicle/tank/north/decoration/warrayzero
	icon_state = "warray_0"

/obj/structure/prop/vehicle/tank/north/decoration/artmodone
	icon_state = "artillerymod_1"

/obj/structure/prop/vehicle/tank/north/decoration/artmodzero
	icon_state = "artillerymod_0"

/obj/structure/prop/vehicle/tank/north/armor/snowplow
	icon_state = "snowplow_0"

/obj/structure/prop/vehicle/tank/north/armor/snowplowone
	icon_state = "snowplow_1"

/obj/structure/prop/vehicle/apc
	name = "已退役的TAV - 雅典娜号"
	desc = "一辆已退役的装甲运兵车，所有推进方式均已停用，出入口也已封闭。"
	icon = 'icons/obj/structures/prop/apc.dmi'
	icon_state = "apc_base"
	bound_height = 128
	bound_width = 128
	resistance_flags = RESIST_ALL

/obj/structure/prop/vehicle/apc/Initialize(mapload)
	. = ..()
	if(dir == EAST || dir == WEST)
		bound_height = 64
		pixel_y = -20
	else
		bound_width = 64
		pixel_x = -34

/obj/structure/prop/vehicle/apc/med
	icon_state = "apc_base_med"

/obj/structure/prop/vehicle/apc/com
	icon_state = "apc_base_com"

/obj/structure/prop/vehicle/apc/wheelszero
	icon_state = "wheels_0"
	layer = TANK_TURRET_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/vehicle/apc/wheelsone
	icon_state = "wheels_1"
	layer = TANK_TURRET_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/vehicle/apc/damagedframe
	icon_state = "damaged_frame"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/vehicle/apc/damagedhptone
	icon_state = "damaged_hdpt_primary"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/vehicle/apc/damagedhpttwo
	icon_state = "damaged_hdpt_secondary"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/vehicle/apc/damagedhpthree
	icon_state = "damaged_hdpt_support"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/vehicle/apc/dualcannonzero
	icon_state = "dualcannon_0"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/vehicle/apc/dualcannonone
	icon_state = "dualcannon_1"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/vehicle/apc/decoration
	icon_state = "frontalcannon_0"
	density = FALSE
	layer = TANK_DECORATION_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/vehicle/apc/decoration/frontturretzero
	icon_state = "frontalcannon_0"

/obj/structure/prop/vehicle/apc/decoration/frontturretone
	icon_state = "frontalcannon_1"

/obj/structure/prop/vehicle/apc/decoration/freightzero
	icon_state = "freight_0"

/obj/structure/prop/vehicle/apc/decoration/freightone
	icon_state = "freight_1"

/obj/structure/prop/vehicle/apc/decoration/freighttwo
	icon_state = "freight_2"

/obj/structure/prop/vehicle/apc/decoration/freighttwo
	icon_state = "freight_2"

/obj/structure/prop/vehicle/apc/decoration/commsrelayzero
	icon_state = "comms_relay_0"

/obj/structure/prop/vehicle/apc/decoration/commsrelayone
	icon_state = "comms_relay_1"

/obj/structure/prop/vehicle/apc/decoration/flarelauncherzero
	icon_state = "flare_launcher_0"

/obj/structure/prop/vehicle/apc/decoration/flarelauncherone
	icon_state = "flare_launcher_1"

/obj/structure/prop/vehicle/apc/decoration/flarelaunchertwo
	icon_state = "flare_launcher_2"

/obj/structure/prop/vehicle/apc/decoration/emptyfuelcell
	icon_state = "emptyfuelcell"

/obj/structure/prop/propplaceholder
	name = "道具占位符"
	desc = "有人搞砸了，去Discord上@地图作者并告知这个物体的位置。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "placeholderprop"

/obj/structure/prop/mainship/gelida/smallwire
	name = "细电线"
	desc = "一小块用于隔离区域的布线。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "small_wire"
	density = FALSE

/obj/structure/prop/mainship/gelida/lightstick
	name = "荧光棒"
	desc = "顶部带有空灯泡的灯柱，用于在积雪密集区域提供照明。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "lightstick_spoke1"
	density = FALSE

/obj/structure/prop/mainship/gelida/planterbox
	name = "种植箱"
	desc = "一个用于存放生长植物的金属盒子，这个是空的。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "planter_box_empty"
	layer = BELOW_OBJ_LAYER
	density = FALSE

/obj/structure/prop/mainship/gelida/planterboxsoil
	name = "种植箱"
	desc = "一个用于种植植物的金属盒子，里面装满了土壤。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "planter_box_soil"
	layer = BELOW_OBJ_LAYER

/obj/structure/prop/mainship/gelida/planterboxsoil/nondense
	density = FALSE
	name = "网格走道"
	desc = "可供行走的地板。这种带有缝隙，可以看到下方的太空。"

/obj/structure/prop/mainship/gelida/planterboxsoilgrid
	name = "种植箱"
	desc = "一个用于存放生长植物的金属盒子，这个是空的。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "soil_grid"
	layer = BELOW_OBJ_LAYER

/obj/structure/prop/mainship/gelida/planterboxsoilgrid/nondense
	density = FALSE
	name = "网格走道"
	desc = "可供行走的地板。这种带有缝隙，可以看到下方的太空。"

/obj/structure/prop/mainship/gelida/propserver
	name = "殖民地研究服务器"
	desc = "这台机器静静地待着，你能看到诊断面板上有一盏警示灯在微弱地闪烁。"
	icon = 'icons/obj/machines/telecomms.dmi'
	icon_state = "comm_server_off"

/obj/structure/prop/mainship/gelida/propserveralt
	name = "殖民地研究服务器"
	desc = "这台机器静静地待着，你能看到诊断面板上有一盏警示灯在微弱地闪烁。"
	icon = 'icons/obj/machines/research.dmi'
	icon_state = "server_alt"

/obj/structure/prop/mainship/gelida/barrier
	name = "安全屏障"
	desc = "安全部队用于封锁区域的部署式屏障。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "barrier0"
	resistance_flags = XENO_DAMAGEABLE
	max_integrity = 100

/obj/structure/prop/mainship/gelida/heavycablenode
	name = "重型电缆节点"
	desc = "用于连接建筑物间高性能电缆的重型电缆节点。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "node"
	density = FALSE

/obj/structure/prop/mainship/gelida/powerconnector
	name = "重型电缆电源连接器"
	desc = "用于在建筑物之间连接高性能电缆的重型电缆节点。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "powerconnector"
	layer = GAS_PIPE_HIDDEN_LAYER
	density = FALSE

/obj/structure/prop/mainship/gelida/powerccable
	name = "重型电缆布线"
	desc = "用于建筑物间快速数据传输的重型电缆。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "powercableheavy"
	layer = GAS_PIPE_HIDDEN_LAYER
	density = FALSE

/obj/structure/prop/mainship/gelida/powercconnectortwoside
	name = "重型电缆布线"
	desc = "用于建筑物间快速数据传输的粗重电缆线。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "powerconnectortwoside"
	layer = GAS_PIPE_HIDDEN_LAYER
	density = FALSE

/obj/structure/prop/mainship/gelida/powercconnectortwosidealt
	name = "重型电缆布线"
	desc = "用于建筑物间快速数据传输的粗重电缆线。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "powerconnectortwosidealt"
	layer = GAS_PIPE_HIDDEN_LAYER
	density = FALSE

/obj/structure/prop/mainship/gelida/powercconnectorthreeside
	name = "重型电缆布线"
	desc = "用于建筑物间快速数据传输的重型电缆。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "powerconnectorthreeside"
	layer = GAS_PIPE_HIDDEN_LAYER
	density = FALSE

/obj/structure/prop/mainship/gelida/powercconnectorfourside
	name = "重型电缆布线"
	desc = "用于建筑物间快速数据传输的粗重电缆。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "powerconnectorfourside"
	layer = GAS_PIPE_HIDDEN_LAYER
	density = FALSE

/obj/structure/prop/mainship/gelida/rails
	name = "矿车导轨"
	desc = "用于引导矿车的金属导轨。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "rail"
	layer = BELOW_TABLE_LAYER
	density = FALSE

/obj/structure/prop/mainship/gelida/railbumper
	name = "矿车导轨缓冲器"
	desc = "专为拦截失控矿车设计的金属缓冲器。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "rail_bumpers"
	layer = BELOW_TABLE_LAYER
	density = FALSE

/obj/structure/prop/mainship/gelida/register
	name = "注册"
	desc = "一台老式收银机，只接受实体货币，不接受太空信用点。"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "register_static"
	density = FALSE

/obj/structure/prop/mainship/gelida/propladder
	name = "梯子"
	desc = "梯子危险地摇晃着，一大块锋利的金属切断了它与上层地板的连接。"
	icon = 'icons/obj/structures/structures.dmi'
	icon_state = "ladder11"

/obj/structure/prop/mainship/gelida/miner
	name = "矿工"
	desc = "这台机器静止不动，等待着指令开始从下方土地中提取自然资源。"
	icon = 'icons/obj/structures/prop/mainship_96.dmi'
	icon_state = "thumper"

/obj/structure/prop/radio_prop
	name = "无线电"
	desc = "标准军用无线电。"
	icon = 'icons/obj/items/radio.dmi'
	icon_state = "beacon"
	var/datum/looping_sound/radio/chatter_loop

/obj/structure/prop/radio_prop/Initialize(mapload, ...)
	. = ..()
	chatter_loop = new(null, FALSE)
	chatter_loop.start(src)

/obj/structure/prop/radio_prop/Destroy()
	QDEL_NULL(chatter_loop)
	return ..()

/obj/structure/prop/mainship/railing
	name = "栏杆"
	desc = "用于保护像你这样的傻瓜免于坠落的简易导轨。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	density = FALSE
	icon_state = "railing"

/obj/structure/prop/mainship/railing/corner
	name = "栏杆"
	desc = "用于保护像你这样的傻瓜免于坠落的简易导轨。"
	density = FALSE
	icon_state = "railing_corner"

/obj/structure/prop/mainship/solar
	name = "太阳能阵列"
	desc = "一块太阳能板。在接触阳光时产生电力。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "sp_base"

/obj/structure/prop/mainship/solar/tracker
	name = "太阳能追踪器"
	desc = "太阳能定向追踪器。"
	icon_state = "tracker_base"

/obj/structure/prop/vehicle/som_mech
	name = "掠夺者突击机甲"
	desc = "火星之子用于发起突击的重型武装机甲，这台似乎已经无法运作。"
	icon = 'icons/obj/structures/prop/mech.dmi'
	icon_state = "som_mech"
	coverage = 70
	bound_width = 32
	pixel_x = -15
	pixel_y = -15
	resistance_flags = RESIST_ALL
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/machine_frame3
	name = "机器框架"
	desc = "这是一个可建造的机器框架。"
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "box_2"

/obj/structure/prop/keycardauth
	name = "门禁卡认证装置"
	desc = "此设备用于触发需要多张身份卡认证的站点功能。"
	icon = 'icons/obj/monitors.dmi'
	icon_state = "auth_off"

/obj/structure/prop/turbine
	name = "动力涡轮机"
	desc = "一个靠天知道什么驱动的巨型涡轮机。也许懂行的人能把它启动起来。"
	icon = 'icons/obj/structures/prop/mainship_96.dmi'
	icon_state = "biomass_turbine"
	density = TRUE


//TG BROKEN VENDOR PROPS
//USE THESE SPARINGLY OUTSIDE OF TG THEMED MAPS OR I'LL BREAK YOUR KNEECAPS

/obj/structure/prop/tgbrokenvendor
	name = "\improper 损坏的自动售货机"
	icon = 'icons/obj/tg_vending_props.dmi'
	desc = "这台自动售货机的内部结构暴露在外且锈迹斑斑，你感觉这台机器已经没救了。"
	density = TRUE
	///var to control vendor appearance, can be vendor_broken, vendor_working or vendor_blank
	var/vendorstate = VENDOR_BROKEN

/obj/structure/prop/tgbrokenvendor/Initialize(mapload)
	. = ..()
	vendorstate = pick(VENDOR_BROKEN, VENDOR_BLANK)
	if(vendorstate == VENDOR_BROKEN)
		icon_state += "-broken"
	else
		icon_state += "-off"

/obj/structure/prop/tgbrokenvendor/snackbrokebed
	icon_state = "snack"

/obj/structure/prop/tgbrokenvendor/snackbrokeblue
	icon_state = "snackblue"

/obj/structure/prop/tgbrokenvendor/snackbrokeorange
	icon_state = "snackorange"

/obj/structure/prop/tgbrokenvendor/snackbrokegreen
	icon_state = "snackgreen"

/obj/structure/prop/tgbrokenvendor/snackbroketeal
	icon_state = "snackteal"

/obj/structure/prop/tgbrokenvendor/smartfridge
	icon_state = "smartfridge"

/obj/structure/prop/tgbrokenvendor/dinnerware
	icon_state = "dinnerware"

/obj/structure/prop/tgbrokenvendor/cigs
	icon_state = "cigs"

/obj/structure/prop/tgbrokenvendor/generic
	icon_state = "generic"

/obj/structure/prop/tgbrokenvendor/sec
	icon_state = "sec"

/obj/structure/prop/tgbrokenvendor/nutri
	icon_state = "nutri"

/obj/structure/prop/tgbrokenvendor/seeds
	icon_state = "seeds"

/obj/structure/prop/tgbrokenvendor/cola
	icon_state = "cola-machine"

/obj/structure/prop/tgbrokenvendor/colablack
	icon_state = "cola_black"

/obj/structure/prop/tgbrokenvendor/colared
	icon_state = "cola_red"

/obj/structure/prop/tgbrokenvendor/spaceup
	icon_state = "space_up"

/obj/structure/prop/tgbrokenvendor/pwrgame
	icon_state = "starkist"

/obj/structure/prop/tgbrokenvendor/starkist
	icon_state = "pwr_game"

/obj/structure/prop/tgbrokenvendor/soda
	icon_state = "starkist"

/obj/structure/prop/tgbrokenvendor/sovietsoda
	icon_state = "sovietsoda"

/obj/structure/prop/tgbrokenvendor/coffee
	icon_state = "coffee"

/obj/structure/prop/tgbrokenvendor/boozeomat
	icon_state = "boozeomat"

/obj/structure/prop/tgbrokenvendor/magivend
	icon_state = "MagiVend"

/obj/structure/prop/tgbrokenvendor/med
	icon_state = "med"

/obj/structure/prop/tgbrokenvendor/drug
	icon_state = "drug"

/obj/structure/prop/tgbrokenvendor/engi
	icon_state = "engi"

/obj/structure/prop/tgbrokenvendor/robotics
	icon_state = "robotics"

/obj/structure/prop/tgbrokenvendor/cart
	icon_state = "cart"

/obj/structure/prop/tgbrokenvendor/theater
	icon_state = "theater"

/obj/structure/prop/tgbrokenvendor/clothes
	icon_state = "clothes"

/obj/structure/prop/tgbrokenvendor/liberationstation
	icon_state = "liberationstation"

/obj/structure/prop/tgbrokenvendor/syndi
	icon_state = "syndi"

/obj/structure/prop/tgbrokenvendor/ntdonk
	icon_state = "nt-donk"

/obj/structure/prop/tgbrokenvendor/games
	icon_state = "games"

/obj/structure/prop/tgbrokenvendor/bardrobe
	icon_state = "bardrobe"

/obj/structure/prop/tgbrokenvendor/secdrobe
	icon_state = "secdrobe"

/obj/structure/prop/tgbrokenvendor/chefdrobe
	icon_state = "chefdrobe"

/obj/structure/prop/tgbrokenvendor/medidrobe
	icon_state = "medidrobe"

/obj/structure/prop/tgbrokenvendor/chemdrobe
	icon_state = "chemdrobe"

/obj/structure/prop/tgbrokenvendor/genedrobe
	icon_state = "genedrobe"

/obj/structure/prop/tgbrokenvendor/virodrobe
	icon_state = "virodrobe"

/obj/structure/prop/tgbrokenvendor/scidrobe
	icon_state = "scidrobe"

/obj/structure/prop/tgbrokenvendor/robodrobe
	icon_state = "robodrobe"

/obj/structure/prop/tgbrokenvendor/chapdrobe
	icon_state = "chapdrobe"

/obj/structure/prop/tgbrokenvendor/engidrobe
	icon_state = "engidrobe"

/obj/structure/prop/tgbrokenvendor/atmosdrobe
	icon_state = "atmosdrobe"

/obj/structure/prop/tgbrokenvendor/hydrodrobe
	icon_state = "hydrobe"

/obj/structure/prop/tgbrokenvendor/cargodrobe
	icon_state = "cargodrobe"

/obj/structure/prop/tgbrokenvendor/curadrobe
	icon_state = "curadrobe"

/obj/structure/prop/tgbrokenvendor/janidrobe
	icon_state = "janidrobe"

/obj/structure/prop/tgbrokenvendor/lawdrobe
	icon_state = "lawdrobe"

/obj/structure/prop/tgbrokenvendor/detdrobe
	icon_state = "detdrobe"

/obj/structure/prop/tgbrokenvendor/parts
	icon_state = "parts"

/obj/structure/prop/tgbrokenvendor/custom
	icon_state = "custom"

/obj/structure/prop/tgbrokenvendor/greed
	icon_state = "greed"

/obj/structure/prop/tgbrokenvendor/centdrobe
	icon_state = "centdrobe"

/obj/structure/prop/tgbrokenvendor/shamblersjuice
	icon_state = "shamblers_juice"

/obj/structure/prop/tgbrokenvendor/modularpc
	icon_state = "modularpc"

/obj/structure/prop/camera
	name = "损坏的监控摄像头"
	desc = "它用于监控房间。"
	icon = 'icons/obj/machines/monitors.dmi'
	icon_state = "camera_icon"
	layer = WALL_OBJ_LAYER
	anchored = TRUE

/obj/structure/prop/camera/Initialize(mapload, newDir)
	. = ..()
	icon_state = "camera1"

/obj/machinery/prop/computer/tadpole
	name = "蝌蚪号导航计算机"
	desc = "用于为蝌蚪号指定精确的转运位置。"
	icon_state = "shuttlecomputer"
	screen_overlay = "shuttlecomputer_screen"
	resistance_flags = RESIST_ALL

/obj/structure/prop/computer
	icon = 'icons/obj/machines/computer.dmi'

/obj/structure/prop/computer/cryopod
	name = "低温休眠舱控制台"
	desc = "一个控制舰船休眠舱的大型控制台。主要用于从长期休眠的船员处回收物品。"
	icon_state = "cellconsole"
	resistance_flags = RESIST_ALL

/obj/structure/prop/computer/broken
	name = "损坏的电脑"
	desc = "一台损坏的电脑，内部看起来烧焦了，这个没救了。"
	icon = 'icons/obj/machines/computer.dmi'
	icon_state = "broken_computer1"
	resistance_flags = XENO_DAMAGEABLE
	density = TRUE
	max_integrity = 120

/obj/structure/prop/computer/broken/two
	icon_state = "broken_computer2"

/obj/structure/prop/computer/broken/three
	icon_state = "broken_computer3"

/obj/structure/prop/computer/broken/four
	icon_state = "broken_computer4"

/obj/structure/prop/computer/broken/five
	icon_state = "broken_computer5"

/obj/structure/prop/computer/broken/six
	icon_state = "broken_computer6"

/obj/structure/prop/computer/broken/seven
	icon_state = "broken_computer7"

/obj/structure/prop/computer/broken/eight
	icon_state = "broken_computer8"

/obj/structure/prop/computer/broken/nine
	icon_state = "broken_computer9"

/obj/structure/prop/computer/broken/ten
	icon_state = "broken_computer10"

/obj/structure/prop/computer/broken/eleven
	icon_state = "broken_computer11"

/obj/structure/prop/computer/broken/twelve
	icon_state = "broken_computer12"

/obj/structure/prop/computer/broken/thirteen
	icon_state = "broken_computer13"

/obj/structure/prop/computer/broken/fourteen
	icon_state = "broken_computer14"

/obj/structure/prop/computer/broken/fifteen
	icon_state = "broken_computer15"

/obj/structure/prop/computer/broken/sixteen
	icon_state = "broken_computer16"

/obj/structure/prop/computer/broken/seventeen
	icon_state = "broken_computer17"

/obj/structure/prop/computer/broken/eighteen
	icon_state = "broken_computer18"

/obj/structure/prop/computer/broken/nineteen
	icon_state = "broken_computer19"

/obj/structure/prop/sandman
	name = "沉睡者"
	desc = "就像雪人一样，只不过它无孔不入。"
	icon = 'icons/obj/structures/jungle.dmi'
	icon_state = "sandman"

/obj/machinery/computer/solars
	name = "左舷后部太阳能控制室"
	desc = "太阳能电池板阵列控制器。"
	icon_state = "computer"
	screen_overlay = "solar"
	broken_icon = "computer_blue_broken"

/obj/machinery/filtration_pipes
	name = "消毒过滤器"
	desc = "专为从水中分离微生物（如病毒和细菌）而设计的水过滤器。"
	icon = 'icons/obj/structures/pipe_multiple.dmi'
	icon_state = "solo_tank_water"
	density = TRUE

/obj/machinery/filtration_pipes/water/update_overlays()
	. = ..()
	. += image(icon, src, "tank_water_top", layer = ABOVE_ALL_MOB_LAYER, pixel_y = 31)

/obj/machinery/filtration_pipes/empty
	icon_state = "solo_tank_empty"

/obj/machinery/filtration_pipes/empty/update_overlays()
	. = ..()
	. += image(icon, src, "tank_water_empty", layer = ABOVE_ALL_MOB_LAYER, pixel_y = 31)

/obj/machinery/filtration_pipes/waste
	icon_state = "solo_tank_waste"

/obj/machinery/filtration_pipes/waste/update_overlays()
	. = ..()
	. += image(icon, src, "tank_waste_top", layer = ABOVE_ALL_MOB_LAYER, pixel_y = 31)

/obj/machinery/filtration_pipes/multiple
	icon_state = "disinfection"
	bound_width = 96
	bound_height = 64

/obj/machinery/filtration_pipes/multiple/update_overlays()
	. = ..()
	. += image(icon, src, "disinfectiontop", layer = ABOVE_ALL_MOB_LAYER, pixel_y = 63)

/obj/structure/prop/mainship/errorprop
	name = "错误"
	desc = "如果你在游戏中看到这个物体，请使用管理员求助，某些东西出错了。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "error"

/obj/structure/prop/trashpile
	name = "垃圾堆"
	desc = "一堆恶心的垃圾。如果你走投无路，或许能拿它当掩体。"
	icon = 'icons/obj/structures/misc.dmi'
	icon_state = "trashpile"
	density = TRUE
	anchored = TRUE
	climbable = TRUE
	allow_pass_flags = PASS_LOW_STRUCTURE|PASSABLE|PASS_WALKOVER
	hit_sound = 'sound/weapons/heavyhit.ogg'
	coverage = 30
	max_integrity = 75

/obj/structure/prop/casammo
	name = "30毫米弹药板条箱"
	desc = "装满30毫米弹道的板条箱，地球政府战斗机的标准配备。不幸的是，它被焊在地板上，看起来你无法移动它。"
	icon = 'icons/obj/structures/prop/mainship.dmi'
	icon_state = "30mm_crate"
	density = TRUE
	anchored = TRUE
	climbable = TRUE
	allow_pass_flags = PASS_LOW_STRUCTURE|PASSABLE|PASS_WALKOVER
	coverage = 30
	max_integrity = 150

/obj/structure/prop/casammo/incendiary_minirocket
	name = "燃烧迷你火箭弹堆"
	desc = "一包激光制导燃烧迷你火箭。不幸的是，它真——的非常重，所以你不能用动力装载机举起它。"
	icon_state = "minirocket_inc"

/obj/structure/prop/casammo/minirocket
	name = "微型火箭弹堆"
	desc = "一包激光制导的微型火箭弹。可惜这些火箭已经嵌入地面，无法用动力装载机移动。"
	icon_state = "minirocket"

/obj/structure/prop/casammo/monarch

	name = "\improper PHGM-7 '君主'"
	desc = "PHGM-7'君主'式火箭弹是一种经过充分验证的简易火箭设计，因为它本身就是一种简易火箭。其战斗部旨在以低成本对区域造成毁灭性打击。不幸的是，这种导弹过于光滑，无法用动力装载机搬运。"
	icon_state = "monarch"
	icon = 'icons/obj/structures/prop/mainship_64.dmi'
	bound_width = 64
	bound_height = 32
	coverage = 40
	max_integrity = 300

/obj/structure/prop/casammo/battery
	name = "高容量激光电池"
	icon_state = "laser_battery"
	desc = "一种高容量激光电池，用于为激光束武器供能。可惜你太笨了，就算在动力装载机里也不知道怎么搬起这东西。"

/obj/prop/mainship/prop/news_tv
	name = "电视"
	desc = "令人惊讶的是，这个频道仍然在播放新闻。"
	icon = 'icons/obj/status_display.dmi'
	icon_state = "news"
	density = FALSE
	///List for the news stories
	var/list/news_list = list()
	///News stories
	var/news_stories = ""
/obj/prop/mainship/prop/news_tv/Initialize(mapload)
	. = ..()
	news_list = splittext(news_stories, ";")
	addtimer(CALLBACK(src, PROC_REF(start_send)), SSticker.round_start_time + 1 MINUTES)

/obj/prop/mainship/prop/news_tv/proc/start_send()
	for(var/i = 1 to length(news_list))
		addtimer(CALLBACK(src, PROC_REF(send_story), i), 45 SECONDS * i)

/obj/prop/mainship/prop/news_tv/proc/send_story(story)
	var/selected_story = news_list[story]
	say(selected_story)

/obj/prop/mainship/prop/news_tv/tg
	news_stories = "The peace of the Persatuan system was broken as missiles, lasers and coilguns are fired in a fierce naval battle with TerraGov and the SOM, the navy was able to secure the jump points being used by the SOM cutting off the remaining SOM ships left in the system.;\
		TDF releases headcam footage being nicknamed 'Martian Bushcutting' showing an infantryman wiping a squad of MMC using only a machete. Nanotrasen pharmaceutical division used the video as a showcase of their advanced combat cocktail mix.;\
		In a recent press conference Terrabound Mechanics CEO Korol Smith broke down after a question regarding the recently finished mech program 'Mech program is 154 billion overbudget and should have been canned since the start!', shouted Korol Smith. This is after the Rhino light tank program got cancelled over the more advanced mech program.;\
		A recent skirmish against the ICCN and the TGN results in a TGN victory. Both sides with 5 ships each are head on in a brachistochrone trajectory TG fires first firing a salvo of 200 torch missiles, the ICCN being primarily a laser star focused fleet makes them very effective in point defense allows them to intercept most, 3 missiles impact killing 2 ships and disabling 1. ICC ships fire off their lasers and a beam is able to focus enough to melt through the armor of a TG ship disabling them then being completely melted down with focused fire before counter fire from the remaining TG ships is able to vaporize the remaining ships.;\
		Nano-toys, releases the rouny plush line based off the runner xenomorph, some concerned parents criticizes the toy saying, 'Its outrageous that it's ok to sell a plush depicting a killer alien that has killed hundreds of colonists as a toy for children!'.;\
		Viral footage shows a mech racing against the colonists of LV-235, with the mech making extensive use of its boosters to outpace the other vehicles to the point of overheating. We ask mech freelancer John Sauter what his story is, 'We had a contract here but it was over pretty fast, so me and my comrades decided to see what kinda activities the locals have, apparently they have a racing event. One of the guys joked about bringing the mech to the race and i said fuck it, lets do it and man what a ride it was, won an entire basket of oranges for getting 1st place, not the best prize but ill take it, im pretty sure im a pioneer in this field too. John Sauter first mech racer, thats a good title.'.;\
		TG Transportation Safety Board has recently released a new list of locations marked as quarantine which includes LV-462, Big Red, and Chigusa. TGMC have been sent to enforce the quarantine and clear the infestation of the recent xenomorph outbreaks, a statement is also included stating the situation is currently under control.;\
		Tadpole class dropships land dropping off more rescue teams to rescue the civilians out of the Hope-3 O'Neill cylinder colony situated on lagrange 1 of Lakota as yesterday a cargo liner collision suspected to be manned by CLF operatives crashed into the colony. Death tolls are currently 45k+ dead and 15k+ injured. This is likely a reprisal attack after the navy began to clamp down on the CLF, more combat ships are being sent to protect especially high value targets.;\
		War correspondent Tim Sholk on the ground in Lolokal station, take it away 'It's a very tense situation here, as you can see most of the stations population have taken refuge near the medical wing caught in the middle of battle against MMC forces and the TGMC, while TG controls the station for now and preparing for evacuation of the-' 'BREACHING CHARGE ON ENGINEERING MARINES MOVE IN AND REEINFORCE, CUT THE FEED NOW!'.;\
		Famous photographer Will Navidson goes missing after going on a short break with his family on the planet of New Vingrina, local authorities ask for any information on whereabouts. Was last seen buying camping supplies in a Leafes Outdoor Equipment store.;\
		3rd generation bluespace drive. 1500kN of thrust. 200km+ Delta V. Liquid Droplet Radiators. Protection. Luxury. Luna Shipworks proudly presents the Marik Class Yacht with 4 large hardpoints for any of your needs whether it be transport or light cargo hauling or even racing.;\
		Mars, a place that has been completely devastated by the independence war. Mine fields and rows of trenches litter the landscape with colonies wiped off the map completely, you can stop this tragedy from happening again, join the marine corps today.;\
		'This material will change the course of our species and its time to rise from the rubble, look upon the stars and grasp them!' DIRECTED BY ALEXANDER BREEN 'It's a race against time we have Onmark Fusion stating that they will get their bluespace drive test on the 15th, we have to rush this prototype Paul.' 'Paul me and the kids haven't seen you in 5 months! You have to take a break sometime.' THIS REMEMBRANCE DAY 'This is Armstrong-1 we have reached jump point anomaly. Begin ignition in 5 4 3 2 1' BLUESPACE In theaters 15th of July.;\
		'Hey Alex, got you the coffee you asked for' 'This doesn't seem like the usual' 'It's a new chain they got a classic pre strife era France vibe in their cafe, was founded by the Rushin Engines band' 'This is nice, wakes you up instantly and it's got a really rich flavour i haven't felt before' 'Yup that would be the special Java organically grown coffee beans, they also use the newest tech in chemistry, i swear it looked more like a lab back there than a cafe' Baron Cafe. 'Taste the future of coffee, today. No gimmicks. Pure quality'.;\
		TGMC enforces the peace here in the recently liberated Tiberius from the ICC, as you can see it has been very peacefu- 'FUCK YOU IMPERIALISTS! YOU AND THE CORPOS HAVE TAKEN EVERYTHING FROM ME, WHAT ELSE DO YOU WANT!' 'Shut that man up! Alec, escort that camera crew out of here things are about to get heated here'."

/obj/prop/mainship/prop/news_tv/som
	news_stories = "Our navy makes a foothold on the Persatuan system as we destroy the imperialists holds in the system, using a mass amount of drones and carrier ships allows us to easily project force everywhere in the system in a matter of a few hours.;\
		Shang-12 Research Station has had constant fighting for the past 2 days and only has recently ended now thanks to the bravery of Shokk Platoon marine Ming, bodycam footage shows him fearlessly charging enemy holdouts with his boarding axe putting full faith in his equipment allowing for a breakthrough, we can all aspire to go to these lengths of bravery.;\
		We recently encountered a full squad of TG mechs, although it was no match for our mech boys, a single volkite lance and a good hit is all it takes to take down their mechs, they may have a lot of it but it doesn't match the quality of our equipment.;\
		New Malay Shipyards advanced casaba drone gets put to the test in it's first real combat engagement against two TG frigates and 3 cargo freighters, MNV Tex class frigate launches 24 drones and the AI sets a course to rendezvous with the targets, with its high amount of thrust they are able to close in to an effective range fast and use their casaba howitzers to intercept incoming missiles, 6 drones are able to get through quickly dispatching the enemy ships as they get in effective casaba range, they use their advanced RCS thrusters to dodge enemy coilgun fire and as they pass the destroyed ships they turn on their engines to irradiate the area leaving no survivors.;\
		Are you ready to take your Verf warfare to the next level? Introducing the Verf Volkite Caliver toy, simply connect it with the battery backpack and start releasing the full rapid fire of the Verf Volkite Caliver, everything you need to mow down your friends. Helmet sold seperately, batteries not included. VERF.;\
		The Independent Colonies Trade Admin would like to remind you that moving alien animals and plants without a permit to another star system is illegal and may land you up to 2 years in jail and a 1 million kreto fine, recently we have had issues with cartels trying to ship exotic animals by using unsuspecting passangers, do not accept any offers from anyone for help with carrying.;\
		TerraGov suffers a massive disaster as a cargo liner goes out of control and collides into an O'Neill cylinder colony with many casualties and billions of dollars in cargo lost, a few ship analysts say that the TerraGov claim that it was a terrorist attack is false, the maint logs of the ship suggested instead it was a mechanical failure.;\
		We have here Boris Kilo on the frontline of an armed rebellion against TG on the moon of Harvest 'These rebels are sick and tired of the horrible working conditions Nanotrasen has set and the tariff increases TG has done' 'With our wages were just working from meal to meal with no prospect of advancing and they want to increase the damn import tariffs? No enough is enough!' 'Look at this footage we captured so called TDF peacekeepers executing suspected collaborators and shooting into protestors, show it to the whole damn galaxy that they rule this place with fear'.;\
		Insmoth ocean planet colony population mysteriously vanishes. Colony Newport-212 known for its export of exotic fish has completely vanished with no conclusive evidence of what happened to the colonists, according to flight logs no shuttle was ever nearby the colony, a few leads are possible cultist activity on the planet as investigators and crews who often carry cargo to the planet report odd behaviour and gold statues of unknown idols littering the colonies.;\
		Today we remember the battle of Olympus Mons, a day to remind ourselves of the sacrifice our forefathers made to escape from the tyranny and imperialist ambitions of Terra and on that day 25152 brave Martians died to secure our future to assault and capture a prototype bluespace drive leading us to our destiny among the stars and preserving Mars, even if Terra holds our holy land. Mars shall not be forgotten.;\
		Tonight's execution! A TerraGov spy has been caught and tried today deemed guilty, it shall be a special execution showcasing the MMC's new radiation grenades if everything goes as planned this spy will meet a very painful demise! Execution tonight at 6 on all channels.;\
		An extinct alien civilization found? An exploratory team had set down on Lakita-984, a very hot Terra like planet with bizzare weather patterns. Scans indicate high amounts of greenhouse gasses and areas with high amounts of radiation perhaps a small scale nuclear conflict along with global warming had been their end? A lot of debris was found in orbit that have damage similar to laser fire, they also found wildly varied technological level and design of machinery seemingly as they were from entirely different worlds. Destroyed and decaying buildings are scattered across the planet with only a few major clusters of them, showing an isolationist culture. The more gruesome discovery was of bones of corpses found in massive piles like a massacre had happened, some say it was a religious ritual.;\
		Mariner Aerospace M350 SSTO family, the most widely used civilian SSTO family in SOM space. The latest generation hybrid engines, air-breathing hypersonic turbines into a radiation free NTR in a vacuum. 800 carrying capacity with flexible cargo capacity. M350 the technical benchmark in its field.;\
		Orbital ring construction on Catakan continues smoothly with no major incidents, Phobos Manufacturing plays the biggest part of construction with its massive mobile construction platform able to produce any parts needed locally and housing a good amount of the construction workers, the orbital ring is expected to be finished in 3 years with 9 space elevators and 12 stations connecting to it along with dome gardens and cities along the skyhooks.;\
		Shipyard work more attractive to young adults than office work? More and more young adults are flocking to shipyard and space related work as they want an escape from the monotony and rat race of the office world, here we are at New Malay Shipyards with Austin Li a 20 year old who gave up his managerial position for shipyard work 'I wanted to just escape from the boredom, feel challenged and accomplished from the work i do and i found that in shipyard work, it's a tough job and the pay is not as good but nothing beats the view from up here and the feeling of freedom from zero g, atleast thats my perspective. Sorry i gotta get to my EVA mech now, work calls."

/obj/structure/prop/coagulation_arm
	name = "凝血臂"
	desc = "一个四面轴，设计用于旋转以帮助过滤水。"
	icon = 'icons/obj/structures/coagulation_arm.dmi'
	icon_state = "arm"
	anchored = TRUE
	resistance_flags = XENO_DAMAGEABLE
	bound_height = 96
	bound_width = 96
	max_integrity = 1000

/obj/structure/prop/filtration_exit
	name = "废物排放管道"
	desc = "这台机器将净化过程中产生的残余废物分离出来，以便排入太空、回收利用或用于研究。"
	icon = 'icons/obj/structures/waste_pipe.dmi'
	icon_state = "pipe"
	anchored = TRUE
	bound_height = 96
	bound_width = 96
	density = TRUE
	resistance_flags = RESIST_ALL


#undef VENDOR_BROKEN
#undef VENDOR_BLANK
