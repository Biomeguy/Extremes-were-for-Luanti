
local S = core.get_translator("farming")

farming.place_maize = function(itemstack, placer, pointd)
	local under = pointd.under
	local node = core.get_node(under)
	local udef = core.registered_nodes[node.name]
	if udef and udef.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
		return udef.on_rightclick(under, node, placer, itemstack,
			pointd) or itemstack
	end

	return farming.place_seed(itemstack, placer, pointd, "farming:maize_S1")
end

-- maizes
core.register_craftitem("farming:maize_yellow", {
	description = S("Yellow Maize"),
	inventory_image = "farming_maize_yellow.png",
	groups = {maize = 1, grain = 1, flammable = 2},
	on_use = core.item_eat(3, "farming:spent_biomasse"),

	on_place = farming.place_maize,
})

core.register_craftitem("farming:maize_red", {
	description = S("Red Maize"),
	inventory_image = "farming_maize_red.png",
	groups = {maize = 1, grain = 1, flammable = 2},
	on_use = core.item_eat(3, "farming:spent_biomasse"),

	on_place = farming.place_maize,
})

core.register_craftitem("farming:maize_blue", {
	description = S("Blue Maize"),
	inventory_image = "farming_maize_blue.png",
	groups = {maize = 1, grain = 1, flammable = 2},
	on_use = core.item_eat(3, "farming:spent_biomasse"),

	on_place = farming.place_maize,
})

-- maize on the cob (yellow texture by TenPlus1)
core.register_craftitem("farming:maize_yellow_cooked", {
	description = S("Yellow Maize Cooked"),
	inventory_image = "farming_maize_yellow_cooked.png",
	groups = {maize_cooked = 1, flammable = 2},
	on_use = core.item_eat(5, "farming:spent_biomasse"),
})

core.register_craftitem("farming:maize_red_cooked", {
	description = S("Red Maize Cooked"),
	inventory_image = "farming_maize_red_cooked.png",
	groups = {maize_cooked = 1, flammable = 2},
	on_use = core.item_eat(5, "farming:spent_biomasse"),
})

core.register_craftitem("farming:maize_blue_cooked", {
	description = S("Blue Maize Cooked"),
	inventory_image = "farming_maize_blue_cooked.png",
	groups = {maize_cooked = 1, flammable = 2},
	on_use = core.item_eat(5, "farming:spent_biomasse"),
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming:maize_yellow_cooked",
	recipe = "farming:maize_yellow"
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming:maize_red_cooked",
	recipe = "farming:maize_red"
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming:maize_blue_cooked",
	recipe = "farming:maize_blue"
})

-- masas
core.register_craftitem("farming:masa_yellow", {
	description = S("Yellow Masa"),
	inventory_image = "farming_maize_yellow_masa.png",
	groups = {masa = 1, flammable = 1},
	on_use = core.item_eat(22)
})

core.register_craftitem("farming:masa_red", {
	description = S("Red Masa"),
	inventory_image = "farming_maize_red_masa.png",
	groups = {masa = 1, flammable = 1},
	on_use = core.item_eat(22)
})

core.register_craftitem("farming:masa_blue", {
	description = S("Blue Masa"),
	inventory_image = "farming_maize_blue_masa.png",
	groups = {masa = 1, flammable = 1},
	on_use = core.item_eat(22)
})

core.register_craft({
	output = "farming:masa_yellow 8",
	recipe = {
		{"farming:maize_yellow", "farming:maize_yellow", "farming:maize_yellow"},
		{"farming:maize_yellow", "group:grinder", "farming:maize_yellow"},
		{"farming:maize_yellow", "farming:maize_yellow", "farming:maize_yellow"},
	},
	replacements = {
		{"farming:maize_yellow", "farming:spent_biomasse"},
		{"farming:maize_yellow", "farming:spent_biomasse"},
		{"farming:maize_yellow", "farming:spent_biomasse"},
		{"farming:maize_yellow", "farming:spent_biomasse"},
		{"farming:maize_yellow", "farming:spent_biomasse"},
		{"farming:maize_yellow", "farming:spent_biomasse"},
		{"farming:maize_yellow", "farming:spent_biomasse"},
		{"farming:maize_yellow", "farming:spent_biomasse"},
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"}
	}
})

