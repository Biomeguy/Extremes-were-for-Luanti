
local S = homedecor_i18n.gettext

homedecor.register("coat_tree", {
	mesh = "homedecor_coatrack.obj",
	tiles = {
		homedecor.plain_wood,
		"homedecor_generic_wood_old.png"
	},
	inventory_image = "homedecor_coatrack_inv.png",
	description = S("Coat tree"),
	groups = {snappy=3},
	sounds = default.node_sound_wood_defaults(),
	expand = { top="placeholder" },
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = { -0.4, -0.5, -0.4, 0.4, 1.5, 0.4 }
	},
	on_rotate = screwdriver.rotate_simple
})

local mat_colors = {
	{ "green", S("Green welcome mat") },
	{ "brown", S("Brown welcome mat") },
	{ "grey",  S("Grey welcome mat") },
}

for _, mat in ipairs(mat_colors) do
	local color, desc = unpack(mat)
	homedecor.register("welcome_mat_"..color, {
		description = desc,
		tiles = {
			"homedecor_welcome_mat_"..color..".png",
			"homedecor_welcome_mat_bottom.png",
			"homedecor_welcome_mat_"..color..".png",
		},
		groups = {crumbly=3},
		sounds = default.node_sound_dirt_defaults({
			footstep = {name="default_grass_footstep", gain=0.25},
		}),
		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.375, 0.5, -0.46875, 0.375 }
		}
	})
end

local table_colors = {
	{ "",           S("Table"),           homedecor.plain_wood },
	{ "_mahogany",  S("Mahogany Table"),  homedecor.mahogany_wood },
	{ "_white",     S("White Table"),     homedecor.white_wood }
}

for _, t in ipairs(table_colors) do
	local suffix, desc, texture = unpack(t)

homedecor.register("table"..suffix, {
	description = desc,
	tiles = { texture },
	node_box = {
		type = "fixed",
		fixed = {
	{-.5, .375, -.5, .5, .5, .5},
	{-.375, -.5, -.375, -.25, .375, -.25},
	{.25, -.5, -.375, .375, .375, -.25},
	{-.375, -.5, .25, -.25, .375, .375},
	{.25, -.5, .25, .375, .375, .375},
	{-.3125, -.125, -.3125, .3125, -.25, .3125}
		}
	},
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
})
end

local kc_cbox = {
	type = "fixed",
	fixed = {
		{-.3125, -.3125, -.5, .3125, .3125, 0},
		{.1875, -.3125, -.5, .3125, .3125, .49}
	}
}

homedecor.register("kitchen_chair_wood", {
	description = S("Kitchen chair"),
	mesh = "homedecor_kitchen_chair.obj",
	tiles = {
		homedecor.plain_wood,
		homedecor.plain_wood
	},
	inventory_image = "homedecor_chair_wood_inv.png",
	paramtype2 = "wallmounted",
	selection_box = kc_cbox,
	collision_box = kc_cbox,
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
	after_place_node = unifieddyes.fix_rotation_nsew,
	on_rotate = unifieddyes.fix_after_screwdriver_nsew,
	can_dig = player_api.sit_dig_centered,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		player_api.sit_centered(pos, node, clicker, pointd)
		return itemstack
	end
})

homedecor.register("kitchen_chair_padded", {
	description = S("Kitchen chair"),
	mesh = "homedecor_kitchen_chair.obj",
	tiles = {
		homedecor.plain_wood,
		"fabric_block_white.png",
	},
	inventory_image = "homedecor_chair_padded_inv.png",
	paramtype2 = "colorwallmounted",
	palette = "unifieddyes_palette_colorwallmounted.png",
	selection_box = kc_cbox,
	collision_box = kc_cbox,
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2, ud_param2_colorable = 1},
	sounds = default.node_sound_wood_defaults(),
	after_place_node = function(pos, placer, itemstack, pointd)
		unifieddyes.fix_rotation_nsew(pos, placer, itemstack, pointd)
		unifieddyes.recolor_on_place(pos, placer, itemstack, pointd)
	end,
	after_dig_node = unifieddyes.after_dig_node,
	on_rotate = unifieddyes.fix_after_screwdriver_nsew,
	can_dig = player_api.sit_dig_centered,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		player_api.sit_centered(pos, node, clicker, pointd)
		return itemstack
	end
})

local ob_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, 0, 0.5, 0.5, 0.5 }
}

core.register_node(":decor:openframe_bookshelf", {
	description = S("Bookshelf (open-frame)"),
	drawtype = "mesh",
	mesh = "homedecor_openframe_bookshelf.obj",
	tiles = {
		"homedecor_openframe_bookshelf_books.png",
		"default_wood.png"
	},
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = ob_cbox,
	collision_box = ob_cbox,
})

homedecor.register("wall_shelf", {
	description = S("Wall Shelf"),
	tiles = {
		"homedecor_wood_table_large_edges.png",
	},
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.4, 0.47, 0.5, 0.47, 0.5},
			{-0.5, 0.47, -0.1875, 0.5, 0.5, 0.5}
		}
	}
})

