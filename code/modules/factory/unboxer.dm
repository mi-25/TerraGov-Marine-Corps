/obj/item/factory_refill
	name = "通用补给器"
	desc = "你不应该看到这个。"
	icon = 'icons/obj/factory/factoryparts.dmi'
	icon_state = "refillbox"
	///Typepath for the output machine we want to be ejecting
	var/obj/item/factory_part/refill_type = /obj/item/factory_part
	///By how much we wan to refill the target machine
	var/refill_amount = 30

/obj/item/factory_refill/Initialize(mapload)
	. = ..()
	var/obj/path = initial(refill_type.result)
	var/matrix/shift = matrix().Scale(0.4,0.4)
	var/image/result_image = image(initial(path.icon), initial(path.icon_state), pixel_x = 6, pixel_y = -6)
	result_image.transform = shift
	add_overlay(result_image)

/obj/item/factory_refill/examine(mob/user, distance, infix, suffix)
	. = ..()
	. += "It has [refill_amount] packages remaining."

/obj/machinery/unboxer
	name = "开箱器"
	desc = "工业资源开箱器。"
	icon = 'icons/obj/factory/factory_machines.dmi'
	icon_state = "unboxer_inactive"
	resistance_flags = XENO_DAMAGEABLE
	density = TRUE
	anchored = FALSE
	///the amount of resouce we have left to output factory_parts
	var/production_amount_left = 0
	///Maximum amount of resource we can hold
	var/max_fill_amount = 100
	///Typepath for the result we want outputted
	var/obj/item/factory_part/production_type = /obj/item/factory_part
	///Bool for whether the unboxer is producing things
	var/on = FALSE

/obj/machinery/unboxer/Initialize(mapload)
	. = ..()
	add_overlay(image(icon, "direction_arrow"))

/obj/machinery/unboxer/examine(mob/user, distance, infix, suffix)
	. = ..()
	. += "It is currently facing [dir2text(dir)], and is outputting [initial(production_type.name)]. It has [production_amount_left] resources remaining."

/obj/machinery/unboxer/wrench_act(mob/living/user, obj/item/I)
	anchored = !anchored
	balloon_alert(user, "[anchored ? "" : "un"]anchored")

/obj/machinery/unboxer/screwdriver_act(mob/living/user, obj/item/I)
	setDir(turn(dir, 90))
	balloon_alert(user, "面向[dir2text(dir)]")

/obj/machinery/unboxer/update_icon_state()
	. = ..()
	if(datum_flags & DF_ISPROCESSING)
		icon_state = "unboxer"
		return
	icon_state = "unboxer_inactive"

/obj/machinery/unboxer/attack_hand(mob/living/user)
	if(!anchored)
		balloon_alert(user, "必须固定！")
		return
	change_state()

///Turns the unboxer on/off
/obj/machinery/unboxer/proc/change_state()
	on = !on
	if(on)
		START_PROCESSING(SSmachines, src)
		balloon_alert_to_viewers("已启动！")
	else
		STOP_PROCESSING(SSmachines, src)
		balloon_alert_to_viewers("关闭！")
	update_icon()

/obj/machinery/unboxer/attack_ai(mob/living/silicon/ai/user)
	return attack_hand(user)

/obj/machinery/unboxer/process()
	if(production_amount_left <= 0)
		change_state()
		return
	new production_type(get_step(src, dir))
	production_amount_left--

/obj/machinery/unboxer/attackby(obj/item/I, mob/living/user, def_zone)
	if(!isfactoryrefill(I) || user.a_intent == INTENT_HARM)
		return ..()
	var/obj/item/factory_refill/refill = I
	if(refill.refill_type != production_type)
		if(production_amount_left)
			balloon_alert(user, "填充物不兼容！")
			return
		production_type = refill.refill_type
	var/to_refill = min(max_fill_amount - production_amount_left, refill.refill_amount)
	production_amount_left += to_refill
	refill.refill_amount -= to_refill
	visible_message(span_notice("[user] 用 \the [refill] 为 \the [src] 重新装填了枪托！"), span_notice("You restock \the [src] with [refill]!"))
	if(!on)
		change_state()
	if(refill.refill_amount <= 0)
		qdel(refill)
		new /obj/item/stack/sheet/metal(user.loc)//simulates leftover trash

