/obj/item/storage/pouch
	name = "抽象附包"
	icon = 'icons/obj/clothing/pouches.dmi'
	icon_state = "small_drop"
	w_class = WEIGHT_CLASS_BULKY //does not fit in backpack
	equip_slot_flags = ITEM_SLOT_POCKET
	storage_type = /datum/storage/pouch
	///What item we fill our pouch with, requires fill_number to run
	var/fill_type = null
	///How much of our fill_type do we want to fill our pouch with, requires fill_type to run
	var/fill_number = 0

/obj/item/storage/pouch/PopulateContents()
	if(fill_number && fill_type)
		for(var/i in 1 to fill_number)
			new fill_type(src)

/obj/item/storage/pouch/LateInitialize()
	. = ..()
	update_icon()

/obj/item/storage/pouch/examine_tags(mob/user)
	. = ..()
	.["pocket attachable"] = "Can be worn by attaching it to a pocket."

/obj/item/storage/pouch/equipped(mob/user, slot)
	if(slot == SLOT_L_STORE || slot == SLOT_R_STORE)
		mouse_opacity = 2 //so it's easier to click when properly equipped.
	..()

/obj/item/storage/pouch/dropped(mob/user)
	mouse_opacity = initial(mouse_opacity)
	..()

/obj/item/storage/pouch/vendor_equip(mob/user)
	..()
	return user.equip_to_appropriate_slot(src)

/obj/item/storage/pouch/general
	name = "轻型通用附包"
	desc = "用于携带小物品的通用附包。"
	icon_state = "small_drop"

/obj/item/storage/pouch/general/Initialize(mapload, ...)
	. = ..()
	storage_datum.draw_mode = TRUE
	storage_datum.storage_type_limits = list(/obj/item/ammo_magazine/packet)

/obj/item/storage/pouch/general/medium
	name = "中型通用附包"
	icon_state = "medium_drop"

/obj/item/storage/pouch/general/medium/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 2
	storage_datum.sprite_slots = 2
	storage_datum.draw_mode = FALSE

/obj/item/storage/pouch/general/large
	name = "通用附包"
	icon_state = "large_drop"

/obj/item/storage/pouch/general/large/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = null
	storage_datum.max_storage_space = 6
	storage_datum.sprite_slots = 3
	storage_datum.draw_mode = FALSE

/obj/item/storage/pouch/general/large/command/PopulateContents()
	new /obj/item/binoculars/tactical(src)
	new /obj/item/megaphone(src)
	new /obj/item/pinpointer(src)


/obj/item/storage/pouch/general/som
	name = "采矿通用附包"
	desc = "用于携带采矿期间使用的小型物品的通用附包。"
	icon_state = "general_som"

/obj/item/storage/pouch/general/som/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null
	storage_datum.draw_mode = TRUE

/obj/item/storage/pouch/general/large/som
	desc = "用于携带采矿期间使用的小型物品的通用附包。"
	icon_state = "large_drop_som"

/obj/item/storage/pouch/general/large/som/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/bayonet
	name = "刺刀鞘"
	desc = "飞刀附包。"
	icon_state = "bayonet"

/obj/item/storage/pouch/bayonet/Initialize(mapload, ...)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/weapon/combat_knife,
		/obj/item/stack/throwing_knife,
		/obj/item/attachable/bayonet/converted,
	))
	storage_datum.storage_slots = 3
	storage_datum.draw_mode = TRUE

/obj/item/storage/pouch/bayonet/full
	fill_type = /obj/item/weapon/combat_knife
	fill_number = 1

/obj/item/storage/pouch/bayonet/upp
	fill_type = /obj/item/weapon/combat_knife/upp
	fill_number = 1

/obj/item/storage/pouch/survival
	name = "求生附包"
	desc = "它可以容纳手电筒、药片、撬棍、金属板和部分绷带。"
	icon_state = "survival"

/obj/item/storage/pouch/survival/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = 1
	storage_datum.storage_slots = 6
	storage_datum.max_w_class = WEIGHT_CLASS_NORMAL
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/flashlight,
		/obj/item/reagent_containers/pill,
		/obj/item/stack/medical/heal_pack/gauze,
		/obj/item/stack/sheet/metal,
		/obj/item/stack/sheet/plasteel,
		/obj/item/tool/weldingtool,
	))

/obj/item/storage/pouch/survival/full/PopulateContents()
	new /obj/item/flashlight(src)
	new /obj/item/reagent_containers/pill/tramadol(src)
	new /obj/item/stack/medical/heal_pack/gauze(src, 3)
	new /obj/item/stack/sheet/metal(src, 40)
	new /obj/item/stack/sheet/plasteel(src, 15)
	new /obj/item/tool/weldingtool(src)

