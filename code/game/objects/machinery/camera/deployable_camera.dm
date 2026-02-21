GLOBAL_VAR_INIT(deployed_cameras, 0)

/obj/machinery/camera/deployable
	name = "'胡金'ROC-58 观测者"
	desc = "ROC-58可部署摄像头，专为野外使用设计，旨在提升监控的战术效用。"
	network = list("marinesl", "marine")
	icon_state = "deployable"
	layer = ABOVE_ALL_MOB_LAYER//it flies after all

/obj/machinery/camera/deployable/Initialize(mapload, newDir)
	. = ..()
	RegisterSignal(SSdcs, COMSIG_GLOB_CAMPAIGN_MISSION_ENDED, PROC_REF(on_mission_end))

/obj/machinery/camera/deployable/update_icon_state()
	. = ..()
	if(obj_integrity <= 0)
		icon_state = "deployableoff"
	else
		icon_state = "deployable"

///Deletes itself on campaign mission end
/obj/machinery/camera/deployable/proc/on_mission_end(datum/source, /datum/campaign_mission/ending_mission, winning_faction)
	SIGNAL_HANDLER
	qdel(src)

/obj/item/deployable_camera
	name = "未部署的'胡金'ROC-58观察者"
	desc = "用于监控系统的可部署摄像头。"
	icon = 'icons/obj/machines/monitors.dmi'
	icon_state = "deployableitem"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/deployable_camera/attack_self(mob/user)
	user.visible_message(span_notice("[user] 将 [src] 抛向空中！"),
		span_notice("You throw [src] into the air!"))

	for(var/mob/living/silicon/ai/AI AS in GLOB.ai_list)
		to_chat(AI, span_notice("注意 - [AREACOORD_NO_Z(user)]已部署'胡金'ROC-58观察者。"))
	var/obj/machinery/camera/deployable/newcam = new(get_turf(user))
	var/dat
	if(ishuman(user))
		var/mob/living/carbon/human/squaddie = user
		var/datum/squad/squad = squaddie.assigned_squad
		if(squad)
			newcam.network += list("[lowertext(squad.name)]")
			dat += squad.name
			dat += " "
	dat += newcam.name
	GLOB.deployed_cameras++
	dat += " [GLOB.deployed_cameras]"
	newcam.name = dat
	newcam.c_tag = newcam.name
	newcam.setDir(user.dir)
	qdel(src)
