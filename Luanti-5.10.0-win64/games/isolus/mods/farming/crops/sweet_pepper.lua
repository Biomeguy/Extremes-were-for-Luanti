
local S = core.get_translator("farming")

-- sweet pepper seeds
core.register_craftitem("farming:sweet_pepper_seed", {
	description = S("Sweet Pepper Seed"),
	inventory_image = "farming_sweet_pepper_seed.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:sweet_pepper_S1")
	end,
})

-- green pepper
core.register_craftitem("farming:sweet_pepper_green", {
	description = S("Sweet Green Pepper"),
	inventory_image = "farming_sweet_pepper_green.png",
	groups = {sweet_pepper = 1, flammable = 2},
	on_use = core.item_eat(2, "farming:sweet_pepper_seed 15"),
})

-- yellow pepper
core.register_craftitem("farming:sweet_pepper_yellow", {
	description = S("Sweet Yellow Pepper"),
	inventory_image = "farming_sweet_pepper_yellow.png",
	groups = {sweet_pepper = 1, flammable = 2},
	on_use = core.item_eat(2, "farming:sweet_pepper_seed 15"),
})

-- orange pepper
core.register_craftitem("farming:sweet_pepper_orange", {
	description = S("Sweet Orange Pepper"),
	inventory_image = "farming_sweet_pepper_orange.png",
	groups = {sweet_pepper = 1, flammable = 2},
	on_use = core.item_eat(2, "farming:sweet_pepper_seed 15"),
})

-- red pepper
core.register_craftitem("farming:sweet_pepper_red", {
	description = S("Sweet Red Pepper"),
	inventory_image = "farming_sweet_pepper_red.png",
	groups = {sweet_pepper = 1, flammable = 2},
	on_use = core.item_eat(2, "farming:sweet_pepper_seed 15"),
})

-- purple pepper
core.register_craftitem("farming:sweet_pepper_purple", {
	description = S("Sweet Purple Pepper"),
	inventory_image = "farming_sweet_pepper_purple.png",
	groups = {sweet_pepper = 1, flammable = 2},
	on_use = core.item_eat(2, "farming:sweet_pepper_seed 15"),
})

-- sweet pepper definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_sweet_pepper_1.png"},
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
	next_plant = "farming:sweet_pepper_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:sweet_pepper_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_sweet_pepper_2.png"}
def.next_plant = "farming:sweet_pepper_S3"
core.register_node("farming:sweet_pepper_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_sweet_pepper_3.png"}
def.next_plant = "farming:sweet_pepper_S4"
def.drop = "farming:spent_biomasse 2"
core.register_node("farming:sweet_pepper_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_sweet_pepper_4.png"}
def.next_plant = "farming:sweet_pepper_S5"
core.register_node("farming:sweet_pepper_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_sweet_pepper_5.png"}
def.next_plant = "farming:sweet_pepper_S6"
core.register_node("farming:sweet_pepper_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_sweet_pepper_6.png"}
def.next_plant = "farming:sweet_pepper_S7"
def.drop = {
	items = {
		{items = {"farming:sweet_pepper_green 2"}},
		{items = {"farming:sweet_pepper_green"}, rarity = 2},
		{items = {"farming:sweet_pepper_green"}, rarity = 3},
	}
}
def.after_dig_node = function(pos)
	if math.random(10) == 1 then
	else
		core.set_node(pos, {name="farming:sweet_pepper_S4"})
		core.get_node_timer(pos):start(math.random(166, 286))
	end
end
core.register_node("farming:sweet_pepper_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_sweet_pepper_7.png"}
def.next_plant = "farming:sweet_pepper_S8"
def.drop = {
	items = {
		{items = {"farming:sweet_pepper_yellow 2"}},
		{items = {"farming:sweet_pepper_yellow"}, rarity = 2},
		{items = {"farming:sweet_pepper_yellow"}, rarity = 3},
	}
}
core.register_node("farming:sweet_pepper_S7", table.copy(def))

-- stage 8
def.tiles = {"farming_sweet_pepper_8.png"}
def.next_plant = "farming:sweet_pepper_S9"
def.drop = {
	items = {
		{items = {"farming:sweet_pepper_orange 2"}},
		{items = {"farming:sweet_pepper_orange"}, rarity = 2},
		{items = {"farming:sweet_pepper_orange"}, rarity = 3},
	}
}
core.register_node("farming:sweet_pepper_S8", table.copy(def))

-- stage 9
def.tiles = {"farming_sweet_pepper_9.png"}
def.next_plant = "farming:sweet_pepper_S10"
def.drop = {
	items = {
		{items = {"farming:sweet_pepper_red 2"}},
		{items = {"farming:sweet_pepper_red"}, rarity = 2},
		{items = {"farming:sweet_pepper_red"}, rarity = 3},
	}
}
core.register_node("farming:sweet_pepper_S9", table.copy(def))

-- stage 10
def.tiles = {"farming_sweet_pepper_10.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:sweet_pepper_purple 2"}},
		{items = {"farming:sweet_pepper_purple"}, rarity = 2},
		{items = {"farming:sweet_pepper_purple"}, rarity = 3},
	}
}
core.register_node("farming:sweet_pepper_S10", table.copy(def))
