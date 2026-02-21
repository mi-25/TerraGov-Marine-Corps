/*******************************************************************************
FACTORY
*******************************************************************************/

/datum/supply_packs/factory
	group = "Factory"
	containertype = /obj/structure/closet/crate

/datum/supply_packs/factory/cutter
	name = "工业切割器"
	contains = list(/obj/machinery/factory/cutter)
	cost = 50

/datum/supply_packs/factory/heater
	name = "工业加热器"
	contains = list(/obj/machinery/factory/heater)
	cost = 50

/datum/supply_packs/factory/flatter
	name = "工业压平机"
	contains = list(/obj/machinery/factory/flatter)
	cost = 50

/datum/supply_packs/factory/former
	name = "工业改造者"
	contains = list(/obj/machinery/factory/former)
	cost = 50

/datum/supply_packs/factory/reconstructor
	name = "工业重构器"
	contains = list(/obj/machinery/factory/reconstructor)
	cost = 50

/datum/supply_packs/factory/driller
	name = "工业钻机"
	contains = list(/obj/machinery/factory/driller)
	cost = 50

/datum/supply_packs/factory/galvanizer
	name = "工业电镀机"
	contains = list(/obj/machinery/factory/galvanizer)
	cost = 50

/datum/supply_packs/factory/compressor
	name = "工业压缩机"
	contains = list(/obj/machinery/factory/compressor)
	cost = 50

/datum/supply_packs/factory/unboxer
	name = "工业拆箱机"
	contains = list(/obj/machinery/unboxer)
	cost = 50

/datum/supply_packs/factory/bignaderefill
	name = "圆形M15弹板重新装填"
	contains = list(/obj/item/factory_refill/bignade_refill)
	cost = 550

/datum/supply_packs/factory/incennaderefill
	name = "燃烧手雷补充装"
	contains = list(/obj/item/factory_refill/incennade_refill)
	cost = 550

/datum/supply_packs/factory/stickynaderefill
	name = "粘性手雷补充装"
	contains = list(/obj/item/factory_refill/stickynade_refill)
	cost = 450

/datum/supply_packs/factory/phosphosrefill
	name = "白磷手雷补充装"
	contains = list(/obj/item/factory_refill/phosnade_refill)
	cost = 1050

/datum/supply_packs/factory/cloaknade_refill
	name = "隐形手雷补充装"
	contains = list(/obj/item/factory_refill/cloaknade_refill)
	cost = 450

/datum/supply_packs/factory/trailblazerrefill
	name = "开拓者手雷补充弹"
	contains = list(/obj/item/factory_refill/trailblazer_refill)
	cost = 750

/datum/supply_packs/factory/lasenaderefill
	name = "激光爆裂手雷补充装"
	contains = list(/obj/item/factory_refill/lasenade_refill)
	cost = 450

/datum/supply_packs/factory/hefanaderefill
	name = "HEFA破片手雷补充装"
	contains = list(/obj/item/factory_refill/hefanade_refill)
	cost = 750

/datum/supply_packs/factory/antigasrefill
	name = "防毒手雷补充装"
	contains = list(/obj/item/factory_refill/antigas_refill)
	cost = 900

/datum/supply_packs/factory/razornade_refill
	name = "剃刀榴弹组装补给"
	contains = list(/obj/item/factory_refill/razornade_refill)
	cost = 750

/datum/supply_packs/factory/sadar_refill_he
	name = "RL-152 SADAR 高爆导弹组装补给"
	contains = list(/obj/item/factory_refill/sadar_he_refill)
	cost = 500

/datum/supply_packs/factory/sadar_refill_he_unguided
	name = "RL-152 SADAR 高爆无制导导弹组装再装填"
	contains = list(/obj/item/factory_refill/sadar_he_unguided_refill)
	cost = 500

/datum/supply_packs/factory/sadar_refill_ap
	name = "RL-152 SADAR 穿甲导弹组装补给"
	contains = list(/obj/item/factory_refill/sadar_ap_refill)
	cost = 600

/datum/supply_packs/factory/sadar_refill_wp
	name = "RL-152 SADAR 白磷导弹组装补给"
	contains = list(/obj/item/factory_refill/sadar_wp_refill)
	cost = 400

/datum/supply_packs/factory/standard_recoilless_refill
	name = "RL-160 RR 高爆弹组装补充"
	contains = list(/obj/item/factory_refill/normal_rr_missile_refill)
	cost = 300

/datum/supply_packs/factory/light_recoilless_refill
	name = "RL-160 RR LE 炮弹组装再装填"
	contains = list(/obj/item/factory_refill/light_rr_missile_refill)
	cost = 300

/datum/supply_packs/factory/heat_recoilless_refill
	name = "RL-160 反坦克高爆弹组装再装填"
	contains = list(/obj/item/factory_refill/heat_rr_missile_refill)
	cost = 300

