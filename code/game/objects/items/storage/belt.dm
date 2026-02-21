

/obj/item/storage/belt
	name = "腰带"
	desc = "可容纳多种物品。"
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "utilitybelt"
	worn_icon_state = "utility"
	item_state_worn = TRUE
	equip_slot_flags = ITEM_SLOT_BELT
	attack_verb = list("whips", "lashes", "disciplines")
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/belt

/obj/item/storage/belt/equipped(mob/user, slot)
	if(slot == SLOT_BELT)
		mouse_opacity = 2 //so it's easier to click when properly equipped.
	..()

/obj/item/storage/belt/dropped(mob/user)
	mouse_opacity = initial(mouse_opacity)
	..()

/obj/item/storage/belt/vendor_equip(mob/user)
	..()
	return user.equip_to_appropriate_slot(src)

/obj/item/storage/belt/champion
	name = "冠军腰带"
	desc = "向世界证明你是最强的！"
	icon_state = "championbelt"
	worn_icon_state = "champion"
	storage_type = /datum/storage/belt/champion

/*============================//MARINE BELTS\\==================================
=======================================================================*/

/obj/item/storage/belt/utility
	name = "\improper M276型工具带携行具" //Carn: utility belt is nicer, but it bamboozles the text parsing.
	desc = "M276是地球政府殖民地海军陆战队的标准负重装备。它由一个模块化腰带和各种夹扣组成。此版本不具备任何战斗功能，通常由工程兵用于运输重要工具。"
	icon_state = "utilitybelt"
	worn_icon_state = "utility"
	storage_type = /datum/storage/belt/utility

