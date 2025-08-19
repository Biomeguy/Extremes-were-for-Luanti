
--[[ Ferns - Giant Tree Fern

	by Mossmanikin
	Contains code from:		biome_lib
	Looked at code from:	4seasons, default
	Supports:				vines
]]

assert(abstract_ferns.config.enable_giant_treefern == true)

-- support for i18n
local S = core.get_translator("ferns")

local L = {name = "ferns:tree_fern_leaves_giant", force_place = true}
local M = {name = "ferns:fern_trunk_big_top", force_place = true}
local T = {name = "ferns:fern_trunk_big", force_place = true}

giant_fern_tree = {size = {x=1, y=17, z=1},
data = {_,T,T,T,T,T,T,T,T,T,T,T,T,T,T,M,L},
yslice_prob = {{ypos=2, prob=170}, {ypos=3, prob=170}, {ypos=4, prob=170}, {ypos=5, prob=170}},
}

local function grow_giant_fern_tree(pos)
	local under = core.get_node_or_nil({x=pos.x, y=pos.y - 1, z=pos.z})
	local try_later = core.get_node_timer(pos):start(math.random(240, 600))
	if not under then
		return try_later
	end
	if core.get_item_group(under.name, "soil") == 0 and
		core.get_item_group(under.name, "sand") == 0 then
		return try_later
	end
	local light = 13
	local meta = core.get_meta(pos)
	if meta:get_int("light_level") > 0 then
		light = light - (meta:get_int("light_level") * 3)
		meta:set_int("light_level", 0)
	end
	local light_level = core.get_node_light(pos)
	if not light_level or light_level < light then
		return try_later
	end
	-- is there enough height to grow sapling?
	if not enough_height(pos, 16) then
		return try_later
	end
	add_tree(pos, 0, 1, 0, giant_fern_tree, "0")
end

-- GIANT TREE FERN LEAVES
core.register_node("ferns:tree_fern_leaves_giant", {
	description = S("Giant Tree Fern Crown (Dicksonia)"),
	drawtype = "mesh",
	mesh = "fern_tree_top.obj",
	waving = 1,
	tiles = {"ferns_giant_tree_leaf.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3},
	},
	groups = {snappy = 3, attached_node = 1, flammable = 2},
	drop = {
		max_items = 2,
		items = {
			{items = {"ferns:sapling_giant_tree_fern"}, rarity = 10},
			{items = {"ferns:sapling_giant_tree_fern"}},
			{items = {"ferns:tree_fern_leaves_giant"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

local big_fern_trunk_cbox = {
	type = "fixed",
	fixed = {-1/5, -.5, -1/5, 1/5, .5, 1/5}
}

local big_fern_trunk_box = {
	type = "fixed",
	fixed = {
		{-1/4, -.5, -1/4, 1/4, .5, 1/4},
		{-5/16, -.5, -1/8, 5/16, .5, 1/8},
		{-1/8, -.5, -5/16, 1/8, .5, 5/16}
	}
}

-- GIANT TREE FERN TRUNKS
core.register_node("ferns:fern_trunk_big_top", {
	description = S("Giant Fern Trunk"),
	drawtype = "nodebox",
	tiles = {"ferns_tree_fern_leaf_big_cross.png",
		"ferns_tree_fern_leaf_big_cross.png",
		"ferns_fern_trunk_big.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5,  33/64, -.5, .5, 33/64, .5},
			{-1/4, -.5, -1/4, 1/4, .5, 1/4},
			{-5/16, -.5, -1/8, 5/16, .5, 1/8},
			{-1/8, -.5, -5/16, 1/8, .5, 5/16}
		}
	},
	collision_box = big_fern_trunk_cbox,
	selection_box = big_fern_trunk_box,
	groups = {choppy = 2, attached_node = 1, flammable = 3,
		not_in_creative_inventory = 1, trunk = 1, leafdecay = 3}, -- to support vines
	drop = "ferns:fern_trunk_big",
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("ferns:fern_trunk_big", {
	description = S("Giant Fern Trunk"),
	drawtype = "nodebox",
	tiles = {"ferns_fern_trunk_big_top.png", "ferns_fern_trunk_big_top.png", "ferns_fern_trunk_big.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	node_box = big_fern_trunk_box,
	collision_box = big_fern_trunk_cbox,
	selection_box = big_fern_trunk_box,
	after_place_node = function(pos, placer, itemstack)
		core.set_node(pos, {name = "ferns:fern_trunk_big", param2 = 1})
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local node = core.get_node({x=pos.x, y=pos.y - 1, z=pos.z})
		if oldnode.param2 == 0 and core.get_item_group(node.name, "soil") > 0
		or oldnode.param2 == 0 and core.get_item_group(node.name, "sand") > 0 then
			core.add_item(pos, "ferns:ferntuber "..math.random(2, 5))
		end
	end,
	groups = {choppy = 2, attached_node = 1, flammable = 3, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
})

-- GIANT TREE FERN SAPLING
core.register_node("ferns:sapling_giant_tree_fern", {
	description = S("Giant Tree Fern Sapling"),
	drawtype = "plantlike",
	tiles = {"ferns_sapling_tree_fern_giant.png"},
	inventory_image = "ferns_sapling_tree_fern_giant.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_giant_fern_tree,
	selection_box = {
		type = "fixed",
		fixed = {-2/8, -.5, -2/8, 2/8, -.1, 2/8},
	},
	groups = {snappy = 3, flora = 1, sapling2 = 1, attached_node = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(600, 3000))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"ferns:sapling_giant_tree_fern",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -0, y = 1, z = -0},
			{x = 0, y = 16, z = 0},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"ferns:sapling_giant_tree_fern", grow_giant_fern_tree, "soil"},
		{"ferns:sapling_giant_tree_fern", grow_giant_fern_tree, "sand"},
	})
end

-- GENERATE GIANT TREE FERN

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
-- in jungles
if abstract_ferns.config.enable_giant_treeferns_in_jungle == true then
	core.register_decoration({
		name = "ferns:giant_tree_in_tropics",
		deco_type = "schematic",
		place_on = {"default:dirt_with_rainforest_litter", "default:dirt_with_swamp_grass", "ethereal:grove_dirt"},
		sidelen = 80,
		fill_ratio = 0.001,
		biomes = {"rainforest", "swamp", "subtropical_forest"},
		y_max = 31000,
		y_min = 1,
		schematic = giant_fern_tree,
	})
end

-- for oases & tropical beaches
if abstract_ferns.config.enable_giant_treeferns_in_oases == true then
	core.register_decoration({
		name = "ferns:giant_tree_on_sand",
		deco_type = "schematic",
		place_on = {"default:sand"},
		sidelen = 80,
		fill_ratio = 0.0025,
		biomes = {"desert_ocean", "sandstone_desert_ocean", "rainforest_ocean",
			"grassland_ocean", "subtropical_forest_ocean", "scorched_ocean"},
		y_max = 3,
		y_min = 1,
		schematic = giant_fern_tree,
	})
end
end
