/datum/chemical_reaction/serotrotium
	name = "血清素"
	results = list(/datum/reagent/serotrotium = 1) //Weird emotes, chance of minor drowsiness.
	required_reagents = list(/datum/reagent/medicine/paracetamol = 1, /datum/reagent/medicine/tramadol = 1)

/datum/chemical_reaction/toxin_two //Space Atropine!
	name = "毒素"
	results = list(/datum/reagent/toxin = 3)
	required_reagents = list(/datum/reagent/medicine/synaptizine = 1, /datum/reagent/toxin/xeno_neurotoxin = 8)

/datum/chemical_reaction/sdtoxin
	name = "毒素"
	results = list(/datum/reagent/toxin/sdtoxin = 2)
	required_reagents = list(/datum/reagent/medicine/synaptizine = 1, /datum/reagent/medicine/dylovene = 1)

/datum/chemical_reaction/sleeptoxin
	name = "催眠剂"
	results = list(/datum/reagent/toxin/sleeptoxin = 5)
	required_reagents = list(/datum/reagent/toxin/chloralhydrate = 1, /datum/reagent/consumable/sugar = 4)

/datum/chemical_reaction/mutagen
	name = "不稳定诱变剂"
	results = list(/datum/reagent/toxin/mutagen = 3)
	required_reagents = list(/datum/reagent/radium = 1, /datum/reagent/phosphorus = 1, /datum/reagent/chlorine = 1)

/datum/chemical_reaction/water //I can't believe we never had this.
	name = "水"
	results = list(/datum/reagent/water = 1)
	required_reagents = list(/datum/reagent/oxygen = 1, /datum/reagent/hydrogen = 2)

/datum/chemical_reaction/lexorin
	name = "莱克索林"
	results = list(/datum/reagent/toxin/lexorin = 3)
	required_reagents = list(/datum/reagent/toxin/phoron = 1, /datum/reagent/hydrogen = 1, /datum/reagent/nitrogen = 1)

/datum/chemical_reaction/space_drugs
	name = "太空毒品"
	results = list(/datum/reagent/space_drugs = 3)
	required_reagents = list(/datum/reagent/mercury = 1, /datum/reagent/consumable/sugar = 1, /datum/reagent/lithium = 1)

/datum/chemical_reaction/lube
	name = "太空润滑剂"
	results = list(/datum/reagent/lube = 4)
	required_reagents = list(/datum/reagent/water = 1, /datum/reagent/silicon = 1, /datum/reagent/oxygen = 1)

/datum/chemical_reaction/pacid
	name = "聚三硝基酸液"
	results = list(/datum/reagent/toxin/acid/polyacid = 3)
	required_reagents = list(/datum/reagent/toxin/acid = 1, /datum/reagent/chlorine = 1, /datum/reagent/potassium = 1)

/datum/chemical_reaction/impedrezene
	name = "伊姆佩德雷辛"
	results = list(/datum/reagent/impedrezene = 2)
	required_reagents = list(/datum/reagent/mercury = 1, /datum/reagent/oxygen = 1, /datum/reagent/consumable/sugar = 1)

/datum/chemical_reaction/cryptobiolin
	name = "隐生质"
	results = list(/datum/reagent/cryptobiolin = 3)
	required_reagents = list(/datum/reagent/potassium = 1, /datum/reagent/oxygen = 1, /datum/reagent/consumable/sugar = 1)

/datum/chemical_reaction/glycerol
	name = "甘油"
	results = list(/datum/reagent/glycerol = 1)
	required_reagents = list(/datum/reagent/consumable/cornoil = 3, /datum/reagent/toxin/acid = 1)

/datum/chemical_reaction/chemsmoke
	name = "化学烟雾"
	required_reagents = list(/datum/reagent/potassium = 1, /datum/reagent/consumable/sugar = 1, /datum/reagent/phosphorus = 1)

/datum/chemical_reaction/chemsmoke/on_reaction(datum/reagents/holder, created_volume)
	var/smoke_radius = round(sqrt(created_volume * 0.8), 1)
	var/location = get_turf(holder.get_holder())
	var/datum/effect_system/smoke_spread/chem/S = new(location)
	playsound(location, 'sound/effects/smoke.ogg', 50, 1, -3)
	S?.set_up(holder, smoke_radius, location)
	S?.start()
	if(holder?.get_holder())
		holder.clear_reagents()

/datum/chemical_reaction/chloralhydrate
	name = "水合氯醛"
	results = list(/datum/reagent/toxin/chloralhydrate = 1)
	required_reagents = list(/datum/reagent/consumable/ethanol = 1, /datum/reagent/chlorine = 3, /datum/reagent/water = 1)

/datum/chemical_reaction/potassium_chloride
	name = "氯化钾"
	results = list(/datum/reagent/toxin/potassium_chloride = 2)
	required_reagents = list(/datum/reagent/consumable/sodiumchloride = 1, /datum/reagent/potassium = 1)