homedecor.register("bars", {
	description = S("Bars"),
	tiles = { { name = "homedecor_generic_metal.png^[transformR270", color = homedecor.color_black } },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.50, -0.10, -0.4,  0.50,  0.10 },
			{ -0.1, -0.50, -0.10,  0.1,  0.50,  0.10 },
			{  0.4, -0.50, -0.10,  0.5,  0.50,  0.10 },
			{ -0.5, -0.50, -0.05,  0.5, -0.45,  0.05 },
			{ -0.5,  0.45, -0.05,  0.5,  0.50,  0.05 },
		},
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.1, 0.5, 0.5, 0.1 },
	},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

--L Binding Bars
homedecor.register("L_binding_bars", {
	description = S("Binding Bars"),
	tiles = { { name = "homedecor_generic_metal.png^[transformR270", color = homedecor.color_black } },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.10, -0.50, -0.50,  0.10,  0.50, -0.40 },
			{ -0.15, -0.50, -0.15,  0.15,  0.50,  0.15 },
			{  0.40, -0.50, -0.10,  0.50,  0.50,  0.10 },
			{  0.00, -0.50, -0.05,  0.50, -0.45,  0.05 },
			{ -0.05, -0.50, -0.50,  0.05, -0.45,  0.00 },
			{  0.00,  0.45, -0.05,  0.50,  0.50,  0.05 },
			{ -0.05,  0.45, -0.50,  0.05,  0.50,  0.00 },
		},
	},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

local chain_cbox = {
	type = "fixed",
	fixed = {-1/2, -1/2, 1/4, 1/2, 1/2, 1/2},
}

homedecor.register("chains", {
	description = S("Chains"),
	mesh = "forniture_chains.obj",
	tiles = { { name = "homedecor_generic_metal.png", color = homedecor.color_black } },
	inventory_image="forniture_chains_inv.png",
	selection_box = chain_cbox,
	walkable = false,
	climbable = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

homedecor.register("torch_wall", {
	description = S("Wall Torch"),
	mesh = "forniture_torch.obj",
	tiles = {
		{
			name="forniture_torch_flame.png",
			animation={
				type="vertical_frames",
				aspect_w=40,
				aspect_h=40,
				length=1.0,
			},
		},
		{ name = "homedecor_generic_metal.png", color = homedecor.color_black },
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
		"forniture_coal.png",
	},
	inventory_image="forniture_torch_inv.png",
	use_texture_alpha = "clip",
	walkable = false,
	light_source = 14,
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.45, 0.15, 0.15,0.35, 0.5 },
	},
	groups = {cracky=3},
})

local wl_cbox = {
	type = "fixed",
	fixed = { -0.2, -0.5, 0, 0.2, 0.5, 0.5 },
}

homedecor.register("wall_lamp", {
	description = S("Wall Lamp"),
	mesh = "homedecor_wall_lamp.obj",
	tiles = {
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
		homedecor.lux_wood,
		"homedecor_light.png",
		"homedecor_generic_metal_wrought_iron.png"
	},
	use_texture_alpha = "blend",
	inventory_image = "homedecor_wall_lamp_inv.png",
	groups = {snappy=3},
	light_source = 11,
	selection_box = wl_cbox,
	walkable = false
})

-- Aliases for 3dforniture mod.

core.register_alias("3dforniture:table", "decor:table")
core.register_alias("3dforniture:chair", "decor:chair")

-- conversion to param2 colorization

homedecor.old_static_chairs = {}

local chair_colors = {
	"black",
	"brown",
	"blue",
	"cyan",
	"dark_grey",
	"dark_green",
	"green",
	"grey",
	"magenta",
	"orange",
	"pink",
	"red",
	"violet",
	"white",
	"yellow",
}

for _, color in ipairs(chair_colors) do
	table.insert(homedecor.old_static_chairs, "decor:chair_"..color)
end
table.insert(homedecor.old_static_chairs, "decor:chair")

core.register_lbm({
	name = "decor:convert_chairs",
	label = "Convert homedecor chairs to use param2 color",
	run_at_every_load = false,
	nodenames = homedecor.old_static_chairs,
	action = function(pos, node)
		local name = node.name
		local paletteidx = 0
		local color
		local a,b = string.find(name, "_")

		if a then
			color = string.sub(name, a+1)

			if color == "blue" then
				color = "medium_blue"
			elseif color == "violet" then
				color = "medium_violet"
			elseif color == "red" then
				color = "medium_red"
			elseif color == "black" then
				color = "dark_grey"
			end

			paletteidx = unifieddyes.getpaletteidx("unifieddyes:"..color, "wallmounted")
		end

		local old_fdir = math.floor(node.param2 % 32)
		local new_fdir = 3

		if old_fdir == 0 then
			new_fdir = 3
		elseif old_fdir == 1 then
			new_fdir = 4
		elseif old_fdir == 2 then
			new_fdir = 2
		elseif old_fdir == 3 then
			new_fdir = 5
		end

		local param2 = paletteidx + new_fdir
		local newname = "decor:armchair"

		print(name, dump(a), dump(b), dump(color).."("..dump(paletteidx)..")", dump(param2))

		if node.name == "decor:chair" then
			newname = "decor:kitchen_chair_wood"
		elseif string.find(node.name, "decor:chair_") then
			newname = "decor:kitchen_chair_padded"
		end

		core.set_node(pos, { name = newname, param2 = param2 })
		local meta = core.get_meta(pos)
		if color then
			meta:set_string("dye", "unifieddyes:"..color)
		end
	end
})
