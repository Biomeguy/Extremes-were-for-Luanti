
local S = core.get_translator("farming")

-- raspberries
core.register_craftitem("farming:raspberries", {
	description = S("Raspberries"),
	inventory_image = "farming_raspberries.png",
	groups = {raspberry = 1, flammable = 2},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:raspberry_S1")
	end,
})

-- raspberry leaves
core.register_craftitem("farming:raspberry_leaves", {
	description = S("Raspberry Leaves"),
	inventory_image = "farming_raspberry_leaves.png",
	groups = {flammable = 2},
})

-- hot cup of healthy raspberry leaf tea
vessels.register_cup("farming:raspberry_leaf_tea_hot", S("Hot Cup of Raspberry Leaf Tea"), "farming_raspberry_leaf_tea_hot", core.item_eat(5, "vessels:ceramic_cup"))

core.register_craft({
	type = "shapeless",
	output = "farming:raspberry_leaf_tea_hot",
	recipe = {"vessels:ceramic_cup", "farming:raspberry_leaves", "group:boiling_water"},
	replacements = {
		{"farming:raspberry_leaves", "farming:spent_biomasse"},
		{"group:boiling_water", "bucket:bucket_empty"}
	}
})

-- raspberry smoothie
core.register_craftitem("farming:smoothie_raspberry", {
	description = S("Raspberry Smoothie"),
	inventory_image = "farming_raspberry_smoothie.png",
	groups = {vessel = 1, drink = 1},
	on_use = core.item_eat(2, "vessels:drinking_glass"),
})

core.register_craft({
	output = "farming:smoothie_raspberry",
	recipe = {
		{"default:snow"},
		{"farming:raspberries"},
		{"vessels:drinking_glass"},
	}
})

-- raspberry definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_raspberry_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"farming:raspberry_leaves"}},
			{items = {"farming:raspberry_leaves 2"}, rarity = 2},
		}
	},
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:raspberry_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:raspberry_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_raspberry_2.png"}
def.next_plant = "farming:raspberry_S3"
def.drop = "farming:raspberry_leaves 3"
core.register_node("farming:raspberry_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_raspberry_3.png"}
def.groups.flora = 1
def.next_plant = "farming:raspberry_S4"
def.drop = {
	items = {
		{items = {"farming:raspberry_leaves 3", "farming:spent_biomasse"}},
	}
}
core.register_node("farming:raspberry_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_raspberry_4.png"}
def.groups.flora = 0
def.next_plant = "farming:raspberry_S5"
core.register_node("farming:raspberry_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_raspberry_5.png"}
def.next_plant = "farming:raspberry_S6"
core.register_node("farming:raspberry_S5", table.copy(def))

-- stage 6 (final)
def.tiles = {"farming_raspberry_6.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:raspberries 4"}},
		{items = {"farming:raspberries 6"}, rarity = 2},
		{items = {"farming:raspberries 3"}, rarity = 3},
		{items = {"farming:raspberry_leaves 4"}, rarity = 2},
	}
}
def.after_dig_node = function(pos, _, _, digger)
	if math.random(30) == 1 then
		core.node_dig(pos, {name="farming:raspberry_S3"}, digger)
	else
		core.set_node(pos, {name="farming:raspberry_S4"})
		core.get_node_timer(pos):start(math.random(166, 286))
	end
end
core.register_node("farming:raspberry_S6", table.copy(def))
