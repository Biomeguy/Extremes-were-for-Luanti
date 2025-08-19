
-- ecology by D00Med, Biomeguy (Thanks to the Terasology team for all images named after it)

dofile(core.get_modpath("ecology") .. "/moonflower.lua")

local exen = core.get_modpath("extra_energy")

core.register_node("ecology:sumbrellia", {
	description = "Sumbrellia Plant",
	drawtype = "plantlike",
	tiles = {"terasology_sumbrellia.png"},
	inventory_image = "terasology_sumbrellia.png",
	wield_image = "terasology_sumbrellia.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1, 3))
	end,
	on_timer = function(pos, elapsed)
		if core.get_meta(pos):get_int("exen") < 20 then
	for _,obj in ipairs(core.get_objects_inside_radius(pos, 4)) do
		if not obj:is_player() and obj:get_luaentity() and obj:get_luaentity().name == "extra_energy:orb" then
			if obj:get_luaentity().collect then
				obj:set_properties({physical_state = false, physical = false})
				local pos2 = obj:get_pos()
				local vec = {x=pos.x-pos2.x, y=pos.y-pos2.y, z=pos.z-pos2.z}
				vec.x = vec.x*3  vec.y = vec.y*3  vec.z = vec.z*3
				obj:set_velocity(vec)
				core.get_node_timer(pos):start(.01)
				return
			end
		end
	end
	core.get_node_timer(pos):start(math.random(1, 3))
		else
	core.set_node(pos, {name = "ecology:sumbrellia_full"})
		end
	end,
	on_rightclick = function(pos, node, clicker, item)
if exen then
	if core.get_item_group(core.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name, "soil") > 0 then
		if (item:get_name() == "default:silver_ingot" or item:get_name() == "default:copper_ingot") and item:get_count() == 1 then
	local extra_energy = tonumber(clicker:get_meta():get_int("_extra_energy"))
	local num = 20
	local xn = core.get_meta(pos):get_int("exen")
	if xn > 0 then
		num = num - xn
	end
	if extra_energy >= num then
		if clicker:get_meta():get_string("_infinite_energy") ~= "true" then
	clicker:get_meta():set_int("_extra_energy", extra_energy - num)
		end
		core.set_node(pos, {name = "ecology:sumbrellia_full"})
	end
		end
	end
end
	end,
	on_dig = exen and function(pos, node, digger)
	local xn = core.get_meta(pos):get_int("exen")
if xn > 0 then
	local obj = core.add_entity(pos, "extra_energy:orb")
	if xn > 1 and obj then
		obj:set_properties({value = xn, visual_size = {x=.5, y=.5}})
	end
end
--	core.chat_send_all("Extra energy is ".. xn)
core.node_dig(pos, node, digger)
	end,
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:sumbrellia_full", {
	description = "Sumbrellia Plant Full",
	drawtype = "plantlike",
	tiles = {"terasology_sumbrellia2.png"},
	inventory_image = "terasology_sumbrellia2.png",
	paramtype = "light",
	light_source = 9,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "extra_energy:globe",
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	node_dig_prediction = "ecology:sumbrellia",
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
	after_dig_node = function(pos)
		core.set_node(pos, {name = "ecology:sumbrellia"})
		core.get_node_timer(pos):start(math.random(1, 3))
	end,
})

core.register_node("ecology:pinkflower2", {
	description = "Pink Bell Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_pink.png"},
	inventory_image = "moreplants_pink.png",
	wield_image = "moreplants_pink.png",
	paramtype = "light",
	visual_scale = 1.4,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1, flower=1, color_pink=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:aliengrass", {
	description = "Alien Grass",
	drawtype = "plantlike",
	tiles = {"moreplants_aliengrass.png"},
	inventory_image = "moreplants_aliengrass.png",
	wield_image = "moreplants_aliengrass.png",
	paramtype = "light",
	visual_scale = 1.54,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .5, .2}
	},
	groups = {snappy=2, flammable=1, oddly_breakable_by_hand=2, attached_node=1, flora=1, color_dark_green=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:bigfern", {
	description = "Big Fern",
	drawtype = "plantlike",
	tiles = {"ecology_bigfern.png"},
	inventory_image = "ecology_bigfern.png",
	wield_image = "ecology_bigfern.png",
	paramtype = "light",
	visual_scale = 1.5,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:bigflower", {
	description = "Big Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_bigflower.png"},
	inventory_image = "moreplants_bigflower.png",
	wield_image = "moreplants_bigflower.png",
	paramtype = "light",
	visual_scale = 1.2,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1, flower=1, color_red=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:medflower", {
	description = "Medium Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_medflower.png"},
	inventory_image = "moreplants_medflower.png",
	wield_image = "moreplants_medflower.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	on_use = core.item_eat(1),
	groups = {snappy=3, flammable=1, attached_node=1, flora=1, flower=1, color_red=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:yellow_weed", {
	description = "Yellow Weed",
	drawtype = "plantlike",
	tiles = {"ecology_yellow_weed.png"},
	inventory_image = "ecology_yellow_weed.png",
	wield_image = "ecology_yellow_weed.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.2, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:stoneweed", {
	description = "Stone Weed",
	drawtype = "plantlike",
	tiles = {"ecology_stoneweed.png"},
	inventory_image = "ecology_stoneweed.png",
	wield_image = "ecology_stoneweed.png",
	paramtype = "light",
	is_ground_content = false,-- anti cave removal
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1859, 3719))
	end,
	on_timer = function(pos, elapsed)
		if core.find_node_near(pos, 2, "ignore") or core.find_node_near(pos, 2, "group:lava") then
			-- Node under not yet loaded, try later
			core.get_node_timer(pos):start(300)
			return
		end

		-- Stop growing if not on stone or sand.
		local under = core.get_node({x = pos.x, y = pos.y - 1, z = pos.z})
		if core.get_item_group(under.name, "stone") == 0 and core.get_item_group(under.name, "sand") == 0 then
			core.get_node_timer(pos):stop()
			return
		end

		local pos0 = vector.subtract(pos, 4)
		local pos1 = vector.add(pos, 4)
		if #core.find_nodes_in_area(pos0, pos1, "ecology:stoneweed") > 3 then
			core.get_node_timer(pos):start(300)
			return
		end

		local sands = core.find_nodes_in_area_under_air(pos0, pos1, {"group:stone", "group:sand"})
	local num_sands = #sands
	if num_sands >= 1 then
		for si = 1, math.min(3, num_sands) do
			local sand = sands[math.random(num_sands)]
			local sand_name = core.get_node(sand).name
			local sand_above = {x = sand.x, y = sand.y + 1, z = sand.z}
			if sand_name == under.name then -- Only spread to same surface node
	core.set_node(sand_above, {name = "ecology:stoneweed"})
	core.get_node_timer(sand_above):start(math.random(1859, 3719))
			end
		end
	end
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	groups = {snappy=2, oddly_breakable_by_hand=1, attached_node=1, mineral_life=1},
	sounds = default.node_sound_leaves_defaults({
		dig = {name = "default_hard_footstep", gain = .2},
		dug = {name = "default_hard_footstep", gain = .5},
	}),
})

core.register_node("ecology:spardeflower", {
	description = "Sparde Flower",
	drawtype = "plantlike",
	tiles = {"terasology_spardeflower.png"},
	inventory_image = "terasology_spardeflower.png",
	wield_image = "terasology_spardeflower.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1, flower=1, color_magenta=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:bluespike", {
	description = "Blue Spikeflower",
	drawtype = "plantlike",
	tiles = {"moreplants_bluespike.png"},
	inventory_image = "moreplants_bluespike.png",
	wield_image = "moreplants_bluespike.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1, flower=1, color_blue=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:blueflower", {
	description = "Blue Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_blueflower.png"},
	inventory_image = "moreplants_blueflower.png",
	wield_image = "moreplants_blueflower.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flower=1, color_grey=1},
	sounds = default.node_sound_leaves_defaults(),
})

ecology = {}

--Desert flora probagation
function ecology.desert_flora_spread(pos)
	if core.find_node_near(pos, 2, "ignore") then
		core.get_node_timer(pos):start(300)
		return
	end

	local node = core.get_node(pos)
	local def = core.registered_nodes[node.name]
	local heat_min = def.plant_heat_min or -5
	local heat_max = def.plant_heat_max or 400
	local humi_min = def.plant_humidity_min or -5
	local humi_max = def.plant_humidity_max or 400
	-- check altitude for heat and humidity
	if default.h_h_h(pos, -31000, -10) then
		if default.h_h_h(pos, -10, 110, heat_min, heat_max, humi_min, humi_max) then
	core.set_node(pos, {name = "default:dry_shrub"})
	return
		end
	end

	-- Stop growing if not on sand
	local under = core.get_node({x = pos.x, y = pos.y - 1, z = pos.z})
	if core.get_item_group(under.name, "sand") == 0 then
		core.get_node_timer(pos):stop()
		return
	end

	local light = core.get_node_light(pos)
	if not light or light < 12 then
		core.get_node_timer(pos):start(300)
		return
	end

	local pos0 = vector.subtract(pos, 4)
	local pos1 = vector.add(pos, 4)
	local num = #core.find_nodes_in_area(pos0, pos1, "group:desert_flora")
	if num > 3 then
		core.get_node_timer(pos):start(300)
		return
	end

	local sands = core.find_nodes_in_area_under_air(pos0, pos1, "group:sand")
	local num_sands = #sands
	if num_sands >= 1 then
		for si = 1, math.min(3, num_sands) do
			local sand = sands[math.random(num_sands)]
			local sand_name = core.get_node(sand).name
			local sand_above = {x = sand.x, y = sand.y + 1, z = sand.z}
			light = core.get_node_light(sand_above)
			if light and light >= 12 and sand_name == under.name then -- Only spread to same surface node
	-- check altitude for heat and humidity
	if default.h_h_h(sand_above, -31000, -10) then
		if default.h_h_h(sand_above, -10, 110, heat_min, heat_max, humi_min, humi_max) then
			node.name = "default:dry_shrub"
		end
	end
	core.set_node(sand_above, {name = node.name})
	core.get_node_timer(sand_above):start(math.random(1859, 3719))
			end
		end
	end
	core.get_node_timer(pos):start(math.random(300, 1500))
end

core.register_node("ecology:eyeweed", {
	description = "Eye Weed",
	drawtype = "plantlike",
	tiles = {"moreplants_eyeweed.png"},
	inventory_image = "moreplants_eyeweed.png",
	wield_image = "moreplants_eyeweed.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "ecology:eye",
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1859, 3719))
	end,
	on_timer = ecology.desert_flora_spread,
	groups = {snappy=3, flammable=1, attached_node=1, desert_flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:fern", {
	description = "Fern",
	drawtype = "plantlike",
	tiles = {"moreplants_fern.png"},
	inventory_image = "moreplants_fern.png",
	wield_image = "moreplants_fern.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:bush", {
	description = "Bush",
	drawtype = "plantlike",
	tiles = {"moreplants_bush.png"},
	inventory_image = "moreplants_bush.png",
	wield_image = "moreplants_bush.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:small_cactus_dark", {
	description = "Small Dark Cactus",
	drawtype = "plantlike",
	tiles = {"ecology_small_dark_cactus.png"},
	inventory_image = "ecology_small_dark_cactus.png",
	wield_image = "ecology_small_dark_cactus.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	damage_per_second = 1,
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, 0, .1}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1859, 3719))
	end,
	on_timer = ecology.desert_flora_spread,
	groups = {snappy=3, flammable=1, attached_node=1, desert_flora=1},
	sounds = default.node_sound_leaves_defaults()
})

core.register_node("ecology:small_cactus", {
	description = "Small Cactus",
	drawtype = "plantlike",
	tiles = {"ecology_small_cactus.png"},
	inventory_image = "ecology_small_cactus.png",
	wield_image = "ecology_small_cactus.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, 0, .1}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1859, 3719))
	end,
	on_timer = ecology.desert_flora_spread,
	groups = {snappy=3, flammable=1, attached_node=1, desert_flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:small_cactus_prikly", {
	description = "Small Prickly Pear Cactus",
	drawtype = "plantlike",
	tiles = {"ecology_small_prickly_pear.png"},
	inventory_image = "ecology_small_prickly_pear.png",
	wield_image = "ecology_small_prickly_pear.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1859, 3719))
	end,
	on_timer = ecology.desert_flora_spread,
	groups = {snappy=2, flammable=1, oddly_breakable_by_hand=2, attached_node=1, desert_flora=1},
	sounds = default.node_sound_leaves_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
	}),
})

core.register_node("ecology:small_cactus_prikly2", {
	description = "Small Prickly Pear Cactus 2",
	drawtype = "plantlike",
	tiles = {"ecology_small_prickly_pear2.png"},
	inventory_image = "ecology_small_prickly_pear2.png",
	wield_image = "ecology_small_prickly_pear2.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1859, 3719))
	end,
	on_timer = ecology.desert_flora_spread,
	groups = {snappy=2, flammable=1, oddly_breakable_by_hand=2, attached_node=1, desert_flora=1},
	sounds = default.node_sound_leaves_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
	}),
})

core.register_node("ecology:aloe_vera", {
	description = "Aloe Vera",
	drawtype = "plantlike",
	tiles = {"ecology_aloe_vera.png"},
	inventory_image = "ecology_aloe_vera.png",
	wield_image = "ecology_aloe_vera.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1859, 3719))
	end,
	on_timer = ecology.desert_flora_spread,
	groups = {snappy=2, flammable=1, oddly_breakable_by_hand=2, attached_node=1, desert_flora=1},
	sounds = default.node_sound_leaves_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
	}),
})

core.register_node("ecology:firefung", {
	description = "Fire Mushroom",
	drawtype = "plantlike",
	tiles = {"moreplants_firemush.png"},
	inventory_image = "moreplants_firemush.png",
	wield_image = "moreplants_firemush.png",
	paramtype = "light",
	is_ground_content = false,-- anti cave removal
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {mushroom = 1, snappy=3, igniter=1, hot=3, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:bluemush", {
	description = "Blue Cave Mushroom",
	drawtype = "plantlike",
	tiles = {"moreplants_bluemush.png"},
	inventory_image = "moreplants_bluemush.png",
	wield_image = "moreplants_bluemush.png",
	paramtype = "light",
	is_ground_content = false,-- anti cave removal
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, 0, .1}
	},
	on_use = core.item_eat(1),
	groups = {mushroom = 1, food_mushroom = 1, snappy=3, attached_node=1, flammable=1},
	sounds = default.node_sound_fruits_defaults(),
	dropped_step = function(self, pos, dtime)

		self.ctimer = (self.ctimer or 0) + dtime
		if self.ctimer < 5. then return end
		self.ctimer = 0

if core.get_modpath("mtools") then
		if self.node_inside and self.node_inside.name ~= "ecology:moonflower_open" then
			return
		end

if self.itemstring == "ecology:bluemush" then
	self.object:remove()
	core.swap_node(pos, {name = "ecology:moonflower_closed"})
	core.get_node_timer(pos):start(math.random(35, 50))
core.add_particle({
	pos = pos,
	velocity = {x=0, y=0, z=0},
	acceleration = {x=math.random(-.5,.5), y=4, z=math.random(-.5,.5)},
	expirationtime = math.random(.6,1),
	size = math.random(8,10),
	texture = "mtools_powder2.png^[colorize:white:200",
	glow = 9
})

	core.add_item(pos, "mtools:white_wand")

		return false
end
end
	end
})

