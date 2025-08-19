
-- Larch tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "larch:leaves"}
local T = {name = "larch:trunk", force_place = true}

larch_tree = {size = {x = 5, y = 13, z = 5}, data = {
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,L,L,L,_,
_,_,_,_,_,
_,_,_,_,_,
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
L,_,_,_,L,
_,L,L,L,_,
_,_,_,_,_,
_,L,_,L,_,
_,_,L,_,_,
_,_,_,_,_,
_,L,L,L,_,
_,_,L,_,_,
_,_,_,_,_,

_,_,T,_,_,
_,_,T,_,_,
_,_,T,_,_,
_,_,T,_,_,
L,_,T,_,L,
_,L,T,L,_,
_,_,T,_,_,
L,_,T,_,L,
_,L,T,L,_,
_,_,T,_,_,
_,L,T,L,_,
_,L,L,L,_,
_,_,L,_,_,

_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
L,_,_,_,L,
_,L,L,L,_,
_,_,_,_,_,
_,L,_,L,_,
_,_,L,_,_,
_,_,_,_,_,
_,L,L,L,_,
_,_,L,_,_,
_,_,_,_,_,

_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,L,L,L,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,L,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_},
yslice_prob = {{ypos=1, prob=223}}}

larch_tree2 = {size = {x=11, y=17, z=11}, data = {
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
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
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,_,_,_,_,_,_,_,L,_,
_,_,L,_,L,_,L,_,L,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
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
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,_,_,_,_,_,_,_,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,L,_,_,_,_,_,L,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
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
_,_,L,T,L,T,L,T,L,_,_,
_,_,_,L,_,L,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,_,L,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
L,_,_,_,_,_,_,_,_,_,L,
_,L,_,_,_,_,_,_,_,L,_,
_,_,L,L,T,T,T,L,L,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,L,_,_,_,_,_,_,_,L,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,L,_,_,_,_,_,L,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,L,T,T,T,T,T,T,T,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,L,L,T,T,T,L,L,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,L,L,T,L,L,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
L,_,_,_,_,_,_,_,_,_,L,
_,L,_,_,_,_,_,_,_,L,_,
_,_,L,L,T,T,T,L,L,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,L,_,_,_,_,_,_,_,L,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,L,_,_,_,_,_,L,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,T,L,T,L,T,L,_,_,
_,_,_,L,_,L,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,_,L,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,_,_,_,_,_,_,_,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,L,_,_,_,_,_,L,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,L,_,_,_,_,_,_,_,L,_,
_,_,L,_,L,_,L,_,L,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
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
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
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
_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=1, prob=223}}}

local function grow_larch_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	if on_compost(pos) then
		if not enough_height(pos, 13) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 5, 1, 5, larch_tree2, "0")
		return
	end
	add_tree(pos, 2, 1, 2, larch_tree, "0")
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
		schematic = larch_tree,
		flags = "place_center_x, place_center_z",
	})
end

-- Nodes

core.register_node("larch:sapling", {
	description = S("Larch Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"larch_sapling.png"},
	inventory_image = "larch_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_larch_tree,
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
			"larch:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 10, z = 5},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 9,
})

core.register_node("larch:trunk", {
	description = S("Larch Trunk"),
	tiles = {"larch_trunk_top.png", "larch_trunk_top.png", "larch_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("larch:wood", {
	description = S("Larch Wood"),
	tiles = {"larch_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("larch:leaves", {
	description = S("Larch Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"larch_leaves.png"},
	inventory_image = leaf_image("larch_leaves.png"),
	wield_image = leaf_image("larch_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"larch:sapling"}, rarity = 20},
			{items = {"larch:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Recipes

core.register_craft({
	output = "larch:wood 4",
	recipe = {{"larch:trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "larch:trunk",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "larch:wood",
	burntime = 7,
})


core.register_lbm({
	name = "larch:convert_larch_saplings_to_node_timer",
	nodenames = {"larch:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"larch:trunk"},
	leaves = {"larch:leaves"},
	radius = 2,
})

doors.register_fencegate("larch:wood_gate", {
	description = S("Larch Wood Fence Gate"),
	texture = "larch_wood.png",
	material = "larch:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3}
})

default.register_fence("larch:wood_fence", {
	description = S("Larch Wood Fence"),
	texture = "larch_fence.png",
	material = "larch:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("larch_wood", "larch:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"larch_wood.png"},
	S("Larch Wood Stair"),
	S("Larch Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"larch:sapling", grow_larch_tree, "soil"},
	})
end
