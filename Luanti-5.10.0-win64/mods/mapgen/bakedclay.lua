
-- Baked Clay by TenPlus1 and Napiophelios

local clay = {
	{"white", "White"},
	{"grey", "Grey"},
	{"black", "Black"},
	{"red", "Red"},
	{"yellow", "Yellow"},
	{"green", "Green"},
	{"cyan", "Cyan"},
	{"blue", "Blue"},
	{"light_blue", "Light Blue"},
	{"magenta", "Magenta"},
	{"orange", "Orange"},
	{"violet", "Violet"},
	{"brown", "Brown"},
	{"pink", "Pink"},
	{"dark_grey", "Dark Grey"},
	{"dark_green", "Dark Green"},
}

for _, clay in pairs(clay) do

	core.register_node(":bakedclay:" .. clay[1], {
		description = clay[2] .. " Baked Clay",
		tiles = {"baked_clay_" .. clay[1] .. ".png"},
		groups = {cracky = 3, bakedclay = 1},
		sounds = default.node_sound_stone_defaults(),
	})

	core.register_node(":bakedclay:" .. clay[1] .. "block", {
		description = clay[2] .. " Baked Clay Block",
		tiles = {"baked_clay_" .. clay[1] .. ".png^bakedclay_block.png"},
		is_ground_content = false,
		groups = {cracky = 3, bakedclayblock = 1},
		sounds = default.node_sound_stone_defaults(),
	})

	core.register_craft({
		output = "bakedclay:" .. clay[1] .. "block 9",
		recipe = {
			{"bakedclay:" .. clay[1], "bakedclay:" .. clay[1], "bakedclay:" .. clay[1]},
			{"bakedclay:" .. clay[1], "bakedclay:" .. clay[1], "bakedclay:" .. clay[1]},
			{"bakedclay:" .. clay[1], "bakedclay:" .. clay[1], "bakedclay:" .. clay[1]}
		}
	})

	core.register_node(":bakedclay:" .. clay[1] .. "carved", {
		description = clay[2] .. " Carved Baked Clay",
		tiles = {
		"baked_clay_" .. clay[1] .. ".png^bakedclay_block.png",
		"baked_clay_" .. clay[1] .. ".png^bakedclay_block.png",
		"baked_clay_" .. clay[1] .. ".png^bakedclay_block_slab.png"},
		paramtype2 = "facedir",
		place_param2 = 0,
		is_ground_content = false,
		groups = {cracky = 3, bakedclaycarved = 1},
		sounds = default.node_sound_stone_defaults(),
	})

	core.register_craft({
		output = "bakedclay:" .. clay[1] .. "carved 2",
		recipe = {
			{"stairs:slab_bakedclay_".. clay[1] .. "block", "", "stairs:slab_bakedclay_".. clay[1] .. "block"},
			{"","", ""},
			{"stairs:slab_bakedclay_".. clay[1] .. "block", "", "stairs:slab_bakedclay_".. clay[1] .. "block"}
		}
	})

	core.register_node(":bakedclay:" .. clay[1] .. "brick", {
		description = clay[2] .. " Baked Clay Brick",
		tiles = {"baked_clay_" .. clay[1] .. ".png^bakedclay_brick.png"},
		paramtype2 = "facedir",
		place_param2 = 0,
		is_ground_content = false,
		groups = {cracky = 3, bakedclaybrick = 1},
		sounds = default.node_sound_stone_defaults(),
	})

	core.register_craft({
		output = "bakedclay:" .. clay[1] .. "brick 4",
		recipe = {
			{"bakedclay:" .. clay[1], "bakedclay:" .. clay[1]},
			{"bakedclay:" .. clay[1], "bakedclay:" .. clay[1]}
		}
	})

	-- craft from dye and any baked clay

	core.register_craft({
		output = "bakedclay:" .. clay[1] .. " 8",
		recipe = {
			{"group:bakedclay", "group:bakedclay", "group:bakedclay"},
			{"group:bakedclay", "dye:" .. clay[1], "group:bakedclay"},
			{"group:bakedclay", "group:bakedclay", "group:bakedclay"}
		}
	})

	core.register_craft({
		output = "bakedclay:" .. clay[1] .. "block 8",
		recipe = {
			{"group:bakedclayblock", "group:bakedclayblock", "group:bakedclayblock"},
			{"group:bakedclayblock", "dye:" .. clay[1], "group:bakedclayblock"},
			{"group:bakedclayblock", "group:bakedclayblock", "group:bakedclayblock"}
		}
	})

	core.register_craft({
		output = "bakedclay:" .. clay[1] .. "carved 8",
		recipe = {
			{"group:bakedclaycarved", "group:bakedclaycarved", "group:bakedclaycarved"},
			{"group:bakedclaycarved", "dye:" .. clay[1], "group:bakedclaycarved"},
			{"group:bakedclaycarved", "group:bakedclaycarved", "group:bakedclaycarved"}
		}
	})

	core.register_craft({
		output = "bakedclay:" .. clay[1] .. "brick 8",
		recipe = {
			{"group:bakedclaybrick", "group:bakedclaybrick", "group:bakedclaybrick"},
			{"group:bakedclaybrick", "dye:" .. clay[1], "group:bakedclaybrick"},
			{"group:bakedclaybrick", "group:bakedclaybrick", "group:bakedclaybrick"}
		}
	})

	if core.get_modpath("moreblocks") then
		stairsplus:register_all("bakedclay", "bakedclay_" .. clay[1], "bakedclay:" .. clay[1], {
			description = clay[2] .. " Baked Clay",
			tiles = {"baked_clay_" .. clay[1] .. ".png"},
			groups = {cracky = 3},
			sounds = default.node_sound_stone_defaults(),
		})

		stairsplus:register_all("bakedclay", "bakedclay_" .. clay[1] .. "block", "bakedclay:" .. clay[1] .."block", {
			description = clay[2] .. " Baked Clay Block",
			tiles = {"baked_clay_" .. clay[1] .. ".png^bakedclay_block.png"},
			groups = {cracky = 3},
			sounds = default.node_sound_stone_defaults(),
		})

		stairsplus:register_all("bakedclay", "bakedclay_" .. clay[1] .. "brick", "bakedclay:" .. clay[1] .."brick", {
			description = clay[2] .. " Baked Clay Brick",
			tiles = {"baked_clay_" .. clay[1] .. ".png^bakedclay_brick.png"},
			groups = {cracky = 3},
			sounds = default.node_sound_stone_defaults(),
		})
	end

	stairs.register_stair_and_slab("bakedclay_".. clay[1], "bakedclay:".. clay[1],
		{cracky = 3},
		{"baked_clay_" .. clay[1] .. ".png"},
		clay[2] .. " Baked Clay Stair",
		clay[2] .. " Baked Clay Slab",
		default.node_sound_stone_defaults(),
		true)

	stairs.register_stair_and_slab("bakedclay_".. clay[1] .. "block", "bakedclay:".. clay[1] .. "block",
		{cracky = 3},
		{"baked_clay_" .. clay[1] .. ".png^bakedclay_block.png"},
		clay[2] .. " Baked Clay Block Stair",
		clay[2] .. " Baked Clay Block Slab",
		default.node_sound_stone_defaults(),
		true)


	stairs.register_stair_and_slab("bakedclay_".. clay[1] .. "brick", "bakedclay:".. clay[1] .. "brick",
		{cracky = 3},
		{"baked_clay_" .. clay[1] .. ".png^bakedclay_brick.png"},
		clay[2] .. " Baked Clay Brick Stair",
		clay[2] .. " Baked Clay Brick Slab",
		default.node_sound_stone_defaults(),
		true)
end

-- cook clay block into white baked clay

core.register_craft({
	type = "cooking",
	output = "bakedclay:white",
	recipe = "default:clay",
})
