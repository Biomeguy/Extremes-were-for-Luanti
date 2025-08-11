
local S = core.get_translator("farming")

-- alfalfa seeds
core.register_node("farming:seed_alfalfa", {
	description = S("Alfalfa"),
	tiles = {"farming_alfalfa_seed.png"},
	inventory_image = "farming_alfalfa_seed.png",
	wield_image = "farming_alfalfa_seed.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:seed_alfalfa")
	end,
	next_plant = "farming:alfalfa_S1",
	on_timer = farming.grow_plant,
})

-- harvested alfalfa
core.register_craftitem("farming:alfalfa", {
	description = S("Alfalfa Stalks"),
	inventory_image = "farming_alfalfa.png",
	groups = {flammable = 2},
})

-- alfalfa leaves (very healthy and medicinal)
core.register_craftitem("farming:alfalfa_leaves", {
	description = S("Alfalfa Leaves"),
	inventory_image = "farming_alfalfa_leaves.png",
	groups = {greens = 1, flammable = 2},
	on_use = core.item_eat(4),
})

core.register_craft({
	output = "farming:seed_alfalfa 8",
	recipe = {
		{"farming:alfalfa"},
	},
	replacements = {{"farming:alfalfa", "farming:alfalfa_leaves 5"}}
})

-- alfalfa flour
core.register_craftitem("farming:alfalfa_flour", {
	description = S("Alfalfa Flour"),
	inventory_image = "farming_wheat_flour.png^[colorize:orange:50",
	groups = {flammable = 1},
})

core.register_craft({
	type = "shapeless",
	output = "farming:alfalfa_flour 4",
	recipe = {"farming:alfalfa", "farming:alfalfa", "farming:alfalfa", "farming:alfalfa", "farming:mortar_pestle"},
	replacements = {
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"farming:alfalfa", "farming:straw_pile"},
		{"farming:alfalfa", "farming:straw_pile"},
		{"farming:alfalfa", "farming:straw_pile"},
		{"farming:alfalfa", "farming:straw_pile"}
	}
})

core.register_craft({
	output = "farming:alfalfa_flour",
	recipe = {
		{"farming:seed_alfalfa", "farming:seed_alfalfa", "farming:seed_alfalfa"},
		{"farming:seed_alfalfa", "farming:mortar_pestle", "farming:seed_alfalfa"},
		{"farming:seed_alfalfa", "farming:seed_alfalfa", "farming:seed_alfalfa"},
	},
	replacements = {{"farming:mortar_pestle", "farming:mortar_pestle"}}
})

-- treated alfalfa can imitate any meat or other protein
core.register_craftitem("farming:alfalfa_treated", {
	description = S("Treated Alfalfa"),
	inventory_image = "farming_wheat_dough.png^[colorize:orange:50",
})

core.register_craft( {
	output = "farming:alfalfa_treated 6",
	recipe = {
		{"farming:alfalfa_flour", "farming:alfalfa_flour", "farming:alfalfa_flour"},
		{"group:food_oil", "farming:alfalfa_flour", "group:boiling_water"},
		{"", "group:water_bucket", ""}
	},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"},
		{"farming:boiling_water", "bucket:bucket_water"},
		{"farming:boiling_fresh_water", "bucket:bucket_fresh_water"},
		{"group:food_oil", "vessels:glass_bottle"}
	}
})

-- can be used as fuel
core.register_craft({
	type = "fuel",
	recipe = "farming:seed_alfalfa",
	burntime = 2,
})

-- vegan milk bucket
core.register_craftitem("farming:vegan_milk", {
	description = S("Vegan Milk Bucket"),
	inventory_image = "foods_bucket_2.png",
	stack_max = 1,
	groups = {milk = 1},
	on_use = core.item_eat(8, 'bucket:bucket_empty'),
})

core.register_craft({
	output = "farming:vegan_milk",
	recipe = {
		{"farming:alfalfa_treated", "farming:alfalfa_treated", "farming:alfalfa_treated"},
		{"group:sugar", "bucket:bucket_fresh_water", "farming:maizestarch"},
	},
	replacements = {{"farming:maizestarch", "vessels:wood_bowl"}}
})

core.register_craft({
	output = "farming:vegan_milk",
	recipe = {
		{"farming:alfalfa_treated", "farming:alfalfa_treated", "farming:alfalfa_treated"},
		{"foods:molasses_1", "bucket:bucket_fresh_water", "farming:maizestarch"},
	},
	replacements = {
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"farming:maizestarch", "vessels:wood_bowl"}
	}
})

