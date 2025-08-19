
-- Ginkgo tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "ginkgo:leaves"}
local M = {name = "ginkgo:leaves", prob = 128}
local T = {name = "ginkgo:trunk", force_place = true}

ginkgo_tree = {size = {x=9, y=12, z=9}, data = {
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,_,_,_,
_,_,_,M,L,M,_,_,_,
_,_,_,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,M,L,M,_,_,_,
_,_,_,L,L,L,_,_,_,
_,_,M,L,L,L,M,_,_,
_,_,L,L,L,L,L,_,_,
_,M,L,L,L,L,L,M,_,
_,_,M,_,L,_,M,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,_,_,_,
_,_,L,L,T,L,L,_,_,
_,M,L,L,L,L,L,M,_,
_,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,_,
_,M,L,L,L,L,L,M,_,
_,_,M,_,L,_,M,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,M,L,_,T,_,L,M,_,
_,L,L,L,L,L,L,L,_,
M,L,L,L,L,L,L,L,M,
_,L,L,T,L,T,L,L,_,
_,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,_,_,
_,_,_,L,L,L,_,_,_,
_,_,_,_,L,_,_,_,_,

_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,L,L,T,T,T,L,L,_,
L,L,T,L,T,L,T,L,L,
L,L,L,L,T,L,L,L,L,
L,L,L,L,T,L,L,L,L,
_,L,L,L,T,L,L,L,_,
_,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,_,_,
_,_,_,L,L,L,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,M,L,_,T,_,L,M,_,
_,L,L,L,L,L,L,L,_,
M,L,L,L,L,L,L,L,M,
_,L,L,T,L,T,L,L,_,
_,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,_,_,
_,_,_,L,L,L,_,_,_,
_,_,_,_,L,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,_,_,_,
_,_,L,L,T,L,L,_,_,
_,M,L,L,L,L,L,M,_,
_,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,_,
_,M,L,L,L,L,L,M,_,
_,_,M,_,L,_,M,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,M,L,M,_,_,_,
_,_,_,L,L,L,_,_,_,
_,_,M,L,L,L,M,_,_,
_,_,L,L,L,L,L,_,_,
_,M,L,L,L,L,L,M,_,
_,_,M,_,L,_,M,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,_,_,_,
_,_,_,M,L,M,_,_,_,
_,_,_,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=1, prob=223}}}

local function grow_ginkgo_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 4, 1, 4, ginkgo_tree, "0")
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
			scale = 0.00005,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 32,
		schematic = ginkgo_tree,
		flags = "place_center_x, place_center_z",
	})
end

-- Nodes

core.register_node("ginkgo:sapling", {
	description = S("Ginkgo Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"ginkgo_sapling.png"},
	inventory_image = "ginkgo_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_ginkgo_tree,
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
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"ginkgo:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 8, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 7,
})

core.register_node("ginkgo:trunk", {
	description = S("Ginkgo Trunk"),
	tiles = {"ginkgo_trunk_top.png", "ginkgo_trunk_top.png", "ginkgo_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("ginkgo:wood", {
	description = S("Ginkgo Wood"),
	tiles = {"ginkgo_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("ginkgo:leaves", {
	description = S("Ginkgo Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"ginkgo_leaves.png"},
	inventory_image = leaf_image("ginkgo_leaves.png"),
	wield_image = leaf_image("ginkgo_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"ginkgo:sapling"}, rarity = 20},
			{items = {"ginkgo:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Recipes

core.register_craft({
	output = "ginkgo:wood 4",
	recipe = {{"ginkgo:trunk"}}
})


core.register_craft({
	type = "fuel",
	recipe = "ginkgo:trunk",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "ginkgo:wood",
	burntime = 7,
})


core.register_lbm({
	name = "ginkgo:convert_ginkgo_saplings_to_node_timer",
	nodenames = {"ginkgo:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"ginkgo:trunk"},
	leaves = {"ginkgo:leaves"},
	radius = 3,
})

doors.register_fencegate("ginkgo:wood_gate", {
	description = S("Ginkgo Wood Fence Gate"),
	texture = "ginkgo_wood.png",
	material = "ginkgo:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

default.register_fence("ginkgo:wood_fence", {
	description = S("Ginkgo Wood Fence"),
	texture = "ginkgo_fence.png",
	material = "ginkgo:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("ginkgo_wood", "ginkgo:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"ginkgo_wood.png"},
	S("Ginkgo Wood Stair"),
	S("Ginkgo Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"ginkgo:sapling", grow_ginkgo_tree, "soil"},
	})
end
