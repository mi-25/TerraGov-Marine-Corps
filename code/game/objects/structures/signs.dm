/obj/structure/sign
	icon = 'icons/obj/decals_arrow.dmi' // a copy of icons/obj/decals.dmi with directional arrows on the sprites, so a mapper knows which way a sign is facing
	anchored = TRUE
	opacity = FALSE
	density = FALSE
	layer = WALL_OBJ_LAYER
	var/directional = TRUE //if true init to a given x/y offset on a wall, if not leave floating in space. used for multiple signs on a wall to prevent them all from moving to the same offset and overlapping/becoming unreadable
	/// The clean version of the sprite, which we replace in initialize when the sign loads in game
	var/base_icon = 'icons/obj/decals.dmi'
	///if true try to automatically find the nearest wall and put ourselves on it
	var/autoplace = TRUE

/obj/structure/sign/Initialize(mapload)
	. = ..()
	if(!directional) //if not directional do not initialize to a x or y offset
		return
	icon = base_icon
	if(autoplace)
		place_poster()
		return
	switch(dir)
		if(NORTH)
			pixel_y = 32
		if(SOUTH)
			pixel_y = -32
		if(EAST)
			pixel_x = 30
		if(WEST)
			pixel_x = -30

//automatically adjust place and offset to make sure sign isn't floating in the middle of nowhere
/obj/structure/sign/proc/place_poster()
	if(isclosedturf(get_step(loc, dir)))
		switch(dir)
			if(NORTH)
				pixel_y = 32
			if(SOUTH)
				pixel_y = -32
			if(EAST)
				pixel_x = 30
			if(WEST)
				pixel_x = -30
		return
	if(isclosedturf(get_turf(loc)))
		return
	for(var/i in CARDINAL_ALL_DIRS)
		if(!isclosedturf(get_step(loc, i)))
			continue
		else
			switch(i)
				if(NORTH)
					pixel_y = 32
				if(NORTHEAST)
					pixel_y = 32
					pixel_x = 30
				if(NORTHWEST)
					pixel_y = 32
					pixel_x = -30
				if(SOUTH)
					pixel_y = -32
				if(SOUTHWEST)
					pixel_y = -32
					pixel_x = -30
				if(SOUTHEAST)
					pixel_y = -32
					pixel_x = 30
				if(EAST)
					pixel_x = 30
				if(WEST)
					pixel_x = -30
			return

/obj/structure/sign/ex_act(severity)
	if(severity == EXPLODE_WEAK)
		return
	qdel(src)

/obj/structure/sign/attackby(obj/item/I, mob/user, params)	//deconstruction
	. = ..()
	if(.)
		return

	if(isscrewdriver(I) && !istype(src, /obj/structure/sign/double))
		to_chat(user, "你用[I]解开了标识牌。")
		var/obj/item/sign/S = new(loc)
		S.name = name
		S.desc = desc
		S.icon_state = icon_state
		S.sign_state = icon_state
		qdel(src)

/obj/item/sign
	name = "标记"
	desc = ""
	icon = 'icons/obj/decals.dmi'
	w_class = WEIGHT_CLASS_NORMAL		//big
	var/sign_state = ""

/obj/item/sign/attackby(obj/item/I, mob/user, params)	//construction
	. = ..()
	if(.)
		return

	if(isscrewdriver(I) && isturf(user.loc))
		var/direction = tgui_input_list(user, "In which direction?", "Select direction.", list("North", "East", "South", "West"))
		if(!direction)
			return
		var/obj/structure/sign/S = new(user.loc)
		switch(direction)
			if("North")
				S.pixel_y = 32
			if("East")
				S.pixel_x = 32
			if("South")
				S.pixel_y = -32
			if("West")
				S.pixel_x = -32
			else
				return
		S.name = name
		S.desc = desc
		S.icon_state = sign_state
		to_chat(user, "你用[I]固定了\the [S]。")
		qdel(src)


/obj/structure/sign/double/map
	name = "站点地图"
	desc = "一张空间站的裱框照片。"

/obj/structure/sign/double/map/left
	icon_state = "map-left"

/obj/structure/sign/double/map/right
	icon_state = "map-right"

/obj/structure/sign/securearea
	name = "\improper 安全区域"
	desc = "一块写着'管制区域'的警告牌。"
	icon_state = "securearea"

