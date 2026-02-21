/obj/structure/sign/double/barsign
	icon = 'icons/obj/structures/barsigns.dmi'
	icon_state = "off"

/obj/structure/sign/double/barsign/carp
	name = "醉醺醺的鲤鱼"
	desc = "醉鲤酒吧与烧烤"
	icon_state = "thedrunkcarp"

/obj/structure/sign/double/barsign/Initialize(mapload)
	. = ..()
	icon = 'icons/obj/structures/barsigns.dmi'
