-- This file supplies glowlights

local S = homedecor_i18n.gettext

local glowlight_nodebox = {
	half = homedecor.nodebox.slab_y(1/2),
	quarter = homedecor.nodebox.slab_y(1/4),
	small_cube = {
			type = "fixed",
			fixed = { -0.25, -0.5, -0.25, 0.25, 0, 0.25 }
	},
}

core.register_node("decor:glowlight_half", {
	description = S("Thick Glowlight"),
	tiles = {
		"homedecor_glowlight_top.png",
		"homedecor_glowlight_bottom.png",
		"homedecor_glowlight_thick_sides.png",
		"homedecor_glowlight_thick_sides.png",
		"homedecor_glowlight_thick_sides.png",
		"homedecor_glowlight_thick_sides.png"
	},
	overlay_tiles = {
		{ name = "homedecor_glowlight_top_overlay.png", color = "white"},
		"",
		{ name = "homedecor_glowlight_thick_sides_overlay.png", color = "white"},
		{ name = "homedecor_glowlight_thick_sides_overlay.png", color = "white"},
		{ name = "homedecor_glowlight_thick_sides_overlay.png", color = "white"},
		{ name = "homedecor_glowlight_thick_sides_overlay.png", color = "white"},
	},
	use_texture_alpha = "blend",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "colorwallmounted",
	palette = "unifieddyes_palette_colorwallmounted.png",
	selection_box = {
		type = "wallmounted",
		wall_top =    { -0.5,    0, -0.5, 0.5, 0.5, 0.5 },
		wall_bottom = { -0.5, -0.5, -0.5, 0.5,   0, 0.5 },
		wall_side =   { -0.5, -0.5, -0.5,   0, 0.5, 0.5 }
	},
	node_box = glowlight_nodebox.half,
	groups = { snappy = 3, ud_param2_colorable = 1 },
	light_source = default.LIGHT_MAX,
	sounds = default.node_sound_glass_defaults(),
	after_place_node = function(pos, placer, itemstack, pointd)
		unifieddyes.fix_rotation(pos, placer, itemstack, pointd)
		unifieddyes.recolor_on_place(pos, placer, itemstack, pointd)
	end,
	after_dig_node = unifieddyes.after_dig_node
})

core.register_node("decor:glowlight_quarter", {
	description = S("Thin Glowlight"),
	tiles = {
		"homedecor_glowlight_top.png",
		"homedecor_glowlight_bottom.png",
		"homedecor_glowlight_thin_sides.png",
		"homedecor_glowlight_thin_sides.png",
		"homedecor_glowlight_thin_sides.png",
		"homedecor_glowlight_thin_sides.png"
	},
	overlay_tiles = {
		{ name = "homedecor_glowlight_top_overlay.png", color = "white"},
		"",
		{ name = "homedecor_glowlight_thin_sides_overlay.png", color = "white"},
		{ name = "homedecor_glowlight_thin_sides_overlay.png", color = "white"},
		{ name = "homedecor_glowlight_thin_sides_overlay.png", color = "white"},
		{ name = "homedecor_glowlight_thin_sides_overlay.png", color = "white"},
	},
	use_texture_alpha = "blend",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "colorwallmounted",
	palette = "unifieddyes_palette_colorwallmounted.png",
	selection_box = {
		type = "wallmounted",
		wall_top =    { -0.5, 0.25, -0.5,   0.5,   0.5, 0.5 },
		wall_bottom = { -0.5, -0.5, -0.5,   0.5, -0.25, 0.5 },
		wall_side =   { -0.5, -0.5, -0.5, -0.25,   0.5, 0.5 }
	},
	node_box = glowlight_nodebox.quarter,
	groups = { snappy = 3, ud_param2_colorable = 1 },
	light_source = default.LIGHT_MAX-1,
	sounds = default.node_sound_glass_defaults(),
	after_place_node = function(pos, placer, itemstack, pointd)
		unifieddyes.fix_rotation(pos, placer, itemstack, pointd)
		unifieddyes.recolor_on_place(pos, placer, itemstack, pointd)
	end,
	after_dig_node = unifieddyes.after_dig_node
})

