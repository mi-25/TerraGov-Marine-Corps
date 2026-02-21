/datum/chemical_reaction/saline_glucose
	name = "生理盐水-葡萄糖" //Chem to restore blood.
	results = list(/datum/reagent/medicine/saline_glucose = 3)
	required_reagents = list(/datum/reagent/consumable/sodiumchloride = 1, /datum/reagent/water = 1, /datum/reagent/consumable/sugar = 1)

/datum/chemical_reaction/tricordrazine
	name = "三卡德嗪"
	results = list(/datum/reagent/medicine/tricordrazine = 2)
	required_reagents = list(/datum/reagent/medicine/inaprovaline = 1, /datum/reagent/medicine/dylovene = 1)
	mob_react = FALSE

/datum/chemical_reaction/alkysine
	name = "阿尔克辛"
	results = list(/datum/reagent/medicine/alkysine = 2)
	required_reagents = list(/datum/reagent/chlorine = 1, /datum/reagent/nitrogen = 1, /datum/reagent/medicine/dylovene = 1)

/datum/chemical_reaction/dexalin
	name = "地克沙林"
	results = list(/datum/reagent/medicine/dexalin = 1)
	required_reagents = list(/datum/reagent/oxygen = 2, /datum/reagent/toxin/phoron = 0.1)
	required_catalysts = list(/datum/reagent/toxin/phoron = 5)

/datum/chemical_reaction/dermalime
	name = "德马林"
	results = list(/datum/reagent/medicine/dermaline = 4)
	required_reagents = list(/datum/reagent/oxygen = 1, /datum/reagent/phosphorus = 1, /datum/reagent/medicine/kelotane = 1, /datum/reagent/medicine/lemoline = 1)

/datum/chemical_reaction/dexalinplus
	name = "地克沙林加强剂"
	results = list(/datum/reagent/medicine/dexalinplus = 3)
	required_reagents = list(/datum/reagent/medicine/dexalin = 1, /datum/reagent/carbon = 1, /datum/reagent/iron = 1)

/datum/chemical_reaction/bicaridine
	name = "比卡瑞丁"
	results = list(/datum/reagent/medicine/bicaridine = 2)
	required_reagents = list(/datum/reagent/medicine/inaprovaline = 1, /datum/reagent/carbon = 1)

/datum/chemical_reaction/meralyne
	name = "梅拉琳"
	results = list(/datum/reagent/medicine/meralyne = 4)
	required_reagents = list(/datum/reagent/medicine/inaprovaline = 1, /datum/reagent/medicine/bicaridine = 1, /datum/reagent/iron = 1, /datum/reagent/medicine/lemoline = 1)

/datum/chemical_reaction/ryetalyn
	name = "莱特林"
	results = list(/datum/reagent/medicine/ryetalyn = 3)
	required_reagents = list(/datum/reagent/medicine/arithrazine = 1, /datum/reagent/carbon = 1, /datum/reagent/medicine/lemoline = 1)

/datum/chemical_reaction/cryoxadone
	name = "冷冻克赛酮"
	results = list(/datum/reagent/medicine/cryoxadone = 3)
	required_reagents = list(/datum/reagent/medicine/dexalin = 1, /datum/reagent/water = 1, /datum/reagent/oxygen = 1)

/datum/chemical_reaction/clonexadone
	name = "克隆克萨酮"
	results = list(/datum/reagent/medicine/clonexadone = 2)
	required_reagents = list(/datum/reagent/medicine/cryoxadone = 1, /datum/reagent/sodium = 1, /datum/reagent/toxin/phoron = 0.1)
	required_catalysts = list(/datum/reagent/toxin/phoron = 5)

/datum/chemical_reaction/spaceacillin
	name = "太空青霉素"
	results = list(/datum/reagent/medicine/spaceacillin = 2)
	required_reagents = list(/datum/reagent/cryptobiolin = 1, /datum/reagent/medicine/inaprovaline = 1)

/datum/chemical_reaction/polyhexanide
	name = "聚己酰胺"
	results = list(/datum/reagent/medicine/polyhexanide = 3)
	required_reagents = list(/datum/reagent/cryptobiolin = 1, /datum/reagent/medicine/spaceacillin = 1, /datum/reagent/sterilizine = 1)

/datum/chemical_reaction/larvaway
	name = "幼虫驱离剂"
	results = list(/datum/reagent/medicine/larvaway = 3)
	required_reagents = list(/datum/reagent/medicine/spaceacillin = 1, /datum/reagent/medicine/polyhexanide = 1, /datum/reagent/sterilizine = 1)

