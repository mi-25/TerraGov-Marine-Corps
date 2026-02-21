

/obj/item/clothing/mask/gas
	name = "透明防毒面具"
	desc = "一种可连接供气系统的面罩。能过滤空气中的有害气体。"
	icon_state = "gas_alt"
	worn_icon_state = "gas_alt"
	inventory_flags = COVERMOUTH | COVEREYES | BLOCKGASEFFECT
	inv_hide_flags = HIDEEARS|HIDEFACE|HIDELOWHAIR
	cold_protection_flags = HEAD
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	w_class = WEIGHT_CLASS_SMALL
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	var/gas_filter_strength = 1			//For gas mask filters
	var/list/filtered_gases = list(/datum/reagent/toxin/phoron, "sleeping_agent", "carbon_dioxide")
	///Does this particular mask have breath noises
	var/breathy = TRUE
	///This covers most of the screen
	var/hearing_range = 5

/obj/item/clothing/mask/gas/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(!breathy)
		return
	if(TIMER_COOLDOWN_RUNNING(src, COOLDOWN_GAS_BREATH))
		return
	if(slot != SLOT_WEAR_MASK)
		return
	for(var/M in get_hearers_in_view(hearing_range, src))
		if(ismob(M))
			var/mob/HM = M
			HM.playsound_local(user, SFX_GASBREATH, 20, 1)
			TIMER_COOLDOWN_START(src, COOLDOWN_GAS_BREATH, 10 SECONDS)

/obj/item/clothing/mask/gas/tactical
	name = "战术防毒面具"
	icon_state = "gas_alt_tactical"
	voice_filter = "lowpass=f=750,volume=2"

/obj/item/clothing/mask/gas/tactical/coif
	name = "战术头罩式防毒面具"
	desc = "一种可连接供气系统的全覆盖式头罩面罩。能过滤空气中的有害气体。"
	icon_state = "gascoif"
	inv_hide_flags = HIDEEARS|HIDEFACE|HIDEALLHAIR

/obj/item/clothing/mask/gas/pmc
	name = "\improper M8型装甲面罩"
	desc = "一款旨在隐藏操作员身份并兼具空气过滤功能的装甲面罩。"
	icon_state = "pmc_mask"
	worn_icon_state = "helmet"
	anti_hug = 3
	inventory_flags = COVERMOUTH|BLOCKGASEFFECT
	inv_hide_flags = HIDEEARS|HIDEFACE|HIDEALLHAIR
	breathy = FALSE
	voice_filter = "lowpass=f=750,volume=2"

/obj/item/clothing/mask/gas/pmc/damaged
	name = "受损的M8型装甲面罩"
	anti_hug = 0

/obj/item/clothing/mask/gas/pmc/upp
	name = "\improper UPP装甲突击队巴拉克拉瓦头套"
	icon_state = "upp_mask"

/obj/item/clothing/mask/gas/pmc/leader
	name = "\improper M8型装甲面罩"
	desc = "一款旨在隐藏操作者身份并兼具空气过滤功能的装甲面罩。此外，面部开口处配有柔软的白色合成材料边缘，戴上它你绝对不会感到寒冷。"
	icon_state = "officer_mask"

/obj/item/clothing/mask/gas/wolves
	name = "战术面罩"
	desc = "钢铁之狼使用的优质巴拉克拉瓦头套。"
	icon_state = "wolf_mask"
	anti_hug = 2
	breathy = FALSE

/obj/item/clothing/mask/gas/icc
	name = "\improper 60型防毒面具"
	desc = "纳米传讯人员佩戴的防毒面具。"
	icon_state = "icc"

/obj/item/clothing/mask/gas/vsd
	name = "\improper 维亚切斯拉夫装甲突击队巴拉克拉瓦头套"
	desc = "传承给V.S.D.的旧巴拉克拉瓦头套。"
	inv_hide_flags = HIDEEARS|HIDEFACE|HIDEALLHAIR
	icon_state = "upp_mask"

/obj/item/clothing/mask/gas/tactical/freelancer
	name = "MAG-3L 卷边式防毒面具"
	desc = "一款老式的警用透明防毒面具，配有防护面罩。属于MAGNUM自由佣兵的财产。"
	inv_hide_flags = HIDEEARS|HIDEFACE|HIDEALLHAIR
	icon_state = "merc"
	worn_icon_state = "merc"

