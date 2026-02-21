///Base item used in factories, only changes icon and stage for the item then creates a new item when its done
///in order to set a recipe set recipe = GLOB.myrecipe in Initialize
/obj/item/factory_part
	name = "测试部分"
	desc = "你不应该看到这个"
	icon = 'icons/obj/factory/factoryparts.dmi'
	icon_state = "implant_evil"
	///How many cycles of processing we've gone through
	var/stage = 0
	///How many cycles we go through until we become the result
	var/completion_stage = 4
	///What type of machine the obj goes through first/next
	var/next_machine = FACTORY_MACHINE_FLATTER
	///reference to a glob list containing the recipe
	var/list/recipe
	///What result we become when we've run through all our machines
	var/result = /obj/item/instrument/violin

/obj/item/factory_part/Initialize(mapload)
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/item/factory_part/LateInitialize()
	advance_stage()

///once the part is processed this proc updates iconstate, result, completion etc
/obj/item/factory_part/proc/advance_stage()
	stage++
	if(length(recipe) < stage)
		if(islist(result))
			for(var/production AS in result)
				GLOB.round_statistics.req_items_produced[production]++
				new production(loc)
		else
			GLOB.round_statistics.req_items_produced[result]++
			new result(loc)
		qdel(src)
		return
	next_machine = recipe[stage][STEP_NEXT_MACHINE]
	icon_state = recipe[stage][STEP_ICON_STATE]

GLOBAL_LIST_INIT(grenade, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_HEATER, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_FORMER, STEP_ICON_STATE = "roundplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_COMPRESSOR, STEP_ICON_STATE = "hotplate"),
	))

/obj/item/factory_part/bignade
	name = "\improper M15手雷组装"
	desc = "一枚未完成的M15手雷。"
	result = /obj/item/explosive/grenade/m15

/obj/item/factory_part/bignade/Initialize(mapload)
	. = ..()
	recipe = GLOB.grenade

/obj/item/factory_part/incennade
	name = "燃烧手雷组装件"
	desc = "一个未完成的燃烧手雷弹壳。"
	result = /obj/item/explosive/grenade/incendiary

/obj/item/factory_part/incennade/Initialize(mapload)
	. = ..()
	recipe = GLOB.grenade

/obj/item/factory_part/stickynade
	name = "粘性手雷组装件。"
	desc = "一个未完成的粘性手雷弹壳。"
	result = /obj/item/explosive/grenade/sticky

/obj/item/factory_part/stickynade/Initialize(mapload)
	. = ..()
	recipe = GLOB.grenade

/obj/item/factory_part/phosnade
	name = "磷光手雷组装"
	desc = "一个未完成的磷光手雷弹壳。"
	result = /obj/item/explosive/grenade/phosphorus

/obj/item/factory_part/phosnade/Initialize(mapload)
	. = ..()
	recipe = GLOB.grenade

/obj/item/factory_part/cloaknade
	name = "隐形手雷组装件"
	desc = "一个未完成的隐形手雷弹壳。"
	result = /obj/item/explosive/grenade/smokebomb/cloak

/obj/item/factory_part/cloaknade/Initialize(mapload)
	. = ..()
	recipe = GLOB.grenade

/obj/item/factory_part/tfootnade
	name = "绊脚雷组装件"
	desc ="一个未完成的绊雷弹壳。"
	result = /obj/item/explosive/grenade/smokebomb/drain

/obj/item/factory_part/tfootnade/Initialize(mapload)
	. = ..()
	recipe = GLOB.grenade

/obj/item/factory_part/trailblazer
	name = "开拓者手雷组件"
	desc = "一个不完整的开拓者手雷弹壳。"
	result = /obj/item/explosive/grenade/sticky/trailblazer

/obj/item/factory_part/trailblazer/Initialize(mapload)
	. = ..()
	recipe = GLOB.grenade

/obj/item/factory_part/lasenade
	name = "激光手雷组装件"
	desc = "一个未完成的激光手雷外壳。"
	result = /obj/item/explosive/grenade/bullet/laser

/obj/item/factory_part/lasenade/Initialize(mapload)
	. = ..()
	recipe = GLOB.grenade

/obj/item/factory_part/hefanade
	name = "HEFA破片手雷组装"
	desc = "一枚不完整的 HEFA 破片手雷弹壳。"
	result = /obj/item/explosive/grenade/bullet/hefa

/obj/item/factory_part/hefanade/Initialize(mapload)
	. = ..()
	recipe = GLOB.grenade

