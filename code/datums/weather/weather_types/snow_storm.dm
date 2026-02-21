/datum/weather/snow_storm
	name = "暴风雪"
	desc = "这颗极地行星的地表肆虐着猛烈的暴风雪，任何不幸处于其路径上的区域都会被积雪掩埋。"
	probability = 90

	telegraph_message = span_warning("Drifting particles of snow begin to dust the surrounding area..")
	telegraph_duration = 300
	telegraph_overlay = "light_snow"

	weather_message = span_warning("<i>Harsh winds pick up as dense snow begins to fall from the sky!</i>")
	weather_overlay = "snow_storm"
	weather_duration_lower = 600
	weather_duration_upper = 1500

	end_duration = 100
	end_message = span_danger("The snowfall begins to slow.")

	area_type = /area
	protect_indoors = TRUE
	target_trait = ZTRAIT_SNOWSTORM
	use_glow = FALSE

	barometer_predictable = TRUE

/datum/weather/snow_storm/weather_act(mob/living/L)
	if(L.stat == DEAD)
		return
	if(L.mob_size > MOB_SIZE_HUMAN)
		return
	L.adjust_slowdown(1)