//Plague Dr suit can be found in clothing/suits/bio.dm
/obj/item/clothing/mask/gas/plaguedoctor
	name = "瘟疫医生面具"
	desc = "这款经典设计的现代化版本不仅能过滤掉等离子体，还能连接供气系统。"
	icon_state = "plaguedoctor"
	worn_icon_state = "gas_mask"
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 2, ENERGY = 2, BOMB = 0, BIO = 75, FIRE = 2, ACID = 2)
	armor_protection_flags = HEAD|FACE

/obj/item/clothing/mask/gas/swat
	name = "\improper 特警面罩"
	desc = "一款贴合面部的战术面罩，可连接至供气系统。"
	icon_state = "swat"
	anti_hug = 1
	siemens_coefficient = 0.7
	armor_protection_flags = FACE|EYES
	voice_filter = "lowpass=f=750,volume=2"

/obj/item/clothing/mask/gas/specops
	name = "特种作战防毒面具"
	desc = "一款贴合面部的战术面罩，可连接供气系统。基于旧式防毒面具设计改进。"
	icon = 'icons/mob/clothing/mask.dmi'
	worn_icon_list = list(
		slot_wear_suit_str = 'icons/mob/clothing/mask.dmi'
	)
	icon_state = "specop"
	worn_icon_state = "specop"
	siemens_coefficient = 0.7
	voice_filter = "lowpass=f=750,volume=2"

/obj/item/clothing/mask/gas/syndicate
	name = "辛迪加面具"
	desc = "一款贴合面部的战术面罩，可连接至供气系统。"
	icon_state = "swat"
	siemens_coefficient = 0.7

/obj/item/clothing/mask/gas/voice
	name = "防毒面具"
	//desc = "A face-covering mask that can be connected to an air supply. It seems to house some odd electronics."
	var/mode = 0// 0==Scouter|1==Night Vision|2==Thermal|3==Meson
	var/vchange = 0//This didn't do anything before. It now checks if the mask has special functions/N


/obj/item/clothing/mask/gas/voice/space_ninja
	name = "忍者面罩"
	desc = "一款贴合面部的面罩，既能作为空气过滤器，也是后现代时尚宣言。"
	icon_state = "s-ninja"
	worn_icon_state = "s-ninja_mask"
	vchange = 1
	siemens_coefficient = 0.2

/obj/item/clothing/mask/gas/clown_hat
	name = "小丑假发和面具"
	desc = "真正的恶作剧大师的面部装扮。没有假发和面具，小丑就不完整。"
	icon_state = "clown"
	worn_icon_state = "clown_hat"
	breathy = FALSE

/obj/item/clothing/mask/gas/sexyclown
	name = "性感小丑假发和面具"
	desc = "一款女性小丑面具，适合初试变装者或女性表演者。"
	icon_state = "sexyclown"
	worn_icon_state = "sexyclown"
	breathy = FALSE

/obj/item/clothing/mask/gas/mime
	name = "小丑面具"
	desc = "传统小丑面具。它有着诡异的面部表情。"
	icon_state = "mime"
	worn_icon_state = "mime"
	breathy = FALSE

/obj/item/clothing/mask/gas/monkeymask
	name = "猴子面具"
	desc = "扮演猴子时使用的面具。"
	icon_state = "monkeymask"
	worn_icon_state = "monkeymask"
	armor_protection_flags = HEAD|FACE|EYES
	breathy = FALSE

/obj/item/clothing/mask/gas/sexymime
	name = "性感小丑面具"
	desc = "传统的女性默剧演员面具。"
	icon_state = "sexymime"
	worn_icon_state = "sexymime"
	breathy = FALSE

/obj/item/clothing/mask/gas/death_commando
	name = "死亡突击队面罩"
	icon_state = "death_commando_mask"
	worn_icon_state = "death_commando_mask"
	siemens_coefficient = 0.2

/obj/item/clothing/mask/gas/cyborg
	name = "合成人护目镜"
	desc = "哔噗"
	icon_state = "death"
	breathy = FALSE

/obj/item/clothing/mask/gas/owl_mask
	name = "猫头鹰面具"
	desc = "二！"
	icon_state = "owl"
