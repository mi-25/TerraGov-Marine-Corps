/*!
 * Contains holster subtype, which is a form of storage with a snowflake item we are particularly interested in
 */

// HEY, if you have some time to kill, consider moving all this snowflake stuff from holsters to be purely handled by /datum/storage

///Parent item for all holster type storage items
/obj/item/storage/holster
	name = "枪套"
	desc = "用来装东西，有时还能嗖嗖作响。"
	icon = 'icons/obj/items/storage/holster.dmi'
	w_class = WEIGHT_CLASS_BULKY
	equip_slot_flags = ITEM_SLOT_BACK
	storage_type = /datum/storage/holster
	///the sound produced when the special item is drawn
	var/draw_sound = 'sound/weapons/guns/misc/rifle_draw.ogg'
	///the sound produced when the special item is sheathed
	var/sheathe_sound = 'sound/weapons/guns/misc/rifle_draw.ogg'
	///the snowflake item(s) that will update the sprite.
	var/list/holsterable_allowed = list()
	///records the specific special item currently in the holster
	var/obj/holstered_item = null
	///Image that get's underlayed under the sprite of the holster
	var/image/holstered_item_underlay

/obj/item/storage/holster/Initialize(mapload, ...)
	. = ..()
	storage_datum.draw_sound = src.draw_sound
	storage_datum.sheathe_sound = src.sheathe_sound
	storage_datum.holsterable_allowed = src.holsterable_allowed
	storage_datum.holstered_item = src.holstered_item
	storage_datum.holstered_item_underlay = src.holstered_item_underlay

/obj/item/storage/holster/equipped(mob/user, slot)
	if (slot == SLOT_BACK || slot == SLOT_BELT || slot == SLOT_S_STORE || slot == SLOT_L_STORE || slot == SLOT_R_STORE )	//add more if needed
		mouse_opacity = MOUSE_OPACITY_OPAQUE //so it's easier to click when properly equipped.
	return ..()

/obj/item/storage/holster/dropped(mob/user)
	mouse_opacity = initial(mouse_opacity)
	return ..()

/obj/item/storage/holster/Destroy()
	if(holstered_item_underlay)
		QDEL_NULL(holstered_item_underlay)
	if(holstered_item)
		QDEL_NULL(holstered_item)
	return ..()

/obj/item/storage/holster/update_icon_state()
	. = ..()
	if(holstered_item)
		icon_state = initial(icon_state) + "_full"
	else
		icon_state = initial(icon_state)
	worn_icon_state = icon_state

/obj/item/storage/holster/update_icon()
	. = ..()
	if(item_flags & HAS_UNDERLAY)
		update_underlays()
	var/mob/user = loc
	if(!istype(user))
		return
	user.update_inv_back()
	user.update_inv_belt()
	user.update_inv_s_store()

///Adds or removes underlay sprites, checks holstered_item to see which underlay to add
/obj/item/storage/holster/proc/update_underlays()
	if(holstered_item && !holstered_item_underlay)
		holstered_item_underlay = image(icon, src, holstered_item.icon_state)
		underlays += holstered_item_underlay
	else if(!holstered_item) //Only delete the underlay once our actual holstered item is gone
		underlays -= holstered_item_underlay
		QDEL_NULL(holstered_item_underlay)

/obj/item/storage/holster/do_quick_equip(mob/user) //Will only draw the specific holstered item, not ammo etc.
	if(!holstered_item)
		return FALSE
	var/obj/item/W = holstered_item
	if(!storage_datum.remove_from_storage(W, null, user))
		return FALSE
	return W

/obj/item/storage/holster/vendor_equip(mob/user)
	. = ..()
	return user.equip_to_appropriate_slot(src)

//backpack type holster items
/obj/item/storage/holster/backholster
	name = "背包枪套"
	desc = "你把它背在背上，然后把物品放进去。通常还能放一件特殊物品。"
	icon = 'icons/obj/items/storage/backholster.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/backpacks_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/backpacks_right.dmi',
	)
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		)
	storage_type = /datum/storage/holster/backholster

