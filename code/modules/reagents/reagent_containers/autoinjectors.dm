/obj/item/reagent_containers/hypospray/autoinjector
	name = "通用自动注射器"
	desc = "一支自动注射器，里面装着……食盐？<i>背面写着：'如需客户协助，请联系编码巴士'。</i>"
	icon_state = "autoinjector"
	worn_icon_state = "hypo"
	w_class = WEIGHT_CLASS_TINY
	skilllock = 0
	reagent_flags = DRAWABLE
	amount_per_transfer_from_this = 10
	volume = 30
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 30)

/obj/item/reagent_containers/hypospray/autoinjector/update_icon_state()
	. = ..()
	if(!(reagents?.total_volume) && is_drawable())
		icon_state += "X"
		name = "已消耗 [name]" //So people can see what have been expended since we have smexy new sprites people aren't used too...
		DISABLE_BITFIELD(reagents.reagent_flags, DRAWABLE)
	else if(reagents?.total_volume && !CHECK_BITFIELD(reagents.reagent_flags, DRAWABLE)) // refilling it somehow
		icon_state = initial(icon_state)
		name = initial(name)
		ENABLE_BITFIELD(reagents.reagent_flags, DRAWABLE)

/obj/item/reagent_containers/hypospray/autoinjector/examine(mob/user)
	. = ..()
	if(length(reagents.reagent_list))
		. += span_notice("It is currently loaded.")
	else
		. += span_notice("It is spent.")

	. += span_notice("Use to inject into yourself. Unique Action to configure injection amount.")

/obj/item/reagent_containers/hypospray/autoinjector/fillable
	desc = "一个自动注射器，里面装着……某种东西，请咨询给你这个的医生。"
	amount_per_transfer_from_this = 30
	list_reagents = null

/obj/item/reagent_containers/hypospray/autoinjector/tricordrazine
	name = "三卡多拉嗪自动注射器"
	desc = "装有3剂量的三氯哒嗪自动注射器，一种用于治疗伤害的弱效通用药物。"
	icon_state = "autoinjector-4"
	list_reagents = list(/datum/reagent/medicine/tricordrazine = 30)
	description_overlay = "Ti"

/obj/item/reagent_containers/hypospray/autoinjector/combat
	name = "战斗自动注射器"
	desc = "装有2剂治疗和止痛化学品的自动注射器。适用于实战环境。"
	icon_state = "RedGreen"
	amount_per_transfer_from_this = 15
	list_reagents = list(
		/datum/reagent/medicine/bicaridine = 10,
		/datum/reagent/medicine/kelotane = 10,
		/datum/reagent/medicine/tricordrazine = 5,
		/datum/reagent/medicine/tramadol = 5,
	)
	description_overlay = "Cb"

/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced
	name = "高级战斗自动注射器"
	desc = "装载有2剂高级治疗与止痛化学物质的自动注射器。适用于战斗中使用。"
	icon_state = "Lilac"
	amount_per_transfer_from_this = 15
	list_reagents = list(
		/datum/reagent/medicine/meralyne = 10,
		/datum/reagent/medicine/dermaline = 10,
		/datum/reagent/medicine/oxycodone = 10,
	)
	description_overlay = "Ca"

/obj/item/reagent_containers/hypospray/autoinjector/quickclot
	name = "快速凝血自动注射器"
	desc = "装有3剂快速凝血剂的自注射器，这是一种旨在暂停所有出血的化学制剂。根据需要补充剂量。"
	icon_state = "autoinjector-7"
	list_reagents = list(/datum/reagent/medicine/quickclot = 30)
	description_overlay = "Qk"

/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus
	name = "快速凝血剂自动注射器"
	desc = "装有3剂快速凝血剂的自动注射器，这是一种旨在消除内出血的化学制剂。请与抗毒素配合使用。！切勿在战斗中使用！"
	icon_state = "autoinjector-7"
	amount_per_transfer_from_this = 5
	volume = 15
	list_reagents = list(/datum/reagent/medicine/quickclotplus = 15)
	description_overlay = "Qk+"

/obj/item/reagent_containers/hypospray/autoinjector/dexalinplus
	name = "地克沙林增效自动注射器"
	desc = "装有3剂量的地塞林加强型自动注射器，设计用于立即为全身供氧。"
	icon_state = "autoinjector-2"
	amount_per_transfer_from_this = 1
	volume = 3
	list_reagents = list(/datum/reagent/medicine/dexalinplus = 3)
	description_overlay = "Dx+"

