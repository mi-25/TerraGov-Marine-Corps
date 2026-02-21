//Base Instance

/area/outpost
	name = "研究前哨站"


//	ceiling = CEILING_GLASS
//	ceiling = CEILING_METAL



// LZ Areas

/area/outpost/lz1
	name = "着陆区1"
	ceiling = CEILING_NONE
	icon_state="red"
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ

/area/outpost/lz2
	name = "着陆区2"
	ceiling = CEILING_NONE
	icon_state="red"
	outside = FALSE
	minimap_color = MINIMAP_AREA_LZ



// Cargo Areas

/area/outpost/cargo
	name = "货舱"
	icon_state="orange"
	ceiling = CEILING_GLASS
	outside = FALSE
	minimap_color = MINIMAP_AREA_REQ

/area/outpost/cargo/office
	name = "货物办公室"
	icon_state="orange"
	ceiling = CEILING_GLASS

/area/outpost/cargo/security
	name = "货物安保前哨站"
	icon_state="brig"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_SEC

/area/outpost/cargo/engineering
	name = "货物工程"
	icon_state="orange"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_REQ

// Cave Areas, cave.

/area/outpost/caves
	name = "洞穴"
	icon_state="cave"
	ceiling = CEILING_NONE
	outside = FALSE
	always_unpowered = TRUE

/area/outpost/caves/central
	name = "中央洞穴"
	icon_state="cave"
	ceiling = CEILING_NONE

/area/outpost/caves/north
	name = "北部洞穴"
	icon_state="cave"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_CAVES

/area/outpost/caves/north_east
	// Note: This is where the hive is
	name = "东北洞穴"
	icon_state="cave"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_CAVES

/area/outpost/caves/east
	name = "东部洞穴"
	icon_state="cave"
	ceiling = CEILING_NONE

/area/outpost/caves/south_east
	name = "东南洞穴"
	icon_state="cave"
	ceiling = CEILING_NONE

/area/outpost/caves/south
	name = "南部洞穴"
	icon_state="cave"
	ceiling = CEILING_NONE

/area/outpost/caves/south_west
	name = "西南洞穴"
	icon_state="cave"
	ceiling = CEILING_NONE

/area/outpost/caves/west
	name = "西部洞穴"
	icon_state="cave"
	ceiling = CEILING_NONE

/area/outpost/caves/north_west
	name = "西北洞穴"
	icon_state="cave"
	ceiling = CEILING_DEEP_UNDERGROUND
	minimap_color = MINIMAP_AREA_CAVES



// Yard Areas, there are a lot of these because there are a lot of open /areas.

/area/outpost/yard
	name = "船坞"
	icon_state="thunder"
	ceiling = CEILING_NONE
	minimap_color = MINIMAP_AREA_COLONY
	always_unpowered = TRUE

/area/outpost/yard/central
	name = "中央庭院"
	icon_state="thunder"
	ceiling = CEILING_NONE

/area/outpost/yard/north
	name = "北部庭院"
	icon_state="thunder"
	ceiling = CEILING_NONE

/area/outpost/yard/north_east
	name = "东北侧船坞"
	icon_state="thunder"
	ceiling = CEILING_NONE

/area/outpost/yard/east
	name = "东部庭院"
	icon_state="thunder"
	ceiling = CEILING_NONE

/area/outpost/yard/south_east
	name = "东南船坞"
	icon_state="thunder"
	ceiling = CEILING_NONE

/area/outpost/yard/south
	name = "南院"
	icon_state="thunder"
	ceiling = CEILING_NONE

/area/outpost/yard/south_west
	name = "西南庭院"
	icon_state="thunder"
	ceiling = CEILING_NONE

/area/outpost/yard/west
	name = "西部庭院"
	icon_state="thunder"
	ceiling = CEILING_NONE

/area/outpost/yard/north_west
	name = "西北庭院"
	icon_state="thunder"
	ceiling = CEILING_NONE



// Arrivals Areas, where you arrive

/area/outpost/arrivals
	name = "抵达区"
	icon_state="entry"
	ceiling = CEILING_GLASS
	outside = FALSE

/area/outpost/arrivals/securitylz1
	name = "LZ1 安全前哨站"
	icon_state="brig"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_SEC

/area/outpost/arrivals/securitylz2
	name = "LZ2 安全前哨站"
	icon_state="brig"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_SEC

// Hallway Areas, a few of these, somewhat annoying as the south hallway branches out more than the others.

/area/outpost/hallway
	name = "走廊"
	icon_state="green"
	ceiling = CEILING_GLASS
	outside = FALSE

/area/outpost/hallway/northern
	name = "北部走廊"
	icon_state="green"
	ceiling = CEILING_GLASS

