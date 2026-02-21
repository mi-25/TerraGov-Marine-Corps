/datum/map_template/modular
	name = "通用模块化模板"
	mappath = "_maps/modularmaps"
	should_place_on_top = FALSE
	///ID of this map template
	var/modular_id = "none"
	///Number for its height, used for sanity
	var/template_height = 0
	///Number for its width, used for sanity
	var/template_width = 0
	///Bool for whether we want to to be spawning from the middle or to the topright of the spawner (true is centered)
	var/keepcentered = FALSE
	//minimum player number for a modular map template to be added to the list of potential modular map spawns.
	var/min_player_num
	//maximum player number for a modular map template to be added to the list of potential modular map spawns.
	var/max_player_num

	//FOR MIN AND MAX PLAYER COUNTS TO WORK YOUR MODULAR MAP MUST HAVE BOTH FIELDS, MAPS WITH UNINITIALIZED MIN/MAX VALUES OR WITH JUST ONE OF EITHER VAR WILL ENTER THE MODULAR LIST REGARDLESS OF POP

/datum/map_template/modular/prison
	mappath = "_maps/modularmaps/prison"

/datum/map_template/modular/prison/civresbeach
	name = "南滩民用居住区"
	mappath = "_maps/modularmaps/prison/civresbeach.dmm"
	modular_id = "southcivres"
	template_width = 9
	template_height = 11

/datum/map_template/modular/prison/civrespool
	name = "南池平民区"
	mappath = "_maps/modularmaps/prison/civresgym.dmm"
	modular_id = "southcivres"
	template_width = 9
	template_height = 11

/datum/map_template/modular/prison
	mappath = "_maps/modularmaps/lv624"

/datum/map_template/modular/lv624/hydro_path
	name = "氢能道路"
	mappath = "_maps/modularmaps/lv624/hydro_path.dmm"
	modular_id = "hydroroad"
	template_width = 20
	template_height = 20

/datum/map_template/modular/lv624/hydro_jungle
	name = "水循环维护通道"
	mappath = "_maps/modularmaps/lv624/hydro_jungle.dmm"
	modular_id = "hydroroad"
	template_width = 20
	template_height = 20

/datum/map_template/modular/lv624/lakebase
	name = "LV湖"
	mappath = "_maps/modularmaps/lv624/lakebase.dmm"
	modular_id = "lvcaveslakearea"
	template_width = 80
	template_height = 33
	min_player_num = 60
	max_player_num = INFINITY

/datum/map_template/modular/lv624/cavemapone
	name = "LV 洞穴一号"
	mappath = "_maps/modularmaps/lv624/newcavevar1.dmm"
	modular_id = "lvcaveslakearea"
	template_width = 80
	template_height = 33

/datum/map_template/modular/lv624/cavemaptwo
	name = "LV 洞穴二"
	mappath = "_maps/modularmaps/lv624/newcavevar2.dmm"
	modular_id = "lvcaveslakearea"
	template_width = 80
	template_height = 33

/datum/map_template/modular/lv624/cavemapthree
	name = "LV 洞穴三"
	mappath = "_maps/modularmaps/lv624/newcavevar3.dmm"
	modular_id = "lvcaveslakearea"
	template_width = 80
	template_height = 33
	min_player_num = 0
	max_player_num = 45

/datum/map_template/modular/lv624/cavemapfour
	name = "LV 洞穴四"
	mappath = "_maps/modularmaps/lv624/newcavevar4.dmm"
	modular_id = "lvcaveslakearea"
	template_width = 80
	template_height = 33

/datum/map_template/modular/lv624/cavemapfive
	name = "LV 洞穴五"
	mappath = "_maps/modularmaps/lv624/newcavevar5.dmm"
	modular_id = "lvcaveslakearea"
	template_width = 80
	template_height = 33

/datum/map_template/modular/lv624/cavemapsix
	name = "LV 洞穴六号"
	mappath = "_maps/modularmaps/lv624/newcavevar6.dmm"
	modular_id = "lvcaveslakearea"
	template_width = 80
	template_height = 33

/datum/map_template/modular/lv624/cavemapseven
	name = "LV 洞穴七号"
	mappath = "_maps/modularmaps/lv624/newcavevar7.dmm"
	modular_id = "lvcaveslakearea"
	template_width = 80
	template_height = 33

/datum/map_template/modular/lv624/cavemapeight
	name = "LV 洞穴八"
	mappath = "_maps/modularmaps/lv624/newcavevar8.dmm"
	modular_id = "lvcaveslakearea"
	template_width = 80
	template_height = 33

/datum/map_template/modular/lv624/cavemapnine
	name = "LV 洞穴九"
	mappath = "_maps/modularmaps/lv624/newcavevar9.dmm"
	modular_id = "lvcaveslakearea"
	template_width = 80
	template_height = 33

/datum/map_template/modular/lv624/cavemapten
	name = "LV 洞穴十"
	mappath = "_maps/modularmaps/lv624/newcavevar10.dmm"
	modular_id = "lvcaveslakearea"
	template_width = 80
	template_height = 33

/datum/map_template/modular/lv624/cavemapeleven
	name = "LV 洞穴十一"
	mappath = "_maps/modularmaps/lv624/newcavevar11.dmm"
	modular_id = "lvcaveslakearea"
	template_width = 80
	template_height = 33

/datum/map_template/modular/lv624/cavemaptwelve
	mappath = "_maps/modularmaps/lv624/newcavevar12.dmm"
	modular_id = "lvcaveslakearea"
	template_width = 80
	template_height = 33
	min_player_num = 65
	max_player_num = INFINITY

/datum/map_template/modular/lv624/medicaldomeone
	name = "医疗穹顶一号"
	mappath = "_maps/modularmaps/lv624/medbayone.dmm"
	modular_id = "lvmedicaldome"
	template_width = 15
	template_height = 15
	keepcentered = TRUE

/datum/map_template/modular/lv624/medicaldometwo
	name = "医疗穹顶二"
	mappath = "_maps/modularmaps/lv624/medbaytwo.dmm"
	modular_id = "lvmedicaldome"
	template_width = 15
	template_height = 15
	keepcentered = TRUE

/datum/map_template/modular/lv624/lvhydrobridgeone
	name = "LV 水培桥一号"
	mappath = "_maps/modularmaps/lv624/lvhydrobridge1.dmm"
	modular_id = "lvhydrobridge"
	template_width = 8
	template_height = 10

/datum/map_template/modular/lv624/lvhydrobridgetwo
	name = "LV 水培桥二号"
	mappath = "_maps/modularmaps/lv624/lvhydrobridge2.dmm"
	modular_id = "lvhydrobridge"
	template_width = 8
	template_height = 10

