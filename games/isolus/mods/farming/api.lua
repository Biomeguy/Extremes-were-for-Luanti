-- farming/api.lua

-- support for MT game translation.
local S = farming.get_translator
local tr = core.get_modpath("toolranks")
local fishing = core.get_modpath("fishing")

-- Wear out hoes, place soil
farming.hoe_on_use = function(item, user, pointd, uses)
	local pt = pointd
	-- check if pointing at a node top
	if not pt or pt.type ~= "node"
	or pt.above.y ~= pt.under.y + 1 then
		return
	end

	local under = core.get_node(pt.under)
	local p = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
	local above = core.get_node(p)

	-- return if any of the nodes is not registered
	if not core.registered_nodes[under.name] then
		return
	end
	if not core.registered_nodes[above.name] then
		return
	end

	-- check if the node above the pointed thing is air
	if above.name ~= "air" then
		if core.get_item_group(above.name, "flora") ~= 1 then
			return
		end
	end

	-- check if pointing at dirt
	if core.get_item_group(under.name, "soil") ~= 1 then
		return
	end

	-- check if soil defined
	local regN = core.registered_nodes[under.name]
	if regN._soil == nil or regN._soil.dry == nil then
		return
	end

	local pname = user and user:get_player_name() or ""

	if core.is_protected(pt.under, pname) then
		core.record_protection_violation(pt.under, pname)
		return
	end
	if core.is_protected(pt.above, pname) then
		core.record_protection_violation(pt.above, pname)
		return
	end

	-- turn the node into soil and play sound
	core.dig_node(pt.above)
	core.set_node(pt.under, {name = regN._soil.dry})
	core.get_node_timer(pt.under):start(math.random(15, 60))
	core.sound_play("default_dig_crumbly", {pos = pt.under, gain = .3}, true)

	if fishing and math.random(1, 100) < fishing_setting.settings["worm_chance"] then
		if fishing_setting.settings["worm_is_mob"] == true then
			core.add_entity({x=pt.under.x, y=pt.under.y+.4, z=pt.under.z}, "fishing:bait_worm_entity")
		else
			local inv = user:get_inventory()
			if inv:room_for_item("main", {name="fishing:bait_worm", count=1, wear=0, metadata=""}) then
				inv:add_item("main", {name="fishing:bait_worm", count=1, wear=0, metadata=""})
			end
		end
	end
	local wear = uses

	if core.is_creative_enabled(pname) then
		if tr then
			wear = 1
		else
			wear = 0
		end
	end

	if tr then
		item = toolranks.new_afteruse(item, user, under, {wear = wear})
	else
		-- wear tool
		local wdef = item:get_definition()
		item:add_wear_by_uses(wear)
		-- tool break sound
		if item:get_count() == 0 and wdef.sound and wdef.sound.breaks then
			core.sound_play(wdef.sound.breaks, {pos = pt.above, gain = .5}, true)
		end
	end
	return item
end

