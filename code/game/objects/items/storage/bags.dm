/*
*	These absorb the functionality of the plant bag, ore satchel, etc.
*	They use the use_to_pickup, quick_gather, and quick_empty functions
*	that were already defined in weapon/storage, but which had been
*	re-implemented in other classes.
*
*	Contains:
*		Trash Bag
*		Mining Satchel
*		Plant Bag
*		Sheet Snatcher
*		Cash Bag
*
*	-Sayu
*/

//  Generic non-item
/obj/item/storage/bag
	icon = 'icons/obj/items/storage/bag.dmi'
	equip_slot_flags = ITEM_SLOT_BELT
	storage_type = /datum/storage/bag

// -----------------------------
//          Trash bag
// -----------------------------
/obj/item/storage/bag/trash
	name = "垃圾袋"
	desc = "这是重型黑色聚合物材质。是时候清理垃圾了！"
	icon_state = "trashbag0"
	worn_icon_state = "trashbag"

	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/bag/trash

/obj/item/storage/bag/trash/update_icon_state()
	. = ..()
	if(length(contents) == 0)
		icon_state = "trashbag0"
	else if(length(contents) < 12)
		icon_state = "trashbag1"
	else if(length(contents) < 21)
		icon_state = "trashbag2"
	else
		icon_state = "trashbag3"


// -----------------------------
//        Plastic Bag
// -----------------------------

/obj/item/storage/bag/plasticbag
	name = "塑料袋"
	desc = "这是一个非常脆弱、非常吵闹的背包替代品。"
	icon = 'icons/obj/items/trash.dmi'
	icon_state = "plasticbag"
	worn_icon_state = "plasticbag"

	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/bag/plasticbag

// -----------------------------
//        Mining Satchel
// -----------------------------

/obj/item/storage/bag/ore
	name = "采矿挎包"
	desc = "这个小玩意儿可以用来储存和运输矿石。"
	icon_state = "satchel"
	equip_slot_flags = ITEM_SLOT_BELT|ITEM_SLOT_POCKET
	w_class = WEIGHT_CLASS_NORMAL
	storage_type = /datum/storage/bag/ore

// -----------------------------
//          Plant bag
// -----------------------------

/obj/item/storage/bag/plants
	icon_state = "plantbag"
	name = "种植袋"
	w_class = WEIGHT_CLASS_SMALL
	storage_type = /datum/storage/bag/plants

// -----------------------------
//        Sheet Snatcher
// -----------------------------
// Because it stacks stacks, this doesn't operate normally.
// However, making it a storage/bag allows us to reuse existing code in some places. -Sayu

/obj/item/storage/bag/sheetsnatcher
	icon_state = "sheetsnatcher"
	name = "表格抽取器"
	desc = "一种获得专利的纳米传讯存储系统，专为各类矿物板材设计。"
	w_class = WEIGHT_CLASS_NORMAL
	storage_type = /datum/storage/bag/sheetsnatcher
	///the number of sheets it can carry.
	var/capacity = 300

// -----------------------------
//    Sheet Snatcher (Cyborg)
// -----------------------------

/obj/item/storage/bag/sheetsnatcher/borg
	name = "文件抽取器9000"
	desc = ""
	capacity = 500//Borgs get more because >specialization

// -----------------------------
//           Cash Bag
// -----------------------------

/obj/item/storage/bag/cash
	icon_state = "cashbag"
	name = "现金袋"
	desc = "一个用来装大量现金的袋子。正面印着一个大大的美元符号。"
	w_class = WEIGHT_CLASS_SMALL
	storage_type = /datum/storage/bag/cash
