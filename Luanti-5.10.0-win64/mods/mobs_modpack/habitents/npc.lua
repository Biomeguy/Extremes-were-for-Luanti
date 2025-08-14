
-- Npc by TenPlus1

mobs.npc_drops = {
	{"default:pick_steel", 2}, "mobs:meat", {"default:sword_steel", 2},
	{"default:shovel_steel", 2}, "farming:wheat_bread", "bucket:bucket_water",
	"default:sapling", "default:beech_trunk", "mobs:leather", "default:coral_orange",
	{"default:mese_crystal_fragment", 3}, "default:clay", {"default:sign_wall", 2},
	"default:ladder_wood", "default:copper_lump", "default:blueberries",
	"default:aspen_sapling", "default:permafrost_with_moss"
}

mobs:register_mob("habitents:npc", {
	type = "npc",
	damage = 3,
	attack_type = "dogfight",
	attack_monsters = true,
	attack_npcs = false,
	owner_loyal = true,
	pathfinding = 1,
	hp_min = 10,
	hp_max = 20,
	armor = 100,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {
		{"mobs_hnpc.png"},
		{"mobs_hnpc2.png"}, -- female by nuttmeg20
		{"mobs_hnpc3.png"}, -- male by swagman181818
		{"mobs_hnpc4.png"} -- female by Sapphire16
	},
	child_texture = {
		{"mobs_npc_babyO.png"} -- derpy baby by AmirDerAssassine
	},
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "default:wood", chance = 1, min = 1, max = 3},
		{name = "default:apple", chance = 2, min = 1, max = 2},
		{name = "default:axe_stone", chance = 5, min = 1, max = 1}
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	follow = {"farming:wheat_bread", "mobs:meat", "default:diamond"},
	view_range = 15,
	owner = "",
	order = "wander",
	fear_height = 3,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198
	},

	on_rightclick = function(self, clicker)

		-- feed to heal npc
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			if mobs:feed_tame(self, clicker, 8, true, true) then return end
		end

		-- capture npc with net or lasso
		if mobs:capture_mob(self, clicker, nil, 5, 80, false, nil) then return end

		-- protect npc with mobs:protector
		if mobs:protect(self, clicker) then return end

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- right clicking with gold lump drops random item from mobs.npc_drops
		if item:get_name() == "default:gold_lump" and not self.child then

			if not mobs.is_creative(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			local pos = self.object:get_pos()	pos.y = pos.y+1
			local drops = self.npc_drops or mobs.npc_drops
			local drop = drops[math.random(#drops)]
			local chance = 1

			if type(drop) == "table" then
				chance = drop[2]
				drop = drop[1]
			end

			if not core.registered_items[drop]
			or math.random(chance) > 1 then
				drop = "default:clay_lump"
			end

			local obj = core.add_item(pos, {name = drop})
			local dir = clicker:get_look_dir()

			obj:set_velocity({x = -dir.x, y = 1.5, z = -dir.z})

			return
		end

		-- by right-clicking owner can switch npc between follow, wander and stand
		if self.owner and self.owner == name then

			if self.order == "follow" then

				self.order = "wander"

				core.chat_send_player(name, "NPC will wander.")

			elseif self.order == "wander" then

				self.order = "stand"
				self.state = "stand"
				self.attack = nil

				self:set_animation("stand")
				self:set_velocity(0)

				core.chat_send_player(name, "NPC stands still.")

			elseif self.order == "stand" then

				self.order = "follow"

				core.chat_send_player(name, "NPC will follow you.")
			end
		end
	end,
	do_custom = function(self)
if core.get_modpath("extra_energy") then
		if self.extra_energy ~= nil and self.extra_energy <= 1000 then
	local pos = self.object:get_pos()
	for _,obj in ipairs(core.get_objects_inside_radius(pos, 1)) do
		if not obj:is_player() and self.health > 0 and obj:get_luaentity() and obj:get_luaentity().name == "extra_energy:orb" then
			obj:set_velocity({x=0,y=0,z=0})
			core.sound_play("orb", {pos = pos, max_hear_distance = 8})
			self.extra_energy = self.extra_energy+obj:get_luaentity().value
			obj:remove()
		end
	end
	for _,obj in ipairs(core.get_objects_inside_radius(pos, 4)) do
		if not obj:is_player() and self.health > 0 and obj:get_luaentity() and obj:get_luaentity().name == "extra_energy:orb" then
			if obj:get_luaentity().collect then
				local pos2 = obj:get_pos()
				local vec = {x=pos.x-pos2.x, y=pos.y-pos2.y, z=pos.z-pos2.z}
				vec.x = vec.x*3  vec.y = vec.y*3  vec.z = vec.z*3
				obj:set_velocity(vec)
				obj:set_properties({physical = false})
			end
		end
	end
		end
	if self.extra_energy == nil then self.extra_energy = 0 end
end
	end
})

if not mobs.custom_spawn_npc then
mobs:spawn({
	name = "habitents:npc",
	nodes = {"default:brick"},
	neighbors = {"default:grass_3"},
	min_light = 10,
	chance = 10000,
	active_object_count = 1,
	min_height = 0,
	day_toggle = true
})

core.register_node("habitents:beacon", {
	description = "NPC Beacon",
	drawtype = "glasslike_framed_optional",
	tiles = {"mobs_beacon.png", "mobs_beacon.png"},
	use_texture_alpha = "blend",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=1, oddly_breakeable_by_hand=1},
	sounds = default.node_sound_glass_defaults()
})

