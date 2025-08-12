
local path = core.get_modpath("ethereal") .. "/schematics/"

-- load schematic tables
dofile(path .. "banana_tree.lua")
dofile(path .. "bamboo_tree.lua")
dofile(path .. "bush.lua")
dofile(path .. "waterlily.lua")
dofile(path .. "volcanos.lua")
dofile(path .. "frosttrees.lua")
dofile(path .. "yellowtree.lua")
dofile(path .. "willow.lua")
dofile(path .. "redwood_trees.lua")
dofile(path .. "sakura.lua")
dofile(path .. "igloo.lua")


-- helper function
local add_schem = function(a, b, c, d, e, f, g, h, i, j, k)

	-- if not 1 then biome disabled, don't add
	if g ~= 1 then return end

	core.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = 80,
		fill_ratio = b,
		biomes = c,
		y_min = d,
		y_max = e,
		schematic = f,
		flags = "place_center_x, place_center_z",
		replacements = h,
		spawn_by = i,
		num_spawn_by = j,
		rotation = k,
	})
end


-- igloo
add_schem("default:snow_block", .0003, {"icesheet"}, 3, 50,
	ethereal.igloo, ethereal.glacier, nil, "default:snow_block", 8, "random")

-- sakura tree
add_schem({"ethereal:grove_dirt"}, .003, {"subtropical_forest"}, 3, 23,
	ethereal.sakura_tree, ethereal.bamboo, nil, "ethereal:grove_dirt", 6, "random")

-- redwood tree
add_schem({"default:dirt_with_rainforest_litter"}, .0025, {"rainforest"}, 1, 100,
	ethereal.redwood_tree, ethereal.junglee, nil, "default:dirt_with_rainforest_litter", 8, "random")

-- banana tree
add_schem({"ethereal:grove_dirt"}, .02, {"rainforest"}, 1, 100,
	ethereal.bananatree, ethereal.grove, nil, nil, nil, "random")

-- healing tree
add_schem({"default:dirt_with_snow"}, .01, {"taiga"}, 119, 139,
	ethereal.yellowtree, ethereal.alpine, nil, nil, nil, "random")

-- crystal frost tree
add_schem({"default:dirt_with_blue_moss"}, .01, {"frost"}, 1, 139,
	ethereal.frosttrees, ethereal.frost, nil,
	"default:dirt_with_blue_moss", 6)

-- small lava crater
add_schem("ethereal:dry_dirt_with_fiery_grass", .01, {"fiery"}, 1, 100,
	ethereal.volcanom, ethereal.fiery, nil, "ethereal:dry_dirt_with_fiery_grass", 8)

-- large lava crater
add_schem("ethereal:dry_dirt_with_fiery_grass", .003, {"fiery"}, 1, 100,
	ethereal.volcanol, ethereal.fiery, nil, "ethereal:dry_dirt_with_fiery_grass", 8, "random")

-- willow tree
add_schem({"default:dirt_with_swamp_grass"}, .002, {"swamp"}, 1, 10,
	ethereal.willow, ethereal.swamp, nil,
	"default:dirt_with_swamp_grass", 6, "random")

-- apple tree
add_schem({"ethereal:grove_dirt"}, .003, {"subtropical_forest"}, 1, 100,
	default.apple_tree, ethereal.grassy, nil, nil, nil, "random")

-- birch tree
add_schem({"ethereal:grove_dirt"}, .004, {"subtropical_forest"}, 1, 100,
	default.birch_tree, ethereal.grassy)

-- orange tree
add_schem({"ethereal:grove_dirt"}, .004, {"subtropical_forest"}, 1, 100,
	default.small_orange_tree, ethereal.grassy)

-- bamboo tree
add_schem({"ethereal:grove_dirt"}, .025, {"subtropical_forest"}, 24, 100,
	ethereal.bambootree, ethereal.bamboo)

-- bush
add_schem({"ethereal:grove_dirt"}, .08, {"subtropical_forest"}, 24, 100, ethereal.bush,
	ethereal.bamboo)


-- place waterlily in beach areas
core.register_decoration({
	deco_type = "schematic",
	place_on = {"default:sand"},
	sidelen = 16,
	noise_params = {
		offset = -.12,
		scale = .3,
		spread = {x = 200, y = 200, z = 200},
		seed = 33,
		octaves = 3,
		persist = .7
	},
	biomes = {"desert_ocean", "scorched_ocean", "rainforest_ocean", "subtropical_forest_ocean"},
	y_min = 0,
	y_max = 0,
	schematic = ethereal.waterlily,
	rotation = "random"
})


-- coral reef
if ethereal.reefs == 1 then
	core.register_decoration({
		deco_type = "schematic",
		place_on = {"default:sand"},
		noise_params = {
			offset = -.15,
			scale = .1,
			spread = {x = 100, y = 100, z = 100},
			seed = 7013,
			octaves = 3,
			persist = 1,
		},
		biomes = {"desert_ocean", "rainforest_ocean"},
		y_min = -8,
		y_max = -2,
		schematic = ethereal.coral,
		flags = "place_center_x, place_center_z",
		rotation = "random"
	})
end
