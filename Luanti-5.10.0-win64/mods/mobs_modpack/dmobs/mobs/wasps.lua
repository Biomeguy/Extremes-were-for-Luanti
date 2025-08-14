--Wasps!
mobs:register_mob("dmobs:wasp", {
	type = "monster",
	reach = 1,
	damage = 1,
	attack_type = "dogfight",
	hp_min = 3,
	hp_max = 5,
	armor = 100,
	collisionbox = {-.1, 0, -.1, .1, .5, .1},
	fly = true,
	fall_speed = 0,
	stepheight = 1.5,
	visual = "mesh",
	mesh = "wasp.b3d",
	textures = {
		{"dmobs_wasp.png"},
	},
	sounds = {
		random = "wasp",
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=.6, y=.6},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	animation = {
		speed_normal = 50,
		speed_run = 60,
		walk_start = 6,
		walk_end = 16,
		stand_start = 6,
		stand_end = 16,
		run_start = 6,
		run_end = 16,
		punch_start = 6,
		punch_end = 16,
	},
})

mobs:register_egg("dmobs:wasp", "Wasp", "dmobs_wasp_bg.png", 1)

mobs:register_mob("dmobs:wasp_leader", {
	type = "monster",
	reach = 1,
	damage = 2,
	attack_type = "shoot",
	shoot_interval = 1,
	arrow = "dmobs:sting",
	hp_min = 82,
	hp_max = 122,
	armor = 130,
	collisionbox = {-.3, 0, -.3, .3, 1.5, .3},
	pathfinding = 1,
	fly = true,
	fall_speed = 0,
	stepheight = 1.5,
	visual = "mesh",
	mesh = "wasp.b3d",
	textures = {
		{"dmobs_wasp.png"},
	},
	sounds = {
		random = "wasp",
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=2.5, y=2.5},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2.5,
	jump = true,
	drops = {
		{name = "default:gold_lump", chance = 1, min = 3, max = 5},
	},
	do_custom = function(self)
		if math.random(1, 500) >= 500 then
		local pos = self.object:get_pos()
		core.add_entity(pos, "dmobs:wasp")
		end
	end,
	replace_rate = 700,
	replace_what = {"air"},
	replace_with = "dmobs:hive",
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	animation = {
		speed_normal = 50,
		speed_run = 60,
		walk_start = 1,
		walk_end = 5,
		stand_start = 1,
		stand_end = 5,
		run_start = 1,
		run_end = 5,
		shoot_start = 6,
		shoot_end = 15,
	},
})

mobs:register_egg("dmobs:wasp_leader", "King of Sting", "dmobs_wasp_bg.png", 1)
