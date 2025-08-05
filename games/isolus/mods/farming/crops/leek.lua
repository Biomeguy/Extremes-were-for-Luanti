
local S = core.get_translator("farming")

-- leek root
core.register_craftitem("farming:leek_root", {
	description = S("Leek Root"),
	inventory_image = "farming_leek_root.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:leek_S1")
	end,
})

-- leek
core.register_craftitem("farming:leek", {
	description = S("Leek"),
	inventory_image = "farming_leek.png",
	groups = {flammable = 2},
	on_use = core.item_eat(3, "farming:leek_root"),
})

-- leek definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_leek_1.png"},
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
	next_plant = "farming:leek_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:leek_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_leek_2.png"}
def.next_plant = "farming:leek_S3"
core.register_node("farming:leek_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_leek_3.png"}
def.next_plant = "farming:leek_S4"
core.register_node("farming:leek_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_leek_4.png"}
def.next_plant = "farming:leek_S5"
core.register_node("farming:leek_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_leek_5.png"}
def.next_plant = "farming:leek_S6"
core.register_node("farming:leek_S5", table.copy(def))

-- stage 6 (final)
def.tiles = {"farming_leek_6.png"}
def.next_plant = nil
def.drop = "farming:leek"
core.register_node("farming:leek_S6", table.copy(def))

-- fuel
core.register_craft({
	type = "fuel",
	recipe = "farming:leek_root",
	burntime = 2,
})