/obj/item/reagent_containers/hypospray/autoinjector/sleeptoxin
	name = "麻醉自动注射器"
	desc = "装有10单位镇静剂的自注射器。能快速让人平静下来，当然是为了手术。"
	icon_state = "autoinjector-8"
	amount_per_transfer_from_this = 10
	volume = 10
	list_reagents = list(
		/datum/reagent/toxin/sleeptoxin = 8,
		/datum/reagent/toxin/chloralhydrate = 2,
	)

/obj/item/reagent_containers/hypospray/autoinjector/dylovene
	name = "地洛芬自动注射器"
	desc = "装有3剂迪洛芬的自动注射器，迪洛芬是一种抗毒素剂，适用于中毒、用药过量和毒素累积的情况。"
	icon_state = "autoinjector-1"
	list_reagents = list(/datum/reagent/medicine/dylovene = 30)
	description_overlay = "Dy"
	amount_per_transfer_from_this = 3

/obj/item/reagent_containers/hypospray/autoinjector/tramadol
	name = "曲马多自动注射器"
	desc = "装有3剂曲马多的自动注射器，一种针对普通伤口的有效止痛药。"
	icon_state = "autoinjector-10"
	list_reagents = list(/datum/reagent/medicine/tramadol = 30)
	description_overlay = "Ta"

/obj/item/reagent_containers/hypospray/autoinjector/oxycodone
	name = "羟考酮自动注射器"
	desc = "装有2剂氧可酮的自动注射器，一种用于危及生命情况的强效止痛药。"
	icon_state = "autoinjector-6"
	volume = 20
	amount_per_transfer_from_this = 10
	list_reagents = list(/datum/reagent/medicine/oxycodone = 20)
	description_overlay = "Ox"
	free_refills = FALSE

/obj/item/reagent_containers/hypospray/autoinjector/kelotane
	name = "凯洛坦自动注射器"
	desc = "装有3剂凯洛坦的自动注射器，这是一种常见的烧伤药物。"
	icon_state = "autoinjector-5"
	list_reagents = list(/datum/reagent/medicine/kelotane = 30)
	description_overlay = "Ke"

/obj/item/reagent_containers/hypospray/autoinjector/bicaridine
	name = "比卡瑞丁自动注射器"
	desc = "装有3剂比卡立丁的自动注射器，这是一种常见的钝器伤和循环系统损伤药物。"
	icon_state = "autoinjector-3"
	list_reagents = list(/datum/reagent/medicine/bicaridine = 30)
	description_overlay = "Bi"

/obj/item/reagent_containers/hypospray/autoinjector/inaprovaline
	name = "伊那普洛林自动注射器"
	desc = "装有2剂依那普利宁的自动注射器，这是一种用于危重病人的紧急稳定药物。"
	icon_state = "autoinjector-9"
	amount_per_transfer_from_this = 15
	list_reagents = list(/datum/reagent/medicine/inaprovaline = 30)
	description_overlay = "In"

/obj/item/reagent_containers/hypospray/autoinjector/dexalin
	name = "地克沙林自动注射器"
	desc = "装有3剂地塞林的自注射器，这是一种为身体供氧的药物，有助于缓解呼吸问题或低血氧症状。"
	icon_state = "autoinjector-2"
	volume = 15
	amount_per_transfer_from_this = 5
	list_reagents = list(/datum/reagent/medicine/dexalin = 15)
	description_overlay = "Dx"

/obj/item/reagent_containers/hypospray/autoinjector/spaceacillin
	name = "太空青霉素自动注射器"
	desc = "装有3剂太空青霉素的自动注射器，这是一种抗生素药物，有助于对抗感染和坏死。"
	icon_state = "autoinjector-1"
	volume = 15
	amount_per_transfer_from_this = 5
	list_reagents = list(/datum/reagent/medicine/spaceacillin = 15)
	description_overlay = "Sp"

/obj/item/reagent_containers/hypospray/autoinjector/alkysine
	name = "阿尔克辛自动注射器"
	desc = "装有3剂阿尔克赛因的自动注射器，这是一种长效药物，用于修复大脑和耳部损伤。"
	icon_state = "autoinjector-12"
	volume = 15
	amount_per_transfer_from_this = 5
	list_reagents = list(/datum/reagent/medicine/alkysine = 15)
	description_overlay = "Al"

