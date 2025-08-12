--Originally made by TenPlus1
--maikerumine added slabs and stairs
--20160321
--20171121  -added more blocks and intergrate with moreblocks / stairs plus
--for extreme survival game

local colours = {
	{"black",      "Black",      "#000000b0"},
	{"blue",       "Blue",       "#015dbb70"},
	{"brown",      "Brown",      "#a78c4570"},
	{"cyan",       "Cyan",       "#01ffd870"},
	{"dark_green", "Dark Green", "#005b0770"},
	{"dark_grey",  "Dark Grey",  "#303030b0"},
	{"green",      "Green",      "#61ff0170"},
	{"grey",       "Grey",       "#5b5b5bb0"},
	{"magenta",    "Magenta",    "#ff05bb70"},
	{"orange",     "Orange",     "#ff840170"},
	{"pink",       "Pink",       "#ff65b570"},
	{"red",        "Red",        "#ff000070"},
	{"violet",     "Violet",     "#2000c970"},
	{"white",      "White",      "#abababc0"},
	{"yellow",     "Yellow",     "#e3ff0070"},
}

for i = 1, #colours, 1 do
-- Wood
core.register_node("cblocks:wood_" .. colours[i][1], {
	description = colours[i][2] .. " Wooden Planks",
	tiles = {"default_wood.png^[colorize:" .. colours[i][3]},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1,not_in_craft_guide=1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_craft({
	output = "cblocks:wood_".. colours[i][1] .. " 2",
	recipe = {
		{"group:wood","group:wood", "dye:" .. colours[i][1]}
	}
})


--Cobble
core.register_node("cblocks:cobble_" .. colours[i][1], {
	description = colours[i][2] .. " Cobblestone",
	tiles = {"default_cobble.png^[colorize:" .. colours[i][3]},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1,not_in_craft_guide=1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = "cblocks:cobble_".. colours[i][1] .. " 2",
	recipe = {
		{"default:cobble","default:cobble", "dye:" .. colours[i][1]}
	}
})


-- stone brick
core.register_node("cblocks:stonebrick_" .. colours[i][1], {
	description = colours[i][2] .. " Stone Brick",
	tiles = {"default_stone_brick.png^[colorize:" .. colours[i][3]},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1,not_in_craft_guide=1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = "cblocks:stonebrick_".. colours[i][1] .. " 2",
	recipe = {
		{"default:stonebrick","default:stonebrick", "dye:" .. colours[i][1]}
	}
})

-- stone
core.register_node("cblocks:stone_" .. colours[i][1], {
	description = colours[i][2] .. " Stone",
	tiles = {"default_stone.png^[colorize:" .. colours[i][3]},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1,not_in_craft_guide=1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = "cblocks:stonebrick_".. colours[i][1] .. " 2",
	recipe = {
		{"default:stonebrick","default:stonebrick", "dye:" .. colours[i][1]}
	}
})

-- glass
core.register_node( "cblocks:glass_" .. colours[i][1], {
	description = colours[i][2] .. " Glass",
	tiles = {"cblocks.png^[colorize:" .. colours[i][3]},
	drawtype = "glasslike",
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = "blend",
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3,not_in_craft_guide=1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "cblocks:glass_".. colours[i][1] .. " 2",
	recipe = {
		{"default:glass","default:glass", "dye:" .. colours[i][1]}
	}
})

--Clay
core.register_node( "cblocks:clay_" .. colours[i][1], {
	description = colours[i][2] .. " Clay",
	tiles = {"default_clay.png^[colorize:" .. colours[i][3]},
	is_ground_content = false,
	groups = {crumbly = 2, oddly_breakable_by_hand = 2,not_in_craft_guide=1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = "cblocks:clay_".. colours[i][1] .. " 2",
	recipe = {
		{"default:clay","default:clay", "dye:" .. colours[i][1]}
	}
})


if core.get_modpath("moreblocks") then

--wood
	stairsplus:register_all("wood_" .. colours[i][1], "wood", "cblocks:wood_" .. colours[i][1], {
		description = "Coloured Wood",
		tiles ={"default_wood.png^[colorize:" .. colours[i][3]},
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
		sunlight_propagates = true,
	})

--cobble
	stairsplus:register_all("cobble_" .. colours[i][1], "cobble",  "cblocks:cobble_" .. colours[i][1], {
		description = "Coloured Cobblestone",
		tiles ={"default_cobble.png^[colorize:" .. colours[i][3]},
		groups = {cracky = 3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})
	
--stone brick
	stairsplus:register_all("stonebrick_" .. colours[i][1], "stonebrick",  "cblocks:stonebrick_" .. colours[i][1], {
		description = "Coloured Stone Brick",
		tiles ={"default_stone_brick.png^[colorize:" .. colours[i][3]},
		groups = {cracky = 2},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

--stone
	stairsplus:register_all("stone_" .. colours[i][1], "stone",  "cblocks:stone_" .. colours[i][1], {
		description = "Coloured Stone",
		tiles ={"default_stone.png^[colorize:" .. colours[i][3]},
		groups = {cracky = 3},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})
	
--clay
	stairsplus:register_all("clay_" .. colours[i][1], "clay",  "cblocks:clay_" .. colours[i][1], {
		description = "Coloured Clay",
		tiles ={"default_clay.png^[colorize:" .. colours[i][3]},
		groups = {crumbly = 3},
		sounds = default.node_sound_dirt_defaults(),
		sunlight_propagates = true,
	})
	
--glass
	stairsplus:register_all("glass_" .. colours[i][1], "glass",  "cblocks:glass_" .. colours[i][1], {
		description = "Coloured Glass",
		tiles ={"cblocks.png^[colorize:" .. colours[i][3]},
		groups = {cracky = 3, oddly_breakable_by_hand = 3},
		sounds = default.node_sound_glass_defaults(),
		sunlight_propagates = true,
	})
end

stairs.register_stair_and_slab("wood_".. colours[i][1], "cblocks:wood_".. colours[i][1],
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3}, {"default_wood.png^[colorize:".. colours[i][3]},
	"Coloured Wood Stair", "Coloured Wood Slab", default.node_sound_wood_defaults(), true)

stairs.register_stair_and_slab("cobble_".. colours[i][1], "cblocks:cobble_".. colours[i][1],
	{cracky = 3}, {"default_cobble.png^[colorize:".. colours[i][3]},
	"Coloured Cobblestone Stair", "Coloured Cobblestone Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("stonebrick_".. colours[i][1], "cblocks:stonebrick_".. colours[i][1],
	{cracky = 2}, {"default_stone_brick.png^[colorize:".. colours[i][3]},
	"Coloured Stone Brick Stair", "Coloured Stone Brick Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("stone_".. colours[i][1], "cblocks:stone_".. colours[i][1],
	{cracky = 3}, {"default_stone.png^[colorize:".. colours[i][3]},
	"Coloured Stone Stair", "Coloured Stone Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("clay_".. colours[i][1], "cblocks:clay_".. colours[i][1],
	{crumbly = 3}, {"default_clay.png^[colorize:".. colours[i][3]},
	"Coloured Clay Stair", "Coloured Clay Slab", default.node_sound_dirt_defaults(), true)

stairs.register_stair_and_slab("glass_".. colours[i][1], "cblocks:glass_".. colours[i][1],
	{cracky = 3, oddly_breakable_by_hand = 3}, {"cblocks.png^[colorize:".. colours[i][3]},
	"Coloured Glass Stair", "Coloured Glass Slab", default.node_sound_glass_defaults(), true)
end