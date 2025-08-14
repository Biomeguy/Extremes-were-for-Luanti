
mobs:register_mob("dmobs:zombie", {
	type = "monster",
	reach = 1.4,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 20,
	hp_max = 30,
	armor = 120,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {
		{"dmobs_zombie.png"},
	},
	blood_texture = "mobs_rotten_blood.png",
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 1.5,
	jump = true,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 2,
	fall_damage = 1,
	view_range = 15,
	drops = {
		{name = "mobs:zombie_flesh", chance = 2, min = 1, max = 2},
	},
	animation = {
		speed_normal = 27,
		speed_run = 27,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
})

mobs:register_egg("dmobs:zombie", "Zombie", "fabric_block_dark_green.png", 1)

mobs:register_mob("dmobs:zombie_brute", {
	type = "monster",
	reach = 3,
	damage = 4,
	attack_type = "dogshoot",
	shoot_interval = 3,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =1,
	arrow = "dmobs:rock",
	shoot_offset = 1,
	hp_min = 60,
	hp_max = 80,
	armor = 100,
	collisionbox = {-0.7,0,-0.7, 0.7,2,0.7},
	visual = "mesh",
	mesh = "zombie_brute.b3d",
	textures = {
		{"dmobs_zombie_brute.png"},
	},
	blood_texture = "mobs_rotten_blood.png",
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 1.5,
	jump = true,
	water_damage = 1,
	lava_damage = 2,
	light_damage = 1,
	fall_damage = 0,
	view_range = 15,
	drops = {
		{name = "mobs:zombie_flesh", chance = 2, min = 2, max = 5},
	},
	animation = {
		speed_normal = 27,
		speed_run = 35,
		stand_start = 1,
		stand_end = 20,
		walk_start = 45,
		walk_end = 65,
		run_start = 45,
		run_end = 65,
		punch_start = 20,
		punch_end = 40,
		shoot_start = 75,
		shoot_end = 95,
	},
})

mobs:register_egg("dmobs:zombie_brute", "Zombie Brute (boss)", "default_dirt.png", 1)

mobs:register_arrow("dmobs:rock", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"default_stone_rock.png"},
	velocity = 8,

	hit_player = function(self, player)
		player:punch(self.object, 1., {
			full_punch_interval = 1.,
			damage_groups = {fleshy = 5},
		}, nil)
		core.add_item(self.object:get_pos(), {name = "default:rock"})
	end,
   
	hit_mob = function(self, player)
		player:punch(self.object, 1., {
			full_punch_interval = 1.,
			damage_groups = {fleshy = 5},
		}, nil)
	end,

	hit_node = function(self, pos, node)
		if core.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
	core.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name="default:rock"})
		else
	core.add_item(self.object:get_pos(), {name = "default:rock"})
		end
		self.object:remove()
	end,

	on_activate = function(self)
		self.object:set_properties({visual_size = {x=0, y=0},})
		local pos = self.object:get_pos()
		local velo = self.object:get_velocity()
		self.object:set_pos({x=pos.x, y=pos.y+1.5, z=pos.z})
		core.after(.5, function()
		self.object:set_properties({visual_size = {x=1, y=1},})
		--self.object:set_velocity({x=velo.x*8, y=0, z=velo.z*8})
		self.object:set_acceleration({x=velo.x*8, y=-9, z=velo.z*8})
		end)
	end
})

mobs:register_mob("dmobs:swamp_lurker", {
	type = "monster",
	reach = 1,
	damage = 1,
	attack_type = "dogfight",
	hp_min = 30,
	hp_max = 40,
	armor = 120,
	visual_size = {x=.7, y=.7},
	collisionbox = {-.2, 0, -.2, .2, 1.3, .2},
	visual = "mesh",
	mesh = "swamplurker.b3d",
	textures = {
		{"dmobs_swamplurker.png"},
	},
	blood_texture = "default_dirt.png",
	makes_footstep_sound = true,
	walk_velocity = .8,
	run_velocity = 1,
	jump = true,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	view_range = 10,
	drops = {
		{name = "mobs:zombie_flesh", chance = 2, min = 1, max = 2},
	},
	animation = {
		speed_normal = 14,
		speed_run = 18,
		stand_start = 1,
		stand_end = 25,
		walk_start = 55,
		walk_end = 75,
		run_start = 55,
		run_end = 75,
		punch_start = 26,
		punch_end = 50,
	},
})