core.register_node("ecology:caveflower", {
	description = "Cave Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_cavefung.png"},
	inventory_image = "moreplants_cavefung.png",
	wield_image = "moreplants_cavefung.png",
	paramtype = "light",
	light_source = 5,
	is_ground_content = false,-- anti cave removal
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {mushroom = 1, snappy=3, flammable=1, attached_node=1, flower=1, color_magenta=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:crescentflower", {
	description = "Crescent Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_crescentflower.png"},
	inventory_image = "moreplants_crescentflower.png",
	wield_image = "moreplants_crescentflower.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1, flower=1, color_white=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:fireflower", {
	description = "Fire Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_fireflower.png"},
	inventory_image = "moreplants_fireflower.png",
	wield_image = "moreplants_fireflower.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1859, 3719))
	end,
	on_timer = ecology.desert_flora_spread,
	groups = {snappy=3, flammable=1, attached_node=1, desert_flora=1, flower=1, color_yellow=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:deadweed", {
	description = "Dead Weed",
	drawtype = "plantlike",
	tiles = {"moreplants_deadweed.png"},
	inventory_image = "moreplants_deadweed.png",
	wield_image = "moreplants_deadweed.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:taigabush", {
	description = "Taiga Bush",
	drawtype = "plantlike",
	tiles = {"moreplants_tundrabush.png"},
	inventory_image = "moreplants_tundrabush.png",
	wield_image = "moreplants_tundrabush.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:glowfung", {
	description = "Glow Fungus",
	drawtype = "plantlike",
	tiles = {"moreplants_glowfung.png"},
	inventory_image = "moreplants_glowfung.png",
	wield_image = "moreplants_glowfung.png",
	paramtype = "light",
	light_source = 14,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, -.1, .2}
	},
	groups = {mushroom = 1, snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("ecology:jungleflower", {
	description = "Jungle Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_jungleflower1.png"},
	inventory_image = "moreplants_jungleflower1.png",
	wield_image = "moreplants_jungleflower1.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .1, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1, flower=1, color_red=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:mushroom", {
	description = "Pink Mushroom",
	drawtype = "nodebox",
	tiles = {"moreplants_mushroom_top.png", "moreplants_mushroom_top.png", "moreplants_mushroom_side.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source= 2,
	buildable_to = true,
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-.0625, -.5, -.0625, .0625, -.3125, .0625},
			{-.1875, -.3125, -.1875, .1875, -.1875, .1875},
			{-.125, -.1875, -.125, .125, -.125, .125}
		}
	},
	groups = {mushroom = 1, snappy=3, flammable=1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:curly", {
	description = "Curly Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_curly.png"},
	inventory_image = "moreplants_curly.png",
	wield_image = "moreplants_curly.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "ecology:curlyfruit",
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("ecology:clover", {
	description = "Clover",
	drawtype = "firelike",
	tiles = {"moreplants_clover.png"},
	inventory_image = "moreplants_clover.png",
	wield_image = "moreplants_clover.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.1, .5}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:mushcluster", {
	description = "Small Mushroom Cluster",
	drawtype = "firelike",
	tiles = {"moreplants_mushcluster.png"},
	inventory_image = "moreplants_mushcluster.png",
	wield_image = "moreplants_mushcluster.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.1, .5}
	},
	groups = {mushroom = 1, snappy=3, flammable=1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:groundfung", {
	description = "Ground Fungus",
	drawtype = "firelike",
	tiles = {"moreplants_groundfung.png"},
	inventory_image = "moreplants_groundfung.png",
	wield_image = "moreplants_groundfung.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.3, .5}
	},
	groups = {mushroom = 1, snappy=3, flammable=1, attached_node=1},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("ecology:cavefern", {
	description = "Cave Fern",
	drawtype = "plantlike",
	tiles = {"moreplants_cavefern.png"},
	inventory_image = "moreplants_cavefern.png",
	wield_image = "moreplants_cavefern.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, .1, -.3, .3, .5, .3}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_timer = function(pos)
		local node_above = core.get_node_or_nil({x = pos.x, y = pos.y +1, z = pos.z})
		if not node_above or core.find_node_near(pos, 1, "ignore") then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(300)
			return
		end

		if core.get_item_group(node_above.name, "stone") == 0 then
			core.get_node_timer(pos):stop()
			return
		end

		local light = core.get_node_light(pos)
		if not light or light < 5 then
			core.get_node_timer(pos):start(300)
			return
		end

		local pos0 = vector.subtract(pos, 2)
		local pos1 = vector.add(pos, 2)
		if #core.find_nodes_in_area(pos0, pos1, "ecology:cavefern") > 3 then
			core.get_node_timer(pos):start(300)
			return
		end

	local stones = core.find_nodes_in_area(pos0, pos1, "group:stone")
	local num_stones = #stones
	if num_stones >= 1 then
		for si = 1, math.min(3, num_stones) do
			local spot = stones[math.random(num_stones)]
			local stone_under = {x = spot.x, y = spot.y -1, z = spot.z}
			local under_name = core.get_node(stone_under).name
			light = core.get_node_light(stone_under)
			if light and light >= 5 and under_name == "air" then
				core.set_node(stone_under, {name = "ecology:cavefern"})
			end
		end
	end
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_place = function(item, user, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and user and
				not user:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, user, item, pointd)
			end
		end

		local pos = pointd.under
		if pointd.above.y ~= pos.y-1 then
			return item
		end

		local pos_under = {x = pos.x, y = pos.y -1, z = pos.z}
		local node = core.get_node(pos).name
		if core.get_item_group(node, "stone") > 0 then
		local pname = user:get_player_name()
	if not core.is_protected(pos, pname) and not core.is_protected(pos_under, pname) then
		core.set_node(pointd.above, {name = "ecology:cavefern"})
		if not core.is_creative_enabled(pname) then
			item:take_item()
		end
	else
		core.chat_send_player(pname, "Node is protected")
		core.record_protection_violation(pos, pname)
	end
		end
		return item
	end,
	groups = {snappy=3, flammable=1, attached_node=4},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("ecology:pinkflower", {
	description = "Pink Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_pinkflower.png"},
	inventory_image = "moreplants_pinkflower.png",
	wield_image = "moreplants_pinkflower.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, -.1, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1, flower=1},
	sounds = default.node_sound_leaves_defaults(),
})

function ecology.register_shrub(name, desc, numb)
core.register_node("ecology:"..name, {
	description = desc,
	drawtype = "mesh",
	mesh = "shrub.obj",
	tiles = {"ecology_shrub"..numb..".png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "degrotate",
	visual_scale = .5,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	on_construct = function(pos)
		local node = core.get_node(pos)
		node.param2 = math.random(0,179)
		core.swap_node(pos, node)
	end,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .3, .3}
	},
	groups = {snappy = 3, attached_node = 1, flora = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults()
})
end

ecology.register_shrub("shrub", "Hog Peanut", "1")
ecology.register_shrub("shrub2", "Deciduous Forest Shrub", "2")

core.register_node("ecology:creeper", {
	description = "Creeper",
	drawtype = "plantlike",
	tiles = {"mapgen_creeper.png"},
	inventory_image = "mapgen_creeper.png",
	wield_image = "mapgen_creeper.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.1, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:moss", {
	description = "Moss",
	drawtype = "nodebox",
	tiles = {"mapgen_moss.png"},
	inventory_image = "mapgen_moss.png",
	wield_image = "mapgen_moss.png",
	use_texture_alpha = "opaque",
	paramtype = "light",
	paramtype2 = "wallmounted",
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	sunlight_propagates = true,
	buildable_to = true,
	groups = {snappy = 3, dig_immediate=2, attached_node=1},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("ecology:peat_moss", {
	description = "Peat Moss",
	tiles = {"sumpf_peat.png"},
	groups = {snappy= 3, crumbly=3, disable_jump= 1, fall_damage_add_percent= -100},
	sounds = default.node_sound_leaves_defaults({
		dig = {name = "default_dig_crumbly", gain = .2},
		footstep = {name = "default_grass_footstep", gain= .13}})
})

core.register_node("ecology:long_grass", {
	description = "Long Grass",
	drawtype = "plantlike",
	tiles = {"ecology_longgrass.png"},
	inventory_image = "ecology_longgrass.png",
	wield_image = "ecology_longgrass.png",
	paramtype = "light",
	visual_scale = 1.4,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.1, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:long_grass_dark", {
	description = "Dark Long Grass",
	drawtype = "plantlike",
	tiles = {"ecology_dark_longgrass.png"},
	inventory_image = "ecology_dark_longgrass.png",
	wield_image = "ecology_dark_longgrass.png",
	paramtype = "light",
	visual_scale = 1.4,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.1, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:grass", {
	description = "Thick Grass",
	drawtype = "plantlike",
	tiles = {"ecology_grass.png"},
	inventory_image = "ecology_grass.png",
	wield_image = "ecology_grass.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.1, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:tall_grass", {
	description = "Tall Grass",
	drawtype = "plantlike",
	tiles = {"ecology_grass_long.png"},
	inventory_image = "ecology_grass_long.png",
	wield_image = "ecology_grass_long.png",
	paramtype = "light",
	visual_scale = 2,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.1, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:giantgrass", {
	description = "Giant Grass",
	drawtype = "plantlike",
	tiles = {"mapgen_giantgrass.png"},
	inventory_image = "mapgen_giantgrass.png",
	wield_image = "mapgen_giantgrass.png",
	paramtype = "light",
	visual_scale = 3,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.1, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:docgrass", {
	description = "Doc grass",
	drawtype = "plantlike",
	tiles = {"farming_docgrass.png"},
	inventory_image = "farming_docgrass.png",
	wield_image = "farming_docgrass.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:bamboo_small", {
	description = "Small Bamboo",
	drawtype = "plantlike",
	tiles = {"mapgen_bamboo_small.png"},
	inventory_image = "mapgen_bamboo_small.png",
	wield_image = "mapgen_bamboo_small.png",
	paramtype = "light",
	sunlight_propagates = true,
	collision_box = {
		type = "fixed",
		fixed = {-.01, -.5, -.01, .01, 0, .01}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .5, .3}
	},
	groups = {snappy=1, flammable=1, attached_node=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_leaves_defaults(),

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		default.dig_up(pos, oldnode, digger)
	end,
})

core.register_node("ecology:bamboo_small_top", {
	description = "Small Bamboo Top",
	drawtype = "plantlike",
	tiles = {"mapgen_bamboo_small_top.png"},
	inventory_image = "mapgen_bamboo_small_top.png",
	wield_image = "mapgen_bamboo_small_top.png",
	paramtype = "light",
	visual_scale = 2,
	sunlight_propagates = true,
	collision_box = {
		type = "fixed",
		fixed = {-.01, -.5, -.01, .01, 0, .01}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .5, .3}
	},
	groups = {snappy=1, flammable=1, leaves=1, attached_node=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_leaves_defaults(),

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		default.dig_up(pos, oldnode, digger)
	end,
})

core.register_node("ecology:bamboo_small_sprouts", {
	description = "Small Bamboo Sprouts",
	drawtype = "plantlike",
	tiles = {"mapgen_bamboo_small_sprouts.png"},
	inventory_image = "mapgen_bamboo_small_sprouts.png",
	wield_image = "mapgen_bamboo_small_sprouts.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.2, .3}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(240, 300))
	end,
	on_timer = function(pos, elapsed)
		if not default.can_grow(pos) then
			core.get_node_timer(pos):start(200)
		else
			add_tree(pos, 0, 1, 0, bamboo_small, "0")
		end
	end,
	grown_height = 3,
	groups = {snappy=2, dig_immediate=3, flammable=2, attached_node=1, bamboo_sprout=1, sapling2=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:bamboo_grass", {
	description = "Bamboo Grass",
	drawtype = "plantlike",
	tiles = {"mapgen_bamboo_grass.png"},
	inventory_image = "mapgen_bamboo_grass.png",
	wield_image = "mapgen_bamboo_grass.png",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, -.2, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:deciduous_grass", {
	description = "Deciduous Grass",
	drawtype = "plantlike",
	tiles = {"mapgen_deci_grass.png"},
	inventory_image = "mapgen_deci_grass.png",
	wield_image = "mapgen_deci_grass.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.1, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1, leaves=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:snow_grass_1", {
	description = "Snow Grass",
	drawtype = "mesh",
	mesh = "grass.obj",
	waving = 1,
	tiles = {"ecology_snow_grass_1.png"},
	inventory_image = "ecology_snow_grass_3.png",
	wield_image = "ecology_snow_grass_3.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	on_rotate = screwdriver.rotate_simple,
	groups = {snappy = 3, flammable = 1, flora = 1, attached_node = 1, grass = 1, snow_grass = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.grass_sbox,

	on_place = function(itemstack, placer, pointd)
		-- place a random snow grass node
		local stack = ItemStack("ecology:snow_grass_" .. math.random(1, 5))
		local ret = core.item_place(stack, placer, pointd, math.random(0,3))
		return ItemStack("ecology:snow_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	core.register_node("ecology:snow_grass_" .. i, {
		description = "Snow Grass",
		drawtype = "mesh",
		mesh = "grass.obj",
		waving = 1,
		tiles = {"ecology_snow_grass_" .. i .. ".png"},
		inventory_image = "ecology_snow_grass_" .. i .. ".png",
		wield_image = "ecology_snow_grass_" .. i .. ".png",
		use_texture_alpha = "clip",
		paramtype = "light",
		paramtype2 = "facedir",
		light_source = 1,
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		on_rotate = screwdriver.rotate_simple,
		groups = {snappy = 3, flammable = 1, flora = 1, attached_node = 1,
			grass = 1, snow_grass = 1, not_in_creative_inventory = 1},
		drop = "ecology:snow_grass_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = default.grass_sbox,
	})
end

core.register_node("ecology:frozen_rose", {
	description = "Frozen Rose",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"ecology_frozen_rose.png"},
	inventory_image = "ecology_frozen_rose.png",
	wield_image = "ecology_frozen_rose.png",
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, 0, .1}
	},
	melts_to = "flowers:rose",-- TODO
	groups = {snappy=3, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	type = "cooking",
	output = "flowers:rose",
	recipe = "ecology:frozen_rose",
})

core.register_node("ecology:wild_oat", {
	description = "Wild Oat",
	drawtype = "plantlike",
	tiles = {"mapgen_wild_oat.png"},
	inventory_image = "mapgen_wild_oat.png",
	wield_image = "mapgen_wild_oat.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.1, .3}
	},
	drop = {
		items = {
			{items = {"farming:seed_oat 3", "farming:spent_biomasse"}},
			{items = {"farming:seed_oat 2"}, rarity = 3},
		}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:wild_oat_dry", {
	description = "Dry Wild Oat",
	drawtype = "plantlike",
	tiles = {"mapgen_wild_oat_dry.png"},
	inventory_image = "mapgen_wild_oat_dry.png",
	wield_image = "mapgen_wild_oat_dry.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.1, .3}
	},
	drop = {
		items = {
			{items = {"farming:seed_oat 3", "farming:spent_biomasse"}},
			{items = {"farming:seed_oat 2"}, rarity = 3},
		}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:dead_grass_1", {
	description = "Dead Grass",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"mapgen_dead_grass_1.png"},
	inventory_image = "mapgen_dead_grass_3.png",
	wield_image = "mapgen_dead_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, attached_node = 1, grass = 1, dead_grass = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,

	on_place = function(itemstack, placer, pointd)
		-- place a random grass node
		local stack = ItemStack("ecology:dead_grass_" .. math.random(1,5))
		local ret = core.item_place(stack, placer, pointd)
		return ItemStack("ecology:dead_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	core.register_node("ecology:dead_grass_" .. i, {
		description = "Dead Grass",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"mapgen_dead_grass_" .. i .. ".png"},
		inventory_image = "mapgen_dead_grass_" .. i .. ".png",
		wield_image = "mapgen_dead_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, attached_node = 1, grass = 1,
			dead_grass = 1, flammable = 1, not_in_creative_inventory = 1},
		drop = "ecology:dead_grass_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = default.plant_sbox,
	})
end

core.register_node("ecology:big_mushroom_stem", {
	description = "Big Mushroom Stem",
	tiles = {"mapgen_big_mushroom_stem_top.png", "mapgen_big_mushroom_stem_top.png", "mapgen_big_mushroom_stem.png"},
	paramtype2 = "facedir",
	groups = {choppy = 1, flammable = 1, oddly_breakable_by_hand=1, wood=1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("ecology:big_mushroom_red", {
	description = "Big Red Mushroom",
	tiles = {"mapgen_big_mushroom_red.png", "mapgen_big_mushroom_bottom.png", "mapgen_big_mushroom_red.png"},
	groups = {choppy = 1, flammable = 1, oddly_breakable_by_hand=1, wood=1},
	sounds = default.node_sound_wood_defaults()
})

core.register_node("ecology:big_mushroom_brown", {
	description = "Big Brown Mushroom",
	tiles = {"mapgen_big_mushroom_brown.png", "mapgen_big_mushroom_bottom.png", "mapgen_big_mushroom_brown.png"},
	groups = {choppy = 1, flammable = 1, oddly_breakable_by_hand=1, wood=1},
	sounds = default.node_sound_wood_defaults()
})

core.register_node("ecology:red_mush_cap", {
	description = "Red Mushroom Cap",
	tiles = {"doomshrooms_cap_top.png"},
	groups = {choppy=1, oddly_breakable_by_hand=1},
})

core.register_node("ecology:red_mush",{
	description = "Red Mushroom",
	drawtype = "plantlike",
	tiles = {"red_mush.png"},
	inventory_image = "red_mush.png",
	wield_image = "red_mush.png",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	buildable_to = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .3, .2}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(240, 300))
	end,
	on_timer = function(pos, elapsed)
		if on_compost(pos) and enough_height(pos, 4) then
			add_tree(pos, 2, 1, 2, giant_red_mush, "0")
		else
			core.get_node_timer(pos):start(200)
		end
	end,
	groups = {mushroom = 1, oddly_breakable_by_hand=3, attached_node = 1, flammable = 1},
})

core.register_node("ecology:aqua_mush",{
	description = "Aqua Mushroom",
	drawtype = "plantlike",
	tiles = {"aqua_mush.png"},
	inventory_image = "aqua_mush.png",
	wield_image = "aqua_mush.png",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	buildable_to = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {mushroom = 1, oddly_breakable_by_hand=3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_defaults(),
})

core.register_node("ecology:orange_mushes",{
	description = "Orange Mushroom Cluster",
	drawtype = "plantlike",
	tiles = {"orange_mushes.png"},
	inventory_image = "orange_mushes.png",
	wield_image = "orange_mushes.png",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	buildable_to = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .1, .2}
	},
	groups = {mushroom = 1, oddly_breakable_by_hand=3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:stone_with_worms", {
	description = "Glow Worms in Stone",
	tiles = {"default_stone.png^[colorize:black:7^worms.png", "default_stone.png^[colorize:black:144^worms.png",
		"default_stone.png^[colorize:black:85^worms.png", "default_stone.png^[colorize:black:85^worms.png",
		"default_stone.png^[colorize:black:50^worms.png"},
	paramtype = "light",
	light_source = 4,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("ecology:glow_shrooms", {
	description = "Glow Shrooms",
	drawtype = "plantlike",
	tiles = {"glow_shrooms.png"},
	inventory_image = "glow_shrooms.png",
	wield_image = "glow_shrooms.png",
	paramtype = "light",
	light_source = 3,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.2, .3},
	},
	groups = {mushroom = 1, snappy=3, flammable=2, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:glowing_mushroom_white", {
	description = "White Glowing Mushroom",
	drawtype = "plantlike",
	tiles = {"mapgen_glowing_mushroom_white.png"},
	inventory_image = "mapgen_glowing_mushroom_white.png",
	wield_image = "mapgen_glowing_mushroom_white.png",
	paramtype = "light",
	light_source = 9,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.1, .3}
	},
	groups = {mushroom = 1, snappy=3, flammable=1, attached_node=1},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("ecology:chillshroom", {
	description = "Chillshroom",
	drawtype = "plantlike",
	tiles = {"ecology_chillshroom.png"},
	inventory_image = "ecology_chillshroom.png",
	wield_image = "ecology_chillshroom.png",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	drop = "ecology:chillshroom 3",
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, -.1, .1}
	},
	on_use = core.item_eat(1),
	groups = {mushroom = 1, food_mushroom = 1, fleshy=1, oddly_breakable_by_hand=1, dig_immediate=3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults()
})

core.register_node("ecology:chillshroom_2", {
	description = "Chillshroom (ceiling)",
	drawtype = "plantlike",
	tiles = {"ecology_chillshroom.png^[transformFY"},
	inventory_image = "ecology_chillshroom.png^[transformFY.png",
	wield_image = "ecology_chillshroom.png^[transformFY.png",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	drop = "ecology:chillshroom 3",
	selection_box = {
		type = "fixed",
		fixed = {-.1, .1, -.1, .1, .5, .1}
	},
	on_use = core.item_eat(1),
	groups = {mushroom = 1, food_mushroom = 1, fleshy=1, oddly_breakable_by_hand=1, dig_immediate=3, attached_node=4},
	sounds = default.node_sound_leaves_defaults()
})

core.register_node("ecology:sunshroom", {
	description = "Sunshroom",
	drawtype = "plantlike",
	tiles = {"ecology_sunshroom.png"},
	inventory_image = "ecology_sunshroom.png",
	wield_image = "ecology_sunshroom.png",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	drop = "ecology:sunshroom 3",
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, -.1, .1}
	},
	on_use = core.item_eat(1),
	groups = {mushroom = 1, food_mushroom = 1, fleshy=1, oddly_breakable_by_hand=1, dig_immediate=3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults()
})

core.register_node("ecology:zapshroom", {
	description = "Zapshroom",
	drawtype = "plantlike",
	tiles = {"ecology_zapshroom.png"},
	inventory_image = "ecology_zapshroom.png",
	wield_image = "ecology_zapshroom.png",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	drop = "ecology:zapshroom 3",
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, -.1, .1}
	},
	on_use = core.item_eat(1),
	groups = {mushroom = 1, food_mushroom = 1, fleshy=1, oddly_breakable_by_hand=1, dig_immediate=3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults()
})

core.register_node("ecology:rushroom", {
	description = "Rushroom",
	drawtype = "plantlike",
	tiles = {"ecology_rushroom.png"},
	inventory_image = "ecology_rushroom.png",
	wield_image = "ecology_rushroom.png",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	drop = "ecology:rushroom 3",
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, -.1, .1}
	},
	on_use = core.item_eat(1),
	groups = {mushroom = 1, food_mushroom = 1, fleshy=1, oddly_breakable_by_hand=1, dig_immediate=3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults()
})

core.register_node("ecology:berry_bush", {
	description = "Wildberry Bush",
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	waving = 1,
	tiles = {"ecology_wildberry_bush.png"},
	inventory_image = "ecology_wildberry_bush.png",
	wield_image = "ecology_wildberry_bush.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, 0, .1}
	},
	on_rightclick = function(pos)
		core.add_item(pos, "ecology:wildberry 3")
		core.remove_node(pos)
	end,
	groups = {snappy = 3, attached_node = 1, flora = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craftitem("ecology:wildberry", {
	description = "Wild Berry",
	inventory_image = "ecology_wildberry.png",
	on_use = core.item_eat(1),
	groups = {flammable = 1}
})

core.register_node("ecology:bigmush", {
	description = "Big Mushroom",
	drawtype = "plantlike",
	tiles = {"ecology_bigmush.png"},
	inventory_image = "ecology_bigmush.png",
	wield_image = "ecology_bigmush.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	on_use = core.item_eat(-2),
	groups = {mushroom = 1, toxic_mushroom = 1, snappy=1, oddly_breakable_by_hand = 1, attached_node = 1, flammable=1}
})

core.register_node("ecology:mushroom_red", {
	description = "Red Mushroom",
	drawtype = "nodebox",
	tiles = {"ecology_mushroom_red.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -.5, -1/16, 1/16, -6/16, 1/16},
			{-3/16, -6/16, -3/16, 3/16, -3/16, 3/16},
			{-.25, -5/16, -.25, .25, -.25, .25},
			{-2/16, -3/16, -2/16, 2/16, -2/16, 2/16}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, -.1, .2}
	},
	on_use = core.item_eat(-5),
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(240, 300))
	end,
	on_timer = function(pos, elapsed)
		if on_compost(pos) and enough_height(pos, 2) then
			add_tree(pos, 1, 1, 1, big_red_mush, "0")
		else
			core.get_node_timer(pos):start(200)
		end
	end,
	groups = {mushroom = 1, toxic_mushroom = 1, snappy = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults()
})

core.register_node("ecology:mushroom_shiitake", { -- Lentinula Edodes
	description = "Shiitake Mushroom",
	drawtype = "nodebox",
	tiles = {"ecology_mushroom_shiitake.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -.5, -1/16, 1/16, -2/16, 1/16},
			{-3/16, -5/16, -3/16, 3/16, -3/16, 3/16},
			{-.25, -5/16, -.25, .25, -.25, .25}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, -.1, .25}
	},
	on_use = core.item_eat(2),
	groups = {mushroom = 1, food_mushroom = 1, snappy = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:bush_leaves", {
	description = "Shrub Leaves",
	drawtype = "allfaces",
	tiles = {"ecology_bushleaves.png"},
	paramtype = "light",
	groups = {snappy=2, oddly_breakable_by_hand=3, flora=1, leaves=1},
	sounds = default.node_sound_leaves_defaults({
		dig = {name = "default_dig_snappy", gain = .5},
	}),
})

core.register_node("ecology:swamp_grass", {
	description = "Swamp Grass",
	drawtype = "plantlike",
	tiles = {"ecology_swampgrass.png"},
	inventory_image = "ecology_swampgrass.png",
	wield_image = "ecology_swampgrass.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	drop = "",
	groups = {snappy=2, oddly_breakable_by_hand=3, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults({
		dig = {name = "default_dig_snappy", gain = .5},
	}),
	on_destruct = function(pos, oldnode)
		local num = math.random(3,7)
	if core.get_modpath("mapgen") then
		if num == 5 then
	core.add_item(pos, "mapgen:green_rupee")
		end
	end
	if core.get_modpath("mtools") then
		if num == 4 then
	core.add_item(pos, "mtools:heart")
		end end
	end
})

core.register_node("ecology:winter_lavender", {
	description = "Winter Lavender",
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	waving = 1,
	tiles = {"terasology_winter_lavender.png"},
	inventory_image = "terasology_winter_lavender.png",
	wield_image = "terasology_winter_lavender.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.1, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1, flower=1, color_cyan=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:prickly_pear", {
	description = "Prickly Pear",
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"prickly_pear.png"},
	inventory_image = "prickly_pear.png",
	wield_image = "prickly_pear.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	damage_per_second = 1,
	sunlight_propagates = true,
	walkable = false,
	selection_box = default.plant_sbox,
	drop = {
		items = {
			{items = {"ecology:prickly_pear_fruit 54"}},
			{items = {"ecology:prickly_pear_fruit 18"}, rarity = 3},
			{items = {"ecology:prickly_pear_fruit 18"}, rarity = 3},
			{items = {"ecology:prickly_pear_fruit 18"}, rarity = 3},
		}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1859, 3719))
	end,
	on_timer = ecology.desert_flora_spread,
	on_punch = function(pos, node, user)
		local wielded = user:get_wielded_item()

		if wielded:get_count() == 0 then
			user:set_hp(user:get_hp() - 1)
		end
	end,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, attached_node = 1, desert_flora=1},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("ecology:prickly_pear_fruit", {
	description = "Prickly Pear Fruit",
	drawtype = "plantlike",
	tiles = {"prickly_pear_fruit.png"},
	inventory_image = "prickly_pear_fruit_inv.png",
	wield_image = "prickly_pear_fruit_inv.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, -.3, .1}
	},
	on_use = core.item_eat(2),
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1859, 3719))
	end,
	on_timer = function(pos, elapsed)
		local heat_min = -5
		local heat_max = 400
		local humi_min = -5
		local humi_max = 400
		-- check altitude for heat and humidity
		if default.h_h_h(pos, -31000, -10) then
			if default.h_h_h(pos, -10, 110, heat_min, heat_max, humi_min, humi_max) then
		core.remove_node(pos)
		return
			end
		end

		local node_under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		if not node_under then
			-- Node under not yet loaded, try later
			core.get_node_timer(pos):start(300)
			return
		end

		-- Stop growing if not on sand.
		if core.get_item_group(node_under.name, "sand") == 0 then
			core.get_node_timer(pos):stop()
			return
		end

		local light_level = 12
		local meta = core.get_meta(pos)
		if meta:get_int("light_level") > 0 then
			light_level = light_level - (meta:get_int("light_level") * 3)
			meta:set_int("light_level", 0)
		end
		local light = core.get_node_light(pos)
		if not light or light < light_level then
			core.get_node_timer(pos):start(300)
			return
		end
		core.set_node(pos, {name = "ecology:prickly_pear"})
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	groups = {snappy = 3, fleshy = 1, attached_node = 1},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("ecology:dark_cactus", {
	description = "Dark Cactus",
	drawtype = "nodebox",
	tiles = {"dark_cactus_top.png", "dark_cactus_top.png", "dark_cactus_side.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	damage_per_second = 1,
	node_box = {
		type = "fixed",
		fixed = {
			{-.375, -.5, -.5, -.375, .5, .5},
			{.375, -.5, -.5, .375, .5, .5},
			{-.5, -.5, .375, .5, .5, .375},
			{-.5, -.5, -.375, .5, .5, -.375},
			{-.375, -.5, -.375, .375, .5, .375}
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {-3/16, -.5, -3/16, 3/16, .39, 3/16}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.375, -.5, -.375, .375, .5, .375}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1859, 3719))
	end,
	on_timer = function(pos, elapsed)
		local node_under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		if not node_under then
			-- Node under not yet loaded, try later
			core.get_node_timer(pos):start(300)
			return
		end

		-- Don't grow if not on sand.
		if core.get_item_group(node_under.name, "sand") == 0 then
			core.get_node_timer(pos):start(300)
			return
		end

		local spos = {x = pos.x, y = pos.y, z = pos.z}
		local node = core.get_node(spos)
		local height = 0
		while node.name == "ecology:dark_cactus" and height < 3 do
			height = height + 1
			spos.y = spos.y + 1
			node = core.get_node(spos)
		end
		if height == 3 or node.name ~= "air" then
			core.get_node_timer(pos):start(300)
			return
		end
		local light_level = 13
		local meta = core.get_meta(spos)
		if meta:get_int("light_level") > 0 then
			light_level = light_level - (meta:get_int("light_level") * 3)
			meta:set_int("light_level", 0)
		end
		local light = core.get_node_light(spos)
		if not light or light < light_level then
			core.get_node_timer(pos):start(300)
			return
		end
		core.set_node(spos, {name = "ecology:dark_cactus"})
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_punch = function(pos, node, user)
		local wielded = user:get_wielded_item()

		if wielded:get_count() == 0 then
			user:set_hp(user:get_hp() - 1)
		end
	end,
	groups = {snappy = 1, choppy = 3, large_cactus = 1},
	sounds = default.node_sound_wood_defaults(),
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		default.dig_up(pos, oldnode, digger)
	end,
})

core.register_craft({
	type = "fuel",
	recipe = "ecology:dark_cactus",
	burntime = 9,
})

core.register_craft({
	type = "fuel",
	recipe = "ecology:prickly_pear",
	burntime = 7,
})

core.register_craft({
	type = "fuel",
	recipe = "ecology:prickly_pear_fruit",
	burntime = 3,
})

core.register_craftitem("ecology:pale_green_berries", {
	description = "Pale Green Berries",
	inventory_image = "ecology_pale_green_berries.png",
	groups = {flammable = 1},
	on_use = core.item_eat(-1),

	on_place = function(itemstack, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local udef = core.registered_nodes[node.name]
		if udef and udef.on_rightclick and not (placer and placer:is_player() and
				placer:get_player_control().sneak) then
			return udef.on_rightclick(under, node, placer, itemstack,
				pointd) or itemstack
		end

		return farming.place_seed(itemstack, placer, pointd, "ecology:palgre_S1")
	end
})

local def = {
	drawtype = "plantlike",
	tiles = {"terasology_palgre_1.png"},
	waving = 1,
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	drop = "farming:spent_biomasse",
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, -.1, .2}
	},
	groups = {snappy= 3, flammable= 1, attached_node= 1, plant= 1, not_in_creative_inventory= 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "ecology:palgre_S2",
	on_timer = farming.grow_plant,
}

core.register_node("ecology:palgre_S1", table.copy(def))

def.tiles = {"terasology_palgre_2.png"}
def.next_plant = "ecology:palgre_S3"
core.register_node("ecology:palgre_S2", table.copy(def))

def.tiles = {"terasology_palgre_3.png"}
def.next_plant = "ecology:palgre_S4"
core.register_node("ecology:palgre_S3", table.copy(def))

def.tiles = {"terasology_palgre_4.png"}
def.next_plant = "ecology:palgre_S5"
core.register_node("ecology:palgre_S4", table.copy(def))

def.tiles = {"terasology_palgre_5.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"ecology:pale_green_berries 4", "farming:spent_biomasse"}},
		{items = {"ecology:pale_green_berries 3"}, rarity = 2},
		{items = {"ecology:pale_green_berries 2"}, rarity = 3},
	}
}
core.register_node("ecology:palgre_S5", table.copy(def))

core.register_node("ecology:iris_blue", {
	description = "Blue Iris",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"ecology_iris_blue.png"},
	inventory_image = "ecology_iris_blue.png",
	wield_image = "ecology_iris_blue.png",
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-2/16, -.5, -2/16, 2/16, 5/16, 2/16}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(.3, .5))
	end,
	on_timer = default.attack_heal,
	groups = {snappy=3, flammable=1, attached_node=1, flora=1, flower=1, color_blue=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:iris_lightblue", {
	description = "Light Blue Iris",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"ecology_iris_lightblue.png"},
	inventory_image = "ecology_iris_lightblue.png",
	wield_image = "ecology_iris_lightblue.png",
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-2/16, -.5, -2/16, 2/16, 5/16, 2/16}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(.3, .5))
	end,
	on_timer = default.attack_heal,
	groups = {snappy=3, flammable=1, attached_node=1, flora=1, flower=1, color_light_blue=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:dahlia_red", {
	description = "Red Dahlia",
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	waving = 1,
	tiles = {"ecology_dahlia_red.png"},
	inventory_image = "ecology_dahlia_red.png",
	wield_image = "ecology_dahlia_red.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -.5, -5/16, 5/16, -1/16, 5/16}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1, flower=1, color_red=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:fern_dark", {
	description = "Dark Fern",
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	waving = 1,
	tiles = {"ecology_dark_fern.png"},
	inventory_image = "ecology_dark_fern.png",
	wield_image = "ecology_dark_fern.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

local def = {
	description = "Golden Grass Seed",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"ecology_golden_grass_1.png"},
	inventory_image = "ecology_golden_grass_seed.png",
	wield_image = "ecology_golden_grass_seed.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy=3, attached_node=1, flammable=2, seed=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
	on_place = function(itemstack, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local udef = core.registered_nodes[node.name]
		if udef and udef.on_rightclick and not (placer and placer:is_player() and
				placer:get_player_control().sneak) then
			return udef.on_rightclick(under, node, placer, itemstack,
				pointd) or itemstack
		end

		return farming.place_seed(itemstack, placer, pointd, "ecology:golden_grass_seed")
	end,
	next_plant = "ecology:golden_grass_S2",
	on_timer = farming.grow_plant,
}

core.register_node("ecology:golden_grass_seed", table.copy(def))

def.description = nil
def.tiles = {"ecology_golden_grass_2.png"}
def.groups = {snappy= 3, flammable= 4, plant= 1, attached_node= 1, not_in_creative_inventory= 1}
def.next_plant = "ecology:golden_grass_S3"
def.node_placement_prediction = ""
def.on_place = function(item, placer, pointd)
	local under = pointd.under
	local node = core.get_node(under)
	local udef = core.registered_nodes[node.name]
	if udef and udef.on_rightclick and not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
		return udef.on_rightclick(under, node, placer, item, pointd) or item
	end
	return item end
core.register_node("ecology:golden_grass_S2", table.copy(def))

def.tiles = {"ecology_golden_grass_3.png"}
def.next_plant = "ecology:golden_grass_S4"
core.register_node("ecology:golden_grass_S3", table.copy(def))

def.tiles = {"ecology_golden_grass_4.png"}
def.next_plant = "ecology:golden_grass_S5"
core.register_node("ecology:golden_grass_S4", table.copy(def))

def.description = "Golden Grass"
def.tiles = {"ecology_golden_grass_5.png"}
def.inventory_image = "ecology_golden_grass.png"
def.wield_image = "ecology_golden_grass.png"
def.groups = {snappy= 3, flammable= 4, plant= 1, attached_node= 1}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"ecology:golden_grass_S5 2"}},
		{items = {"ecology:golden_grass_S5"}, rarity = 3},
		{items = {"ecology:golden_grass_seed 2"}},
		{items = {"ecology:golden_grass_seed 1"}, rarity = 2},
		{items = {"ecology:golden_grass_seed 2"}, rarity = 3},
	}
}
core.register_node("ecology:golden_grass_S5", table.copy(def))

core.register_craft({
	output = "ecology:golden_grass_seed 8",
	recipe = {
		{"default:stick"},
		{"ecology:golden_grass_S5"},
		{"farming:threshing_floor"}
	},
	replacements = {
		{"default:stick", "default:stick"},
		{"ecology:golden_grass_S5", "farming:straw_pile"},
		{"farming:threshing_floor", "farming:threshing_floor"}
	}
})

core.register_node("ecology:fern_light", {
	description = "Light Fern",
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	waving = 1,
	tiles = {"ecology_lightfern.png"},
	inventory_image = "ecology_lightfern.png",
	wield_image = "ecology_lightfern.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:swamp_weed", {
	description = "Swamp Weed",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"ecology_swampweed.png"},
	inventory_image = "ecology_swampweed.png",
	wield_image = "ecology_swampweed.png",
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("ecology:crabgrass", {
	description = "Crab Grass",
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	waving = 1,
	tiles = {"ecology_crabgrass.png"},
	inventory_image = "ecology_crabgrass.png",
	wield_image = "ecology_crabgrass.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.3, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:parasol_shroom", {
	description = "Brown Parasol Shroom",
	drawtype = "plantlike",
	tiles = {"terasology_parasol_shroom.png"},
	inventory_image = "terasology_parasol_shroom.png",
	wield_image = "terasology_parasol_shroom.png",
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(240, 300))
	end,
	on_timer = function(pos, elapsed)
		if on_compost(pos) and enough_height(pos, 6) then
			add_tree(pos, 4, 1, 4, mushroom_large, "random")
		else
			core.get_node_timer(pos):start(200)
		end
	end,
	groups = {mushroom=1, snappy=3, flammable=1, attached_node=1},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("ecology:weed", {
	description = "Weed",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"ecology_weed.png"},
	inventory_image = "ecology_weed.png",
	wield_image = "ecology_weed.png",
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.3, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:fern_thick", {
	description = "Thick Fern",
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	waving = 1,
	tiles = {"ecology_fern.png"},
	inventory_image = "ecology_fern.png",
	wield_image = "ecology_fern.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:shrub_big", {
	description = "Big Dry Shrub",
	drawtype = "plantlike",
	tiles = {"terasology_shrub.png"},
	inventory_image = "terasology_shrub.png",
	wield_image = "terasology_shrub.png",
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {snappy=3, flammable=1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output = "default:stick 3",
	recipe = {{"ecology:shrub_big"}}
})

core.register_node("ecology:sproutling_grass", {
	description = "Sproutling Grass",
	drawtype = "plantlike",
	tiles = {"sproutling_grass.png"},
	inventory_image = "sproutling_grass.png",
	wield_image = "sproutling_grass.png",
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.2, .3}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("ecology:duckweed", {
	description = "Duckweed",
	drawtype = "nodebox",
	tiles = {"mapgen_duckweed.png", "mapgen_duckweed.png^[transformFY"},
	inventory_image = "mapgen_duckweed.png",
	wield_image = "mapgen_duckweed.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	buildable_to = true,
	floodable = true,
	walkable = false,
	liquids_pointable = true,
	node_box = {
		type = "fixed",
		fixed = {-.5, -.45, -.5, .5, -.45, .5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.45, -.5, .5, -.45, .5}
	},
	on_rotate = screwdriver.rotate_simple,
	groups = {snappy=3, o_w_flora = 1, flammable=1},
	sounds = default.node_sound_fruits_defaults(),
	node_placement_prediction = "",
	on_place = function(itemstack, placer, pointd)
		local pos = pointd.above
		local node = core.get_node(pointd.under)
		local def = core.registered_nodes[node.name]

		if def and def.on_rightclick then
	return def.on_rightclick(pointd.under, node, placer, itemstack, pointd)
		end

		if def and def.liquidtype == "source" and
				core.get_item_group(node.name, "water") > 0 then
			local pname = placer and placer:get_player_name() or ""
			if not core.is_protected(pos, pname) then
				core.set_node(pos, {name = "ecology:duckweed", param2 = math.random(0, 3)})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.on_water_spread(pos, 1, 12, "", math.random(166, 286))
	end
})
--[[	Experiments
core.register_node("ecology:test_01", {
	description = "Test Plant 01",
	drawtype = "torchlike",
	tiles = {"fun_caves_algae.png"},
	inventory_image = "fun_caves_algae.png",
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:test_02", {
	description = "Test Plant 02",
	drawtype = "torchlike",
	tiles = {"fun_caves_moss.png"},
	inventory_image = "fun_caves_moss.png",
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	groups = {snappy=3, flammable=1, attached_node=1, flora=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:test_03", {
	description = "Test Plant 03",
	drawtype = "plantlike",
	tiles = {"m_leaf_pile.png"},
	inventory_image = "m_leaf_pile.png",
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	groups = {snappy=3, flammable=1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:test_04", {
	description = "Test Plant 04",
	drawtype = "allfaces",
	tiles = {"m_autumnleaves.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=3, flammable=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:test_06", {
	description = "Test Plant 06",
	drawtype = "allfaces",
	tiles = {"m_fall_leaves_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=3, flammable=1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:test_07", {
	description = "Test Plant 07",
	drawtype = "allfaces",
	tiles = {"m_fall_leaves_2.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=3, flammable=1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:test_08", {
	description = "Test Plant 08",
	drawtype = "allfaces",
	tiles = {"m_fall_leaves_3.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=3, flammable=1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:test_09", {
	description = "Test Plant 09",
	drawtype = "allfaces",
	tiles = {"m_fall_leaves_4.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=3, flammable=1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:fallen_leaf_test", {
	description = "Fallen Leaf Pile",
	drawtype = "nodebox",
	tiles = {"m_leaf_pile_uv.png"},
	paramtype = "light",
	paramtype2 = "leveled",
	node_box = {
		type = "leveled",
		fixed = {-.5,-.5,-.5, .5,0,.5}
	},
	after_place_node = function(pos, placer, itemstack, pointd)
		core.swap_node(pos, {name = "ecology:fallen_leaf_test", param2 = math.random(2,18)})
	end,
	groups = {snappy=3, oddly_breakable_by_hand=3, falling_node=1, flammable=3},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:test_10", {
	description = "Test Plant 10",
	drawtype = "allfaces",
	tiles = {"m_leaves_acacia_blooms.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=3, flammable=1},
	sounds = default.node_sound_leaves_defaults(),
})]]

core.register_craftitem("ecology:curlyfruit", {
	description = "Curly Fruit",
	inventory_image = "moreplants_curlyfruit.png",
	on_use = core.item_eat(1),
	groups = {flammable = 1}
})

core.register_craft({
	output = "dye:orange 4",
	recipe = {{"ecology:curlyfruit"}}
})

core.register_craftitem("ecology:eye", {
	description = "Eyeball",
	inventory_image = "moreplants_eye.png",
	groups = {flammable = 1}
})

core.register_craft({
	output = "default:paper",
	recipe = {{"ecology:yellow_weed", "ecology:yellow_weed", "ecology:yellow_weed"},
		{"group:grinder", "group:water_bucket", "fabric:sheet_white"}
	},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"},
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"},
		{"fabric:sheet_white", "fabric:sheet_white"}
	}
})

core.register_craft({
	output = "ecology:bamboo_small_sprouts 3",
	recipe = {{"ecology:bamboo_small_top"}}
})

core.register_craft({
	type = "shapeless",
	output = "dye:dark_green 4",
	recipe = {"ecology:dark_cactus", "group:grinder"},
	replacements = {
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"}
	}
})

ecology.datas = {
	{
		"fire_flower",
		"Fire Flower",
		{-4/16, -.5, -4/16, 4/16, -1/16, 4/16},
		{flammable = 1}
	},
	{
		"yellow_bell",
		"Yellow Bell",
		{-4/16, -.5, -4/16, 4/16, -1/16, 4/16},
		{color_yellow = 1, flammable = 1}
	},
	{
		"saffron_crocus",
		"Saffron Crocus",
		{-4/16, -.5, -4/16, 4/16, -1/16, 4/16},
		{color_light_blue = 1, flammable = 1}
	},
	{
		"lucky_club",
		"Lucky Club",
		{-2/16, -.5, -2/16, 2/16, 2/16, 2/16},
		{color_green = 1, flammable = 1}
	},
	{
		"laurel",
		"Laurel",
		{-2/16, -.5, -2/16, 2/16, 2/16, 2/16},
		{flammable = 1}
	},
	{
		"star_anise_plant",
		"Star Anise Plant",
		{-2/16, -.5, -2/16, 2/16, 2/16, 2/16},
		{flammable = 1}
	},
	{
		"calla",
		"Calla",
		{-2/16, -.5, -2/16, 2/16, 2/16, 2/16},
		{color_white = 1, flammable = 1}
	},
	{
		"azalea",
		"Azalea",
		{-2/16, -.5, -2/16, 2/16, 2/16, 2/16},
		{color_pink = 1, flammable = 1}
	},
	{
		"orange_rose",
		"Orange Rose",
		{-2/16, -.5, -2/16, 2/16, 3/16, 2/16},
		{color_orange = 1, flammable = 1}
	},
	{
		"gladioris",
		"Gladioris",
		{-2/16, -.5, -2/16, 2/16, 0, 2/16},
		{color_blue = 1, flammable = 1}
	},
}

local function add_simple_flower(name, desc, box, f_groups)
	-- Common flowers' groups
	f_groups.snappy = 3
	f_groups.flower = 1
	f_groups.flora = 1
	f_groups.attached_node = 1

	core.register_node("ecology:" .. name, {
		description = desc,
		drawtype = "plantlike",
		waving = 1,
		tiles = {"brewing_" .. name .. ".png"},
		inventory_image = "brewing_" .. name .. ".png",
		wield_image = "brewing_" .. name .. ".png",
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		sunlight_propagates = true,
		selection_box = {
			type = "fixed",
			fixed = box
		},
		groups = f_groups,
		sounds = default.node_sound_leaves_defaults()
	})
end

for _,item in pairs(ecology.datas) do
	add_simple_flower(unpack(item))
end

core.register_node("ecology:arctic_carrot", {
	description = "Arctic Carrot",
	drawtype = "plantlike",
	tiles = {"ecology_arctic_carrot.png"},
	inventory_image = "ecology_arctic_carrot_inv.png",
	wield_image = "ecology_arctic_carrot_inv.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, -1/16, 4/16}
	},
	on_use = core.item_eat(2, "ecology:arctic_carrot_leaves"),
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1859, 3719))
	end,
	on_timer = function(pos, elapsed)
		local node = core.get_node(pos)
		local heat_min = -5
		local heat_max = 400
		local humi_min = -5
		local humi_max = 400
		-- check altitude for heat and humidity
		if default.h_h_h(pos, -31000, -10) then
			if default.h_h_h(pos, -10, 110, heat_min, heat_max, humi_min, humi_max) then
		core.set_node(pos, {name = "default:dry_shrub"})
		return
			end
		end

		if core.find_node_near(pos, 2, "ignore") then
			-- Node under not yet loaded, try later
			core.get_node_timer(pos):start(300)
			return
		end

		-- Stop growing if not on sand.
		local under = core.get_node({x = pos.x, y = pos.y - 1, z = pos.z})
		if under.name ~= "default:silver_sand" and under.name ~= "default:dirt_with_snow" then
			core.get_node_timer(pos):stop()
			return
		end

		local light_level = 12
		local meta = core.get_meta(pos)
		if meta:get_int("light_level") > 0 then
			light_level = light_level - (meta:get_int("light_level") * 3)
			meta:set_int("light_level", 0)
		end
		local light = core.get_node_light(pos)
		if not light or light < light_level then
			core.get_node_timer(pos):start(300)
			return
		end

		local pos0 = vector.subtract(pos, 4)
		local pos1 = vector.add(pos, 4)
		local num = #core.find_nodes_in_area(pos0, pos1, "ecology:arctic_carrot")
		if num > 3 then
			core.get_node_timer(pos):start(300)
			return
		end

	local sands = core.find_nodes_in_area_under_air(pos0, pos1, {"default:silver_sand", "default:dirt_with_snow"})
	local num_sands = #sands
	if num_sands >= 1 then
		for si = 1, math.min(3, num_sands) do
			local sand = sands[math.random(num_sands)]
			local sand_name = core.get_node(sand).name
			local sand_above = {x = sand.x, y = sand.y + 1, z = sand.z}
			light = core.get_node_light(sand_above)
			if light and light >= light_level and sand_name == under.name then -- Only spread to same surface node
	-- check altitude for heat and humidity
	if default.h_h_h(sand_above, -31000, -10) then
		if default.h_h_h(sand_above, -10, 110, heat_min, heat_max, humi_min, humi_max) then
			node.name = "default:dry_shrub"
		end
	end
	core.set_node(sand_above, {name = node.name})
	core.get_node_timer(sand_above):start(math.random(1859, 3719))
			end
		end
	end
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	groups = {snappy = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craftitem("ecology:arctic_carrot_root", {
	description = "Arctic Carrot Root",
	inventory_image = "ecology_arctic_carrot_root.png",
	on_use = core.item_eat(2),
	groups = {flammable = 1}
})

core.register_craftitem("ecology:arctic_carrot_leaves", {
	description = "Arctic Carrot Leaves",
	inventory_image = "ecology_arctic_carrot_leaves.png",
	groups = {flammable = 2}
})

core.register_craft({
	type = "shapeless",
	output = "ecology:arctic_carrot_root",
	recipe = {"ecology:arctic_carrot"},
	replacements = {{"ecology:arctic_carrot", "ecology:arctic_carrot_leaves"}}
})

core.register_craft({
	output = "dye:white 4",
	recipe = {{"ecology:arctic_carrot_root"}}
})

core.register_craft({
	output = "dye:blue 2",
	recipe = {{"ecology:arctic_carrot_leaves"}}
})

core.register_node("ecology:mandragora", {
	description = "Mandragora",
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"brewing_mandragora.png"},
	inventory_image = "brewing_mandragora_inv.png",
	wield_image = "brewing_mandragora_inv.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, -1/16, 4/16}
	},
	on_use = core.item_eat(1),
	groups = {snappy = 3, attached_node = 1, flammable = 1, flora = 1, color_white = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_entity("ecology:fertilising", {
	initial_properties = {
visual = "sprite",
textures = {"blank.png"},
physical = false,
visual_size = {x= 0, y= 0},
collisionbox = {0,0,0,0,0,0}
	},
	age = 0,
	on_activate = function(self)
	core.add_particlespawner({
		amount = 17,
		time = 0,
		pos = {min = {x=-.5, y=-.5, z=-.5}, max = {x=.5, y=.6, z=.5}},
		minvel = {x=-.03,y=-.03,z=-.03},
		maxvel = {x=.03,y=.03,z=.03},
		attached = self.object,
		exptime = {min = 1, max = 3},
		minsize = .8,
		maxsize = 2,
		texture = "twinkle_green.png",
		animation = {type = "vertical_frames", aspect_w = 7, aspect_h = 7, length = -1},
		glow = 13 })
	end,
	on_step = function(self, dtime)
		self.age = self.age+dtime
		self.cycle = self.cycle or math.random(3, 4)
	if self.cycle < 1 then	self.object:remove()	return end

	if self.cycle > 0 and self.age > 3 then
		self.age = 0
		self.cycle = self.cycle-1
		local pos = self.object:get_pos()
		local poslist = core.find_nodes_in_area({x= pos.x+ 7, y= pos.y+ 7, z= pos.z+ 7}, {x= pos.x- 7, y= pos.y- 7, z= pos.z- 7},
	{"group:plant", "group:seed", "group:flora", "group:water_flora", "group:sapling", "group:sapling2", "ecology:cavefern",
	"default:dirt_with_short_grass", "group:trunk", "default:bush_stem", "default:poison_ivy_1", "default:poison_ivy_2", "group:seaweedy"})
for _,H in pairs(poslist) do
	local meta = core.get_meta(H)
--	local node = core.get_node(H).name
	meta:set_int("light_level", 4)
	meta:set_int("soil_need", 1)
	core.get_node_timer(H):start(math.random(0, 2))
end end
	end,
})

core.register_craftitem("ecology:ferdraling", {
	description = "Ferdraling",
	inventory_image = "ecology_ferdraling.png",
	groups = {flammable = 1},
	on_place = function(item, user, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and user and
				not user:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, user, item, pointd)
			end
		end

		local pos = pointd.above
		local objs = core.get_objects_inside_radius(pos, .5)

		if not objs or #objs >= 2 then return end
		local pname = user:get_player_name()
	if not core.is_protected(pos, pname) then
		core.add_entity(pos, "ecology:fertilising")
		if not core.is_creative_enabled(pname) then
			item:take_item()
		end
	else
		core.chat_send_player(pname, "Node is protected")
		core.record_protection_violation(pos, pname)
	end
		return item
	end
})

core.register_craft({
	output = "ecology:ferdraling 5",
	recipe = {{"ecology:cavefern", "ecology:mandragora", "ecology:sproutling_grass"}}
})

core.register_craftitem("ecology:star_anise", {
	description = "Star Anise",
	inventory_image = "brewing_star_anise.png",
	groups = {flammable = 1}
})

core.register_craft({
	output = "ecology:star_anise 3",
	recipe = {
		{"", "", ""},
		{"", "", ""},
		{"", "ecology:star_anise_plant", ""}
	}
})

core.register_node("ecology:orange_mycena", {
	description = "Orange Mycena",
	drawtype = "plantlike",
	tiles = {"brewing_orange_mycena.png"},
	inventory_image = "brewing_orange_mycena.png",
	wield_image = "brewing_orange_mycena.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, -1/16, 4/16}
	},
	on_use = core.item_eat(3),
	groups = {mushroom = 1, food_mushroom = 1, snappy = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:giant_cortinarius_violaceus_cap", {
	description = "Giant Cortinarius Violaceus Cap",
	tiles = {"giant_cortinarius_violaceus_cap.png"},
	paramtype = "light",
	light_source = 14,
	sunlight_propagates = true,
	groups = {choppy=1, oddly_breakable_by_hand=1, flammable = 1},
})

core.register_node("ecology:cortinarius_violaceus", {
	description = "Cortinarius Violaceus",
	drawtype = "plantlike",
	tiles = {"brewing_cortinarius_violaceus.png"},
	inventory_image = "brewing_cortinarius_violaceus.png",
	wield_image = "brewing_cortinarius_violaceus.png",
	paramtype = "light",
	light_source = 14,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, -1/16, 4/16}
	},
	on_use = core.item_eat(-5),
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(240, 300))
	end,
	on_timer = function(pos, elapsed)
		if on_compost(pos) and enough_height(pos, 5) then
			add_tree(pos, 2, 1, 2, giant_corti, "0")
		else
			core.get_node_timer(pos):start(200)
		end
	end,
	groups = {mushroom = 1, toxic_mushroom = 1, snappy = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:gliophorus_viridis", {
	description = "Gliophorus Viridis",
	tiles = {"brewing_gliophorus_viridis.png"},
	inventory_image = "brewing_gliophorus_viridis.png",
	wield_image = "brewing_gliophorus_viridis.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {mushroom = 1, toxic_mushroom = 1, snappy = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_use = core.item_eat(-3),
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, -1/16, 4/16},
	}
})

core.register_node("ecology:rhodedendron_plant", {
	description = "Rhodedendron",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"rhodedendron_plant.png"},
	paramtype = "light",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_timer = function(pos, elapsed)
		local node_under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		if not node_under then
			-- Node under not yet loaded, try later
			core.get_node_timer(pos):start(300)
			return
		end

		-- Replace with dry shrub on desert sand and silver sand.
		if core.get_item_group(node_under.name, "sand") == 1 and
				node_under.name ~= "default:sand" then
			core.set_node(pos, {name = "default:dry_shrub"})
			return
		end

		if core.get_item_group(node_under.name, "soil") == 0 then
			core.get_node_timer(pos):stop()
			return
		end

		local light_level = 11
		local meta = core.get_meta(pos)
		if meta:get_int("light_level") > 0 then
			light_level = light_level - (meta:get_int("light_level") * 3)
			meta:set_int("light_level", 0)
		end
		local light = core.get_node_light(pos)
		if not light or light < light_level then
			core.get_node_timer(pos):start(300)
			return
		end
	local xm = {x=pos.x-1, y=pos.y, z=pos.z}
	local xp = {x=pos.x+1, y=pos.y, z=pos.z}
	local yp = {x=pos.x, y=pos.y+1, z=pos.z}
	local zm = {x=pos.x, y=pos.y, z=pos.z-1}
	local zp = {x=pos.x, y=pos.y, z=pos.z+1}
	if core.get_node(xm).name == "air" then
		core.set_node(xm, {name = "ecology:rhodedendron_buding"})
		core.get_node_timer(xm):start(math.random(300, 1500)) end
	if core.get_node(xp).name == "air" then
		core.set_node(xp, {name = "ecology:rhodedendron_buding"})
		core.get_node_timer(xp):start(math.random(300, 1500)) end
	if core.get_node(yp).name == "air" then
		core.set_node(yp, {name = "ecology:rhodedendron_buding"})
		core.get_node_timer(yp):start(math.random(300, 1500)) end
	if core.get_node(zm).name == "air" then
		core.set_node(zm, {name = "ecology:rhodedendron_buding"})
		core.get_node_timer(zm):start(math.random(300, 1500)) end
	if core.get_node(zp).name == "air" then
		core.set_node(zp, {name = "ecology:rhodedendron_buding"})
		core.get_node_timer(zp):start(math.random(300, 1500)) end
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:rhodedendron_buding", {
	description = "Rhodedendron Buding",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"rhodedendron_buding.png"},
	paramtype = "light",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_timer = function(pos, elapsed)
		local node_under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		if not node_under then
			-- Node under not yet loaded, try later
			core.get_node_timer(pos):start(300)
			return
		end

		-- Replace with dry shrub on desert sand and silver sand.
		if core.get_item_group(node_under.name, "sand") == 1 and
				node_under.name ~= "default:sand" then
			core.set_node(pos, {name = "default:dry_shrub"})
			return
		end

		if not core.find_node_near(pos, 1, "group:soil") and
				node_under.name ~= "ecology:rhodedendron_plant" then
			core.get_node_timer(pos):stop()
			return
		end

		local light_level = 11
		local meta = core.get_meta(pos)
		if meta:get_int("light_level") > 0 then
			light_level = light_level - (meta:get_int("light_level") * 3)
			meta:set_int("light_level", 0)
		end
		local light = core.get_node_light(pos)
		if not light or light < light_level then
			core.get_node_timer(pos):start(300)
			return
		end
		core.set_node(pos, {name = "ecology:rhodedendron_blooming"})
	end,
	groups = {snappy=3, flammable=2, plant=1, leaves=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ecology:rhodedendron_blooming", {
	description = "Rhodedendron Blooming",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"rhodedendron_blooming.png"},
	paramtype = "light",
	groups = {snappy=3, flammable=2, plant=1, leaves=1, flower=1},
	sounds = default.node_sound_leaves_defaults(),
})

-- blooming rhodedendron gives magenta dye and rhodedendron plant
core.register_craft({
	output = "dye:magenta 4",
	recipe = {{"ecology:rhodedendron_blooming"}},
	replacements = {{"ecology:rhodedendron_blooming", "ecology:rhodedendron_plant"}}
})

-- Sea stuff
core.register_node("ecology:sponge1", {
	description = "Pink Sponge",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"moreplants_sponge1.png"},
	inventory_image = "moreplants_sponge1.png",
	wield_image = "moreplants_sponge1.png",
	paramtype = "light",
	groups = {snappy=3, seaweedy=1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.2, .5, -.2, .2, 1., .2}
		}
	},
	on_place = function(itemstack, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					itemstack, pointd)
			end
		end

		local pos = pointd.under
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "ecology:sponge1"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "ecology:sponge1", math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})

core.register_node("ecology:sponge2", {
	description = "Yellow Sponge",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"moreplants_sponge2.png"},
	inventory_image = "moreplants_sponge2.png",
	wield_image = "moreplants_sponge2.png",
	paramtype = "light",
	groups = {snappy=3, seaweedy=1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.2, .5, -.2, .2, 1., .2}
		}
	},
	on_place = function(itemstack, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					itemstack, pointd)
			end
		end

		local pos = pointd.under
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "ecology:sponge2"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "ecology:sponge2", math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})

core.register_node("ecology:sponge3", {
	description = "Blue Sponge",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"moreplants_sponge3.png"},
	inventory_image = "moreplants_sponge3.png",
	wield_image = "moreplants_sponge3.png",
	paramtype = "light",
	groups = {snappy=3, seaweedy=1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.2, .5, -.2, .2, 1., .2}
		}
	},
	on_place = function(itemstack, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					itemstack, pointd)
			end
		end

		local pos = pointd.under
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "ecology:sponge3"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "ecology:sponge3", math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})

core.register_node("ecology:tall_sponge1", {
	description = "Tall Blue Sponge",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"moreplants_tall_sponge1.png"},
	inventory_image = "moreplants_tall_sponge1.png",
	wield_image = "moreplants_tall_sponge1.png",
	paramtype = "light",
	visual_scale = 1.4,
	groups = {snappy=3, seaweedy=1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.2, .5, -.2, .2, 1.4, .2}
		}
	},
	on_place = function(itemstack, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					itemstack, pointd)
			end
		end

		local pos = pointd.under
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "ecology:tall_sponge1"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "ecology:tall_sponge1", math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})

core.register_node("ecology:tall_sponge2", {
	description = "Tall Green Sponge",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"moreplants_tall_sponge2.png"},
	inventory_image = "moreplants_tall_sponge2.png",
	wield_image = "moreplants_tall_sponge2.png",
	paramtype = "light",
	visual_scale = 1.4,
	groups = {snappy=3, seaweedy=1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.2, .5, -.2, .2, 1.4, .2}
		}
	},
	on_place = function(itemstack, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					itemstack, pointd)
			end
		end

		local pos = pointd.under
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "ecology:tall_sponge2"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "ecology:tall_sponge2", math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})

core.register_node("ecology:tall_sponge3", {
	description = "Tall Red Sponge",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"moreplants_tall_sponge3.png"},
	inventory_image = "moreplants_tall_sponge3.png",
	wield_image = "moreplants_tall_sponge3.png",
	paramtype = "light",
	visual_scale = 1.4,
	groups = {snappy=3, seaweedy=1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.2, .5, -.2, .2, 1.4, .2}
		}
	},
	on_place = function(itemstack, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					itemstack, pointd)
			end
		end

		local pos = pointd.under
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "ecology:tall_sponge3"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "ecology:tall_sponge3", math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})

