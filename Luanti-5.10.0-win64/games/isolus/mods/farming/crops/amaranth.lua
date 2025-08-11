
local S = core.get_translator("farming")

-- amaranth seeds
core.register_node("farming:seed_amaranth", {
	description = S("Amaranth"),
	tiles = {"farming_amaranth_seed.png"},
	inventory_image = "farming_amaranth_seed.png",
	wield_image = "farming_amaranth_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	sounds = default.node_sound_dirt_defaults({
		dig = {name = "", gain = 0},
		dug = {name = "default_grass_footstep", gain = .2},
		place = {name = "", gain = 0},
	}),
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

		return farming.place_seed(itemstack, placer, pointd, "farming:seed_amaranth")
	end,
	next_plant = "farming:amaranth_S1",
	on_timer = farming.grow_plant,
})

-- harvested amaranth / leaves / flour / dough / bread
core.register_craftitem("farming:amaranth", {
	description = S("Amaranth Stalks"),
	inventory_image = "farming_amaranth.png",
	groups = {grain = 1, amaranth = 1, flammable = 2},
})

core.register_craftitem("farming:amaranth_magenta", {
	description = S("Magenta Amaranth Stalks"),
	inventory_image = "farming_amaranth_magenta.png",
	groups = {grain = 1, amaranth = 1, flammable = 2},
})

core.register_craftitem("farming:amaranth_leaves", {
	description = S("Amaranth Leaves"),
	inventory_image = "farming_quinoa_leaves.png",
	groups = {greens = 1, flammable = 2},
	on_use = core.item_eat(2),
})

core.register_craftitem("farming:amaranth_flour", {
	description = S("Amaranth Flour"),
	inventory_image = "farming_quinoa_flour.png",
	groups = {flour = 1, flammable = 1},
})

core.register_craftitem("farming:amaranth_dough", {
	description = S("Amaranth Dough"),
	inventory_image = "farming_quinoa_dough.png",
	groups = {dough = 1, flammable = 1},
})

core.register_craftitem("farming:amaranth_bread", {
	description = S("Amaranth Bread"),
	inventory_image = "farming_quinoa_bread.png",
	on_use = core.item_eat(5),
	groups = {bread = 1, flammable = 2},
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:amaranth_bread",
	recipe = "farming:amaranth_dough"
})

register_dough("farming:amaranth_dough", "farming:amaranth_flour", "group:amaranth", "farming:seed_amaranth")

-- cooked amaranth
core.register_craftitem("farming:amaranth_cooked", {
	description = "Cooked Amaranth",
	inventory_image = "farming_amaranth_cooked.png",
	groups = {flammable = 2},
	on_use = core.item_eat(3, "vessels:wood_bowl")
})

core.register_craft({
	output = "farming:amaranth_cooked",
	recipe = {
		{"farming:amaranth"},
		{"group:boiling_water"},
		{"vessels:wood_bowl"},
	},
	replacements = {
		{"group:boiling_water", "bucket:bucket_empty"},
		{"farming:amaranth", "farming:straw_pile"}
	}
})

-- amaranth plant gives amaranth and red dye
core.register_craft({
	output = "farming:amaranth 5",
	recipe = {
		{"farming:amaranth_S6"},
	},
	replacements = {{"farming:amaranth_S6", "dye:red"}}
})

-- magenta amaranth plant gives magenta amaranth and magenta dye
core.register_craft({
	output = "farming:amaranth_magenta 5",
	recipe = {
		{"farming:amaranth2_S6"},
	},
	replacements = {{"farming:amaranth2_S6", "dye:magenta"}}
})

-- amaranth definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"farming_amaranth_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"farming:amaranth_leaves"}},
			{items = {"farming:amaranth_leaves 2"}, rarity = 2},
			{items = {"farming:amaranth_leaves 3"}, rarity = 2},
		}
	},
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:amaranth_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:amaranth_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_amaranth_2.png"}
def.next_plant = "farming:amaranth_S3"
core.register_node("farming:amaranth_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_amaranth_3.png"}
def.next_plant = "farming:amaranth_S4"
core.register_node("farming:amaranth_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_amaranth_4.png"}
def.next_plant = "farming:amaranth_S5"-- Dummy
def.on_timer = function(pos, elapsed)

	local meta = core.get_meta(pos)
	if not farming.can_grow(pos) and meta:get_int("soil_need") < 1 then
		core.get_node_timer(pos):start(math.random(40, 80))
		return
	end

	local light_level = 11
	if meta:get_int("light_level") > 0 then
		light_level = light_level - (meta:get_int("light_level") * 3)
		meta:set_int("light_level", 0)
	end
	-- check light
	local light = core.get_node_light(pos)
	if not light or light < light_level then
		core.get_node_timer(pos):start(math.random(40, 80))
		return
	end

	-- grow
	local placenode = {name = "farming:amaranth_S5"}
	if math.random(3) == 1 then
		placenode = {name = "farming:amaranth2_S5"}
	end
	core.swap_node(pos, placenode)
	core.get_node_timer(pos):start(math.random(166, 286))
	return
end
core.register_node("farming:amaranth_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_amaranth_5.png"}
def.next_plant = "farming:amaranth_S6"
def.on_timer = farming.grow_plant
def.drop = {
	items = {
		{items = {"farming:amaranth"}, rarity = 2},
		{items = {"farming:seed_amaranth 2"}},
		{items = {"farming:amaranth_leaves"}},
		{items = {"farming:amaranth_leaves 2"}, rarity = 2},
		{items = {"farming:amaranth_leaves 3"}, rarity = 2},
	}
}
core.register_node("farming:amaranth_S5", table.copy(def))

-- stage 5 magenta
def.tiles = {"farming_amaranth_magenta_5.png"}
def.next_plant = "farming:amaranth2_S6"
def.drop = {
	items = {
		{items = {"farming:amaranth_magenta"}, rarity = 2},
		{items = {"farming:seed_amaranth 2"}},
		{items = {"farming:amaranth_leaves"}},
		{items = {"farming:amaranth_leaves 2"}, rarity = 2},
		{items = {"farming:amaranth_leaves 3"}, rarity = 2},
	}
}
core.register_node("farming:amaranth2_S5", table.copy(def))

-- stage 6 (final)
def.description = S("Amaranth Plant")
def.tiles = {"farming_amaranth_6.png"}
def.inventory_image = "farming_amaranth_6.png"
def.wield_image = "farming_amaranth_6.png"
def.next_plant = nil
def.drop = "farming:amaranth_S6"
def.selection_box = {
	type = "fixed",
	fixed = {-5/16, -0.5, -5/16, 5/16, -1/16, 5/16}
}
def.groups = {snappy = 3, flammable = 2, plant = 1, attached_node = 1}
core.register_node("farming:amaranth_S6", table.copy(def))

-- stage 6 magenta (final)
def.description = S("Magenta Amaranth Plant")
def.tiles = {"farming_amaranth_magenta_6.png"}
def.inventory_image = "farming_amaranth_magenta_6.png"
def.wield_image = "farming_amaranth_magenta_6.png"
def.drop = "farming:amaranth2_S6"
core.register_node("farming:amaranth2_S6", table.copy(def))

-- fuel
core.register_craft({
	type = "fuel",
	recipe = "farming:amaranth",
	burntime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "farming:amaranth_magenta",
	burntime = 2,
})
