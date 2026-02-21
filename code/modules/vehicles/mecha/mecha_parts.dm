/////////////////////////
////// Mecha Parts //////
/////////////////////////

/obj/item/mecha_parts
	name = "机甲部件"
	icon = 'icons/mecha/mech_construct.dmi'
	icon_state = "blank"
	w_class = WEIGHT_CLASS_GIGANTIC

/obj/item/mecha_parts/proc/try_attach_part(mob/user, obj/vehicle/sealed/mecha/M, attach_right = FALSE) //For attaching parts to a finished mech
	if(!user.transferItemToLoc(src, M))
		to_chat(user, span_warning("\The [src] 粘在你手上了，你无法把它放进 \the [M]！"))
		return FALSE
	user.visible_message(span_notice("[user]将[src]安装到[M]上。"), span_notice("You attach [src] to [M]."))
	return TRUE

/obj/item/mecha_parts/part/try_attach_part(mob/user, obj/vehicle/sealed/mecha/M, attach_right = FALSE)
	return

/obj/item/mecha_parts/chassis
	name = "机甲底盘"
	icon_state = "backbone"

/////////// Ripley

/obj/item/mecha_parts/chassis/ripley
	name = "\improper 里普利底盘"

/obj/item/mecha_parts/part/ripley_torso
	name = "\improper 里普利躯干"
	desc = "雷普利APLU的躯干部分。包含动力单元、处理核心和生命维持系统。"
	icon_state = "ripley_harness"

/obj/item/mecha_parts/part/ripley_left_arm
	name = "\improper 里普利左臂"
	desc = "一台里普利APLU左臂。数据和电源接口与大多数外骨骼工具兼容。"
	icon_state = "ripley_l_arm"

/obj/item/mecha_parts/part/ripley_right_arm
	name = "\improper 里普利右臂"
	desc = "一台里普利APLU的右臂。数据和电源接口与大多数外骨骼工具兼容。"
	icon_state = "ripley_r_arm"

/obj/item/mecha_parts/part/ripley_left_leg
	name = "\improper 里普利左腿"
	desc = "一台里普利APLU左腿。包含较为复杂的伺服驱动和平衡维持系统。"
	icon_state = "ripley_l_leg"

/obj/item/mecha_parts/part/ripley_right_leg
	name = "\improper 里普利右腿"
	desc = "一台里普利APLU的右腿。包含相当复杂的伺服驱动器和平衡维持系统。"
	icon_state = "ripley_r_leg"

////////// Firefighter

/obj/item/mecha_parts/chassis/firefighter
	name = "\improper 消防员底盘"

///////// Odysseus

/obj/item/mecha_parts/chassis/odysseus
	name = "\improper 奥德修斯底盘"

/obj/item/mecha_parts/part/odysseus_head
	name = "\improper 奥德修斯头部"
	desc = "奥德修斯头部。包含集成的医疗HUD扫描仪。"
	icon_state = "odysseus_head"

/obj/item/mecha_parts/part/odysseus_torso
	name = "\improper 奥德修斯躯干"
	desc = "奥德修斯躯干部件。包含动力单元、处理核心和生命维持系统，以及一个用于安装休眠舱的枪械配件接口。"
	icon_state = "odysseus_torso"

/obj/item/mecha_parts/part/odysseus_left_arm
	name = "\improper 奥德修斯左臂"
	desc = "奥德修斯左臂。数据与电源接口兼容专用医疗设备。"
	icon_state = "odysseus_l_arm"

/obj/item/mecha_parts/part/odysseus_right_arm
	name = "\improper 奥德修斯右臂"
	desc = "奥德修斯右臂。数据与电源接口兼容专用医疗设备。"
	icon_state = "odysseus_r_arm"

/obj/item/mecha_parts/part/odysseus_left_leg
	name = "\improper 奥德修斯左腿"
	desc = "奥德修斯左腿。包含复杂的伺服驱动和平衡维持系统，为危重病人提供稳定性。"
	icon_state = "odysseus_l_leg"

/obj/item/mecha_parts/part/odysseus_right_leg
	name = "\improper 奥德修斯右腿"
	desc = "奥德修斯右腿。包含复杂的伺服驱动和平衡维持系统，为危重患者提供稳定性。"
	icon_state = "odysseus_r_leg"

///////// Gygax

/obj/item/mecha_parts/chassis/gygax
	name = "\improper 吉格斯底盘"

