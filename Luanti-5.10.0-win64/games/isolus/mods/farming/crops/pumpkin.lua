
local S = core.get_translator("farming")

-- pumpkin slice
core.register_craftitem("farming:pumpkin_slice", {
	description = S("Pumpkin Slice"),
	inventory_image = "farming_pumpkin_slice.png",
	groups = {pumpkin_slice = 1, flammable = 2},
	on_use = core.item_eat(2, "farming:spent_biomasse"),

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

		return farming.place_seed(itemstack, placer, pointd, "farming:pumpkin_S1")
	end,
})

-- pumpkin seeds
core.register_craftitem("farming:pumpkin_seed", {
	description = S("Pumpkin Seed"),
	inventory_image = "farming_pumpkin_seed.png",
	groups = {pumpkin_seed = 1},
	on_use = core.item_eat(1),
})

core.register_craftitem("farming:pumpkin_seed_roasted", {
	description = S("Roasted Pumpkin Seed"),
	inventory_image = "farming_pumpkin_seed_roasted.png",
	groups = {pumpkin_seed = 1},
	on_use = core.item_eat(2),
})

core.register_craft({
	output = "farming:pumpkin_seed 7",
	recipe = {
		{"farming:pumpkin_slice"},
	}
})

core.register_craft({
	type = "cooking",
	output = "farming:pumpkin_seed_roasted",
	recipe = "farming:pumpkin_seed"
})

core.register_craft({
	output = "farming:pumpkin_S8",
	recipe = {
		{"farming:pumpkin_slice", "farming:pumpkin_slice"},
		{"farming:pumpkin_slice", "farming:pumpkin_slice"},
	}
})

core.register_craft({
	type = "shapeless",
	output = "farming:pumpkin_slice 4",
	recipe = {"farming:pumpkin_S8", "farming:cutting_board"},
	replacements = {{"farming:cutting_board", "farming:cutting_board"}},
})

-- pumpkin bread
core.register_craftitem("farming:pumpkin_bread", {
	description = S("Pumpkin Bread"),
	inventory_image = "farming_pumpkin_bread.png",
	on_use = core.item_eat(8),
	groups = {bread = 1, flammable = 2},
})

core.register_craftitem("farming:pumpkin_dough", {
	description = S("Pumpkin Dough"),
	inventory_image = "farming_pumpkin_dough.png",
})

core.register_craft({
	type = "shapeless",
	output = "farming:pumpkin_dough 2",
	recipe = {"group:dough", "group:pumpkin_slice"},
	replacements = {{"farming:pumpkin_slice", "farming:spent_biomasse"}},
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming:pumpkin_bread",
	recipe = "farming:pumpkin_dough"
})

-- pumpkin spice
core.register_craftitem("farming:pumpkin_spice", {
	description = S("Pumpkin Spice"),
	inventory_image = "farming_pumpkin_spice.png",
})

core.register_craft({
	type = "shapeless",
	output = "farming:pumpkin_spice 2",
	recipe = {"farming:pumpkin_slice", "group:sugar", "farming:cinnamon", "group:nutmeg",
		"farming:ginger", "farming:peppercorn_ground"},
	replacements = {
		{"farming:pumpkin_slice", "farming:pumpkin_seed 4"},
		{"farming:peppercorn_ground", "vessels:glass_bottle"}
	}
})

-- hot cup of pumpkin spice latte
vessels.register_cup("farming:pumpkin_spice_latte_hot", S("Hot Cup of Pumpkin Spice Latte"), "farming_pumpkin_spice_latte_hot", core.item_eat(6, "vessels:ceramic_cup"))

core.register_craft({
	type = "shapeless",
	output = "farming:pumpkin_spice_latte_hot 3",
	recipe = {"vessels:ceramic_cup", "farming:coffee_hot", "farming:coffee_hot", "farming:pumpkin_spice", "group:milk"},
	replacements = {{"group:milk", "bucket:bucket_empty"}}
})

-- pumpkin seed butter
core.register_node("farming:pumpkin_seed_butter", {
	description = S("Pumpkin Seed Butter"),
	drawtype = "plantlike",
	tiles = {"farming_pumpkin_seed_butter.png"},
	inventory_image = "farming_pumpkin_seed_butter.png",
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
	output = "farming:pumpkin_seed_butter",
	recipe = {
		{"group:pumpkin_seed", "group:pumpkin_seed", "group:pumpkin_seed"},
		{"group:pumpkin_seed", "group:pumpkin_seed", "group:pumpkin_seed"},
		{"group:pumpkin_seed", "vessels:glass_jar", "group:pumpkin_seed"}
	}
})

-- jack 'o lantern
core.register_node("farming:jackolantern", {
	description = S("Jack 'O Lantern (punch to turn on and off)"),
	tiles = {"farming_pumpkin_top.png", "farming_pumpkin_top.png",
		"farming_pumpkin_side.png", "farming_pumpkin_side.png",
		"farming_pumpkin_side.png", "farming_pumpkin_face_off.png"},
	paramtype2 = "facedir",
	groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_punch = function(pos, node, puncher)
		local name = puncher:get_player_name() or ""
		if core.is_protected(pos, name) then return end
		node.name = "farming:jackolantern_on"
		core.swap_node(pos, node)
	end,
})

