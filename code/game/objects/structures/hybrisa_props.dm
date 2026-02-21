/obj/structure/prop/urban
	name = "通用城市建筑名称"

// Supermart

/obj/structure/prop/urban/supermart
	name = "长弹匣"
	icon_state = "longrack1"
	desc = "一个长长的货架，上面摆满了各种食品"
	icon = 'icons/obj/structures/prop/urban/supermart.dmi'
	density = TRUE

/obj/structure/prop/urban/supermart/rack/longrackempty
	name = "货架"
	desc = "一个空荡荡的长架子。"
	icon_state = "longrackempty"

/obj/structure/prop/urban/supermart/rack/longrack1
	name = "货架"
	desc = "一个长长的货架，上面摆满了各种食品"
	icon_state = "longrack1"

/obj/structure/prop/urban/supermart/rack/longrack2
	name = "货架"
	desc = "一个长长的货架，上面摆满了各种食品"
	icon_state = "longrack2"

/obj/structure/prop/urban/supermart/rack/longrack3
	name = "货架"
	desc = "一个长长的货架，上面摆满了各种食品"
	icon_state = "longrack3"

/obj/structure/prop/urban/supermart/rack/longrack4
	name = "货架"
	desc = "一个长长的货架，上面摆满了各种食品"
	icon_state = "longrack4"

/obj/structure/prop/urban/supermart/rack/longrack5
	name = "货架"
	desc = "一个长长的货架，上面摆满了各种食品"
	icon_state = "longrack5"

/obj/structure/prop/urban/supermart/rack/longrack6
	name = "货架"
	desc = "一个长长的货架，上面摆满了各种食品"
	icon_state = "longrack6"

/obj/structure/prop/urban/supermart/rack/longrack7
	name = "货架"
	desc = "一个长长的货架，上面摆满了各种食品"
	icon_state = "longrack7"

/obj/structure/prop/urban/supermart/supermartbelt
	name = "传送带"
	desc = "传送带。"
	icon_state = "checkoutbelt"

/obj/structure/prop/urban/supermart/freezer
	name = "商用冰柜"
	desc = "商用级冷冻柜。"
	icon_state = "freezerupper"
	density = TRUE
/obj/structure/prop/urban/supermart/freezer/supermartfreezer1
	icon_state = "freezerupper"

/obj/structure/prop/urban/supermart/freezer/supermartfreezer2
	icon_state = "freezerlower"

/obj/structure/prop/urban/supermart/freezer/supermartfreezer3
	icon_state = "freezermid"

/obj/structure/prop/urban/supermart/freezer/supermartfreezer4
	icon_state = "freezerupper1"

/obj/structure/prop/urban/supermart/freezer/supermartfreezer5
	icon_state = "freezerlower1"

/obj/structure/prop/urban/supermart/freezer/supermartfreezer6
	icon_state = "freezermid1"

/obj/structure/prop/urban/supermart/supermartfruitbasketempty
	name = "篮筐"
	desc = "一个篮子。"
	icon_state = "supermarketbasketempty"

/obj/structure/prop/urban/supermart/supermartfruitbasketoranges
	name = "篮筐"
	desc = "装满橙子的篮子。"
	icon_state = "supermarketbasket1"

/obj/structure/prop/urban/supermart/supermartfruitbasketpears
	name = "篮筐"
	desc = "一篮梨子。"
	icon_state = "supermarketbasket2"

/obj/structure/prop/urban/supermart/supermartfruitbasketcarrots
	name = "篮筐"
	desc = "装满胡萝卜的篮子。"
	icon_state = "supermarketbasket3"

/obj/structure/prop/urban/supermart/supermartfruitbasketmelons
	name = "篮筐"
	desc = "一篮满满的甜瓜。"
	icon_state = "supermarketbasket4"

/obj/structure/prop/urban/supermart/supermartfruitbasketapples
	name = "篮筐"
	desc = "装满苹果的篮子。"
	icon_state = "supermarketbasket5"

// Furniture
/obj/structure/prop/urban/furniture
	icon = 'icons/obj/structures/prop/urban/urbantables.dmi'
	icon_state = "blackmetaltable"
	resistance_flags = XENO_DAMAGEABLE

/obj/structure/prop/urban/furniture/tables
	icon_state = "table_pool"
	allow_pass_flags = PASS_LOW_STRUCTURE|PASSABLE|PASS_WALKOVER

/obj/structure/prop/urban/furniture/tables/tableblack
	name = "大型金属桌"
	desc = "一张大型黑色金属桌，看起来非常昂贵。"
	icon_state = "blackmetaltable"
	density = TRUE
	climbable = TRUE
	bound_height = 32
	bound_width = 64

/obj/structure/prop/urban/furniture/tables/tableblack/blacktablecomputer
	icon_state = "blackmetaltable_computer"

/obj/structure/prop/urban/furniture/tables/tablewood
	name = "大型木桌"
	desc = "一张大型木桌，看起来非常昂贵。"
	icon_state = "brownlargetable"
	density = TRUE
	climbable = TRUE
	bound_height = 32
	bound_width = 64

/obj/structure/prop/urban/furniture/tables/tablewood/woodtablecomputer
	icon_state = "brownlargetable_computer"

/obj/structure/prop/urban/furniture/tables/tablepool
	name = "台球桌"
	desc = "用于台球游戏的大型球桌。"
	icon_state = "table_pool"
	density = TRUE
	bound_height = 32
	bound_width = 64
	climbable = TRUE

/obj/structure/prop/urban/furniture/tables/tablegambling
	name = "赌桌"
	desc = "用于赌博的大桌子。"
	icon_state = "table_cards"
	density = TRUE
	bound_height = 32
	bound_width = 64
	climbable = TRUE

// Chairs
/obj/structure/bed/urban/chairs
	name = "昂贵的椅子"
	desc = "一把看起来昂贵的椅子"
	resistance_flags = XENO_DAMAGEABLE
	icon = 'icons/obj/structures/prop/urban/urbanrandomprops.dmi'

/obj/structure/bed/urban/chairs/black
	icon_state = "comfychair_zenithblack"

/obj/structure/bed/urban/chairs/red
	icon_state = "comfychair_zenithred"