/obj/item/mecha_parts/part/gygax_torso
	name = "\improper 吉格斯躯干"
	desc = "Gygax 的躯干部分。包含动力单元、处理核心和生命维持系统。"
	icon_state = "gygax_harness"

/obj/item/mecha_parts/part/gygax_head
	name = "\improper 吉格斯头部"
	desc = "一台吉格斯机甲头部。内置先进的监视与目标锁定传感器。"
	icon_state = "gygax_head"

/obj/item/mecha_parts/part/gygax_left_arm
	name = "\improper 吉格斯左臂"
	desc = "一台吉格斯机甲的左臂。数据与电源接口兼容大多数外骨骼工具和武器。"
	icon_state = "gygax_l_arm"

/obj/item/mecha_parts/part/gygax_right_arm
	name = "\improper 吉格斯右臂"
	desc = "一台吉格斯的右臂。数据和电源接口与大多数外骨骼工具和武器兼容。"
	icon_state = "gygax_r_arm"

/obj/item/mecha_parts/part/gygax_left_leg
	name = "\improper 吉格斯左腿"
	desc = "一条吉格斯左腿。采用先进的伺服机构和致动器构建，以实现更快的速度。"
	icon_state = "gygax_l_leg"

/obj/item/mecha_parts/part/gygax_right_leg
	name = "\improper 吉格斯右腿"
	desc = "一台吉格斯右腿。采用先进的伺服机构和致动器构建，以实现更快的速度。"
	icon_state = "gygax_r_leg"

/obj/item/mecha_parts/part/gygax_armor
	gender = PLURAL
	name = "\improper 盖高克斯装甲板"
	desc = "一套专为吉格斯机甲设计的装甲板。采用轻量化结构，旨在有效偏转伤害。"
	icon_state = "gygax_armor"

//////////// Durand

/obj/item/mecha_parts/chassis/durand
	name = "\improper 杜兰德底盘"

/obj/item/mecha_parts/part/durand_torso
	name = "\improper 杜兰德躯干"
	desc = "杜兰德的躯干部分。包含动力单元、处理核心和生命支持系统，全部置于坚固的防护框架内。"
	icon_state = "durand_harness"

/obj/item/mecha_parts/part/durand_head
	name = "\improper 杜兰德头部"
	desc = "一台杜兰德头部。内置先进的监视与目标传感器。"
	icon_state = "durand_head"

/obj/item/mecha_parts/part/durand_left_arm
	name = "\improper 杜兰德左臂"
	desc = "一台杜兰德左臂。数据与电源接口兼容大多数外骨骼工具和武器。其拳击威力也相当惊人。"
	icon_state = "durand_l_arm"

/obj/item/mecha_parts/part/durand_right_arm
	name = "\improper 杜兰德右臂"
	desc = "一台杜兰德右臂。数据与电源接口兼容大多数外骨骼工具和武器。其拳击威力也相当惊人。"
	icon_state = "durand_r_arm"

/obj/item/mecha_parts/part/durand_left_leg
	name = "\improper 杜兰德左腿"
	desc = "一台杜兰德左腿。专为支撑杜兰德重型机甲的重量和防御需求而特别加固制造。"
	icon_state = "durand_l_leg"

/obj/item/mecha_parts/part/durand_right_leg
	name = "\improper 杜兰德右腿"
	desc = "一台杜兰德右腿。建造得格外坚固，以支撑杜兰德的沉重重量和防御需求。"
	icon_state = "durand_r_leg"

/obj/item/mecha_parts/part/durand_armor
	gender = PLURAL
	name = "\improper 杜兰德装甲板"
	desc = "一套为杜兰德机甲配备的装甲板。采用重型设计，能够抵御极其强大的物理冲击。"
	icon_state = "durand_armor"

////////// Clarke

/obj/item/mecha_parts/chassis/clarke
	name = "\improper 克拉克底盘"

/obj/item/mecha_parts/part/clarke_torso
	name = "\improper 克拉克躯干"
	desc = "克拉克的躯干部分。包含动力单元、处理核心和生命维持系统。"
	icon_state = "clarke_harness"

/obj/item/mecha_parts/part/clarke_head
	name = "\improper 克拉克头盔"
	desc = "一个克拉克头盔。内置集成式诊断HUD扫描仪。"
	icon_state = "clarke_head"

