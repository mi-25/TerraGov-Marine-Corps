/obj/effect/decal/cleanable/generic
	name = "杂物"
	desc = "得有人来清理一下。"
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	icon = 'icons/obj/objects.dmi'
	icon_state = "shards"

/obj/effect/decal/cleanable/ash
	name = "灰烬"
	desc = "尘归尘，土归土，终归太空。"
	gender = PLURAL
	icon = 'icons/obj/objects.dmi'
	icon_state = "ash"
	anchored = TRUE

/obj/effect/decal/cleanable/ash/attack_hand(mob/living/user)
	to_chat(user, span_notice("[src] 从你的指缝间滑落。"))
	qdel(src)
	return TRUE

/obj/effect/decal/cleanable/dirt
	name = "泥土"
	desc = "得有人来清理一下。"
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	icon = 'icons/effects/effects.dmi'
	icon_state = "dirt"
	mouse_opacity = 0

/obj/effect/decal/cleanable/dirt/grime1
	icon_state = "grime1"

/obj/effect/decal/cleanable/dirt/grime2
	icon_state = "grime2"

/obj/effect/decal/cleanable/dirt/grime3
	icon_state = "grime3"

/obj/effect/decal/cleanable/dirt/grime4
	icon_state = "grime4"

/obj/effect/decal/cleanable/glass
	name = "碎玻璃"
	desc = "不穿鞋的人走上去会很危险。"
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	icon = 'icons/obj/items/shards.dmi'
	icon_state = "tiny"
	mouse_opacity = 0

/obj/effect/decal/cleanable/glass/plasma
	icon_state = "plasmatiny"

/obj/effect/decal/cleanable/glass/plastic
	icon_state = "plasticshards"

/obj/effect/decal/cleanable/flour
	name = "面粉"
	desc = "还能吃。四秒法则！"
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	icon = 'icons/effects/effects.dmi'
	icon_state = "flour"

/obj/effect/decal/cleanable/greenglow
	name = "发光粘液"
	desc = "天啊。希望那不是午餐。"
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	icon = 'icons/effects/effects.dmi'
	icon_state = "greenglow"

/obj/effect/decal/cleanable/greenglow/Initialize(mapload)
	. = ..()
	set_light(1, 0.5, LIGHT_COLOR_EMISSIVE_GREEN)

/obj/effect/decal/cleanable/cobweb
	name = "蛛网"
	desc = "应该有人把它处理掉。"
	density = FALSE
	anchored = TRUE
	layer = FLY_LAYER
	icon = 'icons/effects/effects.dmi'
	icon_state = "cobweb1"

/obj/effect/decal/cleanable/molten_item
	name = "黏稠的灰色团块"
	desc = "它看起来像是个熔化了的……什么东西。"
	density = FALSE
	anchored = TRUE
	layer = OBJ_LAYER
	icon = 'icons/obj/items/chemistry.dmi'
	icon_state = "molten"

/obj/effect/decal/cleanable/cobweb2
	name = "蛛网"
	desc = "应该有人把它处理掉。"
	density = FALSE
	anchored = TRUE
	layer = OBJ_LAYER
	icon = 'icons/effects/effects.dmi'
	icon_state = "cobweb2"

//Vomit (sorry)
/obj/effect/decal/cleanable/vomit
	name = "呕吐"
	desc = "天哪，真让人不舒服。"
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	icon = 'icons/effects/blood.dmi'
	icon_state = "vomit_1"
	random_icon_states = list("vomit_1", "vomit_2", "vomit_3", "vomit_4")


/obj/effect/decal/cleanable/tomato_smudge
	name = "番茄污渍"
	desc = "它是红色的。"
	density = FALSE
	anchored = TRUE
	icon = 'icons/effects/effects.dmi'
	icon_state = "tomato_floor2"
	random_icon_states = list("tomato_floor1", "tomato_floor2", "tomato_floor3")

/obj/effect/decal/cleanable/egg_smudge
	name = "破碎的卵"
	desc = "这个好像孵不出来了。"
	density = FALSE
	anchored = TRUE
	icon = 'icons/effects/effects.dmi'
	icon_state = "smashed_egg1"
	random_icon_states = list("smashed_egg1", "smashed_egg2", "smashed_egg3")

/obj/effect/decal/cleanable/pie_smudge //honk
	name = "砸碎的馅饼"
	desc = "这是奶油派的奶油馅。"
	density = FALSE
	anchored = TRUE
	icon = 'icons/effects/effects.dmi'
	icon_state = "smashed_pie"
