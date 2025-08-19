
-- Sugar maple tree

-- internationalization boilerplate
local S = core.get_translator("maple")

local L = {name = "maple:leaves"}
local M = {name = "maple:leaves", prob = 223}
local T = {name = "maple:trunk", force_place = true}

maple_tree = {size = {x=7, y=15, z=7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,M,M,M,M,M,_,
M,L,L,L,L,L,M,
M,L,L,L,L,L,M,
M,L,L,L,L,L,M,
_,M,M,M,M,M,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,M,M,M,M,M,_,
M,L,L,L,L,L,M,
M,L,L,L,L,L,M,
M,L,L,L,L,L,M,
M,L,L,L,L,L,M,
M,L,L,L,L,L,M,
_,M,L,L,L,M,_,
_,_,M,M,M,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,M,M,M,T,M,_,
M,L,L,L,T,L,M,
M,L,T,L,L,L,M,
M,L,T,L,L,L,M,
M,L,L,L,L,L,M,
M,L,L,L,L,L,M,
_,M,L,L,L,M,_,
_,M,L,L,L,M,_,
_,_,M,M,M,_,_,
_,_,_,_,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,M,M,T,M,M,_,
M,L,L,T,L,L,M,
M,L,L,T,L,L,M,
M,L,L,T,L,L,M,
M,L,L,T,L,L,M,
M,L,L,T,L,L,M,
_,M,L,T,L,M,_,
_,M,L,L,L,M,_,
_,_,M,L,M,_,_,
_,_,_,M,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,M,T,M,M,M,_,
M,L,T,L,L,L,M,
M,L,L,L,T,L,M,
M,L,L,L,T,L,M,
M,L,L,L,L,L,M,
M,L,L,L,L,L,M,
_,M,L,L,L,M,_,
_,M,L,L,L,M,_,
_,_,M,M,M,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,M,M,M,M,M,_,
M,L,L,L,L,L,M,
M,L,L,L,L,L,M,
M,L,L,L,L,L,M,
M,L,L,L,L,L,M,
M,L,L,L,L,L,M,
_,M,L,L,L,M,_,
_,_,M,M,M,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,M,M,M,M,M,_,
M,L,L,L,L,L,M,
M,L,L,L,L,L,M,
M,L,L,L,L,L,M,
_,M,M,M,M,M,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=223}, {ypos=9, prob=223}, {ypos=11, prob=223}}}

local function grow_maple_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 3, 1, 3, maple_tree)
end

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
	core.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = .0007,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = .66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = maple_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

core.register_node("maple:sapling", {
	description = "Sugar Maple Tree Sapling",
	drawtype = "plantlike",
	tiles = {"maple_sapling.png"},
	inventory_image = "maple_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_maple_tree,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(600, 3000))
	end,

	on_place = function(itemstack, placer, pointd)
	print("Maple sapling placed.")
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"maple:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 13, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 10,
})

core.register_node("maple:trunk", {
	description = "Sugar Maple Trunk",
	tiles = {"maple_trunk_top.png", "maple_trunk_top.png", "maple_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("maple:wood", {
	description = "Sugar Maple Wood Planks",
	tiles = {"maple_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("maple:leaves", {
	description = "Sugar Maple Leaves",
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"maple_leaves.png"},
	special_tiles = {"maple_leaves_simple.png"},
	inventory_image = leaf_image("maple_leaves.png"),
	wield_image = leaf_image("maple_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"maple:sapling"}, rarity = 20},
			{items = {"maple:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

default.register_leafdecay({
	trunks = {"maple:trunk"},
	leaves = {"maple:leaves"},
	radius = 3,
})

core.register_craft({
	output = "maple:wood 4",
	recipe = {{"maple:trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "maple:trunk",
	burntime = 28,
})

core.register_craft({
	type = "fuel",
	recipe = "maple:sapling",
	burntime = 12,
})

doors.register_fencegate("maple:wood_gate", {
	description = S("Sugar Maple Wood Fence Gate"),
	texture = "maple_wood.png",
	material = "maple:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2}
})

default.register_fence("maple:wood_fence", {
	description = "Sugar Maple Wood Fence",
	texture = "maple_fence.png",
	inventory_image = "default_fence_overlay.png^maple_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^maple_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "maple:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

core.register_craft({
	type = "fuel",
	recipe = "maple:wood_fence",
	burntime = 8,
})

core.register_lbm({
	name = "maple:convert_saplings_to_node_timer",
	nodenames = {"maple:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(1200, 2400))
	end
})

-- integration with bonemeal
if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"maple:sapling", grow_maple_tree, "soil"},
	})
end

-- derivative blocks (stairs / microblocks / etc)
if core.get_modpath("stairs") then
	stairs.register_stair_and_slab("maple_wood", "maple:wood",
		{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		{"maple_wood.png"},
		"Sugar Maple Wood Stair",
		"Sugar Maple Wood Slab",
		default.node_sound_wood_defaults())
end
if core.global_exists("stairsplus") then
	stairsplus:register_all("maple", "maple_wood", "maple:wood", {
		description = "Sugar Maple Wood",
		tiles = {"maple_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = default.node_sound_wood_defaults(),
	})
end

-- registering the wood type with drawers mod
if core.get_modpath("drawers") and default then
	drawers.register_drawer("maple:drawerk", {
		description = "Sugar Maple",
		tiles1 = drawers.node_tiles_front_other("drawers_maple_wood_front_1.png",
			"drawers_maple_wood.png"),
		tiles2 = drawers.node_tiles_front_other("drawers_maple_wood_front_2.png",
			"drawers_maple_wood.png"),
		tiles4 = drawers.node_tiles_front_other("drawers_maple_wood_front_4.png",
			"drawers_maple_wood.png"),
		groups = {choppy = 3, oddly_breakable_by_hand = 2},
		sounds = drawers.WOOD_SOUNDS,
		drawer_stack_max_factor = 4 * 8, -- normal chest size
		material = "maple:wood"
	})
end

-- procedurally-generated arcs
if core.get_modpath("pkarcs") then
	pkarcs.register_node("maple:wood")
end
