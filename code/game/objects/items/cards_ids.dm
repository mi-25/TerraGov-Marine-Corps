/* Cards
* Contains:
*		DATA CARD
*		ID CARD
*		FINGERPRINT CARD HOLDER
*		FINGERPRINT CARD
*/



/*
* DATA CARDS - Used for the teleporter
*/
/obj/item/card
	name = "卡牌"
	desc = "处理卡片事务。"
	icon = 'icons/obj/items/card.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/id_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/id_right.dmi',
	)
	worn_icon_state = "card-id"
	item_state_worn = TRUE
	w_class = WEIGHT_CLASS_TINY
	var/associated_account_number = 0

	var/list/files = list(  )

/obj/item/card/data
	name = "数据盘"
	desc = "一张数据磁盘。"
	icon_state = "data"
	var/function = "storage"
	var/data = "null"
	var/special = null

/obj/item/card/data/verb/label(t as text)
	set name = "Label Disk"
	set category = "IC.Object"
	set src in usr

	if (t)
		name = "数据磁盘 - '[t]'"
	else
		name = "数据盘"

/obj/item/card/data/clown
	name = "\proper 小丑星球的坐标"
	icon_state = "data"
	layer = OBJ_LAYER
	level = 2
	desc = "这张卡片上记载着传说中的小丑星球的坐标。请小心保管。"
	function = "teleporter"
	data = "Clown Land"

/*
* ID CARDS
*/

/obj/item/card/emag_broken
	desc = "这是一张带有磁条的卡片，连接着一些电路。它看起来损坏得太严重，除了拆解回收外别无他用。"
	name = "损坏的密码破译器"
	icon_state = "emag"


/obj/item/card/emag
	desc = "这是一张带有磁条并连接着一些电路板的卡片。"
	name = "密码破译器"
	icon_state = "emag"
	item_flags = NOBLUDGEON


/obj/item/card/id
	name = "身份识别卡"
	desc = "用于提供身份识别并确定对大量机械访问权限的卡片。"
	icon_state = "id"
	var/access = list()
	var/registered_name = "Unknown" // The name registered_name on the card
	equip_slot_flags = ITEM_SLOT_ID
	///Miscelaneous ID flags
	var/id_flags = CAN_BUY_LOADOUT

	var/blood_type = "\[UNSET\]"

	///How many points you can use to buy items
	var/marine_points = list()

	///What category of items can you buy - used for armor and pouches
	var/marine_buy_choices = list()

	//alt titles are handled a bit weirdly in order to unobtrusively integrate into existing ID system
	var/assignment = null	//can be alt title or the actual job
	var/rank = null			//actual job
	var/dorm = 0		// determines if this ID has claimed a dorm already
	var/paygrade = null  // Marine's paygrade

	var/assigned_fireteam = "" //which fire team this ID belongs to, only used by squad marines.
	/// Iff bitfield to determines hit and misses
	var/iff_signal = NONE


/obj/item/card/id/Initialize(mapload)
	. = ..()
	marine_buy_choices = GLOB.marine_selector_cats.Copy() //by default you can buy the whole list
	if(!ishuman(loc))
		return
	var/mob/living/carbon/human/H = loc
	blood_type = H.blood_type
	GLOB.id_card_list += src

/obj/item/card/id/Destroy()
	GLOB.id_card_list -= src
	return ..()

/obj/item/card/id/attack_self(mob/user as mob)
	user.visible_message("[user]向你展示：[icon2html(src, viewers(user))] [name]：职务：[assignment]")


/obj/item/card/id/proc/update_label(newname, newjob)
	if(newname || newjob)
		name = "[(!newname)	? "identification card"	: "[newname]'s ID Card"][(!newjob) ? "" : " ([newjob])"]"
		return

	name = "[(!paygrade) ? "" : "[get_paygrades(paygrade, TRUE, gender)]. "][(!registered_name)	? "identification card"	: "[registered_name]'s ID Card"][(!assignment) ? "" : " ([assignment])"]"
	if(isliving(loc))
		var/mob/living/L = loc
		L.name = L.get_visible_name()


/obj/item/card/id/verb/read()
	set name = "Read ID Card"
	set category = "IC.Object"
	set src in usr

	to_chat(usr, "[icon2html(src, usr)] [name]：当前卡片上的分配职务是[assignment]。")
	to_chat(usr, "卡片上的血型是[blood_type]。")