core.register_node("decor:glowlight_small_cube", {
	description = S("Small Glowlight Cube"),
	tiles = {
		"homedecor_glowlight_cube_tb.png",
		"homedecor_glowlight_cube_tb.png",
		"homedecor_glowlight_cube_sides.png",
		"homedecor_glowlight_cube_sides.png",
		"homedecor_glowlight_cube_sides.png",
		"homedecor_glowlight_cube_sides.png"
	},
	overlay_tiles = {
		{ name = "homedecor_glowlight_cube_tb_overlay.png", color = "white"},
		{ name = "homedecor_glowlight_cube_tb_overlay.png", color = "white"},
		{ name = "homedecor_glowlight_cube_sides_overlay.png", color = "white"},
		{ name = "homedecor_glowlight_cube_sides_overlay.png", color = "white"},
		{ name = "homedecor_glowlight_cube_sides_overlay.png", color = "white"},
		{ name = "homedecor_glowlight_cube_sides_overlay.png", color = "white"},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "colorwallmounted",
	drawtype = "nodebox",
	palette = "unifieddyes_palette_colorwallmounted.png",
	selection_box = {
		type = "wallmounted",
		wall_top =    { -0.25,    0,  -0.25, 0.25,  0.5, 0.25 },
		wall_bottom = { -0.25, -0.5,  -0.25, 0.25,    0, 0.25 },
		wall_side =   {  -0.5, -0.25, -0.25,    0, 0.25, 0.25 }
	},
	node_box = glowlight_nodebox.small_cube,
	groups = { snappy = 3, ud_param2_colorable = 1 },
	light_source = default.LIGHT_MAX-1,
	sounds = default.node_sound_glass_defaults(),
	after_place_node = function(pos, placer, itemstack, pointd)
		unifieddyes.fix_rotation(pos, placer, itemstack, pointd)
		unifieddyes.recolor_on_place(pos, placer, itemstack, pointd)
	end,
	after_dig_node = unifieddyes.after_dig_node
})

homedecor.register("plasma_lamp", {
	description = S("Plasma Lamp"),
	drawtype = "mesh",
	mesh = "plasma_lamp.obj",
	tiles = {
		"default_gold_block.png",
		{
			name="homedecor_plasma_storm.png",
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0},
		}
	},
	use_texture_alpha = "blend",
	light_source = default.LIGHT_MAX - 1,
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

homedecor.register("plasma_ball", {
	description = S("Plasma Ball"),
	mesh = "homedecor_plasma_ball.obj",
	tiles = {
		{ name = "homedecor_generic_plastic.png", color = homedecor.color_black },
		{
			name = "homedecor_plasma_ball_streamers.png",
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0},
		},
		"homedecor_plasma_ball_glass.png"
	},
	inventory_image = "homedecor_plasma_ball_inv.png",
	selection_box = {
		type = "fixed",
		fixed = { -0.1875, -0.5, -0.1875, 0.1875, 0, 0.1875 }
	},
	walkable = false,
	use_texture_alpha = "blend",
	light_source = default.LIGHT_MAX - 5,
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

local tc_cbox = {
	type = "fixed",
	fixed = {
		{ -0.1875, -0.5, -0.1875, 0.1875, 0.375, 0.1875 },
	}
}

homedecor.register("candle", {
	description = S("Thick Candle"),
	mesh = "homedecor_candle_thick.obj",
	tiles = {
		'homedecor_candle_sides.png',
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
	},
	inventory_image = "homedecor_candle_inv.png",
	use_texture_alpha = "clip",
	selection_box = tc_cbox,
	walkable = false,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-4,
})

local c_cbox = {
	type = "fixed",
	fixed = {
		{ -0.125, -0.5, -0.125, 0.125, 0.05, 0.125 },
	}
}

homedecor.register("candle_thin", {
	description = S("Thin Candle"),
	mesh = "homedecor_candle_thin.obj",
	tiles = {
		'homedecor_candle_sides.png',
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
	},
	inventory_image = "homedecor_candle_thin_inv.png",
	use_texture_alpha = "clip",
	selection_box = c_cbox,
	walkable = false,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-4,
})

local cs_cbox = {
	type = "fixed",
	fixed = {
		{ -0.15625, -0.5, -0.15625, 0.15625, 0.3125, 0.15625 },
	}
}

homedecor.register("candlestick_wrought_iron", {
	description = S("Candlestick (wrought iron)"),
	mesh = "homedecor_candlestick.obj",
	tiles = {
		"homedecor_candle_sides.png",
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		"homedecor_generic_metal_wrought_iron.png",
	},
	inventory_image = "homedecor_candlestick_wrought_iron_inv.png",
	use_texture_alpha = "clip",
	selection_box = cs_cbox,
	walkable = false,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-4,
})

homedecor.register("candlestick_brass", {
	description = S("Candlestick (brass)"),
	mesh = "homedecor_candlestick.obj",
	tiles = {
		"homedecor_candle_sides.png",
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		"basic_materials_chain_brass.png",
	},
	inventory_image = "homedecor_candlestick_brass_inv.png",
	use_texture_alpha = "clip",
	selection_box = cs_cbox,
	walkable = false,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-4,
})

homedecor.register("wall_sconce", {
	description = S("Wall sconce"),
	mesh = "homedecor_wall_sconce.obj",
	tiles = {
		'homedecor_candle_sides.png',
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		'homedecor_wall_sconce_back.png',
		'homedecor_generic_metal_wrought_iron.png',
	},
	inventory_image = "homedecor_wall_sconce_inv.png",
	use_texture_alpha = "clip",
	selection_box = {
		type = "fixed",
		fixed = { -0.1875, -0.25, 0.3125, 0.1875, 0.25, 0.5 }
	},
	walkable = false,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-4,
})

local gl_cbox = {
	type = "fixed",
	fixed = { -0.25, -0.5, -0.25, 0.25, 0.45, 0.25 },
}

core.register_alias("decor:wall_lantern", "decor:ground_lantern")

homedecor.register("ground_lantern", {
	description = S("Ground Lantern"),
	mesh = "homedecor_ground_lantern.obj",
	tiles = { "homedecor_light.png", "homedecor_generic_metal_wrought_iron.png" },
	use_texture_alpha = "blend",
	inventory_image = "homedecor_ground_lantern_inv.png",
	wield_image = "homedecor_ground_lantern_inv.png",
	groups = {snappy=3},
	light_source = 11,
	selection_box = gl_cbox,
	walkable = false
})

local hl_cbox = {
	type = "fixed",
	fixed = { -0.25, -0.5, -0.2, 0.25, 0.5, 0.5 },
}

homedecor.register("hanging_lantern", {
	description = S("Hanging Lantern"),
	mesh = "homedecor_hanging_lantern.obj",
	tiles = { "homedecor_generic_metal_wrought_iron.png", "homedecor_light.png" },
	use_texture_alpha = "blend",
	inventory_image = "homedecor_hanging_lantern_inv.png",
	wield_image = "homedecor_hanging_lantern_inv.png",
	groups = {snappy=3},
	light_source = 11,
	selection_box = hl_cbox,
	walkable = false
})

local cl_cbox = {
	type = "fixed",
	fixed = { -0.35, -0.45, -0.35, 0.35, 0.5, 0.35 }
}

homedecor.register("ceiling_lantern", {
	drawtype = "mesh",
	mesh = "homedecor_ceiling_lantern.obj",
	tiles = { "homedecor_light.png", "homedecor_generic_metal_wrought_iron.png" },
	use_texture_alpha = "blend",
	inventory_image = "homedecor_ceiling_lantern_inv.png",
	description = S("Ceiling Lantern"),
	groups = {snappy=3},
	light_source = 11,
	selection_box = cl_cbox,
	walkable = false
})

homedecor.register("lattice_lantern_large", {
	description = S("Lattice lantern (large)"),
	tiles = { 'homedecor_lattice_lantern_large.png' },
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX,
	sounds = default.node_sound_glass_defaults(),
})

homedecor.register("lattice_lantern_small", {
	description = S("Lattice lantern (small)"),
	tiles = {
		'homedecor_lattice_lantern_small_tb.png',
		'homedecor_lattice_lantern_small_tb.png',
		'homedecor_lattice_lantern_small_sides.png'
	},
	use_texture_alpha = "clip",
	selection_box = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.25, 0.25, 0, 0.25 }
	},
	node_box = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.25, 0.25, 0, 0.25 }
	},
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-1,
	sounds = default.node_sound_glass_defaults(),
	on_place = core.rotate_node
})

