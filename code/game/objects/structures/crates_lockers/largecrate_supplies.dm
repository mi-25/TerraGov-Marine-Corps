/*SPAWNING LANDMARKS*/
//Check below to see what the crates contain, these landmarks will spawn in a bunch of crates at once, to make it easy to spawn in supplies.
/obj/effect/landmark/supplyspawner
	name = "补给生成器"
	var/list/supply = list()

/obj/effect/landmark/supplyspawner/Initialize(mapload)
	. = ..()
	if(/turf/open in range(1))
		var/list/T = list()
		for(var/turf/open/O in range(1))
			T += O
		if(length(supply))
			for(var/s in supply)
				var/amount = supply[s]
				for(var/i = 1, i <= amount, i++)
					new s (pick(T))
	return INITIALIZE_HINT_QDEL


/obj/effect/landmark/supplyspawner/weapons
	name = "武器补给"
	supply = list(
		/obj/structure/largecrate/supply/weapons/standard_carbine = 2,
		/obj/structure/largecrate/supply/weapons/shotgun = 2,
		/obj/structure/largecrate/supply/weapons/standard_smg = 2,
		/obj/structure/largecrate/supply/weapons/pistols = 2,
		/obj/structure/largecrate/supply/weapons/flamers = 2,
		/obj/structure/largecrate/supply/weapons/hpr = 2,
		/obj/structure/closet/crate/mortar_ammo/mortar_kit = 1,
		/obj/structure/largecrate/supply/explosives/mines = 2,
		/obj/structure/largecrate/supply/explosives/grenades = 2,
	)

/obj/effect/landmark/supplyspawner/ammo
	name = "弹药补给"
	supply = list(
		/obj/structure/largecrate/supply/ammo/m41a = 4,
		/obj/structure/largecrate/supply/ammo/m41a_box = 4,
		/obj/structure/largecrate/supply/ammo/shotgun = 4,
		/obj/structure/largecrate/supply/ammo/standard_smg = 4,
		/obj/structure/largecrate/supply/ammo/pistol = 4,
	)

/obj/effect/landmark/supplyspawner/engineering
	name = "工程物资"
	supply = list(
		/obj/structure/largecrate/supply/supplies/metal = 5,
		/obj/structure/largecrate/supply/supplies/plasteel = 3,
		/obj/structure/largecrate/supply/supplies/sandbags = 5,
		/obj/structure/largecrate/supply/generator = 1,
		/obj/structure/largecrate/supply/floodlights = 2,
		/obj/structure/largecrate/supply/supplies/flares = 3,
		/obj/structure/largecrate/supply/powerloader = 1,
	)

/obj/effect/landmark/supplyspawner/turrets
	name = "防御性炮台补给"
	supply = list(
		/obj/structure/largecrate/supply/weapons/sentries = 2,
		/obj/structure/largecrate/supply/weapons/standard_hmg = 2,
		/obj/structure/largecrate/supply/ammo/sentry = 1,
		/obj/structure/largecrate/supply/ammo/standard_hmg = 1,
	)

/obj/effect/landmark/supplyspawner/food
	name = "食品板条箱补给"
	supply = list(/obj/structure/largecrate/supply/supplies/mre = 3, /obj/structure/largecrate/supply/supplies/water = 2)

/obj/effect/landmark/supplyspawner/medical
	name = "医疗物资"
	supply = list(
		/obj/structure/largecrate/supply/medicine/medkits = 2,
		/obj/structure/largecrate/supply/medicine/blood = 2,
		/obj/structure/largecrate/supply/medicine/iv = 2,
		/obj/structure/largecrate/supply/medicine/medivend = 2,
		/obj/structure/largecrate/machine/autodoc = 3,
		/obj/structure/largecrate/machine/bodyscanner = 1,
		/obj/structure/largecrate/machine/sleeper = 2,
		/obj/structure/largecrate/supply/medicine/optable = 1,
		/obj/structure/largecrate/supply/supplies/tables_racks = 1,
	)
/*NEW SUPPLY CRATES*/
//Lotsocrates for lotsosupplies for events, meaning less setup time.
//Wooden crates and not metal ones so we don't have a ton of metal crates laying around
//SHOULD contain everything needed for events. Should.

/obj/structure/largecrate/supply
	name = "补给板条箱"
	var/list/supplies = list()

/obj/structure/largecrate/supply/Initialize(mapload)
	. = ..()
	if(length(supplies))
		for(var/s in supplies)
			var/amount = supplies[s]
			for(var/i = 1, i <= amount, i++)
				new s (src)

