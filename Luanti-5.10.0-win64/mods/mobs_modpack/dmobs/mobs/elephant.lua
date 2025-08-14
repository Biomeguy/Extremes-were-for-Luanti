mobs:register_mob("dmobs:elephant", {
	type = "animal",
	passive = false,
	reach = 3,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 21,
	hp_max = 27,
	armor = 130,
	collisionbox = {-.7, -1, -.7, .7, 1, .7},
	visual = "mesh",
	mesh = "elephant.b3d",
	textures = {
		{"dmobs_elephant.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=2.5, y=2.5},
	makes_footstep_sound = true,
	walk_velocity = 0.5,
	run_velocity = 1,
	jump = false,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	fall_speed = -20, -- extra heavy!
	fear_height = 2,
	replace_rate = 10,
	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "ethereal:bamboo"},
	replace_with = "air",
	follow = {"default:beech_leaves", "farming:cut_grass", "farming:hay_pile", "farming:wheat", "farming:peanut_roasted"},
	view_range = 14,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 2, max = 3},
	},
	animation = {
		speed_normal = 5,
		speed_run = 10,
		walk_start = 3,
		walk_end = 19,
		stand_start = 20,
		stand_end = 30,
		run_start = 3,
		run_end = 19,
	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})

mobs:register_egg("dmobs:elephant", "Indian Elephant", "default_stone.png", 1)

mobs:register_mob("dmobs:elephant2", {
	type = "animal",
	passive = false,
	reach = 3,
	damage = 5,
	attack_type = "dogfight",
	hp_min = 50,
	hp_max = 150,
	armor = 100,
	collisionbox = {-.9, 0, -.9, .9, 2.1, .9},
	visual = "mesh",
	mesh = "elephant2.b3d",
	textures = {
		{"mobs_elephant.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2,
	jump = false,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	fall_speed = -20, 
	fear_height = 2,
	replace_rate = 10,
	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "ethereal:bamboo"},
	replace_with = "air",
	follow = {"default:beech_leaves", "farming:cut_grass", "farming:hay_pile", "farming:wheat", "farming:peanut_roasted"},
	view_range = 14,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 3, max = 4},
	},
	animation = {
		speed_normal = 14,
		speed_run = 16,
		walk_start = 25,
		walk_end = 45,
		stand_start = 1,
		stand_end = 20,
		run_start = 25,
		run_end = 45,
		punch_start = 25,
		punch_end = 45,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})

mobs:register_egg("dmobs:elephant2", "African Elephant", "default_savanna_grass.png", 1)

mobs:register_mob("dmobs:mammoth", {
	type = "animal",
	passive = false,
	reach = 4,
	damage = 5,
	attack_type = "dogfight",
	hp_min = 50,
	hp_max = 60,
	armor = 100,
	collisionbox = {-1, 0, -1, 1, 3.3, 1},
	visual = "mesh",
	mesh = "mammoth.b3d",
	textures = {
		{"mobs_mammoth.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 3,
	jump = false,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	fall_speed = -20,
	fear_height = 2,
	replace_rate = 10,
	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "ethereal:bamboo"},
	replace_with = "air",
	follow = {"default:beech_leaves", "farming:cut_grass", "farming:hay_pile", "farming:wheat", "farming:peanut_roasted"},
	view_range = 14,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 5, max = 6},
	},
	animation = {
		speed_normal = 15,
		speed_run = 17,
		walk_start = 45,
		walk_end = 65,
		stand_start = 20,
		stand_end = 40,
		run_start = 45,
		run_end = 65,
		punch_start = 1,
		punch_end = 20,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})

mobs:register_egg("dmobs:mammoth", "Mammoth", "default_dirt.png", 1)
