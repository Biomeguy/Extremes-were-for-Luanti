
local S = core.get_translator("farming")

-- coffee
core.register_craftitem("farming:coffee_beans", {
	description = S("Coffee Beans"),
	inventory_image = "farming_coffee_beans.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:coffee_S1")
	end,
})

-- ground coffee
core.register_craftitem("farming:coffee_ground", {
	description = S("Ground Coffee"),
	inventory_image = "farming_coffee_ground.png",
})

core.register_craft({
	output = "farming:coffee_ground 8",
	recipe = {
		{"farming:coffee_beans", "farming:coffee_beans", "farming:coffee_beans"},
		{"farming:coffee_beans", "group:grinder", "farming:coffee_beans"},
		{"farming:coffee_beans", "farming:coffee_beans", "farming:coffee_beans"},
	},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"}
	}
})

-- hot cup of coffee
vessels.register_cup("farming:coffee_hot", S("Hot Cup of Coffee"), "farming_coffee_hot", core.item_eat(3, "vessels:ceramic_cup"))

core.register_craft({
	type = "shapeless",
	output = "farming:coffee_hot",
	recipe = {"vessels:ceramic_cup", "farming:coffee_ground", "group:boiling_water"},
	replacements = {
		{"farming:coffee_ground", "farming:spent_biomasse"},
		{"group:boiling_water", "bucket:bucket_empty"}
	}
})

-- coffee definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_coffee_1.png"},
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:coffee_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:coffee_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_coffee_2.png"}
def.next_plant = "farming:coffee_S3"
core.register_node("farming:coffee_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_coffee_3.png"}
def.next_plant = "farming:coffee_S4"
core.register_node("farming:coffee_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_coffee_4.png"}
def.next_plant = "farming:coffee_S5"
core.register_node("farming:coffee_S4", table.copy(def))

-- stage 5 (final)
def.tiles = {"farming_coffee_5.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:coffee_beans 2", "farming:spent_biomasse"}},
		{items = {"farming:coffee_beans 3"}, rarity = 2},
		{items = {"farming:coffee_beans 5"}, rarity = 3}
	}
}
core.register_node("farming:coffee_S5", table.copy(def))