/obj/structure/bed/urban/chairs/blue
	icon_state = "comfychair_zenithblue"

/obj/structure/bed/urban/chairs/brown
	icon_state = "comfychair_zenithbrown"

// Beds

/obj/structure/bed/urban
	icon = 'icons/obj/structures/prop/urban/urbanrandomprops.dmi'
	icon_state = "hybrisa"

/obj/structure/bed/urban/prisonbed
	name = "双层床"
	desc = "一张看起来破旧的上下铺。"
	icon_state = "prisonbed"

/obj/structure/bed/urban/bunkbed1
	name = "双层床"
	desc = "一张看起来舒适的上下铺。"
	icon_state = "zbunkbed"

/obj/structure/bed/urban/bunkbed2
	name = "双层床"
	desc = "一张看起来舒适的上下铺床。"
	icon_state = "zbunkbed2"

/obj/structure/bed/urban/bunkbed3
	name = "双层床"
	desc = "一张看起来舒适的上下铺床。"
	icon_state = "zbunkbed3"

/obj/structure/bed/urban/bunkbed4
	name = "双层床"
	desc = "一张看起来舒适的上下铺床。"
	icon_state = "zbunkbed4"

/obj/structure/bed/urban/hospitalbeds
	icon_state = "hospital"

/obj/structure/bed/urban/hospitalbeds/hospitalbed1
	name = "医疗床"
	desc = "一张安装在带轮金属矩形框架上的床垫。用于以舒适的方式支撑躺卧的人。"
	icon_state = "bigrollerempty2_up"

/obj/structure/bed/urban/hospitalbeds/hospitalbed2
	name = "病床"
	desc = "一张安装在带轮金属矩形框架上的床垫。用于以舒适的方式支撑躺卧的人。"
	icon_state = "bigrollerempty_up"

/obj/structure/bed/urban/hospitalbeds/hospitalbed3
	name = "医疗床"
	desc = "一张安装在带轮金属矩形框架上的床垫。用于以舒适的方式支撑躺卧的人。"
	icon_state = "bigrollerempty3_up"

// Xenobiology

/obj/structure/prop/urban/xenobiology
	icon = 'icons/obj/structures/prop/urban/urbanxenocryogenics.dmi'
	icon_state = "xenocellemptyon"
	layer = ABOVE_MOB_LAYER


/obj/structure/prop/urban/xenobiology/small/empty
	name = "样本收容单元"
	desc = "它是空的。"
	icon_state = "xenocellemptyon"
	density = TRUE

/obj/structure/prop/urban/xenobiology/small/offempty
	name = "样本收容单元"
	desc = "它已关闭且为空。"
	icon_state = "xenocellemptyoff"
	density = TRUE

/obj/structure/prop/urban/xenobiology/small/larva
	name = "样本收容单元"
	desc = "里面好像有蠕虫一样的东西..."
	icon_state = "xenocelllarva"
	density = TRUE

/obj/structure/prop/urban/xenobiology/small/egg
	name = "样本收容单元"
	desc = "里面看起来像是某种卵……"
	icon_state = "xenocellegg"
	density = TRUE

/obj/structure/prop/urban/xenobiology/small/hugger
	name = "样本收容单元"
	desc = "里面好像有蜘蛛一样的东西……"
	icon_state = "xenocellhugger"
	density = TRUE

/obj/structure/prop/urban/xenobiology/small/cracked1
	name = "样本收容单元"
	desc = "看起来有什么东西从内部破坏了它……"
	icon_state = "xenocellcrackedempty"
	density = TRUE

/obj/structure/prop/urban/xenobiology/small/cracked2
	name = "样本收容单元"
	desc = "看起来有什么东西从内部破坏了它……"
	icon_state = "xenocellcrackedempty2"
	density = TRUE

/obj/structure/prop/urban/xenobiology/small/crackedegg
	name = "样本收容单元"
	desc = "看起来有什么东西把它弄破了，里面有个巨大的空卵。"
	icon_state = "xenocellcrackedegg"
	density = TRUE

/obj/structure/prop/urban/xenobiology/big
	name = "样本收容单元"
	desc = "一根巨大的管道，里面装着一个庞大的怪物，这东西还活着吗？"
	icon = 'icons/obj/structures/prop/urban/urbanxenocryogenics2.dmi'
	icon_state = "bigqueencryo1"

/obj/structure/prop/urban/xenobiology/big/bigleft
	icon = 'icons/obj/structures/prop/urban/urbanxenocryogenics2.dmi'
	icon_state = "bigqueencryo1"
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/urban/xenobiology/big/bigright
	icon = 'icons/obj/structures/prop/urban/urbanxenocryogenics2.dmi'
	icon_state = "bigqueencryo2"
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/urban/xenobiology/big/bigbottomleft
	icon = 'icons/obj/structures/prop/urban/urbanxenocryogenics2.dmi'
	icon_state = "bigqueencryo3"
	density = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/urban/xenobiology/big/bigbottomright
	icon = 'icons/obj/structures/prop/urban/urbanxenocryogenics2.dmi'
	icon_state = "bigqueencryo4"
	density = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/urban/xenobiology/misc
	name = "奇怪的蛋"
	desc = "一颗看起来古老而奇异的卵，它似乎处于惰性状态。"
	icon = 'icons/obj/structures/prop/urban/urbanrandomprops.dmi'
	icon_state = "inertegg"
	layer = 2

// Engineer
/obj/structure/prop/urban/engineer
	icon = 'icons/obj/structures/prop/urban/engineerjockey.dmi'

/obj/structure/prop/urban/engineer/spacejockey
	name = "巨型驾驶员"
	desc = "一个巨大的外星生命体。看起来已经死去很久了。已经石化了。看起来像是从椅子里长出来的。骨头向外弯曲，像是从内部爆炸开来。"
	icon = 'icons/obj/structures/prop/urban/engineerjockey.dmi'
	icon_state = "spacejockey"
	layer = ABOVE_MOB_LAYER
	resistance_flags = RESIST_ALL

