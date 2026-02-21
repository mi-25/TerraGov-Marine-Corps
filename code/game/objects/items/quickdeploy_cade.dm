//An item thats meant to be a template for quickly deploying stuff like barricades
/obj/item/quikdeploy
	name = "快速部署系统"
	desc = "这是快速部署系统，可极速放置各类物体。"
	icon = 'icons/obj/items/quikdeploy_cade.dmi'
	w_class = WEIGHT_CLASS_SMALL //While this is small, normal 50 stacks of metal is NORMAL so this is a bit on the bad space to cade ratio
	var/delay = 0 //Delay on deploying the thing
	var/atom/movable/thing_to_deploy = null

/obj/item/quikdeploy/examine(mob/user)
	. = ..()
	. += "This QuikDeploy system seems to deploy a [thing_to_deploy.name]."

/obj/item/quikdeploy/attack_self(mob/user)
	balloon_alert_to_viewers("正在部署路障...")
	if(!do_after(user, delay, NONE, src, BUSY_ICON_BUILD))
		balloon_alert(user, "停止部署")
		return
	if(can_place(user)) //can_place() handles sending the error and success messages to the user
		var/obj/O = new thing_to_deploy(get_turf(user))
		O.setDir(user.dir)
		playsound(loc, 'sound/items/ratchet.ogg', 25, TRUE)
		qdel(src)

/obj/item/quikdeploy/proc/can_place(mob/user)
	if(isnull(thing_to_deploy)) //Spaghetti or wrong type spawned
		to_chat(user, "<span class='warning'>这东西实际上啥也干不了！去找给你的人抱怨吧</span>")
		return FALSE
	return TRUE

/obj/item/quikdeploy/cade
	thing_to_deploy = /obj/structure/barricade/solid
	icon_state = "metal"
	delay = 3 SECONDS

/obj/item/quikdeploy/cade/can_place(mob/user)
	. = ..()
	if(!.)
		return FALSE

	var/turf/mystery_turf = user.loc
	if(!isopenturf(mystery_turf))
		balloon_alert(user, "区域不合适！")
		return FALSE

	var/turf/open/placement_loc = mystery_turf
	var/area/area = get_area(mystery_turf)
	if(placement_loc.density || !placement_loc.allow_construction || area.area_flags & NO_CONSTRUCTION) //We shouldn't be building here.
		balloon_alert(user, "不适宜区域！")
		return FALSE

	for(var/obj/thing in user.loc)
		if(!thing.density) //not dense, move on
			continue
		if(!(thing.atom_flags & ON_BORDER)) //dense and non-directional, end
			balloon_alert(user, "没有空间！")
			return FALSE
		if(thing.dir != user.dir)
			continue
		balloon_alert(user, "没有空间！")
		return FALSE
	balloon_alert_to_viewers("路障已放置")
	return TRUE

/obj/item/quikdeploy/cade/plasteel
	thing_to_deploy = /obj/structure/barricade/folding
	icon_state = "plasteel"
