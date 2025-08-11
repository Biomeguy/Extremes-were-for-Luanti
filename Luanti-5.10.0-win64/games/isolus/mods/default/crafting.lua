-- mods/default/crafting.lua

core.register_craft({
	output = "default:acacia_wood 4",
	recipe = {{"default:acacia_trunk"}}
})

core.register_craft({
	output = "default:apple_wood 4",
	recipe = {{"default:apple_trunk"}}
})

core.register_craft({
	output = "default:aspen_wood 4",
	recipe = {{"default:aspen_trunk"}}
})

core.register_craft({
	output = "default:wood 4",
	recipe = {{"default:beech_trunk"}}
})

core.register_craft({
	output = "default:birch_wood 4",
	recipe = {{"default:birch_trunk"}},
	replacements = {{"default:birch_trunk", "default:birch_bark 2"}}
})

core.register_craft({
	output = "default:coco_palm_wood 4",
	recipe = {{"default:coco_palm_trunk"}}
})

core.register_craft({
	output = "default:jungle_wood 4",
	recipe = {{"default:jungle_trunk"}}
})

core.register_craft({
	output = "default:mangrove_wood 4",
	recipe = {{"default:mangrove_trunk"}}
})

core.register_craft({
	output = "default:wood 4",
	recipe = {{"default:orange_trunk"}}
})

core.register_craft({
	output = "default:pine_wood 4",
	recipe = {{"default:pine_trunk"}}
})

core.register_craft({
	output = "default:acacia_wood",
	recipe = {{"default:acacia_bush_stem"}}
})

core.register_craft({
	output = "default:wood",
	recipe = {{"default:bush_stem"}}
})

core.register_craft({
	output = "default:pine_wood",
	recipe = {{"default:pine_bush_stem"}}
})

core.register_craft({
	output = "default:wood",
	recipe = {
		{"default:stick", "default:stick"},
		{"default:stick", "default:stick"}
	}
})

core.register_craft({
	output = "default:sign_wall_steel 3",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"", "group:stick", ""}
	}
})

core.register_craft({
	output = "default:sign_wall_wood 4",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
		{"", "group:stick", ""}
	}
})

core.register_craft({
	output = "default:diamite",
	recipe = {
		{"default:diamite_dust", "default:diamite_dust"},
		{"default:diamite_dust", "default:diamite_dust"}
	}
})

core.register_craft({
	output = "default:marble_brick 4",
	recipe = {
		{"default:marble", "default:marble"},
		{"default:marble", "default:marble"}
	}
})

core.register_craft({
	output = "default:white_marble_block 9",
	recipe = {
		{"default:white_marble", "default:white_marble", "default:white_marble"},
		{"default:white_marble", "default:white_marble", "default:white_marble"},
		{"default:white_marble", "default:white_marble", "default:white_marble"}
	}
})

core.register_craft({
	output = "default:ocean_stone",
	recipe = {
		{"default:stone"},
		{"default:ocealite_crystal"}
	}
})

core.register_craft({
	output = "default:ocean_stone_carved 4",
	recipe = {
		{"default:ocean_stone", "default:ocean_stone"},
		{"default:ocean_stone", "default:ocean_stone"}
	}
})

core.register_craft({
	output = "default:ocean_stone_circular 4",
	recipe = {
		{"default:ocean_stone_carved", "default:ocean_stone_carved"},
		{"default:ocean_stone_carved", "default:ocean_stone_carved"}
	}
})

core.register_craft({
	output = "default:ocean_stone_pillar 4",
	recipe = {
		{"default:ocean_stone_brick", "default:ocean_stone_brick"},
		{"default:ocean_stone_brick", "default:ocean_stone_brick"}
	}
})

core.register_craft({
	output = "default:ocean_stone_brick 4",
	recipe = {
		{"default:ocean_cobble", "default:ocean_cobble"},
		{"default:ocean_cobble", "default:ocean_cobble"}
	}
})

core.register_craft({
	output = "default:concrete_block 6",
	recipe = {
		{"group:sand", "default:wet_cement", "default:gravel"},
		{"default:steel_bar", "default:wet_cement", "default:steel_bar"},
		{"default:gravel", "default:wet_cement", "group:sand"}
	}
})