/obj/item/storage/pouch/firstaid
	name = "急救附包"
	desc = "标准陆战队急救附包。可容纳大多数常见医疗用品。"
	icon_state = "firstaid"

/obj/item/storage/pouch/firstaid/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = 3
	storage_datum.storage_slots = 6
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/reagent_containers/hypospray,
		/obj/item/stack/medical,
		/obj/item/storage/pill_bottle,
	))

/obj/item/storage/pouch/firstaid/combat_patrol/PopulateContents()
	new /obj/item/reagent_containers/hypospray/autoinjector/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/kelotane(src)
	new /obj/item/storage/pill_bottle/packet/tramadol(src)
	new /obj/item/storage/pill_bottle/packet/tricordrazine(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/inaprovaline(src)

/obj/item/storage/pouch/firstaid/basic/PopulateContents()
	new /obj/item/storage/pill_bottle/packet/bicaridine(src)
	new /obj/item/storage/pill_bottle/packet/kelotane(src)
	new /obj/item/storage/pill_bottle/packet/tramadol(src)
	new /obj/item/storage/pill_bottle/packet/tricordrazine(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/inaprovaline(src)

/obj/item/storage/pouch/firstaid/combat_patrol_leader/PopulateContents()
	new /obj/item/storage/pill_bottle/packet/bicaridine(src)
	new /obj/item/storage/pill_bottle/packet/kelotane(src)
	new /obj/item/storage/pill_bottle/packet/tramadol(src)
	new /obj/item/storage/pill_bottle/packet/tricordrazine(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/hypospray/advanced/inaprovaline(src)

/obj/item/storage/pouch/firstaid/som
	name = "采矿急救附包"
	desc = "一个基础急救附包，最初因采矿殖民地危险的工作条件而被矿工使用。这个附包标记为火星之子所有。"
	icon_state = "firstaid_som"

/obj/item/storage/pouch/firstaid/som/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/firstaid/som/full/PopulateContents()
	new /obj/item/storage/pill_bottle/packet/bicaridine(src)
	new /obj/item/storage/pill_bottle/packet/kelotane(src)
	new /obj/item/storage/pill_bottle/packet/tramadol(src)
	new /obj/item/storage/pill_bottle/packet/tricordrazine(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/inaprovaline(src)

/obj/item/storage/pouch/firstaid/som/combat_patrol/PopulateContents()
	new /obj/item/reagent_containers/hypospray/autoinjector/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/kelotane(src)
	new /obj/item/storage/pill_bottle/packet/tramadol(src)
	new /obj/item/storage/pill_bottle/packet/tricordrazine(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/inaprovaline(src)

/obj/item/storage/pouch/firstaid/som/combat_patrol_leader/PopulateContents()
	new /obj/item/storage/pill_bottle/packet/bicaridine(src)
	new /obj/item/storage/pill_bottle/packet/kelotane(src)
	new /obj/item/storage/pill_bottle/packet/tramadol(src)
	new /obj/item/storage/pill_bottle/packet/tricordrazine(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/hypospray/advanced/inaprovaline(src)

/obj/item/storage/pouch/pistol
	name = "手枪附包"
	desc = "可容纳手枪或左轮手枪。适用于紧急情况。"
	icon_state = "pistol"

/obj/item/storage/pouch/pistol/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = 1
	storage_datum.max_w_class = WEIGHT_CLASS_NORMAL
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/weapon/gun/pistol,
		/obj/item/weapon/gun/revolver,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_pistol,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta,
	))
	storage_datum.draw_mode = TRUE

/obj/item/storage/pouch/pistol/vp70/PopulateContents()
	new /obj/item/weapon/gun/pistol/vp70(src)

/obj/item/storage/pouch/pistol/rt3/PopulateContents()
	new /obj/item/weapon/gun/pistol/rt3(src)

/obj/item/storage/pouch/pistol/som
	desc = "可容纳手枪或左轮手枪。用于紧急情况，采用火星之子的传统风格皮革制成。"
	icon_state = "pistol_som"

/obj/item/storage/pouch/pistol/som/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/pistol/icc
	desc = "可容纳手枪或左轮手枪。适用于紧急情况，由合成棕色织物制成。"
	icon_state = "pistol_icc"

/obj/item/storage/pouch/pistol/icc/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

//// MAGAZINE POUCHES /////

/obj/item/storage/pouch/magazine
	name = "弹匣附包"
	desc = "它可以容纳弹匣。"
	icon_state = "medium_ammo_mag"

/obj/item/storage/pouch/magazine/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = 2
	storage_datum.max_w_class = WEIGHT_CLASS_NORMAL
	storage_datum.storage_slots = 2
	storage_datum.draw_mode = FALSE
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/rifle,
		/obj/item/ammo_magazine/smg,
		/obj/item/ammo_magazine/pistol,
		/obj/item/ammo_magazine/revolver,
		/obj/item/ammo_magazine/sniper,
		/obj/item/ammo_magazine/handful,
		/obj/item/ammo_magazine/railgun,
		/obj/item/cell/lasgun,
	))

/obj/item/storage/pouch/magazine/smgfull
	fill_type = /obj/item/ammo_magazine/smg/standard_machinepistol
	fill_number = 2

/obj/item/storage/pouch/magazine/large
	name = "弹匣附包"
	desc = "这个附包可以容纳三个弹匣。"
	icon_state = "large_ammo_mag"

/obj/item/storage/pouch/magazine/large/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = 3
	storage_datum.storage_slots = 3

/obj/item/storage/pouch/magazine/large/tx8full
	fill_type = /obj/item/ammo_magazine/rifle/tx8
	fill_number = 3

/obj/item/storage/pouch/magazine/large/t19full
	fill_type = /obj/item/ammo_magazine/smg/standard_smg
	fill_number = 3

/obj/item/storage/pouch/magazine/large/som
	desc = "这个附包可容纳三个弹匣。采用传统的火星之子皮革制成。"
	icon_state = "mag_som"

/obj/item/storage/pouch/magazine/large/som/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/magazine/large/icc
	desc = "这个附包可以容纳三个弹药弹匣，似乎是用合成棕褐色纤维制成的。"
	icon_state = "mag_icc"

/obj/item/storage/pouch/magazine/large/icc/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/magazine/pistol
	name = "手枪弹匣附包"
	desc = "可容纳手枪和左轮手枪弹匣。"
	icon_state = "pistol_mag"

/obj/item/storage/pouch/magazine/pistol/Initialize(mapload, ...)
	. = ..()
	storage_datum.max_w_class = WEIGHT_CLASS_SMALL
	storage_datum.sprite_slots = 3
	storage_datum.storage_slots = 3
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/pistol,
		/obj/item/ammo_magazine/revolver,
		/obj/item/ammo_magazine/smg/standard_machinepistol,
		/obj/item/ammo_magazine/rifle/pepperball/pepperball_mini,
	))

