
local S = homedecor_i18n.gettext

homedecor.register("window_quartered", {
	description = S("Window (quartered)"),
	tiles = {
		"homedecor_window_sides.png",
		"homedecor_window_sides.png",
		"homedecor_window_sides.png",
		"homedecor_window_sides.png",
		"homedecor_window_quartered.png",
		"homedecor_window_quartered.png"
	},
	use_texture_alpha = "blend",
	groups = {snappy=3},
	sounds = default.node_sound_glass_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.025, 0.5, 0.5, 0}, -- NodeBox1
			{-0.5, 0.4375, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox2
			{-0.5, -0.5, -0.0625, 0.5, -0.4375, 0.0625}, -- NodeBox3
			{-0.5, -0.0625, -0.025, 0.5, 0.0625, 0.025}, -- NodeBox4
			{0.4375, -0.5, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox5
			{-0.5, -0.5, -0.0625, -0.4375, 0.5, 0.0625}, -- NodeBox6
			{-0.0625, -0.5, -0.025, 0.0625, 0.5, 0.025}, -- NodeBox7
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.0625, 0.5, 0.5, 0.0625}
	}
})

homedecor.register("window_plain", {
	description = S("Window (plain)"),
	tiles = {
		"homedecor_window_sides.png",
		"homedecor_window_sides.png",
		"homedecor_window_sides.png",
		"homedecor_window_sides.png",
		"homedecor_window_frame.png",
		"homedecor_window_frame.png"
	},
	use_texture_alpha = "blend",
	groups = {snappy=3},
	sounds = default.node_sound_glass_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.025, 0.5, 0.5, 0}, -- NodeBox1
			{-0.5, 0.4375, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox2
			{-0.5, -0.5, -0.0625, 0.5, -0.4375, 0.0625}, -- NodeBox3
			{0.4375, -0.5, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox4
			{-0.5, -0.5, -0.0625, -0.4375, 0.5, 0.0625}, -- NodeBox5
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.0625, 0.5, 0.5, 0.0625}
	}
})

core.register_node("decor:curtain_closed", {
	description = S("Curtains"),
	tiles = { "homedecor_curtain.png" },
	inventory_image = "homedecor_curtain.png",
	drawtype = 'signlike',
	use_texture_alpha = "clip",
	walkable = false,
	groups = { snappy = 3, ud_param2_colorable = 1 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype = "light",
	paramtype2 = "colorwallmounted",
	palette = "unifieddyes_palette_colorwallmounted.png",
	selection_box = { type = "wallmounted" },
	after_dig_node = unifieddyes.after_dig_node,
	after_place_node = function(pos, placer, itemstack, pointd)
		unifieddyes.fix_rotation(pos, placer, itemstack, pointd)
		unifieddyes.recolor_on_place(pos, placer, itemstack, pointd)
	end,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		local topnode = core.get_node({x=pos.x, y=pos.y+1.0, z=pos.z})
		if string.find(topnode.name, "decor:curtainrod") then
			-- Open the curtains
			local fdir = node.param2
			core.set_node(pos, { name = "decor:curtain_open", param2 = fdir })
		end
		return itemstack
	end
})

core.register_node("decor:curtain_open", {
	description = S("Curtains (open)"),
	tiles = { "homedecor_curtain_open.png" },
	inventory_image = "homedecor_curtain_open.png",
	drawtype = 'signlike',
	use_texture_alpha = "clip",
	walkable = false,
	groups = { snappy = 3, ud_param2_colorable = 1 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype = "light",
	paramtype2 = "colorwallmounted",
	palette = "unifieddyes_palette_colorwallmounted.png",
	selection_box = { type = "wallmounted" },
	after_dig_node = unifieddyes.after_dig_node,
	after_place_node = function(pos, placer, itemstack, pointd)
		unifieddyes.fix_rotation(pos, placer, itemstack, pointd)
		unifieddyes.recolor_on_place(pos, placer, itemstack, pointd)
	end,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		local topnode = core.get_node({x=pos.x, y=pos.y+1.0, z=pos.z})
		if string.find(topnode.name, "decor:curtainrod") then
			-- Close the curtains
			local fdir = node.param2
			core.set_node(pos, { name = "decor:curtain_closed", param2 = fdir })
		end
		return itemstack
	end
})

local mats = {
	{ "brass", S("brass"), "basic_materials_chain_brass.png" },
	{ "wrought_iron", S("wrought iron"), "homedecor_generic_metal_wrought_iron.png" },
	{ "wood", S("wood"), "default_wood.png" }
}

for _, m in ipairs(mats) do
	local material, mat_name, texture = unpack(m)
	homedecor.register("curtainrod_"..material, {
		tiles = { texture },
		inventory_image  = "homedecor_curtainrod_"..material.."_inv.png",
		description = S("Curtain Rod (@1)", mat_name),
		groups = { snappy = 3 },
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, 0.375, 0.5, -0.4375, 0.4375},
				{-0.4375, -0.5, 0.4375, -0.375, -0.4375, 0.5},
				{0.375, -0.5, 0.4375, 0.4375, -0.4375, 0.5}
			}
		}
	})
