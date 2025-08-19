
local stoneNdiamite = {"default:stone", "default:diamite", "default:bedrock"}

core.register_ore({
	ore_type = "scatter",
	ore = "technic:mineral_uranium",
	wherein = {stoneNdiamite},
	clust_scarcity = 8*8*8,
	clust_num_ores = 4,
	clust_size = 3,
	y_min = -300,
	y_max = -80,
	noise_threshold = .55,
	noise_params = {
		offset = 0,
		scale = 1,
		spread = {x = 100, y = 100, z = 100},
		seed = 420,
		octaves = 3,
		persist = 0.7
	},
})

local lead_params = {
	offset = 0,
	scale = 1,
	spread = {x = 100, y = 100, z = 100},
	seed = 423,
	octaves = 3,
	persist = 0.7
}

core.register_ore({
	ore_type = "scatter",
	ore = "technic:mineral_lead",
	wherein = {stoneNdiamite},
	clust_scarcity = 9*9*9,
	clust_num_ores = 5,
	clust_size = 3,
	y_min = -16,
	y_max = 16,
	noise_threshold = .3,
	noise_params = lead_params,
})

core.register_ore({
	ore_type = "scatter",
	ore = "technic:mineral_lead",
	wherein = {stoneNdiamite},
	clust_scarcity = 8*8*8,
	clust_num_ores = 5,
	clust_size = 3,
	y_min = -128,
	y_max = -16,
	noise_threshold = .3,
	noise_params = lead_params,
})

core.register_ore({
	ore_type = "scatter",
	ore = "technic:mineral_lead",
	wherein = {stoneNdiamite},
	clust_scarcity = 6*6*6,
	clust_num_ores = 5,
	clust_size = 3,
	y_min = -31000,
	y_max = -128,
	flags = "absheight",
	noise_threshold = .3,
	noise_params = lead_params,
})
