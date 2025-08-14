
mobs:register_mob("dmobs:smallfish", {
	type = "animal",
	passive = true,
	reach = 1,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 1,
	hp_max = 3,
	armor = 100,
	collisionbox = {-0.2, -0.2, -0.2, 0.2, 0.2, 0.2},
	visual = "mesh",
	mesh = "fish.b3d",
	textures = {
		{"mobs_smallfish.png"},
	},
	makes_footstep_sound = false,
	view_range = 10,
	walk_velocity = 3,
	run_velocity = 6,
	runaway = true,
	runaway_timer = 40,
	jump = false,
	jump_height = 0,
	stepheight = 0,
	fly = true,
	fly_in = "default:water_source",
	fall_damage = 0,
	fall_speed = 0,
	drops = {
		{name = "dmobs:smallfish_raw", chance = 3, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 1,
		stand_end = 20,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
	},
})

mobs:register_egg("dmobs:smallfish", "Small Fish", "default_water.png", 1)

core.register_craftitem("dmobs:smallfish_raw", {
	description = "Small Raw Fish",
	inventory_image = "mobs_smallfish_item.png",
	on_use = core.item_eat(1)
})

core.register_craftitem("dmobs:smallfish_cooked", {
	description = "Small Cooked Fish",
	inventory_image = "mobs_smallfish_cooked.png",
	on_use = core.item_eat(2)
})

core.register_craft({
	type = "cooking",
	output = "dmobs:smallfish_raw",
	recipe = "dmobs:smallfish_cooked",
	cooktime = 3,
})

mobs:register_mob("dmobs:ammonite_s", {
	type = "animal",
	passive = true,
	reach = 1,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 15,
	hp_max = 35,
	armor = 110,
	collisionbox = {-0.5, -0.2, -0.5, 0.5, 0.5, 0.5},
	visual = "mesh",
	mesh = "ammonite.b3d",
	textures = {
		{"mobs_ammonite.png"},
	},
	makes_footstep_sound = false,
	view_range = 10,
	walk_velocity = 3,
	run_velocity = 6,
	runaway = true,
	runaway_timer = 40,
	jump = false,
	jump_height = 0,
	stepheight = 0,
	fly = true,
	fly_in = "default:water_source",
	fall_damage = 0,
	fall_speed = 0,
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 2,
		stand_end = 23,
		walk_start = 2,
		walk_end = 23,
		run_start = 2,
		run_end = 23,
	},
})

mobs:register_egg("dmobs:ammonite_s", "Small Ammonite", "default_sand.png", 1)

mobs:register_mob("dmobs:ammonite_b", {
	type = "animal",
	passive = true,
	reach = 1,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 15,
	hp_max = 35,
	armor = 110,
	collisionbox = {-1, -0.2, -1, 1, 1, 1.2},
	visual = "mesh",
	mesh = "ammonite.b3d",
	textures = {
		{"mobs_ammonite_big.png"},
	},
	visual_size = {x=2.5, y=2.5},
	makes_footstep_sound = false,
	view_range = 10,
	walk_velocity = 3,
	run_velocity = 6,
	runaway = true,
	runaway_timer = 40,
	jump = false,
	jump_height = 0,
	stepheight = 0,
	fly = true,
	fly_in = "default:water_source",
	fall_damage = 0,
	fall_speed = 0,
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 2,
		stand_end = 23,
		walk_start = 2,
		walk_end = 23,
		run_start = 2,
		run_end = 23,
	},
})

mobs:register_egg("dmobs:ammonite_b", "Large Ammonite", "default_sand.png", 1)

mobs:register_mob("dmobs:trilobite", {
	type = "animal",
	passive = true,
	reach = 1,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 110,
	collisionbox = {-0.2, 0, -0.2, 0.2, 0.2, 0.2},
	visual = "mesh",
	mesh = "trilobite.b3d",
	textures = {
		{"mobs_trilobite.png"},
	},
	makes_footstep_sound = false,
	view_range = 5,
	walk_velocity = 1,
	run_velocity = 2,
	runaway = true,
	runaway_timer = 40,
	jump = 0,
	floats = 0,
	jump_height = 0,
	stepheight = 1.3,
	fall_damage = 0,
	fall_speed = -5,
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 40,
		stand_end = 60,
		walk_start = 1,
		walk_end = 30,
		run_start = 1,
		run_end = 30,
	},
})

