/*****************************Coin********************************/

/obj/item/coin
	icon = 'icons/obj/items/items.dmi'
	name = "硬币"
	icon_state = "coin"
	atom_flags = CONDUCT
	w_class = WEIGHT_CLASS_TINY
	var/string_attached
	var/sides = 2

/obj/item/coin/Initialize(mapload)
	. = ..()
	pixel_x = rand(0,16)-8
	pixel_y = rand(0,8)-8

/obj/item/coin/gold
	name = "金币"
	icon_state = "coin_gold"

/obj/item/coin/silver
	name = "银币"
	icon_state = "coin_silver"

/obj/item/coin/diamond
	name = "钻石币"
	icon_state = "coin_diamond"

/obj/item/coin/iron
	name = "铁币"
	icon_state = "coin_iron"

/obj/item/coin/phoron
	name = "固态等离子体硬币"
	icon_state = "coin_phoron"

/obj/item/coin/uranium
	name = "铀币"
	icon_state = "coin_uranium"

/obj/item/coin/platinum
	name = "铂金币"
	icon_state = "coin_adamantine"

/obj/item/coin/debugtoken
	name = "原型通用代币"
	desc = "一块特殊的纳米纤维芯片，表面刻有数个微型标签。极少在紧急维护情况之外见到。"
	icon_state = "coin_clown"

/obj/item/coin/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/stack/cable_coil))
		var/obj/item/stack/cable_coil/CC = I
		if(string_attached)
			to_chat(user, span_notice("这枚硬币上已经系有丝线了。"))
			return

		if(!CC.use(1))
			to_chat(user, span_notice("这卷电缆似乎是空的。"))
			return

		overlays += image('icons/obj/items/items.dmi',"coin_string_overlay")
		string_attached = TRUE
		to_chat(user, span_notice("你将一根细绳系在了硬币上。"))

	else if(iswirecutter(I))
		if(!string_attached)
			return

		var/obj/item/stack/cable_coil/CC = new(user.loc)
		CC.amount = 1
		CC.update_icon()
		overlays = list()
		string_attached = FALSE
		to_chat(user, span_notice("你将绳子从硬币上解下。"))


/obj/item/coin/attack_self(mob/user as mob)
	var/result = rand(1, sides)
	var/comment = ""
	if(result == 1)
		comment = "tails"
	else if(result == 2)
		comment = "heads"
	user.visible_message(span_notice("[user] 扔出了 \the [src]。它落在了 [comment] 上！"), \
						span_notice("You throw \the [src]. It lands on [comment]! "))