mobs:register_egg("dmobs:swamp_lurker", "Swamp Lurker", "default_dirt.png", 1)

core.register_craftitem(":mobs:zombie_flesh", {
	description = "Zombie Flesh",
	inventory_image = "dmobs_zombie_flesh.png",
	on_use = core.item_eat(-3, "bonemeal:bone"),
	groups = {flammable = 2},
})

core.register_craft({
	output = "bonemeal:bone",
	recipe = {{"mobs:zombie_flesh"}},
	replacements = {{"mobs:zombie_flesh", "farming:spent_biomasse"}}
})

mobs:register_mob("dmobs:witch", {
	type = "monster",
	shoot_offset = 0.7,
	shoot_interval = 1,
	arrow = "dmobs:witch_ball",
	attack_type = "shoot",
	hp_min = 30,
	hp_max = 40,
	armor = 100,
	collisionbox = {-0.35,0,-0.35, 0.35,1.8,0.35},
	visual = "mesh",
	mesh = "witch.b3d",
	textures = {
		{"dmobs_witch.png"},
	},
	makes_footstep_sound = true,
	walk_velocity = 1.3,
	run_velocity = 1.5,
	jump = true,
	water_damage = 5,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	view_range = 9,
	drops = {
		{name = "default:obsidian", chance = 2, min = 1, max = 2},
		{name = "mtools:pentagram", chance = 4, min = 1, max = 1},
	},
	animation = {
		speed_normal = 16,
		speed_run = 20,
		stand_start = 1,
		stand_end = 30,
		walk_start = 60,
		walk_end = 80,
		run_start = 60,
		run_end = 80,
		shoot_start = 30,
		shoot_end = 50,
	},
})

mobs:register_egg("dmobs:witch", "Witch", "fabric_block_violet.png", 1)