/obj/item/mecha_parts/part/clarke_left_arm
	name = "\improper 克拉克左臂"
	desc = "一个克拉克左臂。数据和电源接口与大多数外骨骼工具兼容。"
	icon_state = "clarke_l_arm"

/obj/item/mecha_parts/part/clarke_right_arm
	name = "\improper 克拉克右臂"
	desc = "一个克拉克右臂。数据和电源接口与大多数外骨骼工具兼容。"
	icon_state = "clarke_r_arm"

////////// HONK

/obj/item/mecha_parts/chassis/honker
	name = "\improper H.O.N.K底盘"

/obj/item/mecha_parts/part/honker_torso
	name = "\improper H.O.N.K. 躯干"
	desc = "H.O.N.K.的躯干部分。包含笑声单元、香蕉矿核心和鸣笛支持系统。"
	icon_state = "honker_harness"

/obj/item/mecha_parts/part/honker_head
	name = "\improper 鸣鸣头"
	desc = "一个H.O.N.K头部。似乎缺少了面部护板。"
	icon_state = "honker_head"

/obj/item/mecha_parts/part/honker_left_arm
	name = "\improper H.O.N.K 左臂"
	desc = "一个H.O.N.K左臂。带有独特的插槽，可容纳由小丑科学家设计的古怪武器。"
	icon_state = "honker_l_arm"

/obj/item/mecha_parts/part/honker_right_arm
	name = "\improper H.O.N.K 右臂"
	desc = "一个H.O.N.K右臂。带有独特的插槽，可容纳小丑科学家设计的奇特武器。"
	icon_state = "honker_r_arm"

/obj/item/mecha_parts/part/honker_left_leg
	name = "\improper H.O.N.K 左腿"
	desc = "一条H.O.N.K左腿。脚部尺寸刚好能完全容纳一只小丑鞋。"
	icon_state = "honker_l_leg"

/obj/item/mecha_parts/part/honker_right_leg
	name = "\improper H.O.N.K 右腿"
	desc = "一条 H.O.N.K 右腿。脚部看起来刚好大到能完全容纳一只小丑鞋。"
	icon_state = "honker_r_leg"

////////// Phazon

/obj/item/mecha_parts/chassis/phazon
	name = "\improper 法扎恩底盘"

/obj/item/mecha_parts/part/phazon_torso
	name = "\improper 法扎恩躯干"
	desc = "一个法扎恩躯干部件。位于中央的是为外骨骼独特相位驱动器供能的蓝移核心插槽。"
	icon_state = "phazon_harness"

/obj/item/mecha_parts/part/phazon_head
	name = "\improper 法扎恩头盔"
	desc = "一个法扎恩头部。其传感器经过精心校准，即使在相位移动时也能提供视觉和数据。"
	icon_state = "phazon_head"

/obj/item/mecha_parts/part/phazon_left_arm
	name = "\improper 法扎左臂"
	desc = "一条法扎左臂。装甲板下方装有数个微型工具阵列，可根据当前情况进行调整。"
	icon_state = "phazon_l_arm"

/obj/item/mecha_parts/part/phazon_right_arm
	name = "\improper 法扎右臂"
	desc = "一只法扎恩右臂。装甲板下方设有多个微型工具阵列，可根据当前情况进行调整。"
	icon_state = "phazon_r_arm"

/obj/item/mecha_parts/part/phazon_left_leg
	name = "\improper 法扎左腿"
	desc = "一条法扎恩左腿。它包含独特的相位驱动器，启动时能让外骨骼穿过固体物质。"
	icon_state = "phazon_l_leg"

/obj/item/mecha_parts/part/phazon_right_leg
	name = "\improper 法扎右腿"
	desc = "一条法扎恩右腿。它包含独特的相位驱动器，启动时能让外骨骼穿过固体物质。"
	icon_state = "phazon_r_leg"

/obj/item/mecha_parts/part/phazon_armor
	name = "法扎护甲"
	desc = "法扎装甲板。它们覆盖着等离子体层，以保护驾驶员免受相位移动的压力，并具有不寻常的特性。"
	icon_state = "phazon_armor"

// Savannah-Ivanov

/obj/item/mecha_parts/chassis/savannah_ivanov
	name = "\improper 萨凡纳-伊万诺夫底盘"

/obj/item/mecha_parts/part/savannah_ivanov_torso
	name = "\improper 萨凡纳-伊万诺夫躯干"
	desc = "一个萨凡纳-伊万诺夫躯干部件。它缺失了一大块空间……"
	icon_state = "savannah_ivanov_harness"

