
local S = homedecor_i18n.gettext

local function N_(x) return x end

local bl1_sbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.25, 1.5, 0.5, 0.5 }
}

local bl1_cbox = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.25, 1.5, 0, 0.5 },
		{-0.5, -0.5, 0.45, 1.5, 0.5, 0.5 },
	}
}

homedecor.register("bench_large_1", {
	mesh = "homedecor_bench_large_1.obj",
	tiles = {
		"homedecor_generic_wood_old.png",
		"homedecor_generic_metal_wrought_iron.png"
	},
	description = S("Garden Bench (style 1)"),
	inventory_image = "homedecor_bench_large_1_inv.png",
	groups = { snappy = 3 },
	expand = { right="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	selection_box = bl1_sbox,
	node_box = bl1_cbox,
	on_rotate = screwdriver.disallow
})

local bl2_sbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.25, 1.5, 0.5, 0.5 }
}

local bl2_cbox = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.25, 1.5, 0, 0.5 },
		{-0.5, -0.5, 0.45, 1.5, 0.5, 0.5 },
	}
}

homedecor.register("bench_large_2", {
	description = S("Garden Bench (style 2)"),
	mesh = "homedecor_bench_large_2.obj",
	tiles = { "homedecor_generic_wood_old.png" },
	inventory_image = "homedecor_bench_large_2_inv.png",
	groups = {snappy=3},
	selection_box = bl2_sbox,
	node_box = bl2_cbox,
	expand = { right="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	on_rotate = screwdriver.disallow
})

local dc_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.5, 0.5, 0, 1 }
}

homedecor.register("deckchair", {
	mesh = "homedecor_deckchair.obj",
	tiles = {"homedecor_deckchair.png"},
	description = S("Deck Chair"),
	groups = { snappy = 3 },
	expand = { forward="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	selection_box = dc_cbox,
	collision_box = dc_cbox,
	on_rotate = screwdriver.disallow
})

homedecor.register("deckchair_striped_blue", {
	mesh = "homedecor_deckchair.obj",
	tiles = {"homedecor_deckchair_striped_blue.png"},
	description = S("Deck Chair (blue striped)"),
	groups = { snappy = 3 },
	expand = { forward="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	selection_box = dc_cbox,
	collision_box = dc_cbox,
	on_rotate = screwdriver.disallow
})

homedecor.register("simple_bench", {
	tiles = {"homedecor_generic_wood_old.png"},
	description = S("Simple Bench"),
	groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
	{-.5, -.15, 0, .5, -.05, .4},
	{-.4, -.5, .1, -.3, -.15, .3},
	{.3, -.5, .1, .4, -.15, .3}
		}
	},
	sounds = default.node_sound_wood_defaults(),
})

homedecor.register("hstonepath", {
	description = S("Garden stone path"),
	tiles = {
		"default_stone.png"
	},
	inventory_image = "homedecor_stonepath_inv.png",
	groups = { snappy=3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.3125, -0.3125, -0.48, 0.4375}, -- NodeBox1
			{-0.25, -0.5, 0.125, 0, -0.48, 0.375}, -- NodeBox2
			{0.125, -0.5, 0.125, 0.4375, -0.48, 0.4375}, -- NodeBox3
			{-0.4375, -0.5, -0.125, -0.25, -0.48, 0.0625}, -- NodeBox4
			{-0.0625, -0.5, -0.25, 0.25, -0.48, 0.0625}, -- NodeBox5
			{0.3125, -0.5, -0.25, 0.4375, -0.48, -0.125}, -- NodeBox6
			{-0.3125, -0.5, -0.375, -0.125, -0.48, -0.1875}, -- NodeBox7
			{0.125, -0.5, -0.4375, 0.25, -0.48, -0.3125}, -- NodeBox8
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.4375, -0.5, -0.4375, 0.4375, -0.4, 0.4375 }
	},
	sounds = default.node_sound_stone_defaults(),
})

local lattice_colors = {
	{ "wood", S("wood"), ".png^[colorize:#704214:180" },
	{ "white_wood", S("white wood"), ".png" },
	{ "wood_vegetal", S("wood, with vegetation"),
		".png^[colorize:#704214:180^homedecor_lattice_vegetal.png" },
	{ "white_wood_vegetal", S("white wood, with vegetation"),
		".png^homedecor_lattice_vegetal.png" },
}