/obj/item/factory_part/antigas
	name = "防毒烟雾手雷组装件"
	desc = "一个不完整的防毒烟雾手雷弹壳。"
	result = /obj/item/explosive/grenade/smokebomb/antigas

/obj/item/factory_part/antigas/Initialize(mapload)
	. = ..()
	recipe = GLOB.grenade

/obj/item/factory_part/razornade
	name = "剃刀泡沫手雷组装件"
	desc = "一个未完成的剃刀泡沫手雷弹壳。"
	result = /obj/item/explosive/grenade/chem_grenade/razorburn_small

/obj/item/factory_part/razornade/Initialize(mapload)
	. = ..()
	recipe = GLOB.grenade

GLOBAL_LIST_INIT(pizza_recipe,  list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "dough"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_HEATER, STEP_ICON_STATE = "rounddough"),
	))

/obj/item/factory_part/pizza
	name = "未完成的披萨"
	desc = "等等，我觉得披萨不是这么做的……"
	result = /obj/item/reagent_containers/food/snacks/req_pizza

/obj/item/factory_part/pizza/Initialize(mapload)
	. = ..()
	recipe = GLOB.pizza_recipe

GLOBAL_LIST_INIT(plastique_recipe, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_FLATTER, STEP_ICON_STATE = "hotplate"),
))

/obj/item/factory_part/plastique
	name = "\improper C4炸药组装体"
	desc = "一个未完成的C4塑胶炸药组件。"
	result = /obj/item/explosive/plastique

/obj/item/factory_part/plastique/Initialize(mapload)
	. = ..()
	recipe = GLOB.plastique_recipe

/obj/item/factory_part/plastique_incendiary
	name = "\improper EX-62 成吉思汗燃烧弹组件"
	desc = "一个未完成的EX-62成吉思汗燃烧弹组件。"
	result = /obj/item/explosive/plastique/genghis_charge

/obj/item/factory_part/plastique_incendiary/Initialize(mapload)
	. = ..()
	recipe = GLOB.plastique_recipe

/obj/item/factory_part/detpack
	name = "\improper 爆破装置组装"
	desc = "一个未完成的爆破包装药组件"
	result = /obj/item/detpack

/obj/item/factory_part/detpack/Initialize(mapload)
	. = ..()
	recipe = GLOB.plastique_recipe

GLOBAL_LIST_INIT(sadar_ammo_recipe, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_HEATER, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_FLATTER, STEP_ICON_STATE = "hotplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CONSTRUCTOR, STEP_ICON_STATE = "rockettube"),
	))

/obj/item/factory_part/sadar_wp
	name = "SADAR 白磷导弹组装"
	desc = "一枚未完成的白磷导弹。"
	result = /obj/item/ammo_magazine/rocket/sadar/wp

/obj/item/factory_part/sadar_wp/Initialize(mapload)
	. = ..()
	recipe = GLOB.sadar_ammo_recipe

/obj/item/factory_part/sadar_ap
	name = "SADAR 穿甲导弹组装"
	desc = "一枚未完工的流线型导弹，配备穿甲弹头。"
	result = /obj/item/ammo_magazine/rocket/sadar/ap

/obj/item/factory_part/sadar_ap/Initialize(mapload)
	. = ..()
	recipe = GLOB.sadar_ammo_recipe

/obj/item/factory_part/sadar_he
	name = "SADAR 高爆导弹组装"
	desc = "一枚未完成的蹲姿导弹。"
	result = /obj/item/ammo_magazine/rocket/sadar

/obj/item/factory_part/sadar_he/Initialize(mapload)
	. = ..()
	recipe = GLOB.sadar_ammo_recipe

/obj/item/factory_part/sadar_unguided
	name = "SADAR 高爆无制导导弹组装"
	desc = "一枚未完成的蹲姿导弹，电子部件较少。"
	result = /obj/item/ammo_magazine/rocket/sadar/unguided

/obj/item/factory_part/sadar_unguided/Initialize(mapload)
	. = ..()
	recipe = GLOB.sadar_ammo_recipe

GLOBAL_LIST_INIT(recoilless_missile_recipe, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_HEATER, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CONSTRUCTOR, STEP_ICON_STATE = "rockettube"),
	))

/obj/item/factory_part/light_rr_missile
	name = "轻型无后坐力弹药组装"
	desc = "一枚未完成的尾翼稳定脱壳穿甲弹。它有一个特别大的助推器。"
	result = /obj/item/ammo_magazine/rocket/recoilless/light

/obj/item/factory_part/light_rr_missile/Initialize(mapload)
	. = ..()
	recipe = GLOB.recoilless_missile_recipe

