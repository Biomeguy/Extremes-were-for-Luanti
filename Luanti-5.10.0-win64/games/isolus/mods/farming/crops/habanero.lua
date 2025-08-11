
local S = core.get_translator("farming")

-- habanero pepper
core.register_craftitem("farming:habanero", {
	description = S("Habanero Pepper"),
	inventory_image = "farming_habanero.png",
	groups = {hot_pepper = 1, flammable = 2},
	on_use = core.item_eat(3, "farming:spent_biomasse"),

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

		return farming.place_seed(itemstack, placer, pointd, "farming:habanero_S1")
	end,
})

-- habanero can be used for orange dye
core.register_craft({
	output = "dye:orange",
	recipe = {
		{"farming:habanero"},
	},
	replacements = {{"farming:habanero", "farming:spent_biomasse"}}
})

-- habanero definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_chili_1.png"},
	waving = 1,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:habanero_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:habanero_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_chili_2.png"}
def.next_plant = "farming:habanero_S3"
core.register_node("farming:habanero_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_chili_3.png"}
def.next_plant = "farming:habanero_S4"
core.register_node("farming:habanero_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_chili_4.png"}
def.next_plant = "farming:habanero_S5"
core.register_node("farming:habanero_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_chili_5.png"}
def.next_plant = "farming:habanero_S6"
core.register_node("farming:habanero_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_chili_6.png"}
def.next_plant = "farming:habanero_S7"
core.register_node("farming:habanero_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_habanero_7.png"}
def.next_plant = "farming:habanero_S8"
core.register_node("farming:habanero_S7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_habanero_8.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:habanero 3", "farming:spent_biomasse"}},
		{items = {"farming:habanero 2"}, rarity = 2},
	}
}
core.register_node("farming:habanero_S8", table.copy(def))
