
if core.get_modpath("aztec") then

bonemeal:add_crop({
	{"aztec:cotton_red_S", 8, "aztec:seed_cotton_red"},
	{"aztec:cotton_orange_S", 8, "aztec:seed_cotton_orange"},
	{"aztec:cotton_yellow_S", 8, "aztec:seed_cotton_yellow"},
	{"aztec:cotton_green_S", 8, "aztec:seed_cotton_green"},
	{"aztec:cotton_cyan_S", 8, "aztec:seed_cotton_cyan"},
	{"aztec:cotton_light_blue_S", 8, "aztec:seed_cotton_light_blue"},
	{"aztec:cotton_blue_S", 8, "aztec:seed_cotton_blue"},
	{"aztec:cotton_violet_S", 8, "aztec:seed_cotton_violet"},
	{"aztec:cotton_magenta_S", 8, "aztec:seed_cotton_magenta"},
	{"aztec:cotton_pink_S", 8, "aztec:seed_cotton_pink"},
	{"aztec:cotton_dark_green_S", 8, "aztec:seed_cotton_dark_green"},
	{"aztec:cotton_brown_S", 8, "aztec:seed_cotton_brown"},
	{"aztec:cotton_black_S", 8, "aztec:seed_cotton_black"}
})
end


if core.get_modpath("ethereal") then

bonemeal:add_sapling({
	{"ethereal:yellow_tree_sapling", ethereal.grow_yellow_tree, "soil"},
	{"ethereal:banana_tree_sapling", ethereal.grow_banana_tree, "soil"},
	{"ethereal:frost_tree_sapling", ethereal.grow_frost_tree, "soil"},
	{"ethereal:willow_sapling", ethereal.grow_willow_tree, "soil"},
	{"ethereal:redwood_sapling", ethereal.grow_redwood_tree, "soil"},
	{"ethereal:sakura_sapling", ethereal.grow_sakura_tree, "soil"}
})

bonemeal:add_deco({
	{"ethereal:dry_dirt_with_fiery_grass", {"ethereal:dry_shrub", "", "", "", ""}, {}},
	{"ethereal:grove_dirt", {"default:grass_3", "default:grass_4", "default:grass_5", ""},
		{"ethereal:fern", "flowers:daisy", "flowers:dandelion", "flowers:geranium",
		"flowers:rose", "flowers:tulip", "flowers:viola", "farming:strawberry_S10"}}
})
end


if core.get_modpath("caverealms") then

bonemeal:add_sapling({
	{"caverealms:mushroom_sapling", nil, "caverealms:rocks_with_lichen"},
	{"caverealms:e_mushroom_sapling", nil, "caverealms:rocks_with_lichen"}
})

-- superliser
core.register_craft({
	type = "shapeless",
	output = "bonemeal:superliser 2",
	recipe = {"bonemeal:fertiliser", "caverealms:mycena"}
})
end


if core.get_modpath("dye") then

	local bonemeal_dyes = {mulch = "brown", bonemeal = "white", fertiliser = "orange", superliser = "green"}

	for mat, dye in pairs(bonemeal_dyes) do

		core.register_craft({
			output = "dye:" .. dye .. " 4",
			recipe = {{"bonemeal:" .. mat}}
		})
	end
end
