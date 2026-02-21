//MARINE SHIP AREAS--------------------------------------//
// Fore = West  | Aft = East //
// Port = South | Starboard = North //
/area/mainship
	icon = 'icons/turf/area_mainship.dmi'
	ambience = list('sound/ambience/shipambience.ogg')
	icon_state = "mainship"
	ceiling = CEILING_METAL

/area/mainship/command
	minimap_color = MINIMAP_AREA_COMMAND

/area/mainship/command/bridge
	name = "舰桥"
	icon_state = "bridge"

/area/mainship/command/cic
	name = "作战信息中心"
	icon_state = "cic"


/area/mainship/command/airoom
	name = "AI核心"
	icon_state = "airoom"


/area/mainship/command/telecomms
	name = "通讯系统"
	icon_state = "tcomms"


/area/mainship/command/self_destruct
	name = "自毁核心室"
	icon_state = "selfdestruct"
	minimap_color = MINIMAP_AREA_SEC_CAVE


/area/mainship/command/corporateliaison
	name = "企业联络官办公室"
	icon_state = "corporatespace"


/area/mainship/engineering
	minimap_color = MINIMAP_AREA_ENGI

/area/mainship/engineering/upper_engineering
	name = "上层工程部"
	icon_state = "upperengineering"


/area/mainship/engineering/ce_room
	name = "首席舰船工程师办公室"
	icon_state = "ceroom"


/area/mainship/engineering/lower_engine_monitoring
	name = "引擎反应堆监控"
	icon_state = "lowermonitoring"


/area/mainship/engineering/upper_engine_monitoring
	name = "引擎反应堆监控"
	icon_state = "uppermonitoring"

/area/mainship/engineering/lower_engineering
	name = "工程下层"
	icon_state = "lowerengineering"


/area/mainship/engineering/engineering_workshop
	name = "工程车间"
	icon_state = "workshop"


/area/mainship/engineering/engine_core
	name = "引擎反应堆核心室"
	icon_state = "coreroom"


/area/mainship/engineering/starboard_atmos
	name = "大气处理室右舷"
	icon_state = "starboardatmos"

/area/mainship/engineering/port_atmos
	name = "大气处理站"
	icon_state = "portatmos"


/area/mainship/shipboard
	minimap_color = MINIMAP_AREA_SEC

/area/mainship/shipboard/navigation
	name = "天文导航甲板"
	icon_state = "astronavigation"
	minimap_color = MINIMAP_AREA_COMMAND

/area/mainship/shipboard/starboard_missiles
	name = "右舷导弹发射管"
	icon_state = "starboardmissile"


/area/mainship/shipboard/port_missiles
	name = "导弹发射管左舷"
	icon_state = "portmissile"


/area/mainship/shipboard/weapon_room
	name = "武器控制室"
	icon_state = "weaponroom"

/area/mainship/shipboard/starboard_point_defense
	name = "星舰右舷点防御系统"
	icon_state = "starboardpd"

/area/mainship/shipboard/port_point_defense
	name = "点防御端口"
	icon_state = "portpd"

/area/mainship/shipboard/brig
	name = "禁闭室"
	icon_state = "brig"

/area/mainship/shipboard/brig_cells
	name = "禁闭室"
	icon_state = "brigcells"

/area/mainship/shipboard/chief_mp_office
	name = "宪兵指挥长办公室"
	icon_state = "chiefmpoffice"

/area/mainship/shipboard/ex_firing_range
	name = "实验性射击场"
	icon_state = "firingrange"

/area/mainship/shipboard/firing_range
	name = "射击场"
	icon_state = "firingrange"


/area/mainship/shipboard/sensors
	name = "传感器室"
	icon_state = "sensor"

/area/mainship/hallways/hangar
	name = "机库"
	icon_state = "hangar"
	minimap_color = MINIMAP_AREA_LZ

/area/mainship/hallways/hangar/flight_control
	name = "飞行控制"
	minimap_color = MINIMAP_AREA_COMMAND

/area/mainship/hallways/hangar/flight_observation
	name = "飞行观测"
	minimap_color = MINIMAP_AREA_LIVING

/area/mainship/living/tankerbunks
	name = "载具乘员铺位"
	icon_state = "livingspace"
	minimap_color = MINIMAP_AREA_COMMAND

/area/mainship/living/mechpilotquarters
	name = "机甲驾驶员宿舍"
	icon_state = "blueold"
	minimap_color = MINIMAP_AREA_COMMAND

/area/mainship/hallways/exoarmor
	name = "载具装甲储存"
	icon_state = "exoarmor"

/area/mainship/hallways/boxingring
	name = "拳击台"
	icon_state = "livingspace"

/area/mainship/hallways/repair_bay
	name = "载具维修站"
	icon_state = "dropshiprepair"
	minimap_color = MINIMAP_AREA_ENGI

