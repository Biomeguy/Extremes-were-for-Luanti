
-- Poplar tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "poplar:leaves"}
local M = {name = "poplar:leaves", prob = 161}
local T = {name = "poplar:trunk", force_place = true}

poplar_tree = {size = {x=3, y=14, z=3}, data = {
_,_,_,
_,_,_,
_,_,_,
_,L,_,
M,L,M,
M,L,M,
M,L,M,
M,L,M,
M,L,M,
M,L,M,
_,L,_,
_,L,_,
_,_,_,
_,_,_,

_,T,_,
_,T,_,
_,T,_,
L,T,L,
L,T,L,
L,T,L,
L,T,L,
L,T,L,
L,T,L,
L,T,L,
L,T,L,
L,T,L,
_,L,_,
_,L,_,

_,_,_,
_,_,_,
_,_,_,
_,L,_,
M,L,M,
M,L,M,
M,L,M,
M,L,M,
M,L,M,
M,L,M,
_,L,_,
_,L,_,
_,_,_,
_,_,_}}

poplar_tree2 = {size = {x=5, y=28, z=5}, data = {
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,_,M,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,

_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,L,L,L,_,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
_,L,L,L,_,
_,L,L,L,_,
_,L,L,L,_,
_,_,L,_,_,
_,_,L,_,_,
_,_,_,_,_,
_,_,_,_,_,

_,_,T,_,_,
_,_,T,_,_,
_,_,T,_,_,
_,_,T,_,_,
_,_,T,_,_,
_,_,T,_,_,
_,L,T,L,_,
M,L,T,L,M,
M,L,T,L,M,
M,L,T,L,M,
M,L,T,L,M,
M,L,T,L,M,
M,L,T,L,M,
M,L,T,L,M,
M,L,T,L,M,
M,L,T,L,M,
M,L,T,L,M,
M,L,T,L,M,
M,L,T,L,M,
M,L,T,L,M,
M,L,T,L,M,
M,L,T,L,M,
_,L,T,L,_,
_,L,T,L,_,
_,L,T,L,_,
_,L,T,L,_,
_,_,L,_,_,
_,_,L,_,_,

_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,L,L,L,_,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
M,L,L,L,M,
_,L,L,L,_,
_,L,L,L,_,
_,L,L,L,_,
_,_,L,_,_,
_,_,L,_,_,
_,_,_,_,_,
_,_,_,_,_,

_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,M,M,M,_,
_,_,M,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_},
yslice_prob = {{ypos=3, prob=223}, {ypos=9, prob=127}, {ypos=14, prob=127}}}

local function grow_poplar_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	if on_compost(pos) then
		if not enough_height(pos, 24) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 2, 1, 2, poplar_tree2, "0")
		return
	end
	add_tree(pos, 1, 1, 1, poplar_tree, "0")
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
			scale = 0.0005,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"grassland"},
		y_min = 1,
		y_max = 32,
		schematic = poplar_tree,
		flags = "place_center_x, place_center_z",
	})
end

-- Nodes

core.register_node("poplar:sapling", {
	description = S("Poplar Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"poplar_sapling.png"},
	inventory_image = "poplar_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_poplar_tree,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -0.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(600, 3000))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"poplar:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 11, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 10,
})

core.register_node("poplar:trunk", {
	description = S("Poplar Trunk"),
	tiles = {"poplar_trunk_top.png", "poplar_trunk_top.png", "poplar_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 1, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("poplar:wood", {
	description = S("Poplar Wood"),
	tiles = {"poplar_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("poplar:leaves", {
	description = S("Poplar Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"poplar_leaves.png"},
	inventory_image = leaf_image("poplar_leaves.png"),
	wield_image = leaf_image("poplar_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"poplar:sapling"}, rarity = 20},
			{items = {"poplar:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Recipes

core.register_craft({
	output = "poplar:wood 4",
	recipe = {{"poplar:trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "poplar:trunk",
	burntime = 27,
})

core.register_craft({
	type = "fuel",
	recipe = "poplar:wood",
	burntime = 7,
})


core.register_lbm({
	name = "poplar:convert_poplar_saplings_to_node_timer",
	nodenames = {"poplar:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"poplar:trunk"},
	leaves = {"poplar:leaves"},
	radius = 2,
})

doors.register_fencegate("poplar:wood_gate", {
	description = "Poplar Wood Fence Gate",
	texture = "poplar_wood.png",
	material = "poplar:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

default.register_fence("poplar:wood_fence", {
	description = "Poplar Wood Fence",
	texture = "poplar_wood_fence.png",
	inventory_image = "default_fence_overlay.png^poplar_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^poplar_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "poplar:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("poplar_wood", "poplar:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"poplar_wood.png"},
	S("Poplar Wood Stair"),
	S("Poplar Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"poplar:sapling", grow_poplar_tree, "soil"},
	})
end
