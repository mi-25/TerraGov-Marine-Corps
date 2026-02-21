/area/space
	name = "太空"
	requires_power = 1
	always_unpowered = 1
	base_lighting_alpha = 255

	power_light = 0
	power_equip = 0
	power_environ = 0
	max_ambience_cooldown = 180 SECONDS
	min_ambience_cooldown = 180 SECONDS
	ambience = list('sound/ambience/ambispace.ogg')
	temperature = TCMB
	pressure = 0
	area_flags = NO_DROPPOD
	///What type of debuff do we apply when someone enters this area?
	var/debuff_type = /datum/status_effect/spacefreeze

/area/space/light
	debuff_type = /datum/status_effect/spacefreeze/light

/area/engine
	ambience = list('sound/ambience/ambisin1.ogg','sound/ambience/ambisin2.ogg','sound/ambience/ambisin3.ogg','sound/ambience/ambisin4.ogg')

/area/turret_protected

/area/arrival
	requires_power = 0

/area/arrival/start
	name = "抵达区"
	icon_state = "start"

/area/admin
	name = "管理员室"
	icon_state = "start"



//These are shuttle areas, they must contain two areas in a subgroup if you want to move a shuttle from one
//place to another. Look at escape shuttle for example.
//All shuttles show now be under shuttle since we have smooth-wall code.

/area/shuttle //DO NOT TURN THE dynamic_lighting STUFF ON FOR SHUTTLES. IT BREAKS THINGS.
	requires_power = FALSE
	outside = FALSE
	area_flags = OB_CAS_IMMUNE
	minimap_color = MINIMAP_AREA_LZ

/area/shuttle/arrival
	name = "废弃抵达穿梭机"

/area/shuttle/arrival/pre_game
	icon_state = "shuttle2"

/area/shuttle/arrival/station
	icon_state = "shuttle"

/area/shuttle/escape
	name = "废弃紧急穿梭机"

/area/shuttle/escape/station
	name = "废弃紧急穿梭站"
	icon_state = "shuttle2"

/area/shuttle/escape/centcom
	name = "废弃紧急穿梭机 中央司令部"
	icon_state = "shuttle"

/area/shuttle/escape/transit // the area to pass through for 3 minute transit
	name = "废弃紧急穿梭机转运区"
	icon_state = "shuttle"

/area/shuttle/escape_pod1
	name = "逃生舱一号"

/area/shuttle/escape_pod1/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod1/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod1/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod2
	name = "逃生舱二号"

/area/shuttle/escape_pod2/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod2/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod2/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod3
	name = "逃生舱三号"

/area/shuttle/escape_pod3/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod3/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod3/transit
	icon_state = "shuttle"

/area/shuttle/escape_pod5 //Pod 4 was lost to meteors
	name = "逃生舱五号"

/area/shuttle/escape_pod5/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod5/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod5/transit
	icon_state = "shuttle"

/area/shuttle/mining
	name = "废弃采矿穿梭机"

/area/shuttle/mining/station
	icon_state = "shuttle2"

/area/shuttle/mining/outpost
	icon_state = "shuttle"

/area/shuttle/transport1/centcom
	icon_state = "shuttle"
	name = "废弃运输穿梭机 中央司令部"

/area/shuttle/transport1/station
	icon_state = "shuttle"
	name = "废弃运输穿梭机"


/area/shuttle/prison/
	name = "废弃监狱穿梭机"


/area/shuttle/prison/station
	icon_state = "shuttle"


/area/shuttle/prison/prison
	icon_state = "shuttle2"


/area/shuttle/specops/centcom
	name = "废弃特种作战穿梭机"
	icon_state = "shuttlered"


/area/shuttle/specops/station
	name = "废弃特种作战穿梭机"
	icon_state = "shuttlered2"


/area/shuttle/syndicate_elite/mothership
	name = "废弃的辛迪加精英穿梭机"
	icon_state = "shuttlered"