core.register_abm({
	nodenames = {"habitents:beacon"},
	interval = 10,
	chance = 25,
	action = function(pos, node)
		core.add_entity({x=pos.x+math.random(-5,5), y=pos.y+.5, z=pos.z+math.random(-5,5)}, "habitents:npc")
		core.chat_send_all("habitents npc spawned at: ".. core.pos_to_string(pos))
	end
})

core.register_craft({
	output = "habitents:beacon",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "default:iron_lump", "default:glass"},
		{"", "default:glass", ""}
	}
})
end

mobs:register_egg("habitents:npc", "Npc", "default_brick.png", 1)

mobs:register_mob("habitents:chomper", {
	type = "npc",
	attack_type = "dogfight",
    attack_monsters = true,
	attack_npcs = false,
	damage = 2,
	reach = 3.5,
	hp_min = 30,
	hp_max = 37,
	armor = 130,
	collisionbox = {-.2, 0, -.2, .2, 1.2, .2},
	visual = "mesh",
	mesh = "dekubaba.b3d",
	textures = {
		{"mobs_dekubaba.png"},
		{"mobs_dekubaba2.png"},
	},
	blood_texture = "default_grass.png^[colorize:lime:60",
	makes_footstep_sound = false,
	view_range = 5,
	walk_velocity = .07,
	run_velocity = .1,
	jump = false,
	drops = {
		{name = "farming:spent_biomasse", chance = 1, min = 2, max = 5},
		{name = "default:pine_nuts", chance = 4, min = 1, max = 3},
		{name = "flowers:purple_droops", chance = 7, min = 1, max = 2},
	},
	follow = {"default:compost", "bonemeal:bonemeal"},
	water_damage = -1,
	lava_damage = 5,
	light_damage = -1,
	light_damage_min = 8,
	fear_height = 3,
	animation = {
		speed_normal = 12,
		speed_run = 30,
		stand_start = 1,
		stand_end = 19,
		walk_start = 1,
		walk_end = 19,
		run_start = 35,
		run_end = 55,
		punch_start = 20,
		punch_end = 35,
	},
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 5, true, true) then return end
		if mobs:capture_mob(self, clicker, 15, 31, 75, false, nil) then return end
		mobs:protect(self, clicker)
	end,
	do_custom = function(self)
if core.get_modpath("extra_energy") then
		if self.extra_energy ~= nil and self.extra_energy <= 1000 then
	local pos = self.object:get_pos()
	for _,obj in ipairs(core.get_objects_inside_radius(pos, 1)) do
		if not obj:is_player() and self.health > 0 and obj:get_luaentity() and obj:get_luaentity().name == "extra_energy:orb" then
			obj:set_velocity({x=0,y=0,z=0})
			core.sound_play("orb", {pos = pos, max_hear_distance = 8})
			self.extra_energy = self.extra_energy+obj:get_luaentity().value
			obj:remove()
		end
	end
	for _,obj in ipairs(core.get_objects_inside_radius(pos, 4)) do
		if not obj:is_player() and self.health > 0 and obj:get_luaentity() and obj:get_luaentity().name == "extra_energy:orb" then
			if obj:get_luaentity().collect then
				local pos2 = obj:get_pos()
				local vec = {x=pos.x-pos2.x, y=pos.y-pos2.y, z=pos.z-pos2.z}
				vec.x = vec.x*3  vec.y = vec.y*3  vec.z = vec.z*3
				obj:set_velocity(vec)
				obj:set_properties({physical = false})
			end
		end
	end
		end
	if self.extra_energy == nil then self.extra_energy = 0 end
end
	end
})

