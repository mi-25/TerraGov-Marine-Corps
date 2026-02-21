
//Not to be confused with /obj/item/reagent_containers/food/drinks/bottle

/obj/item/reagent_containers/glass/bottle
	name = "瓶子"
	desc = "一个小瓶子。"
	icon = 'icons/obj/items/chemistry.dmi'
	icon_state = null
	worn_icon_state = "bottle"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,25,30,60)
	volume = 60
	attack_speed = 4

/obj/item/reagent_containers/glass/bottle/on_reagent_change()
	update_icon()

/obj/item/reagent_containers/glass/bottle/pickup(mob/user)
	..()
	update_icon()

/obj/item/reagent_containers/glass/bottle/dropped(mob/user)
	..()
	update_icon()

/obj/item/reagent_containers/glass/bottle/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	update_icon()

/obj/item/reagent_containers/glass/bottle/Initialize(mapload)
	. = ..()
	if(!icon_state)
		icon_state = "bottle-[rand(1, 5)]"

/obj/item/reagent_containers/glass/bottle/update_overlays()
	. = ..()

	if(reagents.total_volume && (icon_state == "bottle-1" || icon_state == "bottle-2" || icon_state == "bottle-3" || icon_state == "bottle-4")) //only for those who have reagentfillings icons
		var/image/filling = image('icons/obj/reagentfillings.dmi', src, "[icon_state]10")

		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if(0 to 9)
				filling.icon_state = "[icon_state]--10"
			if(10 to 24)
				filling.icon_state = "[icon_state]-10"
			if(25 to 49)
				filling.icon_state = "[icon_state]-25"
			if(50 to 74)
				filling.icon_state = "[icon_state]-50"
			if(75 to 79)
				filling.icon_state = "[icon_state]-75"
			if(80 to 90)
				filling.icon_state = "[icon_state]-80"
			if(91 to INFINITY)
				filling.icon_state = "[icon_state]-100"

		filling.color = mix_color_from_reagents(reagents.reagent_list)
		. += filling

	if (!is_open_container())
		var/image/lid = image(icon, src, "lid_bottle")
		. += lid

/obj/item/reagent_containers/glass/bottle/empty //Because the parent has RNG icon_state
	icon_state = "bottle-1" //Same one when you make a bottle in the chem master

/obj/item/reagent_containers/glass/bottle/inaprovaline
	name = "\improper 伊纳普洛林瓶"
	desc = "一个小瓶子。内含依那普林——用于稳定患者状况。"
	icon_state = "bottle19"
	list_reagents = list(/datum/reagent/medicine/inaprovaline = 60)
	item_flags = CAN_REFILL

/obj/item/reagent_containers/glass/bottle/kelotane
	name = "\improper 凯洛坦药瓶"
	desc = "一个小瓶子。内含凯洛坦——用于治疗烧伤区域。"
	icon_state = "bottle15"
	list_reagents = list(/datum/reagent/medicine/kelotane = 60)
	item_flags = CAN_REFILL

/obj/item/reagent_containers/glass/bottle/dexalin
	name = "\improper 地克西林瓶"
	desc = "一个小瓶子。内含地克西林——用于为血液供氧。"
	icon_state = "bottle10"
	list_reagents = list(/datum/reagent/medicine/dexalin = 60)
	item_flags = CAN_REFILL

/obj/item/reagent_containers/glass/bottle/spaceacillin
	name = "\improper 太空青霉素瓶"
	desc = "一个小瓶子。内含太空青霉素——用于治疗感染伤口。"
	icon_state = "bottle8"
	list_reagents = list(/datum/reagent/medicine/spaceacillin = 60)
	item_flags = CAN_REFILL

/obj/item/reagent_containers/glass/bottle/leporazine
	name = "\improper 莱珀嗪瓶"
	desc = "一个小瓶子。内含勒波拉嗪——用于稳定体温。"
	icon_state = "bottle17"
	list_reagents = list(/datum/reagent/medicine/leporazine = 60)
	item_flags = CAN_REFILL

/obj/item/reagent_containers/glass/bottle/toxin
	name = "毒素瓶"
	desc = "一小瓶毒素。请勿饮用，有毒。"
	icon_state = "bottle12"
	list_reagents = list(/datum/reagent/toxin = 60)

