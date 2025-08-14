--Extreme Survival created by Maikerumine
-- Luanti mod: "Extreme Survival"
-- namespace: es
--https://github.com/maikerumine

local BasicStones = {"default:stone", "default:diamite", "default:bedrock"}

core.register_ore({
	ore_type       = "scatter",
	ore            = "gems:stone_with_emerald",
	wherein        = BasicStones,
	clust_scarcity = 24*24*24,
	clust_num_ores = 1,
	clust_size     = 1,
	y_max     = 4,
	y_min     = -31000,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "gems:stone_with_emerald",
	wherein        = BasicStones,
	clust_scarcity = 24*24*24,
	clust_num_ores = 4,
	clust_size     = 4,
	y_max     = -100,
	y_min     = -31000,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "gems:stone_with_ruby",
	wherein        = BasicStones,
	clust_scarcity = 20*20*20,
	clust_num_ores = 1,
	clust_size     = 1,
	y_max     = 10,
	y_min     = -31000,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "gems:stone_with_ruby",
	wherein        = BasicStones,
	clust_scarcity = 20*20*20,
	clust_num_ores = 7,
	clust_size     = 3,
	y_max     = -300,
	y_min     = -31000,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "es:stone_with_aikerum",
	wherein        = BasicStones,
	clust_scarcity = 23*23*23,
	clust_num_ores = 1,
	clust_size     = 1,
	y_max     = -140,
	y_min     = -31000,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "es:stone_with_aikerum",
	wherein        = BasicStones,
	clust_scarcity = 23*23*23,
	clust_num_ores = 5,
	clust_size     = 4,
	y_max     = -400,
	y_min     = -31000,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "es:stone_with_infinium",
	wherein        = BasicStones,
	clust_scarcity = 16*18*16,
	clust_num_ores = 1,
	clust_size     = 1,
	y_max     = -190,
	y_min     = -31000,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "es:stone_with_infinium",
	wherein        = BasicStones,
	clust_scarcity = 20*12*20,
	clust_num_ores = 5,
	clust_size     = 3,
	y_max     = -430,
	y_min     = -31000,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "es:stone_with_magentium",
	wherein        = BasicStones,
	clust_scarcity = 16*18*16,
	clust_num_ores = 5,
	clust_size     = 5,
	y_max          = -190,
	y_min          = -31000,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_diamond",
	wherein        = BasicStones,
	clust_scarcity = 14 * 14 * 14,
	clust_num_ores = 6,
	clust_size     = 5,
	y_max          = -1256,
	y_min          = -15000,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_mese",
	wherein        = BasicStones,
	clust_scarcity = 14 * 14 * 14,
	clust_num_ores = 5,
	clust_size     = 3,
	y_max          = -256,
	y_min          = -31000,
})

core.register_ore({ 
	ore_type        = "blob",
	ore             = "es:strange_clay_grey",
	wherein         = {"default:stone"},
	clust_scarcity  = 24 * 24 * 24,
	clust_size      = 7,
	y_max           = 14,
	y_min           = 5,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 3100, y = 3100, z = 3100},
		seed = 23,
		octaves = 3,
		persist = 0.70
	},
})

core.register_ore({
	ore_type        = "blob",
	ore             = "es:strange_clay_black",
	wherein         = {"default:stone"},
	clust_scarcity  = 24 * 24 * 24,
	clust_size      = 7,
	y_max           = 17,
	y_min           = 10,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 3100, y = 3100, z = 3100},
		seed = 23,
		octaves = 3,
		persist = 0.70
	},
})

core.register_ore({
	ore_type        = "blob",
	ore             = "es:strange_clay_maroon",
	wherein         = {"default:stone"},
	clust_scarcity  = 24 * 24 * 24,
	clust_size      = 7,
	y_max           = 29,
	y_min           = 20,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 3100, y = 3100, z = 3100},
		seed = 23,
		octaves = 3,
		persist = 0.70
	},
})

core.register_ore({
	ore_type        = "blob",
	ore             = "es:strange_clay_red",
	wherein         = {"default:sandstone"},
	clust_scarcity  = 24 * 24 * 24,
	clust_size      = 7,
	y_max           = 37,
	y_min           = 30,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 3100, y = 3100, z = 3100},
		seed = 23,
		octaves = 3,
		persist = 0.70
	},
	biomes = {"sandstone_desert"}
})

