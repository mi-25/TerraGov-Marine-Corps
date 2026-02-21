//Base Instance
/area/prison
	name = "菲奥里纳轨道监狱"
	ceiling = CEILING_GLASS

//SECURITY
/area/prison/security
	name = "安全部"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC
	ceiling = CEILING_METAL

/area/prison/security/briefing
	name = "简报"
	icon_state = "brig"

/area/prison/security/head
	name = "安保主管办公室"
	icon_state = "sec_hos"

/area/prison/security/armory/riot
	name = "防暴武器库"
	icon_state = "armory"
	ceiling = CEILING_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/prison/security/armory/lethal
	name = "致命军械库"
	icon_state = "Tactical"
	ceiling = CEILING_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/prison/security/armory/highsec_monitoring
	name = "高安保监控军械库"
	icon_state = "security_sub"

/area/prison/security/monitoring
	icon_state = "sec_prison"

/area/prison/security/monitoring/lowsec/ne
	name = "东北低安保监控区"

/area/prison/security/monitoring/lowsec/sw
	name = "西南低安保监控区"

/area/prison/security/monitoring/medsec/south
	name = "中等安全监控"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/prison/security/monitoring/medsec/central
	name = "中央中等级别监控"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/prison/security/monitoring/highsec
	name = "高安全监控"

/area/prison/security/monitoring/maxsec
	name = "最高安全级别监控"
	ceiling = CEILING_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/prison/security/monitoring/maxsec/panopticon
	name = "全景监控"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/prison/security/monitoring/protective
	name = "保护性监禁监控"

/area/prison/security/checkpoint
	icon_state = "checkpoint1"

/area/prison/security/checkpoint/medsec
	name = "中等安全等级检查点"

/area/prison/security/checkpoint/highsec/n
	name = "北部高安保检查点"

/area/prison/security/checkpoint/highsec/s
	name = "南侧高安保检查点"

/area/prison/security/checkpoint/vip
	name = "VIP检查点"

/area/prison/security/checkpoint/maxsec
	name = "最高安全等级检查站"
	ceiling = CEILING_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/prison/security/checkpoint/highsec_medsec
	name = "高-中安全等级检查站"

/area/prison/security/checkpoint/maxsec_highsec
	name = "最高至高度安全检查站"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/prison/security/checkpoint/hangar
	name = "主机库交通管制"

/area/prison/storage
	icon_state = "engine_storage"

/area/prison/storage/medsec
	name = "中等安全存储区"

/area/prison/storage/highsec/n
	name = "北部高安保储存区"

/area/prison/storage/highsec/s
	name = "南侧高安保存储区"

/area/prison/storage/vip
	name = "VIP储物区"

/area/prison/recreation
	icon_state = "party"
	minimap_color = MINIMAP_AREA_LIVING

/area/prison/recreation/staff
	name = "舰员娱乐室"

/area/prison/recreation/medsec
	name = "中等安全等级娱乐区"

/area/prison/recreation/highsec/n
	name = "北部高安保娱乐区"

/area/prison/recreation/highsec/s
	name = "南侧高安保娱乐区"

/area/prison/execution
	name = "处决"
	icon_state = "dark"
	ceiling = CEILING_METAL

/area/prison/store
	name = "监狱商店"
	icon_state = "bar"

/area/prison/chapel
	name = "礼拜堂"
	icon_state = "chapel"
	minimap_color = MINIMAP_AREA_LIVING

/area/prison/holding

/area/prison/holding/holding1
	name = "一号拘留室"
	icon_state = "blue-red2"

/area/prison/holding/holding2
	name = "2号拘留室"
	icon_state = "blue-red-d"

/area/prison/cleaning
	name = "保洁用品"
	icon_state = "janitor"

/area/prison/command/office
	name = "典狱长办公室"
	icon_state = "Warden"
	minimap_color = MINIMAP_AREA_COMMAND

/area/prison/command/secretary_office
	name = "典狱长秘书办公室"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_COMMAND

/area/prison/command/quarters
	name = "典狱长室"
	icon_state = "party"
	minimap_color = MINIMAP_AREA_COMMAND

/area/prison/toilet
	icon_state = "restrooms"
	minimap_color = MINIMAP_AREA_LIVING

/area/prison/toilet/canteen
	name = "食堂卫生间"

/area/prison/toilet/security
	name = "安保休息室"

/area/prison/toilet/research
	name = "研究休息室"

/area/prison/toilet/staff
	name = "船员休息室"

