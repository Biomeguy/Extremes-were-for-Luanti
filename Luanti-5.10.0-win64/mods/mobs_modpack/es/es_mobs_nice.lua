--mob_players
--Maikerumine edited by Biomeguy
--made for Extreme Survival game
--License for code is WTFPL

mobs.npc_drops = {"default:pick_steel", "mobs:meat", "default:sword_steel", "default:shovel_steel", "farming:wheat_bread", "default:wood" }
mobs.npc2_drops = {"default:pick_mese", "mobs:meat", "default:sword_diamond", "default:pick_diamond", "farming:wheat_bread", "default:wood" }

mobs:register_mob("es:Sam", {
	type = "npc",
	hp_min = 25,
	hp_max = 35,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_1.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 4,
	damage = 2,
	drops = {
		{name = "default:apple", chance = 1, min = 1, max = 2},
		{name = "default:sword_steel", chance = 2, min = 0, max = 1},
		{name = "default:stick", chance = 2, min = 13, max = 30},
	},
	armor = 80,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_death1",
		attack = "default_punch2",
	},
})

mobs:register_mob("es:John", {
	type = "npc",
	hp_min = 27,
	hp_max = 34,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_2.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 4,
	damage = 3,
	drops = {
		{name = "default:apple", chance = 1, min = 1, max = 5},
		{name = "default:sword_steel", chance = 1, min = 0, max = 1},
		{name = "default:stick", chance = 2, min = 13, max = 30},
	},
	armor = 85,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_death2",
		attack = "default_punch",
	},
})

mobs:register_mob("es:Janette", {
	type = "npc",
	hp_min = 13,
	hp_max = 15,
	collisionbox = {-.3, 0, -.3, .3, 1.4, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_3.png"}},
	visual_size = {x=1, y=.8},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1.6,
	run_velocity = 4,
	damage = 2.5,
	drops = {
		{name = "default:beech_leaves", chance = 1, min = 3, max = 5},
		{name = "default:sword_steel", chance = 2, min = 0, max = 1},
		{name = "default:stick", chance = 2, min = 13, max = 30},
	},
	armor = 40,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	follow = "default:apple",
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_oerkki_attack",
		death = "mobs_death1",
		attack = "default_punch2",
	},
})

mobs:register_mob("es:Crybaby", {
	type = "npc",
	hp_min = 27,
	hp_max = 45,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_4.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 4,
	damage = 3,
	drops = {
		{name = "default:papyrus", chance = 1, min = 3, max = 5},
		{name = "default:sword_steel", chance = 2, min = 0, max = 1},
		{name = "default:stick", chance = 2, min = 1, max = 3},
	},
	armor = 90,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_barbarian_yell1",
		death = "mobs_death1",
		attack = "default_punch",
	},
})

mobs:register_mob("es:SepiaSam", {
	type = "npc",
	hp_min = 47,
	hp_max = 55,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_5.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1.3,
	run_velocity = 3.9,
	damage = 3,
	drops = {
		{name = "default:sword_mese", chance = 2, min = 0, max = 1},
		{name = "default:sword_steel", chance = 1, min = 0, max = 1},
		{name = "default:apple", chance = 2, min = 1, max = 3},
	},
	armor = 80,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_death2",
		attack = "default_punch3",
	},
})

mobs:register_mob("es:SepiaSamu", {
	type = "npc",
	hp_min = 47,
	hp_max = 55,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_5.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 17,
	walk_velocity = 1.3,
	run_velocity = 3.9,
	damage = 3,
	drops = {
		{name = "rangedweapons:rpk", chance = 2, min = 0, max = 1},
		{name = "rangedweapons:9mm", chance = 1, min = 0, max = 1},
		{name = "default:apple", chance = 2, min = 1, max = 3},
	},
	armor = 80,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_death2",
		attack = "default_punch3",
	},
})