/obj/structure/prop/urban/engineer/giantconsole
	name = "巨型异形控制台"
	desc = "某种巨大的外星控制台，与你见过的任何东西都不同。谁知道这种奇怪技术的用途……"
	icon = 'icons/obj/structures/prop/urban/64x64_urbanrandomprops.dmi'
	icon_state = "engineerconsole"
	bound_height = 32
	bound_width = 32
	density = TRUE
/obj/structure/prop/urban/engineer/engineerpillar
	icon = 'icons/obj/structures/prop/urban/urbanengineerpillarangled.dmi'
	icon_state = "engineerpillar_SW1fade"
	bound_height = 64
	bound_width = 128
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/urban/engineer/engineerpillar/northwesttop
	name = "奇怪的柱子"
	icon_state = "engineerpillar_NW1"
/obj/structure/prop/urban/engineer/engineerpillar/northwestbottom
	name = "奇怪的柱子"
	icon_state = "engineerpillar_NW2"
/obj/structure/prop/urban/engineer/engineerpillar/southwesttop
	name = "奇怪的柱子"
	icon_state = "engineerpillar_SW1"
/obj/structure/prop/urban/engineer/engineerpillar/southwestbottom
	name = "奇怪的柱子"
	icon_state = "engineerpillar_SW2"
/obj/structure/prop/urban/engineer/engineerpillar/smallsouthwest1
	name = "奇怪的柱子"
	icon_state = "engineerpillar_SW1fade"
/obj/structure/prop/urban/engineer/engineerpillar/smallsouthwest2
	name = "奇怪的柱子"
	icon_state = "engineerpillar_SW2fade"

// Airport

/obj/structure/prop/urban/airport
	name = "机头整流罩"
	icon = 'icons/obj/structures/prop/urban/urbanrandomprops.dmi'
	icon_state = "dropshipfrontwhite1"

/obj/structure/prop/urban/airport/dropshipnosecone
	name = "机头整流罩"
	icon_state = "dropshipfrontwhite1"
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/urban/airport/dropshipwingleft
	name = "翼"
	icon_state = "dropshipwingtop1"
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/urban/airport/dropshipwingright
	name = "翼"
	icon_state = "dropshipwingtop2"
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/urban/airport/dropshipvent1left
	name = "通风口"
	icon_state = "dropshipvent1"
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/urban/airport/dropshipvent2right
	name = "通风口"
	icon_state = "dropshipvent2"
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/urban/airport/dropshipventleft
	name = "通风口"
	icon_state = "dropshipvent3"
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/urban/airport/dropshipventright
	name = "通风口"
	icon_state = "dropshipvent4"
	layer = ABOVE_MOB_LAYER

// Dropship damage

/obj/structure/prop/urban/airport/dropshipenginedamage
	name = "运输机受损"
	desc = "引擎似乎遭受了严重损坏。"
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "dropship_engine_damage"
	bound_height = 64
	bound_width = 96

/obj/structure/prop/urban/airport/dropshipenginedamagenofire
	name = "运输机受损"
	desc = "引擎似乎遭受了严重损坏。"
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "dropship_engine_damage_nofire"
	bound_height = 64
	bound_width = 96

/obj/structure/prop/urban/airport/refuelinghose
	name = "加油软管"
	desc = "一根连接各类运输艇的长加油软管。"
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "fuelline1"
	bound_height = 64
	bound_width = 96
	layer = ABOVE_WEEDS_LAYER
	plane = FLOOR_PLANE


/obj/structure/prop/urban/airport/refuelinghose2
	name = "加油软管"
	desc = "一根连接各类运输艇的长加油软管。"
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "fuelline2"
	bound_height = 64
	bound_width = 96
	layer = ABOVE_WEEDS_LAYER
	plane = FLOOR_PLANE

// Pilot body

/obj/structure/prop/urban/airport/deadpilot1
	name = "被斩首的纳米传讯飞行员"
	desc = "纳米传讯飞行员的残骸。他们的整个头部都不见了。滚到哪里去了呢？..."
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "pilotbody_decap1"
	bound_height = 64
	bound_width = 96

/obj/structure/prop/urban/airport/deadpilot2
	name = "被斩首的纳米传讯飞行员"
	desc = "纳米传讯飞行员的残骸。他们的整个头部都不见了。滚到哪里去了呢？..."
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "pilotbody_decap2"
	bound_height = 64
	bound_width = 96

// Misc

/obj/structure/prop/urban/misc
	icon = 'icons/obj/structures/prop/urban/urbanrandomprops.dmi'
	icon_state = "roadbarrier"

// Floor props

/obj/structure/prop/urban/misc/floorprops
	icon_state = "solidgrate1"

/obj/structure/prop/urban/misc/floorprops/grate
	name = "实心金属格栅"
	desc = "一个金属格栅。"
	icon_state = "solidgrate1"
	layer = LATTICE_LAYER

/obj/structure/prop/urban/misc/floorprops/grate2
	name = "实心金属格栅"
	desc = "一个金属格栅。"
	icon_state = "solidgrate5"
	layer = LATTICE_LAYER

/obj/structure/prop/urban/misc/floorprops/grate3
	name = "实心金属格栅"
	desc = "一个金属格栅。"
	icon_state = "zhalfgrate1"
	layer = LATTICE_LAYER

/obj/structure/prop/urban/misc/floorprops/floorglass
	name = "强化玻璃地板"
	desc = "一块经过强化的玻璃地板板，看起来几乎坚不可摧。"
	icon_state = "solidgrate2"

/obj/structure/prop/urban/misc/floorprops/floorglass2
	name = "强化玻璃地板"
	desc = "一块经过强化的玻璃地板板，看起来几乎坚不可摧。"
	icon_state = "solidgrate3"
	layer = 2.1

/obj/structure/prop/urban/misc/floorprops/floorglass3
	name = "强化玻璃地板"
	desc = "一块经过强化的玻璃地板板，看起来几乎坚不可摧。"
	icon_state = "solidgrate4"

// Graffiti

/obj/structure/prop/urban/misc/graffiti
	name = "涂鸦"
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "zgraffiti4"
	bound_height = 64
	bound_width = 96
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/urban/misc/graffiti/graffiti1
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "zgraffiti1"

