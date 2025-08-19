
-- Silver maple tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local L = {name = "silver_maple:leaves"}
local M = {name = "silver_maple:leaves", prob = 223}
local V = {name = "silver_maple:leaves", prob = 191}
local F = {name = "silver_maple:samara", prob = 100}
local T = {name = "silver_maple:trunk", force_place = true}

silver_maple_tree = {size = {x = 9, y = 19, z = 9}, data = {
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,F,_,_,
_,_,F,_,_,V,L,V,_,
_,V,L,V,_,M,L,M,_,
_,M,L,M,_,_,L,_,_,
_,_,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,F,_,_,
_,_,_,_,_,V,L,V,_,
_,_,_,_,_,M,L,M,_,
_,_,_,_,_,_,L,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,F,M,F,_,
_,F,M,F,M,L,L,L,_,
_,L,L,L,L,M,L,M,_,
_,M,L,M,M,V,L,V,_,
_,V,L,V,_,_,M,_,_,
_,_,M,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,F,_,_,F,M,F,_,
_,V,L,V,V,L,L,L,_,
_,M,L,M,_,M,L,M,_,
_,_,L,_,_,V,L,V,_,
_,_,_,_,_,_,M,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,F,_,F,_,
_,F,_,F,_,L,T,L,_,
_,L,T,L,V,L,T,L,V,
V,L,T,L,M,L,L,L,V,
V,L,T,L,V,V,L,V,_,
_,L,L,L,_,_,M,_,_,
_,V,L,V,_,_,_,_,_,
_,_,M,_,_,V,_,V,_,
_,F,M,V,F,L,T,L,_,
V,L,L,L,L,L,T,L,V,
V,M,L,L,M,L,T,L,V,
_,V,L,V,_,L,L,L,_,
_,_,L,_,_,_,L,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,
_,F,M,T,M,T,M,_,_,
_,L,L,T,L,L,L,M,_,
V,L,L,T,L,M,L,V,_,
V,M,L,L,M,_,V,_,_,
_,V,L,M,_,_,_,_,_,
_,_,V,_,_,T,_,_,_,
_,_,_,_,_,T,_,_,_,
_,_,_,_,V,T,V,_,_,
_,V,T,M,L,T,L,F,_,
V,L,T,L,L,L,L,L,V,
V,L,T,L,L,L,L,M,V,
_,L,L,L,M,_,L,V,_,
_,_,L,_,_,_,V,_,_,

_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,M,_,_,_,
_,_,M,M,T,M,M,_,_,
_,M,M,M,T,_,M,_,_,
_,_,M,M,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,T,T,_,_,_,_,
_,_,V,T,_,_,V,_,_,
_,F,L,T,L,V,T,V,_,
V,L,L,L,L,L,T,L,V,
V,M,L,M,L,L,T,L,V,
_,V,L,_,M,L,L,L,_,
_,_,V,_,_,_,L,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,F,_,_,
_,V,T,V,_,F,L,F,_,
V,L,T,L,L,L,L,L,V,
V,L,T,L,L,L,L,M,_,
_,M,L,M,L,_,L,V,_,
_,_,V,_,V,_,V,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,V,T,V,_,_,_,
_,_,F,L,T,L,F,_,_,
_,V,L,L,T,L,L,V,_,
_,V,L,L,L,L,L,M,_,
_,M,L,L,L,L,L,M,_,
_,V,L,L,M,L,L,V,_,
_,_,V,V,_,V,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,F,_,F,_,_,_,
_,_,V,L,V,L,V,_,_,
_,_,L,T,L,T,L,_,_,
_,_,L,T,L,T,L,_,_,
_,_,L,L,L,L,L,_,_,
_,_,V,L,V,L,V,_,_,
_,_,_,M,_,M,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,F,M,V,M,F,_,_,
_,_,L,L,L,L,L,_,_,
_,_,M,L,L,L,M,_,_,
_,_,V,L,V,L,V,_,_,
_,_,_,M,_,M,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos=4, prob=127}}}