/area/prison/maintenance
	icon_state = "asmaint"

/area/prison/maintenance/residential/nw
	name = "西北民用住宅区维护"

/area/prison/maintenance/residential/ne
	name = "东北区民用住宅维护"

/area/prison/maintenance/residential/sw
	name = "西南民用住宅区维护"

/area/prison/maintenance/residential/se
	name = "东南民用住宅区维护"

/area/prison/maintenance/residential/access/north
	name = "北区民用住宅通道"

/area/prison/maintenance/residential/access/south
	name = "南区民用住宅区入口"

/area/prison/maintenance/staff_research
	name = "舰船-研究维护"
	icon_state = "maint_research_starboard"

/area/prison/maintenance/research_medbay
	name = "研究-医务室维护"
	icon_state = "maint_research_port"
	ceiling = CEILING_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_CAVES

/area/prison/maintenance/hangar_barracks
	name = "机库-营房维护区"
	icon_state = "maint_e_shuttle"

/area/prison/canteen
	name = "水壶"
	icon_state = "cafeteria"
	minimap_color = MINIMAP_AREA_LIVING

/area/prison/kitchen
	name = "厨房"
	icon_state = "kitchen"
	minimap_color = MINIMAP_AREA_LIVING

/area/prison/laundry
	name = "洗衣房"
	icon_state = "bluenew"
	minimap_color = MINIMAP_AREA_LIVING

/area/prison/library
	name = "图书馆"
	icon_state = "green"
	minimap_color = MINIMAP_AREA_LIVING

/area/prison/engineering
	name = "工程部"
	icon_state = "engine"
	minimap_color = MINIMAP_AREA_ENGI
	ceiling = CEILING_UNDERGROUND_METAL

/area/prison/engineering/atmos
	name = "大气处理"
	icon_state = "atmos"

/area/prison/intake
	name = "收容处理"
	icon_state = "green"

/area/prison/parole/main
	name = "假释"
	icon_state = "blue2"

/area/prison/parole/protective_custody
	name = "保护性监管假释"
	icon_state = "red2"

/area/prison/visitation
	name = "访问"
	icon_state = "yellow"

/area/prison/yard
	name = "船坞"
	icon_state = "thunder"
	ceiling = CEILING_NONE

/area/prison/beach
	name = "海滩娱乐"
	icon_state = "thunder"
	ceiling = CEILING_NONE
	always_unpowered = TRUE

/area/prison/hallway

/area/prison/hallway/entrance
	name = "入口走廊"
	icon_state = "entry"

/area/prison/hallway/central
	name = "中央环区"
	icon_state = "hallC1"

/area/prison/hallway/east
	name = "东侧走廊"
	icon_state = "east"

/area/prison/hallway/staff
	name = "参谋军官走廊"
	icon_state = "hallS"

/area/prison/hallway/engineering
	name = "工程走廊"
	icon_state = "dk_yellow"

/area/prison/quarters
	minimap_color = MINIMAP_AREA_LIVING

/area/prison/quarters/staff
	name = "船员宿舍"
	icon_state = "crew_quarters"

/area/prison/quarters/security
	name = "安全营房"
	icon_state = "sec_backroom"
	minimap_color = MINIMAP_AREA_SEC

/area/prison/quarters/research
	name = "研究宿舍"
	icon_state = "purple"

/area/prison/cellblock/
	minimap_color = MINIMAP_AREA_CELL_LOW

/area/prison/cellblock/lowsec/nw
	name = "西北低安保监区"
	icon_state = "cells_low_nw"

/area/prison/cellblock/lowsec/ne
	name = "东北区低安保监区"
	icon_state = "cells_low_ne"

/area/prison/cellblock/lowsec/sw
	name = "西南区低安保监禁区"
	icon_state = "cells_low_sw"

/area/prison/cellblock/lowsec/se
	name = "东南区低安保监区"
	icon_state = "cells_low_se"

/area/prison/cellblock/mediumsec
	name = "中等安全级别监禁区"
	icon_state = "cells_med"
	minimap_color = MINIMAP_AREA_CELL_MED
	ceiling = CEILING_UNDERGROUND_METAL

/area/prison/cellblock/mediumsec/north
	name = "中安全监区北区"
	icon_state = "cells_med_n"

/area/prison/cellblock/mediumsec/south
	name = "中安全监区南侧"
	icon_state = "cells_med_s"

/area/prison/cellblock/mediumsec/east
	name = "中安全监区东区"
	icon_state = "cells_med_e"