/obj/item/card/id/silver
	name = "身份识别卡"
	desc = "一张彰显荣誉与奉献的银色卡片。"
	icon_state = "silver"
	worn_icon_state = "silver_id"

/obj/item/card/id/gold
	name = "身份识别卡"
	desc = "一张彰显权力与威严的金色卡片。"
	icon_state = "gold"
	worn_icon_state = "gold_id"

/obj/item/card/id/syndicate
	name = "特工卡"
	access = list(ACCESS_ILLEGAL_PIRATE)
	var/registered_user=null

/obj/item/card/id/syndicate/Initialize(mapload)
	. = ..()
	if(ismob(loc)) // Runtime prevention on laggy starts or where users log out because of lag at round start.
		var/mob/user = loc
		registered_name = ishuman(user) ? user.real_name : user.name
	else
		registered_name = "Agent Card"
	assignment = "Agent"
	name = "[registered_name]的身份证（[assignment]）"


/obj/item/card/id/syndicate/attack_self(mob/user as mob)
	if(!src.registered_name)
		//Stop giving the players unsanitized unputs! You are giving ways for players to intentionally crash clients! -Nodrak
		var/newname = reject_bad_name(tgui_input_text(user, "What name would you like to put on this card?", "Agent card name", ishuman(user) ? user.real_name : user.name))
		if(!newname) //Same as mob/new_player/prefrences.dm
			alert("Invalid name.")
			return
		src.registered_name = newname

		var/newjob = stripped_input(user, "What occupation would you like to put on this card?\nNote: This will not grant any access levels other than Maintenance.", "Agent card job assignment", "Agent")
		if(!newjob)
			alert("Invalid assignment.")
			src.registered_name = ""
			return
		src.assignment = newjob
		src.name = "[src.registered_name]'s ID Card ([src.assignment])"
		to_chat(user, span_notice("你成功伪造了这张ID卡。"))
		registered_user = user
	else if(!registered_user || registered_user == user)

		if(!registered_user) registered_user = user  //

		switch(tgui_alert(user, "Would you like to display the ID, or retitle it?", "Choose.", list("Rename","Show")))
			if("Rename")
				var/newname = stripped_input(user, "What name would you like to put on this card?", "Agent card name", ishuman(user) ? user.real_name : user.name, max_length = 26)
				if(!newname || newname == "Unknown" || newname == "floor" || newname == "wall" || newname == "r-wall") //Same as mob/new_player/prefrences.dm
					alert("Invalid name.")
					return
				src.registered_name = newname

				var/newjob = stripped_input(user, "What occupation would you like to put on this card?\nNote: This will not grant any access levels other than Maintenance.", "Agent card job assignment", "Assistant")
				if(!newjob)
					alert("Invalid assignment.")
					return
				src.assignment = newjob
				src.name = "[src.registered_name]'s ID Card ([src.assignment])"
				to_chat(user, span_notice("你成功伪造了这张ID卡。"))
				return
			if("Show")
				..()
	else
		..()



/obj/item/card/id/syndicate_command
	name = "辛迪加身份卡"
	desc = "一份来自辛迪加的ID卡。"
	registered_name = "Syndicate"
	assignment = "Syndicate Overlord"
	access = list(ACCESS_ILLEGAL_PIRATE)


/obj/item/card/id/captains_spare
	name = "舰长的备用ID"
	desc = "高等领主本人的备用身份卡。"
	icon_state = "gold"
	worn_icon_state = "gold_id"
	registered_name = CAPTAIN
	assignment = CAPTAIN
	access = ALL_MARINE_ACCESS


/obj/item/card/id/equipped(mob/living/carbon/human/H, slot)
	if(istype(H))
		H.update_inv_head() //updating marine helmet squad coloring
		H.update_inv_wear_suit()
	..()

/obj/item/card/id/dropped(mob/user)
	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_head() //Don't do a full update yet
		H.update_inv_wear_suit()
	..()



/obj/item/card/id/dogtag
	name = "狗牌"
	desc = "陆战队员的狗牌。"
	icon_state = "dogtag"
	worn_icon_state = "dogtag"
	iff_signal = TGMC_LOYALIST_IFF
	var/dogtag_taken = FALSE

/obj/item/card/id/dogtag/update_icon_state()
	. = ..()
	if(dogtag_taken)
		icon_state = initial(icon_state) + "_taken"
		return
	icon_state = initial(icon_state)

