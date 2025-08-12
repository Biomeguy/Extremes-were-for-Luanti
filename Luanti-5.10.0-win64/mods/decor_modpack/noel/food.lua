local depends, default_sounds =  ...

core.register_node("noel:candycane", {
	description = "Candycane",
	drawtype = "mesh",
	mesh = "noel_candycane.obj",
	tiles = {"noel_candycane.png"},
	inventory_image = "noel_candycane_inv.png",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {.1, -.5, -.1, .3, .4, .1}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.05, .2, .4, .05}
	},
	paramtype = "light",
	sunlight_propagates = true,
	paramtype2 = "facedir",
	groups = {snappy = 3},
	sounds = default_sounds("node_sound_stone_defaults"),
	on_use = core.item_eat(4),
})

core.register_craftitem("noel:gingerbread_cookie", {
	description = "Gingerbread Cookie",
	inventory_image = "noel_gingerbread_cookie.png",
	on_use = core.item_eat(6),
})

core.register_craftitem("noel:gingerbread_cookie_raw", {
	description = "Gingerbread Cookie (raw)",
	inventory_image = "noel_gingerbread_cookie_raw.png",
})

core.register_craftitem("noel:gingerbread_dough", {
	description = "Gingerbread Dough",
	inventory_image = "noel_gingerbread_dough.png",
})

core.register_craftitem("noel:cookiecutter", {
	description = "Cookiecutter",
	inventory_image = "noel_cookie_cutter.png",
})

core.register_node("noel:plate_with_cookies", {
	description = "Plate of Cookies",
	drawtype = "plantlike",
	tiles = {"noel_plate_top.png"},
	inventory_image = "noel_plate_top.png",
	wield_image = "noel_plate_top.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	on_use = core.item_eat(18, "vessels:ceramic_plate"),
	selection_box = {
		type = "fixed",
		fixed = {-.28, -.5, -.28, .28, -.15, .28}
	},
	groups = {dig_immediate = 3, attached_node = 1},
	sounds = default_sounds("node_sound_glass_defaults"),
})

core.register_node("noel:milk_glass", {
	description = "Glass of Milk",
	drawtype = "plantlike",
	tiles = {"noel_milk_glass.png"},
	inventory_image = "noel_milk_glass_inv.png",
	wield_image = "noel_milk_glass.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	stack_max = 1,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .3, .25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default_sounds("node_sound_glass_defaults"),
	on_use = core.item_eat(4, depends.vessels and "vessels:drinking_glass"),
})

if depends.vessels then
	core.register_craft({
		type = "shapeless",
		output = "noel:plate_with_cookies",
		recipe = {
			"noel:gingerbread_cookie", "noel:gingerbread_cookie",
			"noel:gingerbread_cookie", "vessels:ceramic_plate",
		}
	})
end

if depends.vessels and depends.mobs_animal and depends.bucket then
	core.register_craft({
		type = "shapeless",
		output = "noel:milk_glass",
		recipe = {"vessels:drinking_glass", "mobs:bucket_milk"},
		replacements = {{"mobs:bucket_milk", "bucket:bucket_empty"}}
	})
end

if depends.basic_materials then
	core.register_craft({
		output = "noel:cookiecutter",
		recipe = {
			{"", "basic_materials:steel_strip", ""},
			{"basic_materials:steel_strip", "", "basic_materials:steel_strip"},
			{"", "basic_materials:steel_strip", ""}
		}
	})
end