/datum/map_template/modular/lv624/lvhydrobridgethree
	name = "LV 水培桥三号"
	mappath = "_maps/modularmaps/lv624/lvhydrobridge3.dmm"
	modular_id = "lvhydrobridge"
	template_width = 8
	template_height = 10

/datum/map_template/modular/lv624/lvhydrobridgefour
	name = "LV 水培桥四号"
	mappath = "_maps/modularmaps/lv624/lvhydrobridge4.dmm"
	modular_id = "lvhydrobridge"
	template_width = 8
	template_height = 10

/datum/map_template/modular/lv624/southsandtempleone
	name = "LV 南沙神庙一号"
	mappath = "_maps/modularmaps/lv624/southsandtemple1.dmm"
	modular_id = "lvsouthsandtemple"
	template_width = 22
	template_height = 24

/datum/map_template/modular/lv624/southsandtempletwo
	name = "LV 南部沙庙 二"
	mappath = "_maps/modularmaps/lv624/southsandtemple2.dmm"
	modular_id = "lvsouthsandtemple"
	template_width = 22
	template_height = 24

/datum/map_template/modular/lv624/southsandtemplethree
	name = "LV 南部沙庙三号"
	mappath = "_maps/modularmaps/lv624/southsandtemple3.dmm"
	modular_id = "lvsouthsandtemple"
	template_width = 22
	template_height = 24

/datum/map_template/modular/lv624/southsandtemplefour
	name = "LV 南部沙庙四号"
	mappath = "_maps/modularmaps/lv624/southsandtemple4.dmm"
	modular_id = "lvsouthsandtemple"
	template_width = 22
	template_height = 24

/datum/map_template/modular/lv624/dome_atmos
	name = "LV大气穹顶"
	mappath = "_maps/modularmaps/lv624/atmospherics.dmm"
	modular_id = "lvdome"
	template_width = 15
	template_height = 15
	keepcentered = TRUE

/datum/map_template/modular/lv624/dome_robotics
	name = "LV 机器人穹顶"
	mappath = "_maps/modularmaps/lv624/robotics.dmm"
	modular_id = "lvdome"
	template_width = 15
	template_height = 15
	keepcentered = TRUE

/datum/map_template/modular/lv624/dome_telecomms
	name = "LV 电信穹顶"
	mappath = "_maps/modularmaps/lv624/telecomms.dmm"
	modular_id = "lvdome"
	template_width = 15
	template_height = 15
	keepcentered = TRUE

/datum/map_template/modular/lv624/dome_cargo_bay
	name = "LV 货舱穹顶"
	mappath = "_maps/modularmaps/lv624/cargo_bay.dmm"
	modular_id = "lvdome"
	template_width = 15
	template_height = 15
	keepcentered = TRUE

/datum/map_template/modular/lv624/dome_cargo_bay_two
	name = "LV 货舱穹顶"
	mappath = "_maps/modularmaps/lv624/cargo_bay2.dmm"
	modular_id = "lvdome"
	template_width = 15
	template_height = 15
	keepcentered = TRUE

/datum/map_template/modular/lv624/dome_internal_affairs
	name = "LV 内部事务穹顶"
	mappath = "_maps/modularmaps/lv624/internal_affairs.dmm"
	modular_id = "lvdome"
	template_width = 15
	template_height = 15
	keepcentered = TRUE

/datum/map_template/modular/lv624/dome_internal_affairs
	name = "LV 辅助植物园穹顶"
	mappath = "_maps/modularmaps/lv624/auxbotany.dmm"
	modular_id = "lvdome"
	template_width = 15
	template_height = 15
	keepcentered = TRUE

/datum/map_template/modular/bigred/eastone
	name = "东侧大型红色洞穴"
	mappath = "_maps/modularmaps/big_red/bigredcavevar1.dmm"
	modular_id = "breastcaves"
	template_width = 66
	template_height = 42

/datum/map_template/modular/bigred/easttwo
	name = "东侧大型红色洞穴"
	mappath = "_maps/modularmaps/big_red/bigredcavevar2.dmm"
	modular_id = "breastcaves"
	template_width = 66
	template_height = 42

/datum/map_template/modular/bigred/eastthree
	name = "东侧大型红色洞穴"
	mappath = "_maps/modularmaps/big_red/bigredcavevar3.dmm"
	modular_id = "breastcaves"
	template_width = 66
	template_height = 42

/datum/map_template/modular/bigred/eastfour
	name = "东侧大型红色洞穴"
	mappath = "_maps/modularmaps/big_red/bigredcavevar4.dmm"
	modular_id = "breastcaves"
	template_width = 66
	template_height = 42

/datum/map_template/modular/bigred/eastfive
	name = "东侧大型红色洞穴"
	mappath = "_maps/modularmaps/big_red/bigredcavevar5.dmm"
	modular_id = "breastcaves"
	template_width = 66
	template_height = 42

/datum/map_template/modular/bigred/cargoentryone
	name = "大型红色货物入口"
	mappath = "_maps/modularmaps/big_red/bigredcargoentryvar1.dmm"
	modular_id = "brcargoentry"
	template_width = 3
	template_height = 5

/datum/map_template/modular/bigred/cargoentrytwo
	name = "大型红色货物区"
	mappath = "_maps/modularmaps/big_red/bigredcargoentryvar2.dmm"
	modular_id = "brcargoentry"
	template_width = 3
	template_height = 5

/datum/map_template/modular/bigred/cargoentrythree
	name = "大型红色货物区"
	mappath = "_maps/modularmaps/big_red/bigredcargoentryvar3.dmm"
	modular_id = "brcargoentry"
	template_width = 3
	template_height = 5

/datum/map_template/modular/bigred/cargoareaone
	name = "大型红色货物区"
	mappath = "_maps/modularmaps/big_red/bigredcargoareavar1.dmm"
	modular_id = "brcargoarea"
	template_width = 54
	template_height = 22

/datum/map_template/modular/bigred/cargoareatwo
	name = "大型红色货舱区"
	mappath = "_maps/modularmaps/big_red/bigredcargoareavar2.dmm"
	modular_id = "brcargoarea"
	template_width = 54
	template_height = 22

/datum/map_template/modular/bigred/cargoareathree
	name = "大型红色货物区"
	mappath = "_maps/modularmaps/big_red/bigredcargoareavar3.dmm"
	modular_id = "brcargoarea"
	template_width = 54
	template_height = 22

/datum/map_template/modular/bigred/cargoareafour
	name = "大型红色货物区"
	mappath = "_maps/modularmaps/big_red/bigredcargoareavar4.dmm"
	modular_id = "brcargoarea"
	template_width = 54
	template_height = 22


/datum/map_template/modular/bigred/cargoareafive
	name = "大型红色货物区"
	mappath = "_maps/modularmaps/big_red/bigredcargoareavar5.dmm"
	modular_id = "brcargoarea"
	template_width = 54
	template_height = 22

