-- farming/tools.lua

-- support for MT game translation.
local S = farming.get_translator
local tr = core.get_modpath("toolranks")

farming.register_hoe(":farming:hoe_wood", {
	description = S("Wooden Hoe"),
	inventory_image = "farming_tool_woodhoe.png",
	max_uses = 30,
	material = "group:wood",
	groups = {hoe = 1, flammable = 2},
})

core.register_craft({
	type = "fuel",
	recipe = "farming:hoe_wood",
	burntime = 5,
})

farming.register_hoe(":farming:hoe_stone", {
	description = S("Stone Hoe"),
	inventory_image = "farming_tool_stonehoe.png",
	max_uses = 120,
	material = "group:rock",
	groups = {hoe = 1}
})

farming.register_hoe(":farming:hoe_steel", {
	description = S("Steel Hoe"),
	inventory_image = "farming_tool_steelhoe.png",
	max_uses = 500,
	material = "default:steel_ingot",
	groups = {hoe = 1}
})

-- Toolranks support
if tr then
core.override_item("farming:hoe_wood", {
	original_description = "Wood Hoe",
	description = toolranks.create_description("Wood Hoe")})

core.override_item("farming:hoe_stone", {
	original_description = "Stone Hoe",
	description = toolranks.create_description("Stone Hoe")})

core.override_item("farming:hoe_steel", {
	original_description = "Steel Hoe",
	description = toolranks.create_description("Steel Hoe")})
end


-- Sickle
local function sickle_can_break(pos, deff, player)
	local def = ItemStack({name=deff.name}):get_definition()

	if not def.diggable or (def.can_dig and not def.can_dig(pos,player)) then
		core.log("info", player:get_player_name() .. " tried to sickle "
		.. def.name .. " which is not diggable "
		.. core.pos_to_string(pos))
		return
	end

	if core.is_protected(pos, player:get_player_name()) then
		core.log("action", player:get_player_name()
			.. " tried to sickle " .. def.name
			.. " at protected position "
			.. core.pos_to_string(pos))
		core.record_protection_violation(pos, player:get_player_name())
		return
	end

	return true
end
-- turns nodes with group flora=1 & flower=0 into cut grass
local function sickle_on_use(item, user, pointd, uses)
	local pt = pointd
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	local under = core.get_node(pt.under)
	local above_pos = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
	local above = core.get_node(above_pos)

	-- return if any of the nodes is not registered
	if not core.registered_nodes[under.name] then
		return
	end
	if not core.registered_nodes[above.name] then
		return
	end

	if not sickle_can_break(pt.under, under, user) then
		return
	end
	-- check if something that can be cut using fine tools
	if core.get_item_group(under.name, "snappy") > 0 then
		-- check if flora but no flower
		if core.get_item_group(under.name, "flora") == 1 and core.get_item_group(under.name, "flower") == 0 then
			-- turn the node into cut grass, wear out item and play sound
			core.swap_node(pt.under, {name="farming:cut_grass"})
			core.get_node_timer(pt.under):start(math.random(60, 300))
		else -- otherwise dig the node
			if not core.node_dig(pt.under, under, user) then
				return
			end
		end
		core.sound_play("default_dig_crumbly", {pos = pt.under, gain = .5})
	if not core.is_creative_enabled(user:get_player_name()) then
		item:add_wear_by_uses(uses)
	end
		return item
	elseif string.find(under.name, "default:dirt_with_grass") then
		if core.is_protected(above_pos, user:get_player_name()) or above.name ~= "air" then
			return
		end
		core.swap_node(pt.under, {name="default:dirt_with_short_grass"})
		core.get_node_timer(pt.under):start(math.random(60, 300))
		core.swap_node(above_pos, {name="farming:cut_grass"})
		core.get_node_timer(above_pos):start(math.random(60, 300))
		core.sound_play("default_dig_crumbly", {pos = pt.under, gain = .5})
	if not core.is_creative_enabled(user:get_player_name()) then
		item:add_wear_by_uses(uses)
	end
		return item
	end
end

core.register_tool("farming:sickle", {
	description = S("Sickle"),
	inventory_image = "farming_sickle.png",
	on_use = function(itemstack, user, pointd)
		return sickle_on_use(itemstack, user, pointd, 220)
	end,
})