local function grow_silver_maple_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 4, 1, 4, silver_maple_tree)
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
			scale = 0.00002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"grassland"},
		y_min = 1,
		y_max = 60,
		schematic = silver_maple_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

-- Nodes

core.register_node("silver_maple:sapling", {
	description = S("Silver Maple Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"silver_maple_sapling.png"},
	inventory_image = "silver_maple_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_silver_maple_tree,
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
			"silver_maple:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 16, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 15,
})

core.register_node("silver_maple:trunk", {
	description = S("Silver Maple Trunk"),
	tiles = {"silver_maple_trunk_top.png", "silver_maple_trunk_top.png", "silver_maple_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		local f = core.find_node_near(pos, 3, "silver_maple:samara_mark")
		if not f then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(f) < 11 then
			core.get_node_timer(pos):start(200)
		else
			core.set_node(f, {name = "silver_maple:samara"})
			core.get_node_timer(pos):start(200)
		end
	end,
	groups = {choppy = 2, flammable = 1, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("silver_maple:wood", {
	description = S("Silver Maple Wood"),
	tiles = {"silver_maple_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 1, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("silver_maple:samara", {
	description = ("Samara"),
	drawtype = "torchlike",
	visual_scale = 1.8,
	tiles = {"silver_samara.png"},
	inventory_image = "silver_samara.png",
	wield_image = "silver_samara.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.37, -.2, .2, .31, .2}
	},
	groups = {fleshy = 3, dig_immediate = 3, leafdecay = 3, leafdecay_drop = 1},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		core.set_node(pos, {name = "silver_maple:samara", param2 = 1})
	end,

	after_dig_node = function(pos, oldnode)
		if oldnode.param2 == 0 then
			pos.y = pos.y+1
			if core.get_node(pos).name == "silver_maple:leaves" and core.get_node(pos).param2 == 0 then
				pos.y = pos.y-1
				core.set_node(pos, {name = "silver_maple:samara_mark"})
				local f = core.find_node_near(pos, 3, "silver_maple:trunk")
				if f then
					core.get_node_timer(f):start(math.random(300, 1500))
				end
			end
		end
	end
})

core.register_node("silver_maple:leaves", {
	description = S("Silver Maple Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"silver_maple_leaves.png"},
	inventory_image = leaf_image("silver_maple_leaves.png"),
	wield_image = leaf_image("silver_maple_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 1, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"silver_maple:sapling"}, rarity = 50},
			{items = {"silver_maple:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_node("silver_maple:samara_mark", {
	description = "Samara Marker",
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
	output = "default:silver_lump 2",
	recipe = {{"silver_maple:samara"}}
})

core.register_craft({
	output = "silver_maple:wood 4",
	recipe = {{"silver_maple:trunk"}}
})


core.register_craft({
	type = "fuel",
	recipe = "silver_maple:trunk",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "silver_maple:wood",
	burntime = 7,
})


core.register_lbm({
	name = "silver_maple:convert_silver_maple_saplings_to_node_timer",
	nodenames = {"silver_maple:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"silver_maple:trunk"},
	leaves = {"silver_maple:leaves", "silver_maple:samara", "silver_maple:samara_mark"},
	radius = 3,
})

doors.register_fencegate("silver_maple:wood_gate", {
	description = S("Silver Maple Wood Fence Gate"),
	texture = "silver_maple_wood.png",
	material = "silver_maple:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 1}
})

default.register_fence("silver_maple:wood_fence", {
	description = S("Silver Maple Wood Fence"),
	texture = "silver_maple_fence.png",
	material = "silver_maple:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 1},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("silver_maple_wood", "silver_maple:wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 1},
	{"silver_maple_wood.png"},
	S("Silver Maple Wood Stair"),
	S("Silver Maple Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"silver_maple:sapling", grow_silver_maple_tree, "soil"},
	})
end
