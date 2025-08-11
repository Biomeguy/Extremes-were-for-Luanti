
local S = core.get_translator("farming")

-- snow pea
core.register_craftitem("farming:pea_snow", {
	description = S("Snow Pea"),
	inventory_image = "farming_pea_snow.png",
	groups = {flammable = 2},
	on_use = core.item_eat(1),
})

-- peas
core.register_craftitem("farming:pea", {
	description = S("Peas"),
	inventory_image = "farming_pea.png",
	groups = {flammable = 2},
	on_use = core.item_eat(1),
})

-- pea pod
core.register_craftitem("farming:pea_pod", {
	description = S("Pea Pod"),
	inventory_image = "farming_pea_pod.png",
	groups = {flammable = 2},
})

-- chickpeas
core.register_craftitem("farming:pea_chick", {
	description = S("Chick Peas"),
	inventory_image = "farming_pea_chick.png",
	groups = {flammable = 2},
	on_use = core.item_eat(2),

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

		return farming.place_seed(itemstack, placer, pointd, "farming:pea_S1")
	end,
})

-- pea leaves
core.register_craftitem("farming:pea_leaves", {
	description = S("Pea Leaves"),
	inventory_image = "farming_pea_leaves.png",
	groups = {greens = 1, flammable = 2},
	on_use = core.item_eat(2),
})

core.register_craft({
	output = "farming:pea 7",
	recipe = {
		{"farming:pea_pod"},
	}
})

-- pea soup
core.register_craftitem("farming:pea_soup", {
	description = S("Pea Soup"),
	inventory_image = "farming_pea_soup.png",
	groups = {flammable = 2},
	on_use = core.item_eat(12, "vessels:wood_bowl"),
})

core.register_craft({
	type = "shapeless",
	output = "farming:pea_soup",
	recipe = {"farming:pea_pod", "farming:pea_pod", "farming:pea_pod",
		"farming:pea_pod", "farming:pea_pod", "farming:pea_pod",
		"farming:pea_pod", "group:boiling_water", "vessels:wood_bowl"},
	replacements = {{"group:boiling_water", "bucket:bucket_empty"}}
})

-- pea definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_pea_1.png"},
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
	next_plant = "farming:pea_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:pea_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_pea_2.png"}
def.next_plant = "farming:pea_S3"
core.register_node("farming:pea_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_pea_3.png"}
def.next_plant = "farming:pea_S4"
core.register_node("farming:pea_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_pea_4.png"}
def.next_plant = "farming:pea_S5"
core.register_node("farming:pea_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_pea_5.png"}
def.next_plant = "farming:pea_S6"
core.register_node("farming:pea_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_pea_6.png"}
def.next_plant = "farming:pea_S7"
def.drop = {
	items = {
		{items = {"farming:pea_snow 3", "farming:spent_biomasse"}},
		{items = {"farming:pea_snow"}, rarity = 2},
		{items = {"farming:pea_snow"}, rarity = 3},
		{items = {"farming:pea_snow"}, rarity = 3},
		{items = {"farming:pea_leaves 3"}},
	}
}
core.register_node("farming:pea_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_pea_7.png"}
def.next_plant = "farming:pea_S8"
def.drop = {
	items = {
		{items = {"farming:pea_pod 3", "farming:spent_biomasse"}},
		{items = {"farming:pea_pod"}, rarity = 2},
		{items = {"farming:pea_pod"}, rarity = 3},
		{items = {"farming:pea_pod"}, rarity = 3},
		{items = {"farming:pea_leaves 3"}},
	}
}
core.register_node("farming:pea_S7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_pea_8.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:pea_chick 3", "farming:spent_biomasse"}},
		{items = {"farming:pea_chick"}, rarity = 2},
		{items = {"farming:pea_chick"}, rarity = 3},
		{items = {"farming:pea_chick"}, rarity = 3},
		{items = {"farming:pea_leaves 3"}},
	}
}
core.register_node("farming:pea_S8", table.copy(def))
