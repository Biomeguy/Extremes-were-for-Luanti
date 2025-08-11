
local S = core.get_translator("farming")

-- oat seeds
core.register_node("farming:seed_oat", {
	description = S("Oat"),
	tiles = {"farming_oat_seed.png"},
	inventory_image = "farming_oat_seed.png",
	wield_image = "farming_oat_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 4},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:seed_oat")
	end,
	next_plant = "farming:oat_S1",
	on_timer = farming.grow_plant,
})

-- harvested oat
core.register_craftitem("farming:oat", {
	description = S("Oat Stalks"),
	inventory_image = "farming_oat.png",
	groups = {grain = 1, flammable = 2},
})

-- oat flour
core.register_craftitem("farming:oat_flour", {
	description = S("Oat Flour"),
	inventory_image = "farming_oat_flour.png",
	groups = {flour = 1, flammable = 1},
})

-- oat dough
core.register_craftitem("farming:oat_dough", {
	description = S("Oat Dough"),
	inventory_image = "farming_oat_dough.png",
	groups = {dough = 1, flammable = 1},
})

-- oat bread
core.register_craftitem("farming:oat_bread", {
	description = S("Oatbread"),
	inventory_image = "farming_oat_bread.png",
	on_use = core.item_eat(5),
	groups = {bread = 1, flammable = 2},
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:oat_bread",
	recipe = "farming:oat_dough"
})

register_dough("farming:oat_dough", "farming:oat_flour", "farming:oat", "farming:seed_oat")

-- oat definition
local def = {
	drawtype = "mesh",
	mesh = "reed.obj",
	tiles = {"farming_oat_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 4, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:oat_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:oat_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_oat_2.png"}
def.next_plant = "farming:oat_S3"
core.register_node("farming:oat_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_oat_3.png"}
def.next_plant = "farming:oat_S4"
def.drop = "farming:spent_biomasse 2"
core.register_node("farming:oat_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_oat_4.png"}
def.next_plant = "farming:oat_S5"
core.register_node("farming:oat_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_oat_5.png"}
def.next_plant = "farming:oat_S6"
core.register_node("farming:oat_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_oat_6.png"}
def.next_plant = "farming:oat_S7"
def.drop = {
	items = {
		{items = {"farming:oat"}, rarity = 2},
		{items = {"farming:seed_oat 2"}, rarity = 2},
	}
}
core.register_node("farming:oat_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_oat_7.png"}
def.next_plant = "farming:oat_S8"
def.drop = {
	items = {
		{items = {"farming:oat"}},
		{items = {"farming:oat"}, rarity = 3},
		{items = {"farming:seed_oat 2"}},
		{items = {"farming:seed_oat"}, rarity = 2},
	}
}
core.register_node("farming:oat_S7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_oat_8.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:oat 2"}},
		{items = {"farming:oat"}, rarity = 3},
		{items = {"farming:seed_oat 3"}},
		{items = {"farming:seed_oat 4"}, rarity = 2},
	}
}
core.register_node("farming:oat_S8", table.copy(def))

-- fuel
core.register_craft({
	type = "fuel",
	recipe = "farming:oat",
	burntime = 2,
})