/obj/structure/sign/securearea/firingrange
	name = "\improper 射击场"
	desc = "一个警告标志，上面写着'实弹射击场'。"
	icon_state = "firingrange"

/obj/structure/sign/biohazard
	name = "\improper 生化危害"
	desc = "一个写着'生化危害'的警告标志。"
	icon_state = "bio"

/obj/structure/sign/electricshock
	name = "\improper 高压危险"
	desc = "一个警示标志，上面写着'高压危险'。"
	icon_state = "shock"

/obj/structure/sign/cold
	name = "\improper 低温"
	desc = "一个写着'低温'的警告标志。"
	icon_state = "cold"

/obj/structure/sign/heat
	name = "\improper 高温"
	desc = "一个警告标志，上面写着'高温'。"
	icon_state = "heat"

/obj/structure/sign/gas
	name = "\improper 气体警报"
	desc = "一块警示牌，上面写着'必须佩戴防毒面具'。"
	icon_state = "gasmask"

/obj/structure/sign/examroom
	name = "\improper 检查"
	desc = "一块写着'检查室'的指示牌。"
	icon_state = "examroom"

/obj/structure/sign/vacuum
	name = "\improper 前方为硬真空区域"
	desc = "一个警告标志，上面写着'前方为硬真空环境'。"
	icon_state = "space"

/obj/structure/sign/deathsposal
	name = "\improper 垃圾处理管道通往太空"
	desc = "一个警告标志，上面写着'垃圾处理通往太空'。"
	icon_state = "deathsposal"

/obj/structure/sign/pods
	name = "\improper 逃生舱"
	desc = "一个写着'逃生舱'的警告标志。"
	icon_state = "pods"

/obj/structure/sign/fire
	name = "\improper 危险：火焰"
	desc = "一个写着'危险：火焰'的警告标志。"
	icon_state = "fire"

/obj/structure/sign/nosmoking_1
	name = "\improper 禁止吸烟"
	desc = "一块写着'禁止吸烟'的警示牌。"
	icon_state = "nosmoking"

/obj/structure/sign/nosmoking_2
	name = "\improper 禁止吸烟"
	desc = "一块写着'禁止吸烟'的警示牌。"
	icon_state = "nosmoking2"

/obj/structure/sign/redcross
	name = "医疗舱"
	desc = "星际医疗机构的标志。你或许能在这里得到帮助。"
	icon_state = "redcross"

/obj/structure/sign/greencross
	name = "医疗舱"
	desc = "星际医疗机构的标志。你或许能在这里得到帮助。"
	icon_state = "greencross"

/obj/structure/sign/greencross/star
	icon_state = "lifestar"

/obj/structure/sign/goldenplaque
	name = "最坚韧猛男奖"
	desc = "所谓强大，并非一种行为或生活方式，而是一种精神状态。唯有意志力足够坚定，能在危机中果断行动，从敌人手中拯救战友之人，才真正称得上强大。保持强大，我的朋友们。"
	icon_state = "goldenplaque"

/obj/structure/sign/kiddieplaque
	name = "AI开发者铭牌"
	desc = "在那一长串姓名和职务旁边，画着一个小孩子的涂鸦。这孩子看起来有残疾。画像下方，有人潦草地刻着'数据包'这个词。"
	icon_state = "kiddieplaque"

/obj/structure/sign/atmosplaque
	name = "\improper 联邦紧急事务管理局大气处理部铭牌"
	desc = "此牌匾纪念大气控制FEA部门的陨落。献给所有在其手中化为焦炭、头晕目眩、粉身碎骨的逝者。"
	icon_state = "atmosplaque"

/obj/structure/sign/double/maltesefalcon	//The sign is 64x32, so it needs two tiles. ;3
	name = "马耳他之鹰"
	desc = "马耳他猎鹰号，太空酒吧与烧烤店。"

/obj/structure/sign/double/maltesefalcon/left
	icon_state = "maltesefalcon-left"

/obj/structure/sign/double/maltesefalcon/right
	icon_state = "maltesefalcon-right"

/obj/structure/sign/science
	name = "\improper 科学！"
	desc = "一块写着'科学！'的警告牌。"
	icon_state = "science1"

