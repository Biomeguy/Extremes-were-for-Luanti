
mobs:register_arrow("mobs_loz:swdbm", {
	visual = "sprite",
	visual_size = {x = 2, y = 1},
	textures = {"mobs_loz_swdbeam.png"},
	velocity = 4,
	glow = 14,
	tail = 1, -- enable tail
	tail_texture = "mobs_loz_swdbeam.png",
	tail_glow = 14,

	hit_player = function(self, player)
		local item = player:get_wielded_item():get_name()
		if item ~= "mapgen:shield" then
		player:punch(self.object, 1., {
			full_punch_interval = 1.,
			damage_groups = {fleshy = 1},
		}, nil)
		end
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1., {
			full_punch_interval = 1.,
			damage_groups = {fleshy = 1},
		}, nil)
	end,

	hit_node = function(self, pos, node)
		self.object:remove()
	end,
})

mobs:register_mob("mobs_loz:ganon", {
	type = "monster",
	passive = false,
	attack_type = "dogshoot",
	shoot_interval = 1.5,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
	arrow = "mobs_loz:swdbm",
	shoot_offset = 1,
	damage = 3,
	reach = 5,
	hp_min = 202,
	hp_max = 225,
	armor = 80,
	collisionbox = {-1, 0, -1, 1, 2.5, 1},
	visual_size = {x=1.3, y=1.3},
	visual = "mesh",
	mesh = "ganon.b3d",
	textures = {
		{"mobs_ganon.png"}
	},
	visual_size = {x=2, y=2},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_pig_angry_slow",
	},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	view_range = 28,
	drops = {
		{name = "mtools:triforce", chance = 1, min = 1, max = 1},
		{name = "mtools:heart", chance = 1, min = 3, max = 3},
	},
	do_custom = function(self)
		local pos = self.object:get_pos()	if not pos then return end
		local sphere = core.find_node_near(pos, 11, {"mapgen:ganon_sphere"})
	if sphere then
		if self.health <= 100 then
 self.health = 222
 self.object:set_hp(222)
 self.object:set_animation({x=85, y=105}, 12)
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
	texture = "mobs_loz_light.png^[colorize:red:100",
	glow = 9 })
core.add_particlespawner({
	amount = 15,
	time = .25,
	pos = sphere,
	minvel = {x=-1, y=-1, z=-1},
	maxvel = {x=1, y=1, z=1},
	minacc = {x=0, y=.2, z=0},
	maxacc = {x=0, y=.2, z=0},
	exptime = {min = 1, max = 1.3},
	minsize = 1,
	maxsize = 4,
	texture = "mobs_loz_light.png^[colorize:red:100",
	glow = 9 })
		end
	end
	end,
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
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 16,
		speed_run = 19,
		stand_start = 36,
		stand_end = 56,
		walk_start = 60,
		walk_end = 80,
		run_start = 60,
		run_end = 80,
		punch_start = 1,
		punch_end = 20,
		shoot_start = 20, 
		shoot_end = 36,
	}
})

mobs:register_egg("mobs_loz:ganon", "Boss Ganon", "default_dirt.png", 1)