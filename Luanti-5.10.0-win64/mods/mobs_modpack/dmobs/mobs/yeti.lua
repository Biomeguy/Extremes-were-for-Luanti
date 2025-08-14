
mobs:register_mob("dmobs:yeti", {
	type = "monster",
	damage = 2,
	attack_type = "shoot",
	shoot_interval = .7,
	arrow = "dmobs:snowball",
	shoot_offset = 1,
	hp_min = 10,
	hp_max = 35,
	armor = 100,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {
		{"mobs_yeti.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_stonemonster",
	},
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "default:ice", chance = 1, min = 1, max = 3},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 1,
	view_range = 15,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	floats = 0,
})

mobs:register_egg("dmobs:yeti", "Yeti", "default_snow.png", 1)

mobs:register_arrow("dmobs:snowball", {
	visual = "sprite",
	visual_size = {x=.5, y=.5},
	textures = {"default_snowball.png"},
	velocity = 6,

	hit_player = function(self, player)
		player:punch(self.object, 1., {
			full_punch_interval = 1.,
			damage_groups = {fleshy = 1},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1., {
			full_punch_interval = 1.,
			damage_groups = {fleshy = 1},
		}, nil)
	end,

	hit_node = function(self, pos, node)
		self.object:remove()
	end
})