//only applies on storage of all items, not withdrawal
/obj/item/storage/holster/backholster/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(storage_datum.use_sound)
		playsound(loc, storage_datum.use_sound, 15, 1, 6)

/obj/item/storage/holster/backholster/equipped(mob/user, slot)
	if (slot == SLOT_BACK)
		mouse_opacity = MOUSE_OPACITY_OPAQUE //so it's easier to click when properly equipped.
		if(storage_datum.use_sound)
			playsound(loc, storage_datum.use_sound, 15, 1, 6)
	return ..()

///RR bag
/obj/item/storage/holster/backholster/rpg
	name = "\improper 地球政府殖民地海军陆战队火箭包"
	desc = "这个背包除了能装无后坐力炮外，还能容纳4枚67毫米炮弹。"
	icon_state = "marine_rocket"
	w_class = WEIGHT_CLASS_HUGE
	storage_type = /datum/storage/holster/backholster/rpg
	holsterable_allowed = list(
		/obj/item/weapon/gun/launcher/rocket/recoillessrifle,
		/obj/item/weapon/gun/launcher/rocket/recoillessrifle/low_impact,
	)
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		)

/obj/item/storage/holster/backholster/rpg/full/PopulateContents()
	new /obj/item/ammo_magazine/rocket/recoilless/light(src)
	new /obj/item/ammo_magazine/rocket/recoilless/light(src)
	new /obj/item/ammo_magazine/rocket/recoilless(src)
	new /obj/item/ammo_magazine/rocket/recoilless(src)
	new /obj/item/weapon/gun/launcher/rocket/recoillessrifle(src)

/obj/item/storage/holster/backholster/rpg/low_impact/PopulateContents()
	new /obj/item/ammo_magazine/rocket/recoilless/low_impact(src)
	new /obj/item/ammo_magazine/rocket/recoilless/low_impact(src)
	new /obj/item/ammo_magazine/rocket/recoilless/low_impact(src)
	new /obj/item/ammo_magazine/rocket/recoilless/low_impact(src)
	new /obj/item/weapon/gun/launcher/rocket/recoillessrifle/low_impact(src)

/obj/item/storage/holster/backholster/rpg/heam/PopulateContents()
	new /obj/item/ammo_magazine/rocket/recoilless/heam(src)
	new /obj/item/ammo_magazine/rocket/recoilless/heam(src)
	new /obj/item/ammo_magazine/rocket/recoilless/heam(src)
	new /obj/item/ammo_magazine/rocket/recoilless/heam(src)
	new /obj/item/weapon/gun/launcher/rocket/recoillessrifle/heam(src)

/obj/item/storage/holster/backholster/rpg/freelancer
	name = "\improper 自由佣兵火箭背包"
	desc = "这个背包可以容纳6发67毫米炮弹，外加一门无后坐力炮。"
	icon_state = "freelancer_rocket"
	storage_type = /datum/storage/holster/backholster/rpg/freelancer

/obj/item/storage/holster/backholster/rpg/freelancer/full/PopulateContents()
	new /obj/item/ammo_magazine/rocket/recoilless/light(src)
	new /obj/item/ammo_magazine/rocket/recoilless/light(src)
	new /obj/item/ammo_magazine/rocket/recoilless/light(src)
	new /obj/item/ammo_magazine/rocket/recoilless(src)
	new /obj/item/ammo_magazine/rocket/recoilless(src)
	new /obj/item/ammo_magazine/rocket/recoilless(src)
	new /obj/item/weapon/gun/launcher/rocket/recoillessrifle(src)

/obj/item/storage/holster/backholster/rpg/som
	name = "\improper 火星之子火箭发射器背包"
	desc = "这个背包除了能装下一具火箭发射器外，还能容纳4枚火箭弹。"
	icon_state = "som_rocket"
	holsterable_allowed = list(
		/obj/item/weapon/gun/launcher/rocket/som,
		/obj/item/weapon/gun/launcher/rocket/som/rad,
	)
	storage_type = /datum/storage/holster/backholster/rpg/som