/obj/item/factory_part/normal_rr_missile
	name = "标准无后坐力弹药组件"
	desc = "一枚未完成的蹲姿导弹。它有一个特别大的弹头。"
	result = /obj/item/ammo_magazine/rocket/recoilless

/obj/item/factory_part/normal_rr_missile/Initialize(mapload)
	. = ..()
	recipe = GLOB.recoilless_missile_recipe

/obj/item/factory_part/heat_rr_missile
	name = "标准无后坐力弹药组装"
	desc = "一枚未完成的蹲姿导弹。它有一个特别大的弹头。"
	result = /obj/item/ammo_magazine/rocket/recoilless/heat

/obj/item/factory_part/heat_rr_missile/Initialize(mapload)
	. = ..()
	recipe = GLOB.recoilless_missile_recipe

/obj/item/factory_part/smoke_rr_missile
	name = "标准无后坐力弹药组装"
	desc = "一枚未完成的蹲姿导弹。它有一个特别大的弹头。"
	result = /obj/item/ammo_magazine/rocket/recoilless/smoke

/obj/item/factory_part/smoke_rr_missile/Initialize(mapload)
	. = ..()
	recipe = GLOB.recoilless_missile_recipe

/obj/item/factory_part/cloak_rr_missile
	name = "标准无后坐力弹药组装"
	desc = "一枚未完成的蹲姿导弹。它有一个特别大的弹头。"
	result = /obj/item/ammo_magazine/rocket/recoilless/cloak

/obj/item/factory_part/cloak_rr_missile/Initialize(mapload)
	. = ..()
	recipe = GLOB.recoilless_missile_recipe

/obj/item/factory_part/tfoot_rr_missile
	name = "标准无后坐力弹药组件"
	desc = "一枚未完成的蹲姿导弹。它有一个特别大的弹头。"
	result = /obj/item/ammo_magazine/rocket/recoilless/plasmaloss

/obj/item/factory_part/tfoot_rr_missile/Initialize(mapload)
	. = ..()
	recipe = GLOB.recoilless_missile_recipe

GLOBAL_LIST_INIT(claymore_recipe, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CONSTRUCTOR, STEP_ICON_STATE = "claymoreframe"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_FORMER, STEP_ICON_STATE = "claymorefilled"),
	))

/obj/item/factory_part/claymore
	name = "阔剑组装"
	desc = "一把未完成的阔剑。"
	result = /obj/item/explosive/mine

/obj/item/factory_part/claymore/Initialize(mapload)
	. = ..()
	recipe = GLOB.claymore_recipe

GLOBAL_LIST_INIT(IFF_ammo, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CONSTRUCTOR, STEP_ICON_STATE = "bulletbox"),
	))

/obj/item/factory_part/smartgunner_minigun_box
	name = "\improper 敌我识别弹道弹药箱"
	desc = "一个装有未完成智能弹药的板条箱。"
	result = /obj/item/ammo_magazine/packet/smart_minigun

/obj/item/factory_part/smartgunner_minigun_box/Initialize(mapload)
	. = ..()
	recipe = GLOB.IFF_ammo

/obj/item/factory_part/smartgunner_machinegun_magazine
	name = "\improper 敌我识别弹鼓箱"
	desc = "一个装有未完成的智能弹药和空弹鼓的箱子。"
	result = /obj/item/ammo_magazine/standard_smartmachinegun

/obj/item/factory_part/smartgunner_machinegun_magazine/Initialize(mapload)
	. = ..()
	recipe = GLOB.IFF_ammo

/obj/item/factory_part/smartgunner_targetrifle_magazine
	name = "\improper 敌我识别弹匣箱"
	desc = "一个装有未完成的智能弹和空弹匣的箱子。"
	result = /obj/item/ammo_magazine/rifle/standard_smarttargetrifle

/obj/item/factory_part/smartgunner_targetrifle_magazine/Initialize(mapload)
	. = ..()
	recipe = GLOB.IFF_ammo

/obj/item/factory_part/smartgunner_targetrifle_ammobin
	name = "\improper 敌我识别箱"
	desc = "一个装有未完成智能子弹和空盒子的箱子。"
	result = /obj/item/ammo_magazine/packet/smart_targetrifle

/obj/item/factory_part/smartgunner_targetrifle_ammobin/Initialize(mapload)
	. = ..()
	recipe = GLOB.IFF_ammo

/obj/item/factory_part/smartgunner_spottingrifle_ammobin
	name = "\improper 敌我识别箱"
	desc = "一个装有未完成的智能子弹和空盒子的箱子。"
	result = /obj/item/ammo_magazine/packet/smart_spottingrifle