/area/mainship/hallways/mission_planner
	name = "空投艇中央计算机室"
	icon_state = "missionplanner"

/area/mainship/hallways/starboard_umbilical
	name = "脐带右舷"
	icon_state = "starboardumbilical"
	minimap_color = MINIMAP_AREA_CAVES


/area/mainship/hallways/port_umbilical
	name = "脐带接口"
	icon_state = "portumbilical"
	minimap_color = MINIMAP_AREA_CAVES


/area/mainship/hallways/aft_umbilical
	name = "脐带后段"
	icon_state = "aft"
	minimap_color = MINIMAP_AREA_CAVES

/area/mainship/hallways/bow_hallway
	name = "走廊弓"
	icon_state = "bow"

/area/mainship/hallways/aft_hallway
	name = "走廊后段"
	icon_state = "aft"


/area/mainship/hallways/stern_hallway
	name = "走廊船尾"
	icon_state = "stern"


/area/mainship/hallways/port_hallway
	name = "走廊端口"
	icon_state = "port"


/area/mainship/hallways/starboard_hallway
	name = "走廊右舷"
	icon_state = "starboard"


/area/mainship/hallways/port_ert
	name = "紧急响应小组机库"
	icon_state = "hangar"
	minimap_color = MINIMAP_AREA_LZ


/area/mainship/hallways/starboard_ert
	name = "右舷应急响应小组机库"
	icon_state = "hangar"
	minimap_color = MINIMAP_AREA_LZ


/area/mainship/hull
	minimap_color = MINIMAP_AREA_CAVES

/area/mainship/hull/lower_hull
	name = "船体下层"
	icon_state = "lowerhull"


/area/mainship/hull/upper_hull
	name = "船体上层"
	icon_state = "upperhull"

/area/mainship/hull/port_hull
	name = "船体左舷"
	icon_state = "lowerhull"

/area/mainship/hull/starboard_hull
	name = "船体右舷"
	icon_state = "upperhull"

/area/mainship/living
	minimap_color = MINIMAP_AREA_LIVING

/area/mainship/living/cryo_cells
	name = "低温休眠舱"
	icon_state = "cryo"


/area/mainship/living/briefing
	name = "简报区"
	icon_state = "briefing"


/area/mainship/living/port_emb
	name = "扩展任务铺位"
	icon_state = "portemb"


/area/mainship/living/starboard_emb
	name = "扩展任务铺位"
	icon_state = "starboardemb"

/area/mainship/living/port_garden
	name = "花园"
	icon_state = "portemb"


/area/mainship/living/starboard_garden
	name = "花园"
	icon_state = "starboardemb"

/area/mainship/living/basketball
	name = "篮球场"
	icon_state = "basketball"

/area/mainship/living/grunt_rnr
	name = "休息室"
	icon_state = "gruntrnr"

/area/mainship/living/grunt_rnr/two

/area/mainship/living/officer_rnr
	name = "军官休息室"
	icon_state = "officerrnr"
	//minimap_color = MINIMAP_AREA_COMMAND

/area/mainship/living/officer_study
	name = "军官研究室"
	icon_state = "officerstudy"
	//minimap_color = MINIMAP_AREA_COMMAND

/area/mainship/living/cafeteria
	name = "食堂"
	icon_state = "food"

/area/mainship/living/cafeteria_port
	name = "食堂港口"
	icon_state = "food"

/area/mainship/living/cafeteria_starboard
	name = "食堂右舷"
	icon_state = "food"


/area/mainship/living/cafeteria_officer
	name = "军官餐厅"
	icon_state = "food"

/area/mainship/living/offices
	name = "泳池区"
	icon_state = "briefing"

/area/mainship/living/captain_mess
	name = "舰长餐厅"
	icon_state = "briefing"
	minimap_color = MINIMAP_AREA_COMMAND

/area/mainship/living/pilotbunks
	name = "飞行员宿舍"
	icon_state = "livingspace"
	minimap_color = MINIMAP_AREA_COMMAND


/area/mainship/living/bridgebunks
	name = "参谋军官宿舍"
	icon_state = "livingspace"
	minimap_color = MINIMAP_AREA_COMMAND


/area/mainship/living/commandbunks
	name = "舰长舱室"
	icon_state = "livingspace"
	minimap_color = MINIMAP_AREA_COMMAND


/area/mainship/living/numbertwobunks
	name = "副官铺位"
	icon_state = "livingspace"
	minimap_color = MINIMAP_AREA_COMMAND


/area/mainship/living/chapel
	name = "教堂"
	icon_state = "officerrnr"

/area/mainship/medical
	name = "\improper 医疗湾"
	minimap_color = MINIMAP_AREA_MEDBAY
	icon_state = "medical"

/area/mainship/medical/lower_medical
	name = "医疗下装"
	icon_state = "medical"


/area/mainship/medical/upper_medical
	name = "医疗上装"
	icon_state = "medical"

