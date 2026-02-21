//Energy weapons

/obj/item/cell/lasgun
	name = "\improper 激光枪电池"
	desc = "一种用于为激光枪供电的专用高密度电池。"
	icon = 'icons/obj/items/ammo/energy.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/weapons/ammo_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/weapons/ammo_right.dmi',
		)
	icon_state = "m43"
	worn_icon_state = null
	maxcharge = 600 ///Changed due to the fact some maps and ERTs spawn with the child, the lasrifle. Charges on guns changed accordingly.
	w_class = WEIGHT_CLASS_NORMAL
	icon_state_mini = "mag_cell"
	charge_overlay = "m43"
	var/reload_delay = 0
	///Magazine flags.
	var/magazine_features_flags = MAGAZINE_REFUND_IN_CHAMBER
	///if the magazine has a special overlay associated with it, i.e. extended mags etc
	var/bonus_overlay = null

/obj/item/cell/lasgun/M43
	name = "\improper M43激光枪电池"
	desc = "M43激光枪专用的高密度电池。"
	charge_overlay = "m43"
	icon_state = "m43"

/obj/item/cell/lasgun/M43/highcap// Large battery
	name = "\improper M43高容量激光枪电池"
	desc = "一种先进、超高容量的电池，用于为M43激光枪供电；比标准激光电池组多出百分之六十的电荷容量。"
	charge_overlay = "m43_e"
	icon_state = "m43_e"
	maxcharge = 1600

/obj/item/cell/lasgun/pulse
	name = "\improper M19C4脉冲电池"
	desc = "一种先进的超高容量电池，用于为M19C4脉冲步枪系统供电；采用脉冲能量而非激光能量，大幅提升了其火力。它还可以自行充电。"
	charge_overlay = "pulse"
	icon_state = "pulse"
	maxcharge = 2000 // 100 shots.
	self_recharge = TRUE
	charge_amount = 25 // 10%, 1 shot
	charge_delay = 2 SECONDS

/obj/item/cell/lasgun/M43/practice
	name = "\improper M43-P激光枪电池"
	desc = "一种专为M43-P训练激光枪设计的高密度电池。它不具备任何伤害能力，但可以反复充电。"
	self_recharge = TRUE
	charge_amount = 25 // 10%, 2 shots
	charge_delay = 2 SECONDS

/obj/item/cell/lasgun/lasrifle
	name = "\improper 地球政府实验型标准电池"
	desc = "一种专用高密度电池，用于为大多数标准陆战队激光枪供电。它通常被称为TE动力电池。"
	charge_overlay = "te"
	icon_state = "te"
	icon_state_mini = "mag_cell_te"
	maxcharge = 600
/obj/item/cell/lasgun/lasrifle/recharger
	name = "\improper 地球政府实验型充电电池"
	desc = "一种从缴获的沃尔凯特装备逆向工程而来的高密度电池原型。由于开发限制和临时拼凑的工艺，以及充电组件占用的空间，其容量表现欠佳。"
	icon_state = "ter"
	maxcharge = 450
	self_recharge = TRUE
	charge_amount = 12 //balanced around recharging 1 standard laser rifle shot per second
	charge_delay = 1 SECONDS
/obj/item/cell/lasgun/fob_sentry/cell
	maxcharge = INFINITY

/obj/item/cell/lasgun/plasma
	name = "\improper WML等离子体能量电池"
	desc = "地球政府殖民地海军陆战队用于等离子体枪的等离子体储存单元。它似乎没有标注保质期。"
	icon_state = "plasma"
	maxcharge = 900
	icon_state_mini = "mag_plasma"
	charge_overlay = "plasma"

//volkite

/obj/item/cell/lasgun/volkite
	name = "沃尔基特能量电池"
	desc = "一种专为伏尔基特武器供电的高密度电池。"
	icon_state = "volkite"
	maxcharge = 1440
	icon_state_mini = "mag_cell"
	charge_overlay = "volkite"

/obj/item/cell/lasgun/volkite/small
	name = "紧凑型沃尔基特能量电池"
	desc = "一种专用紧凑型电池，用于为最小的伏尔基特武器供电。"
	icon_state = "volkite_small"
	maxcharge = 540
	w_class = WEIGHT_CLASS_SMALL
	icon_state_mini = "mag_cell"

/obj/item/cell/lasgun/volkite/turret
	name = "沃尔坎核能电池"
	desc = "专为某些重型火星之子机械（如哨戒炮）设计的核动力电池。随时间缓慢充电。"
	icon_state = "volkite_turret"
	maxcharge = 1800
	icon_state_mini = "mag_cell"
	charge_overlay = "volkite_big"
	self_recharge = TRUE
	charge_amount = 24
	charge_delay = 2 SECONDS

/obj/item/cell/lasgun/volkite/turret/hover_bike
	maxcharge = 1500
	charge_amount = 100

