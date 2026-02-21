/*
Mineral Sheets
	Contains:
		- Sandstone
		- Diamond
		- Uranium
		- Phoron
		- Gold
		- Silver
		- Enriched Uranium
		- Platinum
		- Metallic Hydrogen
		- Tritium
		- Osmium
*/

/obj/item/stack/sheet/mineral
	force = 5
	throwforce = 5
	w_class = WEIGHT_CLASS_NORMAL
	throw_speed = 3
	throw_range = 3

/obj/item/stack/sheet/mineral/Initialize(mapload)
	. = ..()
	pixel_x = rand(-2, 2)
	pixel_y = rand(-2, 2)

/obj/item/stack/sheet/mineral/iron
	name = "铁"
	desc = "铁是太空中最基本的建筑材料，一种在室温下呈固态的金属，易于塑形且储量巨大。"
	singular_name = "iron sheet"
	icon_state = "sheet-silver"
	sheettype = "iron"
	color = "#333333"
	perunit = 3750

GLOBAL_LIST_INIT(iron_recipes, list ( \
	/obj/structure/mineral_door/iron = new /datum/stack_recipe("iron door", /obj/structure/mineral_door/iron, 20, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND), \
	null, \
	))

/obj/item/stack/sheet/mineral/iron/get_main_recipes()
	. = ..()
	for(var/item in GLOB.iron_recipes)
		. += GLOB.iron_recipes[item]

/obj/item/stack/sheet/mineral/sandstone
	name = "砂岩砖"
	desc = "砂岩是沙子和石头的混合物。原始文明的常见建筑材料，仍能构成足够坚固的墙壁。"
	singular_name = "sandstone brick"
	icon_state = "sheet-sandstone"
	throw_speed = 4
	throw_range = 5
	sheettype = "sandstone"

GLOBAL_LIST_INIT(sandstone_recipes, list ( \
	/obj/machinery/hydroponics/soil = new /datum/stack_recipe("pile of dirt", /obj/machinery/hydroponics/soil, 3, time = 1 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND), \
	/obj/structure/mineral_door/sandstone = new /datum/stack_recipe("sandstone door", /obj/structure/mineral_door/sandstone, 10, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND), \
	))

/obj/item/stack/sheet/mineral/sandstone/get_main_recipes()
	. = ..()
	for(var/item in GLOB.sandstone_recipes)
		. += GLOB.sandstone_recipes[item]

/obj/item/stack/sheet/mineral/diamond
	name = "钻石"
	desc = "钻石是碳在极端压力和高温下形成的特定排列结构。因其外观和特性而备受珍视，尽管已有人工制造的可能性。"
	singular_name = "diamond gem"
	icon_state = "sheet-diamond"
	perunit = 3750
	sheettype = "diamond"

GLOBAL_LIST_INIT(diamond_recipes, list ( \
	/obj/structure/mineral_door/transparent/diamond = new /datum/stack_recipe("diamond door", /obj/structure/mineral_door/transparent/diamond, 10, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND), \
	))

/obj/item/stack/sheet/mineral/diamond/get_main_recipes()
	. = ..()
	for(var/item in GLOB.diamond_recipes)
		. += GLOB.diamond_recipes[item]

/obj/item/stack/sheet/mineral/uranium
	name = "铀"
	desc = "铀是一种锕系放射性金属。作为裂变型反应堆的燃料以及聚变炸弹的起爆剂，具有重要价值。"
	singular_name = "uranium rod"
	icon_state = "sheet-uranium"
	perunit = 2000
	sheettype = "uranium"

GLOBAL_LIST_INIT(uranium_recipes, list ( \
	/obj/structure/mineral_door/uranium = new /datum/stack_recipe("uranium door", /obj/structure/mineral_door/uranium, 10, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND), \
	))

/obj/item/stack/sheet/mineral/uranium/get_main_recipes()
	. = ..()
	for(var/item in GLOB.uranium_recipes)
		. += GLOB.uranium_recipes[item]

/obj/item/stack/sheet/mineral/phoron
	name = "固态等离子体"
	desc = "等离子体是一种极其稀有的矿物，具有奇特的性质，常用于尖端研究。光是将其稳定成固态形式就已经足够困难了。"
	singular_name = "phoron ingot"
	icon_state = "sheet-phoron"
	perunit = 2000
	sheettype = "phoron"
	merge_type = /obj/item/stack/sheet/mineral/phoron

GLOBAL_LIST_INIT(phoron_recipes, list ( \
	/obj/structure/mineral_door/transparent/phoron = new /datum/stack_recipe("phoron door", /obj/structure/mineral_door/transparent/phoron, 10, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND), \
	))

/obj/item/stack/sheet/mineral/phoron/get_main_recipes()
	. = ..()
	for(var/item in GLOB.phoron_recipes)
		. += GLOB.phoron_recipes[item]

/obj/item/stack/sheet/mineral/phoron/small_stack
	amount = 10

/obj/item/stack/sheet/mineral/phoron/medium_stack
	amount = 30

/obj/item/stack/sheet/mineral/plastic
	name = "塑料"
	desc = "塑料是一种合成聚合物，由有机和无机成分制成，形成可塑且轻质的材料。它可用于制造多种物品。"
	singular_name = "plastic sheet"
	icon_state = "sheet-plastic"
	perunit = 2000

