
-- Cypress tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "cypress:needles"}
local M = {name = "cypress:needles", prob = 213}
local T = {name = "cypress:trunk", force_place = true}

cypress_tree = {size = {x=5, y=15, z=5}, data = {
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,L,_,_,
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
_,_,L,_,_,
_,L,L,L,_,
_,L,L,L,_,
L,L,L,L,L,
M,L,L,L,M,
_,L,L,L,_,
_,L,L,L,_,
_,M,L,M,_,
_,_,L,_,_,
_,_,L,_,_,
_,_,_,_,_,
_,_,_,_,_,

_,_,T,_,_,
_,_,T,_,_,
_,_,T,_,_,
_,L,T,L,_,
_,L,T,L,_,
L,L,T,L,L,
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
_,_,L,_,_,
_,L,L,L,_,
_,L,L,L,_,
L,L,L,L,L,
M,L,L,L,M,
_,L,L,L,_,
_,L,L,L,_,
_,M,L,M,_,
_,_,L,_,_,
_,_,L,_,_,
_,_,_,_,_,
_,_,_,_,_,

_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,L,_,_,
_,M,M,M,_,
_,M,M,M,_,
_,_,M,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_},
yslice_prob = {{ypos=6, prob=223}}}

local function grow_cypress_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 2, 1, 2, cypress_tree, "0")
end

-- Decoration

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
	core.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_coniferous_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.0005,
			scale = 0.0005,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"coniferous_forest"},
		y_min = 1,
		y_max = 32,
		schematic = cypress_tree,
		flags = "place_center_x, place_center_z",
	})
end

-- Nodes

core.register_node("cypress:sapling", {
	description = S("Cypress Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"cypress_sapling.png"},
	inventory_image = "cypress_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_cypress_tree,
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
			"cypress:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 12, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 11,
})

core.register_node("cypress:trunk", {
	description = S("Cypress Trunk"),
	tiles = {"cypress_trunk_top.png", "cypress_trunk_top.png", "cypress_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("cypress:wood", {
	description = S("Cypress Wood"),
	tiles = {"cypress_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("cypress:needles", {
	description = S("Cypress Needles"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"cypress_needles.png"},
	inventory_image = leaf_image("cypress_needles.png"),
	wield_image = leaf_image("cypress_needles.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"cypress:sapling"}, rarity = 20},
			{items = {"cypress:needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Recipes

core.register_craft({
	output = "cypress:wood 4",
	recipe = {{"cypress:trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "cypress:trunk",
	burntime = 27,
})

core.register_craft({
	type = "fuel",
	recipe = "cypress:wood",
	burntime = 7,
})


core.register_lbm({
	name = "cypress:convert_cypress_saplings_to_node_timer",
	nodenames = {"cypress:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"cypress:trunk"},
	leaves = {"cypress:needles"},
	radius = 2,
})

doors.register_fencegate("cypress:wood_gate", {
	description = S("Cypress Wood Fence Gate"),
	texture = "cypress_wood.png",
	material = "cypress:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3}
})

default.register_fence("cypress:wood_fence", {
	description = "Cypress Wood Fence",
	texture = "cypress_wood_fence.png",
	inventory_image = "default_fence_overlay.png^cypress_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^cypress_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "cypress:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("cypress_wood", "cypress:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"cypress_wood.png"},
	S("Cypress Wood Stair"),
	S("Cypress Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"cypress:sapling", grow_cypress_tree, "soil"},
	})
end
