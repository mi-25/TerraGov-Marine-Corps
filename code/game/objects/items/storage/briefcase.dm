/obj/item/storage/briefcase
	name = "公文包"
	desc = "它由**正宗**人造皮革制成，价格标签还挂在上面。它的主人一定是个真正的专业人士。"
	icon_state = "briefcase"
	icon = 'icons/obj/items/storage/briefcase.dmi'
	worn_icon_state = "briefcase"
	atom_flags = CONDUCT
	force = 8
	throw_speed = 1
	throw_range = 4
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/briefcase

/obj/item/storage/briefcase/standard_magnum
	name = "R-76 马格南弹壳"
	desc = "一个做工精良、外观昂贵的枪盒，专为容纳R-76马格南手枪及其配件而设计。献给独具慧眼的枪主。"
	icon_state = "magnum_case"
	worn_icon_state = "briefcase"
	atom_flags = CONDUCT
	force = 12
	throw_speed = 1
	throw_range = 4
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/briefcase/standard_magnum

/obj/item/storage/briefcase/standard_magnum/gold/PopulateContents()
	new /obj/item/weapon/gun/revolver/standard_magnum/fancy/gold(src)
	new /obj/item/attachable/scope/standard_magnum(src)
	new /obj/item/attachable/stock/t76(src)
	new /obj/item/attachable/compensator(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)

/obj/item/storage/briefcase/standard_magnum/silver/PopulateContents()
	new /obj/item/weapon/gun/revolver/standard_magnum/fancy/silver(src)
	new /obj/item/attachable/scope/standard_magnum(src)
	new /obj/item/attachable/stock/t76(src)
	new /obj/item/attachable/compensator(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)

/obj/item/storage/briefcase/standard_magnum/nickle/PopulateContents()
	new /obj/item/weapon/gun/revolver/standard_magnum/fancy/nickle(src)
	new /obj/item/attachable/scope/standard_magnum(src)
	new /obj/item/attachable/stock/t76(src)
	new /obj/item/attachable/compensator(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)
	new /obj/item/ammo_magazine/revolver/standard_magnum(src)
