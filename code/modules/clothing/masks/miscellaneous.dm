/obj/item/clothing/mask/muzzle
	name = "枪口"
	desc = "阻止那可怕的噪音。"
	icon_state = "muzzle"
	worn_icon_state = "muzzle"
	inventory_flags = COVERMOUTH
	armor_protection_flags = NONE
	w_class = WEIGHT_CLASS_SMALL
	gas_transfer_coefficient = 0.90

/obj/item/clothing/mask/surgical
	name = "无菌口罩"
	desc = "一种无菌口罩，旨在帮助防止疾病传播。"
	icon_state = "sterile"
	worn_icon_state = "sterile"
	w_class = WEIGHT_CLASS_SMALL
	inventory_flags = COVERMOUTH
	armor_protection_flags = NONE
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.01
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 25, FIRE = 0, ACID = 0)

/obj/item/clothing/mask/fakemoustache
	name = "假胡子"
	desc = "警告：胡子是假的。"
	icon_state = "fake-moustache"
	inv_hide_flags = HIDEFACE
	armor_protection_flags = NONE

/obj/item/clothing/mask/snorkel
	name = "呼吸管"
	desc = "为游泳大师。"
	icon_state = "snorkel"
	inv_hide_flags = HIDEFACE
	armor_protection_flags = NONE

//scarves (fit in in mask slot)

/obj/item/clothing/mask/bluescarf
	name = "蓝色颈巾"
	desc = "一条蓝色围巾。"
	icon_state = "blueneckscarf"
	worn_icon_state = "blueneckscarf"
	inventory_flags = COVERMOUTH
	w_class = WEIGHT_CLASS_SMALL
	gas_transfer_coefficient = 0.90

/obj/item/clothing/mask/redscarf
	name = "红围巾"
	desc = "一条红白格纹的颈巾。"
	icon_state = "redwhite_scarf"
	worn_icon_state = "redwhite_scarf"
	inventory_flags = COVERMOUTH
	w_class = WEIGHT_CLASS_SMALL
	gas_transfer_coefficient = 0.90

/obj/item/clothing/mask/greenscarf
	name = "绿色围巾"
	desc = "一条绿色围巾。"
	icon_state = "green_scarf"
	worn_icon_state = "green_scarf"
	inventory_flags = COVERMOUTH
	w_class = WEIGHT_CLASS_SMALL
	gas_transfer_coefficient = 0.90

/obj/item/clothing/mask/ninjascarf
	name = "忍者面罩"
	desc = "一条隐秘的黑色围巾。"
	icon_state = "ninja_scarf"
	worn_icon_state = "ninja_scarf"
	inventory_flags = COVERMOUTH
	w_class = WEIGHT_CLASS_SMALL
	gas_transfer_coefficient = 0.90
	siemens_coefficient = 0

/obj/item/clothing/mask/pig
	name = "猪头面具"
	desc = "一个橡胶猪面具。"
	icon_state = "pig"
	worn_icon_state = "pig"
	inventory_flags = COVERMOUTH|COVEREYES
	inv_hide_flags = HIDEFACE|HIDEALLHAIR|HIDEEYES|HIDEEARS
	w_class = WEIGHT_CLASS_SMALL
	siemens_coefficient = 0.9
	armor_protection_flags = HEAD|FACE|EYES

/obj/item/clothing/mask/horsehead
	name = "马头面具"
	desc = "一个由软质乙烯基和乳胶制成的面具，形似马头。"
	icon_state = "horsehead"
	worn_icon_state = "horsehead"
	inventory_flags = COVERMOUTH|COVEREYES
	inv_hide_flags = HIDEFACE|HIDEALLHAIR|HIDEEYES|HIDEEARS
	armor_protection_flags = HEAD|FACE|EYES
	w_class = WEIGHT_CLASS_SMALL
	var/voicechange = 0
	siemens_coefficient = 0.9


/obj/item/clothing/mask/balaclava
	name = "巴拉克拉瓦头套"
	desc = "好多钱"
	icon_state = "balaclava"
	worn_icon_state = "balaclava"
	inv_hide_flags = HIDEFACE|HIDEALLHAIR
	armor_protection_flags = FACE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/mask/balaclava/tactical
	name = "绿色巴拉克拉瓦头套"
	desc = "专为隐藏身份并保持面部舒适温暖而设计。"
	icon_state = "swatclava"
	worn_icon_state = "balaclava"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/mask/luchador
	name = "摔角手面具"
	desc = "坚韧战士的着装，翱翔高空，击败敌人！"
	icon_state = "luchag"
	worn_icon_state = "luchag"
	inv_hide_flags = HIDEFACE|HIDEALLHAIR
	cold_protection_flags = HEAD
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	armor_protection_flags = HEAD|FACE
	inventory_flags = COVERMOUTH
	w_class = WEIGHT_CLASS_SMALL
	siemens_coefficient = 3

/obj/item/clothing/mask/luchador/tecnicos
	name = "技术员面具"
	desc = "为坚守正义、英勇作战的强悍战士所佩戴。"
	icon_state = "luchador"
	worn_icon_state = "luchador"

/obj/item/clothing/mask/luchador/rudos
	name = "鲁多斯面具"
	desc = "为那些不惜一切代价也要取胜的顽强战士所穿戴。"
	icon_state = "luchar"
	worn_icon_state = "luchar"
