
-- Monster bomb entity functions
local function bomb_area(pos)
	for _, obj in pairs(core.get_objects_inside_radius(pos, 3)) do
		local ent = obj:get_luaentity()
		if ent and ent.type == "monster" then
			obj:punch(obj, .5, {
				full_punch_interval=.5,
				damage_groups={fleshy=50},
			}, nil)
		end
		obj:set_hp(obj:get_hp()+10)
	end
end

-- thrown monster bomb
core.register_entity("trap:tbomb_entity", {
	initial_properties = {
visual = "sprite",
visual_size = {x = 1, y = 1},
textures = {"antimonster.png"},
physical = true,
collisionbox = {-.1,-.1,-.1, .1,.1,.1},
	},
	lastpos = {},
	player = "",
	on_step = function(self, dtime)

		if not self.player then
			self.object:remove()
			return
		end

		local pos = self.object:get_pos()

		if self.lastpos.x ~= nil then
			local vel = self.object:get_velocity()

			-- only when bomb hits something physical
			if vel.x == 0
			or vel.y == 0
			or vel.z == 0 then

				if self.player ~= "" then
					-- round up coords to fix glitching through doors
					self.lastpos = vector.round(self.lastpos)
					bomb_area(self.lastpos)
				end

				self.object:remove()
				return
			end
		end
		self.lastpos = pos
	end
})

-- actual throwing function
local function throw_bomb(item, player)

	local playerpos = player:get_pos()

	local obj = core.add_entity({
		x = playerpos.x,
		y = playerpos.y + 1.5,
		z = playerpos.z
	}, "trap:tbomb_entity")

	local dir = player:get_look_dir()
	local velocity = 20

	obj:set_velocity({
		x = dir.x * velocity,
		y = dir.y * velocity,
		z = dir.z * velocity
	})

	obj:set_acceleration({
		x = dir.x * -3,
		y = -9.5,
		z = dir.z * -3
	})

	obj:get_luaentity().player = player
end

core.register_node("trap:monster_trap", {
	description = "Monster Trap",
	tiles = {"monster_trap.png"},
	on_construct = function(pos)
		core.get_node_timer(pos):start(.25)
	end,
	on_timer = function(pos, elapsed)
		for _, obj in pairs(core.get_objects_inside_radius(pos, 3)) do
local ent = obj:get_luaentity()
if ent and ent.type == "monster" then
	core.set_node(pos, {name = "trap:trapped_monster"})
	local meta = core.get_meta(pos)
	meta:set_string("captured", ent.name)
	obj:remove()
	return
end
		end
		core.get_node_timer(pos):start(.25)
	end,
	groups = {dig_immediate = 2, choppy = 2, timer_check = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_craft({
	output = "trap:monster_trap",
	recipe = {
		{"flowers:lion_tooth"},
		{"default:mese_crystal"},
		{"default:wood"}
	}
})

core.register_craft({
	output = "trap:monster_trap",
	recipe = {
		{"farming:celery_S5"},
		{"default:mese_crystal"},
		{"default:wood"}
	}
})

core.register_craft({
	output = "trap:monster_trap",
	recipe = {
		{"ecology:iris_blue"},
		{"default:mese_crystal"},
		{"default:wood"}
	}
})

core.register_craft({
	output = "trap:monster_trap",
	recipe = {
		{"ecology:iris_lightblue"},
		{"default:mese_crystal"},
		{"default:wood"}
	}
})

core.register_node("trap:trapped_monster", {
	description = "Trap Containing A Monster Bomb (throw to kill other monsters)",
	tiles = {"trapped_monster.png"},
	light_source = 2,
	on_use = function(item, user)
		throw_bomb(item, user)

		if not core.is_creative_enabled(user:get_player_name()) then
	local inv = user:get_inventory()

	if inv:room_for_item("main", {name = "trap:monster_trap"}) then
		inv:add_item("main", {name = "trap:monster_trap"})
	else
		local pos = user:get_pos()
		core.add_item(pos, "trap:monster_trap")
	end
	item:take_item()
	return item
		end
	end,
	on_destruct = function(pos)
		local meta = core.get_meta(pos)
		local name = meta:get_string("captured")
		if name ~= "" then
	local obj = core.add_entity(pos, name)
	obj:punch(obj, .5, {
		full_punch_interval=.5,
		damage_groups={fleshy=10000},
	}, nil)
		end
	end,
	groups = {dig_immediate = 2, choppy = 2},
	sounds = default.node_sound_wood_defaults()
})
