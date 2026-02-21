// MARINE STORAGE ARMOR


/obj/item/clothing/suit/storage/marine
	name = "\improper M3型陆战队护甲"
	desc = "标准地球政府殖民地海军陆战队M3型胸甲。可保护胸部免受弹道子弹、利刃和意外事故的伤害。其上附有一个小皮革附包，提供有限的存储空间。"
	icon = 'icons/obj/clothing/suits/marine_armor.dmi'
	icon_state = ""
	worn_icon_state = "armor"
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/clothing/suits/marine_armor.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	atom_flags = CONDUCT
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	cold_protection_flags = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	heat_protection_flags = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	blood_overlay_type = "armor"
	soft_armor = list(MELEE = 40, BULLET = 60, LASER = 60, ENERGY = 45, BOMB = 45, BIO = 45, FIRE = 45, ACID = 50)
	siemens_coefficient = 0.7
	permeability_coefficient = 0.8
	slowdown = 0.5
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/instrument,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/weapon/sword,
		/obj/item/storage/holster/belt,
		/obj/item/storage/belt/knifepouch,
		/obj/item/weapon/twohanded,
		/obj/item/tool/pickaxe/plasmacutter,
	)
	var/locate_cooldown = 0 //Cooldown for SL locator
	var/list/armor_overlays = list()
	actions_types = list(/datum/action/item_action/toggle/suit_toggle/light)
	armor_features_flags = ARMOR_LAMP_OVERLAY
	item_flags = SYNTH_RESTRICTED|IMPEDE_JETPACK
	w_class = WEIGHT_CLASS_HUGE
	equip_delay_self = 2 SECONDS
	unequip_delay_self = 2 SECONDS
	item_map_variant_flags = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT)

/obj/item/clothing/suit/storage/marine/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/clothing/suit/storage/marine/turn_light(mob/user, toggle_on)
	. = ..()
	user?.update_inv_wear_suit()

/obj/item/clothing/suit/storage/marine/update_overlays()
	. = ..()
	if(armor_features_flags & ARMOR_LAMP_OVERLAY)
		var/image/I = image(icon, src, armor_features_flags & ARMOR_LAMP_ON? "lamp-on" : "lamp-off")
		armor_overlays["lamp"] = I
		. += I
	else
		armor_overlays["lamp"] = null

/obj/item/clothing/suit/storage/marine/apply_custom(mutable_appearance/standing, inhands, icon_used, state_used)
	if(inhands)
		return
	. = ..()
	var/mutable_appearance/new_overlay
	for(var/i in armor_overlays)
		new_overlay = armor_overlays[i]
		if(new_overlay)
			new_overlay = mutable_appearance(worn_icon_list[slot_wear_suit_str], new_overlay.icon_state)
			standing.overlays += new_overlay

/obj/item/clothing/suit/storage/marine/attack_self(mob/user)
	if(!isturf(user.loc))
		to_chat(user, span_warning("你无法在[user.loc]中打开灯。"))
		return
	if(TIMER_COOLDOWN_RUNNING(src, COOLDOWN_ARMOR_LIGHT))
		return
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.wear_suit != src)
		return
	if(turn_light(user, !light_on) == CHECKS_PASSED)
		return TRUE

/obj/item/clothing/suit/storage/marine/item_action_slot_check(mob/user, slot)
	if(!ishuman(user))
		return FALSE
	if(slot != SLOT_WEAR_SUIT)
		return FALSE
	return TRUE //only give action button when armor is worn.

/obj/item/clothing/suit/storage/marine/pilot
	name = "\improper PAS-50型飞行员护甲"
	desc = "供空降艇飞行员在驾驶舱内飞行时使用的轻型护甲。擅长防护穿戴者免受高速实体弹丸的伤害。"
	icon_state = "pilot_chest"
	worn_icon_state = "pilot_chest"
	soft_armor = list(MELEE = 40, BULLET = 50, LASER = 50, ENERGY = 25, BOMB = 30, BIO = 5, FIRE = 25, ACID = 30)
	slowdown = 0.25
	item_map_variant_flags = NONE

/obj/item/clothing/suit/storage/marine/mech_pilot
	name = "\improper PAS-13型机甲驾驶员护甲"
	desc = "一套装甲相对稀疏但坚固耐用的防弹背心，尽管外骨骼装甲兴起，但由于易于使用和制造，仍在服役。虽然穿着机甲驾驶员制服时这套背心会带来些许不便，但它为驾驶员提供了在机甲外原本无法享受的一定程度防护。"
	icon_state = "mech_pilot_suit"
	worn_icon_state = "mech_pilot_suit"
	slowdown = SLOWDOWN_ARMOR_LIGHT
	soft_armor = list(MELEE = 45, BULLET = 55, LASER = 55, ENERGY = 20, BOMB = 45, BIO = 30, FIRE = 25, ACID = 35)
	item_map_variant_flags = NONE

/obj/item/clothing/suit/storage/marine/assault_crewman
	name = "\improper PAS-73型坦克兵护甲"
	desc = "一种装甲相对稀疏但坚固耐用的防弹背心。主要供坦克乘员使用，用于在碾压敌人时缓冲路面颠簸。"
	icon_state = "assault_crewman_suit"
	worn_icon_state = "assault_crewman_suit"
	slowdown = SLOWDOWN_ARMOR_LIGHT
	soft_armor = list(MELEE = 45, BULLET = 55, LASER = 55, ENERGY = 20, BOMB = 45, BIO = 30, FIRE = 25, ACID = 35)
	item_map_variant_flags = NONE

