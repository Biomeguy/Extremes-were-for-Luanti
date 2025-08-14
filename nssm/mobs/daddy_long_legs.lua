mobs:register_mob("nssm:daddy_long_legs", {
	type = "monster",
	hp_max = 22,
	hp_min = 16,
	collisionbox = {-.4, 0, -.4, .4, .6, .4},
	visual = "mesh",
	mesh = "daddy_long_legs.x",
	textures = {{"daddy_long_legs.png"}},
	visual_size = {x= 8, y= 8},
	makes_footstep_sound = true,
	view_range = 12,
	walk_velocity = .7,
	fear_height = 4,
	run_velocity = 3.3,
  	rotate = 90,
  	sounds = {
		random = "daddy"
	},
	damage = 3,
	jump = true,
	drops = {
		{name = "nssm:energy_pearl", chance = 1, min = 1, max = 2},
		{name = "nssm:spider_leg", chance = 3, min = 1, max = 8},
		{name = "nssm:spider_meat", chance = 4, min = 1, max = 2}
	},
	armor = 70,
	water_damage = 1,
	lava_damage = 7,
	fire_damage = 7,
	group_attack = true,
	attack_animals = true,
	blood_texture = "nssm_blood_blue.png",
	attack_type = "dogfight",
	animation = {
		speed_normal = 20,
		speed_run = 25,
		stand_start = 1,
		stand_end = 60,
		walk_start = 80,
		walk_end = 120,
		run_start = 80,
		run_end = 120,
		punch_start = 140,
		punch_end = 165
	}
})
