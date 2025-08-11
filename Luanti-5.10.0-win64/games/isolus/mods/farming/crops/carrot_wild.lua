
local S = core.get_translator("farming")

-- wild carrot
core.register_craftitem("farming:wildcarrot", {
	description = S("Wild Carrot"),
	inventory_image = "farming_wildcarrot.png",
	groups = {carrot = 1, flammable = 2},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:wildcarrot_S1")
	end,
})

-- queen anne's lace gives wildcarrot and white dye
core.register_craft({
	output = "farming:wildcarrot",
	recipe = {{"farming:wildcarrot_S8"}},
	replacements = {{"farming:wildcarrot_S8", "dye:white 4"}}
})

-- wild carrot definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_wildcarrot_1.png"},
	waving = 1,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:wildcarrot",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:wildcarrot_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:wildcarrot_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_wildcarrot_2.png"}
def.next_plant = "farming:wildcarrot_S3"
core.register_node("farming:wildcarrot_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_wildcarrot_3.png"}
def.next_plant = "farming:wildcarrot_S4"
core.register_node("farming:wildcarrot_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_wildcarrot_4.png"}
def.next_plant = "farming:wildcarrot_S5"
core.register_node("farming:wildcarrot_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_wildcarrot_5.png"}
def.next_plant = "farming:wildcarrot_S6"
core.register_node("farming:wildcarrot_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_wildcarrot_6.png"}
def.next_plant = "farming:wildcarrot_S7"
core.register_node("farming:wildcarrot_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_wildcarrot_7.png"}
def.next_plant = "farming:wildcarrot_S8"
core.register_node("farming:wildcarrot_S7", table.copy(def))

-- stage 8 (final)
def.description = S("Queen Anne's Lace")
def.tiles = {"farming_wildcarrot_8.png"}
def.inventory_image = "farming_wildcarrot_8.png"
def.next_plant = nil
def.drop = {
	max_items = 1,
	items = {
		{items = {"farming:carrot"}, rarity = 12},
		{items = {"farming:wildcarrot", "farming:wildcarrot"}, rarity = 6},
		{items = {"farming:wildcarrot"}, rarity = 3},
		{items = {"farming:wildcarrot_S8"}},
	}
}
def.selection_box = {
	type = "fixed",
	fixed = {-2/16, -.5, -2/16, 2/16, 5/16, 2/16}
}
def.groups = {snappy = 3, flammable = 2, plant = 1, attached_node = 1}
core.register_node("farming:wildcarrot_S8", table.copy(def))
