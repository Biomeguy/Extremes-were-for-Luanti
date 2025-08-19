
-- Cedar tree

-- internationalization boilerplate
local S = core.get_translator("cedar")

local L = {name = "cedar:needles"}
local C = {name = "cedar:cones", prob = 213}
local T = {name = "cedar:trunk", force_place = true}

cedar_tree = {size = {x = 7, y = 16, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,C,_,_,_,
_,_,C,L,C,_,_,
_,_,C,L,C,_,_,
_,_,_,C,_,_,_,
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
_,_,L,L,L,_,_,
_,C,L,L,L,C,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,C,L,L,L,C,_,
_,_,L,L,L,_,_,
_,_,C,L,C,_,_,
_,_,_,C,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,C,L,L,L,C,_,
_,L,L,L,L,L,_,
C,L,L,L,L,L,C,
C,L,L,L,L,L,C,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,C,L,L,L,C,_,
_,_,L,L,L,_,_,
_,_,C,L,C,_,_,
_,_,_,C,_,_,_,
_,_,_,_,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,L,T,L,_,_,
_,L,L,T,L,L,_,
C,L,L,T,L,L,C,
L,L,L,T,L,L,L,
L,L,L,T,L,L,L,
C,L,L,T,L,L,C,
_,L,L,T,L,L,_,
_,L,L,T,L,L,_,
_,C,L,T,L,C,_,
_,_,L,L,L,_,_,
_,_,C,L,C,_,_,
_,_,_,C,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,C,L,L,L,C,_,
_,L,L,L,L,L,_,
C,L,L,L,L,L,C,
C,L,L,L,L,L,C,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,C,L,L,L,C,_,
_,_,L,L,L,_,_,
_,_,C,L,C,_,_,
_,_,_,C,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,C,L,L,L,C,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,C,L,L,L,C,_,
_,_,L,L,L,_,_,
_,_,C,L,C,_,_,
_,_,_,C,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,C,_,_,_,
_,_,C,L,C,_,_,
_,_,C,L,C,_,_,
_,_,_,C,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos=2, prob=127}}}

cedar_tree2 = {size = {x=11, y=21, z=11}, data = {
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,C,_,C,_,_,_,
_,_,_,_,_,C,_,C,_,_,_,
_,_,_,C,_,_,_,_,_,_,_,
_,_,_,C,_,_,_,_,_,_,_,
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
_,_,_,_,_,_,C,_,_,_,_,
_,_,_,_,_,C,L,C,_,_,_,
_,_,_,_,C,L,L,L,C,_,_,
_,_,_,C,L,L,C,L,C,_,_,
_,_,C,L,L,C,_,C,_,_,_,
_,_,C,L,C,_,_,_,_,_,_,
_,_,_,C,_,_,_,_,_,_,_,
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
_,_,_,_,_,_,C,L,_,_,_,
_,_,_,_,_,L,L,L,C,_,_,
_,_,_,L,C,L,L,L,L,_,_,
_,_,C,L,L,L,L,L,L,C,_,
_,_,L,L,L,L,L,L,L,C,_,
_,C,L,L,L,L,L,L,L,_,_,
_,C,L,L,L,C,C,L,C,_,_,
_,_,L,L,L,_,_,C,_,_,_,
_,_,C,L,C,_,_,_,_,_,_,
_,_,_,C,_,_,_,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,L,L,C,_,_,
_,_,_,_,L,L,L,L,L,_,_,
_,_,C,L,L,L,L,L,L,C,_,
_,_,L,L,L,L,L,T,L,L,_,
_,C,L,L,L,L,L,T,L,L,_,
_,L,L,T,L,L,L,T,L,C,_,
_,L,L,T,L,L,L,L,L,_,_,
_,C,L,T,L,L,L,L,C,_,_,
_,_,L,L,L,_,_,C,_,_,_,
_,_,C,L,L,L,C,_,_,_,_,
_,_,_,L,L,L,L,C,_,_,_,
_,_,_,C,L,L,L,C,_,_,_,
_,_,_,_,C,L,C,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,L,C,_,_,
_,_,_,L,L,L,T,L,L,C,_,
_,_,C,L,L,L,T,L,L,L,_,
_,C,L,L,T,L,L,L,L,L,_,
_,L,L,L,T,L,L,L,L,C,_,
_,L,L,L,L,L,L,L,L,_,_,
_,C,L,L,L,L,L,L,C,_,_,
_,_,L,L,L,_,_,C,_,_,_,
_,_,C,L,L,L,L,_,_,_,_,
_,_,_,L,L,L,L,C,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,C,L,L,L,C,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,C,L,C,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,L,T,L,L,_,_,_,
_,_,_,L,L,T,L,L,C,_,_,
_,_,C,L,L,T,L,L,L,C,_,
_,_,L,L,L,T,L,L,L,C,_,
_,C,L,L,L,T,L,L,L,_,_,
_,C,L,L,L,T,_,L,C,_,_,
_,_,L,L,L,T,_,L,_,_,_,
_,_,_,L,_,T,_,_,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,L,L,T,L,L,_,_,_,
_,_,C,L,L,T,L,L,C,_,_,
_,_,C,L,L,T,L,L,C,_,_,
_,_,_,L,L,T,L,L,_,_,_,
_,_,_,C,L,T,L,C,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,C,L,C,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,L,L,T,L,L,_,_,_,
_,_,_,L,L,T,L,L,C,_,_,
_,_,C,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,T,L,L,_,_,
_,_,L,L,T,L,L,L,L,C,_,
_,C,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,_,L,L,C,_,_,
_,_,C,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,C,L,L,L,C,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,_,C,L,C,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,L,L,T,L,L,C,_,_,
_,_,C,L,L,T,L,L,L,C,_,
_,C,L,L,L,L,L,T,L,L,_,
_,L,L,T,L,L,L,T,L,C,_,
_,C,L,T,L,L,L,L,L,_,_,
_,_,L,L,L,L,_,L,C,_,_,
_,_,C,L,L,L,L,L,_,_,_,
_,_,_,L,L,L,L,L,_,_,_,
_,_,_,C,L,L,L,C,_,_,_,
_,_,_,_,C,L,C,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,_,C,L,L,L,C,_,_,_,
_,_,C,L,L,L,L,L,C,_,_,
_,_,L,L,L,L,L,L,L,_,_,
_,_,L,L,L,T,L,L,L,C,_,
_,C,L,L,L,T,L,L,L,_,_,
_,_,L,L,L,L,L,L,C,_,_,
_,_,C,L,L,L,L,C,_,_,_,
_,_,_,C,_,L,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
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
_,_,_,_,C,C,C,_,_,_,_,
_,_,_,C,L,L,L,C,_,_,_,
_,_,_,L,L,L,L,L,C,_,_,
_,_,_,L,L,L,L,L,C,_,_,
_,_,C,L,L,L,L,C,_,_,_,
_,_,_,C,C,L,C,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
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
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,C,L,C,_,_,_,_,
_,_,_,_,C,L,C,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
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
yslice_prob = {{ypos=2, prob=223}}}

local function grow_cedar_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		core.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	if on_compost(pos) then
		if not enough_height(pos, 16) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 5, 1, 5, cedar_tree2)
		return
	end
	add_tree(pos, 3, 1, 3, cedar_tree, "0")
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
		schematic = cedar_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