/obj/item/reagent_containers/hypospray/autoinjector/imidazoline
	name = "咪唑啉自动注射器"
	desc = "装有3剂咪唑啉的自动注射器，用于治疗视力损伤。"
	icon_state = "autoinjector-5"
	list_reagents = list(/datum/reagent/medicine/imidazoline = 30)
	description_overlay = "Im"

/obj/item/reagent_containers/hypospray/autoinjector/hypervene
	name = "超维宁自动注射器"
	desc = "一个装有3剂次海珀文的自动注射器，这是一种能快速清除化学物质的急救药物。会引起疼痛和呕吐。"
	icon_state = "Toxic"
	amount_per_transfer_from_this = 3
	volume = 9
	list_reagents = list(/datum/reagent/hypervene = 9)
	description_overlay = "Hy"

/obj/item/reagent_containers/hypospray/autoinjector/virilyth //not accessible during normal play, only for valhalla
	name = "维利特自动注射器"
	desc = "一个装满维利林斯的大型自动注射器。"
	icon_state = "autoinjector-8"
	amount_per_transfer_from_this = 10
	volume = 50
	list_reagents = list(
		/datum/reagent/virilyth = 50,
	)

/obj/item/reagent_containers/hypospray/autoinjector/rezadone //not accessible during normal play, only for valhalla
	name = "雷扎酮自动注射器"
	desc = "一个装满雷扎酮的大型自动注射器。"
	icon_state = "autoinjector-8"
	amount_per_transfer_from_this = 5
	list_reagents = list(
		/datum/reagent/medicine/rezadone = 30,
	)
	description_overlay = "Rz"

/obj/item/reagent_containers/hypospray/autoinjector/synaptizine
	name = "突触素自动注射器"
	desc = "一支刚装填好的自动注射器，内含安全使用的突触素混合剂。"
	icon_state = "Mystery"
	amount_per_transfer_from_this = 3
	volume = 9
	list_reagents = list(
		/datum/reagent/medicine/synaptizine = 3,
		/datum/reagent/medicine/hyronalin = 6,
	)
	description_overlay = "Sy"

/obj/item/reagent_containers/hypospray/autoinjector/synaptizine_expired
	name = "过期的突触兴奋剂自动注射器"
	desc = "据称装有安全使用的突触素混合物的自动注射器，已过期3个月。"
	icon_state = "autoinjector-1"
	amount_per_transfer_from_this = 2
	volume = 6
	list_reagents = list(
		/datum/reagent/medicine/synaptizine = 3,
		/datum/reagent/medicine/hyronalin = 3,
	)
	description_overlay = "Sy-"

/obj/item/reagent_containers/hypospray/autoinjector/neuraline
	name = "神经线自动注射器"
	desc = "一支装有3剂神经灵的自注射器，这是一种极其强效的兴奋剂。！切勿同时使用超过一次！"
	icon_state = "RedWhite"
	amount_per_transfer_from_this = 4
	volume = 12
	list_reagents = list(/datum/reagent/medicine/neuraline = 12)
	description_overlay = "Ne"

/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus
	name = "peridaxon Plus 自动注射器"
	desc = "装有3剂Peridaxon Plus的自动注射器，这是一种能治疗器官损伤但会导致毒素累积的化学制剂。使用时需配合解毒剂。！切勿在激烈战斗中使用！"
	icon_state = "VioWhite"
	amount_per_transfer_from_this = 3
	volume = 9
	list_reagents = list(
		/datum/reagent/medicine/peridaxon_plus = 3,
		/datum/reagent/medicine/hyronalin = 6,
	)
	description_overlay = "Pe+"

/obj/item/reagent_containers/hypospray/autoinjector/russian_red
	name = "紧急自动注射器"
	desc = "装载单次剂量俄罗斯红的自动注射器。可恢复大量体力并治疗大量伤害，但会造成轻微永久性损伤。"
	icon_state = "Redwood"
	amount_per_transfer_from_this = 15
	volume = 30
	list_reagents = list(
		/datum/reagent/medicine/russian_red = 20,
		/datum/reagent/medicine/oxycodone = 10,
	)
	description_overlay = "Rr"
	free_refills = FALSE

/obj/item/reagent_containers/hypospray/autoinjector/polyhexanide
	name = "聚己酰胺自动注射器"
	desc = "一支装有聚己酰胺的自动注射器，这是一种用于内部手术的消毒剂。"
	icon_state = "autoinjector-10"
	amount_per_transfer_from_this = 5
	volume = 20
	list_reagents = list(/datum/reagent/medicine/polyhexanide = 20)