/obj/item/factory_part/smartgunner_spottingrifle_ammobin/Initialize(mapload)
	. = ..()
	recipe = GLOB.IFF_ammo

/obj/item/factory_part/auto_sniper_magazine
	name = "\improper 敌我识别高口径弹道弹药箱"
	desc = "一个装有未完成大口径智能弹药的盒子。"
	result = /obj/item/ammo_magazine/rifle/autosniper

/obj/item/factory_part/auto_sniper_magazine/Initialize(mapload)
	. = ..()
	recipe = GLOB.IFF_ammo

/obj/item/factory_part/scout_rifle_magazine
	name = "\improper 敌我识别高速弹道弹药箱"
	desc = "一个装有未完成高速智能弹药的盒子。"
	result = /obj/item/ammo_magazine/rifle/tx8

/obj/item/factory_part/scout_rifle_magazine/Initialize(mapload)
	. = ..()
	recipe = GLOB.IFF_ammo

/obj/item/factory_part/scout_rifle_incen_magazine
	name = "\improper 敌我识别高速弹道弹药箱"
	desc = "一个装有未完成的高速燃烧智能弹的盒子。"
	result = /obj/item/ammo_magazine/rifle/tx8/incendiary

/obj/item/factory_part/scout_rifle_incen_magazine/Initialize(mapload)
	. = ..()
	recipe = GLOB.IFF_ammo

/obj/item/factory_part/scout_rifle_impact_magazine
	name = "\improper 敌我识别高速弹道弹箱"
	desc = "一个装有未完成高速智能弹药的箱子。"
	result = /obj/item/ammo_magazine/rifle/tx8/impact

/obj/item/factory_part/scout_rifle_impact_magazine/Initialize(mapload)
	. = ..()
	recipe = GLOB.IFF_ammo

/obj/item/factory_part/amr_magazine
	name = "\improper 敌我识别反器材弹道弹药箱"
	desc = "一个装有未完成的穿甲步枪弹的盒子。"
	result = /obj/item/ammo_magazine/sniper

/obj/item/factory_part/amr_magazine/Initialize(mapload)
	. = ..()
	recipe = GLOB.IFF_ammo

/obj/item/factory_part/amr_magazine_incend
	name = "\improper 敌我识别反器材燃烧弹道弹药箱"
	desc = "一个装有未完成的穿甲燃烧步枪弹的盒子。"
	result = /obj/item/ammo_magazine/sniper/incendiary

/obj/item/factory_part/amr_magazine_incend/Initialize(mapload)
	. = ..()
	recipe = GLOB.IFF_ammo

/obj/item/factory_part/amr_magazine_flak
	name = "\improper 敌我识别反器材破片弹道弹箱"
	desc = "一个装有未完成的步枪反器材高爆弹的盒子。"
	result = /obj/item/ammo_magazine/sniper/flak

/obj/item/factory_part/amr_magazine_flak/Initialize(mapload)
	. = ..()
	recipe = GLOB.IFF_ammo

/obj/item/factory_part/sniper_flak_magazine
	name = "\improper 防空炮狙击弹道弹药箱"
	desc = "一个装有未完成的破片狙击弹的盒子。"
	result = /obj/item/ammo_magazine/rifle/chamberedrifle/flak

/obj/item/factory_part/sniper_flak_magazine/Initialize(mapload)
	. = ..()
	recipe = GLOB.IFF_ammo

/obj/item/factory_part/sniper_flak_magazine
	name = "\improper 防空狙击弹道弹箱"
	desc = "一个装有未完成防空狙击弹的盒子。"
	result = /obj/item/ammo_magazine/rifle/chamberedrifle/flak

/obj/item/factory_part/sniper_flak_magazine/Initialize(mapload)
	. = ..()
	recipe = GLOB.IFF_ammo

GLOBAL_LIST_INIT(mateba_speedloader, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_FLATTER, STEP_ICON_STATE = "bulletbox"),
	))

/obj/item/factory_part/mateba_speedloader
	name = "\improper 马特巴快速装弹器（.454）"
	desc = "一个装有未完成手炮子弹的快速装弹器。"
	result = /obj/item/ammo_magazine/revolver/mateba

/obj/item/factory_part/mateba_speedloader/Initialize(mapload)
	. = ..()
	recipe = GLOB.mateba_speedloader

GLOBAL_LIST_INIT(railgun_magazine, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_FLATTER, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CONSTRUCTOR, STEP_ICON_STATE = "rockettube"),
	))

/obj/item/factory_part/railgun_magazine
	name = "导轨炮弹"
	desc = "一根未完成的磁力推进钢杆。"
	result = /obj/item/ammo_magazine/railgun

