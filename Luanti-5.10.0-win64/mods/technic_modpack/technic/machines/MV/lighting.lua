-- NOTE: The code is takes directly from VanessaE's homedecor mod.
-- I just made it the lights into indictive appliances for this mod.

-- This file supplies electric powered glowlights

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if (core.get_modpath("intllib")) then
	dofile(core.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(core.get_current_modname())
else
	S = function (s) return s end
end

function technic_homedecor_node_is_owned(pos, placer)
	local ownername = false
	if type(IsPlayerNodeOwner) == "function" then -- node_ownership mod
		if HasOwner(pos, placer) then
			if not IsPlayerNodeOwner(pos, placer:get_player_name()) then
				if type(getLastOwner) == "function" then -- ...is an old version
					ownername = getLastOwner(pos)
				elseif type(GetNodeOwnerName) == "function" then -- ...is a recent version
					ownername = GetNodeOwnerName(pos)
				else
					ownername = S("someone")
				end
			end
		end

	elseif type(isprotect) == "function" then -- glomie's protection mod
		if not isprotect(5, pos, placer) then
			ownername = S("someone")
		end
	elseif type(protector) == "table" and type(protector.can_dig) == "function" then -- Zeg9's protection mod
		if not protector.can_dig(5, pos, placer) then
			ownername = S("someone")
		end
	end

	if ownername ~= false then
		core.chat_send_player(placer:get_player_name(), S("Sorry, %s owns that spot."):format(ownername) )
		return true
	else
		return false
	end
end

local dirs1 = {20, 23, 22, 21}
local dirs2 = {9,  18,  7, 12}

local technic_homedecor_rotate_and_place = function(itemstack, placer, pointd)
	if not technic_homedecor_node_is_owned(pointd.under, placer)
	   and not technic_homedecor_node_is_owned(pointd.above, placer) then
		local node = core.get_node(pointd.under)
		if not core.registered_nodes[node.name] or not core.registered_nodes[node.name].on_rightclick then

			local above = pointd.above
			local under = pointd.under
			local pitch = placer:get_look_pitch()
			local pname = core.get_node(under).name
			local node = core.get_node(above)
			local fdir = core.dir_to_facedir(placer:get_look_dir())
			local wield_name = itemstack:get_name()

			if not core.registered_nodes[pname]
			    or not core.registered_nodes[pname].on_rightclick then

				local iswall = (above.x ~= under.x) or (above.z ~= under.z)
				local isceiling = (above.x == under.x) and (above.z == under.z) and (pitch > 0)
				local pos1 = above

				if core.registered_nodes[pname]["buildable_to"] then
					pos1 = under
					iswall = false
				end

				if not core.registered_nodes[core.get_node(pos1).name]["buildable_to"] then return end

				if iswall then
					core.add_node(pos1, {name = wield_name, param2 = dirs2[fdir+1] }) -- place wall variant
				elseif isceiling then
					core.add_node(pos1, {name = wield_name, param2 = 20 }) -- place upside down variant
				else
					core.add_node(pos1, {name = wield_name, param2 = 0 }) -- place right side up
				end

				if not homedecor_expect_infinite_stacks then
					itemstack:take_item()
					return itemstack
				end
			end
		else
			core.registered_nodes[node.name].on_rightclick(pointd.under, node, placer, itemstack)
		end
	end
end

-- Yellow -- Half node
core.register_node('technic:homedecor_glowlight_half_yellow', {
	description = S("Yellow Glowlight (thick)"),
	drawtype = "nodebox",
	tiles = {'technic_homedecor_glowlight_yellow_tb.png',
		'technic_homedecor_glowlight_yellow_tb.png', 'technic_homedecor_glowlight_thick_yellow_sides.png'},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = {snappy = 3},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointd)
		technic_homedecor_rotate_and_place(itemstack, placer, pointd)
		return itemstack
	end,
	on_construct = function(pos)
		technic.inductive_on_construct(pos, 100, "Yellow Glowlight (thick)")
	end,
	on_punch = function(pos, node, puncher)
		technic.inductive_on_punch_off(pos, 100, "technic:homedecor_glowlight_half_yellow_active")
	end
})

