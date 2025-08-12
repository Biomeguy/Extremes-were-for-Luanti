local depends, default_sounds = ...

if depends.armor then
	armor:register_armor("noel:hat_santa", {
		description = "Santa Hat",
		inventory_image = "noel_hat_santa_inv.png",
		groups = {armor_head = 1, armor_use = 0},
	})

	armor:register_armor("noel:hat_elf", {
		description = "Elf Hat",
		inventory_image = "noel_hat_elf_inv.png",
		groups = {armor_head = 1, armor_use = 0},
	})

	if depends.fabric then
		core.register_craft({
			output = "noel:hat_santa",
			recipe = {
				{"", "fabric:block_white", ""},
				{"", "fabric:block_red", ""},
				{"fabric:block_red", "fabric:block_red", "fabric:block_red"},
			}
		})

		if depends.default then
			core.register_craft({
				output = "noel:hat_elf",
				recipe = {
					{"", "default:bronze_ingot", ""},
					{"", "fabric:block_green", ""},
					{"fabric:block_red", "fabric:block_green", "fabric:block_red"},
				}
			})
		end
	end
end

core.register_node("noel:mistletoe", {
	description = "Mistletoe",
	drawtype = "plantlike",
	tiles = {"noel_mistletoe.png"},
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.2, -.1, .1, .5, .1},
	},
	groups = {snappy = 3},
	sounds = default_sounds("node_sound_leaves_defaults"),
})

if depends.default then
	core.register_craft({
		type = "shapeless",
		output = "noel:mistletoe",
		recipe = {"default:beech_leaves", "default:beech_leaves", "noel:red_ribbon"},
	})
end

core.register_node("noel:icicles_wall", {
	description = "Icicles (wall)",
	tiles = {{
		image = "noel_icicles.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 2},
	}},
	inventory_image = "noel_icicles_inv.png",
	wield_image = "noel_icicles_inv.png",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {type = "wallmounted"},
	legacy_wallmounted = true,
	drawtype = "signlike",
	paramtype = "light",
	light_source = 3,
	paramtype2 = "wallmounted",
	groups = {snappy = 3},
	sounds = default_sounds("node_sound_glass_defaults"),
})

core.register_node("noel:icicles_hanging", {
	description = "Icicles (hanging)",
	tiles = {{
		image = "noel_icicles.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 2},
	}},
	inventory_image = "noel_icicles_hanging_inv.png",
	wield_image = "noel_icicles_hanging_inv.png",
	drawtype = "plantlike",
	paramtype = "light",
	light_source = 3,
	paramtype2 = "degrotate",
	is_ground_content = false,
	walkable = false,
	on_punch = function(pos, node, user)
		local wielded = user:get_wielded_item()

		if wielded:get_name() == "noel:icicles_hanging" then
	node.param2 = math.random(0,179)
	core.swap_node(pos, node)
		end
	end,
	selection_box = {
		type = "fixed",
		fixed = {-.3, .2, -.3, .3, .5, .3},
	},
	groups = {snappy = 3},
	sounds = default_sounds("node_sound_glass_defaults"),
})

if depends.default then
	core.register_craft({
		output = "noel:icicles_hanging 4",
		recipe = {
			{"default:ice", "", "default:ice"},
			{"default:ice", "", "default:ice"}
		}
	})
end

core.register_craft({
	output = "noel:icicles_wall",
	recipe = {{"noel:icicles_hanging"}}
})

core.register_craft({
	output = "noel:icicles_hanging",
	recipe = {{"noel:icicles_wall"}}
})

