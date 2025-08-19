
-- Elm tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local T = {name = "elm:trunk", force_place = true}
local L = {name = "elm:leaves"}
local M = {name = "elm:leaves", prob = 223}
local V = {name = "elm:leaves", prob = 191}

elm_tree = {size = {x = 11, y = 13, z = 11}, data = {
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,V,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,V,V,V,V,V,V,V,_,_,
_,_,_,M,L,L,L,M,_,_,_,
_,_,_,_,_,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,V,V,_,_,_,_,_,V,V,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,M,M,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,V,_,_,_,_,_,_,_,V,_,
_,M,L,T,_,_,_,T,L,M,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,M,M,M,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,T,_,T,_,_,_,_,
_,V,_,_,T,_,T,_,_,V,_,
_,L,L,_,_,_,_,_,L,L,_,
_,M,L,L,_,_,_,L,L,M,_,
_,_,M,L,L,L,L,L,M,_,_,
_,_,_,M,L,L,L,M,_,_,_,

_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
V,V,_,_,_,_,_,_,_,V,V,
L,L,L,_,_,_,_,_,L,L,L,
_,M,L,L,_,_,_,L,L,M,_,
_,_,M,L,L,L,L,L,M,_,_,
_,_,_,M,L,L,L,M,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,T,_,T,_,_,_,_,
_,V,_,_,T,_,T,_,_,V,_,
_,L,L,_,_,_,_,_,L,L,_,
_,M,L,L,_,_,_,L,L,M,_,
_,_,M,L,L,L,L,L,M,_,_,
_,_,_,M,L,L,L,M,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,V,_,_,_,_,_,_,_,V,_,
_,M,L,T,_,_,_,T,L,M,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,M,M,M,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,V,V,_,_,_,_,_,V,V,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,_,M,M,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,V,V,V,V,V,V,V,_,_,
_,_,_,M,L,L,L,M,_,_,_,
_,_,_,_,_,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,V,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=127}}}

local function grow_elm_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 5, 1, 5, elm_tree, "0")
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
		schematic = elm_tree,
		flags = "place_center_x, place_center_z",
	})
end

-- Nodes

core.register_node("elm:sapling", {
	description = S("Elm Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"elm_sapling.png"},
	inventory_image = "elm_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_elm_tree,
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
			"elm:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 7, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 8,
})

core.register_node("elm:trunk", {
	description = S("Elm Trunk"),
	tiles = {"elm_trunk_top.png", "elm_trunk_top.png", "elm_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("elm:wood", {
	description = S("Elm Wood"),
	tiles = {"elm_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("elm:leaves", {
	description = S("Elm Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"elm_leaves.png"},
	inventory_image = leaf_image("elm_leaves.png"),
	wield_image = leaf_image("elm_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"elm:sapling"}, rarity = 20},
			{items = {"elm:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Recipes

core.register_craft({
	output = "elm:wood 4",
	recipe = {{"elm:trunk"}}
})


core.register_craft({
	type = "fuel",
	recipe = "elm:trunk",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "elm:wood",
	burntime = 7,
})


core.register_lbm({
	name = "elm:convert_elm_saplings_to_node_timer",
	nodenames = {"elm:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"elm:trunk"},
	leaves = {"elm:leaves"},
	radius = 3,
})

doors.register_fencegate("elm:wood_gate", {
	description = S("Elm Wood Fence Gate"),
	texture = "elm_wood.png",
	material = "elm:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2}
})

default.register_fence("elm:wood_fence", {
	description = S("Elm Wood Fence"),
	texture = "elm_fence.png",
	material = "elm:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("elm_wood", "elm:wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"elm_wood.png"},
	S("Elm Wood Stair"),
	S("Elm Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"elm:sapling", grow_elm_tree, "soil"},
	})
end