/obj/item/factory_part/railgun_magazine/Initialize(mapload)
	. = ..()
	recipe = GLOB.railgun_magazine

/obj/item/factory_part/railgun_hvap_magazine
	name = "导轨炮弹"
	desc = "一根未完成的磁力推进钢棒。"
	result = /obj/item/ammo_magazine/railgun/hvap

/obj/item/factory_part/railgun_hvap_magazine/Initialize(mapload)
	. = ..()
	recipe = GLOB.railgun_magazine

/obj/item/factory_part/railgun_smart_magazine
	name = "导轨炮弹"
	desc = "一根未完成的磁力推进钢杆。"
	result = /obj/item/ammo_magazine/railgun/smart

/obj/item/factory_part/railgun_smart_magazine/Initialize(mapload)
	. = ..()
	recipe = GLOB.railgun_magazine

GLOBAL_LIST_INIT(minigun_powerpack, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CONSTRUCTOR, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_FORMER, STEP_ICON_STATE = "hotplate"),
	))
/obj/item/factory_part/minigun_powerpack
	name = "机枪动力背包"
	desc = "装有未完成转轮机枪弹药的动力弹匣。"
	result = /obj/item/ammo_magazine/minigun_powerpack

/obj/item/factory_part/minigun_powerpack/Initialize(mapload)
	. = ..()
	recipe = GLOB.minigun_powerpack

GLOBAL_LIST_INIT(swat_mask, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_COMPRESSOR, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_GALVANIZER, STEP_ICON_STATE = "steelingot"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "req_bag4"),
	))

/obj/item/factory_part/swat_mask
	name = "\improper 特警面罩"
	desc = "一副未完成的特警面罩组件。"
	result = /obj/item/clothing/mask/gas/swat

/obj/item/factory_part/swat_mask/Initialize(mapload)
	. = ..()
	recipe = GLOB.swat_mask

GLOBAL_LIST_INIT(module, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_FLATTER, STEP_ICON_STATE = "roundplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_DRILLER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_HEATER, STEP_ICON_STATE = "barrelplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_COMPRESSOR, STEP_ICON_STATE = "unfinished_module_top"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_GALVANIZER, STEP_ICON_STATE = "unfinished_module_bottom"),
	))

/obj/item/factory_part/module_valk
	name = "\improper 瓦尔基里自动医疗装甲系统"
	desc = "一套未完成的瓦尔基里自动医疗装甲系统模块。"
	result = /obj/item/armor_module/module/valkyrie_autodoc

/obj/item/factory_part/module_valk/Initialize(mapload)
	. = ..()
	recipe = GLOB.module

/obj/item/factory_part/module_mimir2
	name = "\improper 米米尔环境抗性系统 Mark 2"
	desc = "一个未完成的马克2型密米尔环境抗性系统模块。"
	result = list(
		/obj/item/armor_module/module/mimir_environment_protection,
		/obj/item/armor_module/module/mimir_environment_protection/mimir_helmet,
	)

/obj/item/factory_part/module_mimir2/Initialize(mapload)
	. = ..()
	recipe = GLOB.module

/obj/item/factory_part/module_tyr2
	name = "\improper 马克2型泰尔护甲强化"
	desc = "一个未完成的马克2型泰坦装甲强化模块。"
	result = /obj/item/armor_module/module/tyr_extra_armor

/obj/item/factory_part/module_tyr2/Initialize(mapload)
	. = ..()
	recipe = GLOB.module

/obj/item/factory_part/module_hlin
	name = "\improper Hlin 爆炸补偿模块"
	desc = "一个未完成的HLIN爆炸补偿装置。"
	result = /obj/item/armor_module/module/hlin_explosive_armor

/obj/item/factory_part/module_hlin/Initialize(mapload)
	. = ..()
	recipe = GLOB.module

/obj/item/factory_part/module_surt
	name = "\improper 瑟特热工绝缘系统"
	desc = "一个未完成的苏尔特热工绝缘系统模块。"
	result = list(
		/obj/item/armor_module/module/fire_proof,
		/obj/item/armor_module/module/fire_proof_helmet,
	)

/obj/item/factory_part/module_surt/Initialize(mapload)
	. = ..()
	recipe = GLOB.module

// Mortar

GLOBAL_LIST_INIT(mortar_shell, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_HEATER, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_DRILLER, STEP_ICON_STATE = "hotplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CONSTRUCTOR, STEP_ICON_STATE = "rockettube"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_GALVANIZER, STEP_ICON_STATE = "rockettube"),
	))