/obj/item/card/id/dogtag/canStrip(mob/stripper, mob/owner)
	. = ..()
	if(!.)
		return
	if(dogtag_taken)
		stripper.balloon_alert(stripper, "信息标签已被占用！")
		return FALSE
	if(owner.stat != DEAD)
		stripper.balloon_alert(stripper, "[owner.p_they()] [p_are()]还没死呢！")
		return FALSE

/obj/item/card/id/dogtag/special_stripped_behavior(mob/stripper, mob/owner)
	if(dogtag_taken)
		return
	to_chat(stripper, span_notice("你取下[owner]的信息标签，留下了身份识别标签。"))
	dogtag_taken = TRUE
	update_icon()
	var/obj/item/dogtag/info_tag = new()
	info_tag.fallen_names = list(registered_name)
	info_tag.fallen_assignments = list(assignment)
	stripper.put_in_hands(info_tag)
	return TRUE

// Vendor points for job override
/obj/item/card/id/dogtag/smartgun
	marine_points = list(
		CAT_SGSUP = DEFAULT_TOTAL_BUY_POINTS,
	)

/obj/item/card/id/dogtag/engineer
	marine_points = list(
		CAT_ENGSUP = ENGINEER_TOTAL_BUY_POINTS,
	)

/obj/item/card/id/dogtag/leader
	marine_points = list(
		CAT_LEDSUP = DEFAULT_TOTAL_BUY_POINTS,
	)

/obj/item/card/id/dogtag/corpsman
	marine_points = list(
		CAT_MEDSUP = MEDIC_TOTAL_BUY_POINTS,
	)

/obj/item/card/id/dogtag/fc
	marine_points = list(
		CAT_FCSUP = COMMANDER_TOTAL_BUY_POINTS,
	)

/obj/item/card/id/dogtag/full
	marine_points = list(
		CAT_SGSUP = DEFAULT_TOTAL_BUY_POINTS,
		CAT_ENGSUP = ENGINEER_TOTAL_BUY_POINTS,
		CAT_LEDSUP = DEFAULT_TOTAL_BUY_POINTS,
		CAT_MEDSUP = MEDIC_TOTAL_BUY_POINTS,
		CAT_FCSUP = COMMANDER_TOTAL_BUY_POINTS,
	)

/obj/item/card/id/dogtag/som
	name = "\improper 火星之子狗牌"
	desc = "火星之子使用。"
	icon_state = "dogtag_som"
	worn_icon_state = "dogtag_som"
	iff_signal = SOM_IFF


/obj/item/card/id/dogtag/examine(mob/user)
	. = ..()
	if(ishuman(user))
		. += span_notice("It reads \"[registered_name] - [assignment] - [blood_type]\"")


/obj/item/dogtag
	name = "信息识别牌"
	desc = "一名阵亡陆战队员的信息身份牌。"
	icon_state = "dogtag_taken"
	icon = 'icons/obj/items/card.dmi'
	w_class = WEIGHT_CLASS_TINY
	var/fallen_names[0]
	var/fallen_assignments[0]

/obj/item/dogtag/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/dogtag))
		var/obj/item/dogtag/D = I
		to_chat(user, span_notice("你将两个标签连接在一起。"))
		name = "信息识别牌"
		if(D.fallen_names)
			fallen_names += D.fallen_names
		if(D.fallen_assignments)
			fallen_assignments += D.fallen_assignments
		qdel(D)
		return TRUE

/obj/item/dogtag/examine(mob/user)
	. = ..()
	if(ishuman(user) && fallen_names && length(fallen_names))
		if(length(fallen_names) == 1)
			to_chat(user, span_notice("上面写着：[fallen_names[1]] - [fallen_assignments[1]]。"))
		else
			var/msg = "<span class='notice'> It reads: "
			for(var/x = 1 to length(fallen_names))
				if (x == length(fallen_names))
					msg += "\"[fallen_names[x]] - [fallen_assignments[x]]\""
				else
					msg += "\"[fallen_names[x]] - [fallen_assignments[x]]\", "

			msg += ".</span>"

			to_chat(user, msg)


/obj/item/card/id/vv_edit_var(var_name, var_value)
	. = ..()
	if(.)
		switch(var_name)
			if("assignment", "registered_name")
				update_label()