/obj/item/storage/holster/backholster/rpg/som/war_crimes/PopulateContents()
	new /obj/item/ammo_magazine/rocket/som/incendiary(src)
	new /obj/item/ammo_magazine/rocket/som/incendiary(src)
	new /obj/item/ammo_magazine/rocket/som/rad(src)
	new /obj/item/ammo_magazine/rocket/som/rad(src)
	new /obj/item/weapon/gun/launcher/rocket/som/rad(src)

/obj/item/storage/holster/backholster/rpg/som/ert/PopulateContents()
	new /obj/item/ammo_magazine/rocket/som/thermobaric(src)
	new /obj/item/ammo_magazine/rocket/som/thermobaric(src)
	new /obj/item/ammo_magazine/rocket/som/heat(src)
	new /obj/item/ammo_magazine/rocket/som/rad(src)
	new /obj/item/weapon/gun/launcher/rocket/som/rad(src)

/obj/item/storage/holster/backholster/rpg/som/heat/PopulateContents()
	new /obj/item/ammo_magazine/rocket/som/heat(src)
	new /obj/item/ammo_magazine/rocket/som/heat(src)
	new /obj/item/ammo_magazine/rocket/som/heat(src)
	new /obj/item/ammo_magazine/rocket/som/heat(src)
	new /obj/item/weapon/gun/launcher/rocket/som/heat(src)

/obj/item/storage/holster/backholster/mortar
	name = "\improper 地球政府殖民地海军陆战队迫击炮包"
	desc = "这个背包除了能装下迫击炮本身外，还能容纳11枚80毫米迫击炮弹。"
	icon_state = "marinepackt"
	w_class = WEIGHT_CLASS_BULKY
	holsterable_allowed = list(/obj/item/mortar_kit)
	storage_type = /datum/storage/holster/backholster/mortar

	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		)

/obj/item/storage/holster/backholster/mortar/full/PopulateContents()
	new /obj/item/mortar_kit(src)

/obj/item/storage/holster/backholster/flamer
	name = "\improper TGMC 喷火器背包"
	desc = "这个背包可以容纳其配套的喷火器，并提供适度的通用存储容量。会自动为其配套的喷火器补充燃料。"
	icon_state = "pyro_bag"
	w_class = WEIGHT_CLASS_BULKY
	holsterable_allowed = list(/obj/item/weapon/gun/flamer/big_flamer/marinestandard/engineer)
	storage_type = /datum/storage/holster/backholster/flamer
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		)
	///The type of fuel this carries
	var/fuel_type = DEFAULT_FUEL_TYPE

/obj/item/storage/holster/backholster/flamer/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/fuel_storage, 280, fuel_type)
	update_appearance(UPDATE_ICON)

/obj/item/storage/holster/backholster/flamer/full/PopulateContents()
	new /obj/item/weapon/gun/flamer/big_flamer/marinestandard/engineer(src)

//one slot holsters

///swords
/obj/item/storage/holster/blade
	///used only for storage path purposes
	name = "\improper 默认枪套"
	desc = "你不应该看到这个。"

/obj/item/storage/holster/blade/machete
	name = "\improper H5型M2132砍刀刀鞘"
	desc = "一个用于携带M2132砍刀的大型皮质刀鞘。可固定在背部、腰部或护甲上。"
	icon_state = "machete_holster"
	equip_slot_flags = ITEM_SLOT_BELT|ITEM_SLOT_BACK
	holsterable_allowed = list(
		/obj/item/weapon/sword/machete,
		/obj/item/weapon/sword/harvester,
	)

/obj/item/storage/holster/blade/machete/Initialize(mapload)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/weapon/sword/machete,
		/obj/item/weapon/sword/harvester,
	))

/obj/item/storage/holster/blade/machete/full/PopulateContents()
	new /obj/item/weapon/sword/machete(src)

/obj/item/storage/holster/blade/machete/full_alt/PopulateContents()
	new /obj/item/weapon/sword/machete/alt(src)

/obj/item/storage/holster/blade/machete/full_harvester
	name = "H5型M2132收割者刀鞘"

/obj/item/storage/holster/blade/machete/full_harvester/PopulateContents()
	new /obj/item/weapon/sword/harvester(src)

