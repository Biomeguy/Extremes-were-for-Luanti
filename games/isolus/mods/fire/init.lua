-- fire/init.lua

-- Global namespace for functions
fire = {}

-- Load support for MT game translation.
local S = core.get_translator("fire")

-- 'Enable fire' setting
local fire_enabled = core.settings:get_bool("enable_fire")
if fire_enabled == nil then
	-- enable_fire setting not specified, check for disable_fire
	local fire_disabled = core.settings:get_bool("disable_fire")
	if fire_disabled == nil then
		-- Neither setting specified, check whether singleplayer
		fire_enabled = core.is_singleplayer()
	else
		fire_enabled = not fire_disabled
	end
end

--
-- Items
--

-- Flood flame function
local function flood_flame(pos, _, newnode)
	-- Play flame extinguish sound if liquid is not an 'igniter'
	if core.get_item_group(newnode.name, "igniter") == 0 then
		core.sound_play("fire_extinguish_flame",
			{pos = pos, max_hear_distance = 16, gain = 0.15}, true)
	end
	-- Remove the flame
	return false
end

local ahhc = core.settings:get_bool("altitude_heat_humidity_check")

-- Flame nodes
local fire_node = {
	drawtype = "firelike",
	tiles = {{
		name = "fire_basic_flame_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1}
	}},
	inventory_image = "fire_basic_flame.png",
	paramtype = "light",
	light_source = 13,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	floodable = true,
	damage_per_second = 4,
	groups = {igniter = 2, dig_immediate = 3, fire = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"fire:firemite_flame"}, rarity = 55},
			{items = {""}}
		}
	},
	on_flood = flood_flame
}

-- Basic flame node
local flame_fire_node = table.copy(fire_node)
flame_fire_node.description = S("Fire")
flame_fire_node.groups.not_in_creative_inventory = 1
flame_fire_node.on_timer = function(pos)
	if pos.y > -50 and ahhc ~= false then
for i=-1,1 do
for j=-1,1 do
for k=-1,1 do
	local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
	local n = core.get_node(p)
	if not n then
	elseif n.name == "air" then
		core.set_node(p, {name = "default:hot_air"})
	end
end
end
end
	end
	local f = core.find_node_near(pos, 1, {"group:flammable"})
	if not fire_enabled or not f then
		core.remove_node(pos)
		return
	else
		local flammable_node = core.get_node(f)
		local def = core.registered_nodes[flammable_node.name]
		if def.on_burn then
			def.on_burn(f)
		else
			core.get_node_timer(pos):start(math.random(30, 90))
			core.set_node(f, {name="fire:basic_flame"})
			core.check_for_falling(f)
		end
	end
end
flame_fire_node.on_construct = function(pos)
	local above = {x = pos.x, y = pos.y + 1, z = pos.z}
	core.get_node_timer(above):start(5)
	core.get_node_timer(pos):start(math.random(30, 60))
end

core.register_node("fire:basic_flame", flame_fire_node)

-- Permanent flame node
local permanent_fire_node = table.copy(fire_node)
permanent_fire_node.description = S("Permanent Fire")
permanent_fire_node.on_timer = function(pos)
	if pos.y > -50 and ahhc ~= false then
for i=-1,1 do
for j=-1,1 do
for k=-1,1 do
	local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
	local n = core.get_node(p)
	if not n then
	elseif n.name == "air" then
		core.set_node(p, {name = "default:hot_air"})
	end
end
end
end
	end
	core.get_node_timer(pos):start(math.random(30, 90))
end
permanent_fire_node.on_construct = function(pos)
	local above = {x = pos.x, y = pos.y + 1, z = pos.z}
	core.get_node_timer(above):start(5)
	core.get_node_timer(pos):start(math.random(30, 60))
end

core.register_node("fire:permanent_flame", permanent_fire_node)

core.register_node("fire:firemite_flame", {
	description = "Firemite",
	drawtype = "firelike",
	tiles = {{
		name = "fire_basic_flame_animated.png^[colorize:yellow:90",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1}
	}},
	inventory_image = "fire_basic_flame.png^[colorize:yellow:90",
	paramtype = "light",
	light_source = 14,
	groups = {dig_immediate = 3, termite = 1},
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	damage_per_second = 5,
	on_timer = function(pos)
		-- If there are no flammable nodes around flame, remove flame
		local f = core.find_node_near(pos, 1, {"group:flammable", "group:tree", "group:trunk", "group:wood", "group:leaves"})
		if not f then
			core.remove_node(pos)
		else
	local flammable_node = core.get_node(f)
	local def = core.registered_nodes[flammable_node.name]
	if def.on_burn then
		def.on_burn(f)
	else
		core.set_node(f, {name="fire:firemite_flame"})
		core.check_for_falling(f)
	end
		end
		return true
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(.3)
	end,
})

