
-- White oak tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "white_oak:leaves"}
local M = {name = "white_oak:leaves", prob = 126}
local T = {name = "white_oak:trunk", force_place = true}

white_oak_tree = {size = {x=5, y=8, z=5}, data = {
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,L,_,_,
_,L,L,L,_,
_,L,L,L,_,
_,_,L,L,_,
_,_,_,_,_,

_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,L,L,L,_,
L,L,L,L,L,
L,L,L,L,L,
_,L,L,L,_,
_,L,L,L,_,

_,_,T,_,_,
_,_,T,_,_,
_,_,T,_,_,
L,L,T,L,L,
L,L,T,L,L,
L,L,T,L,L,
L,L,L,L,L,
_,L,L,L,_,

_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,L,L,L,_,
L,L,L,L,L,
L,L,L,L,L,
L,L,L,L,L,
_,L,L,_,_,

_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,L,_,_,
_,L,L,L,_,
_,L,L,L,_,
_,L,L,_,_,
_,_,_,_,_}}

white_oak_tree2 = {size = {x=13, y=16, z=13}, data = {
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,M,M,_,_,_,M,M,_,_,_,
_,_,M,M,M,M,_,M,M,M,M,_,_,
_,_,_,_,M,M,M,M,M,_,_,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,M,M,_,_,_,M,M,_,_,_,
_,M,L,L,L,M,_,M,L,L,L,M,_,
_,M,L,L,L,L,M,L,L,L,L,M,_,
_,_,M,L,L,L,L,L,L,L,M,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,
_,_,_,_,M,M,_,M,M,_,_,_,_,
_,_,_,M,M,M,M,M,M,M,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,M,L,L,L,_,L,L,L,M,_,_,
_,L,L,L,L,L,L,L,L,L,L,L,_,
M,L,L,L,L,L,L,L,L,L,L,L,M,
_,M,L,L,L,L,L,L,L,L,L,M,_,
_,_,_,M,L,L,L,L,L,M,_,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,M,L,L,L,M,L,L,L,M,_,_,
_,_,M,L,L,L,L,L,L,L,M,_,_,
_,_,_,M,M,M,_,M,M,M,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,M,L,L,L,L,L,L,L,L,L,M,_,
M,L,L,T,L,L,L,L,L,T,L,L,M,
M,L,L,L,L,L,L,L,L,L,L,L,M,
_,L,L,L,L,L,T,L,L,L,L,L,_,
_,_,M,L,L,L,L,L,L,L,M,_,_,
_,_,_,M,L,L,L,L,L,M,_,_,_,
_,_,L,L,L,L,L,L,L,L,L,_,_,
_,M,L,L,L,L,L,L,L,L,L,M,_,
_,_,M,L,L,L,L,L,L,L,M,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,M,L,L,T,L,L,L,T,L,L,M,_,
M,L,L,L,L,L,L,L,L,L,L,L,M,
M,L,L,L,L,L,_,L,L,L,L,L,M,
M,L,L,L,L,L,T,L,L,L,L,L,M,
_,M,L,L,L,L,L,L,L,L,L,M,_,
_,_,M,L,L,L,L,L,L,L,M,_,_,
_,M,L,L,T,L,L,L,T,L,L,M,_,
_,M,L,L,L,L,L,L,L,L,L,M,_,
_,_,M,L,L,L,L,L,L,L,M,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,L,L,L,T,_,T,L,L,L,_,_,
_,M,L,L,L,L,L,L,L,L,L,M,_,
M,L,L,L,L,_,_,_,L,L,L,L,M,
M,L,L,L,L,L,T,L,L,L,L,L,M,
M,L,L,L,L,L,L,L,L,L,L,L,M,
_,M,L,L,L,_,_,_,L,L,L,M,_,
_,M,L,L,L,T,L,T,L,L,L,M,_,
_,M,L,L,L,L,L,L,L,L,L,M,_,
_,_,M,L,L,L,L,L,L,L,M,_,_,
_,_,_,M,L,L,L,L,L,M,_,_,_,
_,_,_,_,M,M,L,M,M,_,_,_,_,

_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,_,_,_,T,_,_,_,_,_,_,
_,_,_,L,L,_,T,_,L,L,_,_,_,
_,_,L,L,L,L,T,L,L,L,L,_,_,
_,M,L,L,_,_,T,_,_,L,L,M,_,
M,L,L,T,T,T,T,T,T,T,L,L,M,
M,L,L,L,L,L,T,L,L,L,L,L,M,
_,M,L,L,L,_,T,_,L,L,L,M,_,
_,_,M,L,L,L,T,L,L,L,M,_,_,
_,M,L,L,L,L,T,L,L,L,L,M,_,
_,_,_,L,L,L,T,L,L,L,_,_,_,
_,_,_,M,L,L,L,L,L,M,_,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,L,L,L,T,_,T,L,L,L,_,_,
_,M,L,L,L,L,L,L,L,L,L,M,_,
M,L,L,L,L,_,_,_,L,L,L,L,M,
M,L,L,L,L,L,T,L,L,L,L,L,M,
M,L,L,L,L,L,L,L,L,L,L,L,M,
_,M,L,L,L,_,_,_,L,L,L,M,_,
_,M,L,L,L,T,L,T,L,L,L,M,_,
_,M,L,L,L,L,L,L,L,L,L,M,_,
_,_,M,L,L,L,L,L,L,L,M,_,_,
_,_,_,M,L,L,L,L,L,M,_,_,_,
_,_,_,_,M,M,L,M,M,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,M,L,L,T,L,L,L,T,L,L,M,_,
M,L,L,L,L,L,L,L,L,L,L,L,M,
M,L,L,L,L,L,_,L,L,L,L,L,M,
M,L,L,L,L,L,T,L,L,L,L,L,M,
_,M,L,L,L,L,L,L,L,L,L,M,_,
_,_,M,L,L,L,L,L,L,L,M,_,_,
_,M,L,L,T,L,L,L,T,L,L,M,_,
_,M,L,L,L,L,L,L,L,L,L,M,_,
_,_,M,L,L,L,L,L,L,L,M,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,M,L,L,L,L,L,L,L,L,L,M,_,
M,L,L,T,L,L,L,L,L,T,L,L,M,
M,L,L,L,L,L,L,L,L,L,L,L,M,
_,L,L,L,L,L,T,L,L,L,L,L,_,
_,_,M,L,L,L,L,L,L,L,M,_,_,
_,_,_,M,L,L,L,L,L,M,_,_,_,
_,_,L,L,L,L,L,L,L,L,L,_,_,
_,M,L,L,L,L,L,L,L,L,L,M,_,
_,_,M,L,L,L,L,L,L,L,M,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,M,L,L,L,_,L,L,L,M,_,_,
_,L,L,L,L,L,L,L,L,L,L,L,_,
M,L,L,L,L,L,L,L,L,L,L,L,M,
_,M,L,L,L,L,L,L,L,L,L,M,_,
_,_,_,M,L,L,L,L,L,M,_,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,M,L,L,L,M,L,L,L,M,_,_,
_,_,M,L,L,L,L,L,L,L,M,_,_,
_,_,_,M,M,M,_,M,M,M,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,M,M,_,_,_,M,M,_,_,_,
_,M,L,L,L,M,_,M,L,L,L,M,_,
_,M,L,L,L,L,M,L,L,L,L,M,_,
_,_,M,L,L,L,L,L,L,L,M,_,_,
_,_,_,_,M,L,L,L,M,_,_,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,
_,_,_,_,M,M,_,M,M,_,_,_,_,
_,_,_,M,M,M,M,M,M,M,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,M,M,_,_,_,M,M,_,_,_,
_,_,M,M,M,M,_,M,M,M,M,_,_,
_,_,_,_,M,M,M,M,M,_,_,_,_,
_,_,_,_,_,M,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=223}}}