/obj/structure/sign/science/two
	icon_state = "science2"

/obj/structure/sign/xenobio
	name = "\improper 科学！"
	desc = "一个写着'科学！'的警告标志。"
	icon_state = "xenobio4"

/obj/structure/sign/xenobio/two
	icon_state = "xenobio"

/obj/structure/sign/chemistry
	name = "\improper 化学"
	desc = "一个警告标志，上面写着'化学实验室'。"
	icon_state = "chemistry1"

/obj/structure/sign/chemistry2
	icon_state = "chemistry2"

/obj/structure/sign/pharmacy
	name = "\improper 药房"
	desc = "一块指示牌，上面写着'药房'。"
	icon_state = "pharmacy"

/obj/structure/sign/botany
	name = "\improper 水培室"
	desc = "一块指示牌，上面写着'水培区'。"
	icon_state = "hydro1"

/obj/structure/sign/holy
	name = "\improper 礼拜堂标识"
	desc = "标识宗教区域的标牌。"
	icon_state = "holy"

/obj/structure/sign/custodian
	name = "\improper 清洁工标识"
	desc = "标识清洁工工作区域的标牌。"
	icon_state = "custodian"

/obj/structure/sign/mait
	name = "\improper 维护隧道标识"
	desc = "标识各部门连接区域的指示牌。"
	icon_state = "mait1"

/obj/structure/sign/mait/alt
	name = "\improper 维护通道 标识"
	desc = "标识各部门连接区域的指示牌。"
	icon_state = "mait2"

/obj/structure/sign/botany
	name = "\improper 尸体处理"
	desc = "一个指示牌，上面写着'尸体处理处'。"
	icon_state = "bodysposal"

/obj/structure/sign/doors
	name = "\improper 门"
	desc = "一个写着'门'的指示牌。"
	icon_state = "doors"

/obj/structure/sign/engie
	name = "\improper 工程部"
	desc = "一块写着'工程部'的指示牌。"
	icon_state = "engine"

/obj/structure/sign/evac
	name = "\improper 撤离"
	desc = "一块写着'撤离'的指示牌。"
	icon_state = "evac"

/obj/structure/sign/hydro
	name = "\improper 水培室"
	desc = "一块指示牌，上面写着'水培区'。"
	icon_state = "hydro1"

/obj/structure/sign/hydro/two
	icon_state = "hydro2"

/obj/structure/sign/hydro/three
	icon_state = "hydro3"

/obj/structure/sign/restroom
	name = "\improper 洗手间"
	desc = "一块指示牌，上面写着'洗手间'。"
	icon_state = "restroom"

/obj/structure/sign/security
	name = "\improper 安全"
	desc = "一块写着'安保'的指示牌。"
	icon_state = "security"

/obj/structure/sign/testchamber
	name = "\improper 测试舱室"
	desc = "一块写着'测试室'的指示牌。"
	icon_state = "testchamber"


/obj/structure/sign/directions/science
	name = "\improper 科研部门"
	desc = "指向科学部门方向的路标。"
	icon_state = "direction_sci"

/obj/structure/sign/directions/engineering
	name = "\improper 工程部"
	desc = "一个方向指示牌，指向工程部门的方向。"
	icon_state = "direction_eng"

/obj/structure/sign/directions/security
	name = "\improper 安全部门"
	desc = "一个方向指示牌，指向安保部门所在的方向。"
	icon_state = "direction_sec"

/obj/structure/sign/directions/medical
	name = "\improper 医疗湾"
	desc = "一个方向指示牌，指向医疗舱的方向。"
	icon_state = "direction_med"

/obj/structure/sign/directions/supply
	name = "货物标识"
	desc = "一个方向指示牌，指向货舱的方向。"
	icon_state = "direction_supply"

/obj/structure/sign/directions/evac
	name = "\improper 逃生臂"
	desc = "方向指示牌，指向逃生穿梭机停靠口的方向。"
	icon_state = "direction_evac"

/obj/structure/sign/directions/command
	name = "指挥部门标识"
	desc = "一个方向指示牌，指向指挥部门所在的方向。"
	icon_state = "direction_bridge"

/obj/structure/sign/directions/mining
	name = "采矿部门标识"
	desc = "一个方向指示牌，指向采矿部门的方向。"
	icon_state = "direction_mining"