mobs:register_mob("es:OGSam", {
	type = "npc",
	hp_min = 37,
	hp_max = 45,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_6.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3.3,
	damage = 4,
	drops = {
		{name = "default:apple", chance = 1, min = 0, max = 5},
		{name = "default:sword_steel", chance = 1, min = 1, max = 1},
		{name = "default:stick", chance = 2, min = 4, max = 12},
	},
	armor = 90,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_death1",
		attack = "default_punch",
	},
})

mobs:register_mob("es:Vanessa", {
	type = "npc",
	hp_min = 28,
	hp_max = 35,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_7.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1.6,
	run_velocity = 3.8,
	drops = {
		{name = "default:torch", chance = 1, min = 3, max = 5},
		{name = "default:sword_steel", chance = 1, min = 0, max = 1},
		{name = "default:stick", chance = 2, min = 13, max = 30},
	},
	armor = 80,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "default_punch2",
		death = "mobs_slash_attack",
		attack = "default_punch2",
	},
})

mobs:register_mob("es:FemaleSam", {
	type = "npc",
	hp_min = 92,
	hp_max = 125,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_8.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1.7,
	run_velocity = 3.5,
	damage = 4,
	drops = {
		{name = "default:pick_steel", chance = 4, min = 0, max = 2},
		{name = "default:sword_steel", chance = 7, min = 0, max = 1},
		{name = "default:stick", chance = 2, min = 1, max = 3},
	},
	armor = 80,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_stone",
		death = "mobs_slash_attack",
		attack = "default_punch",
	},
})

mobs:register_mob("es:Battleboy", {
	type = "npc",
	hp_min = 157,
	hp_max = 180,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_9.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 14,
	walk_velocity = 2.5,
	run_velocity = 7,
	damage = 4,
	drops = {
		{name = "default:pick_mese", chance = 2, min = 0, max = 1},
		{name = "default:sword_steel", chance = 1, min = 0, max = 1},
		{name = "default:apple", chance = 1, min = 1, max = 3},
	},
	armor = 80,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_barbarian_yell1",
		death = "mobs_barbarian_death",
		attack = "default_punch3",
	},
})

mobs:register_mob("es:Thelma", {
	type = "npc",
	hp_max = 115,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_10.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 10,
	drops = {
		{name = "default:jungle_trunk", chance = 1, min = 5, max = 23},
		{name = "default:sword_steel", chance = 2, min = 1, max = 1},
		{name = "default:stick", chance = 2, min = 13, max = 30},
	},
	armor = 75,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 17,
		speed_run = 25,
		stand_start = 0,
		stand_end = 40,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 191,
	},
	sounds = {
		war_cry = "mobs_oerkki_attack",
		death = "mobs_death1",
		attack = "default_punch2",
	},
})

mobs:register_mob("es:Wilbert", {
	type = "npc",
	hp_max = 115,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_11.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3.5,
	damage = 10,
	drops = {
		{name = "default:apple", chance = 1, min = 10, max = 28},
		{name = "default:sword_steel", chance = 2, min = 1, max = 1},
		{name = "default:stick", chance = 2, min = 13, max = 30},
	},
	armor = 75,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 17,
		speed_run = 25,
		stand_start = 0,
		stand_end = 40,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 191,
	},
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_death1",
		attack = "default_punch2",
	},
})

mobs:register_mob("es:DrifterDan", {
	type = "npc",
	hp_min = 117,
	hp_max = 129,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_12.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 14,
	walk_velocity = 2.5,
	run_velocity = 7,
	damage = 4,
	drops = {
		{name = "default:pick_mese", chance = 2, min = 0, max = 1},
		{name = "default:steel_ingot", chance = 1, min = 3, max = 19},
		{name = "default:apple", chance = 1, min = 1, max = 3},
	},
	armor = 80,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_barbarian_yell2",
		death = "mobs_barbarian_death",
		attack = "default_punch3",
	},
})

