/datum/map_template/interior
	name = "基地内部模板"
	///just the prefix so we dont need to fill in the entire thing
	var/prefix = "_maps/interiors/"
	///filename without file type for the map
	var/filename

/datum/map_template/interior/New()
	mappath = "[prefix][filename].dmm"
	return ..()

/datum/map_template/interior/medium_tank
	name = "中型坦克内部模板"
	filename = "tank"

/datum/map_template/interior/transport
	name = "运输装甲运兵车内部模板"
	filename = "apc_transport"

/datum/map_template/interior/medical
	name = "医疗装甲运兵车内部模板"
	filename = "apc_medical"

/datum/map_template/interior/clone_bay
	name = "克隆舱区域电力控制面板内部模板"
	filename = "apc_cloner"

/datum/map_template/interior/mrap
	name = "运输型MRAP内部模板"
	filename = "mrap"

/datum/map_template/interior/som_tank
	name = "火星之子坦克内部模板"
	filename = "som_tank"

/datum/map_template/interior/icc_recontank
	name = "ICC 法罗侦察车履带式内部模板"
	filename = "icc_recontank"