/obj/item/storage/holster/blade/katana
	name = "\improper 武士刀刀鞘"
	desc = "一个色彩鲜艳的大型武士刀鞘，用于携带日本刀。可以固定在背部、腰部或护甲上。由于刀鞘坚固的木制外壳，在紧急情况下也可作为凑合的防御武器。"
	icon_state = "katana_holster"
	force = 12
	attack_verb = list("bludgeons", "strikes", "cracks")
	equip_slot_flags = ITEM_SLOT_BELT|ITEM_SLOT_BACK
	holsterable_allowed = list(/obj/item/weapon/sword/katana)

/obj/item/storage/holster/blade/katana/full/Initialize(mapload)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(/obj/item/weapon/sword/katana))

/obj/item/storage/holster/blade/katana/full/PopulateContents()
	new /obj/item/weapon/sword/katana(src)

/obj/item/storage/holster/blade/officer
	name = "\improper 军官佩剑剑鞘"
	desc = "一个用于携带剑的大型皮革剑鞘。看起来是复制品，而非原品。可系在腰间或装甲上。"
	icon_state = "officer_sheath"
	equip_slot_flags = ITEM_SLOT_BELT
	holsterable_allowed = list(/obj/item/weapon/sword/officersword)

/obj/item/storage/holster/blade/officer/full/Initialize(mapload)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(/obj/item/weapon/sword/officersword))

/obj/item/storage/holster/blade/officer/full/PopulateContents()
	new /obj/item/weapon/sword/officersword(src)

//guns

/obj/item/storage/holster/m37
	name = "\improper L44霰弹枪枪套"
	desc = "一个大型皮制枪套，可容纳任何霰弹枪。内含背带系统，可固定在背部以便于存放。"
	icon_state = "m37_holster"
	holsterable_allowed = list(
		/obj/item/weapon/gun/shotgun/combat,
		/obj/item/weapon/gun/shotgun/pump,
	)

/obj/item/storage/holster/m37/full/Initialize(mapload)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/weapon/gun/shotgun/combat,
		/obj/item/weapon/gun/shotgun/pump,
	))

/obj/item/storage/holster/m37/full/PopulateContents()
	new /obj/item/weapon/gun/shotgun/pump(src)

/obj/item/storage/holster/t35
	name = "\improper L44 SH-35 刀鞘"
	desc = "一个大型皮制枪套，可容纳SH-35霰弹枪。它包含背带，可将其固定在背部以便于存放。"
	icon_state = "t35_holster"
	holsterable_allowed = list(/obj/item/weapon/gun/shotgun/pump/t35)

/obj/item/storage/holster/t35/full/Initialize(mapload)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/weapon/gun/shotgun/pump/t35,
	))

/obj/item/storage/holster/t35/full/PopulateContents()
	new /obj/item/weapon/gun/shotgun/pump/t35(src)

/obj/item/storage/holster/m25
	name = "\improper M276型M25手枪套携行具"
	desc = "M276是地球政府殖民地海军陆战队的标准负重装备。它由一个带有各种夹扣的模块化腰带组成。此版本专为M25冲锋枪设计，并采用更大的框架以支撑该枪。由于其非正统的设计，它并不常见，仅为特殊配发。"
	icon_state = "m25_holster"
	equip_slot_flags = ITEM_SLOT_BELT
	holsterable_allowed = list(
		/obj/item/weapon/gun/smg/m25,
		/obj/item/weapon/gun/smg/m25/holstered,
	)

/obj/item/storage/holster/m25/Initialize(mapload)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(/obj/item/weapon/gun/smg/m25))

/obj/item/storage/holster/m25/full/PopulateContents()
	new /obj/item/weapon/gun/smg/m25(src)

/obj/item/storage/holster/t19
	name = "\improper M276型MP-19手枪套携行具"
	desc = "M276是TGMC的标准携行装备。它由一个模块化腰带和各种夹扣组成。此版本专为MP-19冲锋枪设计，采用更大的框架以支撑该枪。由于其非正统的设计，它并不常见，仅作为特殊配发。"
	icon_state = "t19_holster"
	equip_slot_flags = ITEM_SLOT_BELT
	holsterable_allowed = list(
		/obj/item/weapon/gun/smg/standard_machinepistol,
		/obj/item/weapon/gun/smg/standard_machinepistol/compact,
		/obj/item/weapon/gun/smg/standard_machinepistol/vgrip,
	)
	storage_type = /datum/storage/holster/t19

