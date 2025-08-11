--
-- Mgv6
--

local function register_mgv6_flower(flower_name)
	core.register_decoration({
		name = "flowers:".. flower_name,
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = .006,
			spread = {x = 100, y = 100, z = 100},
			seed = 436,
			octaves = 3,
			persist = .6
		},
		y_max = 30,
		y_min = 1,
		decoration = "flowers:".. flower_name,
	})
end

local function register_mgv6_mushroom(mushroom_name)
	core.register_decoration({
		name = "flowers:".. mushroom_name,
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = .04,
			spread = {x = 100, y = 100, z = 100},
			seed = 7133,
			octaves = 3,
			persist = .6
		},
		y_max = 30,
		y_min = 1,
		decoration = "flowers:".. mushroom_name,
		spawn_by = "default:beech_trunk",
		num_spawn_by = 1,
	})
end

local function register_mgv6_waterlily()
	core.register_decoration({
		name = "flowers:waterlily",
		deco_type = "simple",
		place_on = {"default:dirt", "default:silt", "default:clay_dirt"},
		sidelen = 16,
		noise_params = {
			offset = -.12,
			scale = .3,
			spread = {x = 100, y = 100, z = 100},
			seed = 33,
			octaves = 3,
			persist = .7
		},
		y_max = 0,
		y_min = 0,
		decoration = "flowers:waterlily_waving",
		param2 = 0,
		param2_max = 3,
		place_offset_y = 1,
	})
end

function flowers.register_mgv6_decorations()
	register_mgv6_flower("rose")
	register_mgv6_flower("tulip")
	register_mgv6_flower("dandelion")
	register_mgv6_flower("geranium")
	register_mgv6_flower("viola")
	register_mgv6_flower("daisy")
	register_mgv6_flower("lion_tooth")

	register_mgv6_mushroom("mushroom_brown")
	register_mgv6_mushroom("mushroom_red")

	register_mgv6_waterlily()
end


--
-- All other biome API mapgens
--

local function register_flower(seed, flower_name)
	core.register_decoration({
		name = "flowers:".. flower_name,
		deco_type = "simple",
		place_on = {"default:dirt_with_grass", "ethereal:grove_dirt"},
		sidelen = 16,
		noise_params = {
			offset = -.02,
			scale = .04,
			spread = {x = 200, y = 200, z = 200},
			seed = seed,
			octaves = 3,
			persist = .6
		},
		biomes = {"grassland", "deciduous_forest", "subtropical_forest"},
		y_max = 109,
		y_min = 1,
		decoration = "flowers:".. flower_name,
	})
end

core.register_decoration({
	name = "flowers:amaryllis",
	deco_type = "simple",
	place_on = {"default:clay_dirt_with_savanna_grass"},
	sidelen = 16,
	noise_params = {
		offset = -.02,
		scale = .04,
		spread = {x = 200, y = 200, z = 200},
		seed = 124,
		octaves = 3,
		persist = .6
	},
	biomes = {"savanna"},
	y_max = 109,
	y_min = 1,
	decoration = "flowers:amaryllis",
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_rainforest_litter"},
	sidelen = 16,
	fill_ratio = .04,
	biomes = {"rainforest"},
	y_max = 109,
	y_min = 1,
	decoration = "flowers:spider_plant",
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "ethereal:grove_dirt"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = .004,
		spread = {x = 100, y = 100, z = 100},
		seed = 7133,
		octaves = 3,
		persist = .6
	},
	y_max = 90,
	y_min = 10,
	decoration = "flowers:delphinium",
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:clay_dirt_with_savanna_grass", "ethereal:grove_dirt"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = .004,
		spread = {x = 100, y = 100, z = 100},
		seed = 7134,
		octaves = 3,
		persist = .6
	},
	y_max = 90,
	y_min = 15,
	decoration = "flowers:thistle",
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:dirt_with_rainforest_litter"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = .01,
		spread = {x = 100, y = 100, z = 100},
		seed = 7135,
		octaves = 3,
		persist = .6
	},
	y_max = 90,
	y_min = 1,
	decoration = "flowers:lazarus",
	spawn_by = "default:jungle_trunk",
	num_spawn_by = 1,
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:sand"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = .009,
		spread = {x = 100, y = 100, z = 100},
		seed = 7136,
		octaves = 3,
		persist = .6
	},
	y_max = 15,
	y_min = 1,
	decoration = "flowers:mannagrass",
	spawn_by = "group:water",
	num_spawn_by = 1,
})