if core.get_modpath("decor") then
	core.register_node("noel:shrubbery_large", {
		description = "Noel Shrubbery (large)",
		drawtype = "mesh",
		mesh = "homedecor_cube.obj",
		tiles = {{
			image = "noel_shrubbery.png",
			backface_culling = false,
			animation = {type = "vertical_frames", aspect_w = 8, aspect_h = 8, length = 3},
		}},
		paramtype = "light",
		use_texture_alpha = "clip",
		light_source = 8,
		is_ground_content = false,
		groups = {snappy = 3},
		sounds = default_sounds("node_sound_leaves_defaults"),
	})

	core.register_node("noel:shrubbery", {
		description = "Noel Shrubbery",
		drawtype = "mesh",
		mesh = "homedecor_shrubbery.obj",
		tiles = {{
			image = "noel_shrubbery.png",
			backface_culling = false,
			animation = {type = "vertical_frames", aspect_w = 8, aspect_h = 8, length = 3},
			},
			"homedecor_shrubbery_green_bottom.png",
			"homedecor_shrubbery_roots.png"},
		paramtype = "light",
		use_texture_alpha = "clip",
		light_source = 8,
		is_ground_content = false,
		groups = {snappy = 3},
		sounds = default_sounds("node_sound_leaves_defaults"),
	})

	core.register_craft({
		type = "shapeless",
		output = "noel:shrubbery",
		recipe = {"decor:shrubbery_green", "noel:lights_multicolor"},
	})

	core.register_craft({
		type = "shapeless",
		output = "noel:shrubbery_large",
		recipe = {"decor:shrubbery_large_green", "noel:lights_multicolor"},
	})

	core.register_craft({
		output = "noel:shrubbery",
		recipe = {{"noel:shrubbery_large"}}
	})

	core.register_craft({
		output = "noel:shrubbery_large",
		recipe = {{"noel:shrubbery"}}
	})
end

core.register_node("noel:nutcracker", {
	description = "Nutcracker",
	drawtype = "mesh",
	mesh = "noel_nutcracker.obj",
	tiles = {"noel_nutcracker.png"},
	inventory_image = "noel_nutcracker_inv.png",
	paramtype = "light",
	use_texture_alpha = "clip",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .4, .2},
	},
	collision_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .4, .2},
	},
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {snappy = 3},
	sounds = default_sounds("node_sound_wood_defaults"),
})

if depends.dye and depends.default then
	core.register_craft({
		output = "noel:nutcracker",
		recipe = {
			{"dye:yellow", "dye:black", "dye:yellow"},
			{"dye:red", "default:wood", "dye:red"},
			{"dye:blue", "dye:black", "dye:blue"}
		}
	})
end

core.register_node("noel:snowman", {
	description = "Snowman",
	drawtype = "mesh",
	mesh = "noel_snowman.obj",
	tiles = {"noel_snowman.png"},
	use_texture_alpha = "opaque",
	inventory_image = "noel_snowman_inv.png",
	selection_box = {
		type = "fixed",
		fixed = {-.4, -.5, -.4, .4, .97, .4},
	},
	collision_box = {
		type = "fixed",
		fixed = {-.4, -.5, -.4, .4, .97, .4},
	},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	paramtype2 = "facedir",
	groups = {crumbly = 3},
	sounds = default_sounds("node_sound_snow_defaults"),
})

if depends.default then
	core.register_craft({
		output = "noel:snowman",
		recipe = {
			{"farming:carrot", "default:snow_block", "default:coal_lump"},
			{"default:coal_lump", "default:snow_block", ""}
		},
		replacements = {{"farming:carrot", "farming:carrot_leaves"}}
	})
end

local treebox = {
	type = "fixed",
	fixed = {-.6, -.5, -.6, .6, 2.5, .6}
}

local wreathbox = {
	type = "fixed",
	fixed = {-.5, -.5, .33, .5, .5, .5}
}

local outdoortreebox = {
	type = "fixed",
	fixed = {-1, -.5, -1, 1, 4.5, 1}
}

core.register_node("noel:indoortree", {
	description = "Indoor decorated Noel Tree",
	drawtype = "mesh",
	paramtype = "light",
	use_texture_alpha = "clip",
	light_source = 12,
	paramtype2 = "facedir",
	mesh = "indoor-noel-tree.obj",
	tiles = { "indoor-tree_UV256.png" },
	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = treebox,
	collision_box = treebox,
})

core.register_node("noel:outdoortree", {
	description = "Outdoor decorated Noel Tree",
	drawtype = "mesh",
	paramtype = "light",
	use_texture_alpha = "clip",
	light_source = 12,
	paramtype2 = "facedir",
	mesh = "outdoor-noel-tree.obj",
	tiles = { "noeltree_outdoor256.png" },
	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = outdoortreebox,
	collision_box = outdoortreebox,
})

core.register_node("noel:outdoortree_snow", {
	description = "Outdoor decorated Noel Tree with snow",
	drawtype = "mesh",
	paramtype = "light",
	use_texture_alpha = "clip",
	light_source = 12,
	paramtype2 = "facedir",
	mesh = "outdoor-noel-tree.obj",
	tiles = { "noeltree_outdoor_snow256.png" },
	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = outdoortreebox,
	collision_box = outdoortreebox,
})

