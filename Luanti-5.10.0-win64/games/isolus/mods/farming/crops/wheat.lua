
local S = core.get_translator("farming")

-- wheat seeds
core.register_node("farming:seed_wheat", {
	description = S("Khorasan Wheat"),
	tiles = {"farming_wheat_seed.png"},
	inventory_image = "farming_wheat_seed.png",
	wield_image = "farming_wheat_seed.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:seed_wheat")
	end,
	next_plant = "farming:wheat_S1",
	on_timer = farming.grow_plant,
})

-- harvested wheat / flour / dough / bread
core.register_craftitem("farming:wheat", {
	description = S("Khorasan Wheat Stalks"),
	inventory_image = "farming_wheat.png",
	groups = {grain = 1, flammable = 2},
})

core.register_craftitem("farming:wheat_flour", {
	description = S("Khorasan Wheat Flour"),
	inventory_image = "farming_wheat_flour.png",
	groups = {flour = 1, flammable = 1},
})

core.register_craftitem("farming:wheat_dough", {
	description = S("Khorasan Wheat Dough"),
	inventory_image = "farming_wheat_dough.png",
	groups = {dough = 1, flammable = 1},
})

core.register_craftitem("farming:wheat_bread", {
	description = S("Khorasan Wheat Bread"),
	inventory_image = "farming_wheat_bread.png",
	on_use = core.item_eat(5),
	groups = {bread = 1, flammable = 2},
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:wheat_bread",
	recipe = "farming:wheat_dough"
})

-- Compact method for repeating crafts from technic worldgen
function register_dough(dough, flour, crop, crop_seed)

	core.register_craft({
		output = crop_seed.." 8",
		recipe = {
			{"default:stick"},
			{crop},
			{"farming:threshing_floor"}
		},
		replacements = {
			{"default:stick", "default:stick"},
			{crop, "farming:straw_pile"},
			{"farming:threshing_floor", "farming:threshing_floor"}
		}
	})

	core.register_craft({
		type = "shapeless",
		output = flour.." 4",
		recipe = {crop, crop, crop, crop, "group:grinder"},
		replacements = {
			{"farming:handmill", "farming:handmill"},
			{"farming:mortar_pestle", "farming:mortar_pestle"},
			{"default:rock", "default:rock"},
			{"default:desert_rock", "default:desert_rock"},
			{"default:clay_brick", "default:clay_brick"},
			{crop, "farming:straw_pile"},
			{crop, "farming:straw_pile"},
			{crop, "farming:straw_pile"},
			{crop, "farming:straw_pile"}
		}
	})

	core.register_craft({
		output = flour,
		recipe = {
			{crop_seed, crop_seed, crop_seed},
			{crop_seed, "group:grinder", crop_seed},
			{crop_seed, crop_seed, crop_seed},
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
		output = dough.." 3",
		recipe = {
			{flour, flour, flour},
			{flour, flour, flour},
			{"", "group:fresh_water_bucket", ""}
		},
		replacements = {
			{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
			{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
			{"bucket:bucket_fresh_water", "bucket:bucket_empty"}
		}
	})
end

register_dough("farming:wheat_dough", "farming:wheat_flour", "farming:wheat", "farming:seed_wheat")

-- wheat definition
local def = {
	drawtype = "mesh",
	mesh = "reed.obj",
	tiles = {"farming_wheat_1.png"},
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
	next_plant = "farming:wheat_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:wheat_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_wheat_2.png"}
def.next_plant = "farming:wheat_S3"
core.register_node("farming:wheat_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_wheat_3.png"}
def.next_plant = "farming:wheat_S4"
def.drop = "farming:spent_biomasse 2"
core.register_node("farming:wheat_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_wheat_4.png"}
def.next_plant = "farming:wheat_S5"
core.register_node("farming:wheat_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_wheat_5.png"}
def.next_plant = "farming:wheat_S6"
core.register_node("farming:wheat_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_wheat_6.png"}
def.next_plant = "farming:wheat_S7"
def.drop = {
	items = {
		{items = {"farming:wheat"}, rarity = 2},
		{items = {"farming:seed_wheat 2"}, rarity = 2},
	}
}
core.register_node("farming:wheat_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_wheat_7.png"}
def.next_plant = "farming:wheat_S8"
def.drop = {
	items = {
		{items = {"farming:wheat"}},
		{items = {"farming:wheat"}, rarity = 3},
		{items = {"farming:seed_wheat 2"}},
		{items = {"farming:seed_wheat"}, rarity = 2},
	}
}
core.register_node("farming:wheat_S7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_wheat_8.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:wheat 2"}},
		{items = {"farming:wheat"}, rarity = 3},
		{items = {"farming:seed_wheat 3"}},
		{items = {"farming:seed_wheat 4"}, rarity = 2},
	}
}
core.register_node("farming:wheat_S8", table.copy(def))

-- fuel
core.register_craft({
	type = "fuel",
	recipe = "farming:wheat",
	burntime = 2,
})