local brightness_tab = {
	0xffd0d0d0,
	0xffd8d8d8,
	0xffe0e0e0,
	0xffe8e8e8,
	0xffffffff,
}

-- table lamps and standing lamps

local repl = {
	["off"] ="low",
	["low"] ="med",
	["med"] ="hi",
	["hi"]  ="max",
	["max"] ="off",
}

local lamp_colors = {
	"white",
	"blue",
	"green",
	"pink",
	"red",
	"violet",
}

local tlamp_cbox = {
	type = "fixed",
	fixed = { -0.25, -0.5, -0.25, 0.25, 0.5, 0.25 }
}

local slamp_cbox = {
	type = "fixed",
	fixed = { -0.25, -0.5, -0.25, 0.25, 1.5, 0.25 }
}

local function reg_lamp(suffix, nxt, light, brightness)

	local wool_brighten = (light or 0) * 15

	homedecor.register("table_lamp_"..suffix, {
		description = S("Table Lamp"),
		mesh = "homedecor_table_lamp.obj",
		tiles = {
			"fabric_block_grey.png^[colorize:#ffffff:"..wool_brighten,
			{ name = "homedecor_table_standing_lamp_lightbulb.png", color = brightness_tab[brightness] },
			{ name = "homedecor_generic_wood_red.png", color = 0xffffffff },
			{ name = "homedecor_generic_metal.png", color = homedecor.color_black },
		},
		inventory_image = "homedecor_table_lamp_foot_inv.png^homedecor_table_lamp_top_inv.png",
		paramtype = "light",
		paramtype2 = "color",
		palette = "unifieddyes_palette_extended.png",
		place_param2 = 240,
		walkable = false,
		light_source = light,
		selection_box = tlamp_cbox,
		sounds = default.node_sound_wood_defaults(),
		groups = {cracky=2,oddly_breakable_by_hand=1, ud_param2_colorable = 1,
			not_in_creative_inventory=((light ~= nil) and 1) or nil,
		},
		drop = "decor:table_lamp_off",
		on_rightclick = function(pos, node, clicker, itemstack, pointd)
			node.name = "decor:table_lamp_"..repl[suffix]
			core.set_node(pos, node)
		end,
		on_construct = unifieddyes.on_construct,
		after_place_node = unifieddyes.recolor_on_place,
		after_dig_node = unifieddyes.after_dig_node
	})

	homedecor.register("standing_lamp_"..suffix, {
		description = S("Standing Lamp"),
		mesh = "homedecor_standing_lamp.obj",
		tiles = {
			"fabric_block_grey.png^[colorize:#ffffff:"..wool_brighten,
			{ name = "homedecor_table_standing_lamp_lightbulb.png", color = brightness_tab[brightness] },
			{ name = "homedecor_generic_wood_red.png", color = 0xffffffff },
			{ name = "homedecor_generic_metal.png", color = homedecor.color_black },
		},
		inventory_image = "homedecor_standing_lamp_foot_inv.png^homedecor_standing_lamp_top_inv.png",
		paramtype = "light",
		paramtype2 = "color",
		palette = "unifieddyes_palette_extended.png",
		place_param2 = 240,
		walkable = false,
		light_source = light,
		groups = {cracky=2,oddly_breakable_by_hand=1, ud_param2_colorable = 1,
			not_in_creative_inventory=((light ~= nil) and 1) or nil,
		},
		selection_box = slamp_cbox,
		sounds = default.node_sound_wood_defaults(),
		on_rotate = screwdriver.rotate_simple,
		on_rightclick = function(pos, node, clicker, itemstack, pointd)
			node.name = "decor:standing_lamp_"..repl[suffix]
			core.set_node(pos, node)
		end,
		on_construct = unifieddyes.on_construct,
		after_place_node = unifieddyes.recolor_on_place,
		after_dig_node = unifieddyes.after_dig_node,
		expand = { top="air" },
	})

	-- for old maps that had the original 3dforniture mod
	core.register_alias("3dforniture:table_lamp_"..suffix, "decor:table_lamp_"..suffix)
