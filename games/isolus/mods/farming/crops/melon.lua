
local S = core.get_translator("farming")

-- melon seed
core.register_craftitem("farming:melon_seed", {
	description = S("Melon Seed"),
	inventory_image = "farming_melon_seed.png",
	groups = {flammable = 2},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:melon_S1")
	end,
})

-- melon slice
core.register_craftitem("farming:melon_slice", {
	description = S("Melon Slice"),
	inventory_image = "farming_melon_slice.png",
	groups = {flammable = 1},
	on_use = core.item_eat(2, "farming:spent_biomasse"),
})

core.register_craft({
	output = "farming:melon_seed 5",
	recipe = {{"farming:melon_slice"}},
	replacements = {{"farming:melon_slice", "farming:spent_biomasse"}}
})

core.register_craft({
	output = "farming:melon_S7",
	recipe = {
		{"farming:melon_slice", "farming:melon_slice"},
		{"farming:melon_slice", "farming:melon_slice"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "farming:melon_slice 4",
	recipe = {"farming:melon_S7", "farming:cutting_board"},
	replacements = {{"farming:cutting_board", "farming:cutting_board"}}
})

-- melon seed butter
core.register_node("farming:melon_seed_butter", {
	description = S("Melon Seed Butter"),
	drawtype = "plantlike",
	tiles = {"farming_melon_seed_butter.png"},
	inventory_image = "farming_melon_seed_butter.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(7, "vessels:glass_jar"),
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, nut_butter = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "farming:melon_seed_butter",
	recipe = {
		{"farming:melon_seed", "farming:melon_seed", "farming:melon_seed"},
		{"farming:melon_seed", "farming:melon_seed", "farming:melon_seed"},
		{"farming:melon_seed", "vessels:glass_jar", "farming:melon_seed"}
	}
})

-- melon definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_melon_1.png"},
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
	next_plant = "farming:melon_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:melon_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_melon_2.png"}
def.next_plant = "farming:melon_S3"
core.register_node("farming:melon_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_melon_3.png"}
def.next_plant = "farming:melon_S4"
def.drop = "farming:spent_biomasse 2"
core.register_node("farming:melon_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_melon_4.png"}
def.next_plant = "farming:melon_S5"
core.register_node("farming:melon_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_melon_5_top.png", "farming_melon_5_top.png", "farming_melon_5.png"}
def.next_plant = "farming:melon_S6"
def.use_texture_alpha = "clip"
def.drawtype = "nodebox"
def.waving = 0
def.light_source = 1
def.node_box = {
	type = "fixed",
	fixed = {
		{-0.1875, -0.5, -0.1875, 0.1875, -0.125, 0.1875},
		{-0.5, -0.5, 0.03, 0.5, 0.5, 0.03},
		{0.03, -0.5, -0.5, 0.03, 0.5, 0.5},
	}
}
def.selection_box = {
	type = "fixed",
	fixed = {
		{-0.1875, -0.5, -0.1875, 0.1875, -0.125, 0.1875},
	}
}
core.register_node("farming:melon_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_melon_6_top.png", "farming_melon_6_top.png", "farming_melon_6.png"}
def.next_plant = "farming:melon_S7"
def.walkable = true
def.node_box = {
	type = "fixed",
	fixed = {
		{-0.3125, -0.5, -0.3125, 0.3125, 0.125, 0.3125},
		{-0.5, -0.5, 0.03, 0.5, 0.5, 0.03},
		{0.03, -0.5, -0.5, 0.03, 0.5, 0.5},
	}
}
def.drop = {
	items = {
		{items = {"farming:melon_slice", "farming:spent_biomasse 2"}},
	}
}
def.selection_box = {
	type = "fixed",
	fixed = {
		{-0.3125, -0.5, -0.3125, 0.3125, 0.125, 0.3125},
	}
}
def.collision_box = {
	type = "fixed",
	fixed = {
		{-0.3125, -0.5, -0.3125, 0.3125, 0.125, 0.3125},
	}
}
core.register_node("farming:melon_S6", table.copy(def))

-- stage 7 (final)
core.register_node("farming:melon_S7", {
	description = S("Melon"),
	tiles = {"farming_melon_top.png", "farming_melon_top.png", "farming_melon_side.png"},
	groups = {snappy = 1, oddly_breakable_by_hand = 1, flammable = 1, plant = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_punch = function(pos, node, clicker)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "farming:cutting_board" then
			core.set_node(pos, {name="farming:cut_melon_1"})
			clicker:set_hp(clicker:get_hp()+2)
			core.add_item(pos, "farming:spent_biomasse")
		end
	end,
	on_timer = farming.grow_plant,
})

core.register_node("farming:cut_melon_1", {
	tiles = {"farming_melon_top.png", "farming_melon_top.png", "farming_melon_side.png",
		"farming_melon_cut_3.png", "farming_melon_side.png", "farming_melon_cut_1.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0, -0.5, -0.5, 0.5, 0.5, 0},
			{-0.5, -0.5, 0, 0.5, 0.5, 0.5},
		}
	},
	drop = "farming:melon_slice 3",
	groups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1},
	on_punch = function(pos, node, clicker)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "farming:cutting_board" then
			core.set_node(pos, {name="farming:cut_melon_2"})
			clicker:set_hp(clicker:get_hp()+2)
			core.add_item(pos, "farming:spent_biomasse")
		end
	end,
})

core.register_node("farming:cut_melon_2", {
	tiles = {"farming_melon_top.png", "farming_melon_top.png", "farming_melon_side.png",
		"farming_melon_side.png", "farming_melon_side.png", "farming_melon_cut_2.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0.5, 0.5},
		}
	},
	drop = "farming:melon_slice 2",
	groups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1},
	on_punch = function(pos, node, clicker)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "farming:cutting_board" then
			core.set_node(pos, {name="farming:cut_melon_3"})
			clicker:set_hp(clicker:get_hp()+2)
			core.add_item(pos, "farming:spent_biomasse")
		end
	end,
})

core.register_node("farming:cut_melon_3", {
	tiles = {"farming_melon_top.png", "farming_melon_top.png", "farming_melon_side.png",
	"farming_melon_cut_2.png^[transformFX", "farming_melon_side.png", "farming_melon_cut_2.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0, -0.5, 0, 0.5, 0.5, 0.5},
		}
	},
	drop = "farming:melon_slice",
	groups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1},
	on_punch = function(pos, node, clicker)
		core.remove_node(pos)
		clicker:set_hp(clicker:get_hp()+2)
		core.add_item(pos, "farming:spent_biomasse")
	end,
})