/area/shuttle/syndicate_elite/station
	name = "废弃的辛迪加精英穿梭机"
	icon_state = "shuttlered2"


/area/shuttle/administration/centcom
	name = "废弃的中央司令部穿梭机"
	icon_state = "shuttlered"


/area/shuttle/administration/station
	name = "废弃行政穿梭机"
	icon_state = "shuttlered2"


/area/shuttle/thunderdome
	name = "鸣"


/area/shuttle/thunderdome/grnshuttle
	name = "废弃雷神竞技场绿色穿梭机"
	icon_state = "green"


/area/shuttle/thunderdome/grnshuttle/dome
	name = "废弃的GRN穿梭机"
	icon_state = "shuttlegrn"


/area/shuttle/thunderdome/grnshuttle/station
	name = "废弃的GRN空间站"
	icon_state = "shuttlegrn2"


/area/shuttle/thunderdome/redshuttle
	name = "废弃雷神竞技场红色穿梭机"
	icon_state = "red"


/area/shuttle/thunderdome/redshuttle/dome
	name = "废弃的红色穿梭机"
	icon_state = "shuttlered"


/area/shuttle/thunderdome/redshuttle/station
	name = "废弃的红色空间站"
	icon_state = "shuttlered2"


/area/shuttle/vox/station
	name = "废弃的沃克斯跳帮船"
	icon_state = "yellow"
	requires_power = 0


/area/start            // will be unused once kurper gets his login interface patch done
	name = "起始区域"
	icon_state = "start"
	requires_power = 0
	static_lighting = FALSE
	base_lighting_alpha = 255

/area/testroom
	requires_power = FALSE
	// Mobs should be able to see inside the testroom
	static_lighting = FALSE
	base_lighting_alpha = 255
	name = "测试房间"
	icon_state = "test_room"


/area/syndicate_mothership
	name = "废弃的辛迪加基地"
	icon_state = "syndie-ship"
	requires_power = 0


/area/syndicate_mothership/control
	name = "废弃的辛迪加控制室"
	icon_state = "syndie-control"


/area/syndicate_mothership/elite_squad
	name = "被遗弃的辛迪加精英小队"
	icon_state = "syndie-elite"


/area/asteroid
	name = "废弃小行星"
	icon_state = "asteroid"
	requires_power = 0


/area/asteroid/cave
	name = "废弃小行星 - 地下"
	icon_state = "cave"
	requires_power = 0
	minimap_color = MINIMAP_AREA_CAVES


/area/asteroid/artifactroom
	name = "废弃小行星 - 遗迹"
	icon_state = "cave"


/area/tdome
	name = "废弃的雷霆穹顶"
	icon_state = "thunder"
	requires_power = FALSE
	base_lighting_alpha = 255



/area/tdome/tdome1
	name = "废弃雷霆穹顶（队伍1）"
	icon_state = "green"


/area/tdome/tdome2
	name = "废弃的雷霆穹顶（第二队）"
	icon_state = "yellow"


/area/tdome/tdomeadmin
	name = "废弃的雷霆穹顶（管理员。）"
	icon_state = "purple"


/area/tdome/tdomeobserve
	name = "废弃的雷霆穹顶（观察者。）"
	icon_state = "purple"


/area/deathmatch
	name = "回合结束死亡竞技场"
	icon_state = "green"
	base_lighting_alpha = 255

	requires_power = 0


/area/syndicate_station
	name = "废弃的辛迪加空间站"
	icon_state = "yellow"
	requires_power = 0

/area/syndicate_station/start
	name = "废弃的辛迪加前线作战基地"
	icon_state = "yellow"

/area/syndicate_station/southwest
	name = "废弃于太空站13西南方向"
	icon_state = "southwest"

/area/syndicate_station/northwest
	name = "SS13西北方向废弃"
	icon_state = "northwest"

/area/syndicate_station/northeast
	name = "SS13东北方向废弃"
	icon_state = "northeast"

/area/syndicate_station/southeast
	name = "废弃于太空站13东南方向"
	icon_state = "southeast"

