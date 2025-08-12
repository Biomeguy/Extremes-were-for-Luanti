
core.register_craft({
	output = "decor:vase",
	recipe = {
		{"default:clay_brick", "", "default:clay_brick"},
		{"default:clay_brick", "", "default:clay_brick"},
		{"", "default:clay_brick", ""}
	}
})

core.register_craft({
	output = "decor:Ancient_vase_sand 6",
	recipe = {
		{"default:sandstone", "", "default:sandstone"},
		{"default:sandstone", "", "default:sandstone"},
		{"", "default:sandstone", ""}
	}
})

core.register_craft({
	output = "decor:Ancient_vase",
	recipe = {{"decor:vase"}}
})

core.register_craft({
	output = "decor:vase",
	recipe = {{"decor:Ancient_vase"}}
})

core.register_craft({
	output = "decor:scarecrow",
	recipe = {
		{"", "farming:pumpkin_S8", "fabric:sheet_blue"},
		{"default:stick", "farming:straw", "default:stick"},
		{"", "group:wood", ""}
	}
})

core.register_craft({
	output = "decor:gold_brick",
	recipe = {
		{"default:gold_ingot", "default:gold_ingot"},
		{"default:gold_ingot", "default:gold_ingot"}
	}
})

core.register_craft({
	output = "default:gold_ingot 4",
	recipe = {{"decor:gold_brick"}}
})

core.register_craft({
	output = "decor:snow_block 2",
	recipe = {
		{"default:snow_block"},
		{"default:snow_block"}
	}
})

core.register_craft({
	output = "default:snow_block 2",
	recipe = {
		{"decor:snow_block"},
		{"decor:snow_block"}
	}
})

core.register_craft({
	output = "decor:snow_bricks 2",
	recipe = {
		{"default:snow_brick"},
		{"default:snow_brick"}
	}
})

core.register_craft({
	output = "default:snow_brick 2",
	recipe = {
		{"decor:snow_bricks"},
		{"decor:snow_bricks"}
	}
})

core.register_craft({
	output = "decor:chain_top",
	recipe = {
		{"default:steel_ingot"},
		{"basic_materials:chainlink_steel"}
	}
})

core.register_craft({
	output = "decor:chandelier",
	recipe = {
		{"", "basic_materials:chainlink_steel", ""},
		{"default:torch", "basic_materials:chainlink_steel", "default:torch"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	}
})

core.register_craft({
	output = "decor:chain_top_brass",
	recipe = {
		{"default:brass_ingot"},
		{"basic_materials:chainlink_brass"}
	}
})

core.register_craft({
	output = "decor:chandelier_brass",
	recipe = {
		{"", "basic_materials:chainlink_brass", ""},
		{"default:torch", "basic_materials:chainlink_brass", "default:torch"},
		{"default:brass_ingot", "default:brass_ingot", "default:brass_ingot"}
	}
})

core.register_craft({
	output = "decor:terrycloth_towel 2",
	recipe = {
		{"fabric:string", "fabric:string", "fabric:string"}
	}
})
core.register_craft({
	output = "decor:Tarmac_spread 4",
	recipe = {
		{"group:tar_block", "group:tar_block"}
	}
})
core.register_craft({
	output = "decor:gravel_spread 4",
	recipe = {
		{"", "decor:sticks", ""},
		{"default:gravel", "default:gravel", "default:gravel"},
		{"", "", ""}
	}
})
core.register_craft({
	output = "decor:brobble_spread 4",
	recipe = {
		{"default:brick", "default:cobble", "default:brick"}
	}
})
core.register_craft({
	output = "decor:Fireplace",
	recipe = {
		{"default:steel_ingot", "decor:sticks", "default:steel_ingot"}
	}
})
core.register_craft({
	output = "decor:adobe_dense 3",
	recipe = {
		{"mapgen:adobe", "mapgen:adobe"},
		{"default:clay_dirt", "group:stick"}
	}
})
core.register_craft({
	output = "decor:Roofing 10",
	recipe = {
		{"decor:adobe_dense", "decor:adobe_dense"},
		{"decor:adobe_dense", "decor:adobe_dense"}
	}
})
core.register_craft({
	output = "decor:BWtile 10",
	recipe = {
		{"group:clarble", "group:tar_block"},
		{"group:tar_block", "group:clarble"}
	}
})
core.register_craft({
	output = "decor:grate",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot"},
		{"default:glass", "default:glass"}
	}
})
core.register_craft({
	output = "decor:woodglass",
	recipe = {
		{"default:wood"},
		{"default:glass"}
	}
})
core.register_craft({
	output = "decor:hardwood 2",
	recipe = {
		{"default:wood", "default:jungle_wood"},
		{"default:jungle_wood", "default:wood"}
	}
})

