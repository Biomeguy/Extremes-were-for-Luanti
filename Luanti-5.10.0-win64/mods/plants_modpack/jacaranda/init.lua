
-- Jacaranda tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "jacaranda:blossom_leaves"}
local M = {name = "jacaranda:blossom_leaves", prob = 128}
local T = {name = "jacaranda:trunk", force_place = true}

jacaranda_tree = {size = {x=9, y=11, z=9}, data = {
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,M,M,L,M,M,_,_,
_,_,_,L,L,L,_,_,_,
_,_,_,_,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,M,L,L,L,L,L,M,_,
_,M,L,L,L,L,L,M,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,M,M,_,_,_,
_,_,_,_,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
M,L,L,_,_,_,L,L,M,
_,L,L,L,L,L,L,L,_,
_,M,L,L,L,L,L,M,_,
_,_,L,L,L,L,L,_,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,M,M,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
M,L,_,_,_,_,_,L,M,
L,L,L,L,_,L,L,L,L,
_,L,L,L,T,L,L,L,_,
_,M,L,L,L,L,L,M,_,
_,_,L,L,L,L,L,_,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,M,M,_,_,_,

_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
L,L,_,_,T,_,_,L,L,
L,L,L,_,T,_,L,L,L,
M,L,L,T,T,T,L,L,M,
_,M,L,L,T,L,L,M,_,
_,M,L,L,L,L,L,M,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,L,M,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
M,L,_,_,_,_,_,L,M,
L,L,L,L,_,L,L,L,L,
_,L,L,L,T,L,L,L,_,
_,M,L,L,L,L,L,M,_,
_,_,L,L,L,L,L,_,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,M,M,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
M,L,L,_,_,_,L,L,M,
_,L,L,L,L,L,L,L,_,
_,M,L,L,L,L,L,M,_,
_,_,L,L,L,L,L,_,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,M,M,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,M,L,L,L,L,L,M,_,
_,M,L,L,L,L,L,M,_,
_,_,M,L,L,L,M,_,_,
_,_,_,M,M,M,_,_,_,
_,_,_,_,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,M,M,L,M,M,_,_,
_,_,_,L,L,L,_,_,_,
_,_,_,_,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=1, prob=223}}}

local function grow_jacaranda_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 4, 1, 4, jacaranda_tree, "0")
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
		schematic = jacaranda_tree,
		flags = "place_center_x, place_center_z",
	})
end

-- Nodes

core.register_node("jacaranda:sapling", {
	description = S("Jacaranda Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"jacaranda_sapling.png"},
	inventory_image = "jacaranda_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_jacaranda_tree,
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
			"jacaranda:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 7, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 6,
})

core.register_node("jacaranda:trunk", {
	description = S("Jacaranda Trunk"),
	tiles = {"jacaranda_trunk_top.png", "jacaranda_trunk_top.png", "jacaranda_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("jacaranda:wood", {
	description = S("Jacaranda Wood"),
	tiles = {"jacaranda_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("jacaranda:blossom_leaves", {
	description = S("Jacaranda Blossom Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"jacaranda_blossom_leaves.png"},
	inventory_image = leaf_image("jacaranda_blossom_leaves.png"),
	wield_image = leaf_image("jacaranda_blossom_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"jacaranda:sapling"}, rarity = 20},
			{items = {"jacaranda:blossom_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Recipes

core.register_craft({
	output = "jacaranda:wood 4",
	recipe = {{"jacaranda:trunk"}}
})


core.register_craft({
	type = "fuel",
	recipe = "jacaranda:trunk",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "jacaranda:wood",
	burntime = 7,
})


core.register_lbm({
	name = "jacaranda:convert_jacaranda_saplings_to_node_timer",
	nodenames = {"jacaranda:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"jacaranda:trunk"},
	leaves = {"jacaranda:blossom_leaves"},
	radius = 3,
})

doors.register_fencegate("jacaranda:wood_gate", {
	description = S("Jacaranda Wood Fence Gate"),
	texture = "jacaranda_wood.png",
	material = "jacaranda:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

default.register_fence("jacaranda:wood_fence", {
	description = S("Jacaranda Wood Fence"),
	texture = "jacaranda_fence.png",
	material = "jacaranda:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("jacaranda_wood", "jacaranda:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"jacaranda_wood.png"},
	S("Jacaranda Wood Stair"),
	S("Jacaranda Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"jacaranda:sapling", grow_jacaranda_tree, "soil"},
	})
end