/obj/structure/prop/urban/misc/graffiti/graffiti2
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "zgraffiti2"

/obj/structure/prop/urban/misc/graffiti/graffiti3
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "zgraffiti3"

/obj/structure/prop/urban/misc/graffiti/graffiti4
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "zgraffiti4"

/obj/structure/prop/urban/misc/graffiti/graffiti5
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "zgraffiti5"

/obj/structure/prop/urban/misc/graffiti/graffiti6
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "zgraffiti6"

/obj/structure/prop/urban/misc/graffiti/graffiti7
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "zgraffiti7"

// Wall Blood

/obj/structure/prop/urban/misc/blood
	name = "血液"
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "wallblood_floorblood"

/obj/structure/prop/urban/misc/blood/blood1
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "wallblood_floorblood"

/obj/structure/prop/urban/misc/blood/blood2
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "wall_blood_1"

/obj/structure/prop/urban/misc/blood/blood3
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "wall_blood_2"

// Fire

/obj/structure/prop/urban/misc/fire/fire1
	name = "火焰"
	desc = "很烫，甚至还在冒烟。"
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "zfire_smoke"
	layer = 5
	light_on = TRUE
	light_power = 2
	light_range = 3

/obj/structure/prop/urban/misc/fire/fire2
	name = "火焰"
	desc = "很烫，甚至还在冒烟。"
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "zfire_smoke2"
	layer = 5
	light_on = TRUE
	light_power = 2
	light_range = 3

/obj/structure/prop/urban/misc/fire/firebarrel
	name = "枪管"
	desc = "装满危险物质的燃烧桶。"
	icon = 'icons/obj/structures/prop/urban/64x96-urbanrandomprops.dmi'
	icon_state = "zbarrelfireon"
	layer = 5
	light_on = TRUE
	light_power = 2
	light_range = 3

// Misc

/obj/structure/prop/urban/misc/commandosuitemptyprop
	name = "\improper 纳米传讯'猿服'展示"
	desc = "纳米传讯'猿服'的展示模型，可惜只是个模型……"
	icon_state = "dogcatchersuitempty1"

/obj/structure/prop/urban/misc/cabinet
	name = "储物柜"
	desc = "一个带抽屉的小柜子。"
	icon_state = "sidecabinet"

/obj/structure/prop/urban/misc/trash/green
	name = "垃圾桶"
	desc = "一个纳米传讯的垃圾桶，用于丢弃你不想要的物品，或者你也可以像其他混蛋一样直接把东西扔在地上。"
	icon_state = "trashgreen"

/obj/structure/prop/urban/misc/trash/blue
	name = "垃圾桶"
	desc = "一个纳米传讯的垃圾桶，用于丢弃你不想要的物品，或者你也可以像其他混蛋一样直接把东西扔在地上。"
	icon_state = "trashblue"

/obj/structure/prop/urban/misc/redmeter
	name = "米"
	icon_state = "redmeter"

/obj/structure/prop/urban/misc/firebarreloff
	name = "枪管"
	icon_state = "zfirebarreloff"

/obj/structure/prop/urban/misc/trashbagfullprop
	name = "垃圾袋"
	icon_state = "ztrashbag"

/obj/structure/prop/urban/misc/slotmachine
	name = "老虎机"
	desc = "一台老虎机。"
	icon = 'icons/obj/structures/prop/urban/64x64_urbanrandomprops.dmi'
	icon_state = "slotmachine"
	bound_width = 32
	bound_height = 32
	anchored = TRUE
	density = TRUE
	layer = 3.2

/obj/structure/prop/urban/misc/atm
	name = "\improper 纳米传讯自动取款机"
	desc = "满足您的一切资金需求！"
	icon = 'icons/obj/structures/prop/urban/64x64_urbanrandomprops.dmi'
	icon_state = "atm"
	bound_width = 32
	bound_height = 32
	anchored = TRUE
	density = TRUE
	layer = 3.2

/obj/structure/prop/urban/misc/slotmachine_broken
	name = "老虎机"
	desc = "一台损坏的老虎机。"
	icon = 'icons/obj/structures/prop/urban/64x64_urbanrandomprops.dmi'
	icon_state = "slotmachine_broken"
	bound_width = 32
	bound_height = 32
	anchored = TRUE
	density = TRUE
	layer = 3.2

/obj/structure/prop/urban/misc/coffeestuff/coffeemachine1
	name = "咖啡机"
	desc = "一台咖啡机。"
	icon_state = "coffee"

/obj/structure/prop/urban/misc/coffeestuff/coffeemachine2
	name = "咖啡机"
	desc = "一台咖啡机。"
	icon_state = "coffee_cup"

/obj/structure/prop/urban/misc/machinery/computers
	name = "电脑"
	icon_state = "mapping_comp"
	resistance_flags = XENO_DAMAGEABLE
	max_integrity = 80

/obj/structure/prop/urban/misc/machinery/computers/computerwhite/computer1
	icon_state = "mapping_comp"

/obj/structure/prop/urban/misc/machinery/computers/computerwhite/computer2
	icon_state = "mps"

/obj/structure/prop/urban/misc/machinery/computers/computerwhite/computer3
	icon_state = "sensor_comp1"

/obj/structure/prop/urban/misc/machinery/computers/computerwhite/computer4
	icon_state = "sensor_comp2"

/obj/structure/prop/urban/misc/machinery/computers/computerwhite/computer5
	icon_state = "sensor_comp3"


/obj/structure/prop/urban/misc/machinery/computers/computerblack/computer1
	icon_state = "blackmapping_comp"

/obj/structure/prop/urban/misc/machinery/computers/computerblack/computer2
	icon_state = "blackmps"

/obj/structure/prop/urban/misc/machinery/computers/computerblack/computer3
	icon_state = "blacksensor_comp1"

/obj/structure/prop/urban/misc/machinery/computers/computerblack/computer4
	icon_state = "blacksensor_comp2"

/obj/structure/prop/urban/misc/machinery/computers/computerblack/computer5
	icon_state = "blacksensor_comp3"


/obj/structure/prop/urban/misc/machinery/screens
	name = "监控器"
	desc = "一块屏幕，可用于广播事件。看起来它经历过更好的日子。"
	resistance_flags = XENO_DAMAGEABLE
	max_integrity = 50