mobs:register_arrow("dmobs:witch_ball", {
	visual = "sprite",
	visual_size = {x = .2, y = .2},
	textures = {"dmobs_witch_ball.png"},
	velocity = 4,
	glow = 14,

	hit_player = function(self, player)
		player:punch(self.object, 1., {
			full_punch_interval = 1.,
			damage_groups = {fleshy = 3},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1., {
			full_punch_interval = 1.,
			damage_groups = {fleshy = 3},
		}, nil)
	end,

	hit_node = function(self, pos, node)
		self.object:remove()
	end
})

mobs:register_mob("dmobs:crabspider", {
	type = "monster",
	reach = 1,
	damage = 1,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 20,
	armor = 110,
	collisionbox = {-0.35,0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "crabspider.b3d",
	textures = {
		{"mobs_crabspider.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	walk_velocity = 1.5,
	run_velocity = 2,
	jump = true,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	view_range = 17,
	--drops = {
	--	{name = "default:dirt", chance = 2, min = 1, max = 1},
	--},
	animation = {
		normal_speed = 20,
		run_speed = 25,
		stand_start = 1,
		stand_end = 13,
		walk_start = 20,
		walk_end = 40,
		run_start = 20,
		run_end = 40,
		punch_start = 45,
		punch_end = 65,
	},
})

mobs:register_egg("dmobs:crabspider", "Crab Spider", "default_obsidian.png", 1)

mobs:register_mob("dmobs:beetle", {
	type = "monster",
	reach = 1,
	damage = 1,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 20,
	armor = 110,
	collisionbox = {-0.35,0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "beetle.b3d",
	textures = {
		{"mobs_beetle.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 1.5,
	jump = true,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	view_range = 15,
	drops = {
		{name = "default:dirt", chance = 2, min = 1, max = 1},
	},
	animation = {
		speed_normal = 27,
		speed_run = 27,
		stand_start = 1,
		stand_end = 20,
		walk_start = 25,
		walk_end = 45,
		run_start = 25,
		run_end = 45,
		punch_start = 1,
		punch_end = 20,
	},
})

mobs:register_egg("dmobs:beetle", "Giant Beetle", "default_desert_sand.png", 1)

mobs:register_mob("dmobs:bear", {
	type = "animal",
	passive = false,
	reach = 2.2,
	damage = 3,
	attack_type = "dogfight",
	hp_min = 30,
	hp_max = 40,
	armor = 100,
	visual_size = {x=1, y=1},
	collisionbox = {-0.7, 0,-0.7, 0.7,1.8,0.7},
	visual = "mesh",
	mesh = "bear.b3d",
	textures = {
		{"mobs_bear.png"},
	},
	blood_texture = "default_dirt.png",
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	view_range = 10,
	drops = {
		{name = "mobs:meat_raw", chance = 2, min = 2, max = 3},
	},
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "dmobs:smallfish_raw" then
			item:take_item()
			self.state = "stand"
			self.object:set_animation({x=55, y=75}, 18, 0)
		end
	end,
	animation = {
		speed_normal = 14,
		speed_run = 18,
		stand_start = 1,
		stand_end = 11,
		walk_start = 15,
		walk_end = 30,
		run_start = 15,
		run_end = 30,
		punch_start = 35,
		punch_end = 50,
	},
})

mobs:register_egg("dmobs:bear", "Brown Bear", "mobs_bear.png", 1)

mobs:register_mob("dmobs:cavecrab", {
	type = "animal",
	passive = false,
	reach = 1,
	damage = 1,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 20,
	armor = 110,
	collisionbox = {-0.35,0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "cavecrab.b3d",
	textures = {
		{"mobs_cavecrab.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	walk_velocity = 1.5,
	run_velocity = 2.5,
	jump = true,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	view_range = 17,
	drops = {
		{name = "default:rocks", chance = 2, min = 1, max = 1},
	},
	animation = {
	--different stand animation from 1 to 15
		normal_speed = 20,
		run_speed = 25,
		stand_start = 45,
		stand_end = 65,
		walk_start = 20,
		walk_end = 40,
		run_start = 20,
		run_end = 40,
		punch_start = 20,
		punch_end = 40,
	},
})

mobs:register_egg("dmobs:cavecrab", "Cave Crab", "default_sand.png", 1)

-- wild chicken from mobs_animal (see mobs_redo)

mobs:register_mob("dmobs:wild_chicken", {
	stepheight = 0.6,
	type = "animal",
	passive = true,
	hp_min = 5,
	hp_max = 10,
	armor = 200,
	collisionbox = {-0.2, 0, -0.2, 0.2, 0.45, 0.2},
	visual = "mesh",
	mesh = "wild_chicken.b3d",
	textures = {
		{"mobs_wild_chicken.png"},
	},
	child_texture = {
		{"mobs_wild_chicken.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_chicken",
	},
	walk_velocity = 1,
	run_velocity = 3,
	runaway = true,
	runaway_from = {"player", "mobs_animal:pumba"},
	jump = true,
	drops = {
		{name = "mobs:wild_chicken_raw", chance = 1, min = 1, max = 1},
		{name = "mobs:chicken_feather", chance = 1, min = 0, max = 2},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fall_damage = 0,
	fall_speed = -8,
	fear_height = 5,
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 20,
		walk_start = 25,
		walk_end = 45,
	},
	follow = {"farming:seed_wheat", "farming:seed_cotton"},
	view_range = 5,

	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 30, 50, 80, false, nil) then return end
	end,

	do_custom = function(self, dtime)

		self.egg_timer = (self.egg_timer or 0) + dtime
		if self.egg_timer < 10 then
			return
		end
		self.egg_timer = 0

		if self.child or math.random(1, 100) > 1 then
			return
		end

		local pos = self.object:get_pos()

		core.add_item(pos, "mobs:egg2")

		core.sound_play("default_place_node_hard", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5,
		})
	end,
})

mobs:register_egg("dmobs:wild_chicken", "Wild Chicken", "fabric_block_brown.png", 1)

-- egg entity
mobs:register_arrow("dmobs:egg_entity", {
	visual = "sprite",
	visual_size = {x=.5, y=.5},
	textures = {"mobs_chicken_egg.png"},
	velocity = 6,

	hit_player = function(self, player)
		player:punch(core.get_player_by_name(self.playername) or self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 1},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(core.get_player_by_name(self.playername) or self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 1},
		}, nil)
	end,

	hit_node = function(self, pos, node)

		if math.random(1, 10) > 1 then
			return
		end

		pos.y = pos.y + 1

		local nod = core.get_node_or_nil(pos)

		if not nod
		or not core.registered_nodes[nod.name]
		or core.registered_nodes[nod.name].walkable == true then
			return
		end

		local mob = core.add_entity(pos, "dmobs:wild_chicken")
		local ent2 = mob:get_luaentity()

		mob:set_properties({
			textures = ent2.child_texture[1],
			visual_size = {
				x = ent2.base_size.x / 2,
				y = ent2.base_size.y / 2
			},
			collisionbox = {
				ent2.base_colbox[1] / 2,
				ent2.base_colbox[2] / 2,
				ent2.base_colbox[3] / 2,
				ent2.base_colbox[4] / 2,
				ent2.base_colbox[5] / 2,
				ent2.base_colbox[6] / 2
			},
		})

		ent2.child = true
		ent2.tamed = true
		ent2.owner = self.playername
	end
})

-- egg throwing item

local egg_GRAVITY = 9
local egg_VELOCITY = 19

-- shoot egg
local mobs_shoot_egg = function (item, player, pointd)

	local playerpos = player:get_pos()

	core.sound_play("default_place_node_hard", {
		pos = playerpos,
		gain = 1.0,
		max_hear_distance = 5,
	})

	local obj = core.add_entity({
		x = playerpos.x,
		y = playerpos.y +1.5,
		z = playerpos.z
	}, "dmobs:egg_entity")

	local ent = obj:get_luaentity()
	local dir = player:get_look_dir()

	ent.velocity = egg_VELOCITY -- needed for api internal timing
	ent.switch = 1 -- needed so that egg doesn't despawn straight away

	obj:setvelocity({
		x = dir.x * egg_VELOCITY,
		y = dir.y * egg_VELOCITY,
		z = dir.z * egg_VELOCITY
	})

	obj:setacceleration({
		x = dir.x * -3,
		y = -egg_GRAVITY,
		z = dir.z * -3
	})

	-- pass player name to egg for chick ownership
	local ent2 = obj:get_luaentity()
	ent2.playername = player:get_player_name()

	item:take_item()

	return item
end

-- egg
core.register_node(":mobs:egg2", {
	description = "Wild Chicken Egg",
	tiles = {"mobs_chicken_egg.png"},
	inventory_image  = "mobs_chicken_egg.png",
	visual_scale = 0.7,
	drawtype = "plantlike",
	wield_image = "mobs_chicken_egg.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {snappy = 2, dig_immediate = 3, egg = 1},
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			core.set_node(pos, {name = "mobs:egg2", param2 = 1})
		end
	end,
	on_use = mobs_shoot_egg
})

-- fried egg
core.register_craftitem(":mobs:wild_chicken_egg_fried", {
	description = "Fried Wild Egg",
	inventory_image = "mobs_wild_chicken_egg_fried.png",
	on_use = core.item_eat(2),
	groups = {egg_fried = 1, flammable = 2},
})

core.register_craft({
	type = "cooking",
	recipe = "mobs:egg2",
	output = "mobs:wild_chicken_egg_fried",
})

-- raw chicken
core.register_craftitem(":mobs:wild_chicken_raw", {
	description = "Raw Wild Chicken",
	inventory_image = "mobs_wild_chicken_raw.png",
	on_use = core.item_eat(2, "bonemeal:bone 3"),
	groups = {meat_raw = 1, chicken_raw = 1, flammable = 2},
})

-- cooked chicken
core.register_craftitem(":mobs:wild_chicken_cooked", {
	description = "Cooked Wild Chicken",
	inventory_image = "mobs_wild_chicken_cooked.png",
	on_use = core.item_eat(6, "bonemeal:bone 3"),
	groups = {meat = 1, chicken = 1, flammable = 2},
})

core.register_craft({
	type = "cooking",
	recipe = "mobs:wild_chicken_raw",
	output = "mobs:wild_chicken_cooked",
})
