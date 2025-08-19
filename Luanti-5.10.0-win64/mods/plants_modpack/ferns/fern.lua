
--[[ Ferns - Fern

	by Mossmanikin
	Contains code from:		biome_lib
	Looked at code from:	default, flowers, painting, trees
	Dependencies:			biome_lib

	some inspiration from here
	https://en.wikipedia.org/wiki/Athyrium_yokoscense
	http://www.mygarden.net.au/gardening/athyrium-yokoscense/3900/1
]]

assert(abstract_ferns.config.enable_lady_fern == true)

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
local nodenames = {"default:fern_1", "default:fern_2", "default:fern_3"}

-- Spawning
if abstract_ferns.config.lady_ferns_near_tree == true then
	biome_lib:register_generate_plant({ -- near trees (woodlands)
		surface = {
			"default:dirt_with_grass",
			"default:mossycobble",
			"default:desert_sand",
			"default:sand",
			"default:jungle_trunk"
		},
		max_count = 30,
		rarity = 62,--63,
		min_elevation = 1, -- above sea level
		near_nodes = {"group:trunk"},
		near_nodes_size = 3,--4,
		near_nodes_vertical = 2,--3,
		near_nodes_count = 1,
		plantlife_limit = -0.9,
		humidity_max = -1.0,
		humidity_min = 0.4,
		temp_max = -0.5, -- 55 °C (too hot?)
		temp_min = 0.75, -- -12 °C
	},
	nodenames
	)
end

if abstract_ferns.config.lady_ferns_near_rock == true then
	biome_lib:register_generate_plant({ -- near stone (mountains)
		surface = {
			"default:dirt_with_grass",
			"default:mossycobble",
			"group:falling_node"
		},
		max_count = 35,
		rarity = 40,
		min_elevation = 1, -- above sea level
		near_nodes = {"group:stone"},
		near_nodes_size = 1,
		near_nodes_count = 16,
		plantlife_limit = -0.9,
		humidity_max = -1.0,
		humidity_min = 0.4,
		temp_max = -0.5, -- 55 °C (too hot?)
		temp_min = 0.75, -- -12 °C
	},
	nodenames
	)
end

if abstract_ferns.config.lady_ferns_near_ores == true then -- this one causes a huge fps drop
	biome_lib:register_generate_plant({ -- near ores (potential mining sites)
		surface = {
			"default:dirt_with_grass",
			"default:mossycobble",
			"default:stone_with_coal",
			"default:stone_with_iron",
			"default:stone_with_tin",
			"default:stone_with_silver"
		},
		max_count = 1200,--1600, -- maybe too much? :D
		rarity = 25,--15,
		min_elevation = 1, -- above sea level
		near_nodes = {
			"default:stone_with_iron",
			"default:stone_with_tin",
			"default:stone_with_silver"
		},
		near_nodes_size = 2,
		near_nodes_vertical = 4,--5,--6,
		near_nodes_count = 2,--3,
		plantlife_limit = -0.9,
		humidity_max = -1.0,
		humidity_min = 0.4,
		temp_max = -0.5, -- 55 °C (too hot?)
		temp_min = 0.75, -- -12 °C
	},
	nodenames
	)
end

if abstract_ferns.config.lady_ferns_in_groups == true then -- this one is meant as a replacement of Ferns_near_Ores
	biome_lib:register_generate_plant({
		surface = {
			"default:dirt_with_grass",
			"default:mossycobble",
			"default:stone_with_coal",
			"default:stone_with_iron",
			"default:stone_with_tin",
			"default:stone_with_silver"
		},
		max_count = 70,
		rarity = 25,--15,
		min_elevation = 1, -- above sea level
		near_nodes = {"default:stone"},
		near_nodes_size = 2,
		near_nodes_vertical = 2,--6,
		near_nodes_count = 3,
		plantlife_limit = -0.9,
		humidity_max = -1.0,
		humidity_min = 0.4,
		temp_max = -0.5, -- 55 °C (too hot?)
		temp_min = 0.75, -- -12 °C
	},
	nodenames
	)
end
end
