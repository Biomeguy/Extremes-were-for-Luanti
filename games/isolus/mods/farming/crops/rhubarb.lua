
local S = core.get_translator("farming")

-- rhubarb
core.register_craftitem("farming:rhubarb", {
	description = S("Rhubarb"),
	inventory_image = "farming_rhubarb.png",
	groups = {rhubarb = 1, flammable = 2},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:rhubarb_S1")
	end,
})

-- rhubarb definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"farming_rhubarb_1.png"},
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
	next_plant = "farming:rhubarb_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:rhubarb_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_rhubarb_2.png"}
def.next_plant = "farming:rhubarb_S3"
core.register_node("farming:rhubarb_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_rhubarb_3.png"}
def.next_plant = "farming:rhubarb_S4"
core.register_node("farming:rhubarb_S3", table.copy(def))

-- stage 4 (final)
def.tiles = {"farming_rhubarb_4.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:rhubarb 2"}, rarity = 1},
		{items = {"farming:rhubarb 4"}, rarity = 2},
		{items = {"farming:rhubarb 7"}, rarity = 3},
	}
}
core.register_node("farming:rhubarb_S4", table.copy(def))