/datum/map_template/modular/bigred/cargoareasix
	name = "大型红色货物区"
	mappath = "_maps/modularmaps/big_red/bigredcargoareavar6.dmm"
	modular_id = "brcargoarea"
	template_width = 54
	template_height = 22

/datum/map_template/modular/bigred/cargoareaseven
	name = "大型红色货物区"
	mappath = "_maps/modularmaps/big_red/bigredcargoareavar7.dmm"
	modular_id = "brcargoarea"
	template_width = 54
	template_height = 22

/datum/map_template/modular/bigred/cargoareaeight
	name = "大型红色货舱区"
	mappath = "_maps/modularmaps/big_red/bigredcargoareavar8.dmm"
	modular_id = "brcargoarea"
	template_width = 54
	template_height = 22

/datum/map_template/modular/bigred/chapelone
	name = "大红教堂"
	mappath = "_maps/modularmaps/big_red/bigredchapelvar1.dmm"
	modular_id = "brchapel"
	template_width = 18
	template_height = 9

/datum/map_template/modular/bigred/chapeltwo
	name = "大红教堂"
	mappath = "_maps/modularmaps/big_red/bigredchapelvar2.dmm"
	modular_id = "brchapel"
	template_width = 18
	template_height = 9

/datum/map_template/modular/bigred/medbayone
	name = "大型红色医疗舱"
	mappath = "_maps/modularmaps/big_red/bigredmedbayvar1.dmm"
	modular_id = "brmedbay"
	template_width = 33
	template_height = 26

/datum/map_template/modular/bigred/medbaytwo
	name = "大型红色医疗舱"
	mappath = "_maps/modularmaps/big_red/bigredmedbayvar2.dmm"
	modular_id = "brmedbay"
	template_width = 33
	template_height = 26

/datum/map_template/modular/bigred/medbaythree
	name = "大型红色医疗舱"
	mappath = "_maps/modularmaps/big_red/bigredmedbayvar3.dmm"
	modular_id = "brmedbay"
	template_width = 33
	template_height = 26

/datum/map_template/modular/bigred/medbayfour
	name = "大型红色医疗舱"
	mappath = "_maps/modularmaps/big_red/bigredmedbayvar4.dmm"
	modular_id = "brmedbay"
	template_width = 33
	template_height = 26

/datum/map_template/modular/bigred/medbayfive
	name = "大型红色医疗舱"
	mappath = "_maps/modularmaps/big_red/bigredmedbayvar5.dmm"
	modular_id = "brmedbay"
	template_width = 33
	template_height = 26

/datum/map_template/modular/bigred/medbaysix
	name = "大型红色医疗舱"
	mappath = "_maps/modularmaps/big_red/bigredmedbayvar6.dmm"
	modular_id = "brmedbay"
	template_width = 33
	template_height = 26

/datum/map_template/modular/bigred/medbayseven
	name = "大型红色医疗舱"
	mappath = "_maps/modularmaps/big_red/bigredmedbayvar7.dmm"
	modular_id = "brmedbay"
	template_width = 33
	template_height = 26

/datum/map_template/modular/bigred/officeone
	name = "红色大办公室"
	mappath = "_maps/modularmaps/big_red/bigredofficevar1.dmm"
	modular_id = "broffice"
	template_width = 28
	template_height = 23

/datum/map_template/modular/bigred/officetwo
	name = "红色大办公室"
	mappath = "_maps/modularmaps/big_red/bigredofficevar2.dmm"
	modular_id = "broffice"
	template_width = 28
	template_height = 23

/datum/map_template/modular/bigred/officethree
	name = "红色大办公室"
	mappath = "_maps/modularmaps/big_red/bigredofficevar3.dmm"
	modular_id = "broffice"
	template_width = 28
	template_height = 23

/datum/map_template/modular/bigred/atmosone
	name = "大气警报"
	mappath = "_maps/modularmaps/big_red/bigredatmosvar1.dmm"
	modular_id = "bratmos"
	template_width = 24
	template_height = 25

/datum/map_template/modular/bigred/atmostwo
	name = "大气警报"
	mappath = "_maps/modularmaps/big_red/bigredatmosvar2.dmm"
	modular_id = "bratmos"
	template_width = 24
	template_height = 25

/datum/map_template/modular/bigred/atmosthree
	name = "大气警报"
	mappath = "_maps/modularmaps/big_red/bigredatmosvar3.dmm"
	modular_id = "bratmos"
	template_width = 24
	template_height = 25

/datum/map_template/modular/bigred/atmosfour
	name = "大气警报"
	mappath = "_maps/modularmaps/big_red/bigredatmosvar4.dmm"
	modular_id = "bratmos"
	template_width = 24
	template_height = 25

/datum/map_template/modular/bigred/atmosfive
	name = "大气警报"
	mappath = "_maps/modularmaps/big_red/bigredatmosvar5.dmm"
	modular_id = "bratmos"
	template_width = 24
	template_height = 25

/datum/map_template/modular/bigred/atmossix
	name = "大气警报"
	mappath = "_maps/modularmaps/big_red/bigredatmosvar6.dmm"
	modular_id = "bratmos"
	template_width = 24
	template_height = 25

/datum/map_template/modular/bigred/cargoone
	name = "大型红色货舱"
	mappath = "_maps/modularmaps/big_red/bigredcargovar1.dmm"
	modular_id = "brcargo"
	template_width = 19
	template_height = 19

/datum/map_template/modular/bigred/cargotwo
	name = "大型红色货舱"
	mappath = "_maps/modularmaps/big_red/bigredcargovar2.dmm"
	modular_id = "brcargo"
	template_width = 19
	template_height = 19

/datum/map_template/modular/bigred/engione
	name = "大型红色工程区"
	mappath = "_maps/modularmaps/big_red/bigredengineeringvar1.dmm"
	modular_id = "brengineering"
	template_width = 30
	template_height = 27

/datum/map_template/modular/bigred/engitwo
	name = "大型红色工程区"
	mappath = "_maps/modularmaps/big_red/bigredengineeringvar2.dmm"
	modular_id = "brengineering"
	template_width = 30
	template_height = 27

/datum/map_template/modular/bigred/engithree
	name = "大型红色工程区"
	mappath = "_maps/modularmaps/big_red/bigredengineeringvar3.dmm"
	modular_id = "brengineering"
	template_width = 30
	template_height = 27

/datum/map_template/modular/bigred/engifour
	name = "大型红色工程区"
	mappath = "_maps/modularmaps/big_red/bigredengineeringvar4.dmm"
	modular_id = "brengineering"
	template_width = 30
	template_height = 27

/datum/map_template/modular/bigred/etaone
	name = "大红倒计时"
	mappath = "_maps/modularmaps/big_red/bigredetavar1.dmm"
	modular_id = "breta"
	template_width = 26
	template_height = 24