/obj/item/clothing/suit/storage/marine/transport_crewman
	name = "\improper PAS-74型运输装甲"
	desc = "一件装甲相对稀疏但结构坚固的防弹背心。运输机组人员使用，以便在载具被攻陷时假装自己还有生还的可能。"
	icon_state = "transport_crewman_suit"
	worn_icon_state = "transport_crewman_suit"
	slowdown = SLOWDOWN_ARMOR_LIGHT
	soft_armor = list(MELEE = 45, BULLET = 55, LASER = 55, ENERGY = 20, BOMB = 45, BIO = 30, FIRE = 25, ACID = 35)
	item_map_variant_flags = NONE

/obj/item/clothing/suit/storage/marine/riot
	name = "\improper M5防暴护甲"
	desc = "一套经过重度改装的M2 MP装甲，用于镇压那些戴着头盔的陆战队员及其枪械引发的骚乱。会严重拖慢你的行动速度。"
	icon_state = "marine_riot"
	slowdown = 1.3
	soft_armor = list(MELEE = 65, BULLET = 110, LASER = 110, ENERGY = 10, BOMB = 60, BIO = 50, FIRE = 50, ACID = 30)
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/weapon/sword,
		/obj/item/storage/holster/belt,
		/obj/item/storage/belt/knifepouch,
		/obj/item/weapon/twohanded,
	)
	item_map_variant_flags = NONE

//===========================SPECIALIST================================


/obj/item/clothing/suit/storage/marine/specialist
	name = "\improper B18 防御型护甲"
	desc = "一套厚重、坚固的装甲板，用于当你真的、真的需要避免惨死时。不过它会拖慢你的速度。\n配备自动诊断和医疗系统，用于维持穿戴者的生命。"
	icon_state = "xarmor"
	soft_armor = list(MELEE = 75, BULLET = 80, LASER = 80, ENERGY = 85, BOMB = 85, BIO = 70, FIRE = 85, ACID = 70)
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	resistance_flags = UNACIDABLE
	autobalance_monitor_value = B18_PRICE

/obj/item/clothing/suit/storage/marine/specialist/Initialize(mapload, ...)
	. = ..()
	AddComponent(/datum/component/suit_autodoc)
	AddComponent(/datum/component/stun_mitigation, slot_override = SLOT_WEAR_SUIT, shield_cover = list(MELEE = 50, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 50, FIRE = 50, ACID = 50))
	AddElement(/datum/element/limb_support)

/obj/item/clothing/suit/storage/marine/specialist/valhalla
	autobalance_monitor_value = null

/obj/item/clothing/suit/storage/marine/specialist/tdf
	name = "\improper 王牌级硬质护甲"
	desc = "王牌级属于轻型硬质护甲，相比标准TDF战斗装甲拥有良好的机动性和防护性，但比起更先进、更重的硬质护甲则相形见绌，且不那么花哨。其内置的SMES仅能为动力外骨骼和自动医疗系统提供数小时运行所需的电力。它提供出色的防护，但会略微降低机动性。Alt+点击以移除附件物品。使用它来切换内置手电筒。"
	icon = 'icons/mob/modular/tdf_armor.dmi'
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/modular/tdf_armor.dmi',
		slot_l_hand_str = 'icons/mob/inhands/clothing/suits_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/clothing/suits_right.dmi',
	)
	icon_state = "tdf_hardsuit"
	worn_icon_state = "tdf_hardsuit"
	item_map_variant_flags = NONE
	autobalance_monitor_value = null

/obj/item/clothing/suit/storage/marine/B17
	name = "\improper B17 防御装甲"
	desc = "B18的兄长型号。实际上是一款专为近距爆破专家设计的装甲化EOD防护服。"
	icon_state = "grenadier"
	soft_armor = list(MELEE = 75, BULLET = 75, LASER = 50, ENERGY = 55, BOMB = 100, BIO = 55, FIRE = 75, ACID = 65)
	max_heat_protection_temperature = HEAVYARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	item_flags = AUTOBALANCE_CHECK
	autobalance_monitor_value = B17_PRICE

/obj/item/clothing/suit/storage/marine/B17/valhalla
	autobalance_monitor_value = null

////////////////////////////////

/obj/item/clothing/suit/storage/marine/ship_tech
	name = "\improper PAS-09型技术员护甲"
	desc = "一款有些过时但坚固耐用的防弹背心，尽管外骨骼装甲兴起，但由于易于使用和制造，仍在服役。它能为技术员面对的各种异星危险提供更多防护。"
	icon_state = "tanker"
	soft_armor = list(MELEE = 40, BULLET = 55, LASER = 60, ENERGY = 45, BOMB = 60, BIO = 45, FIRE = 45, ACID = 65)
	item_map_variant_flags = NONE

/obj/item/clothing/suit/storage/marine/officer
	name = "\improper PAS-N3型军官护甲"
	desc = "一套精心制作的个人护甲系统，通常由高级军官持有。在战场上，它能有效让部下知道谁是指挥官。"
	icon_state = "officer"
	soft_armor = list(MELEE = 40, BULLET = 60, LASER = 60, ENERGY = 45, BOMB = 45, BIO = 45, FIRE = 45, ACID = 50)
	slowdown = 0.5
	item_map_variant_flags = NONE
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/weapon/baton,
		/obj/item/restraints/handcuffs,
		/obj/item/explosive/grenade,
		/obj/item/binoculars,
		/obj/item/weapon/combat_knife,
		/obj/item/attachable/bayonet,
		/obj/item/storage/belt/sparepouch,
		/obj/item/hailer,
		/obj/item/storage/holster/blade,
		/obj/item/storage/holster/belt,
	)

/obj/item/clothing/suit/storage/marine/officer/req
	name = "\improper PAS-N2型MA护甲"
	desc = "标准的地球政府海军N2型个人护甲系统。能保护胸部免受弹道子弹、利刃和意外事故的伤害。它上面系有一个小皮革附包，用于有限的存储。"
	icon_state = "mp"

/*=============================PMCS==================================*/

