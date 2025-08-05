
local S = core.get_translator("farming")

-- peanut
core.register_craftitem("farming:peanut", {
	description = S("Peanut"),
	inventory_image = "farming_peanut.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:peanut_S1")
	end,
})

-- peanut roasted
core.register_craftitem("farming:peanut_roasted", {
	description = S("Peanut Roasted"),
	inventory_image = "farming_peanut_roasted.png",
	groups = {flammable = 2},
	on_use = core.item_eat(4, "farming:spent_biomasse"),
})

core.register_craft({
	type = "cooking",
	output = "farming:peanut_roasted",
	recipe = "farming:peanut"
})

-- peanut butter
core.register_node("farming:peanut_butter", {
	description = S("Peanut Butter"),
	drawtype = "plantlike",
	tiles = {"farming_peanut_butter.png"},
	inventory_image = "farming_peanut_butter.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(6, "vessels:glass_jar"),
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, nut_butter = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "farming:peanut_butter",
	recipe = {
		{"farming:peanut_roasted", "farming:peanut_roasted", "farming:peanut_roasted"},
		{"farming:peanut_roasted", "farming:peanut_roasted", "farming:peanut_roasted"},
		{"farming:peanut_roasted", "vessels:glass_jar", "farming:peanut_roasted"}
	},
	replacements = {
		{"farming:peanut_roasted", "farming:spent_biomasse"},
		{"farming:peanut_roasted", "farming:spent_biomasse"},
		{"farming:peanut_roasted", "farming:spent_biomasse"},
		{"farming:peanut_roasted", "farming:spent_biomasse"},
		{"farming:peanut_roasted", "farming:spent_biomasse"},
		{"farming:peanut_roasted", "farming:spent_biomasse"},
		{"farming:peanut_roasted", "farming:spent_biomasse"},
		{"farming:peanut_roasted", "farming:spent_biomasse"}
	}
})

-- can be used as fuel
core.register_craft({
	type = "fuel",
	recipe = "farming:peanut",
	burntime = 5,
})

-- peanut definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_peanut_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 3, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:peanut_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:peanut_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_peanut_2.png"}
def.next_plant = "farming:peanut_S3"
core.register_node("farming:peanut_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_peanut_3.png"}
def.next_plant = "farming:peanut_S4"
def.drop = "farming:spent_biomasse 2"
core.register_node("farming:peanut_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_peanut_4.png"}
def.next_plant = "farming:peanut_S5"
core.register_node("farming:peanut_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_peanut_5.png"}
def.next_plant = "farming:peanut_S6"
core.register_node("farming:peanut_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_peanut_4.png^farming_peanut_6.png"}
def.next_plant = "farming:peanut_S7"
def.drop = {
	items = {
		{items = {"farming:peanut 3", "farming:spent_biomasse 2"}},
		{items = {"farming:peanut"}, rarity = 2},
		{items = {"farming:peanut 2"}, rarity = 3},
	}
}
core.register_node("farming:peanut_S6", table.copy(def))

-- stage 7 (final)
def.tiles = {"farming_peanut_4.png^farming_peanut_7.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:peanut 3", "farming:spent_biomasse 2"}},
		{items = {"farming:peanut 4"}, rarity = 2},
		{items = {"farming:peanut 6"}, rarity = 3},
	}
}
core.register_node("farming:peanut_S7", table.copy(def))
