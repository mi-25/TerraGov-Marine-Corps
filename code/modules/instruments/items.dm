//copy pasta of the space piano, don't hurt me -Pete
/obj/item/instrument
	name = "通用乐器"
	force = 10
	max_integrity = 100
	icon = 'icons/obj/musician.dmi'
	interaction_flags = INTERACT_OBJ_UI
	item_state_worn = TRUE
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/items/instruments_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/instruments_right.dmi',
		slot_s_store_str = 'icons/mob/instruments_back.dmi',
		)
	/// Our song datum.
	var/datum/song/handheld/song
	/// Our allowed list of instrument ids. This is nulled on initialize.
	var/list/allowed_instrument_ids
	/// How far away our song datum can be heard.
	var/instrument_range = 15

/obj/item/instrument/Initialize(mapload)
	. = ..()
	song = new(src, allowed_instrument_ids, instrument_range)
	allowed_instrument_ids = null			//We don't need this clogging memory after it's used.

/obj/item/instrument/Destroy()
	QDEL_NULL(song)
	return ..()

/obj/item/instrument/proc/should_stop_playing(mob/user)
	return user.incapacitated() || !((loc == user) || (isturf(loc) && Adjacent(user)))		// sorry, no more TK playing.

/obj/item/instrument/suicide_act(mob/user)
	user.visible_message(span_suicide("[user]开始播放《忧郁的星期天》！看起来[user.p_theyre()]想要自杀！"))
	return (BRUTELOSS)

/datum/action/item_action/instrument
	name = "使用乐器"
	desc = "使用指定的乐器"

/obj/item/instrument/attack_self(mob/user)
	interact(user)

/obj/item/instrument/ui_interact(mob/living/user)
	if(!isliving(user) || user.stat != CONSCIOUS)
		return

	user.set_machine(src)
	song.ui_interact(user)

/obj/item/instrument/violin
	name = "太空小提琴"
	desc = "一把有四根弦和琴弓的木制乐器。{{P0}}魔鬼下凡到太空，他正在寻找一个助手来制造悲伤。{{P1}}"
	icon_state = "violin"
	worn_icon_state = "violin"
	hitsound = SFX_SWING_HIT
	allowed_instrument_ids = "violin"

/obj/item/instrument/violin/golden
	name = "金色小提琴"
	desc = "一把金色的四弦乐器，配有一支琴弓。{{P0}}魔鬼降临太空，他正寻找一个制造悲伤的助手。{{P1}}"
	icon_state = "golden_violin"
	worn_icon_state = "golden_violin"

/obj/item/instrument/piano_synth
	name = "合成器"
	desc = "一种高级电子合成器，可用作多种乐器。"
	icon_state = "synth"
	worn_icon_state = "synth"
	allowed_instrument_ids = "piano"

/obj/item/instrument/piano_synth/Initialize(mapload)
	. = ..()
	song.allowed_instrument_ids = SSinstruments.synthesizer_instrument_ids

/obj/item/instrument/banjo
	name = "班卓琴"
	desc = "带颈弦的鼓。"
	icon_state = "banjo"
	worn_icon_state = "banjo"
	attack_verb = list("scruggs-styles", "hum-diggitys", "shin-digs", "clawhammers")
	hitsound = 'sound/weapons/banjoslap.ogg'
	allowed_instrument_ids = "banjo"

/obj/item/instrument/guitar
	name = "吉他"
	desc = "它由木头制成，并配有青铜琴弦。"
	icon_state = "guitar"
	worn_icon_state = "guitar"
	attack_verb = list("serenades", "crashes", "smashes")
	hitsound = 'sound/weapons/stringsmash.ogg'
	allowed_instrument_ids = list("guitar","csteelgt","cnylongt", "ccleangt", "cmutedgt")

/obj/item/instrument/eguitar
	name = "电吉他"
	desc = "满足你的一切撕碎需求。"
	icon_state = "eguitar"
	worn_icon_state = "eguitar"
	force = 12
	attack_verb = list("shreds", "crashes", "smashes")
	hitsound = 'sound/weapons/stringsmash.ogg'
	allowed_instrument_ids = "eguitar"

/obj/item/instrument/glockenspiel
	name = "钟琴"
	desc = "光滑的金属条，适合任何军乐队使用。"
	icon_state = "glockenspiel"
	worn_icon_state = "glockenspiel"
	allowed_instrument_ids = list("glockenspiel","crvibr", "sgmmbox", "r3celeste")

/obj/item/instrument/accordion
	name = "手风琴"
	desc = "不含猴子。"
	icon_state = "accordion"
	worn_icon_state = "accordion"
	allowed_instrument_ids = list("crack", "crtango", "accordion")

/obj/item/instrument/trumpet
	name = "小号"
	desc = "宣布异形之王的降临！"
	icon_state = "trumpet"
	worn_icon_state = "trumpet"
	allowed_instrument_ids = "crtrumpet"

/obj/item/instrument/saxophone
	name = "萨克斯风"
	desc = "这舒缓的声音定会让你的听众潸然泪下。"
	icon_state = "saxophone"
	worn_icon_state = "saxophone"
	allowed_instrument_ids = "saxophone"


/obj/item/instrument/trombone
	name = "长号"
	desc = "哪张台球桌能与之抗衡？"
	icon_state = "trombone"
	worn_icon_state = "trombone"
	allowed_instrument_ids = list("crtrombone", "crbrass", "trombone")

/obj/item/instrument/recorder
	name = "录音机"
	desc = "就像在学校里一样，玩的能力和一切。"
	force = 5
	icon_state = "recorder"
	worn_icon_state = "recorder"
	allowed_instrument_ids = "recorder"

/obj/item/instrument/harmonica
	name = "口琴"
	desc = "专治太空忧郁症。"
	icon_state = "harmonica"
	worn_icon_state = "harmonica"
	allowed_instrument_ids = list("crharmony", "harmonica")
	equip_slot_flags = ITEM_SLOT_MASK
	force = 5
	w_class = WEIGHT_CLASS_SMALL
	actions_types = list(/datum/action/item_action/instrument)

/obj/item/instrument/harmonica/proc/handle_speech(datum/source, list/speech_args)
	if(song.playing && ismob(loc))
		to_chat(loc, span_warning("你停止吹口琴，开始说话……"))
		song.playing = FALSE

/obj/item/instrument/harmonica/equipped(mob/M, slot)
	. = ..()
	RegisterSignal(M, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/obj/item/instrument/harmonica/dropped(mob/M)
	UnregisterSignal(M, COMSIG_MOB_SAY)
	return ..()

/obj/item/instrument/bikehorn
	name = "镀金自行车喇叭"
	desc = "一个装饰精美的自行车喇叭，能够发出多种音调。"
	icon_state = "bike_horn"
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/items/toys_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/items/toys_right.dmi',
	)
	allowed_instrument_ids = list("bikehorn", "honk")
	attack_verb = list("beautifully honks")
	w_class = WEIGHT_CLASS_TINY
	force = 0
	throw_speed = 3
	throw_range = 15
	hitsound = 'sound/items/bikehorn.ogg'

/obj/item/instrument/musicalmoth
	name = "音乐飞蛾"
	desc = "尽管广受欢迎，这款备受争议的音乐玩具最终因使用了飞蛾痛苦尖叫的不道德采样声音而被禁止。"
	icon_state = "mothsician"
	allowed_instrument_ids = "mothscream"
	attack_verb = list("flutters", "flaps")
	w_class = WEIGHT_CLASS_TINY
	force = 0
	hitsound = 'sound/voice/moth_scream.ogg'
