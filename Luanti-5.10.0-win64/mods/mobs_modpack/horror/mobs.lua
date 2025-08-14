
--arrows
mobs:register_arrow("horror:fireball", {
	visual = "sprite",
	visual_size = {x = .5, y = .5},
	textures = {"horror_fireball.png"},
	velocity = 8,
	glow = 14,
	tail = 1, -- enable tail
	tail_texture = "horror_steam.png",

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 3},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 3},
		}, nil)
	end,

	hit_node = function(self)
		self.object:remove()
	end,
})

mobs:register_arrow("horror:fireball_2", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"horror_fireshot.png"},
	velocity = 8,
	glow = 14,
	tail = 1, -- enable tail
	tail_texture = "horror_flame.png",
	tail_glow = 12,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_node = function(self)
		self.object:remove()
	end,
})

mobs:register_arrow("horror:fireball_4", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"plasma.png"},
	velocity = 6,
	glow = 14,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 3},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 3},
		}, nil)
	end,

	hit_node = function(self)
		self.object:remove()
	end,
})


--mobs, spawning and eggs
mobs:register_mob("horror:hellbaron", {
	type = "monster",
	attack_monsters = true,
	damage = 3,
	reach = 2,
	attack_type = "dogshoot",
	shoot_interval = 2.5,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max = 5,
	arrow = "horror:fireball_2",
	shoot_offset = .5,
	hp_min = 40,
	hp_max = 55,
	armor = 80,
	collisionbox = {-.5, 0, -.5, .5, 3, .5},
	visual = "mesh",
	mesh = "hellbaron.b3d",
	textures = {
		{"horror_hellbaron.png"},
	},
	blood_amount = 80,
	blood_texture = "horror_blood_effect.png",
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 3.5,
	jump = true,
	drops = {
		{name = "mobs:meat_raw", chance = 2, min = 1, max = 1},
		{name = "default:steel_ingot", chance = 1, min = 1, max = 5},
	},
	water_damage = 2,
	fire_damage = -2,
	lava_damage = 0,
	light_damage = 0,
	view_range = 20,
	replace_rate = 5,
	replace_what = {
		{"group:grass", "horror:gfire", 0},
		{"air", "horror:gfire", 0},
	},
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 51,
		walk_end = 75,
		stand_start = 1,
		stand_end = 25,
		run_start = 51,
		run_end = 75,
		punch_start = 25,
		punch_end = 50,
		shoot_start = 25,
		shoot_end = 50,
	},
})

mobs:register_spawn("horror:hellbaron", {"default:lava_source", "default:stone"}, 20, 0, 15000, 2, 31000)

mobs:register_egg("horror:hellbaron", "Hell Baron", "default_dirt.png", 1)

mobs:register_mob("horror:spider", {
	type = "monster",
	reach = 2,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 32,
	hp_max = 42,
	armor = 130,
	collisionbox = {-.6, 0, -.6, .6, 1.5, .6},
	visual = "mesh",
	mesh = "hspider.b3d",
	textures = {
		{"hspider.png"},
	},
	blood_amount = 80,
	blood_texture = "horror_blood_effect.png",
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	walk_velocity = 2.5,
	run_velocity = 3.1,
	sounds = {
		random = "mobs_spider",
		attack = "mobs_spider",
	},
	jump = true,
	drops = {
		{name = "mobs:meat_raw", chance = 2, min = 1, max = 1},
		{name = "horror:spiderweb", chance = 1, min = 3, max = 6},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	replace_rate = 20,
	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "air"},
	replace_with = "horror:spiderweb",
	animation = {
		speed_normal = 10,
		speed_run = 15,
		walk_start = 45,
		walk_end = 65,
		run_start = 45,
		run_end = 65,
		stand_start = 1,
		stand_end = 20,
		punch_start = 20,
		punch_end = 40,
	},
})

mobs:register_spawn("horror:spider", {"default:beech_leaves","default:stone"}, 20, 0, 15000, 2, 31000)

mobs:register_egg("horror:spider", "Giant Spider", "default_obsidian.png", 1)

