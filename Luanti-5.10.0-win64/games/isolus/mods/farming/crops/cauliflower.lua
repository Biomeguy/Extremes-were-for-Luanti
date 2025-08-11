
local S = core.get_translator("farming")

-- cauliflower seeds
core.register_craftitem("farming:cauliflower_seed", {
	description = S("Cauliflower Seed"),
	inventory_image = "farming_cauliflower_seed.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:cauliflower_S1")
	end,
})

-- brocoli sprout
core.register_craftitem("farming:brocoli_sprout", {
	description = S("Brocoli Sprouts"),
	inventory_image = "farming_brocoli_sprout.png",
	groups = {flammable = 2},
	on_use = core.item_eat(7),

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

		return farming.place_seed(itemstack, placer, pointd, "farming:cauliflower_S1")
	end,
})

-- cabbage
core.register_craftitem("farming:cabbage", {
	description = S("Cabbage"),
	inventory_image = "farming_cabbage.png",
	groups = {flammable = 2},
	on_use = core.item_eat(3),
})

-- brocoli
core.register_craftitem("farming:brocoli", {
	description = S("Brocoli"),
	inventory_image = "farming_brocoli.png",
	groups = {flammable = 2},
	on_use = core.item_eat(4),
})

-- cauliflower
core.register_craftitem("farming:cauliflower", {
	description = S("Cauliflower"),
	inventory_image = "farming_cauliflower.png",
	groups = {flammable = 2},
	on_use = core.item_eat(5),
})

-- cauliflower leaves
core.register_craftitem("farming:cauliflower_leaves", {
	description = S("Cauliflower Leaves"),
	inventory_image = "farming_cauliflower_leaves.png",
	groups = {greens = 1, flammable = 2},
	on_use = core.item_eat(2),
})

-- cauliflower definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_cauliflower_1.png"},
	visual_scale = 2.,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:brocoli_sprout",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:cauliflower_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:cauliflower_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_cauliflower_2.png"}
def.next_plant = "farming:cauliflower_S3"
core.register_node("farming:cauliflower_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_cauliflower_3.png"}
def.next_plant = "farming:cauliflower_S4"
def.drop = "farming:cauliflower_leaves",
core.register_node("farming:cauliflower_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_cauliflower_4.png"}
def.next_plant = "farming:cauliflower_S5"
core.register_node("farming:cauliflower_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_cauliflower_5.png"}
def.next_plant = "farming:cauliflower_S6"
def.drop = "farming:cauliflower_leaves 2"
core.register_node("farming:cauliflower_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_cauliflower_6.png"}
def.next_plant = "farming:cauliflower_S7"
def.drop = "farming:cauliflower_leaves 3"
core.register_node("farming:cauliflower_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_cauliflower_7.png"}
def.next_plant = "farming:cauliflower_S8"
def.drop = {
	items = {
		{items = {"farming:cabbage"}},
		{items = {"farming:cauliflower_leaves 2"}},
	}
}
core.register_node("farming:cauliflower_S7", table.copy(def))

-- stage 8
def.tiles = {"farming_cauliflower_8.png"}
def.next_plant = "farming:cauliflower_S9"
def.drop = {
	items = {
		{items = {"farming:brocoli 3"}},
		{items = {"farming:brocoli"}, rarity = 2},
		{items = {"farming:brocoli"}, rarity = 3},
		{items = {"farming:cauliflower_leaves 3"}},
	}
}
core.register_node("farming:cauliflower_S8", table.copy(def))

-- stage 9 (final)
def.tiles = {"farming_cauliflower_9.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:cauliflower"}},
		{items = {"farming:cauliflower_seed 2"}, rarity = 2},
		{items = {"farming:cauliflower_seed"}, rarity = 2},
		{items = {"farming:cauliflower_leaves 3"}},
	}
}
core.register_node("farming:cauliflower_S9", table.copy(def))