/obj/structure/sign/fixedinplace //direction signs that do not init to a position, handy for when we have to fit 4 signs on a wall at once
	directional = FALSE

/obj/structure/sign/fixedinplace/science
	name = "\improper 科研部门"
	desc = "方向指示牌，指向科学部门所在的方向。"
	icon_state = "direction_sci"

/obj/structure/sign/fixedinplace/engineering
	name = "\improper 工程部"
	desc = "一个方向指示牌，指向工程部门的方向。"
	icon_state = "direction_eng"

/obj/structure/sign/fixedinplace/security
	name = "\improper 安保部门"
	desc = "一个方向指示牌，指向安保部门所在的方向。"
	icon_state = "direction_sec"

/obj/structure/sign/fixedinplace/medical
	name = "\improper 医疗湾"
	desc = "指向医疗舱方向的路标。"
	icon_state = "direction_med"

/obj/structure/sign/fixedinplace/supply
	name = "货物标识"
	desc = "一个方向指示牌，指向货舱的方向。"
	icon_state = "direction_supply"

/obj/structure/sign/fixedinplace/evac
	name = "\improper 逃生装甲"
	desc = "方向指示牌，指向逃生飞船停靠口的方向。"
	icon_state = "direction_evac"

/obj/structure/sign/fixedinplace/command
	name = "指挥部门标识"
	desc = "方向指示牌，指向指挥部门的方向。"
	icon_state = "direction_bridge"

/obj/structure/sign/fixedinplace/mining
	name = "采矿部门标识"
	desc = "方向指示牌，指向采矿部门的方向。"
	icon_state = "direction_mining"

//end nondirectional signs

/obj/structure/sign/safety/
	name = "标记"
	icon = 'icons/obj/safety_signs_arrow.dmi'
	desc = "警告特定危险的标志"
	anchored = TRUE
	opacity = FALSE
	density = FALSE

/obj/structure/sign/safety/airlock
	name = "\improper 气闸门"
	desc = "标示附近存在气闸的标志。"
	icon_state = "sign_airlock"

/obj/structure/sign/safety/rad_shield
	name = "\improper 辐射屏蔽区域"
	desc = "一块标示着铅辐射屏蔽层存在的标牌。"
	icon_state = "sign_rad_shield"

/obj/structure/sign/safety/no_grav
	name = "\improper 警告：零重力区域"
	desc = "警告零重力区域的警示牌"
	icon_state = "sign_nograv"

/obj/structure/sign/safety/grav_suit
	name = "\improper 警告：需要人工重力服"
	desc = "警告标志：建议使用人工重力服"
	icon_state = "sign_artgrav_suit"

/obj/structure/sign/safety/electronics
	name = "\improper 警告：电气系统"
	desc = "警告电气系统的警示标志"
	icon_state = "sign_electronics"

/obj/structure/sign/safety/autodoc
	name = "\improper 自动医疗舱"
	desc = "附近有自动医生的标识"
	icon_state = "sign_autodoc"

/obj/structure/sign/safety/bridge
	name = "\improper 舰桥"
	desc = "舰桥标识"
	icon_state = "sign_bridge"

/obj/structure/sign/safety/blast_door
	name = "\improper 警告：舱壁"
	desc = "附近有舱壁门的警示标志"
	icon_state = "sign_blastdoor"

/obj/structure/sign/safety/breakroom
	name = "\improper 休息室"
	desc = "附近设有休息室的标识"
	icon_state = "sign_coffee"

/obj/structure/sign/safety/medical
	name = "\improper 医疗湾"
	desc = "医疗设施附近标识"
	icon_state = "sign_medical"

/obj/structure/sign/safety/maintenance
	name = "\improper 维护竖井"
	desc = "警告附近有维修竖井的标志。"
	icon_state = "sign_maint"

/obj/structure/sign/safety/galley
	name = "\improper 厨房"
	desc = "一块指示附近有食物存在的标识。"
	icon_state = "sign_galley"

/obj/structure/sign/safety/atmospherics
	name = "\improper 生命维持系统"
	desc = "标示生命维持系统临近的标志。"
	icon_state = "sign_life_support"

/obj/structure/sign/safety/vent
	name = "\improper 警告：排气口"
	desc = "警告标志，指示附近有危险排气口"
	icon_state = "sign_exhaust"

