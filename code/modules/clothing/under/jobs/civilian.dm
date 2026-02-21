//Alphabetical order of civilian jobs.

/obj/item/clothing/under/rank

/obj/item/clothing/under/rank/bartender
	desc = "看起来它需要更多装饰。"
	name = "酒保制服"
	icon_state = "barman"
	adjustment_variants = list()

/obj/item/clothing/under/rank/captain //Alright, technically not a 'civilian' but its better then giving a .dm file for a single define.
	desc = "这是一件蓝色连体服，上面有一些金色标记，表示'舰长'军衔。"
	name = "舰长的连体服"
	icon_state = "captain"

/obj/item/clothing/under/rank/cargo
	name = "补给军官连体服"
	desc = "这是补给军官穿着的连体服。它经过特殊设计，可防止因处理文书工作而导致的背部损伤。"
	icon_state = "qm"
	worn_icon_state = "lb_suit"

/obj/item/clothing/under/rank/cargotech
	name = "补给技术员连体服"
	desc = "短裤！它们舒适又易穿！"
	icon_state = "cargotech"
	worn_icon_state = "lb_suit"
	armor_protection_flags = CHEST|GROIN|ARMS

/obj/item/clothing/under/rank/chaplain
	desc = "这是一件黑色的连体服，通常由宗教人士穿着。"
	name = "随军牧师的连体服"
	icon_state = "chaplain"
	worn_icon_state = "bl_suit"
	adjustment_variants = list()

/obj/item/clothing/under/rank/chef
	desc = "这是一条围裙，只授予最<b>硬核</b>的厨师。"
	name = "厨师制服"
	icon_state = "chef"

/obj/item/clothing/under/rank/chef/altchef
	name = "红色厨师服"
	desc = "更花哨的厨师服，虽然实用性稍差。"
	icon_state = "altchef"

/obj/item/clothing/under/rank/clown
	name = "小丑服"
	desc = "<i>'哔哔！'</i>"
	icon_state = "clown"
	adjustment_variants = list()

/obj/item/clothing/under/rank/clown/erp
	name = "加固小丑服"
	desc = "<b><i>'吼！'</i></b>"
	has_sensor = 2
	siemens_coefficient = 0.9
	attachments_allowed = list(/obj/item/armor_module/storage/uniform/webbing/erp)
	starting_attachments = list(/obj/item/armor_module/storage/uniform/webbing/erp)

/obj/item/clothing/under/rank/head_of_personnel
	desc = "这是一件供担任'人事主管'职务的人员穿着的连体服。"
	name = "人事主管连体服"
	icon_state = "hop"
	worn_icon_state = "b_suit"

/obj/item/clothing/under/rank/head_of_personnel_whimsy
	desc = "蓝色夹克配红色领带，还有相称的红色袖口！真时髦。穿上它让你感觉比你的职位头衔更重要。"
	name = "人事主管制服"
	icon_state = "hopwhimsy"
	adjustment_variants = list()

/obj/item/clothing/under/rank/hydroponics
	desc = "这是一套设计用于防护轻微植物相关危害的连体服。"
	name = "植物学家连体服"
	icon_state = "hydroponics"
	worn_icon_state = "g_suit"
	permeability_coefficient = 0.50

/obj/item/clothing/under/rank/internalaffairs
	desc = "地球政府内部事务调查员的朴素专业制服。衣领<i>完美无瑕</i>地浆烫过。"
	name = "内部事务制服"
	icon_state = "internalaffairs"
	adjustment_variants = list()

/obj/item/clothing/under/rank/janitor
	desc = "这是空间站清洁工的正式制服。它对生化危害有轻微的防护作用。"
	name = "清洁工连体服"
	icon_state = "janitor"

/obj/item/clothing/under/lawyer
	desc = "时髦的装束。"
	name = "律师西装"
	adjustment_variants = list()

/obj/item/clothing/under/lawyer/black
	name = "黑色律师西装"
	icon_state = "lawyer_black"

/obj/item/clothing/under/lawyer/female
	name = "黑色律师西装"
	icon_state = "black_suit_fem"

/obj/item/clothing/under/lawyer/red
	name = "红色律师西装"
	icon_state = "lawyer_red"

/obj/item/clothing/under/lawyer/blue
	name = "蓝色律师西装"
	icon_state = "lawyer_blue"

/obj/item/clothing/under/lawyer/bluesuit
	name = "蓝色制服"
	desc = "一套优雅的西装和领带"
	icon_state = "bluesuit"

/obj/item/clothing/under/lawyer/purpsuit
	name = "紫色西装"
	icon_state = "lawyer_purp"
	adjustment_variants = list()

/obj/item/clothing/under/lawyer/oldman
	name = "老式西装"
	desc = "经典绅士套装，内置背部支撑。"
	icon_state = "oldman"

/obj/item/clothing/under/librarian
	name = "实用防护服"
	desc = "这非常……实用。"
	icon_state = "red_suit"
	adjustment_variants = list()

/obj/item/clothing/under/mime
	name = "小丑服装"
	desc = "它不怎么鲜艳。"
	icon_state = "mime"
	adjustment_variants = list()

/obj/item/clothing/under/rank/miner
	desc = "这是一套利落的连体服，配有结实的工装裤。它非常脏。"
	name = "矿工连体服"
	icon_state = "miner"
