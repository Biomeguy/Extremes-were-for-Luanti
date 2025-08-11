
local S = core.get_translator("farming")

-- barley seeds
core.register_node("farming:seed_barley", {
	description = S("Barley"),
	tiles = {"farming_barley_seed.png"},
	inventory_image = "farming_barley_seed.png",
	wield_image = "farming_barley_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	sounds = default.node_sound_dirt_defaults({
		dig = {name = "", gain = 0},
		dug = {name = "default_grass_footstep", gain = .2},
		place = {name = "", gain = 0},
	}),
	on_place = function(itemstack, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local udef = core.registered_nodes[node.name]
		if udef and udef.on_rightclick and
				not (placer and placer:is_player() and
				placer:get_player_control().sneak) then
			return udef.on_rightclick(under, node, placer, itemstack,
				pointd) or itemstack
		end

		return farming.place_seed(itemstack, placer, pointd, "farming:seed_barley")
	end,
	next_plant = "farming:barley_S1",
	on_timer = farming.grow_plant,
})

-- harvested barley / flour / dough / bread
core.register_craftitem("farming:barley", {
	description = S("Barley Stalks"),
	inventory_image = "farming_barley.png",
	groups = {grain = 1, flammable = 2},
})

core.register_craftitem("farming:barley_flour", {
	description = S("Barley Flour"),
	inventory_image = "farming_barley_flour.png",
	groups = {flour = 1, flammable = 1},
})

core.register_craftitem("farming:barley_dough", {
	description = S("Barley Dough"),
	inventory_image = "farming_barley_dough.png",
	groups = {dough = 1, flammable = 1},
})

core.register_craftitem("farming:barley_bread", {
	description = S("Barley Bread"),
	inventory_image = "farming_barley_bread.png",
	on_use = core.item_eat(5),
	groups = {bread = 1, flammable = 2},
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:barley_bread",
	recipe = "farming:barley_dough"
})

register_dough("farming:barley_dough", "farming:barley_flour", "farming:barley", "farming:seed_barley")

local sprout = "farming:spent_biomasse"
if core.get_modpath("foods") then
-- sprouted barley seed
core.register_craftitem("farming:seed_barley_sprouted", {
	description = S("Sprouted Barley"),
	inventory_image = "farming_barley_seed_sprouted.png",
	groups = {flammable = 2},
})
sprout = "farming:seed_barley_sprouted"
end

-- barley definition
local def = {
	drawtype = "mesh",
	mesh = "reed.obj",
	tiles = {"farming_barley_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = sprout,
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:barley_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:barley_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_barley_2.png"}
def.next_plant = "farming:barley_S3"
def.drop = "farming:spent_biomasse"
core.register_node("farming:barley_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_barley_3.png"}
def.next_plant = "farming:barley_S4"
core.register_node("farming:barley_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_barley_4.png"}
def.next_plant = "farming:barley_S5"
core.register_node("farming:barley_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_barley_5.png"}
def.next_plant = "farming:barley_S6"
core.register_node("farming:barley_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_barley_6.png"}
def.next_plant = "farming:barley_S7"
def.drop = {
	items = {
		{items = {"farming:barley"}, rarity = 2},
		{items = {"farming:seed_barley"}},
	}
}
core.register_node("farming:barley_S6", table.copy(def))

-- stage 7 (final)
def.tiles = {"farming_barley_7.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:barley 2"}},
		{items = {"farming:barley"}, rarity = 3},
		{items = {"farming:seed_barley 4"}},
		{items = {"farming:seed_barley 6"}, rarity = 3},
	}
}
core.register_node("farming:barley_S7", table.copy(def))

-- Fuel
core.register_craft({
	type = "fuel",
	recipe = "farming:barley",
	burntime = 2,
})
