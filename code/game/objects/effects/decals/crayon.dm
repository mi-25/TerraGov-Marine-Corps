/obj/effect/decal/cleanable/crayon
	name = "符文"
	desc = "用蜡笔画出的符文。"
	icon = 'icons/effects/crayondecal.dmi'
	anchored = TRUE

/obj/effect/decal/cleanable/crayon/Initialize(mapload, main = "#FFFFFF", shade = "#000000", type = "rune")
	. = ..()

	name = type
	desc = "用蜡笔画的[type]。"

	switch(type)
		if("rune")
			type = "rune[rand(1,6)]"
		if("graffiti")
			type = pick("amyjon","face","matt","revolution","engie","guy","end","dwarf","uboa")

	var/icon/mainOverlay = new/icon('icons/effects/crayondecal.dmi',"[type]",2.1)
	var/icon/shadeOverlay = new/icon('icons/effects/crayondecal.dmi',"[type]s",2.1)

	mainOverlay.Blend(main, ICON_ADD)
	shadeOverlay.Blend(shade, ICON_ADD)

	overlays += mainOverlay
	overlays += shadeOverlay