/datum/map_template/modular/bigred/etatwo
	name = "大红倒计时"
	mappath = "_maps/modularmaps/big_red/bigredetavar2.dmm"
	modular_id = "breta"
	template_width = 26
	template_height = 24

/datum/map_template/modular/bigred/etathree
	name = "大红倒计时"
	mappath = "_maps/modularmaps/big_red/bigredetavar3.dmm"
	modular_id = "breta"
	template_width = 26
	template_height = 24

/datum/map_template/modular/bigred/etafour
	name = "大红倒计时"
	mappath = "_maps/modularmaps/big_red/bigredetavar4.dmm"
	modular_id = "breta"
	template_width = 26
	template_height = 24

/datum/map_template/modular/bigred/etafive
	name = "大红倒计时"
	mappath = "_maps/modularmaps/big_red/bigredetavar5.dmm"
	modular_id = "breta"
	template_width = 26
	template_height = 24

/datum/map_template/modular/bigred/medbaypassageone
	name = "大型红色医疗区通道"
	mappath = "_maps/modularmaps/big_red/bigredmedbaypassagevar1.dmm"
	modular_id = "brmedbaypassage"
	template_width = 6
	template_height = 3

/datum/map_template/modular/bigred/medbaypassagetwo
	name = "大型红色医疗区通道"
	mappath = "_maps/modularmaps/big_red/bigredmedbaypassagevar2.dmm"
	modular_id = "brmedbaypassage"
	template_width = 6
	template_height = 3

/datum/map_template/modular/bigred/dormsone
	name = "大型红色宿舍"
	mappath = "_maps/modularmaps/big_red/bigreddormvar1.dmm"
	modular_id = "brdorms"
	template_width = 19
	template_height = 7

/datum/map_template/modular/bigred/dormstwo
	name = "大型红色宿舍区"
	mappath = "_maps/modularmaps/big_red/bigreddormvar2.dmm"
	modular_id = "brdorms"
	template_width = 19
	template_height = 7

/datum/map_template/modular/bigred/lambdatunnelnorthone
	name = "大红λ洞穴"
	mappath = "_maps/modularmaps/big_red/bigrednorthlambdavar1.dmm"
	modular_id = "brlambdatunnelnorth"
	template_width = 65
	template_height = 32

/datum/map_template/modular/bigred/lambdatunnelnorthtwo
	name = "大红λ洞穴"
	mappath = "_maps/modularmaps/big_red/bigrednorthlambdavar2.dmm"
	modular_id = "brlambdatunnelnorth"
	template_width = 65
	template_height = 32

/datum/map_template/modular/bigred/lambdatunnelnorththree
	name = "大红λ洞穴"
	mappath = "_maps/modularmaps/big_red/bigrednorthlambdavar3.dmm"
	modular_id = "brlambdatunnelnorth"
	template_width = 65
	template_height = 32

/datum/map_template/modular/bigred/lambdatunnelnorthfour
	name = "大红λ洞穴"
	mappath = "_maps/modularmaps/big_red/bigrednorthlambdavar4.dmm"
	modular_id = "brlambdatunnelnorth"
	template_width = 65
	template_height = 32

/datum/map_template/modular/bigred/lambdatunnelnorthfive
	name = "大红λ洞穴"
	mappath = "_maps/modularmaps/big_red/bigrednorthlambdavar5.dmm"
	modular_id = "brlambdatunnelnorth"
	template_width = 65
	template_height = 32

/datum/map_template/modular/bigred/lambdatunnelnorthsix
	name = "大红λ洞穴"
	mappath = "_maps/modularmaps/big_red/bigrednorthlambdavar6.dmm"
	modular_id = "brlambdatunnelnorth"
	template_width = 65
	template_height = 32

/datum/map_template/modular/bigred/lambdatunneltwo
	name = "大红λ洞穴"
	mappath = "_maps/modularmaps/big_red/bigredlambdatunnelvar2.dmm"
	modular_id = "brlambdatunnel"
	template_width = 25
	template_height = 6

/datum/map_template/modular/bigred/lambdacavesone
	name = "大型红色λ隧道"
	mappath = "_maps/modularmaps/big_red/bigredlambdacave1.dmm"
	modular_id = "brlambdacave"
	template_width = 15
	template_height = 15

/datum/map_template/modular/bigred/lambdatunnelsouthone
	name = "大型红色λ隧道"
	mappath = "_maps/modularmaps/big_red/bigredlambdatunnelsouthvar1.dmm"
	modular_id = "brlambdatunnelsouth"
	template_width = 22
	template_height = 11

/datum/map_template/modular/bigred/lambdatunnelsouthtwo
	name = "大型红色λ隧道"
	mappath = "_maps/modularmaps/big_red/bigredlambdatunnelsouthvar2.dmm"
	modular_id = "brlambdatunnelsouth"
	template_width = 22
	template_height = 11

/datum/map_template/modular/bigred/lambdatunnelsouththree
	name = "大型红色λ隧道"
	mappath = "_maps/modularmaps/big_red/bigredlambdatunnelsouthvar3.dmm"
	modular_id = "brlambdatunnelsouth"
	template_width = 22
	template_height = 11

/datum/map_template/modular/bigred/lambdatunnelsouthfour
	name = "大型红色λ隧道"
	mappath = "_maps/modularmaps/big_red/bigredlambdatunnelsouthvar4.dmm"
	modular_id = "brlambdatunnelsouth"
	template_width = 22
	template_height = 11

/datum/map_template/modular/bigred/checkpointsouthone
	name = "南侧大型红色检查点"
	mappath = "_maps/modularmaps/big_red/bigredcheckpointsouthvar1.dmm"
	modular_id = "brcheckpointsouth"
	template_width = 12
	template_height = 10

/datum/map_template/modular/bigred/checkpointsouthtwo
	name = "南侧大型红色检查点"
	mappath = "_maps/modularmaps/big_red/bigredcheckpointsouthvar2.dmm"
	modular_id = "brcheckpointsouth"
	template_width = 12
	template_height = 10

/datum/map_template/modular/bigred/checkpointsouththree
	name = "南侧大型红色检查点"
	mappath = "_maps/modularmaps/big_red/bigredcheckpointsouthvar3.dmm"
	modular_id = "brcheckpointsouth"
	template_width = 12
	template_height = 10

/datum/map_template/modular/bigred/westetaone
	name = "西南方向大红点预计到达时间"
	mappath = "_maps/modularmaps/big_red/bigredsouthwestetavar1.dmm"
	modular_id = "brsouthwesteta"
	template_width = 61
	template_height = 38

/datum/map_template/modular/bigred/westetatwo
	name = "西南方向大红点预计到达时间"
	mappath = "_maps/modularmaps/big_red/bigredsouthwestetavar2.dmm"
	modular_id = "brsouthwesteta"
	template_width = 61
	template_height = 38