/area/syndicate_station/north
	name = "SS13 以北已废弃"
	icon_state = "north"

/area/syndicate_station/south
	name = "SS13以南的废弃区域"
	icon_state = "south"

/area/syndicate_station/commssat
	name = "通讯卫星以南的废弃区域"
	icon_state = "south"

/area/syndicate_station/mining
	name = "废弃于采矿小行星东北部"
	icon_state = "north"

/area/syndicate_station/transit
	name = "废弃超空间"
	icon_state = "shuttle"

/area/wizard_station
	name = "废弃巫师巢穴"
	icon_state = "yellow"
	requires_power = 0

/area/vox_station/transit
	name = "废弃的超空间"
	icon_state = "shuttle"
	requires_power = 0

/area/vox_station/southwest_solars
	name = "废弃的左舷后部太阳能阵列"
	icon_state = "southwest"
	requires_power = 0

/area/vox_station/northwest_solars
	name = "废弃前部左舷太阳能阵列"
	icon_state = "northwest"
	requires_power = 0

/area/vox_station/northeast_solars
	name = "废弃前右舷太阳能板"
	icon_state = "northeast"
	requires_power = 0

/area/vox_station/southeast_solars
	name = "废弃的右舷后部太阳能阵列"
	icon_state = "southeast"
	requires_power = 0

/area/vox_station/mining
	name = "废弃的附近采矿小行星"
	icon_state = "north"
	requires_power = 0


//Maintenance

/area/maintenance/aft
	name = "后部维护区"
	icon_state = "amaint"

/area/maintenance/fore
	name = "前部维护区"
	icon_state = "fmaint"

/area/maintenance/starboard
	name = "右舷维护区"
	icon_state = "smaint"

/area/maintenance/port
	name = "港口维护"
	icon_state = "pmaint"

/area/maintenance/atmos_control
	name = "大气维护区"
	icon_state = "fpmaint"

/area/maintenance/fpmaint
	name = "前部左舷维护区 - 1"
	icon_state = "fpmaint"

/area/maintenance/fpmaint2
	name = "前部左舷维护区 - 2"
	icon_state = "fpmaint"

/area/maintenance/fsmaint
	name = "前部右舷维护区 - 1"
	icon_state = "fsmaint"

/area/maintenance/fsmaint2
	name = "前部右舷维护区 - 2"
	icon_state = "fsmaint"

/area/maintenance/asmaint
	name = "后部右舷维护区"
	icon_state = "asmaint"

/area/maintenance/engi_shuttle
	name = "工程穿梭机权限"
	icon_state = "maint_e_shuttle"

/area/maintenance/engi_engine
	name = "引擎维护"
	icon_state = "maint_engine"

/area/maintenance/asmaint2
	name = "科学部维护区"
	icon_state = "asmaint"

/area/maintenance/apmaint
	name = "货物维护区"
	icon_state = "apmaint"

/area/maintenance/maintcentral
	name = "舰桥维护"
	icon_state = "maintcentral"

/area/maintenance/arrivals
	name = "抵达区维护间"
	icon_state = "maint_arrivals"

/area/maintenance/bar
	name = "酒吧维护"
	icon_state = "maint_bar"

/area/maintenance/cargo
	name = "货物维护区"
	icon_state = "maint_cargo"

/area/maintenance/disposal
	name = "废物处理"
	icon_state = "disposal"

/area/maintenance/engineering
	name = "工程维护"
	icon_state = "maint_engineering"

/area/maintenance/evahallway
	name = "废弃的舱外活动维护区"
	icon_state = "maint_eva"

/area/maintenance/dormitory
	name = "宿舍区维护"
	icon_state = "maint_dormitory"

/area/maintenance/incinerator
	name = "废弃焚化炉"
	icon_state = "disposal"

/area/maintenance/locker
	name = "更衣室维护"
	icon_state = "maint_locker"

/area/maintenance/medbay
	name = "医疗舱维护区"
	icon_state = "maint_medbay"

