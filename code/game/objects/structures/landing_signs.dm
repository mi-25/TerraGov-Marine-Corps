/obj/structure/lazarus_sign
	name = "拉撒路着陆点标识"
	desc = "一块大标牌上写着'拉撒路着陆港-'，其余部分被血迹模糊了。"
	icon = 'icons/obj/landing_signs.dmi'
	icon_state = "laz_sign"
	bound_width = 64
	bound_height = 64
	density = TRUE
	coverage = 15

/obj/structure/solaris_sign
	name = "索拉里斯山脊标识牌"
	desc = "一块大牌子，上面写着'索拉里斯岭 -'，其余部分已被刮掉。"
	icon = 'icons/obj/landing_signs.dmi'
	icon_state = "red_sign"
	bound_width = 64
	bound_height = 64
	density = TRUE

/obj/structure/bluemoon_sign
	name = "蓝月标志"
	desc = "一块大牌子，上面写着'蓝月，索拉里斯岭——'，其余部分已被刮掉。这块牌子似乎装有加热板以防冻结，真不错！"
	icon = 'icons/obj/landing_signs.dmi'
	icon_state = "blue_sign"
	bound_width = 64
	bound_height = 64
	density = TRUE

/obj/structure/kutjevo_sign
	name = "库切沃标志"
	desc = "一块大牌子，上面写着'库特耶沃流行-'，其余部分被爪痕掩盖。"
	icon = 'icons/obj/landing_signs.dmi'
	icon_state = "kut_sign"
	bound_width = 64
	bound_height = 32
	density = TRUE

/obj/structure/kutjevo_sign/Initialize(mapload)
	. = ..()
	icon_state = "kut_ingame"
	overlays += image(icon, src, "kut_sign_top", layer = ABOVE_ALL_MOB_LAYER, pixel_y = 32)

/obj/structure/prison_sign
	name = "UA 监狱对接标识"
	desc = "一块大牌子，上面写着'UA监狱对接-'，其余部分被爪痕遮盖。"
	icon = 'icons/obj/landing_signs.dmi'
	icon_state = "prison_sign"
	bound_width = 64
	bound_height = 64

/obj/structure/ice_sign
	name = "湿婆冰原着陆点标识"
	desc = "一块大牌子，上面写着'湿婆冰原着-'，弹道孔洞和撕裂的金属遮住了其余部分。"
	icon = 'icons/obj/landing_signs.dmi'
	icon_state = "ice_sign"
	bound_width = 64
	bound_height = 64

/obj/structure/dam_sign
	name = "千草着陆点标识"
	desc = "一块写着'千草矿业殖民地'的大型标牌，一半用日文书写。"
	icon = 'icons/obj/landing_signs.dmi'
	icon_state = "dam_sign"
	bound_width = 64
	density = TRUE
	coverage = 15

/obj/structure/dam_sign/damaged
	desc = "一块写着'千草矿业殖-'的大型标牌，其余部分被看似干涸的血迹和损坏所掩盖。"
	icon_state = "dam_sign"

/obj/structure/tachi_sign
	name = "塔奇基地标识"
	desc = "一块大牌子，上面写着'塔奇基地位于塞雷斯五号行星'，旁边有一面火星之子的旗帜。"
	icon = 'icons/obj/landing_signs.dmi'
	icon_state = "tachi_sign"
	bound_width = 64
	density = TRUE
	coverage = 15

/obj/structure/roci_sign
	name = "罗西南多基地标识"
	desc = "一块写着'罗西南特基地'的大牌子，上面插着火星之子的旗帜。"
	icon = 'icons/obj/landing_signs.dmi'
	icon_state = "roci_sign"
	bound_width = 64
	density = TRUE
	coverage = 15