/obj/item/factory_refill/bignade_refill
	name = "一盒圆形金属板（M15手雷）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后会变成M15手雷。"
	refill_type = /obj/item/factory_part/bignade
	refill_amount = 50

/obj/item/factory_refill/incennade_refill
	name = "一盒燃烧手雷板"
	desc = "一个装有圆形金属板的箱子，可用于制造燃烧手雷。用于补充拆箱器的弹药。"
	refill_type = /obj/item/factory_part/incennade
	refill_amount = 50

/obj/item/factory_refill/stickynade_refill
	name = "粘性手雷板条箱"
	desc = "一个装有圆形金属板的盒子，可用于制作粘性手雷。用于补充拆箱器。"
	refill_type = /obj/item/factory_part/stickynade
	refill_amount = 50

/obj/item/factory_refill/phosnade_refill
	name = "白磷手雷板条箱"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为白磷手雷。"
	refill_type = /obj/item/factory_part/phosnade
	refill_amount = 50

/obj/item/factory_refill/cloaknade_refill
	name = "一箱隐形手雷板"
	desc = "一个装有圆形金属板的盒子，可用于制造隐形手雷。用于补充拆箱器的弹药。"
	refill_type = /obj/item/factory_part/cloaknade
	refill_amount = 50

/obj/item/factory_refill/tfootnade_refill
	name = "一箱缠结手雷板"
	desc = "一个装有圆形金属板的盒子，可用于组装缠足手雷。用于补充拆箱器。"
	refill_type = /obj/item/factory_part/tfootnade
	refill_amount = 50

/obj/item/factory_refill/trailblazer_refill
	name = "一盒开拓者手雷导轨板"
	desc = "一个装有圆形金属板的盒子，可用于制造开拓者手雷。用于补充拆箱器。"
	refill_type = /obj/item/factory_part/trailblazer
	refill_amount = 50

/obj/item/factory_refill/lasenade_refill
	name = "激光手雷板和电池盒。"
	desc = "一个装有板材和电池的箱子，可用于制造激光手雷。用于补充拆箱器的弹药。"
	refill_type = /obj/item/factory_part/lasenade
	refill_amount = 50

/obj/item/factory_refill/hefanade_refill
	name = "一盒高爆弹破片与弹壳。"
	desc = "一个装有弹板和弹壳的箱子，可用于组装HEFA手雷。用于补充拆箱器。"
	refill_type = /obj/item/factory_part/hefanade
	refill_amount = 50

/obj/item/factory_refill/antigas_refill
	name = "防毒滤板盒。"
	desc = "一个装有板片的箱子，可用于组装M40-AG手雷。用于补充拆箱器。"
	refill_type = /obj/item/factory_part/antigas
	refill_amount = 50

/obj/item/factory_refill/razornade_refill
	name = "一盒圆形金属板（剃刀烧伤）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器。完成后会变成剃刀燃烧手雷。"
	refill_type = /obj/item/factory_part/razornade
	refill_amount = 50

/obj/item/factory_refill/pizza_refill
	name = "一盒圆形金属板（披萨）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将变成'披萨'。"
	refill_type = /obj/item/factory_part/pizza

/obj/item/factory_refill/plastique_refill
	name = "盒装圆角聚合物板（C4）"
	desc = "一个装有圆形聚合物板的箱子。用于补充拆箱器。完成后，这些将变成C4炸药。"
	refill_type = /obj/item/factory_part/plastique
	refill_amount = 10

/obj/item/factory_refill/plastique_incendiary_refill
	name = "一盒圆形聚合物板（EX-62）"
	desc = "一个装有圆形聚合物板的箱子。用于补充拆箱器的弹药。完成后，这些将成为EX-62成吉思燃烧弹。"
	refill_type = /obj/item/factory_part/plastique_incendiary
	refill_amount = 5

