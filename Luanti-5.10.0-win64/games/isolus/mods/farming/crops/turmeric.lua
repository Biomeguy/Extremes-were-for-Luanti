
local S = core.get_translator("farming")

-- turmeric
core.register_craftitem("farming:turmeric", {
	description = S("Turmeric"),
	inventory_image = "farming_turmeric.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:turmeric_S1")
	end,
})

-- turmeric plant gives turmeric and magenta dye
core.register_craft({
	output = "farming:turmeric 3",
	recipe = {{"farming:turmeric_S7"}},
	replacements = {{"farming:turmeric_S7", "dye:magenta 4"}}
})

-- turmeric to orange dye
core.register_craft({
	output = "dye:orange 4",
	recipe = {{"farming:turmeric"}}
})

-- turmeric definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_turmeric_1.png"},
	paramtype = "light",
	visual_scale = 1.5,
	waving = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 3, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	heat_max = 86,
	humidity_min = 24,
	next_plant = "farming:turmeric_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:turmeric_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_turmeric_2.png"}
def.next_plant = "farming:turmeric_S3"
core.register_node("farming:turmeric_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_turmeric_3.png"}
def.next_plant = "farming:turmeric_S4"
core.register_node("farming:turmeric_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_turmeric_4.png"}
def.next_plant = "farming:turmeric_S5"
core.register_node("farming:turmeric_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_turmeric_5.png"}
def.next_plant = "farming:turmeric_S6"
core.register_node("farming:turmeric_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_turmeric_6.png"}
def.next_plant = "farming:turmeric_S7"
core.register_node("farming:turmeric_S6", table.copy(def))

-- stage 7 (final)
def.description = S("Turmeric Plant")
def.tiles = {"farming_turmeric_7.png"}
def.inventory_image = "farming_turmeric_7.png"
def.next_plant = nil
def.drop = nil
def.selection_box = {
	type = "fixed",
	fixed = {-3/16, -0.5, -3/16, 3/16, .5, 3/16}
}
def.groups = {snappy = 3, flammable = 2, plant = 1, attached_node = 1}
core.register_node("farming:turmeric_S7", table.copy(def))
