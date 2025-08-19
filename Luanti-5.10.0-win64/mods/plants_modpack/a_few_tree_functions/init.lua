
-- internationalization boilerplate
local S = core.get_translator("a_few_tree_functions")

-- Spruce Nuts
if core.get_modpath("blue_spruce") or core.get_modpath("white_spruce") then
core.register_craftitem(":default:spruce_nuts", {
	description = S("Spruce Nuts"),
	inventory_image = "spruce_nuts.png",
	groups = {spruce_nut = 1, flammable = 2},
	on_use = core.item_eat(1)
})

core.register_node(":default:spruce_wood", {
	description = S("Spruce Wood"),
	tiles = {"spruce_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 4, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_craft({
	output = "default:spruce_wood 4",
	recipe = {{"blue_spruce:trunk"}}
})

core.register_craft({
	output = "default:spruce_wood 4",
	recipe = {{"white_spruce:trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "default:spruce_wood",
	burntime = 7,
})

doors.register_fencegate("doors:gate_spruce_wood", {
	description = S("Spruce Wood Fence Gate"),
	texture = "spruce_wood.png",
	material = "default:spruce_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 4}
})

default.register_fence(":default:fence_spruce_wood", {
	description = S("Spruce Wood Fence"),
	texture = "spruce_fence.png",
	inventory_image = "default_fence_overlay.png^spruce_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^spruce_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 4},
	sounds = default.node_sound_wood_defaults()
})
core.register_craft({
	output = "default:fence_spruce_wood 4",
	recipe = {
		{"default:spruce_wood", "group:stick", "default:spruce_wood"},
		{"default:spruce_wood", "group:stick", "default:spruce_wood"}
	}
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("spruce_wood", "default:spruce_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 4},
	{"spruce_wood.png"},
	S("Spruce Wood Stair"),
	S("Spruce Wood Slab"),
	default.node_sound_wood_defaults())
end
end

-- syringa bush

local T = {name = "flowers:lilac_stem", force_place = true}
local L = {name = "flowers:lilac_leaves"}
local M = {name = "flowers:lilac_flowers"}
local V = {name = "flowers:lilac_flowers", prob = 200}

syringa_bush = {size = {x = 7, y = 5, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,V,V,V,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,V,M,M,M,V,_,
_,_,V,V,V,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,L,L,L,L,L,_,
V,M,L,L,L,M,V,
_,V,M,M,M,V,_,
_,_,V,M,V,_,_,

_,_,_,_,_,_,_,
_,L,L,T,L,L,_,
V,M,L,L,L,M,V,
_,V,M,M,M,V,_,
_,_,M,M,M,_,_,

_,_,_,_,_,_,_,
_,L,L,L,L,L,_,
V,M,L,L,L,M,V,
_,V,M,M,M,V,_,
_,_,V,M,V,_,_,

_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,V,M,M,M,V,_,
_,_,V,V,V,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,V,V,V,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_}}

local function grow_syringa(pos)
if on_compost(pos) then
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 3, 1, 3, syringa_bush, "0")
	return
end
	core.get_node_timer(pos):start(math.random(600, 3000))
end

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
core.register_decoration({
	name = "flowers:syringa",
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.02,
		scale = 0.04,
		spread = {x = 200, y = 200, z = 200},
		seed = 136,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"grassland", "deciduous_forest"},
	y_max = 31000,
	y_min = 1,
	decoration = "flowers:syringa",
})
end

core.register_node(":flowers:syringa", {
	description = S("Lilac"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"flowers_syringa.png"},
	inventory_image = "flowers_syringa.png",
	wield_image = "flowers_syringa.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	on_timer = grow_syringa,
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -.5, -3/16, 3/16, 5/16, 3/16}
	},
	groups = {snappy = 3, flower = 1, flora = 1, sapling2 = 1, attached_node = 1, color_pink = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(600, 3000))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"flowers:syringa",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 3, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 2,
})

-- syringa stem
core.register_node(":flowers:lilac_stem", {
	description = S("Lilac Stem"),
	drawtype = "mesh",
	mesh = "plant_poof_3.obj",
	waving = 1,
	tiles = {"lilac_stem.png"},
	inventory_image = "lilac_stem.png",
	wield_image = "lilac_stem.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -0.5, -4/16, 4/16, 7/16, 4/16}
	},
	collision_box = {
		type = "fixed",
		fixed = {-4/16, -0.5, -4/16, 4/16, 7/16, 4/16}
	},
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, trunk = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-- syringa leaves
core.register_node(":flowers:lilac_leaves", {
	description = S("Lilac Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"lilac_leaves.png"},
	inventory_image = leaf_image("lilac_leaves.png"),
	wield_image = leaf_image("lilac_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	light_source = 1,
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_node(":flowers:lilac_flowers", {
	description = S("Lilac Leaves with Flowers"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"lilac_flowers.png"},
	inventory_image = leaf_image("lilac_flowers.png"),
	wield_image = leaf_image("lilac_flowers.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"flowers:lilac_leaves"}, rarity = 8},
			{items = {"flowers:lilac_flowers"}}
		}
	},
	light_source = 1,
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_craft({
	output = "dye:pink 4",
	recipe = {{"flowers:lilac_flowers"}}
})

default.register_leafdecay({
	trunks = {"flowers:lilac_stem"},
	leaves = {"flowers:lilac_leaves", "flowers:lilac_flowers"},
	radius = 3,
})

local function force_grow_syringa(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 3, 1, 3, syringa_bush, "0")
end

if core.get_modpath("bonemeal") then	
	bonemeal:add_sapling({
		{"flowers:syringa", force_grow_syringa, "soil"},
	})
end