/obj/item/factory_refill/detpack_refill
	name = "圆角聚合物板条箱（爆破包）"
	desc = "一个装有圆形聚合物板的箱子。用于补充拆箱器的弹药。完成后，这些将成为爆破包装药。"
	refill_type = /obj/item/factory_part/detpack
	refill_amount = 10

/obj/item/factory_refill/sadar_wp_refill
	name = "一箱圆形金属板（SADAR 白磷弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为白磷SADAR火箭。"
	refill_type = /obj/item/factory_part/sadar_wp
	refill_amount = 15

/obj/item/factory_refill/sadar_ap_refill
	name = "一箱圆头金属板（SADAR穿甲弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为穿甲型SADAR火箭弹。"
	refill_type = /obj/item/factory_part/sadar_ap
	refill_amount = 15

/obj/item/factory_refill/sadar_he_refill
	name = "一盒圆形金属板（SADAR 高爆弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为高爆SADAR火箭弹。"
	refill_type = /obj/item/factory_part/sadar_he
	refill_amount = 15

/obj/item/factory_refill/sadar_he_unguided_refill
	name = "一盒圆形金属板（SADAR 高爆无制导）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。这些弹药在完成后会变成高爆无制导SADAR火箭弹。"
	refill_type = /obj/item/factory_part/sadar_unguided
	refill_amount = 15

/obj/item/factory_refill/light_rr_missile_refill
	name = "一盒圆形金属板（轻型步枪橡胶弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为轻型爆炸无后坐力炮弹。"
	refill_type = /obj/item/factory_part/light_rr_missile
	refill_amount = 15

/obj/item/factory_refill/normal_rr_missile_refill
	name = "一盒圆形金属板（高爆火箭弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为高爆无后坐力炮弹。"
	refill_type = /obj/item/factory_part/normal_rr_missile
	refill_amount = 15

/obj/item/factory_refill/heat_rr_missile_refill
	name = "一箱圆形金属板（HEAT RR 炮弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。这些金属板在加工完成后将成为高爆反坦克无后坐力炮弹。"
	refill_type = /obj/item/factory_part/heat_rr_missile
	refill_amount = 15

/obj/item/factory_refill/smoke_rr_missile_refill
	name = "一盒圆形金属板（烟雾弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为烟雾无后坐力炮弹。"
	refill_type = /obj/item/factory_part/smoke_rr_missile
	refill_amount = 15

/obj/item/factory_refill/cloak_rr_missile_refill
	name = "一盒圆形金属板（隐身RR弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为隐形无后坐力炮弹。"
	refill_type = /obj/item/factory_part/cloak_rr_missile
	refill_amount = 15

/obj/item/factory_refill/tfoot_rr_missile_refill
	name = "一盒圆形金属板（缠足RR弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为缠足无后坐力炮弹。"
	refill_type = /obj/item/factory_part/tfoot_rr_missile
	refill_amount = 15

/obj/item/factory_refill/claymore_refill
	name = "一盒圆形阔剑板"
	desc = "一个装有圆形阔剑板的盒子。用于补充拆箱器。完成后将成为M20阔剑地雷。"
	refill_type = /obj/item/factory_part/claymore

/obj/item/factory_refill/smartgunner_minigun_box_refill
	name = "一盒圆形金属板（SG-85）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为SG-85智能机枪弹药箱。"
	refill_type = /obj/item/factory_part/smartgunner_minigun_box
	refill_amount = 10

/obj/item/factory_refill/smartgunner_machinegun_magazine_refill
	name = "一盒圆形金属板（SG-29）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为SG-29智能机枪弹匣。"
	refill_type = /obj/item/factory_part/smartgunner_machinegun_magazine
	refill_amount = 10

/obj/item/factory_refill/smartgunner_targetrifle_magazine_refill
	name = "一盒圆形金属板（SG-62）"
	desc = "一个装有圆形金属板的盒子。用于补充拆箱器的弹药。完成后，这些将成为SG-62目标步枪弹匣。"
	refill_type = /obj/item/factory_part/smartgunner_targetrifle_magazine
	refill_amount = 20

/obj/item/factory_refill/smartgunner_targetrifle_ammobin_refill
	name = "一盒圆形金属板"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。"
	refill_type = /obj/item/factory_part/smartgunner_targetrifle_ammobin
	refill_amount = 10

