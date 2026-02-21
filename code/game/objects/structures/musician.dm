/obj/structure/device/broken_piano
	name = "损坏的老式钢琴"
	icon = 'icons/obj/musician.dmi'
	desc = "真可惜。这架钢琴看起来再也弹不了了。永远都弹不了了。连问都别问。"
	icon_state = "pianobroken"
	anchored = TRUE
	density = TRUE
	coverage = 20

/obj/structure/device/broken_moog
	name = "损坏的老式合成器"
	icon = 'icons/obj/musician.dmi'
	desc = "这台太空穆格合成器是古董货，但被砸烂了。看来有人不喜欢它热辣的新鲜旋律。"
	icon_state = "minimoogbroken"
	anchored = TRUE
	density = TRUE
	coverage = 15

/obj/structure/device/piano
	name = "太空迷你穆格"
	icon = 'icons/obj/musician.dmi'
	icon_state = "minimoog"
	anchored = TRUE
	density = TRUE
	coverage = 20

/obj/structure/device/piano/full
	icon_state = "piano"

/obj/structure/device/piano/Initialize(mapload)
	. = ..()
	if(prob(50))
		name = "太空迷你穆格"
		desc = "这是一台迷你穆格合成器，就像太空钢琴一样，但更有太空感！"
		icon_state = "minimoog"
	else
		name = "太空钢琴"
		desc = "这是一架太空钢琴，就像普通钢琴一样，但永远音准！即使演奏者不准。"
		icon_state = "piano"