/obj/item/clothing/suit/storage/marine/veteran
	icon = 'icons/obj/clothing/suits/ert_suits.dmi'
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/clothing/suits/ert_suits.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)

/obj/item/clothing/suit/storage/marine/veteran/pmc
	name = "\improper M4型PMC护甲"
	desc = "一种过时军用背心的改良版。尽管它没有先进的装甲分层和针对恶劣环境的防护，这种护甲仍由纳米传讯军械部门为纳米传讯PMC的低级成员和外环安保公司生产。"
	icon_state = "pmc_armor"
	soft_armor = list(MELEE = 55, BULLET = 70, LASER = 60, ENERGY = 60, BOMB = 50, BIO = 15, FIRE = 35, ACID = 45)
	slowdown = SLOWDOWN_ARMOR_LIGHT
	armor_features_flags = ARMOR_LAMP_OVERLAY
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/weapon/baton,
		/obj/item/restraints/handcuffs,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/storage/bible,
		/obj/item/weapon/sword/machete,
		/obj/item/weapon/combat_knife,
	)
	item_map_variant_flags = NONE

/obj/item/clothing/suit/storage/marine/veteran/pmc/standard
	name = "\improper M4 军团式PMC护甲"
	desc = "标准制式护甲，专为快速移动设计。由纳米传讯军械部门生产。是雇佣兵和安保人员的首选装备。"
	icon_state = "pmc_armor_standard"
	soft_armor = list(MELEE = 55, BULLET = 70, LASER = 65, ENERGY = 65, BOMB = 50, BIO = 20, FIRE = 45, ACID = 45)
	armor_features_flags = NONE

/obj/item/clothing/suit/storage/marine/veteran/pmc/standard/sarge
	desc = "标准制式护甲，专为快速移动设计。由纳米传讯军械部门生产。这是雇佣兵和安保人员的首选装备。你不再是新兵蛋子了，对吧？"
	icon_state = "pmc_armor_standard_sarge"

/obj/item/clothing/suit/storage/marine/veteran/pmc/standard/joker
	desc = "标准制式套装，专为快速移动设计。由纳米传讯军械部门生产。这是雇佣兵和安全人员偏爱的选择。你若不是小队里最有趣的，就是最烦人的那个。"
	icon_state = "pmc_armor_standard_joker"

/obj/item/clothing/suit/storage/marine/veteran/pmc/standard/stripes
	desc = "标准制式套装，专为快速移动设计。由纳米传讯军械部门生产。这是佣兵和安保人员的首选装备。你喜欢条纹，对吧？"
	icon_state = "pmc_armor_standard_stripes"

/obj/item/clothing/suit/storage/marine/veteran/pmc/leader
	name = "\improper M6王子式样PMC护甲"
	desc = "M4装甲服的强化改装型。防护性与机动性的巅峰之作。这套装备看起来属于高级军官。"
	icon_state = "officer_armor"
	soft_armor = list(MELEE = 60, BULLET = 75, LASER = 70, ENERGY = 70, BOMB = 60, BIO = 50, FIRE = 50, ACID = 50)
	armor_features_flags = NONE

/obj/item/clothing/suit/storage/marine/veteran/pmc/sniper
	name = "\improper M4-L 射手座型 PMC 装甲"
	desc = "M4装甲服的轻量化改装型，专为在危险环境中长时间静坐设计，为此牺牲了部分战斗防护能力。"
	icon_state = "pmc_sniper"
	soft_armor = list(MELEE = 50, BULLET = 65, LASER = 60, ENERGY = 60, BOMB = 40, BIO = 75, FIRE = 75, ACID = 75)
	inventory_flags = BLOCKSHARPOBJ
	armor_features_flags = NONE

/obj/item/clothing/suit/storage/marine/veteran/pmc/gunner
	name = "\improper M7-H 重骑兵型 PMC 外骨骼装甲"
	desc = "纳米传讯最新一代军械库。重型层压塑钢编织板，带有坚固的烧蚀涂层。伺服助力器防止这套装备的巨大重量完全限制穿戴者的行动，但这套装备仍然相当笨重。"
	icon_state = "pmc_heavyarmor"
	slowdown = SLOWDOWN_ARMOR_HEAVY
	soft_armor = list(MELEE = 65, BULLET = 80, LASER = 75, ENERGY = 75, BOMB = 80, BIO = 30, FIRE = 65, ACID = 65)
	armor_features_flags = NONE

/obj/item/clothing/suit/storage/marine/veteran/pmc/gunner/sarge
	desc = "纳米传讯军械库的最新一代产品。厚重的复合塑钢编织板层，带有坚固的烧蚀涂层。伺服助力器防止这套装备的巨大重量完全限制穿戴者的行动，但它仍然相当笨重。你不再是那个光鲜亮丽的家伙了，对吧？"
	icon_state = "pmc_heavyarmor_sarge"

/obj/item/clothing/suit/storage/marine/veteran/pmc/gunner/joker
	desc = "纳米传讯最新一代的军械库。厚重的层压塑钢编织板，带有坚固的烧蚀涂层。伺服助力器防止这套装备的巨大重量完全限制穿戴者的行动，但这套装备仍然相当笨重。你可能是班里最有趣，或者最烦人的那个人。"
	icon_state = "pmc_heavyarmor_joker"

/obj/item/clothing/suit/storage/marine/veteran/pmc/gunner/stripes
	desc = "纳米传讯最新一代军械库。厚重的层压塑钢编织板，带有坚固的烧蚀涂层。伺服助力器防止这套装备的巨大重量完全限制穿戴者的行动，但这套装备仍然相当笨重。你喜欢条纹，对吧？"
	icon_state = "pmc_heavyarmor_stripes"