/datum/map_template/modular/bigred/westetathree
	name = "西南方向大红点预计到达时间"
	mappath = "_maps/modularmaps/big_red/bigredsouthwestetavar3.dmm"
	modular_id = "brsouthwesteta"
	template_width = 61
	template_height = 38

/datum/map_template/modular/bigred/westetafour
	name = "西南方向大红点预计到达时间"
	mappath = "_maps/modularmaps/big_red/bigredsouthwestetavar4.dmm"
	modular_id = "brsouthwesteta"
	template_width = 61
	template_height = 38

/datum/map_template/modular/bigred/westetafive
	name = "西南方向大红点预计到达时间"
	mappath = "_maps/modularmaps/big_red/bigredsouthwestetavar5.dmm"
	modular_id = "brsouthwesteta"
	template_width = 61
	template_height = 38

/datum/map_template/modular/bigred/southetaone
	name = "西南方向大红点预计到达时间"
	mappath = "_maps/modularmaps/big_red/bigredsouthetavar1.dmm"
	modular_id = "brsoutheta"
	template_width = 23
	template_height = 10

/datum/map_template/modular/bigred/southetatwo
	name = "西南方向大红点预计到达时间"
	mappath = "_maps/modularmaps/big_red/bigredsouthetavar2.dmm"
	modular_id = "brsoutheta"
	template_width = 23
	template_height = 10

/datum/map_template/modular/bigred/southetathree
	name = "西南方向大红点预计到达时间"
	mappath = "_maps/modularmaps/big_red/bigredsouthetavar3.dmm"
	modular_id = "brsoutheta"
	template_width = 23
	template_height = 10

/datum/map_template/modular/bigred/southetafour
	name = "西南方向大红点预计到达时间"
	mappath = "_maps/modularmaps/big_red/bigredsouthetavar4.dmm"
	modular_id = "brsoutheta"
	template_width = 23
	template_height = 10

/datum/map_template/modular/bigred/southetafive
	name = "西南方向大红点预计到达时间"
	mappath = "_maps/modularmaps/big_red/bigredsouthetavar5.dmm"
	modular_id = "brsoutheta"
	template_width = 23
	template_height = 10

/datum/map_template/modular/bigred/checkpointone
	name = "大型红色检查站"
	mappath = "_maps/modularmaps/big_red/bigredcheckpointvar1.dmm"
	modular_id = "brcheckpoint"
	template_width = 4
	template_height = 4

/datum/map_template/modular/bigred/checkpointtwo
	name = "大型红色检查站"
	mappath = "_maps/modularmaps/big_red/bigredcheckpointvar2.dmm"
	modular_id = "brcheckpoint"
	template_width = 4
	template_height = 4

/datum/map_template/modular/bigred/libraryone
	name = "大型红色图书馆"
	mappath = "_maps/modularmaps/big_red/bigredlibraryvar1.dmm"
	modular_id = "brlibrary"
	template_width = 11
	template_height = 18

/datum/map_template/modular/bigred/librarytwo
	name = "大型红色图书馆"
	mappath = "_maps/modularmaps/big_red/bigredlibraryvar2.dmm"
	modular_id = "brlibrary"
	template_width = 11
	template_height = 18

/datum/map_template/modular/bigred/librarythree
	name = "大型红色图书馆"
	mappath = "_maps/modularmaps/big_red/bigredlibraryvar3.dmm"
	modular_id = "brlibrary"
	template_width = 11
	template_height = 18

/datum/map_template/modular/bigred/lambdatunnelsouththree
	name = "大型红色λ隧道"
	mappath = "_maps/modularmaps/big_red/bigredlambdatunnelsouthvar3.dmm"
	modular_id = "brlambdatunnelsouth"
	template_width = 22
	template_height = 11

/datum/map_template/modular/bigred/lambdatunnelone
	name = "大型红色λ隧道"
	mappath = "_maps/modularmaps/big_red/bigredlambdatunnelvar1.dmm"
	modular_id = "brlambdatunnel"
	template_width = 25
	template_height = 6

/datum/map_template/modular/bigred/lambdacavestwo
	name = "大型红色宿舍区"
	mappath = "_maps/modularmaps/big_red/bigredlambdacave2.dmm"
	modular_id = "brlambdacave"
	template_width = 15
	template_height = 15

/datum/map_template/modular/bigred/secornerone
	name = "东南方向的大型红色洞穴"
	mappath = "_maps/modularmaps/big_red/bigredsecornervar1.dmm"
	modular_id = "brsecorner"
	template_width = 71
	template_height = 67

/datum/map_template/modular/bigred/secornertwo
	name = "东南方向的大型红色洞穴"
	mappath = "_maps/modularmaps/big_red/bigredsecornervar2.dmm"
	modular_id = "brsecorner"
	template_width = 71
	template_height = 67

/datum/map_template/modular/bigred/secornerthree
	name = "东南方向大型红色洞穴"
	mappath = "_maps/modularmaps/big_red/bigredsecornervar3.dmm"
	modular_id = "brsecorner"
	template_width = 71
	template_height = 67

/datum/map_template/modular/bigred/secornerfour
	name = "东南方向的大型红色洞穴"
	mappath = "_maps/modularmaps/big_red/bigredsecornervar4.dmm"
	modular_id = "brsecorner"
	template_width = 71
	template_height = 67

/datum/map_template/modular/bigred/secornerfive
	name = "东南方向大型红色洞穴"
	mappath = "_maps/modularmaps/big_red/bigredsecornervar5.dmm"
	modular_id = "brsecorner"
	template_width = 71
	template_height = 67

/datum/map_template/modular/bigred/secornersix
	name = "东南方向大型红色洞穴"
	mappath = "_maps/modularmaps/big_red/bigredsecornervar6.dmm"
	modular_id = "brsecorner"
	template_width = 71
	template_height = 67

/datum/map_template/modular/bigred/secornerseven
	name = "东南方向的大型红色洞穴"
	mappath = "_maps/modularmaps/big_red/bigredsecornervar7.dmm"
	modular_id = "brsecorner"
	template_width = 71
	template_height = 67

/datum/map_template/modular/bigred/toolshedone
	name = "大型红色工具棚"
	mappath = "_maps/modularmaps/big_red/bigredtoolshedvar1.dmm"
	modular_id = "brtoolshed"
	template_width = 16
	template_height = 9

/datum/map_template/modular/bigred/toolshedtwo
	name = "大型红色工具棚"
	mappath = "_maps/modularmaps/big_red/bigredtoolshedvar2.dmm"
	modular_id = "brtoolshed"
	template_width = 16
	template_height = 9