-- vegan butter
core.register_craftitem("farming:vegan_butter", {
	description = S("Vegan Butter"),
	inventory_image = "farming_vegan_butter.png",
	groups = {butter = 1},
	on_use = core.item_eat(2),
})

core.register_craft({
	type = "shapeless",
	output = "farming:vegan_butter 2",
	recipe = {"group:zucchini_cooked", "farming:alfalfa_treated"},
})

-- vegan cheese
core.register_craftitem("farming:vegan_cheese", {
	description = S("Vegan Cheese"),
	inventory_image = "farming_vegan_cheese.png",
	groups = {cheese = 1},
	on_use = core.item_eat(3),
})

core.register_craft({
	type = "shapeless",
	output = "farming:vegan_cheese 2",
	recipe = {"farming:asparagus", "farming:alfalfa_treated", "farming:alfalfa_treated", "dye:orange"},
})

-- vegan cooked egg
core.register_craftitem("farming:vegan_egg", {
	description = S("Vegan Cooked Egg"),
	inventory_image = "farming_vegan_cooked_egg.png",
	groups = {egg_cooked = 1},
	on_use = core.item_eat(3),
})

core.register_craft({
	output = "farming:vegan_egg 4",
	recipe = {
		{"", "farming:alfalfa_treated", ""},
		{"farming:alfalfa_treated", "flowers:dandelion", "farming:alfalfa_treated"},
		{"", "farming:alfalfa_treated", ""},
	}
})

-- vegan cooked fish
core.register_craftitem("farming:vegan_fish", {
	description = S("Vegan Cooked Fish"),
	inventory_image = "farming_vegan_fish.png",
	groups = {fish_cooked = 1},
	on_use = core.item_eat(3),
})

core.register_craft({
	output = "farming:vegan_fish 2",
	recipe = {
		{"dye:blue", "farming:alfalfa_treated", ""},
		{"farming:alfalfa_treated", "farming:alfalfa_treated", "farming:alfalfa_treated"},
		{"", "farming:alfalfa_treated", "dye:blue"},
	}
})

-- vegan cooked meat
core.register_craftitem("farming:vegan_meat", {
	description = S("Vegan Cooked Meat"),
	inventory_image = "farming_vegan_meat.png",
	groups = {meat_cooked = 1},
	on_use = core.item_eat(3),
})

core.register_craft({
	output = "farming:vegan_meat 2",
	recipe = {
		{"dye:red", "farming:alfalfa_treated", "farming:alfalfa_treated"},
		{"farming:alfalfa_treated", "farming:alfalfa_treated", ""},
	}
})

-- alfalfa definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_alfalfa_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"farming:alfalfa_leaves"}},
			{items = {"farming:alfalfa_leaves 2"}, rarity = 3},
		}
	},
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:alfalfa_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:alfalfa_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_alfalfa_2.png"}
def.next_plant = "farming:alfalfa_S3"
core.register_node("farming:alfalfa_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_alfalfa_3.png"}
def.next_plant = "farming:alfalfa_S4"
core.register_node("farming:alfalfa_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_alfalfa_4.png"}
def.next_plant = "farming:alfalfa_S5"
def.drop = {
	items = {
		{items = {"farming:alfalfa_leaves 3", "farming:spent_biomasse"}},
	}
}
core.register_node("farming:alfalfa_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_alfalfa_5.png"}
def.next_plant = "farming:alfalfa_S6"
core.register_node("farming:alfalfa_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_alfalfa_6.png"}
def.next_plant = "farming:alfalfa_S7"
core.register_node("farming:alfalfa_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_alfalfa_7.png"}
def.next_plant = "farming:alfalfa_S8"
core.register_node("farming:alfalfa_S7", table.copy(def))

-- stage 8
def.tiles = {"farming_alfalfa_8.png"}
def.next_plant = "farming:alfalfa_S9"
def.drop = {
	items = {
		{items = {"farming:alfalfa"}, rarity = 2},
		{items = {"farming:seed_alfalfa"}, rarity = 3},
		{items = {"farming:alfalfa_leaves 2"}, rarity = 2},
	}
}
core.register_node("farming:alfalfa_S8", table.copy(def))

-- stage 9 (final)
def.tiles = {"farming_alfalfa_9.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:alfalfa 2"}},
		{items = {"farming:alfalfa"}, rarity = 3},
		{items = {"farming:seed_alfalfa 5"}},
		{items = {"farming:seed_alfalfa 6"}, rarity = 3},
		{items = {"farming:alfalfa_leaves 2"}, rarity = 2},
	}
}
core.register_node("farming:alfalfa_S9", table.copy(def))

-- Fuel
core.register_craft({
	type = "fuel",
	recipe = "farming:alfalfa",
	burntime = 2,
})
