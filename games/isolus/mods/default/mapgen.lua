--
-- Aliases for map generators
--

-- All mapgens

core.register_alias("mapgen_stone", "default:stone")
core.register_alias("mapgen_water_source", "default:water_source")
core.register_alias("mapgen_river_water_source", "default:fresh_water_source")

-- Additional aliases needed for mapgen v6

core.register_alias("mapgen_lava_source", "default:lava_source")
core.register_alias("mapgen_dirt", "default:dirt")
core.register_alias("mapgen_dirt_with_grass", "default:dirt_with_grass")
core.register_alias("mapgen_sand", "default:sand")
core.register_alias("mapgen_gravel", "default:gravel")
core.register_alias("mapgen_desert_stone", "default:desert_stone")
core.register_alias("mapgen_desert_sand", "default:desert_sand")
core.register_alias("mapgen_dirt_with_snow", "default:dirt_with_snow")
core.register_alias("mapgen_snowblock", "default:snow_block")
core.register_alias("mapgen_snow", "default:snow")
core.register_alias("mapgen_ice", "default:ice")

core.register_alias("mapgen_tree", "default:apple_trunk")
core.register_alias("mapgen_leaves", "default:apple_leaves")
core.register_alias("mapgen_apple", "default:apple_leaves_fruiting")
core.register_alias("mapgen_jungletree", "default:jungle_trunk")
core.register_alias("mapgen_jungleleaves", "default:jungle_leaves")
core.register_alias("mapgen_junglegrass", "default:jungle_grass_3")
core.register_alias("mapgen_pine_tree", "default:pine_trunk")
core.register_alias("mapgen_pine_needles", "default:pine_needles")

core.register_alias("mapgen_cobble", "default:cobble")
core.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")
core.register_alias("mapgen_mossycobble", "default:mossycobble")
core.register_alias("mapgen_stair_desert_stone", "stairs:stair_desert_stone")


--
-- Register ores
--

local y_height_min = -30911
if core.get_modpath("nether") then
if core.get_modpath("nssm") then
y_height_min = -24736
else
y_height_min = -24910
end
elseif core.get_modpath("nssm") then
y_height_min = -30748
end

local chromium_params = {
	offset = 0,
	scale = 1,
	spread = {x = 100, y = 100, z = 100},
	seed = 421,
	octaves = 3,
	persist = 0.7
}

local zinc_params = {
	offset = 0,
	scale = 1,
	spread = {x = 100, y = 100, z = 100},
	seed = 422,
	octaves = 3,
	persist = 0.7
}

-- Mgv6