mobs:register_mob("horror:ghost", {
	type = "monster",
	reach = 2,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 32,
	hp_max = 42,
	armor = 130,
	exen_drop = false,
	collisionbox = {-.3, 0, -.3, .3, 1.5, .3},
	visual = "mesh",
	mesh = "ghost.b3d",
	textures = {
		{"horror_ghost.png"},
	},
	blood_amount = 0,
	visual_size = {x=2, y=2.6},
	makes_footstep_sound = false,
	walk_velocity = 1,
	run_velocity = 2.1,
	sounds = {
		random = "mobs_oerkki",
		attack = "mobs_oerkki",
	},
	jump = true,
	drops = {
		{name = "farming:cotton", chance = 10, min = 1, max = 1},
	},
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item():get_name()
		if item == "horror:ring" then
			local pos = self.object:get_pos()
			local obj = core.add_entity(pos, "horror:ghost_friendly")
			local ghost = obj:get_luaentity()
			ghost.tamed = true
			ghost.owner = clicker:get_player_name()
			self.object:remove()
		end
	end,
	do_custom = function(self)
		if math.random(1, 5000) == 1 then
			local pos = self.object:get_pos()
			core.add_item(pos, "horror:ring")
		end
	end,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	suffocation = false,
	view_range = 5,
	glow = 4,
	animation = {
		speed_normal = 10,
		speed_run = 15,
		walk_start = 1,
		walk_end = 20,
		run_start = 30,
		run_end = 50,
		stand_start = 1,
		stand_end = 2,
		punch_start = 50,
		punch_end = 70,
	},
})

mobs:register_mob("horror:ghost_friendly", {
	type = "npc",
	attack_monsters = true,
	attack_npcs = false,
	reach = 2,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 32,
	hp_max = 42,
	armor = 130,
	exen_drop = false,
	collisionbox = {-.3, 0, -.3, .3, 1.5, .3},
	visual = "mesh",
	mesh = "ghost.b3d",
	textures = {
		{"horror_ghost.png"},
	},
	blood_amount = 0,
	visual_size = {x=2, y=2.6},
	makes_footstep_sound = false,
	walk_velocity = 1,
	run_velocity = 2.1,
	sounds = {
		random = "mobs_oerkki",
		attack = "mobs_oerkki",
	},
	follow = "horror:ring",
	owner = "",
	jump = true,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	suffocation = false,
	view_range = 15,
	glow = 4,
	animation = {
		speed_normal = 10,
		speed_run = 15,
		walk_start = 1,
		walk_end = 20,
		run_start = 30,
		run_end = 50,
		stand_start = 1,
		stand_end = 2,
		punch_start = 50,
		punch_end = 70,
	},
})

mobs:register_spawn("horror:ghost", {"default:snow_block","default:sand", "default:dirt_with_snow"}, 20, 0, 15000, 2, 31000)

mobs:register_egg("horror:ghost", "Ghost", "default_snow.png", 1)

mobs:register_mob("horror:skeleton", {
	type = "monster",
	reach = 3,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 62,
	hp_max = 72,
	armor = 100,
	collisionbox = {-.4, 0, -.4, .4, 2.5, .4},
	visual = "mesh",
	mesh = "horror_skeleton.b3d",
	textures = {
		{"horror_skeleton.png"},
	},
	blood_texture = "default_stone.png",
	visual_size = {x=.8, y=.8},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2.5,
	jump = true,
	drops = {
		{name = "bones:bones", chance = 5, min = 3, max = 6},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 1,
	fall_damage = 0,
	fear_height = 10,
	view_range = 14,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		walk_start = 46,
		walk_end = 66,
		stand_start = 1,
		stand_end = 20,
		run_start = 46,
		run_end = 66,
		punch_start = 20,
		punch_end = 45,
	},
})

mobs:register_spawn("horror:skeleton", {"default:stone"}, 7, 0, 16000, 2, 31000)

mobs:register_egg("horror:skeleton", "Skeleton", "default_dirt.png", 1)

mobs:register_mob("horror:dragon", {
	type = "monster",
	attack_monsters = true,
	damage = 8,
	reach = 3,
	attack_type = "dogshoot",
	shoot_interval = 3.5,
	arrow = "horror:fireball",
	shoot_offset = 1,
	hp_min = 50,
	hp_max = 85,
	armor = 90,
	collisionbox = {-.6, -.9, -.6, .6, .6, .6},
	visual = "mesh",
	mesh = "dragon_new.b3d",
	textures = {
		{"horror_dragon.png"},
	},
	blood_amount = 90,
	blood_texture = "horror_blood_effect.png",
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	sounds = {
		shoot_attack = "mobs_fireball",
	},
	walk_velocity = 3,
	run_velocity = 5,
	jump = true,
	fly = true,
	drops = {
		{name = "mobs:lava_orb", chance = 2, min = 1, max = 3},
		{name = "horror:sunorb", chance = 2, min = 1, max = 3},
		{name = "horror:gloworb", chance = 2, min = 1, max = 3},
		{name = "default:diamond", chance = 2, min = 1, max = 3},
	},
	fall_speed = 0,
	stepheight = 10,
	water_damage = 2,
	lava_damage = 0,
	light_damage = 0,
	view_range = 20,
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 1,
		walk_end = 22,
		stand_start = 1,
		stand_end = 22,
		run_start = 1,
		run_end = 22,
		punch_start = 22,
		punch_end = 47,
	},
})

