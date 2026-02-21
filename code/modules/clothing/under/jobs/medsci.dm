/*
* Science
*/
/obj/item/clothing/under/rank/research_director
	desc = "这是一件由那些掌握相关知识、能够胜任'研究主管'职位的人所穿着的连体服。其面料能提供对生化污染物的轻微防护。"
	name = "研究主管连体服"
	icon_state = "director"
	worn_icon_state = "g_suit"

/obj/item/clothing/under/rank/research_director/rdalt
	desc = "一件简单的蓝色实用连体服，作为地球政府殖民地海军陆战队设施内支援型合成人的标准配发勤务制服。"
	name = "合成人勤务制服"
	icon_state = "rdalt"

/obj/item/clothing/under/rank/research_director/dress_rd
	name = "研究主管礼服"
	desc = "注重时尚风格的研究主管女性服饰。其面料对生化污染物提供轻微防护。"
	icon_state = "dress_rd"
	armor_protection_flags = CHEST|GROIN|ARMS

/obj/item/clothing/under/rank/scientist
	desc = "它由特殊纤维制成，能提供对小型爆炸的轻微防护。上面有标识表明穿戴者是科学家。"
	name = "科学家连体服"
	icon_state = "science"
	worn_icon_state = "w_suit"
	permeability_coefficient = 0.50

/obj/item/clothing/under/rank/chemist
	desc = "它由特殊纤维制成，能提供针对生化危害的特殊防护。上面带有化学兵军衔条纹。"
	name = "化学家连体服"
	icon_state = "chemistry"
	worn_icon_state = "w_suit"
	permeability_coefficient = 0.50

/*
* Medical
*/
/obj/item/clothing/under/rank/chief_medical_officer
	desc = "这是一件由具备担任'首席医疗官'经验者穿着的连体服。它提供轻微的生化防护。"
	name = "首席医疗官的连体服"
	icon_state = "cmo"
	worn_icon_state = "w_suit"
	permeability_coefficient = 0.50

/obj/item/clothing/under/rank/geneticist
	desc = "它由特殊纤维制成，能提供针对生化危害的特殊防护。上面有一条遗传学军衔条纹。"
	name = "遗传学家连体服"
	icon_state = "genetics"
	worn_icon_state = "w_suit"
	permeability_coefficient = 0.50

/obj/item/clothing/under/rank/virologist
	desc = "它由特殊纤维制成，能提供针对生化危害的特殊防护。上面有一条病毒学家等级条纹。"
	name = "病毒学家连体服"
	icon_state = "virology"
	worn_icon_state = "w_suit"
	permeability_coefficient = 0.50

/obj/item/clothing/under/rank/nursesuit
	desc = "这是医疗部门护理人员常穿的一种连体服。"
	name = "护士服"
	icon_state = "nursesuit"
	permeability_coefficient = 0.50
	armor_protection_flags = CHEST|GROIN

/obj/item/clothing/under/rank/nurse
	desc = "医疗部门护理人员常穿的连衣裙。"
	name = "护士裙"
	icon_state = "nurse"
	permeability_coefficient = 0.50
	armor_protection_flags = CHEST|GROIN
	adjustment_variants = list()

/obj/item/clothing/under/rank/orderly
	desc = "一套白色制服，专为热爱秩序、讲究条理的人士设计。"
	name = "勤务兵制服"
	icon_state = "orderly"
	permeability_coefficient = 0.50
	adjustment_variants = list()

/obj/item/clothing/under/rank/medical
	desc = "它由特殊纤维制成，能提供对生化危害的轻微防护。胸前印有十字标识，表明穿戴者是受过训练的医疗人员。"
	name = "医生的连体服"
	icon_state = "medical"
	worn_icon_state = "w_suit"
	permeability_coefficient = 0.50

/obj/item/clothing/under/rank/medical/blue
	name = "蓝色医疗服"
	desc = "它由特殊纤维制成，能提供对生化危害的轻微防护。这款是婴儿蓝色的。"
	icon_state = "scrubsblue"
	adjustment_variants = list(
		"Half" = "_h",
	)

/obj/item/clothing/under/rank/medical/green
	name = "绿色医疗工作服"
	desc = "它由特殊纤维制成，能提供对生化危害的轻微防护。这款为深绿色。"
	icon_state = "scrubsgreen"
	adjustment_variants = list(
		"Half" = "_h",
	)

/obj/item/clothing/under/rank/medical/purple
	name = "紫色医疗服"
	desc = "它由特殊纤维制成，能提供对生化危害的轻微防护。这件是深紫色的。"
	icon_state = "scrubspurple"
	adjustment_variants = list(
		"Half" = "_h",
	)

/obj/item/clothing/under/rank/psych
	desc = "一套基础的白色连体服。上面有青绿色的标记，表明穿着者是精神病学家。"
	name = "心理医生连体服"
	icon_state = "psych"
	worn_icon_state = "w_suit"
	adjustment_variants = list()


/obj/item/clothing/under/rank/psych/turtleneck
	desc = "一件青绿色高领毛衣和一条深蓝色休闲裤，属于一位心理学家。"
	name = "心理医生的高领毛衣"
	icon_state = "psychturtle"
	worn_icon_state = "b_suit"
	adjustment_variants = list()