core.register_node("noel:wreath_3d", {
	description = "3D Noel Wreath",
	drawtype = "mesh",
	paramtype = "light",
	use_texture_alpha = "clip",
	light_source = 12,
	paramtype2 = "facedir",
	mesh = "noel-wreath.obj",
	tiles = { "wreath_UV256.png" },
	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = wreathbox,
	collision_box = wreathbox,
})

core.register_craft({
    output = "noel:indoortree",
    recipe = {
        {"","default:gold_ingot",""},
        {"","default:pine_sapling",""},
        {"default:pine_sapling","default:pine_sapling","default:pine_sapling"}
    }
})

core.register_craft({
    output = "noel:outdoortree",
    recipe = {
        {"","default:gold_ingot",""},
        {"default:pine_sapling","default:pine_sapling","default:pine_sapling"},
        {"default:pine_sapling","default:pine_sapling","default:pine_sapling"}
    }
})

core.register_craft({
    output = "noel:outdoortree_snow",
    recipe = {
        {"default:snow","default:gold_ingot","default:snow"},
        {"default:pine_sapling","default:pine_sapling","default:pine_sapling"},
        {"default:pine_sapling","default:pine_sapling","default:pine_sapling"}
    }
})

core.register_craft({
    output = "noel:wreath_3d",
    recipe = {
        {"","default:pine_sapling",""},
        {"default:pine_sapling","noel:red_ribbon","default:pine_sapling"},
        {"","default:pine_sapling",""}
    }
})

core.register_craft({
    output = "noel:indoortree",
    recipe = {
        {"","default:gold_ingot",""},
        {"","fir:sapling",""},
        {"fir:sapling","fir:sapling","fir:sapling"}
    }
})

core.register_craft({
    output = "noel:outdoortree",
    recipe = {
        {"","default:gold_ingot",""},
        {"fir:sapling","fir:sapling","fir:sapling"},
        {"fir:sapling","fir:sapling","fir:sapling"}
    }
})

core.register_craft({
    output = "noel:outdoortree_snow",
    recipe = {
        {"default:snow","default:gold_ingot","default:snow"},
        {"fir:sapling","fir:sapling","fir:sapling"},
        {"fir:sapling","fir:sapling","fir:sapling"}
    }
})

core.register_craft({
    output = "noel:wreath_3d",
    recipe = {
        {"","fir:sapling",""},
        {"fir:sapling","noel:red_ribbon","fir:sapling"},
        {"","fir:sapling",""}
    }
})

local nodedef = {-- LazyJ's Noel tree ornament
	description = "Star",
	drawtype = "plantlike",
	tiles = {"snow_star.png"},
	inventory_image = "snow_star.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .5, .3},
	},
	groups = {cracky=1, crumbly=1, choppy=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults({dig = {name="default_glass_footstep", gain= .2}}),
	on_punch = function(pos, node)
		node.name = "noel:star_on"
		core.swap_node(pos, node)
	end,
}

core.register_node("noel:star_off", table.copy(nodedef))

core.register_craft({
    output = "noel:star_off",
    recipe = {
        {"default:mese_crystal_fragment", "vessels:glass_fragments", "default:mese_crystal_fragment"},
        {"vessels:glass_fragments", "default:mese_crystal_fragment", "vessels:glass_fragments"},
        {"default:mese_crystal_fragment", "default:copper_ingot", "default:mese_crystal_fragment"}
    }
})

nodedef.description = nodedef.description.." Lit"
nodedef.light_source = LIGHT_MAX
nodedef.tiles = {"snow_star_lit.png"}
nodedef.drop = "noel:star_off"
nodedef.groups.not_in_creative_inventory = 1
nodedef.on_punch = function(pos, node)
	node.name = "noel:star_off"
	core.swap_node(pos, node)
end

core.register_node("noel:star_on", nodedef)



-- Plants

core.register_node("noel:moss", {
	description = "Moss",
	drawtype = "signlike",
	tiles = {"snow_moss.png"},
	inventory_image = "snow_moss.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	selection_box = {
		type = "wallmounted",
	},
	walkable = false,
	groups = {crumbly=3, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	furnace_burntime = 3,
})

