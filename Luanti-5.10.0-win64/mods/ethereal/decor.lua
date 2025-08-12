
-- helper function
local add_node = function(a, b, c, d, e, f, g, h, i, j)

	if j ~= 1 then return end

	core.register_decoration({
		deco_type = "simple",
		place_on = a,
		sidelen = 80,
		fill_ratio = b,
		biomes = c,
		y_min = d,
		y_max = e,
		decoration = f,
		height_max = g,
		spawn_by = h,
		num_spawn_by = i,
	})
end


--firethorn shrub
add_node({"default:snow_block"}, 0.001, {"icesheet"}, 1, 30, {"ethereal:firethorn"}, nil, nil, nil, ethereal.glacier)

-- scorched tree
add_node({"default:dry_dirt"}, 0.006, {"scorched"}, 1, 100, {"ethereal:scorched_trunk"}, 6, nil, nil, ethereal.scorched)

-- dry shrub
add_node({"default:dry_dirt"}, 0.015, {"scorched"}, 1, 100, {"default:dry_shrub"}, nil, nil, nil, ethereal.scorched)

-- healing flower
if ethereal.swamp == 1 then
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_swamp_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = -0.002,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"swamp"},
	y_min = 2,
	y_max = 31000,
	decoration = {"ethereal:healing_flower"},
})
end

-- red shrub
add_node({"ethereal:dry_dirt_with_fiery_grass"}, 0.1, {"fiery"}, 1, 100, {"ethereal:dry_shrub"}, nil, nil, nil, ethereal.fiery)

-- snowy grass
add_node({"default:gravel", "default:dirt_with_snow"}, 0.002, {"tundra_beach", "taiga"}, 1, 100,
	{"ethereal:snowygrass"}, nil, nil, nil, ethereal.snowy)

-- wild red and brown mushrooms
local list = {
	{"rainforest", {"default:dirt_with_rainforest_litter"}, ethereal.junglee},
	{"subtropical_forest", {"ethereal:grove_dirt"}, ethereal.grassy},
	{"swamp", {"default:dirt_with_swamp_grass"}, ethereal.swamp},
}
for _, row in pairs(list) do
if row[3] == 1 then
core.register_decoration({
	deco_type = "simple",
	place_on = row[2],
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.009,
		spread = {x = 200, y = 200, z = 200},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {row[1]},
	y_min = 1,
	y_max = 120,
	decoration = {"flowers:mushroom_brown", "flowers:mushroom_red"},
})
end end

-- ferns
add_node({"ethereal:grove_dirt"}, 0.2, {"rainforest"}, 1, 100, {"ethereal:fern"}, nil, nil, nil, ethereal.grove)
add_node({"default:dirt_with_swamp_grass"}, 0.1, {"swamp"}, 1, 100, {"ethereal:fern"}, nil, nil, nil, ethereal.swamp)

add_node({"ethereal:grove_dirt"}, .05, {"rainforest"}, 1, 100, {"ethereal:feather_fern"}, nil, nil, nil, ethereal.grove)

-- reed
add_node({"default:dirt_with_rainforest_litter", "ethereal:grove_dirt"}, 0.1, {"rainforest"}, 1, 1, {"default:reed"}, 4, "group:water", 1, ethereal.junglee)
add_node({"default:dirt_with_swamp_grass"}, 0.1, {"swamp"}, 1, 1, {"default:reed"}, 4, "group:water", 1, ethereal.swamp)

-- melon
add_node({"default:dirt_with_swamp_grass"}, 0.015, {"swamp"}, 2, 5, {"farming:melon_S6"}, nil, "group:water", 1, ethereal.swamp)

-- sponge
if ethereal.sealife == 1 then
core.register_decoration({
	deco_type = "simple",
	place_on = "default:sand",
	sidelen = 80,
	fill_ratio = .01,
	y_max = -5,
	y_min = -100,
	decoration = "ethereal:sponge_wet",
	flags = "force_placement",
})
end

-- icecles under ice
core.register_decoration({
	name = "ethereal:icecles",
	deco_type = "simple",
	place_on = {"default:cave_ice"},
	sidelen = 80,
	fill_ratio = .36,
	biomes = {"icesheet"},
	y_max = 31000,
	y_min = -33,
	decoration = {"ethereal:icecle_1", "ethereal:icecle_2", "ethereal:icecle_3", "ethereal:icecle_4", "ethereal:icecle_5"},
    flags = "all_ceilings",
})

core.register_on_generated(function(minp, maxp)
	if maxp.y > -9 and maxp.y < 139 then-- Vine spawning in swamps and rainforests
local spot = core.find_nodes_in_area(minp, maxp, {"default:mangrove_leaves", "default:jungle_leaves"})
for n = 1, #spot do
	local pos = {x = spot[n].x, y = spot[n].y, z = spot[n].z}
	if core.get_node({x=pos.x-1, y=pos.y, z=pos.z}).name == "air" and math.random(50) == 1 then
		core.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name = "ethereal:vine", param2 = 2})
		core.get_node_timer({x=pos.x-1, y=pos.y, z=pos.z}):start(math.random(15, 30))
	end
	if core.get_node({x=pos.x+1, y=pos.y, z=pos.z}).name == "air" and math.random(50) == 1 then
		core.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name = "ethereal:vine", param2 = 3})
		core.get_node_timer({x=pos.x+1, y=pos.y, z=pos.z}):start(math.random(15, 30))
	end
	if core.get_node({x=pos.x, y=pos.y, z=pos.z-1}).name == "air" and math.random(50) == 1 then
		core.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name = "ethereal:vine", param2 = 4})
		core.get_node_timer({x=pos.x, y=pos.y, z=pos.z-1}):start(math.random(15, 30))
	end
	if core.get_node({x=pos.x, y=pos.y, z=pos.z+1}).name == "air" and math.random(50) == 1 then
		core.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name = "ethereal:vine", param2 = 5})
		core.get_node_timer({x=pos.x, y=pos.y, z=pos.z+1}):start(math.random(15, 30))
	end
end
	end
	if minp.y > -30 or maxp.y < -3000 then-- Generate Illumishroom in caves on top of coal
		return
	end
	local bpos
	local coal = core.find_nodes_in_area_under_air(minp, maxp, "default:stone_with_coal")

	for n = 1, #coal do
		if math.random(2) == 1 then
			bpos = {x = coal[n].x, y = coal[n].y + 1, z = coal[n].z}

			if bpos.y > -3000 and bpos.y < -2000 then
				core.swap_node(bpos, {name = "ethereal:illumishroom3"})

			elseif bpos.y > -2000 and bpos.y < -1000 then
				core.swap_node(bpos, {name = "ethereal:illumishroom2"})

			elseif bpos.y > -1000 and bpos.y < -30 then
				core.swap_node(bpos, {name = "ethereal:illumishroom"})
			end
		end
	end
end)

if core.get_modpath("es") and ethereal.scorched == 1 then
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dry_dirt"},
	place_offset_y = -1,
	sidelen = 80,
	fill_ratio = 0.005,
	biomes = {"scorched"},
	y_max = 1140,
	y_min = 2,
	decoration = "es:toxic_water_source",
	flags = "force_placement",
})
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dry_dirt"},
	sidelen = 16,
	fill_ratio = 0.1,
	biomes = {"scorched"},
	y_max = 31000,
	y_min = 1,
	decoration = "es:radia_grass",
})
end
