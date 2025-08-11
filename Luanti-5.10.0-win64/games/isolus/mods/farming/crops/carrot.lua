
local S = core.get_translator("farming")

-- carrot
core.register_craftitem("farming:carrot", {
	description = S("Carrot"),
	inventory_image = "farming_carrot.png",
	groups = {carrot = 1, flammable = 2},
	on_use = core.item_eat(4),

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

		return farming.place_seed(itemstack, placer, pointd, "farming:carrot_S1")
	end,
})

-- carrot leaves
core.register_craftitem("farming:carrot_leaves", {
	description = S("Carrot Leaves"),
	inventory_image = "farming_carrot_leaves.png",
	groups = {greens = 1, flammable = 2},
	on_use = core.item_eat(2),
})

-- silver carrot
core.register_craftitem("farming:carrot_silver", {
	description = S("Silver Carrot"),
	inventory_image = "farming_carrot_silver.png",
	on_use = core.item_eat(10),
})

core.register_craft({
	output = "farming:carrot_silver",
	recipe = {
		{"", "default:silver_lump", ""},
		{"default:silver_lump", "farming:carrot", "default:silver_lump"},
		{"", "default:silver_lump", ""}
	}
})

-- carrot definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_carrot_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:carrot",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:carrot_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:carrot_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_carrot_2.png"}
def.next_plant = "farming:carrot_S3"
core.register_node("farming:carrot_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_carrot_3.png"}
def.next_plant = "farming:carrot_S4"
core.register_node("farming:carrot_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_carrot_4.png"}
def.next_plant = "farming:carrot_S5"
core.register_node("farming:carrot_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_carrot_5.png"}
def.next_plant = "farming:carrot_S6"
core.register_node("farming:carrot_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_carrot_6.png"}
def.next_plant = "farming:carrot_S7"
def.drop = {
	items = {
		{items = {"farming:carrot_leaves", "farming:carrot"}},
	}
}
core.register_node("farming:carrot_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_carrot_7.png"}
def.next_plant = "farming:carrot_S8"
def.drop = {
	items = {
		{items = {"farming:carrot"}},
		{items = {"farming:carrot 2"}, rarity = 3},
		{items = {"farming:carrot_leaves"}},
	}
}
core.register_node("farming:carrot_S7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_carrot_8.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:carrot 3"}},
		{items = {"farming:carrot"}, rarity = 2},
		{items = {"farming:carrot"}, rarity = 2},
		{items = {"farming:carrot_leaves 2"}},
	}
}
core.register_node("farming:carrot_S8", table.copy(def))