/obj/item/clothing/suit/storage/marine/veteran/pmc/gunner/leader
	name = "\improper M7-H 重骑兵型 PMC 军官外骨骼装甲"
	desc = "纳米传讯最新一代军械库。厚重的层压塑钢编织板，带有坚固的烧蚀涂层。伺服助力器防止这套装备的巨大重量完全限制穿戴者的行动，但这套装备仍然相当笨重。这套特殊的装备看起来属于高级军官，配有集成能量护盾系统。"
	icon_state = "pmc_heavyarmor_officer"

/*===========================Death Commando============================*/
/obj/item/clothing/suit/storage/marine/veteran/pmc/commando
	name = "\improper PMC 突击队护甲"
	desc = "一套由不明来源制造的重型装甲服，专为精英行动设计。这是一套完全自给自足的系统，并具有极强的抗腐蚀性。"
	icon_state = "commando_armor"
	soft_armor = list(MELEE = 90, BULLET = 120, LASER = 200, ENERGY = 100, BOMB = 100, BIO = 100, FIRE = 100, ACID = 100)
	attachments_by_slot = list(ATTACHMENT_SLOT_STORAGE)
	attachments_allowed = list(/obj/item/armor_module/storage/grenade)
	starting_attachments = list(/obj/item/armor_module/storage/grenade)
	resistance_flags = UNACIDABLE
	armor_features_flags = NONE

/obj/item/clothing/suit/storage/marine/veteran/pmc/commando/Initialize(mapload, ...)
	. = ..()
	AddComponent(/datum/component/suit_autodoc)
	AddElement(/datum/element/limb_support)

/*===========================I.o.M================================*/

/obj/item/clothing/suit/storage/marine/imperial
	name = "\improper 帝国卫队防弹护甲"
	desc = "廉价、批量生产的护甲，由同样廉价且批量生产的帝国卫队穿戴。你能辨认出护甲上似乎刻着<i>卡迪亚屹立不倒</i>的字样。"
	icon = 'icons/obj/clothing/suits/ert_suits.dmi'
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/clothing/suits/ert_suits.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	icon_state = "guardarmor"
	soft_armor = list(MELEE = 75, BULLET = 65, LASER = 60, ENERGY = 60, BOMB = 50, BIO = 0, FIRE = 60, ACID = 60)
	item_map_variant_flags = NONE

/obj/item/clothing/suit/storage/marine/imperial/sergeant
	// SL armour, better than flak, covers more
	name = "\improper 帝国卫队士官护甲"
	desc = "一种比防弹护甲提供更佳防护的防弹衣。"
	icon_state = "guardSLarmor"
	soft_armor = list(MELEE = 85, BULLET = 85, LASER = 85, ENERGY = 85, BOMB = 85, BIO = 25, FIRE = 85, ACID = 85)
	light_range = 6 // better light

/obj/item/clothing/suit/storage/marine/imperial/medicae
	name = "\improper 帝国卫队医疗兵护甲"
	desc = "帝国卫队医疗兵穿戴的护甲。"
	icon_state = "guardmedicarmor"

/obj/item/clothing/suit/storage/marine/imperial/sergeant/veteran
	name = "\improper 帝国卫队甲壳护甲"
	desc = "重型全身护甲，比防弹护甲提供更多保护，但会显著降低移动速度。"
	icon_state = "guardvetarmor"
	slowdown = SLOWDOWN_ARMOR_HEAVY
	soft_armor = list(MELEE = 90, BULLET = 90, LASER = 90, ENERGY = 90, BOMB = 90, BIO = 30, FIRE = 90, ACID = 90)

/obj/item/clothing/suit/storage/marine/imperial/power
	// Should this maybe require recharging?
	name = "\improper 回收的星际战士动力装甲"
	desc = "一套曾经损坏的动力装甲，现已恢复功能。不过这个版本不如真正的动力装甲那么强大。"
	//icon_state
	soft_armor = list(MELEE = 75, BULLET = 60, LASER = 55, ENERGY = 40, BOMB = 45, BIO = 15, FIRE = 40, ACID = 40)
	light_range = 6

/obj/item/clothing/suit/storage/marine/imperial/commissar
	name = "\improper 政委大衣"
	desc = "帝国陆军政委穿着的装甲大衣。"
	icon_state = "commissar_coat"
	worn_icon_state = "commissar_coat"
	soft_armor = list(MELEE = 75, BULLET = 60, LASER = 55, ENERGY = 40, BOMB = 45, BIO = 15, FIRE = 40, ACID = 40)

//===========================FREELANCER(MAGNUM)================================

/obj/item/clothing/suit/storage/marine/freelancer
	name = "\improper M3型自由佣兵胸甲"
	desc = "由各种板材拼凑而成的装甲防护胸甲。它表现得出奇地好，因为工艺扎实，设计也模仿了ICC和地球政府的类似装甲。"
	icon = 'icons/obj/clothing/suits/ert_suits.dmi'
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/clothing/suits/ert_suits.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	icon_state = "freelancer_armor"
	slowdown = SLOWDOWN_ARMOR_LIGHT
	soft_armor = list(MELEE = 50, BULLET = 65, LASER = 65, ENERGY = 55, BOMB = 60, BIO = 55, FIRE = 55, ACID = 55)
	armor_features_flags = ARMOR_LAMP_OVERLAY
	item_map_variant_flags = NONE
	attachments_by_slot = list(
		ATTACHMENT_SLOT_STORAGE,
		ATTACHMENT_SLOT_MODULE,
	)
	attachments_allowed = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/module/valkyrie_autodoc,
		/obj/item/armor_module/module/fire_proof,
		/obj/item/armor_module/module/mimir_environment_protection,
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
		/obj/item/armor_module/module/hlin_explosive_armor,
		/obj/item/armor_module/module/eshield,
		/obj/item/armor_module/module/eshield/overclocked,
		/obj/item/armor_module/storage/general,
		/obj/item/armor_module/storage/medical,
		/obj/item/armor_module/storage/ammo_mag,
		/obj/item/armor_module/storage/engineering,
		/obj/item/armor_module/storage/grenade,
		/obj/item/armor_module/storage/injector,
		/obj/item/armor_module/storage/satchel,
		/obj/item/armor_module/storage/general/som,
		/obj/item/armor_module/storage/engineering/som,
		/obj/item/armor_module/storage/medical/som,
		/obj/item/armor_module/armor/badge,
	)
	starting_attachments = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/storage/medical,
	)

