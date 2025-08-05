
local S = core.get_translator("farming")

--	Original textures from DocFarming mod
--	https://forum.minetest.net/viewtopic.php?id=3948

-- potato
core.register_craftitem("farming:potato", {
	description = S("Potato"),
	inventory_image = "farming_potato.png",
	groups = {flammable = 2},
	on_use = function(itemstack, user, pointd)
		if user then
			if math.random(3) == 1 then
				return core.do_item_eat(-1, nil, itemstack, user, pointd)
			else
				return core.do_item_eat(1, nil, itemstack, user, pointd)
			end
		end
	end,

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

		return farming.place_seed(itemstack, placer, pointd, "farming:potato_S1")
	end,
})

-- poisonous potato
core.register_craftitem("farming:poisonous_potato", {
	description = S("Poisonous Potato"),
	inventory_image = "farming_poisonous_potato.png",
	groups = {poison = 1, flammable = 2},
	on_use = core.item_eat(-4),

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

		return farming.place_seed(itemstack, placer, pointd, "farming:potato_S1")
	end,
})

-- baked potato
core.register_craftitem("farming:baked_potato", {
	description = S("Baked Potato"),
	inventory_image = "farming_baked_potato.png",
	on_use = core.item_eat(6),
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming:baked_potato",
	recipe = "farming:potato"
})

-- potato and cucumber salad
core.register_craftitem("farming:potato_salad", {
	description = S("Cucumber and Potato Salad"),
	inventory_image = "farming_potato_salad.png",
	on_use = core.item_eat(10, "vessels:wood_bowl"),
})

core.register_craft({
	output = "farming:potato_salad",
	recipe = {
		{"farming:cucumber"},
		{"farming:baked_potato"},
		{"vessels:wood_bowl"},
	}
})

-- potato definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_potato_1.png"},
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
	next_plant = "farming:potato_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:potato_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_potato_2.png"}
def.next_plant = "farming:potato_S3"
core.register_node("farming:potato_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_potato_3.png"}
def.next_plant = "farming:potato_S4"
def.drop = {
	items = {
		{items = {"farming:potato 2", "farming:spent_biomasse"}},
		{items = {"farming:potato 4"}, rarity = 3},
	}
}
core.register_node("farming:potato_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_potato_4.png"}
def.next_plant = nil
def.drop = {
	max_items = 1,
	items = {
		{items = {"farming:potato 5", "farming:poisonous_potato 3", "farming:spent_biomasse"}, rarity = 2},
		{items = {"farming:potato 8", "farming:spent_biomasse"}, rarity = 2},
		{items = {"farming:potato 5", "farming:spent_biomasse"}},
	}
}
core.register_node("farming:potato_S4", table.copy(def))
