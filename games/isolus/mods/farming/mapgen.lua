
-- decoration function
local function register_plant(name, min, max, spawnon, spawnby, num)

	core.register_decoration({
		deco_type = "simple",
		place_on = spawnon or {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.009,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_min = min,
		y_max = max,
		decoration = "farming:" .. name,
		spawn_by = spawnby,
		num_spawn_by = num,
	})
end

local surface1 = {"default:dirt_with_grass", "ethereal:grove_dirt"}
local surface2 = {"default:dirt_with_grass", "default:dirt_with_rainforest_litter", "ethereal:grove_dirt"}
local surface3 = {"default:dirt_with_rainforest_litter", "ethereal:grove_dirt"}
local surface4 = {"default:dirt_with_rainforest_litter", "default:clay_dirt_with_savanna_grass"}

-- add crops to mapgen
register_plant("potato_S3", 15, 40, surface2, "", -1)
register_plant("tomato_S8", 5, 20, surface2, "", -1)
register_plant("teosinte_S8", 12, 22, surface3, "", -1)
register_plant("coffee_S5", 20, 45, surface4, "", -1)
register_plant("raspberry_S6", 3, 10, nil, "", -1)
register_plant("blackberry_S6", 3, 10, nil, "", -1)
register_plant("rhubarb_S4", 3, 15, nil, "", -1)
register_plant("blueberry_S7", 3, 10, nil, "", -1)
register_plant("huckleberry_S6", 3, 10, nil, "", -1)
register_plant("bean_bush", 18, 35, surface1, "", -1)
register_plant("grape_bush", 25, 45, surface2, "", -1)
register_plant("onion_S4", 5, 22, surface2, "", -1)
register_plant("wild_chive", 5, 22, surface2, "", -1)
register_plant("wild_green_onion", 5, 22, surface2, "", -1)
register_plant("leek_S6", 5, 22, surface2, "", -1)
register_plant("garlic_S6", 3, 30, nil, "group:trunk", 1)
register_plant("hemp_S7", 3, 45, surface2, "group:trunk", 1)
register_plant("pea_S8", 25, 50, nil, "", -1)
register_plant("red_beet_S6", 1, 15, nil, "", -1)
register_plant("sugar_beet_S6", 1, 15, nil, "", -1)
register_plant("raddish_S5", 1, 35, nil, "", -1)
register_plant("wild_quinoa", 1, 15, surface2, "", -1)
register_plant("chili_S8", 5, 35, surface3, "group:trunk", 1)
register_plant("habanero_S8", 5, 35, surface3, "group:trunk", 1)
register_plant("sweet_pepper_S10", 5, 35, surface3, "group:trunk", 1)
register_plant("parsley_S5", 5, 35, surface3, "", -1)
register_plant("cilantro_S5", 5, 35, surface3, "", -1)
register_plant("rosemary_S3", 5, 20, surface2, "", -1)
register_plant("alfalfa_S8", 5, 35, {"default:dirt_with_grass",
	"default:dirt_with_rainforest_litter", "default:clay_dirt_with_savanna_grass", "ethereal:grove_dirt"}, "", 1)
register_plant("iceberg_lettuce_S4", 3, 25, surface2, "", -1)
register_plant("romaine_lettuce_S4", 16, 45, surface2, "", -1)
register_plant("pineapple_S10", 18, 30, surface4, "", -1)
register_plant("strawberry_S10", 1, 95, surface2, "", -1)
register_plant("mint_S5", 1, 75, {"default:dirt_with_grass", "default:dirt_with_coniferous_litter", "ethereal:grove_dirt"}, "", -1)
register_plant("rice_bush", 1, 15, {"default:dirt_with_rainforest_litter", "default:dirt_with_swamp_grass", "ethereal:grove_dirt"}, "group:water", 1)
register_plant("amaranth_S6", 8, 22, surface3, "", -1)
register_plant("amaranth2_S6", 8, 22, surface3, "", -1)
register_plant("artichoke_S6", 6, 30, surface4, "", -1)
register_plant("asparagus_S7", 5, 20, surface2, "", -1)
register_plant("blackcurrant_S7", 5, 20, surface2, "", -1)
register_plant("cauliflower_S9", 5, 20, surface2, "", -1)
register_plant("kohlrabi_S6", 5, 20, surface2, "", -1)
register_plant("celery_S5", 5, 20, nil, "", -1)
register_plant("sunflower_S10", 5, 20, surface2, "", -1)
register_plant("ginger_S6", 8, 22, surface3, "", -1)
register_plant("gooseberry_S8", 8, 22, surface3, "", -1)
register_plant("mustard_S7", 8, 22, surface3, "", -1)
register_plant("peanut_S6", 8, 22, surface3, "", -1)
register_plant("peppercorn_bush", 8, 22, surface3, "", -1)
register_plant("tea_S5", 18, 85, surface3, "", -1)
register_plant("vanillabush", 5, 35, surface3, "group:trunk", 1)
register_plant("turmeric_S7", 8, 22, surface3, "", -1)
register_plant("zucchini_S8", 5, 30, surface2, "", -1)


local mg_name = core.get_mapgen_setting("mg_name")

if mg_name == "v6" then

	register_plant("wildcarrot_S8", 1, 30, nil, "group:water", 1)
	register_plant("cucumber_S7", 1, 20, nil, "group:water", 1)
	register_plant("melon_S7", 1, 20, nil, "group:water", 1)
	register_plant("pumpkin_S8", 1, 20, nil, "group:water", 1)
	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 368,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "farming:wildcarrot_S8",
	})