/area/maintenance/research_port
	name = "港口研究维护区"
	icon_state = "maint_research_port"

/area/maintenance/research_starboard
	name = "右舷研究维护区"
	icon_state = "maint_research_starboard"

/area/maintenance/research_shuttle
	name = "研究穿梭机停靠维护"
	icon_state = "maint_research_shuttle"

/area/maintenance/security_port
	name = "港口安保维护"
	icon_state = "maint_security_port"

/area/maintenance/security_starboard
	name = "右舷安保维护区"
	icon_state = "maint_security_starboard"

/area/maintenance/storage
	name = "大气系统"
	icon_state = "green"

// SUBSTATIONS (Subtype of maint, that should let them serve as shielded area during radstorm)


/area/maintenance/substation
	name = "变电站"
	icon_state = "substation"

/area/maintenance/substation/engineering // Probably will be connected to engineering SMES room, as wires cannot be crossed properly without them sharing powernets.
	name = "工程分电站"

/area/maintenance/substation/medical_science // Medbay and Science. Each has it's own separated machinery, but it originates from the same room.
	name = "医学研究分站"

/area/maintenance/substation/civilian_east // Bar, kitchen, dorms, ...
	name = "东区民用变电站"

/area/maintenance/substation/civilian_west // Cargo, PTS, locker room, probably arrivals, ...)
	name = "民用西区变电站"

/area/maintenance/substation/command // AI and central cluster. This one will be between HoP office and meeting room (probably).
	name = "指挥分站"

/area/maintenance/substation/security // Security, Brig, Permabrig, etc.
	name = "安全子站"




//Hallway

/area/hallway/primary/fore
	name = "废弃前部主走廊"
	icon_state = "hallF"

/area/hallway/primary/starboard
	name = "废弃右舷主走廊"
	icon_state = "hallS"

/area/hallway/primary/aft
	name = "废弃后部主走廊"
	icon_state = "hallA"

/area/hallway/primary/port
	name = "废弃港口主走廊"
	icon_state = "hallP"

/area/hallway/primary/central_one
	name = "废弃中央主走廊"
	icon_state = "hallC1"
	ambience = list('sound/ambience/signal.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg')

/area/hallway/primary/central_two
	name = "废弃中央主走廊"
	icon_state = "hallC2"

/area/hallway/primary/central_three
	name = "废弃中央主走廊"
	icon_state = "hallC3"

/area/hallway/secondary/exit
	name = "废弃逃生穿梭机走廊"
	icon_state = "escape"

/area/hallway/secondary/construction
	name = "废弃施工区"
	icon_state = "construction"

/area/hallway/secondary/entry
	name = "废弃抵达区穿梭机走廊"
	icon_state = "entry"

//Command

/area/bridge
	name = "废弃桥梁"
	icon_state = "bridge"

/area/bridge/meeting_room
	name = "废弃的部门主管会议室"
	icon_state = "bridge"


/area/crew_quarters/captain
	name = "废弃的舰长办公室"
	icon_state = "captain"

/area/crew_quarters/heads/hop
	name = "废弃的人事主管办公室"
	icon_state = "head_quarters"

/area/crew_quarters/heads/hor
	name = "废弃的研究主管办公室"
	icon_state = "head_quarters"

/area/crew_quarters/heads/chief
	name = "废弃的首席工程师办公室"
	icon_state = "head_quarters"

/area/crew_quarters/heads/hos
	name = "废弃的安保主管办公室"
	icon_state = "head_quarters"

/area/crew_quarters/heads/cmo
	name = "废弃的首席医疗官办公室"
	icon_state = "head_quarters"

/area/crew_quarters/courtroom
	name = "废弃法庭"
	icon_state = "courtroom"

/area/mint
	name = "废弃铸币厂"
	icon_state = "green"

/area/comms
	name = "废弃通讯中继站"
	icon_state = "tcomsatcham"

