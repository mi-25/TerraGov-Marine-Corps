/* Closets for specific jobs
* Contains:
*		Bartender
*		Janitor
*		Lawyer
*/

/*
* Bartender
*/
/obj/structure/closet/gmcloset
	name = "正式衣柜"
	desc = "这是一个存放正装的储物单元。"
	icon_state = "black"
	icon_closed = "black"

/obj/structure/closet/gmcloset/PopulateContents()
	new /obj/item/clothing/head/that(src)
	new /obj/item/clothing/head/that(src)
	new /obj/item/clothing/head/hairflower
	new /obj/item/clothing/under/sl_suit(src)
	new /obj/item/clothing/under/sl_suit(src)
	new /obj/item/clothing/under/rank/bartender(src)
	new /obj/item/clothing/under/rank/bartender(src)
	new /obj/item/clothing/under/dress/dress_saloon
	new /obj/item/clothing/suit/wcoat(src)
	new /obj/item/clothing/suit/wcoat(src)
	new /obj/item/clothing/shoes/black(src)
	new /obj/item/clothing/shoes/black(src)

/*
* Janitor
*/
/obj/structure/closet/jcloset
	name = "保洁储物间"
	desc = "这是一个用于存放清洁工服装和装备的储物单元。"
	icon_state = "mixed"
	icon_closed = "mixed"

/obj/structure/closet/jcloset/PopulateContents()
	new /obj/item/clothing/under/rank/janitor(src)
	new /obj/item/clothing/gloves/black(src)
	new /obj/item/clothing/head/soft/purple(src)
	new /obj/item/clothing/head/beret/jan(src)
	new /obj/item/flashlight(src)
	new /obj/item/tool/wet_sign(src)
	new /obj/item/tool/wet_sign(src)
	new /obj/item/tool/wet_sign(src)
	new /obj/item/tool/wet_sign(src)
	new /obj/item/lightreplacer(src)
	new /obj/item/storage/bag/trash(src)
	new /obj/item/clothing/shoes/galoshes(src)

/*
* Lawyer
*/
/obj/structure/closet/lawcloset
	name = "法律储物柜"
	desc = "这是一个用于存放法庭服饰和物品的存储单元。"
	icon_state = "blue"
	icon_closed = "blue"

/obj/structure/closet/lawcloset/PopulateContents()
	new /obj/item/clothing/under/lawyer/female(src)
	new /obj/item/clothing/under/lawyer/black(src)
	new /obj/item/clothing/under/lawyer/red(src)
	new /obj/item/clothing/under/lawyer/bluesuit(src)
	new /obj/item/clothing/suit/storage/lawyer/bluejacket(src)
	new /obj/item/clothing/under/lawyer/purpsuit(src)
	new /obj/item/clothing/suit/storage/lawyer/purpjacket(src)
	new /obj/item/clothing/shoes/brown(src)
	new /obj/item/clothing/shoes/black(src)
