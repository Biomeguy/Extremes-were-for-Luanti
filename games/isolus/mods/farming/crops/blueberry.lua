
local S = core.get_translator("farming")

-- blueberries
core.register_craftitem("farming:blueberries", {
	description = S("Blueberries"),
	inventory_image = "farming_blueberries.png",
	groups = {blueberry = 1, flammable = 2},
	on_use = core.item_eat(1),

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

		return farming.place_seed(itemstack, placer, pointd, "farming:blueberry_S1")
	end,
})

-- blueberry muffin (thanks to sosogirl123 @ deviantart.com for muffin image)
core.register_craftitem("farming:blueberry_muffin", {
	description = S("Blueberry Muffin"),
	inventory_image = "farming_blueberry_muffin.png",
	on_use = core.item_eat(4),
})

core.register_craftitem("farming:blueberry_muffin_dough", {
	description = S("Blueberry Muffin Dough"),
	inventory_image = "farming_blueberry_muffin_dough.png",
	on_use = function(itemstack, user, pointd)
		if user then
			if math.random(3) == 1 then
				return core.do_item_eat(-1, nil, itemstack, user, pointd)
			else
				return core.do_item_eat(1, nil, itemstack, user, pointd)
			end
		end
	end,
})

core.register_craft({
	type = "shapeless",
	output = "farming:blueberry_muffin_dough",
	recipe = {"farming:blueberries", "group:dough", "farming:blueberries", "group:sugar", "group:egg"}
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:blueberry_muffin 2",
	recipe = "farming:blueberry_muffin_dough"
})

-- blueberry definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"farming_blueberry_1.png"},
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
	heat_min = 19,
	heat_max = 86,
	humidity_min = 26,
	next_plant = "farming:blueberry_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:blueberry_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_blueberry_2.png"}
def.next_plant = "farming:blueberry_S3"
core.register_node("farming:blueberry_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_blueberry_3.png"}
def.next_plant = "farming:blueberry_S4"
core.register_node("farming:blueberry_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_blueberry_4.png"}
def.next_plant = "farming:blueberry_S5"
core.register_node("farming:blueberry_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_blueberry_5.png"}
def.next_plant = "farming:blueberry_S6"
core.register_node("farming:blueberry_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_blueberry_6.png"}
def.next_plant = "farming:blueberry_S7"
core.register_node("farming:blueberry_S6", table.copy(def))

-- stage 7 (final)
def.tiles = {"farming_blueberry_7.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:blueberries 4"}},
		{items = {"farming:blueberries 6"}, rarity = 2},
		{items = {"farming:blueberries 9"}, rarity = 3},
	}
}
def.after_dig_node = function(pos)
	if math.random(30) == 1 then
	else
		core.set_node(pos, {name="farming:blueberry_S5"})
		core.get_node_timer(pos):start(math.random(166, 286))
	end
end
core.register_node("farming:blueberry_S7", table.copy(def))