/datum/supply_packs/factory/smoke_recoilless_refill
	name = "RL-160 RR 烟雾弹组装补充"
	contains = list(/obj/item/factory_refill/smoke_rr_missile_refill)
	cost = 300

/datum/supply_packs/factory/cloak_recoilless_refill
	name = "RL-160 RR 隐形弹壳组件补充装"
	contains = list(/obj/item/factory_refill/cloak_rr_missile_refill)
	cost = 300

/datum/supply_packs/factory/tfoot_recoilless_refill
	name = "RL-160 绊脚弹组装再装填"
	contains = list(/obj/item/factory_refill/tfoot_rr_missile_refill)
	cost = 300

/datum/supply_packs/factory/pizzarefill
	name = "纳米传讯'健康饮食！'玛格丽塔披萨套装补充装"
	contains = list(/obj/item/factory_refill/pizza_refill)
	cost = 290 //allows a one point profit if all pizzas are processed and sold back to ASRS

/datum/supply_packs/factory/smartgun_minigun_box_refill
	name = "SG-85 弹药箱部件补充"
	contains = list(/obj/item/factory_refill/smartgunner_minigun_box_refill)
	cost = 350

/datum/supply_packs/factory/smartgun_magazine_refill
	name = "SG-29 弹药鼓零件补充"
	contains = list(/obj/item/factory_refill/smartgunner_machinegun_magazine_refill)
	cost = 350

/datum/supply_packs/factory/smartgun_targetrifle_refill
	name = "SG-62 弹药弹匣部件补充"
	contains = list(/obj/item/factory_refill/smartgunner_targetrifle_magazine_refill)
	cost = 400

/datum/supply_packs/factory/smartgun_targetrifle_ammobin_refill
	name = "SG-62 弹药箱部件补充"
	contains = list(/obj/item/factory_refill/smartgunner_targetrifle_ammobin_refill)
	cost = 400

/datum/supply_packs/factory/smartgun_spottingrifle_ammobin_refill
	name = "SG-153 弹药箱零件补充"
	contains = list(/obj/item/factory_refill/smartgunner_spottingrifle_ammobin_refill)
	cost = 400

/datum/supply_packs/factory/autosniper_magazine_refill
	name = "SR-81 敌我识别自动狙击步枪弹匣组装再装填"
	contains = list(/obj/item/factory_refill/auto_sniper_magazine_refill)
	cost = 400

/datum/supply_packs/factory/scout_rifle_magazine_refill
	name = "BR-8侦察步枪弹匣组装再装填"
	contains = list(/obj/item/factory_refill/scout_rifle_magazine_refill)
	cost = 300

/datum/supply_packs/factory/scout_rifle_incen_magazine_refill
	name = "BR-8侦察步枪燃烧弹匣组装补充"
	contains = list(/obj/item/factory_refill/scout_rifle_incen_magazine_refill)
	cost = 600

/datum/supply_packs/factory/scout_rifle_impact_magazine_refill
	name = "BR-8 侦察步枪冲击弹匣组件补充"
	contains = list(/obj/item/factory_refill/scout_rifle_impact_magazine_refill)
	cost = 600

/datum/supply_packs/factory/claymorerefill
	name = "阔剑组装补充包"
	contains = list(/obj/item/factory_refill/claymore_refill)
	cost = 300

/datum/supply_packs/factory/mateba_speedloader_refill
	name = "马特巴自动转轮手枪快速装弹器组装补充"
	contains = list(/obj/item/factory_refill/mateba_speedloader_refill)
	cost = 300

/datum/supply_packs/factory/railgun_magazine_refill
	name = "导轨炮穿甲弹弹匣组件补充"
	contains = list(/obj/item/factory_refill/railgun_magazine_refill)
	cost = 200

/datum/supply_packs/factory/railgun_hvap_magazine_refill
	name = "导轨炮高速穿甲弹弹匣组装再装填"
	contains = list(/obj/item/factory_refill/railgun_hvap_magazine_refill)
	cost = 200

/datum/supply_packs/factory/railgun_smart_magazine_refill
	name = "导轨炮穿甲弹弹匣组装补充"
	contains = list(/obj/item/factory_refill/railgun_smart_magazine_refill)
	cost = 200

/datum/supply_packs/factory/minigun_powerpack_refill
	name = "MG-100 复仇者机炮动力包组装再装填"
	contains = list(/obj/item/factory_refill/minigun_powerpack_refill)
	cost = 250

/datum/supply_packs/factory/flak_sniper_refill
	name = "SR-127 防空弹匣组装再装填"
	contains = list(/obj/item/factory_refill/sniper_flak_magazine_refill)
	cost = 600

