
mobs:register_mob("mobs_loz:octorock", {
	type = "monster",
	passive = false,
	attack_type = "shoot",
	shoot_interval = 1.5,
	arrow = "mobs_loz:octorock_rock",
	shoot_offset = 1.2,
	hp_min = 20,
	hp_max = 35,
	armor = 70,
	collisionbox = {-.4, 0, -.4, .4, .8, .4},
	visual = "mesh",
	mesh = "octorock.b3d",
	textures = {
		{"mobs_octorock.png"},
		{"mobs_octorock2.png"},
		{"mobs_octorock_giant.png"},
	},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 1,
	run_velocity = 1.5,
	jump = false,
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	stepheight = 3,
	drops = {
		{name = "mapgen:blue_rupee", chance = 5, min = 5, max = 5},
		{name = "mtools:magglv_n", chance = 10, min = 1, max = 1},
		{name = "mtools:heart", chance = 2, min = 1, max = 1},
		{name = "mapgen:octorock_stone", chance = 12, min = 1, max = 1},
	},
	on_die = function(self, pos)
core.add_particlespawner({
	amount = 9,
	time = 1,
	minpos = {x=pos.x-.7, y=pos.y+1, z=pos.z-.7},
	maxpos = {x=pos.x+.7, y=pos.y+1, z=pos.z+.7},
	minacc = {x=-.5, y=1, z=-.5},
	maxacc = {x=.5, y=1, z=.5},
	exptime = {min = 1, max = 1.5},
	minsize = 21,
	maxsize = 25,
	vertical = true,
	texture = "mobs_loz_light.png",
	glow = 9 })
	end,
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 12,
		speed_run = 12,
		stand_start = 1,
		stand_end = 12,
		walk_start = 18,
		walk_end = 38,
		run_start = 18,
		run_end = 38,
		shoot_start = 1,
		shoot_end = 12,
	},
})

mobs:register_egg("mobs_loz:octorock", "Octorock", "default_sand.png", 1)

mobs:register_arrow("mobs_loz:octorock_rock", {
	visual = "sprite",
	visual_size = {x = .5, y = .5},
	textures = {"mobs_octorock_shot.png"},
	velocity = 8,

	hit_player = function(self, player)
		local item = player:get_wielded_item():get_name()
		if item ~= "mapgen:shield" then
		player:punch(self.object, 1., {
			full_punch_interval = 1.,
			damage_groups = {fleshy = 2},
		}, nil)
		end
	end,
   
	hit_mob = function(self, player)
		player:punch(self.object, 1., {
			full_punch_interval = 1.,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_node = function(self, pos, node)
		self.object:remove()
	end,
})