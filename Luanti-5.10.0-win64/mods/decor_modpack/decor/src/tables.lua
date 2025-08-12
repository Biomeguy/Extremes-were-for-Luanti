
local S = homedecor_i18n.gettext

-- Various kinds of tables

local materials = {
	{ "glass",
		S("Small square glass table"),
		S("Small round glass table"),
		S("Large glass table piece"),
	},
	{ "wood",
		S("Small square wooden table"),
		S("Small round wooden table"),
		S("Large wooden table piece"),
	}
}

local tables_cbox = {
	type = "fixed",
	fixed = { -.5, -.5, -.5, .5, -.4375, .5 },
}

for i, mat in ipairs(materials) do
	local m, small_s, small_r, large = unpack(mat)
	local s

	if m == "glass" then
		s = default.node_sound_glass_defaults()
	else
		s = default.node_sound_wood_defaults()
	end

-- small square tables

	homedecor.register(m.."_table_small_square", {
		description = small_s,
		mesh = "homedecor_table_small_square.obj",
		tiles = { 'homedecor_'..m..'_table_small_square.png' },
		wield_image = 'homedecor_'..m..'_table_small_square_inv.png',
		inventory_image = 'homedecor_'..m..'_table_small_square_inv.png',
		use_texture_alpha = "clip",
		groups = { snappy = 3 },
		sounds = s,
		selection_box = tables_cbox,
		collision_box = tables_cbox,
		on_place = core.rotate_node
	})

-- small round tables

	homedecor.register(m..'_table_small_round', {
		description = small_r,
		mesh = "homedecor_table_small_round.obj",
		tiles = { "homedecor_"..m.."_table_small_round.png" },
		wield_image = 'homedecor_'..m..'_table_small_round_inv.png',
		inventory_image = 'homedecor_'..m..'_table_small_round_inv.png',
		use_texture_alpha = "clip",
		groups = { snappy = 3 },
		sounds = s,
		selection_box = tables_cbox,
		collision_box = tables_cbox,
		on_place = core.rotate_node
	})

-- Large square table pieces

	homedecor.register(m..'_table_large', {
		description = large,
		tiles = {
			'homedecor_'..m..'_table_large_tb.png',
			'homedecor_'..m..'_table_large_tb.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png'
		},
		wield_image = 'homedecor_'..m..'_table_large_inv.png',
		inventory_image = 'homedecor_'..m..'_table_large_inv.png',
		use_texture_alpha = "clip",
		groups = { snappy = 3 },
		sounds = s,
		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, -0.4375, 0.5 },
		},
		selection_box = tables_cbox,
		on_place = core.rotate_node
	})
end

-- other tables

homedecor.register("utility_table_top", {
	description = S("Utility Table"),
	tiles = {
		'homedecor_utility_table_tb.png',
		'homedecor_utility_table_tb.png',
		'homedecor_utility_table_edges.png',
		'homedecor_utility_table_edges.png',
		'homedecor_utility_table_edges.png',
		'homedecor_utility_table_edges.png'
	},
	wield_image = 'homedecor_utility_table_tb.png',
	inventory_image = 'homedecor_utility_table_tb.png',
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "wallmounted",
	node_box = {
		type = "wallmounted",
		wall_bottom = { -0.5, -0.5,    -0.5,  0.5,   -0.4375, 0.5 },
		wall_top =    { -0.5,  0.4375, -0.5,  0.5,    0.5,    0.5 },
		wall_side =   { -0.5, -0.5,    -0.5, -0.4375, 0.5,    0.5 },
	},
	selection_box = {
		type = "wallmounted",
		wall_bottom = { -0.5, -0.5,    -0.5,  0.5,   -0.4375, 0.5 },
		wall_top =    { -0.5,  0.4375, -0.5,  0.5,    0.5,    0.5 },
		wall_side =   { -0.5, -0.5,    -0.5, -0.4375, 0.5,    0.5 },
	},
})

-- Various kinds of table legs

-- local above
materials = {
	{ "brass",          S("brass") },
	{ "wrought_iron",   S("wrought iron") },
}

for _, t in ipairs(materials) do
local name, desc = unpack(t)
homedecor.register("table_legs_"..name, {
	description = S("Table Legs (@1)", desc),
	drawtype = "plantlike",
	tiles = {"homedecor_table_legs_"..name..".png"},
	inventory_image = "homedecor_table_legs_"..name..".png",
	wield_image = "homedecor_table_legs_"..name..".png",
	walkable = false,
	groups = {snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.37, -0.5, -0.37, 0.37, 0.5, 0.37 }
	},
})
end

homedecor.register("utility_table_legs", {
	description = S("Legs for Utility Table"),
	drawtype = "plantlike",
	tiles = { 'homedecor_utility_table_legs.png' },
	inventory_image = 'homedecor_utility_table_legs_inv.png',
	wield_image = 'homedecor_utility_table_legs.png',
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.37, -0.5, -0.37, 0.37, 0.5, 0.37 }
	},
})