core.register_craft({
	output = "farming:sickle",
	recipe = {
		{"group:rock",""},
		{"", "default:stick"},
		{"default:stick",""}
	}
})

core.register_craft({
	output = "farming:sickle",
	recipe = {
		{"default:flint",""},
		{"", "default:stick"},
		{"default:stick",""}
	}
})

-- fast tool for digging nodes with the group "hay"
-- can also be placed as a node
core.register_tool("farming:pitchfork", {
	description = S("Pitchfork (for hay and straw)"),
	inventory_image = "farming_pitchfork.png",
	wield_image = "farming_pitchfork.png^[transformFYR180",
	wield_scale = {x=1.5,y=1.5,z=.5},
	tool_capabilities = {
		full_punch_interval = 1.,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=.8, [3]=.4}, maxlevel=1, uses=1/.002},
			snappy={times={[2]=.8, [3]=.4}, maxlevel=1, uses=1/.002},
			hay={times={[2]=.2, [3]=.1}, maxlevel=1, uses=1/.002},
		},
		damage_groups = {fleshy=5},
	},
	groups = {flammable = 2},
	sound = {breaks = "default_tool_breaks"},
	on_place = function(item, placer, pointd)
		if(placer == nil or pointd == nil or pointd.type ~= "node") then
			return nil
		end
		local pos  = core.get_pointed_thing_position( pointd, 1 )
		local node = core.get_node_or_nil(pos)
		if(node == nil or not(node.name) or node.name ~= "air") then
			return nil
		end
		if core.is_protected(pos, placer:get_player_name()) then
			return nil
		end
		core.rotate_and_place(ItemStack("farming:pitchfork_placed"), placer, pointd)
		-- did the placing succeed?
		local nnode = core.get_node(pos)
		if(not(nnode) or not(nnode.name) or nnode.name ~= "farming:pitchfork_placed") then
			return nil
		end
		local meta = core.get_meta(pos)
		meta:set_int("wear", item:get_wear())
		meta:set_string("infotext", S("Pitchfork (for hay and straw)"))
		return ItemStack("")
	end,
})

-- a ptichfork placed somewhere
core.register_node("farming:pitchfork_placed", {
	tiles = {"default_wood.png^[transformR90"},
	drawtype = "nodebox",
	paramtype  = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {snappy = 2, dig_immediate = 3, falling_node = 1,
		attached_node = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-(1/32), -(11/16), -(1/32),  (1/32), 16/16, (1/32)},
			{-(7/32),  -(4/16), -(1/32),  (7/32), -(2/16), (1/32)},
			{-(7/32), -(11/16), -(1/32), -(5/32), -(4/16), (1/32)},
			{ (5/32), -(11/16), -(1/32),  (7/32), -(4/16), (1/32)}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.1, .3, 1., .1}
	},
	drop = "farming:pitchfork",
	-- perserve wear
	preserve_metadata = function(pos, oldnode, oldmeta, drops)
		if(oldmeta["wear"]) then
			drops[1]:set_wear(oldmeta["wear"])
		end
	end,
})

core.register_craft({
	output = "farming:pitchfork",
	recipe = {
		{"default:stick", "default:stick", "default:stick"},
		{"", "default:stick", ""},
		{"", "default:stick", ""}
	}
})


-- hoe bomb function
local function hoe_area(pos, player)

	-- check for protection
	if core.is_protected(pos, player:get_player_name()) then
		core.record_protection_violation(pos, player:get_player_name())
		return
	end

	local r = 5 -- radius

	-- remove flora (grass, flowers etc.)
	local res = core.find_nodes_in_area(
		{x = pos.x - r, y = pos.y - 1, z = pos.z - r},
		{x = pos.x + r, y = pos.y + 2, z = pos.z + r},
		{"group:flora"})

	for n = 1, #res do
		core.swap_node(res[n], {name = "air"})
	end

	-- replace dirt with tilled soil
	res = nil
	res = core.find_nodes_in_area_under_air(
		{x = pos.x - r, y = pos.y - 1, z = pos.z - r},
		{x = pos.x + r, y = pos.y + 2, z = pos.z + r},
		{"group:soil"})

	for n = 1, #res do
		core.swap_node(res[n], {name = "farming:soil"})
		core.get_node_timer(res[n]):start(math.random(15, 60))
	end
