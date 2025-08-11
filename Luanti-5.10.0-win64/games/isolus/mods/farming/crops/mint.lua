
local S = core.get_translator("farming")

-- mint seed
core.register_craftitem("farming:seed_mint", {
	description = S("Mint Seed"),
	inventory_image = "farming_mint_seeds.png",
	groups = {seed = 2, flammable = 2},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:mint_S1")
	end
})

-- mint leaf
core.register_craftitem("farming:mint_leaf", {
	description = S("Mint Leaf"),
	inventory_image = "farming_mint_leaf.png",
	groups = {mint = 1, flammable = 2}
})

-- hot cup of mint tea
vessels.register_cup("farming:mint_tea_hot", S("Hot Cup of Mint Leaf Tea"), "farming_mint_tea_hot", core.item_eat(2, "vessels:ceramic_cup"))

core.register_craft({
	type = "shapeless",
	output = "farming:mint_tea_hot",
	recipe = {"vessels:ceramic_cup", "group:mint", "group:mint", "group:mint", "group:boiling_water"},
	replacements = {{"group:boiling_water", "bucket:bucket_empty"}}
})

core.register_craft({
	type = "shapeless",
	output = "default:ice",
	recipe = {"farming:mint_leaf", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

-- mint definition
local def = {
	drawtype = "plantlike",
	waving = 1,
	tiles = {"farming_mint_1.png"},
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:mint_leaf",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 1, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:mint_S2",
	on_timer = farming.grow_plant
}

-- stage 1
core.register_node("farming:mint_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_mint_2.png"}
def.next_plant = "farming:mint_S3"
def.drop = {
	items = {
		{items = {"farming:mint_leaf 3"}},
	}
}
core.register_node("farming:mint_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_mint_3.png"}
def.next_plant = "farming:mint_S4"
core.register_node("farming:mint_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_mint_4.png"}
def.next_plant = "farming:mint_S5"
core.register_node("farming:mint_S4", table.copy(def))

-- stage 5 (final)
def.tiles = {"farming_mint_5.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:mint_leaf 3"}},
		{items = {"farming:mint_leaf 2"}, rarity = 2},
		{items = {"farming:seed_mint"}},
		{items = {"farming:seed_mint 2"}, rarity = 2},
	}
}
core.register_node("farming:mint_S5", table.copy(def))
