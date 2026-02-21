/obj/item/clothing/shoes/marine
	name = "陆战队作战靴"
	desc = "标准制式作战靴，专为战斗场景或作战环境设计。全天候战斗，随时待命。"
	icon_state = "marine"
	worn_icon_state = "marine"
	armor_protection_flags = FEET
	cold_protection_flags = FEET
	heat_protection_flags = FEET
	inventory_flags = NOQUICKEQUIP|NOSLIPPING
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7

	attachments_by_slot = list(
		ATTACHMENT_SLOT_STORAGE,
	)
	attachments_allowed = list(
		/obj/item/armor_module/storage/boot,
		/obj/item/armor_module/storage/boot/full,
		/obj/item/armor_module/storage/boot/som_knife,
		/obj/item/armor_module/storage/boot/pmc_knife
	)
	starting_attachments = list(/obj/item/armor_module/storage/boot)

/obj/item/clothing/shoes/marine/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/clothing/shoes/marine/update_icon_state()
	. = ..()
	icon_state = initial(icon_state)
	if(!attachments_by_slot[ATTACHMENT_SLOT_STORAGE])
		return
	if(!istype(attachments_by_slot[ATTACHMENT_SLOT_STORAGE], /obj/item/armor_module/storage))
		return
	var/obj/item/armor_module/storage/armor_storage = attachments_by_slot[ATTACHMENT_SLOT_STORAGE]
	for(var/atom/item_in_pocket AS in armor_storage.contents)
		if(istype(item_in_pocket, /obj/item/weapon/combat_knife) || istype(item_in_pocket, /obj/item/attachable/bayonet) || istype(item_in_pocket, /obj/item/stack/throwing_knife))
			icon_state += "-knife"

/obj/item/clothing/shoes/marine/full
	starting_attachments = list(/obj/item/armor_module/storage/boot/full)

/obj/item/clothing/shoes/marine/brown
	name = "棕色陆战队作战靴"
	icon_state = "marine_brown"
	worn_icon_state = "marine_brown"

/obj/item/clothing/shoes/marine/brown/full
	starting_attachments = list(/obj/item/armor_module/storage/boot/full)

/obj/item/clothing/shoes/marine/pyro
	name = "阻燃作战靴"
	desc = "保护你免受火焰伤害，甚至还有一个附包可以放你的刀！"
	icon_state = "marine_armored"
	hard_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 100, ACID = 0)

/obj/item/clothing/shoes/marinechief
	name = "首席军官鞋"
	desc = "制作过程中仅牺牲了少量猴子、小猫和孤儿。"
	icon_state = "laceups"
	soft_armor = list(MELEE = 35, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 30, BIO = 20, FIRE = 20, ACID = 25)
	inventory_flags = NOSLIPPING
	siemens_coefficient = 0.6

/obj/item/clothing/shoes/marinechief/captain
	name = "舰长的鞋子"
	desc = "鞋底经过特殊设计，能更好地践踏脚下的目标。"

/obj/item/clothing/shoes/marinechief/som
	name = "军官靴"
	desc = "一双闪亮的靴子，通常出现在火星之子军官的脚上。"
	icon_state = "som_officer_boots"

/obj/item/clothing/shoes/marinechief/sa
	name = "空间特工鞋"
	desc = "空间特工穿着的鞋子。"

/obj/item/clothing/shoes/marine/pmc
	name = "擦亮的鞋子"
	desc = "时尚的巅峰之作，但这些看起来是用防护纤维编织的。"
	icon_state = "jackboots"
	worn_icon_state = "jackboots"
	armor_protection_flags = FEET
	soft_armor = list(MELEE = 30, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 30, BIO = 20, FIRE = 20, ACID = 15)
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE
	cold_protection_flags = FEET
	heat_protection_flags = FEET
	inventory_flags = NOSLIPPING
	siemens_coefficient = 0.6

/obj/item/clothing/shoes/marine/pmc/full
	starting_attachments = list(/obj/item/armor_module/storage/boot/full)

/obj/item/clothing/shoes/marine/pmc/elite_full
	starting_attachments = list(/obj/item/armor_module/storage/boot/pmc_knife)