/area/server
	name = "废弃通讯服务器室"
	icon_state = "server"

//Crew

/area/crew_quarters
	name = "废弃宿舍区"
	icon_state = "Sleep"

/area/crew_quarters/toilet
	name = "废弃宿舍厕所"
	icon_state = "toilet"

/area/crew_quarters/sleep
	name = "废弃宿舍区"
	icon_state = "Sleep"

/area/crew_quarters/sleep/engi
	name = "废弃工程宿舍区"
	icon_state = "Sleep"

/area/crew_quarters/sleep/engi_wash
	name = "废弃工程部盥洗室"
	icon_state = "toilet"

/area/crew_quarters/sleep/sec
	name = "废弃安保宿舍区"
	icon_state = "Sleep"

/area/crew_quarters/sleep/bedrooms
	name = "废弃宿舍卧室"
	icon_state = "Sleep"

/area/crew_quarters/sleep/cryo
	name = "废弃低温储存室"
	icon_state = "Sleep"

/area/crew_quarters/sleep_male
	name = "废弃男性宿舍"
	icon_state = "Sleep"
/*
/area/crew_quarters/sleep_male/toilet_male
	name = "废弃男厕"
	icon_state = "toilet"

/area/crew_quarters/sleep_female
	name = "废弃女性宿舍"
	icon_state = "Sleep"

/area/crew_quarters/sleep_female/toilet_female
	name = "废弃女厕"
	icon_state = "toilet"
*/
/area/crew_quarters/locker
	name = "废弃更衣室"
	icon_state = "locker"

/area/crew_quarters/locker/locker_toilet
	name = "废弃的储物柜厕所"
	icon_state = "toilet"

/area/crew_quarters/fitness
	name = "废弃健身房"
	icon_state = "fitness"

/area/crew_quarters/cafeteria
	name = "废弃食堂"
	icon_state = "cafeteria"

/area/crew_quarters/kitchen
	name = "废弃厨房"
	icon_state = "kitchen"

/area/crew_quarters/bar
	name = "废弃酒吧"
	icon_state = "bar"

/area/crew_quarters/theatre
	name = "废弃剧院"
	icon_state = "Theatre"

/area/library
	name = "废弃图书馆"
	icon_state = "library"

/area/chapel/main
	name = "废弃教堂"
	icon_state = "chapel"
	ambience = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg')

/area/chapel/office
	name = "废弃小教堂办公室"
	icon_state = "chapeloffice"

/area/lawoffice
	name = "废弃的内部事务部"
	icon_state = "law"







/area/holodeck
	name = "废弃的全息甲板"
	icon_state = "Holodeck"
	static_lighting = FALSE
	base_lighting_alpha = 255
	always_unpowered = TRUE

/area/holodeck/alphadeck
	name = "废弃的全息甲板阿尔法"

/area/holodeck/source_plating
	name = "废弃全息甲板 - 关闭"
	icon_state = "Holodeck"

/area/holodeck/source_emptycourt
	name = "废弃全息甲板 - 空置球场"

/area/holodeck/source_boxingcourt
	name = "废弃全息甲板 - 拳击场"

/area/holodeck/source_basketball
	name = "废弃全息甲板 - 篮球场"

/area/holodeck/source_thunderdomecourt
	name = "废弃全息甲板 - 雷霆穹顶法庭"

/area/holodeck/source_beach
	name = "废弃全息甲板 - 海滩"
	icon_state = "Holodeck" // Lazy.

/area/holodeck/source_burntest
	name = "废弃全息甲板 - 大气燃烧测试"

/area/holodeck/source_wildlife
	name = "废弃全息甲板 - 野生动物模拟"

/area/holodeck/source_meetinghall
	name = "废弃全息甲板 - 会议厅"

/area/holodeck/source_theatre
	name = "废弃全息甲板 - 剧院"

/area/holodeck/source_picnicarea
	name = "废弃全息甲板 - 野餐区"

/area/holodeck/source_snowfield
	name = "废弃全息甲板 - 雪原"

