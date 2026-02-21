


//marine gloves

/obj/item/clothing/gloves/marine
	name = "陆战队作战手套"
	desc = "标准配发的陆战队战术手套。上面写着：'由陆战队黑寡妇协会编织'。"
	icon_state = "gloves_marine"
	siemens_coefficient = 0.6
	permeability_coefficient = 0.05
	cold_protection_flags = HANDS
	heat_protection_flags = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE
	armor_protection_flags = HANDS
	soft_armor = list(MELEE = 25, BULLET = 15, LASER = 10, ENERGY = 15, BOMB = 15, BIO = 5, FIRE = 15, ACID = 15)

/obj/item/clothing/gloves/marine/black
	name = "黑色陆战队作战手套"
	desc = "标准配发的陆战队战术手套，不过是黑色的！上面写着：'由陆战队黑寡妇协会编织'。"
	icon_state = "gloves_marine_black"
	worn_icon_state = "black"

/obj/item/clothing/gloves/marine/fingerless
	name = "陆战队无指战斗手套"
	desc = "标准配发的陆战队战术手套，但这次是露指款！上面写着：'由陆战队黑寡妇协会编织'。"
	icon_state = "gloves_marine_fingerless"
	worn_icon_state = "fingerless"

/obj/item/clothing/gloves/marine/hyperscale
	name = "\improper 8E变色龙TGMC战斗手套"
	desc = "标准配发的陆战队战术手套，但可用面部迷彩着色！上面写着：'由陆战队黑寡妇协会编织'。"
	icon_state = "hyperscale_glove_inhand"
	worn_icon_state = "hyperscale_glove_mob"
	worn_icon_list = list(slot_gloves = /datum/greyscale_config/marine_uniform)
	greyscale_colors = ARMOR_PALETTE_BLACK
	greyscale_config = /datum/greyscale_config/marine_uniform
	colorable_colors = LEGACY_ARMOR_PALETTES_LIST
	colorable_allowed = ICON_STATE_VARIANTS_ALLOWED|PRESET_COLORS_ALLOWED


/obj/item/clothing/gloves/marine/hyperscale/color_item(obj/item/facepaint/paint, mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human = user
	human.regenerate_icons()

/obj/item/clothing/gloves/marine/insulated
	name = "绝缘陆战手套"
	desc = "绝缘陆战队战术手套，可防护电击。"
	icon_state = "gloves_marine_insulated"
	siemens_coefficient = 0

/obj/item/clothing/gloves/marine/officer
	name = "军官手套"
	desc = "闪亮夺目，同时还能绝缘电击。看起来价格不菲。"
	icon_state = "black"
	siemens_coefficient = 0

/obj/item/clothing/gloves/marine/officer/chief
	name = "首席军官手套"
	desc = "血痂附着在它微微凹陷的金属铆钉上。"

/obj/item/clothing/gloves/marine/officer/chief/sa
	name = "空间特工手套"
	desc = "空间特工佩戴的手套。"
	siemens_coefficient = 0
	permeability_coefficient = 0

/obj/item/clothing/gloves/marine/techofficer
	name = "技术军官手套"
	desc = "无菌且绝缘！为什么不是每个人都配发这个？"
	icon_state = "yellow"
	siemens_coefficient = 0
	permeability_coefficient = 0.01

/obj/item/clothing/gloves/marine/techofficer/captain
	name = "舰长手套"
	desc = "你可能喜欢这双手套，但{{THEY}}认为你不配拥有它们。"
	icon_state = "captain"

/obj/item/clothing/gloves/marine/specialist
	name = "\improper B18防御型护手"
	desc = "一副重型装甲手套。"
	icon_state = "armored"
	item_flags = SYNTH_RESTRICTED
	soft_armor = list(MELEE = 35, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 25, BIO = 15, FIRE = 15, ACID = 20)
	resistance_flags = UNACIDABLE

/obj/item/clothing/gloves/marine/specialist/tdf
	icon_state = "armored_tdf"

/obj/item/clothing/gloves/marine/veteran/pmc
	name = "防刺手套"
	desc = "特种作战中使用的装甲手套。它们还具有绝缘性能，可抵御电击。"
	icon_state = "black"
	siemens_coefficient = 0
	item_flags = SYNTH_RESTRICTED
	soft_armor = list(MELEE = 30, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 30, BIO = 20, FIRE = 20, ACID = 15)

/obj/item/clothing/gloves/marine/veteran/pmc_elite
	name = "PMC精英手套"
	desc = "一副带有纯白色护板的黑色手套，由纳米传讯PMC承包商使用。"
	icon_state = "armored_pmc"
	siemens_coefficient = 0
	item_flags = SYNTH_RESTRICTED
	soft_armor = list(MELEE = 30, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 30, BIO = 20, FIRE = 20, ACID = 20)

/obj/item/clothing/gloves/marine/veteran/pmc/commando
	name = "\improper PMC 突击队员手套"
	desc = "一副重型装甲、绝缘、耐酸液的手套。"
	icon_state = "death_squad"
	soft_armor = list(MELEE = 40, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 30, BIO = 20, FIRE = 20, ACID = 25)
	resistance_flags = UNACIDABLE

/obj/item/clothing/gloves/marine/som
	name = "\improper 火星之子手套"
	desc = "这副手套的起源可以追溯到古老的采矿殖民地，看起来相当坚固。"
	icon_state = "som"

/obj/item/clothing/gloves/marine/som/insulated
	name = "\improper 绝缘火星之子手套"
	desc = "源自古老采矿殖民地的防护手套。这些手套似乎内置了绝缘层。"
	siemens_coefficient = 0

/obj/item/clothing/gloves/marine/som/veteran
	name = "\improper 火星之子老兵手套"
	desc = "源自古老采矿殖民地的防护手套。这些看起来比普通款更坚固。"
	icon_state = "som_veteran"
	soft_armor = list(MELEE = 30, BULLET = 20, LASER = 15, ENERGY = 20, BOMB = 15, BIO = 5, FIRE = 15, ACID = 15)

/obj/item/clothing/gloves/marine/som/officer
	name = "\improper 火星之子手套"
	desc = "火星之子军官常佩戴的黑色手套。"
	icon_state = "som_officer_gloves"

/obj/item/clothing/gloves/marine/icc
	name = "\improper ICC手套"
	desc = "外观坚固的工作手套。"
	icon_state = "icc"

/obj/item/clothing/gloves/marine/icc/insulated
	name = "\improper ICC绝缘手套"
	desc = "外观坚固的工作手套。这些手套似乎带有绝缘层，能防止电击。"
	siemens_coefficient = 0

/obj/item/clothing/gloves/marine/icc/guard
	name = "\improper ICCGF手套"
	desc = "外观坚固的战术手套。"
	icon_state = "icc_guard"
	soft_armor = list(MELEE = 30, BULLET = 20, LASER = 15, ENERGY = 20, BOMB = 15, BIO = 5, FIRE = 15, ACID = 15)

/obj/item/clothing/gloves/marine/commissar
	name = "\improper 政委手套"
	desc = "帝国军政委佩戴的手套，以免他们双手沾染部下的鲜血。"
	icon_state = "red"
	soft_armor = list(MELEE = 35, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 15, BIO = 10, FIRE = 20, ACID = 20)

/obj/item/clothing/gloves/marine/tdf
	icon_state = "tdf"