local function grow_white_oak_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	if on_compost(pos) then
		if not enough_height(pos, 12) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 6, 1, 6, white_oak_tree2, "0")
		return
	end
	add_tree(pos, 2, 1, 2, white_oak_tree)
end

-- Decoration

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
	core.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0005,
			scale = 0.0002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 62,
		schematic = white_oak_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",-- if small
	})
end

-- Nodes

core.register_node("white_oak:sapling", {
	description = S("White Oak Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"white_oak_sapling.png"},
	inventory_image = "white_oak_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_white_oak_tree,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -0.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(600, 3000))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"white_oak:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -6, y = 1, z = -6},
			{x = 6, y = 5, z = 6},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 4,
})

core.register_node("white_oak:trunk", {
	description = S("White Oak Trunk"),
	tiles = {"white_oak_trunk_top.png", "white_oak_trunk_top.png", "white_oak_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 1, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("white_oak:wood", {
	description = S("White Oak Wood"),
	tiles = {"white_oak_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("white_oak:leaves", {
	description = S("White Oak Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"white_oak_leaves.png"},
	inventory_image = leaf_image("white_oak_leaves.png"),
	wield_image = leaf_image("white_oak_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"white_oak:sapling"}, rarity = 20},
			{items = {"white_oak:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Recipes

core.register_craft({
	output = "white_oak:wood 4",
	recipe = {{"white_oak:trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "white_oak:trunk",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "white_oak:wood",
	burntime = 9,
})


core.register_lbm({
	name = "white_oak:convert_white_oak_saplings_to_node_timer",
	nodenames = {"white_oak:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"white_oak:trunk"},
	leaves = {"white_oak:leaves"},
	radius = 3,
})

doors.register_fencegate("white_oak:wood_gate", {
	description = S("White Oak Wood Fence Gate"),
	texture = "white_oak_wood.png",
	material = "white_oak:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2}
})

default.register_fence("white_oak:wood_fence", {
	description = S("White Oak Wood Fence"),
	texture = "white_oak_fence.png",
	material = "white_oak:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("white_oak_wood", "white_oak:wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"white_oak_wood.png"},
	S("White Oak Wood Stair"),
	S("White Oak Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"white_oak:sapling", grow_white_oak_tree, "soil"},
	})
end
