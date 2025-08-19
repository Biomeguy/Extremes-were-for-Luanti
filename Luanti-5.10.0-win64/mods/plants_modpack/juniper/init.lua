
-- Juniper tree

-- internationalization boilerplate
local S = core.get_translator(core.get_current_modname())

local T = {name = "juniper:trunk", force_place = true}
local L = {name = "juniper:needles"}
local F = {name = "juniper:with_berries"}

juniper_tree = {size = {x = 3, y = 10, z = 3}, data = {
_,_,_,
_,_,_,
_,F,_,
_,L,_,
F,L,F,
L,L,L,
L,L,L,
_,L,_,
_,_,_,
_,_,_,

_,_,_,
_,T,_,
F,T,F,
L,T,L,
L,T,L,
L,T,L,
L,T,L,
L,T,L,
_,T,_,
_,L,_,

_,_,_,
_,_,_,
_,F,_,
_,L,_,
F,L,F,
L,L,L,
L,L,L,
_,L,_,
_,_,_,
_,_,_},
yslice_prob = {{ypos = 3, prob = 127}, {ypos = 4, prob = 117}, {ypos = 5, prob = 107}, {ypos = 6, prob = 97}}}

local function grow_juniper_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	add_tree(pos, 1, 1, 1, juniper_tree, "0")
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
			scale = 0.00005,-- -0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 80,
		schematic = juniper_tree,
		flags = "place_center_x, place_center_z",
	})
--[[ juniper bushes
add_node({"default:dirt_with_grass"}, 0.008, {"colorado"}, 1, 100, {"ethereal:juniper_trunk"}]]
end

-- Nodes

core.register_node("juniper:sapling", {
	description = S("Juniper Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"juniper_sapling.png"},
	inventory_image = "juniper_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_juniper_tree,
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
			"juniper:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -1, y = 1, z = -1},
			{x = 1, y = 7, z = 1},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 7,
})

core.register_node("juniper:trunk", {
	description = S("Juniper Trunk"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = 1,
	tiles = {"juniper_trunk_needles.png"},
	inventory_image = "juniper_trunk_needles.png",
	wield_image = "juniper_trunk_needles.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 2,
		items = {
			{items = {"juniper:sapling"}, rarity = 20},
			{items = {"juniper:berries"}, rarity = 5},
			{items = {"juniper:trunk"}}
		}
	},
	on_timer = function(pos, elapsed)
		for i=-1,1 do
		for j=-1,1 do
		for k=-1,1 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 1, "juniper:needles") then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			local meta = core.get_meta(p)
			if n.name == "juniper:needles" and meta:get_string("junifruit") == "true" then
				core.set_node(p, {name = "juniper:with_berries"})
				core.get_node_timer(pos):start(200)
			end
		end
		end
		end
		end
	end,
	groups = {snappy = 3, flammable = 3, trunk = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craftitem("juniper:berries", {
	description = S("Juniper Berries"),
	inventory_image = "juniper_berries.png",
	groups = {flammable = 2},
	on_use = core.item_eat(1)
})

core.register_node("juniper:needles", {
	description = S("Juniper Needles"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"juniper_needles.png"},
	inventory_image = leaf_image("juniper_needles.png"),
	wield_image = leaf_image("juniper_needles.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 4, leaves = 1, resinous = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"juniper:sapling"}, rarity = 20},
			{items = {"juniper:berries"}, rarity = 5},
			{items = {"juniper:needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_node("juniper:with_berries", {
	description = S("Juniper Needles with Berries"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"juniper_needles.png^juniper_berry_overlay.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "juniper:needles",
	groups = {snappy = 3, leafdecay = 3, flammable = 4, leaves = 1, not_in_creative_inventory = 1},
	drop = {
		items = {
			{items = {"juniper:berries 3"}},
			{items = {"juniper:berries 2"}, rarity = 2},
			{items = {"juniper:berries 2"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "juniper:needles"})
		local f = core.find_node_near(pos, 1, "juniper:trunk")
		if f then
			local meta = core.get_meta(pos)
			meta:set_string("junifruit", "true")
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	sounds = default.node_sound_leaves_defaults(),
})

-- Recipes

core.register_craft({
	type = "fuel",
	recipe = "juniper:trunk",
	burntime = 26,
})


core.register_lbm({
	name = "juniper:convert_juniper_saplings_to_node_timer",
	nodenames = {"juniper:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"juniper:trunk"},
	leaves = {"juniper:needles", "juniper:with_berries"},
	radius = 1,
})

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"juniper:sapling", grow_juniper_tree, "soil"},
	})
end