end

reg_lamp("off", "low",  nil, 1 )
reg_lamp("low", "med",  3,   2 )
reg_lamp("med", "hi",   7,   3 )
reg_lamp("hi",  "max", 11,   4 )
reg_lamp("max", "off", 14,   5 )

-- "kitchen"/"dining room" ceiling lamp

homedecor.register("ceiling_lamp", {
	description = S("Ceiling Lamp"),
	mesh = "homedecor_ceiling_lamp.obj",
	tiles = {
		"basic_materials_chain_brass.png",
		"homedecor_ceiling_lamp_glass.png",
		"homedecor_table_standing_lamp_lightbulb.png",
		{ name = "homedecor_generic_plastic.png", color = 0xff442d04 },
	},
	inventory_image = "homedecor_ceiling_lamp_inv.png",
	light_source = default.LIGHT_MAX,
	groups = {snappy=3},
	walkable = false,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		core.set_node(pos, {name = "decor:ceiling_lamp_off"})
	end,
})

homedecor.register("ceiling_lamp_off", {
	description = S("Ceiling Lamp (off)"),
	mesh = "homedecor_ceiling_lamp.obj",
	tiles = {
		"basic_materials_chain_brass.png",
		"homedecor_ceiling_lamp_glass.png",
		{ name = "homedecor_table_standing_lamp_lightbulb.png", color = 0xffd0d0d0 },
		{ name = "homedecor_generic_plastic.png", color = 0xff442d04 },
	},
	groups = {snappy=3, not_in_creative_inventory=1},
	walkable = false,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		core.set_node(pos, {name = "decor:ceiling_lamp"})
	end,
	drop = "decor:ceiling_lamp"
})