function default.register_mgv6_ores()

	-- Blob ore
	-- These first to avoid other ores in blobs

	-- Clay
	-- This first to avoid clay in sand blobs

	core.register_ore({
		ore_type        = "blob",
		ore             = "default:clay",
		wherein         = {"default:sand"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 0,
		y_min           = -15,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Sand

	core.register_ore({
		ore_type        = "blob",
		ore             = "default:sand",
		wherein         = {"default:stone", "default:desert_stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 0,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 2316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Dirt

	core.register_ore({
		ore_type        = "blob",
		ore             = "default:dirt",
		wherein         = {"default:stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Gravel

	core.register_ore({
		ore_type        = "blob",
		ore             = "default:gravel",
		wherein         = {"default:stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Scatter ores

	-- Coal

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_coal",
		wherein        = "default:stone",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 9,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_coal",
		wherein        = "default:stone",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_max          = 64,
		y_min          = -31000,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_coal",
		wherein        = "default:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_max          = 0,
		y_min          = -31000,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:desert_stone_with_coal",
		wherein        = "default:desert_stone",
		clust_scarcity = 6 * 6 * 6,
		clust_num_ores = 9,
		clust_size     = 6,
		y_max          = 200,
		y_min          = -31000,
	})

	-- Sulfur
	local sulfur_buf = {}
	local sulfur_noise

	core.register_on_generated(function(minp, maxp)
		local vm, emin, emax = core.get_mapgen_object("voxelmanip")
		local a = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local data = vm:get_data(sulfur_buf)
		local pr = PseudoRandom(17 * minp.x + 42 * minp.y + 101 * minp.z)
		sulfur_noise = sulfur_noise or core.get_perlin(9876, 3, 0.5, 100)

		local c_lava = core.get_content_id("default:lava_source")
		local c_lava_flowing = core.get_content_id("default:lava_flowing")
		local c_stone = core.get_content_id("default:stone")
		local c_sulfur = core.get_content_id("default:stone_with_sulfur")

		local grid_size = 5
		for x = minp.x + math.floor(grid_size / 2), maxp.x, grid_size do
		for y = minp.y + math.floor(grid_size / 2), maxp.y, grid_size do
		for z = minp.z + math.floor(grid_size / 2), maxp.z, grid_size do
			local c = data[a:index(x, y, z)]
			if (c == c_lava or c == c_lava_flowing)
			and sulfur_noise:get_3d({x = x, y = z, z = z}) >= 0.4 then
				for i in a:iter(
					math.max(minp.x, x - grid_size),
					math.max(minp.y, y - grid_size),
					math.max(minp.z, z - grid_size),
					math.min(maxp.x, x + grid_size),
					math.min(maxp.y, y + grid_size),
					math.min(maxp.z, z + grid_size)
				) do
					if data[i] == c_stone and pr:next(1, 10) <= 7 then
						data[i] = c_sulfur
					end
				end
			end
		end
		end
		end

		vm:set_data(data)
		vm:write_to_map(data)
	end)

	-- Iron

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 12,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 7 * 7 * 7,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 0,
		y_min          = -31000,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_max          = -64,
		y_min          = -31000,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:desert_stone_with_iron",
		wherein        = "default:desert_stone",
		clust_scarcity = 6 * 6 * 6,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = 200,
		y_min          = -150,
	})

	-- Copper

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_copper",
		wherein        = "default:stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_copper",
		wherein        = "default:stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -16,
		y_min          = -63,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_copper",
		wherein        = "default:stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -64,
		y_min          = -31000,
	})

	-- Tin

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_tin",
		wherein        = "default:stone",
		clust_scarcity = 10 * 10 * 10,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_tin",
		wherein        = "default:stone",
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -32,
		y_min          = -127,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_tin",
		wherein        = "default:stone",
		clust_scarcity = 10 * 10 * 10,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -128,
		y_min          = -31000,
	})

	-- Silver

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_silver",
		wherein        = "default:stone",
		clust_scarcity = 11 * 11 * 11,
		clust_num_ores = 4,
		clust_size     = 11,
		y_max          = -2,
		y_min          = -31000,
	})

	-- Gold

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_gold",
		wherein        = "default:stone",
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_gold",
		wherein        = "default:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -64,
		y_min          = -255,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_gold",
		wherein        = "default:stone",
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -256,
		y_min          = -31000,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:desert_stone_with_gold",
		wherein        = "default:desert_stone",
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 2256,
		y_min          = -214,
	})

	-- Mese crystal

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_mese",
		wherein        = "default:stone",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_mese",
		wherein        = "default:stone",
		clust_scarcity = 18 * 18 * 18,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -64,
		y_min          = -255,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_mese",
		wherein        = "default:stone",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -256,
		y_min          = -31000,
	})

	-- Mithril

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_mithril",
		wherein        = "default:stone",
		clust_scarcity = 11 * 11 * 11,
		clust_num_ores = 3,
		clust_size     = 11,
		y_max          = -512,
		y_min          = -31000,
	})

	-- Diamond

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_diamond",
		wherein        = "default:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_diamond",
		wherein        = "default:stone",
		clust_scarcity = 17 * 17 * 17,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -128,
		y_min          = -255,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_diamond",
		wherein        = "default:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -256,
		y_min          = -31000,
	})

	-- Blue Diamond

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_blue_diamond",
		wherein        = "default:stone",
		clust_scarcity = 7 * 7 * 7,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -512,
		y_min          = -31000,
	})

	-- Chromium

	core.register_ore({
		ore_type         = "scatter",
		ore              = "default:stone_with_chromium",
		wherein          = "default:stone",
		clust_scarcity   = 8 * 8 * 8,
		clust_num_ores   = 2,
		clust_size       = 3,
		y_max            = -100,
		y_min            = -200,
		noise_params = chromium_params,
		noise_threshold = .55,
	})

	core.register_ore({
		ore_type         = "scatter",
		ore              = "default:stone_with_chromium",
		wherein          = "default:stone",
		clust_scarcity   = 6 * 6 * 6,
		clust_num_ores   = 2,
		clust_size       = 3,
		y_max            = -200,
		y_min            = -31000,
		flags = "absheight",
		noise_params = chromium_params,
		noise_threshold = .55,
	})

	-- Zinc

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_zinc",
		wherein        = "default:stone",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 5,
		clust_size     = 7,
		y_max          = 2,
		y_min          = -32,
		noise_params = zinc_params,
		noise_threshold = .5,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_zinc",
		wherein        = "default:stone",
		clust_scarcity = 6 * 6 * 6,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -32,
		y_min          = -31000,
		flags = "absheight",
		noise_params = zinc_params,
		noise_threshold = .5,
	})

	-- Mese block

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:mese",
		wherein        = "default:stone",
		clust_scarcity = 36 * 36 * 36,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:mese",
		wherein        = "default:stone",
		clust_scarcity = 36 * 36 * 36,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -1024,
		y_min          = -31000,
	})

	-- Diamite

	core.register_ore({
		ore_type        = "blob",
		ore             = "default:diamite",
		wherein         = "default:stone",
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 7,
		y_max           = 0,
		y_min           = -31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 1316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Marbles and granite

	core.register_ore({
		ore_type       = "sheet",
		ore            = "default:white_marble",
		wherein        = "default:stone",
		column_height_min = 1,
		column_height_max = 10,
		column_midpoint_factor = .3,
		noise_params = {
			offset  = -1.3,
			scale   = 3,
			spread  = {x=100, y=100, z=100},
			seed    = 18953,
			octaves = 3,
			persist = .5,
			flags = "eased",
		},
		noise_threshold = 1.6,
		y_max     = 64,
		y_min     = y_height_min,
	})

	core.register_ore({
		ore_type       = "sheet",
		ore            = "default:white_marble",
		wherein        = "default:stone",
		clust_scarcity = 1,
		clust_size     = 3,
		y_max          = -60,
		y_min          = y_height_min,
		noise_threshold = .4,
		noise_params = {
			offset = 0, scale = 15, spread = {x = 150, y = 150, z = 150},
			seed = 23, octaves = 3, persist = .70
		}
	})

	core.register_ore({
		ore_type       = "sheet",
		ore            = "default:marble",
		wherein        = "default:stone",
		clust_scarcity = 1,
		clust_size     = 3,
		y_max          = -50,
		y_min          = y_height_min,
		noise_threshold = .4,
		noise_params = {
			offset = 0, scale = 15, spread = {x = 150, y = 150, z = 150},
			seed = 23, octaves = 3, persist = .70
		}
	})

	core.register_ore({
		ore_type       = "sheet",
		ore            = "default:granite",
		wherein        = "default:stone",
		column_height_min = 1,
		column_height_max = 8,
		column_midpoint_factor = .3,
		noise_params = {
			offset  = -1.3,
			scale   = 3,
			spread  = {x=100, y=100, z=100},
			seed    = 79533,
			octaves = 3,
			persist = .5,
			flags = "eased",
		},
		noise_threshold = 1.6,
		y_max     = 64,
		y_min     = y_height_min,
	})

	core.register_ore({
		ore_type       = "sheet",
		ore            = "default:granite",
		wherein        = "default:stone",
		clust_scarcity = 1,
		clust_size     = 4,
		y_max          = -150,
		y_min          = y_height_min,
		noise_threshold = .4,
		noise_params = {
			offset = 0, scale = 15, spread = {x = 130, y = 130, z = 130},
			seed = 24, octaves = 3, persist = .70
		}
	})
end


-- All mapgens except mgv6

function default.register_ores()

if core.get_modpath("mapgen") then
	core.register_ore({
		ore_type       = "stratum",
		ore            = "mapgen:subrosian_sand",
		wherein        = {"default:stone"},
		clust_scarcity = 1,
		y_max          = -1200,
		y_min          = -1400,
	})
end

	-- Stratum ores.
	-- These obviously first.

	-- Silver sandstone

	core.register_ore({
		ore_type        = "stratum",
		ore             = "default:silver_sandstone",
		wherein         = {"default:stone"},
		clust_scarcity  = 1,
		y_max           = 46,
		y_min           = 10,
		noise_params    = {
			offset = 28,
			scale = 16,
			spread = {x = 128, y = 128, z = 128},
			seed = 90122,
			octaves = 1,
		},
		stratum_thickness = 4,
		biomes = {"cold_desert"},
	})

	core.register_ore({
		ore_type        = "stratum",
		ore             = "default:silver_sandstone",
		wherein         = {"default:stone"},
		clust_scarcity  = 1,
		y_max           = 42,
		y_min           = 6,
		noise_params    = {
			offset = 24,
			scale = 16,
			spread = {x = 128, y = 128, z = 128},
			seed = 90122,
			octaves = 1,
		},
		stratum_thickness = 2,
		biomes = {"cold_desert"},
	})

	-- Desert sandstone

	core.register_ore({
		ore_type        = "stratum",
		ore             = "default:desert_sandstone",
		wherein         = {"default:desert_stone"},
		clust_scarcity  = 1,
		y_max           = 46,
		y_min           = 10,
		noise_params    = {
			offset = 28,
			scale = 16,
			spread = {x = 128, y = 128, z = 128},
			seed = 90122,
			octaves = 1,
		},
		stratum_thickness = 4,
		biomes = {"desert"},
	})

	core.register_ore({
		ore_type        = "stratum",
		ore             = "default:desert_sandstone",
		wherein         = {"default:desert_stone"},
		clust_scarcity  = 1,
		y_max           = 42,
		y_min           = 6,
		noise_params    = {
			offset = 24,
			scale = 16,
			spread = {x = 128, y = 128, z = 128},
			seed = 90122,
			octaves = 1,
		},
		stratum_thickness = 2,
		biomes = {"desert"},
	})

	-- Sandstone

	core.register_ore({
		ore_type        = "stratum",
		ore             = "default:sandstone",
		wherein         = {"default:desert_stone"},
		clust_scarcity  = 1,
		y_max           = 39,
		y_min           = 3,
		noise_params    = {
			offset = 21,
			scale = 16,
			spread = {x = 128, y = 128, z = 128},
			seed = 90122,
			octaves = 1,
		},
		stratum_thickness = 2,
		biomes = {"desert"},
	})

	-- Blob ore.
	-- These before scatter ores to avoid other ores in blobs.

	-- Clay

	core.register_ore({
		ore_type        = "blob",
		ore             = "default:clay",
		wherein         = {"default:sand"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 0,
		y_min           = -15,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Silver sand

	core.register_ore({
		ore_type        = "blob",
		ore             = "default:silver_sand",
		wherein         = {"default:stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = y_height_min,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 2316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Dirt

	core.register_ore({
		ore_type        = "blob",
		ore             = "default:dirt",
		wherein         = {"default:stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
		-- Only where default:dirt is present as surface material
		biomes = {"frost", "taiga", "snowy_grassland", "grassland", "coniferous_forest",
			"deciduous_forest", "deciduous_forest_shore", "subtropical_forest", "rainforest", "rainforest_swamp"}
	})

	-- Clay Dirt

	core.register_ore({
		ore_type        = "blob",
		ore             = "default:clay_dirt",
		wherein         = {"default:stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
		-- Only where default:clay_dirt is present as surface material
		biomes = {"aidenland", "savanna", "savanna_shore"}
	})

	core.register_ore({
		ore_type        = "blob",
		ore             = "default:mud",
		wherein         = {"default:dirt_with_swamp_grass", "default:dirt"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
		-- Only in swamps
		biomes = {"swamp"}
	})

	-- Gravel

	core.register_ore({
		ore_type        = "blob",
		ore             = "default:gravel",
		wherein         = {"default:stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = y_height_min,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Ocean stone

	core.register_ore({
		ore_type        = "blob",
		ore             = "default:ocean_stone",
		wherein         = {"default:sand"},
		clust_scarcity  = 32 * 32 * 32,
		clust_size      = 8,
		y_max           = -5,
		y_min           = -20,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 8, y = 5, z = 8},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
	})

	core.register_ore({
		ore_type       = "stratum",
		ore            = "default:bedrock_barrier",
		wherein        = {"air","default:stone","nssm:morentir","default:cloud","nssm:mornen","nssm:mornen_flowing"},
		clust_scarcity = 1,
		y_max          = -30912,
		y_min          = -30912,
	})

if core.get_modpath("nssm") then
	-- The Morlendor dimension.		Air layer is unnecessary because of large caves

	core.register_ore({
		ore_type       = "stratum",
		ore            = "default:bedrock_barrier",
		wherein        = {"air","default:stone","nssm:morentir","default:cloud",
	"default:water_source","default:water_flowing","default:lava_source","default:lava_flowing"},
		clust_scarcity = 1,
		stratum_thickness = 4,
		y_max          = -30749,
		y_min          = -30752,
	})

	core.register_ore({
		ore_type       = "stratum",
		ore            = "nssm:morelentir",
		wherein        = {"nssm:morentir"},
		clust_scarcity = 1,
		y_max          = -30753,
		y_min          = -30773,
	})

	core.register_ore({
		ore_type        = "blob",
		ore             = "nssm:morelentir",
		wherein         = {"air", "nssm:morentir"},
		clust_scarcity  = 10 * 10 * 10,
		clust_size      = 3,
		y_max           = -30757,
		y_min           = -30784,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0
		},
		biomes = {"morlendor"}
	})

	core.register_ore({
		ore_type        = "blob",
		ore             = "nssm:morelentir",
		wherein         = {"air", "nssm:morentir"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 6,
		y_max           = -30757,
		y_min           = -30784,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0
		},
		biomes = {"morlendor"}
	})

	core.register_ore({
		ore_type        = "blob",
		ore             = "nssm:morkemen",
		wherein         = {"nssm:morentir"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = -30790,
		y_min           = -30909,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0
		},
		biomes = {"morlendor"}
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:extra_energy_ore",
		wherein        = "nssm:morentir",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -30801,
		y_min          = -30911,
		biomes = {"morlendor"}
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:extra_energy_ore",
		wherein        = "nssm:morentir",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 30,
		clust_size     = 5,
		y_max          = -30816,
		y_min          = -30911,
		biomes = {"morlendor"}
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:moranga",
		wherein        = "nssm:morentir",
		clust_scarcity = 11 * 11 * 11,
		clust_num_ores = 3,
		clust_size     = 11,
		y_max          = -30816,
		y_min          = -30911,
		biomes = {"morlendor"}
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:moranga",
		wherein        = "nssm:morentir",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 18,
		clust_size     = 13,
		y_max          = -30864,
		y_min          = -30911,
		biomes = {"morlendor"}
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:mornar",
		wherein        = "air",
		clust_scarcity = 75,
		clust_num_ores = 1,
		clust_size     = 1,
		y_max          = -30754,
		y_min          = -30911,
		biomes = {"morlendor"}
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:mornen",
		wherein        = "nssm:morentir",
		clust_scarcity = 5488,
		clust_num_ores = 5,
		clust_size     = 2,
		y_max          = -30774,
		y_min          = -30911,
		biomes = {"morlendor"}
	})

	core.register_on_generated(function(minp, maxp)
		if maxp.y < -30772 or maxp.y > -30911 then
	local spot = core.find_nodes_in_area_under_air(minp, maxp, {"nssm:morentir", "nssm:morkemen"})
	for n = 1, #spot do
		if math.random(1, 100) == 1 then
			local pos = {x = spot[n].x, y = spot[n].y, z = spot[n].z}
			if math.random(1, 15) == 1 and core.get_node({x=pos.x, y=pos.y+2, z=pos.z}).name == "air" and
				core.get_node({x=pos.x, y=pos.y+3, z=pos.z}).name == "air" then
		core.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "nssm:morwa_statue"})
			else
		core.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "nssm:morlote"})
			end
		end
	end
		end
	end)
end

	-- Scatter ores

	-- Coal

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_coal",
		wherein        = "default:stone",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 9,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_coal",
		wherein        = "default:stone",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_max          = 64,
		y_min          = -127,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_coal",
		wherein        = "default:stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 30,
		clust_size     = 5,
		y_max          = -128,
		y_min          = y_height_min,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:desert_stone_with_coal",
		wherein        = "default:desert_stone",
		clust_scarcity = 6 * 6 * 6,
		clust_num_ores = 9,
		clust_size     = 6,
		y_max          = 200,
		y_min          = -255,
	})

	-- Sulfur
	local sulfur_buf = {}
	local sulfur_noise

	core.register_on_generated(function(minp, maxp)
		local vm, emin, emax = core.get_mapgen_object("voxelmanip")
		local a = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local data = vm:get_data(sulfur_buf)
		local pr = PseudoRandom(17 * minp.x + 42 * minp.y + 101 * minp.z)
		sulfur_noise = sulfur_noise or core.get_perlin(9876, 3, 0.5, 100)

		local c_lava = core.get_content_id("default:lava_source")
		local c_lava_flowing = core.get_content_id("default:lava_flowing")
		local c_stone = core.get_content_id("default:stone")
		local c_sulfur = core.get_content_id("default:stone_with_sulfur")

		local grid_size = 5
		for x = minp.x + math.floor(grid_size / 2), maxp.x, grid_size do
		for y = minp.y + math.floor(grid_size / 2), maxp.y, grid_size do
		for z = minp.z + math.floor(grid_size / 2), maxp.z, grid_size do
			local c = data[a:index(x, y, z)]
			if (c == c_lava or c == c_lava_flowing)
			and sulfur_noise:get_3d({x = x, y = z, z = z}) >= 0.4 then
				for i in a:iter(
					math.max(minp.x, x - grid_size),
					math.max(minp.y, y - grid_size),
					math.max(minp.z, z - grid_size),
					math.min(maxp.x, x + grid_size),
					math.min(maxp.y, y + grid_size),
					math.min(maxp.z, z + grid_size)
				) do
					if data[i] == c_stone and pr:next(1, 10) <= 7 then
						data[i] = c_sulfur
					end
				end
			end
		end
		end
		end

		vm:set_data(data)
		vm:write_to_map(data)
	end)

	-- Tin

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_tin",
		wherein        = "default:stone",
		clust_scarcity = 10 * 10 * 10,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_tin",
		wherein        = "default:stone",
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -64,
		y_min          = -127,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_tin",
		wherein        = "default:stone",
		clust_scarcity = 10 * 10 * 10,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -128,
		y_min          = y_height_min,
	})

	-- Copper

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_copper",
		wherein        = "default:stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_copper",
		wherein        = "default:stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -64,
		y_min          = -127,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_copper",
		wherein        = "default:stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -128,
		y_min          = y_height_min,
	})

	-- Iron

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 12,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 7 * 7 * 7,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -128,
		y_min          = -255,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 29,
		clust_size     = 5,
		y_max          = -256,
		y_min          = y_height_min,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:desert_stone_with_iron",
		wherein        = "default:desert_stone",
		clust_scarcity = 6 * 6 * 6,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = 200,
		y_min          = -150,
	})

	-- Silver

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_silver",
		wherein        = "default:stone",
		clust_scarcity = 11 * 11 * 11,
		clust_num_ores = 4,
		clust_size     = 11,
		y_max          = -2,
		y_min          = y_height_min,
	})

	-- Gold

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_gold",
		wherein        = "default:stone",
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_gold",
		wherein        = "default:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -256,
		y_min          = -511,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_gold",
		wherein        = "default:stone",
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -512,
		y_min          = y_height_min,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:desert_stone_with_gold",
		wherein        = "default:desert_stone",
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 2256,
		y_min          = -214,
	})

	-- Mese crystal

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_mese",
		wherein        = "default:stone",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_mese",
		wherein        = "default:stone",
		clust_scarcity = 18 * 18 * 18,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -512,
		y_min          = -1023,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_mese",
		wherein        = "default:stone",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -1024,
		y_min          = y_height_min,
	})

	-- Mithril

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_mithril",
		wherein        = "default:stone",
		clust_scarcity = 11 * 11 * 11,
		clust_num_ores = 3,
		clust_size     = 11,
		y_max          = -512,
		y_min          = y_height_min,
	})

	-- Diamond

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_diamond",
		wherein        = "default:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_diamond",
		wherein        = "default:stone",
		clust_scarcity = 17 * 17 * 17,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -1024,
		y_min          = -2047,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_diamond",
		wherein        = "default:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -2048,
		y_min          = y_height_min,
	})

	-- Blue Diamond

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_blue_diamond",
		wherein        = "default:stone",
		clust_scarcity = 7 * 7 * 7,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -512,
		y_min          = y_height_min,
	})

	-- Chromium

	core.register_ore({
		ore_type         = "scatter",
		ore              = "default:stone_with_chromium",
		wherein          = "default:stone",
		clust_scarcity   = 8 * 8 * 8,
		clust_num_ores   = 2,
		clust_size       = 3,
		y_max            = -100,
		y_min            = -200,
		noise_params = chromium_params,
		noise_threshold = .55,
	})

	core.register_ore({
		ore_type         = "scatter",
		ore              = "default:stone_with_chromium",
		wherein          = "default:stone",
		clust_scarcity   = 6 * 6 * 6,
		clust_num_ores   = 2,
		clust_size       = 3,
		y_max            = -200,
		y_min            = y_height_min,
		flags = "absheight",
		noise_params = chromium_params,
		noise_threshold = .55,
	})

	-- Zinc

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_zinc",
		wherein        = "default:stone",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 5,
		clust_size     = 7,
		y_max          = 2,
		y_min          = -32,
		noise_params = zinc_params,
		noise_threshold = .5,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_zinc",
		wherein        = "default:stone",
		clust_scarcity = 6 * 6 * 6,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -32,
		y_min          = y_height_min,
		flags = "absheight",
		noise_params = zinc_params,
		noise_threshold = .5,
	})

	-- Mese block

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:mese",
		wherein        = "default:stone",
		clust_scarcity = 36 * 36 * 36,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = 31000,
		y_min          = 1025,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:mese",
		wherein        = "default:stone",
		clust_scarcity = 36 * 36 * 36,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -2048,
		y_min          = -4095,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:mese",
		wherein        = "default:stone",
		clust_scarcity = 28 * 28 * 28,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -4096,
		y_min          = y_height_min,
	})

	-- Diamite

	core.register_ore({
		ore_type        = "blob",
		ore             = "default:diamite",
		wherein         = "default:stone",
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 7,
		y_max           = 31000,
		y_min           = y_height_min,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 1316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Marbles and granite

	core.register_ore({
		ore_type       = "sheet",
		ore            = "default:white_marble",
		wherein        = "default:stone",
		column_height_min = 1,
		column_height_max = 10,
		column_midpoint_factor = .3,
		noise_params = {
			offset  = -1.3,
			scale   = 3,
			spread  = {x=100, y=100, z=100},
			seed    = 18953,
			octaves = 3,
			persist = .5,
			flags = "eased",
		},
		noise_threshold = 1.6,
		y_max     = 64,
		y_min     = y_height_min,
	})

	core.register_ore({
		ore_type       = "sheet",
		ore            = "default:white_marble",
		wherein        = "default:stone",
		clust_scarcity = 1,
		clust_size     = 3,
		y_max          = -60,
		y_min          = y_height_min,
		noise_threshold = .4,
		noise_params = {
			offset = 0, scale = 15, spread = {x = 150, y = 150, z = 150},
			seed = 23, octaves = 3, persist = .7
		}
	})

	core.register_ore({
		ore_type       = "sheet",
		ore            = "default:marble",
		wherein        = "default:stone",
		clust_scarcity = 1,
		clust_size     = 3,
		y_max          = -50,
		y_min          = y_height_min,
		noise_threshold = .4,
		noise_params = {
			offset = 0, scale = 15, spread = {x = 150, y = 150, z = 150},
			seed = 23, octaves = 3, persist = .7
		}
	})

	core.register_ore({
		ore_type       = "sheet",
		ore            = "default:granite",
		wherein        = "default:stone",
		column_height_min = 2,
		column_height_max = 8,
		column_midpoint_factor = .3,
		noise_params = {
			offset  = -1.3,
			scale   = 3,
			spread  = {x=100, y=100, z=100},
			seed    = 79533,
			octaves = 3,
			persist = .5,
			flags = "eased",
		},
		noise_threshold = 1.6,
		y_max     = 64,
		y_min     = y_height_min,
	})

	core.register_ore({
		ore_type       = "sheet",
		ore            = "default:granite",
		wherein        = "default:stone",
		clust_scarcity = 1,
		clust_size     = 4,
		y_max          = -150,
		y_min          = y_height_min,
		noise_threshold = .4,
		noise_params = {
			offset = 0, scale = 15, spread = {x = 130, y = 130, z = 130},
			seed = 24, octaves = 3, persist = .7
		}
	})

if not core.get_modpath("nether") then
	core.register_ore({
		ore_type        = "blob",
		ore             = "default:bedrock",
		wherein         = {"default:stone"},
		clust_scarcity  = 16,
		clust_size      = 3,
		y_max           = y_height_min+10,
		y_min           = y_height_min,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 1616,
			octaves = 1,
			persist = 0
		},
	})
end

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:rocks",
		wherein        = "default:stone",
		clust_scarcity = 17 * 17 * 17,
		clust_num_ores = 20,
		clust_size     = 4,
		y_max          = 1024,
		y_min          = -32,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "default:desert_rocks",
		wherein        = "default:desert_stone",
		clust_scarcity = 17 * 17 * 17,
		clust_num_ores = 20,
		clust_size     = 4,
		y_max          = 1024,
		y_min          = -32,
	})
