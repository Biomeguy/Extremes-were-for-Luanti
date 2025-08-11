
local S = core.get_translator("farming")

-- ginger
core.register_craftitem("farming:ginger", {
	description = S("Ginger"),
	inventory_image = "farming_ginger.png",
	groups = {flammable = 3},
	on_use = core.item_eat(1),

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

		return farming.place_seed(itemstack, placer, pointd, "farming:ginger_S1")
	end,
})

-- ginger definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_ginger_1.png"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:ginger_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:ginger_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_ginger_2.png"}
def.next_plant = "farming:ginger_S3"
core.register_node("farming:ginger_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_ginger_3.png"}
def.next_plant = "farming:ginger_S4"
core.register_node("farming:ginger_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_ginger_4.png"}
def.next_plant = "farming:ginger_S5"
core.register_node("farming:ginger_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_ginger_5.png"}
def.next_plant = "farming:ginger_S6"
core.register_node("farming:ginger_S5", table.copy(def))

-- stage 6 (final)
def.tiles = {"farming_ginger_6.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:ginger"}},
		{items = {"farming:ginger"}, rarity = 2},
		{items = {"farming:ginger"}, rarity = 3},
	}
}
core.register_node("farming:ginger_S6", table.copy(def))
