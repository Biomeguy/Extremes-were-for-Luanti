
local S = homedecor_i18n.gettext

core.register_node("decor:bathroom_tiles_dark", {
	description = S("Bathroom/kitchen tiles (dark)"),
	tiles = {
		"homedecor_bathroom_tiles_bg.png"
	},
	overlay_tiles = {
		{ name = "homedecor_bathroom_tiles_fg.png", color = 0xff606060 },
	},
	paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	place_param2 = 240,
	groups = {cracky=3, ud_param2_colorable = 1},
	sounds = default.node_sound_stone_defaults(),
	on_construct = unifieddyes.on_construct,
	after_place_node = unifieddyes.recolor_on_place,
	after_dig_node = unifieddyes.after_dig_node
})

core.register_node("decor:bathroom_tiles_medium", {
	description = S("Bathroom/kitchen tiles (medium)"),
	tiles = {
		"homedecor_bathroom_tiles_bg.png"
	},
	overlay_tiles = {
		{ name = "homedecor_bathroom_tiles_fg.png", color = 0xffc0c0c0 },
	},
	paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	place_param2 = 240,
	groups = {cracky=3, ud_param2_colorable = 1},
	sounds = default.node_sound_stone_defaults(),
	on_construct = unifieddyes.on_construct,
	after_place_node = unifieddyes.recolor_on_place,
	after_dig_node = unifieddyes.after_dig_node
})

core.register_node("decor:bathroom_tiles_light", {
	description = S("Bathroom/kitchen tiles (light)"),
	tiles = {
		"homedecor_bathroom_tiles_bg.png"
	},
	overlay_tiles = {
			{ name = "homedecor_bathroom_tiles_fg.png", color = 0xffffffff },
	},
	paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	place_param2 = 240,
	groups = {cracky=3, ud_param2_colorable = 1},
	sounds = default.node_sound_stone_defaults(),
	on_construct = unifieddyes.on_construct,
	after_place_node = unifieddyes.recolor_on_place,
	after_dig_node = unifieddyes.after_dig_node
})

local tr_cbox = {
	type = "fixed",
	fixed = { -0.375, -0.3125, 0.25, 0.375, 0.375, 0.5 }
}

homedecor.register("towel_rod", {
	description = S("Towel rod with towel"),
	mesh = "homedecor_towel_rod.obj",
	tiles = {
		"homedecor_generic_terrycloth.png",
		"default_wood.png",
	},
	inventory_image = "homedecor_towel_rod_inv.png",
	selection_box = tr_cbox,
	walkable = false,
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_defaults(),
})

local toilet_sbox = {
	type = "fixed",
	fixed = { -6/16, -8/16, -8/16, 6/16, 9/16, 8/16 },
}

local toilet_cbox = {
	type = "fixed",
	fixed = {
		{-6/16, -8/16, -8/16, 6/16, 1/16, 8/16 },
		{-6/16, -8/16, 4/16, 6/16, 9/16, 8/16 }
	}
}

homedecor.register("toilet", {
	description = S("Toilet"),
	mesh = "homedecor_toilet_closed.obj",
	tiles = {
		"homedecor_marble.png",
		"homedecor_marble.png",
		"homedecor_marble.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey }
	},
	selection_box = toilet_sbox,
	node_box = toilet_cbox,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		node.name = "decor:toilet_open"
		core.set_node(pos, node)
	end
})

homedecor.register("toilet_open", {
	mesh = "homedecor_toilet_open.obj",
	tiles = {
		"homedecor_marble.png",
		"homedecor_marble.png",
		"homedecor_marble.png",
		"default_water.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey }
	},
	use_texture_alpha = "blend",
	selection_box = toilet_sbox,
	collision_box = toilet_cbox,
	drop = "decor:toilet",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		node.name = "decor:toilet"
		core.set_node(pos, node)
		core.sound_play("homedecor_toilet_flush", {
			pos=pos,
			max_hear_distance = 5,
			gain = 1,
		})
	end
})

-- toilet paper :-)

local tp_cbox = {
	type = "fixed",
	fixed = { -0.25, 0.125, 0.0625, 0.1875, 0.4375, 0.5 }
}