core.register_node("ecology:pearl_oyster_empty", {
	description = "Empty Pearl Oyster",
	drawtype = "plantlike_rooted",
	tiles = {"default_sand.png"},
	special_tiles = {"ecology_pearl_oyster_empty.png"},
	inventory_image = "ecology_pearl_oyster_empty.png",
	wield_image = "ecology_pearl_oyster_empty.png",
	paramtype = "light",
	groups = {dig_immediate = 2, attached_node = 1, oyster=1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.2, .5, -.2, .2, 1.2, .2}
		}
	},
	on_place = function(itemstack, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					itemstack, pointd)
			end
		end

		local pos = pointd.under
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "ecology:pearl_oyster_empty"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_growth(pos, 1, 4, "ecology:pearl_oyster", 0, math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_crumbly", gain = .2},
		dug = {name = "default_dug_node", gain = .15},
	}),
})

core.register_node("ecology:pearl_oyster", {
	description = "Pearl Oyster",
	drawtype = "plantlike_rooted",
	tiles = {"default_sand.png"},
	special_tiles = {"ecology_pearl_oyster.png"},
	inventory_image = "ecology_pearl_oyster.png",
	wield_image = "ecology_pearl_oyster.png",
	paramtype = "light",
	groups = {dig_immediate = 2, attached_node = 1, oyster=1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.2, .5, -.2, .2, 1.2, .2}
		}
	},
	on_place = function(itemstack, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					itemstack, pointd)
			end
		end

		local pos = pointd.under
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "ecology:pearl_oyster"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
if #core.find_nodes_in_area(vector.subtract(pos, 4), vector.add(pos, 4), "ecology:pearl_oyster") > 1 then
	default.under_water_spread(pos, 1, 4, "ecology:pearl_oyster_empty", math.random(166, 286), "group:oyster")
