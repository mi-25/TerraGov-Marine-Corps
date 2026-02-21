/*******************************************************************************
Imports
*******************************************************************************/
/datum/supply_packs/imports
	group = "Imports"
	containertype = /obj/structure/closet/crate/weapon

/datum/supply_packs/imports/m41a
	name = "PR-11脉冲步枪"
	contains = list(/obj/item/weapon/gun/rifle/m41a)
	cost = 50

/datum/supply_packs/imports/m41a/ammo
	name = "PR-11脉冲步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/m41a)
	cost = 3

/datum/supply_packs/imports/m412
	name = "PR-412脉冲步枪"
	contains = list(/obj/item/weapon/gun/rifle/m412)
	cost = 50

/datum/supply_packs/imports/m41a2/ammo
	name = "PR-412脉冲步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle)
	cost = 3

/datum/supply_packs/imports/m412l1
	name = "PR-412L1重型脉冲步枪"
	contains = list(/obj/item/weapon/gun/rifle/m412l1_hpr)
	cost = 300

/datum/supply_packs/imports/m412l1/ammo
	name = "PR-412L1 HPR重型脉冲步枪弹药"
	contains = list(/obj/item/ammo_magazine/m412l1_hpr)
	cost = 25

/datum/supply_packs/imports/type71	//Moff gun
	name = "脉冲步枪"
	contains = list(/obj/item/weapon/gun/rifle/type71/seasonal)
	cost = 50

/datum/supply_packs/imports/type71/ammo
	name = "71式脉冲步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/type71)
	cost = 3

/datum/supply_packs/imports/mp7
	name = "SMG-27 冲锋枪"
	contains = list(/obj/item/weapon/gun/smg/mp7)
	cost = 50

/datum/supply_packs/imports/mp7/ammo
	name = "SMG-27 冲锋枪弹药"
	contains = list(/obj/item/ammo_magazine/smg/mp7)
	cost = 3

/datum/supply_packs/imports/m25
	name = "SMG-25 冲锋枪"
	contains = list(/obj/item/weapon/gun/smg/m25)
	cost = 50

/datum/supply_packs/imports/m25/ammo
	name = "SMG-25 冲锋枪弹药"
	contains = list(/obj/item/ammo_magazine/smg/m25)
	cost = 3

/datum/supply_packs/imports/alf
	name = "ALF-51B 考瑟冲锋枪"
	contains = list(/obj/item/weapon/gun/rifle/alf_machinecarbine)
	cost = 50

/datum/supply_packs/imports/alf/ammo
	name = "ALF-51B 考瑟冲锋枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/alf_machinecarbine)
	cost = 3

/datum/supply_packs/imports/skorpion
	name = "CZ-81 蝎式冲锋枪"
	contains = list(/obj/item/weapon/gun/smg/skorpion)
	cost = 30

/datum/supply_packs/imports/skorpion/ammo
	name = "CZ-81 蝎式冲锋枪弹药"
	contains = list(/obj/item/ammo_magazine/smg/skorpion)
	cost = 3

/datum/supply_packs/imports/uzi
	name = "SMG-2 乌兹冲锋枪"
	contains = list(/obj/item/weapon/gun/smg/uzi)
	cost = 50

/datum/supply_packs/imports/uzi/ammo
	name = "SMG-2 乌兹冲锋枪弹药"
	contains = list(/obj/item/ammo_magazine/smg/uzi)
	cost = 3

/datum/supply_packs/imports/ppsh
	name = "PPSh-17b 冲锋枪"
	contains = list(/obj/item/weapon/gun/smg/ppsh)
	cost = 50

/datum/supply_packs/imports/ppsh/ammo
	name = "PPSh-17b 冲锋枪弹鼓"
	contains = list(/obj/item/ammo_magazine/smg/ppsh/extended)
	cost = 3

/datum/supply_packs/imports/leveraction
	name = "杠杆式步枪"
	contains = list(/obj/item/weapon/gun/shotgun/pump/lever)
	cost = 50
	available_against_xeno_only = TRUE

/datum/supply_packs/imports/mbx900
	name = "MBX-900杠杆式霰弹枪"
	contains = list(/obj/item/weapon/gun/shotgun/pump/lever/mbx900)
	cost = 50
	available_against_xeno_only = TRUE

/datum/supply_packs/imports/mbx900/buckshot
	name = "MBX-900 .410 鹿弹"
	contains = list(/obj/item/ammo_magazine/shotgun/mbx900/buckshot)
	cost = 10
	available_against_xeno_only = TRUE

/datum/supply_packs/imports/dragunov
	name = "SVD德拉古诺夫狙击步枪"
	contains = list(/obj/item/weapon/gun/rifle/sniper/svd)
	cost = 300
	available_against_xeno_only = TRUE

/datum/supply_packs/imports/dragunov/ammo
	name = "SVD德拉贡诺夫狙击步枪弹药"
	contains = list(/obj/item/ammo_magazine/sniper/svd)
	cost = 10
	available_against_xeno_only = TRUE

/datum/supply_packs/imports/mpi_km
	name = "MPi-KM突击步枪"
	contains = list(/obj/item/weapon/gun/rifle/mpi_km)
	cost = 50

/datum/supply_packs/imports/mpi_km/ammo
	name = "MPi-KM突击步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/mpi_km/plum)
	cost = 3

/datum/supply_packs/imports/mpi_km/ammo_packet
	name = "7.62x39毫米弹药箱"
	contains = list(/obj/item/ammo_magazine/packet/pwarsaw)
	cost = 15