/obj/item/clothing/suit/storage/marine/freelancer/medic
	starting_attachments = list(
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
		/obj/item/armor_module/storage/general,
	)

/obj/item/clothing/suit/storage/marine/freelancer/heavy
	name = "\improper B12型自由佣兵胸甲"
	desc = "从M3装甲上拆下的金属板拼凑而成，旨在提供最大生存能力。虽然没多少佣兵喜欢穿戴它，但事实证明，在防御战和近距离战斗中，这是一件出奇有效的装备。"
	icon_state = "freelancer_armor_heavy"
	slowdown = SLOWDOWN_ARMOR_HEAVY
	soft_armor = list(MELEE = 60, BULLET = 75, LASER = 75, ENERGY = 65, BOMB = 70, BIO = 65, FIRE = 65, ACID = 65)
	starting_attachments = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/storage/ammo_mag,
	)

/obj/item/clothing/suit/storage/marine/freelancer/heavy/general
	starting_attachments = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/storage/general,
	)
/obj/item/clothing/suit/storage/marine/freelancer/heavy/valk
	starting_attachments = list(
		/obj/item/armor_module/module/valkyrie_autodoc,
		/obj/item/armor_module/storage/ammo_mag,
	)

/obj/item/clothing/suit/storage/marine/freelancer/heavy/spec
	starting_attachments = list(
		/obj/item/armor_module/module/valkyrie_autodoc,
		/obj/item/armor_module/storage/satchel,
	)
/obj/item/clothing/suit/storage/marine/freelancer/pyro
	name = "\improper B08型自由佣兵火焰兵防护服"
	desc = "一套改装的消防服，结合了防化过滤器并用金属板加固。所有这些都让使用者能够安全地穿过火焰。不过，只有彻头彻尾的疯子才会穿着它超过一小时，但有时绝望的处境需要采取极端措施。"
	icon_state = "freelancer_armor_pyro"
	slowdown = SLOWDOWN_ARMOR_HEAVY
	soft_armor = list(MELEE = 50, BULLET = 70, LASER = 70, ENERGY = 60, BOMB = 55, BIO = 60, FIRE = 90, ACID = 60)
	armor_features_flags = list(
		ARMOR_LAMP_OVERLAY,
		ARMOR_FIRE_RESISTANT,
		)
	starting_attachments = list(
		/obj/item/armor_module/storage/satchel,
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
	)

/*===========================U.S.L================================*/

/obj/item/clothing/suit/storage/faction
	icon = 'icons/obj/clothing/suits/ert_suits.dmi'
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/clothing/suits/ert_suits.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	atom_flags = CONDUCT
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	cold_protection_flags = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	heat_protection_flags =CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	blood_overlay_type = "armor"
	soft_armor = list(MELEE = 50, BULLET = 40, LASER = 35, ENERGY = 20, BOMB = 25, BIO = 10, FIRE = 20, ACID = 20)
	siemens_coefficient = 0.7
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/explosive/grenade,
		/obj/item/binoculars,
		/obj/item/weapon/combat_knife,
		/obj/item/attachable/bayonet,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/weapon/twohanded,
	)
	armor_features_flags = ARMOR_LAMP_OVERLAY
	item_flags = SYNTH_RESTRICTED
	var/locate_cooldown = 0 //Cooldown for SL locator
	var/armor_overlays["lamp"]
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/suit/storage/faction/Initialize(mapload, ...)
	. = ..()
	armor_overlays = list("lamp")
	update_icon()

/obj/item/clothing/suit/storage/faction/update_overlays()
	. = ..()
	if(armor_features_flags & ARMOR_LAMP_OVERLAY)
		var/image/I = image(icon, src, armor_features_flags & ARMOR_LAMP_ON? "lamp-on" : "lamp-off")
		armor_overlays["lamp"] = I
		. += I
	else
		armor_overlays["lamp"] = null

/obj/item/clothing/suit/storage/faction/attack_self(mob/user)
	if(!isturf(user.loc))
		to_chat(user, span_warning("你无法在[user.loc]中打开灯。"))
		return

	if(TIMER_COOLDOWN_RUNNING(src, COOLDOWN_ARMOR_LIGHT))
		return

	if(!ishuman(user)) return
	var/mob/living/carbon/human/H = user
	if(H.wear_suit != src) return

	if(turn_light(user, !light_on) == CHECKS_PASSED)
		return TRUE

/obj/item/clothing/suit/storage/faction/item_action_slot_check(mob/user, slot)
	if(!ishuman(user)) return FALSE
	if(slot != SLOT_WEAR_SUIT) return FALSE
	return TRUE //only give action button when armor is worn.

/obj/item/clothing/suit/storage/faction/UPP
	name = "\improper UM5 单兵护甲"
	desc = "联合太空鳞翅目海盗的标准防弹衣，UM5（联合中型MK5）是一种中型防弹衣，其性能大致与地球政府殖民地海军陆战队服役的经典M3型防弹衣相当。"
	icon_state = "upp_armor"
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	soft_armor = list(MELEE = 55, BULLET = 60, LASER = 60, ENERGY = 60, BOMB = 55, BIO = 10, FIRE = 60, ACID = 60)