/obj/item/storage/pouch/magazine/pistol/large
	name = "手枪弹匣附包"
	desc = "这个附包可以容纳六个手枪和左轮弹药弹匣。"
	icon_state = "large_pistol_mag"

/obj/item/storage/pouch/magazine/pistol/large/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 6
	storage_datum.sprite_slots = 5

/obj/item/storage/pouch/magazine/pistol/large/full
	fill_type = /obj/item/ammo_magazine/pistol
	fill_number = 6

/obj/item/storage/pouch/magazine/pistol/pmc_mateba
	fill_type = /obj/item/ammo_magazine/revolver/mateba
	fill_number = 3

/obj/item/storage/pouch/magazine/pistol/large/mateba
	fill_type = /obj/item/ammo_magazine/revolver/mateba
	fill_number = 6

/obj/item/storage/pouch/magazine/pistol/vp70
	fill_type = /obj/item/ammo_magazine/pistol/vp70
	fill_number = 3

/obj/item/storage/pouch/magazine/pistol/pmc_vp78
	fill_type = /obj/item/ammo_magazine/pistol/vp78
	fill_number = 3

/obj/item/storage/pouch/magazine/upp
	fill_type = /obj/item/ammo_magazine/rifle/type71
	fill_number = 2

/obj/item/storage/pouch/magazine/large/upp
	fill_type = /obj/item/ammo_magazine/rifle/type71
	fill_number = 3

/obj/item/storage/pouch/magazine/upp_smg
	fill_type = /obj/item/ammo_magazine/smg/skorpion
	fill_number = 2

/obj/item/storage/pouch/magazine/large/pmc_m25
	fill_type = /obj/item/ammo_magazine/smg/m25/ap
	fill_number = 3

/obj/item/storage/pouch/magazine/large/pmc_famas
	fill_type = /obj/item/ammo_magazine/rifle/famas
	fill_number = 3

