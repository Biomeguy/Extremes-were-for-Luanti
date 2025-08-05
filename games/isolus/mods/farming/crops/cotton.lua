
local S = core.get_translator("farming")

-- cotton seeds
core.register_node("farming:seed_cotton", {
	description = S("Cotton Seed"),
	tiles = {"farming_cotton_seed.png"},
	inventory_image = "farming_cotton_seed.png",
	wield_image = "farming_cotton_seed.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:seed_cotton")
	end,
	next_plant = "farming:cotton_S1",
	on_timer = farming.grow_plant,
})

-- cotton
core.register_craftitem("farming:cotton", {
	description = S("Cotton"),
	inventory_image = "farming_cotton.png",
	groups = {fibre = 1, flammable = 4},
})

-- cottonseed oil
core.register_node("farming:cottonseed_oil", {
	description = S("Cottonseed Oil"),
	drawtype = "plantlike",
	tiles = {"farming_cottonseed_oil.png"},
	inventory_image = "farming_cottonseed_oil.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(-2, "vessels:glass_bottle"),
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "farming:cottonseed_oil",
	recipe = {
		{"farming:seed_cotton", "farming:seed_cotton", "farming:seed_cotton"},
		{"farming:seed_cotton", "farming:seed_cotton", "farming:seed_cotton"},
		{"farming:seed_cotton", "vessels:glass_bottle", "farming:seed_cotton"}
	}
})

-- can be used as fuel
core.register_craft({
	type = "fuel",
	recipe = "farming:cotton",
	burntime = 1,
})

core.register_craft({
	type = "fuel",
	recipe = "farming:cottonseed_oil",
	burntime = 25,
	replacements = {{"farming:cottonseed_oil", "vessels:glass_bottle"}}
})

-- cotton definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"farming_cotton_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 4, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:cotton_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:cotton_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_cotton_2.png"}
def.next_plant = "farming:cotton_S3"
core.register_node("farming:cotton_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_cotton_3.png"}
def.next_plant = "farming:cotton_S4"
def.drop = {
	items = {
		{items = {"farming:spent_biomasse 3"}},
		{items = {"farming:spent_biomasse"}, rarity = 2},
	}
}
core.register_node("farming:cotton_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_cotton_4.png"}
def.next_plant = "farming:cotton_S5"
core.register_node("farming:cotton_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_cotton_5.png"}
def.next_plant = "farming:cotton_S6"
core.register_node("farming:cotton_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_cotton_6.png"}
def.next_plant = "farming:cotton_S7"
core.register_node("farming:cotton_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_cotton_7.png"}
def.next_plant = "farming:cotton_S8"
core.register_node("farming:cotton_S7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_cotton_8.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:cotton"}},
		{items = {"farming:cotton 2"}, rarity = 2},
		{items = {"farming:cotton 4"}, rarity = 3},
		{items = {"farming:seed_cotton 3"}},
		{items = {"farming:seed_cotton 4"}, rarity = 2},
	}
}
def.after_dig_node = function(pos)
	if math.random(10) == 1 then
	else
		core.set_node(pos, {name="farming:cotton_S6"})
		core.get_node_timer(pos):start(math.random(166, 286))
	end
end
core.register_node("farming:cotton_S8", table.copy(def))

-- wild cotton as a source of cotton seed and a chance of cotton itself
core.register_node("farming:cotton_wild", {
	description = S("Wild Cotton"),
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"farming_cotton_wild.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"farming:cotton"}, rarity = 2},
			{items = {"farming:seed_cotton", "farming:spent_biomasse 2"}},
			{items = {"farming:spent_biomasse"}, rarity = 2}
		}
	},
	selection_box = default.plant_sbox,
	groups = {snappy = 3, flammable = 4, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})
