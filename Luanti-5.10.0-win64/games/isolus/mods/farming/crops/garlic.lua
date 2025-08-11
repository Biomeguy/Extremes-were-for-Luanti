
local S = core.get_translator("farming")

-- garlic
core.register_craftitem("farming:garlic_clove", {
	description = S("Garlic clove"),
	inventory_image = "farming_garlic_clove.png",
	groups = {flammable = 3},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:garlic_S1")
	end,
})

-- garlic bulb
core.register_craftitem("farming:garlic", {
	description = S("Garlic"),
	inventory_image = "farming_garlic.png",
	groups = {flammable = 3},
	on_use = core.item_eat(8, "farming:spent_biomasse 9"),
})

core.register_craft({
	output = "farming:garlic_clove 8",
	recipe = {
		{"farming:garlic"},
	}
})

core.register_craft({
	output = "farming:garlic",
	recipe = {
		{"farming:garlic_clove", "farming:garlic_clove", "farming:garlic_clove"},
		{"farming:garlic_clove", "", "farming:garlic_clove"},
		{"farming:garlic_clove", "farming:garlic_clove", "farming:garlic_clove"}
	}
})

-- garlic bread
core.register_craftitem("farming:garlic_bread", {
	description = S("Garlic Bread"),
	inventory_image = "farming_garlic_bread.png",
	groups = {flammable = 3},
	on_use = core.item_eat(2),
})

core.register_craft({
	type = "shapeless",
	output = "farming:garlic_bread",
	recipe = {"farming:toast", "farming:garlic_clove", "farming:garlic_clove"}
})

-- garlic braid
core.register_node("farming:garlic_braid", {
	description = S("Garlic Braid"),
	drawtype = "nodebox",
	tiles = {"farming_garlic_braid_side.png","farming_garlic_braid.png",
		"farming_garlic_braid_side.png^[transformFx","farming_garlic_braid_side.png",
		"farming_garlic_braid.png","farming_garlic_braid.png"},
	inventory_image = "farming_garlic_braid.png",
	wield_image = "farming_garlic_braid.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.13, -0.45, 0.5, 0.13, 0.45, 0.24},
		},
	},
	groups = {dig_immediate = 3, flammable = 3},
	sounds = default.node_sound_leaves_defaults(),
})

register_nine("farming:garlic_braid", "farming:garlic")

-- garlic definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_garlic_1.png"},
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
	next_plant = "farming:garlic_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:garlic_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_garlic_2.png"}
def.next_plant = "farming:garlic_S3"
core.register_node("farming:garlic_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_garlic_3.png"}
def.next_plant = "farming:garlic_S4"
core.register_node("farming:garlic_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_garlic_4.png"}
def.next_plant = "farming:garlic_S5"
core.register_node("farming:garlic_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_garlic_5.png"}
def.next_plant = "farming:garlic_S6"
core.register_node("farming:garlic_S5", table.copy(def))

-- stage 6 (final)
def.tiles = {"farming_garlic_6.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:garlic", "farming:spent_biomasse"}},
		{items = {"farming:garlic"}, rarity = 2},
	}
}
core.register_node("farming:garlic_S6", table.copy(def))
