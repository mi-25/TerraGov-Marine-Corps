/obj/item/clothing/under/pj/red
	name = "红色睡衣"
	desc = "睡衣。"
	icon_state = "red_pyjamas"
	worn_icon_state = "w_suit"

/obj/item/clothing/under/pj/blue
	name = "蓝色睡衣"
	desc = "睡衣。"
	icon_state = "blue_pyjamas"
	worn_icon_state = "w_suit"

/obj/item/clothing/under/captain_fly
	name = "舰长叛变制服"
	desc = "为了那个不在乎的人，因为他依然自由。"
	icon_state = "captain_fly"

/obj/item/clothing/under/scratch
	name = "白色西装"
	desc = "一套白色西装，适合一位出色的主人"
	icon_state = "scratch"

/obj/item/clothing/under/sl_suit
	desc = "这是一套看起来非常朴素的西装。"
	name = "阿米什套装"
	icon_state = "sl_suit"

/obj/item/clothing/under/waiter
	name = "侍者制服"
	desc = "这是一件非常智能的制服，有一个专门放小费的特殊口袋。"
	icon_state = "waiter"

/obj/item/clothing/under/rank/prisoner
	name = "囚服"
	desc = "这是标准化的纳米传讯囚犯服装。其服装传感器被锁定在'完全开启'状态。"
	icon_state = "prisoner"
	worn_icon_state = "prisoner"
	has_sensor = LOCKED_SENSORS
	sensor_mode = SENSOR_COORDS

/obj/item/clothing/under/sexyclown
	name = "性感小丑服"
	desc = "这让你看起来像个小丑！"
	icon_state = "sexyclown"
	worn_icon_state = "sexyclown"
	armor_protection_flags = CHEST|GROIN

/obj/item/clothing/under/rank/vice
	name = "副官连体服"
	desc = "这是标准配发的帅哥制服，全息影像上常见的那种。"
	icon_state = "vice"
	worn_icon_state = "gy_suit"
	adjustment_variants = list()

/obj/item/clothing/under/rank/centcom_officer
	desc = "这是中央司令部军官穿着的连体服。"
	name = "\improper 中央司令部军官连体服"
	icon_state = "officer"
	worn_icon_state = "g_suit"
	adjustment_variants = list()

/obj/item/clothing/under/rank/centcom_commander
	desc = "这是中央司令部最高阶级指挥官穿着的连体服。"
	name = "\improper 中央司令部军官连体服"
	icon_state = "centcom"
	worn_icon_state = "dg_suit"
	adjustment_variants = list()

/obj/item/clothing/under/rank/centcom_commander/sa
	desc = "这是空间特工穿着的连体服。"
	name = "\improper 空间特工连体服"
	has_sensor = 0
	sensor_mode = 0
	siemens_coefficient = 0

/obj/item/clothing/under/ert
	name = "ERT战术制服"
	desc = "一件黑色短袖制服，搭配灰色数码迷彩工装裤。看起来非常战术化。"
	icon_state = "ert_uniform"
	worn_icon_state = "bl_suit"

/obj/item/clothing/under/space
	name = "\improper NASA连体服"
	desc = "上面印有NASA标志，采用太空防护材料制成。"
	icon_state = "black"
	worn_icon_state = "bl_suit"
	w_class = WEIGHT_CLASS_BULKY//bulky item
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection_flags = CHEST|GROIN|LEGS|ARMS //Needs gloves and shoes with cold protection to be fully protected.
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/acj
	name = "行政赛博连体服"
	icon_state = "syndicate"
	worn_icon_state = "bl_suit"
	desc = "这是一套用于行政职责的赛博格增强连体服。"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	soft_armor = list(MELEE = 100, BULLET = 100, LASER = 100, ENERGY = 100, BOMB = 100, BIO = 100, FIRE = 100, ACID = 100)
	cold_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0

/obj/item/clothing/under/owl
	name = "猫头鹰制服"
	desc = "一件带有猫头鹰翅膀的连体服。逼真的猫头鹰羽毛！咕咕！"
	icon_state = "owl"

/obj/item/clothing/under/johnny
	name = "johnny~~ 连体服"
	desc = "约翰尼~~"
	icon_state = "johnny"

/obj/item/clothing/under/rainbow
	name = "彩虹"
	desc = "彩虹"
	icon_state = "rainbow"

/obj/item/clothing/under/cloud
	name = "云"
	desc = "云"
	icon_state = "cloud"

/obj/item/clothing/under/psysuit
	name = "深色连体服"
	desc = "一件厚重的灰色内衬服，表面布满能量管线。穿着感觉有点像置身于一场雷暴之中。"
	icon_state = "psysuit"
	armor_protection_flags = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/under/gentlesuit
	name = "绅士西装"
	desc = "一件丝绸黑衬衫，配白色领带，搭配同色系灰色马甲和西裤。感觉相当得体。"
	icon_state = "gentlesuit"