/obj/structure/prop/urban/misc/machinery/screens/frame
	icon_state = "frame"

/obj/structure/prop/urban/misc/machinery/screens/security
	icon_state = "security"

/obj/structure/prop/urban/misc/machinery/screens/evac
	icon_state = "evac"

/obj/structure/prop/urban/misc/machinery/screens/redalert
	icon_state = "redalert"

/obj/structure/prop/urban/misc/machinery/screens/redalertblank
	icon_state = "redalertblank"

/obj/structure/prop/urban/misc/machinery/screens/entertainment
	icon_state = "entertainment"

/obj/structure/prop/urban/misc/machinery/screens/telescreen
	icon_state = "telescreen"

/obj/structure/prop/urban/misc/machinery/screens/telescreenbroke
	icon_state = "telescreenb"

/obj/structure/prop/urban/misc/machinery/screens/telescreenbrokespark
	icon_state = "telescreenbspark"

// Multi-Monitor

//Green
/obj/structure/prop/urban/misc/machinery/screens/multimonitorsmall_off
	icon_state = "multimonitorsmall_off"

/obj/structure/prop/urban/misc/machinery/screens/multimonitorsmall_on
	icon_state = "multimonitorsmall_on"

/obj/structure/prop/urban/misc/machinery/screens/multimonitormedium_off
	icon_state = "multimonitormedium_off"

/obj/structure/prop/urban/misc/machinery/screens/multimonitormedium_on
	icon_state = "multimonitormedium_on"

/obj/structure/prop/urban/misc/machinery/screens/multimonitorbig_off
	icon_state = "multimonitorbig_off"

/obj/structure/prop/urban/misc/machinery/screens/multimonitorbig_on
	icon_state = "multimonitorbig_on"

// Blue

/obj/structure/prop/urban/misc/machinery/screens/bluemultimonitorsmall_off
	icon_state = "bluemultimonitorsmall_off"

/obj/structure/prop/urban/misc/machinery/screens/bluemultimonitorsmall_on
	icon_state = "bluemultimonitorsmall_on"

/obj/structure/prop/urban/misc/machinery/screens/bluemultimonitormedium_off
	icon_state = "bluemultimonitormedium_off"

/obj/structure/prop/urban/misc/machinery/screens/bluemultimonitormedium_on
	icon_state = "bluemultimonitormedium_on"

/obj/structure/prop/urban/misc/machinery/screens/bluemultimonitorbig_off
	icon_state = "bluemultimonitorbig_off"

/obj/structure/prop/urban/misc/machinery/screens/bluemultimonitorbig_on
	icon_state = "bluemultimonitorbig_on"

// Egg
/obj/structure/prop/urban/misc/machinery/screens/wallegg_off
	icon_state = "wallegg_off"

/obj/structure/prop/urban/misc/machinery/screens/wallegg_on
	icon_state = "wallegg_on"

/obj/structure/prop/urban/misc/fake/pipes
	name = "处理管道"
	desc = "一根小管道。"

/obj/structure/prop/urban/misc/fake/pipes/pipe1
	layer = 2
	icon_state = "pipe-s"

/obj/structure/prop/urban/misc/fake/pipes/pipe2
	layer = 2
	icon_state = "pipe-c"

/obj/structure/prop/urban/misc/fake/pipes/pipe3
	layer = 2
	icon_state = "pipe-j1"

/obj/structure/prop/urban/misc/fake/pipes/pipe4
	layer = 2
	icon_state = "pipe-y"

/obj/structure/prop/urban/misc/fake/pipes/pipe5
	layer = 2
	icon_state = "pipe-b"

/obj/structure/prop/urban/misc/fake/wire
	name = "电源线"
	desc = "用于导电的小规格电线。"
	layer = ABOVE_NORMAL_TURF_LAYER

/obj/structure/prop/urban/misc/fake/wire/red
	layer = 2
	icon_state = "intactred"

/obj/structure/prop/urban/misc/fake/wire/yellow
	layer = 2
	icon_state = "intactyellow"

/obj/structure/prop/urban/misc/fake/wire/blue
	layer = 2
	icon_state = "intactblue"


/obj/structure/prop/urban/misc/fake/heavydutywire
	name = "重型线缆"
	desc = "用于导电的重型电线。"

/obj/structure/prop/urban/misc/fake/heavydutywire/heavy1
	layer = 2
	icon_state = "0-1"

/obj/structure/prop/urban/misc/fake/heavydutywire/heavy2
	layer = 2
	icon_state = "1-2"

/obj/structure/prop/urban/misc/fake/heavydutywire/heavy3
	layer = 2
	icon_state = "1-4"

/obj/structure/prop/urban/misc/fake/heavydutywire/heavy4
	layer = 2
	icon_state = "1-2-4"

/obj/structure/prop/urban/misc/fake/heavydutywire/heavy5
	layer = 2
	icon_state = "1-2-4-8"

/obj/structure/prop/urban/misc/fake/lattice
	name = "结构晶格"

/obj/structure/prop/urban/misc/fake/lattice/full
	icon_state = "latticefull"
	layer = 2

// Barriers

/obj/structure/prop/urban/misc/road
	name = "路障"
	desc = "用于阻挡进入的塑料屏障。"

/obj/structure/prop/urban/misc/road/roadbarrierred
	icon_state = "roadbarrier"

/obj/structure/prop/urban/misc/road/roadbarrierredlong
	icon_state = "roadbarrier4"

/obj/structure/prop/urban/misc/road/roadbarrierblue
	icon_state = "roadbarrier2"

/obj/structure/prop/urban/misc/road/roadbarrierbluelong
	icon_state = "roadbarrier5"

/obj/structure/prop/urban/misc/road/roadbarrierwyblack
	icon_state = "roadbarrier3"

/obj/structure/prop/urban/misc/road/roadbarrierwyblacklong
	icon_state = "roadbarrier6"

/obj/structure/prop/urban/misc/road/roadbarrierwyblackjoined
	icon_state = "roadbarrierjoined3"

/obj/structure/prop/urban/misc/road/roadbarrierjoined
	icon_state = "roadbarrierjoined"

