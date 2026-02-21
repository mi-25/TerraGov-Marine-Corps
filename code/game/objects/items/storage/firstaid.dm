/* First aid storage
* Contains:
*		First Aid Kits
* 		Pill Bottles
*/

/*
* First Aid Kits
*/
/obj/item/storage/firstaid
	name = "急救包"
	desc = "这是用于处理严重伤口的紧急医疗包。"
	icon = 'icons/obj/items/storage/firstaid.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/medkits_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/medkits_right.dmi',
	)
	icon_state = "firstaid"
	w_class = WEIGHT_CLASS_BULKY
	throw_speed = 2
	throw_range = 8
	///whether the kit starts empty
	var/empty = FALSE
	///icon state to use when kit is full
	var/icon_full

/obj/item/storage/firstaid/Initialize(mapload, ...)
	. = ..()
	storage_datum.use_sound = 'sound/effects/toolbox.ogg'
	storage_datum.set_holdable(cant_hold_list = list(
		/obj/item/ammo_magazine,
		/obj/item/explosive/grenade,
	))

	icon_full = icon_state
	if(empty)
		icon_state = icon_state += "_empty"
	else
		fill_firstaid_kit()


/obj/item/storage/firstaid/update_icon_state()
	. = ..()
	if(!length(contents))
		icon_state = icon_state += "_empty"
	else
		icon_state = icon_full


//to fill medkits with stuff when spawned
/obj/item/storage/firstaid/proc/fill_firstaid_kit()
	return


/obj/item/storage/firstaid/fire
	name = "火焰急救包"
	desc = "这是为毒物实验室<i>-意外-</i>起火时准备的紧急医疗包。"
	icon_state = "firefirstaid"
	worn_icon_state = "firefirstaid"