core.register_node('technic:homedecor_glowlight_half_yellow_active', {
	description = S("Yellow Glowlight (thick)"),
	drawtype = "nodebox",
	tiles = {'technic_homedecor_glowlight_yellow_tb.png',
		'technic_homedecor_glowlight_yellow_tb.png', 'technic_homedecor_glowlight_thick_yellow_sides.png'},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	light_source = LIGHT_MAX,
	groups = { snappy = 3, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	drop="technic:homedecor_glowlight_half_yellow",
	on_place = function(itemstack, placer, pointd)
		technic_homedecor_rotate_and_place(itemstack, placer, pointd)
		return itemstack
	end,
	on_construct = function(pos)
		technic.inductive_on_construct(pos, 100, "Yellow Glowlight (thick)")
	end,
	on_punch = function(pos, node, puncher)
		technic.inductive_on_punch_on(pos, 0, "technic:homedecor_glowlight_half_yellow")
	end
})

-- Yellow -- Quarter node
core.register_node('technic:homedecor_glowlight_quarter_yellow', {
	description = S("Yellow Glowlight (thin)"),
	drawtype = "nodebox",
	tiles = {'technic_homedecor_glowlight_yellow_tb.png',
		'technic_homedecor_glowlight_yellow_tb.png', 'technic_homedecor_glowlight_thin_yellow_sides.png'},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.25, .5}
	},
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.25, .5}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointd)
		technic_homedecor_rotate_and_place(itemstack, placer, pointd)
		return itemstack
	end,
	on_construct = function(pos)
		technic.inductive_on_construct(pos, 100, "Yellow Glowlight (thin)")
	end,
	on_punch = function(pos, node, puncher)
		technic.inductive_on_punch_off(pos, 100, "technic:homedecor_glowlight_quarter_yellow_active")
	end
})

core.register_node('technic:homedecor_glowlight_quarter_yellow_active', {
	description = S("Yellow Glowlight (thin)"),
	drawtype = "nodebox",
	tiles = {'technic_homedecor_glowlight_yellow_tb.png',
		'technic_homedecor_glowlight_yellow_tb.png', 'technic_homedecor_glowlight_thin_yellow_sides.png'},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.25, .5}
	},
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.25, .5}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	light_source = LIGHT_MAX-1,
	groups = { snappy = 3, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	drop="technic:homedecor_glowlight_quarter_yellow",
	on_place = function(itemstack, placer, pointd)
		technic_homedecor_rotate_and_place(itemstack, placer, pointd)
		return itemstack
	end,
	on_construct = function(pos)
		technic.inductive_on_construct(pos, 100, "Yellow Glowlight (thin)")
	end,
	on_punch = function(pos, node, puncher)
		technic.inductive_on_punch_on(pos, 0, "technic:homedecor_glowlight_quarter_yellow")
	end
})


-- White -- half node
core.register_node('technic:homedecor_glowlight_half_white', {
	description = S("White Glowlight (thick)"),
	drawtype = "nodebox",
	tiles = {'technic_homedecor_glowlight_white_tb.png',
		'technic_homedecor_glowlight_white_tb.png', 'technic_homedecor_glowlight_thick_white_sides.png'},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointd)
		technic_homedecor_rotate_and_place(itemstack, placer, pointd)
		return itemstack
	end,
	on_construct = function(pos)
		technic.inductive_on_construct(pos, 100, "White Glowlight (thick)")
	end,
	on_punch = function(pos, node, puncher)
		technic.inductive_on_punch_off(pos, 100, "technic:homedecor_glowlight_half_white_active")
	end
})

core.register_node('technic:homedecor_glowlight_half_white_active', {
	description = S("White Glowlight (thick)"),
	drawtype = "nodebox",
	tiles = {'technic_homedecor_glowlight_white_tb.png',
		'technic_homedecor_glowlight_white_tb.png', 'technic_homedecor_glowlight_thick_white_sides.png'},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	light_source = LIGHT_MAX,
	groups = { snappy = 3, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	drop="technic:homedecor_glowlight_half_white",
	on_place = function(itemstack, placer, pointd)
		technic_homedecor_rotate_and_place(itemstack, placer, pointd)
		return itemstack
	end,
	on_construct = function(pos)
		technic.inductive_on_construct(pos, 100, "White Glowlight (thick)")
	end,
	on_punch = function(pos, node, puncher)
		technic.inductive_on_punch_on(pos, 0, "technic:homedecor_glowlight_half_white")
	end
})

-- White -- Quarter node
core.register_node('technic:homedecor_glowlight_quarter_white', {
	description = S("White Glowlight (thin)"),
	drawtype = "nodebox",
	tiles = {'technic_homedecor_glowlight_white_tb.png',
		'technic_homedecor_glowlight_white_tb.png', 'technic_homedecor_glowlight_thin_white_sides.png'},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.25, .5}
	},
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.25, .5}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointd)
		technic_homedecor_rotate_and_place(itemstack, placer, pointd)
		return itemstack
	end,
	on_construct = function(pos)
		technic.inductive_on_construct(pos, 100, "White Glowlight (thin)")
	end,
	on_punch = function(pos, node, puncher)
		technic.inductive_on_punch_off(pos, 100, "technic:homedecor_glowlight_quarter_white_active")
	end
})