/obj/item/factory_refill/smartgunner_spottingrifle_ammobin_refill
	name = "一盒圆形金属板（SG-153）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。"
	refill_type = /obj/item/factory_part/smartgunner_spottingrifle_ammobin
	refill_amount = 10

/obj/item/factory_refill/auto_sniper_magazine_refill
	name = "一盒圆形金属板（SR-81）"
	desc = "一个内部装有圆形金属板的盒子。用于补充拆箱器的弹药。完成后会生成SR-81弹匣。"
	refill_type = /obj/item/factory_part/auto_sniper_magazine

/obj/item/factory_refill/scout_rifle_magazine_refill
	name = "一盒圆形金属板（BR-8）"
	desc = "一个内部装有圆形金属板的盒子。用于补充拆箱器的弹药。完成后，这些将成为BR-8弹匣。"
	refill_type = /obj/item/factory_part/scout_rifle_magazine
	refill_amount = 20

/obj/item/factory_refill/scout_rifle_incen_magazine_refill
	name = "一盒圆形金属板（BR-8公司）"
	desc = "一个内部装有圆形金属板的盒子。用于补充拆弹器的弹药。完成后，这些将成为BR-8燃烧弹匣。"
	refill_type = /obj/item/factory_part/scout_rifle_incen_magazine
	refill_amount = 20

/obj/item/factory_refill/scout_rifle_impact_magazine_refill
	name = "一盒圆形金属板（BR-8 改进型）"
	desc = "一个内部装有圆形金属板的盒子。用于补充拆箱器的弹药。完成后，这些将成为BR-8冲击弹匣。"
	refill_type = /obj/item/factory_part/scout_rifle_impact_magazine
	refill_amount = 20

/obj/item/factory_refill/mateba_speedloader_refill
	name = "一盒圆形金属板（马特巴快速装弹器）"
	desc = "一个装有圆形金属板的盒子。用于补充开箱器的弹药。完成后，这些将成为马特巴快速装弹器。"
	refill_type = /obj/item/factory_part/mateba_speedloader

/obj/item/factory_refill/railgun_magazine_refill
	name = "一盒圆形金属板（导轨炮弹匣）"
	desc = "一个内部装有圆形金属板的盒子。用于补充拆箱器的弹药。完成后，这些将成为导轨炮的弹匣。"
	refill_type = /obj/item/factory_part/railgun_magazine
	refill_amount = 20

/obj/item/factory_refill/railgun_hvap_magazine_refill
	name = "一盒圆形金属板（导轨炮高速穿甲弹匣）"
	desc = "一个内部装有圆形金属板的盒子。用于补充开箱器的弹药。完成后，这些将成为轨道炮高速穿甲弹匣。"
	refill_type = /obj/item/factory_part/railgun_hvap_magazine
	refill_amount = 20

/obj/item/factory_refill/railgun_smart_magazine_refill
	name = "一盒圆形金属板（导轨炮智能弹匣）"
	desc = "一个内部装有圆形金属板的盒子。用于补充拆箱器的弹药。完成后，这些将成为轨道炮智能弹匣。"
	refill_type = /obj/item/factory_part/railgun_smart_magazine
	refill_amount = 20

/obj/item/factory_refill/minigun_powerpack_refill
	name = "一箱圆形金属板（转管机枪包）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为转轮机枪的能量包。"
	refill_type = /obj/item/factory_part/minigun_powerpack
	refill_amount = 10

/obj/item/factory_refill/sniper_flak_magazine_refill
	name = "一盒圆形金属板（SR-127 破片弹匣）"
	desc = "一个内部装有圆形金属板的盒子。用于补充拆箱器的弹药。完成后，这些将成为SR-127高爆弹匣。"
	refill_type = /obj/item/factory_part/sniper_flak_magazine
	refill_amount = 20

/obj/item/factory_refill/amr_magazine_refill
	name = "一盒圆形金属板（反器材步枪弹匣）"
	desc = "一个内部装有圆形金属板的盒子。用于补充拆箱器的弹药。完成后，这些将成为SR-26 AMR的弹匣。"
	refill_type = /obj/item/factory_part/amr_magazine
	refill_amount = 20

