
--[[

Copyright (C) 2016 - Auke Kok <sofar@foo-projects.org>

"lightning" is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as
published by the Free Software Foundation; either version 2.1
of the license, or (at your option) any later version.

--]]

lightning = {}

lightning.interval_low = 17
lightning.interval_high = 503
lightning.range_h = 100
lightning.range_v = 50
lightning.size = 100
-- disable this to stop lightning mod from striking
lightning.auto = true
-- range of the skybox highlight and sound effect
lightning.effect_range = 500

local rng = PcgRandom(32321123312123)

-- table with playername as key and previous skybox as value
local ps = {}
local ttl = 1

local revertsky = function()
	if ttl == 0 then
		return
	end
	ttl = ttl - 1
	if ttl > 0 then
		return
	end

	for playername, sky in pairs(ps) do
		local player = core.get_player_by_name(playername)
		-- check if the player is still online
		if player then
			player:set_sky({base_color=sky.base_color, type=sky.type, textures=sky.textures})
		end
	end

	ps = {}
end

core.register_globalstep(revertsky)

-- select a random strike point, midpoint
local function choose_pos(pos)
	if not pos then
		local playerlist = core.get_connected_players()
		local playercount = table.getn(playerlist)

		-- nobody on
		if playercount == 0 then
			return nil, nil
		end

		local r = rng:next(1, playercount)
		local randomplayer = playerlist[r]
		pos = randomplayer:get_pos()

		-- avoid striking underground
		if pos.y < -20 then
			return nil, nil
		end

		pos.x = math.floor(pos.x - (lightning.range_h / 2) + rng:next(1, lightning.range_h))
		pos.y = pos.y + (lightning.range_v / 2)
		pos.z = math.floor(pos.z - (lightning.range_h / 2) + rng:next(1, lightning.range_h))
	end

	local b, pos2 = core.line_of_sight(pos, {x = pos.x, y = pos.y - lightning.range_v, z = pos.z}, 1)

	-- nothing but air found
	if b then
		return nil, nil
	end

	local n = core.get_node({x = pos2.x, y = pos2.y - 1/2, z = pos2.z})
	if n.name == "air" or n.name == "ignore" then
		return nil, nil
	end

	return pos, pos2
end