mobs:register_mob("es:Mr_Pink", {
	type = "npc",
	hp_min = 35,
	hp_max = 65,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_13.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "default:apple", chance = 1, min = 1, max = 2},
		{name = "default:sword_steel", chance = 2, min = 0, max = 1},
	},
	armor = 75,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_barbarian_yell1",
		death = "mobs_barbarian_death",
		attack = "default_punch3",
	},
})

mobs:register_mob("es:Mr_White", {
	type = "npc",
	hp_min = 35,
	hp_max = 65,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_14.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 3,
	run_velocity = 4,
	damage = 2,
	drops = {
		{name = "default:apple", chance = 1, min = 0, max = 2},
		{name = "default:sword_steel", chance = 2, min = 0, max = 1},
	},
	armor = 75,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_death1",
		attack = "default_punch2",
	},
})

mobs:register_mob("es:Maikerumine", {
	type = "npc",
	hp_min = 95,
	hp_max = 175,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_15.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 3,
	run_velocity = 5,
	damage = 9,
	drops = {
		{name = "default:apple", chance = 1, min = 1, max = 2},
		{name = "default:book", chance = 3, min = 0, max = 1},
		{name = "farming:wheat_bread", chance = 2, min = 23, max = 90},
	},
	armor = 80,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 4,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc2_drops[math.random(1,#mobs.npc2_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_death1",
		attack = "default_punch2",
	},
})

mobs:register_mob("es:Infiniumman", {
	type = "npc",
	hp_min = 25,
	hp_max = 35,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_16.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 3,
	run_velocity = 5,
	damage = 3,
	drops = {
		{name = "default:apple", chance = 1, min = 1, max = 2},
		{name = "default:sword_diamond", chance = 3, min = 0, max = 1},
		{name = "default:meselamp", chance = 2, min = 1, max = 3},
	},
	armor = 80,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc2_drops[math.random(1,#mobs.npc2_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_death1",
		attack = "default_punch2",
	},
})
--TEXTURE BY: http://minetest.fensta.mobslaced.net/#author=bajanhgk

mobs:register_mob("es:Candy", {
	type = "npc",
	hp_min = 125,
	hp_max = 135,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_17.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1.9,
	run_velocity = 3.9,
	damage = 9,
	drops = {
		{name = "default:apple", chance = 1, min = 1, max = 5},
		{name = "es:sword_ruby", chance = 5, min = 0, max = 1},
		{name = "default:diamond", chance = 5, min = 0, max = 1},
		{name = "default:stick", chance = 2, min = 1, max = 4},
	},
	armor = 80,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc2_drops[math.random(1,#mobs.npc2_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_death1",
		attack = "default_punch2",
	},
})

mobs:register_mob("es:Bajan", {
	type = "npc",
	hp_min = 25,
	hp_max = 35,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_18.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "default:apple", chance = 1, min = 1, max = 2},
		{name = "farming:wheat_bread", chance = 2, min = 0, max = 1},
		{name = "rangedweapons:9mm", chance = 2, min = 13, max = 30},
	},
	armor = 80,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_death1",
		attack = "default_punch2",
	},
})

mobs:register_mob("es:Castaway", {
	type = "npc",
	hp_min = 27,
	hp_max = 34,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_19.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 2,
	damage = 3,
	drops = {
		{name = "default:apple", chance = 1, min = 1, max = 5},
		{name = "farming:wheat_bread", chance = 1, min = 0, max = 1},
		{name = "rangedweapons:9mm", chance = 2, min = 13, max = 30},
	},
	armor = 85,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_death2",
		attack = "shooter_shotgun",
	},
})

mobs:register_mob("es:Krock", {
	type = "npc",
	hp_min = 13,
	hp_max = 15,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_25.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 19,
	walk_velocity = 1.6,
	run_velocity = 1,
	damage = 2.5,
	drops = {
		{name = "default:beech_leaves", chance = 1, min = 3, max = 5},
		{name = "farming:wheat_bread", chance = 2, min = 0, max = 1},
		{name = "rangedweapons:9mm", chance = 2, min = 13, max = 30},
	},
	armor = 40,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	follow = "default:apple",
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_oerkki_attack",
		death = "mobs_death1",
		attack = "default_punch2",
	},
})