if depends.bucket and depends.farming then
	core.register_craft({
		type = "shapeless",
		output = "noel:gingerbread_dough",
		recipe = {"farming:wheat_flour", "group:sugar", "farming:ginger",
	"farming:cutting_board", "farming:cinnamon", "farming:mortar_pestle", "bucket:bucket_water"},
	replacements = {
		{"farming:cutting_board", "farming:cutting_board"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
	})
end

core.register_craft({
	type = "shapeless",
	output = "noel:gingerbread_cookie_raw 5",
	recipe = {"noel:cookiecutter", "noel:gingerbread_dough"},
	replacements = {{"noel:cookiecutter", "noel:cookiecutter"}},
})

core.register_craft({
	type = "cooking",
	output = "noel:gingerbread_cookie",
	recipe = "noel:gingerbread_cookie_raw",
	cooktime = 10,
})

if depends.farming and depends.dye then
	core.register_craft({
		output = "noel:candycane 2",
		recipe = {
			{"", "group:sugar", "farming:mint_leaf"},
			{"group:sugar", "farming:mint_leaf", "dye:red"},
			{"", "", "group:sugar"}
		}
	})

	core.register_craft({
		output = "noel:candycane 2",
		recipe = {
			{"farming:mint_leaf", "group:sugar", ""},
			{"dye:red", "farming:mint_leaf", "group:sugar"},
			{"group:sugar", "", ""}
		}
	})
end

core.register_node("noel:candycane_block", {
	description = "Candycane Block",
	tiles = {"noel_candycane_block.png", "noel_candycane_block.png",
		"noel_candycane_block.png", "noel_candycane_block.png",
		"noel_candycane_block.png^[transformFX", "noel_candycane_block.png^[transformFX"},
	paramtype2 = "facedir",
	groups = {cracky = 3, oddly_breakable_by_hand = 1},
	sounds = default_sounds("node_sound_stone_defaults"),
})

core.register_node("noel:peppermint_block", {
	description = "Peppermint Block",
	tiles = {"noel_peppermint.png"},
	paramtype2 = "facedir",
	groups = {cracky = 3, oddly_breakable_by_hand = 1},
	sounds = default_sounds("node_sound_stone_defaults"),
})

core.register_node("noel:frosting_block", {
	description = "Frosting Block",
	tiles = {"noel_frosting.png"},
	paramtype2 = "facedir",
	groups = {snappy = 3},
	sounds = default_sounds("node_sound_leaves_defaults"),
})

if depends.farming then
	if depends.dye then
		core.register_craft({
			output = "noel:candycane_block 8",
			recipe = {
				{"group:sugar", "dye:red", "group:sugar"},
				{"dye:red", "farming:mint_leaf", "dye:red"},
				{"group:sugar", "dye:red", "group:sugar"}
			}
		})

		core.register_craft({
			output = "noel:peppermint_block 8",
			recipe = {
				{"dye:red", "group:sugar", "farming:mint_leaf"},
				{"group:sugar", "dye:red", "group:sugar"},
				{"farming:mint_leaf", "group:sugar", "dye:red"}
			}
		})
	end

	if depends.bucket then
		core.register_craft({
			output = "noel:frosting_block 8",
			recipe = {
				{"group:sugar", "group:sugar", "group:sugar"},
				{"group:sugar", "bucket:bucket_water", "group:sugar"},
				{"group:sugar", "group:sugar", "group:sugar"}
			},
			replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
		})
	end
end

if depends.stairs then
	local candycane_def = core.registered_nodes["noel:candycane_block"]
	stairs.register_stair_and_slab("candycane_block", "noel:candycane_block",
		candycane_def.groups, candycane_def.tiles,
		candycane_def.description .. " Stair", candycane_def.description .. " Slab",
		candycane_def.sounds, false
	)

	local peppermint_def = core.registered_nodes["noel:peppermint_block"]
	stairs.register_stair_and_slab("peppermint_block", "noel:peppermint_block",
		peppermint_def.groups, peppermint_def.tiles,
		peppermint_def.description .. " Stair", peppermint_def.description .. " Slab",
		peppermint_def.sounds, false
	)

	local frosting_def = core.registered_nodes["noel:frosting_block"]
	stairs.register_stair_and_slab("frosting_block", "noel:frosting_block",
		frosting_def.groups, frosting_def.tiles,
		frosting_def.description .. " Stair", frosting_def.description .. " Slab",
		frosting_def.sounds, false
	)
end

core.register_node("noel:frosting_trim", {
	description = "Frosting Trim",
	tiles = {"noel_frosting_trim.png"},
	inventory_image = "noel_frosting_trim.png",
	wield_image = "noel_frosting_trim.png",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	legacy_wallmounted = true,
	use_texture_alpha = "clip",
	drawtype = "signlike",
	paramtype = "light",
	paramtype2 = "wallmounted",
	groups = {snappy = 3},
	sounds = default_sounds("node_sound_leaves_defaults"),
})

core.register_node("noel:frosting_line", {
	description = "Frosting Line",
	tiles = {"noel_frosting_line.png"},
	inventory_image = "noel_frosting_line.png",
	wield_image = "noel_frosting_line.png",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	legacy_wallmounted = true,
	use_texture_alpha = "clip",
	drawtype = "signlike",
	paramtype = "light",
	paramtype2 = "wallmounted",
	groups = {snappy = 3},
	sounds = default_sounds("node_sound_leaves_defaults"),
})

core.register_craft({
	output = "noel:frosting_trim 6",
	recipe = {
		{"noel:frosting_block", "noel:frosting_block", "noel:frosting_block"},
		{"", "noel:frosting_block", ""}
	}
})

core.register_craft({
	output = "noel:frosting_line 6",
	recipe = {
		{"noel:frosting_block", "noel:frosting_block", "noel:frosting_block"}
	}
})

for color, hex in pairs({
	red = "#ff0000",
	orange = "#ff9000",
	yellow = "#fcff00",
	green = "#18cb35",
	blue = "#0096FF",
	purple = "#ae4eff",
}) do
	core.register_node("noel:gumdrop_" .. color, {
		description = color:gsub("^%l", string.upper) .. " Gumdrop",
		drawtype = "mesh",
		mesh = "noel_gumdrop.obj",
		tiles = {"noel_gumdrop.png^[colorize:" .. hex .. ":150"},
		walkable = true,
		selection_box = {
			type = "fixed",
			fixed = {-.4, -.5, -.4, .4, .1, .4}
		},
		collision_box = {
			type = "fixed",
			fixed = {-.4, -.5, -.4, .4, .1, .4}
		},
		paramtype = "light",
		sunlight_propagates = true,
		paramtype2 = "facedir",
		groups = {snappy = 3},
		sounds = default_sounds("node_sound_leaves_defaults"),
		on_use = core.item_eat(2),
	})

	if depends.farming and depends.dye then
		core.register_craft({
			output = "noel:gumdrop_" .. color .. " 2",
			recipe = {
				{"", "group:sugar", "farming:maizestarch"},
				{"group:sugar", "dye:" .. color:gsub("purple", "violet"), "group:sugar"},
				{"group:sugar", "group:sugar", "group:sugar"}
			},
			replacements = {{"farming:maizestarch", "vessels:wood_bowl"}}
		})
	end
end
