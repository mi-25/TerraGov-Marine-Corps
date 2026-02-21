/* Glass stack types
* Contains:
*		Glass sheets
*		Reinforced glass sheets
*		Phoron Glass Sheets
*		Reinforced Phoron Glass Sheets (AKA Holy fuck strong windows)
*/

/*
* Glass sheets
*/
GLOBAL_LIST_INIT(glass_recipes, list ( \
	/obj/structure/window = new /datum/stack_recipe("directional window", /obj/structure/window, 1, time = 4 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_CHECK_DIRECTION | CRAFT_ON_SOLID_GROUND, skill_req = SKILL_CONSTRUCTION_PLASTEEL), \
	/obj/structure/window/full = new /datum/stack_recipe("fulltile window", /obj/structure/window/full, 4, time = 4 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_CHECK_DIRECTION | CRAFT_ON_SOLID_GROUND, skill_req = SKILL_CONSTRUCTION_PLASTEEL), \
	/obj/structure/windoor_assembly = new /datum/stack_recipe("windoor", /obj/structure/windoor_assembly, 5, time = 4 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_CHECK_DIRECTION | CRAFT_ON_SOLID_GROUND, skill_req = SKILL_CONSTRUCTION_PLASTEEL) \
))

/obj/item/stack/sheet/glass
	name = "玻璃"
	desc = "玻璃是一种非晶态固体，由硅酸盐制成，这是沙子的主要成分。它因其透明性而受到重视，尽管抗损伤能力不强。"
	singular_name = "glass sheet"
	icon_state = "sheet-glass"
	worn_icon_state = "sheet-glass"
	var/created_window = /obj/structure/window
	var/reinforced_type = /obj/item/stack/sheet/glass/reinforced
	var/is_reinforced = FALSE

/obj/item/stack/sheet/glass/get_main_recipes()
	. = ..()
	for(var/item in GLOB.glass_recipes)
		. += GLOB.glass_recipes[item]

GLOBAL_LIST_INIT(glass_radial_images, list(
	"recipes" = image('icons/obj/structures/barricades/misc.dmi', icon_state = "plus"),
	"directional window" = image('icons/obj/structures/windows.dmi', "window"),
	"fulltile window" = image('icons/obj/structures/windows.dmi', "window0"),
	"windoor" = image('icons/obj/doors/windoor.dmi', icon_state = "left")
	))


/obj/item/stack/sheet/glass/select_radial(mob/user)
	if(user.get_active_held_item() != src)
		return
	if(!can_interact(user))
		return TRUE

	add_fingerprint(usr, "topic")

	var/choice = show_radial_menu(user, src, GLOB.glass_radial_images, require_near = TRUE)
	switch (choice)
		if("recipes")
			return TRUE
		if("directional window")
			create_object(user, GLOB.glass_recipes[/obj/structure/window], 1)
		if("fulltile window")
			create_object(user, GLOB.glass_recipes[/obj/structure/window/full], 1)
		if("windoor")
			create_object(user, GLOB.glass_recipes[/obj/structure/windoor_assembly], 1)

	return FALSE


/obj/item/stack/sheet/glass/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(is_reinforced)
		return

	else if(istype(I, /obj/item/stack/rods))
		var/obj/item/stack/rods/V = I
		if(V.get_amount() < 1 || get_amount() < 1)
			to_chat(user, span_warning("你需要一根金属棒和一块玻璃板来制造强化玻璃。"))
			return

		var/obj/item/stack/sheet/glass/RG = new reinforced_type(user.loc)
		RG.add_to_stacks(user)
		use(1)
		V.use(1)
		if(!src && !RG)
			user.put_in_hands(RG)
/obj/item/stack/sheet/glass/glass //this exists because otherwise glass can be merger into any ofthe other glass types.
	merge_type = /obj/item/stack/sheet/glass/glass
/obj/item/stack/sheet/glass/glass/large_stack
	amount = 50


/*
* Reinforced glass sheets
*/
/obj/item/stack/sheet/glass/reinforced
	name = "强化玻璃"
	desc = "强化玻璃由普通硅酸盐玻璃方块层叠在金属棒矩阵上制成。这种玻璃对直接冲击更具抵抗力，即使可能出现裂纹。"
	singular_name = "reinforced glass sheet"
	icon_state = "sheet-rglass"
	worn_icon_state = "sheet-rglass"
	merge_type = /obj/item/stack/sheet/glass/reinforced

	created_window = /obj/structure/window/reinforced
	is_reinforced = TRUE


/*
* Phoron Glass sheets
*/
/obj/item/stack/sheet/glass/phoronglass
	name = "等离子体玻璃"
	desc = "氚玻璃是一种硅酸盐-氚合金转化而成的非晶态固体。它像玻璃一样透明，即使明显带有粉红色调，并且非常耐损伤和高温。"
	singular_name = "phoron glass sheet"
	icon_state = "sheet-phoronglass"
	merge_type = /obj/item/stack/sheet/glass/phoronglass
	created_window = /obj/structure/window/phoronbasic
	reinforced_type = /obj/item/stack/sheet/glass/phoronrglass


/*
* Reinforced phoron glass sheets
*/
/obj/item/stack/sheet/glass/phoronrglass
	name = "强化等离子体玻璃"
	desc = "强化型等离子玻璃由硅酸盐-等离子合金玻璃方块层叠在金属棒矩阵上制成。它对物理冲击和高温都具有极强的抵抗力。"
	singular_name = "reinforced phoron glass sheet"
	icon_state = "sheet-phoronrglass"
	merge_type = /obj/item/stack/sheet/glass/phoronrglass
	created_window = /obj/structure/window/phoronreinforced
	is_reinforced = TRUE
