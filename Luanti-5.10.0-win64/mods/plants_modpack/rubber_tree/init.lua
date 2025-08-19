
-- Rubber tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "rubber_tree:leaves"}
local M = {name = "rubber_tree:leaves", prob = 128}
local T = {name = "rubber_tree:trunk", force_place = true}

rubber_tree = {size = {x = 12, y = 15, z = 12}, data = {
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,_,_,_,L,_,_,
_,_,_,_,L,_,_,_,_,L,_,_,
_,_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,_,_,L,L,_,_,
_,_,_,L,L,L,_,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,L,L,_,
_,_,_,L,_,L,L,L,M,_,_,_,
_,_,_,L,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,_,_,L,_,_,_,
_,_,L,L,L,L,L,L,L,L,L,_,
_,_,L,L,T,L,L,L,L,T,L,L,
_,L,L,L,L,L,L,L,L,L,L,L,
_,L,L,L,L,L,T,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,M,_,_,_,
_,_,L,L,L,M,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,T,L,_,L,T,L,L,_,
_,L,L,L,L,_,_,_,L,L,L,_,
_,L,L,L,L,_,T,_,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,L,_,
_,L,L,T,L,L,L,L,L,L,M,_,
_,L,L,L,L,L,L,L,L,M,_,_,
_,_,L,L,L,L,L,L,L,_,_,_,
_,_,_,L,_,_,L,L,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,L,_,_,_,_,_,
_,_,_,L,L,L,L,L,L,_,_,_,
_,L,L,L,L,T,_,T,L,L,_,_,
L,L,T,L,L,_,_,_,L,L,_,_,
L,L,L,L,L,_,T,_,_,L,_,_,
_,L,L,L,T,_,L,_,L,L,L,_,
_,L,L,L,L,_,L,T,L,L,L,_,
_,_,L,L,L,L,L,T,L,L,L,_,
_,_,L,L,L,L,L,L,L,L,_,_,
_,_,_,_,_,M,L,L,L,_,_,_,
_,_,_,_,_,_,_,L,_,_,_,_,

_,_,_,_,_,T,T,_,_,_,_,_,
_,_,_,_,_,T,T,_,_,_,_,_,
_,_,_,_,_,T,T,_,_,_,_,_,
_,_,_,_,_,T,T,_,_,_,_,_,
_,_,_,_,L,T,T,L,_,_,_,_,
_,_,L,L,L,T,T,L,L,_,_,_,
_,_,L,T,T,T,T,_,L,L,_,_,
_,L,L,L,_,T,T,_,_,L,_,_,
_,L,L,L,_,T,T,T,T,L,L,_,
_,L,L,L,_,_,T,L,L,T,L,L,
_,L,L,L,_,_,_,L,L,L,L,L,
_,L,L,L,L,L,L,L,L,L,L,_,
_,_,M,L,L,L,L,L,L,L,_,_,
_,_,_,_,M,L,L,L,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,T,T,_,_,_,_,_,
_,_,_,_,_,T,T,_,_,_,_,_,
_,_,_,_,_,T,T,_,_,_,_,_,
_,_,_,_,_,T,T,_,_,_,_,_,
_,_,_,_,L,T,T,L,_,_,_,_,
_,_,_,L,L,T,T,L,L,L,_,_,
_,_,L,L,_,T,T,T,T,L,_,_,
_,_,L,_,_,T,T,_,L,L,L,_,
_,L,L,T,T,T,T,_,L,L,L,_,
L,L,T,L,L,T,_,_,L,L,L,_,
L,L,L,L,L,_,_,_,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,M,_,_,
_,_,_,L,L,L,L,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,L,_,_,_,_,_,
_,_,_,L,L,L,L,L,L,_,_,_,
_,_,L,L,T,_,T,L,L,L,L,_,
_,_,L,L,_,_,_,L,L,T,L,L,
_,_,L,_,_,T,_,L,L,L,L,L,
_,L,L,L,_,L,_,T,L,L,L,_,
_,L,L,L,T,L,_,L,L,L,L,_,
_,L,L,L,T,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,M,_,_,_,_,_,
_,_,_,_,L,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,L,L,_,_,_,
_,L,L,T,L,_,L,T,L,L,_,_,
_,L,L,L,_,_,_,L,L,L,L,_,
_,L,L,L,_,T,_,L,L,L,L,_,
_,L,L,L,L,L,L,L,L,L,L,_,
_,M,L,L,L,L,L,L,T,L,L,_,
_,_,M,L,L,L,L,L,L,L,L,_,
_,_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,_,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,_,_,_,L,_,_,_,_,
_,L,L,L,L,L,L,L,L,L,_,_,
L,L,T,L,L,L,L,T,L,L,_,_,
L,L,L,L,L,L,L,L,L,L,L,_,
_,L,L,L,L,T,L,L,L,L,L,_,
_,_,L,L,L,L,L,L,L,L,_,_,
_,_,_,M,L,L,L,L,L,L,_,_,
_,_,_,_,L,L,M,L,L,L,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,L,L,_,_,_,L,_,_,_,_,
_,L,L,L,L,_,L,L,L,_,_,_,
_,L,L,L,L,L,L,L,L,L,_,_,
_,L,L,L,L,L,L,L,L,L,_,_,
_,_,_,M,L,L,L,_,L,_,_,_,
_,_,_,_,L,L,L,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,L,_,_,_,_,L,_,_,_,_,
_,_,L,_,_,_,_,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=1, prob=223}}}