mobs:register_mob("es:Just_Test_Griefer", {
	type = "npc",
	hp_min = 27,
	hp_max = 45,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_23.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 2,
	damage = 3,
	drops = {
		{name = "default:papyrus", chance = 1, min = 3, max = 5},
		{name = "farming:wheat_bread", chance = 2, min = 0, max = 1},
		{name = "rangedweapons:9mm", chance = 2, min = 1, max = 3},
	},
	armor = 90,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_barbarian_yell1",
		death = "mobs_death1",
		attack = "default_punch",
	},
})

mobs:register_mob("es:Hobo", {
	type = "npc",
	hp_min = 37,
	hp_max = 45,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_20.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 2.3,
	damage = 4,
	drops = {
		{name = "farming:wheat_bread", chance = 1, min = 0, max = 5},
		{name = "default:pick_bronze", chance = 1, min = 1, max = 1},
		{name = "rangedweapons:9mm", chance = 2, min = 4, max = 12},
	},
	armor = 90,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_death1",
		attack = "default_punch",
	},
})

mobs:register_mob("es:Simon", {
	type = "npc",
	hp_min = 28,
	hp_max = 35,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_21.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 25,
	walk_velocity = 1.6,
	run_velocity = 2.8,
	damage = 3,
	drops = {
		{name = "default:torch", chance = 1, min = 3, max = 5},
		{name = "rangedweapons:rpk", chance = 1, min = 0, max = 1},
		{name = "rangedweapons:9mm", chance = 2, min = 13, max = 30},
	},
	armor = 80,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_fireball",
		death = "mobs_slash_attack",
		attack = "default_punch2",
	},
})

mobs:register_mob("es:Infantry_man", {
	type = "npc",
	hp_min = 92,
	hp_max = 125,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_22.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1.7,
	run_velocity = 2.5,
	damage = 4,
	drops = {
		{name = "rangedweapons:rpg_uld", chance = 4, min = 0, max = 2},
		{name = "rangedweapons:rpk", chance = 7, min = 0, max = 1},
		{name = "rangedweapons:9mm", chance = 2, min = 1, max = 3},
	},
	armor = 80,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_stone",
		death = "mobs_slash_attack",
		attack = "default_punch",
	},
})

mobs:register_mob("es:Infantry_White", {
	type = "npc",
	hp_min = 35,
	hp_max = 65,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_22.png^[colorize:white:90"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "rangedweapons:jackhammer", chance = 3, min = 0, max = 1},
		{name = "default:sword_bronze", chance = 2, min = 0, max = 1},
		{name = "rangedweapons:shell", chance = 2, min = 4, max = 31},
	},
	armor = 75,
	attack_type = "dogshoot",
	dogshoot_switch = 1,
	dogshoot_count_max = 10,
	arrow = "es:bullet",
	shoot_interval = 0.25,
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_death1",
		attack = "shooter_rifle",
		shoot_attack = "shooter_rifle",
	},
})

mobs:register_mob("es:Infantry_Pink", {
	type = "npc",
	hp_min = 35,
	hp_max = 65,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_22.png^[colorize:pink:90"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "rangedweapons:spas12", chance = 8, min = 0, max = 1},
		{name = "rangedweapons:shell", chance = 3, min = 2, max = 21},
	},
	armor = 75,
	attack_type = "dogshoot",
	dogshoot_switch = 1,
	dogshoot_count_max = 10,
	arrow = "es:bullet",
	shoot_interval = 0.5,
	shoot_offset = 1,
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_barbarian_yell1",
		death = "mobs_barbarian_death",
		attack = "shooter_rifle",
		shoot_attack = "shooter_rifle",
	},
})

