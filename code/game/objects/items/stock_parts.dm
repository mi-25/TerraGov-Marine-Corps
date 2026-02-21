/obj/item/stock_parts
	name = "枪托部件"
	desc = "什么？"
	gender = PLURAL
	icon = 'icons/obj/items/stock_parts.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/rating = 1


/obj/item/stock_parts/Initialize(mapload)
	. = ..()
	pixel_x = rand(-5, 5)
	pixel_y = rand(-5, 5)

//Rank 1

/obj/item/stock_parts/console_screen
	name = "控制台屏幕"
	desc = "用于制造配备交互式控制台的计算机和其他设备。"
	icon_state = "screen"

/obj/item/stock_parts/capacitor
	name = "电容器"
	desc = "一种基础电容器，用于制造多种设备。"
	icon_state = "capacitor"

/obj/item/stock_parts/scanning_module
	name = "扫描模块"
	desc = "一种紧凑型高分辨率扫描模块，用于制造特定设备。"
	icon_state = "scan_module"

/obj/item/stock_parts/manipulator
	name = "微型机械臂"
	desc = "一种用于制造特定设备的小型操纵器。"
	icon_state = "micro_mani"
/obj/item/stock_parts/micro_laser
	name = "微型激光器"
	desc = "用于特定设备的小型激光器。"
	icon_state = "micro_laser"

/obj/item/stock_parts/matter_bin
	name = "物质箱"
	desc = "用于存放待重构压缩物质的容器。"
	icon_state = "matter_bin"

//Rank 2

/obj/item/stock_parts/capacitor/adv
	name = "高级电容器"
	desc = "一种高级电容器，用于制造多种设备。"
	rating = 2

/obj/item/stock_parts/scanning_module/adv
	name = "高级扫描模块"
	desc = "一种紧凑型高分辨率扫描模块，用于制造特定设备。"
	icon_state = "scan_module"
	rating = 2

/obj/item/stock_parts/manipulator/nano
	name = "纳米操纵器"
	desc = "一种用于制造特定设备的小型操纵器。"
	icon_state = "nano_mani"
	rating = 2

/obj/item/stock_parts/micro_laser/high
	name = "高功率微型激光"
	desc = "用于特定设备的小型激光器。"
	icon_state = "high_micro_laser"
	rating = 2

/obj/item/stock_parts/matter_bin/adv
	name = "高级物质箱"
	desc = "用于存放待重构压缩物质的容器。"
	icon_state = "advanced_matter_bin"
	rating = 2

//Rating 3

/obj/item/stock_parts/capacitor/super
	name = "超级电容"
	desc = "一种超高容量电容器，用于制造多种设备。"
	rating = 3

/obj/item/stock_parts/scanning_module/phasic
	name = "相移扫描模块"
	desc = "一种紧凑型高分辨率相控扫描模块，用于特定设备的制造。"
	rating = 3

/obj/item/stock_parts/manipulator/pico
	name = "皮可曼操纵器"
	desc = "一种用于制造特定设备的小型操纵器。"
	icon_state = "pico_mani"
	rating = 3

/obj/item/stock_parts/micro_laser/ultra
	name = "超高功率微型激光器"
	icon_state = "ultra_high_micro_laser"
	desc = "用于特定设备的小型激光器。"
	rating = 3

/obj/item/stock_parts/matter_bin/super
	name = "超物质箱"
	desc = "用于存放待重构压缩物质的容器。"
	icon_state = "super_matter_bin"
	rating = 3

// Subspace stock parts

/obj/item/stock_parts/subspace/ansible
	name = "子空间安塞波"
	icon_state = "subspace_ansible"
	desc = "一个能够感知超维度活动的紧凑型模块。"

/obj/item/stock_parts/subspace/filter
	name = "超波过滤器"
	icon_state = "hyperwave_filter"
	desc = "一种微型设备，能够过滤并转换超高强度的无线电波。"

/obj/item/stock_parts/subspace/amplifier
	name = "子空间放大器"
	icon_state = "subspace_amplifier"
	desc = "一种紧凑型微型机器，能够放大微弱的子空间传输信号。"

/obj/item/stock_parts/subspace/treatment
	name = "子空间治疗盘"
	icon_state = "treatment_disk"
	desc = "一种紧凑型微型机器，能够拉伸超压缩的无线电波。"

/obj/item/stock_parts/subspace/analyzer
	name = "子空间波长分析仪"
	icon_state = "wavelength_analyzer"
	desc = "一种能够分析神秘子空间波长的高级分析仪。"

/obj/item/stock_parts/subspace/crystal
	name = "安塞波水晶"
	icon_state = "ansible_crystal"
	desc = "一种由纯玻璃制成的晶体，用于向子空间传输激光数据脉冲。"

/obj/item/stock_parts/subspace/transmitter
	name = "子空间发射器"
	icon_state = "subspace_transmitter"
	desc = "用于打开通往子空间维度窗口的大型设备。"



//Construction Item for the SMES
/obj/item/stock_parts/smes_coil
	name = "超导磁力线圈"
	desc = "重型超导磁线圈，主要用于建造SMES单元。"
	icon_state = "smes_coil"			// Just few icons patched together. If someone wants to make better icon, feel free to do so!
	w_class = WEIGHT_CLASS_BULKY 						// It's LARGE (backpack size)
	var/ChargeCapacity = 5000000
	var/IOCapacity = 250000