/obj/structure/prop/urban/misc/road/wood
	name = "路障"
	desc = "一道用于阻挡进入的木制屏障。"
	icon_state = "roadbarrierwood"

/obj/structure/prop/urban/misc/road/wood/roadbarrierwoodorange
	icon_state = "roadbarrierwood"

/obj/structure/prop/urban/misc/road/wood/roadbarrierwoodblue
	icon_state = "roadbarrierpolice"

// Cargo Containers extended

/obj/structure/prop/urban/containersextended
	name = "货物集装箱"
	desc = "一个货物集装箱。"
	icon = 'icons/obj/structures/prop/urban/containersextended.dmi'
	icon_state = "blackwyleft"
	bound_width = 32
	bound_height = 32
	density = TRUE
	max_integrity = 200
	opacity = TRUE
	anchored = TRUE
	layer = 5

/obj/structure/prop/urban/containersextended/blueleft
	name = "货物集装箱"
	icon_state = "blueleft"

/obj/structure/prop/urban/containersextended/blueright
	name = "货物集装箱"
	icon_state = "blueright"

/obj/structure/prop/urban/containersextended/greenleft
	name = "货物集装箱"
	icon_state = "greenleft"

/obj/structure/prop/urban/containersextended/greenright
	name = "货物集装箱"
	icon_state = "greenright"

/obj/structure/prop/urban/containersextended/tanleft
	name = "货物集装箱"
	icon_state = "tanleft"

/obj/structure/prop/urban/containersextended/tanright
	name = "货物集装箱"
	icon_state = "tanright"

/obj/structure/prop/urban/containersextended/redleft
	name = "货物集装箱"
	icon_state = "redleft"

/obj/structure/prop/urban/containersextended/redright
	name = "货物集装箱"
	icon_state = "redright"

/obj/structure/prop/urban/containersextended/greywyleft
	name = "\improper 纳米传讯货物集装箱"
	icon_state = "greywyleft"

/obj/structure/prop/urban/containersextended/greywyright
	name = "\improper 纳米传讯货物集装箱"
	icon_state = "greywyright"

/obj/structure/prop/urban/containersextended/lightgreywyleft
	name = "\improper 纳米传讯货柜"
	icon_state = "lightgreywyleft"

/obj/structure/prop/urban/containersextended/lightgreywyright
	name = "\improper 纳米传讯货物集装箱"
	icon_state = "lightgreywyright"

/obj/structure/prop/urban/containersextended/blackwyleft
	name = "\improper 纳米传讯货物集装箱"
	icon_state = "blackwyleft"

/obj/structure/prop/urban/containersextended/blackwyright
	name = "\improper 纳米传讯货柜"
	icon_state = "blackwyright"

/obj/structure/prop/urban/containersextended/whitewyleft
	name = "\improper 纳米传讯货物集装箱"
	icon_state = "whitewyleft"

/obj/structure/prop/urban/containersextended/whitewyright
	name = "\improper 纳米传讯货柜"
	icon_state = "whitewyright"

/obj/structure/prop/urban/containersextended/tanwywingsleft
	name = "货物集装箱"
	icon_state = "tanwywingsleft"

/obj/structure/prop/urban/containersextended/tanwywingsright
	name = "货物集装箱"
	icon_state = "tanwywingsright"

/obj/structure/prop/urban/containersextended/greenwywingsleft
	name = "货物集装箱"
	icon_state = "greenwywingsleft"

/obj/structure/prop/urban/containersextended/greenwywingsright
	name = "货物集装箱"
	icon_state = "greenwywingsright"

/obj/structure/prop/urban/containersextended/bluewywingsleft
	name = "货物集装箱"
	icon_state = "bluewywingsleft"

/obj/structure/prop/urban/containersextended/bluewywingsright
	name = "货物集装箱"
	icon_state = "bluewywingsright"

/obj/structure/prop/urban/containersextended/redwywingsleft
	name = "货物集装箱"
	icon_state = "redwywingsleft"

/obj/structure/prop/urban/containersextended/redwywingsright
	name = "货物集装箱"
	icon_state = "redwywingsright"

/obj/structure/prop/urban/containersextended/medicalleft
	name = "医疗货物集装箱"
	icon_state = "medicalleft"

/obj/structure/prop/urban/containersextended/medicalright
	name = "医疗货物集装箱"
	icon_state = "medicalright"

/obj/structure/prop/urban/containersextended/emptymedicalleft
	name = "医疗货物集装箱"
	icon_state = "emptymedicalleft"

/obj/structure/prop/urban/containersextended/emptymedicalright
	name = "医疗货物集装箱"
	icon_state = "emptymedicalright"

/obj/structure/prop/urban/containersextended/graffiti
	name = "被涂污的货柜"
	icon_state = "grafcontain_l"

/obj/structure/prop/urban/containersextended/graffiti/two
	name = "被涂污的货物集装箱"
	icon_state = "grafcontain_rm"

/obj/structure/prop/urban/containersextended/graffiti/three
	name = "被涂污的货物集装箱"
	icon_state = "grafcontain_r"

/obj/structure/prop/urban/containersextended/graffiti/four
	name = "被涂污的货柜"
	icon_state = "grafcontain2_l"

/obj/structure/prop/urban/containersextended/graffiti/five
	name = "被涂污的货物集装箱"
	icon_state = "grafcontain2_rm"

/obj/structure/prop/urban/containersextended/graffiti/six
	name = "被涂污的货柜"
	icon_state = "grafcontain2_r"

/obj/structure/prop/urban/containersextended/graffiti/seven
	name = "被涂污的货物集装箱"
	icon_state = "grafcontain3_l"

/obj/structure/prop/urban/containersextended/graffiti/eight
	name = "被涂污的货柜"
	icon_state = "grafcontain3_rm"

/obj/structure/prop/urban/containersextended/graffiti/nine
	name = "被涂污的货柜"
	icon_state = "grafcontain3_r"

/// Fake Platforms

/obj/structure/prop/urban/fakeplatforms
	name = "平台"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	icon = 'icons/obj/structures/prop/urban/urbanrandomprops.dmi'