/obj/item/storage/holster/t19/full/PopulateContents()
	new /obj/item/weapon/gun/smg/standard_machinepistol(src)

/obj/item/storage/holster/flarepouch
	name = "照明弹附包"
	desc = "专为存放照明弹和一把信号枪设计的附包。可使用M94照明弹包补充。"
	equip_slot_flags = ITEM_SLOT_POCKET
	icon = 'icons/obj/clothing/pouches.dmi'
	icon_state = "flare"
	holsterable_allowed = list(/obj/item/weapon/gun/grenade_launcher/single_shot/flare/marine)
	storage_type = /datum/storage/holster/flarepouch

/obj/item/storage/holster/flarepouch/attackby_alternate(obj/item/I, mob/user, params)
	if(!istype(I, /obj/item/weapon/gun/grenade_launcher/single_shot/flare))
		return ..()
	var/obj/item/weapon/gun/grenade_launcher/single_shot/flare/flare_gun = I
	if(flare_gun.in_chamber)
		return
	for(var/obj/item/flare in contents)
		storage_datum.remove_from_storage(flare, get_turf(user), user)
		user.put_in_any_hand_if_possible(flare)
		flare_gun.reload(flare, user)
		return

/obj/item/storage/holster/flarepouch/full/PopulateContents()
	var/obj/item/flare_gun = new /obj/item/weapon/gun/grenade_launcher/single_shot/flare/marine(src)
	for(var/i in 1 to (storage_datum.storage_slots - flare_gun.w_class))
		new /obj/item/explosive/grenade/flare(src)


/obj/item/storage/holster/icc_mg
	name = "\improper ML-41 刀鞘（10x26mm）"
	desc = "一个背包式枪套，可容纳任何ML-41突击机枪，并为系统的另一部分携带弹药。"
	icon_state = "icc_bagmg"
	icon = 'icons/obj/items/storage/backholster.dmi'
	holsterable_allowed = list(
		/obj/item/weapon/gun/rifle/icc_mg,
	)
	storage_type = /datum/storage/holster/icc_mg

/obj/item/storage/holster/icc_mg/full/PopulateContents()
	new /obj/item/weapon/gun/rifle/icc_mg(src)
	new /obj/item/ammo_magazine/icc_mg/packet(src)
	new /obj/item/ammo_magazine/icc_mg/packet(src)
	new /obj/item/ammo_magazine/icc_mg/packet(src)
	new /obj/item/ammo_magazine/icc_mg/packet(src)

////////////////////////////// GUN BELTS /////////////////////////////////////

/obj/item/storage/holster/belt
	name = "手枪腰带"
	desc = "一种腰带式枪套组件，可容纳一把手枪和两个弹匣。"
	icon_state = "m4a3_holster"
	equip_slot_flags = ITEM_SLOT_BELT
	item_flags = HAS_UNDERLAY
	storage_type = /datum/storage/holster/belt
	sheathe_sound = 'sound/weapons/guns/misc/pistol_sheathe.ogg'
	draw_sound = 'sound/weapons/guns/misc/pistol_draw.ogg'
	holsterable_allowed = list(
		/obj/item/weapon/gun,
	) //Any pistol you add to a holster should update the sprite. Ammo/Magazines dont update any sprites

//This deliniates between belt/gun/pistol and belt/gun/revolver
/obj/item/storage/holster/belt/pistol
	name = "通用手枪腰带"
	desc = "一条非左轮手枪的手枪腰带"

/obj/item/storage/holster/belt/pistol/Initialize(mapload, ...)
	. = ..()
	AddComponent(/datum/component/tac_reload_storage)

