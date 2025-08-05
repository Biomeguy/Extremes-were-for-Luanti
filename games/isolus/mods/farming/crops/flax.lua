
local S = core.get_translator("farming")

-- flax seeds
core.register_node("farming:seed_flax", {
	description = S("Flaxseed"),
	tiles = {"farming_flaxseed.png"},
	inventory_image = "farming_flaxseed.png",
	wield_image = "farming_flaxseed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 2},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	on_use = core.item_eat(2),
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

		return farming.place_seed(itemstack, placer, pointd, "farming:seed_flax")
	end,
	next_plant = "farming:flax_S1",
	on_timer = farming.grow_plant,
})

-- flax flour / dough / bread
core.register_craftitem("farming:flax_flour", {
	description = S("Flax Flour"),
	inventory_image = "farming_flax_flour.png",
	groups = {flour = 1, flammable = 1},
})

core.register_craftitem("farming:flax_dough", {
	description = S("Flax Dough"),
	inventory_image = "farming_flax_dough.png",
	groups = {dough = 1, flammable = 1},
})

core.register_craftitem("farming:flax_bread", {
	description = S("Flax Bread"),
	inventory_image = "farming_flax_bread.png",
	on_use = core.item_eat(5),
	groups = {bread = 1, flammable = 2},
})

core.register_craft({
	output = "farming:flax_flour",
	recipe = {
		{"farming:seed_flax", "farming:seed_flax", "farming:seed_flax"},
		{"farming:seed_flax", "group:grinder", "farming:seed_flax"},
		{"farming:seed_flax", "farming:seed_flax", "farming:seed_flax"}
	},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"}
	}
})

core.register_craft({
	output = "farming:flax_dough 6",
	recipe = {
		{"farming:flax_flour", "farming:flax_flour", "farming:flax_flour"},
		{"farming:flax_flour", "farming:flax_flour", "farming:flax_flour"},
		{"", "bucket:bucket_fresh_water", ""}
	},
	replacements = {{"bucket:bucket_fresh_water", "bucket:bucket_empty"}}
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:flax_bread",
	recipe = "farming:flax_dough"
})

-- flaxseed oil
core.register_node("farming:flaxseed_oil", {
	description = S("Flaxseed Oil"),
	drawtype = "plantlike",
	tiles = {"farming_flaxseed_oil.png"},
	inventory_image = "farming_flaxseed_oil.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(2, "vessels:glass_bottle"),
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, food_oil = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "farming:flaxseed_oil",
	recipe = {
		{"farming:seed_flax", "farming:seed_flax", "farming:seed_flax"},
		{"farming:seed_flax", "farming:seed_flax", "farming:seed_flax"},
		{"farming:seed_flax", "vessels:glass_bottle", "farming:seed_flax"}
	}
})

-- flax
core.register_craftitem("farming:flax_fresh", {
	description = S("Fresh Flax"),
	inventory_image = "farming_fresh_flax.png",
	groups = {flammable = 1},
})

core.register_craftitem("farming:flax", {
	description = S("Flax"),
	inventory_image = "farming_flax.png",
	groups = {fibre = 1, flammable = 3},
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming:flax",
	recipe = "farming:flax_fresh"
})

-- flax to paper
core.register_craft({
	output = "default:paper 4",
	recipe = {{"farming:flax", "farming:flax", "group:grinder"},
		{"group:water_bucket", "fabric:sheet_white", ""}
	},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"},
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"},
		{"fabric:sheet_white", "fabric:sheet_white"}
	}
})

-- can be used as fuel
core.register_craft({
	type = "fuel",
	recipe = "farming:seed_flax",
	burntime = 10,
})

core.register_craft({
	type = "fuel",
	recipe = "farming:flaxseed_oil",
	burntime = 30,
	replacements = {{"farming:flaxseed_oil", "vessels:glass_bottle"}}
})

-- flax definition
local def = {
	drawtype = "mesh",
	mesh = "reed.obj",
	tiles = {"farming_flax_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 3, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:flax_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:flax_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_flax_2.png"}
def.next_plant = "farming:flax_S3"
core.register_node("farming:flax_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_flax_3.png"}
def.next_plant = "farming:flax_S4"
core.register_node("farming:flax_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_flax_4.png"}
def.next_plant = "farming:flax_S5"
core.register_node("farming:flax_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_flax_5.png"}
def.next_plant = "farming:flax_S6"
def.drop = {
	items = {
		{items = {"farming:flax_fresh"}, rarity = 2},
	}
}
core.register_node("farming:flax_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_flax_6.png"}
def.next_plant = "farming:flax_S7"
def.drop = {
	items = {
		{items = {"farming:flax_fresh"}},
	}
}
core.register_node("farming:flax_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_flax_7.png"}
def.next_plant = "farming:flax_S8"
def.drop = {
	items = {
		{items = {"farming:flax_fresh"}},
		{items = {"farming:flax_fresh 2"}, rarity = 2},
		{items = {"farming:seed_flax 2"}, rarity = 2},
	}
}
core.register_node("farming:flax_S7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_flax_8.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:flax_fresh 3"}},
		{items = {"farming:flax_fresh 2"}, rarity = 2},
		{items = {"farming:seed_flax 3"}},
		{items = {"farming:seed_flax 4"}, rarity = 2},
	}
}
core.register_node("farming:flax_S8", table.copy(def))
