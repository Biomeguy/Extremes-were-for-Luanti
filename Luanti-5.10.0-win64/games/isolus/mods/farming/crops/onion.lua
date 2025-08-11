
local S = core.get_translator("farming")

-- onion
core.register_craftitem("farming:onion", {
	description = S("Onion"),
	inventory_image = "farming_onion.png",
	groups = {flammable = 2, herb = 1},
	on_use = core.item_eat(2, "farming:spent_biomasse"),

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

		return farming.place_seed(itemstack, placer, pointd, "farming:onion_S1")
	end,
})

-- onion soup
core.register_craftitem("farming:onion_soup", {
	description = S("Onion Soup"),
	inventory_image = "farming_onion_soup.png",
	groups = {flammable = 2},
	on_use = core.item_eat(6, "vessels:wood_bowl")
})

core.register_craft({
	type = "shapeless",
	output = "farming:onion_soup",
	recipe = {"farming:onion", "farming:onion", "farming:onion", "farming:onion",
		"farming:onion", "farming:onion", "group:boiling_water", "vessels:wood_bowl"},
	replacements = {
		{"farming:onion", "farming:spent_biomasse"},
		{"farming:onion", "farming:spent_biomasse"},
		{"farming:onion", "farming:spent_biomasse"},
		{"farming:onion", "farming:spent_biomasse"},
		{"farming:onion", "farming:spent_biomasse"},
		{"farming:onion", "farming:spent_biomasse"},
		{"group:boiling_water", "bucket:bucket_empty"}
	}
})

-- onion definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_onion_1.png"},
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:onion_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:onion_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_onion_2.png"}
def.next_plant = "farming:onion_S3"
core.register_node("farming:onion_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_onion_3.png"}
def.next_plant = "farming:onion_S4"
core.register_node("farming:onion_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_onion_4.png"}
def.next_plant = "farming:onion_S5"
def.drop = {
	items = {
		{items = {"farming:onion"}},
		{items = {"farming:onion 2"}, rarity = 3},
	}
}
core.register_node("farming:onion_S4", table.copy(def))

-- stage 5 (final)
def.tiles = {"farming_onion_5.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:onion 2"}},
		{items = {"farming:onion 3"}, rarity = 2},
	}
}
core.register_node("farming:onion_S5", table.copy(def))
