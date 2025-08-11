
local S = core.get_translator("farming")

-- teosinte
core.register_craftitem("farming:teosinte", {
	description = S("Teosinte"),
	inventory_image = "farming_teosinte.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:teosinte_S1")
	end,
})

-- teosinte definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"farming_teosinte_1.png"},
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
	next_plant = "farming:teosinte_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:teosinte_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_teosinte_2.png"}
def.next_plant = "farming:teosinte_S3"
core.register_node("farming:teosinte_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_teosinte_3.png"}
def.next_plant = "farming:teosinte_S4"
def.drop = "farming:spent_biomasse 2"
core.register_node("farming:teosinte_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_teosinte_4.png"}
def.next_plant = "farming:teosinte_S5"
core.register_node("farming:teosinte_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_teosinte_5.png"}
def.next_plant = "farming:teosinte_S6"
core.register_node("farming:teosinte_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_teosinte_6.png"}
def.next_plant = "farming:teosinte_S7"
core.register_node("farming:teosinte_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_teosinte_7.png"}
def.next_plant = "farming:teosinte_S8"
core.register_node("farming:teosinte_S7", table.copy(def))

-- stage 8
def.tiles = {"farming_teosinte_8.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:maize_yellow"}, rarity = 8},
		{items = {"farming:teosinte 2"}, rarity = 2},
		{items = {"farming:teosinte 2"}, rarity = 2},
		{items = {"farming:teosinte 3"}, rarity = 2},
		{items = {"farming:teosinte 4"}},
	}
}
core.register_node("farming:teosinte_S8", table.copy(def))
