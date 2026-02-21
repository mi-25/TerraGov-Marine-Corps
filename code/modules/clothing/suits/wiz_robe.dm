/obj/item/clothing/head/wizard
	name = "巫师帽"
	desc = "一顶造型奇特的帽子，无疑属于真正的魔法使用者。"
	icon_state = "wizard"
	//Not given any special protective value since the magic robes are full-body protection --NEO
	siemens_coefficient = 0.8
	armor_protection_flags = NONE

/obj/item/clothing/head/wizard/red
	name = "红色巫师帽"
	desc = "外观奇特、红色的帽子，无疑属于一位真正的魔法使用者。"
	icon_state = "redwizard"
	siemens_coefficient = 0.8

/obj/item/clothing/head/wizard/fake
	name = "巫师帽"
	desc = "上面用亮片写着'巫师'二字。附带酷炫的胡须。"
	icon_state = "wizard-fake"
	armor_protection_flags = HEAD|FACE

/obj/item/clothing/head/wizard/marisa
	name = "女巫帽"
	desc = "外观奇特的帽子，让你想施放火球术。"
	icon_state = "marisa"
	siemens_coefficient = 0.8

/obj/item/clothing/head/wizard/magus
	name = "术士头盔"
	desc = "一顶神秘的头盔，散发着不祥的力量低鸣。"
	icon_state = "magus"
	worn_icon_state = "magus"
	siemens_coefficient = 0.8
	armor_protection_flags = HEAD|FACE|EYES

/obj/item/clothing/head/wizard/amp
	name = "灵能增幅器"
	desc = "荆棘王冠式心灵增幅器。看起来像是头冠与工业机器人交媾的产物。"
	icon_state = "amp"
	siemens_coefficient = 0.8

/obj/item/clothing/head/wizard/cap
	name = "绅士帽"
	desc = "一顶由最稀有丝线编织而成的方格灰色平顶帽。"
	icon_state = "gentcap"
	siemens_coefficient = 0.8

/obj/item/clothing/suit/wizrobe
	name = "法师长袍"
	desc = "一件华丽非凡、镶满宝石的长袍，仿佛散发着无穷力量。"
	icon_state = "wizard"
	worn_icon_state = "wizrobe"
	gas_transfer_coefficient = 0.01 // IT'S MAGICAL OKAY JEEZ +1 TO NOT DIE
	permeability_coefficient = 0.01
	soft_armor = list(MELEE = 30, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 20, BIO = 20, FIRE = 20, ACID = 20)
	allowed = list()
	inv_hide_flags = HIDEJUMPSUIT
	siemens_coefficient = 0.8

/obj/item/clothing/suit/wizrobe/red
	name = "红色巫师袍"
	desc = "一件华丽、红色、镶有宝石的长袍，似乎散发着力量。"
	icon_state = "redwizard"
	worn_icon_state = "redwizrobe"


/obj/item/clothing/suit/wizrobe/marisa
	name = "女巫长袍"
	desc = "魔法全看法术威力，ZE！"
	icon_state = "marisa"
	worn_icon_state = "marisarobe"

/obj/item/clothing/suit/wizrobe/magusblue
	name = "法师长袍"
	desc = "一套似乎散发着黑暗力量的装甲长袍"
	icon_state = "magusblue"
	worn_icon_state = "magusblue"
	armor_protection_flags = CHEST|GROIN|ARMS|HANDS|LEGS|FEET

/obj/item/clothing/suit/wizrobe/magusred
	name = "法师长袍"
	desc = "一套似乎散发着黑暗力量的装甲长袍"
	icon_state = "magusred"
	worn_icon_state = "magusred"
	armor_protection_flags = CHEST|GROIN|ARMS|HANDS|LEGS|FEET

/obj/item/clothing/suit/wizrobe/psypurple
	name = "紫色长袍"
	desc = "厚重的皇家紫色长袍，编织着灵能增幅器和怪异、球茎状的透镜。请勿机洗。"
	icon_state = "psyamp"
	worn_icon_state = "psyamp"

/obj/item/clothing/suit/storage/wizrobe/gentlecoat
	name = "绅士大衣"
	desc = "一件厚重的螺纹粗花呢灰色夹克。为另一种绅士准备。"
	icon_state = "gentlecoat"
	worn_icon_state = "gentlecoat"
	armor_protection_flags = CHEST|GROIN|ARMS
	inv_hide_flags = NONE

/obj/item/clothing/suit/wizrobe/fake
	name = "法师长袍"
	desc = "一件相当单调的蓝色长袍，意在模仿真正的巫师袍。"
	icon_state = "wizard-fake"
	worn_icon_state = "wizrobe"
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
	siemens_coefficient = 1

/obj/item/clothing/head/wizard/marisa/fake
	name = "女巫帽"
	desc = "外观奇特的帽子，让你想要投掷火球。"
	icon_state = "marisa"
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
	siemens_coefficient = 1

/obj/item/clothing/suit/wizrobe/marisa/fake
	name = "女巫长袍"
	desc = "魔法全在于法术威力，ZE！"
	icon_state = "marisa"
	worn_icon_state = "marisarobe"
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
	siemens_coefficient = 1