/obj/item/factory_part/mortar_shell_he
	name = "迫击炮弹"
	desc = "一枚未完成的高爆迫击炮弹。"
	result = /obj/item/mortal_shell/he

/obj/item/factory_part/mortar_shell_he/Initialize(mapload)
	. = ..()
	recipe = GLOB.mortar_shell

/obj/item/factory_part/mortar_shell_incen
	name = "迫击炮弹"
	desc = "一枚未完成的燃烧迫击炮弹。"
	result = /obj/item/mortal_shell/incendiary

/obj/item/factory_part/mortar_shell_incen/Initialize(mapload)
	. = ..()
	recipe = GLOB.mortar_shell

/obj/item/factory_part/mortar_shell_tfoot
	name = "迫击炮弹"
	desc = "一枚未完成的照明弹迫击炮弹。"
	result = /obj/item/mortal_shell/plasmaloss

/obj/item/factory_part/mortar_shell_tfoot/Initialize(mapload)
	. = ..()
	recipe = GLOB.mortar_shell

/obj/item/factory_part/mortar_shell_flare
	name = "迫击炮弹"
	desc = "一枚未完成的照明弹迫击炮弹。"
	result = /obj/item/mortal_shell/flare

/obj/item/factory_part/mortar_shell_flare/Initialize(mapload)
	. = ..()
	recipe = GLOB.mortar_shell

/obj/item/factory_part/mortar_shell_smoke
	name = "迫击炮弹"
	desc = "一枚未完成的烟雾迫击炮弹。"
	result = /obj/item/mortal_shell/smoke

/obj/item/factory_part/mortar_shell_smoke/Initialize(mapload)
	. = ..()
	recipe = GLOB.mortar_shell

//
// Howitzer
//

GLOBAL_LIST_INIT(howitzer_shell, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_DRILLER, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_COMPRESSOR, STEP_ICON_STATE = "barrelplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_GALVANIZER, STEP_ICON_STATE = "rockettube"),
	))
/obj/item/factory_part/howitzer_shell_he
	name = "榴弹炮炮弹"
	desc = "一枚未完成的高爆榴弹炮弹。"
	result = /obj/item/mortal_shell/howitzer/he

/obj/item/factory_part/howitzer_shell_he/Initialize(mapload)
	. = ..()
	recipe = GLOB.howitzer_shell

/obj/item/factory_part/howitzer_shell_incen
	name = "榴弹炮炮弹"
	desc = "一枚未完成的燃烧榴弹炮弹。"
	result = /obj/item/mortal_shell/howitzer/incendiary

/obj/item/factory_part/howitzer_shell_incen/Initialize(mapload)
	. = ..()
	recipe = GLOB.howitzer_shell

/obj/item/factory_part/howitzer_shell_wp
	name = "榴弹炮炮弹"
	desc = "一枚未完成的白磷榴弹炮弹。"
	result = /obj/item/mortal_shell/howitzer/white_phos

/obj/item/factory_part/howitzer_shell_wp/Initialize(mapload)
	. = ..()
	recipe = GLOB.howitzer_shell

/obj/item/factory_part/howitzer_shell_tfoot
	name = "榴弹炮炮弹"
	desc = "一枚未完成的高爆榴弹炮弹。"
	result = /obj/item/mortal_shell/howitzer/plasmaloss

/obj/item/factory_part/howitzer_shell_tfoot/Initialize(mapload)
	. = ..()
	recipe = GLOB.howitzer_shell

//
// MLRS
//

GLOBAL_LIST_INIT(mlrs_rocket, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_HEATER, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_DRILLER, STEP_ICON_STATE = "hotplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_COMPRESSOR, STEP_ICON_STATE = "rockettube"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_GALVANIZER, STEP_ICON_STATE = "rockettube"),
	))

/obj/item/factory_part/mlrs_rocket
	name = "\improper 多管火箭炮火箭弹"
	desc = "一枚未完成的高爆火箭。"
	result = /obj/item/storage/box/mlrs_rockets

/obj/item/factory_part/mlrs_rocket/Initialize(mapload)
	. = ..()
	recipe = GLOB.mlrs_rocket

/obj/item/factory_part/mlrs_rocket/gas
	name = "\improper 多管火箭炮芥子气火箭"
	desc = "一枚未完成的芥子气火箭。"
	result = /obj/item/storage/box/mlrs_rockets/gas

/obj/item/factory_part/mlrs_rocket/cloak
	name = "\improper MLRS 隐形火箭"
	desc = "一枚未完成的隐形毒气火箭。"
	result = /obj/item/storage/box/mlrs_rockets/cloak

