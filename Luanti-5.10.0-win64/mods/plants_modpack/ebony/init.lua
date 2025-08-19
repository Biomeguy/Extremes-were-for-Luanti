
-- Ebony tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "ebony:leaves"}
local M = {name = "ebony:leaves", prob = 126}
local F = {name = "ebony:persimmon", prob = 67}
local T = {name = "ebony:trunk", force_place = true}

ebony_tree = {size = {x=11, y=16, z=11}, data = {
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,M,_,_,_,_,_,
_,_,_,_,M,L,M,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
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
_,_,M,_,_,_,_,M,_,_,_,
_,_,L,F,_,L,_,L,_,_,_,
_,_,L,L,L,T,L,L,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,M,_,_,_,_,_,
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
_,_,_,_,_,_,_,_,_,M,_,
_,_,F,L,_,L,L,_,F,L,_,
_,_,L,T,L,T,T,L,L,L,_,
_,_,_,L,_,L,L,_,_,_,_,
_,_,_,M,F,_,F,_,_,_,_,
_,_,_,L,L,T,L,_,_,_,_,
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
_,M,_,_,_,_,_,_,_,_,_,
_,L,_,_,L,L,_,_,L,F,_,
_,L,L,L,T,T,L,L,T,L,_,
_,_,_,_,L,L,_,_,L,_,_,
_,_,_,F,_,_,_,F,M,_,_,
_,_,_,L,T,T,L,L,L,_,_,
_,_,_,_,L,L,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
M,_,L,_,_,_,_,L,_,_,M,
L,L,T,L,L,T,L,T,L,L,L,
_,_,L,_,_,L,_,L,_,_,_,
_,_,F,_,_,_,_,_,F,_,_,
_,_,L,L,L,T,L,T,L,_,_,
_,_,_,_,F,L,F,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,M,L,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,T,T,T,_,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
M,_,_,_,_,T,_,_,_,_,M,
L,L,L,L,_,T,_,L,L,L,L,
L,T,T,T,T,T,T,T,T,T,L,
_,L,L,L,L,T,L,L,L,L,_,
_,M,_,_,_,T,_,_,_,M,_,
_,L,T,T,T,T,T,T,T,L,_,
_,_,L,L,L,T,L,L,L,_,_,
_,_,_,L,L,T,L,L,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,

_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
M,_,_,L,_,_,_,_,L,_,M,
L,L,L,T,L,T,L,L,T,L,L,
_,_,_,L,_,L,_,_,L,_,_,
_,_,F,_,_,_,_,_,F,_,_,
_,_,L,T,L,T,L,L,L,_,_,
_,_,_,L,F,L,F,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,M,L,M,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,M,_,
_,F,L,_,_,L,L,_,_,L,_,
_,L,T,L,L,T,T,L,L,L,_,
_,_,L,_,_,L,L,_,_,_,_,
_,_,M,F,_,_,_,F,_,_,_,
_,_,L,L,L,T,T,L,_,_,_,
_,_,_,_,_,L,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,M,_,_,_,_,_,_,_,_,_,
_,L,F,_,L,L,_,L,F,_,_,
_,L,L,L,T,T,L,T,L,_,_,
_,_,_,_,L,L,_,L,_,_,_,
_,_,_,_,F,_,F,M,_,_,_,
_,_,_,_,L,T,L,L,_,_,_,
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
_,_,_,M,_,_,_,_,M,_,_,
_,_,_,L,_,L,_,F,L,_,_,
_,_,_,L,L,T,L,L,L,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,M,_,_,_,_,_,
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
_,_,_,_,_,M,_,_,_,_,_,
_,_,_,_,M,L,M,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=223}}}

local function grow_ebony_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 5, 1, 5, ebony_tree, "0")
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
			scale = 0.0002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"rainforest"},
		y_min = 1,
		y_max = 62,
		schematic = ebony_tree,
		flags = "place_center_x, place_center_z",
	})
end

-- Nodes

core.register_node("ebony:sapling", {
	description = S("Ebony Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"ebony_sapling.png"},
	inventory_image = "ebony_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_ebony_tree,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -0.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(600, 3000))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"ebony:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 14, z = 5},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 12,
})

core.register_node("ebony:trunk", {
	description = S("Ebony Trunk"),
	tiles = {"ebony_trunk_top.png", "ebony_trunk_top.png", "ebony_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		local f = core.find_node_near(pos, 2, "ebony:persimmon_mark")
		if not f then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(f) < 11 then
			core.get_node_timer(pos):start(200)
		else
			core.set_node(f, {name = "ebony:persimmon"})
			core.get_node_timer(pos):start(200)
		end
	end,
	groups = {choppy = 1, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("ebony:wood", {
	description = S("Ebony Wood"),
	tiles = {"ebony_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("ebony:leaves", {
	description = S("Ebony Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"ebony_leaves.png"},
	inventory_image = leaf_image("ebony_leaves.png"),
	wield_image = leaf_image("ebony_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"ebony:sapling"}, rarity = 20},
			{items = {"ebony:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- Persimmon Kaki

core.register_node("ebony:persimmon", {
	description = S("Persimmon"),
	drawtype = "plantlike",
	tiles = {"ebony_persimmon.png"},
	inventory_image = "ebony_persimmon.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -7/16, -3/16, 3/16, 4/16, 3/16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = core.item_eat(4, "farming:spent_biomasse"),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		core.set_node(pos, {name = "ebony:persimmon", param2 = 1})
	end,

	after_dig_node = function(pos, oldnode)
		if oldnode.param2 == 0 then
			pos.y = pos.y+1
			if core.get_node(pos).name == "ebony:leaves" and core.get_node(pos).param2 == 0 then
				pos.y = pos.y-1
				core.set_node(pos, {name = "ebony:persimmon_mark"})
				local f = core.find_node_near(pos, 2, "ebony:trunk")
				if f then
					core.get_node_timer(f):start(math.random(300, 1500))
				end
			end
		end
	end,
})

core.register_node("ebony:persimmon_mark", {
	description = "Persimmon Marker",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	groups = {leafdecay = 3, not_in_creative_inventory = 1},
})

-- Recipes

core.register_craft({
	output = "ebony:wood 4",
	recipe = {{"ebony:trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "ebony:trunk",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "ebony:wood",
	burntime = 9,
})


core.register_lbm({
	name = "ebony:convert_ebony_saplings_to_node_timer",
	nodenames = {"ebony:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"ebony:trunk"},
	leaves = {"ebony:leaves", "ebony:persimmon", "ebony:persimmon_mark"},
	radius = 2,
})

doors.register_fencegate("ebony:wood_gate", {
	description = S("Ebony Wood Fence Gate"),
	texture = "ebony_wood.png",
	material = "ebony:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2}
})

default.register_fence("ebony:wood_fence", {
	description = S("Ebony Wood Fence"),
	texture = "ebony_fence.png",
	material = "ebony:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("ebony_wood", "ebony:wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"ebony_wood.png"},
	S("Ebony Wood Stair"),
	S("Ebony Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"ebony:sapling", grow_ebony_tree, "soil"},
	})
end
