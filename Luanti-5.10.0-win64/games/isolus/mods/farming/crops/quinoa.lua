
local S = core.get_translator("farming")

-- quinoa seeds
core.register_node("farming:seed_quinoa", {
	description = S("Quinoa"),
	tiles = {"farming_quinoa_seed.png"},
	inventory_image = "farming_quinoa_seed.png",
	wield_image = "farming_quinoa_seed.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:seed_quinoa")
	end,
	next_plant = "farming:quinoa_S1",
	on_timer = farming.grow_plant,
})

-- harvested quinoa / flour / dough / bread
core.register_craftitem("farming:quinoa", {
	description = S("Quinoa Stalks"),
	inventory_image = "farming_quinoa.png",
	groups = {grain = 1, flammable = 2},
})

-- quinoa leaves
core.register_craftitem("farming:quinoa_leaves", {
	description = S("Quinoa Leaves"),
	inventory_image = "farming_quinoa_leaves.png",
	groups = {greens = 1, flammable = 2},
	on_use = core.item_eat(2),
})

-- cooked quinoa
core.register_craftitem("farming:quinoa_cooked", {
	description = "Cooked Quinoa",
	inventory_image = "farming_quinoa_cooked.png",
	groups = {flammable = 2},
	on_use = core.item_eat(3, "vessels:wood_bowl")
})

core.register_craft({
	output = "farming:quinoa_cooked",
	recipe = {
		{"farming:quinoa"},
		{"group:boiling_water"},
		{"vessels:wood_bowl"},
	},
	replacements = {
		{"group:boiling_water", "bucket:bucket_empty"},
		{"farming:quinoa", "farming:straw_pile"}
	}
})

core.register_craftitem("farming:quinoa_flour", {
	description = S("Quinoa Flour"),
	inventory_image = "farming_quinoa_flour.png",
	groups = {flour = 1, flammable = 1},
})

core.register_craftitem("farming:quinoa_dough", {
	description = S("Quinoa Dough"),
	inventory_image = "farming_quinoa_dough.png",
	groups = {dough = 1, flammable = 1},
})

core.register_craftitem("farming:quinoa_bread", {
	description = S("Quinoa Bread"),
	inventory_image = "farming_quinoa_bread.png",
	on_use = core.item_eat(5),
	groups = {bread = 1, flammable = 2},
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:quinoa_bread",
	recipe = "farming:quinoa_dough"
})

register_dough("farming:quinoa_dough", "farming:quinoa_flour", "farming:quinoa", "farming:seed_quinoa")

-- quinoa definition
local def = {
	drawtype = "mesh",
	mesh = "reed.obj",
	tiles = {"farming_quinoa_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"farming:quinoa_leaves"}},
			{items = {"farming:quinoa_leaves 2"}, rarity = 2},
			{items = {"farming:quinoa_leaves 3"}, rarity = 2},
		}
	},
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 4, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:quinoa_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:quinoa_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_quinoa_2.png"}
def.next_plant = "farming:quinoa_S3"
core.register_node("farming:quinoa_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_quinoa_3.png"}
def.next_plant = "farming:quinoa_S4"
core.register_node("farming:quinoa_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_quinoa_4.png"}
def.next_plant = "farming:quinoa_S5"
core.register_node("farming:quinoa_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_quinoa_5.png"}
def.next_plant = "farming:quinoa_S6"
def.drop = {
	items = {
		{items = {"farming:quinoa"}, rarity = 2},
		{items = {"farming:seed_quinoa 2"}},
		{items = {"farming:quinoa_leaves"}},
		{items = {"farming:quinoa_leaves 2"}, rarity = 2},
		{items = {"farming:quinoa_leaves 3"}, rarity = 2},
	}
}
core.register_node("farming:quinoa_S5", table.copy(def))

-- stage 6 (final)
def.tiles = {"farming_quinoa_6.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:quinoa 3"}},
		{items = {"farming:quinoa"}, rarity = 3},
		{items = {"farming:seed_quinoa 3"}},
		{items = {"farming:seed_quinoa 4"}, rarity = 2},
		{items = {"farming:quinoa_leaves 2"}},
		{items = {"farming:quinoa_leaves 3"}, rarity = 2},
	}
}
core.register_node("farming:quinoa_S6", table.copy(def))

-- wild quinoa
core.register_node("farming:wild_quinoa", {
	drawtype = "plantlike",
	tiles = {"farming_quinoa_6.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"farming:quinoa"}, rarity = 2},
			{items = {"farming:seed_quinoa 2"}},
			{items = {"farming:quinoa_leaves"}},
			{items = {"farming:quinoa_leaves 2"}, rarity = 2},
			{items = {"farming:quinoa_leaves 3"}, rarity = 2},
		}
	},
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-- fuel
core.register_craft({
	type = "fuel",
	recipe = "farming:quinoa",
	burntime = 2,
})