/obj/structure/largecrate/supply/weapons
	name = "武器箱"
	icon_state = "chest"

/obj/structure/largecrate/supply/weapons/standard_carbine
	name = "\improper AR-18卡宾枪武器箱（x10）"
	desc = "一个装有十把AR-18卡宾枪的武器箱。"
	supplies = list(/obj/item/weapon/gun/rifle/standard_carbine = 10)

/obj/structure/largecrate/supply/weapons/shotgun
	name = "\improper SH-35 泵动式霰弹枪武器箱 (x10)"
	desc = "一个装有十把SH-35泵动式霰弹枪的武器箱。"
	supplies = list(/obj/item/weapon/gun/shotgun/pump/t35 = 10)

/obj/structure/largecrate/supply/weapons/standard_smg
	name = "\improper SMG-90冲锋枪武器箱（x8）"
	desc = "一个装有八支SMG-90冲锋枪的武器箱。"
	supplies = list(/obj/item/weapon/gun/smg/standard_smg = 8)

/obj/structure/largecrate/supply/weapons/pistols
	name = "手枪武器箱 (x20)"
	desc = "一个武器箱，内含八把R-44左轮手枪和十二把P-14制式手枪。"
	supplies = list(/obj/item/weapon/gun/revolver/standard_revolver = 6, /obj/item/weapon/gun/pistol/standard_pistol = 12)

/obj/structure/largecrate/supply/weapons/flamers
	name = "\improper FL-240 焚化武器箱（x4）"
	desc = "一个装有四台FL-240焚化器单元的武器箱。"
	supplies = list(/obj/item/weapon/gun/flamer/big_flamer = 4)

/obj/structure/largecrate/supply/weapons/hpr
	name = "\improper MG-42轻机枪武器箱（x2）"
	desc = "一个武器箱，内含两挺MG-42轻机枪。"
	supplies = list(/obj/item/weapon/gun/rifle/standard_lmg = 2)

/obj/structure/largecrate/supply/weapons/sentries
	name = "\improper ST-571 哨戒炮箱 (x2)"
	desc = "一个补给板条箱，内装两套盒装ST-571哨戒炮。"
	supplies = list(/obj/item/storage/box/crate/sentry = 2)

/obj/structure/largecrate/supply/weapons/standard_hmg
	name = "\improper HSG-102 车载重型智能机枪炮塔 (x2)"
	desc = "一个装有两只箱装HSG-102重型智能机枪的补给板条箱。"
	supplies = list(/obj/item/storage/box/hsg_102 = 2)

/obj/structure/largecrate/supply/weapons/standard_atgun
	name = "\improper AT-36 反坦克炮及弹药箱（x1，x10）"
	desc = "一个补给板条箱，内含一门AT-36及一套完整的弹药，用于装填侧舷炮。"
	supplies = list(
		/obj/item/weapon/gun/standard_atgun = 1,
		/obj/item/ammo_magazine/standard_atgun = 4,
		/obj/item/ammo_magazine/standard_atgun/apcr = 3,
		/obj/item/ammo_magazine/standard_atgun/he = 3,
	)

/obj/structure/largecrate/supply/weapons/standard_flakgun
	name = "\improper ATR-22 防空炮及弹药箱 (x1, x6)"
	desc = "一个补给板条箱，内含一门ATR-22和一套完整的弹药，用于装填侧舷炮。"
	supplies = list(
		/obj/item/weapon/gun/standard_auto_cannon = 1,
		/obj/item/ammo_magazine/auto_cannon = 3,
		/obj/item/ammo_magazine/auto_cannon/flak = 3,
	)

/obj/structure/largecrate/supply/weapons/heavy_flakgun
	name = "\improper FK-88 架设式防空炮（x1）"
	desc = "一个装有FK-88高射炮的补给板条箱。弹药另售。"
	supplies = list(/obj/item/weapon/gun/heavy_isg = 1)

/obj/structure/largecrate/supply/ammo
	name = "弹药箱"
	icon_state = "case"

/obj/structure/largecrate/supply/ammo/m41a
	name = "\improper PR-412 弹匣箱 (x20)"
	desc = "一个装有20个PR-412弹匣的弹药箱。"
	supplies = list(/obj/item/ammo_magazine/rifle = 20)

/obj/structure/largecrate/supply/ammo/m41a_box
	name = "\improper PR-412 弹药箱（x4）"
	desc = "一个弹药箱，内装四盒PR-412型600发弹药。"
	supplies = list(/obj/item/big_ammo_box = 4)

