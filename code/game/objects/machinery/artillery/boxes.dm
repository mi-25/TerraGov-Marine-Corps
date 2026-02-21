
/obj/structure/closet/crate/mortar_ammo
	name = "\improper T-50S 迫击炮弹药板条箱"
	desc = "装有各种弹药的迫击炮弹板条箱。请勿摔落。远离火源。"
	icon_state = "closed_mortar"
	icon_opened = "open_mortar"
	icon_closed = "closed_mortar"

/obj/structure/closet/crate/mortar_ammo/full/PopulateContents()
	new /obj/item/mortal_shell/he(src)
	new /obj/item/mortal_shell/he(src)
	new /obj/item/mortal_shell/he(src)
	new /obj/item/mortal_shell/he(src)
	new /obj/item/mortal_shell/incendiary(src)
	new /obj/item/mortal_shell/incendiary(src)
	new /obj/item/mortal_shell/incendiary(src)
	new /obj/item/mortal_shell/incendiary(src)
	new /obj/item/mortal_shell/flare(src)
	new /obj/item/mortal_shell/flare(src)
	new /obj/item/mortal_shell/flare(src)
	new /obj/item/mortal_shell/flare(src)
	new /obj/item/mortal_shell/smoke(src)
	new /obj/item/mortal_shell/smoke(src)
	new /obj/item/mortal_shell/plasmaloss(src)
	new /obj/item/mortal_shell/plasmaloss(src)

/obj/structure/closet/crate/mortar_ammo/mortar_kit
	name = "\improper TA-50S迫击炮套件"
	desc = "一个装有迫击炮基础套件和一些炮弹的板条箱，供工程兵起步使用。"

/obj/structure/closet/crate/mortar_ammo/mortar_kit/PopulateContents()
	new /obj/item/storage/holster/backholster/mortar/full(src)
	new /obj/item/mortal_shell/he(src)
	new /obj/item/mortal_shell/he(src)
	new /obj/item/mortal_shell/he(src)
	new /obj/item/mortal_shell/he(src)
	new /obj/item/mortal_shell/he(src)
	new /obj/item/mortal_shell/he(src)
	new /obj/item/mortal_shell/he(src)
	new /obj/item/mortal_shell/he(src)
	new /obj/item/mortal_shell/incendiary(src)
	new /obj/item/mortal_shell/incendiary(src)
	new /obj/item/mortal_shell/incendiary(src)
	new /obj/item/mortal_shell/incendiary(src)
	new /obj/item/mortal_shell/incendiary(src)
	new /obj/item/mortal_shell/incendiary(src)
	new /obj/item/mortal_shell/incendiary(src)
	new /obj/item/mortal_shell/incendiary(src)
	new /obj/item/mortal_shell/plasmaloss(src)
	new /obj/item/mortal_shell/plasmaloss(src)
	new /obj/item/mortal_shell/smoke(src)
	new /obj/item/mortal_shell/smoke(src)
	new /obj/item/mortal_shell/smoke(src)
	new /obj/item/mortal_shell/smoke(src)
	new /obj/item/mortal_shell/flare(src)
	new /obj/item/mortal_shell/flare(src)
	new /obj/item/mortal_shell/flare(src)
	new /obj/item/mortal_shell/flare(src)
	new /obj/item/encryptionkey/engi(src)
	new /obj/item/encryptionkey/engi(src)
	new /obj/item/binoculars/tactical/range(src)
	new /obj/item/encryptionkey/cas(src)
	new /obj/item/encryptionkey/cas(src)
	new /obj/item/encryptionkey/cas(src)
	new /obj/item/hud_tablet/artillery(src)


/obj/structure/closet/crate/mortar_ammo/howitzer_kit
	name = "\improper TA-100Y 榴弹炮套件"
	desc = "一个板条箱，内含一套基础但经过某种方式压缩的套件，包括一门完整的榴弹炮和一些炮弹，供炮兵新手起步使用。"