/area/prison/cellblock/mediumsec/west
	name = "中安全监区西翼"
	icon_state = "cells_med_w"

/area/prison/cellblock/highsec
	name = "北区高安保监禁区"
	icon_state = "cells_high_nn"
	minimap_color = MINIMAP_AREA_CELL_HIGH
	ceiling = CEILING_METAL

/area/prison/cellblock/highsec/north/north
	name = "北区高安保监禁区北区"
	icon_state = "cells_high_nn"

/area/prison/cellblock/highsec/north/south
	name = "北区高安保监禁区 南区"
	icon_state = "cells_high_ns"

/area/prison/cellblock/highsec/south/north
	name = "南侧高安保监区北区"
	icon_state = "cells_high_sn"

/area/prison/cellblock/highsec/south/south
	name = "南侧高安保监禁区 南侧"
	icon_state = "cells_high_ss"

/area/prison/cellblock/maxsec/north
	name = "最高安全级别全景监控牢房区"
	icon_state = "cells_max_n"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_CELL_MAX

/area/prison/cellblock/maxsec/south
	name = "最高安全级别-暂停使用监禁区"
	icon_state = "cells_max_s"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_CELL_MAX

/area/prison/cellblock/vip
	name = "VIP牢房"
	icon_state = "cells_vip"
	minimap_color = MINIMAP_AREA_CELL_VIP

/area/prison/cellblock/protective
	name = "保护性监禁"
	icon_state = "cells_protective"
	minimap_color = MINIMAP_AREA_CELL_VIP

/area/prison/cellblock/protective/room101
	name = "101号房间"

/area/prison/material_processing
	name = "材料处理"
	icon_state = "mining"

/area/prison/disposal
	name = "废弃物处理"
	icon_state = "disposal"

/area/prison/medbay
	name = "医务室"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY
	ceiling = CEILING_METAL

/area/prison/medbay/foyer
	name = "医务室前厅"
	icon_state = "medbay2"

/area/prison/medbay/surgery
	name = "手术室"
	icon_state = "medbay3"
	ceiling = CEILING_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_MEDBAY_CAVE

/area/prison/medbay/morgue
	name = "太平间"
	icon_state = "morgue"
	ceiling = CEILING_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_MEDBAY_CAVE

/area/prison/research/
	name = "生物研究部"
	icon_state = "research"
	ceiling = CEILING_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/prison/research/RD
	name = "研究主管办公室"
	icon_state = "disposal"

/area/prison/research/secret/
	name = "机密研究"
	icon_state = "toxlab"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/prison/research/secret/dissection
	name = "解剖"
	icon_state = "toxmix"

/area/prison/research/secret/chemistry
	name = "化学"
	icon_state = "chem"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/prison/research/secret/bioengineering
	name = "生物工程"
	icon_state = "toxmisc"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/prison/research/secret/containment
	name = "实验体收容室"
	icon_state = "xeno_f_store"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/prison/research/secret/biolab
	name = "生物测试实验室"
	icon_state = "anolab"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/prison/residential
	minimap_color = MINIMAP_AREA_LIVING

/area/prison/residential/central
	name = "民用住宅区中心"
	icon_state = "blue-red2"

/area/prison/residential/north
	name = "北区平民住宅"
	icon_state = "blue2"

/area/prison/residential/south
	name = "平民住宅区南侧"
	icon_state = "red2"

/area/prison/monorail
	icon_state = "purple"

/area/prison/monorail/east
	name = "东线单轨站"

/area/prison/monorail/west
	name = "西线单轨站"

/area/prison/hangar/main
	ceiling = CEILING_NONE
	minimap_color = MINIMAP_AREA_LZ

/area/prison/hangar/main
	name = "主机库"
	icon_state = "hangar_alpha"

/area/prison/hangar/civilian
	name = "民用机库"
	icon_state = "hangar_beta"

/area/prison/hangar_storage/main
	name = "主机库存储区"
	icon_state = "quartstorage"
	minimap_color = MINIMAP_AREA_REQ

/area/prison/hangar_storage/research
	name = "研究机库存储区"
	icon_state = "toxstorage"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/prison/telecomms
	name = "通讯系统"
	icon_state = "tcomsatcham"

/area/prison/pirate
	name = "流浪货船'罗西南多'号"
	icon_state = "syndie-ship"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_SHIP

/area/prison/secret
	name = "密室"
	icon_state = "tcomsatcham"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	minimap_color = MINIMAP_AREA_CAVES

/area/prison/console
	name = "穿梭机控制台"