/obj/item/storage/pouch/magazine/large/pmc_lmg
	fill_type = /obj/item/ammo_magazine/standard_lmg
	fill_number = 3

/obj/item/storage/pouch/magazine/large/pmc_rifle
	fill_type = /obj/item/ammo_magazine/rifle/ap
	fill_number = 3

/obj/item/storage/pouch/magazine/drum
	name = "弹鼓附包"
	desc = "它可以容纳四个弹鼓。"
	icon_state = "large_ammo_drum"

/obj/item/storage/pouch/magazine/drum/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 4
	storage_datum.sprite_slots = null
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/ammo_magazine/,
	))


/obj/item/storage/pouch/explosive
	name = "爆炸物附包"
	desc = "它可以容纳手雷、塑胶炸药、地雷箱和其他爆炸物。"
	icon_state = "explosive"

/obj/item/storage/pouch/explosive/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = 2
	storage_datum.storage_slots = 4
	storage_datum.max_w_class = WEIGHT_CLASS_NORMAL
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/explosive/plastique,
		/obj/item/explosive/mine,
		/obj/item/explosive/grenade,
		/obj/item/storage/box/explosive_mines,
		/obj/item/ammo_magazine/rocket,
		/obj/item/detpack,
		/obj/item/assembly/signaler,
	))

/obj/item/storage/pouch/explosive/full
	fill_type = /obj/item/explosive/grenade
	fill_number = 4

/obj/item/storage/pouch/explosive/detpack/PopulateContents()
	new /obj/item/detpack(src)
	new /obj/item/detpack(src)
	new /obj/item/detpack(src)
	new /obj/item/assembly/signaler(src)

/obj/item/storage/pouch/explosive/razorburn/PopulateContents()
	new /obj/item/explosive/grenade/chem_grenade/razorburn_small(src)
	new /obj/item/explosive/grenade/chem_grenade/razorburn_small(src)
	new /obj/item/explosive/grenade/chem_grenade/razorburn_small(src)
	new /obj/item/explosive/grenade/chem_grenade/razorburn_large(src)

/obj/item/storage/pouch/explosive/antigas/PopulateContents()
	new /obj/item/explosive/grenade/smokebomb/antigas(src)
	new /obj/item/explosive/grenade/smokebomb/antigas(src)
	new /obj/item/explosive/grenade/smokebomb/antigas(src)
	new /obj/item/explosive/grenade/smokebomb/antigas(src)

/obj/item/storage/pouch/explosive/upp
	fill_type = /obj/item/explosive/grenade/upp
	fill_number = 4

/obj/item/storage/pouch/explosive/som
	name = "\improper S26 炸药附包"
	desc = "一个用于存放手雷、火箭弹、地雷盒和其他爆炸物的皮革附包。"
	icon_state = "explosive_som"

/obj/item/storage/pouch/explosive/som/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/explosive/icc
	desc = "可容纳手雷、塑胶炸药、地雷箱及其他爆炸物。明显由合成棕褐色纤维制成。"
	icon_state = "large_explosive_icc"

/obj/item/storage/pouch/explosive/icc/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/grenade
	name = "手雷附包"
	desc = "它可以容纳手雷。"
	icon_state = "grenade"

/obj/item/storage/pouch/grenade/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = 6
	storage_datum.storage_slots = 6
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/explosive/grenade,
	))

/obj/item/storage/pouch/grenade/slightlyfull
	fill_type = /obj/item/explosive/grenade
	fill_number = 4

/obj/item/storage/pouch/grenade/combat_patrol/PopulateContents()
	new /obj/item/explosive/grenade/smokebomb(src)
	new /obj/item/explosive/grenade/smokebomb(src)
	new /obj/item/explosive/grenade/smokebomb/acid(src)
	new /obj/item/explosive/grenade/smokebomb/neuro(src)
	new /obj/item/explosive/grenade/flashbang/stun(src)
	new /obj/item/explosive/grenade/flashbang/stun(src)

/obj/item/storage/pouch/grenade/standard/PopulateContents()
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade/bullet/laser(src)
	new /obj/item/explosive/grenade/bullet/laser(src)
	new /obj/item/explosive/grenade/incendiary(src)

/obj/item/storage/pouch/grenade/emp
	fill_type = /obj/item/explosive/grenade/emp
	fill_number = 6

/obj/item/storage/pouch/grenade/som
	desc = "它可以容纳手雷。这个看起来是用传统的火星之子皮革制成的。"
	icon_state = "grenade_som"