/obj/item/factory_part/mlrs_rocket/incendiary
	name = "\improper MLRS 燃烧火箭"
	desc = "一枚未完成的燃烧火箭。"
	result = /obj/item/storage/box/mlrs_rockets/incendiary

// Thermobaric

GLOBAL_LIST_INIT(thermobaric_wp_recipe, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_HEATER, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_FLATTER, STEP_ICON_STATE = "hotplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CONSTRUCTOR, STEP_ICON_STATE = "rockettube"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_GALVANIZER, STEP_ICON_STATE = "rockettube"),
	))

/obj/item/factory_part/thermobaric_wp
	name = "\improper RL-57 温压白磷火箭阵列"
	desc = "一套未完成的温压白磷火箭弹阵列。"
	result = /obj/item/ammo_magazine/rocket/m57a4

/obj/item/factory_part/thermobaric_wp/Initialize(mapload)
	. = ..()
	recipe = GLOB.thermobaric_wp_recipe

GLOBAL_LIST_INIT(equipment_recipe, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_HEATER, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CONSTRUCTOR, STEP_ICON_STATE = "hotplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_FORMER, STEP_ICON_STATE = "barrelplate"),
	))

/obj/item/factory_part/drop_pod
	name = "地球政府殖民地海军陆战队宙斯轨道空投舱组装件"
	desc = "一个未完成的宙斯轨道空降舱组件。"
	result = /obj/structure/droppod

/obj/item/factory_part/drop_pod/Initialize(mapload)
	. = ..()
	recipe = GLOB.equipment_recipe

/obj/item/factory_part/deployable_floodlight
	name = "\improper 可部署式泛光灯组件"
	desc = "一个不完整的可部署探照灯组件。"
	result = /obj/item/deployable_floodlight

/obj/item/factory_part/deployable_floodlight/Initialize(mapload)
	. = ..()
	recipe = GLOB.equipment_recipe

/obj/item/factory_part/deployable_camera
	name = "\improper 可部署安保摄像头组件"
	desc = "一个未完成的部署式安保摄像头组件。"
	result = /obj/item/deployable_camera

/obj/item/factory_part/deployable_camera/Initialize(mapload)
	. = ..()
	recipe = GLOB.equipment_recipe

GLOBAL_LIST_INIT(agls_recipe, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_HEATER, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CONSTRUCTOR, STEP_ICON_STATE = "hotplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_FLATTER, STEP_ICON_STATE = "rockettube"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_GALVANIZER, STEP_ICON_STATE = "hotplate"),
	))

/obj/item/factory_part/agls_he
	name = "\improper AGLS 高爆弹弹匣组件"
	desc = "一个不完整的AGLS高爆弹弹匣组件。"
	result = /obj/item/ammo_magazine/standard_agls

/obj/item/factory_part/agls_he/Initialize(mapload)
	. = ..()
	recipe = GLOB.agls_recipe

/obj/item/factory_part/agls_frag
	name = "\improper AGLS 破片弹匣组件"
	desc = "一个不完整的AGLS破片弹匣组件。"
	result = /obj/item/ammo_magazine/standard_agls/fragmentation

/obj/item/factory_part/agls_frag/Initialize(mapload)
	. = ..()
	recipe = GLOB.agls_recipe

/obj/item/factory_part/agls_incendiary
	name = "\improper AGLS公司弹匣组件"
	desc = "一个未完成的AGLS公司弹匣组件。"
	result = /obj/item/ammo_magazine/standard_agls/incendiary

/obj/item/factory_part/agls_incendiary/Initialize(mapload)
	. = ..()
	recipe = GLOB.agls_recipe

/obj/item/factory_part/agls_flare
	name = "\improper AGLS 照明弹弹匣组件"
	desc = "一个不完整的AGLS照明弹弹匣组件。"
	result = /obj/item/ammo_magazine/standard_agls/flare

/obj/item/factory_part/agls_flare/Initialize(mapload)
	. = ..()
	recipe = GLOB.agls_recipe

/obj/item/factory_part/agls_cloak
	name = "\improper AGLS 斗篷弹匣组件"
	desc = "一个不完整的AGLS斗篷弹匣组件。"
	result = /obj/item/ammo_magazine/standard_agls/cloak

/obj/item/factory_part/agls_cloak/Initialize(mapload)
	. = ..()
	recipe = GLOB.agls_recipe

GLOBAL_LIST_INIT(atgun_recipe, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_CUTTER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_HEATER, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_FLATTER, STEP_ICON_STATE = "hotplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_COMPRESSOR, STEP_ICON_STATE = "rockettube"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_GALVANIZER, STEP_ICON_STATE = "rockettube"),
	))