/obj/structure/largecrate/supply/ammo/shotgun
	name = "12号口径弹药板条箱（x20）"
	desc = "一个弹药箱，内装八盒独头弹、八盒鹿弹和八盒箭弹。"
	supplies = list(/obj/item/ammo_magazine/shotgun = 8, /obj/item/ammo_magazine/shotgun/buckshot = 8, /obj/item/ammo_magazine/shotgun/flechette = 8)

/obj/structure/largecrate/supply/ammo/standard_smg
	name = "\improper SMG-90 弹匣箱 (x16)"
	desc = "一个装有十六个SMG-90冲锋枪弹匣的弹药箱。"
	supplies = list(/obj/item/ammo_magazine/smg/standard_smg = 16)

/obj/structure/largecrate/supply/ammo/pistol
	name = "手枪弹药箱（x40发）"
	desc = "一个弹药箱，内装十六个R-44快速装弹器，以及二十四个P-14弹匣。"
	supplies = list(/obj/item/ammo_magazine/revolver/standard_revolver = 16, /obj/item/ammo_magazine/pistol/standard_pistol = 24)

/obj/structure/largecrate/supply/ammo/sentry
	name = "\improper ST-571 弹药鼓箱 (x6)"
	desc = "一个装有六发ST-571哨戒炮弹药的弹药箱。"
	supplies = list(/obj/item/ammo_magazine/sentry = 6)

/obj/structure/largecrate/supply/ammo/standard_hmg
	name = "\improper HSG-102 弹药箱（x6）"
	desc = "一个装有六盒HSG-102弹药的弹药箱。"
	supplies = list(/obj/item/ammo_magazine/hsg_102 = 6)

/obj/structure/largecrate/supply/ammo/standard_ammo
	name = "大型剩余弹药板条箱"
	desc = "一个弹药箱，内含地球政府殖民地海军陆战队品牌各类型弹药各一盒。"
	icon_state = "chest"
	supplies = list(
		/obj/item/shotgunbox = 1,
		/obj/item/shotgunbox/buckshot = 1,
		/obj/item/shotgunbox/flechette = 1,
		/obj/item/shotgunbox/tracker = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_pistol/full = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_heavypistol/full = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_revolver/full = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_pocketpistol/full = 1,
		/obj/item/storage/box/visual/magazine/compact/vp70/full = 1,
		/obj/item/storage/box/visual/magazine/compact/plasma_pistol/full = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_smg/full = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_machinepistol/full = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_heavysmg/full = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_assaultrifle/full = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_carbine/full = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_skirmishrifle/full = 1,
		/obj/item/storage/box/visual/magazine/compact/ar11/full = 1,
		/obj/item/storage/box/visual/magazine/compact/lasrifle/full = 1,
		/obj/item/storage/box/visual/magazine/compact/sh15/flechette/full = 1,
		/obj/item/storage/box/visual/magazine/compact/sh15/slug/full = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_dmr/full = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_br/full = 1,
		/obj/item/storage/box/visual/magazine/compact/chamberedrifle/full = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_lmg/full = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_gpmg/full = 1,
		/obj/item/storage/box/visual/magazine/compact/standard_mmg/full = 1,
	)



/obj/structure/largecrate/supply/explosives
	name = "爆炸物补给板条箱"
	desc = "一个装有炸药的箱子。"
	icon_state = "case_double"

/obj/structure/largecrate/supply/explosives/mines
	name = "\improper M20阔剑雷箱（x20）"
	desc = "一个装有五盒四枚装M20阔剑的箱子。"
	supplies = list(/obj/item/storage/box/explosive_mines = 5)

/obj/structure/largecrate/supply/explosives/grenades
	name = "\improper M40 HEDP 手雷箱 (x50)"
	desc = "一个装有二十五枚M40 HDEP手雷的箱子。"
	supplies = list(/obj/item/storage/box/visual/grenade/frag = 2)

/obj/structure/largecrate/supply/explosives/mortar_he
	name = "80毫米高爆迫击炮弹壳（x25）"
	desc = "装有二十五枚80毫米高爆迫击炮弹的弹药箱。"
	supplies = list(/obj/item/mortal_shell/he = 25)

/obj/structure/largecrate/supply/explosives/mortar_incend
	name = "80毫米燃烧迫击炮弹壳（x25）"
	desc = "一个装有二十五枚80毫米燃烧迫击炮弹的弹药箱。"
	supplies = list(/obj/item/mortal_shell/incendiary = 25)