/datum/supply_packs/factory/amr_magazine_refill
	name = "SR-26 AMR 标准弹匣组装补充"
	contains = list(/obj/item/factory_refill/amr_magazine_refill)
	cost = 400

/datum/supply_packs/factory/amr_magazine_incend_refill
	name = "SR-26 AMR 燃烧弹匣组装补充"
	contains = list(/obj/item/factory_refill/amr_magazine_incend_refill)
	cost = 400

/datum/supply_packs/factory/amr_magazine_flak_refill
	name = "SR-26 AMR 防空弹匣组装补充"
	contains = list(/obj/item/factory_refill/amr_magazine_flak_refill)
	cost = 400

/datum/supply_packs/factory/howitzer_shell_he_refill
	name = "MG-100Y榴弹炮高爆弹组装再装填"
	contains = list(/obj/item/factory_refill/howitzer_shell_he_refill)
	cost = 800

/datum/supply_packs/factory/howitzer_shell_incen_refill
	name = "MG-100Y榴弹炮燃烧弹组装补充"
	contains = list(/obj/item/factory_refill/howitzer_shell_incen_refill)
	cost = 800

/datum/supply_packs/factory/howitzer_shell_wp_refill
	name = "MG-100Y榴弹炮白磷弹组装补充"
	contains = list(/obj/item/factory_refill/howitzer_shell_wp_refill)
	cost = 1000

/datum/supply_packs/factory/howitzer_shell_tfoot_refill
	name = "MG-100Y榴弹炮'缠足'炮弹组装再装填"
	contains = list(/obj/item/factory_refill/howitzer_shell_tfoot_refill)
	cost = 1000

/datum/supply_packs/factory/swat_mask_refill
	name = "防暴面具组件补充"
	contains = list(/obj/item/factory_refill/swat_mask_refill)
	cost = 500

/datum/supply_packs/factory/module_valk_refill
	name = "瓦尔基里自动医疗装甲模块组装补给"
	contains = list(/obj/item/factory_refill/module_valk_refill)
	cost = 600

/datum/supply_packs/factory/module_mimir2_refill
	name = "Mimir mark 2 模块组装配件补充"
	contains = list(/obj/item/factory_refill/module_mimir2_refill)
	cost = 600

/datum/supply_packs/factory/module_tyr2_refill
	name = "暴君2型装甲模块组装补给"
	contains = list(/obj/item/factory_refill/module_tyr2_refill)
	cost = 600

/datum/supply_packs/factory/module_hlin_refill
	name = "Hlin爆炸装甲模块组装补充"
	contains = list(/obj/item/factory_refill/module_hlin_refill)
	cost = 600

/datum/supply_packs/factory/module_surt_refill
	name = "苏尔特防火模块组件补给"
	contains = list(/obj/item/factory_refill/module_surt_refill)
	cost = 600

/datum/supply_packs/factory/plastique_refill
	name = "C4塑胶炸药组装补充包"
	contains = list(/obj/item/factory_refill/plastique_refill)
	cost = 150

/datum/supply_packs/factory/plastique_incendiary_refill
	name = "EX-62 成吉思汗燃烧弹装填组件"
	contains = list(/obj/item/factory_refill/plastique_incendiary_refill)
	cost = 500

/datum/supply_packs/factory/detpack_refill
	name = "炸药包组装补充"
	contains = list(/obj/item/factory_refill/detpack_refill)
	cost = 250

/datum/supply_packs/factory/mortar_shell_he_refill
	name = "T-50S迫击炮高爆弹组装填"
	contains = list(/obj/item/factory_refill/mortar_shell_he_refill)
	cost = 120

/datum/supply_packs/factory/mortar_shell_incen_refill
	name = "T-50S迫击炮燃烧弹组装补充"
	contains = list(/obj/item/factory_refill/mortar_shell_incen_refill)
	cost = 120

/datum/supply_packs/factory/mortar_shell_tfoot_refill
	name = "T-50S 迫击炮 缠足 气体弹 组装 补充"
	contains = list(/obj/item/factory_refill/mortar_shell_tfoot_refill)
	cost = 200

/datum/supply_packs/factory/mortar_shell_flare_refill
	name = "T-50S 迫击炮照明弹组件补充装"
	contains = list(/obj/item/factory_refill/mortar_shell_flare_refill)
	cost = 50

/datum/supply_packs/factory/mortar_shell_smoke_refill
	name = "T-50S 迫击炮烟雾弹组装补充"
	contains = list(/obj/item/factory_refill/mortar_shell_smoke_refill)
	cost = 50

/datum/supply_packs/factory/mlrs_rocket_refill
	name = "TA-40L 多管火箭炮高爆火箭弹组装再装填"
	contains = list(/obj/item/factory_refill/mlrs_rocket_refill)
	cost = 240

