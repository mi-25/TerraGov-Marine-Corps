#define TELEPORTING_COST 250
/obj/machinery/deployable/teleporter
	density = FALSE
	max_integrity = 200
	resistance_flags = XENO_DAMAGEABLE
	idle_power_usage = 50
	///List of all teleportable types
	var/static/list/teleportable_types = list(
		/obj/structure/closet,
		/mob/living/carbon/human,
		/obj/machinery,
	)
	///List of banned teleportable types
	var/static/list/blacklisted_types = list(
		/obj/machinery/nuclearbomb
	)

/obj/machinery/deployable/teleporter/examine(mob/user)
	. = ..()
	var/obj/item/teleporter_kit/kit = get_internal_item()
	if(!kit?.cell)
		. += "It is currently lacking a power cell."
	if(kit?.linked_teleporter)
		. += "It is currently linked to Teleporter #[kit.linked_teleporter.self_tele_tag] at [get_area(kit.linked_teleporter)]"
	else
		. += "It is not linked to any other teleporter."


/obj/machinery/deployable/teleporter/Initialize(mapload)
	. = ..()
	SSminimaps.add_marker(src, MINIMAP_FLAG_MARINE, image('icons/UI_icons/map_blips.dmi', null, "teleporter", MINIMAP_BLIPS_LAYER))


/obj/machinery/deployable/teleporter/attack_hand(mob/living/user)
	. = ..()
	var/obj/item/teleporter_kit/kit = get_internal_item()
	if(!istype(kit))
		CRASH("A teleporter didn't have an internal item, or it was of the wrong type.")

	if (!powered() && (!kit.cell || kit.cell.charge < TELEPORTING_COST))
		to_chat(user, span_warning("\the [src]上的红灯闪烁。看来它电力不足。"))
		playsound(loc,'sound/machines/buzz-two.ogg', 25, FALSE)
		return

	if(!COOLDOWN_FINISHED(kit, teleport_cooldown))
		to_chat(user, span_warning("\The [src] 仍在充能中！将在 [round(COOLDOWN_TIMELEFT(kit, teleport_cooldown) / 10)] 秒后准备就绪。"))
		return

	if(!kit.linked_teleporter)
		to_chat(user, span_warning("\The [src] 未链接到任何其他传送器。"))
		return

	if(!istype(kit.linked_teleporter.loc, /obj/machinery/deployable/teleporter))
		to_chat(user, span_warning("另一台传送器尚未部署！"))
		return

	var/obj/machinery/deployable/teleporter/deployed_linked_teleporter = kit.linked_teleporter.loc
	var/obj/item/teleporter_kit/linked_kit = deployed_linked_teleporter.get_internal_item()

	if(deployed_linked_teleporter.z != z)
		to_chat(user, span_warning("[src]与[deployed_linked_teleporter]距离太远！"))
		return

	if(!deployed_linked_teleporter.powered() && (!linked_kit?.cell || linked_kit.cell.charge < TELEPORTING_COST))
		to_chat(user, span_warning("[deployed_linked_teleporter] 未通电！"))
		return

	var/list/atom/movable/teleporting = list()
	for(var/atom/movable/thing in loc)
		if(is_type_in_list(thing, blacklisted_types))
			continue
		if(is_type_in_list(thing, teleportable_types) && !thing.anchored)
			teleporting += thing

	if(!length(teleporting))
		to_chat(user, span_warning("未在[src]上检测到可传送内容！"))
		return

	do_sparks(5, TRUE, src)
	playsound(loc,'sound/effects/phasein.ogg', 50, FALSE)
	COOLDOWN_START(kit, teleport_cooldown, 2 SECONDS)
	COOLDOWN_START(linked_kit, teleport_cooldown, 2 SECONDS)
	if(powered())
		use_power(TELEPORTING_COST * 200)
	else
		kit.cell.charge -= TELEPORTING_COST
	update_icon()
	if(deployed_linked_teleporter.powered())
		deployed_linked_teleporter.use_power(TELEPORTING_COST * 200)
	else
		linked_kit.cell.charge -= TELEPORTING_COST
	deployed_linked_teleporter.update_icon()
	for(var/atom/movable/thing_to_teleport AS in teleporting)
		thing_to_teleport.forceMove(get_turf(deployed_linked_teleporter))

/obj/machinery/deployable/teleporter/attack_ghost(mob/dead/observer/user)
	var/obj/item/teleporter_kit/kit = internal_item
	if(!istype(kit) || !kit.linked_teleporter)
		return
	user.forceMove(get_turf(kit.linked_teleporter))

