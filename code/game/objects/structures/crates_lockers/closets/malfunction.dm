
/obj/structure/closet/malf/suits
	desc = "这是一个作战装备储存单元。"
	icon_state = "syndicate"
	icon_closed = "syndicate"
	icon_opened = "syndicateopen"

/obj/structure/closet/malf/suits/PopulateContents()
	new /obj/item/tank/jetpack/void(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/clothing/head/helmet/space/tgmc(src)
	new /obj/item/clothing/suit/space/tgmc(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/cell(src)
	new /obj/item/tool/multitool(src)
