/*!
	Modular armor storage storage attachments
	These are storage attachments that equip into storage slots on modular armor
*/

/** Storage modules */
/obj/item/armor_module/storage
	icon = 'icons/mob/modular/modular_armor_modules.dmi'
	icon_state = "mod_is_bag"
	slot = ATTACHMENT_SLOT_STORAGE
	w_class = WEIGHT_CLASS_BULKY
	variants_by_parent_type = list(/obj/item/clothing/suit/modular/style = "")
	///Determines what subtype of storage is on our item, see datums\storage\subtypes
	var/datum/storage/storage_type = /datum/storage
	///If TRUE it will add extra overlays for the items within.
	var/show_storage = FALSE
	///Icon for the extra storage overlays.
	var/show_storage_icon = 'icons/mob/modular/modular_helmet_storage.dmi'

/obj/item/armor_module/storage/Initialize(mapload)
	. = ..()
	create_storage(storage_type)
	PopulateContents()

/obj/item/armor_module/storage/on_attach(obj/item/attaching_to, mob/user)
	. = ..()
	equip_delay_self = parent.equip_delay_self
	strip_delay = parent.strip_delay

	storage_datum.register_storage_signals(attaching_to)

/obj/item/armor_module/storage/on_detach(obj/item/detaching_from, mob/user)
	equip_delay_self = initial(equip_delay_self)
	strip_delay = initial(strip_delay)

	storage_datum.unregister_storage_signals(detaching_from)

	return ..()

///Use this to fill your storage with items. USE THIS INSTEAD OF NEW/INIT
/obj/item/armor_module/storage/proc/PopulateContents()
	return

/obj/item/storage/internal/modular
	storage_type = /datum/storage/internal/modular

/* Pockets */
/obj/item/armor_module/storage/pocket
	icon_state = ""
	worn_icon_state = ""
	attach_features_flags = ATTACH_APPLY_ON_MOB
	storage_type = /datum/storage/internal/pocket

/obj/item/armor_module/storage/pocket/medical
	storage_type = /datum/storage/internal/pocket/medical

/** General storage */
/obj/item/armor_module/storage/general
	name = "通用存储模块"
	desc = "专为安装在TGMC模块化装甲系统上设计。虽然不如其他存储模块那样专业，但绝对能容纳一些较大的物品，比如双筒望远镜、地图和运动探测器。"
	icon_state = "mod_general_bag"
	storage_type = /datum/storage/internal/general

/obj/item/armor_module/storage/general/som
	name = "通用存储模块"
	desc = "专为火星之子战斗护甲设计。虽然不如其他存储模块那样专业，但绝对能容纳一些较大的物品，比如手枪或弹匣。"
	icon_state = "mod_general_bag_som"
	worn_icon_state = "mod_general_bag_som_a"

/obj/item/armor_module/storage/ammo_mag
	name = "弹匣存储模块"
	desc = "专为地球政府殖民地海军陆战队的模块化装甲系统设计。可容纳一些弹匣。别指望能装下专家级弹药或轻机枪弹鼓，但它的实用性还是不错的。"
	icon_state = "mod_mag_bag"
	storage_type = /datum/storage/internal/ammo_mag

/obj/item/armor_module/storage/satchel
	name = "IS型存储模块"
	desc = "专为安装在MAGNUM佣兵模块化装甲上设计。会略微妨碍行动，但容量与挎包相当。"
	icon_state = "mod_is_bag"
	storage_type = /datum/storage/internal/satchel
	slowdown = 0.2

/obj/item/armor_module/storage/engineering
	name = "工程存储模块"
	desc = "专为地球政府殖民地海军陆战队的模块化装甲系统设计。容量与工具附包相当，有时可容纳小型线轴物品，如铁丝网或工兵铲。"
	icon_state = "mod_engineer_bag"
	storage_type = /datum/storage/internal/engineering

/obj/item/armor_module/storage/engineering/som
	name = "工程存储模块"
	desc = "专为火星之子战斗护甲设计。容量与工具附包相当，有时可容纳小型线轴（如铁丝网）或工兵铲。"
	icon_state = "mod_engineer_bag_som"
	worn_icon_state = "mod_engineer_bag_som_a"

/obj/item/armor_module/storage/medical
	name = "医疗存储模块"
	desc = "专为地球政府殖民地海军陆战队的模块化装甲系统设计。可容纳多种医疗物资和设备，但容量不及医疗包。"
	icon_state = "mod_medic_bag"
	storage_type = /datum/storage/internal/medical

/obj/item/armor_module/storage/medical/som
	name = "医疗存储模块"
	desc = "专为安装在火星之子战斗护甲上设计。可容纳多种医疗物资和设备，但容量不及医疗包。"
	icon_state = "mod_medic_bag_som"
	worn_icon_state = "mod_medic_bag_som_a"

/obj/item/armor_module/storage/injector
	name = "注射器存储模块"
	desc = "专为安装在TGMC模块化装甲系统上设计。可容纳多种注射器。"
	icon_state = "mod_injector_bag"
	storage_type = /datum/storage/internal/injector

/obj/item/armor_module/storage/integrated
	name = "大容量存储模块"
	desc = "专为地球政府殖民地海军陆战队的模块化装甲系统设计。会略微阻碍行动，但容量与一个挎包相当。"
	icon_state = "mod_is_bag"
	storage_type = /datum/storage/internal/integrated
	slowdown = 0.2

/obj/item/armor_module/storage/grenade
	name = "手雷存储模块"
	desc = "专为安装在TGMC模块化装甲系统上设计。可容纳相当数量的手雷。"
	icon_state = "mod_grenade_harness"
	storage_type = /datum/storage/internal/grenade

/obj/item/armor_module/storage/boot
	name = "启动存储模块"
	desc = "一套小型绑带，用于将物品固定在靴子上。"
	icon_state = ""
	storage_type = /datum/storage/internal/shoes/boot_knife
	attach_features_flags = ATTACH_APPLY_ON_MOB

/obj/item/armor_module/storage/boot/full/PopulateContents()
	new /obj/item/weapon/combat_knife(src)

/obj/item/armor_module/storage/boot/som_knife/PopulateContents()
	new /obj/item/attachable/bayonet/som(src)

/obj/item/armor_module/storage/boot/pmc_knife/PopulateContents()
	new /obj/item/weapon/combat_knife/pmc(src)

/obj/item/armor_module/storage/helmet
	name = "头盔存储模块"
	desc = "一套小型束带和绑带，便于存放小件物品。"
	icon_state = ""
	storage_type = /datum/storage/internal/marinehelmet
	show_storage = TRUE
	attach_features_flags = NONE
