// This is a typepath to just sit in baseturfs and act as a marker for other things.
/turf/baseturf_skipover
	name = "基底层跳过占位符"
	desc = "这不应该存在"

/turf/baseturf_skipover/Initialize(mapload)
	. = ..()
	stack_trace("[src]([type]) was instanced which should never happen. Changing into the next baseturf down...")
	ScrapeAway()

/turf/baseturf_skipover/shuttle
	name = "穿梭机基地图块跳过层"
	desc = "作为穿梭机的底部，如果这里不存在，穿梭机的地板就会被破坏。"

/turf/baseturf_bottom
	name = "Z层级基地图块占位符"
	desc = "z层级基础地形标记，通常解析为太空。"
	baseturfs = /turf/baseturf_bottom