core.register_craft({
	output = "decor:hardwood 2",
	recipe = {
		{"default:jungle_wood", "default:wood"},
		{"default:wood", "default:jungle_wood"}
	}
})
if core.get_modpath("moreblocks") then
	core.register_craft({
		output = "decor:sticks 2",
		recipe = {
			{"group:stick", ""           , "group:stick"},
			{"group:stick", "group:stick", "group:stick"},
			{"group:stick", "group:stick", "group:stick"}
		}
	})
else
	core.register_craft({
		output = "decor:sticks",
		recipe = {
			{"group:stick", "group:stick"},
			{"group:stick", "group:stick"}
		}
	})
end

core.register_craft({
	output = "default:stick 4",
	recipe = {
		{"decor:sticks"}
	}
})

core.register_craft({
	output = "decor:fakegrass 2",
	recipe = {
		{"default:beech_leaves"},
		{"default:dirt"}
	}
})

core.register_craft({
	output = "decor:tar_base 4",
	recipe = {
		{"default:coal_lump", "default:gravel"},
		{"default:gravel", "default:coal_lump"}
	}
})

core.register_craft({
	output = "decor:tar_base 4",
	recipe = {
		{"default:gravel", "default:coal_lump"},
		{"default:coal_lump", "default:gravel"}
	}
})
core.register_craft({
	type = "cooking",
	output = "decor:smoothglass",
	recipe = "default:glass"
})

core.register_craft({
	type = "fuel",
	recipe = "decor:hardwood",
	burntime = 28,
})