/obj/structure/prop/urban/fakeplatforms/platform1
	icon_state = "engineer_platform"

/obj/structure/prop/urban/fakeplatforms/platform2
	icon_state = "engineer_platform_platformcorners"

/obj/structure/prop/urban/fakeplatforms/platform3
	icon_state = "platform"

/obj/structure/prop/urban/fakeplatforms/platform4
	icon_state = "zenithplatform3"

/obj/structure/prop/urban/fakeplatforms/rockplatform
	icon_state = "kutjevo_rockdark_fake"
	icon = 'icons/obj/structures/platforms.dmi'

// Grille

/obj/structure/prop/urban/misc/highvoltagegrille
	icon_state = "highvoltagegrille"

// Greeblies
/obj/structure/prop/urban/misc/buildinggreeblies
	name = "机械装置"
	desc = "墙上附着着一台奇怪的机器……"
	icon = 'icons/obj/structures/prop/urban/64x64_urbanrandomprops.dmi'
	icon_state = "buildingventbig1"
	bound_width = 64
	bound_height = 32
	density = FALSE
	max_integrity = 200
	anchored = TRUE
	layer = 5
	coverage = 50

/obj/structure/prop/urban/misc/buildinggreeblies/dense
	density = TRUE

/obj/structure/prop/urban/misc/buildinggreeblies/greeble1
	icon_state = "buildingventbig2"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble1/dense
	density = TRUE

/obj/structure/prop/urban/misc/buildinggreeblies/greeble2
	icon_state = "buildingventbig3"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble2/dense
	density = TRUE

/obj/structure/prop/urban/misc/buildinggreeblies/greeble3
	icon_state = "buildingventbig4"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble3/dense
	density = TRUE

/obj/structure/prop/urban/misc/buildinggreeblies/greeble4
	icon_state = "buildingventbig5"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble4/dense
	density = TRUE

/obj/structure/prop/urban/misc/buildinggreeblies/greeble5
	icon_state = "buildingventbig6"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble5/dense
	density = TRUE

/obj/structure/prop/urban/misc/buildinggreeblies/greeble6
	icon_state = "buildingventbig7"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble6/dense
	density = TRUE

/obj/structure/prop/urban/misc/buildinggreeblies/greeble7
	icon_state = "buildingventbig8"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble7/dense
	density = TRUE

/obj/structure/prop/urban/misc/buildinggreeblies/greeble8
	icon_state = "buildingventbig9"
	bound_width = 32

/obj/structure/prop/urban/misc/buildinggreeblies/greeble8/dense
	density = TRUE

/obj/structure/prop/urban/misc/buildinggreeblies/greeble9
	icon_state = "buildingventbig10"
	bound_width = 32

/obj/structure/prop/urban/misc/buildinggreeblies/greeble9/dense
	density = TRUE

/obj/structure/prop/urban/misc/buildinggreeblies/greeble10
	icon_state = "buildingventbig11"
	bound_width = 32
	bound_height = 64

/obj/structure/prop/urban/misc/buildinggreeblies/greeble10/dense
	density = TRUE

/obj/structure/prop/urban/misc/buildinggreeblies/greeble11
	icon_state = "buildingventbig12"
	bound_width = 32
	bound_height = 64

/obj/structure/prop/urban/misc/buildinggreeblies/greeble11/dense
	density = TRUE

/obj/structure/prop/urban/misc/buildinggreeblies/greeble12
	icon_state = "buildingventbig13"
	bound_width = 32
	bound_height = 64

/obj/structure/prop/urban/misc/buildinggreeblies/greeble12/dense
	density = TRUE

/obj/structure/prop/urban/misc/buildinggreebliessmall
	name = "通风管道"
	desc = "一小块外观奇特的机械装置..."
	icon_state = "smallwallvent1"
	density = FALSE

/obj/structure/prop/urban/misc/buildinggreebliessmall2
	name = "通风口"
	icon_state = "smallwallvent2"

/obj/structure/prop/urban/misc/buildinggreebliessmall2
	name = "通风管道"
	icon_state = "smallwallvent2"

/obj/structure/prop/urban/misc/buildinggreebliessmall3
	name = "通风管道"
	icon_state = "smallwallvent3"


/obj/structure/prop/urban/misc/buildinggreebliessmall/computer
	name = "机械装置"
	icon_state = "zcomputermachine"
	density = TRUE

/obj/structure/prop/urban/misc/metergreen
	name = "米"
	desc = "能量计量表，用于测量能量波动。"
	icon_state = "biggreenmeter1"


// MISC
/obj/structure/prop/urban/misc/concretestatue
	name = "混凝土雕像"
	desc = "一座装饰性雕像，上面装饰着纳米传讯的'翅膀'标志，是一件企业粗野主义风格的艺术品。"
	icon = 'icons/obj/structures/prop/urban/64x64_urbanrandomprops.dmi'
	icon_state = "concretesculpture"
	bound_width = 64
	bound_height = 64
	density = TRUE
	anchored = TRUE

/obj/structure/prop/urban/misc/detonator
	name = "引爆器"
	desc = "引爆器，已装填完毕，随时可用。"
	icon_state = "detonator"
	density = FALSE
	anchored = TRUE
	var/id = 1
	var/range = 15

/obj/structure/prop/urban/misc/firehydrant
	name = "消防栓"
	desc = "消防栓公共出水口，专为快速取水而设计。"
	icon_state = "firehydrant"
	density = FALSE
	anchored = TRUE
	resistance_flags = XENO_DAMAGEABLE
	max_integrity = 150

/obj/structure/prop/urban/misc/phonebox
	name = "电话亭"
	desc = "一个电话亭，看起来无法使用，线路肯定断了。"
	icon = 'icons/obj/structures/prop/urban/64x64_urbanrandomprops.dmi'
	icon_state = "phonebox_closed"
	layer = ABOVE_MOB_LAYER
	bound_width = 32
	bound_height = 32
	density = TRUE
	anchored = TRUE

/obj/structure/prop/urban/misc/phonebox/broken
	desc = "一个电话亭，看起来已经坏了，线路肯定断了。玻璃也碎了。"
	icon_state = "phonebox_closed_broken"

