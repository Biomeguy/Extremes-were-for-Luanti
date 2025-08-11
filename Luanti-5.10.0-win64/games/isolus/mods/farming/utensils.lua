
local S = core.get_translator("farming")

-- saucepan

core.register_craftitem("farming:saucepan", {
	description = S("Saucepan"),
	inventory_image = "farming_saucepan.png",
	groups = {saucepan = 1},
})

core.register_craft({
	output = "farming:saucepan",
	recipe = {
		{"group:stick", ""},
		{"", "default:steel_ingot"},
	}
})

-- cooking pot

core.register_craftitem("farming:pot", {
	description = S("Cooking Pot"),
	inventory_image = "farming_pot.png",
	groups = {pot = 1},
})

core.register_craft({
	output = "farming:pot",
	recipe = {
		{"group:stick", "default:steel_ingot", "default:steel_ingot"},
		{"", "default:steel_ingot", "default:steel_ingot"},
	}
})

-- baking tray

core.register_craftitem("farming:baking_tray", {
	description = S("Baking Tray"),
	inventory_image = "farming_baking_tray.png",
	groups = {baking_tray = 1},
})

core.register_craft({
	output = "farming:baking_tray",
	recipe = {
		{"default:steel_ingot", "default:tin_ingot", "default:steel_ingot"},
	}
})

-- skillet

core.register_craftitem("farming:skillet", {
	description = S("Skillet"),
	inventory_image = "farming_skillet.png",
	groups = {skillet = 1},
})

core.register_craft({
	output = "farming:skillet",
	recipe = {
		{"", "group:stick"},
		{"default:steel_ingot", ""},
	}
})

-- mortar and pestle

core.register_node("farming:mortar_pestle", {
	description = S("Mortar and Pestle"),
	drawtype = "nodebox",
	tiles = {"default_stone.png"},
	inventory_image = "farming_mortar_pestle.png",
	wield_image = "farming_mortar_pestle.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = "fixed",
		fixed = {
			{-3/16, -.5, -3/16, 3/16, -7/16, 3/16},
			{-3/16, -.5, -3/16, -2/16, -3/16, 3/16},
			{-3/16, -.5, -3/16, 3/16, -3/16, -2/16},
			{2/16, -.5, -3/16, 3/16, -3/16, 3/16},
			{-3/16, -.5, 2/16, 3/16, -3/16, 3/16},
			{-2/16, -.5, -4/16, 5/16, -6/16, -6/16},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.4, .35, -.15, .2}
	},
	groups = {dig_immediate = 3, attached_node = 1, grinder = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = "farming:mortar_pestle",
	recipe = {
		{"default:stone", "group:rock", "default:stone"},
		{"", "default:stone", ""},
	}
})

-- cutting board

core.register_craftitem("farming:cutting_board", {
	description = S("Cutting Board"),
	inventory_image = "farming_cutting_board.png",
})

core.register_craft({
	output = "farming:cutting_board",
	recipe = {
		{"group:stick", "", ""},
		{"", "default:steel_ingot", ""},
		{"", "", "group:wood"},
	}
})
