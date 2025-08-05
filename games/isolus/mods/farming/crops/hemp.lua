
local S = core.get_translator("farming")

-- hemp seeds
core.register_node("farming:seed_hemp", {
	description = S("Hemp Seed"),
	tiles = {"farming_hemp_seed.png"},
	inventory_image = "farming_hemp_seed.png",
	wield_image = "farming_hemp_seed.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:seed_hemp")
	end,
	next_plant = "farming:hemp_S1",
	on_timer = farming.grow_plant,
})

-- harvested hemp
core.register_craftitem("farming:hemp_leaf", {
	description = S("Hemp Leaf"),
	inventory_image = "farming_hemp_leaf.png",
	groups = {flammable = 2},
})

-- hemp oil
core.register_node("farming:hemp_oil", {
	description = S("Hemp Oil"),
	drawtype = "plantlike",
	tiles = {"farming_hemp_oil.png"},
	inventory_image = "farming_hemp_oil.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, food_oil = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "farming:hemp_oil",
	recipe = {
		{"farming:hemp_leaf", "farming:hemp_leaf", "farming:hemp_leaf"},
		{"farming:hemp_leaf", "farming:hemp_leaf", "farming:hemp_leaf"},
		{"", "vessels:glass_bottle", ""}
	}
})

core.register_craft({
	output = "farming:hemp_oil",
	recipe = {
		{"farming:seed_hemp", "farming:seed_hemp", "farming:seed_hemp"},
		{"farming:seed_hemp", "farming:seed_hemp", "farming:seed_hemp"},
		{"farming:seed_hemp", "vessels:glass_bottle", "farming:seed_hemp"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "farming:hemp_oil",
	burntime = 20,
	replacements = {{"farming:hemp_oil", "vessels:glass_bottle"}}
})

-- hemp fibre
core.register_craftitem("farming:hemp_fibre", { 
	description = S("Hemp Fibre"),
	inventory_image = "farming_hemp_fibre.png",
	groups = {fibre = 1, flammable = 2},
})

core.register_craft({
	output = "farming:hemp_fibre 8",
	recipe = {
		{"farming:hemp_leaf", "farming:hemp_leaf", "farming:hemp_leaf"},
		{"farming:hemp_leaf", "group:water_bucket", "farming:hemp_leaf"},
		{"farming:hemp_leaf", "farming:hemp_leaf", "farming:hemp_leaf"}
	},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

-- hemp block
core.register_node("farming:hemp_block", {
	description = S("Hemp Block"),
	tiles = {"farming_hemp_block.png"},
	paramtype = "light",
	groups = {snappy = 1, oddly_breakable_by_hand = 1, flammable = 2}
})

register_nine("farming:hemp_block", "farming:hemp_fibre")

do
	local recipe = "farming:hemp_block"
	local groups = {snappy = 1, oddly_breakable_by_hand = 1, flammable = 2}
	local images = {"farming_hemp_block.png"}
	local sounds = default.node_sound_leaves_defaults()

	stairs.register_stair("hemp_block", recipe, groups, images, S("Hemp Block Stair"),
		sounds, true)
	stairs.register_stair_inner("hemp_block", recipe, groups, images, "",
		sounds, true, S("Inner Hemp Block Stair"))
	stairs.register_stair_outer("hemp_block", recipe, groups, images, "",
		sounds, true, S("Outer Hemp Block Stair"))
	stairs.register_slab("hemp_block", recipe, groups, images, S("Hemp Block Slab"),
		sounds, true)
end

-- hemp fibre to paper
core.register_craft({
	output = "default:paper 3",
	recipe = {{"farming:hemp_fibre", "farming:hemp_fibre", "farming:hemp_fibre"},
		{"group:grinder", "group:water_bucket", "fabric:sheet_white"}
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

-- hemp definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_hemp_1.png"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:hemp_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:hemp_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_hemp_2.png"}
def.next_plant = "farming:hemp_S3"
core.register_node("farming:hemp_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_hemp_3.png"}
def.next_plant = "farming:hemp_S4"
def.drop = "farming:spent_biomasse 3"
core.register_node("farming:hemp_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_hemp_4.png"}
def.next_plant = "farming:hemp_S5"
core.register_node("farming:hemp_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_hemp_5.png"}
def.next_plant = "farming:hemp_S6"
core.register_node("farming:hemp_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_hemp_6.png"}
def.next_plant = "farming:hemp_S7"
def.drop = {
	items = {
		{items = {"farming:hemp_leaf"}, rarity = 2},
		{items = {"farming:seed_hemp"}},
	}
}
core.register_node("farming:hemp_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_hemp_7.png"}
def.next_plant = "farming:hemp_S8"
def.drop = {
	items = {
		{items = {"farming:hemp_leaf"}},
		{items = {"farming:hemp_leaf"}, rarity = 3},
		{items = {"farming:seed_hemp"}},
		{items = {"farming:seed_hemp"}, rarity = 3},
	}
}
core.register_node("farming:hemp_S7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_hemp_8.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:hemp_leaf 2"}},
		{items = {"farming:hemp_leaf 3"}, rarity = 2},
		{items = {"farming:seed_hemp"}},
		{items = {"farming:seed_hemp 2"}, rarity = 2},
	}
}
core.register_node("farming:hemp_S8", table.copy(def))
