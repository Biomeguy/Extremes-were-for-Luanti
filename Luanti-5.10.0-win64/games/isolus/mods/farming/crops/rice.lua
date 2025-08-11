
local S = core.get_translator("farming")

-- rice seeds
core.register_node("farming:seed_rice", {
	description = S("Rice"),
	tiles = {"farming_rice_seed.png"},
	inventory_image = "farming_rice_seed.png",
	wield_image = "farming_rice_seed.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:seed_rice")
	end,
	next_plant = "farming:rice_S1",
	on_timer = farming.grow_plant,
})

-- harvested rice / flour / dough / bread
core.register_craftitem("farming:rice", {
	description = S("Rice Stalks"),
	inventory_image = "farming_rice.png",
	groups = {grain = 1, flammable = 2},
})

-- cooked rice
core.register_craftitem("farming:rice_cooked", {
	description = "Cooked Rice",
	inventory_image = "farming_rice_cooked.png",
	groups = {flammable = 2},
	on_use = core.item_eat(3, "vessels:wood_bowl")
})

core.register_craft({
	output = "farming:rice_cooked",
	recipe = {
		{"farming:rice"},
		{"group:boiling_water"},
		{"vessels:wood_bowl"},
	},
	replacements = {
		{"group:boiling_water", "bucket:bucket_empty"},
		{"farming:rice", "farming:straw_pile"}
	}
})

core.register_craftitem("farming:rice_flour", {
	description = S("Rice Flour"),
	inventory_image = "farming_rice_flour.png",
	groups = {flour = 1, flammable = 1},
})

core.register_craftitem("farming:rice_dough", {
	description = S("Rice Dough"),
	inventory_image = "farming_rice_dough.png",
	groups = {dough = 1, flammable = 1},
})

core.register_craftitem("farming:rice_bread", {
	description = S("Rice Bread"),
	inventory_image = "farming_rice_bread.png",
	on_use = core.item_eat(5),
	groups = {bread = 1, flammable = 2},
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:rice_bread",
	recipe = "farming:rice_dough"
})

register_dough("farming:rice_dough", "farming:rice_flour", "farming:rice", "farming:seed_rice")

-- rice milk bucket
core.register_craftitem("farming:rice_milk", {
	description = S("Rice Milk Bucket"),
	inventory_image = "foods_bucket_1.png",
	stack_max = 1,
	groups = {milk = 1},
	on_use = core.item_eat(8, "bucket:bucket_empty"),
})

core.register_craft({
	output = "farming:rice_milk",
	recipe = {
		{"farming:rice_flour", "farming:rice_flour", "farming:rice_flour"},
		{"farming:rice_flour", "farming:rice_flour", "farming:rice_flour"},
		{"group:sugar", "bucket:bucket_fresh_water", "farming:maizestarch"},
	},
	replacements = {{"farming:maizestarch", "vessels:wood_bowl"}}
})

core.register_craft({
	output = "farming:rice_milk",
	recipe = {
		{"farming:rice_flour", "farming:rice_flour", "farming:rice_flour"},
		{"farming:rice_flour", "farming:rice_flour", "farming:rice_flour"},
		{"foods:molasses_1", "bucket:bucket_fresh_water", "farming:maizestarch"},
	},
	replacements = {
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"farming:maizestarch", "vessels:wood_bowl"}
	}
})

-- rice definition
local def = {
	drawtype = "mesh",
	mesh = "reed.obj",
	tiles = {"farming_rice_1.png"},
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
	next_plant = "farming:rice_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:rice_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_rice_2.png"}
def.next_plant = "farming:rice_S3"
core.register_node("farming:rice_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_rice_3.png"}
def.next_plant = "farming:rice_S4"
def.drop = "farming:spent_biomasse 2"
core.register_node("farming:rice_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_rice_4.png"}
def.next_plant = "farming:rice_S5"
core.register_node("farming:rice_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_rice_5.png"}
def.next_plant = "farming:rice_S6"
def.drop = {
	items = {
		{items = {"farming:rice"}, rarity = 2},
		{items = {"farming:seed_rice 2"}},
	}
}
core.register_node("farming:rice_S5", table.copy(def))

-- stage 6 (final)
def.tiles = {"farming_rice_6.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:rice 3"}},
		{items = {"farming:rice"}, rarity = 3},
		{items = {"farming:seed_rice 3"}},
		{items = {"farming:seed_rice 4"}, rarity = 2},
	}
}
core.register_node("farming:rice_S6", table.copy(def))

-- rice bush
core.register_node("farming:rice_bush", {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_rice_5.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"farming:seed_rice", "farming:spent_biomasse"}},
			{items = {"farming:seed_rice 2"}, rarity = 2},
			{items = {"farming:seed_rice 4"}, rarity = 3},
		}
	},
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-- fuel
core.register_craft({
	type = "fuel",
	recipe = "farming:rice",
	burntime = 2,
})