core.register_node('technic:homedecor_glowlight_quarter_white_active', {
	description = S("White Glowlight (thin)"),
	drawtype = "nodebox",
	tiles = {'technic_homedecor_glowlight_white_tb.png',
		'technic_homedecor_glowlight_white_tb.png', 'technic_homedecor_glowlight_thin_white_sides.png'},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.25, .5}
	},
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.25, .5}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	light_source = LIGHT_MAX-1,
	groups = { snappy = 3, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	drop="technic:homedecor_glowlight_quarter_white",
	on_place = function(itemstack, placer, pointd)
		technic_homedecor_rotate_and_place(itemstack, placer, pointd)
		return itemstack
	end,
	on_construct = function(pos)
		technic.inductive_on_construct(pos, 100, "White Glowlight (thin)")
	end,
	on_punch = function(pos, node, puncher)
		technic.inductive_on_punch_on(pos, 0, "technic:homedecor_glowlight_quarter_white")
	end
})

-- Glowlight "cubes" - yellow
core.register_node('technic:homedecor_glowlight_small_cube_yellow', {
	description = S("Yellow Glowlight (small cube)"),
	drawtype = "nodebox",
	tiles = {'technic_homedecor_glowlight_cube_yellow_tb.png',
		'technic_homedecor_glowlight_cube_yellow_tb.png', 'technic_homedecor_glowlight_cube_yellow_sides.png'},
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, 0, .25}
	},
	node_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, 0, .25}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointd)
		technic_homedecor_rotate_and_place(itemstack, placer, pointd)
		return itemstack
	end,
	on_construct = function(pos)
		technic.inductive_on_construct(pos, 50, "Yellow Glowlight (small cube)")
	end,
	on_punch = function(pos, node, puncher)
		technic.inductive_on_punch_off(pos, 50, "technic:homedecor_glowlight_small_cube_yellow_active")
	end
})

core.register_node('technic:homedecor_glowlight_small_cube_yellow_active', {
	description = S("Yellow Glowlight (small cube)"),
	drawtype = "nodebox",
	tiles = {'technic_homedecor_glowlight_cube_yellow_tb.png',
		'technic_homedecor_glowlight_cube_yellow_tb.png', 'technic_homedecor_glowlight_cube_yellow_sides.png'},
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, 0, .25}
	},
	node_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, 0, .25}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	light_source = LIGHT_MAX-1,
	groups = { snappy = 3, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	drop="technic:homedecor_glowlight_small_cube_yellow",
	on_place = function(itemstack, placer, pointd)
		technic_homedecor_rotate_and_place(itemstack, placer, pointd)
		return itemstack
	end,
	on_construct = function(pos)
		technic.inductive_on_construct(pos, 50, "Yellow Glowlight (small cube)")
	end,
	on_punch = function(pos, node, puncher)
		technic.inductive_on_punch_on(pos, 0, "technic:homedecor_glowlight_small_cube_yellow")
	end
})

-- Glowlight "cubes" - white
core.register_node('technic:homedecor_glowlight_small_cube_white', {
	description = S("White Glowlight (small cube)"),
	drawtype = "nodebox",
	tiles = {'technic_homedecor_glowlight_cube_white_tb.png',
		'technic_homedecor_glowlight_cube_white_tb.png', 'technic_homedecor_glowlight_cube_white_sides.png'},
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, 0, .25}
	},
	node_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, 0, .25}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointd)
		technic_homedecor_rotate_and_place(itemstack, placer, pointd)
		return itemstack
	end,
	on_construct = function(pos)
		technic.inductive_on_construct(pos, 50, "White Glowlight (small cube)")
	end,
	on_punch = function(pos, node, puncher)
		technic.inductive_on_punch_off(pos, 50, "technic:homedecor_glowlight_small_cube_white_active")
	end
})

core.register_node('technic:homedecor_glowlight_small_cube_white_active', {
	description = S("White Glowlight (small cube)"),
	drawtype = "nodebox",
	tiles = {'technic_homedecor_glowlight_cube_white_tb.png',
		'technic_homedecor_glowlight_cube_white_tb.png', 'technic_homedecor_glowlight_cube_white_sides.png'},
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, 0, .25}
	},
	node_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, 0, .25}
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	light_source = LIGHT_MAX-1,
	groups = { snappy = 3, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	drop="technic:homedecor_glowlight_small_cube_white",
	on_place = function(itemstack, placer, pointd)
		technic_homedecor_rotate_and_place(itemstack, placer, pointd)
		return itemstack
	end,
	on_construct = function(pos)
		technic.inductive_on_construct(pos, 50, "White Glowlight (small cube)")
	end,
	on_punch = function(pos, node, puncher)
		technic.inductive_on_punch_on(pos, 0, "technic:homedecor_glowlight_small_cube_white")
	end
})

technic.register_inductive_machine("technic:homedecor_glowlight_half_yellow")
technic.register_inductive_machine("technic:homedecor_glowlight_half_white")
technic.register_inductive_machine("technic:homedecor_glowlight_quarter_yellow")
technic.register_inductive_machine("technic:homedecor_glowlight_quarter_white")
technic.register_inductive_machine("technic:homedecor_glowlight_small_cube_yellow")
technic.register_inductive_machine("technic:homedecor_glowlight_small_cube_white")