/datum/chemical_reaction/potassium_chlorophoride
	name = "氯酸钾"
	results = list(/datum/reagent/toxin/potassium_chlorophoride = 4)
	required_reagents = list(/datum/reagent/toxin/potassium_chloride = 1, /datum/reagent/toxin/phoron = 1, /datum/reagent/toxin/chloralhydrate = 1)

/datum/chemical_reaction/huskpowder
	name = "僵尸粉"
	results = list(/datum/reagent/toxin/huskpowder = 2)
	required_reagents = list(/datum/reagent/toxin/carpotoxin = 5, /datum/reagent/toxin/sleeptoxin = 5, /datum/reagent/copper = 5)

/datum/chemical_reaction/rezadone
	name = "雷扎酮"
	results = list(/datum/reagent/medicine/rezadone = 3)
	required_reagents = list(/datum/reagent/toxin/carpotoxin = 1, /datum/reagent/cryptobiolin = 1, /datum/reagent/copper = 1)

/datum/chemical_reaction/mindbreaker
	name = "精神破坏毒素"
	results = list(/datum/reagent/toxin/mindbreaker = 3)
	required_reagents = list(/datum/reagent/silicon = 1, /datum/reagent/hydrogen = 1, /datum/reagent/medicine/dylovene = 1)

/datum/chemical_reaction/lipozine
	name = "脂溶素"
	results = list(/datum/reagent/consumable/lipozine = 3)
	required_reagents = list(/datum/reagent/consumable/sodiumchloride = 1, /datum/reagent/consumable/ethanol = 1, /datum/reagent/radium = 1)

/datum/chemical_reaction/phoronsolidification
	name = "固态等离子体"
	required_reagents = list(/datum/reagent/iron = 5, /datum/reagent/consumable/frostoil = 5, /datum/reagent/toxin/phoron = 20)

/datum/chemical_reaction/phoronsolidification/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.get_holder())
	new /obj/item/stack/sheet/mineral/phoron(location)

/datum/chemical_reaction/plastication
	name = "塑料"
	required_reagents = list(/datum/reagent/toxin/acid/polyacid = 10, /datum/reagent/toxin/plasticide = 20)

/datum/chemical_reaction/plastication/on_reaction(datum/reagents/holder)
	new /obj/item/stack/sheet/mineral/plastic(get_turf(holder.get_holder()),10)

/datum/chemical_reaction/virus_food
	name = "病毒培养液"
	results = list(/datum/reagent/consumable/virus_food = 15)
	required_reagents = list(/datum/reagent/water = 5, /datum/reagent/consumable/milk = 5, /datum/reagent/oxygen = 5)


///////////////////////////////////////////////////////////////////////////////////
// foam and foam precursor

/datum/chemical_reaction/surfactant
	name = "泡沫表面活性剂"
	results = list(/datum/reagent/fluorosurfactant = 5)
	required_reagents = list(/datum/reagent/fluorine = 2, /datum/reagent/carbon = 2, /datum/reagent/toxin/acid = 1)


/datum/chemical_reaction/foam
	name = "泡沫"
	required_reagents = list(/datum/reagent/fluorosurfactant = 1, /datum/reagent/water = 1)
	mob_react = FALSE

/datum/chemical_reaction/foam/on_reaction(datum/reagents/holder, created_volume)
	var/turf/location = get_turf(holder.get_holder())
	location.visible_message(span_warning("溶液喷出泡沫！"))
	var/datum/effect_system/foam_spread/s = new()
	s.set_up(created_volume, location, holder, NONE)
	s.start()
	holder.clear_reagents()


/datum/chemical_reaction/metalfoam
	name = "金属泡沫"
	required_reagents = list(/datum/reagent/aluminum = 3, /datum/reagent/foaming_agent = 1, /datum/reagent/toxin/acid/polyacid = 1)
	mob_react = FALSE

/datum/chemical_reaction/metalfoam/on_reaction(datum/reagents/holder, created_volume)
	var/turf/location = get_turf(holder.get_holder())
	location.visible_message(span_warning("溶液喷涌出金属泡沫！"))

	var/datum/effect_system/foam_spread/s = new()
	s.set_up(created_volume, location, holder, METAL_FOAM)
	s.start()
	holder.clear_reagents()


/datum/chemical_reaction/ironfoam
	name = "铁质泡沫"
	required_reagents = list(/datum/reagent/iron = 3, /datum/reagent/foaming_agent = 1, /datum/reagent/toxin/acid = 1)
	mob_react = FALSE

/datum/chemical_reaction/ironfoam/on_reaction(datum/reagents/holder, created_volume)
	var/turf/location = get_turf(holder.get_holder())
	location.visible_message(span_warning("溶液喷涌出金属泡沫！"))
	var/datum/effect_system/foam_spread/s = new()
	s.set_up(created_volume, location, holder, METAL_FOAM)
	s.start()
	holder.clear_reagents()

/datum/chemical_reaction/razorburn
	name = "剃刀灼烧气体"
	required_reagents = list(/datum/reagent/foaming_agent = 1, /datum/reagent/toxin/nanites = 1)
	required_catalysts = list(/datum/reagent/toxin/nanites = 7)