/// Modified version of the armor for HvH combat. Stats are based on medium armor, with tyr mark 2.
/obj/item/clothing/suit/storage/faction/UPP/hvh
	soft_armor = list(MELEE = 55, BULLET = 75, LASER = 75, ENERGY = 60, BOMB = 60, BIO = 45, FIRE = 60, ACID = 65)


/obj/item/clothing/suit/storage/faction/UPP/commando
	name = "\improper UM5CU 个人护甲"
	desc = "UM5的改进型号，专为隐秘行动设计。"
	icon_state = "upp_armor_commando"
	slowdown = SLOWDOWN_ARMOR_LIGHT

/// Modified version of the armor for HvH combat. Stats are based on medium armor, with tyr mark 2.
/obj/item/clothing/suit/storage/faction/UPP/commando/hvh
	soft_armor = list(MELEE = 55, BULLET = 75, LASER = 75, ENERGY = 60, BOMB = 60, BIO = 45, FIRE = 60, ACID = 65)

/obj/item/clothing/suit/storage/faction/UPP/heavy
	name = "\improper UH7重型板甲"
	desc = "一套在联合太空鳞翅目海盗中服役的极其重型护甲，UH7（联合重型MK7）以其坚固耐用而闻名，能够承受巨大的打击。"
	icon_state = "upp_armor_heavy"
	slowdown = SLOWDOWN_ARMOR_HEAVY
	soft_armor = list(MELEE = 65, BULLET = 65, LASER = 65, ENERGY = 60, BOMB = 60, BIO = 10, FIRE = 60, ACID = 60)

/// Modified version of the armor for HvH combat. Stats are based on heavy armor, with tyr mark 2.
/obj/item/clothing/suit/storage/faction/UPP/heavy/hvh
	soft_armor = list(MELEE = 60, BULLET = 80, LASER = 80, ENERGY = 65, BOMB = 60, BIO = 60, FIRE = 60, ACID = 70)

/obj/item/clothing/suit/storage/marine/smartgunner/UPP
	name = "\improper UH7重型板甲"
	desc = "一套在联合太空鳞翅目海盗中服役的极其重型护甲，UH7（联合重型MK7）以其坚固耐用而闻名，能够承受巨大的打击。"
	icon_state = "upp_armor_heavy"
	slowdown = SLOWDOWN_ARMOR_HEAVY
	soft_armor = list(MELEE = 65, BULLET = 65, LASER = 65, ENERGY = 60, BOMB = 60, BIO = 10, FIRE = 60, ACID = 60)

/// Modified version of the armor for HvH combat. Stats are based on heavy armor, with tyr mark 2.
/obj/item/clothing/suit/storage/marine/smartgunner/UPP/hvh
	soft_armor = list(MELEE = 60, BULLET = 80, LASER = 80, ENERGY = 65, BOMB = 60, BIO = 60, FIRE = 60, ACID = 70)

//this one is for CLF
/obj/item/clothing/suit/storage/faction/militia
	name = "\improper 殖民地民兵锁子甲"
	desc = "殖民地民兵成员的锁子甲，由煮制皮革和一些现代装甲板制成。虽然与大多数现代装甲相比显得原始，但它赋予穿戴者近乎完美的机动性，这符合当地殖民者的需求。"
	icon_state = "rebel_armor"
	slowdown = SLOWDOWN_ARMOR_VERY_LIGHT
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	cold_protection_flags = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	heat_protection_flags =CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	item_flags = SYNTH_RESTRICTED
	soft_armor = list(MELEE = 40, BULLET = 40, LASER = 40, ENERGY = 30, BOMB = 60, BIO = 30, FIRE = 30, ACID = 30)
	allowed = list(
		/obj/item/weapon/twohanded,
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/explosive/grenade,
		/obj/item/binoculars,
		/obj/item/weapon/combat_knife,
		/obj/item/attachable/bayonet,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/weapon/baseballbat,
	)
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/storage/CMB
	name = "\improper CMB夹克"
	desc = "殖民地执法官船员穿着的绿色夹克。"
	icon_state = "CMB_jacket"
	blood_overlay_type = "coat"
	soft_armor = list(MELEE = 10, BULLET = 10, LASER = 10, ENERGY = 20, BOMB = 10, BIO = 10, FIRE = 10, ACID = 10)
	allowed = list(
		/obj/item/weapon/gun/,
		/obj/item/tank/emergency_oxygen,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/storage/holster/belt,
	)

/obj/item/clothing/suit/storage/RO
	name = "\improper 补给军官夹克"
	desc = "一件地球政府殖民地海军陆战队人员穿着的绿色夹克。背面印有地球政府的旗帜。"
	icon_state = "RO_jacket"
	blood_overlay_type = "coat"
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	cold_protection_flags = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	heat_protection_flags =CHEST|GROIN|ARMS|LEGS|FEET|HANDS

/*===========================HELGHAST - MERCENARY================================*/

/obj/item/clothing/suit/storage/marine/veteran/mercenary
	name = "\improper K12陶瓷板装甲"
	desc = "一套灰色重型陶瓷护甲，带有深蓝色高光。这是该星区某个未知佣兵组织的标准制服。"
	icon_state = "mercenary_heavy_armor"
	soft_armor = list(MELEE = 75, BULLET = 62, LASER = 42, ENERGY = 38, BOMB = 40, BIO = 15, FIRE = 38, ACID = 38)
	slowdown = SLOWDOWN_ARMOR_LIGHT
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/weapon/baton,
		/obj/item/restraints/handcuffs,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/storage/bible,
		/obj/item/weapon/sword/machete,
		/obj/item/weapon/combat_knife,
	)

