
mobs:register_mob("dmobs:ninja", {
	type = "monster",
	attack_monsters = true,
	damage = 3,
	attack_type = "shoot",
	shoot_interval = .5,
	arrow = "dmobs:shuriken",
	shoot_offset = 1,
	hp_min = 10,
	hp_max = 20,
	armor = 100,
	collisionbox = {-.4, -.5, -.4, .4, .4, .4},
	visual = "cube",
	textures = {{"dmobs_ninja.png", "dmobs_ninja.png", "dmobs_ninja.png", "dmobs_ninja.png", "dmobs_ninja.png^mobs_shuriken.png", "dmobs_ninja.png"}},
	blood_texture ="mobs_shuriken.png",
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	drops = {
		{name = "dmobs:shuriken", chance = 1, min = 1, max = 5},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 0,
	view_range = 15,
})

mobs:register_egg("dmobs:ninja", "Ninja", "dmobs_ninja.png", 1)

mobs:register_arrow("dmobs:shuriken", {
	visual = "sprite",
	visual_size = {x=.5, y=.5},
	textures = {"mobs_shuriken.png"},
	velocity = 6,
	drop = true,

	hit_player = function(self, player)
if player:get_player_name() ~= self.owner_id then
		player:punch(self.object, 1., {
			full_punch_interval = 1.,
			damage_groups = {fleshy = 3},
		}, nil)
end
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1., {
			full_punch_interval = 1.,
			damage_groups = {fleshy = 3},
		}, nil)
	end,

	hit_node = function(self, pos, node)
--		self.object:remove()
	end
})

-- shuriken throwing item

local shuriken_VELOCITY=19

--Shoot shuriken
local function mobs_shoot_shuriken(item, user)
	local pos= user:get_pos()
	local dir= user:get_look_dir()
	local obj= core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "dmobs:shuriken")
	obj:get_luaentity().owner_id = user:get_player_name()
	obj:get_luaentity().velocity = shuriken_VELOCITY -- needed for api internal timing
	obj:set_velocity({x=dir.x*shuriken_VELOCITY, y=dir.y*shuriken_VELOCITY, z=dir.z*shuriken_VELOCITY})
	obj:set_acceleration({x=dir.x*-3, y=-9, z=dir.z*-3})
	item:take_item()
	return item
end

-- shuriken item
core.register_craftitem("dmobs:shuriken", {
	description = "Shuriken",
	inventory_image = "mobs_shuriken.png",
	on_use = mobs_shoot_shuriken
})

-- recipe
core.register_craft({
	output = "dmobs:shuriken 16",
	recipe = {
		{"", "default:obsidian_shard", ""},
		{"default:obsidian_shard", "default:steel_ingot", "default:obsidian_shard"},
		{"", "default:obsidian_shard", ""}
	}
})
