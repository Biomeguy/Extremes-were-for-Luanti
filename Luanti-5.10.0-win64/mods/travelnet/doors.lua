-- Doors that are especially useful for travelnet elevators but can also be used in other situations.
-- All doors (not only these here) in front of a travelnet or elevator are opened automaticly when a player arrives
-- and are closed when a player departs from the travelnet or elevator.
-- Autor: Sokomine

core.register_node("travelnet:elevator_door_steel_closed", {
	description = "elevator door (closed)",
	drawtype = "nodebox",
	tiles = {"default_stone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, .4, -.01, 1.5, .5},
			{ .01, -.5, .4, .5, 1.5, .5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, .4, .5, 1.5, .5}
	},
	on_rightclick = function(pos, node, puncher)
		core.add_node(pos, {name = "travelnet:elevator_door_steel_open", param2 = node.param2})
	end,
})

core.register_node("travelnet:elevator_door_steel_open", {
	description = "elevator door (open)",
	drawtype = "nodebox",
	tiles = {"default_stone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
	node_box = {-- larger than one node but slightly smaller than a half node so that wallmounted torches pose no problem
		type = "fixed",
		fixed = {
			{-.90, -.5, .4, -.49, 1.5, .5},
			{.49, -.5, .4, .9, 1.5, .5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {-.9, -.5, .4, .9, 1.5, .5}
	},
	drop = "travelnet:elevator_door_steel_closed",
	on_rightclick = function(pos, node, puncher)
		core.add_node(pos, {name = "travelnet:elevator_door_steel_closed", param2 = node.param2})
	end,
})

core.register_node("travelnet:elevator_door_glass_closed", {
	description = "elevator door (closed)",
	drawtype = "nodebox",
	tiles = {"travelnet_elevator_door_glass.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, .4, -.01, 1.5, .5},
			{.01, -.5, .4, .5, 1.5, .5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, .4, .5, 1.5, .5}
	},
	on_rightclick = function(pos, node, puncher)
		core.add_node(pos, {name = "travelnet:elevator_door_glass_open", param2 = node.param2})
	end,
})

core.register_node("travelnet:elevator_door_glass_open", {
	description = "elevator door (open)",
	drawtype = "nodebox",
	tiles = {"travelnet_elevator_door_glass.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
	node_box = {-- larger than one node but slightly smaller than a half node so that wallmounted torches pose no problem
		type = "fixed",
		fixed = {
			{-.99, -.5, .4, -.49, 1.5, .5},
			{.49, -.5, .4, .99, 1.5, .5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {-.9, -.5, .4, .9, 1.5, .5}
	},
	drop = "travelnet:elevator_door_glass_closed",
	on_rightclick = function(pos, node, puncher)
		core.add_node(pos, {name = "travelnet:elevator_door_glass_closed", param2 = node.param2})
	end,
})

core.register_craft({
	output = "travelnet:elevator_door_glass_closed",
	recipe = {
		{"default:glass", "", "default:glass"},
		{"default:glass", "", "default:glass"},
		{"default:glass", "", "default:glass"}
	}
})

core.register_craft({
	output = "travelnet:elevator_door_steel_closed",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"}
	}
})