/area/holodeck/source_desert
	name = "废弃全息甲板 - 沙漠"

/area/holodeck/source_space
	name = "废弃全息甲板 - 太空"


/area/maintenance/auxsolarport
	name = "前部左舷太阳能维护区"
	icon_state = "SolarcontrolP"

/area/maintenance/starboardsolar
	name = "后部右舷太阳能维护区"
	icon_state = "SolarcontrolS"

/area/maintenance/portsolar
	name = "后部左舷太阳能维护区"
	icon_state = "SolarcontrolP"

/area/maintenance/auxsolarstarboard
	name = "前部右舷太阳能维护区"
	icon_state = "SolarcontrolS"

/area/maintenance/foresolar
	name = "前部太阳能维护区"
	icon_state = "SolarcontrolA"

/area/assembly/chargebay
	name = "废弃机甲库"
	icon_state = "mechbay"

/area/assembly/showroom
	name = "废弃机器人展厅"
	icon_state = "showroom"

/area/assembly/robotics
	name = "废弃机器人实验室"
	icon_state = "ass_line"

/area/assembly/assembly_line //Derelict Assembly Line
	name = "废弃装配线"
	icon_state = "ass_line"
	power_equip = 0
	power_light = 0
	power_environ = 0

//Teleporter

/area/teleporter
	name = "废弃传送器"
	icon_state = "teleporter"


/area/gateway
	name = "废弃的星门"
	icon_state = "teleporter"


/area/AIsattele
	name = "废弃AI卫星传送室"
	icon_state = "teleporter"

	ambience = list('sound/ambience/ambimalf.ogg')

//MedBay
/area/medical
	minimap_color = MINIMAP_AREA_MEDBAY

/area/medical/medbay
	name = "废弃医疗站"
	icon_state = "medbay"


//Medbay is a large area, these additional areas help level out APC load.
/area/medical/medbay2
	name = "废弃医疗站"
	icon_state = "medbay2"


/area/medical/medbay3
	name = "废弃医疗站"
	icon_state = "medbay3"


/area/medical/biostorage
	name = "废弃次级仓库"
	icon_state = "medbay2"


/area/medical/reception
	name = "废弃医疗站接待处"
	icon_state = "medbay"


/area/medical/psych
	name = "废弃心理室"
	icon_state = "medbay3"


/area/crew_quarters/medbreak
	name = "废弃休息室"
	icon_state = "medbay3"


/area/medical/patients_rooms
	name = "废弃病房"
	icon_state = "patients"

/area/medical/ward
	name = "废弃回收病房"
	icon_state = "patients"

/area/medical/patient_a
	name = "废弃隔离区A"
	icon_state = "patients"

/area/medical/patient_b
	name = "废弃隔离区B"
	icon_state = "patients"

/area/medical/patient_c
	name = "废弃隔离区C"
	icon_state = "patients"

/area/medical/patient_wing
	name = "废弃病患区"
	icon_state = "patients"

/area/medical/cmostore
	name = "废弃安全储存室"
	icon_state = "CMO"

/area/medical/robotics
	name = "废弃机器人学"
	icon_state = "medresearch"

/area/medical/virology
	name = "废弃病毒实验室"
	icon_state = "virology"

/area/medical/virologyaccess
	name = "废弃病毒学通道"
	icon_state = "virology"

/area/medical/morgue
	name = "废弃停尸间"
	icon_state = "morgue"
	ambience = list('sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg')

/area/medical/chemistry
	name = "废弃化学实验室"
	icon_state = "chem"

/area/medical/surgery
	name = "废弃手术室 1"
	icon_state = "surgery"

/area/medical/surgery2
	name = "废弃手术室 2"
	icon_state = "surgery"

/area/medical/surgeryobs
	name = "废弃作战观察室"
	icon_state = "surgery"

/area/medical/surgeryprep
	name = "废弃术前准备室"
	icon_state = "surgery"