end


--
-- Register biomes
--

-- All mapgens except mgv6

function default.register_biomes()

	-- Icesheet

	core.register_biome({
		name = "icesheet",
		node_dust = "default:snow_block",
		node_top = "default:snow_block",
		depth_top = 1,
		node_filler = "default:snow_block",
		depth_filler = 3,
		node_stone = "default:cave_ice",
		node_water_top = "default:ice",
		depth_water_top = 10,
		node_river_water = "default:ice",
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		node_dungeon = "default:ice",
		node_dungeon_stair = "stairs:stair_ice",
		y_max = 31000,
		y_min = -8,
		heat_point = 0,
		humidity_point = 73,
	})

	core.register_biome({
		name = "icesheet_ocean",
		node_dust = "default:snow_block",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_water_top = "default:ice",
		depth_water_top = 10,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -9,
		y_min = -255,
		heat_point = 0,
		humidity_point = 73,
	})

	core.register_biome({
		name = "icesheet_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = y_height_min,
		heat_point = 0,
		humidity_point = 73,
	})

	-- Tundra

	core.register_biome({
		name = "tundra_highland",
		node_dust = "default:snow",
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 47,
		heat_point = 0,
		humidity_point = 40,
	})

	core.register_biome({
		name = "tundra",
		node_top = "default:permafrost_with_stones",
		depth_top = 1,
		node_filler = "default:permafrost",
		depth_filler = 1,
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 4,
		y_max = 46,
		y_min = 2,
		heat_point = 0,
		humidity_point = 40,
	})

	core.register_biome({
		name = "tundra_beach",
		node_top = "default:gravel",
		depth_top = 1,
		node_filler = "default:gravel",
		depth_filler = 2,
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = 1,
		y_min = -3,
		heat_point = 0,
		humidity_point = 40,
	})

	core.register_biome({
		name = "tundra_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = -4,
		y_min = -255,
		heat_point = 0,
		humidity_point = 40,
	})

	core.register_biome({
		name = "tundra_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = y_height_min,
		heat_point = 0,
		humidity_point = 40,
	})

	-- Frost

	core.register_biome({
		name = "frost",
		node_top = "default:dirt_with_blue_moss",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 1,
		heat_point = 10,
		humidity_point = 40,
	})

