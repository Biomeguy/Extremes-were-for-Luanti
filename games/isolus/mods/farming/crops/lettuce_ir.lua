
local S = core.get_translator("farming")

-- iceberg lettuce
core.register_craftitem("farming:lettuce_iceberg", {
	description = S("Iceberg Lettuce"),
	inventory_image = "farming_lettuce_iceberg.png",
	groups = {lettuce = 1, flammable = 2},
	on_use = core.item_eat(1, "farming:spent_biomasse"),

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

		return farming.place_seed(itemstack, placer, pointd, "farming:iceberg_lettuce_S1")
	end,
})

-- iceberg lettuce definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_lettuce_iceberg_1.png"},
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
	next_plant = "farming:iceberg_lettuce_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:iceberg_lettuce_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_lettuce_iceberg_2.png"}
def.next_plant = "farming:iceberg_lettuce_S3"
core.register_node("farming:iceberg_lettuce_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_lettuce_iceberg_3.png"}
def.next_plant = "farming:iceberg_lettuce_S4"
def.drop = {
	items = {
		{items = {"farming:lettuce_iceberg"}},
	}
}
core.register_node("farming:iceberg_lettuce_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_lettuce_iceberg_4.png"}
def.next_plant = "farming:iceberg_lettuce_S5"
def.drop = {
	items = {
		{items = {"farming:lettuce_iceberg 2"}},
	}
}
core.register_node("farming:iceberg_lettuce_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_lettuce_iceberg_5.png"}
def.next_plant = "farming:iceberg_lettuce_S6"
def.drop = {
	items = {
		{items = {"farming:lettuce_iceberg 3"}},
	}
}
core.register_node("farming:iceberg_lettuce_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_lettuce_iceberg_6.png"}
def.next_plant = "farming:iceberg_lettuce_S7"
core.register_node("farming:iceberg_lettuce_S6", table.copy(def))

-- stage 7 (final)
def.tiles = {"farming_lettuce_iceberg_7.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:lettuce_iceberg 3"}},
		{items = {"farming:lettuce_iceberg"}, rarity = 2},
	}
}
core.register_node("farming:iceberg_lettuce_S7", table.copy(def))

-- romaine lettuce
core.register_craftitem("farming:lettuce_romaine", {
	description = S("Romaine Lettuce"),
	inventory_image = "farming_lettuce_romaine.png",
	groups = {lettuce = 1, flammable = 2},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:romaine_lettuce_S1")
	end,
})

-- romaine lettuce definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_lettuce_romaine_1.png"},
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
	next_plant = "farming:romaine_lettuce_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:romaine_lettuce_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_lettuce_romaine_2.png"}
def.next_plant = "farming:romaine_lettuce_S3"
core.register_node("farming:romaine_lettuce_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_lettuce_romaine_3.png"}
def.next_plant = "farming:romaine_lettuce_S4"
def.drop = {
	items = {
		{items = {"farming:lettuce_romaine"}},
	}
}
core.register_node("farming:romaine_lettuce_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_lettuce_romaine_4.png"}
def.next_plant = "farming:romaine_lettuce_S5"
def.drop = {
	items = {
		{items = {"farming:lettuce_romaine 2"}},
	}
}
core.register_node("farming:romaine_lettuce_S4", table.copy(def))

-- stage 5 (final)
def.tiles = {"farming_lettuce_romaine_5.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:lettuce_romaine 3"}},
		{items = {"farming:lettuce_romaine 2"}, rarity = 2},
		{items = {"farming:lettuce_romaine"}, rarity = 2},
	}
}
core.register_node("farming:romaine_lettuce_S5", table.copy(def))