/obj/machinery/deployable/teleporter/crowbar_act(mob/living/user, obj/item/I)
	. = ..()
	if(!user)
		return
	var/obj/item/teleporter_kit/kit = get_internal_item()
	if(!istype(kit))
		CRASH("A teleporter didn't have an internal item, or it was of the wrong type.")
	if(!kit.cell)
		to_chat(user, span_warning("没有电池可供移除！"))
		return
	if(!do_after(user, 2 SECONDS, NONE, src))
		return FALSE
	playsound(loc, 'sound/items/crowbar.ogg', 25, 1)
	to_chat(user , span_notice("你将[kit.cell]从\the [src]中取出。"))
	user.put_in_hands(kit.cell)
	kit.cell = null
	update_icon()

/obj/machinery/deployable/teleporter/attackby(obj/item/I, mob/user, params)
	if(!ishuman(user))
		return FALSE
	if(!istype(I, /obj/item/cell))
		return FALSE
	var/obj/item/teleporter_kit/kit = get_internal_item()
	if(!istype(kit))
		CRASH("A teleporter didn't have an internal item, or it was of the wrong type.")
	if(kit?.cell)
		to_chat(user , span_warning("里面已经有一个电池了，用撬棍把它取出来。"))
		return FALSE
	if(!do_after(user, 2 SECONDS, NONE, src))
		return FALSE
	user.temporarilyRemoveItemFromInventory(I)
	I.forceMove(kit)
	kit.cell = I
	playsound(loc, 'sound/items/deconstruct.ogg', 25, 1)
	update_icon()

/obj/machinery/deployable/teleporter/update_icon_state()
	. = ..()
	var/obj/item/teleporter_kit/kit = get_internal_item()
	if(powered() || kit?.cell?.charge > TELEPORTING_COST)
		icon_state = default_icon_state + "_on"
		return
	icon_state = default_icon_state

/obj/item/teleporter_kit
	name = "\improper ASRS 蓝移传送器"
	desc = "用于将人员和装备短距离传送至另一预链接传送器的超空间传送台。Ctrl+点击地面部署，使用扳手回收，使用撬棍移除电源。"
	icon = 'icons/obj/structures/teleporter.dmi'
	icon_state = "teleporter"

	max_integrity = 200
	item_flags = IS_DEPLOYABLE|DEPLOYED_WRENCH_DISASSEMBLE

	w_class = WEIGHT_CLASS_BULKY
	equip_slot_flags = ITEM_SLOT_BACK
	///The linked teleporter
	var/obj/item/teleporter_kit/linked_teleporter
	///The optional cell to power the teleporter if off the grid
	var/obj/item/cell/cell
	COOLDOWN_DECLARE(teleport_cooldown)

	///Tag for teleporters number. Exists for fluff reasons. Shared variable.
	var/static/tele_tag = 78
	///References to the number of the teleporter.
	var/self_tele_tag

/obj/item/teleporter_kit/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/deployable_item, /obj/machinery/deployable/teleporter, 2 SECONDS, 2 SECONDS)
	cell = new /obj/item/cell/high(src)
	tele_tag++
	self_tele_tag = tele_tag
	name = "\improper ASRS 蓝空间传送器 #[tele_tag]"


/obj/item/teleporter_kit/Destroy()
	if(linked_teleporter)
		linked_teleporter.linked_teleporter = null
		linked_teleporter = null
	QDEL_NULL(cell)
	return ..()

///Link the two teleporters
/obj/item/teleporter_kit/proc/set_linked_teleporter(obj/item/teleporter_kit/link_teleport)
	if(linked_teleporter)
		CRASH("A teleporter was linked with another teleporter even though it already has a twin!")
	if(link_teleport == src)
		CRASH("A teleporter was linked with itself!")
	linked_teleporter = link_teleport

/obj/item/teleporter_kit/attackby(obj/item/I, mob/user, params)
	if(!ishuman(user))
		return FALSE
	if(!istype(I, /obj/item/teleporter_kit))
		return

	var/obj/item/teleporter_kit/gadget = I
	if(linked_teleporter)
		balloon_alert(user, "已连接！")
		return
	if(linked_teleporter == src)
		balloon_alert(user, "无法将其链接到自身！")
		return
	linked_teleporter = linked_teleporter
	balloon_alert(user, "已链接")

	set_linked_teleporter(gadget)
	gadget.set_linked_teleporter(src)
	return

/obj/item/teleporter_kit/attack_self(mob/user)
	do_unique_action(user)

/obj/item/teleporter_kit/attack_ghost(mob/dead/observer/user)
	if(!linked_teleporter)
		return
	user.forceMove(get_turf(linked_teleporter))

/obj/effect/teleporter_linker
	name = "\improper ASRS 超空间传送器"
	desc = "两座用于将人员和装备短距离传送至另一座预链接传送器的蓝空传送台。"

/obj/effect/teleporter_linker/Initialize(mapload)
	. = ..()
	var/obj/item/teleporter_kit/teleporter_a = new(loc)
	var/obj/item/teleporter_kit/teleporter_b = new(loc)
	teleporter_a.set_linked_teleporter(teleporter_b)
	teleporter_b.set_linked_teleporter(teleporter_a)
	qdel(src)