local decor_stone = "default:white_marble"
if core.get_modpath("ethereal") then
	decor_stone = "ethereal:blue_marble"
end
	core.register_biome({
		name = "frost_ocean",
		node_top = "default:silver_sand",
		depth_top = 2,
		node_filler = "default:sand",
		depth_filler = 2,
		node_stone = decor_stone,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = 0,
		y_min = -255,
		heat_point = 10,
		humidity_point = 40,
	})

	core.register_biome({
		name = "frost_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = y_height_min,
		heat_point = 10,
		humidity_point = 40,
	})

	-- Mountain

	core.register_biome({
		name = "mountain",
		node_dust = "default:snow",
		node_top = "default:snow_block",
		depth_top = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 2,
		y_max = 31000,
		y_min = 140,
		heat_point = 50,
		humidity_point = 50,
	})

	-- Taiga

	core.register_biome({
		name = "taiga",
		node_dust = "default:snow",
		node_top = "default:dirt_with_snow",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 139,
		y_min = 4,
		heat_point = 25,
		humidity_point = 70,
	})

	core.register_biome({
		name = "taiga_ocean",
		node_dust = "default:snow",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = 3,
		y_min = -255,
		heat_point = 25,
		humidity_point = 70,
	})

	core.register_biome({
		name = "taiga_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = y_height_min,
		heat_point = 25,
		humidity_point = 70,
	})

	-- Snowy grassland

	core.register_biome({
		name = "snowy_grassland",
		node_dust = "default:snow",
		node_top = "default:dirt_with_snow",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 1,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 139,
		y_min = 4,
		heat_point = 20,
		humidity_point = 35,
	})

	core.register_biome({
		name = "snowy_grassland_ocean",
		node_dust = "default:snow",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = 3,
		y_min = -255,
		heat_point = 20,
		humidity_point = 35,
	})

	core.register_biome({
		name = "snowy_grassland_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = y_height_min,
		heat_point = 20,
		humidity_point = 35,
	})

	-- Grassland

	core.register_biome({
		name = "grassland",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 1,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 139,
		y_min = 6,
		heat_point = 50,
		humidity_point = 35,
	})

	core.register_biome({
		name = "grassland_dunes",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 2,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = 5,
		y_min = 4,
		heat_point = 50,
		humidity_point = 35,
	})

	core.register_biome({
		name = "grassland_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 3,
		y_min = -255,
		heat_point = 50,
		humidity_point = 35,
	})

	core.register_biome({
		name = "grassland_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = y_height_min,
		heat_point = 50,
		humidity_point = 35,
	})

	-- Coniferous forest

	core.register_biome({
		name = "coniferous_forest",
		node_top = "default:dirt_with_coniferous_litter",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 139,
		y_min = 6,
		heat_point = 45,
		humidity_point = 70,
	})

	core.register_biome({
		name = "coniferous_forest_dunes",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = 5,
		y_min = 4,
		heat_point = 45,
		humidity_point = 70,
	})

	core.register_biome({
		name = "coniferous_forest_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 3,
		y_min = -255,
		heat_point = 45,
		humidity_point = 70,
	})

	core.register_biome({
		name = "coniferous_forest_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = y_height_min,
		heat_point = 45,
		humidity_point = 70,
	})

	-- Deciduous forest

	core.register_biome({
		name = "deciduous_forest",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 139,
		y_min = 1,
		heat_point = 60,
		humidity_point = 68,
	})

	core.register_biome({
		name = "deciduous_forest_shore",
		node_top = "default:dirt",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 0,
		y_min = -1,
		heat_point = 60,
		humidity_point = 68,
	})

	core.register_biome({
		name = "deciduous_forest_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = -2,
		y_min = -255,
		heat_point = 60,
		humidity_point = 68,
	})

	core.register_biome({
		name = "deciduous_forest_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = y_height_min,
		heat_point = 60,
		humidity_point = 68,
	})

	-- Desert

	core.register_biome({
		name = "desert",
		node_top = "default:desert_sand",
		depth_top = 1,
		node_filler = "default:desert_sand",
		depth_filler = 1,
		node_stone = "default:desert_stone",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:desert_stone",
		node_dungeon_stair = "stairs:stair_desert_stone",
		y_max = 139,
		y_min = 4,
		heat_point = 92,
		humidity_point = 16,
	})

	core.register_biome({
		name = "desert_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_stone = "default:desert_stone",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:desert_stone",
		node_dungeon_stair = "stairs:stair_desert_stone",
		vertical_blend = 1,
		y_max = 3,
		y_min = -255,
		heat_point = 92,
		humidity_point = 16,
	})

	core.register_biome({
		name = "desert_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = y_height_min,
		heat_point = 92,
		humidity_point = 16,
	})

	-- Sandstone desert

	core.register_biome({
		name = "sandstone_desert",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 1,
		node_stone = "default:sandstone",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:sandstone_brick",
		node_dungeon_stair = "stairs:stair_sandstone_block",
		y_max = 139,
		y_min = 4,
		heat_point = 60,
		humidity_point = 0,
	})

	core.register_biome({
		name = "sandstone_desert_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_stone = "default:sandstone",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:sandstone_brick",
		node_dungeon_stair = "stairs:stair_sandstone_block",
		y_max = 3,
		y_min = -255,
		heat_point = 60,
		humidity_point = 0,
	})

	core.register_biome({
		name = "sandstone_desert_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = y_height_min,
		heat_point = 60,
		humidity_point = 0,
	})

	-- Cold desert

	core.register_biome({
		name = "cold_desert",
		node_top = "default:silver_sand",
		depth_top = 1,
		node_filler = "default:silver_sand",
		depth_filler = 1,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 139,
		y_min = 4,
		heat_point = 40,
		humidity_point = 0,
	})

	core.register_biome({
		name = "cold_desert_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = 3,
		y_min = -255,
		heat_point = 40,
		humidity_point = 0,
	})

	core.register_biome({
		name = "cold_desert_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = y_height_min,
		heat_point = 40,
		humidity_point = 0,
	})