mobs:register_mob("es:Mage", {
	type = "npc",
	hp_min = 157,
	hp_max = 180,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_24.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	view_range = 14,
	walk_velocity = 2.5,
	run_velocity = 7,
	damage = 4,
	drops = {
		{name = "rangedweapons:rpg_uld", chance = 2, min = 0, max = 1},
		{name = "default:pine_needles", chance = 1, min = 3, max = 6},
		{name = "default:apple", chance = 1, min = 1, max = 3},
	},
	armor = 80,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 50,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)

		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not core.is_creative_enabled(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:get_pos()
			pos.y = pos.y + 0.5
			core.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = name
			else
				core.chat_send_player(name, "I'm not your pet.")
			end
		end
	end,
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		war_cry = "mobs_barbarian_yell1",
		death = "mobs_barbarian_death",
		attack = "default_punch3",
	},
})

mobs:register_mob("es:sandworm", {
	type = "npc",
	hp_min = 160,
	hp_max = 190,
	collisionbox = {-.4, -.1, -.4, .4, 1.8, .4},
	visual = "mesh",
	mesh = "sandworm.x",
	textures = {{"sandworm.png"}},
	visual_size = {x=4, y=4},
	makes_footstep_sound = false,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	--passive = false,
	jump = false,
	view_range = 27,
	fear_height = 3,
	walk_velocity = 2,
	run_velocity = 3.4,
	damage = 100,
	reach = 7,
	drops = {
		{name = "default:mese_crystal_fragment", chance = 2, min = 1, max = 3},
		{name = "default:sand", chance = 19, min = 5, max = 7},
		{name = "es:meat_raw", chance = 1, min = 5, max = 12},
	},
	armor = 190,
	rotate = 270,
	attack_type = "dogfight",
	water_damage = 0,
	lava_damage = 10,
	light_damage = 0,
	stepheight = 1.1,
	animation = {
		speed_normal = 25,
		speed_run = 40,
		stand_start = 1,
		stand_end = 100,
		walk_start = 110,
		walk_end = 140,
		run_start = 110,
		run_end = 140,
		punch_start = 150,
		punch_end = 180,
	},
	sounds = {
		random = "mobs_sandmonster",
		death = "mobs_death2",
		distance = 40,
	}
})

mobs:register_mob("es:goodbot_fighter", {
	type = "npc",
   	hp_min = 60,
   	hp_max = 70,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_26.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	jump = true,
	view_range = 12,
	walk_velocity = 2,
	run_velocity = 3.5,
	damage = 3,
	drops = {
		{name = "es:sword_lightsteel_blue", chance = 10, min = 0, max = 1},
	},
	armor = 90,
	attack_type = "dogfight",
	water_damage = 100,
	lava_damage = 10,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	sounds = {
		war_cry = "mobs_stone_attack",
		death = "mummy_death",
		attack = "default_punch",
	},
})

mobs:register_mob("es:goodbot_gunner", {
	type = "npc",
	hp_min = 60,
	hp_max = 70,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_27.png"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	group_attack = true,
	jump = true,
	view_range = 15,
	walk_velocity = 3,
	run_velocity = 3.9,
	damage = 3,
	drops = {
		{name = "es:blue_laser_gun", chance = 50, min = 0, max = 1},
		{name = "es:laser", chance = 1, min = 2, max = 12},
	},
	armor = 90,
	attack_type = "dogshoot",
	dogshoot_switch = 1,
	dogshoot_count_max = 10,
	arrow = "es:lasershot",
	shoot_interval = 1,	
	water_damage = 100,
	lava_damage = 10,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	sounds = {
		war_cry = "mobs_stone_attack",
		death = "mummy_death",
		attack = "default_punch",
		shoot_attack = "laser_sound",
	},
})

mobs:register_arrow("es:bullet", {
	visual = "sprite",
	visual_size = {x = .1, y = .11},
	textures = {"shooter_bullet.png"},
	velocity = 6,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,
	hit_node = function(self, pos, node)
	end
})