/obj/item/reagent_containers/glass/bottle/cyanide
	name = "氰化物瓶"
	desc = "一小瓶氰化物。苦杏仁味？"
	icon_state = "bottle12"
	list_reagents = list(/datum/reagent/toxin/cyanide = 60)

/obj/item/reagent_containers/glass/bottle/sleeptoxin
	name = "麻醉剂瓶"
	desc = "一小瓶安眠药。光是闻闻气味就让人昏昏欲睡。"
	icon_state = "bottle20"
	list_reagents = list(/datum/reagent/toxin/sleeptoxin = 60)
	item_flags = CAN_REFILL

/obj/item/reagent_containers/glass/bottle/chloralhydrate
	name = "水合氯醛瓶"
	desc = "一小瓶水合氯醛。米奇的最爱！"
	icon_state = "bottle20"
	list_reagents = list(/datum/reagent/toxin/chloralhydrate = 60)

/obj/item/reagent_containers/glass/bottle/dylovene
	name = "地洛芬瓶"
	desc = "一小瓶迪洛芬。用于对抗毒素。基本上是一种解毒剂。"
	icon_state = "bottle16"
	list_reagents = list(/datum/reagent/medicine/dylovene = 60)
	item_flags = CAN_REFILL

/obj/item/reagent_containers/glass/bottle/mutagen
	name = "不稳定诱变剂瓶"
	desc = "一小瓶不稳定的诱变剂。会随机改变接触者的DNA结构。"
	icon_state = "bottle7"
	list_reagents = list(/datum/reagent/toxin/mutagen = 60)

/obj/item/reagent_containers/glass/bottle/ammonia
	name = "氨水瓶"
	desc = "一小瓶氨水。一种无色、有刺激性气味的气体。"
	icon_state = "bottle20"
	list_reagents = list(/datum/reagent/ammonia = 60)

/obj/item/reagent_containers/glass/bottle/diethylamine
	name = "二乙胺瓶"
	desc = "一小瓶二乙胺。一种从氨和乙醇中获得的有机化合物。"
	icon_state = "bottle17"
	list_reagents = list(/datum/reagent/diethylamine = 60)


/obj/item/reagent_containers/glass/bottle/pacid
	name = "聚三硝基酸液瓶"
	desc = "一个小瓶子。内含少量聚三硝基酸液。"
	icon_state = "bottle17"
	list_reagents = list(/datum/reagent/toxin/acid/polyacid = 60)

/obj/item/reagent_containers/glass/bottle/adminordrazine
	name = "\improper 管理灵药瓶"
	desc = "一个小瓶子。装着众神的液体精华。"
	icon = 'icons/obj/items/drinks.dmi'
	icon_state = "holyflask"
	list_reagents = list(/datum/reagent/medicine/adminordrazine = 60)

/obj/item/reagent_containers/glass/bottle/capsaicin
	name = "\improper 辣椒素瓶"
	desc = "一个小瓶子。装着辣酱。"
	icon_state = "bottle3"
	list_reagents = list(/datum/reagent/consumable/capsaicin = 60)

/obj/item/reagent_containers/glass/bottle/frostoil
	name = "\improper 寒霜油瓶"
	desc = "一个小瓶子。内含冷酱汁。"
	icon_state = "bottle17"
	list_reagents = list(/datum/reagent/consumable/frostoil = 60)

/obj/item/reagent_containers/glass/bottle/bicaridine
	name = "\improper 比卡立定药瓶"
	desc = "一个小瓶子。内含比卡立定——医生用于治疗钝器伤害。"
	icon_state = "bottle3"
	list_reagents = list(/datum/reagent/medicine/bicaridine = 60)
	item_flags = CAN_REFILL

/obj/item/reagent_containers/glass/bottle/tramadol
	name = "\improper 曲马多药瓶"
	desc = "一个小瓶子。内含曲马多——用作基础止痛药。"
	icon_state = "bottle18"
	volume = 60
	list_reagents = list(/datum/reagent/medicine/tramadol = 60)
	item_flags = CAN_REFILL

