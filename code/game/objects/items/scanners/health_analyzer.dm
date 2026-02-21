//! Most of the functionality for health analyzers is on [/datum/health_scan], see that file for explanation

/obj/item/healthanalyzer
	name = "\improper HF2健康分析仪"
	desc = "一款高科技手持式身体扫描仪，能够识别目标的生命体征。其前面板可显示目标的状态读数。"
	icon = 'icons/obj/device.dmi'
	icon_state = "health"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/medical_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/medical_right.dmi',
	)
	worn_icon_state = "healthanalyzer"
	atom_flags = CONDUCT
	equip_slot_flags = ITEM_SLOT_BELT
	throwforce = 3
	w_class = WEIGHT_CLASS_SMALL
	throw_speed = 5
	throw_range = 10
	/// The actual scanner functionality.
	/// Datumized because it's copy pasted in a lot of places.
	var/datum/health_scan/scanner
	// These variables are passed when initializing the scanner datum.
	/// Skill required to bypass the fumble time.
	var/skill_threshold = SKILL_MEDICAL_NOVICE
	/// Skill required to have the scanner auto refresh.
	var/upper_skill_threshold = SKILL_MEDICAL_NOVICE
	/// Distance the user can be away from the patient and still get autoupdates.
	var/track_distance = 3

/obj/item/healthanalyzer/Initialize(mapload)
	. = ..()
	scanner = new(src, skill_threshold, upper_skill_threshold, track_distance)

/obj/item/healthanalyzer/Destroy()
	QDEL_NULL(scanner)
	return ..()

/obj/item/healthanalyzer/attack(mob/living/carbon/patient_candidate, mob/living/user)
	. = ..()
	scanner.analyze_vitals(patient_candidate, user)

/obj/item/healthanalyzer/attack_alternate(mob/living/carbon/patient_candidate, mob/living/user)
	. = ..()
	scanner.analyze_vitals(patient_candidate, user, TRUE)

/obj/item/healthanalyzer/attack_self(mob/user)
	. = ..()
	scanner.analyze_vitals(user, user)