else
	core.get_node_timer(pos):start(math.random(166, 286))
end
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_crumbly", gain = .2},
		dug = {name = "default_dug_node", gain = .15},
	}),
})

core.register_node("ecology:anemone", {
	description = "Anemone",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"mapgen_anemone.png"},
	inventory_image = "mapgen_anemone.png",
	wield_image = "mapgen_anemone.png",
	paramtype = "light",
	damage_per_second = 1,
	groups = {snappy=3, anemone=1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.2, .5, -.2, .2, 1., .2}
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, .39, .5},
	},
	on_place = function(itemstack, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					itemstack, pointd)
			end
		end

		local pos = pointd.under
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "ecology:anemone"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "", math.random(166, 286), "group:anemone")
	end,
	on_punch = function(pos, node, user)
		local wielded = user:get_wielded_item()

		if wielded:get_count() == 0 then
			user:set_hp(user:get_hp() - 1)
		end
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})

core.register_node("ecology:seaweed", {
	description = "Seaweed",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"moreplants_seaweed.png"},
	inventory_image = "moreplants_seaweed.png",
	wield_image = "moreplants_seaweed.png",
	paramtype = "light",
	groups = {snappy=3, seaweedy=1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.3, -.5, -.3, .3, .8, .3}
		}
	},
	on_place = function(itemstack, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					itemstack, pointd)
			end
		end

		local pos = pointd.under
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "ecology:seaweed"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "ecology:seaweed", math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})