mobs:register_spawn("horror:dragon", {"default:pine_needles",}, 20, 0, 35000, 200, 31000)

mobs:register_egg("horror:dragon", "Zombie Dragon", "horror_orb.png", 1)

mobs:register_mob("horror:lost_soul", {
	type = "monster",
	attack_monsters = true,
	damage = 1,
	reach = 3,
	attack_type = "dogfight",
	hp_min = 30,
	hp_max = 45,
	armor = 80,
	exen_drop = false,
	collisionbox = {-.4, -.1, -.4, .4, 1.5, .4},
	visual = "mesh",
	mesh = "lost_soul.b3d",
	textures = {
		{"lost_soul.png"},
	},
	blood_texture = "horror_flame.png",
	visual_size = {x=3, y=3},
	makes_footstep_sound = false,
	walk_velocity = 3,
	run_velocity = 5,
	jump = true,
	fly = true,
	do_custom = function(self)
		local pos = self.object:get_pos() if not pos then return end
		core.add_particlespawner({
			amount = 8,
			time = .3,
			minpos = {x=pos.x-.3, y=pos.y+.6, z=pos.z-.3},
			maxpos = {x=pos.x+.3, y=pos.y+.5, z=pos.z+.3},
			minacc = {x=-.5,y=1.5,z=-.5},
			maxacc = {x=.5,y=1.5,z=.5},
			exptime = {min = 1, max = 2},
			minsize = 3,
			maxsize = 5,
			texture = "horror_flame2.png",
			glow = 2 })
	end,
	fall_speed = 0,
	stepheight = 10,
	water_damage = 2,
	lava_damage = 0,
	light_damage = 0,
	view_range = 20,
	glow = 4,
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 20,
		walk_end = 40,
		stand_start = 1,
		stand_end = 20,
		run_start = 20,
		run_end = 40,
		punch_start = 40,
		punch_end = 65,
	},
})

mobs:register_spawn("horror:lost_soul", {"fire:basic_flame","default:beech_leaves"}, 20, 0, 15000, 2, 31000)

mobs:register_egg("horror:lost_soul", "Lost Soul", "horror_gfire_inv.png", 1)

mobs:register_mob("horror:cacodemon", {
	type = "monster",
	attack_monsters = true,
	damage = 8,
	reach = 3,
	attack_type = "shoot",
	shoot_interval = 2.5,
	arrow = "horror:fireball_4",
	shoot_offset = 1,
	hp_min = 30,
	hp_max = 45,
	armor = 80,
	collisionbox = {-.9, -.2, -.9, .9, 1.5, .9},
	visual = "mesh",
	mesh = "cacodemon.b3d",
	textures = {
		{"horror_cacodemon.png"},
	},
	blood_amount = 80,
	blood_texture = "plasma.png",
	visual_size = {x=2, y=2},
	makes_footstep_sound = true,
	walk_velocity = 3,
	run_velocity = 5,
	jump = true,
	fly = true,
	drops = {
		{name = "horror:sunorb", chance = 2, min = 1, max = 3},
		{name = "horror:gloworb", chance = 3, min = 1, max = 3},
	},
	fall_speed = 0,
	stepheight = 10,
	water_damage = 2,
	lava_damage = 0,
	light_damage = 0,
	view_range = 20,
	do_custom = function(self)
		local pos = self.object:get_pos() if not pos then return end
		core.add_particlespawner({
			amount = 1,
			time = .3,
			minpos = {x=pos.x-.3, y=pos.y-.2, z=pos.z-.3},
			maxpos = {x=pos.x+.3, y=pos.y-.3, z=pos.z+.3},
			minacc = {x=-.5,y=-1,z=-.5},
			maxacc = {x=.5,y=-1,z=.5},
			exptime = {min = 3, max = 5},
			minsize = 3,
			maxsize = 5,
			collisiondetection = true,
			texture = "horror_dust.png"})
	end,
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 1,
		walk_end = 20,
		stand_start = 1,
		stand_end = 20,
		run_start = 1,
		run_end = 20,
		shoot_start = 20,
		shoot_end = 40,
	},
})

mobs:register_spawn("horror:cacodemon", {"fire:basic_flame","default:lava_flowing"}, 20, 0, 15000, 2, 31000)