/datum/chemical_reaction/imidazoline
	name = "咪唑啉"
	results = list(/datum/reagent/medicine/imidazoline = 2)
	required_reagents = list(/datum/reagent/carbon = 1, /datum/reagent/hydrogen = 1, /datum/reagent/medicine/dylovene = 1)

/datum/chemical_reaction/ethylredoxrazine
	name = "乙红氧嗪"
	results = list(/datum/reagent/medicine/ethylredoxrazine = 3)
	required_reagents = list(/datum/reagent/oxygen = 1, /datum/reagent/medicine/dylovene = 1, /datum/reagent/carbon = 1)

/datum/chemical_reaction/ethanoloxidation
	name = "乙醇氧化"	//Kind of a placeholder in case someone ever changes it so that chemicals
	results = list(/datum/reagent/water = 2) //H2O2 doesn't equal water, maybe change it in the future.
	required_reagents = list(/datum/reagent/medicine/ethylredoxrazine = 1, /datum/reagent/consumable/ethanol = 1)

/datum/chemical_reaction/sterilizine
	name = "消毒液"
	results = list(/datum/reagent/sterilizine = 3)
	required_reagents = list(/datum/reagent/consumable/ethanol = 1, /datum/reagent/medicine/dylovene = 1, /datum/reagent/chlorine = 1)

/datum/chemical_reaction/inaprovaline
	name = "伊那普洛林"
	results = list(/datum/reagent/medicine/inaprovaline = 3)
	required_reagents = list(/datum/reagent/oxygen = 1, /datum/reagent/carbon = 1, /datum/reagent/consumable/sugar = 1)

/datum/chemical_reaction/dylovene
	name = "地洛维宁"
	results = list(/datum/reagent/medicine/dylovene = 3)
	required_reagents = list(/datum/reagent/silicon = 1, /datum/reagent/potassium = 1, /datum/reagent/nitrogen = 1)


/datum/chemical_reaction/tramadol
	name = "曲马多"
	results = list(/datum/reagent/medicine/tramadol = 3)
	required_reagents = list(/datum/reagent/medicine/inaprovaline = 1, /datum/reagent/consumable/ethanol = 1, /datum/reagent/oxygen = 1)

/datum/chemical_reaction/paracetamol
	name = "扑热息痛"
	results = list(/datum/reagent/medicine/paracetamol = 3)
	required_reagents = list(/datum/reagent/medicine/tramadol = 1, /datum/reagent/consumable/sugar = 1, /datum/reagent/water = 1)

/datum/chemical_reaction/oxycodone
	name = "羟考酮"
	results = list(/datum/reagent/medicine/oxycodone = 1)
	required_reagents = list(/datum/reagent/consumable/ethanol = 1, /datum/reagent/medicine/tramadol = 1)
	required_catalysts = list(/datum/reagent/toxin/phoron = 1)

/datum/chemical_reaction/synaptizine
	name = "突触素"
	results = list(/datum/reagent/medicine/synaptizine = 4)
	required_reagents = list(/datum/reagent/consumable/sugar = 1, /datum/reagent/lithium = 1, /datum/reagent/water = 1, /datum/reagent/medicine/lemoline = 1)

/datum/chemical_reaction/leporazine
	name = "莱珀嗪"
	results = list(/datum/reagent/medicine/leporazine = 2)
	required_reagents = list(/datum/reagent/silicon = 1, /datum/reagent/copper = 1)
	required_catalysts = list(/datum/reagent/toxin/phoron = 5)

/datum/chemical_reaction/hyronalin
	name = "海洛那林"
	results = list(/datum/reagent/medicine/hyronalin = 3)
	required_reagents = list(/datum/reagent/radium = 1, /datum/reagent/medicine/dylovene = 1, /datum/reagent/medicine/lemoline = 1)

/datum/chemical_reaction/arithrazine
	name = "阿里司拉嗪"
	results = list(/datum/reagent/medicine/arithrazine = 2)
	required_reagents = list(/datum/reagent/medicine/hyronalin = 1, /datum/reagent/hydrogen = 1)

/datum/chemical_reaction/kelotane
	name = "凯洛坦"
	results = list(/datum/reagent/medicine/kelotane = 2)
	required_reagents = list(/datum/reagent/silicon = 1, /datum/reagent/carbon = 1)

/datum/chemical_reaction/peridaxon_plus
	name = "强化培多克松"
	results = list(/datum/reagent/medicine/peridaxon_plus = 1)
	required_reagents = list(/datum/reagent/medicine/ryetalyn = 5, /datum/reagent/toxin/phoron = 5)

