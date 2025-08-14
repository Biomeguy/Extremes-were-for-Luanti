mobs:register_mob("nssm:sandworm", {
	type = "monster",
	hp_max = 40,
	hp_min = 25,
	collisionbox = {-.4, -.2, -.4, .4, 1.9, .4},
	visual = "mesh",
	mesh = "sandworm.x",
	textures = {{"sandworm.png"}},
	visual_size = {x= 4, y= 4},
	makes_footstep_sound = false,
	view_range = 17,
	rotate = 270,
	reach = 2,
	fear_height = 3,
	walk_velocity = 2,
	run_velocity = 2,
	damage = 6,
	sounds = {
		random = "sandworm",
		distance = 40
	},
	jump = false,
	drops = {
		{name = "nssm:energy_pearl", chance = 1, min = 2, max = 3},
		{name = "nssm:digested_sand", chance = 1, min = 1, max = 1},
        {name = "nssm:worm_flesh", chance = 2, min = 2, max = 5},
		{name = "nssm:sandworm_skin", chance = 2, min = 1, max = 3}
	},
	armor = 60,
	water_damage = 5,
	lava_damage = 10,
	fire_damage = 10,
	group_attack = true,
	attack_animals = true,
	blood_texture = "nssm_blood_blue.png",
	attack_type = "dogfight",
	animation = {
		speed_normal = 25,
		speed_run = 40,
		stand_start = 1,
		stand_end = 100,
		walk_start = 110,
		walk_end = 140,
		run_start = 110,
		run_end = 140,
		punch_start = 150,
		punch_end = 180
	}
})