homedecor.register("toilet_paper", {
	description = S("Toilet paper"),
	mesh = "homedecor_toilet_paper.obj",
	tiles = {
		"homedecor_generic_quilted_paper.png",
		"default_wood.png"
	},
	inventory_image = "homedecor_toilet_paper_inv.png",
	selection_box = tp_cbox,
	walkable = false,
	groups = {snappy=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_defaults(),
})

--Sink

local sink_cbox = {
	type = "fixed",
	fixed = { -5/16, -8/16, 1/16, 5/16, 8/16, 8/16 }
}

homedecor.register("sink", {
	description = S("Bathroom Sink"),
	mesh = "homedecor_bathroom_sink.obj",
	tiles = {
		"homedecor_marble.png",
		"homedecor_marble.png",
		"default_water.png"
	},
	inventory_image="homedecor_bathroom_sink_inv.png",
	use_texture_alpha = "blend",
	selection_box = sink_cbox,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{ -5/16,  5/16, 1/16, -4/16, 8/16, 8/16 },
			{  5/16,  5/16, 1/16,  4/16, 8/16, 8/16 },
			{ -5/16,  5/16, 1/16,  5/16, 8/16, 2/16 },
			{ -5/16,  5/16, 6/16,  5/16, 8/16, 8/16 },
			{ -4/16, -8/16, 1/16,  4/16, 5/16, 6/16 }
		}
	},
	on_destruct = function(pos)
		homedecor.stop_particle_spawner({x=pos.x, y=pos.y+1, z=pos.z})
	end
})

--Taps

local function taps_on_rightclick(pos, node, clicker, itemstack, pointd)
	local below = core.get_node_or_nil({x=pos.x, y=pos.y-1, z=pos.z})
	if below and
	  below.name == "decor:shower_tray" or
	  below.name == "decor:sink" or
	  below.name == "decor:kitchen_cabinet_with_sink" or
	  below.name == "decor:kitchen_cabinet_with_sink_locked" then
		local particledef = {
			outlet      = { x = 0, y = -0.44, z = 0.28 },
			velocity_x  = { min = -0.1, max = 0.1 },
			velocity_y  = -0.3,
			velocity_z  = { min = -0.1, max = 0 },
			spread      = 0
		}
		homedecor.start_particle_spawner(pos, node, particledef, "homedecor_faucet")
	end
	return itemstack
end

homedecor.register("taps", {
	description = S("Bathroom taps/faucet"),
	mesh = "homedecor_bathroom_faucet.obj",
	tiles = {
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
		"homedecor_generic_metal_bright.png",
		"homedecor_generic_metal.png",
		"homedecor_generic_metal_bright.png"
	},
	inventory_image = "3dforniture_taps_inv.png",
	wield_image = "3dforniture_taps_inv.png",
	selection_box = {
		type = "fixed",
		fixed = { -4/16, -7/16, 4/16, 4/16, -4/16, 8/16 },
	},
	walkable = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = taps_on_rightclick,
	on_destruct = homedecor.stop_particle_spawner,
	on_rotate = screwdriver.disallow
})

homedecor.register("taps_brass", {
	description = S("Bathroom taps/faucet (brass)"),
	mesh = "homedecor_bathroom_faucet.obj",
	tiles = {
		"basic_materials_chain_brass.png",
		"basic_materials_chain_brass.png",
		"homedecor_generic_metal.png",
		"basic_materials_chain_brass.png"
	},
	inventory_image = "3dforniture_taps_brass_inv.png",
	wield_image = "3dforniture_taps_brass_inv.png",
	selection_box = {
		type = "fixed",
		fixed = { -4/16, -7/16, 4/16, 4/16, -4/16, 8/16 },
	},
	walkable = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = taps_on_rightclick,
	on_destruct = homedecor.stop_particle_spawner,
	on_rotate = screwdriver.disallow
})

--Shower Tray