/obj/item/storage/holster/belt/pistol/m4a3
	name = "\improper M4A3手枪套携行具"
	desc = "M4A3是一种常见的枪套腰带。它由一条带有各种夹扣的模块化腰带组成。此版本带有一个枪套组件，可以携带手枪。它还包含侧附包，可以存放9毫米或.45口径弹匣。"

/obj/item/storage/holster/belt/pistol/m4a3/full/PopulateContents()
	new /obj/item/weapon/gun/pistol/rt3(src)
	new /obj/item/ammo_magazine/pistol/ap(src)
	new /obj/item/ammo_magazine/pistol/hp(src)
	new /obj/item/ammo_magazine/pistol/extended(src)
	new /obj/item/ammo_magazine/pistol/extended(src)
	new /obj/item/ammo_magazine/pistol/extended(src)
	new /obj/item/ammo_magazine/pistol/extended(src)

/obj/item/storage/holster/belt/pistol/m4a3/officer/PopulateContents()
	new /obj/item/weapon/gun/pistol/rt3(src)
	new /obj/item/ammo_magazine/pistol/hp(src)
	new /obj/item/ammo_magazine/pistol/hp(src)
	new /obj/item/ammo_magazine/pistol/ap(src)
	new /obj/item/ammo_magazine/pistol/ap(src)
	new /obj/item/ammo_magazine/pistol/ap(src)
	new /obj/item/ammo_magazine/pistol/ap(src)

/obj/item/storage/holster/belt/pistol/m4a3/fieldcommander/PopulateContents()
	new /obj/item/weapon/gun/pistol/m1911/custom(src)
	new /obj/item/ammo_magazine/pistol/m1911(src)
	new /obj/item/ammo_magazine/pistol/m1911(src)
	new /obj/item/ammo_magazine/pistol/m1911(src)
	new /obj/item/ammo_magazine/pistol/m1911(src)
	new /obj/item/ammo_magazine/pistol/m1911(src)
	new /obj/item/ammo_magazine/pistol/m1911(src)

/obj/item/storage/holster/belt/pistol/m4a3/vp70/PopulateContents()
	new /obj/item/weapon/gun/pistol/vp70(src)
	new /obj/item/ammo_magazine/pistol/vp70(src)
	new /obj/item/ammo_magazine/pistol/vp70(src)
	new /obj/item/ammo_magazine/pistol/vp70(src)
	new /obj/item/ammo_magazine/pistol/vp70(src)
	new /obj/item/ammo_magazine/pistol/vp70(src)
	new /obj/item/ammo_magazine/pistol/vp70(src)

/obj/item/storage/holster/belt/pistol/m4a3/vp70_pmc/PopulateContents()
	new /obj/item/weapon/gun/pistol/vp70/tactical(src)
	new /obj/item/ammo_magazine/pistol/vp70(src)
	new /obj/item/ammo_magazine/pistol/vp70(src)
	new /obj/item/ammo_magazine/pistol/vp70(src)
	new /obj/item/ammo_magazine/pistol/vp70(src)
	new /obj/item/ammo_magazine/pistol/vp70(src)
	new /obj/item/ammo_magazine/pistol/vp70(src)

/obj/item/storage/holster/belt/pistol/m4a3/vp78/PopulateContents()
	new /obj/item/weapon/gun/pistol/vp78(src)
	new /obj/item/ammo_magazine/pistol/vp78(src)
	new /obj/item/ammo_magazine/pistol/vp78(src)
	new /obj/item/ammo_magazine/pistol/vp78(src)
	new /obj/item/ammo_magazine/pistol/vp78(src)
	new /obj/item/ammo_magazine/pistol/vp78(src)
	new /obj/item/ammo_magazine/pistol/vp78(src)

/obj/item/storage/holster/belt/pistol/m4a3/som
	name = "\improper S19枪套携行具"
	desc = "一条可追溯至旧殖民地安保枪套装备的腰带。"
	icon_state = "som_belt_pistol"

/obj/item/storage/holster/belt/pistol/m4a3/som/Initialize(mapload, ...)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/weapon/gun/pistol,
		/obj/item/ammo_magazine/pistol,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_pistol,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta,
		/obj/item/cell/lasgun/lasrifle,
		/obj/item/cell/lasgun/volkite/small,
		/obj/item/cell/lasgun/plasma,
	))

