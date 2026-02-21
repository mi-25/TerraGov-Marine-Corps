/obj/item/explosive/grenade/pmc
	desc = "为私人安保公司生产的破片手雷。拉出保险销后3秒爆炸。"
	icon_state = "grenade_pmc"
	worn_icon_state = "grenade_pmc"
	hud_state = "grenade_frag"
	icon_state_mini = "grenade_red_white"
	light_impact_range = 5

/obj/item/explosive/grenade/m15
	name = "\improper M15破片手雷"
	desc = "一款过时的地球政府殖民地海军陆战队破片手雷。在TGMC服役数十年后，老旧的M15破片手雷正逐渐被稍安全的M40 HEDP取代。它将在4秒后引爆。"
	icon_state = "grenade_ex"
	worn_icon_state = "grenade_ex"
	hud_state = "grenade_frag"
	icon_state_mini = "grenade_yellow"
	light_impact_range = 5

/obj/item/explosive/grenade/stick
	name = "\improper 韦伯利Mk15木柄手雷"
	desc = "殖民地生产的破片手雷，通常采用老旧的设计和图纸。拉出保险销后3秒爆炸。"
	icon_state = "grenade_stick"
	worn_icon_state = "grenade_stick"
	hud_state = "grenade_frag"
	force = 10
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 15

/obj/item/explosive/grenade/upp
	name = "\improper 5型破片手雷"
	desc = "联合太空鳞翅目部队中配备的一种破片手雷。设计用于爆炸产生弹片，撕裂对手的身体。拉出保险销后3秒爆炸。"
	icon_state = "grenade_upp"
	worn_icon_state = "grenade_upp"
	hud_state = "greande_frag"
	throw_speed = 2
	throw_range = 6

/obj/item/explosive/grenade/som
	name = "\improper S30 高爆手雷"
	desc = "火星之子部队使用的一种可靠的高爆手雷。设计用于手投或榴弹发射器发射。"
	icon_state = "grenade_som"
	worn_icon_state = "grenade_som"

/obj/item/explosive/grenade/vsd
	name = "\improper XM93 高爆穿甲手雷"
	desc = "InterTech实验型高爆反人员手雷。适用于清理房间等场景。"
	icon_state = "grenade_vsd"
	light_impact_range = 5

/obj/item/explosive/grenade/sectoid
	name = "异形爆炸"
	desc = "一个奇怪的、软绵绵的、器官状的手雷。挤压它3秒后就会爆炸。"
	icon_state = "alien_grenade"
	worn_icon_state = "alien_grenade"
	hud_state = "grenade_frag"
	light_impact_range = 6

/obj/item/explosive/grenade/ags
	name = "\improper AGLS-37 高爆双用途手雷"
	desc = "一枚小巧的智能手雷，它即将在你面前爆炸，除非你发现它是惰性的。除此之外，这是一枚相当普通的手雷，除了它不知为何处于可准备状态。"
	w_class = WEIGHT_CLASS_SMALL
	icon = 'icons/obj/items/grenade.dmi'
	icon_state = "ags_grenade"
	worn_icon_state = "ags_grenade"
	det_time = 2 SECONDS
	light_impact_range = 2
	weak_impact_range = 4

/obj/item/explosive/grenade/impact
	name = "\improper M40 IMDP 手雷"
	desc = "一种采用标准DP弹壳结构的高爆触发引信弹药。具有聚焦爆破效果，专门用于破门、打击工事和轻型装甲车辆。警告：手投无法产生足够的冲击力触发碰炸引信。"
	icon_state = "grenade_impact"
	worn_icon_state = "grenade_impact"
	hud_state = "grenade_frag"
	det_time = 4 SECONDS
	dangerous = TRUE
	icon_state_mini = "grenade_blue_white"
	light_impact_range = 3

/obj/item/explosive/grenade/impact/throw_impact(atom/hit_atom, speed)
	. = ..()
	if(!.)
		return
	if(launched && active && !istype(hit_atom, /turf/open)) //Only contact det if active, we actually hit something, and we're fired from a grenade launcher.
		explosion(loc, light_impact_range = 1, flash_range = 2, explosion_cause="thrown by someone")
		qdel(src)

/obj/item/explosive/grenade/creampie
	name = "\improper ERP4 高爆香蕉奶油派手雷"
	desc = "高爆弹药，伪装成美味奶油派！"
	icon = 'icons/obj/items/food/piecake.dmi'
	icon_state = "pie"