mobs:spawn({
	name = "habitents:chomper",
	nodes = {"default:dirt_with_grass"},
	min_light = 10,
	chance = 15000,
	min_height = 0,
	max_height = 31000,
	active_object_count = 2,
	day_toggle = true,
})

mobs:register_egg("habitents:chomper", "Chomper", "default_grass.png^[colorize:lime:60", 1)

mobs:register_mob("habitents:werewolf", {
	type = "npc",
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	pathfinding = 1,
	damage = 4,
	reach = 2,
	attack_type = "dogfight",
	hp_min = 50,
	hp_max = 65,
	armor = 100,
	collisionbox = {-.4, 0, -.4, .4, 1.9, .4},
	visual = "mesh",
	mesh = "werewolf.b3d",
	textures = {
		{"mobs_werewolf.png"},
	},
	visual_size = {x=1.5, y=1.5},
	walk_velocity = 1,
	run_velocity = 5,
	jump = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 3, max = 6},
		{name = "default:grass_1", chance = 3, min = 1, max = 6},
	},
	follow = {"mobs:meat"},
	water_damage = 0,
	lava_damage = 3,
	light_damage = 0,
	view_range = 20,
	fear_height = 6,
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
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, false, false) then return end
		mobs:protect(self, clicker)
	end
})

mobs:spawn({
	name = "habitents:werewolf",
	nodes = {"default:dirt_with_grass"},
	min_light = 5,
	chance = 15000,
	min_height = 0,
	max_height = 31000,
	day_toggle = true,
})

mobs:register_egg("habitents:werewolf", "Werewolf", "default_gravel.png", 1)

mobs:register_mob("habitents:npc_custom", {
	type = "npc",
	damage = 3,
	reach = 4,
	attack_type = "dogfight",
	attack_monsters = false,
	attack_npcs = false,
	pathfinding = 1,
	hp_min = 50,
	hp_max = 60,
	armor = 90,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {
		{"mobs_hnpc_doomed.png"},
		{"mobs_hnpc_toby109tt.png"},
		{"mobs_hnpc.png"},
		{"mobs_hnpc2.png"}, -- female by nuttmeg20
	},
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	view_range = 15,
	fear_height = 3,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198
	},
	on_activate = function(self)
		skin_set = false
	end,
	do_custom = function(self)
		if self.skin ~= nil and not skin_set then
			self.object:set_properties({textures = {self.skin}})
			skin_set = true
		end
	end,
	on_rightclick = function(self, clicker)
		local pos = self.object:get_pos() ; if not pos then return end
		if self.reward_item ~= nil and clicker:get_wielded_item():get_name() == self.reward_item then
	if self.item_count == nil then
self.item_ready = true
self.rewarding = true
clicker:get_wielded_item():take_item()
	elseif clicker:get_wielded_item():get_count() == self.item_count then
self.item_ready = true
self.rewarding = true
clicker:get_wielded_item():take_item()
	end
		elseif self.reward_item == nil then
	self.item_ready = true
	self.rewarding = true
		end
		if self.item ~= nil and not self.inactive then
			local xdir = self.xdir or 0
			local zdir = self.zdir or 0
			if self.item_ready then
		core.add_item({x=pos.x+xdir, y=pos.y, z=pos.z+zdir}, self.item)
		self.inactive = true
		if self.reward_text ~= nil then
			core.chat_send_player(clicker:get_player_name(), self.reward_text)
		end
			end
		end
		if self.text ~= nil and not self.spoken and not self.inactive then
	core.chat_send_player(clicker:get_player_name(), self.text)
	self.spoken = true
		elseif self.text ~= nil and not self.rewarding then
	core.chat_send_player(clicker:get_player_name(), self.text .."... I've said that already")
		end
	end,
})