-- Register new hoes
farming.register_hoe = function(name, def)
	-- Check for : prefix (register new hoes in your mod's namespace)
	if name:sub(1,1) ~= ":" then
		name = ":" .. name
	end
	-- Check def table
	if def.description == nil then
		def.description = S("Hoe")
	end
	if def.inventory_image == nil then
		def.inventory_image = "unknown_item.png"
	end
	if def.max_uses == nil then
		def.max_uses = 30
	end
	-- Register the tool
	core.register_tool(name, {
		description = def.description,
		inventory_image = def.inventory_image,
		on_use = function(itemstack, user, pointd)
			return farming.hoe_on_use(itemstack, user, pointd, def.max_uses)
		end,
		groups = def.groups,
		sound = {breaks = "default_tool_breaks"},
	})
	-- Register its recipe
	if def.recipe then
		core.register_craft({
			output = name:sub(2),
			recipe = def.recipe
		})
	elseif def.material then
		core.register_craft({
			output = name:sub(2),
			recipe = {
				{def.material, def.material},
				{"", "group:stick"},
				{"", "group:stick"}
			}
		})
	end
end

-- how often node timers for plants will tick, +/- some random value
local function tick(pos)
	core.get_node_timer(pos):start(math.random(166, 286))
end
-- how often a growth failure tick is retried (e.g. too dark)
local function tick_again(pos)
	core.get_node_timer(pos):start(math.random(40, 80))
end

-- Seed placement
farming.place_seed = function(itemstack, placer, pointd, plantname)
	local pt = pointd
	-- check if pointing at a node
	if not pt then
		return itemstack
	end
	if pt.type ~= "node" then
		return itemstack
	end

	local under = core.get_node(pt.under)
	local above = core.get_node(pt.above)

	local pname = placer and placer:get_player_name() or ""

	if core.is_protected(pt.under, pname) then
		core.record_protection_violation(pt.under, pname)
		return
	end
	if core.is_protected(pt.above, pname) then
		core.record_protection_violation(pt.above, pname)
		return
	end

	-- return if any of the nodes is not registered
	if not core.registered_nodes[under.name] then
		return itemstack
	end
	if not core.registered_nodes[above.name] then
		return itemstack
	end

	-- check if pointing at the top of the node
	if pt.above.y ~= pt.under.y+1 then
		return itemstack
	end

	-- check if you can replace the node above the pointed node
	if not core.registered_nodes[above.name].buildable_to then
		return itemstack
	end

	-- check if pointing at soil
	if core.get_item_group(under.name, "soil") < 2 then
		return itemstack
	end

	-- add the node and remove 1 item from the itemstack
	if placer then
		default.log_player_action(placer, "places node", plantname, "at", pt.above)
	end
	core.set_node(pt.above, {name = plantname, param2 = 1})
--	core.sound_play("default_place_node", {pos = pt.above, gain = .25})
	tick(pt.above)
	if not core.is_creative_enabled(pname) then
		itemstack:take_item()
	end
	return itemstack
end

-- check if on wet soil
farming.can_grow = function(pos)
	local below = core.get_node(pos:offset(0, -1, 0))
	return core.get_item_group(below.name, "soil") >= 3
end

farming.grow_plant = function(pos, elapsed)
	local node = core.get_node(pos)
	local name = node.name
	local def = core.registered_nodes[name]

	if not def.next_plant then
		-- disable timer for fully grown plant
		return
	end

	local heat_min = def.heat_min or 30
	local heat_max = def.heat_max or 80
	local humi_min = def.humidity_min or 22
	local humi_max = def.humidity_max or 120
	-- check altitude for heat and humidity
	if default.h_h_h(pos, -31000, -10) then
		if default.h_h_h(pos, -10, 110, heat_min, heat_max, humi_min, humi_max) then
			core.set_node(pos, {name = "default:dry_shrub"})
			return
		end
	end

	-- grow seed
	if core.get_item_group(node.name, "seed") ~= 0 then
		local soil_node = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		if not soil_node then
			tick_again(pos)
			return
		end
		-- omitted a check for light, seeds can germinate in the dark.
		local placenode = {name = def.next_plant}
		if def.place_param2 then
			placenode.param2 = def.place_param2
		end
		core.swap_node(pos, placenode)
		tick(pos)
		return
	end

	local meta = core.get_meta(pos)
	if not (def.can_grow or farming.can_grow)(pos) and meta:get_int("soil_need") < 1 then
		tick_again(pos)
		return
	end

	local light_level = 11
	if meta:get_int("light_level") > 0 then
		light_level = light_level - (meta:get_int("light_level") * 3)
		meta:set_int("light_level", 0)
	end
	-- check light
	local light = core.get_node_light(pos)
	if not light or light < light_level then
		tick_again(pos)
		return
	end

	-- grow
	local placenode = {name = def.next_plant}
	if def.place_param2 then
		placenode.param2 = def.place_param2
	end
	core.swap_node(pos, placenode)

	-- new timer needed?
	if core.registered_nodes[def.next_plant].next_plant then
		tick(pos)
	end
	return
end