end

homedecor.register("window_flowerbox", {
	description = S("Window flowerbox"),
	tiles = {
		"homedecor_flowerbox_top.png",
		"homedecor_flowerbox_bottom.png",
		"homedecor_flowerbox_sides.png"
	},
	use_texture_alpha = "clip",
	inventory_image = "homedecor_flowerbox_inv.png",
	sounds = default.node_sound_stone_defaults(),
	groups = { snappy = 3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, 0.25, -0.125, 0.375, 0.5, 0.375}, -- NodeBox1
			{-0.3125, 0.4375, 0.375, -0.25, 0.4875, 0.5}, -- NodeBox2
			{0.25, 0.4375, 0.375, 0.3125, 0.4875, 0.5}, -- NodeBox3
		}
	}
})

homedecor.register("stained_glass", {
	description = S("Stained Glass"),
	tiles = {"homedecor_stained_glass.png"},
	inventory_image = "homedecor_stained_glass.png",
	groups = {snappy=3},
	use_texture_alpha = "blend",
	light_source = 3,
	sounds = default.node_sound_glass_defaults(),
	node_box = {
		type = "fixed",
		fixed = { {-0.5, -0.5, 0.46875, 0.5, 0.5, 0.5} }
	}
})

-- Convert old curtain nodes to param2-colorization

local curtaincolors = {
	"red",
	"green",
	"blue",
	"white",
	"pink",
	"violet",
}

homedecor.old_static_curtain_nodes = {}

for _, color in ipairs(curtaincolors) do
	table.insert(homedecor.old_static_curtain_nodes, "decor:curtain_"..color)
	table.insert(homedecor.old_static_curtain_nodes, "decor:curtain_open_"..color)
end

core.register_lbm({
	name = "decor:convert_curtains",
	label = "Convert static curtain nodes to use param2 color",
	run_at_every_load = false,
	nodenames = homedecor.old_static_curtain_nodes,
	action = function(pos, node)
		local name = node.name
		local color = string.sub(name, 19)
		local openclose = "closed"

		if string.find(color, "open") then
			color = string.sub(color, 6)
			openclose = "open"
		end

		local metadye = "medium_"..color
		if color == "white" then
			metadye = "white"
		end

		local newnode = "decor:curtain_"..openclose
		local paletteidx, _ = unifieddyes.getpaletteidx("unifieddyes:"..metadye, "wallmounted")
		local newparam2 = paletteidx + (node.param2 % 8)

		core.set_node(pos, { name = newnode, param2 = newparam2 })
		local meta = core.get_meta(pos)
		meta:set_string("dye", "unifieddyes:"..metadye)
	end
})