/obj/structure/prop/urban/misc/phonebox/lightup
	desc = "一个电话亭，看起来无法使用，线路肯定断了。"
	icon_state = "phonebox_closed_light"

/obj/structure/prop/urban/misc/bench
	name = "工作台"
	desc = "一个金属框架，配有合成皮革座椅，随着时间流逝已经褪色。"
	icon = 'icons/obj/structures/prop/urban/64x64_urbanrandomprops.dmi'
	icon_state = "seatedbench"
	bound_width = 32
	bound_height = 64
	layer = 4
	density = FALSE
	max_integrity = 200
	anchored = TRUE
	resistance_flags = XENO_DAMAGEABLE

// Signs

/obj/structure/prop/urban/signs
	name = "霓虹灯牌"
	icon = 'icons/obj/structures/prop/urban/urban64x64_signs.dmi'
	icon_state = "jacksopen_on"
	bound_height = 64
	bound_width = 64
	layer = ABOVE_MOB_LAYER
	resistance_flags = XENO_DAMAGEABLE
	max_integrity = 80

/obj/structure/prop/urban/signs/casniosign
	name = "赌场招牌"
	icon_state = "nightgoldcasinoopen_on"

/obj/structure/prop/urban/signs/jackssign
	name = "杰克军品店招牌"
	icon_state = "jacksopen_on"

/obj/structure/prop/urban/signs/opensign
	name = "营业中"
	icon_state = "open_on"
/obj/structure/prop/urban/signs/opensign2
	name = "营业中"
	icon_state = "open_on2"

/obj/structure/prop/urban/signs/pizzasign
	name = "披萨招牌"
	icon_state = "pizzaneon_on"

/obj/structure/prop/urban/signs/weymartsign
	name = "军械库"
	icon_state = "weymartsign2"

/obj/structure/prop/urban/signs/mechanicsign
	name = "机械师标识"
	icon_state = "mechanicopen_on2"

/obj/structure/prop/urban/signs/cuppajoessign
	name = "乔氏咖啡的招牌"
	icon_state = "cuppajoes"

/obj/structure/prop/urban/signs/barsign
	name = "酒吧招牌"
	icon_state = "barsign_on"

// Small Sign
/obj/structure/prop/urban/signs/high_voltage
	name = "警告标志"
	desc = "危险 - 高压电 - 致命！"
	icon = 'icons/obj/structures/prop/urban/urbanrandomprops.dmi'
	icon_state = "shockyBig"

/obj/structure/prop/urban/signs/high_voltage/small
	name = "警告标志"
	desc = "危险 - 高压电 - 致命！"
	icon = 'icons/obj/structures/prop/urban/urbanrandomprops.dmi'
	icon_state = "shockyTiny"

// billboards, Signs and Posters

/// Alien Isolation - posters used as reference (direct downscale of the image for some) If anyone wants to name the billboards individually ///
/obj/structure/prop/urban/billboardsandsigns/bigbillboards
	name = "广告牌"
	desc = "广告牌。"
	icon = 'icons/obj/structures/prop/urban/32x64_urbanbillboards.dmi'
	icon_state = "billboard_bigger"
	density = FALSE
	max_integrity = 200
	anchored = TRUE

/obj/structure/prop/urban/billboardsandsigns/bigbillboards/billboard1
	icon_state = "billboard1"

/obj/structure/prop/urban/billboardsandsigns/bigbillboards/billboard2
	icon_state = "billboard2"

/obj/structure/prop/urban/billboardsandsigns/bigbillboards/billboard3
	icon_state = "billboard3"

/obj/structure/prop/urban/billboardsandsigns/bigbillboards/billboard4
	icon_state = "billboard4"

/obj/structure/prop/urban/billboardsandsigns/bigbillboards/billboard5
	icon_state = "billboard5"

// Big Road Signs
/obj/structure/prop/urban/billboardsandsigns/bigroadsigns
	name = "路牌"
	desc = "一个路标。"
	icon = 'icons/obj/structures/prop/urban/64x64_urbanrandomprops.dmi'
	icon_state = "roadsign_1"
	bound_width = 64
	bound_height = 32
	density = FALSE
	max_integrity = 200
	anchored = TRUE
	layer = 8

/obj/structure/prop/urban/billboardsandsigns/bigroadsigns/road_sign_1
	icon_state = "roadsign_1"

/obj/structure/prop/urban/billboardsandsigns/bigroadsigns/road_sign_2
	icon_state = "roadsign_2"

// Car Factory

/obj/structure/prop/urban/factory
	icon = 'icons/obj/structures/prop/urban/64x64_urbanrandomprops.dmi'
	icon_state = "factory_roboticarm"

/obj/structure/prop/urban/factory/robotic_arm
	name = "机械臂"
	desc = "用于建造'子午线'牌汽车的机械臂。"
	icon_state = "factory_roboticarm"
	bound_width = 64
	bound_height = 32
	anchored = TRUE

/obj/structure/prop/urban/factory/robotic_arm/flipped
	icon_state = "factory_roboticarm2"

/obj/structure/prop/urban/factory/conveyor_belt
	name = "大型传送带"
	desc = "工业工厂中使用的大型传送带。"
	icon_state = "factory_conveyer"
	density = FALSE


// Hybrisa Lattice

/obj/structure/prop/urban/lattice_prop
	desc = "一个支撑结构。"
	name = "格栅"
	icon = 'icons/obj/structures/prop/urban/urban_lattice.dmi'
	icon_state = "lattice1"
	density = FALSE
	layer = RIPPLE_LAYER
	max_integrity = 6000

/obj/structure/prop/urban/lattice_prop/lattice_1
	icon_state = "lattice1"

/obj/structure/prop/urban/lattice_prop/lattice_2
	icon_state = "lattice2"

/obj/structure/prop/urban/lattice_prop/lattice_3
	icon_state = "lattice3"

/obj/structure/prop/urban/lattice_prop/lattice_4
	icon_state = "lattice4"

/obj/structure/prop/urban/lattice_prop/lattice_5
	icon_state = "lattice5"

/obj/structure/prop/urban/lattice_prop/lattice_6
	icon_state = "lattice6"
