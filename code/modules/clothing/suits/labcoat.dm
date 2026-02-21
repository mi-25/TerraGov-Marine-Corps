/obj/item/clothing/suit/storage/labcoat
	name = "实验袍"
	desc = "一套能防护轻微化学泄漏的防护服。"
	icon_state = "labcoat"
	blood_overlay_type = "coat"
	armor_protection_flags = CHEST|ARMS
	permeability_coefficient = 0.6
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 50, FIRE = 0, ACID = 25)
	allowed = list(
		/obj/item/stack/medical,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/hypospray,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/healthanalyzer,
		/obj/item/flashlight,
		/obj/item/radio,
		/obj/item/tank/emergency_oxygen,
	)
	attachments_allowed = list(
		/obj/item/armor_module/storage/pocket/medical,
		/obj/item/armor_module/armor/badge,
	)
	starting_attachments = list(/obj/item/armor_module/storage/pocket/medical)
	///If the coat is buttoned or not
	var/open = FALSE

/obj/item/clothing/suit/storage/labcoat/Initialize(mapload)
	. = ..()
	toggle_open()

/obj/item/clothing/suit/storage/labcoat/verb/toggle()
	set name = "Toggle Labcoat Buttons"
	set category = "IC.Object"
	set src in usr

	if(!isliving(usr))
		return
	if(usr.stat)
		return
	if(usr.restrained())
		return

	toggle_open()

	if(open)
		to_chat(usr, "你解开了实验服的纽扣。")
	else
		to_chat(usr, "你扣上了实验袍的扣子。")

///Actually toggles the coat open or closed
/obj/item/clothing/suit/storage/labcoat/proc/toggle_open()
	open = !open

	if(open)
		icon_state = "[initial(icon_state)]_open"
	else
		icon_state = initial(icon_state)

	update_clothing_icon()

/obj/item/clothing/suit/storage/labcoat/cmo
	name = "首席医疗官的白大褂"
	desc = "比标准型号更蓝。"
	icon_state = "labcoat_cmo"
/obj/item/clothing/suit/storage/labcoat/mad
	name = "疯子的实验服"
	desc = "这让你看起来能敲晕别人，然后把他们射进太空。"
	icon_state = "labgreen"

/obj/item/clothing/suit/storage/labcoat/paramedic
	name = "卫生兵实验袍"
	desc = "一套用于存放小型医疗物品，以便应对和处理紧急情况的防护服。"
	icon_state = "labcoat_paramedic"

/obj/item/clothing/suit/storage/labcoat/chemist
	name = "化学家实验服"
	desc = "一套能防护轻微化学泄漏的防护服。肩部有一条橙色条纹。"
	icon_state = "labcoat_chem"

/obj/item/clothing/suit/storage/labcoat/virologist
	name = "病毒学家实验服"
	desc = "一套能防护轻微化学泄漏的防护服。相比标准型号，对生化危害提供稍强的防护。肩部有一条绿色条纹。"
	icon_state = "labcoat_viro"

/obj/item/clothing/suit/storage/labcoat/genetics
	name = "遗传学家实验服"
	desc = "一套能防护轻微化学泄漏的防护服。肩部有一条蓝色条纹。"
	icon_state = "labcoat_gen"

/obj/item/clothing/suit/storage/labcoat/science
	name = "科学家实验袍"
	desc = "一套能防护轻微化学泄漏的防护服。肩部有一条紫色条纹。"
	icon_state = "labcoat_sci"

/obj/item/clothing/suit/storage/labcoat/researcher
	name = "研究员实验服"
	desc = "一件高品质的实验服，似乎是学者和研究员们常穿的款式。它有着独特的粗糙质感，仿佛在引诱你踏上冒险之旅。"
	icon_state = "labcoat_researcher"
