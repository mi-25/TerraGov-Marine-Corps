/*
* Contains:
*		Security
*		Detective
*		Head of Security
*/

/*
* Security
*/
/obj/item/clothing/under/rank/warden
	name = "安保服"
	desc = "一套配有纳米传讯皮带扣的军官正式安保制服。"
	icon_state = "wardenred"
	worn_icon_state = "r_suit"
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/warden/white
	name = "白色安保服"
	desc = "一件来自多年前的正式遗物，那时纳米传讯还没决定把制服染红比洗掉血迹更便宜。"
	icon_state = "wardenwhite"
	worn_icon_state = "wardenwhite"

/obj/item/clothing/under/rank/security
	name = "安全军官连体服"
	desc = "它采用比标准连体服更坚固的材料制成，以提供可靠的防护。"
	icon_state = "securityred"
	worn_icon_state = "r_suit"
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/security/white
	name = "白色安保连体服"
	desc = "一件来自多年前的战术遗物，那时纳米传讯还没决定把制服染红比洗掉血迹更便宜。"
	icon_state = "securitywhite"
	worn_icon_state = "securitywhite"

/obj/item/clothing/under/rank/dispatch
	name = "调度员制服"
	desc = "一件缝有安保徽章的衬衫和卡其裤。"
	icon_state = "dispatch"
	armor_protection_flags = CHEST|GROIN|LEGS
	siemens_coefficient = 0.9
	adjustment_variants = list()

/obj/item/clothing/under/rank/security2
	name = "安保人员制服"
	desc = "它采用更坚固的材料制成，以提供可靠的防护。"
	icon_state = "redshirt2"
	worn_icon_state = "r_suit"
	siemens_coefficient = 0.9
	adjustment_variants = list()

/obj/item/clothing/under/rank/security/corp
	icon_state = "sec_corporate"
	adjustment_variants = list()

/obj/item/clothing/under/rank/warden/corp
	icon_state = "warden_corporate"
	adjustment_variants = list()

/obj/item/clothing/under/tactical
	name = "战术连体服"
	desc = "它采用比标准连体服更坚固的材料制成，以提供可靠的防护。"
	icon_state = "swatunder"
	siemens_coefficient = 0.9

/*
* Detective
*/
/obj/item/clothing/under/rank/det
	name = "磨损严重的防护服"
	desc = "佩戴此物者，绝非等闲之辈。"
	icon_state = "detective"
	worn_icon_state = "det"
	siemens_coefficient = 0.9
	adjustment_variants = list()

/obj/item/clothing/under/rank/det/black
	icon_state = "detective2"
	adjustment_variants = list()

/obj/item/clothing/under/rank/det/slob
	icon_state = "polsuit"
	adjustment_variants = list(
		"Down" = "_d",
	)

/obj/item/clothing/under/rank/det/grey
	name = "黑色西装"
	desc = "一位硬汉派私家侦探的灰色西装，配有领带夹。"
	icon_state = "greydet"
	worn_icon_state = "greydet"
	adjustment_variants = list()

/*
* Head of Security
*/
/obj/item/clothing/under/rank/head_of_security
	desc = "这是一套为少数有决心晋升至'安保主管'职位者所配备的连体服。它带有额外的护甲，以保护穿着者。"
	name = "安保主管连体服"
	icon_state = "hosred"
	worn_icon_state = "r_suit"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/head_of_security/white
	name = "安保主管的白色连体服"
	desc = "有老成持重者，有勇猛无畏者，但鲜有既老成又勇猛之人。"
	icon_state = "hoswhite"
	worn_icon_state = "hoswhite"

/obj/item/clothing/under/rank/head_of_security/alt
	name = "安保主管的高领毛衣"
	desc = "标准安保连体服的时尚替代品，配有战术长裤。"
	icon_state = "hosalt"
	worn_icon_state = "hosalt"

/obj/item/clothing/under/rank/head_of_security/corp
	icon_state = "hos_corporate"
	adjustment_variants = list()

//Jensen cosplay gear
/obj/item/clothing/under/rank/head_of_security/jensen
	desc = "你从未要求过如此时髦的东西。"
	name = "安保主管连体服"
	icon_state = "jensen"
	worn_icon_state = "jensen"
	siemens_coefficient = 0.6
	adjustment_variants = list()

/*
*Blart Uniform
*/
/obj/item/clothing/under/rank/security/mallcop
	name = "纳米传讯商场保安制服"
	desc = "无线电和徽章是缝上去的，真是劣质的仿冒品。赛格威不包含在内。"
	icon_state = "mallcop"
	worn_icon_state = "mallcop"

/*
* Navy uniforms
*/

/obj/item/clothing/under/rank/security/navyblue
	name = "安保人员制服"
	desc = "最新款的安保制服。"
	icon_state = "officerblueclothes"
	worn_icon_state = "officerblueclothes"

/obj/item/clothing/under/rank/head_of_security/navyblue
	desc = "这身制服上的徽章告诉你，这身制服属于安保主管。"
	name = "安保主管制服"
	icon_state = "hosblueclothes"
	worn_icon_state = "hosblueclothes"

/obj/item/clothing/under/rank/warden/navyblue
	desc = "这身制服上的徽章告诉你，这身制服属于典狱长。"
	name = "典狱长制服"
	icon_state = "wardenblueclothes"
	worn_icon_state = "wardenblueclothes"