local mushroom_grow_nodes = {"default:dirt", "default:dirt_with_grass", "default:dirt_with_coniferous_litter", "default:dirt_with_rainforest_litter"}
local function register_mushroom(mushroom_name)
	core.register_decoration({
		name = "flowers:".. mushroom_name,
		deco_type = "simple",
		place_on = mushroom_grow_nodes,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = .006,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = .66
		},
		biomes = {"deciduous_forest", "coniferous_forest", "rainforest"},
		y_max = 109,
		y_min = 1,
		decoration = "flowers:".. mushroom_name,
	})
end

local function register_waterlily()
	core.register_decoration({
		name = "default:waterlily",
		deco_type = "simple",
		place_on = {"default:dirt", "default:clay_dirt"},
		sidelen = 16,
		noise_params = {
			offset = -.12,
			scale = .3,
			spread = {x = 200, y = 200, z = 200},
			seed = 33,
			octaves = 3,
			persist = .7
		},
		biomes = {"rainforest_swamp", "savanna_shore", "deciduous_forest_shore"},
		y_max = 0,
		y_min = 0,
		decoration = "flowers:waterlily_waving",
		param2 = 0,
		param2_max = 3,
		place_offset_y = 1,
	})

	core.register_decoration({
		name = "flowers:giant_waterlily",
		deco_type = "simple",
		place_on = {"default:dirt", "default:silt", "default:clay_dirt"},
		sidelen = 16,
		noise_params = {
			offset = .001,
			scale = .002,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = .6
		},
		biomes = {"rainforest_swamp", "savanna_shore", "swamp_shore"},
		y_max = 0,
		y_min = 0,
		decoration = "flowers:giant_waterlily",
		param2 = 0,
		param2_max = 3,
		place_offset_y = 1,
		spawn_by = {"default:dirt", "default:silt", "default:clay_dirt"},
		num_spawn_by = 8,
	})
end

function flowers.register_decorations()
	register_flower(436,     "rose")
	register_flower(19822,   "tulip")
	register_flower(1952,    "tulip_LO")
	register_flower(1220999, "dandelion")
	register_flower(800081,  "chrysanthemum_green")
	register_flower(36662,   "geranium")
	register_flower(1133,    "viola")
	register_flower(73133,   "daisy")
	register_flower(42,      "tulip_black")
	register_flower(438,     "orchide")
	register_flower(73042,   "purple_droops")
	register_flower(1220222, "lion_tooth")
	register_flower(98,      "pansy_purple")
	register_flower(98,      "pansy_blue")
	register_flower(95,      "petunia_blue")
	register_flower(97,      "petunia_pink")
	register_flower(96,      "petunia_white")
	register_flower(126,     "lavender")
	register_flower(146,     "flame_lily")
	register_flower(3653,    "foxglove_pink")
	register_flower(2653,    "foxglove_purple")

	register_mushroom("mushroom_brown")
	register_mushroom("mushroom_red")

	register_waterlily()
end


--
-- Detect mapgen to select functions
--

local mg_name = core.get_mapgen_setting("mg_name")
if mg_name == "v6" then
	flowers.register_mgv6_decorations()
	core.register_decoration({
		deco_type = "simple",
		place_on = mushroom_grow_nodes,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = .04,
			spread = {x = 100, y = 100, z = 100},
			seed = 7133,
			octaves = 3,
			persist = .6
		},
		biomes = {"rainforest", "deciduous_forest", "coniferous_forest"},
		y_max = 30,
		y_min = 1,
		decoration = "flowers:mushroom_white",
		spawn_by = "group:trunk",
		num_spawn_by = 1,
	})
else
	flowers.register_decorations()
	core.register_decoration({
		deco_type = "simple",
		place_on = mushroom_grow_nodes,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = .006,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = .66
		},
		biomes = {"rainforest", "deciduous_forest", "coniferous_forest"},
		y_max = 109,
		y_min = 1,
		decoration = "flowers:mushroom_white",
	})
end


-- get decoration ID
local liontooth = core.get_decoration_id("flowers:lion_tooth")
core.set_gen_notify({decoration = true}, {liontooth})

-- start nodetimers
core.register_on_generated(function(minp, maxp, blockseed)
	local gennotify = core.get_mapgen_object("gennotify")
	local poslist = {}

	for _, pos in ipairs(gennotify["decoration#".. liontooth] or {}) do
		local liontooth_pos = {x = pos.x, y = pos.y + 1, z = pos.z}
		table.insert(poslist, liontooth_pos)
	end

	if #poslist ~= 0 then
		for i = 1, #poslist do
			local pos = poslist[i]
			core.get_node_timer(pos):start(1)
		end
	end
end)