core.register_node("ecology:seagrass_1", {
	description = "Dark Seagrass",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"mapgen_sea_grass.png", "default_sand.png",
		{name = "default_sand.png^mapgen_sea_grass_side.png",
			tileable_vertical = false}},
	special_tiles = {"mapgen_seagrass_1.png"},
	inventory_image = "mapgen_seagrass_3.png",
	wield_image = "mapgen_seagrass_3.png",
	paramtype = "light",
	groups = {snappy=3, seaweedy=1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.3, .5, -.3, .3, .8, .3}
		}
	},
	on_place = function(itemstack, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					itemstack, pointd)
			end
		end

		local pos = pointd.under
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "ecology:seagrass_" .. math.random(1, 3)})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "ecology:seagrass_1", math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
		footstep = {name="default_grass_footstep", gain= .1},
	})
})

for i = 2, 3 do
core.register_node("ecology:seagrass_" .. i, {
	description = "Dark Seagrass",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"mapgen_sea_grass.png", "default_sand.png",
		{name = "default_sand.png^mapgen_sea_grass_side.png",
			tileable_vertical = false}},
	special_tiles = {"mapgen_seagrass_" .. i .. ".png"},
	inventory_image = "mapgen_seagrass_" .. i .. ".png",
	wield_image = "mapgen_seagrass_" .. i .. ".png",
	paramtype = "light",
	groups = {snappy=3, seaweedy=1, not_in_creative_inventory=1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.3, .5, -.3, .3, .8, .3}
		}
	},
	drop = "ecology:seagrass_1",
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "ecology:seagrass_" .. i, math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
		footstep = {name="default_grass_footstep", gain= .1},
	})
})
end