/obj/item/factory_part/atgun_aphe
	name = "\improper AT-36 穿甲高爆弹组装"
	desc = "一枚未完成的AT-36穿甲高爆弹组装体。"
	result = /obj/item/ammo_magazine/standard_atgun

/obj/item/factory_part/atgun_aphe/Initialize(mapload)
	. = ..()
	recipe = GLOB.atgun_recipe

/obj/item/factory_part/atgun_apcr
	name = "\improper AT-36 穿甲弹壳组件"
	desc = "一枚未完成的AT-36穿甲弹组件。"
	result = /obj/item/ammo_magazine/standard_atgun/apcr

/obj/item/factory_part/atgun_apcr/Initialize(mapload)
	. = ..()
	recipe = GLOB.atgun_recipe

/obj/item/factory_part/atgun_he
	name = "\improper AT-36 高爆弹组装"
	desc = "一枚未完成的AT-36高爆弹组装件。"
	result = /obj/item/ammo_magazine/standard_atgun/he

/obj/item/factory_part/atgun_he/Initialize(mapload)
	. = ..()
	recipe = GLOB.atgun_recipe

/obj/item/factory_part/atgun_beehive
	name = "\improper AT-36 蜂巢弹组装件"
	desc = "一个不完整的AT-36蜂巢弹组装件。"
	result = /obj/item/ammo_magazine/standard_atgun/beehive

/obj/item/factory_part/atgun_beehive/Initialize(mapload)
	. = ..()
	recipe = GLOB.atgun_recipe

/obj/item/factory_part/atgun_incend
	name = "\improper AT-36 凝固汽油弹组装"
	desc = "一枚未完成的AT-36凝固汽油弹组件。"
	result = /obj/item/ammo_magazine/standard_atgun/incend

/obj/item/factory_part/atgun_incend/Initialize(mapload)
	. = ..()
	recipe = GLOB.atgun_recipe

GLOBAL_LIST_INIT(heavy_isg_recipe, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_HEATER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_COMPRESSOR, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_DRILLER, STEP_ICON_STATE = "hotplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_GALVANIZER, STEP_ICON_STATE = "rockettube"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_FORMER, STEP_ICON_STATE = "rockettube"),
	))

/obj/item/factory_part/heavy_isg_he
	name = "\improper FK-88 高爆弹组装"
	desc = "一个不完整的FK-88高爆弹组装件。"
	result = /obj/item/ammo_magazine/heavy_isg/he

/obj/item/factory_part/heavy_isg_he/Initialize(mapload)
	. = ..()
	recipe = GLOB.heavy_isg_recipe

/obj/item/factory_part/heavy_isg_sabot
	name = "\improper FK-88 高爆弹组装"
	desc = "一枚不完整的FK-88尾翼稳定脱壳穿甲弹组件。"
	result = /obj/item/ammo_magazine/heavy_isg/sabot

/obj/item/factory_part/heavy_isg_sabot/Initialize(mapload)
	. = ..()
	recipe = GLOB.heavy_isg_recipe

GLOBAL_LIST_INIT(ac_recipe, list(
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_HEATER, STEP_ICON_STATE = "uncutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_COMPRESSOR, STEP_ICON_STATE = "cutplate"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_GALVANIZER, STEP_ICON_STATE = "rockettube"),
	list(STEP_NEXT_MACHINE = FACTORY_MACHINE_FORMER, STEP_ICON_STATE = "rockettube"),
	))

/obj/item/factory_part/ac_hv
	name = "\improper ATR-22高速弹匣组件"
	desc = "一个不完整的ATR-22高速弹匣组件。"
	result = /obj/item/ammo_magazine/auto_cannon

/obj/item/factory_part/ac_hv/Initialize(mapload)
	. = ..()
	recipe = GLOB.ac_recipe

/obj/item/factory_part/ac_flak
	name = "\improper ATR-22 防空弹匣组件"
	desc = "一个未完成的ATR-22防空炮弹匣组件。"
	result = /obj/item/ammo_magazine/auto_cannon/flak

/obj/item/factory_part/ac_flak/Initialize(mapload)
	. = ..()
	recipe = GLOB.ac_recipe

/obj/item/factory_part/cigarette
	name = "\improper 香烟盒"
	desc = "一包未抽完的香烟。"
	result = /obj/item/clothing/mask/cigarette

/obj/item/factory_part/cigarette/Initialize(mapload)
	. = ..()
	recipe = GLOB.equipment_recipe