/obj/item/factory_refill/amr_magazine_incend_refill
	name = "一盒圆形金属板（AMR公司弹匣）"
	desc = "一个内部装有圆形金属板的盒子。用于补充开箱器的弹药。完成后，这些将成为SR-26 AMR燃烧弹弹匣。"
	refill_type = /obj/item/factory_part/amr_magazine_incend
	refill_amount = 20

/obj/item/factory_refill/amr_magazine_flak_refill
	name = "一盒圆形金属板（反器材步枪破片弹匣）"
	desc = "一个内部装有圆形金属板的盒子。用于补充拆箱器的弹药。完成后，这些将成为SR-26 AMR高射炮弹匣。"
	refill_type = /obj/item/factory_part/amr_magazine_flak
	refill_amount = 20

/obj/item/factory_refill/howitzer_shell_he_refill
	name = "一箱圆形金属板（榴弹炮高爆弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。这些金属板完成后将成为榴弹炮的高爆炮弹。"
	refill_type = /obj/item/factory_part/howitzer_shell_he
	refill_amount = 30

/obj/item/factory_refill/howitzer_shell_incen_refill
	name = "一盒圆形金属板（霍维泽公司）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为榴弹炮的燃烧弹。"
	refill_type = /obj/item/factory_part/howitzer_shell_incen
	refill_amount = 30

/obj/item/factory_refill/howitzer_shell_wp_refill
	name = "一箱圆形金属板（白磷榴弹炮）。"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为白磷炮弹，用于榴弹炮。"
	refill_type = /obj/item/factory_part/howitzer_shell_wp
	refill_amount = 30

/obj/item/factory_refill/howitzer_shell_tfoot_refill
	name = "一盒圆形金属板（榴弹炮绊网弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为榴弹炮的缠足弹。"
	refill_type = /obj/item/factory_part/howitzer_shell_tfoot
	refill_amount = 30

/obj/item/factory_refill/swat_mask_refill
	name = "一盒圆形金属板（特警面罩）"
	desc = "一个装满圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将变成特警面具。"
	refill_type = /obj/item/factory_part/swat_mask
	refill_amount = 20

/obj/item/factory_refill/module_valk_refill
	name = "一盒圆形金属板（瓦尔基里）"
	desc = "一个装满圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为瓦尔基里自动医疗装甲模块。"
	refill_type = /obj/item/factory_part/module_valk
	refill_amount = 10

/obj/item/factory_refill/module_mimir2_refill
	name = "一盒圆形金属板（米米尔 Mk2）"
	desc = "一个装满圆形金属板的箱子。用于补充拆箱器的弹药。这些完成后将变成米米尔 Mark 2 装甲和头盔模块。"
	refill_type = /obj/item/factory_part/module_mimir2
	refill_amount = 10

/obj/item/factory_refill/module_tyr2_refill
	name = "一盒圆形金属板（泰尔Mk2型）"
	desc = "一个装满圆形金属板的箱子。用于补充拆箱器的弹药。这些完成后将成为泰尔马克2型装甲模块。"
	refill_type = /obj/item/factory_part/module_tyr2
	refill_amount = 10

/obj/item/factory_refill/module_hlin_refill
	name = "一盒圆形金属板（Hlin）"
	desc = "一个装满圆形金属板的箱子。用于补充拆箱器的弹药。这些完成后将成为Hlin装甲模块。"
	refill_type = /obj/item/factory_part/module_hlin
	refill_amount = 10

/obj/item/factory_refill/module_surt_refill
	name = "一盒圆形金属板（苏尔特）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。这些完成后将成为苏尔特装甲和头盔模块。"
	refill_type = /obj/item/factory_part/module_surt
	refill_amount = 10

/obj/item/factory_refill/mortar_shell_he_refill
	name = "一盒圆形金属板（迫击炮高爆弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。这些金属板加工完成后将成为迫击炮使用的高爆炮弹。"
	refill_type = /obj/item/factory_part/mortar_shell_he
	refill_amount = 30