core.register_craft({
	output = "decor:knife",
	recipe = {
		{"group:tar_block"},
		{"group:stick"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "decor:sticks",
	burntime = 5,
})
core.register_craft({
	type = "fuel",
	recipe = "decor:Tar",
	burntime = 40,
})
core.register_craft({
	type = "cooking",
	output = "decor:Tar",
	recipe = "decor:tar_base",
})

core.register_craft({
	output = "decor:Clarble 9",
	recipe = {
		{"default:clay", "group:tar_block", "default:clay"},
		{"group:tar_block","default:clay", "group:tar_block"},
		{"default:clay", "group:tar_block","default:clay"}
	}
})

-- clear glass recipe
core.register_craft({
	output = "decor:clear_glass 4", -- intentional lower yield
	recipe = {
		{"default:glass", "", "default:glass"},
		{"", "default:glass", ""},
		{"default:glass", "", "default:glass"}
	}
})


-- glass light recipes
local plain_colors = {
	"green", "blue", "red", "yellow",
}

local i
for i in ipairs(plain_colors) do
	local name = plain_colors[i]
	local nodesuffix = "glass_light_"..name

	core.register_craft({
		output = "decor:"..nodesuffix.." 4",
		recipe = {
			{"decor:clear_glass", "default:torch", "decor:clear_glass"},
			{"decor:clear_glass", "dye:"..name, "decor:clear_glass"},
		}
	})

	core.register_craft({
		type = "cooking",
		recipe = "decor:"..nodesuffix,
		output = "decor:clear_glass",
	})
end


-- undecorated coloured glass recipes
local dye_list = {
	{"black", "black",}, 
	{"blue", "blue",},
	{"cyan", "cyan",},
	{"green", "green",},
	{"magenta", "magenta",},
	{"orange", "orange",},
	{"purple", "violet",},
	{"red", "red",},
	{"yellow", "yellow",}, 
	{"frosted", "white",},
}

for i in ipairs(dye_list) do
	local name = dye_list[i][1]
	local dye = dye_list[i][2]

	core.register_craft({
		output = "decor:stained_glass_"..name.." 6",
		recipe = {
			{"decor:clear_glass", "", "decor:clear_glass"},
			{"decor:clear_glass", "dye:"..dye, "decor:clear_glass"},
			{"decor:clear_glass", "", "decor:clear_glass"},
		}
	})

	core.register_craft({
		type = "cooking",
		output = "decor:clear_glass",
		recipe = "decor:stained_glass_"..name,
	})
end


-- patterned glass recipes
core.register_craft({
	output = "decor:stainedglass_pattern01 9",
	recipe = {
		{"decor:stained_glass_yellow", "decor:stained_glass_yellow", "decor:stained_glass_yellow"},
		{"decor:stained_glass_yellow", "decor:stained_glass_blue", "decor:stained_glass_yellow"},
		{"decor:stained_glass_yellow", "decor:stained_glass_yellow", "decor:stained_glass_yellow"},
	}
})

core.register_craft({
	output = "decor:stainedglass_pattern02 9",
	recipe = {
		{"decor:clear_glass", "decor:clear_glass", "decor:clear_glass"},
		{"decor:clear_glass", "decor:clear_glass", "decor:clear_glass"},
		{"decor:clear_glass", "decor:clear_glass", "decor:clear_glass"},
	}
})

core.register_craft({
	output = "decor:stainedglass_pattern03 9",
	recipe = {
		{"decor:stained_glass_red", "decor:clear_glass", "decor:stained_glass_red"},
		{"decor:clear_glass", "decor:clear_glass", "decor:clear_glass"},
		{"decor:stained_glass_red", "decor:clear_glass", "decor:stained_glass_red"},
	}
})

core.register_craft({
	output = "decor:stainedglass_pattern04 9",
	recipe = {
		{"decor:stained_glass_green", "decor:stained_glass_red", "decor:stained_glass_green"},
		{"decor:stained_glass_red", "decor:stained_glass_blue", "decor:stained_glass_red"},
		{"decor:stained_glass_green", "decor:stained_glass_red", "decor:stained_glass_green"},
	}
})

core.register_craft({
	output = "decor:stainedglass_pattern05 9",
	recipe = {
		{"decor:stained_glass_blue", "decor:stained_glass_blue", "decor:stained_glass_blue"},
		{"decor:stained_glass_blue", "decor:stained_glass_green", "decor:stained_glass_blue"},
		{"decor:stained_glass_blue", "decor:stained_glass_blue", "decor:stained_glass_blue"},
	}
})

core.register_craft({
	output = "decor:stainedglass_tiles_dark 7",
	recipe = {
		{"decor:stained_glass_red", "decor:stained_glass_green", "decor:stained_glass_blue"},
		{"decor:stained_glass_yellow", "decor:stained_glass_magenta", "decor:stained_glass_cyan"},
		{"", "decor:stained_glass_black", ""},
	}
})

core.register_craft({
	output = "decor:stainedglass_tiles_pale 7",
	recipe = {
		{"decor:stained_glass_red", "decor:stained_glass_green", "decor:stained_glass_blue"},
		{"decor:stained_glass_yellow", "decor:stained_glass_magenta", "decor:stained_glass_cyan"},
		{"", "decor:stained_glass_frosted", ""},
	}
})


-- cooking recipes
local cook_list = { "stainedglass_pattern01", "stainedglass_pattern02", "stainedglass_pattern03", "stainedglass_pattern04", "stainedglass_pattern05", "stainedglass_tiles_dark", "stainedglass_tiles_pale"}

for i = 1, #cook_list do
	local name = cook_list[i]

	core.register_craft({
		type = "cooking",
		recipe = "decor:"..name,
		output = "decor:clear_glass",
	})
end


-- porthole recipes
local port_recipes = {
	{"wood",}, {"jungle_wood",},
}

for i in ipairs(port_recipes) do
	local name = port_recipes[i][1]

	core.register_craft({
		output = "decor:porthole_"..name.." 4",
		recipe = {
			{"default:glass", "", "default:glass"},
			{"default:"..name, "", "default:steel_ingot"},
			{"default:glass", "", "default:glass"},
		}
	})
end


-- one-way recipes
local oneway_recipe_list = {
	{"decor:oneway_glass_desert_brick", "default:desert_stone_brick"},
	{"decor:oneway_glass_stone_brick", "default:stone_brick"},
	{"decor:oneway_glass_sandstone_brick", "default:sandstone_brick"},
	{"decor:oneway_glass_dark", "decor:oneway_wall_dark"},
	{"decor:oneway_glass_pale", "decor:oneway_wall_pale"},
}

for i in ipairs(oneway_recipe_list) do
	local name = oneway_recipe_list[i][1]
	local ingredient = oneway_recipe_list[i][2]

	core.register_craft({
		output = name.." 2",
		recipe = {
			{"decor:clear_glass", "default:mese_crystal_fragment", ingredient },
		}
	})
end

core.register_craft({
	output = "decor:oneway_wall_dark 2",
	recipe = {
		{"default:clay_lump", "default:clay_lump", "default:clay_lump"},
		{"default:clay_lump", "dye:black", "default:clay_lump"},
		{"default:clay_lump", "default:clay_lump", "default:clay_lump"}
	}
})

core.register_craft({
	output = "decor:oneway_wall_pale 2",
	recipe = {
		{"default:clay_lump", "default:clay_lump", "default:clay_lump"},
		{"default:clay_lump", "dye:white", "default:clay_lump"},
		{"default:clay_lump", "default:clay_lump", "default:clay_lump"}
	}
})

core.register_craft({
	output = "decor:endtable",
	recipe = {
		{"stairs:slab_wood", "stairs:slab_wood"},
		{"group:stick", "group:stick"}
	}
})

core.register_craft({
	output = "decor:concrete_railing 6",
	recipe = {
		{"","",""},
		{"default:concrete_block2","default:concrete_block2","default:concrete_block2"},
		{"","default:concrete_block2",""}
	}
})

core.register_craft({
	output = "decor:concrete_catwalk 3",
	recipe = {
		{"","",""},
		{"decor:concrete_railing","","decor:concrete_railing"},
		{"default:concrete_block2","default:concrete_block2","default:concrete_block2"}
	}
})

core.register_craft({
	output = "decor:concrete_bench 2",
	recipe = {
		{"","",""},
		{"","default:concrete_block2",""},
		{"","decor:concrete_railing",""}
	}
})

core.register_craft({
	output = "decor:concrete_wall 3",
	recipe = {
		{"","default:concrete_block2",""},
		{"","default:concrete_block2",""},
		{"","default:concrete_block2",""}
	}
})

core.register_craft({
	output = "decor:wooden_framed_glass 4",
	recipe = {
		{"default:glass", "default:glass", "default:stick"},
		{"default:glass", "default:glass", "default:stick"},
		{"default:stick", "default:stick", ""}
	}
})

core.register_craft({
	output = "decor:steel_framed_glass 4",
	recipe = {
		{"default:glass", "default:glass", "default:steel_ingot"},
		{"default:glass", "default:glass", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", ""}
	}
})

core.register_craft({
	output = "decor:wooden_framed_obsidian_glass 4",
	recipe = {
		{"default:obsidian_glass", "default:obsidian_glass", "default:stick"},
		{"default:obsidian_glass", "default:obsidian_glass", "default:stick"},
		{"default:stick", "default:stick", ""}
	}
})

core.register_craft({
	output = "decor:steel_framed_obsidian_glass 4",
	recipe = {
		{"default:obsidian_glass", "default:obsidian_glass", "default:steel_ingot"},
		{"default:obsidian_glass", "default:obsidian_glass", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", ""}
	}
})

core.register_craft({
	output = "decor:tetris_arcade",
	recipe = {
		{"basic_materials:plastic_sheet", "basic_materials:energy_crystal_simple", "basic_materials:plastic_sheet"},
		{"dye:black", "default:glass", "dye:black"},
		{"basic_materials:plastic_sheet", "basic_materials:energy_crystal_simple", "basic_materials:plastic_sheet"}
	}
})

core.register_craft({
	output = "decor:lantern_h",
	recipe = {
		{"default:glass"},
		{"default:meselamp_torch"},
		{"default:glass"}
	}
})

core.register_craft({
	output = "decor:bookshelf",
	recipe = {
		{"default:bookshelf"}
	}
})

core.register_craft({
	output = "decor:clock",
	recipe = {
		{"", "", ""},
		{"", "group:stick", ""},
		{"", "default:wood", ""}
	}
})

core.register_craft({
	output = "decor:old_tombstone",
	recipe = {
		{"", "", ""},
		{"", "decor:stone", ""},
		{"", "decor:stone", ""}
	}
})

core.register_craft({
	output = "decor:cross",
	recipe = {
		{"", "decor:stone", ""},
		{"decor:stone", "decor:stone", "decor:stone"},
		{"", "decor:stone", ""}
	}
})

core.register_craft({
	output = "decor:boards 4",
	recipe = {
		{"default:wood", "", "default:wood"},
		{"", "default:wood", ""},
		{"default:wood", "", "default:wood"}
	}
})

core.register_craft({
	output = "decor:horror_table 4",
	recipe = {
		{"group:wood", "group:wood", "default:wood"},
		{"group:wood", "", ""},
		{"group:wood", "", ""}
	}
})

core.register_craft({
	output = "decor:table_stone 4",
	recipe = {
		{"decor:stone", "decor:stone", "decor:stone"},
		{"decor:stone", "", ""},
		{"decor:stone", "", ""}
	}
})

core.register_craft({
	type = "cooking",
	output = "decor:stone",
	recipe = "default:stone",
})

core.register_craft({
	output = "decor:shelf",
	recipe = {
		{"", "", ""},
		{"group:wood", "group:wood", ""},
		{"group:stick", "", ""}
	}
})

core.register_craft({
	output = "decor:stand",
	recipe = {
		{"decor:stone", "decor:stone", "decor:stone"},
		{"", "decor:stone", ""},
		{"decor:stone", "decor:stone", "decor:stone"}
	}
})

core.register_craft({
	output = "decor:fountain",
	recipe = {
		{"", "", ""},
		{"decor:stone", "group:water_bucket", ""},
		{"decor:stone", "", ""}
	},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})