/area/medical/cryo
	name = "废弃低温休眠舱"
	icon_state = "cryo"

/area/medical/exam_room
	name = "废弃检查室"
	icon_state = "exam_room"

/area/medical/genetics
	name = "废弃遗传学实验室"
	icon_state = "genetics"

/area/medical/genetics_cloning
	name = "废弃克隆实验室"
	icon_state = "cloning"

/area/medical/sleeper
	name = "废弃急救中心"
	icon_state = "exam_room"

//Security
/area/security
	minimap_color = MINIMAP_AREA_SEC

/area/security/main
	name = "废弃安保办公室"
	icon_state = "security"

/area/security/lobby
	name = "废弃的安保大厅"
	icon_state = "security"

/area/security/brig
	name = "废弃的禁闭室"
	icon_state = "brig"

/area/security/prison
	name = "废弃监狱区"
	icon_state = "sec_prison"


/area/security/warden
	name = "废弃典狱长"
	icon_state = "Warden"

/area/security/armoury
	name = "废弃军械库"
	icon_state = "Warden"

/area/security/detectives_office
	name = "废弃侦探事务所"
	icon_state = "detective"

/area/security/range
	name = "废弃射击场"
	icon_state = "firingrange"

/area/security/tactical
	name = "废弃战术装备"
	icon_state = "Tactical"

/area/security/nuke_storage
	name = "废弃金库"
	icon_state = "nuke_storage"

/area/security/checkpoint
	name = "废弃安全检查站"
	icon_state = "checkpoint1"

/area/security/checkpoint2
	name = "废弃安检站"
	icon_state = "security"

/area/security/checkpoint/supply
	name = "安全哨站 - 货舱"
	icon_state = "checkpoint1"

/area/security/checkpoint/engineering
	name = "工程安全哨站"
	icon_state = "checkpoint1"

/area/security/checkpoint/medical
	name = "医疗区 - 安全哨站"
	icon_state = "checkpoint1"

/area/security/checkpoint/science
	name = "科研区 - 安全哨站"
	icon_state = "checkpoint1"

/area/security/vacantoffice
	name = "废弃空置办公室"
	icon_state = "security"

/area/security/vacantoffice2
	name = "废弃空置办公室"
	icon_state = "security"

/area/quartermaster
	name = "废弃的补给站"
	icon_state = "quart"

///////////WORK IN PROGRESS//////////

/area/quartermaster/sorting
	name = "废弃的快递办公室"
	icon_state = "quartstorage"

////////////WORK IN PROGRESS//////////

/area/quartermaster/office
	name = "废弃的货运办公室"
	icon_state = "quartoffice"

/area/quartermaster/storage
	name = "废弃货舱"
	icon_state = "quartstorage"

/area/quartermaster/qm
	name = "废弃的补给官办公室"
	icon_state = "quart"

/area/quartermaster/miningdock
	name = "废弃采矿码头"
	icon_state = "mining"

/area/quartermaster/miningstorage
	name = "废弃采矿仓库"
	icon_state = "green"

/area/quartermaster/mechbay
	name = "废弃机甲库"
	icon_state = "yellow"

/area/janitor/
	name = "废弃的保洁间"
	icon_state = "janitor"

/area/hydroponics
	name = "废弃水培区"
	icon_state = "hydro"

/area/hydroponics/garden
	name = "废弃花园"
	icon_state = "garden"

//rnd (Research and Development
/area/rnd
	minimap_color = MINIMAP_AREA_RESEARCH

/area/rnd/research
	name = "废弃研发部"
	icon_state = "research"

/area/rnd/docking
	name = "废弃研究码头"
	icon_state = "research_dock"

/area/rnd/lab
	name = "废弃研究实验室"
	icon_state = "toxlab"

/area/rnd/rdoffice
	name = "废弃的研究主管办公室"
	icon_state = "head_quarters"

/area/rnd/supermatter
	name = "废弃超物质实验室"
	icon_state = "toxlab"