/area/outpost/hallway/central
	name = "中央走廊"
	icon_state="green"
	ceiling = CEILING_GLASS

/area/outpost/hallway/west
	name = "西侧走廊"
	icon_state="green"
	ceiling = CEILING_GLASS

/area/outpost/hallway/south_cent
	name = "南侧中央走廊"
	icon_state="green"
	ceiling = CEILING_GLASS

/area/outpost/hallway/south_east
	name = "东南走廊"
	icon_state="green"
	ceiling = CEILING_GLASS

/area/outpost/hallway/south_west
	name = "西南走廊"
	icon_state="green"
	ceiling = CEILING_GLASS

/area/outpost/hallway/east
	name = "西南走廊"
	icon_state="green"
	ceiling = CEILING_GLASS



// Medbay

/area/outpost/medbay
	name="医疗舱"
	icon_state="blue"
	ceiling = CEILING_GLASS
	outside = FALSE
	minimap_color = MINIMAP_AREA_MEDBAY

/area/outpost/medbay/security
	name="医疗区安全前哨站"
	icon_state="blue"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_SEC

/area/outpost/medbay/storage
	name="医疗舱储藏室"
	icon_state="blue"
	ceiling = CEILING_GLASS

/area/outpost/medbay/surgery
	name="手术"
	icon_state="blue"
	ceiling = CEILING_GLASS

/area/outpost/medbay/chemistry
	name="化学"
	icon_state="blue"
	ceiling = CEILING_GLASS



// Dorms, it feels like a waste of space to put in a comment for a single /area.

/area/outpost/dormitories
	name = "宿舍区"
	icon_state="Sleep"
	ceiling = CEILING_GLASS
	outside = FALSE
	minimap_color = MINIMAP_AREA_LIVING

// Brig

/area/outpost/brig
	name = "禁闭室"
	icon_state="brig"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_SEC

/area/outpost/brig/gear_room
	name = "禁闭室装备间"
	icon_state="brig"
	ceiling = CEILING_METAL

/area/outpost/brig/wardens_office
	name = "禁闭室装备间"
	icon_state="brig"
	ceiling = CEILING_METAL

/area/outpost/brig/armoury
	name = "军械库"
	icon_state="brig"
	ceiling = CEILING_METAL



// Science, man turns himself into a pickle, this is somehow a funny joke and you should laugh. //ha ha very funny

/area/outpost/science
	name = "科研部"
	icon_state="purple"
	ceiling = CEILING_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_RESEARCH

/area/outpost/science/research
	name = "研发部"
	icon_state="purple"
	ceiling = CEILING_METAL

/area/outpost/science/security
	name = "科研安全前哨站"
	icon_state="brig"
	ceiling = CEILING_METAL
	minimap_color = MINIMAP_AREA_SEC

/area/outpost/science/hydponics
	// LOCAL DEGENERATE BOTANIST STOLE THE CHEM DISPENSER AGAIN
	name = "植物科学"
	icon_state="purple"
	ceiling = CEILING_METAL

/area/outpost/science/rd_office
	name = "研究主管办公室"
	icon_state="purple"
	ceiling = CEILING_METAL

/area/outpost/science/xenobiology
	/*
	One day there was a lonely, overworked scientist.
	The company he worked for did not care at all about their employees.
	His boss refused his requests for vacation time and took credit for all of his work.
	One day he got an idea.
	He just stopped working.
	His boss quickly entered, having been watching the cameras to ensure he was working.
	"HEY, GET BACK TO WORK, YOU DONT GET BREAKS!"
	"Hey, Boss, what do you get when you cross a pissed of scientist with xenomorph specimines?
	"DO I NEED TO CALL SECURITY TO GET YOUR ASS BACK TO WORK!?"
	"YOU GET WHAT YOU FUCKING DESERVE!"
	*SMASH*
	*WARNING, CONTAINMENT BREACH DETECTED IN XENOBIOLOGY LAB*
	*/
	name = "异形生物学"
	icon_state="purple"
	ceiling = CEILING_METAL
	outside = FALSE



// Engineering

/area/outpost/engineering
	name = "工程走廊"
	icon_state="engine"
	ceiling = CEILING_GLASS
	outside = FALSE
	minimap_color = MINIMAP_AREA_ENGI

/area/outpost/engineering/hallway
	name = "工程走廊"
	icon_state="engine"
	ceiling = CEILING_GLASS

/area/outpost/engineering/security
	name = "工程安全前哨站"
	icon_state="engine"
	ceiling = CEILING_GLASS
	minimap_color = MINIMAP_AREA_SEC

/area/outpost/engineering/engine
	name = "引擎室"
	icon_state="engine"
	ceiling = CEILING_UNDERGROUND
	minimap_color = MINIMAP_AREA_ENGI_CAVE