/obj/structure/largecrate/supply/explosives/mortar_flare
	name = "80毫米照明弹迫击炮弹壳（x25）"
	desc = "一个装有二十五发80毫米照明弹迫击炮弹的箱子。"
	supplies = list(/obj/item/mortal_shell/flare = 25)

/obj/structure/largecrate/supply/explosives/disposable
	name = "\improper RL-72 一次性火箭发射器板条箱 (x8)"
	desc = "一个装有八枚RL-72单次使用火箭筒的箱子。"
	supplies = list(/obj/item/weapon/gun/launcher/rocket/oneuse = 8)

/obj/structure/largecrate/supply/supplies
	name = "补给板条箱"
	icon_state = "secure_crate"

/obj/structure/largecrate/supply/supplies/flares
	name = "照明弹补给板条箱 (x140)"
	desc = "一个补给板条箱，内含十盒照明弹，每盒十四发。"
	supplies = list(/obj/item/storage/box/m94 = 10)

/obj/structure/largecrate/supply/supplies/coifs
	name = "隔热头套补给板条箱（x25）"
	desc = "一个装有二十五顶吸热头罩的补给板条箱。"
	supplies = list(/obj/item/clothing/mask/rebreather/scarf = 25)

/obj/structure/largecrate/supply/supplies/metal
	name = "金属板补给板条箱（x200）"
	desc = "一个装有四组五十张金属板的补给板条箱。"
	supplies = list(/obj/item/stack/sheet/metal/large_stack = 4)

/obj/structure/largecrate/supply/supplies/plasteel
	name = "塑钢补给板条箱 (x60)"
	desc = "一个装有2叠30张塑钢板的补给板条箱。"
	supplies = list(/obj/item/stack/sheet/plasteel/medium_stack = 2)

/obj/structure/largecrate/supply/supplies/sandbags
	name = "沙袋补给板条箱 (x100)"
	desc = "一个装有四堆沙袋的补给板条箱，每堆二十五袋。"
	supplies = list(/obj/item/stack/sandbags/large_stack = 4)

/obj/structure/largecrate/supply/supplies/tables_racks
	name = "存储解决方案板条箱 (x10, x10)"
	desc = "一个装有十个桌板零件和十个货架零件的板条箱，便于快速搭建存储设施。"
	supplies = list(/obj/item/frame/table = 10, /obj/item/frame/rack = 10)

/obj/structure/largecrate/supply/supplies/mre
	name = "\improper 地球政府殖民地海军陆战队单兵即食口粮板条箱 (x50)"
	desc = "一个装有五十份地球政府殖民地海军陆战队单兵即食口粮的补给板条箱。"
	supplies = list(/obj/item/storage/box/MRE = 50)

/obj/structure/largecrate/supply/supplies/water
	name = "\improper 纳米传讯瓶装水板条箱 (x50)"
	desc = "一个装有五十瓶纳米传讯瓶装泉水的板条箱。"
	supplies = list(/obj/item/reagent_containers/food/drinks/cans/waterbottle = 50)

/obj/structure/largecrate/supply/powerloader
	name = "\improper 毛虫P-5000型工作装载机板条箱"
	desc = "一个装有折叠但完全组装好的卡特彼勒P-5000工作装载机的板条箱。"
	supplies = list(/obj/vehicle/ridden/powerloader = 1)

/obj/structure/largecrate/supply/floodlights
	name = "探照灯板条箱 (x4)"
	desc = "装有四个泛光灯的板条箱。"
	supplies = list(/obj/machinery/floodlight = 4)

/obj/structure/largecrate/supply/generator
	name = "\improper P.A.C.M.A.N. 板条箱"
	desc = "一个装有P.A.C.M.A.N.发电机、一些燃料和一些电缆线圈的板条箱，用于启动和运行你的电力系统。"
	supplies = list(/obj/machinery/power/port_gen/pacman = 1, /obj/item/stack/sheet/mineral/phoron/medium_stack = 1, /obj/item/stack/cable_coil = 3)

/obj/structure/largecrate/supply/medicine
	name = "医疗板条箱"
	desc = "一个装有医疗物资的板条箱。"
	icon_state = "chest_white"