/obj/structure/sign/safety/storage
	name = "\improper 存储区"
	desc = "标识存储设施邻近区域的标牌。"
	icon_state = "sign_storage"

/obj/structure/sign/safety/medical_supplies
	name = "\improper 急救"
	desc = "标示附近存在"
	icon_state = "sign_medical_life_support"

/obj/structure/sign/safety/EVA
	name = "\improper 舱外活动服储物柜"
	desc = "EVA 太空服储物柜标识"
	icon_state = "sign_space_suit_locker"

/obj/structure/sign/safety/laser
	name = "\improper 警告：高能激光"
	desc = "警告附近有致命能量激光的警示标志"
	icon_state = "sign_laser"

/obj/structure/sign/safety/vacuum
	name = "\improper 警告：真空环境"
	desc = "附近有失压区域的警告标志"
	icon_state = "sign_vacuum"

/obj/structure/sign/safety/ladder
	name = "\improper 警告：梯子"
	desc = "指示梯子位置的标识"
	icon_state = "sign_ladder"

/obj/structure/sign/safety/pressure
	name = "\improper 警告：前方为加压区域"
	desc = "附近有加压区域"
	icon_state = "sign_pressurised_area"

/obj/structure/sign/safety/high_radiation
	name = "\improper 警告：高辐射水平"
	desc = "警告：附近有危险辐射"
	icon_state = "sign_high_rad"

/obj/structure/sign/safety/rad_hazard
	name = "\improper 警告：辐射危害"
	desc = "警告：附近有辐射"
	icon_state = "sign_rad_hazard"

/obj/structure/sign/safety/cryogenic
	name = "\improper 低温储藏库"
	desc = "标识低温储藏库存在的标牌"
	icon_state = "sign_cryo_vault"

/obj/structure/sign/safety/hazard
	name = "\improper 警告：危险材料"
	desc = "警告：附近有危险物品"
	icon_state = "sign_hazard"

/obj/structure/sign/safety/computer
	name = "\improper 警告：系统严重故障"
	desc = "警告设施关键计算机系统的警示标志"
	icon_state = "sign_computer"

/obj/structure/sign/safety/hydro
	name = "\improper 水培室"
	desc = "水培设施标识"
	icon_state = "sign_food_fridge"

/obj/structure/sign/safety/fridge
	name = "\improper 冷藏储存"
	desc = "标识冷藏设施存在的标牌"
	icon_state = "sign_cold_storage"

/obj/structure/sign/safety/radio
	name = "\improper 内部通信系统"
	desc = "一个通知对讲系统存在的标志。"
	icon_state = "sign_intercomm"

/obj/structure/sign/safety/Initialize(mapload)
	. = ..()
	icon = 'icons/obj/safety_signs.dmi'

//Marine signs

/obj/structure/sign/ROsign
	name = "\improper 地球政府殖民地海军陆战队补给办公室指导原则"
	desc = "1. 你无权要求服务或装备。枪械配件是特权，而非权利。\n2. 你必须着装整齐才能获得服务。低温休眠内衣不可接受。\n3. 补给军官拥有最终决定权，并有权拒绝服务。只有代理舰长可以推翻他的决定。\n4. 请尊重你的补给人员。他们工作很努力。"
	icon_state = "roplaque"

/obj/structure/sign/prop1
	name = "\improper 地球政府海报"
	desc = "地球政府的标志。"
	icon_state = "prop1"

/obj/structure/sign/prop2
	name = "\improper 地球政府殖民地海军陆战队海报"
	desc = "一张严重褪色的海报，上面是一群身着制服、光彩照人的地球政府殖民地海军陆战队队员。可能拍摄于阿尔梅耶号之前。"
	icon_state = "prop2"

/obj/structure/sign/prop3
	name = "\improper 地球政府殖民地海军陆战队海报"
	desc = "一张TGMC的旧征兵海报。凝视着它，自豪与真切的悔恨交织着涌上心头。"
	icon_state = "prop3"

/obj/structure/sign/prop4
	name = "地球政府：为人类团结"
	desc = "一张描绘地球政府标志和座右铭的海报，提醒陆战队员们是谁在守护人类对抗异形威胁。"
	icon_state = "prop4"