/datum/chemical_reaction/quickclot
	name = "快速凝血剂"
	results = list(/datum/reagent/medicine/quickclot = 1)
	required_reagents = list(/datum/reagent/medicine/kelotane = 2, /datum/reagent/medicine/clonexadone = 2)
	required_catalysts = list(/datum/reagent/toxin/phoron = 5)

/datum/chemical_reaction/quickclotplus
	name = "快速凝血剂增强型"
	results = list(/datum/reagent/medicine/quickclotplus = 1)
	required_reagents = list(/datum/reagent/medicine/quickclot = 2, /datum/reagent/medicine/lemoline = 2, /datum/reagent/iron = 2)

/datum/chemical_reaction/hypervene //New purge chem.
	name = "超凡"
	results = list(/datum/reagent/hypervene = 3)
	required_reagents = list(/datum/reagent/medicine/arithrazine = 1, /datum/reagent/medicine/dylovene = 1, /datum/reagent/medicine/ethylredoxrazine = 1)

/datum/chemical_reaction/neuraline
	name = "神经素"
	results = list(/datum/reagent/medicine/neuraline = 4, /datum/reagent/toxin/huskpowder = 1)
	required_reagents = list(/datum/reagent/medicine/synaptizine = 1, /datum/reagent/medicine/arithrazine = 1, /datum/reagent/medicine/tricordrazine = 2, /datum/reagent/consumable/larvajellyprepared = 1)
	required_catalysts = list(/datum/reagent/medicine/lemoline = 5)

/datum/chemical_reaction/lemoline
	name = "莱莫林催化"
	results = list(/datum/reagent/medicine/lemoline = 5) //4 to one multiplication ratio
	required_reagents = list(/datum/reagent/medicine/lemoline = 1, /datum/reagent/consumable/larvajelly = 1)

// Cloning chemicals
/datum/chemical_reaction/dupl_bicaridine
	name = "复制双卡因"
	results = list(/datum/reagent/medicine/bicaridine = 2)
	required_reagents = list(/datum/reagent/virilyth = 1, /datum/reagent/medicine/bicaridine = 1)

/datum/chemical_reaction/dupl_kelotane
	name = "复制凯洛坦"
	results = list(/datum/reagent/medicine/kelotane = 2)
	required_reagents = list(/datum/reagent/virilyth = 1, /datum/reagent/medicine/kelotane = 1)

/datum/chemical_reaction/dupl_tramadol
	name = "复制曲马多"
	results = list(/datum/reagent/medicine/tramadol = 2)
	required_reagents = list(/datum/reagent/virilyth = 1, /datum/reagent/medicine/tramadol = 1)

/datum/chemical_reaction/dupl_dylovene
	name = "复制迪洛芬"
	results = list(/datum/reagent/medicine/dylovene = 2)
	required_reagents = list(/datum/reagent/virilyth = 1, /datum/reagent/medicine/dylovene = 1)

/datum/chemical_reaction/bihexajuline
	name = "比六聚体"
	results = list(/datum/reagent/medicine/bihexajuline = 5)
	required_reagents = list(/datum/reagent/medicine/bicaridine = 2, /datum/reagent/consumable/milk = 1, /datum/reagent/iron = 2)

/datum/chemical_reaction/quietus
	name = "寂静"
	results = list(/datum/reagent/medicine/research/quietus = 1)
	required_reagents = list(/datum/reagent/toxin/chloralhydrate = 3, /datum/reagent/medicine/dylovene = 1, /datum/reagent/medicine/lemoline = 3)

/datum/chemical_reaction/somolent
	name = "昏睡"
	results = list(/datum/reagent/medicine/research/somolent = 4)
	required_reagents = list(/datum/reagent/toxin/sleeptoxin = 1, /datum/reagent/medicine/tricordrazine = 1, /datum/reagent/consumable/doctor_delight = 1, /datum/reagent/medicine/paracetamol = 1)
	required_catalysts = list(/datum/reagent/medicine/lemoline = 5)

/datum/chemical_reaction/medicalnanites
	name = "医疗纳米机器人"
	results = list(/datum/reagent/medicalnanites = 9)
	required_reagents = list(/datum/reagent/iron = 10, /datum/reagent/medicine/lemoline = 1)
	required_catalysts = list(/datum/reagent/medicalnanites = 1)

/datum/chemical_reaction/stimulum
	name = "兴奋剂"
	results = list(/datum/reagent/medicine/research/stimulon = 1)
	required_reagents = list(/datum/reagent/medicine/synaptizine = 10, /datum/reagent/medicine/arithrazine = 20, /datum/reagent/consumable/nutriment = 20, /datum/reagent/medicine/lemoline = 20)
