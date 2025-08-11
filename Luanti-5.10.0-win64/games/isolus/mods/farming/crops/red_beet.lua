
local S = core.get_translator("farming")

-- red beet seeds
core.register_craftitem("farming:red_beet_seed", {
	description = S("Red Beet Seed"),
	inventory_image = "farming_red_beet_seed.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:red_beet_S1")
	end,
})

-- red beet
core.register_craftitem("farming:red_beet", {
	description = S("Red Beet"),
	inventory_image = "farming_red_beet.png",
	groups = {flammable = 2},
	on_use = core.item_eat(2, "farming:spent_biomasse"),
})

-- red beet leaves
core.register_craftitem("farming:red_beet_leaves", {
	description = S("Red Beet Leaves"),
	inventory_image = "farming_red_beet_leaves.png",
	groups = {greens = 1, flammable = 2},
	on_use = core.item_eat(2),
})

-- red beet soup
core.register_craftitem("farming:red_beet_soup", {
	description = S("Red Beet Soup"),
	inventory_image = "farming_red_beet_soup.png",
	groups = {flammable = 2},
	on_use = core.item_eat(15, "vessels:wood_bowl"),
})

core.register_craft({
	type = "shapeless",
	output = "farming:red_beet_soup",
	recipe = {"farming:red_beet", "farming:red_beet", "farming:red_beet", "farming:red_beet",
		"farming:red_beet", "farming:red_beet", "group:boiling_water", "vessels:wood_bowl"},
	replacements = {
		{"group:boiling_water", "bucket:bucket_empty"},
		{"farming:red_beet", "farming:spent_biomasse"},
		{"farming:red_beet", "farming:spent_biomasse"},
		{"farming:red_beet", "farming:spent_biomasse"},
		{"farming:red_beet", "farming:spent_biomasse"},
		{"farming:red_beet", "farming:spent_biomasse"},
		{"farming:red_beet", "farming:spent_biomasse"}
	}
})

-- red dye
core.register_craft({
	output = "dye:red 8",
	recipe = {
		{"farming:red_beet"},
	},
	replacements = {{"farming:red_beet", "farming:red_beet_leaves"}}
})

-- red beet definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_red_beet_1.png"},
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
	next_plant = "farming:red_beet_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:red_beet_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_red_beet_2.png"}
def.next_plant = "farming:red_beet_S3"
core.register_node("farming:red_beet_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_red_beet_3.png"}
def.next_plant = "farming:red_beet_S4"
def.drop = {
	items = {
		{items = {"farming:red_beet_leaves"}, rarity = 2},
	}
}
core.register_node("farming:red_beet_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_red_beet_4.png"}
def.next_plant = "farming:red_beet_S5"
def.drop = {
	items = {
		{items = {"farming:red_beet_leaves 2"}, rarity = 2},
	}
}
core.register_node("farming:red_beet_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_red_beet_5.png"}
def.next_plant = "farming:red_beet_S6"
core.register_node("farming:red_beet_S5", table.copy(def))

-- stage 6 (final)
def.tiles = {"farming_red_beet_6.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:red_beet_seed 2"}},
		{items = {"farming:red_beet_seed"}, rarity = 2},
		{items = {"farming:red_beet 3"}},
		{items = {"farming:red_beet"}, rarity = 2},
		{items = {"farming:red_beet"}, rarity = 3},
		{items = {"farming:red_beet_leaves"}, rarity = 3},
	}
}
core.register_node("farming:red_beet_S6", table.copy(def))