if core.get_modpath("es") then
	-- Aiden

	core.register_biome({
		name = "aidenland",
		node_top = "es:clay_dirt_with_aiden_grass",
		depth_top = 1,
		node_filler = "default:clay_dirt",
		depth_filler = 3,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 139,
		y_min = 2,
		heat_point = 3,
		humidity_point = 2,
	})
end

	-- Savanna

	core.register_biome({
		name = "savanna",
		node_top = "default:clay_dirt_with_savanna_grass",
		depth_top = 1,
		node_filler = "default:clay_dirt",
		depth_filler = 1,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 139,
		y_min = 1,
		heat_point = 89,
		humidity_point = 42,
	})

	core.register_biome({
		name = "savanna_shore",
		node_top = "default:clay_dirt",
		depth_top = 1,
		node_filler = "default:clay_dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 0,
		y_min = -1,
		heat_point = 89,
		humidity_point = 42,
	})

	core.register_biome({
		name = "savanna_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = -2,
		y_min = -255,
		heat_point = 89,
		humidity_point = 42,
	})

	core.register_biome({
		name = "savanna_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = y_height_min,
		heat_point = 89,
		humidity_point = 42,
	})

if core.get_modpath("ethereal") then
	-- Subtropical forest

	core.register_biome({
		name = "subtropical_forest",
		node_top = "ethereal:grove_dirt",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 99,
		y_min = 3,
		heat_point = 75,
		humidity_point = 56,
	})

	core.register_biome({
		name = "subtropical_forest_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 2,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = 2,
		y_min = y_height_min,
		heat_point = 75,
		humidity_point = 56,
	})
end

	-- Swamp

	core.register_biome({
		name = "swamp",
		node_top = "default:dirt_with_swamp_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 5,
		y_min = 1,
		heat_point = 87,
		humidity_point = 54,
	})

	core.register_biome({
		name = "swamp_shore",
		node_top = "default:silt",
		depth_top = 2,
		node_filler = "default:clay",
		depth_filler = 2,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 0,
		y_min = -3,
		heat_point = 87,
		humidity_point = 54,
	})

	-- Rainforest

	core.register_biome({
		name = "rainforest",
		node_top = "default:dirt_with_rainforest_litter",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 139,
		y_min = 1,
		heat_point = 86,
		humidity_point = 65,
	})

	core.register_biome({
		name = "rainforest_swamp",
		node_top = "default:dirt",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 0,
		y_min = -1,
		heat_point = 86,
		humidity_point = 65,
	})

	core.register_biome({
		name = "rainforest_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = -2,
		y_min = -255,
		heat_point = 86,
		humidity_point = 65,
	})

	core.register_biome({
		name = "rainforest_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = y_height_min,
		heat_point = 86,
		humidity_point = 65,
	})

if core.get_modpath("nssm") then
	-- Morlendor

	core.register_biome({
		name = "morlendor",
		node_stone = "nssm:morentir",
		node_filler = "nssm:morentir",
		node_cave_liquid = {"nssm:mornen", "nssm:mornen"},
		y_max = -30750,
		y_min = -30911,
		heat_point = 50,
		humidity_point = 50,
	})
end
end


--
-- Register decorations
--

-- Mgv6

function default.register_mgv6_decorations()

	-- Reed

	core.register_decoration({
		name = "default:reed",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 100, y = 100, z = 100},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		y_max = 1,
		y_min = 1,
		decoration = "default:reed",
		height = 2,
		height_max = 4,
		spawn_by = "default:water_source",
		num_spawn_by = 1,
	})

	-- Papyrus

	core.register_decoration({
		name = "default:papyrus",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.6,
			spread = {x = 100, y = 100, z = 100},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		y_max = 1,
		y_min = 1,
		decoration = "default:papyrus",
		spawn_by = "default:water_source",
		num_spawn_by = 1,
	})

	-- Cacti

	core.register_decoration({
		name = "default:cactus",
		deco_type = "simple",
		place_on = {"default:desert_sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.012,
			scale = 0.024,
			spread = {x = 100, y = 100, z = 100},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		y_max = 30,
		y_min = 1,
		decoration = "default:cactus",
		height = 3,
		height_max = 4,
	})

	-- Long grasses

	for length = 1, 5 do
		core.register_decoration({
			name = "default:grass_"..length,
			deco_type = "simple",
			place_on = {"default:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = 0,
				scale = 0.007,
				spread = {x = 100, y = 100, z = 100},
				seed = 329,
				octaves = 3,
				persist = 0.6
			},
			y_max = 30,
			y_min = 1,
			decoration = "default:grass_"..length,
			param2 = 0,
			param2_max = 3,
		})
	end

	-- Dry shrubs

	core.register_decoration({
		name = "default:dry_shrub",
		deco_type = "simple",
		place_on = {"default:desert_sand", "default:dirt_with_snow"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.035,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_max = 30,
		y_min = 1,
		decoration = "default:dry_shrub",
	})
end


-- All mapgens except mgv6

local function register_grass_decoration(offset, scale, length)
	core.register_decoration({
		name = "default:grass_" .. length,
		deco_type = "simple",
		place_on = {"default:dirt_with_grass", "ethereal:grove_dirt"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland", "deciduous_forest", "rainforest", "subtropical_forest"},
		y_max = 109,
		y_min = 1,
		decoration = "default:grass_" .. length,
		param2 = 0,
		param2_max = 3,
	})
end

local function register_savanna_grass_decoration(offset, scale, length)
	core.register_decoration({
		name = "default:savanna_grass_" .. length,
		deco_type = "simple",
		place_on = {"default:clay_dirt_with_savanna_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"savanna"},
		y_max = 109,
		y_min = 1,
		decoration = "default:savanna_grass_" .. length,
		param2 = 0,
		param2_max = 3,
	})
end

local function register_fern_decoration(seed, length)
	core.register_decoration({
		name = "default:fern_" .. length,
		deco_type = "simple",
		place_on = {"default:dirt_with_coniferous_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.2,
			spread = {x = 100, y = 100, z = 100},
			seed = seed,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"coniferous_forest"},
		y_max = 128,
		y_min = 6,
		decoration = "default:fern_" .. length,
	})
end


local boulder_surfaces = {"default:permafrost_with_stones", "default:permafrost_with_moss", "default:stone", "default:gravel",
	"default:dirt_with_blue_moss", "default:dirt_with_snow", "default:dirt_with_grass", "default:dirt_with_coniferous_litter",
	"default:desert_sand", "default:sand", "default:silver_sand", "es:clay_dirt_with_aiden_grass",
	"default:clay_dirt_with_savanna_grass", "default:clay_dirt", "default:dirt_with_swamp_grass", "default:dirt_with_rainforest_litter", "ethereal:grove_dirt"}
local boulder_biomes = {"tundra", "frost", "taiga", "snowy_grassland", "grassland", "coniferous_forest", "deciduous_forest",
	"desert", "sandstone_desert", "cold_desert", "aidenland", "savanna", "subtropical_forest", "swamp", "rainforest"}
local ocean_floors = {"icesheet_ocean", "tundra_ocean", "taiga_ocean", "snowy_grassland_ocean", "grassland_ocean", "coniferous_forest_ocean", "deciduous_forest_ocean",
	"desert_ocean", "sandstone_desert_ocean", "cold_desert_ocean", "savanna_ocean", "subtropical_forest_ocean", "rainforest_ocean"}

function default.register_decorations()
	-- Savanna bare dirt patches.
	-- Must come before all savanna decorations that are placed on savanna grass.
	-- Noise is similar to long savanna grass noise, but scale inverted, to appear
	-- where long savanna grass is least dense and shortest.

	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:clay_dirt_with_savanna_grass"},
		sidelen = 4,
		noise_params = {
			offset = -1.5,
			scale = -1.5,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 4,
			persist = 1.0
		},
		biomes = {"savanna"},
		y_max = 138,
		y_min = 1,
		decoration = "default:clay_dirt",
		place_offset_y = -1,
		flags = "force_placement",
	})

if core.get_modpath("ethereal") then
	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_rainforest_litter"},
		sidelen = 4,
		noise_params = {
			offset = -1.5,
			scale = -1.5,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 4,
			persist = 1.0
		},
		biomes = {"rainforest"},
		y_max = 109,
		y_min = 1,
		decoration = "ethereal:grove_dirt",
		place_offset_y = -1,
		flags = "force_placement",
	})
