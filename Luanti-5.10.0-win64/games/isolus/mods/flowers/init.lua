-- flowers/init.lua


-- Namespace for functions

flowers = {}

-- Load support for MT game translation.
local S = core.get_translator("flowers")


-- Map Generation

dofile(core.get_modpath("flowers") .."/mapgen.lua")


--
-- Flowers
--

-- Aliases for original flowers mod

core.register_alias("flowers:flower_rose", "flowers:rose")
core.register_alias("flowers:flower_tulip", "flowers:tulip")
core.register_alias("flowers:flower_dandelion_yellow", "flowers:dandelion")
core.register_alias("flowers:flower_geranium", "flowers:geranium")
core.register_alias("flowers:flower_viola", "flowers:viola")
core.register_alias("flowers:flower_dandelion_white", "flowers:daisy")


-- Flower registration

local function add_simple_flower(name, desc, box, f_groups, poof)
	-- Common flowers' groups
	f_groups.snappy = 3
	f_groups.flower = 1
	f_groups.flora = 1
	f_groups.attached_node = 1

	core.register_node("flowers:" .. name, {
		description = desc,
		drawtype = poof and "mesh" or "plantlike",
		mesh = "plant_poof_1.obj",
		waving = 1,
		tiles = {"flowers_" .. name .. ".png"},
		inventory_image = "flowers_" .. name .. ".png",
		wield_image = "flowers_" .. name .. ".png",
		use_texture_alpha = poof and "clip" or nil,
		paramtype = "light",
		light_source = poof and 1 or nil,
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

flowers.datas = {
	{
		"rose",
		S("Red Rose"),
		{-2/16, -.5, -2/16, 2/16, 5/16, 2/16},
		{color_red = 1, flammable = 1}
	},
	{
		"tulip",
		S("Tulip"),
		{-2/16, -.5, -2/16, 2/16, 3/16, 2/16},
		{color_orange = 1, flammable = 1}
	},
	{
		"dandelion",
		S("Dandelion"),
		{-.25, -.5, -.25, .25, -2/16, .25},
		{color_yellow = 1, flammable = 1}, true
	},
	{
		"chrysanthemum_green",
		S("Green Chrysanthemum"),
		{-.25, -.5, -.25, .25, -1/16, .25},
		{color_green = 1, flammable = 1}, true
	},
	{
		"geranium",
		S("Blue Geranium"),
		{-2/16, -.5, -2/16, 2/16, 2/16, 2/16},
		{color_blue = 1, flammable = 1}
	},
	{
		"viola",
		S("Viola"),
		{-5/16, -.5, -5/16, 5/16, -1/16, 5/16},
		{color_violet = 1, flammable = 1}, true
	},
	{
		"daisy",
		S("Daisy"),
		{-5/16, -.5, -5/16, 5/16, -2/16, 5/16},
		{color_white = 1, flammable = 1}, true
	},
	{
		"tulip_black",
		S("Black Tulip"),
		{-2/16, -.5, -2/16, 2/16, 3/16, 2/16},
		{color_black = 1, flammable = 1}
	},
	{
		"tulip_LO",
		S("Light Orange Tulip"),
		{-2/16, -.5, -2/16, 2/16, 3/16, 2/16},
		{color_orange = 1, flammable = 1}
	},
	{
		"delphinium",
		S("Blue Delphinium"),
		{-.17, -.5, -.17, .17, .3, .17},
		{color_light_blue = 1, flammable = 1}
	},
	{
		"thistle",
		S("Thistle"),
		{-.17, -.5, -.17, .17, .2, .17},
		{color_magenta = 1, flammable = 1}
	},
	{
		"lazarus",
		S("Lazarus Bell"),
		{-.17, -.5, -.17, .17, .2, .17},
		{color_pink = 1, flammable = 1}
	},
	{
		"mannagrass",
		S("Mannagrass"),
		{-.17, -.5, -.17, .17, .2, .17},
		{color_dark_green = 1, flammable = 1}
	},
	{
		"spider_plant",
		S("Spider Plant"),
		{-5/16, -.5, -5/16, 5/16, -1/16, 5/16},
		{color_green = 1, flammable = 1}, true
	},
	{
		"amaryllis",
		S("Amaryllis"),
		{-2/16, -.5, -2/16, 2/16, 5/16, 2/16},
		{color_red = 1, flammable = 1}
	},
	{
		"orchide",
		S("Orchide"),
		{-2/16, -.5, -2/16, 2/16, 5/16, 2/16},
		{color_violet = 1, flammable = 1}
	},
	{
		"purple_droops",
		S("Purple Droops"),
		{-2/16, -.5, -2/16, 2/16, 5/16, 2/16},
		{color_magenta = 1, flammable = 1}, true
	},
	{
		"lion_tooth",
		S("Lion's Tooth"),
		{-3/16, -.5, -3/16, 3/16, 5/16, 3/16},
		{color_yellow = 1, flammable = 1}, true
	},
	{
		"pansy_blue",
		S("Blue Pansy"),
		{-5/16, -.5, -5/16, 5/16, -1/16, 5/16},
		{color_blue = 1, flammable = 1}, true
	},
	{
		"pansy_purple",
		S("Purple Pansy"),
		{-5/16, -.5, -5/16, 5/16, -1/16, 5/16},
		{color_violet = 1, flammable = 1}, true
	},
	{
		"petunia_blue",
		S("Blue Petunia"),
		{-5/16, -.5, -5/16, 5/16, -1/16, 5/16},
		{color_blue = 1, flammable = 1}, true
	},
	{
		"petunia_pink",
		S("Pink Petunia"),
		{-5/16, -.5, -5/16, 5/16, -1/16, 5/16},
		{color_pink = 1, flammable = 1}, true
	},
	{
		"petunia_white",
		S("White Petunia"),
		{-5/16, -.5, -5/16, 5/16, -1/16, 5/16},
		{color_white = 1, flammable = 1}, true
	},
	{
		"lavender",
		S("Lavender"),
		{-5/16, -.5, -5/16, 5/16, -1/16, 5/16},
		{color_violet = 1, flammable = 1}, true
	},
	{
		"flame_lily",
		S("Flame Lily"),
		{-5/16, -.5, -5/16, 5/16, -1/16, 5/16},
		{color_orange = 1}, true
	},
	{
		"foxglove_pink",
		S("Pink Foxglove"),
		{-2/16, -.5, -2/16, 2/16, 2/16, 2/16},
		{color_pink = 1, flammable = 1}
	},
	{
		"foxglove_purple",
		S("Pink Purple Foxglove"),
		{-2/16, -.5, -2/16, 2/16, 2/16, 2/16},
		{color_magenta = 1, flammable = 1}
	},
	{
		"gerbera",
		S("Gerbera"),
		{-2/16, -.5, -2/16, 2/16, 2/16, 2/16},
		{color_magenta = 1, flammable = 1}
	},
	{"lobelia", S("Lobelia"), {-5/16, -.5, -5/16, 5/16, -1/16, 5/16}, {color_light_blue=1, flammable=1}, true},
	{"purple_allium", S("Purple Allium"), {-2/16, -.5, -2/16, 2/16, 3/16, 2/16}, {color_violet=1, flammable=1}}
}

for _,item in pairs(flowers.datas) do
	add_simple_flower(unpack(item))
end

add_simple_flower("lantana", S("Lantana"), {-5/16, -.5, -5/16, 5/16, -1/16, 5/16}, {color_magenta=1, flammable=1})
add_simple_flower("oxeye_daisy", S("Ox Eye Daisy"), {-5/16, -.5, -5/16, 5/16, -1/16, 5/16}, {color_white=1, flammable=1})

-- Attack heal override
core.override_item("flowers:lion_tooth", {
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(.3, .5))
	end,
	on_timer = default.attack_heal,
})


-- Flower spread, also crystal and fire flower regeneration
-- Public function to enable override by mods

function flowers.flower_spread(pos, node)
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
	pos.y = pos.y - 1
	local under = core.get_node(pos)
	pos.y = pos.y + 1
	-- Replace flora with dry shrub on desert sand and silver sand,
	-- as this is the only way to generate them.
	-- However, preserve grasses in sand dune biomes.
	if core.get_item_group(under.name, "sand") == 1 and under.name ~= "default:sand" then
		core.set_node(pos, {name = "default:dry_shrub"})
		return
	end

	if core.find_node_near(pos, 2, "ignore") then
		return
	end

	if core.get_item_group(under.name, "soil") == 0 then
		if node.name ~= "ethereal:dry_shrub" and under.name ~= "ethereal:dry_dirt_with_fiery_grass" then
			return
		end
	end

	local light = core.get_node_light(pos)
	if not light or light < 13 then
		return
	end

	local pos0 = vector.subtract(pos, 4)
	local pos1 = vector.add(pos, 4)
	-- Testing shows that a threshold of 3 results in an appropriate maximum
	-- density of approximately 7 flora per 9x9 area.
	local num = #core.find_nodes_in_area(pos0, pos1, "group:flora")
	local grass = core.find_nodes_in_area(pos0, pos1, "default:frost_grass")
	local shrub = core.find_nodes_in_area(pos0, pos1, "ethereal:dry_shrub")
	if num > 3 and node.name == "default:frost_grass" then
		if #grass > 4 and not core.find_node_near(pos, 4, "default:crystal_spike") then
			pos = grass[math.random(#grass)]
			pos.y = pos.y - 1

			if core.get_node(pos).name == "default:dirt_with_blue_moss" then
				pos.y = pos.y + 1
				core.set_node(pos, {name = "default:crystal_spike"})
				core.get_node_timer(pos):start(math.random(12, 24))
			end
		end
		return

	elseif num > 3 and node.name == "ethereal:dry_shrub" then
		if #shrub > 8 and not core.find_node_near(pos, 4, "ethereal:fire_flower") then
			pos = shrub[math.random(#shrub)]
			pos.y = pos.y - 1

			if core.get_node(pos).name == "ethereal:dry_dirt_with_fiery_grass" then
				pos.y = pos.y + 1
				core.set_node(pos, {name = "ethereal:fire_flower"})
			end
		end
		return

	elseif #core.find_nodes_in_area(pos0, pos1, "group:water_flora") > 4 and core.get_item_group(node.name, "water_flora") > 0 then
		return

	elseif #core.find_nodes_in_area(pos0, pos1, "default:poison_ivy_3") > 3 and node.name == "default:poison_ivy_3" then
		return

	elseif num > 3 and core.get_item_group(node.name, "water_flora") == 0 and node.name ~= "default:poison_ivy_3" then
		return
	end

	local soils = core.find_nodes_in_area_under_air(pos0, pos1, "group:soil")
	if node.name == "ethereal:dry_shrub" then
		soils = core.find_nodes_in_area_under_air(pos0, pos1, "ethereal:dry_dirt_with_fiery_grass")
	end
	local num_soils = #soils
	if num_soils >= 1 then
		for si = 1, math.min(3, num_soils) do
			local soil = soils[math.random(num_soils)]
			local soil_name = core.get_node(soil).name
			local soil_above = {x = soil.x, y = soil.y + 1, z = soil.z}
			light = core.get_node_light(soil_above)
			if light and light >= 13 and soil_name == under.name then -- Only spread to same surface node
				if core.get_item_group(node.name, "water_flora") > 0 and not core.find_node_near(soil, 1, "group:water") then return end
				if node.name == "default:poison_ivy_3" then node.name = "default:poison_ivy_1" end
				if node.name == "ecology:sumbrellia_full" then node.name = "ecology:sumbrellia" end
	-- check altitude for heat and humidity
	if default.h_h_h(soil_above, -31000, -10) then
		if default.h_h_h(soil_above, -10, 110, heat_min, heat_max, humi_min, humi_max) then
			node.name = "default:dry_shrub"
		end
	end
				core.set_node(soil_above, {name = node.name})
				core.get_node_timer(soil_above):start(10)
			end
		end
	end
end

core.register_abm({
	label = "Flower spread",
	nodenames = {"group:flora"},
	interval = 13,
	chance = 300,
	action = function(...)
		flowers.flower_spread(...)
	end,
})


--
-- Mushrooms
--

poisoned = {}

core.register_node("flowers:mushroom_red", { -- Amanita Muscaria (Fly Agaric)
	description = S("Red Mushroom"),
	tiles = {"flowers_mushroom_red.png"},
	inventory_image = "flowers_mushroom_red.png",
	wield_image = "flowers_mushroom_red.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {mushroom = 1, toxic_mushroom = 1, snappy = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_use = core.item_eat(-5),
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, -1/16, .25},
	}
})

core.register_node("flowers:mushroom_white", { -- Amanita Smithiana (Smith's Amanita)
	description = S("White Mushroom"),
	tiles = {"flowers_mushroom_white.png"},
	inventory_image = "flowers_mushroom_white.png",
	wield_image = "flowers_mushroom_white.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {mushroom = 1, toxic_mushroom = 3, snappy = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_use = function(itemstack, user)
		if not poisoned[user:get_player_name()] then
			core.after(10, function(user)
				if user and user:is_player() then
					user:set_hp(0)
				end
			end, user)
			poisoned[user:get_player_name()] = true
		end
		return core.item_eat(5)(itemstack, user)
	end,
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -.5, -3/16, 3/16, 1/16, 3/16},
	}
})

core.register_craftitem("flowers:sinister_bread", {
	description = S("Khorasan Wheat Bread"),
	inventory_image = "farming_wheat_bread.png",
	on_use = function(itemstack, user)
		if not poisoned[user:get_player_name()] then
			core.after(10, function(user)
				if user and user:is_player() then
					user:set_hp(0)
				end
			end, user)
			poisoned[user:get_player_name()] = true
		end
		return core.item_eat(5)(itemstack, user)
	end,
	groups = {flammable = 2, not_in_creative_inventory = 1},
})

core.register_craft({
	type = "shapeless",
	output = "flowers:sinister_bread",
	recipe = {"farming:wheat_bread", "flowers:mushroom_white"}
})

core.register_on_dieplayer(function(player)
	poisoned[player:get_player_name()] = nil
end)
core.register_on_leaveplayer(function(player)
	if poisoned[player:get_player_name()] then 
		player:set_hp(0)
	end
	poisoned[player:get_player_name()] = nil
end)

core.register_node("flowers:mushroom_brown", { -- Agaricus Bisporus
	description = S("Brown Mushroom (Portobello)"),
	tiles = {"flowers_mushroom_brown.png"},
	inventory_image = "flowers_mushroom_brown.png",
	wield_image = "flowers_mushroom_brown.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {mushroom = 1, food_mushroom = 1, snappy = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_use = core.item_eat(1),
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -.5, -3/16, 3/16, -2/16, 3/16},
	}
-- Cremini	visual_scale = .8	^[colorize:orange:20	{-2/16, -.5, -2/16, 2/16, -.25, 2/16}
-- Baby Portobello	visual_scale = .6	^[colorize:white:200	{-2/16, -.5, -2/16, 2/16, -5/16, 2/16}
})


-- Mushroom spread and death

function flowers.mushroom_spread(pos, node)
	local light = 3
	local medium = {"group:soil", "group:trunk"}
	if node.name == "caverealms:nether_shroom" and core.get_modpath("nether") then
		light = 7
		medium = {"nether:sand"}
	end
	if node.name == "caverealms:mycena" or node.name == "caverealms:fungus" then
		light = 7
	end
	if core.get_node_light(pos, .5) > light then
		if core.get_node_light(pos) == 15 then
			core.remove_node(pos)
		end
		return
	end
	local positions = core.find_nodes_in_area_under_air(
		{x = pos.x - 1, y = pos.y - 2, z = pos.z - 1},
		{x = pos.x + 1, y = pos.y + 1, z = pos.z + 1},
		medium)
	if #positions == 0 then
		return
	end
	local pos2 = positions[math.random(#positions)]
	pos2.y = pos2.y + 1
	if core.get_node_light(pos2, .5) <= light then
		core.set_node(pos2, {name = node.name})
	end
end

core.register_abm({
	label = "Mushroom spread",
	nodenames = {"group:mushroom", "caverealms:nether_shroom"},
	interval = 11,
	chance = 150,
	action = function(...)
		flowers.mushroom_spread(...)
	end,
})


-- These are simplified now

core.register_alias("flowers:mushroom_spores_brown", "flowers:mushroom_brown")
core.register_alias("flowers:mushroom_spores_red", "flowers:mushroom_red")
core.register_alias("flowers:mushroom_fertile_brown", "flowers:mushroom_brown")
core.register_alias("flowers:mushroom_fertile_red", "flowers:mushroom_red")
core.register_alias("mushroom:brown_natural", "flowers:mushroom_brown")
core.register_alias("mushroom:red_natural", "flowers:mushroom_red")


--
-- Waterlilies
--

local waterlily_def = {
	description = S("Waterlily"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"flowers_waterlily.png", "flowers_waterlily_bottom.png"},
	inventory_image = "flowers_waterlily.png",
	wield_image = "flowers_waterlily.png",
	use_texture_alpha = "clip",
	liquids_pointable = true,
	walkable = false,
	buildable_to = true,
	floodable = true,
	on_rotate = screwdriver.rotate_simple,
	groups = {snappy = 3, flower = 1, o_w_flora = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	node_placement_prediction = "",
	node_box = {
		type = "fixed",
		fixed = {-.5, -31/64, -.5, .5, -15/32, .5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -.5, -7/16, 7/16, -15/32, 7/16}
	},

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
				core.set_node(pos, {name = "flowers:waterlily" ..
					(def.waving == 3 and "_waving" or ""),
					param2 = math.random(0, 3)})
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
}

local waterlily_waving_def = table.copy(waterlily_def)
waterlily_waving_def.waving = 3
waterlily_waving_def.drop = "flowers:waterlily"
waterlily_waving_def.groups.not_in_creative_inventory = 1

core.register_node("flowers:waterlily", waterlily_def)
core.register_node("flowers:waterlily_waving", waterlily_waving_def)


core.register_node("flowers:giant_waterlily", {
	description = "Giant Waterlily",
	drawtype = "nodebox",
	visual_scale = 2,
	waving = 3,
	tiles = {"flowers_giant_waterlily.png", "flowers_giant_waterlily.png^[transformFY"},
	inventory_image = "flowers_giant_waterlily.png",
	wield_image = "flowers_giant_waterlily.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	liquids_pointable = true,
	on_rotate = screwdriver.rotate_simple,
	groups = {snappy = 3, flower = 1, o_w_flora = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	node_placement_prediction = "",
	node_box = {
		type = "fixed",
		fixed = {-.5, -.23125, -.5, .5, -.23125, .5}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.6, -.5, -.6, .6, -.45, .6},
	},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.45, .5}
	},
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
		local above_pos = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_above = core.get_node_or_nil(above_pos)
		if not node_above then
			core.get_node_timer(pos):start(300)
			return
		end
	if meta:get_int("bloom_ttl") <= 0 then

		local light_level = 12
		if meta:get_int("light_level") > 0 then
			light_level = light_level - (meta:get_int("light_level") * 3)
			meta:set_int("light_level", 0)
		end
		local light = core.get_node_light(above_pos)
		if not light or light < light_level then
			core.get_node_timer(pos):start(300)
			return
		end

		if node_above.name == "air" then
	local p2 = core.get_node(pos).param2
	core.set_node(above_pos, {name = "flowers:giant_waterlily_flower", param2 = p2})
	meta:set_int("bloom_ttl", math.random(6, 9))
		end
	else
		if meta:get_int("bloom_ttl") <= 4 then
	if node_above.name == "flowers:giant_waterlily_flower" then
		core.remove_node(above_pos)
		default.on_water_spread(pos, 2, 12, "", math.random(300, 1500))
	end
		end
		meta:set_int("bloom_ttl", meta:get_int("bloom_ttl")-1)
	end
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
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
				core.set_node(pos, {name = "flowers:giant_waterlily",
					param2 = math.random(0, 3)})
				core.get_node_timer(pos):start(math.random(300, 1500))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end
})

local gwf_wave = nil
if core.settings:get_bool("enable_waving_water") == true then
	gwf_wave = 3
end

core.register_node("flowers:giant_waterlily_flower", {
	description = "Giant Waterlily Flower",
	drawtype = "mesh",
	mesh = "giant_waterlily_flower.obj",
	waving = gwf_wave or 1,
	tiles = {"flowers_giant_waterlily_flower.png"},
	inventory_image = "flowers_giant_waterlily_flower.png",
	wield_image = "flowers_giant_waterlily_flower.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 1,
	walkable = false,
	on_rotate = screwdriver.rotate_simple,
	groups = {snappy = 3, flower = 1, color_pink = 1, flammable = 1, attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -1.5, 5/16, 3/16, -1.2, 11/16}
	},
	on_place = function(itemstack, placer, pointd)
		local pos = pointd.above
		local node = core.get_node(pointd.under)
		local def = core.registered_nodes[node.name]

		if def and def.on_rightclick then
	return def.on_rightclick(pointd.under, node, placer, itemstack, pointd)
		end

		return itemstack
	end
})