/datum/map_template/modular/bigred/toolshedthree
	name = "大型红色工具棚"
	mappath = "_maps/modularmaps/big_red/bigredtoolshedvar3.dmm"
	modular_id = "brtoolshed"
	template_width = 16
	template_height = 9

/datum/map_template/modular/bigred/toolshedfour
	name = "大型红色工具棚"
	mappath = "_maps/modularmaps/big_red/bigredtoolshedvar4.dmm"
	modular_id = "brtoolshed"
	template_width = 16
	template_height = 9


/datum/map_template/modular/bigred/toolshedfive
	name = "大型红色工具棚"
	mappath = "_maps/modularmaps/big_red/bigredtoolshedvar5.dmm"
	modular_id = "brtoolshed"
	template_width = 16
	template_height = 9

/datum/map_template/modular/bigred/southwestcornerone
	name = "西南角红色大区域"
	mappath = "_maps/modularmaps/big_red/bigredcaveswvar1.dmm"
	modular_id = "brswcorner"
	template_width = 41
	template_height = 43

/datum/map_template/modular/bigred/southwestcornertwo
	name = "西南角红色大区域"
	mappath = "_maps/modularmaps/big_red/bigredcaveswvar2.dmm"
	modular_id = "brswcorner"
	template_width = 41
	template_height = 43

/datum/map_template/modular/bigred/southwestcornerthree
	name = "西南角红色大区域"
	mappath = "_maps/modularmaps/big_red/bigredcaveswvar3.dmm"
	modular_id = "brswcorner"
	template_width = 41
	template_height = 43

/datum/map_template/modular/bigred/southwestcornerfour
	name = "西南角红色大区域"
	mappath = "_maps/modularmaps/big_red/bigredcaveswvar4.dmm"
	modular_id = "brswcorner"
	template_width = 41
	template_height = 43

/datum/map_template/modular/bigred/southwestcornerfive
	name = "西南角红色大区域"
	mappath = "_maps/modularmaps/big_red/bigredcaveswvar5.dmm"
	modular_id = "brswcorner"
	template_width = 41
	template_height = 43

/datum/map_template/modular/bigred/lambdalockone
	name = "大型红色封锁闸门"
	mappath = "_maps/modularmaps/big_red/bigreddoor1.dmm"
	modular_id = "brlambdalock"
	template_width = 1
	template_height = 2
	min_player_num = 45
	max_player_num = INFINITY

/datum/map_template/modular/bigred/lambdalocktwo
	name = "大型红色封锁闸门"
	mappath = "_maps/modularmaps/big_red/bigreddoor2.dmm"
	modular_id = "brlambdalock"
	template_width = 1
	template_height = 2

/datum/map_template/modular/bigred/lambdalockthree
	name = "大型红色封锁闸门"
	mappath = "_maps/modularmaps/big_red/bigreddoor3.dmm"
	modular_id = "brlambdalock"
	template_width = 1
	template_height = 2
	min_player_num = 45
	max_player_num = INFINITY

/datum/map_template/modular/bigred/lambdalockfour
	name = "大型红色封锁闸门"
	mappath = "_maps/modularmaps/big_red/bigreddoor4.dmm"
	modular_id = "brlambdalock"
	template_width = 1
	template_height = 2

/datum/map_template/modular/bigred/generalstoreone
	name = "大红总店"
	mappath = "_maps/modularmaps/big_red/bigredgeneralstorevar1.dmm"
	modular_id = "brgeneral"
	template_width = 31
	template_height = 14

/datum/map_template/modular/bigred/generalstoretwo
	name = "大红百货商店"
	mappath = "_maps/modularmaps/big_red/bigredgeneralstorevar2.dmm"
	modular_id = "brgeneral"
	template_width = 31
	template_height = 14

/datum/map_template/modular/bigred/sweastone
	name = "大红杂货铺"
	mappath = "_maps/modularmaps/big_red/bigredsweastcornervar1.dmm"
	modular_id = "brsweast"
	template_width = 44
	template_height = 22

/datum/map_template/modular/bigred/sweasttwo
	name = "大红杂货铺"
	mappath = "_maps/modularmaps/big_red/bigredsweastcornervar2.dmm"
	modular_id = "brsweast"
	template_width = 44
	template_height = 22

/datum/map_template/modular/bigred/sweastthree
	name = "大红百货商店"
	mappath = "_maps/modularmaps/big_red/bigredsweastcornervar3.dmm"
	modular_id = "brsweast"
	template_width = 44
	template_height = 22

/datum/map_template/modular/bigred/sweastfour
	name = "大红杂货铺"
	mappath = "_maps/modularmaps/big_red/bigredsweastcornervar4.dmm"
	modular_id = "brsweast"
	template_width = 44
	template_height = 22

/datum/map_template/modular/bigred/sweastfive
	name = "大红杂货铺"
	mappath = "_maps/modularmaps/big_red/bigredsweastcornervar5.dmm"
	modular_id = "brsweast"
	template_width = 44
	template_height = 22

/datum/map_template/modular/bigred/barracks
	name = "大型红色兵营"
	mappath = "_maps/modularmaps/big_red/barracks.dmm"
	modular_id = "broperations"
	template_width = 29
	template_height = 24

/datum/map_template/modular/bigred/operations
	name = "大型红色管理"
	mappath = "_maps/modularmaps/big_red/operation.dmm"
	modular_id = "broperations"
	template_width = 29
	template_height = 24

/datum/map_template/modular/oscaroutposttopone
	name = "奥斯卡前哨站地图上半部分"
	mappath = "_maps/modularmaps/oscaroutpost/oscarnorthvar1.dmm"
	modular_id = "oscartop"
	template_width = 150
	template_height = 153

/datum/map_template/modular/oscaroutposttoptwo
	name = "奥斯卡前哨站地图上半部分"
	mappath = "_maps/modularmaps/oscaroutpost/oscarnorthvar2.dmm"
	modular_id = "oscartop"
	template_width = 150
	template_height = 153

/datum/map_template/modular/oscaroutposttopthree
	mappath = "_maps/modularmaps/oscaroutpost/oscarnorthvar3.dmm"
	modular_id = "oscartop"
	template_width = 150
	template_height = 153

/datum/map_template/modular/oscaroutposttopfour
	mappath = "_maps/modularmaps/oscaroutpost/oscarnorthvar4.dmm"
	modular_id = "oscartop"
	template_width = 150
	template_height = 153

/datum/map_template/modular/oscaroutzetabaseone
	name = "奥斯卡前哨站废弃基地"
	mappath = "_maps/modularmaps/oscaroutpost/oscarsouthvar1.dmm"
	modular_id = "oscarbase"
	template_width = 79
	template_height = 29