else
	-- v7 maps have a beach so plants growing near water is limited to 6 high
	register_plant("wildcarrot_S8", 1, 15, nil, "", -1)
	register_plant("cucumber_S7", 1, 10, nil, "", -1)
	register_plant("melon_S7", 1, 6, {"default:clay_dirt_with_savanna_grass", "default:dirt_with_rainforest_litter", "default:dirt_with_swamp_grass"}, "", -1)
	register_plant("pumpkin_S8", 1, 6, nil, "", -1)
	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.015,
			scale = 0.025,
			spread = {x = 200, y = 200, z = 200},
			seed = 368,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland", "deciduous_forest", "coniferous_forest"},
		y_max = 109,
		y_min = 1,
		decoration = "farming:wildcarrot_S8",
	})
	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_rainforest_litter", "ethereal:grove_dirt", "default:dirt_with_grass"},
		sidelen = 16,
		fill_ratio = .001,
		biomes = {"rainforest"},
		y_max = 109,
		y_min = 1,
		decoration = "farming:teosinte_S8",
	})
end

if mg_name ~= "v6" and mg_name ~= "singlenode" then
	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 32,
		y_min = 1,
		schematic = farming.avocado_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0005,
			scale = 0.00005,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_max = 53,
		y_min = 1,
		schematic = farming.cherry_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 64,
		y_min = 1,
		schematic = farming.cinnamon_tree2,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 32,
		y_min = 1,
		schematic = farming.cocoa_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 32,
		y_min = 1,
		schematic = farming.fig_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface2,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"deciduous_forest", "subtropical_forest"},
		y_max = 64,
		y_min = 1,
		schematic = farming.hazelnut_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 32,
		y_min = 1,
		schematic = farming.lemon_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 32,
		y_min = 1,
		schematic = farming.lime_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 32,
		y_min = 1,
		schematic = farming.mandarin_tree,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 32,
		y_min = 1,
		schematic = farming.mango_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface2,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"deciduous_forest", "subtropical_forest"},
		y_max = 64,
		y_min = 1,
		schematic = farming.mirabelle_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 32,
		y_min = 1,
		schematic = farming.nutmeg_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 32,
		y_min = 1,
		schematic = farming.olive_tree,
		flags = "place_center_x, place_center_z",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 32,
		y_min = 1,
		schematic = farming.peach_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 32,
		y_min = 1,
		schematic = farming.pear_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 32,
		y_min = 1,
		schematic = farming.pecan_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 32,
		y_min = 1,
		schematic = farming.plum_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface3,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 32,
		y_min = 1,
		schematic = farming.pomegranate_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = surface2,
		sidelen = 16,
		fill_ratio = .00004,
		biomes = {"deciduous_forest", "rainforest", "subtropical_forest"},
		y_max = 64,
		y_min = 1,
		schematic = farming.walnut_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

core.register_decoration({
	name = "farming:date_palm_sapling",
	deco_type = "simple",
	place_on = {"default:desert_sand"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = -0.002,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"desert"},
	y_max = 60,
	y_min = 1,
	decoration = "farming:date_palm_sapling",
})

-- get decoration ID
local datepalm = core.get_decoration_id("farming:date_palm_sapling")
core.set_gen_notify({decoration = true}, {datepalm})

-- start nodetimers
core.register_on_generated(function(minp, maxp, blockseed)
	local gennotify = core.get_mapgen_object("gennotify")
	local poslist = {}

	for _, pos in ipairs(gennotify["decoration#".. datepalm] or {}) do
		local datepalm_pos = {x = pos.x, y = pos.y + 1, z = pos.z}
		table.insert(poslist, datepalm_pos)
	end

	if #poslist ~= 0 then
		for i = 1, #poslist do
			local pos = poslist[i]
			core.get_node_timer(pos):start(1)
		end
	end
end)

core.register_decoration({
	name = "farming:cotton_wild",
	deco_type = "simple",
	place_on = {"default:clay_dirt_with_savanna_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.1,
		scale = 0.1,
		spread = {x = 50, y = 50, z = 50},
		seed = 4242,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"savanna"},
	y_max = 109,
	y_min = 1,
	decoration = "farming:cotton_wild",
})
