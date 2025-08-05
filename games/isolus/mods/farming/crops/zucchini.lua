
local S = core.get_translator("farming")

-- green zucchini
core.register_craftitem("farming:zucchini_green", {
	description = S("Green Zucchini"),
	inventory_image = "farming_zucchini_green.png",
	groups = {zucchini = 1, flammable = 1},
	on_use = core.item_eat(4, "farming:spent_biomasse"),
})

-- cooked green zucchini
core.register_craftitem("farming:zucchini_green_cooked", {
	description = S("Cooked Green Zucchini"),
	inventory_image = "farming_zucchini_green_cooked.png",
	groups = {zucchini_cooked = 1, flammable = 1},
	on_use = core.item_eat(8, "farming:spent_biomasse"),
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming:zucchini_green_cooked",
	recipe = "farming:zucchini_green"
})

-- yellow zucchini
core.register_craftitem("farming:zucchini_yellow", {
	description = S("Yellow Zucchini"),
	inventory_image = "farming_zucchini_yellow.png",
	groups = {zucchini = 1, flammable = 1},
	on_use = core.item_eat(4, "farming:spent_biomasse"),

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

		return farming.place_seed(itemstack, placer, pointd, "farming:zucchini_S1")
	end,
})

-- cooked zucchini yellow 
core.register_craftitem("farming:zucchini_yellow_cooked", {
	description = S("Cooked Yellow Zucchini"),
	inventory_image = "farming_zucchini_yellow_cooked.png",
	groups = {zucchini_cooked = 1, flammable = 1},
	on_use = core.item_eat(8, "farming:spent_biomasse"),
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming:zucchini_yellow_cooked",
	recipe = "farming:zucchini_yellow"
})

-- zucchini definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"farming_zucchini_1.png"},
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
	next_plant = "farming:zucchini_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:zucchini_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_zucchini_2.png"}
def.next_plant = "farming:zucchini_S3"
core.register_node("farming:zucchini_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_zucchini_3.png"}
def.next_plant = "farming:zucchini_S4"
def.drop = "farming:spent_biomasse 2"
core.register_node("farming:zucchini_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_zucchini_4.png"}
def.next_plant = "farming:zucchini_S5"
core.register_node("farming:zucchini_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_zucchini_5.png"}
def.next_plant = "farming:zucchini_S6"
core.register_node("farming:zucchini_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_zucchini_6.png"}
def.next_plant = "farming:zucchini_S7"
core.register_node("farming:zucchini_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_zucchini_7.png"}
def.next_plant = "farming:zucchini_S8"
def.drop = {
	items = {
		{items = {"farming:zucchini_green 3", "farming:spent_biomasse 2"}},
		{items = {"farming:zucchini_green 2"}, rarity = 2},
		{items = {"farming:zucchini_green 2"}, rarity = 2},
	}
}
def.after_dig_node = function(pos)
	if math.random(10) == 1 then
	else
		core.set_node(pos, {name="farming:zucchini_S5"})
		core.get_node_timer(pos):start(math.random(166, 286))
	end
end
core.register_node("farming:zucchini_S7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_zucchini_8.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:zucchini_yellow 3", "farming:spent_biomasse 2"}},
		{items = {"farming:zucchini_yellow 2"}, rarity = 2},
		{items = {"farming:zucchini_yellow 2"}, rarity = 2},
	}
}
core.register_node("farming:zucchini_S8", table.copy(def))