core.register_ore({
	ore_type        = "blob",
	ore             = "es:strange_clay_brown",
	wherein         = {"default:stone"},
	clust_scarcity  = 24 * 24 * 24,
	clust_size      = 7,
	y_max           = 43,
	y_min           = 40,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 3100, y = 3100, z = 3100},
		seed = 23,
		octaves = 3,
		persist = 0.70
	},
})

core.register_ore({
	ore_type        = "blob",
	ore             = "es:strange_clay_blue",
	wherein         = {"default:stone"},
	clust_scarcity  = 24 * 24 * 24,
	clust_size      = 7,
	y_max           = 44,
	y_min           = 40,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 3100, y = 3100, z = 3100},
		seed = 23,
		octaves = 3,
		persist = 0.70
	},
})

core.register_ore({
	ore_type        = "blob",
	ore             = "es:strange_clay_orange",
	wherein         = {"default:sandstone"},
	clust_scarcity  = 24 * 24 * 24,
	clust_size      = 7,
	y_max           = 47,
	y_min           = 40,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 3100, y = 3100, z = 3100},
		seed = 23,
		octaves = 3,
		persist = 0.70
	},
	biomes = {"sandstone_desert"}
})

core.register_ore({
	ore_type        = "blob",
	ore             = "es:strange_clay_blue",
	wherein         = {"default:stone"},
	clust_scarcity  = 24 * 24 * 24,
	clust_size      = 4,
	y_max           = -120,
	y_min           = -31000,
	noise_threshold = 0.4,
	noise_params    = {
		offset = 0,
		scale = 15,
		spread = {x = 130, y = 130, z = 130},
		seed = 24,
		octaves = 3,
		persist = 0.70
	},
	biomes = {"aidenland"}
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "default:lava_source",
	wherein        = {"default:stone", "default:diamite", "default:desert_stone", "default:sandstone", "default:bedrock"},
	clust_scarcity = 25*25*25,
	clust_num_ores = 2,
	clust_size     = 2,
	y_max          = -51,
	y_min          = -1150,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "default:lava_source",
	wherein        = {"default:stone", "default:diamite", "default:desert_stone", "default:sandstone", "default:bedrock"},
	clust_scarcity = 35*35*35,
	clust_num_ores = 25,
	clust_size     = 8,
	y_max          = -549,
	y_min          = -1150,
})

core.register_ore({
	ore_type		= "scatter",
	ore				= "default:coal_block",
	wherein			= "default:desert_stone",
	clust_scarcity	= 40*40*40,
	clust_num_ores	= 32,
	clust_size		= 5,
	y_max		= -8,
	y_min		= -31000,
})

core.register_ore({-- For fun
	ore_type       = "scatter",
	ore            = "default:ocealitelamp",-- Doesn't interrupt light
	wherein        = "air",
	clust_scarcity = 64,
	clust_num_ores = 4,
	clust_size     = 2,
	y_max     = 2500,
	y_min     = 2000,
})

-- Aiden (mese) tree
core.register_decoration({
	deco_type = "schematic",
	place_on = {"es:clay_dirt_with_aiden_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.001,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"aidenland"},
	y_max = 31000,
	y_min = 1,
	schematic = aiden_tree,
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

-- Rubycane
core.register_decoration({
	deco_type = "schematic",
	place_on = {"es:clay_dirt_with_aiden_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.001,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"aidenland"},
	y_max = 31000,
	y_min = 1,
	schematic = rubycane,
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

-- Bunker

core.register_decoration({
	deco_type = "simple",
	place_on = {"es:clay_dirt_with_aiden_grass", "default:permafrost_with_stones"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.001,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"aidenland", "tundra"},
	y_max = 31000,
	y_min = 1,
	decoration = "schem_spawn:bunker",
	param2 = 0,
	param2_max = 3,
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"es:clay_dirt_with_aiden_grass"},
	sidelen = 16,
	fill_ratio = 0.1,
	biomes = {"aidenland"},
	y_max = 31000,
	y_min = 1,
	decoration = "es:radia_grass",
})

core.register_decoration({
	deco_type = "simple",
	place_on = {"es:clay_dirt_with_aiden_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.02,
		spread = {x = 20, y = 20, z = 20},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"aidenland"},
	y_max = 31000,
	y_min = 2,
	decoration = "es:dry_shrub",
})
