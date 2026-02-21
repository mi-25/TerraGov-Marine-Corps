/obj/item/spacecash
	name = "0美元"
	desc = "你没有钱。"
	gender = PLURAL
	icon = 'icons/obj/stack_objects.dmi'
	icon_state = "spacecash1"
	opacity = FALSE
	density = FALSE
	anchored = FALSE
	force = 1
	throwforce = 1
	throw_speed = 1
	throw_range = 2
	w_class = WEIGHT_CLASS_TINY
	var/access = list()
	access = ACCESS_MARINE_CAPTAIN
	var/worth = 0

/obj/item/spacecash/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/spacecash) && !istype(I, /obj/item/spacecash/ewallet))
		var/obj/item/spacecash/bundle/bundle
		if(!istype(I, /obj/item/spacecash/bundle))
			var/obj/item/spacecash/cash = I
			user.temporarilyRemoveItemFromInventory(cash)
			bundle = new(loc)
			bundle.worth += cash.worth
			qdel(cash)
		else
			bundle = I
		bundle.worth += worth
		bundle.update_icon()
		if(ishuman(user))
			var/mob/living/carbon/human/h_user = user
			h_user.temporarilyRemoveItemFromInventory(src)
			h_user.temporarilyRemoveItemFromInventory(bundle)
			h_user.put_in_hands(bundle)
		to_chat(user, span_notice("你向钱捆中添加了价值[worth]美元的钱币。<br>它现在持有[bundle.worth]美元。"))
		qdel(src)

/obj/item/spacecash/bundle
	name = "一叠美元"
	icon_state = "blank"
	desc = "它们价值0美元。"
	worth = 0

/obj/item/spacecash/bundle/update_desc(updates)
	. = ..()
	desc = "它们价值[worth]美元。"

/obj/item/spacecash/bundle/update_overlays()
	. = ..()
	var/sum = worth
	var/num = 0
	for(var/i in list(1000,500,200,100,50,20,10,1))
		while(sum >= i && num < 50)
			sum -= i
			num++
			var/image/banknote = image('icons/obj/stack_objects.dmi', "spacecash[i]")
			var/matrix/M = matrix()
			M.Translate(rand(-6, 6), rand(-4, 8))
			M.Turn(pick(-45, -27.5, 0, 0, 0, 0, 0, 0, 0, 27.5, 45))
			banknote.transform = M
			. += banknote
	if(num == 0) // Less than one thaler, let's just make it look like 1 for ease
		var/image/banknote = image('icons/obj/stack_objects.dmi', "spacecash1")
		var/matrix/M = matrix()
		M.Translate(rand(-6, 6), rand(-4, 8))
		M.Turn(pick(-45, -27.5, 0, 0, 0, 0, 0, 0, 0, 27.5, 45))
		banknote.transform = M
		. += banknote

/obj/item/spacecash/bundle/attack_self(mob/user)
	var/oldloc = loc
	var/amount = tgui_input_number(user, "How many dollars do you want to take? (0 to [src.worth])", "Take Money", 20)
	amount = round(clamp(amount, 0, src.worth))
	if(amount==0) return 0
	if(gc_destroyed || loc != oldloc) return

	src.worth -= amount
	src.update_appearance()
	if(!worth)
		usr.temporarilyRemoveItemFromInventory(src)
	if(amount in list(1000,500,200,100,50,20,1))
		var/cashtype = text2path("/obj/item/spacecash/c[amount]")
		var/obj/cash = new cashtype (usr.loc)
		user.put_in_hands(cash)
	else
		var/obj/item/spacecash/bundle/bundle = new (usr.loc)
		bundle.worth = amount
		bundle.update_appearance()
		user.put_in_hands(bundle)
	if(!worth)
		qdel(src)

/obj/item/spacecash/c1
	name = "1美元钞票"
	icon_state = "spacecash1"
	desc = "一张美国政府发行的1美元纸币。上面印有乔治·华盛顿的头像。会让大多数英语裔的人哭泣，但本身价值不高。在某些星系里，大概能给你换来半个热狗。"
	worth = 1

/obj/item/spacecash/c10
	name = "10美元钞票"
	icon_state = "spacecash10"
	desc = "一张美国政府发行的十美元纸币。上面印有亚历山大·汉密尔顿的肖像，他是联邦银行的狂热支持者，也是一次恶劣恶作剧事件的受害者。在支付税费和小费之前，大概能在廉价餐馆买一顿饭。"
	worth = 10

/obj/item/spacecash/c20
	name = "20美元钞票"
	icon_state = "spacecash20"
	desc = "一张美国政府发行的二十美元纸币。上面印有安德鲁·杰克逊的肖像，他是1812年战争的著名英雄，也是各地原住民的屠杀者。这张钞票大概够你在当地殖民地的牛排馆享用一顿不错的两道菜套餐。"
	worth = 20

/obj/item/spacecash/c50
	name = "50美元钞票"
	icon_state = "spacecash50"
	desc = "一张美国政府发行的五十美元纸币。上面印有尤利西斯·S·格兰特的肖像，这位以在内战中采用消耗性部队战术而闻名的人物，很可能是比尔·卡森的远亲。如果酒吧里还有另外4个人，你大概能用这张钞票请整个酒吧的人喝杯啤酒。"
	worth = 50

/obj/item/spacecash/c100
	name = "100美元钞票"
	icon_state = "spacecash100"
	desc = "一张美国政府发行的百元钞票。上面印着本杰明·富兰克林，那位著名的风筝引雷者。用这张钞票，你大概能支付一整天的上岸休假活动——前提是你不乱花钱。（但你肯定会乱花。）"
	worth = 100

/obj/item/spacecash/c200
	name = "200美元"
	icon_state = "spacecash200"
	desc = "两张美国政府发行的百元美钞。上面都印着本杰明·富兰克林的肖像。两个本杰明从不同的角度热切而充满期待地注视着你。"
	worth = 200

/obj/item/spacecash/c500
	name = "500美元"
	icon_state = "spacecash500"
	desc = "五张美国政府发行的百元钞票。上面都印着本杰明·富兰克林的肖像。它们全都急切地瞪着你，让你感觉好像欠了它们什么似的。"
	worth = 500


/proc/spawn_money(sum, spawnloc, mob/living/carbon/human/human_user)
	if(sum in list(1000,500,200,100,50,20,10,1))
		var/cash_type = text2path("/obj/item/spacecash/c[sum]")
		var/obj/cash = new cash_type (usr.loc)
		if(ishuman(human_user) && !human_user.get_active_held_item())
			human_user.put_in_hands(cash)
		return
	var/obj/item/spacecash/bundle/bundle = new (spawnloc)
	bundle.worth = sum
	bundle.update_appearance()
	if (ishuman(human_user) && !human_user.get_active_held_item())
		human_user.put_in_hands(bundle)

/obj/item/spacecash/ewallet
	name = "\improper 纳米传讯现金卡"
	icon = 'icons/obj/items/items.dmi'
	icon_state = "efundcard"
	desc = "一张由纳米传讯支持的现金卡，内存储一定金额。"
	var/owner_name = "" //So the ATM can set it so the EFTPOS can put a valid name on transactions.

/obj/item/spacecash/ewallet/examine(mob/user)
	. = ..()
	if(user == loc)
		. += span_notice("Charge card's owner: [owner_name]. Dollars remaining: [worth].")
