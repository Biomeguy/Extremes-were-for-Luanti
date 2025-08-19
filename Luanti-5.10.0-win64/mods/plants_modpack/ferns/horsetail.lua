
--[[ Archae Plantae - Horsetail

	by Mossmanikin
	Contains code from:		biome_lib
	Looked at code from:	default, flowers, trees
	Dependencies:			biome_lib
]]

assert(abstract_ferns.config.enable_horsetails == true)

-- support for i18n
local S = core.get_translator("ferns")

-- HORSETAIL  (EQUISETUM)

local node_names = {}

local function create_nodes()
	local selection_boxes = {
		{ -.15, -.5, -.15, .15, -1/16, .15 },
		{ -.15, -.5, -.15, .15, 1/16, .15 },
		{ -.15, -.5, -.15, .15, 4/16, .15 },
		{ -.15, -.5, -.15, .15, .4, .15 },
	}

	for i = 1, 4 do
		local node_name = "ferns:horsetail_" .. string.format("%02d", i)
		local node_img = "ferns_horsetail_" .. string.format("%02d", i) .. ".png"
		local node_desc
		local node_on_use = nil
		local node_drop = "ferns:horsetail_04"

		if i == 1 then
			node_desc = S("Young Horsetail (Equisetum)")
			node_on_use = core.item_eat(1) -- young ones edible https://en.wikipedia.org/wiki/Equisetum
			node_drop = node_name
		elseif i == 4 then
			node_desc = S("Horsetail (Equisetum)")
		else
			node_desc = S("Horsetail (Equisetum)").." ".. string.format("%02d", i)
		end

		node_names[i] = node_name

		core.register_node(node_name, {
			description = node_desc,
			drawtype = "plantlike",
			paramtype = "light",
			tiles = { node_img },
			inventory_image = node_img,
			waving = 1,
			sunlight_propagates = true,
			walkable = false,
			buildable_to = true,
			selection_box = {
				type = "fixed",
				fixed = selection_boxes[i],
			},
			on_use = node_on_use,
			drop = node_drop,
			groups = {snappy = 3, flammable = 2, attached_node = 1, horsetail = 1},
			sounds = default.node_sound_leaves_defaults(),
		})
	end
end

core.register_node("ferns:fern_horsetails", {
	description = S("Horsetails (Equisetum)"),
	drawtype = "plantlike",
	tiles = {"ferns_horsetails.png"},
	inventory_image = "ferns_horsetails.png",
	paramtype = "light",
	waving = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -.5, -5/16, 5/16, .4, 5/16},
	},
	groups = {snappy = 3, flammable = 2, plant = 1, attached_node = 1, flora = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-- Init
create_nodes()

if core.get_modpath("biome_lib") then

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
-- Spawning
if abstract_ferns.config.enable_horsetails_spawning == true then
	biome_lib:spawn_on_surfaces({
		spawn_delay = 1200,
		spawn_plants = node_names,
		spawn_chance = 400,
		spawn_surfaces = {
			"default:dirt_with_grass",
			"default:dirt_with_coniferous_litter",
			"default:desert_sand",
			"default:sand",
			"dryplants:grass_short",
			"default:mossycobble",
			"default:gravel"
		},
		seed_diff = 329,
		min_elevation = 1, -- above sea level
		near_nodes = {"default:water_source","default:fresh_water_source","default:gravel"},
		near_nodes_size = 2,
		near_nodes_vertical = 1,
		near_nodes_count = 1,
	})
end

-- Generating
if abstract_ferns.config.enable_horsetails_on_grass == true then
	biome_lib:register_generate_plant({
		surface = {
			"default:dirt_with_grass",
			"default:dirt_with_coniferous_litter"
		},
		max_count = 35,
		rarity = 40,
		min_elevation = 1, -- above sea level
		near_nodes = {
			"group:water", -- likes water (of course)
			"default:gravel", -- near those on gravel
			"default:sand", -- some like sand
			"default:clay", -- some like clay
			"default:mossycobble",
			"default:cobble"
		},
		near_nodes_size = 3,
		near_nodes_vertical = 2,--3,
		near_nodes_count = 1,
		plantlife_limit = -0.9,
		humidity_min = 0.4,
		temp_max = -0.5, -- 55 °C
		temp_min = 0.53, -- 0 °C, dies back in winter
	},
	node_names
	)
end

if abstract_ferns.config.enable_horsetails_on_stones == true then
	biome_lib:register_generate_plant({
		surface = {
			"default:gravel", -- roots go deep
			"default:mossycobble"
		},
		max_count = 35,
		rarity = 20,
		min_elevation = 1, -- above sea level
		plantlife_limit = -0.9,
		humidity_min = 0.4,
		temp_max = -0.5, -- 55 °C
		temp_min = 0.53, -- 0 °C, dies back in winter
	},
	node_names
	)
end
end
	end
