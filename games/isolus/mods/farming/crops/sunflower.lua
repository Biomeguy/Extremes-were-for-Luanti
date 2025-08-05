
local S = core.get_translator("farming")

-- sunflower seeds
core.register_craftitem("farming:sunflower_seed", {
	description = S("Sunflower Seed"),
	inventory_image = "farming_sunflower_seed.png",
	groups = {flammable = 2},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:sunflower_S1")
	end,
})

-- sunflower seed separating
core.register_craft({
	output = "farming:sunflower_seed 8",
	recipe = {
		{"farming:sunflower_seeds"},
	}
})

core.register_craftitem("farming:sunflower_seeds", {
	description = S("Sunflower Seeds"),
	inventory_image = "farming_sunflower_seeds.png",
	groups = {sunflower_seed = 1, flammable = 2},
	on_use = core.item_eat(1, "farming:spent_biomasse"),
})

core.register_craftitem("farming:sunflower_seeds_roasted", {
	description = S("Sunflower Seeds Roasted"),
	inventory_image = "farming_sunflower_seeds_roasted.png",
	groups = {sunflower_seed = 1, flammable = 2},
	on_use = core.item_eat(2, "farming:spent_biomasse"),
})

-- sunflower seed roasting
core.register_craft({
	type = "cooking",
	output = "farming:sunflower_seeds_roasted",
	recipe = "farming:sunflower_seeds"
})

-- sunflower root
core.register_craftitem("farming:sunflower_root", {
	description = S("Sunflower Root"),
	inventory_image = "farming_sunflower_root.png",
	groups = {flammable = 1},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:sunflower_S1")
	end,
})

-- sunflower flour
core.register_craftitem("farming:sunflower_flour", {
	description = S("Sunflower Flour"),
	inventory_image = "farming_sunflower_flour.png",
	groups = {flour = 1, flammable = 1},
})

core.register_craft({
	output = "farming:sunflower_flour",
	recipe = {
		{"farming:sunflower_seeds", "farming:sunflower_seeds", "farming:sunflower_seeds"},
		{"farming:sunflower_seeds", "group:grinder", "farming:sunflower_seeds"},
		{"farming:sunflower_seeds", "farming:sunflower_seeds", "farming:sunflower_seeds"},
	},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"}
	}
})

-- sunflower dough
core.register_craftitem("farming:sunflower_dough", {
	description = S("Sunflower Dough"),
	inventory_image = "farming_sunflower_dough.png",
	groups = {dough = 1, flammable = 1},
})

core.register_craft({
	output = "farming:sunflower_dough 3",
	recipe = {
		{"farming:sunflower_flour", "farming:sunflower_flour", "farming:sunflower_flour"},
		{"farming:sunflower_flour", "farming:sunflower_flour", "farming:sunflower_flour"},
		{"", "group:fresh_water_bucket", ""}
	},
	replacements = {
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"}
	}
})

-- sunflower bread
core.register_craftitem("farming:sunflower_bread", {
	description = S("Sunflower Bread"),
	inventory_image = "farming_sunflower_bread.png",
	on_use = core.item_eat(5),
	groups = {bread = 1, flammable = 2},
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:sunflower_bread",
	recipe = "farming:sunflower_dough"
})

-- sunflower seed butter
core.register_node("farming:sunflower_butter", {
	description = S("Sunflower Seed Butter"),
	drawtype = "plantlike",
	tiles = {"farming_sunflower_butter.png"},
	inventory_image = "farming_sunflower_butter.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(6, "vessels:glass_jar"),
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, nut_butter = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "farming:sunflower_butter",
	recipe = {
		{"group:sunflower_seed", "group:sunflower_seed", "group:sunflower_seed"},
		{"group:sunflower_seed", "group:sunflower_seed", "group:sunflower_seed"},
		{"group:sunflower_seed", "vessels:glass_jar", "group:sunflower_seed"}
	},
	replacements = {
		{"group:sunflower_seed", "farming:spent_biomasse"},
		{"group:sunflower_seed", "farming:spent_biomasse"},
		{"group:sunflower_seed", "farming:spent_biomasse"},
		{"group:sunflower_seed", "farming:spent_biomasse"},
		{"group:sunflower_seed", "farming:spent_biomasse"},
		{"group:sunflower_seed", "farming:spent_biomasse"},
		{"group:sunflower_seed", "farming:spent_biomasse"},
		{"group:sunflower_seed", "farming:spent_biomasse"}
	}
})

-- sunflower seed oil
core.register_node("farming:sunflower_oil", {
	description = S("Sunflower Seed Oil"),
	drawtype = "plantlike",
	tiles = {"farming_sunflower_oil.png"},
	inventory_image = "farming_sunflower_oil.png",
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
	type = "shapeless",
	output = "farming:sunflower_oil",
	recipe = {"farming:sunflower_butter", "group:fresh_water_bucket", "vessels:glass_bottle"},
	replacements = {
		{"farming:sunflower_butter", "farming:sunflower_flour"},
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"},
		{"vessels:glass_bottle", "vessels:glass_jar"}
	}
})

-- can be used as fuel
core.register_craft({
	type = "fuel",
	recipe = "group:sunflower_seed",
	burntime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "farming:sunflower_oil",
	burntime = 30,
	replacements = {{"farming:sunflower_oil", "vessels:glass_bottle"}}
})

-- sunflower definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_sunflower_1.png"},
	paramtype = "light",
	visual_scale = 2.,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 3, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:sunflower_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:sunflower_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_sunflower_2.png"}
def.next_plant = "farming:sunflower_S3"
core.register_node("farming:sunflower_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_sunflower_3.png"}
def.next_plant = "farming:sunflower_S4"
def.drop = "farming:spent_biomasse 2"
core.register_node("farming:sunflower_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_sunflower_4.png"}
def.next_plant = "farming:sunflower_S5"
core.register_node("farming:sunflower_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_sunflower_5.png"}
def.next_plant = "farming:sunflower_S6"
core.register_node("farming:sunflower_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_sunflower_6.png"}
def.next_plant = "farming:sunflower_S7"
core.register_node("farming:sunflower_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_sunflower_7.png"}
def.next_plant = "farming:sunflower_S8"
def.drop = "farming:spent_biomasse 3"
core.register_node("farming:sunflower_S7", table.copy(def))

-- stage 8
def.tiles = {"farming_sunflower_8.png"}
def.next_plant = "farming:sunflower_S9"
core.register_node("farming:sunflower_S8", table.copy(def))

-- stage 9
def.tiles = {"farming_sunflower_9.png"}
def.next_plant = "farming:sunflower_S10"
core.register_node("farming:sunflower_S9", table.copy(def))

-- stage 10 (final)
def.drawtype = "mesh"
def.mesh = "farming_sunflower.obj"
def.tiles = {"farming_sunflower_10.png"}
def.use_texture_alpha = "clip"
def.next_plant = nil
def.visual_scale = 1.
def.light_source = 1
def.drop = {
	items = {
		{items = {"farming:sunflower_seeds 25"}},
		{items = {"farming:sunflower_seeds 2"}, rarity = 2},
	}
}
def.after_dig_node = function(pos)
	if math.random(30) == 1 then
	else
local node = core.get_node({x=pos.x, y=pos.y - 1, z=pos.z})
if core.get_item_group(node.name, "soil") > 0 then
	core.add_item(pos, "farming:sunflower_root "..math.random(1, 3))
end
	end
end
core.register_node("farming:sunflower_S10", table.copy(def))