/obj/item/storage/holster/belt/pistol/m4a3/som/serpenta/PopulateContents()
	new /obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta(src)
	new /obj/item/cell/lasgun/volkite/small(src)
	new /obj/item/cell/lasgun/volkite/small(src)
	new /obj/item/cell/lasgun/volkite/small(src)
	new /obj/item/cell/lasgun/volkite/small(src)
	new /obj/item/cell/lasgun/volkite/small(src)
	new /obj/item/cell/lasgun/volkite/small(src)

/obj/item/storage/holster/belt/pistol/m4a3/som/fancy
	name = "\improper S19-B 枪套携行具"
	desc = "一款质量上乘的手枪腰带，采用火星之子军官常见的款式。看起来有些年头，但保养得很好。"
	icon_state = "som_belt_pistol_fancy"

/obj/item/storage/holster/belt/pistol/m4a3/som/fancy/fieldcommander/PopulateContents()
	new /obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta/custom(src)
	new /obj/item/cell/lasgun/volkite/small(src)
	new /obj/item/cell/lasgun/volkite/small(src)
	new /obj/item/cell/lasgun/volkite/small(src)
	new /obj/item/cell/lasgun/volkite/small(src)
	new /obj/item/cell/lasgun/volkite/small(src)
	new /obj/item/cell/lasgun/volkite/small(src)

/obj/item/storage/holster/belt/pistol/stand
	name = "\improper M276型M4A3手枪套携行具"
	desc = "M276是TGMC的标准负重装备。它由一条模块化腰带和各种夹扣组成。这个版本配备了一个枪套组件，可以舒适安全地携带M4A3手枪。它还包含侧附包，可以存放9毫米或.45口径弹匣。"

/obj/item/storage/holster/belt/pistol/standard_pistol
	name = "\improper T457型手枪携行具"
	desc = "T457是地球政府殖民地海军陆战队的标准承载装备。它由一个带有多个附包的模块化腰带组成。"
	icon_state = "tp14_holster"

/obj/item/storage/holster/belt/revolver/standard_revolver
	name = "\improper T457型转轮手枪携行套组"
	desc = "T457是地球政府殖民地海军陆战队的标准承载装备。它由一个带有多个附包的模块化腰带组成。"
	icon_state = "tp44_holster"

/obj/item/storage/holster/belt/revolver/standard_revolver/Initialize(mapload, ...)
	. = ..()
	storage_datum.storage_type_limits = list(
		/obj/item/weapon/gun/revolver,
	)
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/weapon/gun/revolver,
		/obj/item/ammo_magazine/revolver,
	))

/obj/item/storage/holster/belt/m44
	name = "\improper M276型M44手枪套携行具"
	desc = "M276是TGMC的标准负重装备。它由一条模块化腰带和各种夹扣组成。此版本适用于M44马格南左轮手枪，并配有三个用于快速装弹器的附包。"
	icon_state = "m44_holster"
	storage_type = /datum/storage/holster/belt/m44

/obj/item/storage/holster/belt/m44/full/PopulateContents()
	new /obj/item/weapon/gun/revolver/single_action/m44(src)
	new /obj/item/ammo_magazine/revolver/heavy(src)
	new /obj/item/ammo_magazine/revolver/marksman(src)
	new /obj/item/ammo_magazine/revolver/single_action/m44(src)
	new /obj/item/ammo_magazine/revolver/single_action/m44(src)
	new /obj/item/ammo_magazine/revolver/single_action/m44(src)
	new /obj/item/ammo_magazine/revolver/single_action/m44(src)

/obj/item/storage/holster/belt/mateba
	name = "\improper M276型马特巴手枪套携行具"
	desc = "M276是TGMC的标准负重装备。它由一条模块化腰带和各种夹扣组成。此版本适用于强大的马特巴马格南左轮手枪，并配有可容纳三个快速装弹器的附包。"
	icon_state = "mateba_holster"
	storage_type = /datum/storage/holster/belt/mateba