/area/rnd/xenobiology
	name = "废弃异形生物学实验室"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/xenoflora_storage
	name = "废弃异形植物储存室"
	icon_state = "xeno_f_store"

/area/rnd/xenobiology/xenoflora
	name = "废弃异形植物实验室"
	icon_state = "xeno_f_lab"

/area/rnd/storage
	name = "废弃毒素储存室"
	icon_state = "toxstorage"

/area/rnd/test_area
	name = "废弃毒素测试区"
	icon_state = "toxtest"

/area/rnd/mixing
	name = "废弃毒素混合室"
	icon_state = "toxmix"

/area/rnd/misc_lab
	name = "废弃杂项研究"
	icon_state = "toxmisc"

/area/toxins/server
	name = "废弃服务器机房"
	icon_state = "server"

//Storage

/area/storage/tools
	name = "辅助工具储存柜"
	icon_state = "storage"

/area/storage/primary
	name = "主要工具储存区"
	icon_state = "primarystorage"

/area/storage/autolathe
	name = "自动制造机存储"
	icon_state = "storage"

/area/storage/art
	name = "美术用品储藏室"
	icon_state = "storage"

/area/storage/auxillary
	name = "辅助存储"
	icon_state = "auxstorage"

/area/storage/eva
	name = "EVA 存储"
	icon_state = "eva"

/area/storage/secure
	name = "安全储物室"
	icon_state = "storage"

/area/storage/emergency
	name = "右舷应急储物舱"
	icon_state = "emergencystorage"

/area/storage/emergency2
	name = "港口应急储存室"
	icon_state = "emergencystorage"

/area/storage/emergency3
	name = "中央应急物资库"
	icon_state = "emergencystorage"

/area/storage/tech
	name = "技术存储区"
	icon_state = "auxstorage"

/area/storage/testroom
	requires_power = 0
	name = "废弃测试室"
	icon_state = "storage"
	area_flags = NO_DROPPOD


//DJSTATION

/area/djstation
	name = "废弃监听站"
	icon_state = "LP"

/area/djstation/solars
	name = "废弃监听站太阳能板"
	icon_state = "LPS"


//Construction

/area/construction
	name = "废弃施工区"
	icon_state = "yellow"

/area/construction/supplyshuttle
	name = "废弃补给穿梭机"
	icon_state = "yellow"

/area/construction/quarters
	name = "废弃工程师宿舍"
	icon_state = "yellow"

/area/construction/qmaint
	name = "维护"
	icon_state = "yellow"

/area/construction/hallway
	name = "废弃走廊"
	icon_state = "yellow"

/area/construction/solars
	name = "废弃的太阳能板"
	icon_state = "yellow"

/area/construction/solarscontrol
	name = "废弃太阳能电池板控制台"
	icon_state = "yellow"

/area/construction/Storage
	name = "施工场地储物区"
	icon_state = "yellow"

//AI

/area/ai_monitored/storage/eva
	name = "EVA 存储"
	icon_state = "eva"

/area/ai_monitored/storage/secure
	name = "安全储物室"
	icon_state = "storage"

/area/ai_monitored/storage/emergency
	name = "应急储物柜"
	icon_state = "storage"

/area/turret_protected/ai_upload
	name = "废弃的AI上传室"
	icon_state = "ai_upload"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/turret_protected/ai_upload_foyer
	name = "AI上传访问"
	icon_state = "ai_foyer"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/turret_protected/ai_server_room
	name = "AI服务器室"
	icon_state = "ai_server"

/area/turret_protected/ai
	name = "废弃AI舱室"
	icon_state = "ai_chamber"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/turret_protected/ai_cyborg_station
	name = "废弃的赛博格空间站"
	icon_state = "ai_cyborg"

/area/turret_protected/aisat
	name = "废弃AI卫星"
	icon_state = "ai"

/area/sensor_tower_1
	name = "传感器塔1"
	icon_state = "sensor"

/area/sensor_tower_2
	name = "传感器塔2"
	icon_state = "sensor"
