/obj/item/clothing/tie
	name = "领带"
	desc = "一条新丝质夹式领带。"
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "bluetie"
	equip_slot_flags = NONE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/tie/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/attachment, ATTACHMENT_SLOT_UNIFORM_TIE, 'icons/obj/clothing/ties_overlay.dmi', attach_features_flags = (ATTACH_REMOVABLE|ATTACH_APPLY_ON_MOB), mob_overlay_icon = 'icons/mob/ties.dmi', attach_sound = SFX_RUSTLE)

/obj/item/clothing/tie/blue
	name = "蓝色领带"
	icon_state = "bluetie"

/obj/item/clothing/tie/red
	name = "红色领带"
	icon_state = "redtie"

/obj/item/clothing/tie/horrible
	name = "糟糕的领带"
	desc = "一条尼龙丝夹式领带。这条真恶心。"
	icon_state = "horribletie"

/obj/item/clothing/tie/stethoscope
	name = "听诊器"
	desc = "一款过时的医疗设备，用于倾听人体内部的声音。它还能让你看起来像是知道自己在做什么。"
	icon_state = "stethoscope"

/obj/item/clothing/tie/stethoscope/attack(mob/living/carbon/human/M, mob/living/user)
	if(ishuman(M) && isliving(user))
		if(user.a_intent == INTENT_HELP)
			var/body_part = parse_zone(user.zone_selected)
			if(body_part)
				var/sound = "pulse"
				var/sound_strength

				if(M.stat == DEAD || HAS_TRAIT(M, TRAIT_FAKEDEATH))
					sound_strength = "cannot hear"
					sound = "anything"
				else
					sound_strength = "hear a weak"
					switch(body_part)
						if("chest")
							if(M.oxyloss < 50)
								sound_strength = "hear a healthy"
							sound = "pulse and respiration"
						if("eyes","mouth")
							sound_strength = "cannot hear"
							sound = "anything"
						else
							sound_strength = "hear a weak"

				user.visible_message("[user]将[src]贴在[M]的[body_part]上，仔细聆听。", "You place [src] against [M.p_their()] [body_part]. You [sound_strength] [sound].")
				return
	return ..(M,user)


//Medals
/obj/item/clothing/tie/medal
	name = "铜牌"
	desc = "一枚铜质奖章。"
	icon_state = "bronze"
	var/recipient_name //name of the person this is awarded to.
	var/recipient_rank
	var/medal_citation

/obj/item/clothing/tie/medal/examine(mob/user)
	. = ..()
	. += "Awarded to: \'[recipient_rank] [recipient_name]\'. The citation reads \'[medal_citation]\'."

/obj/item/clothing/tie/medal/conduct
	name = "杰出行为勋章"
	desc = "一枚授予杰出表现的铜质奖章。虽然是一项崇高荣誉，但这是地球政府殖民地海军陆战队颁发的最基础的奖项。"

/obj/item/clothing/tie/medal/bronze_heart
	name = "青铜之心勋章"
	desc = "一枚青铜心形勋章，为牺牲而颁发。通常追授给因公殉职或遭受重伤的人员。"
	icon_state = "bronze_heart"

/obj/item/clothing/tie/medal/nobel_science
	name = "诺贝尔科学奖"
	desc = "一枚青铜奖章，代表着在科学或工程领域的重大贡献。"

/obj/item/clothing/tie/medal/silver
	name = "银牌"
	desc = "一枚银质奖章。"
	icon_state = "silver"

/obj/item/clothing/tie/medal/silver/valor
	name = "英勇勋章"
	desc = "授予英勇行为的银质奖章。"

/obj/item/clothing/tie/medal/silver/security
	name = "鲁棒安全奖"
	desc = "为表彰在保卫地球政府殖民地海军陆战队利益中表现出的卓越战斗与牺牲精神而颁发的奖章。通常授予安保人员。"

/obj/item/clothing/tie/medal/gold
	name = "金牌"
	desc = "一枚尊贵的金色勋章。"
	icon_state = "gold"

/obj/item/clothing/tie/medal/gold/captain
	name = "舰长勋章"
	desc = "一枚专门授予晋升至舰长军衔者的金质勋章。它象征着舰长对地球政府殖民地海军陆战队的成文职责，以及其对船员无可争议的权威。"

/obj/item/clothing/tie/medal/gold/heroism
	name = "卓越英勇勋章"
	desc = "一枚极为罕见的金色勋章，仅由地球政府殖民地海军陆战队颁发。获得此等勋章是至高无上的荣誉，因此存世极少。"

