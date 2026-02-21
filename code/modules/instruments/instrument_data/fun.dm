/datum/instrument/fun
	name = "通用娱乐乐器"
	category = "Fun"
	abstract_type = /datum/instrument/fun

/datum/instrument/fun/honk
	name = "!!鸣叫！！"
	id = "honk"
	real_samples = list("74"='sound/items/bikehorn.ogg') // Cluwne Heaven

/datum/instrument/fun/signal
	name = "已收到。"
	id = "ping"
	real_samples = list("79"='sound/machines/ping.ogg')

/datum/instrument/fun/chime
	name = "叮"
	id = "chime"
	real_samples = list("79"='sound/machines/chime.ogg')

/datum/instrument/fun/meowsynth
	name = "喵呜合成人"
	id = "meowsynth"
	real_samples = list(
		           "36"='sound/runtime/instruments/synthesis_samples/meowsynth/c2.ogg',
				   "48"='sound/runtime/instruments/synthesis_samples/meowsynth/c3.ogg',
				   "60"='sound/runtime/instruments/synthesis_samples/meowsynth/c4.ogg',
				   "72"='sound/runtime/instruments/synthesis_samples/meowsynth/c5.ogg',
				   "84"='sound/runtime/instruments/synthesis_samples/meowsynth/c6.ogg')

/datum/instrument/fun/spaceman
	name = "太空人"
	id = "spaceman"
	real_samples = list(
		           "36"='sound/runtime/instruments/synthesis_samples/spaceman/c2.ogg',
				   "48"='sound/runtime/instruments/synthesis_samples/spaceman/c3.ogg',
				   "60"='sound/runtime/instruments/synthesis_samples/spaceman/c4.ogg',
				   "72"='sound/runtime/instruments/synthesis_samples/spaceman/c5.ogg')

/datum/instrument/fun/mothscream
	name = "飞蛾尖啸"
	id = "mothscream"
	real_samples = list("60"='sound/voice/moth_scream.ogg')
	admin_only = TRUE
