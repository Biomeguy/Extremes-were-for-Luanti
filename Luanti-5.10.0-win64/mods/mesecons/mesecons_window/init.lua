-- Window Block

local sfx
if core.get_modpath("default") then
	sfx = default.node_sound_glass_defaults()
end

core.register_node("mesecons_window:window_closed", {
	description="Mesecon Window",
	_doc_items_longdesc = "A Mesecon receptor which is opaque when it isn't powered and is fully transparent to light and sunlight when powered.",
	tiles = {"mesecons_window_window_closed.png"},
	is_ground_content = false,
	groups = {cracky=3, oddly_breakable_by_hand=3},
	sounds = sfx,
	mesecons = {conductor = {
		state = mesecon.state.off,
		rules = { --axes
			{x = -1, y = 0, z = 0},
			{x = 1, y = 0, z = 0},
			{x = 0, y = -1, z = 0},
			{x = 0, y = 1, z = 0},
			{x = 0, y = 0, z = -1},
			{x = 0, y = 0, z = 1},
		},
		onstate = "mesecons_window:window_open"
	}}
})

core.register_node("mesecons_window:window_open", {
	description="Mesecon Window",
	_doc_items_create_entry = false,
	drawtype = "glasslike_framed",
	sunlight_propagates = true,
	tiles = {"mesecons_window_window_open.png", "mesecons_window_window_open_detail.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky=3, oddly_breakable_by_hand=3, not_in_creative_inventory=1},
	drop = "mesecons_window:window_closed",
	sounds = sfx,
	mesecons = {conductor = {
		state = mesecon.state.on,
		rules = {
			{x = -1, y = 0, z = 0},
			{x = 1, y = 0, z = 0},
			{x = 0, y = -1, z = 0},
			{x = 0, y = 1, z = 0},
			{x = 0, y = 0, z = -1},
			{x = 0, y = 0, z = 1},
		},
		offstate = "mesecons_window:window_closed"
	}},
	on_construct = function(pos)
		-- remove shadow
		shadowpos = vector.add(pos, vector.new(0, 1, 0))
		if (core.get_node(shadowpos).name == "air") then
			core.dig_node(shadowpos)
		end
	end
})

core.register_node("mesecons_window:filter_closed", {
	description="Mesecon Filter Window",
	tiles = {"mesecons_window_filter_closed.png"},
	_doc_items_longdesc = "A Mesecon receptor which is opaque when it isn't powered and is semi-transparent to light when powered.",
	is_ground_content = false,
	groups = {cracky=3, oddly_breakable_by_hand=3},
	sounds = sfx,
	mesecons = {conductor = {
		state = mesecon.state.off,
		rules = { --axes
			{x = -1, y = 0, z = 0},
			{x = 1, y = 0, z = 0},
			{x = 0, y = -1, z = 0},
			{x = 0, y = 1, z = 0},
			{x = 0, y = 0, z = -1},
			{x = 0, y = 0, z = 1},
		},
		onstate = "mesecons_window:filter_open"
	}}
})

core.register_node("mesecons_window:filter_open", {
	description="Mesecon Filter Window",
	drawtype = "glasslike_framed",
	_doc_items_create_entry = false,
	sunlight_propagates = false,
	tiles = {"mesecons_window_filter_open.png", "mesecons_window_filter_open_detail.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky=3, oddly_breakable_by_hand=3, not_in_creative_inventory=1},
	drop = "mesecons_window:filter_closed",
	sounds = sfx,
	mesecons = {conductor = {
		state = mesecon.state.on,
		rules = {
			{x = -1, y = 0, z = 0},
			{x = 1, y = 0, z = 0},
			{x = 0, y = -1, z = 0},
			{x = 0, y = 1, z = 0},
			{x = 0, y = 0, z = -1},
			{x = 0, y = 0, z = 1},
		},
		offstate = "mesecons_window:filter_closed"
	}},
	on_construct = function(pos)
		-- remove shadow
		shadowpos = vector.add(pos, vector.new(0, 1, 0))
		if (core.get_node(shadowpos).name == "air") then
			core.dig_node(shadowpos)
		end
	end
})

core.register_node("mesecons_window:filter2_closed", {
	description="Mesecon Filter Glass",
	_doc_items_longdesc = "A Mesecon receptor which lets light through. When not powered, it is semi-transparent, i.e. it is transparent to light, but filters out sunlight. When powered, it is fully transparent to light and sunlight.",
	drawtype="glasslike_framed",
	tiles = {"mesecons_window_filter2_closed.png", "mesecons_window_filter2_closed_detail.png"},
	is_ground_content = false,
	groups = {cracky=3, oddly_breakable_by_hand=3},
	sounds = sfx,
	paramtype = "light",
	sunlight_propagates = false,
	mesecons = {conductor = {
		state = mesecon.state.off,
		rules = { --axes
			{x = -1, y = 0, z = 0},
			{x = 1, y = 0, z = 0},
			{x = 0, y = -1, z = 0},
			{x = 0, y = 1, z = 0},
			{x = 0, y = 0, z = -1},
			{x = 0, y = 0, z = 1},
		},
		onstate = "mesecons_window:filter2_open"
	}},
	on_construct = function(pos)
		-- remove shadow
		shadowpos = vector.add(pos, vector.new(0, 1, 0))
		if (core.get_node(shadowpos).name == "air") then
			core.dig_node(shadowpos)
		end
	end
})

core.register_node("mesecons_window:filter2_open", {
	description="Mesecon Filter Glass",
	_doc_items_create_entry = false,
	drawtype = "glasslike_framed",
	sunlight_propagates = false,
	tiles = {"mesecons_window_filter2_open.png", "mesecons_window_filter2_open_detail.png"},
	is_ground_content = false,
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky=3, oddly_breakable_by_hand=3, not_in_creative_inventory=1},
	drop = "mesecons_window:filter2_closed",
	sounds = sfx,
	mesecons = {conductor = {
		state = mesecon.state.on,
		rules = {
			{x = -1, y = 0, z = 0},
			{x = 1, y = 0, z = 0},
			{x = 0, y = -1, z = 0},
			{x = 0, y = 1, z = 0},
			{x = 0, y = 0, z = -1},
			{x = 0, y = 0, z = 1},
		},
		offstate = "mesecons_window:filter2_closed"
	}},
	on_construct = function(pos)
		-- remove shadow
		shadowpos = vector.add(pos, vector.new(0, 1, 0))
		if (core.get_node(shadowpos).name == "air") then
			core.dig_node(shadowpos)
		end
	end
})

if core.get_modpath("default") then
	core.register_craft({
		output = "mesecons_window:window_closed 3",
		recipe = {
			{"default:cobble", "default:cobble", "default:cobble"},
			{"", "group:mesecon_conductor_craftable", ""},
			{"default:glass", "default:glass", "default:glass"}
		}
	})

	core.register_craft({
		output = "mesecons_window:filter_closed 3",
		recipe = {
			{"default:cobble", "default:cobble", "default:cobble"},
			{"group:leaves", "group:mesecon_conductor_craftable", "group:leaves"},
			{"default:glass", "default:glass", "default:glass"}
		}
	})

	core.register_craft({
		output = "mesecons_window:filter2_closed 3",
		recipe = {
			{"group:leaves", "group:leaves", "group:leaves"},
			{"", "group:mesecon_conductor_craftable", ""},
			{"default:glass", "default:glass", "default:glass"}
		}
	})
end

if core.get_modpath("doc") then
	doc.add_entry_alias("nodes", "mesecons_window:window_closed", "nodes", "mesecons_window:window_open")
	doc.add_entry_alias("nodes", "mesecons_window:filter_closed", "nodes", "mesecons_window:filter_open")
	doc.add_entry_alias("nodes", "mesecons_window:filter2_closed", "nodes", "mesecons_window:filter2_open")
end
