mobs:register_mob("nssm:morgre", {
	type = "monster",
	hp_max = 33,
	hp_min = 17,
	collisionbox = {-.2, -.1, -.2, .2, 1.6, .2},
	visual = "mesh",
	mesh = "morgre.x",
	rotate = 270,
	textures = {{"morgre.png"}},
	visual_size = {x= 5, y= 5},
	explosion_radius = 4,
	makes_footstep_sound = true,
	view_range = 25,
	fear_height = 4,
	walk_velocity = .5,
	run_velocity = 3.5,
	sounds = {
		explode = "tnt_explode",
		random = "morgre1"
	},
	damage = 1,
	jump = true,
	drops = {
		{name = "nssm:energy_pearl", chance = 1, min = 1, max = 2},
		{name = "nssm:black_powder", chance = 2, min = 2, max = 8},
		{name = "nssm:greedy_soul_fragment", chance = 5, min = 1, max = 1}
	},
	armor = 60,
	lava_damage = 0,
	fire_damage = 0,
	group_attack = true,
	attack_animals = true,
	blood_texture="morparticle.png",
	attack_type = "explode",
	animation = {
		speed_normal = 25,
		speed_run = 25,
		stand_start = 10,
		stand_end = 40,
		walk_start = 50,
		walk_end = 90,
		run_start = 120,
		run_end = 140,
		punch_start = 100,
		punch_end = 110
	}
})
