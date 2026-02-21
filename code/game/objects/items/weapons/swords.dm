/obj/item/weapon/sword
	name = "阔剑"
	desc = "你站在这儿盯着这个看什么？快去杀敌！"
	icon_state = "claymore"
	icon = 'icons/obj/items/weapons/swords.dmi'
	worn_icon_state = "claymore"
	atom_flags = CONDUCT
	equip_slot_flags = ITEM_SLOT_BELT
	force = 40
	throwforce = 10
	sharp = IS_SHARP_ITEM_BIG
	edge = 1
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("attacks", "slashes", "stabs", "slices", "tears", "rips", "dices", "cuts")
	hitsound = 'sound/weapons/bladeslice.ogg'
	///Special attack action granted to users with the right trait
	var/datum/action/ability/activable/weapon_skill/sword_lunge/special_attack

/obj/item/weapon/sword/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/scalping)
	special_attack = new(src, force, penetration)

/obj/item/weapon/sword/Destroy()
	QDEL_NULL(special_attack)
	return ..()

/obj/item/weapon/sword/equipped(mob/user, slot)
	. = ..()
	toggle_item_bump_attack(user, TRUE)
	if(HAS_TRAIT(user, TRAIT_SWORD_EXPERT))
		special_attack.give_action(user)

/obj/item/weapon/sword/dropped(mob/user)
	. = ..()
	toggle_item_bump_attack(user, FALSE)
	special_attack?.remove_action(user)

/obj/item/weapon/sword/suicide_act(mob/user)
	user.visible_message(span_danger("[user] 正摔向 [user.p_their()] 的 [name]！看起来 [user.p_theyre()] 想自杀。"))
	return(BRUTELOSS)

//Special attack
/datum/action/ability/activable/weapon_skill/sword_lunge
	name = "突刺斩击"
	action_icon_state = "sword_lunge"
	desc = "一次强力的跳跃攻击。无法击晕。"
	ability_cost = 8
	cooldown_duration = 6 SECONDS
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_WEAPONABILITY_SWORDLUNGE,
	)
	///Range of this ability
	var/lunge_range = 2

/datum/action/ability/activable/weapon_skill/sword_lunge/ai_should_use(atom/target)
	if(get_dist(owner, target) > lunge_range)
		return FALSE
	return ..()

/datum/action/ability/activable/weapon_skill/sword_lunge/use_ability(atom/A)
	var/mob/living/carbon/carbon_owner = owner

	RegisterSignal(carbon_owner, COMSIG_MOVABLE_MOVED, PROC_REF(movement_fx))
	RegisterSignal(carbon_owner, COMSIG_MOVABLE_BUMP, PROC_REF(lunge_impact))
	RegisterSignal(carbon_owner, COMSIG_MOVABLE_POST_THROW, PROC_REF(charge_complete))

	carbon_owner.visible_message(span_danger("[carbon_owner] 向 \the [A] 发起冲锋！"))
	playsound(owner, 'sound/effects/alien/tail_swipe2.ogg', 50, 0, 4)
	carbon_owner.throw_at(A, lunge_range, 1, carbon_owner)
	succeed_activate()
	add_cooldown()

///Create an after image
/datum/action/ability/activable/weapon_skill/sword_lunge/proc/movement_fx()
	SIGNAL_HANDLER
	new /obj/effect/temp_visual/after_image(get_turf(owner), owner)

///Unregisters signals after lunge complete
/datum/action/ability/activable/weapon_skill/sword_lunge/proc/charge_complete()
	SIGNAL_HANDLER
	UnregisterSignal(owner, list(COMSIG_MOVABLE_BUMP, COMSIG_MOVABLE_POST_THROW, COMSIG_MOVABLE_MOVED))

///Sig handler for atom impacts during lunge
/datum/action/ability/activable/weapon_skill/sword_lunge/proc/lunge_impact(datum/source, atom/movable/target, speed)
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, PROC_REF(do_lunge_impact), source, target)
	charge_complete()

