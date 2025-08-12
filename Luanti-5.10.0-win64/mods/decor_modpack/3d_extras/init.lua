
core.override_item("default:bookshelf", {
	drawtype = "mesh",
	mesh = "3dbookshelf.obj",
	tiles = {"default_wood.png",
		"default_wood.png^3dbookshelf_inside_back.png",
		"3dbookshelf_books.png"},
	paramtype = "light",
})

core.override_item("flowers:mushroom_brown", {
	drawtype = "mesh",
	mesh = "3dmushrooms.obj",
	tiles = {"3dmushrooms_brown.png"},
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	inventory_image = "3dmushrooms_brown_inv.png"
})

core.override_item("flowers:mushroom_red", {
	drawtype = "mesh",
	mesh = "3dmushrooms.obj",
	tiles = {"3dmushrooms_red.png"},
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	inventory_image = "3dmushrooms_red_inv.png"
})

if core.get_modpath("vessels")
 and core.registered_nodes["vessels:drinking_glass"]
 and core.registered_nodes["vessels:steel_bottle"] then

	local sbox = {
		type = "fixed",
		fixed = {-.15, -.5, -.15, .15, -.1, .15}
	}

	core.override_item("vessels:drinking_glass", {
		drawtype = "mesh",
		mesh = "3dvessels_drink.obj",
		tiles = {"3dvessels_shelf_glass.png"},
		inventory_image = "3dvessels_drinking_glass_inv.png",
		wield_image = "3dvessels_drinking_glass_inv.png",
		use_texture_alpha = "blend",
		selection_box = sbox
	})

	core.override_item("vessels:steel_bottle", {
		drawtype = "mesh",
		mesh = "3dvessels_bottle_steel.obj",
		tiles = {"bottle_metal_bright.png"},
		inventory_image = "3dvessels_steel_bottle_inv.png",
		wield_image = "3dvessels_steel_bottle_inv.png",
		selection_box = sbox
	})
end

if core.get_modpath("moreblocks") then
core.override_item("moreblocks:empty_bookshelf", {
	drawtype = "nodebox",
	tiles = {"default_wood.png^[transformR180", "default_wood.png",
		"default_wood.png^[transformR90", "default_wood.png^[transformR270",
		"default_wood.png^3dbookshelf_inside_back.png",
		"default_wood.png^3dbookshelf_inside_back.png"},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.1875, .5, .5, .1875},
			{-.5, -.5, -.5, -.4375, .5, .5},
			{.4375, -.5, -.5, .5, .5, .5},
			{-.5, .4375, -.5, .5, .5, .5},
			{-.5, -.5, -.5, .5, -.4375, .5},
			{-.5, -.0625, -.5, .5, .0625, .5},
		}
	}
})
end