/obj/structure/largecrate/supply/medicine/medkits
	name = "急救补给板条箱（x20）"
	desc = "一个医疗补给板条箱，内含六个高级急救包、三个标准急救包、三个烧伤急救包、两个毒素急救包、两个氧气急救包和两个辐射急救包。"
	supplies = list(
		/obj/item/storage/firstaid/regular = 3,
		/obj/item/storage/firstaid/fire = 3,
		/obj/item/storage/firstaid/adv = 6,
		/obj/item/storage/firstaid/toxin = 2,
		/obj/item/storage/firstaid/o2 = 2,
		/obj/item/storage/firstaid/rad = 2,
	)

/obj/structure/largecrate/supply/medicine/blood
	name = "血液补给板条箱（x12）"
	desc = "一个医疗补给板条箱，内装十二袋O-型血袋。"
	supplies = list(/obj/item/reagent_containers/blood/OMinus = 12)

/obj/structure/largecrate/supply/medicine/iv
	name = "\improper 静脉注射架板条箱 (x3)"
	desc = "一个装有三个静脉输液器的医疗补给板条箱。"
	supplies = list(/obj/machinery/iv_drip = 3)

/obj/structure/largecrate/supply/medicine/optable
	name = "医疗手术板条箱 (x1)"
	desc = "一个装有手术台、两罐麻醉剂、一套手术器械、若干麻醉注射器和一些太空清洁剂的板条箱。"
	supplies = list(/obj/machinery/optable = 1, /obj/item/storage/surgical_tray = 1, /obj/item/tank/anesthetic = 2, /obj/item/reagent_containers/spray/cleaner = 1)

/obj/structure/largecrate/supply/medicine/medivend
	name = "\improper 纳米传讯医疗增强板条箱 (x1)"
	desc = "一个装有纳米传讯Plus医疗贩卖机的板条箱。"
	supplies = list(/obj/machinery/vending/medical = 1)


/obj/structure/largecrate/machine
	name = "机器板条箱"
	desc = "一个装有预组装机器的板条箱。"
	icon_state = "secure_crate_strapped"
	var/dir_needed = EAST //If set to anything but 0, will check that space before spawning in.
	var/unmovable = 1 //If set to 1, then on examine, the user will see a warning that states the contents cannot be moved after opened.

/obj/structure/largecrate/machine/examine(mob/user)
	. = ..()
	if(unmovable)
		. += "<b>!!WARNING!! CONTENTS OF CRATE UNABLE TO BE MOVED ONCE UNPACKAGED!</b>"

/obj/structure/largecrate/machine/attackby(obj/item/I, mob/user, params)
	if(iscrowbar(I) && dir_needed)
		var/turf/next_turf = get_step(src, dir_needed)
		if(next_turf.density)
			to_chat(user, span_warning("你无法在这里打开板条箱，空间不够！"))
			return
		for(var/atom/movable/AM in next_turf.contents)
			if(AM.density)
				to_chat(user, span_warning("你无法在这里打开板条箱，[AM]挡住了去路。"))
				return
		return TRUE
	return ..()


/obj/structure/largecrate/machine/autodoc
	name = "自动医疗机板条箱 (x1)"
	desc = "一个装有自动医疗机的板条箱。"

/obj/structure/largecrate/machine/autodoc/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(iscrowbar(I))
		var/turf/T = get_turf(loc)
		if(!isopenturf(T))
			return

		var/obj/machinery/autodoc/event/E = new (T)
		var/obj/machinery/computer/autodoc_console/C = new (T)
		C.forceMove(get_step(T, EAST))
		E.connected = C
		C.connected = E

/obj/structure/largecrate/machine/bodyscanner
	name = "人体扫描仪板条箱 (x1)"
	desc = "一个装有医疗身体扫描仪的板条箱。"

/obj/structure/largecrate/supply/machine/bodyscanner/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(iscrowbar(I))
		var/turf/T = get_turf(loc)
		if(!isopenturf(T))
			return

		var/obj/machinery/bodyscanner/E = new (T)
		var/obj/machinery/computer/body_scanconsole/C = new (T)
		C.loc = get_step(T, EAST)
		C.connected = E

/obj/structure/largecrate/machine/sleeper
	name = "休眠机板条箱 (x1)"
	desc = "一个装有医疗休眠舱的板条箱。"

/obj/structure/largecrate/machine/sleeper/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(iscrowbar(I))
		var/turf/T = get_turf(loc)
		if(!isopenturf(T))
			return

		var/obj/machinery/sleeper/E = new (T)
		var/obj/machinery/computer/sleep_console/C = new (T)
		C.forceMove(get_step(T, EAST))
		E.connected = C
		C.connected = E