/obj/item/cell/lasgun/volkite/powerpack
	name = "\improper M-70 动力包"
	desc = "一个重型加固背包，配备一组超密度能量电池，连接至微型放射性同位素热电发电机以实现持续供电。用于为最大型的人携式伏尔克武器提供动力。点击拖动电池至能量背包进行充电。"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/backpacks_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/backpacks_right.dmi',
	)
	icon_state = "volkite_powerpack"
	icon = 'icons/obj/items/ammo/powerpack.dmi'
	charge_overlay = null
	atom_flags = CONDUCT
	equip_slot_flags = ITEM_SLOT_BACK
	magazine_features_flags = MAGAZINE_REFUND_IN_CHAMBER|MAGAZINE_WORN
	w_class = WEIGHT_CLASS_HUGE
	slowdown = 0.2
	maxcharge = 3000
	self_recharge = TRUE
	charge_amount = 100
	charge_delay = 2 SECONDS
	light_range = 0.1
	light_power = 0.1
	light_color = LIGHT_COLOR_ORANGE
	///The kind of cells we like to accept around here to charge from us.
	var/cell_type = /obj/item/cell

/obj/item/cell/lasgun/volkite/powerpack/Initialize(mapload)
	. = ..()
	turn_light(null, TRUE)

/obj/item/cell/lasgun/volkite/powerpack/turn_light(mob/user, toggle_on)
	. = ..()
	if(. != CHECKS_PASSED)
		return
	set_light_on(toggle_on)

/obj/item/cell/lasgun/volkite/powerpack/apply_custom(mutable_appearance/standing, inhands, icon_used, state_used)
	. = ..()
	var/mutable_appearance/emissive_overlay = emissive_appearance(icon_used, "[state_used]_emissive", src)
	standing.overlays.Add(emissive_overlay)

///Handles draining power from the powerpack, returns the value of the charge drained to MouseDrop where it's added to the cell.
/obj/item/cell/lasgun/volkite/powerpack/proc/use_charge(mob/user, amount = 0, mention_charge = TRUE)
	var/warning = ""
	if(amount > charge)
		playsound(src, 'sound/machines/buzz-two.ogg', 25, 1)
		if(charge)
			warning = "[src]'s powerpack recharge unit buzzes a warning, its battery only having enough power to partially recharge the cell for [charge] amount."
		else
			warning = "[src]'s powerpack recharge unit buzzes a warning, as its battery is completely depleted of charge."
	else
		playsound(src, 'sound/machines/ping.ogg', 25, 1)
		warning = "[src]'s powerpack recharge unit cheerfully pings as it successfully recharges the cell."
	. = min(charge, amount)
	charge -= .
	if(mention_charge)
		to_chat(user, span_notice("[warning]<b>充能剩余：[charge]/[maxcharge]</b>"))
	update_icon()

/obj/item/cell/lasgun/volkite/powerpack/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return
	if(istype(I, /obj/item/weapon/gun) && loc == user)
		var/obj/item/weapon/gun/gun = I
		if(!CHECK_BITFIELD(gun.reciever_flags, AMMO_RECIEVER_MAGAZINES))
			return
		gun.reload(src, user)
		return

	if(!istype(I, cell_type))
		return
	if(I != user.r_hand && I != user.l_hand)
		to_chat(user, span_warning("[I] 必须在你手中才能这样做。"))
		return
	var/obj/item/cell/D = I
	var/charge_difference = D.maxcharge - D.charge
	if(charge_difference) //If the cell has less than max charge, recharge it.
		var/charge_used = use_charge(user, charge_difference) //consume an appropriate amount of charge
		D.charge += charge_used //Recharge the cell battery with the lower of the difference between its present and max cap, or the remaining charge
		D.update_icon()
	else
		to_chat(user, span_warning("该电池已充满电！"))

/obj/item/cell/lasgun/volkite/powerpack/marine
	name = "\improper TE能量包"
	desc = "一款近期研发的量产型侧附包，可为任何TE科技成就充能。"
	icon_state = "lasgun_pouch"
	charge_overlay = "lasgun_pouch"
	atom_flags = CONDUCT
	equip_slot_flags = ITEM_SLOT_POCKET
	magazine_features_flags = MAGAZINE_REFUND_IN_CHAMBER|MAGAZINE_WORN
	w_class = WEIGHT_CLASS_BULKY
	slowdown = 0
	maxcharge = 2400
	cell_type = /obj/item/cell/lasgun/lasrifle
	self_recharge = FALSE

/obj/item/cell/lasgun/volkite/powerpack/marine/backpack
	name = "\improper TE动力背包"
	desc = "一款近期开发并大规模生产的背包，可为任何TE技术成果充能。"
	icon_state = "lasgun_backpack"
	charge_overlay = "lasgun_backpack"
	equip_slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	maxcharge = 12000