/obj/item/reagent_containers/glass/bottle/oxycodone
	name = "\improper 羟考酮药瓶"
	desc = "一个非常小的瓶子。内含羟考酮——用作强效止痛药。"
	icon_state = "bottle2"
	volume = 60
	list_reagents = list(/datum/reagent/medicine/oxycodone = 60)
	free_refills = FALSE

/obj/item/reagent_containers/glass/bottle/hypervene
	name = "\improper 海珀文瓶"
	desc = "一个小瓶子。内含海珀文——一种用于清除毒素的净化剂。会引起疼痛和呕吐。"
	icon_state = "bottle3"
	volume = 10
	list_reagents = list(/datum/reagent/hypervene = 10)

/obj/item/reagent_containers/glass/bottle/tricordrazine
	name = "\improper 三卡嗪药瓶"
	desc = "一个小瓶子。内含三氯二嗪——用作通用的创伤治疗药物。"
	icon_state = "bottle-5"
	list_reagents = list(/datum/reagent/medicine/tricordrazine = 60)

/obj/item/reagent_containers/glass/bottle/paracetamol
	name = "\improper 扑热息痛药瓶"
	desc = "一个小瓶子。内含扑热息痛——一种温和、简单的止痛药，适合应对繁重劳动。"
	icon_state = "bottle-1"
	list_reagents = list(/datum/reagent/medicine/paracetamol = 60)

/obj/item/reagent_containers/glass/bottle/isotonic
	name = "\improper 生理盐水-葡萄糖瓶"
	desc = "一个小瓶子。内含生理盐水-葡萄糖溶液，也称为等渗溶液——用于帮助身体恢复血液。"
	icon_state = "bottle-1"
	list_reagents = list(/datum/reagent/medicine/saline_glucose = 60)

/obj/item/reagent_containers/glass/bottle/meralyne
	name = "\improper 梅拉琳瓶"
	desc = "一个小瓶子。内含梅拉林——用于治疗严重钝伤的强效药物。"
	icon_state = "bottle14"
	list_reagents = list(/datum/reagent/medicine/meralyne = 60)

/obj/item/reagent_containers/glass/bottle/dermaline
	name = "\improper 德玛林瓶"
	desc = "一个小瓶子。内含皮肤灵——用作烧伤的强效治疗剂。"
	icon_state = "bottle15"
	list_reagents = list(/datum/reagent/medicine/dermaline = 60)

/obj/item/reagent_containers/glass/bottle/meraderm
	name = "\improper 梅拉得姆药瓶"
	desc = "一个小瓶子。内含梅拉林和德马林——用作治疗物理损伤的强效药剂。"
	icon_state = "bottle19"
	list_reagents = list(/datum/reagent/medicine/dermaline = 30, /datum/reagent/medicine/meralyne = 30)

/obj/item/reagent_containers/glass/bottle/nanoblood
	name = "\improper 纳米血液瓶"
	desc = "一个小瓶子。内含纳米血液——用于治疗大量失血。"
	icon_state = "bottle3"
	list_reagents = list(/datum/reagent/medicine/nanoblood = 60)

/obj/item/reagent_containers/glass/bottle/polyhexanide
	name = "\improper 聚己酰胺瓶"
	desc = "一个小瓶子。内含聚己双胍——用作内部手术的强力消毒剂。"
	icon_state = "bottle2"
	list_reagents = list(/datum/reagent/medicine/polyhexanide = 60)

/obj/item/reagent_containers/glass/bottle/lemoline
	name = "\improper 柠檬汽水瓶"
	desc = "一个小瓶子。内含10单位柠檬灵，一种用于制造高级药物的试剂。"
	icon_state = "bottle-5"
	list_reagents = list(/datum/reagent/medicine/lemoline = 10)

/obj/item/reagent_containers/glass/bottle/lemoline/doctor
	desc = "一个小瓶子。内含30单位柠檬碱，一种用于制造高级药物的试剂。"
	list_reagents = list(/datum/reagent/medicine/lemoline = 30)

/obj/item/reagent_containers/glass/bottle/doctor_delight
	name = "\improper 医生之悦酒瓶"
	desc = "一个小瓶子。内含'医生之悦'——功能类似三氯二嗪，但效果较弱且会让患者感到饥饿。"
	icon_state = "bottle3"
	list_reagents = list(/datum/reagent/consumable/doctor_delight = 60)