/obj/item/storage/firstaid/fire/fill_firstaid_kit()
	new /obj/item/healthanalyzer(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/storage/pill_bottle/packet/leporazine(src)
	new /obj/item/storage/syringe_case/burn(src)


/obj/item/storage/firstaid/regular
	icon_state = "firstaid"
	worn_icon_state = "firstaid"

/obj/item/storage/firstaid/regular/fill_firstaid_kit()
	new /obj/item/healthanalyzer(src)
	new /obj/item/stack/medical/heal_pack/gauze(src)
	new /obj/item/stack/medical/heal_pack/ointment(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/combat(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/tricordrazine(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/tramadol(src)
	new /obj/item/stack/medical/splint(src)


/obj/item/storage/firstaid/toxin
	name = "毒素急救"
	desc = "用于治疗体内毒素含量过高的情况。"
	icon_state = "antitoxfirstaid"
	worn_icon_state = "antitoxfirstaid"

/obj/item/storage/firstaid/toxin/fill_firstaid_kit()
	new /obj/item/healthanalyzer(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/packet/ryetalyn(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/hypervene(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/hypervene(src)
	new /obj/item/storage/syringe_case/tox(src)


/obj/item/storage/firstaid/o2
	name = "缺氧急救"
	desc = "一箱氧气补给品。"
	icon_state = "o2firstaid"
	worn_icon_state = "o2firstaid"

/obj/item/storage/firstaid/o2/fill_firstaid_kit()
	new /obj/item/healthanalyzer(src)
	new /obj/item/storage/pill_bottle/dexalin(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/dexalinplus(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/dexalinplus(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/dexalinplus(src)
	new /obj/item/storage/syringe_case/oxy(src)


/obj/item/storage/firstaid/adv
	name = "高级急救包"
	desc = "装有高级医疗用品。"
	icon_state = "advfirstaid"
	worn_icon_state = "advfirstaid"

/obj/item/storage/firstaid/adv/fill_firstaid_kit()
	new /obj/item/healthanalyzer(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/stack/medical/splint(src)


/obj/item/storage/firstaid/rad
	name = "辐射急救包"
	desc = "包含辐射暴露治疗"
	icon_state = "purplefirstaid"
	worn_icon_state = "purplefirstaid"

/obj/item/storage/firstaid/rad/fill_firstaid_kit()
	new /obj/item/healthanalyzer(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/combat(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/tricordrazine(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/tricordrazine(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/bicaridine(src)


/*
* Syringe Case
*/

/obj/item/storage/syringe_case
	name = "注射器盒"
	desc = "这是一个用于存放注射器和药瓶的医疗箱。"
	icon_state = "syringe_case"
	icon = 'icons/obj/items/storage/firstaid.dmi'
	throw_speed = 2
	throw_range = 8
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/syringe_case/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 3
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/syringe,
	))

/obj/item/storage/syringe_case/empty/PopulateContents()
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/reagent_containers/glass/bottle/empty(src)
	new /obj/item/reagent_containers/glass/bottle/empty(src)

/obj/item/storage/syringe_case/regular
	name = "基础注射器盒"
	desc = "这是一个用于存放注射器和药瓶的医疗箱。里面装有基础药品。"

/obj/item/storage/syringe_case/regular/PopulateContents()
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/reagent_containers/glass/bottle/inaprovaline(src)
	new /obj/item/reagent_containers/glass/bottle/tricordrazine(src)

/obj/item/storage/syringe_case/burn
	name = "燃烧注射器盒"
	desc = "这是一个用于存放注射器和药瓶的医疗箱。这个箱子装有专门治疗烧伤的药物。"

/obj/item/storage/syringe_case/burn/PopulateContents()
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/reagent_containers/glass/bottle/kelotane(src)
	new /obj/item/reagent_containers/glass/bottle/oxycodone(src)

/obj/item/storage/syringe_case/tox
	name = "毒素注射器盒"
	desc = "这是一个用于存放注射器和药瓶的医疗箱。这个箱子装有专门用于治疗毒素的药品。"

/obj/item/storage/syringe_case/tox/PopulateContents()
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/reagent_containers/glass/bottle/dylovene(src)
	new /obj/item/reagent_containers/glass/bottle/hypervene(src)

/obj/item/storage/syringe_case/oxy
	name = "缺氧注射器盒"
	desc = "这是一个用于存放注射器和药瓶的医疗箱。里面装有专门治疗缺氧的药物。"

/obj/item/storage/syringe_case/oxy/PopulateContents()
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/reagent_containers/glass/bottle/inaprovaline(src)
	new /obj/item/reagent_containers/glass/bottle/dexalin(src)

/obj/item/storage/syringe_case/meralyne
	name = "注射器盒（梅拉林）"
	desc = "这是一个用于存放注射器和药瓶的医疗箱。里面装有梅拉林。"

/obj/item/storage/syringe_case/meralyne/PopulateContents()
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/reagent_containers/glass/bottle/meralyne(src)
	new /obj/item/reagent_containers/glass/bottle/meralyne(src)

/obj/item/storage/syringe_case/dermaline
	name = "注射器盒（皮肤宁）"
	desc = "这是一个用于存放注射器和药瓶的医疗箱。这里面装有皮肤灵。"

/obj/item/storage/syringe_case/dermaline/PopulateContents()
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/reagent_containers/glass/bottle/dermaline(src)
	new /obj/item/reagent_containers/glass/bottle/dermaline(src)

/obj/item/storage/syringe_case/meraderm
	name = "注射器盒（美拉得明）"
	desc = "这是一个用于存放注射器和药瓶的医疗箱。里面装有梅拉得姆。"

/obj/item/storage/syringe_case/meraderm/PopulateContents()
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/reagent_containers/glass/bottle/meraderm(src)
	new /obj/item/reagent_containers/glass/bottle/meraderm(src)

/obj/item/storage/syringe_case/nanoblood
	name = "注射器盒（纳米血液）"
	desc = "这是一个用于存放注射器和药瓶的医疗箱。这里面装有纳米血液。"

/obj/item/storage/syringe_case/nanoblood/PopulateContents()
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/reagent_containers/glass/bottle/nanoblood(src)
	new /obj/item/reagent_containers/glass/bottle/nanoblood(src)

/obj/item/storage/syringe_case/tricordrazine
	name = "注射器盒（三卡多拉嗪）"
	desc = "这是一个用于存放注射器和药瓶的医疗箱。里面装有特里科德拉嗪。"

/obj/item/storage/syringe_case/tricordrazine/PopulateContents()
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/reagent_containers/glass/bottle/tricordrazine(src)
	new /obj/item/reagent_containers/glass/bottle/tricordrazine(src)


/*
* Pill Bottles
*/


/obj/item/storage/pill_bottle
	name = "药瓶"
	desc = "这是一个用于储存药品的密封容器。"
	icon_state = "pill_canister"
	icon = 'icons/obj/items/chemistry.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/medical_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/medical_right.dmi',
	)
	worn_icon_state = "contsolid"
	w_class = WEIGHT_CLASS_SMALL
	greyscale_config = /datum/greyscale_config/pillbottle
	greyscale_colors = "#d9cd07#f2cdbb" //default colors
	storage_type = /datum/storage/pill_bottle
	///What kind of pill we are filling our pill bottle with
	var/obj/item/pill_type_to_fill
	///Short description in overlay
	var/description_overlay = ""

/obj/item/storage/pill_bottle/PopulateContents()
	if(pill_type_to_fill)
		for(var/i in 1 to storage_datum.max_storage_space)
			new pill_type_to_fill(src)
	update_icon()

/obj/item/storage/pill_bottle/attack_self(mob/living/user)
	if(user.get_inactive_held_item())
		user.balloon_alert(user, "需要空出副手！")
		return
	if(length(contents))
		var/obj/item/I = contents[1]
		if(!storage_datum.remove_from_storage(I,user,user))
			return
		if(user.put_in_inactive_hand(I))
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				C.swap_hand()
		else
			user.dropItemToGround(I)
			to_chat(user, span_notice("你笨手笨脚地摆弄着\the [src]，把一颗药丸掉在了地上。"))
		return

/obj/item/storage/pill_bottle/update_overlays()
	. = ..()
	if(isturf(loc))
		return
	var/mutable_appearance/number = mutable_appearance()
	number.maptext = MAPTEXT(length(contents))
	. += number
	if(!description_overlay)
		return
	var/mutable_appearance/desc = mutable_appearance('icons/misc/12x12.dmi')
	desc.pixel_w = 16
	desc.maptext = MAPTEXT(description_overlay)
	desc.maptext_width = 16
	. += desc

/obj/item/storage/pill_bottle/equipped(mob/user, slot)
	. = ..()
	update_icon()

/obj/item/storage/pill_bottle/on_enter_storage(mob/user, slot)
	. = ..()
	update_icon()

/obj/item/storage/pill_bottle/removed_from_inventory()
	. = ..()
	update_icon()

/obj/item/storage/pill_bottle/refill(mob/user)
	. = ..()
	if(!.)
		return
	var/available_space = storage_datum.max_storage_space
	for(var/obj/item/stored_item in contents)
		available_space -= stored_item.w_class
	if(!available_space)
		return
	var/pills_to_add = round(available_space/initial(pill_type_to_fill.w_class))
	if(storage_datum.storage_slots)
		pills_to_add = min(pills_to_add, storage_datum.storage_slots, storage_datum.storage_slots - length(contents))
	for(var/i in 1 to pills_to_add)
		new pill_type_to_fill(src)
	update_icon()

/obj/item/storage/pill_bottle/kelotane
	name = "凯洛坦药片瓶"
	desc = "内含治疗烧伤的药片，但会引起轻微疼痛。服用两片可加速愈合，但疼痛感会稍强。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/kelotane
	greyscale_colors = "#CC9900#FFFFFF"
	description_overlay = "Ke"
	item_flags = CAN_REFILL

/obj/item/storage/pill_bottle/kelotane/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_flags = BYPASS_VENDOR_CHECK

/obj/item/storage/pill_bottle/dermaline
	name = "德马林药瓶"
	desc = "内含可治疗烧伤的药片，但会引起轻微疼痛。服用两片可加速愈合，但疼痛感会稍强。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/dermaline
	greyscale_config = /datum/greyscale_config/pillbottleround
	greyscale_colors = "#ffef00#FFFFFF"
	description_overlay = "De"

/obj/item/storage/pill_bottle/dylovene
	name = "地洛芬药瓶"
	desc = "含有可治疗毒素伤害并清除各类毒素和神经毒素的药片。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/dylovene
	greyscale_colors = "#669900#ffffff"
	description_overlay = "Dy"
	item_flags = CAN_REFILL

/obj/item/storage/pill_bottle/dylovene/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_flags = BYPASS_VENDOR_CHECK

/obj/item/storage/pill_bottle/isotonic
	name = "等渗药丸瓶"
	desc = "含有促进失血再生的药片。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/isotonic
	greyscale_colors = "#5c0e0e#ffffff"
	description_overlay = "Is"
	item_flags = CAN_REFILL

/obj/item/storage/pill_bottle/isotonic/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_flags = BYPASS_VENDOR_CHECK

/obj/item/storage/pill_bottle/inaprovaline
	name = "伊那普洛林药瓶"
	desc = "内含药片，可防止伤口自行恶化。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/inaprovaline
	greyscale_config = /datum/greyscale_config/pillbottlebox
	greyscale_colors = "#9966CC#ffffff"
	description_overlay = "In"

/obj/item/storage/pill_bottle/tramadol
	name = "曲马多药瓶"
	desc = "内含镇痛药片。服用两片可获得更强效果，但会产生毒性副作用。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/tramadol
	greyscale_colors = "#8a8686#ffffff"
	description_overlay = "Ta"
	item_flags = CAN_REFILL

/obj/item/storage/pill_bottle/tramadol/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_flags = BYPASS_VENDOR_CHECK

/obj/item/storage/pill_bottle/paracetamol
	name = "扑热息痛药瓶"
	desc = "内含能轻微缓解疼痛的药片。服用两片可获得稍强的效果。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/paracetamol
	greyscale_config = /datum/greyscale_config/pillbottlebox
	greyscale_colors = "#f8f4f8#ffffff"
	description_overlay = "Pa"
	item_flags = CAN_REFILL

/obj/item/storage/pill_bottle/paracetamol/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_flags = BYPASS_VENDOR_CHECK

/obj/item/storage/pill_bottle/spaceacillin
	name = "太空青霉素药瓶"
	desc = "内含可处理低级别病毒和细菌感染的药片。效果随剂量增加而增强。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/spaceacillin
	greyscale_config = /datum/greyscale_config/pillbottlebox
	greyscale_colors = "#90F7DeF5#ffffff"
	description_overlay = "Sp"

/obj/item/storage/pill_bottle/bicaridine
	name = "比卡瑞丁药瓶"
	desc = "内含可治愈割伤和瘀伤的药物，但会引起轻微疼痛。服用两片可加速愈合，但疼痛感会稍强。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/bicaridine
	greyscale_colors = "#DA0000#ffffff"
	description_overlay = "Bi"
	item_flags = CAN_REFILL

/obj/item/storage/pill_bottle/bicaridine/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_flags = BYPASS_VENDOR_CHECK

/obj/item/storage/pill_bottle/meralyne
	name = "梅拉林药瓶"
	desc = "内含可治愈割伤和瘀伤的药物，但会引起轻微疼痛。服用两片可加速愈合，但疼痛感会稍强。"
	icon_state = "pill_canistercomplete"
	pill_type_to_fill = /obj/item/reagent_containers/pill/meralyne
	greyscale_config = /datum/greyscale_config/pillbottleround
	greyscale_colors = "#FD5964#ffffff"
	description_overlay = "Me"

/obj/item/storage/pill_bottle/dexalin
	name = "地克西林药瓶"
	desc = "含有治疗缺氧损伤的药片。它们也能抑制失血症状。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/dexalin
	greyscale_colors = "#5972FD#ffffff"
	description_overlay = "Dx"

/obj/item/storage/pill_bottle/alkysine
	name = "阿尔克辛药瓶"
	desc = "含有治疗脑部和耳部损伤的药片。"
	icon_state = "pill_canistercomplete"
	pill_type_to_fill = /obj/item/reagent_containers/pill/alkysine
	greyscale_config = /datum/greyscale_config/pillbottlebubble
	greyscale_colors = "#0292AC#ffffff"
	description_overlay = "Al"

/obj/item/storage/pill_bottle/imidazoline
	name = "咪唑啉药瓶"
	desc = "含有治疗眼部损伤的药片。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/imidazoline
	greyscale_config = /datum/greyscale_config/pillbottlebubble
	greyscale_colors = "#F7A151#ffffff" //orange like carrots
	description_overlay = "Im"

/obj/item/storage/pill_bottle/russian_red
	name = "\improper 俄罗斯红药丸瓶"
	desc = "含有能快速治愈所有损伤的药片，代价是造成少量无法治愈的损伤。"
	icon_state = "pill_canister"
	pill_type_to_fill = /obj/item/reagent_containers/pill/russian_red
	greyscale_colors = "#3d0000#ffffff"
	description_overlay = "Rr"

/obj/item/storage/pill_bottle/quickclot
	name = "快速凝血药瓶"
	desc = "内含药片，可在等待全面治疗期间抑制内出血。"
	icon_state = "pill_canistercomplete"
	pill_type_to_fill = /obj/item/reagent_containers/pill/quickclot
	greyscale_config = /datum/greyscale_config/pillbottleround
	greyscale_colors = "#E07BAD#ffffff"
	description_overlay = "Qk"

/obj/item/storage/pill_bottle/hypervene
	name = "超维宁药瓶"
	desc = "一种用于治疗药物过量和快速清除毒素的净化药物。会引起疼痛和呕吐。"
	icon_state = "pill_canister"
	pill_type_to_fill = /obj/item/reagent_containers/pill/hypervene
	greyscale_config = /datum/greyscale_config/pillbottlebubble
	greyscale_colors = "#AC6D32#ffffff"
	description_overlay = "Hy"

/obj/item/storage/pill_bottle/tricordrazine
	name = "三卡德拉辛药瓶"
	desc = "内含药片，可轻微治愈所有主要类型的损伤。"
	icon_state = "pill_canistercomplete"
	pill_type_to_fill = /obj/item/reagent_containers/pill/tricordrazine
	greyscale_colors = "#f8f8f8#ffffff"
	greyscale_config = /datum/greyscale_config/pillbottleround
	description_overlay = "Ti"
	item_flags = CAN_REFILL

/obj/item/storage/pill_bottle/tricordrazine/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_flags = BYPASS_VENDOR_CHECK

/obj/item/storage/pill_bottle/happy
	name = "快乐药丸瓶"
	desc = "内含高度违禁药物。当你想看到彩虹时。"
	pill_type_to_fill = /obj/item/reagent_containers/pill/happy
	greyscale_colors = "#6C52BF#ffffff"

/obj/item/storage/pill_bottle/happy/Initialize(mapload, ...)
	. = ..()
	storage_datum.max_storage_space = 7

/obj/item/storage/pill_bottle/zoom
	name = "缩放药瓶"
	desc = "内含高度违禁药物。以心脏换取速度。"

	pill_type_to_fill = /obj/item/reagent_containers/pill/zoom
	greyscale_colors = "#ef3ad4#ffffff"

/obj/item/storage/pill_bottle/zoom/Initialize(mapload, ...)
	. = ..()
	storage_datum.max_storage_space = 7

/obj/item/storage/pill_bottle/attackby(obj/item/attacking_item, mob/user, params)
	if(!istype(attacking_item, /obj/item/facepaint) || isnull(greyscale_config))
		return ..()

	var/obj/item/facepaint/paint = attacking_item
	if(paint.uses < 1)
		to_chat(user, span_warning("\the [paint] 没颜色了！"))
		return
	var/bottle_color
	var/label_color
	bottle_color = input(user, "Pick a color", "Pick color") as null|color
	label_color = input(user, "Pick a color", "Pick color") as null|color

	if(!bottle_color || !label_color || !do_after(user, 1 SECONDS, NONE, src, BUSY_ICON_GENERIC))
		return


	set_greyscale_colors(list(bottle_color,label_color))
	paint.uses--
	update_icon()
