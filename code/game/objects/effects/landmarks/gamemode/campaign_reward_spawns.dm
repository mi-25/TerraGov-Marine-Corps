//When various rewards are spawned, they are sent to an available spawn location
/obj/effect/landmark/reward_spawn_location
	name = "TGMC奖励生成位置"
	desc = "这不应可见"
	icon = 'icons/obj/structures/campaign_structures.dmi'
	icon_state = "tgmc_reward_spawn"
	faction = FACTION_TERRAGOV

/obj/effect/landmark/reward_spawn_location/Initialize(mapload)
	. = ..()
	LAZYADDASSOC(GLOB.campaign_reward_spawners, faction, src)
	icon_state = null

/obj/effect/landmark/reward_spawn_location/Destroy()
	LAZYREMOVEASSOC(GLOB.campaign_reward_spawners, faction, src)
	return ..()

/obj/effect/landmark/reward_spawn_location/som
	name = "火星之子奖励生成位置"
	icon_state = "som_reward_spawn"
	faction = FACTION_SOM
