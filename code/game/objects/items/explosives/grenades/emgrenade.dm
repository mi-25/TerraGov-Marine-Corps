/obj/item/explosive/grenade/emp
	name = "\improper EMP手雷"
	desc = "一种紧凑型装置，激活时会释放强烈的电磁脉冲。能够损坏或削弱各种电子系统。可装入任何榴弹发射器，或用手投掷。"
	icon_state = "emp"
	worn_icon_state = "emp"


/obj/item/explosive/grenade/emp/prime()
	empulse(src, 0, 2, 5)
	qdel(src)

