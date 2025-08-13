--[[
More Blocks: crafting recipes

Copyright © 2011-2019 Hugo Locurcio and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
--]]

core.register_craft({
	output = "default:dirt_with_grass",
	type = "shapeless",
	recipe = {"default:jungle_grass_3", "default:dirt"},
})

core.register_craft({
	output = "default:mossycobble",
	type = "shapeless",
	recipe = {"default:jungle_grass_3", "default:cobble"},
})

core.register_craft({
	output = "moreblocks:wood_tile 9",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
})

-- This must be registered after `moreblocks:wood_tile` to avoid recipe conflicts,
-- since `moreblocks:wood_tile` is part of `group:wood`
core.register_craft({
	output = "moreblocks:wood_tile_center 9",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "moreblocks:wood_tile", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
})

core.register_craft({
	type = "shapeless",
	output = "moreblocks:wood_tile",
	recipe = {"moreblocks:wood_tile_flipped"}
})

core.register_craft({
	output = "moreblocks:wood_tile_full 4",
	recipe = {
		{"moreblocks:wood_tile", "moreblocks:wood_tile"},
		{"moreblocks:wood_tile", "moreblocks:wood_tile"},
	}
})

core.register_craft({
	output = "moreblocks:wood_tile_offset",
	recipe = {
		{"default:stick"},
		{"moreblocks:wood_tile_center"},
	}
})

core.register_craft({
	type = "shapeless",
	output = "moreblocks:wood_tile_offset",
	recipe = {"moreblocks:wood_tile_down"}
})

core.register_craft({
	type = "shapeless",
	output = "moreblocks:wood_tile_offset",
	recipe = {"moreblocks:wood_tile_left"}
})

core.register_craft({
	type = "shapeless",
	output = "moreblocks:wood_tile_offset",
	recipe = {"moreblocks:wood_tile_right"}
})

core.register_craft({
	output = "moreblocks:circle_stone_bricks 5",
	recipe = {
		{"", "default:stone", ""},
		{"default:stone", "default:coal_lump", "default:stone"},
		{"", "default:stone", ""},
	}
})

core.register_craft({
	output = "moreblocks:all_faces_beech_trunk 8",
	recipe = {
		{"default:beech_trunk", "default:beech_trunk", "default:beech_trunk"},
		{"default:beech_trunk", "", "default:beech_trunk"},
		{"default:beech_trunk", "default:beech_trunk", "default:beech_trunk"},
	}
})

core.register_craft({
	output = "moreblocks:all_faces_jungle_trunk 8",
	recipe = {
		{"default:jungle_trunk", "default:jungle_trunk", "default:jungle_trunk"},
		{"default:jungle_trunk", "", "default:jungle_trunk"},
		{"default:jungle_trunk", "default:jungle_trunk", "default:jungle_trunk"},
	}
})

core.register_craft({
	output = "moreblocks:all_faces_pine_trunk 8",
	recipe = {
		{"default:pine_trunk", "default:pine_trunk", "default:pine_trunk"},
		{"default:pine_trunk", "", "default:pine_trunk"},
		{"default:pine_trunk", "default:pine_trunk", "default:pine_trunk"},
	}
})

core.register_craft({
	output = "moreblocks:all_faces_acacia_trunk 8",
	recipe = {
		{"default:acacia_trunk", "default:acacia_trunk", "default:acacia_trunk"},
		{"default:acacia_trunk", "", "default:acacia_trunk"},
		{"default:acacia_trunk", "default:acacia_trunk", "default:acacia_trunk"},
	}
})

core.register_craft({
	output = "moreblocks:all_faces_aspen_trunk 8",
	recipe = {
		{"default:aspen_trunk", "default:aspen_trunk", "default:aspen_trunk"},
		{"default:aspen_trunk", "", "default:aspen_trunk"},
		{"default:aspen_trunk", "default:aspen_trunk", "default:aspen_trunk"},
	}
})

core.register_craft({
	output = "moreblocks:sweeper 4",
	recipe = {
		{"default:jungle_grass_3"},
		{"default:stick"},
	}
})

core.register_craft({
	output = "moreblocks:stone_tile 9",
	recipe = {
		{"default:cobble", "default:cobble", "default:cobble"},
		{"default:cobble", "default:stone", "default:cobble"},
		{"default:cobble", "default:cobble", "default:cobble"},
	}
})

core.register_craft({
	output = "moreblocks:split_stone_tile",
	recipe = {
		{"moreblocks:stone_tile"},
	}
})

core.register_craft({
	output = "moreblocks:checker_stone_tile",
	recipe = {
		{"moreblocks:split_stone_tile"},
	}
})