core.register_node("fire:watermite_flame", {
	description = "Watermite",
	drawtype = "firelike",
	tiles = {{
		name = "fire_basic_flame_animated.png^[colorize:#00aaff:175",--195
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1}
	}},
	inventory_image = "fire_basic_flame.png^[colorize:#00aaff:175",
	paramtype = "light",
	light_source = 14,
	groups = {dig_immediate = 3, termite = 1},
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	liquids_pointable = true,
	damage_per_second = 5,
	on_timer = function(pos)
		-- If there are no flammable nodes around flame, remove flame
		local f = core.find_node_near(pos, 1, {"default:water_source", "default:fresh_water_source", "group:seaweedy", "nssm:mornen", "nssm:mornen_flowing"})
		if not f then
			core.remove_node(pos)
		else
			core.set_node(f, {name="fire:watermite_flame"})
			core.check_for_falling(f)
		end
		return true
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(.3)
	end,
})

core.register_craft({
	type = "shapeless",
	output = "fire:watermite_flame",
	recipe = {"fire:firemite_flame", "default:coal_lump", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craftitem("fire:tinder", {
	description = "Tinder",
	inventory_image = "fire_tinder.png",
})

core.register_craft({
	output = "fire:tinder 8",
	recipe = {
		{"default:birch_bark", "default:birch_bark"},
		{"default:birch_bark", "default:birch_bark"},
		{"default:torch", ""}
	},
	replacements = {{"default:torch", "default:torch_spent"}}
})

core.register_craft({
	output = "fire:tinder 4",
	recipe = {
		{"default:bulrush_2", "default:bulrush_2"},
		{"default:torch", ""}
	},
	replacements = {
		{"default:bulrush_2", "default:cooked_bulrush"},
		{"default:bulrush_2", "default:cooked_bulrush"},
		{"default:torch", "default:torch_spent"}
	}
})

core.register_craft({
	output = "fire:tinder 8",
	recipe = {
		{"group:resinous", "group:resinous"},
		{"default:torch", ""}
	},
	replacements = {{"default:torch", "default:torch_spent"}}
})

core.register_craft({
	output = "fire:tinder 8",
	recipe = {
		{"default:coir", "default:coir"},
		{"default:coir", "default:coir"},
		{"default:torch", ""}
	},
	replacements = {{"default:torch", "default:torch_spent"}}
})

core.register_craft({
	output = "fire:tinder 8",
	recipe = {
		{"default:dry_shrub", "default:dry_shrub"},
		{"default:dry_shrub", "default:dry_shrub"},
		{"default:torch", ""}
	},
	replacements = {{"default:torch", "default:torch_spent"}}
})

core.register_craft({
	output = "fire:tinder 4",
	recipe = {
		{"default:paper", "default:paper"},
		{"default:torch", ""}
	},
	replacements = {{"default:torch", "default:torch_spent"}}
})

core.register_craft({
	output = "fire:tinder 14",
	recipe = {
		{"default:pine_trunk", "default:axe_stone"},
		{"default:torch", ""}
	},
	replacements = {
		{"default:pine_trunk", "default:pine_wood 2"},
		{"default:torch", "default:torch_spent"}
	}
})

core.register_craft({
	output = "fire:tinder 14",
	recipe = {
		{"default:pine_trunk", "default:hand_axe_stone"},
		{"default:torch", ""}
	},
	replacements = {
		{"default:pine_trunk", "default:pine_wood 2"},
		{"default:torch", "default:torch_spent"}
	}
})

core.register_craft({
	output = "fire:tinder 14",
	recipe = {
		{"default:pine_trunk", "default:hand_axe_desert_stone"},
		{"default:torch", ""}
	},
	replacements = {
		{"default:pine_trunk", "default:pine_wood 2"},
		{"default:torch", "default:torch_spent"}
	}
})

-- Flint and Steel
core.register_tool("fire:flint_and_steel", {
	description = S("Flint and Steel"),
	inventory_image = "fire_flint_steel.png",
	range = 3,
	sound = {breaks = "default_tool_breaks"},

	on_use = function(item, user, pointd)
		local rightpos = user:get_wield_index()+1
		local tinder = user:get_inventory():get_stack("main", rightpos)
	if tinder:get_name() == "fire:tinder" then
		local sound_pos = pointd.above or user:get_pos()
		core.sound_play("fire_flint_and_steel",
			{pos = sound_pos, gain = .2, max_hear_distance = 8}, true)
		local pname = user:get_player_name()
		if pointd.type == "node" then
			local node_under = core.get_node(pointd.under).name
			local nodedef = core.registered_nodes[node_under]
			if not nodedef then
				return
			end
			if core.is_protected(pointd.under, pname) then
				core.record_protection_violation(pointd.under, pname)
				core.chat_send_player(pname, "This area is protected")
				return
			end
			if nodedef.on_ignite then
				nodedef.on_ignite(pointd.under, user)
			elseif core.get_item_group(node_under, "flammable") >= 1
					and core.get_node(pointd.above).name == "air" then
				if core.is_protected(pointd.above, pname) then
					core.record_protection_violation(pointd.above, pname)
					return
				end

				core.set_node(pointd.above, {name = "fire:basic_flame"})
			end
		end
		if not core.is_creative_enabled(pname) then
			-- Wear tool
			local wdef = item:get_definition()
			user:get_inventory():set_stack("main", rightpos, "fire:tinder ".. tinder:get_count()-1)
			item:add_wear_by_uses(66)

			-- Tool break sound
			if item:get_count() == 0 and wdef.sound and wdef.sound.breaks then
				core.sound_play(wdef.sound.breaks,
					{pos = sound_pos, gain = .5}, true)
			end
			return item
		end
	else
		core.chat_send_player(user:get_player_name(), "You need tinder at your right.") end
	end
})

core.register_craft({
	output = "fire:flint_and_steel",
	recipe = {{"default:flint", "default:steel_ingot"}}
})

core.register_craft({
	output = "fire:flint_and_steel",
	recipe = {{"default:flint", "default:wrought_iron_ingot"}}
})

core.register_tool("fire:firestriker_stone", {
	description = S("Fire Striker"),
	inventory_image = "stoneage_firestriker_stone.png",
	range = 3,

	on_use = function(item, user, pointd)
		local rightpos = user:get_wield_index()+1
		local tinder = user:get_inventory():get_stack("main", rightpos)
	if tinder:get_name() == "fire:tinder" then
		local sound_pos = pointd.above or user:get_pos()
		core.sound_play("fire_flint_and_stone",
			{pos = sound_pos, gain = .2, max_hear_distance = 7}, true)
		local pname = user:get_player_name()
		if pointd.type == "node" then
			local node_under = core.get_node(pointd.under).name
			local nodedef = core.registered_nodes[node_under]
			if not nodedef then
				return
			end
			if core.is_protected(pointd.under, pname) then
				core.record_protection_violation(pointd.under, pname)
				core.chat_send_player(pname, "This area is protected")
				return
			end
			if nodedef.on_ignite then
				nodedef.on_ignite(pointd.under, user)
			elseif core.get_item_group(node_under, "flammable") >= 1
					and core.get_node(pointd.above).name == "air" then
				if core.is_protected(pointd.above, pname) then
					core.record_protection_violation(pointd.above, pname)
					return
				end

				core.set_node(pointd.above, {name = "fire:basic_flame"})
			end
		end
		if not core.is_creative_enabled(pname) then
			user:get_inventory():set_stack("main", rightpos, "fire:tinder ".. tinder:get_count()-1)
			item:add_wear_by_uses(33)
			return item
		end
	else
		core.chat_send_player(user:get_player_name(), "You need tinder at your right.") end
	end
})

core.register_craft({
	output = "fire:firestriker_stone",
	recipe = {{"default:flint", "group:rock"}}
})

-- Charcoal lumps
core.register_craftitem("fire:charcoal_small_lump", {
	description = S("Small Charcoal Lump"),
	inventory_image = "charcoal_small.png",
	groups = {flammable = 1},
})

core.register_craft({
	type = "cooking",
	output = "fire:charcoal_small_lump",
	recipe = "default:stick",
	cooktime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "fire:charcoal_small_lump",
	burntime = 16,
})

core.register_craftitem("fire:charcoal_lump", {
	description = S("Charcoal Lump"),
	inventory_image = "charcoal_lump.png",
	groups = {coal = 1, flammable = 1},
})

core.register_craft({
	output = "fire:charcoal_lump",
	recipe = {
		{"fire:charcoal_small_lump"},
		{"fire:charcoal_small_lump"}
	}
})

core.register_craft({
	type = "cooking",
	output = "fire:charcoal_lump 4",
	recipe = "group:trunk",
	cooktime = 4,
})

core.register_craft({
	type = "fuel",
	recipe = "fire:charcoal_lump",
	burntime = 33,
})


--
-- Sound
--

-- Enable if no setting present
local flame_sound = core.settings:get_bool("flame_sound", true)

if flame_sound then
	local handles = {}
	local timer = 0

	-- Parameters
	local radius = 8 -- Flame node search radius around player
	local cycle = 3 -- Cycle time for sound updates

	-- Update sound for player
	function fire.update_player_sound(player)
		local pname = player:get_player_name()
		-- Search for flame nodes in radius around player
		local ppos = player:get_pos()
		local areamin = vector.subtract(ppos, radius)
		local areamax = vector.add(ppos, radius)
		local fpos, num = core.find_nodes_in_area(areamin, areamax,
			{"fire:basic_flame", "fire:permanent_flame", "fire:firemite_flame",
			"fire:watermite_flame", "burning_bush:leaves", "nssm:phoenix_fire"})
		-- Total number of flames in radius
		local flames = (num["fire:basic_flame"] or 0) +
			(num["fire:permanent_flame"] or 0) +
			(num["fire:firemite_flame"] or 0) +
			(num["fire:watermite_flame"] or 0) +
			(num["burning_bush:leaves"] or 0) +
			(num["nssm:phoenix_fire"] or 0)
		-- Stop previous sound
		if handles[pname] then
			core.sound_stop(handles[pname])
			handles[pname] = nil
		end
		-- If flames
		if flames > 0 then
			-- Find centre of flame positions
			local fposmid = fpos[1]
			-- If more than 1 flame
			if #fpos > 1 then
				local fposmin = areamax
				local fposmax = areamin
				for i = 1, #fpos do
					local fposi = fpos[i]
					if fposi.x > fposmax.x then
						fposmax.x = fposi.x
					end
					if fposi.y > fposmax.y then
						fposmax.y = fposi.y
					end
					if fposi.z > fposmax.z then
						fposmax.z = fposi.z
					end
					if fposi.x < fposmin.x then
						fposmin.x = fposi.x
					end
					if fposi.y < fposmin.y then
						fposmin.y = fposi.y
					end
					if fposi.z < fposmin.z then
						fposmin.z = fposi.z
					end
				end
				fposmid = vector.divide(vector.add(fposmin, fposmax), 2)
			end
			-- Play sound
			local handle = core.sound_play("fire_fire", {
				pos = fposmid,
				to_player = pname,
				gain = math.min(0.06 * (1 + flames * 0.125), 0.18),
				max_hear_distance = 32,
				loop = true -- In case of lag
			})
			-- Store sound handle for this player
			if handle then
				handles[pname] = handle
			end
		end
	end

	-- Cycle for updating players sounds
	core.register_globalstep(function(dtime)
		timer = timer + dtime
		if timer < cycle then
			return
		end

		timer = 0
		local players = core.get_connected_players()
		for n = 1, #players do
			fire.update_player_sound(players[n])
		end
	end)

	-- Stop sound and clear handle on player leave
	core.register_on_leaveplayer(function(player)
		local pname = player:get_player_name()
		if handles[pname] then
			core.sound_stop(handles[pname])
			handles[pname] = nil
		end
	end)
end

dofile(core.get_modpath("fire") .. "/campfire.lua")

core.register_node("fire:charcoal_block", {
	description = "Charcoal Block",
	tiles = {"charcoal_charcoal_block.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("fire:ash_block", {
	description = "Ash Block",
	tiles = {"charcoal_ash_block.png"},
	is_ground_content = false,
	groups = {crumbly = 2, falling_node = 1},
	sounds = default.node_sound_sand_defaults(),
})

register_nine('fire:charcoal_block', 'fire:charcoal_lump')
register_nine('fire:ash_block', 'fire:ash')

core.register_craft({
	type = "fuel",
	recipe = "fire:charcoal_block",
	burntime = 297,
})


-- Deprecated function kept temporarily to avoid crashes if mod fire nodes call it
function fire.update_sounds_around() end

--
-- ABM
--

if fire_enabled then
	-- Ignite neighboring nodes, add basic flames
	core.register_abm({
		label = "Ignite flame",
		nodenames = {"group:flammable"},
		neighbors = {"group:igniter"},
		interval = 7,
		chance = 12,
		catch_up = false,
		action = function(pos)
			local p = core.find_node_near(pos, 1, {"air"})
			if p then
				core.set_node(p, {name = "fire:basic_flame"})
			end
		end
	})
end
