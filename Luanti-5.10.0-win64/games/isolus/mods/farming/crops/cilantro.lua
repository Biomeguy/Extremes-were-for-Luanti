
local S = core.get_translator("farming")

-- coriander
core.register_craftitem("farming:cilantro_seed", {
	description = S("Coriander"),
	inventory_image = "farming_cilantro_seed.png",
	groups = {flammable = 2, herb = 1},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:cilantro_S1")
	end,
})

-- cilantro
core.register_craftitem("farming:cilantro", {
	description = S("Cilantro"),
	inventory_image = "farming_cilantro.png",
	groups = {flammable = 2, herb = 1},
	on_use = core.item_eat(2),
})

-- cilantro can be used for green dye
core.register_craft({
	output = "dye:green",
	recipe = {{"farming:cilantro"}}
})

-- cilantro definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_cilantro_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:cilantro",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:cilantro_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:cilantro_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_cilantro_2.png"}
def.next_plant = "farming:cilantro_S3"
core.register_node("farming:cilantro_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_cilantro_3.png"}
def.next_plant = "farming:cilantro_S4"
def.drop = "farming:cilantro 2"
core.register_node("farming:cilantro_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_cilantro_4.png"}
def.next_plant = "farming:cilantro_S5"
core.register_node("farming:cilantro_S4", table.copy(def))

-- stage 5 (final)
def.tiles = {"farming_cilantro_5.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:cilantro 3"}},
		{items = {"farming:cilantro 2"}, rarity = 2},
		{items = {"farming:cilantro"}, rarity = 3},
		{items = {"farming:cilantro_seed"}},
		{items = {"farming:cilantro_seed 3"}, rarity = 2},
	}
}
core.register_node("farming:cilantro_S5", table.copy(def))