/datum/map_template/modular/oscaroutzetabasetwo
	name = "奥斯卡前哨站废弃基地"
	mappath = "_maps/modularmaps/oscaroutpost/oscarsouthvar2.dmm"
	modular_id = "oscarbase"
	template_width = 79
	template_height = 29

/datum/map_template/modular/oscaroutzetabasethree
	name = "奥斯卡前哨站废弃基地"
	mappath = "_maps/modularmaps/oscaroutpost/oscarsouthvar3.dmm"
	modular_id = "oscarbase"
	template_width = 79
	template_height = 29

/datum/map_template/modular/oscaroutzetabasefour
	name = "奥斯卡前哨站废弃基地"
	mappath = "_maps/modularmaps/oscaroutpost/oscarsouthvar4.dmm"
	modular_id = "oscarbase"
	template_width = 79
	template_height = 29

/datum/map_template/modular/oscaroutzetabasefive
	name = "奥斯卡前哨站废弃基地"
	mappath = "_maps/modularmaps/oscaroutpost/oscarsouthvar5.dmm"
	modular_id = "oscarbase"
	template_width = 79
	template_height = 29

/datum/map_template/modular/oscaroutzetabasesix
	name = "奥斯卡前哨站废弃基地"
	mappath = "_maps/modularmaps/oscaroutpost/oscarsouthvar6.dmm"
	modular_id = "oscarbase"
	template_width = 79
	template_height = 29

/datum/map_template/modular/oscaroutzetabaseseven
	name = "奥斯卡前哨站废弃基地"
	mappath = "_maps/modularmaps/oscaroutpost/oscarsouthvar7.dmm"
	modular_id = "oscarbase"
	template_width = 79
	template_height = 29

/datum/map_template/modular/end_of_round/original
	name = "游戏结束"
	mappath = "_maps/modularmaps/EORG/original.dmm"
	modular_id = "EORG"
	template_width = 46
	template_height = 46

/datum/map_template/modular/end_of_round/de_dust2
	name = "沙城2"
	mappath = "_maps/modularmaps/EORG/de_dust2.dmm"
	modular_id = "EORG"
	template_width = 46
	template_height = 46

/datum/map_template/modular/end_of_round/old
	name = "旧版EORG"
	mappath = "_maps/modularmaps/EORG/old.dmm"
	modular_id = "EORG"
	template_width = 46
	template_height = 46

/datum/map_template/modular/end_of_round/basketball
	name = "篮球场"
	mappath = "_maps/modularmaps/EORG/basketball.dmm"
	modular_id = "EORG"
	template_width = 46
	template_height = 46

/datum/map_template/modular/end_of_round/cs_mansion
	name = "豪宅"
	mappath = "_maps/modularmaps/EORG/cs_mansion.dmm"
	modular_id = "EORG"
	template_width = 46
	template_height = 46

/datum/map_template/modular/end_of_round/cs_militia
	name = "殖民地民兵"
	mappath = "_maps/modularmaps/EORG/cs_militia.dmm"
	modular_id = "EORG"
	template_width = 46
	template_height = 46

/datum/map_template/modular/end_of_round/cs_office
	name = "指挥室"
	mappath = "_maps/modularmaps/EORG/cs_office.dmm"
	modular_id = "EORG"
	template_width = 46
	template_height = 46

/datum/map_template/modular/end_of_round/de_inferno
	name = "地狱火"
	mappath = "_maps/modularmaps/EORG/de_inferno.dmm"
	modular_id = "EORG"
	template_width = 46
	template_height = 46

/datum/map_template/modular/end_of_round/de_nuke
	name = "核弹"
	mappath = "_maps/modularmaps/EORG/de_nuke.dmm"
	modular_id = "EORG"
	template_width = 46
	template_height = 46

/datum/map_template/modular/jungle_outpost/westtowerone
	name = "西部穹顶"
	mappath = "_maps/modularmaps/jungle_outpost/joutpostwtower1.dmm"
	modular_id = "jowesttower"
	template_width = 12
	template_height = 14

/datum/map_template/modular/jungle_outpost/westtowertwo
	name = "西部圆顶区"
	mappath = "_maps/modularmaps/jungle_outpost/joutpostwtower2.dmm"
	modular_id = "jowesttower"
	template_width = 12
	template_height = 14

/datum/map_template/modular/jungle_outpost/westtowerthree
	name = "西部平房"
	mappath = "_maps/modularmaps/jungle_outpost/joutpostwtower3.dmm"
	modular_id = "jowesttower"
	template_width = 12
	template_height = 14

/datum/map_template/modular/jungle_outpost/westtowerfour
	name = "西部池塘"
	mappath = "_maps/modularmaps/jungle_outpost/joutpostwtower4.dmm"
	modular_id = "jowesttower"
	template_width = 12
	template_height = 14

/datum/map_template/modular/jungle_outpost/southcratesone
	name = "南侧板条箱"
	mappath = "_maps/modularmaps/jungle_outpost/joutpostscrates1.dmm"
	modular_id = "josouthcrates"
	template_width = 12
	template_height = 14

/datum/map_template/modular/jungle_outpost/southcratestwo
	name = "南侧办公室"
	mappath = "_maps/modularmaps/jungle_outpost/joutpostscrates2.dmm"
	modular_id = "josouthcrates"
	template_width = 12
	template_height = 14

/datum/map_template/modular/jungle_outpost/southcratesthree
	name = "南侧板条箱"
	mappath = "_maps/modularmaps/jungle_outpost/joutpostscrates3.dmm"
	modular_id = "josouthcrates"
	template_width = 12
	template_height = 14

/datum/map_template/modular/jungle_outpost/southcratesfour
	name = "南侧车库"
	mappath = "_maps/modularmaps/jungle_outpost/joutpostscrates4.dmm"
	modular_id = "josouthcrates"
	template_width = 12
	template_height = 14

/datum/map_template/modular/jungle_outpost/hydroponicsone
	name = "水培"
	mappath = "_maps/modularmaps/jungle_outpost/joutposthydro1.dmm"
	modular_id = "johydroponics"
	template_width = 19
	template_height = 18

/datum/map_template/modular/jungle_outpost/hydroponicstwo
	name = "水培"
	mappath = "_maps/modularmaps/jungle_outpost/joutposthydro2.dmm"
	modular_id = "johydroponics"
	template_width = 19
	template_height = 18

/datum/map_template/modular/jungle_outpost/hydroponicsthree
	name = "水培小屋"
	mappath = "_maps/modularmaps/jungle_outpost/joutposthydro3.dmm"
	modular_id = "johydroponics"
	template_width = 19
	template_height = 18

/datum/map_template/modular/jungle_outpost/medicalone
	name = "医疗"
	mappath = "_maps/modularmaps/jungle_outpost/joutpostmedbay1.dmm"
	modular_id = "jomedbay"
	template_width = 16
	template_height = 24