-- lightning strike API
-- * pos: optional, if not given a random pos will be chosen
-- * returns: bool - success if a strike happened
lightning.strike = function(pos, temp)
	if lightning.auto and not temp then
		core.after(rng:next(lightning.interval_low, lightning.interval_high), lightning.strike)
	end

	local pos2
	pos, pos2 = choose_pos(pos)

	if not pos then
		return false
	end

	-- are there lightning rods/funnels
	local rod = core.find_nodes_in_area({x = pos2.x + lightning.range_h, y = pos2.y + lightning.range_v, z = pos2.z + lightning.range_h},
		{x = pos2.x - lightning.range_h, y = pos2.y, z = pos2.z - lightning.range_h}, {"lightning:funnel_1"})
	if #rod > 0 then
		pos2 = rod[math.random(#rod)]
		pos = pos2
		core.after(rng:next(lightning.interval_low/#rod, lightning.interval_high/#rod), function() lightning.strike(nil, true) end)
		core.after(rng:next(lightning.interval_low/#rod, lightning.interval_high/#rod), function() lightning.strike(nil, true) end)
	end
	local funnel = core.find_nodes_in_area({x = pos2.x + lightning.range_h, y = pos2.y + lightning.range_v, z = pos2.z + lightning.range_h},
		{x = pos2.x - lightning.range_h, y = pos2.y, z = pos2.z - lightning.range_h}, {"lightning:funnel_2"})
	if #funnel > 0 then
		pos2 = funnel[math.random(#funnel)]
		pos = pos2
	end

	core.add_particlespawner({
		amount = 1,
		time = .2,
		-- make it hit the top of a block exactly with the bottom
		minpos = {x = pos2.x, y = pos2.y + (lightning.size / 2) + 1/2, z = pos2.z },
		maxpos = {x = pos2.x, y = pos2.y + (lightning.size / 2) + 1/2, z = pos2.z },
		exptime = .2,
		size = lightning.size * 10,
		collisiondetection = true,
		vertical = true,
		-- to make it appear hitting the node that will get set on fire, make sure
		-- to make the texture lightning bolt hit exactly in the middle of the
		-- texture (e.g. 127/128 on a 256x wide texture)
		texture = "lightning_lightning_" .. rng:next(1,3) .. ".png",
		-- 0.4.15+
		glow = 14 })

	core.sound_play({ pos = pos, name = "lightning_thunder", gain = 10, max_hear_distance = lightning.effect_range })

	-- damage nearby objects, player or not
	for _, obj in ipairs(core.get_objects_inside_radius(pos, 5)) do
		-- nil as param#1 is supposed to work, but core can't handle it.
		obj:punch(obj, 1.0, {full_punch_interval = 1.0, damage_groups = {fleshy=8}}, nil)
	end

	local playerlist = core.get_connected_players()
	for i = 1, #playerlist do
		local player = playerlist[i]
		local distance = vector.distance(player:get_pos(), pos)

		-- only affect players inside effect_range
		if distance < lightning.effect_range then
			local sky = player:get_sky(true)

			local pname = player:get_player_name()
			if ps[pname] == nil then
				ps[pname] = sky
				player:set_sky({base_color=0xffffff, type="plain", textures={}})
			end
		end
	end

	-- trigger revert of skybox
	ttl = 5

	-- set the air node above it on fire
	pos2.y = pos2.y + 1/2
	if core.get_item_group(core.get_node({x = pos2.x, y = pos2.y - 1, z = pos2.z}).name, "liquid") < 1 then
		if core.get_node(pos2).name == "air" then
			-- only 1/4 of the time, something is changed
			if rng:next(1,4) > 1 then
				return
			end
			-- very rarely, potentially cause a fire
			if fire and rng:next(1,1000) == 1 then
				core.set_node(pos2, {name = "fire:basic_flame"})
			else
				core.set_node(pos2, {name = "lightning:dying_flame"})
			end
		end
	end

	-- perform block modifications
	if not default or rng:next(1,10) > 1 then
		return
	end
	pos2.y = pos2.y - 1
	local n = core.get_node(pos2)
	if core.get_item_group(n.name, "trunk") > 0 then
		core.set_node(pos2, { name = "fire:charcoal_block"})
	elseif core.get_item_group(n.name, "sand") > 0 then
		core.set_node(pos2, { name = "default:glass"})
	elseif core.get_item_group(n.name, "soil") > 0 or n.name == "default:compost_pile"
		or n.name == "default:compost" or n.name == "default:mud" then
		if n.name == "default:clay_dirt"
		or n.name == "default:clay_dirt_with_savanna_grass"
		or n.name == "farming:clay_soil"
		or n.name == "farming:clay_soil_wet" then
			core.set_node(pos2, {name = "default:dry_clay_dirt"})
		else
			core.set_node(pos2, { name = "default:dry_dirt"})
		end
		core.get_node_timer(pos2):start(math.random(3, 5))
	end
end

-- a special fire node that doesn't burn anything, and automatically disappears
core.register_node("lightning:dying_flame", {
	description = "Dying Flame",
	drawtype = "firelike",
	tiles = {{
		name = "fire_basic_flame_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1}
	}},
	inventory_image = "fire_basic_flame.png",
	paramtype = "light",
	light_source = 14,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	damage_per_second = 4,
	groups = {dig_immediate = 3, not_in_creative_inventory=1},
	on_timer = function(pos)
		core.remove_node(pos)
	end,
	drop = "",

	on_construct = function(pos)
		core.get_node_timer(pos):start(rng:next(20, 40))
		if fire and fire.on_flame_add_at then
			core.after(0.5, fire.on_flame_add_at, pos)
		end
	end,
})

core.register_node("lightning:funnel_1", {
	description = "Lightning Rod (Has a realistic flaw)",
	drawtype = "plantlike",
	tiles = {"lightning_funnel_1.png"},
	inventory_image = "lightning_funnel_1.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, .5, .1}
	},
	groups = {cracky = 3, oddly_breakable_by_hand = 2, attached_node = 1},
	sounds = default.node_sound_metal_defaults(),
})

core.register_node("lightning:funnel_2", {
	description = "Tesla Lightning Funnel",
	drawtype = "plantlike",
	tiles = {"lightning_funnel_2.png"},
	inventory_image = "lightning_funnel_2.png",
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 2,
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .5, .2}
	},
	groups = {cracky = 3, oddly_breakable_by_hand = 2, attached_node = 1},
	sounds = default.node_sound_metal_defaults(),
})

core.register_craft({
	output = "lightning:funnel_1",
	recipe = {
		{"group:rock"},
		{"default:silver_ingot"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "lightning:funnel_2",
	recipe = {
		{"default:silver_ingot", ""},
		{"default:silver_ingot", "group:rock"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

-- if other mods disable auto lightning during initialization, don't trigger the first lightning.
core.after(5, function()
	if lightning.auto then
		core.after(rng:next(lightning.interval_low,
			lightning.interval_high), lightning.strike)
	end
end)