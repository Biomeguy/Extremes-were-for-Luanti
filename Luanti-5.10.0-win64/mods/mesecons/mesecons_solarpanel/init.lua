-- Solar Panel
core.register_node("mesecons_solarpanel:solar_panel_on", {
	drawtype = "nodebox",
	tiles = { "jeija_solar_panel.png", },
	inventory_image = "jeija_solar_panel.png",
	wield_image = "jeija_solar_panel.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	is_ground_content = false,
	node_box = {
		type = "wallmounted",
		wall_bottom = { -7/16, -8/16, -7/16,  7/16, -7/16, 7/16 },
		wall_top    = { -7/16,  7/16, -7/16,  7/16,  8/16, 7/16 },
		wall_side   = { -8/16, -7/16, -7/16, -7/16,  7/16, 7/16 },
	},
	selection_box = {
		type = "wallmounted",
		wall_bottom = { -7/16, -8/16, -7/16,  7/16, -7/16, 7/16 },
		wall_top    = { -7/16,  7/16, -7/16,  7/16,  8/16, 7/16 },
		wall_side   = { -8/16, -7/16, -7/16, -7/16,  7/16, 7/16 },
	},
	drop = "mesecons_solarpanel:solar_panel_off",
	groups = {dig_immediate=3, not_in_creative_inventory = 1},
	sounds = default.node_sound_glass_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.on,
		rules = mesecon.rules.wallmounted_get,
	}},
	on_construct = function(pos)
		core.get_node_timer(pos):start(.2)
	end,
	on_timer = function(pos, elapsed)
		local light = core.get_node_light(pos)
		local node = core.get_node(pos)
		if light < 12 then
			node.name = "mesecons_solarpanel:solar_panel_off"
			core.swap_node(pos, node)
			mesecon.receptor_off(pos, mesecon.rules.wallmounted_get(node))
		end
		core.get_node_timer(pos):start(.2)
	end,
	on_blast = mesecon.on_blastnode,
})

core.register_node("mesecons_solarpanel:solar_panel_off", {
	drawtype = "nodebox",
	tiles = { "jeija_solar_panel.png", },
	inventory_image = "jeija_solar_panel.png",
	wield_image = "jeija_solar_panel.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	is_ground_content = false,
	node_box = {
		type = "wallmounted",
		wall_bottom = { -7/16, -8/16, -7/16,  7/16, -7/16, 7/16 },
		wall_top    = { -7/16,  7/16, -7/16,  7/16,  8/16, 7/16 },
		wall_side   = { -8/16, -7/16, -7/16, -7/16,  7/16, 7/16 },
	},
	selection_box = {
		type = "wallmounted",
		wall_bottom = { -7/16, -8/16, -7/16,  7/16, -7/16, 7/16 },
		wall_top    = { -7/16,  7/16, -7/16,  7/16,  8/16, 7/16 },
		wall_side   = { -8/16, -7/16, -7/16, -7/16,  7/16, 7/16 },
	},
	groups = {dig_immediate=3},
	description = "Solar Panel",
	sounds = default.node_sound_glass_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.off,
		rules = mesecon.rules.wallmounted_get,
	}},
	on_construct = function(pos)
		core.get_node_timer(pos):start(.2)
	end,
	on_timer = function(pos, elapsed)
		local light = core.get_node_light(pos)
		local node = core.get_node(pos)
		if light >= 12 then
			node.name = "mesecons_solarpanel:solar_panel_on"
			core.swap_node(pos, node)
			mesecon.receptor_on(pos, mesecon.rules.wallmounted_get(node))
		end
		core.get_node_timer(pos):start(.2)
	end,
	on_blast = mesecon.on_blastnode,
})

core.register_craft({
	output = "mesecons_solarpanel:solar_panel_off",
	recipe = {
		{"basic_materials:silicon", "basic_materials:silicon"},
		{"basic_materials:silicon", "basic_materials:silicon"}
	}
})