core.register_craft({
	output = "farming:masa_red 8",
	recipe = {
		{"farming:maize_red", "farming:maize_red", "farming:maize_red"},
		{"farming:maize_red", "group:grinder", "farming:maize_red"},
		{"farming:maize_red", "farming:maize_red", "farming:maize_red"},
	},
	replacements = {
		{"farming:maize_red", "farming:spent_biomasse"},
		{"farming:maize_red", "farming:spent_biomasse"},
		{"farming:maize_red", "farming:spent_biomasse"},
		{"farming:maize_red", "farming:spent_biomasse"},
		{"farming:maize_red", "farming:spent_biomasse"},
		{"farming:maize_red", "farming:spent_biomasse"},
		{"farming:maize_red", "farming:spent_biomasse"},
		{"farming:maize_red", "farming:spent_biomasse"},
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"}
	}
})

core.register_craft({
	output = "farming:masa_blue 8",
	recipe = {
		{"farming:maize_blue", "farming:maize_blue", "farming:maize_blue"},
		{"farming:maize_blue", "group:grinder", "farming:maize_blue"},
		{"farming:maize_blue", "farming:maize_blue", "farming:maize_blue"},
	},
	replacements = {
		{"farming:maize_blue", "farming:spent_biomasse"},
		{"farming:maize_blue", "farming:spent_biomasse"},
		{"farming:maize_blue", "farming:spent_biomasse"},
		{"farming:maize_blue", "farming:spent_biomasse"},
		{"farming:maize_blue", "farming:spent_biomasse"},
		{"farming:maize_blue", "farming:spent_biomasse"},
		{"farming:maize_blue", "farming:spent_biomasse"},
		{"farming:maize_blue", "farming:spent_biomasse"},
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"}
	}
})

-- maizestarch
core.register_craftitem("farming:maizestarch", {
	description = S("Maizestarch"),
	inventory_image = "farming_maizestarch.png",
	groups = {flammable = 2},
})

core.register_craft({
	output = "farming:maizestarch",
	recipe = {
		{"farming:mortar_pestle", "group:maize_cooked", "farming:baking_tray"},
		{"", "vessels:wood_bowl", ""},
	},
	replacements = {
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"group:maize_cooked", "farming:spent_biomasse"},
		{"farming:baking_tray", "farming:baking_tray"}
	}
})

core.register_craftitem("farming:ethanol_1", {
	description = S("Ethanol 1.4%"),
	inventory_image = "farming_ethanol_frac.png",
})

core.register_craftitem("farming:ethanol_2", {
	description = S("Ethanol 11.1%"),
	inventory_image = "farming_ethanol_frac.png",
})

-- ethanol (thanks to JKMurray for this idea)
core.register_node("farming:ethanol_3", {
	description = S("Ethanol"),
	drawtype = "plantlike",
	tiles = {"farming_ethanol.png"},
	inventory_image = "farming_ethanol.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, flammable = 4},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "farming:ethanol_1",
	recipe = {
		{"group:maize", "group:maize", "group:maize"},
		{"group:maize", "group:maize", "group:maize"},
		{"group:maize", "vessels:glass_bottle", "group:maize"},
	},
	replacements = {
		{"group:maize", "farming:spent_biomasse"},
		{"group:maize", "farming:spent_biomasse"},
		{"group:maize", "farming:spent_biomasse"},
		{"group:maize", "farming:spent_biomasse"},
		{"group:maize", "farming:spent_biomasse"},
		{"group:maize", "farming:spent_biomasse"},
		{"group:maize", "farming:spent_biomasse"},
		{"group:maize", "farming:spent_biomasse"}
	}
})