/obj/item/storage/pouch/grenade/som/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/grenade/som/combat_patrol/PopulateContents()
	new /obj/item/explosive/grenade/smokebomb/som(src)
	new /obj/item/explosive/grenade/smokebomb/som(src)
	new /obj/item/explosive/grenade/smokebomb/satrapine(src)
	new /obj/item/explosive/grenade/smokebomb/satrapine(src)
	new /obj/item/explosive/grenade/flashbang/stun(src)
	new /obj/item/explosive/grenade/flashbang/stun(src)

/obj/item/storage/pouch/grenade/som/ert/PopulateContents()
	new /obj/item/explosive/grenade/smokebomb/som(src)
	new /obj/item/explosive/grenade/smokebomb/som(src)
	new /obj/item/explosive/grenade/smokebomb/satrapine(src)
	new /obj/item/explosive/grenade/smokebomb/satrapine(src)
	new /obj/item/explosive/grenade/som(src)
	new /obj/item/explosive/grenade/som(src)

/obj/item/storage/pouch/grenade/som/standard/PopulateContents()
	new /obj/item/explosive/grenade/som(src)
	new /obj/item/explosive/grenade/som(src)
	new /obj/item/explosive/grenade/som(src)
	new /obj/item/explosive/grenade/som(src)
	new /obj/item/explosive/grenade/incendiary/som(src)
	new /obj/item/explosive/grenade/incendiary/som(src)

/obj/item/storage/pouch/grenade/som/emp
	fill_type = /obj/item/explosive/grenade/emp
	fill_number = 6

/obj/item/storage/pouch/medkit
	name = "医疗包附包"
	desc = "一个标准用途的医疗附包，可容纳各类医疗物资和设备。"
	icon_state = "medkit"
	w_class = WEIGHT_CLASS_BULKY //does not fit in backpack

/obj/item/storage/pouch/medkit/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = 1
	storage_datum.max_w_class = WEIGHT_CLASS_BULKY
	storage_datum.storage_slots = 7
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/healthanalyzer,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/storage/pill_bottle/packet,
		/obj/item/reagent_containers/hypospray,
	))

/obj/item/storage/pouch/medkit/firstaid
	desc = "标准陆战队急救附包。包含基础药片、夹板和一支稳定剂注射器。"

/obj/item/storage/pouch/medkit/firstaid/PopulateContents()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/inaprovaline(src)

/obj/item/storage/pouch/medkit/doctor/PopulateContents()
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/reagent_containers/hypospray/advanced/meraderm(src)

/obj/item/storage/pouch/medkit/medic/PopulateContents()
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/reagent_containers/hypospray/advanced/quickclotplus_medkit(src)
	new /obj/item/reagent_containers/hypospray/advanced/peridaxonplus_medkit(src)
	new /obj/item/reagent_containers/hypospray/advanced/meraderm(src)

/obj/item/storage/pouch/medkit/som
	desc = "一个标准用途的医疗附包，可容纳各类医疗物资和设备。采用传统的火星之子皮革制成。"
	icon_state = "medkit_som"

