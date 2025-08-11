
local S = core.get_translator("farming")

-- kohlrabi seeds
core.register_craftitem("farming:kohlrabi_seed", {
	description = S("Kohlrabi Seed"),
	inventory_image = "farming_kohlrabi_seed.png",
	groups = {flammable = 2},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:kohlrabi_S1")
	end,
})

-- kohlrabi
core.register_craftitem("farming:kohlrabi", {
	description = S("Kohlrabi"),
	inventory_image = "farming_kohlrabi.png",
	groups = {flammable = 2},
	on_use = core.item_eat(3),
})

core.register_craftitem("farming:kohlrabi_leaves_cooked", {
	description = S("Cooked Kohlrabi Leaves"),
	inventory_image = "farming_kohlrabi_leaves_cooked.png",
	groups = {greens = 1, flammable = 2},
	on_use = core.item_eat(3),
})

core.register_craftitem("farming:kohlrabi_cooked", {
	description = S("Cooked Kohlrabi"),
	inventory_image = "farming_kohlrabi_cooked.png",
	groups = {flammable = 2},
	on_use = core.item_eat(4),
})

-- kohlrabi soup
core.register_craftitem("farming:kohlrabi_soup", {
	description = S("Kohlrabi Soup"),
	inventory_image = "farming_kohlrabi_soup.png",
	groups = {flammable = 2},
	on_use = core.item_eat(5, "vessels:wood_bowl"),
})

core.register_craft({
	type = "shapeless",
	output = "farming:kohlrabi_soup",
	recipe = {"farming:kohlrabi_cooked", "farming:kohlrabi_cooked", "farming:parsley",
		"group:food_oil", "group:boiling_water", "vessels:wood_bowl"},
	replacements = {
		{"group:boiling_water", "bucket:bucket_empty"},
		{"group:food_oil", "vessels:glass_bottle"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming:kohlrabi_cooked",
	recipe = "farming:kohlrabi",
    replacements = {{"farming:kohlrabi", "farming:kohlrabi_leaves_cooked"}}
})

-- can be used as fuel
core.register_craft({
	type = "fuel",
	recipe = "farming:kohlrabi",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "farming:kohlrabi_cooked",
	burntime = 4,
})

-- kohlrabi definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"farming_kohlrabi_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:kohlrabi_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:kohlrabi_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_kohlrabi_2.png"}
def.next_plant = "farming:kohlrabi_S3"
core.register_node("farming:kohlrabi_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_kohlrabi_3.png"}
def.next_plant = "farming:kohlrabi_S4"
core.register_node("farming:kohlrabi_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_kohlrabi_4.png"}
def.next_plant = "farming:kohlrabi_S5"
core.register_node("farming:kohlrabi_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_kohlrabi_5.png"}
def.next_plant = "farming:kohlrabi_S6"
def.drop = {
	items = {
		{items = {"farming:kohlrabi"}},
	}
}
core.register_node("farming:kohlrabi_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_kohlrabi_6.png"}
def.next_plant = "farming:kohlrabi_S7"
def.drop = {
	items = {
		{items = {"farming:kohlrabi"}},
		{items = {"farming:kohlrabi_seed 2"}, rarity = 3},
	}
}
core.register_node("farming:kohlrabi_S6", table.copy(def))

-- stage 7 (final)
def.tiles = {"farming_kohlrabi_7.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:kohlrabi"}},
		{items = {"farming:kohlrabi_seed 5"}, rarity = 2},
	}
}
core.register_node("farming:kohlrabi_S7", table.copy(def))
