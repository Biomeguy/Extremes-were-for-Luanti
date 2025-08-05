
local S = core.get_translator("farming")

-- huckleberries
core.register_craftitem("farming:huckleberries", {
	description = S("Huckleberries"),
	inventory_image = "farming_huckleberries.png",
	groups = {huckleberry = 1, flammable = 2},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:huckleberry_S1")
	end,
})

-- huckleberry definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_huckleberry_1.png"},
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
	next_plant = "farming:huckleberry_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:huckleberry_S1", table.copy(def))

-- stage 2
def.mesh = "farming_huckleberry_bush_2.obj"
def.tiles = {"farming_huckleberry_2.png"}
def.next_plant = "farming:huckleberry_S3"
core.register_node("farming:huckleberry_S2", table.copy(def))

-- stage 3
def.mesh = "farming_huckleberry_bush.obj"
def.tiles = {"farming_huckleberry_3.png"}
def.next_plant = "farming:huckleberry_S4"
core.register_node("farming:huckleberry_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_huckleberry_4.png"}
def.next_plant = "farming:huckleberry_S5"
core.register_node("farming:huckleberry_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_huckleberry_5.png"}
def.next_plant = "farming:huckleberry_S6"
core.register_node("farming:huckleberry_S5", table.copy(def))

-- stage 6 (final)
def.tiles = {"farming_huckleberry_6.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:huckleberries 4"}},
		{items = {"farming:huckleberries 6"}, rarity = 2},
		{items = {"farming:huckleberries 9"}, rarity = 3},
	}
}
def.after_dig_node = function(pos)
	if math.random(30) == 1 then
	else
		core.set_node(pos, {name="farming:huckleberry_S3"})
		core.get_node_timer(pos):start(math.random(166, 286))
	end
end
core.register_node("farming:huckleberry_S6", table.copy(def))