-- Spread moss to cobble.  Not sure
core.register_abm({
	nodenames = {"default:cobble"},
	neighbors = {"noel:moss"},
	interval = 20,
	chance = 6,
	catch_up = false,
	action = function(pos, node)
		node.name = "default:mossycobble"
		core.swap_node(pos, node)
	end,
})

-- Shrubs
nodedef = {
	description = "Snow Shrub",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"snow_shrub.png"},
	inventory_image = "snow_shrub.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -5/16, .3},
	},
	groups = {snappy=3,flammable=3,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	furnace_burntime = 5,
}
core.register_node("noel:shrub", table.copy(nodedef))

nodedef.tiles = {"snow_shrub.png^snow_shrub_covering.png"}
nodedef.inventory_image = "snow_shrub.png^snow_shrub_covering.png"
nodedef.drop = "noel:shrub"
nodedef.furnace_burntime = 3
core.register_node("noel:shrub_covered", nodedef)

core.register_craft({
	type = "shapeless",
	output = "noel:shrub 2",
	recipe = {"default:dry_shrub", "default:dry_shrub", "default:crystal_spike"},
	replacements = {{"default:crystal_spike", "default:crystal_spike"}}
})

core.register_craft({
	type = "shapeless",
	output = "noel:shrub_covered 2",
	recipe = {"noel:shrub", "noel:shrub", "default:snow"}
})

-- Leaves
core.register_node("noel:snow_leaves", {
	description = "Snow Leaves",
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"snow_leaves.png"},
	inventory_image = leaf_image("snow_leaves.png"),
	wield_image = leaf_image("snow_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy= 3, leafdecay= 3, flammable= 1},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_node("noel:frosted_leaves", {
	description = "Frosted Leaves",
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"noel_frosted_leaves.png"},
	inventory_image = leaf_image("noel_frosted_leaves.png"),
	wield_image = leaf_image("noel_frosted_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy= 3, leafdecay= 3, flammable= 1},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_craft({
	type = "shapeless",
	output = "noel:snow_leaves 2",
	recipe = {"default:beech_leaves", "default:beech_leaves", "default:crystal_spike"},
	replacements = {{"default:crystal_spike", "default:crystal_spike"}}
})

core.register_craft({
	type = "shapeless",
	output = "noel:frosted_leaves 2",
	recipe = {"noel:snow_leaves", "noel:snow_leaves", "default:crystal_spike"},
	replacements = {{"default:crystal_spike", "default:crystal_spike"}}
})

core.register_node("noel:snowy_aspen_leaves", {
	description = "Snowy Aspen Leaves",
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"snowy_aspen_leaves.png"},
	inventory_image = leaf_image("snowy_aspen_leaves.png"),
	wield_image = leaf_image("snowy_aspen_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy= 3, leafdecay= 3, flammable= 1},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_craft({
	type = "shapeless",
	output = "noel:snowy_aspen_leaves",
	recipe = {"default:aspen_leaves", "default:crystal_spike", "default:snow"},
	replacements = {{"default:crystal_spike", "default:crystal_spike"}}
})

core.register_node("noel:cold_leaves", {
	description = "Cold Leaves",
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"cold_leaves.png"},
	inventory_image = leaf_image("cold_leaves.png"),
	wield_image = leaf_image("cold_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy= 3, leafdecay= 3, flammable= 1},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_craft({
	output = "noel:cold_leaves",
	recipe = {
		{"default:crystal_spike"},
		{"default:beech_leaves"}
	},
	replacements = {{"default:crystal_spike", "default:crystal_spike"}}
})

core.register_node("noel:snowy_leaves", {
	description = "Snowy Leaves",
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"snowy_leaves.png"},
	inventory_image = leaf_image("snowy_leaves.png"),
	wield_image = leaf_image("snowy_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy= 3, leafdecay= 3, flammable= 1},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_craft({
	output = "noel:snowy_leaves",
	recipe = {
		{"default:snow"},
		{"noel:cold_leaves"}
	}
})

local apple = core.registered_nodes["default:apple"]
nodedef = {
	description = "Snow Apple",
	drawtype = "plantlike",
	tiles = {"snow_apple.png"},
	inventory_image = "snow_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = apple.selection_box,
	groups = {fleshy = 3, dig_immediate = 3, flammable = 1},
	sounds = apple.sounds,
}