/obj/item/storage/pouch/medkit/som/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/medkit/freelancer/PopulateContents()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/inaprovaline(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/inaprovaline(src)

/obj/item/storage/pouch/medkit/freelancer/leader/PopulateContents()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/isotonic(src)
	new /obj/item/reagent_containers/hypospray/advanced/inaprovaline(src)

/obj/item/storage/pouch/medical_injectors
	name = "医疗注射器附包"
	desc = "一个只能存放自动注射器的专用医疗附包。"
	icon_state = "firstaid_injector"

/obj/item/storage/pouch/medical_injectors/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = 5
	storage_datum.storage_slots = 8
	storage_datum.max_storage_space = 14
	storage_datum.set_holdable(can_hold_list = list(/obj/item/reagent_containers/hypospray/autoinjector))

/obj/item/storage/pouch/medical_injectors/firstaid
	desc = "标准陆战队急救注射器附包。专用于存放自动注射器。包含基础注射器、稳定剂注射器、兴奋剂注射器和紧急注射器。"

/obj/item/storage/pouch/medical_injectors/firstaid/PopulateContents() //used in hvh and erts
	new /obj/item/reagent_containers/hypospray/autoinjector/bicaridine (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/kelotane (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/tramadol (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/tricordrazine (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/dylovene (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/inaprovaline(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/synaptizine (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/russian_red (src)

/obj/item/storage/pouch/medical_injectors/standard/PopulateContents() //normal access variant available by default to marines
	new /obj/item/reagent_containers/hypospray/autoinjector/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/kelotane(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/tramadol(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/tricordrazine(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/dylovene(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/inaprovaline(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/synaptizine(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/synaptizine(src)

/obj/item/storage/pouch/medical_injectors/medic/PopulateContents() //corpsman autoinjector pouch gets upgraded, but more general chems.
	new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/dexalinplus(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/quickclotplus(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/quickclotplus(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus(src)

/obj/item/storage/pouch/medical_injectors/som
	desc = "一个只能存放自动注射器的专用医疗附包。这个看起来是用传统的火星之子皮革制成的。"
	icon_state = "firstaid_injector_som"

/obj/item/storage/pouch/medical_injectors/som/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/medical_injectors/som/firstaid/PopulateContents()
	new /obj/item/reagent_containers/hypospray/autoinjector/bicaridine (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/kelotane (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/tramadol (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/tricordrazine (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/dylovene (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/inaprovaline(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/synaptizine (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/russian_red (src)

/obj/item/storage/pouch/medical_injectors/som/medic/PopulateContents()
	new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/dexalinplus(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/quickclotplus(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/quickclotplus(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus(src)

/obj/item/storage/pouch/medical_injectors/icc
	desc = "一个只能存放自动注射器的专用医疗附包。这个看起来是用合成米色织物制成的。"
	icon_state = "firstaid_injector_icc"

/obj/item/storage/pouch/medical_injectors/icc/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/medical_injectors/icc/firstaid/PopulateContents()
	new /obj/item/reagent_containers/hypospray/autoinjector/bicaridine (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/kelotane (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/tramadol (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/tricordrazine (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/dylovene (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/inaprovaline(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/synaptizine (src)
	new /obj/item/reagent_containers/hypospray/autoinjector/russian_red (src)

/obj/item/storage/pouch/med_lolipops
	name = "医疗棒棒糖附包"
	desc = "一个带有三个独立口袋的小型医疗附包，用于分类存放你的医疗棒棒糖。"
	icon_state = "medlolly"

/obj/item/storage/pouch/med_lolipops/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = 3
	storage_datum.storage_slots = 3
	storage_datum.set_holdable(can_hold_list = list(/obj/item/storage/box/combat_lolipop))

/obj/item/storage/pouch/med_lolipops/PopulateContents()
	new /obj/item/storage/box/combat_lolipop(src)
	new /obj/item/storage/box/combat_lolipop/tricord(src)
	new /obj/item/storage/box/combat_lolipop/tramadol(src)

/obj/item/storage/pouch/berrypouch
	name = "浆果能量棒附包"
	desc = "一个满足你所有浆果需求的附包。"
	icon_state = "barpouch"
	fill_type = /obj/item/reagent_containers/food/snacks/wrapped/berrybar
	fill_number = 6

/obj/item/storage/pouch/berrypouch/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = 3
	storage_datum.storage_slots = 6
	storage_datum.set_holdable(can_hold_list = list(/obj/item/reagent_containers/food/snacks/wrapped/berrybar))

/obj/item/storage/pouch/surgery
	name = "手术工具附包"
	desc = "一款引人注目的白色医疗附包，能够容纳你所有的外科手术工具。"
	icon_state = "surgery"

/obj/item/storage/pouch/surgery/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = 1
	storage_datum.storage_slots = 12
	storage_datum.max_storage_space = 24
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/tool/surgery,
		/obj/item/stack/nanopaste,
		/obj/item/tweezers,
		/obj/item/tweezers_advanced,
	))

/obj/item/storage/pouch/surgery/PopulateContents()
	new /obj/item/tool/surgery/scalpel/manager(src)
	new /obj/item/tool/surgery/scalpel(src)
	new /obj/item/tool/surgery/hemostat(src)
	new /obj/item/tool/surgery/retractor(src)
	new /obj/item/tool/surgery/cautery(src)
	new /obj/item/tool/surgery/circular_saw(src)
	new /obj/item/tool/surgery/surgical_membrane(src)
	new /obj/item/tool/surgery/bonegel(src)
	new /obj/item/tool/surgery/bonesetter(src)
	new /obj/item/tool/surgery/FixOVein(src)
	new /obj/item/tool/surgery/suture(src)

/obj/item/storage/pouch/document
	name = "文件附包"
	desc = "它可以存放文件和写字板。"
	icon_state = "document"

/obj/item/storage/pouch/document/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 7
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/paper,
		/obj/item/clipboard,
		/obj/item/paper_map,
	))

/obj/item/storage/pouch/field_pouch
	name = "野战工具附包"
	desc = "可容纳运动探测器、信号器、信标、地图平板、无线电、文件及其他实用的战场通信、导航与探测设备。"
	icon_state = "utility"

/obj/item/storage/pouch/field_pouch/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 5
	storage_datum.max_w_class = WEIGHT_CLASS_NORMAL
	storage_datum.sprite_slots = 4
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/attachable/motiondetector,
		/obj/item/radio,
		/obj/item/assembly/signaler,
		/obj/item/megaphone,
		/obj/item/flashlight,
		/obj/item/whistle,
		/obj/item/binoculars,
		/obj/item/supply_beacon,
		/obj/item/compass,
		/obj/item/deployable_camera,
		/obj/item/hud_tablet,
		/obj/item/squad_transfer_tablet,
		/obj/item/minimap_tablet,
		/obj/item/supplytablet,
		/obj/item/megaphone,
		/obj/item/tool/hand_labeler,
		/obj/item/toy/deck,
		/obj/item/paper,
		/obj/item/clipboard,
		/obj/item/paper_map,
	))

/obj/item/storage/pouch/field_pouch/full/PopulateContents()
	new /obj/item/attachable/motiondetector (src)
	new /obj/item/whistle (src)
	new /obj/item/radio (src)
	new /obj/item/binoculars/tactical (src)

/obj/item/storage/pouch/electronics
	name = "电子设备附包"
	desc = "它设计用于容纳大多数电子设备、电源电池和电路板。"
	icon_state = "electronics"

/obj/item/storage/pouch/electronics/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = 1
	storage_datum.storage_slots = 6
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/circuitboard,
		/obj/item/cell,
	))

/obj/item/storage/pouch/electronics/full/PopulateContents()
	new /obj/item/circuitboard/airlock (src)
	new /obj/item/circuitboard/apc (src)
	new /obj/item/cell/high (src)


/obj/item/storage/pouch/construction
	name = "工程附包"
	desc = "它设计用于容纳建筑材料——玻璃/金属板、金属杆、铁丝网、电缆卷和空沙袋。还带有一个用于固定工兵铲的挂钩。"
	icon_state = "construction"

/obj/item/storage/pouch/construction/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 4
	storage_datum.max_w_class = WEIGHT_CLASS_NORMAL
	storage_datum.sprite_slots = 1
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/stack/barbed_wire,
		/obj/item/stack/sheet,
		/obj/item/stack/rods,
		/obj/item/stack/cable_coil,
		/obj/item/tool/shovel/etool,
		/obj/item/stack/sandbags_empty,
		/obj/item/stack/sandbags,
	))

/obj/item/storage/pouch/construction/full/PopulateContents()
	new /obj/item/stack/sandbags_empty/half (src)
	new /obj/item/stack/barbed_wire/small_stack (src)
	new /obj/item/tool/shovel/etool (src)

/obj/item/storage/pouch/construction/equippedengineer/PopulateContents()
	new /obj/item/stack/sandbags_empty/half (src)
	new /obj/item/stack/sheet/metal/large_stack (src)
	new /obj/item/stack/sheet/plasteel/medium_stack (src)

/obj/item/storage/pouch/construction/som
	desc = "它设计用于容纳建筑材料——玻璃板/金属板、金属杆、铁丝网、电缆卷和空沙袋。还带有一个用于固定工兵铲的挂钩。采用传统的火星之子皮革制成。"
	icon_state = "construction_som"

/obj/item/storage/pouch/construction/som/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/construction/icc
	desc = "它设计用于容纳建筑材料——玻璃/金属板、金属杆、铁丝网、电缆卷和空沙袋。还带有一个用于固定工兵铲的挂钩。采用合成鞣制皮革制成。"
	icon_state = "construction_icc"

/obj/item/storage/pouch/construction/icc/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/construction/icc/full/PopulateContents()
	new /obj/item/stack/sheet/metal/large_stack (src)
	new /obj/item/stack/sheet/metal/large_stack (src)
	new /obj/item/stack/sheet/plasteel/medium_stack (src)

/obj/item/storage/pouch/tools
	name = "工具附包"
	desc = "它设计用于存放维修工具——螺丝刀、扳手、电缆卷等。它还有一个挂钩，用于固定工兵铲。"
	icon_state = "tools"

/obj/item/storage/pouch/tools/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 5
	storage_datum.max_w_class = WEIGHT_CLASS_NORMAL
	storage_datum.sprite_slots = 1
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/tool/screwdriver,
		/obj/item/tool/wirecutters,
		/obj/item/tool/weldingtool,
		/obj/item/tool/wrench,
		/obj/item/tool/crowbar,
		/obj/item/stack/cable_coil,
		/obj/item/tool/multitool,
		/obj/item/flashlight,
		/obj/item/t_scanner,
		/obj/item/tool/analyzer,
		/obj/item/tool/taperoll/engineering,
		/obj/item/tool/extinguisher/mini,
		/obj/item/tool/shovel/etool,
	))

/obj/item/storage/pouch/tools/full/PopulateContents()
	new /obj/item/tool/screwdriver (src)
	new /obj/item/tool/wirecutters (src)
	new /obj/item/tool/weldingtool (src)
	new /obj/item/tool/wrench (src)
	new /obj/item/tool/crowbar (src)

/obj/item/storage/pouch/tools/som
	desc = "它设计用于存放维修工具——螺丝刀、扳手、电缆卷等。还带有一个用于固定工兵铲的挂钩。采用传统的火星之子皮革制成。"
	icon_state = "tools_som"

/obj/item/storage/pouch/tools/som/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/tools/som/full/PopulateContents()
	new /obj/item/tool/screwdriver (src)
	new /obj/item/tool/wirecutters (src)
	new /obj/item/tool/weldingtool (src)
	new /obj/item/tool/wrench (src)
	new /obj/item/tool/crowbar (src)

/obj/item/storage/pouch/tools/icc
	desc = "它设计用于存放维修工具——螺丝刀、扳手、电缆卷等。它还有一个用于固定工兵铲的挂钩。由合成棕褐色纤维制成。"
	icon_state = "tools_icc"

/obj/item/storage/pouch/tools/icc/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/tools/icc/full/PopulateContents()
	new /obj/item/tool/screwdriver (src)
	new /obj/item/tool/wirecutters (src)
	new /obj/item/tool/weldingtool (src)
	new /obj/item/tool/wrench (src)
	new /obj/item/tool/crowbar (src)

/obj/item/storage/pouch/shotgun
	name = "霰弹枪弹壳附包"
	desc = "专用于存放霰弹枪弹药的附包。"
	icon_state = "shotshells"

/obj/item/storage/pouch/shotgun/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = 4
	storage_datum.storage_slots = 4
	storage_datum.draw_mode = FALSE
	storage_datum.set_holdable(can_hold_list = list(/obj/item/ammo_magazine/handful))

/obj/item/storage/pouch/shotgun/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ammo_magazine))
		var/obj/item/ammo_magazine/M = I
		if(CHECK_BITFIELD(M.magazine_flags, MAGAZINE_HANDFUL))
			return ..()
		if(M.magazine_flags & MAGAZINE_REFILLABLE)
			if(!M.current_rounds)
				to_chat(user, span_warning("[M] 已空。"))
				return

			if(length(contents) >= storage_datum.storage_slots)
				to_chat(user, span_warning("[src] 已满。"))
				return


			to_chat(user, span_notice("你开始用[M]补充[src]的弹药。"))
			if(!do_after(user, 1.5 SECONDS, NONE, src, BUSY_ICON_GENERIC))
				return

			for(var/x in 1 to (storage_datum.storage_slots - length(contents)))
				var/cont = storage_datum.handle_item_insertion(M.create_handful(), 1, user)
				if(!cont)
					break

			playsound(user.loc, SFX_RUSTLE, 15, TRUE, 6)
			to_chat(user, span_notice("你将[src]重新装填了[M]。"))
			return TRUE

	return ..()

/obj/item/storage/pouch/shotgun/som
	desc = "专用于存放霰弹枪弹药的附包。采用传统的火星之子皮革制成。"
	icon_state = "shotshells_som"

/obj/item/storage/pouch/shotgun/som/Initialize(mapload, ...)
	. = ..()
	storage_datum.sprite_slots = null

/obj/item/storage/pouch/protein_pack
	name = "\improper 蛋白质包附包"
	desc = "一个设计用于存放适量蛋白质包的存储附包。"
	icon_state = "p_pouch"
	worn_icon_state = "survival"
	fill_type = /obj/item/reagent_containers/food/snacks/protein_pack
	fill_number = 10

/obj/item/storage/pouch/protein_pack/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_slots = 10
	storage_datum.max_storage_space = 10
	storage_datum.sprite_slots = 1
	storage_datum.max_w_class = WEIGHT_CLASS_TINY
	storage_datum.set_holdable(can_hold_list = list(/obj/item/reagent_containers/food/snacks/protein_pack))