/obj/item/storage/holster/belt/mateba/full/PopulateContents()
	new /obj/item/weapon/gun/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)

/obj/item/storage/holster/belt/mateba/officer
	icon_state = "c_mateba_holster"

/obj/item/storage/holster/belt/mateba/officer/full/PopulateContents()
	new /obj/item/weapon/gun/revolver/mateba/custom(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)

/obj/item/storage/holster/belt/mateba/notmarine/Initialize(mapload)
	. = ..()
	icon_state = "a_mateba_holster"

/obj/item/storage/holster/belt/mateba/notmarine/PopulateContents()
	new /obj/item/weapon/gun/revolver/mateba/(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)
	new /obj/item/ammo_magazine/revolver/mateba(src)

/obj/item/storage/holster/belt/korovin
	name = "\improper 41式手枪携行具"
	desc = "这是标准UPP附包携行具的改进型号，用于携带一把科罗温PK-9手枪。它还包含侧袋，可存放.22口径弹匣，无论是空尖弹还是麻醉弹。"
	icon_state = "korovin_holster"
	storage_type = /datum/storage/holster/belt/korovin

/obj/item/storage/holster/belt/korovin/standard/PopulateContents()
	new /obj/item/weapon/gun/pistol/c99(src)
	new /obj/item/ammo_magazine/pistol/c99(src)
	new /obj/item/ammo_magazine/pistol/c99(src)
	new /obj/item/ammo_magazine/pistol/c99(src)
	new /obj/item/ammo_magazine/pistol/c99(src)
	new /obj/item/ammo_magazine/pistol/c99(src)
	new /obj/item/ammo_magazine/pistol/c99(src)

/obj/item/storage/holster/belt/korovin/tranq/PopulateContents()
	new /obj/item/weapon/gun/pistol/c99/tranq(src)
	new /obj/item/ammo_magazine/pistol/c99t(src)
	new /obj/item/ammo_magazine/pistol/c99t(src)
	new /obj/item/ammo_magazine/pistol/c99t(src)
	new /obj/item/ammo_magazine/pistol/c99(src)
	new /obj/item/ammo_magazine/pistol/c99(src)
	new /obj/item/ammo_magazine/pistol/c99(src)

/obj/item/storage/holster/belt/ts34
	name = "\improper M276型SH-34霰弹枪携行具"
	desc = "专门设计的腰带式枪套组件，可容纳一把SH-34霰弹枪以及一个弹药盒或两把弹药。"
	icon_state = "ts34_holster"
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/holster/belt/ts34
	holsterable_allowed = list(/obj/item/weapon/gun/shotgun/double/marine)

/obj/item/storage/holster/belt/ts34/full/PopulateContents()
	new /obj/item/weapon/gun/shotgun/double/marine(src)
	new /obj/item/ammo_magazine/shotgun/buckshot(src)

/obj/item/storage/holster/belt/pistol/smart_pistol
	name = "\improper SP-13 枪套携行具"
	desc = "一个枪套腰带，可容纳SP-13智能冲锋手枪及其弹匣。"

/obj/item/storage/holster/belt/pistol/smart_pistol/full/Initialize(mapload)
	. = ..()
	storage_datum.set_holdable(can_hold_list = list(
		/obj/item/weapon/gun/pistol/smart_pistol,
		/obj/item/ammo_magazine/pistol/standard_pistol/smart_pistol,
	))

/obj/item/storage/holster/belt/pistol/smart_pistol/full/PopulateContents()
	new /obj/item/weapon/gun/pistol/smart_pistol(src)
	new /obj/item/ammo_magazine/pistol/standard_pistol/smart_pistol(src)
	new /obj/item/ammo_magazine/pistol/standard_pistol/smart_pistol(src)
	new /obj/item/ammo_magazine/pistol/standard_pistol/smart_pistol(src)
	new /obj/item/ammo_magazine/pistol/standard_pistol/smart_pistol(src)
	new /obj/item/ammo_magazine/pistol/standard_pistol/smart_pistol(src)
	new /obj/item/ammo_magazine/pistol/standard_pistol/smart_pistol(src)