/datum/chemical_reaction/razorburn/on_reaction(datum/reagents/holder, created_volume)
	var/turf/location = get_turf(holder.get_holder())
	location.visible_message(span_danger("溶液喷出一股浓密的贴地气体！快离开！"))
	var/datum/effect_system/foam_spread/s = new()
	s.set_up(created_volume, location, holder, RAZOR_FOAM)
	s.start()

/datum/chemical_reaction/foaming_agent
	name = "发泡剂"
	results = list(/datum/reagent/foaming_agent = 1)
	required_reagents = list(/datum/reagent/lithium = 1, /datum/reagent/hydrogen = 1)

/datum/chemical_reaction/ammonia
	name = "氨"
	results = list(/datum/reagent/ammonia = 3)
	required_reagents = list(/datum/reagent/hydrogen = 3, /datum/reagent/nitrogen = 1)

/datum/chemical_reaction/diethylamine
	name = "二乙胺"
	results = list(/datum/reagent/diethylamine = 2)
	required_reagents = list(/datum/reagent/ammonia = 1, /datum/reagent/consumable/ethanol = 1)

/datum/chemical_reaction/space_cleaner
	name = "空间清洁剂"
	results = list(/datum/reagent/space_cleaner = 2)
	required_reagents = list(/datum/reagent/ammonia = 1, /datum/reagent/water = 1)

/datum/chemical_reaction/plantbgone
	name = "植物杀手"
	results = list(/datum/reagent/toxin/plantbgone = 5)
	required_reagents = list(/datum/reagent/toxin = 1, /datum/reagent/water = 4)

/datum/chemical_reaction/laughter
	name = "笑声"
	results = list(/datum/reagent/consumable/laughter = 5)
	required_reagents = list(/datum/reagent/consumable/sugar = 1, /datum/reagent/consumable/banana = 1)


//Explosives and pyrotechnics
/datum/chemical_reaction/napalm
	name = "凝固汽油弹"
	required_reagents = list(/datum/reagent/aluminum = 1, /datum/reagent/toxin/phoron = 2, /datum/reagent/toxin/acid = 1 )

/datum/chemical_reaction/napalm/on_reaction(datum/reagents/holder, created_volume, radius)
	radius = round(sqrt(created_volume * 0.15)) //allows a nice, healthy 3-tile fire if using 2 120u beakers fully filled up.
	flame_radius(radius, get_turf(holder.get_holder()))

/datum/chemical_reaction/wpsmoke
	name = "白磷烟雾"
	required_reagents = list(/datum/reagent/phosphorus = 2, /datum/reagent/silicon = 1, /datum/reagent/chlorine = 1)

/datum/chemical_reaction/wpsmoke/on_reaction(datum/reagents/holder, created_volume)
	var/smoke_radius = round(sqrt(created_volume * 0.66), 1)
	var/datum/effect_system/smoke_spread/phosphorus/smoke = new
	smoke.set_up(smoke_radius, get_turf(holder.get_holder()), 11)
	smoke.start()
	playsound(get_turf(holder.get_holder()), 'sound/effects/smoke.ogg', 50, 1, -3)

/datum/chemical_reaction/plasmalosssmoke
	name = "缠足烟雾"
	required_reagents = list(/datum/reagent/toxin/sleeptoxin = 2, /datum/reagent/medicine/synaptizine = 1, /datum/reagent/sulfur = 1)

/datum/chemical_reaction/plasmalosssmoke/on_reaction(datum/reagents/holder, created_volume)
	var/smoke_radius = round(sqrt(created_volume), 1)
	var/datum/effect_system/smoke_spread/plasmaloss/smoke = new
	smoke.set_up(smoke_radius, get_turf(holder.get_holder()), 11)
	smoke.start()
	playsound(get_turf(holder.get_holder()), 'sound/effects/smoke.ogg', 50, 1, -3)

/datum/chemical_reaction/explosive/gunpowder
	name = "火药"
	required_reagents = list(/datum/reagent/potassium = 1, /datum/reagent/oxygen = 3, /datum/reagent/sulfur = 1, /datum/reagent/carbon = 1)

/datum/chemical_reaction/explosive/gunpowder/on_reaction(datum/reagents/holder, created_volume)
	var/radius = round(sqrt(created_volume* 0.5), 1) // should be about equal to the M15, maybe one tile more
	var/datum/effect_system/smoke_spread/bad/smoke = new
	smoke.set_up((radius - 1), get_turf(holder.get_holder()), 2)
	smoke.start()
	explosion(get_turf(holder.get_holder()), light_impact_range = radius, explosion_cause="gunpowder chem")


/datum/chemical_reaction/explosive/anfo
	name = "ANFO"
	required_reagents = list(/datum/reagent/ammonia = 1, /datum/reagent/fuel = 3)

/datum/chemical_reaction/explosive/anfo/on_reaction(datum/reagents/holder, created_volume)
	var/radius = round(sqrt(created_volume* 0.25), 1) // should be a max of 2 tiles
	if(radius > 2)
		radius = 2 //enforced by a hardcap. Sorry!
	explosion(get_turf(holder.get_holder()), heavy_impact_range = radius, explosion_cause="anfo chem")