/obj/item/factory_refill/mortar_shell_incen_refill
	name = "一盒圆形金属板（迫击炮用）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。一旦完成，这些将成为迫击炮使用的燃烧弹。"
	refill_type = /obj/item/factory_part/mortar_shell_incen
	refill_amount = 30

/obj/item/factory_refill/mortar_shell_tfoot_refill
	name = "一盒圆形金属板（迫击炮缠足弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。一旦完成，这些将成为迫击炮使用的缠足烟雾弹。"
	refill_type = /obj/item/factory_part/mortar_shell_tfoot
	refill_amount = 30

/obj/item/factory_refill/mortar_shell_flare_refill
	name = "一盒圆形金属板（迫击炮照明弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。这些金属板一旦加工完成，就会变成用于迫击炮或榴弹炮的照明弹炮弹。"
	refill_type = /obj/item/factory_part/mortar_shell_flare
	refill_amount = 30

/obj/item/factory_refill/mortar_shell_smoke_refill
	name = "一盒圆形金属板（迫击炮烟雾弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为迫击炮使用的烟雾弹。"
	refill_type = /obj/item/factory_part/mortar_shell_flare
	refill_amount = 30

/obj/item/factory_refill/mlrs_rocket_refill
	name = "一箱圆形金属板（MLRS 高爆火箭弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。这些金属板完成后将成为多管火箭炮的高爆火箭弹。"
	refill_type = /obj/item/factory_part/mlrs_rocket
	refill_amount = 6

/obj/item/factory_refill/mlrs_rocket_refill_gas
	name = "一盒圆形金属板（MLRS X-50火箭）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。这些金属板一旦加工完成，就会变成MLRS使用的致命气体火箭弹。"
	refill_type = /obj/item/factory_part/mlrs_rocket/gas
	refill_amount = 6

/obj/item/factory_refill/mlrs_rocket_refill_cloak
	name = "一箱圆形金属板（MLRS烟雾火箭弹）"
	desc = "一个装有圆形金属板的箱子。用于补充开箱器的弹药。完成后，这些将成为多管火箭发射器的隐形烟雾火箭弹。"
	refill_type = /obj/item/factory_part/mlrs_rocket/cloak
	refill_amount = 6

/obj/item/factory_refill/mlrs_rocket_refill_incendiary
	name = "一盒圆形金属板（MLRS公司火箭弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为多管火箭发射器的燃烧火箭弹。"
	refill_type = /obj/item/factory_part/mlrs_rocket/incendiary
	refill_amount = 6

/obj/item/factory_refill/agls_he_refill
	name = "一箱圆形金属板（AGLS 高爆弹）"
	desc = "一个内部装有圆形金属板的盒子。用于补充拆箱器的弹药。完成后，这些将成为自动榴弹发射器的高爆弹匣。"
	refill_type = /obj/item/factory_part/agls_he
	refill_amount = 10

/obj/item/factory_refill/agls_frag_refill
	name = "一盒圆形金属板（AGLS 破片弹）"
	desc = "一个内部装有圆形金属板的盒子。用于补充开箱器的弹药。完成后，这些将成为自动榴弹发射器的破片弹匣。"
	refill_type = /obj/item/factory_part/agls_frag
	refill_amount = 10

/obj/item/factory_refill/agls_incendiary_refill
	name = "一盒圆形金属板（AGLS公司）"
	desc = "一个内部装有圆形金属板的盒子。用于补充拆箱器的弹药。完成后，这些将成为AGL的AGLS燃烧弹匣。"
	refill_type = /obj/item/factory_part/agls_incendiary
	refill_amount = 10

/obj/item/factory_refill/agls_flare_refill
	name = "一盒圆形金属板（AGLS照明弹）"
	desc = "一个内部装有圆形金属板的盒子。用于补充拆箱器的弹药。完成后，这些将成为AGL的AGLS照明弹弹匣。"
	refill_type = /obj/item/factory_part/agls_flare
	refill_amount = 10