-- When approaching the below craft, loop back to cobblestone, which can then be used to craft stone tiles again
core.register_craft({
	output = "default:cobble",
	recipe = {
		{"moreblocks:checker_stone_tile"},
	}
})

core.register_craft({
	output = "moreblocks:grey_bricks 2",
	type = "shapeless",
	recipe =  {"default:stone", "default:brick"},
})

core.register_craft({
	output = "moreblocks:grey_bricks 2",
	type = "shapeless",
	recipe =  {"default:stone_brick", "default:brick"},
})

-- When obtaining an empty shelf, return the books/bottles used in it as well
core.register_craft({
	output = "moreblocks:empty_shelf",
	type = "shapeless",
	recipe = {"moreblocks:sweeper", "default:bookshelf"},
	replacements = {{"default:bookshelf", "default:book 3"}},
})

core.register_craft({
	output = "moreblocks:empty_shelf",
	type = "shapeless",
	recipe = {"moreblocks:sweeper", "vessels:shelf"},
	replacements = {{"vessels:shelf", "vessels:glass_bottle 3"}},
})

core.register_craft({
	type = "shapeless",
	output = "default:bookshelf",
	recipe = {"moreblocks:empty_shelf", "default:book", "default:book", "default:book"},
})

core.register_craft({
	type = "shapeless",
	output = "vessels:shelf",
	recipe = {"moreblocks:empty_shelf", "vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"},
})

core.register_craft({
	output = "moreblocks:empty_shelf",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"", "", ""},
		{"group:wood", "group:wood", "group:wood"},
	}
})

core.register_craft({
	output = "moreblocks:coal_stone_bricks 4",
	recipe = {
		{"moreblocks:coal_stone", "moreblocks:coal_stone"},
		{"moreblocks:coal_stone", "moreblocks:coal_stone"},
	}
})

core.register_craft({
	output = "moreblocks:iron_stone_bricks 4",
	recipe = {
		{"moreblocks:iron_stone", "moreblocks:iron_stone"},
		{"moreblocks:iron_stone", "moreblocks:iron_stone"},
	}
})

core.register_craft({
	output = "moreblocks:plankstone 4",
	recipe = {
		{"group:stone", "group:wood"},
		{"group:wood", "group:stone"},
	}
})

core.register_craft({
	output = "moreblocks:plankstone 4",
	recipe = {
		{"group:wood", "group:stone"},
		{"group:stone", "group:wood"},
	}
})

core.register_craft({
	output = "moreblocks:coal_checker 4",
	recipe = {
		{"default:stone", "default:coal_lump"},
		{"default:coal_lump", "default:stone"},
	}
})

core.register_craft({
	output = "moreblocks:coal_checker 4",
	recipe = {
		{"default:coal_lump", "default:stone"},
		{"default:stone", "default:coal_lump"},
	}
})

core.register_craft({
	output = "moreblocks:iron_checker 4",
	recipe = {
		{"default:steel_ingot", "default:stone"},
		{"default:stone", "default:steel_ingot"},
	}
})

core.register_craft({
	output = "moreblocks:iron_checker 4",
	recipe = {
		{"default:stone", "default:steel_ingot"},
		{"default:steel_ingot", "default:stone"},
	}
})

core.register_craft({
	output = "moreblocks:iron_glass",
	type = "shapeless",
	recipe = {"default:steel_ingot", "default:glass"},
})

core.register_craft({
	output = "default:glass",
	type = "shapeless",
	recipe = {"default:coal_lump", "moreblocks:iron_glass"},
})


core.register_craft({
	output = "moreblocks:coal_glass",
	type = "shapeless",
	recipe = {"default:coal_lump", "default:glass"},
})

core.register_craft({
	output = "default:glass",
	type = "shapeless",
	recipe = {"default:steel_ingot", "moreblocks:coal_glass"},
})

core.register_craft({
	output = "moreblocks:clean_glass",
	type = "shapeless",
	recipe = {"moreblocks:sweeper", "default:glass"},
})

core.register_craft({
	output = "moreblocks:glow_glass",
	type = "shapeless",
	recipe = {"default:torch", "default:glass"},
})

core.register_craft({
	output = "moreblocks:trap_glow_glass",
	type = "shapeless",
	recipe = {"default:mese_crystal_fragment", "default:glass", "default:torch"},
})

core.register_craft({
	output = "moreblocks:trap_glow_glass",
	type = "shapeless",
	recipe = {"default:mese_crystal_fragment", "moreblocks:glow_glass"},
})