/obj/item/clothing/suit/storage/marine/veteran/mercenary/miner
	name = "\improper Y8装甲矿工背心"
	desc = "一套米色轻型护甲，专为采矿防护而设计。这是该星区某个未知佣兵团体的专用制服。"
	icon_state = "mercenary_miner_armor"
	soft_armor = list(MELEE = 50, BULLET = 42, LASER = 42, ENERGY = 38, BOMB = 25, BIO = 15, FIRE = 38, ACID = 38)
	slowdown = SLOWDOWN_ARMOR_LIGHT
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/weapon/baton,
		/obj/item/restraints/handcuffs,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/storage/bible,
		/obj/item/weapon/sword/machete,
		/obj/item/weapon/combat_knife,
	)

/obj/item/clothing/suit/storage/marine/veteran/mercenary/engineer
	name = "\improper Z7装甲工程背心"
	desc = "一套带有黄色高光的蓝色护甲，专为在高度危险环境中建造时提供防护而设计。这是在该星区活动的一支未知佣兵团的专用制服。"
	icon_state = "mercenary_engineer_armor"
	soft_armor = list(MELEE = 55, BULLET = 52, LASER = 42, ENERGY = 38, BOMB = 30, BIO = 15, FIRE = 38, ACID = 38)
	slowdown = SLOWDOWN_ARMOR_LIGHT
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/weapon/baton,
		/obj/item/restraints/handcuffs,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/storage/bible,
		/obj/item/weapon/sword/machete,
		/obj/item/weapon/combat_knife,
	)

/obj/item/clothing/suit/storage/marine/som
	name = "\improper S12锁子甲"
	desc = "一件经过大幅改造的采矿设备，被重新设计用于通用战斗用途。它重量轻便但几乎不提供任何防护。"
	icon = 'icons/obj/clothing/suits/ert_suits.dmi'
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/clothing/suits/ert_suits.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	icon_state = "som_armor"
	worn_icon_state = "som_armor"
	slowdown = SLOWDOWN_ARMOR_LIGHT
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	soft_armor = list(MELEE = 50, BULLET = 55, LASER = 55, ENERGY = 55, BOMB = 55, BIO = 55, FIRE = 55, ACID = 55)
	item_map_variant_flags = NONE

/obj/item/clothing/suit/storage/marine/som/veteran
	name = "\improper S12战斗锁子甲"
	desc = "一件经过大幅改造的采矿设备，现被重新设计用于通用战斗用途。与其他同类设备相比，其改装程度似乎更深。因此它更重，但也更坚固。"
	icon_state = "som_armor_veteran"
	worn_icon_state = "som_armor_veteran"
	slowdown = SLOWDOWN_ARMOR_HEAVY
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	soft_armor = list(MELEE = 65, BULLET = 70, LASER = 70, ENERGY = 55, BOMB = 55, BIO = 55, FIRE = 55, ACID = 60)

/obj/item/clothing/suit/storage/marine/som/leader
	name = "\improper S13班长锁子甲"
	desc = "一款经过深度改造的采矿设备，现已重新设计用于通用战斗用途。相比同类装备进行了更广泛的改装，但也因此更为沉重。"
	icon_state = "som_armor_leader"
	worn_icon_state = "som_armor_leader"
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	soft_armor = list(MELEE = 55, BULLET = 50, LASER = 40, ENERGY = 55, BOMB = 55, BIO = 55, FIRE = 55, ACID = 60)

/obj/item/clothing/suit/storage/marine/icc
	name = "\improper 16型战斗护甲"
	desc = "一件ICC防弹衣，在登舰行动中由近距离作战人员穿着，由于人员短缺，大多数ICC人员都兼任临时陆战队员。对大多数伤害来源，尤其是爆炸，提供良好防护。"
	icon = 'icons/obj/clothing/suits/ert_suits.dmi'
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/clothing/suits/ert_suits.dmi',
		slot_l_hand_str = 'icons/mob/inhands/items/items_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/items_right.dmi',
	)
	icon_state = "icc"
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	cold_protection_flags = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	heat_protection_flags =CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	soft_armor = list(MELEE = 50, BULLET = 60, LASER = 50, ENERGY = 60, BOMB = 70, BIO = 10, FIRE = 60, ACID = 50)
	item_map_variant_flags = NONE

/obj/item/clothing/suit/storage/marine/icc/guard
	name = "\improper 19型战斗护甲"
	desc = "一件ICCGF的防弹衣，由专业步兵穿着。由于持续的人力短缺，ICC部队中的大多数步兵行动都是由临时人员完成的，然而大多数真正的步兵师素质都很高，并且更广为人知的名称为'卫兵'。对大多数伤害来源都有良好的防护，并能完全防护爆炸伤害。"
	icon_state = "icc_guard"
	soft_armor = list(MELEE = 60, BULLET = 65, LASER = 40, ENERGY = 60, BOMB = 85, BIO = 10, FIRE = 55, ACID = 40)

/obj/item/clothing/suit/storage/marine/icc/guard/heavy
	name = "\improper 莫德尔/22'胸甲骑兵'战斗护甲"
	desc = "一件ICCGF的防弹衣，由专业步兵穿着。由于持续的人力短缺，ICC部队中的大多数步兵行动都由临时人员执行，但大多数真正的步兵师素质很高，更广为人知的称呼是'卫兵'。能很好地防护大多数伤害来源，并能完全防护爆炸伤害。"
	icon_state = "icc_guard_heavy"
	soft_armor = list(MELEE = 70, BULLET = 75, LASER = 40, ENERGY = 60, BOMB = 90, BIO = 10, FIRE = 55, ACID = 40)

//===========================SPEC OPS================================

/obj/item/clothing/suit/storage/marine/specops
	name = "防弹背心"
	desc = "民用型护甲，设计用于抵御近战和投射物攻击。"
	icon = 'icons/mob/clothing/suits/ert_suits.dmi'
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/clothing/suits/ert_suits.dmi',
	)
	icon_state = "specops_vest"
	soft_armor = list(MELEE = 30, BULLET = 50, LASER = 20, ENERGY = 25, BOMB = 30, BIO = 5, FIRE = 25, ACID = 30)
	slowdown = SLOWDOWN_ARMOR_LIGHT
	armor_protection_flags = CHEST|GROIN
	armor_features_flags = NONE
	item_map_variant_flags = NONE