core.register_craft({
	output = "default:concrete_paver 20",
	recipe = {
		{"default:concrete_block", "", "default:concrete_block"},
		{"", "default:concrete_block", ""},
		{"default:concrete_block", "", "default:concrete_block"}
	}
})

core.register_craft({
	output = "default:concrete_block2",
	recipe = {{"default:concrete_block"}}
})

core.register_craft({
	output = "default:concrete_block",
	recipe = {{"default:concrete_block2"}}
})

core.register_craft({
	type = "shapeless",
	output = "default:seaweedy_wood",
	recipe = {"default:wood", "bucket:bucket_water"},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})

core.register_craft({
	output = "default:spectrum",
	recipe = {
		{"default:torch", "moreblocks:slope_glass", "default:mese_crystal"}
	},
	replacements = {
		{"default:torch", "default:torch"},
		{"moreblocks:slope_glass", "moreblocks:slope_glass"}
	}
})

core.register_craft({
	output = "default:cobble 8",
	recipe = {
		{"default:rocks", "default:rocks", "default:rocks"},
		{"default:rocks", "default:wet_cement", "default:rocks"},
		{"default:rocks", "default:rocks", "default:rocks"}
	}
})

core.register_craft({
	output = "default:rock 9",
	recipe = {{"default:cobble"}}
})

core.register_craft({
	output = "default:desert_cobble 8",
	recipe = {
		{"default:desert_rocks", "default:desert_rocks", "default:desert_rocks"},
		{"default:desert_rocks", "default:wet_cement", "default:desert_rocks"},
		{"default:desert_rocks", "default:desert_rocks", "default:desert_rocks"}
	}
})

core.register_craft({
	output = "default:desert_rock 9",
	recipe = {{"default:desert_cobble"}}
})

core.register_craft({
	output = "default:gravel 5",
	recipe = {
		{"default:rocks", "group:rock", "default:rocks"},
		{"", "default:rocks", ""},
		{"default:rocks", "", "default:rocks"}
	}
})

