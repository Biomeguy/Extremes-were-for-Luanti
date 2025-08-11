
local S = core.get_translator("farming")

-- hops supported
core.register_node("farming:hops_seed_with_bine", {
	description = S("Hops Seeds with Bines"),
	tiles = {"farming_hops_0.png"},
	inventory_image = "farming_hops_0.png",
	wield_image = "farming_hops_0.png",
	drawtype = "plantlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	visual_scale = 4,
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	sounds = default.node_sound_dirt_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:hops_seed_with_bine")
	end,
	next_plant = "farming:hops_S1",
	on_timer = farming.grow_plant,
})

-- hops seeds
core.register_craftitem("farming:hops_seed", {
	description = S("Hops Seeds"),
	inventory_image = "farming_hops_seed.png",
	groups = {flammable = 2},
})

-- harvested hops
core.register_craftitem("farming:hops", {
	description = S("Hops"),
	inventory_image = "farming_hops.png",
	groups = {flammable = 2},
})

core.register_craft({
	output = "farming:hops_seed_with_bine",
	recipe = {
		{"fabric:string", "group:stick", "group:stick"},
		{"fabric:string", "farming:hops_seed", "group:stick"},
		{"fabric:string", "farming:hops_seed", "group:stick"}
	}
})

-- hops definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_hops_1.png"},
	paramtype = "light",
	visual_scale = 4,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"default:stick 4", "farming:spent_biomasse"}},
			{items = {"fabric:string 3"}, rarity = 2},
		}
	},
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:hops_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:hops_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_hops_2.png"}
def.next_plant = "farming:hops_S3"
core.register_node("farming:hops_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_hops_3.png"}
def.next_plant = "farming:hops_S4"
core.register_node("farming:hops_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_hops_4.png"}
def.next_plant = "farming:hops_S5"
def.drop = {
	items = {
		{items = {"default:stick 4", "farming:spent_biomasse 2"}},
		{items = {"fabric:string 3"}, rarity = 2},
	}
}
core.register_node("farming:hops_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_hops_5.png"}
def.next_plant = "farming:hops_S6"
core.register_node("farming:hops_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_hops_6.png"}
def.next_plant = "farming:hops_S7"
core.register_node("farming:hops_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_hops_7.png"}
def.next_plant = "farming:hops_S8"
core.register_node("farming:hops_S7", table.copy(def))

-- stage 8
def.tiles = {"farming_hops_8.png"}
def.next_plant = "farming:hops_S9"
core.register_node("farming:hops_S8", table.copy(def))

-- stage 9 (final)
def.tiles = {"farming_hops_9.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:hops 12"}},
		{items = {"farming:hops 7"}, rarity = 2},
		{items = {"farming:hops 6"}, rarity = 2},
		{items = {"farming:hops 4"}, rarity = 2},
		{items = {"farming:hops_seed"}},
		{items = {"farming:hops_seed 2"}, rarity = 2},
	}
}
def.after_dig_node = function(pos, _, _, digger)
	if math.random(30) == 1 then
		core.node_dig(pos, {name="farming:hops_S2"}, digger)
	else
		core.set_node(pos, {name="farming:hops_S7"})
		core.get_node_timer(pos):start(math.random(166, 286))
	end
end
core.register_node("farming:hops_S9", table.copy(def))