mobs:register_egg("dmobs:trilobite", "Trilobite", "default_water.png", 1)

mobs:register_mob("dmobs:riverfish", {
	type = "animal",
	passive = true,
	reach = 1,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 120,
	collisionbox = {-0.2, -0.2, -0.2, 0.2, 0.2, 0.2},
	visual_size = {x=1.6, y=1.6},
	visual = "mesh",
	mesh = "fish.b3d",
	textures = {
		{"mobs_riverfish.png"},
	},
	makes_footstep_sound = false,
	view_range = 10,
	walk_velocity = 3,
	run_velocity = 6,
	runaway = false,
	runaway_timer = 40,
	jump = false,
	jump_height = 0,
	stepheight = 0,
	fly = true,
	fly_in = "default:fresh_water_source",
	fall_damage = 0,
	fall_speed = 0,
	drops = {
		{name = "dmobs:riverfish_raw", chance = 3, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 1,
		stand_end = 20,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
	},
})

mobs:register_egg("dmobs:riverfish", "River Fish", "default_dirt.png", 1)

core.register_craftitem("dmobs:riverfish_raw", {
	description = "Raw River Fish",
	inventory_image = "mobs_riverfish_item.png",
	on_use = core.item_eat(1)
})

core.register_craftitem("dmobs:riverfish_baked", {
	description = "Baked River Fish",
	inventory_image = "mobs_riverfish_baked.png",
	on_use = core.item_eat(3)
})

core.register_craft({
	type = "cooking",
	output = "dmobs:riverfish_raw",
	recipe = "dmobs:riverfish_baked",
	cooktime = 3,
})

mobs:register_mob("dmobs:pirana", {
	type = "animal",
	passive = false,
	attack_npcs = false,
	group_attack = true,
	reach = 1,
	damage = 1,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 120,
	collisionbox = {-0.2, 0, -0.2, 0.2, 0.4, 0.2},
	visual_size = {x=1.6, y=1.6},
	visual = "mesh",
	mesh = "pirana.b3d",
	textures = {
		{"mobs_pirana.png"},
	},
	makes_footstep_sound = false,
	view_range = 10,
	walk_velocity = 3,
	run_velocity = 6,
	runaway = false,
	runaway_timer = 40,
	jump = false,
	jump_height = 0,
	stepheight = 0,
	fly = true,
	fly_in = "default:fresh_water_source",
	fall_damage = 0,
	fall_speed = 0,
	drops = {
		{name = "dmobs:pirana_raw", chance = 3, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 2,
		stand_end = 30,
		walk_start = 2,
		walk_end = 30,
		run_start = 2,
		run_end = 30,
	},
})

mobs:register_egg("dmobs:pirana", "Piranha", "fabric_block_dark_grey.png", 1)

core.register_craftitem("dmobs:pirana_raw", {
	description = "Raw Piranha",
	inventory_image = "mobs_pirana_item.png",
	on_use = core.item_eat(1)
})

core.register_craftitem("dmobs:pirana_baked", {
	description = "Baked Piranha",
	inventory_image = "mobs_pirana_baked.png",
	on_use = core.item_eat(3)
})

core.register_craft({
	type = "cooking",
	output = "dmobs:pirana_raw",
	recipe = "dmobs:pirana_baked",
	cooktime = 4,
})

mobs:register_mob("dmobs:dearcmhara", {
	type = "monster",
	passive = false,
	reach = 2,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 30,
	hp_max = 40,
	armor = 100,
	collisionbox = {-.7, 0, -.7, .7, 1, .7},
	visual = "mesh",
	mesh = "dearcmhara.b3d",
	textures = {
		{"mobs_dearcmhara.png"},
	},
	makes_footstep_sound = false,
	view_range = 10,
	walk_velocity = 3,
	run_velocity = 6,
	runaway = true,
	runaway_timer = 40,
	jump = false,
	jump_height = 0,
	stepheight = 0,
	fly = true,
	fly_in = "default:water_source",
	fall_damage = 0,
	fall_speed = 0,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 2, max = 3},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 6,
		stand_end = 24,
		walk_start = 6,
		walk_end = 24,
		run_start = 31,
		run_end = 49,
	},
})

mobs:register_egg("dmobs:dearcmhara", "Dearcmhara", "fabric_block_cyan.png", 1)