/obj/item/reagent_containers/hypospray/autoinjector/isotonic
	name = "等渗溶液自动注射器"
	desc = "装有2剂等渗溶液的自动注射器，用于在失血或创伤后快速恢复体液容量。"
	icon_state = "autoinjector-8"
	amount_per_transfer_from_this = 15
	volume = 30
	list_reagents = list(
		/datum/reagent/medicine/saline_glucose = 30,
	)
	description_overlay = "Is"

/obj/item/reagent_containers/hypospray/autoinjector/roulettium
	name = "轮盘素自动注射器"
	desc = "装有单发轮盘霉素的自动注射器，这是一种极其强效的万能药。！这有导致不可挽回死亡的风险！"
	icon_state = "autoinjector-6"
	amount_per_transfer_from_this = 1
	volume = 1
	list_reagents = list(/datum/reagent/medicine/roulettium = 1)

/obj/item/reagent_containers/hypospray/autoinjector/elite //only deathsquad should be able to get this
	name = "精英自动注射器"
	desc = "一种装载了强效多功能化学混合物的精英自动注射器，能治愈大多数类型的伤害。几乎只配发给臭名昭著的纳米传讯死亡小队。"
	icon_state = "autoinjector-7"
	volume = 37.5
	amount_per_transfer_from_this = 12.4
	list_reagents = list(
		/datum/reagent/medicine/russian_red = 30,
		/datum/reagent/medicine/rezadone = 7.2,
	)

/obj/item/reagent_containers/hypospray/autoinjector/medicalnanites
	name = "纳米机械自动注射器"
	desc = "一支装载医疗纳米机器人的自动注射器。这是一种强效的新型治疗方法，利用受试者的血液进行复制，具有短暂但可能危险的激活期！小心神经毒素！"
	icon_state = "autoinjector-6"
	amount_per_transfer_from_this = 1
	volume = 1
	list_reagents = list(/datum/reagent/medicalnanites = 1)
	free_refills = FALSE

/obj/item/reagent_containers/hypospray/autoinjector/pain //made for debugging
	name = "痛苦液体自动注射器"
	desc = "装有液态疼痛的自动注射器。嗷。"
	icon_state = "autoinjector-6"
	amount_per_transfer_from_this = 20
	volume = 100

	list_reagents = list(/datum/reagent/toxin/pain = 100)

/obj/item/reagent_containers/hypospray/autoinjector/spacedrugs //CL goodie
	name = "空间毒品自动注射器"
	desc = "一支装满甜美太空毒品的自动注射器……对陆战队员来说很难搞到。"
	icon_state = "autoinjector-1"
	amount_per_transfer_from_this = 25
	volume = 25

	list_reagents = list(/datum/reagent/space_drugs = 25)

/obj/item/reagent_containers/hypospray/autoinjector/mindbreaker //made for debugging
	name = "精神破坏毒素自动注射器"
	desc = "一支装载了最烈性、最致命药物的自动注射器。或许能治愈创伤后应激障碍。或许会引发它。"
	icon_state = "Toxic"
	amount_per_transfer_from_this = 30
	volume = 30

	list_reagents = list(/datum/reagent/toxin/mindbreaker = 50)

/obj/item/reagent_containers/hypospray/autoinjector/antitox_mix
	name = "抗毒素混合剂4"
	desc = "自动注射器装载了用于快速治疗严重毒素损伤的化学混合物。未经专业医疗监督请勿使用。"
	icon_state = "Toxic"
	amount_per_transfer_from_this = 15
	list_reagents = list(
		/datum/reagent/medicine/hyronalin = 7.5,
		/datum/reagent/medicine/dylovene = 7.5,
		/datum/reagent/medicine/tricordrazine = 7.5,
		/datum/reagent/medicine/arithrazine = 7.5,
	)
	description_overlay = "Tx4"

/obj/item/reagent_containers/hypospray/autoinjector/regrow
	name = "再生自动注射器"
	desc = "装有再生长剂的自动注射器——能够快速再生缺失的肢体。"
	icon_state = "AngelLight"
	amount_per_transfer_from_this = 5
	list_reagents = list(
		/datum/reagent/medicine/regrow = 30,
	)
	description_overlay = "Grw"