-- Nodes

core.register_node("cedar:sapling", {
	description = S("Cedar Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"cedar_sapling.png"},
	inventory_image = "cedar_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_cedar_tree,
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
			"cedar:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 12, z = 5},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 11,
})

core.register_node("cedar:trunk", {
	description = S("Cedar Trunk"),
	tiles = {"cedar_trunk_top.png", "cedar_trunk_top.png", "cedar_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		for i=-3,3 do
		for j=-3,3 do
		for k=-3,3 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 3, "cedar:needles") then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			local meta = core.get_meta(p)
			if n.name == "cedar:needles" and meta:get_string("cedarcones") == "true" then
				core.set_node(p, {name = "cedar:cones"})
				core.get_node_timer(pos):start(200)
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("cedar:wood", {
	description = S("Cedar Wood"),
	tiles = {"cedar_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("cedar:needles", {
	description = S("Cedar Needles"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"cedar_needles.png"},
	inventory_image = leaf_image("cedar_needles.png"),
	wield_image = leaf_image("cedar_needles.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, resinous = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"cedar:sapling"}, rarity = 30},
			{items = {"cedar:needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_node("cedar:cones", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"cedar_needles.png^cedar_cones.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "cedar:needles",
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, not_in_creative_inventory = 1},
	drop = {
		items = {
			{items = {"cedar:cone 3"}},
			{items = {"cedar:cone 2"}, rarity = 2},
			{items = {"cedar:cone 2"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "cedar:needles"})
		local f = core.find_node_near(pos, 3, "cedar:trunk")
		if f then
			local meta = core.get_meta(pos)
			meta:set_string("cedarcones", "true")
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craftitem("cedar:cone", {
	description = S("Cedar Cone"),
	inventory_image = "cedar_cone.png",
	groups = {flammable = 2},
})

core.register_craftitem("cedar:nuts", {
	description = S("Roasted Cedar Nuts"),
	inventory_image = "cedar_nuts.png",
	on_use = core.item_eat(1),
	groups = {flammable = 2},
})

-- Recipes

core.register_craft({
	output = "cedar:wood 4",
	recipe = {{"cedar:trunk"}}
})

core.register_craft({
	type = "fuel",
	recipe = "cedar:trunk",
	burntime = 27,
})

core.register_craft({
	type = "fuel",
	recipe = "cedar:wood",
	burntime = 7,
})

core.register_craft({
	type = "cooking",
	output = "cedar:nuts 4",
	recipe = "cedar:cone",
	replacements = {{"cedar:cone", "farming:spent_biomasse"}}
})


core.register_lbm({
	name = "cedar:convert_cedar_saplings_to_node_timer",
	nodenames = {"cedar:sapling"},
	action = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end
})

default.register_leafdecay({
	trunks = {"cedar:trunk"},
	leaves = {"cedar:needles", "cedar:cones"},
	radius = 3,
})

doors.register_fencegate("cedar:wood_gate", {
	description = "Cedar Wood Fence Gate",
	texture = "cedar_wood.png",
	material = "cedar:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3}
})

default.register_fence("cedar:wood_fence", {
	description = "Cedar Wood Fence",
	texture = "cedar_wood_fence.png",
	inventory_image = "default_fence_overlay.png^cedar_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^cedar_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "cedar:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("cedar_wood", "cedar:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"cedar_wood.png"},
	S("Cedar Wood Stair"),
	S("Cedar Wood Slab"),
	default.node_sound_wood_defaults())
end

if core.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"cedar:sapling", grow_cedar_tree, "soil"},
	})
end