core.register_node("farming:jackolantern_on", {
	tiles = {"farming_pumpkin_top.png", "farming_pumpkin_top.png",
		"farming_pumpkin_side.png", "farming_pumpkin_side.png",
		"farming_pumpkin_side.png", "farming_pumpkin_face_on.png"},
	light_source = default.LIGHT_MAX - 1,
	paramtype2 = "facedir",
	groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2,
		not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
	drop = "farming:jackolantern",
	on_punch = function(pos, node, puncher)
		local name = puncher:get_player_name() or ""
		if core.is_protected(pos, name) then return end
		node.name = "farming:jackolantern"
		core.swap_node(pos, node)
	end,
})

core.register_craft({
	output = "farming:jackolantern",
	recipe = {
		{"default:torch"},
		{"group:pumpkin"},
	}
})

--- wooden scarecrow base
core.register_node("farming:scarecrow_base", {
	description = S("Scarecrow Base"),
	drawtype = "nodebox",
	tiles = {"default_wood.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16},
			{-12/16, 4/16, -1/16, 12/16, 2/16, 1/16},
		},
	},
	groups = {snappy = 3, flammable = 2},
})

core.register_craft({
	output = "farming:scarecrow_base",
	recipe = {
		{"", "group:stick", ""},
		{"group:stick", "group:stick", "group:stick"},
		{"", "group:stick", ""}
	}
})

-- pumpkin definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_pumpkin_1.png"},
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
	next_plant = "farming:pumpkin_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:pumpkin_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_pumpkin_2.png"}
def.next_plant = "farming:pumpkin_S3"
core.register_node("farming:pumpkin_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_pumpkin_3.png"}
def.next_plant = "farming:pumpkin_S4"
def.drop = "farming:spent_biomasse 2"
core.register_node("farming:pumpkin_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_pumpkin_4.png"}
def.next_plant = "farming:pumpkin_S5"
core.register_node("farming:pumpkin_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_pumpkin_5.png"}
def.next_plant = "farming:pumpkin_S6"
core.register_node("farming:pumpkin_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_pumpkin_6_top.png", "farming_pumpkin_6_top.png", "farming_pumpkin_6.png"}
def.next_plant = "farming:pumpkin_S7"
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
core.register_node("farming:pumpkin_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_pumpkin_7_top.png", "farming_pumpkin_7_top.png", "farming_pumpkin_7.png"}
def.next_plant = "farming:pumpkin_S8"
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
		{items = {"farming:pumpkin_slice", "farming:spent_biomasse 2"}},
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
core.register_node("farming:pumpkin_S7", table.copy(def))

-- stage 8 (final)
core.register_node("farming:pumpkin_S8", {
	description = S("Pumpkin"),
	tiles = {"farming_pumpkin_top.png", "farming_pumpkin_top.png", "farming_pumpkin_side.png"},
	groups = {pumpkin = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, plant = 1},
	sounds = default.node_sound_wood_defaults(),
	on_punch = function(pos, node, clicker)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "farming:cutting_board" then
			core.set_node(pos, {name="farming:cut_pumpkin_1"})
			clicker:set_hp(clicker:get_hp()+2)
			core.add_item(pos, "farming:spent_biomasse")
		end
	end,
	on_timer = farming.grow_plant,
})

core.register_node("farming:cut_pumpkin_1", {
	tiles = {"farming_pumpkin_top.png", "farming_pumpkin_top.png", "farming_pumpkin_side.png",
		"farming_pumpkin_cut_3.png", "farming_pumpkin_side.png", "farming_pumpkin_cut_1.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0, -0.5, -0.5, 0.5, 0.5, 0},
			{-0.5, -0.5, 0, 0.5, 0.5, 0.5},
		}
	},
	drop = "farming:pumpkin_slice 3",
	groups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1},
	on_punch = function(pos, node, clicker)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "farming:cutting_board" then
			core.set_node(pos, {name="farming:cut_pumpkin_2"})
			clicker:set_hp(clicker:get_hp()+2)
			core.add_item(pos, "farming:spent_biomasse")
		end
	end,
})

core.register_node("farming:cut_pumpkin_2", {
	tiles = {"farming_pumpkin_top.png", "farming_pumpkin_top.png", "farming_pumpkin_side.png",
		"farming_pumpkin_side.png", "farming_pumpkin_side.png", "farming_pumpkin_cut_2.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0.5, 0.5},
		}
	},
	drop = "farming:pumpkin_slice 2",
	groups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1},
	on_punch = function(pos, node, clicker)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "farming:cutting_board" then
			core.set_node(pos, {name="farming:cut_pumpkin_3"})
			clicker:set_hp(clicker:get_hp()+2)
			core.add_item(pos, "farming:spent_biomasse")
		end
	end,
})

core.register_node("farming:cut_pumpkin_3", {
	tiles = {"farming_pumpkin_top.png", "farming_pumpkin_top.png", "farming_pumpkin_side.png",
	"farming_pumpkin_cut_2.png^[transformFX", "farming_pumpkin_side.png", "farming_pumpkin_cut_2.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0, -0.5, 0, 0.5, 0.5, 0.5},
		}
	},
	drop = "farming:pumpkin_slice",
	groups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1},
	on_punch = function(pos, node, clicker)
		core.remove_node(pos)
		clicker:set_hp(clicker:get_hp()+2)
		core.add_item(pos, "farming:spent_biomasse")
	end,
})
