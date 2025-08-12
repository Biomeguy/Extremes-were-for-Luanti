screwdriver = screwdriver or {}
local S = core.get_translator("decor")

core.register_node("decor:bench", {
	description = S("Wooden bench"),
	drawtype = "nodebox",
	tiles = {"homedecor_generic_wood_old2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
	{-.5, -.15, .1, .5, -.05, .5},
	{-.4, -.5, .2, -.3, -.15, .4},
	{.3, -.5, .2, .4, -.15, .4}
		}
	},--[[
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, 0, .5, 0, .5}
	},]]
	collision_box = {
		type = "fixed",
		fixed = {-.4, -.5, .2, .4, -.05, .4}
	},
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	can_dig = player_api.sit_dig_offset,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		player_api.sit_offset(pos, node, clicker, pointd)
		return itemstack
	end,
})


core.register_node("decor:small_table", {
	description = S("Table"),
	drawtype = "nodebox",
	tiles = {"homedecor_generic_wood_old2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
	{ -.1, -.5, -.1, .1, .4, .1},
	{ -.5, .48, -.5, .5, .4, .5}
		}
	},
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
})

-- the infotext shows if it's empty or not
core.register_node("decor:shelf_open", {
	description = S("Open storage shelf"),
	drawtype = "nodebox",
	tiles = {"homedecor_generic_wood_old2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
	{-.5, -.5, -.3, -.4, .5, .5},
	{ .4, -.5, -.3, .5, .5, .5},
	{-.5, -.2, -.3, .5, -.1, .5},
	{-.5, .3, -.3, .5, .4, .5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
	{ -.5, -.5, -.3, .5, .5, .5},
		},
	},
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec", "size[8,8]"..
			"list[current_name;main;0,0;8,3;]"..
			"list[current_player;main;0,4;8,4;]")
		meta:set_string("infotext", S("open storage shelf"))
		local inv = meta:get_inventory()
		inv:set_size("main", 24)
	end,
	can_dig = function(pos, player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = core.get_meta( pos )
		meta:set_string('infotext', S('open storage shelf (in use)'))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = core.get_meta( pos )
		local inv = meta:get_inventory()
		if( inv:is_empty("main")) then
			meta:set_string('infotext', S('open storage shelf (empty)'))
		end
	end,
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
})

-- can be used to buid real stationary wagons or attached to walls as decoration
core.register_node("decor:wagon_wheel", {
	description = S("wagon wheel"),
	drawtype = "signlike",
	tiles = {"cottages_wagonwheel.png"}, -- done by VanessaE!
	inventory_image = "cottages_wagonwheel.png",
	wield_image = "cottages_wagonwheel.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	is_ground_content = false,
})

-- a very small wooden slab
core.register_node("decor:wood_flat", {
	description = S("Flat Wooden Planks"),
	drawtype = "nodebox",
	tiles = {"homedecor_generic_wood_old2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.5+1/16, .5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.5+1/16, .5}
	},
	is_ground_content = false,
	on_place = core.rotate_node,
})

core.register_node("decor:fence_small", {
	description = S("small fence"),
	drawtype = "nodebox",
	tiles = {"homedecor_generic_wood_old2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
	{-.45, -.35, .46, .45, -.20, .5},
	{-.45, 0, .46, .45, .15, .5},
	{-.45, .35, .46, .45, .5, .5},
	{-.5, -.5, .46, -.45, .5, .5},
	{ .45, -.5, .46, .5, .5, .5}
		}
	},
	is_ground_content = false,
})

core.register_node("decor:fence_corner", {
	description = S("small fence corner"),
	drawtype = "nodebox",
	tiles = {"homedecor_generic_wood_old2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
	{-.45, -.35, .46, .45, -.20, .5},
	{-.45, 0, .46, .45, .15, .5},
	{-.45, .35, .46, .45, .5, .5},
	{-.5, -.5, .46, -.45, .5, .5},
	{.45, -.5, .46, .5, .5, .5},
	{.46, -.35, -.45, .5, -.20, .45},
	{.46, 0, -.45, .5, .15, .45},
	{.46, .35, -.45, .5, .5, .45},
	{.46, -.5, -.5, .5, .5, -.45},
	{.46, -.5, .45, .5, .5, .5}
		}
	},
	is_ground_content = false,
})

core.register_node("decor:fence_end", {
	description = S("small fence end"),
	drawtype = "nodebox",
	tiles = {"homedecor_generic_wood_old2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
	{-.45, -.35, .46, .45, -.20, .5},
	{-.45, 0, .46, .45, .15, .5},
	{-.45, .35, .46, .45, .5, .5},
	{-.5, -.5, .46, -.45, .5, .5},
	{.45, -.5, .46, .5, .5, .5},
	{.46, -.35, -.45, .5, -.20, .45},
	{.46, 0, -.45, .5, .15, .45},
	{.46, .35, -.45, .5, .5, .45},
	{.46, -.5, -.5, .5, .5, -.45},
	{.46, -.5, .45, .5, .5, .5},
	{-.5, -.35, -.45, -.46, -.20, .45},
	{-.5, 0, -.45, -.46, .15, .45},
	{-.5, .35, -.45, -.46, .5, .45},
	{-.5, -.5, -.5, -.46, .5, -.45},
	{-.5, -.5, .45, -.46, .5, .5}
		}
	},
	is_ground_content = false,
})

core.register_craft({
	output = "decor:small_table",
	recipe = {
		{"", "stairs:slab_wood", ""},
		{"", "default:stick", ""}
	}
})

core.register_craft({
	output = "decor:small_table",
	recipe = {
		{"", "moreblocks:slab_wood", ""},
		{"", "default:stick", ""}
	}
})

core.register_craft({
	output = "decor:bench",
	recipe = {
		{"", "group:wood", ""},
		{"default:stick", "", "default:stick"}
	}
})

core.register_craft({
	output = "decor:shelf_open",
	recipe = {
		{"default:stick", "group:wood", "default:stick"},
		{"default:stick", "group:wood", "default:stick"},
		{"default:stick", "", "default:stick"}
	}
})

core.register_craft({
	output = "decor:wagon_wheel 3",
	recipe = {
		{"default:iron_lump", "default:stick", "default:iron_lump" },
		{"default:stick", "default:steel_ingot", "default:stick" },
		{"default:iron_lump", "default:stick", "default:iron_lump" }
	}
})

core.register_craft({
	output = "decor:wood_flat 16",
	recipe = {
		{"default:stick", "fabric:string","default:stick"},
		{"default:stick", "", "default:stick"}
	}
})

core.register_craft({
	output = "decor:fence_small 3",
	recipe = {{"default:fence_wood", "default:fence_wood"}}
})

-- xfences can be configured to replace normal fences - which makes them uncraftable
if core.get_modpath("xfences") then
core.register_craft({
	output = "decor:fence_small 3",
	recipe = {{"xfences:fence", "xfences:fence"}}
})
end

core.register_craft({
	output = "decor:fence_corner",
	recipe = {{"decor:fence_small", "decor:fence_small"}}
})

core.register_craft({
	output = "decor:fence_small 2",
	recipe = {{"decor:fence_corner"}}
})

core.register_craft({
	output = "decor:fence_end",
	recipe = {{"decor:fence_small", "decor:fence_small", "decor:fence_small"}}
})

core.register_craft({
	output = "decor:fence_small 3",
	recipe = {{"decor:fence_end"}}
})
