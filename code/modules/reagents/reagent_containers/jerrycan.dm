/obj/item/reagent_containers/jerrycan
	name = "\improper 油桶"
	desc = "一个装满燃料的罐子，用于点燃物品。侧面印有'绝对杰瑞'字样。"
	icon = 'icons/obj/items/tank.dmi'
	icon_state = "canister"
	w_class = WEIGHT_CLASS_BULKY
	volume = 200
	list_reagents = list(/datum/reagent/fuel = 200)
	///how much fuel we use up per spill
	var/fuel_usage = 10

/obj/item/reagent_containers/jerrycan/examine(mob/user as mob)
	. = ..()
	if(!reagents)
		return
	if(get_dist(user,src) > 2)
		. += span_warning("You're too far away to see [src]'s reagent amount!")
		return
	. += "There is [reagents.reagent_list ? reagents.total_volume : 0] units of fuel remaining."

/obj/item/reagent_containers/jerrycan/attack_turf(turf/A, mob/user)
	. = ..()
	if(A.density)
		return
	if(!reagents.total_volume)
		to_chat(user, span_warning("[src]里没有燃料了！"))
		return
	new /obj/effect/decal/cleanable/liquid_fuel(A, fuel_usage/2)
	reagents.remove_reagent(/datum/reagent/fuel, fuel_usage)
	user.visible_message(span_notice("[user] 往 \the [A] 上泼了些燃料"), span_notice("You splash some fuel on [A]"))
	log_attack("[key_name(user)] has splashed fuel on  [A] in [AREACOORD(user)]")
	A.add_fingerprint(user, "attack_turf", "doused with fuel from [src]")

/obj/item/reagent_containers/jerrycan/attack(mob/living/M, mob/living/user)
	. = ..()
	if(!reagents.total_volume)
		to_chat(user, span_warning("[src]里没有燃料了！"))
		return
	M.adjust_fire_stacks(10)
	reagents.remove_reagent(/datum/reagent/fuel, fuel_usage)
	user.visible_message(span_notice("[user]往[M]身上泼了一些燃料"), span_notice("You splash some fuel on [M]"), ignored_mob = M)
	to_chat(M, "<span class='warning'>[user]用[src]把你浇了个透！<span>")
	log_attack("[key_name(user)] has doused [M] in fuel in [AREACOORD(user)]")

/obj/item/reagent_containers/jerrycan/attack_obj(obj/target_object, mob/living/user)
	if(istype(target_object, /obj/alien/weeds))
		return attack_turf(get_turf(target_object), user)
	return ..()