///Actual effects of lunge impact
/datum/action/ability/activable/weapon_skill/sword_lunge/proc/do_lunge_impact(datum/source, atom/movable/target)
	var/mob/living/carbon/carbon_owner = source
	if(isobj(target))
		var/obj/obj_victim = target
		obj_victim.take_damage(damage, BRUTE, MELEE, TRUE, TRUE, get_dir(obj_victim, carbon_owner), penetration, carbon_owner)
		obj_victim.knockback(carbon_owner, 1, 2, knockback_force = MOVE_FORCE_VERY_STRONG)
		return
	if(!ishuman(target))
		return
	var/mob/living/carbon/human/human_victim = target
	human_victim.apply_damage(damage, BRUTE, BODY_ZONE_CHEST, MELEE, TRUE, TRUE, TRUE, penetration, owner)
	human_victim.adjust_stagger(1 SECONDS)
	playsound(human_victim, "sound/weapons/wristblades_hit.ogg", 25, 0, 5)
	shake_camera(human_victim, 2, 1)

/obj/item/weapon/sword/mercsword
	name = "战斗剑"
	desc = "一把布满灰尘的剑，常见于历史博物馆。你从哪弄来这玩意儿绝对是个谜。只有雇佣兵才会疯到随身携带这种东西。经过打磨，能造成巨大伤害。"
	icon_state = "mercsword"
	worn_icon_state = "machete"
	force = 39

/obj/item/weapon/sword/captain
	name = "礼仪剑"
	desc = "一把世代相传的华丽礼仪佩剑。尽管如此，它仍被精心保养，处于最佳状态。"
	icon_state = "mercsword"
	worn_icon_state = "machete"
	force = 55

/obj/item/weapon/sword/machete
	name = "\improper M2132砍刀"
	desc = "最新一期《TGMC砍刀》。非常适合清理偏远殖民地的丛林或灌木。常见于侦察兵和追踪者手中，但难以与常规装备一同携带。"
	icon_state = "machete"
	worn_icon_state = "machete"
	force = 75
	attack_speed = 12
	w_class = WEIGHT_CLASS_BULKY

/obj/item/weapon/sword/machete/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/strappable)

/obj/item/weapon/sword/machete/alt
	name = "砍刀"
	desc = "一把外观不错的砍刀。非常适合清理偏远殖民地的丛林或灌木。常见于侦察兵和追踪者手中，但通常的装备配置下携带不便。"
	icon_state = "machete_alt"

//FC's sword.
/obj/item/weapon/sword/officersword
	name = "军官佩剑"
	desc = "这似乎是一把相当古老的刀，保养得很好，很可能是一件家族传家宝。奇怪的是，尽管它可能并非用于战斗，但刀刃却被磨得很锋利，并不钝。"
	icon_state = "officer_sword"
	worn_icon_state = "officer_sword"
	force = 75
	attack_speed = 11
	penetration = 15
	w_class = WEIGHT_CLASS_BULKY

/obj/item/weapon/sword/officersword/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/strappable)

/obj/item/weapon/sword/commissar_sword
	name = "政委佩剑"
	desc = "帝国政委的骄傲，在他们冲锋陷阵时高高举起。"
	icon_state = "comsword"
	worn_icon_state = "comsword"
	force = 80
	attack_speed = 10
	w_class = WEIGHT_CLASS_BULKY

/obj/item/weapon/sword/katana
	name = "武士刀"
	desc = "一把做工精良的日本刀，刀身经过精细打磨。刀刃被研磨至分子级锋利度，极具致命性。常见于雇佣兵和极道成员手中。"
	icon_state = "katana"
	worn_icon_state = "katana"
	force = 50
	penetration = 20
	throwforce = 40
	equip_slot_flags = ITEM_SLOT_BELT|ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY

/obj/item/weapon/sword/katana/suicide_act(mob/user)
	user.visible_message(span_danger("[user]正用[name]切开[user.p_their()]的腹部！看起来[user.p_theyre()]想要切腹自尽。"))
	return(BRUTELOSS)

/obj/item/weapon/sword/katana/samurai
	name = "太刀"
	desc = "一把真正的古剑复制品。这把保存得异常完好。它能对所有人造成伤害，包括你自己。"
	icon_state = "katana_red"
	worn_icon_state = "katana_red"
	force = 60
	penetration = 15
	w_class = WEIGHT_CLASS_BULKY

/obj/item/weapon/sword/katana/replica
	name = "仿制武士刀"
	desc = "普通刀具店常见的廉价仿制品。仍能造成一定伤害。"
	force = 27
	penetration = 0
	throwforce = 7