/obj/item/factory_refill/agls_cloak_refill
	name = "一盒圆形金属板（AGLS烟雾弹）"
	desc = "一个内部装有圆形金属板的盒子。用于补充开箱器的弹药。完成后，这些将成为自动榴弹发射器的AGLS烟雾弹弹匣。"
	refill_type = /obj/item/factory_part/agls_cloak
	refill_amount = 10

/obj/item/factory_refill/atgun_aphe_refill
	name = "一箱圆头金属板（穿甲高爆弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为AT-36穿甲高爆炮弹。"
	refill_type = /obj/item/factory_part/atgun_aphe
	refill_amount = 30

/obj/item/factory_refill/atgun_apcr_refill
	name = "一盒圆头金属穿甲弹（AT APCR）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱机的弹药。加工完成后，这些将成为AT-36 APCR炮弹。"
	refill_type = /obj/item/factory_part/atgun_apcr
	refill_amount = 30

/obj/item/factory_refill/atgun_he_refill
	name = "一箱圆形金属板（反坦克高爆弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱机的弹药。完成后，这些将成为AT-36高爆炮弹。"
	refill_type = /obj/item/factory_part/atgun_he
	refill_amount = 30

/obj/item/factory_refill/atgun_beehive_refill
	name = "一盒圆形金属板（AT 蜂巢弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为AT-36蜂巢弹。"
	refill_type = /obj/item/factory_part/atgun_beehive
	refill_amount = 30

/obj/item/factory_refill/atgun_incend_refill
	name = "一盒圆形金属板（AT公司）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为AT-36燃烧弹。"
	refill_type = /obj/item/factory_part/atgun_incend
	refill_amount = 30

/obj/item/factory_refill/heavy_isg_he_refill
	name = "一盒圆形金属板（FK-88 高爆弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为FK-88高爆弹。"
	refill_type = /obj/item/factory_part/heavy_isg_he
	refill_amount = 5

/obj/item/factory_refill/heavy_isg_sabot_refill
	name = "一盒圆形金属板（FK-88 APFDS）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱机的弹药。这些金属板在加工完成后将成为FK-88 APFDS炮弹。"
	refill_type = /obj/item/factory_part/heavy_isg_sabot
	refill_amount = 5

/obj/item/factory_refill/ac_hv_refill
	name = "一盒圆形金属板（AC HV）"
	desc = "一个内部装有圆形金属板的盒子。用于补充拆箱器的弹药。完成后，这些将成为ATR-22高速弹匣。"
	refill_type = /obj/item/factory_part/ac_hv
	refill_amount = 10

/obj/item/factory_refill/ac_flak_refill
	name = "一盒圆形金属板（防空高射炮）"
	desc = "一个内部装有圆形金属板的盒子。用于补充拆弹器的弹药。完成后，这些将成为ATR-22高爆弹匣。"
	refill_type = /obj/item/factory_part/ac_flak
	refill_amount = 10

/obj/item/factory_refill/thermobaric_wp_refill
	name = "一盒圆形金属板（RL-57火箭弹）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为RL-57白磷火箭组件。"
	refill_type = /obj/item/factory_part/thermobaric_wp
	refill_amount = 15

/obj/item/factory_refill/drop_pod_refill
	name = "一箱圆形金属板（空降舱）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将成为宙斯轨道空投舱。"
	refill_type = /obj/item/factory_part/drop_pod
	refill_amount = 6

/obj/item/factory_refill/deployable_floodlight_refill
	name = "一箱圆形金属板（探照灯）"
	desc = "一个装有圆形金属板的箱子。用于补充拆箱器的弹药。完成后，这些将变成便携式泛光灯。"
	refill_type = /obj/item/factory_part/deployable_floodlight
	refill_amount = 10

/obj/item/factory_refill/deployable_camera_refill
	name = "一盒圆形金属板（监控）"
	desc = "一个装有圆形金属板的盒子。用于补充拆箱器。完成后将成为可部署的监控摄像头。"
	refill_type = /obj/item/factory_part/deployable_camera
	refill_amount = 30

/obj/item/factory_refill/cigarette_refill
	name = "一盒圆形金属片（香烟）"
	desc = "一个装有未完成香烟的盒子。用于补充拆盒器。"
	refill_type = /obj/item/factory_part/cigarette
	refill_amount = 500