core.register_node("ecology:kelp_block", {
	description = "Dried Kelp Block",
	tiles = {"xocean_kelp_block.png"},
	groups = {snappy=3},
	drop = "ecology:kelp 9",
	sounds = default.node_sound_leaves_defaults(),
})
core.register_craft({
	output = "ecology:kelp_block",
	recipe = {
		{'ecology:kelp', 'ecology:kelp', 'ecology:kelp'},
		{'ecology:kelp', 'ecology:kelp', 'ecology:kelp'},
		{'ecology:kelp', 'ecology:kelp', 'ecology:kelp'}
	}
})
core.register_craft({
	type = "cooking",
	output = "ecology:kelp",
	recipe = "default:kelp_yellow",
})
core.register_craftitem("ecology:kelp", {
	description = "Dried Kelp",
	inventory_image = "xocean_dried_kelp.png",
	on_use = core.item_eat(2),
	groups = {flammable = 1}
})
core.register_craftitem("ecology:sushi", {
	description = "Sushi",
	inventory_image = "xocean_sushi.png",
	on_use = core.item_eat(6),
	groups = {flammable = 1}
})
core.register_craft({
	output = "ecology:sushi",
	recipe = {
		{"mobs_fish:fish_edible"},
		{"ecology:kelp"}
	}
})

core.register_node("ecology:seagrass", {
	description = "Seagrass",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"xocean_grass.png"},
	inventory_image = "xocean_grass.png",
	wield_image = "xocean_grass.png",
	paramtype = "light",
	groups = {snappy = 3, seaweed = 1, seaweedy = 1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-5/16, .5, -5/16, 5/16, .8, 5/16}
		}
	},
	on_place = function(itemstack, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					itemstack, pointd)
			end
		end

		local pos = pointd.under
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "ecology:seagrass"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "ecology:seagrass", math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})
core.register_node("ecology:pickle", {
	description = "Sea Pickle",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"xocean_pickle.png"},
	inventory_image = "xocean_pickle.png",
	wield_image = "xocean_pickle.png",
	paramtype = "light",
	groups = {snappy = 3, seaweedy = 1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	light_source = 3,
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-1/8, .5, -1/8, 1/8, 1., 1/8}
		}
	},
	on_place = function(itemstack, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					itemstack, pointd)
			end
		end

		local pos = pointd.under
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "ecology:pickle"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "ecology:pickle", math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})

-- Corals
core.register_node("ecology:orange_coral", {
	description = "Orange Coral",
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"default_coral_orange.png"},
	special_tiles = {"ecology_orange_coral.png"},
	inventory_image = "ecology_orange_coral.png",
	wield_image = "ecology_orange_coral.png",
	groups = {crumbly = 2, coraly = 1, timer_check = 1},
	drop = "default:coral_skeleton_tip",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.2, 4/16}
		}
	},
	node_dig_prediction = "default:coral_orange",
	node_placement_prediction = "",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),

	on_place = function(itemstack, placer, pointd)
		if pointd.type ~= "node" or not placer then
			return itemstack
		end

		local pname = placer:get_player_name()
		local pos_under = pointd.under
		local pos_above = pointd.above
		local node_under = core.get_node(pos_under)
		local def_under = core.registered_nodes[node_under.name]

		if def_under and def_under.on_rightclick and not placer:get_player_control().sneak then
			return def_under.on_rightclick(pos_under, node_under,
				placer, itemstack, pointd) or itemstack
		end

		if node_under.name ~= "default:coral_orange" or
				core.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if pos_above.y ~= pos_under.y+1 then
			return itemstack
		end

		if core.is_protected(pos_under, pname) or
				core.is_protected(pos_above, pname) then
core.log("action", pname .. " tried to place ecology:orange_coral at protected position " .. core.pos_to_string(pos_under))
			core.record_protection_violation(pos_under, pname)
			return itemstack
		end

		core.set_node(pos_under, {name = "ecology:orange_coral"})
		if not core.is_creative_enabled(pname) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:coral_orange"})
	end,
})

core.register_node("ecology:blue_coral", {
	description = "Dark Blue Coral",
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"default_coral_skeleton.png"},
	special_tiles = {"mapgen_blue_coral.png"},
	inventory_image = "mapgen_blue_coral.png",
	wield_image = "mapgen_blue_coral.png",
	groups = {crumbly = 2, coraly = 1, timer_check = 1},
	drop = "default:coral_skeleton_tip",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.3, .5, -.3, .3, 1., .3}
		}
	},
	node_dig_prediction = "default:coral_skeleton",
	node_placement_prediction = "",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),

	on_place = function(itemstack, placer, pointd)
		if pointd.type ~= "node" or not placer then
			return itemstack
		end

		local pname = placer:get_player_name()
		local pos_under = pointd.under
		local pos_above = pointd.above
		local node_under = core.get_node(pos_under)
		local def_under = core.registered_nodes[node_under.name]

		if def_under and def_under.on_rightclick and not placer:get_player_control().sneak then
			return def_under.on_rightclick(pos_under, node_under,
				placer, itemstack, pointd) or itemstack
		end

		if node_under.name ~= "default:coral_skeleton" or
				core.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if pos_above.y ~= pos_under.y+1 then
			return itemstack
		end

		if core.is_protected(pos_under, pname) or
				core.is_protected(pos_above, pname) then
core.log("action", pname .. " tried to place ecology:blue_coral at protected position " .. core.pos_to_string(pos_under))
			core.record_protection_violation(pos_under, pname)
			return itemstack
		end

		core.set_node(pos_under, {name = "ecology:blue_coral"})
		if not core.is_creative_enabled(pname) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:coral_skeleton"})
	end,
})

core.register_node("ecology:brain_block", {
	description = "Brain Coral Block",
	tiles = {"xocean_coral_brain.png"},
	groups = {cracky = 3, coraly = 2, timer_check = 1},
	drop = "default:coral_skeleton",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults(),
})
core.register_node("ecology:coral_brain", {
	description = "Brain Coral",
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"xocean_coral_brain.png"},
	special_tiles = {"xocean_brain.png"},
	inventory_image = "xocean_brain.png",
	wield_image = "xocean_brain.png",
	groups = {crumbly = 2, coraly = 1, timer_check = 1},
	drop = "default:coral_skeleton_tip",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.4, 4/16}
		}
	},
	node_dig_prediction = "ecology:brain_block",
	node_placement_prediction = "",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),

	on_place = function(itemstack, placer, pointd)
		if pointd.type ~= "node" or not placer then
			return itemstack
		end

		local pname = placer:get_player_name()
		local pos_under = pointd.under
		local pos_above = pointd.above
		local node_under = core.get_node(pos_under)
		local def_under = core.registered_nodes[node_under.name]

		if def_under and def_under.on_rightclick and not placer:get_player_control().sneak then
			return def_under.on_rightclick(pos_under, node_under,
				placer, itemstack, pointd) or itemstack
		end

		if node_under.name ~= "ecology:brain_block" or
				core.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if pos_above.y ~= pos_under.y+1 then
			return itemstack
		end

		if core.is_protected(pos_under, pname) or
				core.is_protected(pos_above, pname) then
core.log("action", pname .. " tried to place ecology:coral_brain at protected position " .. core.pos_to_string(pos_under))
			core.record_protection_violation(pos_under, pname)
			return itemstack
		end

		core.set_node(pos_under, {name = "ecology:coral_brain"})
		if not core.is_creative_enabled(pname) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		core.set_node(pos, {name = "ecology:brain_block"})
	end,
})

core.register_node("ecology:skeleton_brain", {
	description = "Old Brain Coral Skeleton",
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"xocean_coral_brain_skeleton.png"},
	special_tiles = {"xocean_brain_skeleton.png"},
	inventory_image = "xocean_brain_skeleton.png",
	wield_image = "xocean_brain_skeleton.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.4, 4/16}
		}
	},
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})

core.register_node("ecology:tube_block", {
	description = "Tube Coral Block",
	tiles = {"xocean_coral_tube.png"},
	groups = {cracky = 3, coraly = 2, timer_check = 1},
	drop = "default:coral_skeleton",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults(),
})
core.register_node("ecology:coral_tube", {
	description = "Tube Coral",
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"xocean_coral_tube.png"},
	special_tiles = {"xocean_tube.png"},
	inventory_image = "xocean_tube.png",
	wield_image = "xocean_tube.png",
	groups = {crumbly = 2, coraly = 1, timer_check = 1},
	drop = "default:coral_skeleton_tip",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.3, 4/16}
		}
	},
	node_dig_prediction = "ecology:tube_block",
	node_placement_prediction = "",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),

	on_place = function(itemstack, placer, pointd)
		if pointd.type ~= "node" or not placer then
			return itemstack
		end

		local pname = placer:get_player_name()
		local pos_under = pointd.under
		local pos_above = pointd.above
		local node_under = core.get_node(pos_under)
		local def_under = core.registered_nodes[node_under.name]

		if def_under and def_under.on_rightclick and not placer:get_player_control().sneak then
			return def_under.on_rightclick(pos_under, node_under,
				placer, itemstack, pointd) or itemstack
		end

		if node_under.name ~= "ecology:tube_block" or
				core.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if pos_above.y ~= pos_under.y+1 then
			return itemstack
		end

		if core.is_protected(pos_under, pname) or
				core.is_protected(pos_above, pname) then
core.log("action", pname .. " tried to place ecology:coral_tube at protected position " .. core.pos_to_string(pos_under))
			core.record_protection_violation(pos_under, pname)
			return itemstack
		end

		core.set_node(pos_under, {name = "ecology:coral_tube"})
		if not core.is_creative_enabled(pname) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		core.set_node(pos, {name = "ecology:tube_block"})
	end,
})

core.register_node("ecology:skeleton_tube", {
	description = "Old Tube Coral Skeleton",
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"xocean_coral_tube_skeleton.png"},
	special_tiles = {"xocean_tube_skeleton.png"},
	inventory_image = "xocean_tube_skeleton.png",
	wield_image = "xocean_tube_skeleton.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.3, 4/16}
		}
	},
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})

core.register_node("ecology:bubble_block", {
	description = "Bubble Coral Block",
	tiles = {"xocean_coral_bubble.png"},
	groups = {cracky = 3, coraly = 2, timer_check = 1},
	drop = "default:coral_skeleton",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults(),
})
core.register_node("ecology:bubble", {
	description = "Bubble Coral",
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"xocean_coral_bubble.png"},
	special_tiles = {"xocean_bubble.png"},
	inventory_image = "xocean_bubble.png",
	wield_image = "xocean_bubble.png",
	groups = {crumbly = 2, coraly = 1, timer_check = 1},
	drop = "default:coral_skeleton_tip",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1., 4/16}
		}
	},
	node_dig_prediction = "ecology:bubble_block",
	node_placement_prediction = "",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),

	on_place = function(itemstack, placer, pointd)
		if pointd.type ~= "node" or not placer then
			return itemstack
		end

		local pname = placer:get_player_name()
		local pos_under = pointd.under
		local pos_above = pointd.above
		local node_under = core.get_node(pos_under)
		local def_under = core.registered_nodes[node_under.name]

		if def_under and def_under.on_rightclick and not placer:get_player_control().sneak then
			return def_under.on_rightclick(pos_under, node_under,
				placer, itemstack, pointd) or itemstack
		end

		if node_under.name ~= "ecology:bubble_block" or
				core.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if pos_above.y ~= pos_under.y+1 then
			return itemstack
		end

		if core.is_protected(pos_under, pname) or
				core.is_protected(pos_above, pname) then
core.log("action", pname .. " tried to place ecology:bubble at protected position " .. core.pos_to_string(pos_under))
			core.record_protection_violation(pos_under, pname)
			return itemstack
		end

		core.set_node(pos_under, {name = "ecology:bubble"})
		if not core.is_creative_enabled(pname) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		core.set_node(pos, {name = "ecology:bubble_block"})
	end,
})

core.register_node("ecology:skeleton_bubble", {
	description = "Old Bubble Coral Skeleton",
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"xocean_coral_bubble_skeleton.png"},
	special_tiles = {"xocean_bubble_skeleton.png"},
	inventory_image = "xocean_bubble_skeleton.png",
	wield_image = "xocean_bubble_skeleton.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.4, 4/16}
		}
	},
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})

core.register_node("ecology:horn_block", {
 	description = "Horn Coral Block",
	tiles = {"xocean_coral_horn.png"},
	groups = {cracky = 3, coraly = 2, timer_check = 1},
	drop = "default:coral_skeleton",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults(),
})
core.register_node("ecology:horn", {
	description = "Horn Coral",
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"xocean_coral_horn.png"},
	special_tiles = {"xocean_horn.png"},
	inventory_image = "xocean_horn.png",
	wield_image = "xocean_horn.png",
	groups = {crumbly = 2, coraly = 1, timer_check = 1},
	drop = "default:coral_skeleton_tip",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.3, 4/16}
		}
	},
	node_dig_prediction = "ecology:horn_block",
	node_placement_prediction = "",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),

	on_place = function(itemstack, placer, pointd)
		if pointd.type ~= "node" or not placer then
			return itemstack
		end

		local pname = placer:get_player_name()
		local pos_under = pointd.under
		local pos_above = pointd.above
		local node_under = core.get_node(pos_under)
		local def_under = core.registered_nodes[node_under.name]

		if def_under and def_under.on_rightclick and not placer:get_player_control().sneak then
			return def_under.on_rightclick(pos_under, node_under,
				placer, itemstack, pointd) or itemstack
		end

		if node_under.name ~= "ecology:horn_block" or
				core.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if pos_above.y ~= pos_under.y+1 then
			return itemstack
		end

		if core.is_protected(pos_under, pname) or
				core.is_protected(pos_above, pname) then
core.log("action", pname .. " tried to place ecology:horn at protected position " .. core.pos_to_string(pos_under))
			core.record_protection_violation(pos_under, pname)
			return itemstack
		end

		core.set_node(pos_under, {name = "ecology:horn"})
		if not core.is_creative_enabled(pname) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		core.set_node(pos, {name = "ecology:horn_block"})
	end,
})