/obj/item/clothing/under/suit_jacket
	name = "黑色西装"
	desc = "一套黑色西装和红色领带。非常正式。"
	icon_state = "black_suit"
	worn_icon_state = "bl_suit"

/obj/item/clothing/under/suit_jacket/detective
	icon_state = "detective"

/obj/item/clothing/under/suit_jacket/detective/alt
	icon_state = "greydet"

/obj/item/clothing/under/suit_jacket/really_black
	name = "副官制服"
	desc = "一套正式的黑色西装和红色领带，专为空间站精英设计。"
	icon_state = "really_black_suit"
	worn_icon_state = "bl_suit"

/obj/item/clothing/under/suit_jacket/female
	name = "副官制服"
	desc = "一套正式的女士裤装，专为空间站精英设计。"
	icon_state = "black_suit_fem"

/obj/item/clothing/under/suit_jacket/red
	name = "红色防护服"
	desc = "一套红色西装配蓝色领带。略显正式。"
	icon_state = "red_suit"
	worn_icon_state = "r_suit"

/obj/item/clothing/under/overalls
	name = "劳工连体服"
	desc = "一套耐用的工作服，助您完成任务。"
	icon_state = "overalls"
	worn_icon_state = "lb_suit"

/obj/item/clothing/under/pirate
	name = "海盗装束"
	desc = "哟呵。"
	icon_state = "pirate"
	armor_protection_flags = CHEST|GROIN|LEGS

/obj/item/clothing/under/soviet
	name = "苏联制服"
	desc = "为了祖国！"
	icon_state = "soviet"

/obj/item/clothing/under/redcoat
	name = "红衫军制服"
	desc = "看起来有些年头了。"
	icon_state = "redcoat"

/obj/item/clothing/under/kilt
	name = "苏格兰裙"
	desc = "包含鞋子和格子纹"
	icon_state = "kilt"
	armor_protection_flags = CHEST|GROIN|FEET

/obj/item/clothing/under/sexymime
	name = "性感小丑装"
	desc = "唯一一次你不想欣赏别人胸围的时候。"
	icon_state = "sexymime"
	armor_protection_flags = CHEST|GROIN

/obj/item/clothing/under/gladiator
	name = "角斗士制服"
	desc = "难道这不够精彩吗？你们来此不就是为了这个？"
	icon_state = "gladiator"
	armor_protection_flags = GROIN

//dress
/obj/item/clothing/under/dress/
	armor_protection_flags = CHEST|GROIN

/obj/item/clothing/under/dress/dress_fire
	name = "火焰礼服"
	desc = "一件带有蓝色火焰图案的黑色小礼服。"
	icon_state = "dress_fire"

/obj/item/clothing/under/dress/dress_green
	name = "绿色连衣裙"
	desc = "一件简洁、紧身的绿色连衣裙。"
	icon_state = "dress_green"

/obj/item/clothing/under/dress/dress_orange
	name = "橙色连衣裙"
	desc = "一件精致的橙色长裙，适合喜欢秀腿的人。"
	icon_state = "dress_orange"

/obj/item/clothing/under/dress/dress_pink
	name = "粉色连衣裙"
	desc = "一件简约合身的粉色连衣裙。"
	icon_state = "dress_pink"

/obj/item/clothing/under/dress/dress_yellow
	name = "黄色连衣裙"
	desc = "一件俏皮的黄色小裙子。"
	icon_state = "dress_yellow"

/obj/item/clothing/under/dress/dress_saloon
	name = "沙龙女郎裙"
	desc = "一件老西部风格的礼服裙，适合爱喝酒的姑娘。"
	icon_state = "dress_saloon"


/obj/item/clothing/under/dress/dress_cap
	name = "舰长礼服"
	desc = "时尚女装，专为注重风格的舰长设计。"
	icon_state = "dress_cap"
	armor_protection_flags = CHEST|GROIN|ARMS

/obj/item/clothing/under/dress/dress_hop
	name = "人事主管礼服"
	desc = "注重时尚风格的人事主管的女性着装。"
	icon_state = "dress_hop"
	armor_protection_flags = CHEST|GROIN|ARMS

/obj/item/clothing/under/dress/dress_hr
	name = "人力资源主管制服"
	desc = "专为爱管闲事的人力资源总监准备的上级阶级。"
	icon_state = "huresource"
	armor_protection_flags = CHEST|GROIN|ARMS

/obj/item/clothing/under/dress/plaid_blue
	name = "蓝色格子裙"
	desc = "一条时髦的蓝色短裙配白色衬衫。"
	icon_state = "plaid_blue"

/obj/item/clothing/under/dress/plaid_red
	name = "红色格子裙"
	desc = "一条时髦的红色短裙配白色衬衫。"
	icon_state = "plaid_red"