core.register_craft({
	output = "moreblocks:super_glow_glass",
	type = "shapeless",
	recipe = {"default:torch", "default:torch", "default:glass"},
})

core.register_craft({
	output = "moreblocks:super_glow_glass",
	type = "shapeless",
	recipe = {"default:torch", "moreblocks:glow_glass"},
})


core.register_craft({
	output = "moreblocks:trap_super_glow_glass",
	type = "shapeless",
	recipe = {"default:mese_crystal_fragment", "default:glass", "default:torch", "default:torch"},
})

core.register_craft({
	output = "moreblocks:trap_super_glow_glass",
	type = "shapeless",
	recipe = {"default:mese_crystal_fragment", "moreblocks:super_glow_glass"},
})

core.register_craft({
	output = "moreblocks:coal_stone",
	type = "shapeless",
	recipe = {"default:coal_lump", "default:stone"},
})

core.register_craft({
	output = "default:stone",
	type = "shapeless",
	recipe = {"default:steel_ingot", "moreblocks:coal_stone"},
})

core.register_craft({
	output = "moreblocks:iron_stone",
	type = "shapeless",
	recipe = {"default:steel_ingot", "default:stone"},
})

core.register_craft({
	output = "default:stone",
	type = "shapeless",
	recipe = {"default:coal_lump", "moreblocks:iron_stone"},
})

core.register_craft({
	output = "moreblocks:trap_stone",
	type = "shapeless",
	recipe = {"default:mese_crystal_fragment", "default:stone"},
})

core.register_craft({
	output = "moreblocks:trap_desert_stone",
	type = "shapeless",
	recipe = {"default:mese_crystal_fragment", "default:desert_stone"},
})

core.register_craft({
	output = "moreblocks:trap_glass",
	type = "shapeless",
	recipe = {"default:mese_crystal_fragment", "default:glass"},
})

core.register_craft({
	output = "moreblocks:trap_obsidian_glass",
	type = "shapeless",
	recipe = {"default:mese_crystal_fragment", "default:obsidian_glass"},
})

core.register_craft({
	output = "moreblocks:trap_obsidian",
	type = "shapeless",
	recipe = {"default:mese_crystal_fragment", "default:obsidian"},
})

core.register_craft({
	output = "moreblocks:trap_sandstone",
	type = "shapeless",
	recipe = {"default:mese_crystal_fragment", "default:sandstone"},
})

core.register_craft({
	output = "moreblocks:cactus_brick",
	type = "shapeless",
	recipe = {"default:cactus", "default:brick"},
})

core.register_craft({
	output = "moreblocks:cactus_checker 4",
	recipe = {
		{"default:cactus", "default:stone"},
		{"default:stone", "default:cactus"},
	}
})

core.register_craft({
	output = "moreblocks:cactus_checker 4",
	recipe = {
		{"default:stone", "default:cactus"},
		{"default:cactus", "default:stone"},
	}
})

core.register_craft({
	output = "moreblocks:rope 3",
	recipe = {
		{"default:jungle_grass_3"},
		{"default:jungle_grass_3"},
		{"default:jungle_grass_3"},
	}
})

core.register_craft({
	output = "moreblocks:dirt_compressed",
	recipe = {
		{"default:dirt", "default:dirt", "default:dirt"},
		{"default:dirt", "default:dirt", "default:dirt"},
		{"default:dirt", "default:dirt", "default:dirt"},
	}
})

core.register_craft({
	output = "default:dirt 9",
	recipe = {{"moreblocks:dirt_compressed"}},
})

core.register_craft({
	output = "moreblocks:cobble_compressed",
	recipe = {
		{"default:cobble", "default:cobble", "default:cobble"},
		{"default:cobble", "default:cobble", "default:cobble"},
		{"default:cobble", "default:cobble", "default:cobble"},
	}
})

core.register_craft({
	output = "default:cobble 9",
	recipe = {
		{"moreblocks:cobble_compressed"},
	}
})

core.register_craft({
	type = "shapeless",
	output = "moreblocks:copperpatina",
	recipe = {"group:water_bucket", "default:copper_block"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	output = "default:copper_ingot 9",
	recipe = {
		{"moreblocks:copperpatina"},
	}
})

if core.settings:get_bool("moreblocks.circular_saw_crafting") ~= false then -- “If nil or true then”
	core.register_craft({
		output = "moreblocks:circular_saw",
		recipe = {
			{"", "default:steel_ingot", ""},
			{"group:wood", "group:wood", "group:wood"},
			{"group:wood", "",  "group:wood"}
		}
	})
end