/area/mainship/medical/operating_room_one
	name = "医疗手术室 1"
	icon_state = "operating"


/area/mainship/medical/operating_room_two
	name = "医疗手术室 2"
	icon_state = "operating"


/area/mainship/medical/operating_room_three
	name = "医疗手术室3"
	icon_state = "operating"

/area/mainship/medical/operating_room_four
	name = "医疗手术室 4"
	icon_state = "operating"

/area/mainship/medical/medical_science
	name = "医学研究实验室"
	icon_state = "science"


/area/mainship/medical/chemistry
	name = "医疗化学实验室"
	icon_state = "chemistry"


/area/mainship/medical/cryo_tubes
	name = "医疗冷冻舱"
	icon_state = "medical"

/area/mainship/medical/surgery_hallway
	name = "医疗外科走廊"
	icon_state = "medical"

/area/mainship/medical/morgue
	name = "太平间"
	icon_state = "medical"

/area/mainship/medical/cmo_office
	name = "首席医疗官办公室"
	icon_state = "medical"

/area/mainship/squads
	minimap_color = MINIMAP_AREA_PREP

/area/mainship/squads/alpha
	name = "阿尔法小队准备"
	icon_state = "alpha"

/area/mainship/squads/bravo
	name = "布拉沃小队准备"
	icon_state = "bravo"

/area/mainship/squads/charlie
	name = "查理小队准备"
	icon_state = "charlie"

/area/mainship/squads/delta
	name = "德尔塔小队准备"
	icon_state = "delta"

/area/mainship/squads/general
	name = "常规小队准备"
	icon_state = "req"


/area/mainship/squads/general/som

/area/mainship/squads/req
	name = "补给"
	icon_state = "req"
	minimap_color = MINIMAP_AREA_REQ


/area/mainship/powered //for objects not intended to lose power
	name = "已启动"
	icon_state = "selfdestruct"
	requires_power = FALSE

/area/mainship/hallways/hangar/droppod
	name = "空降舱舱室"
	icon_state = "storage"

/area/mainship/living/evacuation
	name = "撤离"
	icon_state = "departures"
	minimap_color = MINIMAP_AREA_ESCAPE
	requires_power = FALSE

/area/mainship/living/evacuation/two //some ships have entirely separate evac areas

/area/mainship/living/evacuation/pod
	requires_power = FALSE

/area/mainship/living/evacuation/pod/one

/area/mainship/living/evacuation/pod/two

/area/mainship/living/evacuation/pod/three

/area/mainship/living/evacuation/pod/four

/area/mainship/medical/lounge
	name = "医疗休息室"
	icon_state = "medical"

//combat patrol base

/area/mainship/patrol_base
	name = "地球政府殖民地海军陆战队战斗巡逻基地"
	icon_state = "req"
	requires_power = FALSE

/area/mainship/patrol_base/hanger
	name = "地球政府殖民地海军陆战队机库"
	icon_state = "hangar"
	minimap_color = MINIMAP_AREA_LZ

/area/mainship/patrol_base/command
	name = "地球政府殖民地海军陆战队舰桥"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_COMMAND

/area/mainship/patrol_base/prep
	name = "地球政府殖民地海军陆战队 准备阶段"
	icon_state = "mainship"
	minimap_color = MINIMAP_AREA_PREP

/area/mainship/patrol_base/barracks
	name = "地球政府殖民地海军陆战队营房"
	icon_state = "cryo"
	minimap_color = MINIMAP_AREA_LIVING

/area/mainship/patrol_base/som
	name = "火星之子战斗巡逻基地"

/area/mainship/patrol_base/som/hanger
	name = "火星之子主机库"
	icon_state = "hangar"
	minimap_color = MINIMAP_AREA_LZ

/area/mainship/patrol_base/som/command
	name = "火星之子指挥部"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_COMMAND

/area/mainship/patrol_base/som/prep
	name = "火星之子备战"
	icon_state = "mainship"
	minimap_color = MINIMAP_AREA_PREP

/area/mainship/patrol_base/som/barracks
	name = "火星之子兵营"
	icon_state = "cryo"
	minimap_color = MINIMAP_AREA_LIVING

/area/mainship/patrol_base/som/medical
	name = "火星之子医疗舱"
	icon_state = "medical"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/mainship/patrol_base/som/equipment_bay
	name = "火星之子装备舱"
	icon_state = "req"
	minimap_color = MINIMAP_AREA_REQ

/area/mainship/patrol_base/telecomms
	name = "通讯系统"
	icon_state = "tcomms"

/area/mainship/multiz_debug_area
	name = "多层级调试"
	icon_state = "req"

/area/mainship/multiz_debug_area/floorone
	name = "多层调试 第一层"

/area/mainship/multiz_debug_area/floortwo
	name = "多层调试 第二层"

/area/mainship/multiz_debug_area/floorthree
	name = "多层调试 第三层"