/obj/item/clothing/tie/medal/letter/commendation
	name = "嘉奖信"
	desc = "一张印在卡纸上的信，通常充满了对收信人的赞美。"
	icon = 'icons/obj/items/paper.dmi'
	icon_state = "commendation"

//Armbands
/obj/item/clothing/tie/armband
	name = "红色臂章"
	desc = "一条精致的红色臂章！"
	icon_state = "red"

/obj/item/clothing/tie/armband/cargo
	name = "货物臂章"
	desc = "臂章，船员佩戴以显示其所属部门。这个是棕色的。"
	icon_state = "cargo"

/obj/item/clothing/tie/armband/engine
	name = "工程臂章"
	desc = "一条臂章，由船员佩戴以显示他们所属的部门。这条是橙色的，带有反光条！"
	icon_state = "engie"

/obj/item/clothing/tie/armband/science
	name = "科研臂章"
	desc = "一条臂章，由船员佩戴以显示他们所属的部门。这条是紫色的。"
	icon_state = "rnd"

/obj/item/clothing/tie/armband/hydro
	name = "水培臂章"
	desc = "一条臂章，由船员佩戴以显示他们所属的部门。这条是绿色和蓝色的。"
	icon_state = "hydro"

/obj/item/clothing/tie/armband/med
	name = "医疗臂章"
	desc = "一条臂章，由船员佩戴以显示他们所属的部门。这条是白色的。"
	icon_state = "med"

/obj/item/clothing/tie/armband/medgreen
	name = "卫生兵臂章"
	desc = "一条臂章，由船员佩戴以显示他们所属的部门。这条是白绿相间的。"
	icon_state = "medgreen"

/*
	Holobadges are worn on the belt or neck, and can be used to show that the holder is an authorized
	Security agent - the user details can be imprinted on the badge with a Security-access ID card
*/

/obj/item/clothing/tie/holobadge

	name = "全息徽章"
	desc = "这枚发光的蓝色徽章标志着佩戴者就是法律。"
	icon_state = "holobadge"
	equip_slot_flags = ITEM_SLOT_BELT

	var/stored_name = null

/obj/item/clothing/tie/holobadge/cord
	icon_state = "holobadge-cord"
	equip_slot_flags = ITEM_SLOT_MASK

/obj/item/clothing/tie/holobadge/attack_self(mob/user as mob)
	if(!stored_name)
		to_chat(user, "在刷卡前挥舞徽章毫无意义。")
		return
	if(isliving(user))
		user.visible_message(span_warning("[user] 出示了[user.p_their()]的地球政府殖民地海军陆战队内部安全法律授权徽章。\n上面写着：[stored_name]，地球政府殖民地海军陆战队安全部门。"),span_warning("You display your TGMC Internal Security Legal Authorization Badge.\nIt reads: [stored_name], TGMC Security."))

/obj/item/clothing/tie/holobadge/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/card/id))
		var/obj/item/card/id/id_card = I

		if(!(ACCESS_MARINE_BRIG in id_card.access))
			to_chat(user, "[src] 拒绝了你的访问权限不足。")
			return

		to_chat(user, "你将你的身份信息刻印到徽章上。")
		stored_name = id_card.registered_name
		name = "全息徽章 ([stored_name])"
		desc = "这枚发光的蓝色徽章标志着[stored_name]就是法律。"


/obj/item/clothing/tie/holobadge/attack(mob/living/carbon/human/M, mob/living/user)
	if(isliving(user))
		user.visible_message(span_warning("[user] 侵入了 [M] 的个人空间，执意将 [src] 塞到 [M.p_their()] 面前。"),span_warning("You invade [M]'s personal space, thrusting [src] into [M.p_their()] face insistently. You are the law."))

/obj/item/storage/box/holobadge
	name = "全息徽章盒"
	desc = "一个声称装有全息徽章的盒子。"

/obj/item/storage/box/holobadge/Initialize(mapload, ...)
	. = ..()
	new /obj/item/clothing/tie/holobadge(src)
	new /obj/item/clothing/tie/holobadge(src)
	new /obj/item/clothing/tie/holobadge(src)
	new /obj/item/clothing/tie/holobadge(src)
	new /obj/item/clothing/tie/holobadge/cord(src)
	new /obj/item/clothing/tie/holobadge/cord(src)