mobs:register_egg("horror:cacodemon", "Cacodemon", "fabric_block_red.png", 1)

mobs:register_mob("horror:mogall", {
	type = "monster",
	attack_monsters = true,
	damage = 2,
	reach = 3,
	attack_type = "dogfight",
	hp_min = 30,
	hp_max = 45,
	armor = 80,
	collisionbox = {-.3, 0, -.3, .3, 1, .3},
	visual = "mesh",
	mesh = "mogall.b3d",
	textures = {
		{"mogall.png"},
	},
	blood_amount = 80,
	blood_texture = "horror_blood_effect.png",
	visual_size = {x=4, y=4},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	fly = true,
	fall_speed = 0,
	stepheight = 1.5,
	water_damage = 2,
	lava_damage = 0,
	light_damage = 0,
	view_range = 30,
	do_custom = function(self)
		local pos = self.object:get_pos() if not pos then return end
		core.add_particlespawner({
			amount = 1,
			time = .3,
			minpos = {x=pos.x-.3, y=pos.y+.3, z=pos.z-.3},
			maxpos = {x=pos.x+.3, y=pos.y+.2, z=pos.z+.3},
			minacc = {x=-.5,y=1,z=-.5},
			maxacc = {x=.5,y=1.2,z=.5},
			exptime = {min = 1, max = 3},
			minsize = 2,
			maxsize = 3,
			texture = "horror_shadow.png"})
	end,
	animation = {
		speed_normal = 5,
		speed_run = 6,
		walk_start = 20,
		walk_end = 60,
		stand_start = 1,
		stand_end = 20,
		run_start = 20,
		run_end = 60,
		punch_start = 20,
		punch_end = 60,
	},
})

mobs:register_spawn("horror:mogall", {"default:jungle_leaves",}, 20, 0, 15000, 2, 31000)

mobs:register_egg("horror:mogall", "Mogall", "mogall.png", 1)

mobs:register_mob("horror:manticore", {
	type = "monster",
	attack_monsters = true,
	damage = 2,
	reach = 3,
	attack_type = "dogfight",
	hp_min = 30,
	hp_max = 45,
	armor = 130,
	collisionbox = {-.5, -.5, -.5, .5, .6, .5},
	visual = "mesh",
	mesh = "manticore.b3d",
	textures = {
		{"manticore.png"},
	},
	blood_amount = 80,
	blood_texture = "horror_blood_effect.png",
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	walk_velocity = 2.5,
	run_velocity = 3.5,
	sounds = {
		random = "manticore",
		attack = "manticore",
	},
	jump = true,
	drops = {
		{name = "default:mud", chance = 1, min = 1, max = 1},
	},
	water_damage = 2,
	lava_damage = 0,
	light_damage = 0,
	view_range = 20,
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 1,
		walk_end = 11,
		stand_start = 1,
		stand_end = 11,
		run_start = 1,
		run_end = 11,
		punch_start = 11,
		punch_end = 26,
	},
})

mobs:register_spawn("horror:manticore", {"default:dirt_with_grass","default:mossycobble"}, 20, 0, 15000, 2, 31000)

mobs:register_egg("horror:manticore", "Manticore", "default_dirt.png", 1)

mobs:register_mob("horror:imp", {
	type = "monster",
	attack_monsters = true,
	damage = 4,
	reach = 2,
	attack_type = "dogshoot",
	shoot_interval = 2.5,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max = 5,
	arrow = "horror:fireball_2",
	shoot_offset = .5,
	hp_min = 40,
	hp_max = 55,
	armor = 80,
	collisionbox = {-.5, 0, -.5, .5, 3, .5},
	visual = "mesh",
	mesh = "imp.b3d",
	textures = {
		{"horror_imp.png"},
	},
	blood_amount = 80,
	blood_texture = "horror_blood_effect.png",
	visual_size = {x=2, y=2},
	makes_footstep_sound = true,
	walk_velocity = 2.5,
	run_velocity = 3.5,
	jump = true,
	drops = {
		{name = "default:coal_lump", chance = 1, min = 1, max = 2},
	},
	water_damage = 2,
	lava_damage = 0,
	light_damage = 0,
	view_range = 20,
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 35,
		walk_end = 55,
		stand_start = 1,
		stand_end = 30,
		run_start = 35,
		run_end = 55,
		punch_start = 60,
		punch_end = 80,
		shoot_start = 80,
		shoot_end = 100,
	},
})

mobs:register_spawn("horror:imp", {"default:dirt","default:mud","default:gravel"}, 20, 0, 15000, 2, 31000)