/obj/item/mecha_parts/part/savannah_ivanov_head
	name = "\improper 萨凡纳-伊万诺夫弹头"
	desc = "一个萨凡纳-伊万诺夫头部。它的传感器已调整为支持平稳着陆。"
	icon_state = "savannah_ivanov_head"

/obj/item/mecha_parts/part/savannah_ivanov_left_arm
	name = "\improper 萨凡纳-伊万诺夫左臂"
	desc = "一个萨凡纳-伊万诺夫左臂。手腕内藏有火箭制造装置。"
	icon_state = "savannah_ivanov_l_arm"

/obj/item/mecha_parts/part/savannah_ivanov_right_arm
	name = "\improper 萨凡纳-伊万诺夫右臂"
	desc = "萨凡纳-伊万诺夫左臂。手腕内藏火箭制造装置。"
	icon_state = "savannah_ivanov_r_arm"

/obj/item/mecha_parts/part/savannah_ivanov_left_leg
	name = "\improper 萨凡纳-伊万诺夫左腿"
	desc = "一条萨凡纳-伊万诺夫左腿。在生产设计中，它们被要求能承载两名以上乘客，因此添加了跳跃功能以避免浪费潜力。"
	icon_state = "savannah_ivanov_l_leg"

/obj/item/mecha_parts/part/savannah_ivanov_right_leg
	name = "\improper 萨凡纳-伊万诺夫右腿"
	desc = "一条萨凡纳-伊万诺夫左腿。在生产设计中，它们被要求能承载两名以上乘客，因此添加了跳跃功能以避免浪费潜力。"
	icon_state = "savannah_ivanov_r_leg"

/obj/item/mecha_parts/part/savannah_ivanov_armor
	name = "萨凡纳-伊万诺夫护甲"
	desc = "萨凡纳-伊万诺夫装甲板。其独特造型和强化设计旨在承受双驾驶员、大幅跳跃和导弹冲击带来的压力。"
	icon_state = "savannah_ivanov_armor"

///////// Circuitboards

/obj/item/circuitboard/mecha
	name = "外骨骼电路板"

	icon_state = "std_mod"
	force = 5
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 0
	throw_speed = 3
	throw_range = 7

/obj/item/circuitboard/mecha/ripley/peripherals
	name = "里普利外设控制模块（外骨骼主板）"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/ripley/main
	name = "里普利中央控制模块（外骨骼主板）"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/gygax/peripherals
	name = "吉格斯外围控制模块（外骨骼主板）"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/gygax/targeting
	name = "吉格斯武器控制与瞄准模块（外骨骼控制板）"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/gygax/main
	name = "吉格斯中央控制模块（外骨骼主板）"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/durand/peripherals
	name = "杜兰德外设控制模块（外骨骼主板）"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/durand/targeting
	name = "杜兰德武器控制与瞄准模块（外骨骼主板）"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/durand/main
	name = "杜兰德中央控制模块（外骨骼主板）"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/honker/peripherals
	name = "H.O.N.K 外设控制模块（外骨骼主板）"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/honker/targeting
	name = "H.O.N.K 武器控制与瞄准模块（外骨骼主板）"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/honker/main
	name = "H.O.N.K 中央控制模块（外骨骼主板）"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/odysseus/peripherals
	name = "奥德修斯外设控制模块（外骨骼主板）"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/odysseus/main
	name = "奥德修斯中央控制模块（外骨骼主板）"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/phazon/peripherals
	name = "法扎恩外设控制模块（外骨骼主板）"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/phazon/targeting
	name = "法扎武器控制与瞄准模块（外骨骼主板）"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/phazon/main
	name = "法扎恩中央控制模块（外骨骼主板）"

/obj/item/circuitboard/mecha/clarke/peripherals
	name = "克拉克外设控制模块（外骨骼主板）"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/clarke/main
	name = "克拉克中央控制模块（外骨骼主板）"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/savannah_ivanov/peripherals
	name = "萨凡纳外围控制模块（外骨骼主板）"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/savannah_ivanov/targeting
	name = "伊万诺夫武器控制与瞄准模块（外骨骼主板）"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/savannah_ivanov/main
	name = "萨凡纳-伊万诺夫组合控制锁定模块（外骨骼主板）"
	icon_state = "mainboard"