/datum/map_template/modular/jungle_outpost/medicaltwo
	name = "医疗"
	mappath = "_maps/modularmaps/jungle_outpost/joutpostmedbay2.dmm"
	modular_id = "jomedbay"
	template_width = 16
	template_height = 24

/datum/map_template/modular/jungle_outpost/medicalthree
	name = "户外医疗"
	mappath = "_maps/modularmaps/jungle_outpost/joutpostmedbay3.dmm"
	modular_id = "jomedbay"
	template_width = 16
	template_height = 24

/datum/map_template/modular/jungle_outpost/engineeringone
	name = "工程部"
	mappath = "_maps/modularmaps/jungle_outpost/joutpostengi1.dmm"
	modular_id = "joengineering"
	template_width = 21
	template_height = 21

/datum/map_template/modular/jungle_outpost/engineeringtwo
	name = "工程部"
	mappath = "_maps/modularmaps/jungle_outpost/joutpostengi2.dmm"
	modular_id = "joengineering"
	template_width = 21
	template_height = 21

/datum/map_template/modular/jungle_outpost/engineeringthree
	name = "户外工程"
	mappath = "_maps/modularmaps/jungle_outpost/joutpostengi3.dmm"
	modular_id = "joengineering"
	template_width = 21
	template_height = 21

/datum/map_template/modular/corsat/bigreddome
	name = "西格玛穹顶"
	mappath = "_maps/modularmaps/corsatdome/corsatdomebigred.dmm"
	modular_id = "corsatdome"
	template_width = 80
	template_height = 80
	keepcentered = TRUE

/datum/map_template/modular/corsat/lvdome
	name = "西格玛穹顶"
	mappath = "_maps/modularmaps/corsatdome/corsatdomelv.dmm"
	modular_id = "corsatdome"
	template_width = 80
	template_height = 80
	keepcentered = TRUE

/datum/map_template/modular/corsat/icecolonydome
	name = "西格玛穹顶"
	mappath = "_maps/modularmaps/corsatdome/corsatdomeicecolony.dmm"
	modular_id = "corsatdome"
	template_width = 80
	template_height = 80
	keepcentered = TRUE

/datum/map_template/modular/fiorina/shipone
	name = "拾荒者飞船"
	mappath = "_maps/modularmaps/fiorina/scavshipvar1.dmm"
	modular_id = "scavship"
	template_width = 14
	template_height = 21

/datum/map_template/modular/fiorina/shiptwo
	name = "拾荒船"
	mappath = "_maps/modularmaps/fiorina/scavshipvar1.dmm"
	modular_id = "scavship"
	template_width = 14
	template_height = 21

/datum/map_template/modular/fiorina/medbayone
	name = "医疗舱"
	mappath = "_maps/modularmaps/fiorina/medicalvar1.dmm"
	modular_id = "fimedbay"
	template_width = 14
	template_height = 18

/datum/map_template/modular/fiorina/medbaytwo
	name = "医疗舱"
	mappath = "_maps/modularmaps/fiorina/medicalvar2.dmm"
	modular_id = "fimedbay"
	template_width = 14
	template_height = 18

/datum/map_template/modular/fiorina/wardenone
	name = "典狱长"
	mappath = "_maps/modularmaps/fiorina/wardenofficevar1.dmm"
	modular_id = "fiwarden"
	template_width = 9
	template_height = 7

/datum/map_template/modular/fiorina/wardentwo
	name = "典狱长"
	mappath = "_maps/modularmaps/fiorina/wardenofficevar2.dmm"
	modular_id = "fiwarden"
	template_width = 9
	template_height = 7

/datum/map_template/modular/fiorina/kitchenone
	name = "厨房"
	mappath = "_maps/modularmaps/fiorina/pizzavar1.dmm"
	modular_id = "fikitchen"
	template_width = 9
	template_height = 10

/datum/map_template/modular/fiorina/kitchentwo
	name = "厨房"
	mappath = "_maps/modularmaps/fiorina/pizzavar2.dmm"
	modular_id = "fikitchen"
	template_width = 9
	template_height = 10

/datum/map_template/modular/fiorina/gearone
	name = "装备"
	mappath = "_maps/modularmaps/fiorina/gearvar1.dmm"
	modular_id = "figear"
	template_width = 9
	template_height = 8

/datum/map_template/modular/fiorina/geartwo
	name = "装备"
	mappath = "_maps/modularmaps/fiorina/gearvar2.dmm"
	modular_id = "figear"
	template_width = 9
	template_height = 8

/datum/map_template/modular/fiorina/panelone
	name = "面板"
	mappath = "_maps/modularmaps/fiorina/panelsvarone.dmm"
	modular_id = "fipanel"
	template_width = 13
	template_height = 9

/datum/map_template/modular/fiorina/paneltwo
	name = "面板"
	mappath = "_maps/modularmaps/fiorina/panelsvartwo.dmm"
	modular_id = "fipanel"
	template_width = 13
	template_height = 9

/datum/map_template/modular/fiorina/meetingroomone
	name = "会议室"
	mappath = "_maps/modularmaps/fiorina/meetingroomsvar1.dmm"
	modular_id = "fimeetingroom"
	template_width = 12
	template_height = 13

/datum/map_template/modular/fiorina/meetingroomtwo
	name = "会议室"
	mappath = "_maps/modularmaps/fiorina/meetingroomsvar2.dmm"
	modular_id = "fimeetingroom"
	template_width = 12
	template_height = 13

/datum/map_template/modular/fiorina/engiofficeone
	name = "工程办公室"
	mappath = "_maps/modularmaps/fiorina/engiofficevar1.dmm"
	modular_id = "fiengioffice"
	template_width = 9
	template_height = 7

/datum/map_template/modular/fiorina/engiofficetwo
	name = "工程办公室"
	mappath = "_maps/modularmaps/fiorina/engiofficevar2.dmm"
	modular_id = "fiengioffice"
	template_width = 9
	template_height = 7

/datum/map_template/modular/fiorina/researchone
	name = "研究室"
	mappath = "_maps/modularmaps/fiorina/researchvar1.dmm"
	modular_id = "firesearch"
	template_width = 25
	template_height = 18

/datum/map_template/modular/fiorina/researchtwo
	name = "研究室"
	mappath = "_maps/modularmaps/fiorina/researchvar2.dmm"
	modular_id = "firesearch"
	template_width = 25
	template_height = 18

/datum/map_template/modular/fiorina/ringone
	name = "核心环"
	mappath = "_maps/modularmaps/fiorina/ringvar1.dmm"
	modular_id = "ficore"
	template_width = 25
	template_height = 25

/datum/map_template/modular/fiorina/ringtwo
	name = "核心环"
	mappath = "_maps/modularmaps/fiorina/ringvar2.dmm"
	modular_id = "ficore"
	template_width = 25
	template_height = 25
