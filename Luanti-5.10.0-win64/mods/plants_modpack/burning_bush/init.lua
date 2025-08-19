
-- Burning bush

-- internationalization boilerplate
local S = core.get_translator("burning_bush")

local L = {name = "burning_bush:leaves"}
local M = {name = "burning_bush:leaves", prob = 198}
local V = {name = "burning_bush:leaves", prob = 130}
local T = {name = "burning_bush:stem", force_place = true}

burning_bush = {size = {x = 3, y = 5, z = 3}, data = {
_,_,_,
_,_,_,
M,L,M,
V,M,V,
_,_,_,

_,_,_,
_,T,_,
L,L,L,
M,L,M,
_,L,_,

_,_,_,
_,_,_,
M,L,M,
V,M,V,
_,_,_}}

local function grow_burning_bush(pos)
	if not default.can_grow(pos, "fiery") then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 1, 1, 1, burning_bush, "0")
end

-- Decoration

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
	core.register_decoration({
		deco_type = "schematic",
		place_on = {"ethereal:dry_dirt_with_fiery_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0005,
			scale = 0.00005,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"fiery"},
		y_min = 1,
		y_max = 32,
		schematic = burning_bush,
		flags = "place_center_x, place_center_z",
	})
end

-- Nodes

core.register_node("burning_bush:sapling", {
	description = S("Burning Bush Sapling"),
	drawtype = "plantlike",
	tiles = {"burning_bush_sapling.png"},
	inventory_image = "burning_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_burning_bush,
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
			"burning_bush:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -1, y = 1, z = -1},
			{x = 1, y = 3, z = 1},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 2,
})

core.register_node("burning_bush:stem", {
	description = S("Burning Bush Stem"),
	drawtype = "plantlike",
	visual_scale = 1.5,
	tiles = {"default_bush_stem.png"},
	inventory_image = "default_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {igniter = 2, choppy = 2, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -0.5, -7/16, 7/16, 0.54, 7/16},
	},
})

core.register_node("burning_bush:leaves", {
	description = S("Burning Bush Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {{
		name = "burning_bush_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1},
	}},
	inventory_image = leaf_image("burning_bush_leaves.png"),
	wield_image = leaf_image("burning_bush_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	groups = {igniter = 2, snappy = 3, leafdecay = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"burning_bush:sapling"}, rarity = 20},
			{items = {"burning_bush:leaves"}}
		}
	},
	damage_per_second = 4,
	light_source = 14,
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Recipes

core.register_craft({
	output = "ethereal:fire_dust 2",
	recipe = {{"burning_bush:stem"}},
	replacements = {{"burning_bush:stem", "default:wood"}}
})

core.register_lbm({
	name = "burning_bush:convert_burning_bush_saplings_to_node_timer",
	nodenames = {"burning_bush:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(150, 750))
	end
})

default.register_leafdecay({
	trunks = {"burning_bush:stem"},
	leaves = {"burning_bush:leaves"},
	radius = 3,
})

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"burning_bush:sapling", grow_burning_bush, "ethereal:dry_dirt_with_fiery_grass"},
	})
end