/obj/structure/closet/crate/mortar_ammo/howitzer_kit/PopulateContents()
	new /obj/item/mortar_kit/howitzer(src)
	new /obj/item/mortal_shell/howitzer/incendiary(src)
	new /obj/item/mortal_shell/howitzer/incendiary(src)
	new /obj/item/mortal_shell/howitzer/incendiary(src)
	new /obj/item/mortal_shell/howitzer/incendiary(src)
	new /obj/item/mortal_shell/howitzer/incendiary(src)
	new /obj/item/mortal_shell/howitzer/incendiary(src)
	new /obj/item/mortal_shell/howitzer/incendiary(src)
	new /obj/item/mortal_shell/howitzer/incendiary(src)
	new /obj/item/mortal_shell/howitzer/he(src)
	new /obj/item/mortal_shell/howitzer/he(src)
	new /obj/item/mortal_shell/howitzer/he(src)
	new /obj/item/mortal_shell/howitzer/he(src)
	new /obj/item/mortal_shell/howitzer/he(src)
	new /obj/item/mortal_shell/howitzer/he(src)
	new /obj/item/mortal_shell/howitzer/he(src)
	new /obj/item/mortal_shell/howitzer/he(src)
	new /obj/item/mortal_shell/howitzer/he(src)
	new /obj/item/mortal_shell/howitzer/he(src)
	new /obj/item/mortal_shell/howitzer/white_phos(src)
	new /obj/item/mortal_shell/howitzer/white_phos(src)
	new /obj/item/mortal_shell/howitzer/white_phos(src)
	new /obj/item/mortal_shell/howitzer/white_phos(src)
	new	/obj/item/mortal_shell/howitzer/plasmaloss(src)
	new	/obj/item/mortal_shell/howitzer/plasmaloss(src)
	new	/obj/item/mortal_shell/howitzer/plasmaloss(src)
	new	/obj/item/mortal_shell/howitzer/plasmaloss(src)
	new /obj/item/mortal_shell/flare(src)
	new /obj/item/mortal_shell/flare(src)
	new /obj/item/mortal_shell/flare(src)
	new /obj/item/mortal_shell/flare(src)
	new /obj/item/encryptionkey/engi(src)
	new /obj/item/encryptionkey/engi(src)
	new /obj/item/binoculars/tactical/range(src)
	new /obj/item/encryptionkey/cas(src)
	new /obj/item/encryptionkey/cas(src)
	new /obj/item/encryptionkey/cas(src)
	new /obj/item/hud_tablet/artillery(src)


/obj/structure/closet/crate/mortar_ammo/mlrs_kit
	name = "\improper TA-40L 多管火箭炮套件"
	desc = "一个板条箱，内含一套基础但经过某种方式压缩的装备，包括完整的多管火箭发射系统和一些火箭弹，供炮兵新手起步使用。"

/obj/structure/closet/crate/mortar_ammo/mlrs_kit/PopulateContents()
	new /obj/item/mortar_kit/mlrs(src)
	new /obj/item/storage/box/mlrs_rockets(src)
	new /obj/item/storage/box/mlrs_rockets(src)
	new /obj/item/storage/box/mlrs_rockets(src)
	new /obj/item/encryptionkey/engi(src)
	new /obj/item/encryptionkey/engi(src)
	new /obj/item/binoculars/tactical/range(src)
	new /obj/item/encryptionkey/cas(src)
	new /obj/item/encryptionkey/cas(src)
	new /obj/item/encryptionkey/cas(src)
	new /obj/item/hud_tablet/artillery(src)


/obj/item/storage/box/mlrs_rockets
	name = "\improper TA-40L火箭板条箱"
	desc = "一个装有压缩状态下火箭弹的大型弹药箱，用于TA-40L多管火箭发射系统。将此图标拖入你的物品栏以打开它！\n注意：你无法将物品放回此弹药箱内。"

/obj/item/storage/box/mlrs_rockets/Initialize(mapload)
	. = ..()
	storage_datum.storage_slots = 16

/obj/item/storage/box/mlrs_rockets/PopulateContents()
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)
	new /obj/item/mortal_shell/rocket/mlrs(src)

/obj/item/storage/box/mlrs_rockets/gas
	name = "\improper TA-40L X-50 火箭板条箱"
	desc = "一个装有压缩状态下火箭弹的大型弹药箱，用于TA-40L多管火箭发射系统。将此图标拖入你的物品栏以打开它！\n注意：你无法将物品放回此弹药箱内。"

/obj/item/storage/box/mlrs_rockets/gas/Initialize(mapload)
	. = ..()
	storage_datum.storage_slots = 16

/obj/item/storage/box/mlrs_rockets/gas/PopulateContents()
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)
	new /obj/item/mortal_shell/rocket/mlrs/gas(src)

/obj/item/storage/box/mlrs_rockets/cloak
	name = "\improper TA-40L 'S-2' 火箭板条箱"

/obj/item/storage/box/mlrs_rockets/cloak/PopulateContents()
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)
	new /obj/item/mortal_shell/rocket/mlrs/cloak(src)

/obj/item/storage/box/mlrs_rockets/incendiary
	name = "\improper TA-40L 燃烧火箭板条箱"
	desc = "一个装有压缩状态下火箭弹的大型弹药箱，用于TA-40L多管火箭发射系统。将此图标拖入你的物品栏以打开它！\n注意：你无法将物品放回此弹药箱内。"

/obj/item/storage/box/mlrs_rockets/incendiary/Initialize(mapload)
	. = ..()
	storage_datum.storage_slots = 16

/obj/item/storage/box/mlrs_rockets/incendiary/PopulateContents()
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
	new /obj/item/mortal_shell/rocket/mlrs/incendiary(src)
