-- Deku_Baba by D00Med
-- edit of Dirt Monster by PilzAdam

mobs:register_mob("mobs_loz:deku_baba", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	damage = 2,
	reach = 3.5,
	hp_min = 10,
	hp_max = 27,
	armor = 130,
	collisionbox = {-.2, 0, -.2, .2, 1.2, .2},
	visual = "mesh",
	mesh = "dekubaba.b3d",
	textures = {
		{"mobs_dekubaba.png"},
		{"mobs_dekubaba2.png"},
	},
	blood_texture = "default_savanna_grass.png",
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 5,
	walk_velocity = .01,
	run_velocity = .05,
	jump = false,
	drops = {
		{name = "farming:spent_biomasse", chance = 1, min = 2, max = 5},
		{name = "mobs_loz:nut", chance = 1, min = 1, max = 3},
		{name = "mtools:heart", chance = 2, min = 1, max = 1},
		{name = "mapgen:blue_rupee", chance = 5, min = 1, max = 3},
	},
	water_damage = -1,
	lava_damage = 5,
	light_damage = -1,
	light_damage_min = 8,
	fear_height = 3,
	animation = {
		speed_normal = 12,
		speed_run = 30,
		stand_start = 1,
		stand_end = 19,
		walk_start = 1,
		walk_end = 19,
		run_start = 35,
		run_end = 55,
		punch_start = 20,
		punch_end = 35,
	},
})

mobs:register_egg("mobs_loz:deku_baba", "Deku Baba", "default_savanna_grass.png", 1)