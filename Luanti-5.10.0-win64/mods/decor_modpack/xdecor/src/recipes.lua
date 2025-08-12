core.register_craft({
	output = "xdecor:baricade",
	recipe = {
		{"group:stick", "", "group:stick"},
		{"", "default:steel_ingot", ""},
		{"group:stick", "", "group:stick"}
	}
})

core.register_craft({
	output = "xdecor:barrel",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"default:iron_lump", "", "default:iron_lump"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

core.register_craft({
	output = "xdecor:candle",
	recipe = {
		{"default:torch"}
	}
})

core.register_craft({
	output = "xdecor:cabinet",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"doors:trapdoor", "", "doors:trapdoor"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

core.register_craft({
	output = "xdecor:cabinet_half 2",
	recipe = {
		{"xdecor:cabinet"}
	}
})

core.register_craft({
	output = "xdecor:cactusbrick",
	recipe = {
		{"default:brick", "default:cactus"}
	}
})

core.register_craft({
	output = "xdecor:chair",
	recipe = {
		{"group:stick", "", ""},
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "", "group:stick"}
	}
})

core.register_craft({
	output = "xdecor:coalstone_tile 4",
	recipe = {
		{"default:coal_block", "default:stone"},
		{"default:stone", "default:coal_block"}
	}
})

core.register_craft({
	output = "default:coal_lump 4",
	recipe = {
		{"xdecor:coalstone_tile"}
	}
})

core.register_craft({
	output = "xdecor:cobweb",
	recipe = {
		{"farming:cotton", "", "farming:cotton"},
		{"", "farming:cotton", ""},
		{"farming:cotton", "", "farming:cotton"}
	}
})

core.register_craft({
	output = "xdecor:cushion 3",
	recipe = {
		{"", "fabric:sheet_red", ""},
		{"fabric:sheet_red", "fabric:block_red", "fabric:sheet_red"},
		{"stairs:slab_block_white", "stairs:slab_block_white", "stairs:slab_block_white"}
	}
})

core.register_craft({
	output = "xdecor:cushion_block",
	recipe = {
		{"xdecor:cushion"},
		{"xdecor:cushion"}
	}
})

core.register_craft({
	output = "xdecor:desertstone_tile 4",
	recipe = {
		{"default:desert_stone_block", "default:desert_stone_block"},
		{"default:desert_stone_block", "default:desert_stone_block"}
	}
})

if not core.get_modpath("moreblocks") then
	core.register_craft({
		output = "xdecor:empty_shelf",
		recipe = {
			{"group:wood", "group:wood", "group:wood"},
			{"", "", ""},
			{"group:wood", "group:wood", "group:wood"}
		}
	})
end

core.register_craft({
	output = "xdecor:enderchest",
	recipe = {
		{"", "default:obsidian", ""},
		{"default:obsidian", "default:chest", "default:obsidian"},
		{"", "default:obsidian", ""}
	}
})

core.register_craft({
	output = "xdecor:compressed_clay",
	recipe = {
		{"default:clay", "default:clay"},
		{"default:clay", "default:clay"}
	}
})

core.register_craft({
	output = "default:clay_lump 16",
	recipe = {
		{"xdecor:compressed_clay"}
	}
})

core.register_craft({
	output = "xdecor:iron_lightbox",
	recipe = {
		{"xpanes:bar_flat", "default:meselamp_torch", "xpanes:bar_flat"},
		{"xpanes:bar_flat", "default:glass", "xpanes:bar_flat"},
		{"xpanes:bar_flat", "default:meselamp_torch", "xpanes:bar_flat"}
	}
})

core.register_craft({
	output = "xdecor:ivy 4",
	recipe = {
		{"group:leaves"},
		{"group:leaves"}
	}
})

core.register_craft({
	output = "xdecor:lantern",
	recipe = {
		{"default:iron_lump", ""},
		{"default:torch", "vessels:glass_fragments"},
		{"default:iron_lump", "vessels:glass_fragments"}
	}
})

core.register_craft({
	output = "xdecor:moonbrick",
	recipe = {
		{"default:brick", "default:stone"}
	}
})

core.register_craft({
	output = "xdecor:multishelf",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:vessel", "group:book", "group:vessel"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

core.register_craft({
	output = "xdecor:painting_1",
	recipe = {
		{"default:sign_wall_wood", "group:dye"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "xdecor:radio",
	recipe = {"xdecor:speaker", "xdecor:speaker"}
})

core.register_craft({
	output = "xdecor:rooster",
	recipe = {
		{"default:gold_ingot", "", "default:gold_ingot"},
		{"", "default:gold_ingot", ""},
		{"default:gold_ingot", "", "default:gold_ingot"}
	}
})

core.register_craft({
	output = "xdecor:speaker",
	recipe = {
		{"default:gold_ingot", "default:copper_ingot", "default:gold_ingot"},
		{"default:copper_ingot", "", "default:copper_ingot"},
		{"default:gold_ingot", "default:copper_ingot", "default:gold_ingot"}
	}
})

core.register_craft({
	output = "xdecor:speaker",
	recipe = {
		{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"},
		{"basic_materials:plastic_sheet", "basic_materials:ic", "basic_materials:plastic_sheet"},
		{"default:steel_ingot", "basic_materials:ic", "default:steel_ingot"}
	}
})

core.register_craft({
	output = "xdecor:stone_tile_x 4",
	recipe = {
		{"default:stone_block", "default:stone_block"},
		{"default:stone_block", "default:stone_block"}
	}
})

core.register_craft({
	output = "xdecor:stone_rune 4",
	recipe = {
		{"", "default:stone_block", ""},
		{"default:stone_block", "default:pick_stone", "default:stone_block"},
		{"", "default:stone_block", ""}
	}
})

core.register_craft({
	output = "xdecor:stonepath 16",
	recipe = {
		{"stairs:slab_rocks", "", "stairs:slab_rocks"},
		{"", "stairs:slab_rocks", ""},
		{"stairs:slab_rocks", "", "stairs:slab_rocks"}
	}
})

core.register_craft({
	output = "xdecor:table",
	recipe = {
		{"stairs:slab_wood", "stairs:slab_wood", "stairs:slab_wood"},
		{"", "group:stick", ""},
		{"", "group:stick", ""}
	}
})

core.register_craft({
	output = "xdecor:tatami",
	recipe = {
		{"farming:straw_pile", "farming:straw_pile", "farming:straw_pile"}
	}
})

core.register_craft({
	output = "xdecor:trampoline",
	recipe = {
		{"fabric:string", "fabric:string", "fabric:string"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"}
	}
})

core.register_craft({
	output = "xdecor:tv",
	recipe = {
		{"default:steel_ingot", "default:copper_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:glass", "default:steel_ingot"},
		{"default:steel_ingot", "default:copper_ingot", "default:steel_ingot"}
	}
})

core.register_craft({
	output = "xdecor:tv",
	recipe = {
		{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"},
		{"basic_materials:plastic_sheet", "moreblocks:glow_glass", "basic_materials:plastic_sheet"},
		{"basic_materials:ic", "basic_materials:ic", "basic_materials:ic"}
	}
})

core.register_craft({
	output = "xdecor:tv",
	recipe = {
		{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"},
		{"basic_materials:plastic_sheet", "default:glass", "basic_materials:plastic_sheet"},
		{"basic_materials:ic", "basic_materials:energy_crystal_simple", "basic_materials:ic"}
	}
})

core.register_craft({
	output = "xdecor:woodframed_glass",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "default:glass", "group:stick"},
		{"group:stick", "group:stick", "group:stick"}
	}
})

core.register_craft({
	output = "xdecor:wood_tile_x 2",
	recipe = {
		{"", "group:wood", ""},
		{"group:wood", "", "group:wood"},
		{"", "group:wood", ""}
	}
})

core.register_craft({
	output = "xdecor:wooden_lightbox",
	recipe = {
		{"group:stick", "default:mese_crystal", "group:stick"},
		{"group:stick", "default:glass", "group:stick"},
		{"group:stick", "group:stick", "group:stick"}
	}
})

core.register_craft({
	output = "xdecor:wooden2_lightbox",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"default:mese_crystal", "default:glass", "group:stick"},
		{"group:stick", "group:stick", "group:stick"}
	}
})


core.register_craft({
	type = "fuel",
	recipe = "xdecor:empty_shelf",
	burntime = 30,
})
core.register_craft({
	type = "fuel",
	recipe = "xdecor:multishelf",
	burntime = 30,
})
core.register_craft({
	type = "fuel",
	recipe = "xdecor:cabinet",
	burntime = 30,
})
core.register_craft({
	type = "fuel",
	recipe = "xdecor:barrel",
	burntime = 30,
	replacements = {{"xdecor:barrel", "default:iron_lump 2"}}
})
core.register_craft({
	type = "fuel",
	recipe = "xdecor:cabinet_half",
	burntime = 15,
})
core.register_craft({
	type = "fuel",
	recipe = "xdecor:workbench",
	burntime = 15,
})
core.register_craft({
	type = "fuel",
	recipe = "xdecor:table",
	burntime = 12,
})
core.register_craft({
	type = "fuel",
	recipe = "doors:woodglass_door",
	burntime = 13,
	replacements = {{"doors:woodglass_door", "default:glass 2"}}
})
core.register_craft({
	type = "fuel",
	recipe = "doors:screen_door",
	burntime = 10,
	replacements = {{"doors:screen_door", "xpanes:chainlink_flat 2"}}
})
core.register_craft({
	type = "fuel",
	recipe = "doors:slide_door",
	burntime = 8,
})
core.register_craft({
	type = "fuel",
	recipe = "xpanes:wood_frame_flat",
	burntime = 5,
})
core.register_craft({
	type = "fuel",
	recipe = "xpanes:bamboo_frame_flat",
	burntime = 3,
})
core.register_craft({
	type = "fuel",
	recipe = "doors:japanese_door",
	burntime = 8,
})
core.register_craft({
	type = "fuel",
	recipe = "xdecor:chair",
	burntime = 6,
})
core.register_craft({
	type = "fuel",
	recipe = "xdecor:baricade",
	burntime = 6,
	replacements = {{"xdecor:baricade", "default:steel_ingot"}}
})
core.register_craft({
	type = "fuel",
	recipe = "xdecor:wood_tile_x",
	burntime = 10,
})
core.register_craft({
	type = "fuel",
	recipe = "realchess:chessboard",
	burntime = 4,
})
core.register_craft({
	type = "fuel",
	recipe = "xdecor:painting_1",
	burntime = 3,
})
core.register_craft({
	type = "fuel",
	recipe = "xdecor:tatami",
	burntime = 1,
})
core.register_craft({
	type = "fuel",
	recipe = "xdecor:ivy",
	burntime = 1,
})