/datum/supply_packs/imports/mkh
	name = "MKH-98风暴步枪"
	contains = list(/obj/item/weapon/gun/rifle/mkh)
	cost = 50

/datum/supply_packs/imports/mkh/ammo
	name = "MKH-98 突击步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/mkh)
	cost = 3

/datum/supply_packs/imports/garand
	name = "CAU C1 步枪"
	contains = list(/obj/item/weapon/gun/rifle/garand)
	cost = 50

/datum/supply_packs/imports/garand/ammo
	name = "CAU C1 弹药"
	contains = list(/obj/item/ammo_magazine/rifle/garand)
	cost = 3

/datum/supply_packs/imports/judge
	name = "裁决者左轮"
	contains = list(/obj/item/weapon/gun/revolver/judge)
	cost = 35

/datum/supply_packs/imports/judge/ammo
	name = "快速装弹器"
	contains = list(/obj/item/ammo_magazine/revolver/judge)
	cost = 3

/datum/supply_packs/imports/judge/buck_ammo
	name = ".45L 鹿弹弹药"
	contains = list(/obj/item/ammo_magazine/revolver/judge/buckshot)
	cost = 3

/datum/supply_packs/imports/m16	//Vietnam time
	name = "FN M16A4 突击步枪"
	contains = list(/obj/item/weapon/gun/rifle/m16)
	cost = 50

/datum/supply_packs/imports/m16/ammo
	name = "FN M16A4 突击步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/m16)
	cost = 3

/datum/supply_packs/imports/famas //bread joke here
	name = "FAMAS突击步枪"
	contains = list(/obj/item/weapon/gun/rifle/famas)
	cost = 120

/datum/supply_packs/imports/famas/ammo
	name = "FAMAS突击步枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/famas)
	cost = 5

/datum/supply_packs/imports/m16/ammo_packet
	name = "5.56x45毫米弹药箱"
	contains = list(/obj/item/ammo_magazine/packet/pnato)
	cost = 15

/datum/supply_packs/imports/aug	//Vietnam time
	name = "L&S EM-88 突击卡宾枪"
	contains = list(/obj/item/weapon/gun/rifle/icc_assaultcarbine/export)
	cost = 120

/datum/supply_packs/imports/aug/ammo
	name = "L&S EM-88 突击卡宾枪弹药"
	contains = list(/obj/item/ammo_magazine/rifle/icc_assaultcarbine/export)
	cost = 5

/datum/supply_packs/imports/rev357
	name = "'回弹'左轮手枪"
	contains = list(/obj/item/weapon/gun/revolver/small)
	cost = 35

/datum/supply_packs/imports/rev357/ammo
	name = "'弹巢'左轮快速装弹器"
	contains = list(/obj/item/ammo_magazine/revolver/small)
	cost = 3

/datum/supply_packs/imports/rev44
	name = "R-44 SAA 左轮手枪"
	contains = list(/obj/item/weapon/gun/revolver/single_action/m44)
	cost = 35

/datum/supply_packs/imports/rev357/ammo
	name = "R-44 SAA 左轮手枪快速装填器"
	contains = list(/obj/item/ammo_magazine/revolver/single_action/m44)
	cost = 3

/datum/supply_packs/imports/g22
	name = "P-22手枪"
	contains = list(/obj/item/weapon/gun/pistol/g22)
	cost = 35

/datum/supply_packs/imports/beretta92fs/ammo
	name = "P-22手枪弹药"
	contains = list(/obj/item/ammo_magazine/pistol/g22)
	cost = 3

/datum/supply_packs/imports/deagle
	name = "沙漠之鹰手枪"
	contains = list(/obj/item/weapon/gun/pistol/heavy)
	cost = 35

/datum/supply_packs/imports/deagle/ammo
	name = "沙漠之鹰手枪弹药"
	contains = list(/obj/item/ammo_magazine/pistol/heavy)
	cost = 3

/datum/supply_packs/imports/vp78
	name = "VP78手枪"
	contains = list(/obj/item/weapon/gun/pistol/vp78)
	cost = 35

/datum/supply_packs/imports/vp78/ammo
	name = "VP78手枪弹药"
	contains = list(/obj/item/ammo_magazine/pistol/vp78)
	cost = 3

/datum/supply_packs/imports/highpower
	name = "高威力自动马格南"
	contains = list(/obj/item/weapon/gun/pistol/highpower)
	cost = 35

/datum/supply_packs/imports/highpower/ammo
	name = "高威力自动马格南弹药"
	contains = list(/obj/item/ammo_magazine/pistol/highpower)
	cost = 3

/datum/supply_packs/imports/m1911
	name = "P-1911制式手枪"
	contains = list(/obj/item/weapon/gun/pistol/m1911)
	cost = 35

/datum/supply_packs/imports/m1911/ammo
	name = "P-1911 制式手枪弹药"
	contains = list(/obj/item/ammo_magazine/pistol/m1911)
	cost = 3

/datum/supply_packs/imports/strawhat
	name = "草帽"
	contains = list(/obj/item/clothing/head/strawhat)
	cost = 10

/datum/supply_packs/imports/loot_pack
	name = "地球政府殖民地海军陆战队战利品包"
	notes = "Contains a random, but curated set of items, these packs are valued around 150 to 200 points. Some items can only be acquired from these. Spend responsibly."
	contains = list(/obj/item/loot_box/tgmclootbox)
	cost = 1000

/datum/supply_packs/imports/loot_box
	name = "战利品箱"
	contains = list(/obj/item/loot_box/marine)
	cost = 500
