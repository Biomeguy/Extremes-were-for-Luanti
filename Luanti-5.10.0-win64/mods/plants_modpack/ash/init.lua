
-- Ash tree

-- internationalization boilerplate
local S = core.get_translator("ash")

local L = {name = "ash:leaves"}
local T = {name = "ash:trunk", force_place = true}

ash_tree = {size = {x = 7, y = 11, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,L,_,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,L,_,_,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,L,L,T,L,L,_,
L,L,L,T,L,L,L,
L,L,L,T,L,L,L,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,L,_,_,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,L,_,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=127}}}

local function grow_ash_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 3, 1, 3, ash_tree, "0")
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
		schematic = ash_tree,
		flags = "place_center_x, place_center_z",
	})
end

-- Nodes

core.register_node("ash:sapling", {
	description = S("Ash Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"ash_sapling.png"},
	inventory_image = "ash_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_ash_tree,
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
			"ash:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 8, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 6,
})

core.register_node("ash:trunk", {
	description = S("Ash Trunk"),
	tiles = {"ash_trunk_top.png", "ash_trunk_top.png", "ash_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("ash:wood", {
	description = S("Ash Wood"),
	tiles = {"ash_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("ash:leaves", {
	description = S("Ash Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"ash_leaves.png"},
	inventory_image = leaf_image("ash_leaves.png"),
	wield_image = leaf_image("ash_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"ash:sapling"}, rarity = 20},
			{items = {"ash:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Recipes

core.register_craft({
	output = "ash:wood 4",
	recipe = {{"ash:trunk"}}
})


core.register_craft({
	type = "fuel",
	recipe = "ash:trunk",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "ash:wood",
	burntime = 7,
})


core.register_lbm({
	name = "ash:convert_ash_saplings_to_node_timer",
	nodenames = {"ash:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"ash:trunk"},
	leaves = {"ash:leaves"},
	radius = 3,
})

doors.register_fencegate("ash:wood_gate", {
	description = S("Ash Wood Fence Gate"),
	texture = "ash_wood.png",
	material = "ash:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

default.register_fence("ash:wood_fence", {
	description = S("Ash Wood Fence"),
	texture = "ash_fence.png",
	material = "ash:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("ash_wood", "ash:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"ash_wood.png"},
	S("Ash Wood Stair"),
	S("Ash Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"ash:sapling", grow_ash_tree, "soil"},
	})
end
