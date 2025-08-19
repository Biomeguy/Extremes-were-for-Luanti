
-- Mahogany tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "mahogany:leaves"}
local M = {name = "mahogany:leaves", prob = 126}
local F = {name = "mahogany:leaves_blooming_creeper"}
local V = {name = "mahogany:leaves_blooming_creeper", prob = 126}
local C = {name = "mahogany:trunk_creeper", force_place = true}
local T = {name = "mahogany:trunk", force_place = true}

mahogany_tree = {size = {x=7, y=17, z=7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,_,_,_,L,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,M,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
F,L,L,_,L,L,L,
_,_,_,_,_,_,_,
_,_,F,L,_,_,_,
_,_,_,_,_,_,_,
_,_,L,T,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,M,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,F,F,_,L,L,_,
_,_,_,C,_,_,_,
_,_,L,L,F,_,_,
M,L,L,L,_,_,_,
_,_,L,T,L,_,_,
_,_,_,L,L,F,M,
_,_,_,_,F,_,_,
_,_,_,F,_,_,_,
_,_,_,M,_,_,_,
_,_,F,L,M,_,_,
_,_,_,_,_,_,_,

_,_,_,T,_,_,_,
_,_,_,C,_,_,_,
_,_,_,C,_,_,_,
_,_,_,C,_,_,_,
_,_,_,C,_,_,_,
_,_,_,C,_,_,_,
_,_,_,C,_,_,_,
_,_,T,T,T,_,_,
_,_,L,T,L,F,_,
L,T,T,C,_,_,_,
_,F,L,C,_,_,_,
_,_,_,C,T,T,L,
_,_,F,C,L,F,_,
_,_,L,T,L,_,_,
_,_,_,C,_,_,_,
_,F,T,T,F,_,_,
_,_,F,F,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,F,_,L,F,_,
_,_,_,C,_,_,_,
_,_,L,L,L,M,_,
L,L,L,L,_,_,_,
_,_,_,L,_,_,_,
_,_,_,L,F,L,L,
_,_,L,T,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,F,L,F,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
V,L,L,_,L,L,F,
_,_,_,_,_,_,_,
_,_,M,F,L,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,T,L,_,_,
_,_,_,F,_,_,_,
_,_,_,_,_,_,_,
_,_,M,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,F,_,_,_,L,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,M,L,L,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=223}}}

local function grow_mahogany_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 3, 1, 3, mahogany_tree)
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
			scale = 0.0005,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"rainforest"},
		y_min = 1,
		y_max = 62,
		schematic = mahogany_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

-- Nodes

core.register_node("mahogany:sapling", {
	description = S("Mahogany Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"mahogany_sapling.png"},
	inventory_image = "mahogany_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_mahogany_tree,
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
			"mahogany:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 15, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 14,
})

core.register_node("mahogany:trunk", {
	description = S("Mahogany Trunk"),
	tiles = {"mahogany_trunk_top.png", "mahogany_trunk_top.png", "mahogany_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("mahogany:wood", {
	description = S("Mahogany Wood"),
	tiles = {"mahogany_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("mahogany:leaves", {
	description = S("Mahogany Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"mahogany_leaves.png"},
	inventory_image = leaf_image("mahogany_leaves.png"),
	wield_image = leaf_image("mahogany_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"mahogany:sapling"}, rarity = 20},
			{items = {"mahogany:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})


-- Vines

core.register_node("mahogany:trunk_creeper", {
	description = S("Mahogany Trunk With Creeper"),
	tiles = {"mahogany_trunk_top.png", "mahogany_trunk_top.png", "mahogany_trunk.png^mahogany_creeper.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	drop = "mahogany:trunk",
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("mahogany:leaves_blooming_creeper", {
	description = S("Mahogany Leaves With Blooming Creeper"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"mahogany_leaves.png^mahogany_blooming_creeper.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 2, oddly_breakable_by_hand = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"mahogany:sapling"}, rarity = 20},
			{items = {"mahogany:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

-- Recipes

core.register_craft({
	output = "mahogany:wood 4",
	recipe = {{"mahogany:trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "mahogany:trunk",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "mahogany:wood",
	burntime = 7,
})


core.register_lbm({
	name = "mahogany:convert_mahogany_saplings_to_node_timer",
	nodenames = {"mahogany:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"mahogany:trunk", "mahogany:trunk_creeper"},
	leaves = {"mahogany:leaves", "mahogany:leaves_blooming_creeper"},
	radius = 2,
})

doors.register_fencegate("mahogany:wood_gate", {
	description = S("Mahogany Fence Gate"),
	texture = "mahogany_wood.png",
	material = "mahogany:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2}
})

default.register_fence("mahogany:wood_fence", {
	description = S("Mahogany Fence"),
	texture = "mahogany_fence.png",
	material = "mahogany:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("mahogany_wood", "mahogany:wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"mahogany_wood.png"},
	S("Mahogany Stair"),
	S("Mahogany Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"mahogany:sapling", grow_mahogany_tree, "soil"},
	})
end
