--baby dodongo by D00Med
-- edit of Stone Monster by PilzAdam

mobs:register_mob("mobs_loz:bdodongo", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 1,
	damage = 1,
	hp_min = 12,
	hp_max = 25,
	armor = 160,
	collisionbox = {-.2, -.1, -.2, .2, .4, .2},
	visual = "mesh",
	mesh = "bdodongo.b3d",
	textures = {
	{"mobs_bdodongo.png"},
	},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_stonemonster",
	},
	walk_velocity = .5,
	run_velocity = 1,
	jump = false,
	floats = 0,
	view_range = 5,
	drops = {
		{name = "mapgen:blue_rupee", chance = 3, min = 3, max = 5},
		{name = "default:iron_lump", chance=5, min=1, max=2},
		{name = "default:coal_lump", chance=3, min=1, max=3},
		{name = "mtools:heart", chance = 4, min = 1, max = 1},
	},
	water_damage = 5,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 10,
		speed_run = 15,
		stand_start = 3,
		stand_end = 3,
		walk_start = 3,
		walk_end = 21,
		run_start = 3,
		run_end = 21,
		punch_start = 3,
		punch_end = 21,
	},
	on_die = function(self, pos)
		core.set_node(pos, {name = "fire:basic_flame"})
	end,
})

mobs:register_egg("mobs_loz:bdodongo", "Baby Dodongo", "default_lava.png", 1)


mobs:register_mob("mobs_loz:dodongo", {
	type = "monster",
	passive = false,
	attack_type = "dogshoot",
	shoot_interval = 2.5,
	arrow = "mobs_loz:fire",
	shoot_offset = 2,
	reach = 2,
	damage = 2,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
	hp_min = 22,
	hp_max = 35,
	armor = 100,
	collisionbox = {-.5, 0, -.5, .5, 1, .5},
	visual_size = {x=.5, y=.5},
	visual = "mesh",
	mesh = "dodongo.b3d",
	textures = {
		{"mobs_dodongo.png"}
	},
	makes_footstep_sound = true,
	sounds = {
		random = "dinosaur_roar",
	},
	walk_velocity = .5,
	run_velocity = 1,
	jump = false,
	floats = 0,
	view_range = 13,
	drops = {
		{name = "mapgen:blue_rupee", chance = 4, min = 3, max = 5},
		{name = "default:copper_lump", chance=10, min=1, max=2},
		{name = "default:coal_lump", chance=10, min=1, max=3},
		{name = "mtools:heart", chance = 5, min = 1, max = 1},
	},
	water_damage = 5,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 14,
		speed_run = 18,
		stand_start = 25,
		stand_end = 45,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
		punch_start = 45,
		punch_end = 65,
		shoot_start = 45,
		shoot_end = 65,
	},
	on_die = function(self, pos)
		core.set_node(pos, {name = "fire:basic_flame"})
	end,
})

mobs:register_egg("mobs_loz:dodongo", "Dodongo", "default_lava.png", 1)

mobs:register_arrow("mobs_loz:fire", {
	visual = "sprite",
	visual_size = {x = .01, y = .01},
	textures = {"blank.png"},
	velocity = 4,
	tail = 1, -- enable tail
	tail_texture = "fire_basic_flame.png",
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
		local n = core.get_node(pos)
		if not n then
			return-- Nodes not yet loaded, try later
		end
		if core.registered_nodes[n.name].groups.flammable then
			core.set_node(pos, {name="fire:basic_flame"})
		elseif core.get_item_group(n.name, "soil") > 0 or n.name == "default:compost_pile" or n.name == "default:mud" then
			if n.name == "default:clay_dirt"
			or n.name == "default:clay_dirt_with_savanna_grass"
			or n.name == "farming:clay_soil"
			or n.name == "farming:clay_soil_wet"
			or n.name == "es:clay_dirt_with_aiden_grass" then
				core.set_node(pos, {name = "default:dry_clay_dirt"})
			else
				core.set_node(pos, {name = "default:dry_dirt"})
			end
			core.get_node_timer(pos):start(math.random(3, 5))
		else
	n.name = default.moss_death_correspondences[n.name]
	if n.name then
		core.set_node(pos, n)
	end
		end
		self.object:remove()
	end,
})

mobs:register_mob("mobs_loz:dodongo_boss", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 3,
	hp_min = 82,
	hp_max = 125,
	armor = 80,
	extra_energy = 3,
	collisionbox = {-1.4, 0, -1.4, 1.4, 2, 1.4},
	visual = "mesh",
	mesh = "dodongo.b3d",
	textures = {
		{"mobs_dodongo_boss.png"}
	},
	makes_footstep_sound = true,
	sounds = {
		random = "dinosaur_roar",
	},
	walk_velocity = 2,
	run_velocity = 3.5,
	jump = false,
	floats = 0,
	view_range = 14,
	drops = {
		{name = "mapgen:earthstone", chance = 1, min = 1, max = 1},
		{name = "mtools:heart", chance = 2, min = 1, max = 1},
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
	water_damage = 5,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 12,
		speed_run = 15,
		stand_start = 25,
		stand_end = 45,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
		punch_start = 45,
		punch_end = 65,
		shoot_start = 45,
		shoot_end = 65,
	},
})

--mobs:register_spawn("mobs_loz:dodongo_boss", {"mapgen:dodongo_spawn"}, 20, 0, 7000, 1, 31000)

mobs:register_egg("mobs_loz:dodongo_boss", "Boss Dodongo", "default_lava.png", 1)