end

	-- Boulders
	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .000003,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_1,
		replacements = {["default:stone_with_iron"] = "default:stone_with_coal"},
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .000003,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_2,
		replacements = {["default:stone_with_iron"] = "default:stone_with_sulfur"},
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .0000027,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_2,
		replacements = {["default:stone_with_iron"] = "default:stone_with_tin"},
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .0000027,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_2,
		replacements = {["default:stone_with_iron"] = "default:stone_with_copper"},
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .000003,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_2,
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .0000027,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_1,
		replacements = {["default:stone_with_iron"] = "default:stone_with_silver"},
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .0000027,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_2,
		replacements = {["default:stone_with_iron"] = "default:stone_with_chromium"},
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .0000027,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_2,
		replacements = {["default:stone_with_iron"] = "default:stone_with_zinc"},
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .000002,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_3,
		replacements = {["default:stone_with_coal"] = "default:stone_with_iron"},
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .0000016,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_2,
		replacements = {["default:stone_with_coal"] = "default:stone_with_gold"},
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .0000016,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_3,
		replacements = {["default:stone_with_coal"] = "default:stone_with_mese"},
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .0000016,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_2,
		replacements = {["default:stone_with_coal"] = "default:stone_with_mithril"},
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .0000016,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_3,
		replacements = {["default:stone_with_coal"] = "default:stone_with_diamond"},
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .0000016,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_3,
		replacements = {["default:stone_with_coal"] = "default:stone_with_blue_diamond"},
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = boulder_surfaces,
		sidelen = 80,
		fill_ratio = .0000016,
		biomes = boulder_biomes,
		y_max = 31000,
		y_min = 1,
		schematic = boulder_2,
		replacements = {["default:stone"] = "default:granite", ["default:stone_with_iron"] = "default:stone_with_sulfur",
	["default:stone_with_coal"] = "default:stone_with_copper"},
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = boulder_surfaces,
		num_spawn_by = 8,
	})

	-- Water pools in swamp areas
	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_swamp_grass"},
		place_offset_y = -1,
		sidelen = 16,
		fill_ratio = 0.01,
		biomes = {"swamp"},
		y_max = 2,
		y_min = 1,
		flags = "force_placement",
		decoration = "default:water_source",
		spawn_by = "default:dirt_with_swamp_grass",
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_swamp_grass"},
		place_offset_y = -1,
		sidelen = 16,
		fill_ratio = 0.1,
		biomes = {"swamp"},
		y_max = 2,
		y_min = 1,
		flags = "force_placement",
		decoration = "default:water_source",
		spawn_by = {"default:dirt_with_swamp_grass", "default:water_source"},
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_swamp_grass"},
		place_offset_y = -1,
		sidelen = 16,
		noise_params = {
			offset = 0.02,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"swamp"},
		y_max = 3,
		y_min = 3,
		schematic = small_pool,
		flags = "place_center_x, place_center_z",
		rotation = "random",
		spawn_by = "default:dirt_with_swamp_grass",
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_swamp_grass"},
		place_offset_y = -1,
		sidelen = 16,
		noise_params = {
			offset = 0.02,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"swamp"},
		y_max = 4,
		y_min = 4,
		schematic = small_pool,
		flags = "place_center_x, place_center_z",
		rotation = "random",
		spawn_by = "default:dirt_with_swamp_grass",
		num_spawn_by = 8,
	})

	core.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_swamp_grass"},
		place_offset_y = -1,
		sidelen = 16,
		noise_params = {
			offset = 0.02,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"swamp"},
		y_max = 5,
		y_min = 5,
		schematic = small_pool,
		flags = "place_center_x, place_center_z",
		rotation = "random",
		spawn_by = "default:dirt_with_swamp_grass",
		num_spawn_by = 8,
	})

	-- Apple tree and beech tree log

	core.register_decoration({
		name = "default:apple_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = .0016,
			scale = 0.0001,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_max = 109,
		y_min = 1,
		schematic = default.apple_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		name = "default:beech_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = .024,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_max = 109,
		y_min = 1,
		schematic = default.beech_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		name = "default:beech_log",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0.0012,
			scale = 0.0007,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_max = 109,
		y_min = 1,
		schematic = default.beech_log,
		flags = "place_center_x",
		rotation = "random",
		spawn_by = "default:dirt_with_grass",
		num_spawn_by = 8,
	})

	-- Emergent jungle tree
	-- Due to 32 node height, altitude is limited and prescence depends on chunksize

	local chunksize
	if core.get_mapgen_chunksize then
		local v = core.get_mapgen_chunksize()
		chunksize = math.max(v.x, v.y, v.z)
	else
		chunksize = tonumber(core.get_mapgen_setting("chunksize"))
	end
	if chunksize >= 5 then
		core.register_decoration({
			name = "default:emergent_jungle_tree",
			deco_type = "schematic",
			place_on = {"default:dirt_with_rainforest_litter"},
			sidelen = 80,
			noise_params = {
				offset = 0.0,
				scale = 0.0025,
				spread = {x = 250, y = 250, z = 250},
				seed = 2685,
				octaves = 3,
				persist = 0.7
			},
			biomes = {"rainforest"},
			y_max = 32,
			y_min = 1,
			schematic = default.emergent_jungle_tree,
			flags = "place_center_x, place_center_z",
			rotation = "random",
			place_offset_y = -4,
		})
	end

	-- Jungle tree and log

	core.register_decoration({
		name = "default:jungle_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_rainforest_litter"},
		sidelen = 80,
		fill_ratio = .07,
		biomes = {"rainforest"},
		y_max = 109,
		y_min = 1,
		schematic = default.jungle_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	-- Rainforest swamp mangrove trees

	core.register_decoration({
		name = "default:mangrove_tree(rainforest_swamp)",
		deco_type = "schematic",
		place_on = {"default:dirt"},
		sidelen = 16,
		-- Noise tuned to place swamp trees where reed is absent
		noise_params = {
			offset = 0.0,
			scale = -0.1,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 1,
			persist = 0.5
		},
		biomes = {"rainforest_swamp"},
		y_max = 0,
		y_min = 0,
		schematic = default.mangrove_tree1,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		name = "default:jungle_log",
		deco_type = "schematic",
		place_on = {"default:dirt_with_rainforest_litter"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.005,
		biomes = {"rainforest"},
		y_max = 109,
		y_min = 1,
		schematic = default.jungle_log,
		flags = "place_center_x",
		rotation = "random",
		spawn_by = "default:dirt_with_rainforest_litter",
		num_spawn_by = 8,
	})

	-- Mangrove tree

	core.register_decoration({
		name = "default:mangrove_tree(swamp)",
		deco_type = "schematic",
		place_on = {"default:dirt_with_swamp_grass", "default:silt"},
		sidelen = 16,
		fill_ratio = 0.2,
		biomes = {"swamp", "swamp_shore"},
		y_max = 5,
		y_min = 0,
		schematic = default.mangrove_tree1,
		flags = "place_center_x, place_center_z",
		rotation = "random",
		spawn_by = {"default:water_source", "default:fresh_water_source"},
		num_spawn_by = 1,
	})

	-- Orange tree

local on_w = "default:dirt_with_rainforest_litter"
local in_w = "rainforest"
if core.get_modpath("ethereal") then
	on_w = "ethereal:grove_dirt"
	in_w = "subtropical_forest"
end
	core.register_decoration({
		name = "default:orange_tree",
		deco_type = "schematic",
		place_on = {on_w},
		sidelen = 80,
		fill_ratio = .0002,
		biomes = {in_w},
		y_max = 64,
		y_min = 1,
		schematic = default.orange_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	-- Taiga and temperate coniferous forest pine tree, small pine tree and log

	core.register_decoration({
		name = "default:pine_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow", "default:dirt_with_coniferous_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.010,
			scale = 0.048,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"taiga", "coniferous_forest"},
		y_max = 138,
		y_min = 4,
		schematic = default.pine_tree,
		flags = "place_center_x, place_center_z",
	})

	core.register_decoration({
		name = "default:small_pine_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow", "default:dirt_with_coniferous_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.010,
			scale = -0.048,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"taiga", "coniferous_forest"},
		y_max = 138,
		y_min = 4,
		schematic = default.small_pine_tree,
		flags = "place_center_x, place_center_z",
	})

	core.register_decoration({
		name = "default:pine_log",
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow", "default:dirt_with_coniferous_litter"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0018,
		biomes = {"taiga", "coniferous_forest"},
		y_max = 138,
		y_min = 4,
		schematic = default.pine_log,
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"default:dirt_with_snow", "default:dirt_with_coniferous_litter"},
		num_spawn_by = 8,
	})

	-- Acacia tree and log

	core.register_decoration({
		name = "default:acacia_tree",
		deco_type = "schematic",
		place_on = {"default:clay_dirt_with_savanna_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"savanna"},
		y_max = 109,
		y_min = 1,
		schematic = default.acacia_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		name = "default:acacia_log",
		deco_type = "schematic",
		place_on = {"default:clay_dirt_with_savanna_grass"},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"savanna"},
		y_max = 109,
		y_min = 1,
		schematic = default.acacia_log,
		flags = "place_center_x",
		rotation = "random",
		spawn_by = "default:clay_dirt_with_savanna_grass",
		num_spawn_by = 8,
	})

	-- Aspen tree and log

	core.register_decoration({
		name = "default:aspen_tree2",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = -0.0004,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"grassland"},
		y_max = 20,
		y_min = 1,
		schematic = default.aspen_tree2,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		name = "default:aspen_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = -0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_max = 109,
		y_min = 1,
		schematic = default.aspen_tree,
		flags = "place_center_x, place_center_z",
	})

	core.register_decoration({
		name = "default:aspen_log",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = -0.0008,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_max = 109,
		y_min = 1,
		schematic = default.aspen_log,
		flags = "place_center_x",
		rotation = "random",
		spawn_by = "default:dirt_with_grass",
		num_spawn_by = 8,
	})

	-- Birch tree

	core.register_decoration({
		name = "default:birch_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = .0008,
			scale = 0.0001,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_max = 109,
		y_min = 1,
		schematic = default.birch_tree1,
		flags = "place_center_x, place_center_z",
	})

	-- Coco palms

	core.register_decoration({
		name = "default:coco_palm1",
		deco_type = "schematic",
		place_on = {"default:sand"},
		sidelen = 80,
		fill_ratio = 0.0025,
		biomes = {"desert_ocean", "sandstone_desert_ocean", "rainforest_ocean",
			"grassland_ocean", "subtropical_forest_ocean", "scorched_ocean"},
		y_max = 3,
		y_min = 1,
		schematic = default.coco_palm1,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		name = "default:coco_palm2",
		deco_type = "schematic",
		place_on = {"default:sand"},
		sidelen = 80,
		fill_ratio = 0.002,
		biomes = {"desert_ocean", "sandstone_desert_ocean", "rainforest_ocean",
			"grassland_ocean", "subtropical_forest_ocean", "scorched_ocean"},
		y_max = 3,
		y_min = 1,
		schematic = default.coco_palm2,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	-- Large cactus

	core.register_decoration({
		name = "default:large_cactus",
		deco_type = "schematic",
		place_on = {"default:desert_sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.0003,
			scale = 0.0009,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert"},
		y_max = 109,
		y_min = 4,
		schematic = default.large_cactus,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	core.register_decoration({
		name = "default:large_cactus_fruiting",
		deco_type = "schematic",
		place_on = {"default:desert_sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.0004,
			scale = 0.0009,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert"},
		y_max = 109,
		y_min = 4,
		schematic = default.large_cactus_fruiting,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	-- Cactus

	core.register_decoration({
		name = "default:cactus(desert)",
		deco_type = "simple",
		place_on = {"default:desert_sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.0004,
			scale = 0.00045,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert"},
		y_max = 138,
		y_min = 4,
		decoration = "default:cactus",
		height = 2,
		height_max = 5,
	})

	core.register_decoration({
		name = "default:cactus(sandstone_desert)",
		deco_type = "simple",
		place_on = {"default:sand"},
		sidelen = 80,
		fill_ratio = 0.0025,
		biomes = {"sandstone_desert"},
		y_max = 138,
		y_min = 4,
		decoration = "default:cactus",
		height = 2,
		height_max = 3,
	})

	-- Reed

	-- Dirt version for rainforest swamp

	core.register_decoration({
		name = "default:reed_on_dirt",
		deco_type = "schematic",
		place_on = {"default:dirt"},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"rainforest_swamp"},
		y_max = 0,
		y_min = 0,
		schematic = default.reed_on_dirt,
	})

	-- Clay dirt version for savanna shore

	core.register_decoration({
		name = "default:reed_on_clay_dirt",
		deco_type = "schematic",
		place_on = {"default:clay_dirt"},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"savanna_shore"},
		y_max = 0,
		y_min = 0,
		schematic = default.reed_on_clay_dirt,
	})

	if core.get_modpath("ethereal") and core.get_modpath("ecology") then
core.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:grove_dirt",
	sidelen = 16,
	noise_params = {
		offset = .01,
		scale = .015,
		spread = {x = 100, y = 100, z = 100},
		seed = 137,
		octaves = 3,
		persist = .7,
	},
	biomes = {"subtropical_forest"},
	y_max = 109,
	y_min = 1,
	schematic = {size = {x = 1, y = 4, z = 1}, data = {
_,
{name = "ecology:bamboo_small"},
{name = "ecology:bamboo_small"},
{name = "ecology:bamboo_small_top"}},
yslice_prob = {{ypos = 2, prob = 127}}},
})
	end

	-- Bush

	core.register_decoration({
		name = "default:bush",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"grassland", "deciduous_forest"},
		y_max = 109,
		y_min = 1,
		place_offset_y = 1,
		schematic = default.bush,
		flags = "place_center_x, place_center_z",
	})

	core.register_decoration({
		name = "default:bush_fruiting",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.005,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"grassland", "deciduous_forest"},
		y_max = 109,
		y_min = 1,
		place_offset_y = 1,
		schematic = default.bush,
		replacements = {["default:bush_leaves"] = "default:bush_leaves_fruiting"},
		flags = "place_center_x, place_center_z",
	})

	-- Blueberry bush

	core.register_decoration({
		name = "default:blueberry_bush",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass", "default:dirt_with_snow"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 697,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"grassland", "snowy_grassland"},
		y_max = 138,
		y_min = 1,
		place_offset_y = 1,
		schematic = default.blueberry_bush,
		flags = "place_center_x, place_center_z",
	})

	-- Acacia bush

	core.register_decoration({
		name = "default:acacia_bush",
		deco_type = "schematic",
		place_on = {"default:clay_dirt_with_savanna_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 90155,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"savanna"},
		y_max = 109,
		y_min = 1,
		place_offset_y = 1,
		schematic = default.acacia_bush,
		flags = "place_center_x, place_center_z",
	})

	-- Pine bush

	core.register_decoration({
		name = "default:pine_bush",
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"taiga", "snowy_grassland"},
		y_max = 138,
		y_min = 4,
		place_offset_y = 1,
		schematic = default.pine_bush,
		flags = "place_center_x, place_center_z",
	})

	-- Grasses

	register_grass_decoration(-0.03,  0.09,  5)
	register_grass_decoration(-0.015, 0.075, 4)
	register_grass_decoration(0,      0.06,  3)
	register_grass_decoration(0.015,  0.045, 2)
	register_grass_decoration(0.03,   0.03,  1)

	-- Savanna grasses

	register_savanna_grass_decoration(0.01, 0.05,  5)
	register_savanna_grass_decoration(0.03, 0.03,  4)
	register_savanna_grass_decoration(0.05, 0.01,  3)
	register_savanna_grass_decoration(0.07, -0.01, 2)
	register_savanna_grass_decoration(0.09, -0.03, 1)

	-- Ferns

	register_fern_decoration(14936, 3)
	register_fern_decoration(801,   2)
	register_fern_decoration(5,     1)

	-- Papyrus

	core.register_decoration({
		name = "default:papyrus",
		deco_type = "simple",
		place_on = {"default:sand", "default:dirt_with_rainforest_litter", "default:dirt_with_swamp_grass"},
		sidelen = 16,
		noise_params = {
			offset = -.3,
			scale = .7,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 3,
			persist = .7
		},
		biomes = {"desert_ocean", "rainforest", "swamp"},
		y_min = 1,
		y_max = 1,
		decoration = "default:papyrus",
	})

	-- Bulrushes

	core.register_decoration({
		name = "default:bulrush",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -.3,
			scale = .7,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 3,
			persist = .7
		},
		biomes = {"deciduous_forest"},
		y_max = 1,
		y_min = 1,
		decoration = {"default:bulrush_1", "default:bulrush_2"},
		spawn_by = {"default:water_source", "default:fresh_water_source"},
		num_spawn_by = 1,
	})

	-- Jungle grasses

	core.register_decoration({
		name = "default:jungle_grass",
		deco_type = "simple",
		place_on = {"default:dirt_with_rainforest_litter", "default:dirt_with_swamp_grass"},
		sidelen = 80,
		fill_ratio = .1,
		biomes = {"rainforest", "swamp"},
		y_max = 109,
		y_min = 1,
		decoration = {"default:jungle_grass_1", "default:jungle_grass_2", "default:jungle_grass_3"},
	})

	-- Swamp grasses

	core.register_decoration({
		name = "default:swamp_grass",
		deco_type = "simple",
		place_on = {"default:dirt_with_swamp_grass"},
		sidelen = 80,
		fill_ratio = .35,
		biomes = {"swamp"},
		y_max = 6,
		y_min = 1,
		decoration = {"default:swamp_grass_1", "default:swamp_grass_2", "default:swamp_grass_3", "default:swamp_grass_4", "default:swamp_grass_5"},
		param2 = 0,
		param2_max = 3,
	})

	-- Subtrop grass
if core.get_modpath("ethereal") then
	core.register_decoration({
		name = "default:subtrop_grass1",
		deco_type = "simple",
		place_on = {"ethereal:grove_dirt"},
		sidelen = 80,
		fill_ratio = .35,
		biomes = {"rainforest", "subtropical_forest"},
		y_max = 109,
		y_min = 1,
		decoration = "default:subtrop_grass",
		param2 = 0,
		param2_max = 3,
	})
end
if not core.get_modpath("ecology") then
	core.register_decoration({
		name = "default:subtrop_grass2",
		deco_type = "simple",
		place_on = {"default:dirt_with_rainforest_litter"},
		sidelen = 80,
		fill_ratio = .35,
		biomes = {"rainforest"},
		y_max = 109,
		y_min = 1,
		decoration = "default:subtrop_grass",
		param2 = 0,
		param2_max = 3,
	})
end

	-- Boston fern

	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_rainforest_litter"},
		sidelen = 16,
		fill_ratio = .05,
		biomes = {"rainforest"},
		y_max = 109,
		y_min = 1,
		decoration = "default:boston_fern",
	})

	-- Dry shrub

	core.register_decoration({
		name = "default:dry_shrub",
		deco_type = "simple",
		place_on = {"default:desert_sand", "default:sand", "default:silver_sand"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = .02,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = .6
		},
		biomes = {"desert", "sandstone_desert", "cold_desert"},
		y_max = 31000,
		y_min = 2,
		decoration = "default:dry_shrub",
	})

	-- Frost crystal spike & Frost grass

	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_blue_moss"},
		sidelen = 80,
		fill_ratio = .02,
		biomes = {"frost"},
		y_max = 31000,
		y_min = 1,
		decoration = {"default:crystal_spike", "default:frost_grass"},
	})

	-- Generate rocks

	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:sand", "default:silver_sand", "default:dirt_with_grass", "default:dirt_with_coniferous_litter",
			"default:clay_dirt", "default:dirt_with_rainforest_litter", "default:clay_dirt_with_savanna_grass", "ethereal:grove_dirt"},
		sidelen = 80,
		fill_ratio = .0005,
		biomes = {"sandstone_desert", "cold_desert", "grassland", "deciduous_forest", "coniferous_forest", "rainforest", "savanna", "subtropical_forest"},
		y_max = 31000,
		y_min = -200,
		decoration = "default:rock",
		param2 = 0,
		param2_max = 3,
	})

	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:desert_sand"},
		sidelen = 80,
		fill_ratio = .0005,
		biomes = {"desert"},
		y_max = 31000,
		y_min = -200,
		decoration = "default:desert_rock",
		param2 = 0,
		param2_max = 3,
	})

	-- Poison ivy

	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 48,
		fill_ratio = .001,
		biomes = {"grassland", "deciduous_forest"},
		y_max = 109,
		y_min = 3,
		decoration = "default:poison_ivy_3",
		spawn_by = "default:dirt_with_grass",
		num_spawn_by = 8,
	})

	-- Juncus

	core.register_decoration({
		name = "default:juncus",
		deco_type = "simple",
		place_on = {"default:sand", "default:dirt_with_rainforest_litter", "default:dirt_with_swamp_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = .02,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = .6
		},
		biomes = {"desert_ocean", "rainforest", "swamp"},
		y_max = 2,
		y_min = 1,
		decoration = {"default:juncus_1", "default:juncus_2"},
	})

	-- Marram grass

	core.register_decoration({
		name = "default:marram_grass",
		deco_type = "simple",
		place_on = {"default:sand"},
		sidelen = 4,
		noise_params = {
			offset = -.7,
			scale = 4.,
			spread = {x = 16, y = 16, z = 16},
			seed = 513337,
			octaves = 1,
			persist = 0,
			flags = "absvalue, eased"
		},
		biomes = {"coniferous_forest_dunes", "grassland_dunes"},
		y_max = 6,
		y_min = 4,
		decoration = {"default:marram_grass_1", "default:marram_grass_2", "default:marram_grass_3"},
		param2 = 0,
		param2_max = 3,
	})

	-- Tundra moss

	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:permafrost_with_stones"},
		sidelen = 4,
		noise_params = {
			offset = -.8,
			scale = 2.,
			spread = {x = 100, y = 100, z = 100},
			seed = 53995,
			octaves = 3,
			persist = 1.
		},
		biomes = {"tundra"},
		y_max = 50,
		y_min = 2,
		decoration = "default:permafrost_with_moss",
		place_offset_y = -1,
		flags = "force_placement",
	})

	-- Tundra patchy snow

	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:permafrost_with_moss", "default:permafrost_with_stones", "default:stone", "default:gravel"},
		sidelen = 4,
		noise_params = {
			offset = 0,
			scale = 1.,
			spread = {x = 100, y = 100, z = 100},
			seed = 172555,
			octaves = 3,
			persist = 1.
		},
		biomes = {"tundra", "tundra_beach"},
		y_max = 50,
		y_min = 1,
		decoration = "default:snow",
	})

	-- Coral reef

	core.register_decoration({
		name = "default:corals",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 50, y = 50, z = 50},
			seed = 7013,
			octaves = 3,
			persist = .7,
		},
		biomes = {"desert_ocean", "savanna_ocean", "rainforest_ocean"},
		y_max = -2,
		y_min = -8,
		flags = "force_placement",
		decoration = {"default:coral_green", "default:coral_magenta", "default:coral_cyan", "default:coral_red", "default:coral_blue",
	"default:coral_magenta_tip", "default:coral_brown", "default:coral_orange", "ecology:orange_coral", "ecology:fire_coral",
	"ecology:horn", "ecology:bubble", "ecology:coral_brain", "ecology:coral_tube", "ecology:blue_coral", "default:coral_skeleton"},
	})

	core.register_decoration({
		name = "default:coral_magenta",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 16,
		noise_params = {
			offset = -.5,
			scale = .63,
			spread = {x = 100, y = 100, z = 100},
			seed = 7013,
			octaves = 3,
			persist = .1,
		},
		biomes = {"desert_ocean", "savanna_ocean", "rainforest_ocean"},
		y_max = -2,
		y_min = -8,
		flags = "force_placement",
		decoration = "default:coral_magenta",
		height = 1,
		height_max = 2,
	})

	-- Kelps and seaweeds

	core.register_decoration({
		name = "default:kelp_yellow_and_brown",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 16,
		noise_params = {
			offset = -.04,
			scale = .1,
			spread = {x = 200, y = 200, z = 200},
			seed = 87112,
			octaves = 3,
			persist = .7
		},
		biomes = {"taiga_ocean", "snowy_grassland_ocean", "grassland_ocean", "coniferous_forest_ocean",
			"deciduous_forest_ocean", "sandstone_desert_ocean", "cold_desert_ocean"},
		y_max = -5,
		y_min = -10,
		flags = "force_placement",
		decoration = {"default:kelp_yellow", "default:kelp_brown"},
		param2 = 48,
		param2_max = 96,
	})

	core.register_decoration({
		name = "default:alga",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 50, y = 50, z = 50},
			seed = 7013,
			octaves = 3,
			persist = .7,
		},
		biomes = {"desert_ocean", "savanna_ocean", "rainforest_ocean"},
		y_max = -2,
		y_min = -8,
		flags = "force_placement",
		decoration = "default:alga",
	})

	core.register_decoration({
		name = "default:seaweed",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 50, y = 50, z = 50},
			seed = 7013,
			octaves = 3,
			persist = .7,
		},
		biomes = {"desert_ocean", "savanna_ocean", "rainforest_ocean"},
		y_max = -5,
		y_min = -10,
		flags = "force_placement",
		decoration = "default:seaweed",
		param2 = 48,
		param2_max = 96,
	})

	core.register_decoration({
		name = "default:seagrass",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 16,
		noise_params = {
			offset = -.04,
			scale = .1,
			spread = {x = 200, y = 200, z = 200},
			seed = 87112,
			octaves = 3,
			persist = .7
		},
		biomes = {"desert_ocean", "savanna_ocean", "rainforest_ocean"},
		y_max = -2,
		y_min = -8,
		flags = "force_placement",
		decoration = {"default:seagrass", "default:seagrass_green", "default:seagrass_red"},
	})

	core.register_decoration({
		name = "default:kelp_dark_green_and_green",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 16,
		noise_params = {
			offset = -.04,
			scale = .1,
			spread = {x = 200, y = 200, z = 200},
			seed = 87112,
			octaves = 3,
			persist = .7
		},
		biomes = {"desert_ocean", "savanna_ocean", "rainforest_ocean"},
		y_max = -5,
		y_min = -10,
		flags = "force_placement",
		decoration = {"default:kelp_dark_green", "default:kelp_green"},
		param2 = 48,
		param2_max = 96,
	})

	core.register_decoration({
		name = "default:seaweed_grass",
		deco_type = "simple",
		place_on = {"default:dirt", "default:dirt_with_grass", "default:dirt_with_rainforest_litter"},
		place_offset_y = -1,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = .06,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = .8
		},
		y_max = 0,
		y_min = -8,
		flags = "force_placement",
		decoration = "default:seaweed_grass",
	})

	core.register_decoration({
		name = "default:sea_anemones",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 16,
		noise_params = {
			offset = -.04,
			scale = .3,
			spread = {x = 300, y = 300, z = 300},
			seed = 87112,
			octaves = 3,
			persist = .5
		},
		biomes = {"desert_ocean", "savanna_ocean", "rainforest_ocean"},
		y_max = -2,
		y_min = -8,
		flags = "force_placement",
		decoration = {"default:sea_anemone", "ecology:anemone"},
	})

	-- Ocealite crystals

	core.register_decoration({
		name = "default:ocealite_crystals",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = .02,
			spread = {x = 200, y = 200, z = 200},
			seed = 326,
			octaves = 3,
			persist = .6
		},
		biomes = ocean_floors,
		y_max = -27,
		y_min = -1100,
		flags = "force_placement",
		decoration = "default:sand_with_ocealite_6",
	})
end


--
-- Detect mapgen to select functions
--[[	To SEE

core.clear_registered_biomes()
core.clear_registered_ores()
core.clear_registered_decorations()
]]
local mg_name = core.get_mapgen_setting("mg_name")

if mg_name == "v6" then
	default.register_mgv6_ores()
	default.register_mgv6_decorations()
else
	default.register_biomes()
	default.register_ores()
	default.register_decorations()
end
