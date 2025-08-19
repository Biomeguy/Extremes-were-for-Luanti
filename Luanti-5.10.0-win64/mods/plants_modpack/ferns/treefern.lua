
--[[ Ferns - Tree Fern

	by Mossmanikin
	Contains code from:		biome_lib
	Looked at code from:	default	, trees
]]

-- support for i18n
local S = core.get_translator("ferns")

assert(abstract_ferns.config.enable_treefern == true)

local L = {name = "ferns:tree_fern_leaves", force_place = true}
local T = {name = "ferns:fern_trunk", force_place = true}

fern_tree = {size = {x=1, y=7, z=1},
data = {_,T,T,T,T,T,L},
yslice_prob = {{ypos=2, prob=170}, {ypos=3, prob=170}, {ypos=4, prob=170}, {ypos=5, prob=170}},
}

local function grow_fern_tree(pos)
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
	if not enough_height(pos, 5) then
		return try_later
	end
	add_tree(pos, 0, 1, 0, fern_tree, "0")
end

-- TREE FERN LEAVES
core.register_node("ferns:tree_fern_leaves", {
	description = S("Tree Fern Crown (Dicksonia)"),
	drawtype = "mesh",
	mesh = "fern_poof.obj",
	waving = 1,
	tiles = {"ferns_fern_tree.png"},
	inventory_image = "ferns_fern_tree.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/4, -.5, -1/4, 1/4, 0, 1/4},
	},
	groups = {snappy = 3, attached_node = 1, flammable = 2},
	drop = {
		max_items = 2,
		items = {
			{items = {"ferns:sapling_tree_fern"}, rarity = 10},
			{items = {"ferns:sapling_tree_fern"}},
			{items = {"ferns:tree_fern_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

-- FERN TRUNK
core.register_node("ferns:fern_trunk", {
	description = S("Fern Trunk (Dicksonia)"),
	drawtype = "nodebox",
	tiles = {"ferns_fern_trunk_top.png", "ferns_fern_trunk_top.png", "ferns_fern_trunk.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {-1/8, -.5, -1/8, 1/8, .5, 1/8},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -.5, -1/7, 1/7, .5, 1/7},
	},
	after_place_node = function(pos, placer, itemstack)
		core.set_node(pos, {name = "ferns:fern_trunk", param2 = 1})
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

-- TREE FERN SAPLING
core.register_node("ferns:sapling_tree_fern", {
	description = S("Tree Fern Sapling (Dicksonia)"),
	drawtype = "plantlike",
	tiles = {"ferns_sapling_tree_fern.png"},
	inventory_image = "ferns_sapling_tree_fern.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_fern_tree,
	selection_box = {
		type = "fixed",
		fixed = {-1/4, -.5, -1/4, 1/4, -.2, 1/4},
	},
	groups = {snappy = 3, flora = 1, sapling2 = 1, attached_node = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(600, 2400))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"ferns:sapling_tree_fern",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -0, y = 1, z = -0},
			{x = 0, y = 6, z = 0},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"ferns:sapling_tree_fern", grow_fern_tree, "soil"},
		{"ferns:sapling_tree_fern", grow_fern_tree, "sand"},
	})
end

-- GENERATE TREE FERN

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
-- in jungles
if abstract_ferns.config.enable_treeferns_in_jungle == true then
	core.register_decoration({
		name = "ferns:tree_in_tropics",
		deco_type = "schematic",
		place_on = {"default:dirt_with_rainforest_litter", "default:dirt_with_swamp_grass", "ethereal:grove_dirt"},
		sidelen = 16,
		fill_ratio = 0.004,
		biomes = {"rainforest", "swamp", "subtropical_forest"},
		y_max = 31000,
		y_min = 1,
		schematic = fern_tree,
	})
end

-- for oases & tropical beaches
if abstract_ferns.config.enable_treeferns_in_oases == true then
	core.register_decoration({
		name = "ferns:tree_on_sand",
		deco_type = "schematic",
		place_on = {"default:sand"},
		sidelen = 16,
		fill_ratio = 0.035,
		biomes = {"desert_ocean", "sandstone_desert_ocean", "rainforest_ocean",
			"grassland_ocean", "subtropical_forest_ocean", "scorched_ocean"},
		y_max = 3,
		y_min = 1,
		schematic = fern_tree,
	})
end
end