core.register_craft({
	output = "farming:ethanol_2",
	recipe = {
		{"farming:ethanol_1", "farming:ethanol_1", "farming:ethanol_1"},
		{"farming:ethanol_1", "farming:ethanol_1", "farming:ethanol_1"},
		{"farming:ethanol_1", "vessels:glass_bottle", "farming:ethanol_1"},
	},
	replacements = {
		{"farming:ethanol_1", "vessels:glass_bottle"},
		{"farming:ethanol_1", "vessels:glass_bottle"},
		{"farming:ethanol_1", "vessels:glass_bottle"},
		{"farming:ethanol_1", "vessels:glass_bottle"},
		{"farming:ethanol_1", "vessels:glass_bottle"},
		{"farming:ethanol_1", "vessels:glass_bottle"},
		{"farming:ethanol_1", "vessels:glass_bottle"},
		{"farming:ethanol_1", "vessels:glass_bottle"}
	}
})

core.register_craft({
	output = "farming:ethanol_3",
	recipe = {
		{"farming:ethanol_2", "farming:ethanol_2", "farming:ethanol_2"},
		{"farming:ethanol_2", "farming:ethanol_2", "farming:ethanol_2"},
		{"farming:ethanol_2", "vessels:glass_bottle", "farming:ethanol_2"},
	},
	replacements = {
		{"farming:ethanol_2", "vessels:glass_bottle"},
		{"farming:ethanol_2", "vessels:glass_bottle"},
		{"farming:ethanol_2", "vessels:glass_bottle"},
		{"farming:ethanol_2", "vessels:glass_bottle"},
		{"farming:ethanol_2", "vessels:glass_bottle"},
		{"farming:ethanol_2", "vessels:glass_bottle"},
		{"farming:ethanol_2", "vessels:glass_bottle"},
		{"farming:ethanol_2", "vessels:glass_bottle"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "farming:ethanol_3",
	burntime = 80, -- more realistic than 240, because ethanol is not efficient
			-- you would need two planets and a half of crops to produce enough.
	replacements = {{"farming:ethanol_3", "vessels:glass_bottle"}}
})

-- maize definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_maize_1.png"},
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:maize_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:maize_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_maize_2.png"}
def.next_plant = "farming:maize_S3"
core.register_node("farming:maize_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_maize_3.png"}
def.next_plant = "farming:maize_S4"
def.drop = "farming:spent_biomasse 2"
core.register_node("farming:maize_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_maize_4.png"}
def.next_plant = "farming:maize_S5"
core.register_node("farming:maize_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_maize_5.png"}
def.next_plant = "farming:maize_S6"
core.register_node("farming:maize_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_maize_6.png"}
def.next_plant = "farming:maize_S7"
def.drop = "farming:spent_biomasse 3"
def.visual_scale = 2.7
core.register_node("farming:maize_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_maize_7.png"}
def.next_plant = "farming:maize_S8"
def.drop = {
	items = {
		{items = {"farming:maize_yellow", "farming:spent_biomasse 3"}},
		{items = {"farming:maize_yellow"}, rarity = 2},
		{items = {"farming:maize_yellow"}, rarity = 3},
	}
}
core.register_node("farming:maize_S7", table.copy(def))

-- stage 8
def.tiles = {"farming_maize_8.png"}
def.next_plant = "farming:maize_S9"
def.drop = {
	items = {
		{items = {"farming:maize_yellow 2", "farming:spent_biomasse 3"}},
		{items = {"farming:maize_yellow 2"}, rarity = 2},
		{items = {"farming:maize_yellow 2"}, rarity = 2},
	}
}
core.register_node("farming:maize_S8", table.copy(def))

-- stage 9
def.tiles = {"farming_maize_9.png"}
def.next_plant = "farming:maize_S10"
def.drop = {
	items = {
		{items = {"farming:maize_red 2", "farming:spent_biomasse 3"}},
		{items = {"farming:maize_red 2"}, rarity = 2},
		{items = {"farming:maize_red 2"}, rarity = 2},
	}
}
core.register_node("farming:maize_S9", table.copy(def))

-- stage 10 (final)
def.tiles = {"farming_maize_10.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:maize_blue 2", "farming:spent_biomasse 3"}},
		{items = {"farming:maize_blue 2"}, rarity = 2},
		{items = {"farming:maize_blue 2"}, rarity = 2},
	}
}
core.register_node("farming:maize_S10", table.copy(def))