mobs:register_egg("horror:imp", "Imp", "default_dirt.png", 1)

mobs:register_mob("horror:werewolf", {
	type = "monster",
	attack_monsters = true,
	damage = 4,
	reach = 2,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 100,
	collisionbox = {-.5, 0, -.5, .5, 2, .5},
	visual = "mesh",
	mesh = "werewolf.b3d",
	textures = {
		{"mobs_werewolf.png"},
	},
	blood_amount = 80,
	blood_texture = "horror_blood_effect.png",
	visual_size = {x=2, y=2},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 3.5,
	jump = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 2},
		{name = "default:papyrus", chance = 3, min = 1, max = 6},
	},
	water_damage = 2,
	lava_damage = 0,
	light_damage = 0,
	view_range = 20,
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 45,
		walk_end = 65,
		stand_start = 1,
		stand_end = 20,
		run_start = 66,
		run_end = 86,
		punch_start = 20,
		punch_end = 44,
	},
})

mobs:register_spawn("horror:werewolf", {"default:dirt_with_grass","default:mud","default:gravel"}, 20, 0, 35000, 2, 31000)

mobs:register_egg("horror:werewolf", "Werewolf", "default_gravel.png", 1)

mobs:register_mob("horror:birdie", {
	type = "monster",
	attack_monsters = true,
	damage = 3,
	reach = 3,
	attack_type = "dogfight",
	hp_min = 30,
	hp_max = 45,
	armor = 100,
	collisionbox = {-.5, 0, -.5, .5, 1.6, .5},
	visual = "mesh",
	mesh = "birdie.b3d",
	textures = {
		{"birdie.png"},
	},
	blood_amount = 80,
	blood_texture = "horror_blood_effect.png",
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	view_range = 20,
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 42,
		walk_end = 62,
		stand_start = 1,
		stand_end = 11,
		run_start = 42,
		run_end = 62,
		punch_start = 20,
		punch_end = 35,
	},
})

mobs:register_spawn("horror:birdie", {"default:dirt_with_grass","default:dirt_with_savanna_grass"}, 20, 0, 15000, 2, 31000)

mobs:register_egg("horror:birdie", "Birdie", "default_dirt.png", 1)

mobs:register_mob("horror:pinky", {
	type = "monster",
	attack_monsters = true,
	damage = 1,
	reach = 3,
	attack_type = "dogfight",
	hp_min = 70,
	hp_max = 85,
	armor = 80,
	collisionbox = {-.7, 0, -.7, .7, 1.7, .7},
	visual = "mesh",
	mesh = "pinky.b3d",
	textures = {
		{"pinky.png"},
	},
	blood_amount = 80,
	blood_texture = "horror_blood_effect.png",
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 4,
	jump = true,
	drops = {
		{name = "horror:pitchfork", chance = 2, min = 2, max = 3},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	view_range = 20,
	animation = {
		speed_normal = 20,
		speed_run = 30,
		walk_start = 1,
		walk_end = 20,
		stand_start = 20,
		stand_end = 40,
		run_start = 1,
		run_end = 20,
		punch_start = 40,
		punch_end = 60,
	},
})

mobs:register_spawn("horror:pinky", {"default:sandstone_brick","nether:stone"}, 20, 0, 15000, 2, 31000)

mobs:register_egg("horror:pinky", "Pinky", "pinky.png", 1)

mobs:register_mob("horror:sam", {
	type = "monster",
	attack_monsters = true,
	damage = 1,
	reach = 1,
	attack_type = "dogfight",
	hp_min = 30,
	hp_max = 45,
	armor = 80,
	collisionbox = {-.25, .35, -.25, .25, .9, .25},
	physical = false,
	visual = "mesh",
	mesh = "character.b3d",
	textures = {
		{"horror_sam.png"},
	},
	blood_amount = 60,
	blood_texture = "horror_blood_effect.png",
	visual_size = {x=1, y=1},
	makes_footstep_sound = false,
	walk_velocity = .01,
	run_velocity = 5,
	jump = false,
	water_damage = 2,
	lava_damage = 0,
	light_damage = 0,
	view_range = 20,
	animation = {
		speed_normal = 1,
		speed_run = 1,
		walk_start = 1,
		walk_end = 1,
		stand_start = 1,
		stand_end = 1,
		run_start = 1,
		run_end = 1,
		punch_start = 1,
		punch_end = 1,
	},
})

mobs:register_spawn("horror:sam", {"default:mossycobble","default:sandstone_brick"}, 20, 0, 15000, 2, 31000)

mobs:register_egg("horror:sam", "Sam Head", "default_brick.png", 1)
