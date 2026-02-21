// Specific AI monitored areas

// Stub defined ai_monitored.dm
/area/deltastation/ai_monitored
	ceiling = CEILING_UNDERGROUND_METAL

/area/deltastation/ai_monitored/turret_protected

// AI
/area/deltastation/ai_monitored
	icon_state = "ai"

/area/deltastation/ai_monitored/aisat/exterior
	name = "\improper 人工智能卫星外部"
	icon_state = "ai"

/area/deltastation/ai_monitored/command/storage/satellite
	name = "\improper 人工智能卫星维护"
	icon_state = "ai_storage"

// Turret protected
/area/deltastation/ai_monitored/turret_protected

/area/deltastation/ai_monitored/turret_protected/ai_upload
	name = "\improper AI上传室"
	icon_state = "ai_upload"

/area/deltastation/ai_monitored/turret_protected/ai_upload_foyer
	name = "\improper AI上传访问权限"
	icon_state = "ai_upload_foyer"

/area/deltastation/ai_monitored/turret_protected/ai
	name = "\improper AI 核心舱"
	icon_state = "ai_chamber"

/area/deltastation/ai_monitored/turret_protected/aisat
	name = "\improper 人工智能卫星"
	icon_state = "ai"

/area/deltastation/ai_monitored/turret_protected/aisat/atmos
	name = "\improper AI卫星大气系统"
	icon_state = "ai"

/area/deltastation/ai_monitored/turret_protected/aisat/foyer
	name = "\improper 人工智能卫星前厅"
	icon_state = "ai_foyer"

/area/deltastation/ai_monitored/turret_protected/aisat/service
	name = "\improper 人工智能卫星服务"
	icon_state = "ai"

/area/deltastation/ai_monitored/turret_protected/aisat/hallway
	name = "\improper 人工智能卫星走廊"
	icon_state = "ai"

/area/deltastation/ai_monitored/turret_protected/aisat/maint
	name = "\improper 人工智能卫星维护"
	icon_state = "ai_maint"

/area/deltastation/ai_monitored/turret_protected/aisat_interior
	name = "\improper 人工智能卫星前厅"
	icon_state = "ai_interior"

/area/deltastation/ai_monitored/turret_protected/ai_sat_ext_as
	name = "\improper 人工智能卫星扩展"
	icon_state = "ai_sat_east"

/area/deltastation/ai_monitored/turret_protected/ai_sat_ext_ap
	name = "\improper 人工智能卫星扩展"
	icon_state = "ai_sat_west"

// Station specific ai monitored rooms, move here for consistency

//Command - AI Monitored
/area/deltastation/ai_monitored/command/storage/eva
	name = "EVA 存储"
	icon_state = "eva"

/area/deltastation/ai_monitored/command/storage/eva/upper
	name = "上层舱外活动存储区"

/area/deltastation/ai_monitored/command/nuke_storage
	name = "\improper 金库"
	icon_state = "nuke_storage"

//Security - AI Monitored
/area/deltastation/ai_monitored/security/armory
	name = "\improper 军械库"
	icon_state = "armory"

/area/deltastation/ai_monitored/security/armory/upper
	name = "上层军械库"