/obj/item/clothing/suit/storage/marine/specops/support
	name = "防弹背心"
	desc = "民用型护甲，设计用于抵御近战和投射物攻击。"
	icon_state = "specops_vest_support"

/obj/item/clothing/suit/storage/marine/specops/medic
	name = "防弹背心"
	desc = "民用型护甲，设计用于抵御近战和投射物攻击。"
	icon_state = "specops_vest_medic"

/obj/item/clothing/suit/storage/marine/specops/leader
	name = "防弹背心"
	desc = "民用型护甲，设计用于应对近战和投射物攻击。配有战术护肘。"
	icon_state = "specops_vest_leader"
	soft_armor = list(MELEE = 50, BULLET = 50, LASER = 40, ENERGY = 35, BOMB = 30, BIO = 5, FIRE = 25, ACID = 30)
	slowdown = SLOWDOWN_ARMOR_MEDIUM

//===========================V.S.D================================

/obj/item/clothing/suit/storage/marine/vsd
	name = "\improper 撞击者MT-L/43弹道护甲"
	desc = "维雅切斯拉夫安保小组的主要防弹衣。能保护使用者免受大多数弹道口径的伤害。"
	icon = 'icons/mob/clothing/suits/ert_suits.dmi'
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/clothing/suits/ert_suits.dmi',
	)
	icon_state = "vsd_armor"
	worn_icon_state = "vsd_armor"
	slowdown = SLOWDOWN_ARMOR_LIGHT
	soft_armor = list(MELEE = 45, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 50, FIRE = 50, ACID = 50)
	item_map_variant_flags = NONE
	armor_features_flags = NONE

/obj/item/clothing/suit/storage/marine/vsd/alt
	icon_state = "vsd_armor_alt"
	worn_icon_state = "vsd_armor_alt"

/obj/item/clothing/suit/storage/marine/vsd/marmor
	name = "\improper 撞击者MT-M/43弹道护甲"
	desc = "维雅切斯拉夫安保小组专用防弹衣，通常由工程师使用。能保护使用者免受大多数弹道口径的伤害。"
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	icon_state = "vsd_armor_medium"
	worn_icon_state = "vsd_armor_medium"
	soft_armor = list(MELEE = 50, BULLET = 65, LASER = 65, ENERGY = 50, BOMB = 50, BIO = 50, FIRE = 50, ACID = 50)

/obj/item/clothing/suit/storage/marine/vsd/harmor
	name = "\improper 撞击者MT-H/43动力弹道护甲"
	desc = "维雅切斯拉夫安保小组的重型护甲，很少配发给普通士兵。能保护使用者抵御大多数弹道口径。"
	slowdown = SLOWDOWN_ARMOR_HEAVY
	icon_state = "vsd_armor_heavy"
	worn_icon_state = "vsd_armor_heavy"
	soft_armor = list(MELEE = 60, BULLET = 75, LASER = 75, ENERGY = 50, BOMB = 50, BIO = 50, FIRE = 50, ACID = 50)

/obj/item/clothing/suit/storage/marine/vsd/juggernaut
	name = "\improper 撞击者 MT-H/43 '阿瑞斯' 动力弹道护甲"
	desc = "维雅切斯拉夫安保特遣队的重装护甲套装，授予最优秀且值得信赖的老兵。能保护穿戴者抵御几乎所有弹道口径。"
	icon = 'icons/mob/clothing/suits/ert_suits.dmi'
	slowdown = SLOWDOWN_ARMOR_VERY_HEAVY
	icon_state = "vsd_juggernaut_ballistic"
	worn_icon_state = "vsd_juggernaut_ballistic"
	soft_armor = list(MELEE = 75, BULLET = 85, LASER = 85, ENERGY = 60, BOMB = 60, BIO = 60, FIRE = 60, ACID = 75)

/obj/item/clothing/suit/storage/marine/vsd/juggernaut/Initialize(mapload, ...)
	. = ..()
	AddComponent(/datum/component/suit_autodoc)

/obj/item/clothing/suit/storage/marine/vsd/eod
	name = "\improper 撞击者MT-H/43型'宙斯'动力爆炸防御护甲"
	desc = "维雅切斯拉夫安保小组的拆弹防护装甲，能保护使用者免受大多数威胁，并对爆炸物提供强力防护。"
	icon = 'icons/mob/clothing/suits/ert_suits.dmi'
	slowdown = SLOWDOWN_ARMOR_VERY_HEAVY
	icon_state = "vsd_juggernaut_explosive"
	worn_icon_state = "vsd_juggernaut_explosive"
	soft_armor = list(MELEE = 65, BULLET = 80, LASER = 80, ENERGY = 60, BOMB = 90, BIO = 60, FIRE = 60, ACID = 75)

/obj/item/clothing/suit/storage/marine/vsd/flamer
	name = "\improper 坠毁者MT-H/43'阿波罗'动力防火护甲"
	desc = "维雅切斯拉夫安保小组的喷火器护甲，能保护穿戴者免受大多数威胁，并使其适应火焰与高温环境。"
	icon = 'icons/mob/clothing/suits/ert_suits.dmi'
	slowdown = SLOWDOWN_ARMOR_VERY_HEAVY
	icon_state = "vsd_juggernaut_flamer"
	worn_icon_state = "vsd_juggernaut_flamer"
	soft_armor = list(MELEE = 70, BULLET = 80, LASER = 80, ENERGY = 60, BOMB = 60, BIO = 60, FIRE = 90, ACID = 85)
	armor_features_flags = ARMOR_FIRE_RESISTANT