/obj/item/clothing/under/dress/plaid_purple
	name = "蓝色紫色短裙"
	desc = "一条时髦的紫色短裙配白色衬衫。"
	icon_state = "plaid_purple"

//wedding stuff
/obj/item/clothing/under/wedding/
	armor_protection_flags = CHEST|GROIN|LEGS

/obj/item/clothing/under/wedding/bride_orange
	name = "橙色婚纱"
	desc = "一件宽大蓬松的橙色连衣裙。"
	icon_state = "bride_orange"
	inv_hide_flags = HIDESHOES

/obj/item/clothing/under/wedding/bride_purple
	name = "紫色婚纱"
	desc = "一件宽大蓬松的紫色连衣裙。"
	icon_state = "bride_purple"
	inv_hide_flags = HIDESHOES

/obj/item/clothing/under/wedding/bride_blue
	name = "蓝色婚纱"
	desc = "一件宽大蓬松的蓝色连衣裙。"
	icon_state = "bride_blue"
	inv_hide_flags = HIDESHOES

/obj/item/clothing/under/wedding/bride_red
	name = "红色婚纱"
	desc = "一件宽大蓬松的红色连衣裙。"
	icon_state = "bride_red"
	inv_hide_flags = HIDESHOES

/obj/item/clothing/under/wedding/bride_white
	name = "丝绸婚纱"
	desc = "一件由最上等丝绸制成的白色婚纱。"
	icon_state = "bride_white"
	inv_hide_flags = HIDESHOES
	armor_protection_flags = CHEST|GROIN

/obj/item/clothing/under/sundress
	name = "太阳裙"
	desc = "让你想在雏菊田里嬉戏。"
	icon_state = "sundress"
	armor_protection_flags = CHEST|GROIN

/obj/item/clothing/under/captainformal
	name = "舰长正式制服"
	desc = "舰长的礼服，用于特殊场合。"
	icon_state = "captain_formal"
	worn_icon_state = "by_suit"

/obj/item/clothing/under/hosformalmale
	name = "安保主管的正式制服"
	desc = "一名男性安保主管的礼服，适用于特殊场合。"
	icon_state = "hos_formal_male"
	worn_icon_state = "r_suit"

/obj/item/clothing/under/hosformalfem
	name = "安保主管的正式制服"
	desc = "一套女性安保主管的礼服，用于特殊场合。"
	icon_state = "hos_formal_fem"
	worn_icon_state = "r_suit"

/obj/item/clothing/under/assistantformal
	name = "助理的正式制服"
	desc = "一套助理的正式礼服。为何助理需要正式礼服，至今仍是个谜。"
	icon_state = "assistant_formal"
	worn_icon_state = "gy_suit"

/obj/item/clothing/under/suit_jacket/charcoal
	name = "炭黑套装"
	desc = "一套炭灰色西装配红色领带。非常专业。"
	icon_state = "charcoal_suit"

/obj/item/clothing/under/suit_jacket/navy
	name = "海军制服"
	desc = "一套海军制服和红色领带，专为空间站精英设计。"
	icon_state = "navy_suit"

/obj/item/clothing/under/suit_jacket/burgundy
	name = "勃艮第西装"
	desc = "一套酒红色西装搭配黑色领带。略显正式。"
	icon_state = "burgundy_suit"

/obj/item/clothing/under/suit_jacket/checkered
	name = "方格西装"
	desc = "你这身行头可真不错啊。要是出点什么事儿，那多可惜，对吧？"
	icon_state = "checkered_suit"

/obj/item/clothing/under/suit_jacket/tan
	name = "防化服"
	desc = "一套米色西装搭配黄色领带。时髦，但休闲。"
	icon_state = "tan_suit"

/obj/item/clothing/under/marine/serviceoveralls
	name = "工装服"
	desc = "一副劳动者的形象。虽然你可能没在干活。"
	icon_state = "mechanic_s"

/obj/item/clothing/under/spec_operative
	name = "特种作战制服"
	desc = "由某未知企业为高风险任务制造，采用多层未知纳米纤维制成，虽轻便却能贴合穿戴者体型并硬化提供防护。"
	icon_state = "pilot_spec"
	worn_icon_state = "pilot_spec"
	resistance_flags = UNACIDABLE
	armor_protection_flags = CHEST|GROIN|LEGS|ARMS
	soft_armor = list(MELEE = 70, BULLET = 70, LASER = 70, ENERGY = 70, BOMB = 70, BIO = 70, FIRE = 70, ACID = 70)
	cold_protection_flags = CHEST|GROIN|LEGS|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0
	slowdown= -1
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01

/obj/item/clothing/under/techpriest
	name = "技术神甫长袍"
	desc = "赞美万机之神！"
	icon_state = "tp_bodyrobes"
	worn_icon_state = "tp_bodyrobes"
	armor_protection_flags = CHEST|GROIN|LEGS|ARMS