/datum/supply_packs/factory/mlrs_rocket_refill_gas
	name = "TA-40L 多管火箭发射系统 X-50 型气体火箭组装再装填"
	contains = list(/obj/item/factory_refill/mlrs_rocket_refill_gas)
	cost = 240

/datum/supply_packs/factory/mlrs_rocket_refill_cloak
	name = "TA-40L 多管火箭发射系统 S-2 型 隐形火箭弹 组装补给"
	contains = list(/obj/item/factory_refill/mlrs_rocket_refill_cloak)
	cost = 240

/datum/supply_packs/factory/mlrs_rocket_refill_incendiary
	name = "TA-40L 多管火箭发射系统燃烧火箭弹组装再装填"
	contains = list(/obj/item/factory_refill/mlrs_rocket_refill_incendiary)
	cost = 240

/datum/supply_packs/factory/agls_he_refill
	name = "AGLS-37 AGL 高爆手雷弹匣组装再装填"
	contains = list(/obj/item/factory_refill/agls_he_refill)
	cost = 300

/datum/supply_packs/factory/agls_frag_refill
	name = "AGLS-37 AGL 破片手雷弹匣组件补充"
	contains = list(/obj/item/factory_refill/agls_frag_refill)
	cost = 300

/datum/supply_packs/factory/agls_incendiary_refill
	name = "AGLS-37 AGL 燃烧手雷弹匣组件补充装"
	contains = list(/obj/item/factory_refill/agls_incendiary_refill)
	cost = 300

/datum/supply_packs/factory/agls_flare_refill
	name = "AGLS-37 AGL 照明弹手雷弹匣组件补充装"
	contains = list(/obj/item/factory_refill/agls_flare_refill)
	cost = 200

/datum/supply_packs/factory/agls_cloak_refill
	name = "AGLS-37 AGL 伪装手雷弹匣组装再装填"
	contains = list(/obj/item/factory_refill/agls_cloak_refill)
	cost = 200

/datum/supply_packs/factory/atgun_aphe_refill
	name = "AT-36 反坦克榴弹 穿甲高爆弹 组装再装填"
	contains = list(/obj/item/factory_refill/atgun_aphe_refill)
	cost = 200

/datum/supply_packs/factory/atgun_apcr_refill
	name = "AT-36 反坦克炮 APCR 炮弹组装补充包"
	contains = list(/obj/item/factory_refill/atgun_apcr_refill)
	cost = 200

/datum/supply_packs/factory/atgun_he_refill
	name = "AT-36 反坦克高爆弹组装再装填"
	contains = list(/obj/item/factory_refill/atgun_he_refill)
	cost = 200

/datum/supply_packs/factory/atgun_beehive_refill
	name = "AT-36 ATG 蜂巢弹装填组件"
	contains = list(/obj/item/factory_refill/atgun_beehive_refill)
	cost = 200

/datum/supply_packs/factory/atgun_incend_refill
	name = "AT-36 ATG 凝固汽油弹组装补充"
	contains = list(/obj/item/factory_refill/atgun_incend_refill)
	cost = 200

/datum/supply_packs/factory/heavy_isg_he_refill
	name = "FK-88 高爆防空炮弹组装补充包"
	contains = list(/obj/item/factory_refill/heavy_isg_he_refill)
	cost = 200

/datum/supply_packs/factory/heavy_isg_sabot_refill
	name = "FK-88 防空高爆穿甲弹组件补充装"
	contains = list(/obj/item/factory_refill/heavy_isg_sabot_refill)
	cost = 225

/datum/supply_packs/factory/ac_hv_refill
	name = "ATR-22高速弹匣组装再装填"
	contains = list(/obj/item/factory_refill/ac_hv_refill)
	cost = 300

/datum/supply_packs/factory/ac_flak_refill
	name = "ATR-22智能引爆弹匣组装再装填"
	contains = list(/obj/item/factory_refill/ac_flak_refill)
	cost = 300

/datum/supply_packs/factory/thermobaric_wp_refill
	name = "RL-57温压火箭阵列组装再装填"
	contains = list(/obj/item/factory_refill/thermobaric_wp_refill)
	cost = 500

/datum/supply_packs/factory/drop_pod_refill
	name = "宙斯轨道空投舱组装补给"
	contains = list(/obj/item/factory_refill/drop_pod_refill)
	cost = 250

/datum/supply_packs/factory/deployable_floodlight_refill
	name = "可部署式泛光灯组件补充包"
	contains = list(/obj/item/factory_refill/deployable_floodlight_refill)
	cost = 150

/datum/supply_packs/factory/deployable_camera_refill
	name = "可部署摄像头组件补充包"
	contains = list(/obj/item/factory_refill/deployable_camera_refill)
	cost = 100

/datum/supply_packs/factory/cigarette_refill
	name = "500支香烟组装补充包"
	contains = list(/obj/item/factory_refill/cigarette_refill)
	cost = 500