core.register_node("ecology:skeleton_horn", {
	description = "Old Horn Coral Skeleton",
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"xocean_coral_horn_skeleton.png"},
	special_tiles = {"xocean_horn_skeleton.png"},
	inventory_image = "xocean_horn_skeleton.png",
	wield_image = "xocean_horn_skeleton.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.3, 4/16}
		}
	},
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})

core.register_node("ecology:coral_fire", {
 	description = "Fire Coral Block",
	tiles = {"xocean_coral_fire.png"},
	groups = {cracky = 3, coraly = 2, timer_check = 1},
	drop = "default:coral_skeleton",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults(),
})
core.register_node("ecology:fire_coral", {
	description = "Fire Coral",
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"xocean_coral_fire.png"},
	special_tiles = {"xocean_fire.png"},
	inventory_image = "xocean_fire.png",
	wield_image = "xocean_fire.png",
	groups = {crumbly = 2, coraly = 1, timer_check = 1},
	drop = "default:coral_skeleton_tip",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.4, 4/16}
		}
	},
	node_dig_prediction = "ecology:coral_fire",
	node_placement_prediction = "",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),

	on_place = function(itemstack, placer, pointd)
		if pointd.type ~= "node" or not placer then
			return itemstack
		end

		local pname = placer:get_player_name()
		local pos_under = pointd.under
		local pos_above = pointd.above
		local node_under = core.get_node(pos_under)
		local def_under = core.registered_nodes[node_under.name]

		if def_under and def_under.on_rightclick and not placer:get_player_control().sneak then
			return def_under.on_rightclick(pos_under, node_under,
				placer, itemstack, pointd) or itemstack
		end

		if node_under.name ~= "ecology:coral_fire" or
				core.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if pos_above.y ~= pos_under.y+1 then
			return itemstack
		end

		if core.is_protected(pos_under, pname) or
				core.is_protected(pos_above, pname) then
core.log("action", pname .. " tried to place ecology:fire_coral at protected position " .. core.pos_to_string(pos_under))
			core.record_protection_violation(pos_under, pname)
			return itemstack
		end

		core.set_node(pos_under, {name = "ecology:fire_coral"})
		if not core.is_creative_enabled(pname) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		core.set_node(pos, {name = "ecology:coral_fire"})
	end,
})

core.register_node("ecology:skeleton_fire", {
	description = "Old Fire Coral Skeleton",
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"xocean_coral_fire_skeleton.png"},
	special_tiles = {"xocean_fire_skeleton.png"},
	inventory_image = "xocean_fire_skeleton.png",
	wield_image = "xocean_fire_skeleton.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.4, 4/16}
		}
	},
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
})

function ecology.glow_coral_spread(pos, timer)
	local pos0 = vector.subtract(pos, 4)
	local pos1 = vector.add(pos, 4)
	if #core.find_nodes_in_area(pos0, pos1, "group:glow_coral") > 3 then
		core.get_node_timer(pos):start(timer)
		return
	end

	local sands = core.find_nodes_in_area(pos0, pos1, "default:sand")
	local num_sands = #sands
	if num_sands >= 1 then
		for si = 1, math.min(3, num_sands) do
			local sand = sands[math.random(num_sands)]
			local sand_above = {x = sand.x, y = sand.y + 1, z = sand.z}
			if core.get_node(sand_above).name == "default:water_source" then
				core.swap_node(sand_above, {name = core.get_node(pos).name})
				core.get_node_timer(sand_above):start(timer)
			end
		end
	end
	core.get_node_timer(pos):start(timer)
end

-- Glow Corals
core.register_node("ecology:coral2", {
	description = "Blue Glow Coral",
	drawtype = "plantlike",
	tiles = {"default_coral_blue.png"},
	inventory_image = "default_coral_blue.png",
	wield_image = "default_coral_blue.png",
	paramtype = "light",
	light_source = 3,
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -.5, -6/16, 6/16, 1/4, 6/16}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .2, .3},
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(166, 300))
	end,
	on_timer = function(pos)
		ecology.glow_coral_spread(pos, math.random(166, 300))
	end,
	groups = {crumbly = 2, attached_node = 1, glow_coral = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output = "dye:cyan 3",
	recipe = {{"ecology:coral2"}}
})

core.register_node("ecology:coral3", {
	description = "Light Orange Glow Coral",
	drawtype = "plantlike",
	tiles = {"ecology_coral_lorange.png"},
	inventory_image = "ecology_coral_lorange.png",
	wield_image = "ecology_coral_lorange.png",
	paramtype = "light",
	light_source = 3,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -.5, -5/16, 5/16, 1/4, 5/16}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2},
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(166, 300))
	end,
	on_timer = function(pos)
		ecology.glow_coral_spread(pos, math.random(166, 300))
	end,
	groups = {crumbly = 2, attached_node = 1, glow_coral = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output = "dye:orange 3",
	recipe = {{"ecology:coral3"}}
})

core.register_node("ecology:coral4", {
	description = "Pink Glow Coral",
	drawtype = "plantlike",
	tiles = {"ecology_coral_pink.png"},
	inventory_image = "ecology_coral_pink.png",
	wield_image = "ecology_coral_pink.png",
	paramtype = "light",
	light_source = 3,
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -.5, -6/16, 6/16, .5, 6/16}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .5, .3},
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(166, 300))
	end,
	on_timer = function(pos)
		local node_under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		if not node_under then
			-- Node under not yet loaded, try later
			core.get_node_timer(pos):start(300)
			return
		end

		-- Don't grow if not on sand.
		if core.get_item_group(node_under.name, "sand") == 0 then
			core.get_node_timer(pos):start(300)
			return
		end

		local spos = {x = pos.x, y = pos.y, z = pos.z}
		local node = core.get_node(spos)
		local height = 0
		while node.name == "ecology:coral4" and height < 4 do
			height = height + 1
			spos.y = spos.y + 1
			node = core.get_node(spos)
		end
		if height == 4 or node.name ~= "default:water_source" then
			core.get_node_timer(pos):start(300)
			return
		end
		core.set_node(spos, {name = "ecology:coral4"})
		core.get_node_timer(pos):start(math.random(166, 300))
	end,
	groups = {crumbly = 2, attached_node = 1, glow_coral = 1},
	sounds = default.node_sound_leaves_defaults(),
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		default.dig_up(pos, oldnode, digger)
	end,
})

core.register_craft({
	output = "dye:pink 3",
	recipe = {{"ecology:coral4"}}
})

core.register_node("ecology:coral5", {
	description = "Lime Glow Coral",
	drawtype = "plantlike",
	tiles = {"ecology_coral_lime.png"},
	inventory_image = "ecology_coral_lime.png",
	wield_image = "ecology_coral_lime.png",
	paramtype = "light",
	light_source = 3,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -.5, -5/16, 5/16, 3/16, 5/16}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .1, .2},
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(166, 300))
	end,
	on_timer = function(pos)
		ecology.glow_coral_spread(pos, math.random(166, 300))
	end,
	groups = {crumbly = 2, attached_node = 1, glow_coral = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output = "dye:green 3",
	recipe = {{"ecology:coral5"}}
})

--decorations
dofile(core.get_modpath("ecology") .. "/models.lua")

function ecology.mapgen()

core.register_ore({
	ore_type		= "scatter",
	ore				= "ecology:stone_with_worms",
	wherein			= "default:stone",
	clust_scarcity	= 800,
	clust_num_ores	= 4,
	clust_size		= 8,
	y_max			= 20,
	y_min			= -100,
})
	if core.get_modpath("ethereal") then
core.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:grove_dirt",
	sidelen = 16,
	noise_params = {
		offset = .005,
		scale = .01,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = .66
	},
	biomes = {"subtropical_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:bamboo_grass",
})
	end
core.register_decoration({
	name = "ecology:peat_moss",
	deco_type = "simple",
	place_on = {"default:mud"},
	sidelen = 4,
	noise_params = {
		offset = -0.7,
		scale = 4.0,
		spread = {x = 16, y = 16, z = 16},
		seed = 513337,
		octaves = 1,
		persist = 0.0,
		flags = "absvalue, eased"
	},
	biomes = {"swamp"},
	y_max = 5,
	y_min = 2,
	decoration = "ecology:peat_moss",
	spawn_by = "default:mud",
	num_spawn_by = 2,
	flags = "force_placement"
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_swamp_grass",
	sidelen = 16,
	noise_params = {
		offset = .02,
		scale = .02,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = .6
	},
	biomes = {"swamp"},
	y_max = 10,
	y_min = 1,
	decoration = {"ecology:swamp_grass", "ecology:sproutling_grass"},
})
core.register_decoration({
	name = "ecology:duckweed",
	deco_type = "simple",
	place_on = {"default:dirt", "default:silt"},
	sidelen = 16,
	noise_params = {
		offset = -0.12,
		scale = 0.3,
		spread = {x = 200, y = 200, z = 200},
		seed = 33,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"swamp", "deciduous_forest_shore"},
	y_max = 0,
	y_min = 0,
	decoration = "ecology:duckweed",
	param2 = 0,
	param2_max = 3,
	place_offset_y = 1,
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:desert_sand",
	sidelen = 16,
	fill_ratio = .0001,
	biomes = {"desert"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:fire_flower",
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:dirt_with_coniferous_litter"},
	sidelen = 16,
	fill_ratio = .0001,
	biomes = {"grassland", "coniferous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:yellow_bell",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = .0001,
	biomes = {"grassland"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:saffron_crocus",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = .00001,
	biomes = {"grassland", "deciduous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = {"ecology:lucky_club", "ecology:clover"},
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = .0005,
	biomes = {"grassland", "deciduous_forest"},
	y_max = 3,
	y_min = 1,
	decoration = "ecology:laurel",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:silver_sand",
	sidelen = 16,
	fill_ratio = .0001,
	biomes = {"cold_desert"},
	y_max = 138,
	y_min = 1,
	decoration = "ecology:arctic_carrot",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:clay_dirt_with_savanna_grass",
	sidelen = 16,
	fill_ratio = .0001,
	biomes = {"savanna"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:mandragora",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:clay_dirt_with_savanna_grass",
	sidelen = 16,
	fill_ratio = .0001,
	biomes = {"savanna"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:star_anise_plant",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = .001,
	biomes = {"deciduous_forest"},
	y_max = 2,
	y_min = 1,
	decoration = "ecology:calla",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = .0001,
	biomes = {"deciduous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:azalea",
})
core.register_decoration({
	name = "ecology:irises",
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "ethereal:grove_dirt"},
	sidelen = 16,
	noise_params = {
		offset = -0.02,
		scale = 0.04,
		spread = {x = 200, y = 200, z = 200},
		seed = 46783,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"grassland", "deciduous_forest", "subtropical_forest"},
	y_max = 109,
	y_min = 1,
	decoration = {"ecology:iris_blue", "ecology:iris_lightblue"},
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_coniferous_litter",
	sidelen = 16,
	fill_ratio = .0001,
	biomes = {"coniferous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:orange_mycena",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_coniferous_litter",
	sidelen = 16,
	fill_ratio = .0001,
	biomes = {"coniferous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:cortinarius_violaceus",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_coniferous_litter",
	sidelen = 16,
	fill_ratio = .0001,
	biomes = {"coniferous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:gliophorus_viridis",
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_rainforest_litter"},
	sidelen = 80,
	noise_params = {
		offset = -.09,
		scale = .1,
		spread = {x = 63, y = 63, z = 63}, 
		seed = 556, 
		octaves = 3, 
		persist = .5
	},
	biomes = {"rainforest"},
	y_max = 80,
	y_min = 13,
	decoration = "ecology:rhodedendron_plant",
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:clay_dirt_with_savanna_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = .02,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = .6
	},
	biomes = {"savanna"},
	y_max = 109,
	y_min = 2,
	decoration = {"ecology:orange_mushes", "ecology:wild_oat_dry"},
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:clay_dirt_with_savanna_grass"},
	sidelen = 32,
	noise_params = {
		offset = .002,
		scale = .006,
		spread = {x = 100, y = 100, z = 100},
		seed = 329,
		octaves = 3,
		persist = .6
	},
	biomes = {"deciduous_forest", "savanna"},
	y_max = 40,
	y_min = 15,
	decoration = "ecology:mushcluster",
})

core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_swamp_grass",
	sidelen = 36,
	noise_params = {
		offset = .001,
		scale = .005,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = .6
	},
	biomes = {"swamp"},
	y_max = 6,
	y_min = 0,
	decoration = {"ecology:docgrass", "ecology:swamp_weed"},
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_swamp_grass"},
	sidelen = 200,
	noise_params = {
		offset = -.0005,
		scale = .0015,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = .6
	},
	biomes = {"swamp"},
	y_max = 10,
	y_min = 0,
	decoration = "ecology:bigmush",
})

--dead grass
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand"},
	sidelen = 6,
	fill_ratio = .002,
	biomes = {"desert"},
	y_max = 109,
	y_min = 1,
	decoration = {"ecology:dead_grass_1", "ecology:dead_grass_2", "ecology:dead_grass_3", "ecology:dead_grass_4", "ecology:dead_grass_5"},
})

core.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = .0,
		scale = -.015,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = .66
	},
	biomes = {"deciduous_forest"},
	y_max = 109,
	y_min = 1,
	place_offset_y = 1,
	schematic = shrub,
	flags = "place_center_x, place_center_z",
})

	--tall grasses
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_rainforest_litter", "default:dirt_with_swamp_grass"},
	sidelen = 16,
	fill_ratio = .001,
	biomes = {"swamp", "rainforest"},
	y_max = 109,
	y_min = 1,
	decoration = {"ecology:tall_grass", "ecology:long_grass_dark"},
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = .001,
	biomes = {"grassland"},
	y_max = 109,
	y_min = 1,
	decoration = {"ecology:long_grass", "ecology:crabgrass"},
})

	--giant grass
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_swamp_grass",
	sidelen = 16,
	fill_ratio = .001,
	biomes = {"swamp"},
	y_max = 10,
	y_min = 0,
	decoration = "ecology:giantgrass",
})

core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = .005,
	biomes = {"deciduous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:creeper",
})	

core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = .005,
	biomes = {"deciduous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = {"ecology:shrub2", "ecology:wild_oat"},
})	

core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = .005,
	biomes = {"deciduous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:deciduous_grass",
})	

core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_rainforest_litter",
	sidelen = 48,
	fill_ratio = .0002,
	biomes = {"rainforest"},
	y_max = 109,
	y_min = 1,
	decoration = {"ecology:parasol_shroom", "ecology:glowing_mushroom_white", "ecology:mushroom_shiitake", "ecology:mushroom_red"},
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_rainforest_litter",
	sidelen = 16,
	fill_ratio = .002,
	biomes = {"rainforest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:sumbrellia",
})

core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_rainforest_litter",
	sidelen = 16,
	fill_ratio = .02,
	biomes = {"rainforest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:grass",
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_rainforest_litter", "group:trunk", "group:stone"},
	sidelen = 16,
	fill_ratio = .05,
	biomes = {"rainforest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:moss",
	param2 = 1,
})

--Aloe Vera
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:sand"},
	sidelen = 16,
	fill_ratio = .002,
	biomes = {"desert", "sandstone_desert"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:aloe_vera",
})

	--small cacti
