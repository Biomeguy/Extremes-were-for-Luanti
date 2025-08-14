mobs:register_mob("nssm:black_widow", {
	type = "monster",
	hp_max = 26,
	hp_min = 19,
	collisionbox = {-.4, 0, -.4, .4, .8, .4},
	visual = "mesh",
	mesh = "black_widow.x",
	textures = {{"black_widow.png"}},
	visual_size = {x= 2, y= 2},
	makes_footstep_sound = true,
	view_range = 15,
	fear_height = 4,
	walk_velocity = .8,
	run_velocity = 2.5,
    rotate = 270,
  	sounds = {
		random = "black_widow"
	},
	damage = 4,
	reach = 2,
	jump = true,
	drops = {
		{name = "nssm:energy_pearl", chance = 1, min = 1, max = 2},
		{name = "nssm:spider_leg", chance = 3, min = 1, max = 8},
		{name = "nssm:silk_gland", chance = 4, min = 1, max = 3},
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
		stand_end = 70,
		walk_start = 80,
		walk_end = 120,
		run_start = 120,
		run_end = 140,
		punch_start = 150,
		punch_end = 160
	},
	do_custom = function(self)
		if nssm.spiders_litter_web then
			webber_ability(self, "nssm:web", 2)
		end
	end,
})