GLOBAL_LIST_INIT(plastic_recipes, list ( \
	/obj/structure/closet/crate/plastic = new /datum/stack_recipe("plastic crate", /obj/structure/closet/crate/plastic, 10, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND), \
	/obj/item/ashtray/plastic = new /datum/stack_recipe("plastic ashtray", /obj/item/ashtray/plastic, 2, crafting_flags = CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND), \
	/obj/item/tool/kitchen/utensil/pfork = new /datum/stack_recipe("plastic fork", /obj/item/tool/kitchen/utensil/pfork, 1, crafting_flags = CRAFT_ON_SOLID_GROUND), \
	/obj/item/tool/kitchen/utensil/pspoon = new /datum/stack_recipe("plastic spoon", /obj/item/tool/kitchen/utensil/pspoon, 1, crafting_flags = CRAFT_ON_SOLID_GROUND), \
	/obj/item/tool/kitchen/utensil/pknife = new /datum/stack_recipe("plastic knife", /obj/item/tool/kitchen/utensil/pknife, 1, crafting_flags = CRAFT_ON_SOLID_GROUND), \
	/obj/item/storage/bag/plasticbag = new /datum/stack_recipe("plastic bag", /obj/item/storage/bag/plasticbag, 3, crafting_flags = CRAFT_ON_SOLID_GROUND), \
	))

/obj/item/stack/sheet/mineral/plastic/get_main_recipes()
	. = ..()
	for(var/item in GLOB.plastic_recipes)
		. += GLOB.plastic_recipes[item]

/obj/item/stack/sheet/mineral/plastic/cyborg
	name = "塑料板"
	desc = "塑料是一种合成聚合物，由有机和无机成分制成，形成可塑且轻质的材料。它可用于制造多种物品。"
	singular_name = "plastic sheet"
	icon_state = "sheet-plastic"
	perunit = 2000

/obj/item/stack/sheet/mineral/gold
	name = "黄金"
	desc = "金是一种过渡金属。作为一种相对稀有的金属，以其颜色、光泽、化学和电学特性而闻名，在装饰、工程和科学领域都有广泛需求。"
	singular_name = "gold ingot"
	icon_state = "sheet-gold"
	perunit = 2000
	sheettype = "gold"
	number_of_extra_variants = 2

GLOBAL_LIST_INIT(gold_recipes, list ( \
	/obj/structure/mineral_door/gold = new /datum/stack_recipe("golden door", /obj/structure/mineral_door/gold, 10, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND), \
	))

/obj/item/stack/sheet/mineral/gold/get_main_recipes()
	. = ..()
	for(var/item in GLOB.gold_recipes)
		. += GLOB.gold_recipes[item]

/obj/item/stack/sheet/mineral/silver
	name = "银"
	desc = "银是一种过渡金属，以其标志性的银灰色而闻名。它既可作为黄金的廉价替代品用于化妆品，也可用于工程领域。"
	singular_name = "silver ingot"
	icon_state = "sheet-silver"
	perunit = 2000
	sheettype = "silver"
	number_of_extra_variants = 2

GLOBAL_LIST_INIT(silver_recipes, list ( \
	/obj/structure/mineral_door/silver = new /datum/stack_recipe("silver door", /obj/structure/mineral_door/silver, 10, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND), \
	))

/obj/item/stack/sheet/mineral/silver/get_main_recipes()
	. = ..()
	for(var/item in GLOB.silver_recipes)
		. += GLOB.silver_recipes[item]


//Valuable resource, cargo can sell it.
/obj/item/stack/sheet/mineral/platinum
	name = "铂金"
	desc = "铂是一种过渡金属。相对稀有且美观，因其装饰价值和作为催化剂的化学性质而被使用。它也用于电极制造。"
	singular_name = "platinum ingot"
	icon_state = "sheet-platinum"
	sheettype = "platinum"
	perunit = 2000
	number_of_extra_variants = 2


//Extremely valuable to Research.
/obj/item/stack/sheet/mineral/mhydrogen
	name = "金属氢"
	desc = "金属氢是普通氢在接近固态的状态下，在巨大压力下形成的锭块。制造和稳定这种锭块的确切程序仍是商业机密。"
	singular_name = "hydrogen ingot"
	icon_state = "sheet-mythril"
	sheettype = "mhydrogen"
	perunit = 2000


//Fuel for MRSPACMAN generator.
/obj/item/stack/sheet/mineral/tritium
	name = "氚"
	desc = "氚是氢的同位素，H-3，在巨大压力下形成的锭块。制造和稳定这种锭块的确切程序仍然是商业机密。"
	singular_name = "tritium ingot"
	icon_state = "sheet-silver"
	sheettype = "tritium"
	color = "#777777"
	perunit = 2000


/obj/item/stack/sheet/mineral/osmium
	name = "锇"
	desc = "锇是一种过渡金属。作为人类已知密度最大的天然元素，它显然以其极高的硬度和耐久性而闻名，并因此被使用。"
	singular_name = "osmium ingot"
	icon_state = "sheet-silver"
	sheettype = "osmium"
	color = "#9999FF"
	perunit = 2000