core.register_decoration({
	deco_type = "simple",
	place_on = "default:sand",
	sidelen = 16,
	fill_ratio = .001,
	biomes = {"sandstone_desert_ocean", "desert_ocean"},
	decoration = "ecology:small_cactus",
	y_min = 1,
	y_max = 2,
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:sand"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = .02,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = .6
	},
	biomes = {"desert", "sandstone_desert"},
	y_min = 2,
	y_max = 109,
	decoration = {"ecology:small_cactus", "ecology:prickly_pear", "ecology:small_cactus_prikly", "ecology:small_cactus_prikly2"},
})
core.register_decoration({
	name = "ecology:dark_cactus",
	deco_type = "simple",
	place_on = {"default:sand"},
	sidelen = 80,
	fill_ratio = 0.0024,
	biomes = {"sandstone_desert"},
	y_max = 109,
	y_min = 4,
	decoration = "ecology:dark_cactus",
	height = 2,
	height_max = 3,
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:dirt_with_coniferous_litter"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = .02,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = .6
	},
	biomes = {"grassland", "coniferous_forest"},
	y_min = 2,
	y_max = 109,
	decoration = {"ecology:palgre_S5", "ecology:golden_grass_S5"},
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:desert_sand",
	sidelen = 26,
	fill_ratio = .005,
	biomes = {"desert"},
	y_max = 109,
	y_min = -8,
	decoration = "ecology:fireflower",
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:dirt_with_swamp_grass"},
	sidelen = 16,
	fill_ratio = .004,
	biomes = {"deciduous_forest", "swamp"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:shrub",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = .001,
	biomes = {"grassland"},
	y_max = 109,
	y_min = 1,
	decoration = {"ecology:blueflower", "ecology:bluespike", "ecology:dahlia_red"},
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_rainforest_litter",
	sidelen = 16,
	fill_ratio = .02,
	biomes = {"rainforest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:jungleflower",
})

core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_rainforest_litter",
	sidelen = 16,
	fill_ratio = .02,
	biomes = {"rainforest"},
	y_max = 109,
	y_min = 1,
	decoration = {"ecology:fern_light", "ecology:fern_dark"},
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_rainforest_litter", "default:dirt_with_coniferous_litter"},
	sidelen = 16,
	fill_ratio = .01,
	biomes = {"rainforest", "coniferous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = {"ecology:bigfern", "ecology:fern_thick"},
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_rainforest_litter"},
	sidelen = 16,
	fill_ratio = .01,
	biomes = {"rainforest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:bigflower",
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_rainforest_litter"},
	sidelen = 16,
	fill_ratio = .01,
	biomes = {"rainforest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:medflower",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = .005,
	biomes = {"grassland"},
	y_max = 109,
	y_min = 1,
	decoration = {"ecology:aliengrass", "ecology:weed"},
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:desert_sand",
	sidelen = 26,
	fill_ratio = .005,
	biomes = {"desert"},
	y_max = 109,
	y_min = -8,
	decoration = "ecology:eyeweed",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:stone",
	sidelen = 16,
	fill_ratio = .001,
	y_max = 8,
	y_min = -31000,
	decoration = "ecology:stoneweed",
    flags = "all_floors",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:desert_sand",
	sidelen = 26,
	fill_ratio = .005,
	biomes = {"desert"},
	y_max = 109,
	y_min = -6,
	decoration = "ecology:small_cactus_dark",
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 26,
	fill_ratio = .005,
	biomes = {"deciduous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = {"ecology:curly", "ecology:orange_rose"},
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 80,
	noise_params = {
		offset = -.09,
		scale = .1,
		spread = {x = 63, y = 63, z = 63}, 
		seed = 715, 
		octaves = 3, 
		persist = .5
	},
	biomes = {"grassland", "deciduous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:bush",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_snow",
	sidelen = 16,
	fill_ratio = .005,
	biomes = {"taiga",  "snowy_grassland"},
	y_max = 138,
	y_min = 1,
	decoration = {"ecology:crescentflower", "ecology:frozen_rose"},
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_snow",
	sidelen = 26,
	fill_ratio = .02,
	biomes = {"taiga"},
	y_max = 138,
	y_min = 1,
	decoration = {"ecology:deadweed", "ecology:snow_grass_3", "ecology:snow_grass_4", "ecology:snow_grass_5"},
	param2 = 0,
	param2_max = 3,
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_snow",
	sidelen = 26,
	fill_ratio = .02,
	biomes = {"taiga"},
	y_max = 138,
	y_min = 1,
	decoration = "ecology:taigabush",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_snow",
	sidelen = 16,
	fill_ratio = .02,
	biomes = {"taiga"},
	y_max = 138,
	y_min = -8,
	decoration = "ecology:groundfung",
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = .002,
		scale = .001,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = .66
	},
	biomes = {"grassland"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:spardeflower",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_coniferous_litter",
	sidelen = 26,
	fill_ratio = .02,
	biomes = {"coniferous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:yellow_weed",
})

core.register_decoration({--ferns
	deco_type = "simple",
	place_on = {"default:dirt_with_coniferous_litter", "default:dirt_with_rainforest_litter"},
	sidelen = 16,
	fill_ratio = .02,
	biomes = {"coniferous_forest", "rainforest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:fern",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_coniferous_litter",
	sidelen = 26,
	fill_ratio = .02,
	biomes = {"coniferous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:fern",
})
core.register_decoration({
	name = "ecology:subtrop_grass2",
	deco_type = "simple",
	place_on = {"default:dirt_with_rainforest_litter"},
	sidelen = 80,
	fill_ratio = 0.35,
	biomes = {"rainforest"},
	y_max = 109,
	y_min = 1,
	decoration = "default:subtrop_grass",
	param2 = 0,
	param2_max = 3,
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:clay_dirt_with_savanna_grass"},
	sidelen = 16,
	fill_ratio = .01,
	biomes = {"deciduous_forest", "savanna"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:mushroom",
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "ethereal:grove_dirt"},
	sidelen = 16,
	fill_ratio = .01,
	biomes = {"deciduous_forest", "subtropical_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:pinkflower",
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "ethereal:grove_dirt"},
	sidelen = 16,
	fill_ratio = .01,
	biomes = {"deciduous_forest", "subtropical_forest"},
	y_max = 109,
	y_min = 1,
	decoration = {"ecology:pinkflower2", "ecology:gladioris"},
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_snow"},
	sidelen = 26,
	fill_ratio = .002,
	biomes = {"taiga"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:berry_bush",
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_snow"},
	sidelen = 80,
	fill_ratio = .0002,
	biomes = {"taiga"},
	y_max = 138,
	y_min = 1,
	decoration = "ecology:winter_lavender",
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_snow"},
	sidelen = 26,
	fill_ratio = .002,
	biomes = {"taiga"},
	y_max = 138,
	y_min = -9,
	decoration = {"ecology:chillshroom", "ecology:aqua_mush"},
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:desert_stone"},
	sidelen = 26,
	fill_ratio = .002,
	biomes = {"desert"},
	y_max = 109,
	y_min = -8,
	decoration = "ecology:sunshroom",
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 26,
	fill_ratio = .002,
	biomes = {"deciduous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:zapshroom",
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:clay_dirt_with_savanna_grass"},
	sidelen = 26,
	fill_ratio = .002,
	biomes = {"savanna"},
	y_max = 109,
	y_min = -6,
	decoration = {"ecology:rushroom", "ecology:shrub_big"},
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.05,
	biomes = {"deciduous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:glow_shrooms",
	spawn_by = "default:beech_trunk",
	num_spawn_by = 1,
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = .01,
	biomes = {"deciduous_forest"},
	y_max = 109,
	y_min = 1,
	decoration = "ecology:glowfung",
	spawn_by = "default:beech_trunk",
	num_spawn_by = 1,
})

local ocean_biomes = {"taiga_ocean", "snowy_grassland_ocean", "grassland_ocean",
	"coniferous_forest_ocean", "deciduous_forest_ocean", "sandstone_desert_ocean", "cold_desert_ocean"}
core.register_decoration({
	name = "ecology:brain",
	deco_type = "schematic",
	place_on = {"default:sand"},
	sidelen = 2,
	noise_params = {
		offset = .0001,
		scale = .0001,
		spread = {x = 100000, y = 100000, z = 100000},
		seed = 87112,
		octaves = 20,
		persist = .7
	},
	biomes = ocean_biomes,
	y_max = -9,
	y_min = -16,
	flags = "place_center_x, place_center_z",
	schematic = brain_coral,
	rotation = "random",
})
core.register_decoration({
	name = "ecology:bubble",
	deco_type = "schematic",
	place_on = {"default:sand"},
	sidelen = 2,
	noise_params = {
		offset = .0001,
		scale = .0001,
		spread = {x = 100000, y = 100000, z = 100000},
		seed = 87112,
		octaves = 20,
		persist = .7
	},
	biomes = ocean_biomes,
	y_max = -9,
	y_min = -16,
	flags = "place_center_x, place_center_z",
	schematic = bubble_coral,
	rotation = "random",
})
core.register_decoration({
	name = "ecology:tube",
	deco_type = "schematic",
	place_on = {"default:sand"},
	sidelen = 2,
	noise_params = {
		offset = .0001,
		scale = .0001,
		spread = {x = 100000, y = 100000, z = 100000},
		seed = 87112,
		octaves = 28,
		persist = .7
	},
	biomes = ocean_biomes,
	y_max = -9,
	y_min = -16,
	flags = "place_center_x, place_center_z",
	schematic = tube_coral,
	rotation = "random",
})
core.register_decoration({
	name = "ecology:brain2",
	deco_type = "schematic",
	place_on = {"default:sand"},
	sidelen = 1,
	noise_params = {
		offset = .0001,
		scale = .000001,
		spread = {x = 100000, y = 100000, z = 100000},
		seed = 87112,
		octaves = 25,
		persist = .7
	},
	biomes = ocean_biomes,
	y_max = -9,
	y_min = -16,
	flags = "place_center_x, place_center_z",
	schematic = brain_coral2,
	rotation = "random",
})
core.register_decoration({
	name = "ecology:horn",
	deco_type = "simple",
	place_on = {"default:sand"},
	place_offset_y = -1,
	sidelen = 2,
	noise_params = {
		offset = .0001,
		scale = .0001,
		spread = {x = 100000, y = 100000, z = 100000},
		seed = 87112,
		octaves = 28,
		persist = .7
	},
	biomes = ocean_biomes,
	y_max = -9,
	y_min = -16,
	flags = "force_placement",
	decoration = "ecology:horn_block",
	height = 4,
	height_max = 5,
})

core.register_decoration({
	name = "ecology:seagrass",
	deco_type = "simple",
	place_on = {"default:sand"},
	place_offset_y = -1,
	sidelen = 16,
	noise_params = {
		offset = -.04,
		scale = .4,
		spread = {x = 200, y = 200, z = 200},
		seed = 87112,
		octaves = 3,
		persist = .7
	},
	biomes = ocean_biomes,
	y_max = -2,
	y_min = -16,
	flags = "force_placement",
	decoration = {"ecology:seagrass", "ecology:seaweed", "ecology:seagrass_1", "ecology:seagrass_2", "ecology:seagrass_3", "ecology:sponge1", "ecology:sponge2", "ecology:sponge3", "ecology:tall_sponge1", "ecology:tall_sponge2", "ecology:tall_sponge3"},
})
core.register_decoration({
	name = "ecology:coral_spawning",
	deco_type = "simple",
	place_on = {"default:sand","ecology:brain_block","ecology:tube_block","ecology:coral_fire","ecology:horn_block","ecology:bubble_block"},
	place_offset_y = -1,
	sidelen = 4,
	noise_params = {
		offset = -4,
		scale = 4,
		spread = {x = 50, y = 50, z = 50},
		seed = 87112,
		octaves = 3,
		persist = .7
	},
	biomes = ocean_biomes,
	y_max = -2,
	y_min = -8,
	flags = "force_placement",
	decoration = {"ecology:fire_coral", "ecology:horn", "ecology:bubble", "ecology:coral_brain", "ecology:coral_tube",
	"ecology:skeleton_fire", "ecology:skeleton_horn", "ecology:skeleton_bubble", "ecology:skeleton_brain", "default:coral_skeleton"},
})
core.register_decoration({
	name = "ecology:old_coral_spawning",
	deco_type = "simple",
	place_on = {"default:sand"},
	place_offset_y = -1,
	sidelen = 4,
	noise_params = {
		offset = -4,
		scale = 4,
		spread = {x = 50, y = 50, z = 50},
		seed = 87112,
		octaves = 3,
		persist = .7
	},
	biomes = ocean_biomes,
	y_max = -9,
	y_min = -16,
	flags = "force_placement",
	decoration = {"ecology:skeleton_fire", "ecology:skeleton_horn", "ecology:skeleton_bubble", "ecology:skeleton_brain", "ecology:skeleton_tube"},
})
core.register_decoration({
	name = "ecology:pickle",
	deco_type = "simple",
	place_on = "default:sand",
	place_offset_y = -1,
	sidelen = 16,
	noise_params = {
		offset = -.04,
		scale = .04,
		spread = {x = 200, y = 200, z = 200},
		seed = 87112,
		octaves = 3,
		persist = .7
	},
	biomes = ocean_biomes,
	y_max = -2,
	y_min = -16,
	flags = "force_placement",
	decoration = "ecology:pickle",
})
core.register_decoration({
	name = "ecology:glow_coral_spawning",
	deco_type = "simple",
	place_on = "default:sand",
	sidelen = 80,
	fill_ratio = .01,
	y_max = -5,
	y_min = -100,
	decoration = {"ecology:coral2", "ecology:coral3", "ecology:coral4", "ecology:coral5"},
	flags = "force_placement",
})
core.register_decoration({
	deco_type = "simple",
	place_on = "default:sand",
	place_offset_y = -1,
	sidelen = 16,
	fill_ratio = .002,
	biomes = {"savanna_ocean", "rainforest_ocean", "desert_ocean", "sandstone_desert_ocean"},
	y_max = -5,
	y_min = -9,
	decoration = "ecology:pearl_oyster",
	flags = "force_placement",
})

-- get decoration ID
local irises = core.get_decoration_id("ecology:irises")
core.set_gen_notify({decoration = true}, {irises})

core.register_on_generated(function(minp, maxp)
	local gennotify = core.get_mapgen_object("gennotify")
	local poslist = {}

	for _, pos in ipairs(gennotify["decoration#"..irises] or {}) do
		local irises_pos = {x = pos.x, y = pos.y + 1, z = pos.z}
		table.insert(poslist, irises_pos)
	end

	if #poslist ~= 0 then
		for i = 1, #poslist do
			local pos = poslist[i]
			core.get_node_timer(pos):start(1)
		end
	end
-- Unders
	if maxp.y > -9 then
local spot = core.find_nodes_in_area(minp, maxp, {"default:cave_ice"})
for n = 1, #spot do
	if math.random(1, 50) == 1 then
		local pos = {x = spot[n].x, y = spot[n].y, z = spot[n].z}
		if core.get_node({x=pos.x, y=pos.y -1, z=pos.z}).name == "air" then
			core.add_node({x=pos.x, y=pos.y -1, z=pos.z}, {name = "ecology:chillshroom_2"})
		end
	end
end
	end
	if maxp.y > -15 and maxp.y < 139 then
local spot = core.find_nodes_in_area(minp, maxp, {"default:stone"})
for n = 1, #spot do
	if math.random(1, 25) == 1 then
		local pos = {x = spot[n].x, y = spot[n].y, z = spot[n].z}
		if core.get_node({x=pos.x, y=pos.y -1, z=pos.z}).name == "air" and pos.y >= -15 then
			core.add_node({x=pos.x, y=pos.y -1, z=pos.z}, {name = "ecology:cavefern"})
		end
	end
end
	end
-- Aboves
	if maxp.y < -5 then
local spot = core.find_nodes_in_area_under_air(minp, maxp, {"default:stone", "default:desert_stone"})
for n = 1, #spot do
	if math.random(1, 200) == 1 then
		local pos = {x = spot[n].x, y = spot[n].y +1, z = spot[n].z}
		if core.find_node_near(pos, 3, {"group:lava"}) and core.get_node({x=pos.x, y=pos.y +1, z=pos.z}).name == "air" then
			core.add_node(pos, {name = "ecology:firefung"})
		elseif core.get_node_light(pos) < 8 then
	if core.find_node_near(pos, 3, {"group:water"}) and core.get_node({x=pos.x, y=pos.y +1, z=pos.z}).name == "air" then
		core.add_node(pos, {name = "ecology:bluemush"})
	else
		core.add_node(pos, {name = "ecology:caveflower"})
	end
		end
	end
end
local spot = core.find_nodes_in_area_under_air(minp, maxp, {"default:stone_with_iron", "default:desert_stone_with_iron"})
for n = 1, #spot do
	if math.random(1, 25) == 1 then
		local pos = {x = spot[n].x, y = spot[n].y +1, z = spot[n].z}
		if core.get_node({x=pos.x, y=pos.y +1, z=pos.z}).name == "air" then
			core.add_node(pos, {name = "ecology:red_mush"})
		end
	end
end
	end
end)
end

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
	ecology.mapgen()
end

-- Add dirt_with_snow decoration
if core.get_modpath("bonemeal") then
bonemeal:add_sapling({
	{"ecology:bamboo_small_sprouts", nil, "soil"}
})

bonemeal:add_deco({
	{"default:dirt_with_snow", {"ecology:snow_grass_3", "ecology:snow_grass_4", "ecology:snow_grass_5", ""},
	{"ecology:crescentflower", "ecology:winter_lavender", "ecology:berry_bush", "ecology:frozen_rose",
	"ecology:taigabush", "ecology:groundfung", "ecology:aqua_mush", "ecology:deadweed", "", ""}}
})
end
