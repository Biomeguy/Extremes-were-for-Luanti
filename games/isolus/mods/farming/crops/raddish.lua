
local S = core.get_translator("farming")

-- raddish
core.register_craftitem("farming:raddish", {
	description = S("Raddish"),
	inventory_image = "farming_raddish.png",
	groups = {flammable = 2},
	on_use = core.item_eat(3),

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

		return farming.place_seed(itemstack, placer, pointd, "farming:raddish_S1")
	end,
})

-- raddish leaves
core.register_craftitem("farming:raddish_leaves", {
	description = S("Raddish Leaves"),
	inventory_image = "farming_raddish_leaves.png",
	groups = {greens = 1, flammable = 2},
	on_use = core.item_eat(2),
})

-- raddish definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"farming_raddish_1.png"},
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
	next_plant = "farming:raddish_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:raddish_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_raddish_2.png"}
def.next_plant = "farming:raddish_S3"
core.register_node("farming:raddish_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_raddish_3.png"}
def.next_plant = "farming:raddish_S4"
def.drop = "farming:raddish_leaves"
core.register_node("farming:raddish_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_raddish_4.png"}
def.next_plant = "farming:raddish_S5"
core.register_node("farming:raddish_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_raddish_5.png"}
def.next_plant = "farming:raddish_S6"
def.drop = {
	items = {
		{items = {"farming:raddish"}},
		{items = {"farming:raddish 2"}, rarity = 3},
		{items = {"farming:raddish_leaves"}},
	}
}
core.register_node("farming:raddish_S5", table.copy(def))

-- stage 6 (final)
def.tiles = {"farming_raddish_6.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:raddish 3"}},
		{items = {"farming:raddish 2"}, rarity = 2},
		{items = {"farming:raddish_leaves 2"}},
	}
}
core.register_node("farming:raddish_S6", table.copy(def))