-- conversion LBM for param2 coloring

homedecor.old_static_nodes = {
	"decor:glowlight_quarter_white",
	"decor:glowlight_quarter_yellow",
	"decor:glowlight_half_white",
	"decor:glowlight_half_yellow",
	"decor:glowlight_small_cube_white",
	"decor:glowlight_small_cube_yellow"
}

local lamp_power = {"off", "low", "med", "hi", "max"}

for _, power in ipairs(lamp_power) do
	for _, color in ipairs(lamp_colors) do
		table.insert(homedecor.old_static_nodes, "decor:table_lamp_"..color.."_"..power)
		table.insert(homedecor.old_static_nodes, "decor:standing_lamp_"..color.."_"..power)
	end
end

core.register_lbm({
	name = "decor:convert_lighting",
	label = "Convert homedecor glowlights, table lamps, and standing lamps to use param2 color",
	run_at_every_load = false,
	nodenames = homedecor.old_static_nodes,
	action = function(pos, node)
		local name = node.name
		local newname
		local color

		if string.find(name, "small_cube") then
			newname = "decor:glowlight_small_cube"
		elseif string.find(name, "glowlight_half") then
			newname = "decor:glowlight_half"
		elseif string.find(name, "glowlight_quarter") then
			newname = "decor:glowlight_quarter"
		end

		local lampname
		if string.find(name, "standing_lamp") then
			lampname = "decor:standing_lamp"
		elseif string.find(name, "table_lamp") then
			lampname = "decor:table_lamp"
		end
		if lampname then
			newname = lampname
			if string.find(name, "_off") then
				newname = newname.."_off"
			elseif string.find(name, "_low") then
				newname = newname.."_low"
			elseif string.find(name, "_med") then
				newname = newname.."_med"
			elseif string.find(name, "_hi") then
				newname = newname.."_hi"
			elseif string.find(name, "_max") then
				newname = newname.."_max"
			end
		end

		if string.find(name, "red") then
			color = "red"
		elseif string.find(name, "pink") then
			color = "pink"
		elseif string.find(name, "green") then
			color = "green"
		elseif string.find(name, "blue") then
			color = "blue"
		elseif string.find(name, "yellow") then
			color = "yellow"
		elseif string.find(name, "violet") then
			color = "violet"
		else
			color = "white"
		end

		local paletteidx, _ = unifieddyes.getpaletteidx("unifieddyes:"..color, "extended")

		local old_fdir
		local new_node = newname
		local new_fdir = 1
		local param2

		if string.find(name, "glowlight") then
			paletteidx, _ = unifieddyes.getpaletteidx("unifieddyes:"..color, "wallmounted")

			old_fdir = math.floor(node.param2 / 4)

			if old_fdir == 5 then
				new_fdir = 0
			elseif old_fdir == 1 then
				new_fdir = 5
			elseif old_fdir == 2 then
				new_fdir = 4
			elseif old_fdir == 3 then
				new_fdir = 3
			elseif old_fdir == 4 then
				new_fdir = 2
			elseif old_fdir == 0 then
				new_fdir = 1
			end
			param2 = paletteidx + new_fdir
		else
			param2 = paletteidx
		end

		local meta = core.get_meta(pos)

		if string.find(name, "table_lamp") or string.find(name, "standing_lamp") then
			meta:set_string("palette", "ext")
		end

		core.set_node(pos, { name = new_node, param2 = param2 })
		meta:set_string("dye", "unifieddyes:"..color)
	end
})

core.register_lbm({
	name = "decor:recolor_lighting",
	label = "Convert some kinds of lights to use UD extended palette",
	run_at_every_load = false,
	nodenames = {
		"decor:table_lamp_off",
		"decor:table_lamp_low",
		"decor:table_lamp_med",
		"decor:table_lamp_hi",
		"decor:table_lamp_max",
		"decor:standing_lamp_off",
		"decor:standing_lamp_low",
		"decor:standing_lamp_med",
		"decor:standing_lamp_hi",
		"decor:standing_lamp_max",
	},
	action = function(pos, node)
		local meta = core.get_meta(pos)
		if meta:get_string("palette") ~= "ext" then
			core.swap_node(pos, { name = node.name, param2 = unifieddyes.convert_classic_palette[node.param2] })
			meta:set_string("palette", "ext")
		end
	end
})