mobs:register_mob("es:zoombot", {
	type = "npc",
	hp_min = 1000,
	hp_max = 1200,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {{"PG_26.png^[colorize:white:90"}},
	makes_footstep_sound = true,
	pathfinding = 1,
	attack_monsters = true,
	attack_npcs = false,
	suffocation = 0,
	jump_height = 8,
	view_range = 20,
	walk_velocity = 3,
	run_velocity = 7,
	damage = 1000,
	follow = {"default:mese_crystal", "es:aikerum_crystal"},
	drops = {
		{name = "es:sword_aikerum", chance = 3, min = 1, max = 1},
		{name = "default:steel_ingot", chance = 1, min = 2, max = 7},
	},
	armor = 10,
	attack_type = "dogfight",
	fall_damage = 0,
	lava_damage = 1,
	fire_damage = 0,
	stepheight = 3,
	blood_amount = 0,
	immune_to = {
		{"default:mese_crystal", -20}, -- heals by 20 points
	},
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	sounds = {
		death = "mobs_fireball",
		attack = "default_punch",
	},
})


--NOTE: ALWAYS PUT THE REGISTER_SPAWN BELOW THE REGISTER_ENTITY!!!!!

mobs:register_spawn("es:Sam", {"default:dirt_with_grass", "default:stone", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:John", {"default:dirt_with_grass", "default:stone", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "es:clay_dirt_with_aiden_grass"}, 12, -1, 30000, 1, 31000)
mobs:register_spawn("es:Janette", {"default:dirt_with_grass", "default:stone", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:Crybaby", {"default:dirt_with_grass", "default:stone", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:SepiaSam", {"default:dirt_with_grass", "default:stone", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:OGSam", {"default:dirt_with_grass", "default:stone", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:Vanessa", {"default:dirt_with_grass", "default:stone", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:FemaleSam", {"default:dirt_with_grass", "default:stone", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:Battleboy", {"default:dirt_with_grass", "default:stone", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "es:clay_dirt_with_aiden_grass"}, 12, 7,30000, 1, 31000)
mobs:register_spawn("es:Wilbert", {"default:dirt_with_grass", "default:snow_block", "default:stone", "default:stone_brick", "default:cobble", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:Thelma", {"default:dirt_with_grass", "default:snow_block", "default:stone", "default:stone_brick", "default:cobble", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:DrifterDan", {"default:dirt_with_grass", "default:stone", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "es:clay_dirt_with_aiden_grass"}, 12, 7,30000, 1, 31000)
mobs:register_spawn("es:Mr_White", {"default:dirt_with_grass", "default:grass", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "default:snow", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:Mr_Pink", {"default:dirt_with_grass", "default:desert_sand", "default:sand", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "default:snow", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:Infantry_White", {"default:dirt_with_grass", "default:grass", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "default:snow", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:Infantry_Pink", {"default:dirt_with_grass", "default:desert_sand", "default:sand", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "default:snow", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:Candy", {"default:dirt_with_grass", "default:stone", "default:stone_brick", "default:cobble", "es:clay_dirt_with_aiden_grass"},5, -1, 30000, 1, 31000)
mobs:register_spawn("es:Infiniumman", {"default:dirt_with_grass", "default:stone", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:Maikerumine", {"default:dirt_with_grass", "default:stone", "default:stone_brick", "default:cobble", "default:clay_dirt_with_savanna_grass", "es:clay_dirt_with_aiden_grass"}, 12, 7, 30000, 1, 31000)
mobs:register_spawn("es:goodbot_fighter", {"default:wood", "pathv7:junglewood", "pathv7:stairs"}, 12, 6, 12000, 1, 31000)
mobs:register_spawn("es:goodbot_gunner", {"default:dry_dirt", "default:steel_block"}, 12, 6, 12000, 1, 31000)
mobs:register_spawn("es:Bajan", {"default:dirt_with_grass", "decor:floor_ceiling_broken", "default:stone_brick", "default:cobble"}, 12, 6, 11000, 1, 31000)
mobs:register_spawn("es:Castaway", {"default:dirt_with_grass", "decor:floor_ceiling_broken", "default:stone_brick", "default:cobble"}, 12, 6, 11000, 1, 31000)
mobs:register_spawn("es:Krock", {"default:dirt_with_grass", "decor:floor_ceiling_broken", "default:stone_brick", "default:cobble"}, 12, 6, 11000, 1, 31000)
mobs:register_spawn("es:Just_Test_Griefer", {"default:dirt_with_grass", "decor:floor_ceiling_broken", "default:stone_brick", "default:cobble"}, 12, 6, 11000, 1, 31000)
mobs:register_spawn("es:Sepiasamu", {"default:dirt_with_grass", "decor:floor_ceiling_broken", "default:stone_brick", "default:cobble"}, 12, 6, 11000, 1, 31000)
mobs:register_spawn("es:Hobo", {"default:dirt_with_grass", "decor:floor_ceiling_broken", "default:stone_brick", "default:cobble"}, 12, 6, 11000, 1, 31000)
mobs:register_spawn("es:Simon", {"default:dirt_with_grass", "decor:floor_ceiling_broken", "default:stone_brick", "default:cobble"}, 12, 6, 11000, 1, 31000)
mobs:register_spawn("es:Infantry_man", {"default:dirt_with_grass", "decor:floor_ceiling_broken", "default:stone_brick", "default:cobble"}, 12, 6, 11000, 1, -10)
mobs:register_spawn("es:Mage", {"default:dirt_with_grass", "decor:floor_ceiling_broken", "default:stone_brick", "default:cobble"}, 13, -1,11000, 1, -50)
mobs:register_spawn("es:sandworm", {"default:sand", "default:silver_sand", "default:desert_sand", "default:mud"}, 9, -1, 19000, 1, 31000)

--spawn eggs
mobs:register_egg("es:Sam", "NPC Sam", "PG_1.png", 1)
mobs:register_egg("es:John", "NPC John", "PG_2.png", 1)
mobs:register_egg("es:Janette", "NPC Janette", "PG_3.png", 1)
mobs:register_egg("es:Crybaby", "NPC Crybaby", "PG_4.png", 1)
mobs:register_egg("es:SepiaSam", "NPC Sepia Sam", "PG_5.png", 1)
mobs:register_egg("es:OGSam", "NPC O.G. Sam", "PG_6.png", 1)
mobs:register_egg("es:Vanessa", "NPC Vanessa", "PG_7.png", 1)
mobs:register_egg("es:FemaleSam", "NPC Female Sam", "PG_8.png", 1)
mobs:register_egg("es:Thelma", "NPC Thelma", "PG_10.png", 1)
mobs:register_egg("es:Wilbert", "NPC Wilbert", "PG_11.png", 1)
mobs:register_egg("es:DrifterDan", "NPC Drifter Dan", "PG_12.png", 1)
mobs:register_egg("es:Mr_Pink", "NPC Mr. Pink", "mobs_stone_monster2.png^[colorize:pink:200", 1)
mobs:register_egg("es:Mr_White", "NPC Mr. White", "PB_20.png", 1)
mobs:register_egg("es:Maikerumine", "NPC Maikerumine", "PG_15.png", 1)
mobs:register_egg("es:Infiniumman", "NPC Infinium Man", "default_lava.png", 1)
mobs:register_egg("es:Candy", "NPC Candy", "PG_17.png", 1)
mobs:register_egg("es:Castaway", "NPC Castaway", "PG_19.png", 1)
mobs:register_egg("es:SepiaSamu", "NPC Sepia Samu", "PG_5.png", 1)
mobs:register_egg("es:zoombot", "Zoom", "PG_26.png^[colorize:white:90", 1)