for _, c in ipairs(lattice_colors) do
local name, desc, texture = unpack(c)
homedecor.register("lattice_"..name, {
	description = S("Garden Lattice (@1)", desc),
	tiles = {"homedecor_lattice"..texture},
	inventory_image = "homedecor_lattice"..texture,
	use_texture_alpha = "clip",
	groups = { snappy=3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.47, 0.5, 0.5, 0.47}, -- NodeBox1
			{-0.5, 0.421875, 0.44, 0.5, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, 0.44, 0.5, -0.421875, 0.5}, -- NodeBox3
			{0.421875, -0.5, 0.44, 0.5, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, 0.44, -0.421875, 0.5, 0.5} -- NodeBox5
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.44, 0.5, 0.5, 0.5}
	},
	sounds = default.node_sound_wood_defaults(),
})
end

homedecor.register("well", {
	mesh = "homedecor_well.obj",
	tiles = {
		"homedecor_rope_texture.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
		"default_water.png",
		"default_cobble.png",
		"default_wood.png",
		"homedecor_shingles_wood.png"
	},
	use_texture_alpha = "blend",
	inventory_image = "homedecor_well_inv.png",
	description = S("Water well"),
	on_punch = function(pos, node, user)
		local item = user:get_wielded_item():get_name()
		local item_count = user:get_wielded_item():get_count()
		local give_back = ""
		local type_name = ""

		if item == "bucket:bucket_empty" then
			give_back = "bucket:bucket_fresh_water"
		elseif item == "bucket:clay_bucket_empty" then
			give_back = "bucket:clay_bucket_fresh_water"
			type_name = "clay_"
		elseif item == "bucket:wooden_bucket_empty" then
			give_back = "bucket:wooden_bucket_fresh_water"
			type_name = "wooden_"
		end

		if give_back ~= "" and item_count > 1 then

			local inv = user:get_inventory()
			if inv:room_for_item("main", {name=give_back}) then
				inv:add_item("main", give_back)
			else
				local pos = user:get_pos()
				pos.y = math.floor(pos.y + 0.5)
				core.add_item(pos, give_back)
			end

			give_back = "bucket:".. type_name .."bucket_empty "..tostring(item_count-1)
		end

		if give_back ~= "" then
			user:set_wielded_item(give_back)
		end
	end,
	groups = { snappy = 3 },
	selection_box = homedecor.nodebox.slab_y(2),
	collision_box = homedecor.nodebox.slab_y(2),
	expand = { top="placeholder" },
	sounds = default.node_sound_stone_defaults(),
	on_rotate = screwdriver.rotate_simple
})

homedecor.shrub_colors = {
	N_("green"),
	N_("red"),
	N_("yellow"),
}

local shrub_cbox = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }

for _, color in ipairs(homedecor.shrub_colors) do
	core.register_node("decor:shrubbery_large_"..color, {
		description = S("Shrubbery (large, @1)", S(color)),
		drawtype = "mesh",
		mesh = "homedecor_cube.obj",
		tiles = {"homedecor_shrubbery_"..color..".png"},
		paramtype = "light",
		use_texture_alpha = "clip",
		is_ground_content = false,
		groups = {snappy=3, flammable=2},
		sounds = default.node_sound_leaves_defaults(),
	})

	core.register_node("decor:shrubbery_"..color, {
		description = S("Shrubbery (@1)", S(color)),
		drawtype = "mesh",
		mesh = "homedecor_shrubbery.obj",
		tiles = {
			"homedecor_shrubbery_"..color..".png",
			"homedecor_shrubbery_"..color.."_bottom.png",
			"homedecor_shrubbery_roots.png"
		},
		paramtype = "light",
		use_texture_alpha = "clip",
		is_ground_content = false,
		groups = {snappy=3, flammable=2},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = shrub_cbox,
		collision_box = shrub_cbox,
	})
end

core.register_node("decor:hcobweb", {
	description = S("Cobweb"),
	drawtype = "plantlike",
	tiles = {"homedecor_cobweb.png"},
	inventory_image = "homedecor_cobweb.png",
	paramtype = "light",
	sunlight_propagates = true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "decor:hcobweb",
	liquid_alternative_source = "decor:hcobweb",
	liquid_renewable = false,
	liquid_range = 0,
	walkable = false,
	groups = {snappy = 3, flammable = 3}
})