homedecor.register("shower_tray", {
	description = S("Shower Tray"),
	tiles = {
		"forniture_marble_base_ducha_top.png",
		"homedecor_marble.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, -0.45, 0.5 },
			{ -0.5, -0.45, -0.5, 0.5, -0.4, -0.45 },
			{ -0.5, -0.45, 0.45, 0.5, -0.4, 0.5 },
			{ -0.5, -0.45, -0.45, -0.45, -0.4, 0.45 },
			{  0.45, -0.45, -0.45, 0.5, -0.4, 0.45 }
		},
	},
	selection_box = homedecor.nodebox.slab_y(0.1),
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	on_destruct = function(pos)
		homedecor.stop_particle_spawner({x=pos.x, y=pos.y+2, z=pos.z}) -- the showerhead
		homedecor.stop_particle_spawner({x=pos.x, y=pos.y+1, z=pos.z}) -- the taps, if any
	end
})

--Shower Head


local sh_cbox = {
	type = "fixed",
	fixed = { -0.2, -0.4, -0.05, 0.2, 0.1, 0.5 }
}

homedecor.register("shower_head", {
	drawtype = "mesh",
	mesh = "homedecor_shower_head.obj",
	tiles = {
		"homedecor_generic_metal.png",
		"homedecor_shower_head.png"
	},
	inventory_image = "homedecor_shower_head_inv.png",
	description = S("Shower Head"),
	groups = {snappy=3},
	selection_box = sh_cbox,
	walkable = false,
	on_rotate = screwdriver.disallow,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		local below = core.get_node_or_nil({x=pos.x, y=pos.y-2.0, z=pos.z})
		if below and below.name == "decor:shower_tray" then
			local particledef = {
				outlet      = { x = 0, y = -0.42, z = 0.1 },
				velocity_x  = { min = -0.15, max = 0.15 },
				velocity_y  = -2,
				velocity_z  = { min = -0.3,  max = 0.1 },
				spread      = 0.12
			}
			homedecor.start_particle_spawner(pos, node, particledef, "homedecor_shower")
		end
		return itemstack
	end,
	on_destruct = function(pos)
		homedecor.stop_particle_spawner(pos)
	end
})

-- convert old static nodes

homedecor.old_static_bathroom_tiles = {
	"decor:tiles_1",
	"decor:tiles_2",
	"decor:tiles_3",
	"decor:tiles_4",
	"decor:tiles_red",
	"decor:tiles_tan",
	"decor:tiles_yellow",
	"decor:tiles_green",
	"decor:tiles_blue"
}

local old_to_color = {
	"light_grey",
	"grey",
	"black",
	"black"
}

core.register_lbm({
	name = "decor:convert_bathroom_tiles",
	label = "Convert bathroom tiles to use param2 color",
	run_at_every_load = false,
	nodenames = homedecor.old_static_bathroom_tiles,
	action = function(pos, node)
		local name = node.name
		local newname = "decor:bathroom_tiles_light"
		local a = string.find(name, "_")
		local color = string.sub(name, a + 1)

		if color == "tan" then
			color = "yellow_s50"
		elseif color == "1" or color == "2" or color == "3" or color == "4" then
			if color == "4" then
				newname = "decor:bathroom_tiles_medium"
			end
			color = old_to_color[tonumber(color)]
		elseif color ~= "yellow" then
			color = color.."_s50"
		end

		local paletteidx = unifieddyes.getpaletteidx("unifieddyes:"..color, "extended")

		core.set_node(pos, { name = newname, param2 = paletteidx })
		local meta = core.get_meta(pos)
		meta:set_string("dye", "unifieddyes:"..color)
		meta:set_string("palette", "ext")
	end
})

core.register_lbm({
	name = "decor:recolor_bathroom_tiles",
	label = "Convert bathroom tiles to use UD extended palette",
	run_at_every_load = false,
	nodenames = {
		"decor:bathroom_tiles_light",
		"decor:bathroom_tiles_medium",
		"decor:bathroom_tiles_dark",
	},
	action = function(pos, node)
		local meta = core.get_meta(pos)
		if meta:get_string("palette") ~= "ext" then
			core.swap_node(pos, { name = node.name, param2 = unifieddyes.convert_classic_palette[node.param2] })
			meta:set_string("palette", "ext")
		end
	end
})
