
local S = core.get_translator("farming")

-- black currants
core.register_craftitem("farming:blackcurrants", {
	description = S("Black Currants"),
	inventory_image = "farming_blackcurrants.png",
	groups = {blackcurrant = 1, flammable = 2},
	on_use = core.item_eat(10),

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

		return farming.place_seed(itemstack, placer, pointd, "farming:blackcurrant_S1")
	end,
})

-- blackcurrant definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"farming_gooseberry_1.png"},
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
	next_plant = "farming:blackcurrant_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:blackcurrant_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_gooseberry_2.png"}
def.next_plant = "farming:blackcurrant_S3"
core.register_node("farming:blackcurrant_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_gooseberry_3.png"}
def.next_plant = "farming:blackcurrant_S4"
core.register_node("farming:blackcurrant_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_gooseberry_4.png"}
def.next_plant = "farming:blackcurrant_S5"
core.register_node("farming:blackcurrant_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_gooseberry_5.png"}
def.next_plant = "farming:blackcurrant_S6"
core.register_node("farming:blackcurrant_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_blackcurrant_6.png"}
def.next_plant = "farming:blackcurrant_S7"
core.register_node("farming:blackcurrant_S6", table.copy(def))

-- stage 7 (final)
def.tiles = {"farming_blackcurrant_7.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:blackcurrants 4"}},
		{items = {"farming:blackcurrants 6"}, rarity = 2},
		{items = {"farming:blackcurrants 9"}, rarity = 3},
	}
}
def.after_dig_node = function(pos)
	if math.random(30) == 1 then
	else
		core.set_node(pos, {name="farming:blackcurrant_S5"})
		core.get_node_timer(pos):start(math.random(166, 286))
	end
end
core.register_node("farming:blackcurrant_S7", table.copy(def))