/obj/item/storage/belt/utility/full/PopulateContents()
	new /obj/item/tool/screwdriver(src)
	new /obj/item/tool/wirecutters(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/wrench(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/stack/cable_coil(src,30,pick("red","yellow","orange"))
	new /obj/item/tool/multitool(src)


/obj/item/storage/belt/utility/atmostech/PopulateContents()
	new /obj/item/tool/screwdriver(src)
	new /obj/item/tool/wrench(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/tool/wirecutters(src)
	new /obj/item/t_scanner(src)

/obj/item/storage/belt/medical_small
	name = "\improper M276型轻型医疗携行具"
	desc = "M276是地球政府殖民地海军陆战队的标准承载装备。它由一个带有各种夹扣的模块化腰带组成。这种轻量配置常被陆战队员用于大量携带医疗物资。"
	icon_state = "medicalbelt_small"
	worn_icon_state = "medicbag"
	storage_type = /datum/storage/belt/medical_small

/obj/item/storage/belt/lifesaver
	name = "\improper M276型救生包"
	desc = "M276是地球政府殖民地海军陆战队的标准承载装备。此配置挂载一个装有多种注射器和轻型医疗用品的帆布袋，常见于卫生兵。"
	icon_state = "medicalbag"
	worn_icon_state = "medicbag"
	storage_type = /datum/storage/belt/lifesaver

/obj/item/storage/belt/lifesaver/full/Initialize(mapload)  //The belt, with all it's magic inside!
	. = ..()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/isotonic(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)
	new /obj/item/storage/pill_bottle/alkysine(src)
	new /obj/item/storage/pill_bottle/imidazoline(src)
	new /obj/item/storage/pill_bottle/quickclot(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/lifesaver/quick/Initialize(mapload)  //quick load for combat patrol
	. = ..()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)
	new /obj/item/storage/pill_bottle/alkysine(src)
	new /obj/item/storage/pill_bottle/imidazoline(src)
	new /obj/item/storage/pill_bottle/quickclot(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/storage/pill_bottle/meralyne(src)
	new /obj/item/storage/pill_bottle/dermaline(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/lifesaver/beginner/Initialize(mapload, ...) //For beginner vendor
	. = ..()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/meralyne(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/dermaline(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/isotonic(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)
	new /obj/item/storage/pill_bottle/alkysine(src)
	new /obj/item/storage/pill_bottle/imidazoline(src)
	new /obj/item/storage/pill_bottle/quickclot(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/lifesaver/full/upp
	name ="\improper 41型救生袋"
	desc = "Type 41 携行具是 UPP 军队的标准配发 LBE。此配置挂载一个装有多种注射器和轻型医疗用品的挎包，常见于卫生兵和游击队员。"
	icon_state = "medicbag_upp"
	worn_icon_state = "medicbag_upp"


/obj/item/storage/belt/lifesaver/som
	name = "\improper S17 救生包"
	desc = "一条源自旧时采矿殖民地医护人员所用腰带的厚重腰带。"
	icon_state = "medicbag_som"
	worn_icon_state = "medicbag_som"

/obj/item/storage/belt/lifesaver/som/ert/PopulateContents()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/dexalin(src)
	new /obj/item/storage/pill_bottle/quickclot(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/storage/pill_bottle/meralyne(src)
	new /obj/item/storage/pill_bottle/dermaline(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/lifesaver/som/quick/PopulateContents()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)
	new /obj/item/storage/pill_bottle/alkysine(src)
	new /obj/item/storage/pill_bottle/imidazoline(src)
	new /obj/item/storage/pill_bottle/quickclot(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/storage/pill_bottle/meralyne(src)
	new /obj/item/storage/pill_bottle/dermaline(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/lifesaver/icc
	name = "\improper 莫德尔/129 救生袋"
	desc = "一条由合成棕褐色纤维制成的医疗腰带，几乎能装下你在战斗中处理创伤所需的一切物品。"
	icon_state = "medicbag_icc"
	worn_icon_state = "medicbag_icc"

/obj/item/storage/belt/lifesaver/icc/ert/PopulateContents()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/dexalin(src)
	new /obj/item/storage/pill_bottle/quickclot(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/storage/pill_bottle/meralyne(src)
	new /obj/item/storage/pill_bottle/dermaline(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/rig
	name = "\improper M276型医疗存储背心"
	desc = "M276是地球政府殖民地海军陆战队的标准承载装备。它由一个模块化腰带和各种夹扣组成。这个版本是一种较少见的配置，专为运输医疗物资和较重的医疗工具而设计。"
	icon_state = "medicalbelt"
	worn_icon_state = "medical"
	storage_type = /datum/storage/belt/rig

/obj/item/storage/belt/rig/medical/Initialize(mapload)  //The belt, with all it's magic inside!
	. = ..()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/isotonic(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)
	new /obj/item/storage/pill_bottle/alkysine(src)
	new /obj/item/storage/pill_bottle/imidazoline(src)
	new /obj/item/storage/pill_bottle/quickclot(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/roller(src)
	new /obj/item/defibrillator(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/rig/research/Initialize(mapload)  //The belt, with all it's magic inside!
	. = ..()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/isotonic(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)
	new /obj/item/storage/pill_bottle/alkysine(src)
	new /obj/item/storage/pill_bottle/imidazoline(src)
	new /obj/item/storage/pill_bottle/quickclot(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/defibrillator(src)
	new /obj/item/tool/research/excavation_tool(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/hypospraybelt
	name = "\improper M276型皮下注射器腰带"
	desc = "M276是地球政府殖民地海军陆战队的标准负重装备。它由一条模块化腰带和各种夹扣组成。这个版本是一种不太常见的配置，设计用于携带注射器和试剂容器。你或许也能放进去一个注射器盒。"
	icon_state = "hypospraybelt"
	worn_icon_state = "medicbag"
	storage_type = /datum/storage/belt/hypospraybelt

/obj/item/storage/belt/hypospraybelt/full/Initialize(mapload)  //The belt, with all it's magic inside!
	. = ..()
	new /obj/item/reagent_containers/glass/bottle/bicaridine(src)
	new /obj/item/reagent_containers/glass/bottle/kelotane(src)
	new /obj/item/reagent_containers/glass/bottle/tramadol(src)
	new /obj/item/reagent_containers/glass/bottle/tricordrazine(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/kelotane(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/tramadol(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/tricordrazine(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/combatmix(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/dylovene(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/inaprovaline(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/isotonic(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/spaceacillin(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/quickclot(src)
	new /obj/item/reagent_containers/hypospray/advanced/imialky(src)
	new /obj/item/reagent_containers/hypospray/advanced/hypervene(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/hypospraybelt/beginner/PopulateContents()
	new /obj/item/reagent_containers/glass/bottle/bicaridine(src)
	new /obj/item/reagent_containers/glass/bottle/kelotane(src)
	new /obj/item/reagent_containers/glass/bottle/tramadol(src)
	new /obj/item/reagent_containers/glass/bottle/tricordrazine(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/kelotane(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/tramadol(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/tricordrazine(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/combatmix(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/dylovene(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/inaprovaline(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/isotonic(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/spaceacillin(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/quickclot(src)
	new /obj/item/reagent_containers/hypospray/advanced/imialky(src)
	new /obj/item/reagent_containers/hypospray/advanced/hypervene(src)
	new /obj/item/reagent_containers/hypospray/advanced/peridaxonplus(src)
	new /obj/item/reagent_containers/hypospray/advanced/quickclotplus(src)
	new /obj/item/storage/syringe_case/meraderm(src)
	new /obj/item/storage/syringe_case/meraderm(src)
	new /obj/item/reagent_containers/hypospray/advanced/meraderm(src)


/obj/item/storage/belt/security
	name = "\improper M276型安保外骨骼"
	desc = "M276是地球政府殖民地海军陆战队的标准负重装备。它由一个模块化腰带和各种夹扣组成。这种配置常见于地球政府殖民地海军陆战队宪兵和维和人员，不过也能携带一些轻型弹药。"
	icon_state = "securitybelt"
	worn_icon_state = "security"//Could likely use a better one.
	storage_type = /datum/storage/belt/security

/obj/item/storage/belt/security/tactical
	name = "战斗腰带"
	desc = "可存放手铐和闪光弹等安保装备，附包越多，存储空间越大。"
	icon_state = "swatbelt"
	worn_icon_state = "swatbelt"
	storage_type = /datum/storage/belt/security/tactical

/obj/item/storage/belt/marine
	name = "\improper M276型弹药装载背心"
	desc = "M276是地球政府殖民地海军陆战队的标准承载装备。它由一个模块化腰带和各种弹夹组成。此版本是为大量弹药携带行动设计的标准型号。"
	icon_state = "marinebelt"
	worn_icon_state = "marinebelt"
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/belt/marine

/obj/item/storage/belt/marine/t18/PopulateContents()
	new /obj/item/ammo_magazine/rifle/standard_carbine(src)
	new /obj/item/ammo_magazine/rifle/standard_carbine(src)
	new /obj/item/ammo_magazine/rifle/standard_carbine(src)
	new /obj/item/ammo_magazine/rifle/standard_carbine(src)
	new /obj/item/ammo_magazine/rifle/standard_carbine(src)
	new /obj/item/ammo_magazine/rifle/standard_carbine(src)

/obj/item/storage/belt/marine/t12/PopulateContents()
	new /obj/item/ammo_magazine/rifle/standard_assaultrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_assaultrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_assaultrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_assaultrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_assaultrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_assaultrifle(src)

/obj/item/storage/belt/marine/standard_skirmishrifle/PopulateContents()
	new /obj/item/ammo_magazine/rifle/standard_skirmishrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_skirmishrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_skirmishrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_skirmishrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_skirmishrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_skirmishrifle(src)

/obj/item/storage/belt/marine/standard_battlerifle/PopulateContents()
	new /obj/item/ammo_magazine/rifle/standard_br(src)
	new /obj/item/ammo_magazine/rifle/standard_br(src)
	new /obj/item/ammo_magazine/rifle/standard_br(src)
	new /obj/item/ammo_magazine/rifle/standard_br(src)
	new /obj/item/ammo_magazine/rifle/standard_br(src)
	new /obj/item/ammo_magazine/rifle/standard_br(src)

/obj/item/storage/belt/marine/t90/PopulateContents()
	new /obj/item/ammo_magazine/smg/standard_smg(src)
	new /obj/item/ammo_magazine/smg/standard_smg(src)
	new /obj/item/ammo_magazine/smg/standard_smg(src)
	new /obj/item/ammo_magazine/smg/standard_smg(src)
	new /obj/item/ammo_magazine/smg/standard_smg(src)
	new /obj/item/ammo_magazine/smg/standard_smg(src)

/obj/item/storage/belt/marine/secondary/PopulateContents()
	new /obj/item/ammo_magazine/smg/m25(src)
	new /obj/item/ammo_magazine/smg/m25(src)
	new /obj/item/ammo_magazine/smg/m25(src)
	new /obj/item/ammo_magazine/smg/m25(src)
	new /obj/item/ammo_magazine/smg/m25(src)
	new /obj/item/ammo_magazine/smg/m25(src)

/obj/item/storage/belt/marine/antimaterial/PopulateContents()
	new /obj/item/ammo_magazine/sniper/flak(src)
	new /obj/item/ammo_magazine/sniper/flak(src)
	new /obj/item/ammo_magazine/sniper/incendiary(src)
	new /obj/item/ammo_magazine/sniper/incendiary(src)
	new /obj/item/ammo_magazine/sniper(src)
	new /obj/item/ammo_magazine/sniper(src)

/obj/item/storage/belt/marine/tx8/PopulateContents()
	new /obj/item/ammo_magazine/rifle/tx8/impact(src)
	new /obj/item/ammo_magazine/rifle/tx8/impact(src)
	new /obj/item/ammo_magazine/rifle/tx8/incendiary(src)
	new /obj/item/ammo_magazine/rifle/tx8/incendiary(src)
	new /obj/item/ammo_magazine/rifle/tx8(src)
	new /obj/item/ammo_magazine/rifle/tx8(src)

/obj/item/storage/belt/marine/combat_rifle/PopulateContents()
	new /obj/item/ammo_magazine/rifle/tx11(src)
	new /obj/item/ammo_magazine/rifle/tx11(src)
	new /obj/item/ammo_magazine/rifle/tx11(src)
	new /obj/item/ammo_magazine/rifle/tx11(src)
	new /obj/item/ammo_magazine/rifle/tx11(src)
	new /obj/item/ammo_magazine/rifle/tx11(src)

/obj/item/storage/belt/marine/alf_machinecarbine/PopulateContents()
	new /obj/item/ammo_magazine/rifle/alf_machinecarbine(src)
	new /obj/item/ammo_magazine/rifle/alf_machinecarbine(src)
	new /obj/item/ammo_magazine/rifle/alf_machinecarbine(src)
	new /obj/item/ammo_magazine/rifle/alf_machinecarbine(src)
	new /obj/item/ammo_magazine/rifle/alf_machinecarbine(src)
	new /obj/item/ammo_magazine/rifle/alf_machinecarbine(src)

/obj/item/storage/belt/marine/auto_shotgun/PopulateContents()
	new /obj/item/ammo_magazine/rifle/tx15_slug(src)
	new /obj/item/ammo_magazine/rifle/tx15_slug(src)
	new /obj/item/ammo_magazine/rifle/tx15_slug(src)
	new /obj/item/ammo_magazine/rifle/tx15_flechette(src)
	new /obj/item/ammo_magazine/rifle/tx15_flechette(src)
	new /obj/item/ammo_magazine/rifle/tx15_flechette(src)

/obj/item/storage/belt/marine/te_cells/PopulateContents()
	new /obj/item/cell/lasgun/lasrifle(src)
	new /obj/item/cell/lasgun/lasrifle(src)
	new /obj/item/cell/lasgun/lasrifle(src)
	new /obj/item/cell/lasgun/lasrifle(src)
	new /obj/item/cell/lasgun/lasrifle(src)
	new /obj/item/cell/lasgun/lasrifle(src)

/obj/item/storage/belt/marine/oicw/PopulateContents()
	new /obj/item/ammo_magazine/rifle/standard_carbine(src)
	new /obj/item/ammo_magazine/rifle/standard_carbine(src)
	new /obj/item/ammo_magazine/rifle/tx54/incendiary(src)
	new /obj/item/ammo_magazine/rifle/tx54/incendiary(src)
	new /obj/item/ammo_magazine/rifle/tx54(src)
	new /obj/item/ammo_magazine/rifle/tx54(src)

/obj/item/storage/belt/marine/smartgun/PopulateContents()
	new /obj/item/ammo_magazine/standard_smartmachinegun(src)
	new /obj/item/ammo_magazine/standard_smartmachinegun(src)
	new /obj/item/ammo_magazine/standard_smartmachinegun(src)
	new /obj/item/ammo_magazine/standard_smartmachinegun(src)
	new /obj/item/ammo_magazine/standard_smartmachinegun(src)
	new /obj/item/ammo_magazine/standard_smartmachinegun(src)

/obj/item/storage/belt/marine/target_rifle/PopulateContents()
	new /obj/item/ammo_magazine/rifle/standard_smarttargetrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_smarttargetrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_smarttargetrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_smarttargetrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_smarttargetrifle(src)
	new /obj/item/ammo_magazine/rifle/standard_smarttargetrifle(src)

/obj/item/storage/belt/marine/upp
	name = "\improper 41式装弹携行具"
	desc = "41型装载带是联合太空鳞翅目海盗的标准配发LBE。这条腰带的主要功能是在行动中为71型武器提供便捷的弹匣取用。尽管专为71型武器系统设计，但其附包采用模块化设计，足以容纳其他类型的弹药和装备。"
	icon_state = "upp_belt"
	worn_icon_state = "upp_belt"

//version full of type 71 mags
/obj/item/storage/belt/marine/upp/full/PopulateContents()
	new /obj/item/ammo_magazine/rifle/type71(src)
	new /obj/item/ammo_magazine/rifle/type71(src)
	new /obj/item/ammo_magazine/rifle/type71(src)
	new /obj/item/ammo_magazine/rifle/type71(src)
	new /obj/item/ammo_magazine/rifle/type71(src)
	new /obj/item/ammo_magazine/rifle/type71(src)

/obj/item/storage/belt/marine/som
	name = "\improper S18 弹药带"
	desc = "一条可追溯至M276弹药腰带和某些旧殖民地安保装备的腰带。"
	icon_state = "som_belt"
	worn_icon_state = "som_belt"

/obj/item/storage/belt/marine/som/som_rifle/PopulateContents()
	new /obj/item/ammo_magazine/rifle/som(src)
	new /obj/item/ammo_magazine/rifle/som(src)
	new /obj/item/ammo_magazine/rifle/som(src)
	new /obj/item/ammo_magazine/rifle/som(src)
	new /obj/item/ammo_magazine/rifle/som(src)
	new /obj/item/ammo_magazine/rifle/som(src)

/obj/item/storage/belt/marine/som/som_rifle_ap/PopulateContents()
	new /obj/item/ammo_magazine/rifle/som/ap(src)
	new /obj/item/ammo_magazine/rifle/som/ap(src)
	new /obj/item/ammo_magazine/rifle/som/ap(src)
	new /obj/item/ammo_magazine/rifle/som/ap(src)
	new /obj/item/ammo_magazine/rifle/som/ap(src)
	new /obj/item/ammo_magazine/rifle/som/ap(src)

/obj/item/storage/belt/marine/som/som_smg/PopulateContents()
	new /obj/item/ammo_magazine/smg/som(src)
	new /obj/item/ammo_magazine/smg/som(src)
	new /obj/item/ammo_magazine/smg/som(src)
	new /obj/item/ammo_magazine/smg/som(src)
	new /obj/item/ammo_magazine/smg/som(src)
	new /obj/item/ammo_magazine/smg/som(src)

/obj/item/storage/belt/marine/som/som_smg_ap/PopulateContents()
	new /obj/item/ammo_magazine/smg/som/ap(src)
	new /obj/item/ammo_magazine/smg/som/ap(src)
	new /obj/item/ammo_magazine/smg/som/ap(src)
	new /obj/item/ammo_magazine/smg/som/ap(src)
	new /obj/item/ammo_magazine/smg/som/ap(src)
	new /obj/item/ammo_magazine/smg/som/ap(src)

/obj/item/storage/belt/marine/som/volkite/PopulateContents()
	new /obj/item/cell/lasgun/volkite(src)
	new /obj/item/cell/lasgun/volkite(src)
	new /obj/item/cell/lasgun/volkite(src)
	new /obj/item/cell/lasgun/volkite(src)
	new /obj/item/cell/lasgun/volkite(src)
	new /obj/item/cell/lasgun/volkite(src)

/obj/item/storage/belt/marine/som/mpi_plum/PopulateContents()
	new /obj/item/ammo_magazine/rifle/mpi_km/plum(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/plum(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/plum(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/plum(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/plum(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/plum(src)

/obj/item/storage/belt/marine/som/mpi_black/PopulateContents()
	new /obj/item/ammo_magazine/rifle/mpi_km/black(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/black(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/black(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/black(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/black(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/black(src)

/obj/item/storage/belt/marine/som/carbine/PopulateContents()
	new /obj/item/ammo_magazine/rifle/mpi_km/carbine(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/carbine(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/carbine(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/carbine(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/carbine(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/carbine(src)

/obj/item/storage/belt/marine/som/carbine_black/PopulateContents()
	new /obj/item/ammo_magazine/rifle/mpi_km/carbine/black(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/carbine/black(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/carbine/black(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/carbine/black(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/carbine/black(src)
	new /obj/item/ammo_magazine/rifle/mpi_km/carbine/black(src)

/obj/item/storage/belt/marine/icc
	name = "\improper 120发弹链"
	desc = "一条专为携带弹药设计的腰带，采用棕褐色合成纤维制成。"
	icon_state = "icc_belt"

/obj/item/storage/belt/marine/sectoid
	name = "\improper 奇怪的弹药带"
	desc = "一条由坚固但特殊面料制成的腰带，带有用于固定装备的夹扣。"
	icon_state = "swatbelt"
	worn_icon_state = "swatbelt"
	storage_type = /datum/storage/belt/marine/sectoid

/obj/item/storage/belt/shotgun
	name = "\improper 霰弹枪弹壳装载带"
	desc = "一种设计用于容纳霰弹枪弹壳或单发弹道子弹的弹药带。"
	icon_state = "shotgunbelt"
	worn_icon_state = "shotgunbelt"
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/belt/shotgun

/obj/item/storage/belt/shotgun/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ammo_magazine))
		var/obj/item/ammo_magazine/M = I
		if(CHECK_BITFIELD(M.magazine_flags, MAGAZINE_HANDFUL))
			return ..()
		if(M.magazine_flags & MAGAZINE_REFILLABLE)
			if(!M.current_rounds)
				to_chat(user, span_warning("[M] 为空。"))
				return

			if(length(contents) >= storage_datum.storage_slots)
				to_chat(user, span_warning("[src]已满。"))
				return


			to_chat(user, span_notice("你开始用[M]重新装填[src]。"))
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

/obj/item/storage/belt/shotgun/flechette/Initialize(mapload, ...)
	. = ..()
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)

/obj/item/storage/belt/shotgun/mixed/Initialize(mapload, ...)
	. = ..()
	new /obj/item/ammo_magazine/handful/buckshot(src)
	new /obj/item/ammo_magazine/handful/buckshot(src)
	new /obj/item/ammo_magazine/handful/buckshot(src)
	new /obj/item/ammo_magazine/handful/buckshot(src)
	new /obj/item/ammo_magazine/handful/buckshot(src)
	new /obj/item/ammo_magazine/handful/buckshot(src)
	new /obj/item/ammo_magazine/handful/buckshot(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)

/obj/item/storage/belt/shotgun/som
	desc = "专为容纳霰弹枪弹或单发弹道弹药设计的弹药带。采用传统的火星之子皮革制成。"
	icon_state = "shotgunbelt_som"

/obj/item/storage/belt/shotgun/som/flechette/Initialize(mapload, ...)
	. = ..()
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)

/obj/item/storage/belt/shotgun/som/mixed/Initialize(mapload, ...)
	. = ..()
	new /obj/item/ammo_magazine/handful/buckshot(src)
	new /obj/item/ammo_magazine/handful/buckshot(src)
	new /obj/item/ammo_magazine/handful/buckshot(src)
	new /obj/item/ammo_magazine/handful/buckshot(src)
	new /obj/item/ammo_magazine/handful/buckshot(src)
	new /obj/item/ammo_magazine/handful/buckshot(src)
	new /obj/item/ammo_magazine/handful/buckshot(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)

/obj/item/storage/belt/shotgun/icc
	name = "\improper 莫德尔/121型 霰弹装弹带"
	desc = "一条设计用于容纳霰弹枪弹或单发弹道的弹药带，采用合成棕褐色纤维制成。"
	icon_state = "shotgunbelt_icc"

/obj/item/storage/belt/shotgun/icc/flechette/Initialize(mapload, ...)
	. = ..()
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)
	new /obj/item/ammo_magazine/handful/flechette(src)

/obj/item/storage/belt/shotgun/icc/mixed/Initialize(mapload, ...)
	. = ..()
	new /obj/item/ammo_magazine/handful/heavy_buckshot(src)
	new /obj/item/ammo_magazine/handful/heavy_buckshot(src)
	new /obj/item/ammo_magazine/handful/heavy_buckshot(src)
	new /obj/item/ammo_magazine/handful/heavy_buckshot(src)
	new /obj/item/ammo_magazine/handful/heavy_buckshot(src)
	new /obj/item/ammo_magazine/handful/heavy_buckshot(src)
	new /obj/item/ammo_magazine/handful/heavy_buckshot(src)
	new /obj/item/ammo_magazine/handful/barrikada(src)
	new /obj/item/ammo_magazine/handful/barrikada(src)
	new /obj/item/ammo_magazine/handful/barrikada(src)
	new /obj/item/ammo_magazine/handful/barrikada(src)
	new /obj/item/ammo_magazine/handful/barrikada(src)
	new /obj/item/ammo_magazine/handful/barrikada(src)
	new /obj/item/ammo_magazine/handful/barrikada(src)

/obj/item/storage/belt/shotgun/martini
	name = "马提尼-亨利弹药带"
	desc = "一条足以容纳你所有 .577/400 球形弹的腰带。"
	icon_state = "martini_belt"
	atom_flags = DIRLOCK
	storage_type = /datum/storage/belt/shotgun/martini

/obj/item/storage/belt/shotgun/martini/Initialize(mapload, ...)
	. = ..()
	update_icon()

/obj/item/storage/belt/shotgun/martini/attackby(obj/item/I, mob/user, params)
	if(!istype(I, /obj/item/ammo_magazine))
		update_icon()
		return ..()

	var/obj/item/ammo_magazine/new_mag = I
	if(new_mag.caliber != CALIBER_557)
		to_chat(user, span_notice("[src]只能装填.557/440步枪弹。"))
		return

	return ..()

/obj/item/storage/belt/shotgun/martini/attack_hand(mob/living/user)
	if(!ishuman(user))
		return

	if(loc != user)
		. = ..()
		for(var/mob/watcher_mobs in storage_datum.content_watchers)
			storage_datum.close(watcher_mobs)

	if(!length(contents))
		storage_datum.open(user) //Empty belt? Open the inventory

	if(!storage_datum.draw_mode)
		return ..() //No draw mode so we just click like normal

	var/obj/item/I = contents[length(contents)]
	if(!istype(I, /obj/item/ammo_magazine/handful))
		return

	var/obj/item/ammo_magazine/handful/existing_handful = I

	if(existing_handful.current_rounds == 1)
		user.put_in_hands(existing_handful)
		return

	existing_handful.create_handful(user, 1)
	update_icon()

/obj/item/storage/belt/shotgun/martini/full/Initialize(mapload, ...)
	. = ..()
	new /obj/item/ammo_magazine/handful/martini(src)
	new /obj/item/ammo_magazine/handful/martini(src)
	new /obj/item/ammo_magazine/handful/martini(src)
	new /obj/item/ammo_magazine/handful/martini(src)
	new /obj/item/ammo_magazine/handful/martini(src)
	new /obj/item/ammo_magazine/handful/martini(src)
	new /obj/item/ammo_magazine/handful/martini(src)
	new /obj/item/ammo_magazine/handful/martini(src)
	new /obj/item/ammo_magazine/handful/martini(src)
	new /obj/item/ammo_magazine/handful/martini(src)
	new /obj/item/ammo_magazine/handful/martini(src)
	new /obj/item/ammo_magazine/handful/martini(src)

/obj/item/storage/belt/knifepouch
	name="\improper M276型刀套"
	desc="M276是地球政府殖民地海军陆战队的标准承载装备。它由一个带有各种夹扣的模块化腰带组成。此版本专门设计有六个枪套，用于存放飞刀。不常配发，但仍在服役。"
	icon_state="knifebelt"
	worn_icon_state="knifebelt"
	storage_type = /datum/storage/belt/knifepouch

/obj/item/storage/belt/knifepouch/PopulateContents()
	new /obj/item/stack/throwing_knife(src)
	new /obj/item/stack/throwing_knife(src)
	new /obj/item/stack/throwing_knife(src)
	new /obj/item/stack/throwing_knife(src)
	new /obj/item/stack/throwing_knife(src)
	new /obj/item/stack/throwing_knife(src)

/obj/item/storage/belt/grenade
	name="\improper M276型M40高爆双用途弹携行具"
	desc="M276是TGMC的标准负重装备。它由一个带有多个夹扣的模块化腰带组成。此版本设计用于携带大量M40 HEDP手雷。"
	icon_state="grenadebelt"
	worn_icon_state="grenadebelt"
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/belt/grenade

/obj/item/storage/belt/grenade/standard/PopulateContents()
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade(src)

/obj/item/storage/belt/grenade/som
	name = "\improper S16型手雷携行具"
	desc = "一种简单的携行系统，有多种配置可选。此版本专为携带大量手雷而设计。"
	icon_state = "grenadebelt_som"

/obj/item/storage/belt/grenade/som/standard/PopulateContents()
	new /obj/item/explosive/grenade/incendiary/som(src)
	new /obj/item/explosive/grenade/incendiary/som(src)
	new /obj/item/explosive/grenade/som(src)
	new /obj/item/explosive/grenade/som(src)
	new /obj/item/explosive/grenade/som(src)
	new /obj/item/explosive/grenade/som(src)
	new /obj/item/explosive/grenade/som(src)
	new /obj/item/explosive/grenade/som(src)

/obj/item/storage/belt/grenade/b17
	name = "\improper M276型M40高爆双用途榴弹携行具Mk II型"
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/belt/grenade/b17

/obj/item/storage/belt/grenade/b17/PopulateContents()
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade(src)
	new /obj/item/explosive/grenade(src)

/obj/item/storage/belt/sparepouch
	name = "\improper G8通用附包"
	desc = "一个小型轻量附包，可固定在阿玛特系统M3型护甲或腰带上，为杂项装备或盒式与弹鼓弹匣提供额外存储空间。"
	w_class = WEIGHT_CLASS_BULKY
	icon_state = "sparepouch"
	worn_icon_state = "sparepouch"
	storage_type = /datum/storage/belt/sparepouch

/obj/item/storage/belt/sparepouch/som
	name = "标准通用附包"
	desc = "一个轻便小巧的附包，可固定在护甲或腰带上，为杂物或弹匣/弹鼓提供额外存储空间。采用正宗火星之子皮革制成。"
	icon_state = "sparepouch_som"
	worn_icon_state = "som_belt"

/obj/item/storage/belt/protein_pack
	name = "\improper 蛋白质包装载装置"
	desc = "专为那些特别饥饿的陆战队员设计的存储腰带，可容纳大量蛋白质包。"
	icon_state = "p_belt"
	worn_icon_state = "shotgunbelt"
	storage_type = /datum/storage/belt/protein_pack

/obj/item/storage/belt/protein_pack/PopulateContents()
	for(var/i in 1 to storage_datum.storage_slots)
		new /obj/item/reagent_containers/food/snacks/protein_pack(src)