core.register_craft({
	output = "default:sand 5",
	recipe = {
		{"default:gravel", "group:rock", "default:gravel"},
		{"", "default:gravel", ""},
		{"default:gravel", "", "default:gravel"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:silver_sand 4",
	recipe = {
		{"default:gravel", "group:rock", "default:gravel"},
		{"", "default:gravel", ""},
		{"default:gravel", "", ""}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:desert_sand 5",
	recipe = {
		{"default:desert_rocks", "group:rock", "default:desert_rocks"},
		{"group:rock", "default:desert_rocks", "group:rock"},
		{"default:desert_rocks", "", "default:desert_rocks"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:silt 4",
	recipe = {
		{"default:desert_sand", "group:rock", "default:desert_sand"},
		{"", "default:desert_sand", ""},
		{"default:desert_sand", "", "default:desert_sand"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:silt 3",
	recipe = {
		{"default:silver_sand", "group:rock", "default:silver_sand"},
		{"", "default:silver_sand", ""},
		{"default:silver_sand", "", ""}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:silt 2",
	recipe = {
		{"default:sand", "group:rock", "default:sand"},
		{"", "default:sand", ""}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:clay 4",
	recipe = {
		{"default:silt", "group:rock", "default:silt"},
		{"", "default:silt", ""},
		{"default:silt", "", "default:silt"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:dirt 5",
	recipe = {
		{"default:dry_dirt", "group:water_bucket", "default:dry_dirt"},
		{"", "default:dry_dirt", ""},
		{"default:dry_dirt", "", "default:dry_dirt"}
	},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	output = "default:clay_dirt 5",
	recipe = {
		{"default:dry_clay_dirt", "group:water_bucket", "default:dry_clay_dirt"},
		{"", "default:dry_clay_dirt", ""},
		{"default:dry_clay_dirt", "", "default:dry_clay_dirt"}
	},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	output = "default:mud 5",
	recipe = {
		{"default:dirt", "group:water_bucket", "default:dirt"},
		{"", "default:dirt", ""},
		{"default:dirt", "", "default:dirt"}
	},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"group:leaves", "group:leaves", "group:flora", "group:flora", "default:coir", "default:coir", "farming:straw_pile", "farming:straw_pile", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"group:leaves", "group:leaves", "group:flora", "default:coir", "default:coir", "farming:straw_pile", "farming:straw_pile", "fire:ash", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"group:leaves", "group:leaves", "group:flora", "group:flora", "default:coir", "default:coir", "farming:hay_pile", "farming:hay_pile", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"group:leaves", "group:leaves", "group:flora", "default:coir", "default:coir", "farming:hay_pile", "farming:hay_pile", "fire:ash", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"group:leaves", "group:leaves", "group:flora", "default:coir", "default:coir", "farming:hay_pile", "farming:straw_pile", "fire:ash", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"farming:spent_biomasse", "farming:spent_biomasse", "farming:spent_biomasse", "farming:spent_biomasse",
		"farming:spent_biomasse", "farming:spent_biomasse", "farming:straw_pile", "farming:straw_pile", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"farming:spent_biomasse", "farming:spent_biomasse", "farming:spent_biomasse", "farming:spent_biomasse",
		"farming:spent_biomasse", "farming:spent_biomasse", "farming:hay_pile", "farming:hay_pile", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"farming:spent_biomasse", "group:leaves", "group:flora", "farming:spent_biomasse", "default:coir",
		"farming:spent_biomasse", "farming:straw_pile", "fire:ash", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"farming:spent_biomasse", "group:leaves", "group:flora", "farming:spent_biomasse", "default:coir",
		"farming:spent_biomasse", "farming:hay_pile", "fire:ash", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:dirt 2",
	recipe = {"group:sand", "default:compost", "bonemeal:fertiliser"}
})

core.register_craft({
	type = "shapeless",
	output = "default:clay_dirt 2",
	recipe = {"group:sand", "default:compost", "default:clay_lump", "default:clay_lump", "bonemeal:fertiliser"}
})

register_sandstone("default:sandstone", "default:sand")
register_sandstone("default:desert_sandstone", "default:desert_sand")
register_sandstone("default:silver_sandstone", "default:silver_sand")
register_brick_block("default:obsidian")
register_brick_block("default:stone")
register_brick_block("default:desert_stone")

core.register_craft({
	output = "default:silt",
	recipe = {
		{"default:silt_lump", "default:silt_lump"},
		{"default:silt_lump", "default:silt_lump"}
	}
})

core.register_craft({
	output = "default:clay",
	recipe = {
		{"default:clay_lump", "default:clay_lump"},
		{"default:clay_lump", "default:clay_lump"}
	}
})

core.register_craft({
	output = "default:terracotta",
	recipe = {
		{"default:terracotta_lump", "default:terracotta_lump"},
		{"default:terracotta_lump", "default:terracotta_lump"}
	}
})

core.register_craft({
	output = "default:brick",
	recipe = {
		{"default:clay_brick", "default:clay_brick"},
		{"default:clay_brick", "default:clay_brick"}
	}
})

core.register_craft({
	output = "default:bookshelf",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"default:book", "default:book", "default:book"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

core.register_craft({
	output = "default:ladder_wood 5",
	recipe = {
		{"group:stick", "", "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "", "group:stick"}
	}
})

core.register_craft({
	output = "default:ladder_stone 30",
	recipe = {
		{"default:rocks", "", "default:rocks"},
		{"default:rocks", "default:rocks", "default:rocks"},
		{"default:rocks", "", "default:rocks"}
	}
})

core.register_craft({
	output = "default:ladder_steel 15",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"}
	}
})

core.register_craft({
	output = "default:meselamp",
	recipe = {
		{"default:glass"},
		{"default:mese_crystal"}
	}
})

core.register_craft({
	output = "default:ocealitelamp",
	recipe = {
		{"default:glass"},
		{"default:ocealite_crystal"}
	}
})

core.register_craft({
	output = "default:ice_brick 4",
	recipe = {
		{"default:ice", "default:ice"},
		{"default:ice", "default:ice"}
	}
})

core.register_craft({
	output = "default:ice_block 9",
	recipe = {
		{"default:ice", "default:ice", "default:ice"},
		{"default:ice", "default:ice", "default:ice"},
		{"default:ice", "default:ice", "default:ice"}
	}
})

core.register_craft({
	output = "default:snow_brick 4",
	recipe = {
		{"default:snow_block", "default:snow_block"},
		{"default:snow_block", "default:snow_block"}
	}
})

register_nine("default:coal_block", "default:coal_lump")
register_nine("default:wrought_iron_block", "default:wrought_iron_ingot")
register_nine("default:cast_iron_block", "default:cast_iron_ingot")
register_nine("default:steel_block", "default:steel_ingot")
register_nine("default:stainless_steel_block", "default:stainless_steel_ingot")
register_nine("default:copper_block", "default:copper_ingot")
register_nine("default:tin_block", "default:tin_ingot")
register_nine("default:bronze_block", "default:bronze_ingot")
register_nine("default:chromium_block", "default:chromium_ingot")
register_nine("default:zinc_block", "default:zinc_ingot")
register_nine("default:brass_block", "default:brass_ingot")
register_nine("default:gold_block", "default:gold_ingot")
register_nine("default:mese_crystal", "default:mese_crystal_fragment")
register_nine("default:mese", "default:mese_crystal")
register_nine("default:silver_block", "default:silver_ingot")
register_nine("default:mithril_block", "default:mithril_ingot")
register_nine("default:diamond_block", "default:diamond")
register_nine("default:blue_diamond_block", "default:blue_diamond")
register_nine("default:orichalc_block", "default:orichalc_ingot")
register_nine("default:ocealite_crystal", "default:ocealite_crystal_fragment")
register_nine("default:ocealite", "default:ocealite_crystal")
register_nine("default:crystal_block", "default:crystal_ingot")
register_nine("default:obsidian", "default:obsidian_shard")
register_nine("default:snow_block", "default:snow")
register_nine("default:coir_block", "default:coir")
register_nine("default:rocks", "default:rock")
register_nine("default:desert_rocks", "default:desert_rock")

core.register_craft({
	output = "default:emergent_jungle_sapling",
	recipe = {
		{"default:jungle_sapling", "default:jungle_sapling", "default:jungle_sapling"},
		{"default:jungle_sapling", "default:jungle_sapling", "default:jungle_sapling"},
		{"default:jungle_sapling", "default:jungle_sapling", "default:jungle_sapling"}
	}
})

core.register_craft({
	output = "default:large_cactus_seedling 25",
	recipe = {
		{"default:cactus_fruit"},
		{"default:desert_sand"}
	}
})

core.register_craft({
	output = "default:reed_block",
	recipe = {
		{"default:reed", "default:reed"},
		{"default:reed", "default:reed"}
	}
})

core.register_craft({
	output = "default:woven_mat 2",
	recipe = {
		{"", "group:rock", ""},
		{"default:bulrush_1", "default:bulrush_1", "default:bulrush_1"},
		{"group:grass", "group:grass", "group:grass"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:woven_mat 2",
	recipe = {
		{"", "group:rock", ""},
		{"default:bulrush_2", "default:bulrush_2", "default:bulrush_2"},
		{"group:grass", "group:grass", "group:grass"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:woven_mat 2",
	recipe = {
		{"", "group:rock", ""},
		{"farming:straw_pile", "farming:straw_pile", "farming:straw_pile"},
		{"group:grass", "group:grass", "group:grass"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:woven_mat 2",
	recipe = {
		{"", "group:rock", ""},
		{"farming:flax", "farming:flax", "farming:flax"},
		{"group:grass", "group:grass", "group:grass"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:woven_mat 2",
	recipe = {
		{"", "group:rock", ""},
		{"default:reed", "default:reed", "default:reed"},
		{"group:grass", "group:grass", "group:grass"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:woven_mat 4",
	recipe = {
		{"", "group:rock", ""},
		{"default:papyrus", "default:papyrus", "default:papyrus"},
		{"group:grass", "group:grass", "group:grass"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:woven_mat 2",
	recipe = {
		{"", "group:rock", ""},
		{"default:coir", "default:coir", "default:coir"},
		{"group:grass", "group:grass", "group:grass"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:woven_mat 2",
	recipe = {
		{"", "group:rock", ""},
		{"default:coco_palm_leaves", "default:coco_palm_leaves", "default:coco_palm_leaves"},
		{"group:grass", "group:grass", "group:grass"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "beds:primitive_bed_bottom",
	recipe = {
		{"default:coir", "default:reed_block_dry"},
		{"default:coir", "default:wood"}
	}
})

core.register_craft({
	output = "beds:primitive_bed_bottom",
	recipe = {
		{"default:grass_1", "default:reed_block_dry"},
		{"default:grass_1", "default:wood"}
	}
})

core.register_craft({
	output = "beds:primitive_bed_bottom",
	recipe = {
		{"default:subtrop_grass", "default:reed_block_dry"},
		{"default:subtrop_grass", "default:wood"}
	}
})

core.register_craft({
	output = "beds:primitive_bed_bottom",
	recipe = {
		{"default:savanna_grass_1", "default:reed_block_dry"},
		{"default:savanna_grass_1", "default:wood"}
	}
})


--
-- Crafting (tool repair)
--

core.register_craft({
	type = "toolrepair",
	additional_wear = -.1,--	Buff (10% bonus instead of 2%).
})


--
-- Cooking recipes
--

core.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "group:sand",
})

core.register_craft({
	type = "cooking",
	output = "default:obsidian_glass",
	recipe = "default:obsidian_shard",
})

core.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:rocks",
})

core.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:cobble",
})

core.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:mossycobble",
})

core.register_craft({
	type = "cooking",
	output = "default:desert_stone",
	recipe = "default:desert_rocks",
})

core.register_craft({
	type = "cooking",
	output = "default:desert_stone",
	recipe = "default:desert_cobble",
})

core.register_craft({
	type = "cooking",
	output = "default:ocean_stone",
	recipe = "default:ocean_cobble",
})

core.register_craft({
	type = "cooking",
	output = "default:lava_source",
	recipe = "default:molten_rock",
})

core.register_craft({
	type = "cooking",
	output = "default:dry_dirt",
	recipe = "default:dirt",
	cooktime = 3,
})

core.register_craft({
	type = "cooking",
	output = "default:dry_clay_dirt",
	recipe = "default:clay_dirt",
	cooktime = 3,
})

core.register_craft({
	type = "cooking",
	output = "default:water_source 14",
	recipe = "default:coir_block_wet",
	cooktime = 4,
	replacements = {{"default:coir_block_wet", "default:coir_block"}},
})

core.register_craft({
	type = "cooking",
	output = "default:reed_block_dry",
	recipe = "default:reed_block",
	cooktime = 2,
})

core.register_craft({
	type = "cooking",
	output = "default:cement_block",
	recipe = "default:wet_cement",
	cooktime = 8,
})


--
-- Fuels
--

-- Support use of group:trunk, includes default:apple_trunk, default:beech_trunk which have the same burn time
core.register_craft({
	type = "fuel",
	recipe = "group:trunk",
	burntime = 30,
})

-- Burn time for all woods are in order of wood density,
-- which is also the order of wood colour darkness:
-- aspen, pine, beech, apple, acacia, jungle

core.register_craft({
	type = "fuel",
	recipe = "default:aspen_trunk",
	burntime = 22,
})

core.register_craft({
	type = "fuel",
	recipe = "default:pine_trunk",
	burntime = 26,
})

core.register_craft({
	type = "fuel",
	recipe = "default:acacia_trunk",
	burntime = 34,
})

core.register_craft({
	type = "fuel",
	recipe = "default:jungle_trunk",
	burntime = 38,
})


-- Support use of group:wood, includes default:apple_wood, default:wood which have the same burn time
core.register_craft({
	type = "fuel",
	recipe = "group:wood",
	burntime = 7,
})

core.register_craft({
	type = "fuel",
	recipe = "default:aspen_wood",
	burntime = 5,
})

core.register_craft({
	type = "fuel",
	recipe = "default:pine_wood",
	burntime = 6,
})

core.register_craft({
	type = "fuel",
	recipe = "default:acacia_wood",
	burntime = 8,
})

core.register_craft({
	type = "fuel",
	recipe = "default:jungle_wood",
	burntime = 9,
})


-- Support use of group:sapling, includes default:apple_sapling, default:sapling which have the same burn time
core.register_craft({
	type = "fuel",
	recipe = "group:sapling",
	burntime = 5,
})

core.register_craft({
	type = "fuel",
	recipe = "default:bush_sapling",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "default:acacia_bush_sapling",
	burntime = 4,
})

core.register_craft({
	type = "fuel",
	recipe = "default:pine_bush_sapling",
	burntime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "default:aspen_sapling",
	burntime = 4,
})

core.register_craft({
	type = "fuel",
	recipe = "default:pine_sapling",
	burntime = 5,
})

core.register_craft({
	type = "fuel",
	recipe = "default:acacia_sapling",
	burntime = 6,
})

core.register_craft({
	type = "fuel",
	recipe = "default:jungle_sapling",
	burntime = 6,
})

core.register_craft({
	type = "fuel",
	recipe = "default:emergent_jungle_sapling",
	burntime = 7,
})

core.register_craft({
	type = "fuel",
	recipe = "default:fence_aspen_wood",
	burntime = 5,
})

core.register_craft({
	type = "fuel",
	recipe = "default:fence_pine_wood",
	burntime = 6,
})

core.register_craft({
	type = "fuel",
	recipe = "default:fence_wood",
	burntime = 7,
})

core.register_craft({
	type = "fuel",
	recipe = "default:fence_acacia_wood",
	burntime = 8,
})

core.register_craft({
	type = "fuel",
	recipe = "default:fence_jungle_wood",
	burntime = 9,
})


core.register_craft({
	type = "fuel",
	recipe = "default:fence_rail_aspen_wood",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "default:fence_rail_pine_wood",
	burntime = 4,
})

core.register_craft({
	type = "fuel",
	recipe = "default:fence_rail_wood",
	burntime = 5,
})

core.register_craft({
	type = "fuel",
	recipe = "default:fence_rail_acacia_wood",
	burntime = 6,
})

core.register_craft({
	type = "fuel",
	recipe = "default:fence_rail_jungle_wood",
	burntime = 7,
})

core.register_craft({
	type = "fuel",
	recipe = "default:bush_stem",
	burntime = 7,
})

core.register_craft({
	type = "fuel",
	recipe = "default:acacia_bush_stem",
	burntime = 8,
})

core.register_craft({
	type = "fuel",
	recipe = "default:pine_bush_stem",
	burntime = 6,
})

core.register_craft({
	type = "fuel",
	recipe = "group:leaves",
	burntime = 4,
})

core.register_craft({
	type = "fuel",
	recipe = "default:cactus",
	burntime = 15,
})

core.register_craft({
	type = "fuel",
	recipe = "default:large_cactus_seedling",
	burntime = 5,
})

core.register_craft({
	type = "fuel",
	recipe = "default:reed",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "default:reed_block_dry",
	burntime = 4,
})

core.register_craft({
	type = "fuel",
	recipe = "default:coir_block",
	burntime = 36,
})

core.register_craft({
	type = "fuel",
	recipe = "default:woven_mat",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "default:papyrus",
	burntime = 5,
})

core.register_craft({
	type = "fuel",
	recipe = "default:bookshelf",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "default:ladder_wood",
	burntime = 7,
})

core.register_craft({
	type = "fuel",
	recipe = "default:lava_source",
	burntime = 60,
})

core.register_craft({
	type = "fuel",
	recipe = "default:sign_wall_wood",
	burntime = 10,
})

core.register_craft({
	type = "fuel",
	recipe = "default:coal_block",
	burntime = 370,
})

core.register_craft({
	type = "fuel",
	recipe = "default:boston_fern",
	burntime = 2.5,
})

core.register_craft({
	type = "fuel",
	recipe = "default:subtrop_grass",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "default:jungle_grass_1",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "default:swamp_grass_1",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "default:grass_1",
	burntime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "default:savanna_grass_1",
	burntime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "default:fern_1",
	burntime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "default:marram_grass_1",
	burntime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "default:dry_shrub",
	burntime = 2,
})