/obj/item/clothing/shoes/marine/deathsquad
	name = "\improper PMC 突击队靴"
	desc = "一双重型装甲、耐酸液的靴子。"
	icon_state = "commando_boots"
	worn_icon_state = "commando_boots"
	permeability_coefficient = 0.01
	armor_protection_flags = FEET
	soft_armor = list(MELEE = 40, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 30, BIO = 20, FIRE = 20, ACID = 25)
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE
	cold_protection_flags = FEET
	heat_protection_flags = FEET
	siemens_coefficient = 0.2
	resistance_flags = UNACIDABLE
	starting_attachments = list(/obj/item/armor_module/storage/boot/full)

/*=========Imperium=========*/

/obj/item/clothing/shoes/marine/imperial
	name = "卫兵战斗靴"
	desc = "帝国卫队配发的靴子，和他们使用的其他装备一样，都是批量生产的。"
	//icon_state = ""
	soft_armor = list(MELEE = 30, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 30, BIO = 20, FIRE = 20, ACID = 25)


/obj/item/clothing/shoes/marine/som
	name = "\improper S11作战靴"
	desc = "这双鞋的起源可以追溯到古老的采矿殖民地。它们可不仅仅是为了走路而设计的。"
	icon_state = "som"
	worn_icon_state = "som"

/obj/item/clothing/shoes/marine/som/knife
	starting_attachments = list(/obj/item/armor_module/storage/boot/som_knife)

/obj/item/clothing/shoes/sectoid
	name = "灵能场"
	desc = "一片无形的能量场，它能保护穿戴者，但无法同时穿戴任何衣物。"
	icon = 'icons/effects/effects.dmi'
	icon_state = "shield-blue"
	item_flags = DELONDROP
	soft_armor = list(MELEE = 30, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 30, BIO = 20, FIRE = 20, ACID = 25)
	inventory_flags = NOSLIPPING

/obj/item/clothing/shoes/sectoid/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, SECTOID_TRAIT)

/obj/item/clothing/shoes/cowboy
	name = "结实的西部靴"
	desc = "这些靴子虽然款式老派，但坚固耐用，足以在任何星球上保护你的脚踝免受蛇类咬伤。它们无法存放物品，但脚跟处那些多余的装饰马刺增添了额外的时尚感。"
	icon_state = "cboots"
	worn_icon_state = "cboots"

/obj/item/clothing/shoes/marine/clf
	name = "\improper 前线作战靴"
	desc = "一双磨损严重的靴子，在外围殖民地很常见。"
	icon_state = "boots"
	worn_icon_state = "boots"

/obj/item/clothing/shoes/marine/vsd
	name = "\improper 作战靴"
	desc = "V.S.D.标准配发作战靴"
	icon_state = "boots"
	worn_icon_state = "boots"

/obj/item/clothing/shoes/marine/vsd/full
	starting_attachments = list(/obj/item/armor_module/storage/boot/full)

/obj/item/clothing/shoes/marine/clf/full
	starting_attachments = list(/obj/item/armor_module/storage/boot/full)

/obj/item/clothing/shoes/marine/icc
	name = "\improper 32型作战靴"
	desc = "一双坚固的工作靴。"
	icon_state = "icc"

/obj/item/clothing/shoes/marine/icc/knife
	starting_attachments = list(/obj/item/armor_module/storage/boot/full)

/obj/item/clothing/shoes/marine/icc/guard
	name = "\improper 33型战术鞋"
	desc = "一套坚固的战术靴。"
	icon_state = "icc_guard"

/obj/item/clothing/shoes/marine/icc/guard/knife
	starting_attachments = list(/obj/item/armor_module/storage/boot/full)

/obj/item/clothing/shoes/marine/tdf
	icon_state = "tdf"

/obj/item/clothing/shoes/marine/tdf/full
	starting_attachments = list(/obj/item/armor_module/storage/boot/full)

/obj/item/clothing/shoes/marine/srf //Basically SWAT shoes combined with galoshes.
	name = "作战靴"
	desc = "当你真的想火力全开时"
	icon_state = "swat"
	worn_icon_state = "swat"
	item_flags = SYNTH_RESTRICTED
	soft_armor = list(MELEE = 80, BULLET = 60, LASER = 50, ENERGY = 25, BOMB = 50, BIO = 10, FIRE = 25, ACID = 25)
	inventory_flags = NOSLIPPING
	siemens_coefficient = 0.6

	cold_protection_flags = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection_flags = FEET
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/marine/srf/full
	starting_attachments = list(/obj/item/armor_module/storage/boot/full)