local function grow_rubber_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 5, 1, 5, rubber_tree)
end

-- Decoration

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
	core.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.0005,
			scale = 0.00005,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"rainforest"},
		y_min = 1,
		y_max = 32,
		schematic = rubber_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

-- Nodes

core.register_node("rubber_tree:sapling", {
	description = S("Rubber Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"rubber_tree_sapling.png"},
	inventory_image = "rubber_tree_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_rubber_tree,
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
			"rubber_tree:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 11, z = 5},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 10,
})

core.register_node("rubber_tree:trunk", {
	description = S("Rubber Tree Trunk"),
	tiles = {"rubber_tree_trunk_top.png", "rubber_tree_trunk_top.png", "rubber_tree_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("rubber_tree:trunk_empty", {
	description = S("Rubber Tree Trunk (Empty)"),
	tiles = {"rubber_tree_trunk_top.png", "rubber_tree_trunk_top.png",
		"rubber_tree_trunk_empty.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	on_timer = function(pos, elapsed)
		if not core.find_node_near(pos, 5, "rubber_tree:leaves") then
			core.get_node_timer(pos):start(200)
		else
			core.set_node(pos, {name = "rubber_tree:trunk"})
		end
	end,
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("rubber_tree:wood", {
	description = S("Rubber Tree Wood"),
	tiles = {"rubber_tree_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("rubber_tree:leaves", {
	description = S("Rubber Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"rubber_tree_leaves.png"},
	inventory_image = leaf_image("rubber_tree_leaves.png"),
	wield_image = leaf_image("rubber_tree_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"rubber_tree:sapling"}, rarity = 20},
			{items = {"rubber_tree:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Recipes

core.register_craft({
	output = "rubber_tree:wood 4",
	recipe = {{"rubber_tree:trunk"}}
})

core.register_craft({
	output = "rubber_tree:wood 4",
	recipe = {{"rubber_tree:trunk_empty"}}
})


core.register_craft({
	type = "fuel",
	recipe = "rubber_tree:trunk",
	burntime = 20,
})

core.register_craft({
	type = "fuel",
	recipe = "rubber_tree:wood",
	burntime = 7,
})

core.register_craft({
	type = "fuel",
	recipe = "rubber_tree:sapling",
	burntime = 10,
})


core.register_lbm({
	name = "rubber_tree:convert_rubber_tree_saplings_to_node_timer",
	nodenames = {"rubber_tree:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"rubber_tree:trunk"},
	leaves = {"rubber_tree:leaves"},
	radius = 3,
})

doors.register_fencegate("rubber_tree:wood_gate", {
	description = S("Rubber Tree Wood Fence Gate"),
	texture = "rubber_tree_wood.png",
	material = "rubber_tree:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

default.register_fence("rubber_tree:wood_fence", {
	description = S("Rubber Tree Wood Fence"),
	texture = "rubber_tree_fence.png",
	material = "rubber_tree:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("rubber_tree_wood", "rubber_tree:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"rubber_tree_wood.png"},
	S("Rubber Tree Wood Stair"),
	S("Rubber Tree Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"rubber_tree:sapling", grow_rubber_tree, "soil"},
	})
end
