
local S = core.get_translator("farming")

-- buckwheat seeds
core.register_node("farming:seed_buckwheat", {
	description = S("Buckwheat"),
	tiles = {"farming_buckwheat_seed.png"},
	inventory_image = "farming_buckwheat_seed.png",
	wield_image = "farming_buckwheat_seed.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:seed_buckwheat")
	end,
	next_plant = "farming:buckwheat_S1",
	on_timer = farming.grow_plant,
})

-- buckwheat flour / dough / bread
core.register_craftitem("farming:buckwheat_flour", {
	description = S("Buckwheat Flour"),
	inventory_image = "farming_sunflower_flour.png",
	groups = {flour = 1, flammable = 1},
})

core.register_craftitem("farming:buckwheat_dough", {
	description = S("Buckwheat Dough"),
	inventory_image = "farming_sunflower_dough.png",
	groups = {dough = 1, flammable = 1},
})

core.register_craftitem("farming:buckwheat_bread", {
	description = S("Buckwheat Bread"),
	inventory_image = "farming_sunflower_bread.png",
	on_use = core.item_eat(5),
	groups = {bread = 1, flammable = 2},
})

core.register_craft({
	output = "farming:buckwheat_flour",
	recipe = {
		{"farming:seed_buckwheat", "farming:seed_buckwheat", "farming:seed_buckwheat"},
		{"farming:seed_buckwheat", "group:grinder", "farming:seed_buckwheat"},
		{"farming:seed_buckwheat", "farming:seed_buckwheat", "farming:seed_buckwheat"},
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
	output = "farming:buckwheat_dough 6",
	recipe = {
		{"farming:buckwheat_flour", "farming:buckwheat_flour", "farming:buckwheat_flour"},
		{"farming:buckwheat_flour", "farming:buckwheat_flour", "farming:buckwheat_flour"},
		{"", "group:fresh_water_bucket", ""}
	},
	replacements = {
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:buckwheat_bread",
	recipe = "farming:buckwheat_dough"
})

-- buckwheat definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_buckwheat_1.png"},
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
	next_plant = "farming:buckwheat_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:buckwheat_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_buckwheat_2.png"}
def.next_plant = "farming:buckwheat_S3"
core.register_node("farming:buckwheat_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_buckwheat_3.png"}
def.next_plant = "farming:buckwheat_S4"
core.register_node("farming:buckwheat_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_buckwheat_4.png"}
def.next_plant = "farming:buckwheat_S5"
core.register_node("farming:buckwheat_S4", table.copy(def))

-- stage 5 (final)
def.tiles = {"farming_buckwheat_5.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:seed_buckwheat 2", "farming:spent_biomasse"}},
		{items = {"farming:seed_buckwheat 4"}, rarity = 2},
		{items = {"farming:seed_buckwheat 7"}, rarity = 3},
	}
}
core.register_node("farming:buckwheat_S5", table.copy(def))