core.register_node("noel:snow_apple", nodedef)

core.register_craft({
    output = "noel:snow_apple",
    recipe = {
        {"default:crystal_spike"},
        {"default:apple"}
    },
	replacements = {{"default:crystal_spike", "default:crystal_spike"}}
})

core.register_node("noel:fir_leaves", {
	description = "Fir Leaves",
	drawtype = "mesh",
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"noel_fir_leaves.png"},
	inventory_image = leaf_image("noel_fir_leaves.png"),
	wield_image = leaf_image("noel_fir_leaves.png"),
	paramtype = "light",
	use_texture_alpha = "clip",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

if depends.fir then
	core.register_craft({
		output = "noel:fir_leaves 2",
		recipe = {
			{"fir:needles", "fir:needles"},
			{"fir:needles", "fir:needles"}
		}
	})
end

core.register_node("noel:fir_leaves_lit", {
	description = "Fir Leaves",
	drawtype = "mesh",
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"noel_fir_leaves.png^noel_fir_leaf_lights.png"},
	inventory_image = leaf_image("noel_fir_leaves.png^noel_fir_leaf_lights.png"),
	wield_image = leaf_image("noel_fir_leaves.png^noel_fir_leaf_lights.png"),
	paramtype = "light",
	use_texture_alpha = "clip",
	light_source = 14,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output = "noel:fir_leaves_lit",
	recipe = {
		{"noel:lights_multicolor", "noel:fir_leaves", "noel:lights_multicolor"}
	}
})

core.register_node("noel:ball_1", {
	description = "Giant Noel Ornament Red",
	drawtype = "mesh",
	mesh = "noel_ball.obj",
	tiles = {"fabric_block_red.png"},
	paramtype = "light",
	light_source = 3,
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2},
	sounds = default.node_sound_glass_defaults(),
	node_box = {type = "fixed", fixed = {{-1., -1., -1., 1., 1., 1.}}},
	selection_box = {type = "fixed", fixed = {{-1., -1., -1., 1., 1., 1.}}},
})

core.register_craft({
	output = "noel:ball_1 2",
	recipe = {
		{"dye:red", "default:glass", "dye:red"},
		{"default:glass","default:ocealite_crystal_fragment","default:glass"},
		{"default:glass", "default:glass", "default:glass"}
	}
})

core.register_node("noel:ball_2", {
	description = "Giant Noel Ornament Blue",
	drawtype = "mesh",
	mesh = "noel_ball.obj",
	tiles = {"fabric_block_blue.png"},
	paramtype = "light",
	light_source = 3,
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2},
	sounds = default.node_sound_glass_defaults(),
	node_box = {type = "fixed", fixed = {{-1., -1., -1., 1., 1., 1.}}},
	selection_box = {type = "fixed", fixed = {{-1., -1., -1., 1., 1., 1.}}},
})

core.register_craft({
	output = "noel:ball_2 2",
	recipe = {
		{"dye:blue", "default:glass", "dye:blue"},
		{"default:glass","default:ocealite_crystal_fragment","default:glass"},
		{"default:glass", "default:glass", "default:glass"}
	}
})

core.register_node("noel:ball_3", {
	description = "Giant Noel Ornament Silver",
	drawtype = "mesh",
	mesh = "noel_ball.obj",
	tiles = {"fabric_block_grey.png"},
	paramtype = "light",
	light_source = 3,
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2},
	sounds = default.node_sound_glass_defaults(),
	node_box = {type = "fixed", fixed = {{-1., -1., -1., 1., 1., 1.}}},
	selection_box = {type = "fixed", fixed = {{-1., -1., -1., 1., 1., 1.}}},
})

core.register_craft({
	output = "noel:ball_3 2",
	recipe = {
		{"dye:grey", "default:glass", "dye:grey"},
		{"default:glass","default:ocealite_crystal_fragment","default:glass"},
		{"default:glass", "default:glass", "default:glass"}
	}
})

core.register_node("noel:ball_4", {
	description = "Giant Noel Ornament Purple",
	drawtype = "mesh",
	mesh = "noel_ball.obj",
	tiles = {"fabric_block_violet.png"},
	paramtype = "light",
	light_source = 3,
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2},
	sounds = default.node_sound_glass_defaults(),
	node_box = {type = "fixed", fixed = {{-1., -1., -1., 1., 1., 1.}}},
	selection_box = {type = "fixed", fixed = {{-1., -1., -1., 1., 1., 1.}}},
})

