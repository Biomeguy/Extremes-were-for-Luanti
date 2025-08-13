
core.register_node("mapgen:stone_with_ammonite", {
	description = "Stone with Ammonite",
	tiles = {"mapgen_marine_fossil.png"},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

core.register_craftitem("mapgen:tooth", {
	description = "Old Tooth",
	inventory_image = "mapgen_tooth.png"
})

core.register_craftitem("mapgen:bone", {
	description = "Old Bone",
	inventory_image = "mapgen_bone.png"
})

core.register_node("mapgen:stone_with_bone", {
	description = "Stone with Land Fossil",
	tiles = {"mapgen_land_fossil.png"},
	groups = {cracky = 2},
	drop = {
		items = {
			{items = {"mapgen:bone 4"}},
			{items = {"mapgen:bone", "mapgen:tooth"}, rarity = 2},
			{items = {"mapgen:bone", "mapgen:tooth"}, rarity = 3}
		}
	},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:salt", {
	description = "Himalayan Salt",
	tiles = {"mapgen_salt.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("mapgen:salt_block", {
	description = "Himalayan Salt Block",
	tiles = {"mapgen_salt_block.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("mapgen:salt_pink", {
	description = "Pink Himalayan Salt",
	tiles = {"mapgen_salt_pink.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("mapgen:salt_pink_block", {
	description = "Pink Himalayan Salt Block",
	tiles = {"mapgen_salt_pink_block.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab("salt", "mapgen:salt", {cracky = 3}, {"mapgen_salt.png"},
	"Himalayan Salt Stair", "Himalayan Salt Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("salt_block", "mapgen:salt_block", {cracky = 3}, {"mapgen_salt_block.png"},
	"Himalayan Salt Block Stair", "Himalayan Salt Block Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("salt_pink", "mapgen:salt_pink", {cracky = 3}, {"mapgen_salt_pink.png"},
	"Pink Himalayan Salt Stair", "Pink Himalayan Salt Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("salt_pink_block", "mapgen:salt_pink_block", {cracky = 3}, {"mapgen_salt_pink_block.png"},
	"Pink Himalayan Salt Block Stair", "Pink Himalayan Salt Block Slab", default.node_sound_stone_defaults(), true)

core.register_craft({
	type = "cooking",
	output = "mapgen:salt_block",
	recipe = "mapgen:salt",
	cooktime = 5,
})

core.register_craft({
	type = "cooking",
	output = "mapgen:salt_pink_block",
	recipe = "mapgen:salt_pink",
	cooktime = 5,
})

core.register_node("mapgen:granite_black", {
	description = "Black Granite",
	tiles = {"mapgen_granite_black.png"},
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("mapgen:granite_brown", {
	description = "Brown Granite",
	tiles = {"mapgen_granite_brown.png"},
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("mapgen:granite_pink", {
	description = "Pink Granite",
	tiles = {"mapgen_granite_pink.png"},
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("mapgen:limestone", {
	description = "Limestone",
	tiles = {"mapgen_limestone.png"},
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:limestone_pale", {
	description = "Pale Limestone",
	tiles = {"mapgen_limestone_pale.png"},
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "mapgen:limestone_pale",
	recipe = {{"mapgen:limestone"}}
})

core.register_craft({
	output = "mapgen:limestone",
	recipe = {{"mapgen:limestone_pale"}}
})

core.register_craftitem("mapgen:flint", {
	description = "Flint",
	inventory_image = "stoneage_flint.png"
})

core.register_node("mapgen:limestone_with_nodules", {
	description = "Limestone with Nodules",
	tiles = {"mapgen_limestone.png^stoneage_flint_ore.png"},
	groups = {cracky = 3},
	drop = {
		items = {
			{items = {"mapgen:flint 5"}},
			{items = {"mapgen:flint 4"}, rarity = 3},
			{items = {"mapgen:flint 3"}, rarity = 6},
			{items = {"mapgen:flint 2"}, rarity = 9}
		}
	},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:dirt_with_nodules", {
	description = "Dirt with Nodules",
	tiles = {"default_dirt.png^stoneage_flint_ore.png"},
	groups = {crumbly = 3},
	drop = {
		max_items = 1,
		items = {
			{items = {"bonemeal:bone", "mapgen:flint 4"}, rarity = 40},
			{items = {"mapgen:flint 5"}, rarity = 9},
			{items = {"default:dirt", "mapgen:flint 4"}, rarity = 6},
			{items = {"default:dirt", "mapgen:flint 3"}, rarity = 3},
			{items = {"default:dirt", "mapgen:flint 2"}}
		}
	},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("mapgen:sand_with_nodules", {
	description = "Sand with Nodules",
	tiles = {"default_sand.png^stoneage_flint_ore.png"},
	groups = {crumbly = 3, falling_node = 1, falling_node_damage=2},
	drop = {
		max_items = 1,
		items = {
			{items = {"mapgen:flint 5"}, rarity = 9},
			{items = {"mapgen:flint 4"}, rarity = 6},
			{items = {"default:sand", "mapgen:flint 3"}, rarity = 3},
			{items = {"default:sand", "mapgen:flint 2"}}
		}
	},
	sounds = default.node_sound_sand_defaults(),
})

core.register_node("mapgen:gravel_with_nodules", {
	description = "Gravel with Nodules",
	tiles = {"default_gravel.png^stoneage_flint_ore.png"},
	groups = {crumbly = 2, falling_node = 1, falling_node_damage = 3},
	sounds = default.node_sound_gravel_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {"default:flint", "mapgen:flint 4"}, rarity = 16},
			{items = {"mapgen:flint 5"}, rarity = 9},
			{items = {"mapgen:flint 4"}, rarity = 6},
			{items = {"default:gravel", "mapgen:flint 3"}, rarity = 3},
			{items = {"default:gravel", "mapgen:flint 2"}}
		}
	}
})

core.register_tool("mapgen:biface", {
	description = "Biface",
	inventory_image = "stoneage_biface.png",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=3.20, [2]=1.20, [3]=0.60}, uses=60, maxlevel=1},
			crumbly={times={[1]=1.70, [2]=0.70, [3]=0.50}, uses=20, maxlevel=1},
			fleshy={times={[2]=1.00, [3]=0.60}, uses=40, maxlevel=1},
			oddly_breakable_by_hand={times={[1]=3.50, [2]=2.00, [3]=0.70}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=3},
	},
	groups = {axe = 1, shovel = 1, sword = 1, hand_axe = 1}
})

core.register_craft({
	output = "mapgen:biface",
	recipe = {
		{"group:rock"},
		{"mapgen:flint"}
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "fire:firestriker_stone",
	recipe = {{"mapgen:flint", "group:rock"}}
})

core.register_tool("mapgen:club_wood", {
	description = "Club",
	inventory_image = "archaetools_woodclub.png",
	wield_scale = {x=2, y=2, z=2.5},
	tool_capabilities = {
		full_punch_interval= 2,
		max_drop_level= 0,
		groupcaps= {
			choppy= {times= {[3]= .9}, uses= 10, maxlevel= 1},-- Weird
			fleshy= {times= {[2]= 1.5, [3]= .8}, uses= 30, maxlevel= 1},
			snappy= {times= {[2]= 1.6, [3]= .4}, uses= 40, maxlevel= 1},
			oddly_breakable_by_hand = {times={[1]=2.6,[2]=1.7,[3]=.4}, uses=0}
		},
		damage_groups = {fleshy= 3},
	},
	sounds = {breaks = "default_tool_breaks"},
	groups = {sword = 1, flammable = 2}
})

core.register_craft({
	output = "mapgen:club_wood",
	recipe = {
		{"group:wood"},
		{"group:wood"},
		{"group:stick"}
	}
})

local exen = core.get_modpath("extra_energy")

core.register_node("mapgen:savanna_coal", {
	description = "Savanna Stone Coal Ore",
	tiles = {"mapgen_savanna_coal.png"},
	groups = {cracky = 3, xn = 1},
	drop = "default:coal_lump 3",
	sounds = default.node_sound_stone_defaults(),
	after_destruct = exen and function(pos, oldnode)
		core.add_entity(pos, "extra_energy:orb")
	end
})

core.register_node("mapgen:savanna_tin", {
	description = "Savanna Stone Tin Ore",
	tiles = {"mapgen_savanna_tin.png"},
	groups = {cracky = 2},
	drop = "default:tin_lump 4",
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:savanna_stone", {
	description = "Savanna Stone",
	tiles = {"mapgen_savanna_stone.png"},
	groups = {cracky = 3, stone=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:stone_with_redrupee", {
	description = "Buried red rupee",
	tiles = {"default_stone.png^mapgen_redrupee_ore.png"},
	groups = {cracky = 2, xn = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"mapgen:red_rupee 30", "default:rock 4"}, rarity = 30},
			{items = {"mapgen:red_rupee 24", "default:rock 5"}, rarity = 20},
			{items = {"mapgen:red_rupee 18", "default:rock 6"}, rarity = 10},
			{items = {"mapgen:red_rupee 12", "default:rock 7"}, rarity = 5},
			{items = {"mapgen:red_rupee 6", "default:rock 8"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
	after_destruct = exen and function(pos, oldnode)
		core.add_entity(pos, "extra_energy:orb")
	end
})
core.register_node("mapgen:stone_with_bluerupee", {
	description = "Buried blue rupee",
	tiles = {"default_stone.png^mapgen_bluerupee_ore.png"},
	groups = {cracky = 2, xn = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"mapgen:blue_rupee 30", "default:rock 4"}, rarity = 30},
			{items = {"mapgen:blue_rupee 24", "default:rock 5"}, rarity = 20},
			{items = {"mapgen:blue_rupee 18", "default:rock 6"}, rarity = 10},
			{items = {"mapgen:blue_rupee 12", "default:rock 7"}, rarity = 5},
			{items = {"mapgen:blue_rupee 6", "default:rock 8"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
	after_destruct = exen and function(pos, oldnode)
		core.add_entity(pos, "extra_energy:orb")
	end
})
core.register_node("mapgen:stone_with_greenrupee", {
	description = "Buried green rupee",
	tiles = {"default_stone.png^mapgen_greenrupee_ore.png"},
	groups = {cracky = 2, xn = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"mapgen:green_rupee 30", "default:rock 4"}, rarity = 30},
			{items = {"mapgen:green_rupee 24", "default:rock 5"}, rarity = 20},
			{items = {"mapgen:green_rupee 18", "default:rock 6"}, rarity = 10},
			{items = {"mapgen:green_rupee 12", "default:rock 7"}, rarity = 5},
			{items = {"mapgen:green_rupee 6", "default:rock 8"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
	after_destruct = exen and function(pos, oldnode)
		core.add_entity(pos, "extra_energy:orb")
	end
})

stairs.register_stair_and_slab("granite_black", "mapgen:granite_black", {cracky = 1, level = 2}, {"mapgen_granite_black.png"},
	"Black Granite Stair", "Black Granite Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("granite_brown", "mapgen:granite_brown", {cracky = 1, level = 2}, {"mapgen_granite_brown.png"},
	"Brown Granite Stair", "Brown Granite Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("granite_pink", "mapgen:granite_pink", {cracky = 1, level = 2}, {"mapgen_granite_pink.png"},
	"Pink Granite Stair", "Pink Granite Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("limestone", "mapgen:limestone", {cracky = 3}, {"mapgen_limestone.png"},
	"Limestone Stair", "Limestone Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("limestone_pale", "mapgen:limestone_pale", {cracky = 3}, {"mapgen_limestone_pale.png"},
	"Pale Limestone Stair", "Pale Limestone Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("savanna_stone", "mapgen:savanna_stone", {cracky = 3}, {"mapgen_savanna_stone.png"},
	"Savanna Stone Stair", "Savanna Stone Slab", default.node_sound_stone_defaults(), true)

-- crystals

core.register_node("mapgen:crystal_block", {
	description = "Crystal Block",
	drawtype = "glasslike",
	tiles = {{
		name = "mapgen_crystal_block.png",
		animation = {type = "vertical_frames", aspect_w = 1, aspect_h = 1, length = 1.}
	}},
	use_texture_alpha = "blend",
	paramtype = "light",
	light_source = 7,
	groups = {cracky=2, dig_immediate=2, flammable=1},
	sounds = default.node_sound_glass_defaults()	
})

core.register_craftitem("mapgen:crystal_shard", {
	description = "Crystal Shard",
	inventory_image = "mapgen_crystal_shard.png",
	light_source = 7
})

register_nine("mapgen:crystal_block", "mapgen:crystal_shard")

core.register_craft({
	output = "mapgen:crystal_shard 4",
	recipe = {{"mapgen:crystal"}}
})

core.register_craft({
	output = "mapgen:crystal_shard 2",
	recipe = {{"mapgen:crystal_small"}}
})

core.register_node("mapgen:crystal_small", {
	description = "Small Crystal",
	tiles = {{
		name = "mapgen_crystal_anim.png",
		animation = {type = "vertical_frames", aspect_w = 1, aspect_h = 1, length = 1.}
	}},
	use_texture_alpha = "blend",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 7,
	node_box = {
		type = "fixed",
		fixed = {
			{-3/16, -.5, -3/16, 3/16, 3/16, 3/16},
			{-2/16, -.5, -2/16, 2/16, .5, 2/16},
			{-1/16, -.5, 3/16, 2/16, .125, 6/16},
			{3/16, -.5, -2/16, 6/16, .0625, 1/16},
			{-5/16, -.5, -5/16, -2/16, 0, -2/16}
		}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(2)
	end,
	on_timer = function(pos)
		core.add_particle({
			pos = {x=pos.x, y=pos.y+.1, z=pos.z},
			expirationtime = 5.5,
			size = 17,
			texture = "mapgen_crystal_glow.png",
			animation = {type = "vertical_frames", aspect_w = 1, aspect_h = 1, length = 1.},
			glow = 9 })
		core.get_node_timer(pos):start(5)
	end,
	groups = {cracky=2, dig_immediate=2, timer_check=1, flammable=1},
	sounds = default.node_sound_glass_defaults()	
})

core.register_node("mapgen:crystal", {
	description = "Crystal",
	tiles = {{
		name = "mapgen_crystal_anim.png",
		animation = {type = "vertical_frames", aspect_w = 1, aspect_h = 1, length = 1.}
	}},
	use_texture_alpha = "blend",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 7,
	node_box = {
		type = "fixed",
		fixed = {
			{-5/16, -.5, -5/16, 5/16, .5, 5/16},
			{-3/16, -.5, -3/16, 3/16, 14/16, 3/16},
			{-7/16, -.5, -3/16, 5/16, 3/16, 3/16},
			{-3/16, -.5, -7/16, 7/16, 3/16, 3/16}
		}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(2)
	end,
	on_timer = function(pos)
		core.add_particle({
			pos = {x=pos.x, y=pos.y+.5, z=pos.z},
			expirationtime = 5.5,
			size = 25,
			texture = "mapgen_crystal_glow.png",
			animation = {type = "vertical_frames", aspect_w = 1, aspect_h = 1, length = 1.},
			glow = 9 })
		core.get_node_timer(pos):start(5)
	end,
	groups = {cracky=2, dig_immediate=2, timer_check=1, flammable=1},
	sounds = default.node_sound_glass_defaults()
})

core.register_craftitem("mapgen:adamantium_lump", {
	description = "Adamantium Lump",
	inventory_image = "mapgen_adamantium_lump.png",
})

core.register_craftitem("mapgen:adamantium_ingot", {
	description = "Adamantium Ingot",
	inventory_image = "mapgen_adamantium_ingot.png",
})

core.register_node("mapgen:adamantium", {
	description = "Adamantium Block",
	tiles = {"mapgen_adamantium.png"},
	is_ground_content = false,
	groups = {hard=1, unbreakable=1},
	sounds = default.node_sound_metal_defaults({
		dig = {name = "default_dig_metal", gain= .7},
		footstep = {name="hardmetal_footstep", gain= .6},
	})
})

core.register_node("mapgen:adamantium_ore", {
	description = "Stone with Adamantium",
	tiles = {"default_stone.png^mapgen_adamantium_ore.png"},
	groups = {cracky=1, level=3},
	drop = "mapgen:adamantium_lump",
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	type = "cooking",
	output = "mapgen:adamantium_ingot",
	recipe = "mapgen:adamantium_lump",
	cooktime = 20,
})

register_nine("mapgen:adamantium", "mapgen:adamantium_ingot")

core.register_tool("mapgen:pick_adamantium", {
	description = "Adamantium Pickaxe",
	inventory_image = "mapgen_adamantiumpick.png",
	tool_capabilities = {
		full_punch_interval = 0.3,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[4]=2.5, [1]=.45, [2]=.15, [3]=.07}, uses=180, maxlevel=3},
			hard = {times={[1]=3., [2]=6., [3]=12.}, uses=145, maxlevel=3},
		},
		damage_groups = {fleshy=15},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

core.register_tool("mapgen:sword_adamantium", {
	description = "Adamantium Sword",
	inventory_image = "mapgen_adamantiumsword.png",
	tool_capabilities = {
		full_punch_interval = 0.2,
		max_drop_level=2,
		groupcaps={
			snappy={times={[1]=.34, [2]=.1, [3]=.04}, uses=180, maxlevel=3},
		},
		damage_groups = {fleshy=19},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

core.register_craft({
	output = "mapgen:pick_adamantium",
	recipe = {
		{"mapgen:adamantium_ingot", "mapgen:adamantium_ingot", "mapgen:adamantium_ingot"},
		{"", "default:steel_ingot", ""},
		{"", "default:steel_ingot", ""}
	}
})

core.register_craft({
	output = "mapgen:sword_adamantium",
	recipe = {
		{"mapgen:adamantium_ingot"},
		{"mapgen:adamantium_ingot"},
		{"default:steel_ingot"}
	}
})

core.register_craftitem("mapgen:grecrysium_brick", {
	description = "Grecrysium Brick",
	inventory_image = "mapgen_grecrysium_brick.png",
})

core.register_node("mapgen:grecrysium", {
	description = "Grecrysium",
	tiles = {"mapgen_grecrysium.png"},
	is_ground_content = false,
	groups = {cracky=1, level=3},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	type = "shapeless",
	output = "mapgen:grecrysium_brick 4",
	recipe = {"mapgen:crystal_3", "mapgen:adamantium_ingot", "mapgen:adamantium_ingot", "mapgen:adamantium_ingot"}
})

core.register_craft({
	output = "mapgen:grecrysium",
	recipe = {
		{"mapgen:grecrysium_brick", "mapgen:grecrysium_brick"},
		{"mapgen:grecrysium_brick", "mapgen:grecrysium_brick"}
	}
})

core.register_craft({
	output = "mapgen:grecrysium_brick 4",
	recipe = {{"mapgen:grecrysium"}}
})

core.register_craftitem("mapgen:roof_tile_terracotta", {
	description = "Terracotta Roof Tile",
	inventory_image = "roof_tile_terracotta.png",
})

core.register_craft({
	type = "cooking",
	output = "mapgen:roof_tile_terracotta",
	recipe = "default:terracotta_lump",
})

core.register_node("mapgen:terracotta_shingles", {
	description = "Terracotta Shingles",
	tiles = {"shingles_terracotta.png", "default_wood.png", "shingles_terracotta.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults({
		footstep = {name="hardhollow_footstep", gain= .4},
	}),
})

core.register_craft({
	output = "mapgen:terracotta_shingles",
	recipe = {
		{"mapgen:roof_tile_terracotta", "mapgen:roof_tile_terracotta", "mapgen:roof_tile_terracotta"},
		{"mapgen:roof_tile_terracotta", "default:wood", "mapgen:roof_tile_terracotta"}
	}
})

core.register_craft({
	output = "mapgen:roof_tile_terracotta 5",
	recipe = {{"mapgen:terracotta_shingles"}},
	replacements = {{"mapgen:terracotta_shingles", "default:wood"}}
})

core.register_node("mapgen:terracotta_block", {
	description = "Terracotta Block",
	tiles = {"terracotta_block.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "cooking",
	output = "mapgen:terracotta_block",
	recipe = "default:terracotta",
	cooktime = 8,
})

core.register_node("mapgen:terracotta_carved", {
	description = "Carved terracotta",
	tiles = {"terracotta_carved.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = "mapgen:terracotta_carved 4",
	recipe = {
		{"mapgen:terracotta_block", "mapgen:terracotta_block"},
		{"mapgen:terracotta_block", "mapgen:terracotta_block"}
	}
})

stairs.register_stair_and_slab("terracotta_shingles", "mapgen:terracotta_shingles",
	{cracky = 3},
	{"shingles_terracotta.png", "default_wood.png", "shingles_terracotta.png"},
	"Terracotta Shingle stair",
	"Terracotta Shingle slab",
	default.node_sound_stone_defaults({
		footstep = {name="hardhollow_footstep", gain= .4},
	}),
	false
)

stairs.register_stair_and_slab("terracotta_block", "mapgen:terracotta_block",
	{cracky = 3},
	{"terracotta_block.png"},
	"Terracotta block stair",
	"Terracotta block slab",
	default.node_sound_stone_defaults(),
	true
)

core.register_node("mapgen:reet", {
	description = "Reet (for thatching)",
	tiles = {"cottages_reet.png"},
	is_ground_content = false,
	groups = {hay = 3, snappy=3,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output  = "mapgen:reet 6",
	recipe = {{"default:reed_block_dry", "farming:straw", "default:reed_block_dry"},
		{"farming:straw", "default:reed_block_dry", "farming:straw"}}
})

stairs.register_stair_and_slab("reet", "mapgen:reet",
	{hay = 3, snappy=3,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	{"cottages_reet.png"},
	"Reet stair",
	"Reet slab",
	default.node_sound_leaves_defaults(),
	true
)

core.register_node("mapgen:bush", {
	description = "Though Bush",
	drawtype = "allfaces",
	tiles = {"mapgen_bush_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy=1, flammable=1},
	sounds = default.node_sound_leaves_defaults()
})

core.register_craft({
	output = "mapgen:bush",
	recipe = {{"mapgen:crystal_shard", "default:bush_leaves"}}
})

core.register_craft({
	output = "mapgen:bush",
	recipe = {{"mapgen:crystal_shard", "default:beech_leaves"}}
})

core.register_node("mapgen:stucco", {
	description = "Stucco",
	tiles = {"decor_stucco.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = "mapgen:stucco 4",
	recipe = {
		{"default:gravel","default:sand"},
		{"default:clay_lump","farming:straw"}
	}
})

core.register_node("mapgen:floatite", {
	description = "Floatite",
	tiles = {"mapgen_floatite.png"},
	groups = {snappy=3, crumbly=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_dirt_defaults({
		place = {name = "default_grass_footstep", gain = .06},
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
		footstep = {name = "default_grass_footstep", gain = .13},
	}),
	on_place = function(item, placer, pointd)
		local node_ptu = core.get_node(pointd.under)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					item, pointd)
			end
		end

		local pos = pointd.above
		local nname = core.get_node(pos).name
	if nname == "air" or core.registered_nodes[nname].buildable_to then
	elseif core.registered_nodes[node_ptu.name] then
		pos = pointd.under
	else	return item end
		local pname = placer:get_player_name()

		if not core.is_protected(pos, pname) then
	core.dig_node(pos)
	core.set_node(pos, {name = "mapgen:floatite"})
	if not core.is_creative_enabled(pname) then
		item:take_item()
	end
		else
			core.chat_send_player(pname, "Node is protected")
			core.record_protection_violation(pos, pname)
		end

		return item
	end,
	on_secondary_use = function(item, user)
		local pos = user:get_pos()	pos.y= pos.y+ 1
		local dir = user:get_look_dir()
		local pname = user:get_player_name()

	for i=1, 3 do
		pos = vector.add(pos, dir)
	end
		if not core.is_protected(pos, pname) then
		local nname = core.get_node(pos).name
	if nname == "air" or core.registered_nodes[nname].buildable_to then
	core.dig_node(pos)
	core.set_node(pos, {name = "mapgen:floatite"})
	core.sound_play("default_grass_footstep", {pos = pos, gain = .06}, true)
	if not core.is_creative_enabled(user:get_player_name()) then
		item:take_item() end
	end
		else
			core.chat_send_player(pname, "Node is protected")
			core.record_protection_violation(pos, pname)
		end

		return item
	end
})

core.register_craft({
	output = "mapgen:floatite",
	recipe = {
		{"ecology:stoneweed", "ecology:stoneweed", "ecology:stoneweed"},
		{"ecology:stoneweed", "default:clay", "ecology:stoneweed"},
		{"ecology:stoneweed", "ecology:stoneweed", "ecology:stoneweed"}
	}
})

local function get_drops(stoneName, rubbleName)
	return {
		max_items = 1,
	items = {
		{items = {rubbleName}, rarity = 3},--	1/3 chance to drop rubble
		{items = {stoneName}}
	}}
end

core.register_node("mapgen:adobe", {
	description = "Adobe (Mud Brick)",
	tiles = {"darkage_adobe.png"},
	groups = {crumbly=3},
	sounds = default.node_sound_sand_defaults(),
})

stairs.register_stair_and_slab("adobe", "mapgen:adobe", {crumbly = 3}, {"darkage_adobe.png"},
	"Adobe Stair", "Adobe Slab", default.node_sound_sand_defaults(), true)

core.register_craftitem("mapgen:chalk_powder", {
	description = "Chalk Powder",
	inventory_image = "darkage_chalk_powder.png",
})

core.register_node("mapgen:chalk", {
	description = "Chalk",
	tiles = {"darkage_chalk.png"},
	drop = "mapgen:chalk_powder 4",
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:gneiss", {
	description = "Gneiss",
	tiles = {"darkage_gneiss.png"},
	groups = {cracky = 3, stone = 1},
	drop = get_drops("mapgen:gneiss", "mapgen:gneiss_rubble"),
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:gneiss_rubble", {
	description = "Gneiss Rubble",
	tiles = {"darkage_gneiss_rubble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:gneiss_brick", {
	description = "Gneiss Brick",
	tiles = {"darkage_gneiss_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:gneiss_block", {
	description = "Gneiss Block",
	tiles = {"darkage_gneiss_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults()
})

stairs.register_stair_and_slab("gneiss", "mapgen:gneiss", {cracky = 3}, {"darkage_gneiss.png"},
	"Gneiss Stair", "Gneiss Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("gneiss_rubble", "mapgen:gneiss_rubble", {cracky = 3}, {"darkage_gneiss_rubble.png"},
	"Gneiss Rubble Stair", "Gneiss Rubble Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("gneiss_brick", "mapgen:gneiss_brick", {cracky = 2}, {"darkage_gneiss_brick.png"},
	"Gneiss Brick Stair", "Gneiss Brick Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("gneiss_block", "mapgen:gneiss_block", {cracky = 2}, {"darkage_gneiss_block.png"},
	"Gneiss Block Stair", "Gneiss Block Slab", default.node_sound_stone_defaults(), true)

core.register_craftitem("mapgen:mud_lump", {
	description = "Clay Mud Lump",
	inventory_image = "darkage_mud_lump.png",
})

core.register_node("mapgen:mud", {
	description = "Clay Mud",
	tiles = {"darkage_mud_up.png","darkage_mud.png"},
	groups = {crumbly=3},
	drop = "mapgen:mud_lump 4",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_dirt_footstep", gain = .2},
	}),
})

core.register_node("mapgen:serpentine", {
	description = "Serpentine",
	tiles = {"darkage_serpentine.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

stairs.register_stair_and_slab("serpentine", "mapgen:serpentine", {cracky = 3}, {"darkage_serpentine.png"},
	"Serpentine Stair", "Serpentine Slab", default.node_sound_stone_defaults(), true)

core.register_node("mapgen:shale", {
	description = "Shale",
	tiles = {"darkage_shale.png","darkage_shale.png","darkage_shale_side.png"},
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

stairs.register_stair_and_slab("shale", "mapgen:shale", {crumbly=2,cracky=2}, {"darkage_shale.png","darkage_shale.png","darkage_shale_side.png"},
	"Shale Stair", "Shale Slab", default.node_sound_stone_defaults(), true)

core.register_node("mapgen:schist", {
	description = "Schist",
	tiles = {"darkage_schist.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

stairs.register_stair_and_slab("schist", "mapgen:schist", {cracky = 3}, {"darkage_schist.png"},
	"Schist Stair", "Schist Slab", default.node_sound_stone_defaults(), true)

core.register_node("mapgen:slate", {
	description = "Slate",
	tiles = {"darkage_slate.png","darkage_slate.png","darkage_slate_side.png"},
	drop = "mapgen:slate_rubble",
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:slate_rubble", {
	description = "Slate Rubble",
	tiles = {"darkage_slate_rubble.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:slate_tile", {
	description = "Slate Tile",
	tiles = {"darkage_slate_tile.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:slate_brick", {
	description = "Slate Brick",
	tiles = {"darkage_slate_brick.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:slate_block", {
	description = "Slate Block",
	tiles = {"darkage_slate_block.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

stairs.register_stair_and_slab("slate", "mapgen:slate", {cracky = 2}, {"darkage_slate.png","darkage_slate.png","darkage_slate_side.png"},
	"Slate Stair", "Slate Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("slate_rubble", "mapgen:slate_rubble", {cracky = 2}, {"darkage_slate_rubble.png"},
	"Slate Rubble Stair", "Slate Rubble Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("slate_tile", "mapgen:slate_tile", {cracky = 2}, {"darkage_slate_tile.png"},
	"Slate Tile Stair", "Slate Tile Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("slate_brick", "mapgen:slate_brick", {cracky = 2}, {"darkage_slate_brick.png"},
	"Slate Brick Stair", "Slate Brick Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("slate_block", "mapgen:slate_block", {cracky = 2}, {"darkage_slate_block.png"},
	"Slate Block Stair", "Slate Block Slab", default.node_sound_stone_defaults(), true)

core.register_node("mapgen:tuff", {
	description = "Tuff",
	tiles = {"darkage_tuff.png"},
	legacy_mineral = true,
	groups = {cracky = 3, stone = 1},
	drop = get_drops("mapgen:tuff", "mapgen:tuff_rubble"),
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:tuff_rubble", {
	description = "Tuff Rubble",
	tiles = {"darkage_tuff_rubble.png"},
	groups = {crumbly = 2, falling_node = 1, stone = 1},
	sounds = default.node_sound_gravel_defaults(),
})

core.register_node("mapgen:rhyolitic_tuff", {
	description = "Rhyolitic Tuff",
	tiles = {"darkage_rhyolitic_tuff.png"},
	legacy_mineral = true,
	groups = {cracky = 3, stone = 1},
	drop = get_drops("mapgen:rhyolitic_tuff", "mapgen:rhyolitic_tuff_rubble"),
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mapgen:rhyolitic_tuff_rubble", {
	description = "Rhyolitic Tuff Rubble",
	tiles = {"darkage_rhyolitic_tuff_rubble.png"},
	groups = {crumbly = 2, falling_node = 1, stone = 1},
	sounds = default.node_sound_gravel_defaults(),
})

core.register_node("mapgen:lamp", {
	description = "Lamp",
	drawtype = "glasslike",
	tiles = {"darkage_lamp.png"},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX-1,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

if core.get_modpath("moreblocks") then
stairsplus:register_all("mapgen", "salt", "mapgen:salt", {
	description = "Himalayan Salt",
	tiles = {"mapgen_salt.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "salt_block", "mapgen:salt_block", {
	description = "Himalayan Salt Block",
	tiles = {"mapgen_salt_block.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "salt_pink", "mapgen:salt_pink", {
	description = "Pink Himalayan Salt",
	tiles = {"mapgen_salt_pink.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "salt_pink_block", "mapgen:salt_pink_block", {
	description = "Pink Himalayan Salt Block",
	tiles = {"mapgen_salt_pink_block.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "granite_black", "mapgen:granite_black", {
	description = "Black Granite",
	tiles = {"mapgen_granite_black.png"},
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "granite_brown", "mapgen:granite_brown", {
	description = "Brown Granite",
	tiles = {"mapgen_granite_brown.png"},
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "granite_pink", "mapgen:granite_pink", {
	description = "Pink Granite",
	tiles = {"mapgen_granite_pink.png"},
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "limestone", "mapgen:limestone", {
	description = "Limestone",
	tiles = {"mapgen_limestone.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "limestone_pale", "mapgen:limestone_pale", {
	description = "Pale Limestone",
	tiles = {"mapgen_limestone_pale.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "savanna_stone", "mapgen:savanna_stone", {
	description = "Savanna Stone",
	tiles = {"mapgen_savanna_stone.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "terracotta_shingles", "mapgen:terracotta_shingles", {
	description = "Terracotta Shingles",
	tiles = {"shingles_terracotta.png", "default_wood.png", "shingles_terracotta.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults({
		footstep = {name="hardhollow_footstep", gain= .4},
	}),
})

stairsplus:register_all("mapgen", "terracotta_block", "mapgen:terracotta_block", {
	description = "Terracotta Block",
	tiles = {"terracotta_block.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "reet", "mapgen:reet", {
	description = "Reet",
	tiles = {"cottages_reet.png"},
	groups = {hay = 3, snappy=3,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_leaves_defaults(),
})

stairsplus:register_all("mapgen", "adobe", "mapgen:adobe", {
	description = "Adobe",
	tiles = {"darkage_adobe.png"},
	groups = {crumbly=3},
	sounds = default.node_sound_sand_defaults(),
})

stairsplus:register_all("mapgen", "gneiss", "mapgen:gneiss", {
	description = "Gneiss",
	tiles = {"darkage_gneiss.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "gneiss_rubble", "mapgen:gneiss_rubble", {
	description = "Gneiss Rubble",
	tiles = {"darkage_gneiss_rubble.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "gneiss_brick", "mapgen:gneiss_brick", {
	description = "Gneiss Brick",
	tiles = {"darkage_gneiss_brick.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "gneiss_block", "mapgen:gneiss_block", {
	description = "Gneiss Block",
	tiles = {"darkage_gneiss_block.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "serpentine", "mapgen:serpentine", {
	description = "Serpentine",
	tiles = {"darkage_serpentine.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "shale", "mapgen:shale", {
	description = "Shale",
	tiles = {"darkage_shale.png","darkage_shale.png","darkage_shale_side.png"},
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "schist", "mapgen:schist", {
	description = "Schist",
	tiles = {"darkage_schist.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "slate", "mapgen:slate", {
	description = "Slate",
	tiles = {"darkage_slate.png","darkage_slate.png","darkage_slate_side.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "slate_rubble", "mapgen:slate_rubble", {
	description = "Slate Rubble",
	tiles = {"darkage_slate_rubble.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "slate_tile", "mapgen:slate_tile", {
	description = "Slate Tile",
	tiles = {"darkage_slate_tile.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "slate_brick", "mapgen:slate_brick", {
	description = "Slate Brick",
	tiles = {"darkage_slate_brick.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("mapgen", "slate_block", "mapgen:slate_block", {
	description = "Slate Block",
	tiles = {"darkage_slate_block.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})
end

core.register_craft({
	output = "mapgen:adobe 4",
	recipe = {
		{"default:sand","default:sand"},
		{"default:clay_lump","farming:straw"}
	}
})

core.register_craft({
	output = "mapgen:chalk",
	recipe = {
		{"mapgen:chalk_powder","mapgen:chalk_powder"},
		{"mapgen:chalk_powder","mapgen:chalk_powder"}
	}
})

core.register_craft({
	output = "mapgen:mud 3",
	recipe = {
		{"default:clay","default:dirt"},
		{"default:clay_lump","default:silt_lump"}
	}
})

core.register_craft({
	output = "mapgen:mud",
	recipe = {
		{"mapgen:mud_lump","mapgen:mud_lump"},
		{"mapgen:mud_lump","mapgen:mud_lump"}
	}
})

core.register_craft({
	output = "mapgen:slate_tile 4",
	recipe = {
		{"mapgen:slate_brick","mapgen:slate_brick"},
		{"mapgen:slate_brick","mapgen:slate_brick"}
	}
})

core.register_craft({
	output = "mapgen:slate_brick 4",
	recipe = {
		{"mapgen:slate","mapgen:slate"},
		{"mapgen:slate","mapgen:slate"}
	}
})

core.register_craft({
	output = "mapgen:slate_block 9",
	recipe = {
		{"mapgen:slate","mapgen:slate","mapgen:slate"},
		{"mapgen:slate","mapgen:slate","mapgen:slate"},
		{"mapgen:slate","mapgen:slate","mapgen:slate"}
	}
})

core.register_craft({
	output = "mapgen:lamp",
	recipe = {
		{"default:stick","xpanes:pane_flat","xpanes:pane_flat"},
		{"xpanes:pane_flat","default:meselamp_torch","xpanes:pane_flat"},
		{"xpanes:pane_flat","xpanes:pane_flat","default:stick"}
	}
})

-- Cooking
core.register_craft({
	type = "cooking",
	output = "mapgen:gneiss",
	recipe = "mapgen:schist",
})

core.register_craft({
	type = "cooking",
	output = "mapgen:gneiss",
	recipe = "mapgen:gneiss_rubble",
})

core.register_craft({
	type = "cooking",
	output = "mapgen:schist",
	recipe = "mapgen:slate",
})

core.register_craft({
	type = "cooking",
	output = "mapgen:shale",
	recipe = "mapgen:mud",
})

core.register_craft({
	type = "cooking",
	output = "mapgen:slate",
	recipe = "mapgen:shale",
})

core.register_craft({
	type = "cooking",
	output = "mapgen:slate",
	recipe = "mapgen:slate_rubble",
})

core.register_craft({
	output = "mapgen:tuff 2",
	recipe = {
		{"mapgen:gneiss","default:stone"},
		{"default:stone","mapgen:gneiss"}
	}
})

core.register_craft({
	type = "cooking",
	output = "mapgen:tuff",
	recipe = "mapgen:tuff_rubble",
})

core.register_craft({
	output = "mapgen:tuff_bricks 4",
	recipe = {
		{"mapgen:tuff","mapgen:tuff"},
		{"mapgen:tuff","mapgen:tuff"}
	}
})

core.register_craft({
	output = "mapgen:rhyolitic_tuff 2",
	recipe = {
		{"mapgen:gneiss","default:desert_stone"},
		{"default:desert_stone","mapgen:gneiss"}
	}
})

core.register_craft({
	type = "cooking",
	output = "mapgen:rhyolitic_tuff",
	recipe = "mapgen:rhyolitic_tuff_rubble",
})

core.register_craft({
	output = "mapgen:rhyolitic_tuff_bricks 4",
	recipe = {
		{"mapgen:rhyolitic_tuff","mapgen:rhyolitic_tuff"},
		{"mapgen:rhyolitic_tuff","mapgen:rhyolitic_tuff"}
	}
})

core.register_node("mapgen:straw_ground", {
	description = "Straw ground for animals",
	tiles = {"farming_straw.png","default_dirt.png"},
	is_ground_content = false,
	groups = {snappy=2,crumbly=3},
	drop = {
		items = {
			{items = {"default:dirt", "farming:straw_pile"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("mapgen:pane_side", {
	description = "Side Glass Pane",
	drawtype = "nodebox",
	tiles = {"default_glass.png"},
	inventory_image = "default_glass.png",
	wield_image = "default_glass.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	use_texture_alpha = "clip",
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -7/16, .5, .5, -.5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -7/16, .5, .5, -.5}
	},
	is_ground_content = false,
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "mapgen:straw_ground",
	recipe = {
		{"farming:straw_pile"},
		{"default:dirt"}
	}
})

core.register_craft({
	output = "mapgen:pane_side",
	recipe = {{"xpanes:pane_flat"}}
})

core.register_craft({
	output = "xpanes:pane_flat",
	recipe = {{"mapgen:pane_side"}}
})

core.register_node("mapgen:sandstone_wall", {
	description = "Painted Sandstone Wall",
	tiles = {"default_sandstone.png", "default_sandstone.png",
	"decor_sandstone_wall.png", "decor_sandstone_wall2.png",
	"decor_sandstone_wall3.png", "decor_sandstone_wall4.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("mapgen:painted_sandstone_tile", {
	description = "Painted Sandstone Tile",
	tiles = {"default_sandstone.png^decor_floortile.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("mapgen:sandstone_pillar", {
	description = "Sandstone Pillar",
	tiles = {"decor_sandstone_pillar_top.png", "decor_sandstone_pillar_top.png", "decor_sandstone_pillar.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
	on_place = core.rotate_node
})

core.register_node("mapgen:sandstone_pillar_base", {
	description = "Sandstone Pillar Base",
	drawtype = "nodebox",
	tiles = {"decor_sandstone_pillar_top.png", "decor_sandstone_pillar_top.png", "decor_sandstone_pillar.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.5625, -.5, -.5625, .5625, -.3125, .5625},
			{-.625, -.5, -.625, .625, -.4375, .625}
		}
	},
	on_place = core.rotate_node
})

core.register_node("mapgen:huge_bone", {
	description = "Huge Bone",
	tiles = {"decor_huge_bone_top.png", "decor_huge_bone_top.png", "decor_huge_bone.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
	on_place = core.rotate_node
})

register_nine("mapgen:huge_bone", "bonemeal:bone")

core.register_node("mapgen:oil_source", {
	description = "Oil Source",
	drawtype = "liquid",
	tiles = {{
		name = "mapgen_oil_source_animated.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.},
		},
		{
		name = "mapgen_oil_source_animated.png",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.},
	}},
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "mapgen:oil_flowing",
	liquid_alternative_source = "mapgen:oil_source",
	liquid_viscosity = 5,
	liquid_renewable = false,
	damage_per_second = 1,
	post_effect_color = {a = 255, r = 20, g = 17, b = 22},
	groups = {oil = 3, liquid = 2, flammable = 6},
})

core.register_node("mapgen:oil_flowing", {
	description = "Flowing Oil",
	drawtype = "flowingliquid",
	tiles = {"mapgen_oil.png"},
	special_tiles = {{
		name = "mapgen_oil_flowing_animated.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3},
		},
		{
		name = "mapgen_oil_flowing_animated.png",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3},
	}},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "mapgen:oil_flowing",
	liquid_alternative_source = "mapgen:oil_source",
	liquid_viscosity = 5,
	liquid_renewable = false,
	damage_per_second = 1,
	post_effect_color = {a = 255, r = 20, g = 17, b = 22},
	groups = {oil = 3, liquid = 2, flammable = 6, not_in_creative_inventory = 1},
})

bucket.register_liquid(
	"mapgen:oil_source",
	"mapgen:oil_flowing",
	"mapgen:bucket_oil",
	"bucket_oil.png",
	"Oil Bucket",
	{tool = 1}
)

core.register_craft({
	type = "fuel",
	recipe = "mapgen:bucket_oil",
	burntime = 90,
	replacements = {{"mapgen:bucket_oil", "bucket:bucket_empty"}}
})

-- Blox by Sanchez, modified mapgen by blert2112

core.register_node("mapgen:glow_stone", {
	description = "Glow stone",
	tiles = {"blox_glowstone.png"},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("mapgen:glowdust", {
	description = "Glow Dust",
	drawtype = "plantlike",
	tiles = {"blox_glowdust.png"},
	inventory_image = "blox_glowdust.png",
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 9,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.2, .3}
	},
	groups = {crumbly=3},
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_sand_footstep", gain = .08},
	}),
})

core.register_craft({
	output = "mapgen:glow_stone",
	recipe = {
		{"", "mapgen:glowdust", ""},
		{"mapgen:glowdust", "mapgen:glowdust", "mapgen:glowdust"},
		{"", "mapgen:glowdust", ""}
	}
})

core.register_node("mapgen:glowore", {
	description = "Glow Ore",
	tiles = {"default_stone.png^[colorize:black:8^blox_glowore.png", "default_stone.png^[colorize:black:144^blox_glowore.png",
		"default_stone.png^[colorize:black:87^blox_glowore.png", "default_stone.png^[colorize:black:87^blox_glowore.png",
		"default_stone.png^[colorize:black:52^blox_glowore.png"},
	paramtype = "light",
	light_source = 8,
	drop = {
		max_items = 1,
		items = {
			{items = {"mapgen:glow_stone"}, rarity = 15},
			{items = {"mapgen:glowdust 4", "default:rock 2"}, rarity = 5},
			{items = {"mapgen:glowdust 3", "default:rock 4"}}
		}
	},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_tool("mapgen:bloodbane", {
	description = "Blood Bane",
	inventory_image = "blox_bloodbane.png",
	tool_capabilities = {
		full_punch_interval = .2,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[1]=.001, [2]=.001, [3]=.001}, uses=0, maxlevel=5},
			snappy={times={[1]=.01, [2]=.01, [3]=.01}, uses=0, maxlevel=5},
			crumbly={times={[1]=.01, [2]=.01, [3]=.01}, uses=0, maxlevel=5},
			cracky={times={[4]=.01, [1]=.01, [2]=.01, [3]=.01}, uses=0, maxlevel=5},
			choppy={times={[1]=.01, [2]=.01, [3]=.01}, uses=0, maxlevel=5},
			dig_immediate={times={[1]=.01, [2]=.01, [3]=.01}, uses=0, maxlevel=5},
			hard={times={[1]=.01, [2]=.01, [3]=.01}, uses=0, maxlevel=5},
			bendy={times={[1]=.01, [2]=.01, [3]=.01}, uses=0, maxlevel=5}
		},
		damage_groups = {fleshy=1000},
		punch_attack_uses=65535,
	}
})

core.register_craft({
	output = "mapgen:bloodbane",
	recipe = {
		{"", "", "default:obsidian_shard"},
		{"default:obsidian_shard", "mapgen:ganon_sphere", ""},
		{"default:obsidian_shard", "default:obsidian_shard", ""}
	}
})

core.register_node("mapgen:paving_brick", {
	description = "Paving Brick",
	tiles = {"castle_paving_brick.png"},
	is_ground_content = false,
	groups = {cracky=2, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = "mapgen:paving_brick 4",
	recipe = {
		{"default:stone", "default:cobble"},
		{"default:cobble", "default:stone"}
	}
})