end


-- throwable hoe bomb
core.register_entity("farming:hoebomb_entity", {
initial_properties = {
	physical = true,
	visual = "sprite",
	visual_size = {x = 1.0, y = 1.0},
	textures = {"farming_hoe_bomb.png"},
	collisionbox = {-.1,-.1,-.1,.1,.1,.1},
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

					hoe_area(self.lastpos, self.player)
				end

				self.object:remove()

				return

			end
		end

		self.lastpos = pos
	end
})


-- actual throwing function
local function throw_bomb(itemstack, player)

	local playerpos = player:get_pos()

	local obj = core.add_entity({
		x = playerpos.x,
		y = playerpos.y + 1.5,
		z = playerpos.z
	}, "farming:hoebomb_entity")

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


-- hoe bomb item
core.register_craftitem("farming:hoe_bomb", {
	description = S("Hoe Bomb (use or throw on grassy areas to hoe land)"),
	inventory_image = "farming_hoe_bomb.png",
	groups = {flammable = 2, not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointd)

		if pointd.type == "node" then
			hoe_area(pointd.above, user)
		else
			throw_bomb(itemstack, user)

			if not core.is_creative_enabled(user:get_player_name()) then
				itemstack:take_item()
				return itemstack
			end
		end
	end,
})

-- Mithril Scythe (special item)

farming.scythe_not_drops = {"farming:trellis", "farming:crop_poles"}

farming.add_to_scythe_not_drops = function(item)
	table.insert(farming.scythe_not_drops, item)
end

core.register_tool("farming:scythe_mithril", {
	description = S("Mithril Scythe (Use to harvest and replant crops, But not all)"),
	inventory_image = "farming_scythe_mithril.png",
	sound = {breaks = "default_tool_breaks"},

	on_use = function(item, user, pointd)

		if pointd.type ~= "node" then
			return
		end

		local pos = pointd.under
		local pname = user and user:get_player_name() or ""

		if core.is_protected(pos, pname) then
			core.record_protection_violation(pos, pname)
			return
		end

		local node = core.get_node_or_nil(pos)

		if not node then
			return
		end

		local def = core.registered_nodes[node.name]

		if not def then
			return
		end

		if not def.drop then
			return
		end

		if not def.groups
		or not def.groups.plant then
			return
		end

		local drops = core.get_node_drops(node.name, "")

		if not drops
		or #drops == 0
		or (#drops == 1 and drops[1] == "") then
			return
		end

		-- get crop name
		local mname = node.name:split(":")[1]
		local pname = node.name:split(":")[2]
		local sname = tonumber(pname:split("S")[2])
		pname = pname:split("S")[1]

		if not sname then
			return
		end

		-- add dropped items
		for _, dropped_item in pairs(drops) do

			-- dont drop items on this list
			for _, not_item in pairs(farming.scythe_not_drops) do

				if dropped_item == not_item then
					dropped_item = nil
				end
			end

			if dropped_item then

				local obj = core.add_item(pos, dropped_item)

				if obj then

					obj:set_velocity({
						x = math.random(-10, 10) / 9,
						y = 3,
						z = math.random(-10, 10) / 9
					})
				end
			end
		end

		-- Run script hook
		for _, callback in pairs(core.registered_on_dignodes) do
			callback(pos, node, user)
		end

		-- play sound
		core.sound_play("default_grass_footstep", {pos = pos, gain = 1.0})

		local replace = mname .. ":" .. pname .. "S1"

		if core.registered_nodes[replace] then

			local p2 = core.registered_nodes[replace].place_param2 or 1

			core.set_node(pos, {name = replace, param2 = p2})
			core.get_node_timer(pos):start(math.random(166, 286))
		else
			core.set_node(pos, {name = "air"})
		end

		if not core.is_creative_enabled(pname) then

			item:add_wear_by_uses(150)

			return item
		end
	end,
})

core.register_craft({
	output = "farming:scythe_mithril",
	recipe = {
		{"", "default:mithril_ingot", "default:mithril_ingot"},
		{"default:mithril_ingot", "", "group:stick"},
		{"", "", "group:stick"}
	}
})