core.register_craft({
	output = "noel:ball_4 2",
	recipe = {
		{"dye:violet", "default:glass", "dye:violet"},
		{"default:glass","default:ocealite_crystal_fragment","default:glass"},
		{"default:glass", "default:glass", "default:glass"}
	}
})

core.register_node("noel:giant_star", {
	description = "Giant Star",
	drawtype = "plantlike",
	tiles = {"noel_giant_star.png"},
	paramtype = "light",
	light_source = 14,
	visual_scale = 4,
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2},
	sounds = default.node_sound_metal_defaults(),
})

core.register_craft({
	output = "noel:giant_star 2",
	recipe = {
		{"", "default:gold_ingot", ""},
		{"default:gold_ingot","default:meselamp","default:gold_ingot"},
		{"", "default:gold_block", ""}
	}
})

local clrs = {
	{"black",      "Black",      "000000b0"},
	{"blue",       "Blue",       "015dbbcc"},
	{"brown",      "Brown",      "a78c45cc"},
	{"cyan",       "Cyan",       "01ffd8cc"},
	{"dark_green", "Dark Green", "005b07cc"},
	{"dark_grey",  "Dark Grey",  "303030b0"},
	{"green",      "Green",      "61ff01cc"},
	{"grey",       "Grey",       "5b5b5bb0"},
	{"magenta",    "Magenta",    "ff05bbcc"},
	{"orange",     "Orange",     "ff8401cc"},
	{"pink",       "Pink",       "ff65b5cc"},
	{"red",        "Red",        "ff0000cc"},
	{"violet",     "Violet",     "2000c9cc"},
	{"white",      "White",      "abababc0"},
	{"yellow",     "Yellow",     "e3ff00cc"},
}

for i = 1, #clrs, 1 do

core.register_node("noel:gift_box_".. clrs[i][1], {
	description = clrs[i][2] .." Gift Block - Punch for random gift",
	tiles = {"fabric_block_white.png^[colorize:#".. clrs[i][3]},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {crumbly=2},
	drop = {
		max_items = 2,
		items = {
			{items = {"noel:gift_box_".. clrs[i][1]}, rarity = 80},
			{items = {"default:sword_diamond"}, rarity = 50},
			{items = {"default:sword_mese"}, rarity = 30},
			{items = {"default:sword_bronze"}, rarity = 10},
			{items = {"default:sword_steel"}, rarity = 5},

			{items = {"default:pick_diamond"}, rarity = 50},
			{items = {"default:pick_mese"}, rarity = 30},
			{items = {"default:pick_bronze"}, rarity = 10},
			{items = {"default:pick_steel"}, rarity = 5},

			{items = {"farming:wheat_bread 60"}, rarity = 3},
			{items = {"default:cobble 10"}, rarity = 3},
			{items = {"default:gold_lump 10"}, rarity = 10},
			{items = {"default:iron_lump 10"}, rarity = 5},
			{items = {"default:apple 30"}, rarity = 5},
			{items = {"default:coal_lump 10"}},
		}
	},
	after_place_node = function(pos, placer)
		local meta = core.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "Noel Present (placed by " ..
			meta:get_string("owner") .. ")")
			meta:set_string("formspec", "field[text;;${text}]")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		--print("Sign at "..core.pos_to_string(pos).." got "..dump(fields))
		local pname = sender:get_player_name()
		if core.is_protected(pos, pname) then
			core.record_protection_violation(pos, pname)
			return
		end
		local meta = core.get_meta(pos)
		if not fields.text then return end
		core.log("action", (pname or "") .. " wrote \"" ..
			fields.text .. "\" to present at " .. core.pos_to_string(pos))
		meta:set_string("text", fields.text)
		meta:set_string("infotext", '"' .. fields.text .. '"')  --would like to keep the info from placer
	end,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=.4},
	}),
})

core.register_craft({
	output = "noel:gift_box_".. clrs[i][1] .." 1",
	recipe = {
		{"default:paper", "group:fabric", "default:paper"},
		{"default:paper", "default:diamond", "default:paper"},
		{"dye:".. clrs[i][1], "group:fabric", "dye:".. clrs[i][1]}
	}
})
end