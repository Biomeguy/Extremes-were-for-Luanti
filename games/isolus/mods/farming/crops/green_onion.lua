
local S = core.get_translator("farming")

-- green onion
core.register_craftitem("farming:green_onions", {
	description = S("Green Onions"),
	inventory_image = "farming_green_onions.png",
	groups = {flammable = 2, herb = 1},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:green_onion_S1")
	end,
})

-- green onion definition
local def = {
	drawtype = "mesh",
	mesh = "reed.obj",
	tiles = {"farming_green_onion_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:green_onions",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:green_onion_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:green_onion_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_green_onion_2.png"}
def.next_plant = "farming:green_onion_S3"
core.register_node("farming:green_onion_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_green_onion_3.png"}
def.next_plant = "farming:green_onion_S4"
def.drop = "farming:green_onions 2"
core.register_node("farming:green_onion_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_green_onion_4.png"}
def.next_plant = "farming:green_onion_S5"
core.register_node("farming:green_onion_S4", table.copy(def))

-- stage 5 (final)
def.tiles = {"farming_green_onion_5.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:green_onions 2"}},
		{items = {"farming:green_onions 2"}, rarity = 2},
		{items = {"farming:green_onions"}, rarity = 3},
	}
}
core.register_node("farming:green_onion_S5", table.copy(def))

-- wild green onion
core.register_node("farming:wild_green_onion", {
	drawtype = "plantlike",
	tiles = {"farming_green_onion_5.png"},
	waving = 1,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"farming:green_onions"}},
			{items = {"farming:green_onions"}, rarity = 2},
			{items = {"farming:green_onions 2"}, rarity = 3},
		}
	},
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})
