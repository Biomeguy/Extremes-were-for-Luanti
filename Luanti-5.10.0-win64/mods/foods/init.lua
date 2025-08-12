
local S = core.get_translator("foods")

core.register_craftitem("foods:churn", {
	description = S("Churn"),
	inventory_image = "foods_churn.png",
})

core.register_craft({
	output = "foods:churn",
	recipe = {
		{"", "default:ice", ""},
		{"default:steel_ingot", "group:wood", "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
	}
})

core.register_craftitem("foods:separater", {
	description = S("Separater"),
	inventory_image = "foods_separater.png",
})

core.register_craft({
	output = "foods:separater",
	recipe = {
		{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", ""},
		{"basic_materials:plastic_strip", "default:steel_ingot", "group:stick"},
		{"dye:blue", "basic_materials:plastic_sheet", "dye:black"},
	}
})

core.register_node("foods:sugar_base", {
	description = S("Sugar Base"),
	drawtype = "plantlike",
	tiles = {"foods_sugar_base.png"},
	inventory_image = "foods_sugar_base.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .3, .25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "foods:sugar_base 2",
	recipe = {
		{"default:reed"},
		{"vessels:glass_bottle"},
		{"vessels:glass_bottle"},
	}
})

core.register_craft({
	output = "foods:sugar_base 6",
	recipe = {
		{"", "farming:sugar_beet", ""},
		{"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"},
		{"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"},
	},
	replacements = {{"farming:sugar_beet", "farming:sugar_beet_leaves"}}
})

core.register_craft({
	output = "foods:sugar_base 8",
	recipe = {
		{"vessels:glass_bottle", "default:papyrus", "vessels:glass_bottle"},
		{"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"},
		{"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"},
	}
})

-- Cane syrup, Dark molasses, Blackstrap molasses
core.register_node("foods:molasses_1", {
	description = S("Cane Syrup"),
	drawtype = "plantlike",
	tiles = {"foods_cane_syrup.png"},
	inventory_image = "foods_cane_syrup.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(1, "vessels:glass_bottle"),
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .3, .25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("foods:molasses_2", {
	description = S("Dark Molasses"),
	drawtype = "plantlike",
	tiles = {"foods_molasses.png"},
	inventory_image = "foods_molasses.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(2, "vessels:glass_bottle"),
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .3, .25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, molasses = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("foods:molasses_3", {
	description = S("Blackstrap Molasses"),
	drawtype = "plantlike",
	tiles = {"foods_blackstrap_molasses.png"},
	inventory_image = "foods_blackstrap_molasses.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(1, "vessels:glass_bottle"),
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .3, .25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, molasses = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	type = "cooking",
	cooktime = 3,
	output = "foods:molasses_1",
	recipe = "foods:sugar_base"
})

core.register_craft({
	type = "cooking",
	cooktime = 6,
	output = "foods:molasses_2",
	recipe = "foods:molasses_1",
    replacements = {{"foods:molasses_1", "farming:sugar"}}
})

core.register_craft({
	type = "cooking",
	cooktime = 7,
	output = "foods:molasses_3",
	recipe = "foods:molasses_2",
    replacements = {{"foods:molasses_2", "farming:sugar"}}
})

core.register_craft({
	type = "cooking",
	cooktime = 8,
	output = "farming:sugar",
	recipe = "foods:molasses_3",
    replacements = {{"foods:molasses_3", "vessels:glass_bottle"}}
})

-- Caramel
core.register_craftitem("foods:caramel", {
	description = S("Caramel"),
	inventory_image = "foods_caramel.png",
	groups = {flammable = 2},
	on_use = core.item_eat(2),
})

core.register_craft({
	type = "shapeless",
	output = "foods:caramel 4",
	recipe = {"group:sugar", "group:sugar", "group:sugar", "group:sugar",
		"group:sugar", "group:sugar", "group:saucepan"},
	replacements = {
		{"farming:saucepan", "farming:saucepan"},
		{"aztec:saucepan", "aztec:saucepan"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 5,
	output = "foods:caramel 2",
	recipe = "mobs:bucket_condensed_milk",
	replacements = {{"mobs:bucket_condensed_milk", "bucket:bucket_empty"}}
})

-- Carrot juice
core.register_craftitem("foods:carrot_juice", {
	description = S("Carrot Juice with Pulp"),
	inventory_image = "foods_carrot_juice.png",
	groups = {vessel = 1, drink = 1},
	on_use = core.item_eat(4, "vessels:drinking_glass"),
})

core.register_craft({
	type = "shapeless",
	output = "foods:carrot_juice 3",
	recipe = {"farming:carrot", "farming:carrot", "farming:carrot", "vessels:drinking_glass",
		"vessels:drinking_glass", "vessels:drinking_glass", "farming:mortar_pestle"},
	replacements = {{"farming:mortar_pestle", "farming:mortar_pestle"}}
})

-- Apple juice
core.register_craftitem("foods:apple_juice", {
	description = S("Apple Juice with Pulp"),
	inventory_image = "foods_apple_juice.png",
	on_use = core.item_eat(3, "vessels:drinking_glass"),
	groups = {vessel = 1, drink = 1},
})

core.register_craft({
	type = "shapeless",
	output = "foods:apple_juice 2",
	recipe = {"default:apple", "default:apple", "default:apple", "vessels:drinking_glass",
		"vessels:drinking_glass", "farming:mortar_pestle"},
	replacements = {
		{"default:apple", "farming:spent_biomasse"},
		{"default:apple", "farming:spent_biomasse"},
		{"default:apple", "farming:spent_biomasse"},
		{"farming:mortar_pestle", "farming:mortar_pestle"}
	}
})

-- Orange juice
core.register_craftitem("foods:orange_juice", {
	description = S("Orange Juice with Pulp"),
	inventory_image = "foods_orange_juice.png",
	on_use = core.item_eat(4, "vessels:drinking_glass"),
	groups = {vessel = 1, drink = 1},
})

core.register_craft({
	type = "shapeless",
	output = "foods:orange_juice 3",
	recipe = {"default:orange", "default:orange", "default:orange", "vessels:drinking_glass",
		"vessels:drinking_glass", "vessels:drinking_glass", "farming:mortar_pestle"},
	replacements = {{"farming:mortar_pestle", "farming:mortar_pestle"}}
})

-- Spectrum juice
core.register_craftitem("foods:spectrum_juice", {
	description = S("Spectrum Juice"),
	inventory_image = "foods_spectrum_juice.png",
	groups = {vessel = 1},
	on_use = core.item_eat(20, "vessels:drinking_glass"),
})

core.register_craft({
	type = "shapeless",
	output = "foods:spectrum_juice 8",
	recipe = {"default:spectrum", "vessels:drinking_glass", "vessels:drinking_glass",
		"vessels:drinking_glass", "vessels:drinking_glass", "vessels:drinking_glass",
		"vessels:drinking_glass", "vessels:drinking_glass", "vessels:drinking_glass"}
})

-- Bowls of Salad
core.register_node("foods:salad_bowl", {
	description = S("Bowl of Salad"),
	drawtype = "plantlike",
	tiles = {"foods_salad_bowl.png"},
	inventory_image = "foods_salad_bowl.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(4, "vessels:mixing_bowl"),
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .38, .3}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "foods:salad_bowl",
	recipe = {
		{"group:lettuce", "farming:onion", "group:greens"},
		{"group:greens", "group:herb", "farming:quinoa_cooked"},
		{"flowers:dandelion", "group:sweet_pepper", "vessels:mixing_bowl"},
	},
	replacements = {{"farming:quinoa_cooked", "vessels:wood_bowl"}}
})

-- Sauce Hollandaise
core.register_node("foods:sauce_hollandaise", {
	description = S("Sauce Hollandaise"),
	drawtype = "plantlike",
	tiles = {"foods_sauce_hollandaise.png"},
	inventory_image = "foods_sauce_hollandaise.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(3, "vessels:glass_bottle"),
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .3, .25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, sauce = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "foods:sauce_hollandaise",
	recipe = {
		{"farming:parsley", "group:butter", "farming:rosemary"},
		{"", "group:milk", ""},
		{"", "vessels:glass_bottle", ""},
	},
	replacements = {{"group:milk", "bucket:bucket_empty"}}
})

core.register_node("foods:salad_bowl_hollandaise", {
	description = S("Bowl of Salad with Hollandaise"),
	drawtype = "plantlike",
	tiles = {"foods_salad_bowl_hollandaise.png"},
	inventory_image = "foods_salad_bowl_hollandaise.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(7, "vessels:mixing_bowl"),
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .38, .3}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "foods:salad_bowl_hollandaise",
	recipe = {
		{"foods:sauce_hollandaise"},
		{"foods:salad_bowl"},
	},
	replacements = {{"foods:sauce_hollandaise", "vessels:glass_bottle"}}
})

core.register_node("foods:salad_bowl_oil", {
	description = S("Bowl of Salad with Oil"),
	drawtype = "plantlike",
	tiles = {"foods_salad_bowl_oil.png"},
	inventory_image = "foods_salad_bowl_oil.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(5, "vessels:mixing_bowl"),
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .38, .3}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "foods:salad_bowl_oil",
	recipe = {
		{"group:food_oil"},
		{"foods:salad_bowl"},
	},
	replacements = {{"group:food_oil", "vessels:glass_bottle"}}
})

-- Pizzas
core.register_craftitem("foods:pizza_vegan_raw", {
	description = S("Vegan Pizza (raw)"),
	inventory_image = "foods_pizza_vegan_raw.png",
	groups = {flammable = 2},
	on_use = core.item_eat(2),
})

core.register_craft({
	output = "foods:pizza_vegan_raw",
	recipe = {
		{"", "foods:sauce_hollandaise", ""},
		{"farming:asparagus", "group:lettuce", "farming:rosemary"},
		{"", "group:dough", ""},
	},
	replacements = {{"foods:sauce_hollandaise", "vessels:glass_bottle"}}
})

core.register_craftitem("foods:pizza_vegan", {
	description = S("Vegan Pizza"),
	inventory_image = "foods_pizza_vegan.png",
	groups = {flammable = 2},
	on_use = core.item_eat(6),
})

core.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "foods:pizza_vegan",
	recipe = "foods:pizza_vegan_raw"
})

core.register_craftitem("foods:pizza_funghi_raw", {
	description = S("Funghi Pizza (raw)"),
	inventory_image = "foods_pizza_funghi_raw.png",
	groups = {flammable = 2},
	on_use = core.item_eat(2),
})

core.register_craft({
	output = "foods:pizza_funghi_raw",
	recipe = {
		{"", "group:food_oil", "farming:rosemary"},
		{"flowers:mushroom_brown", "farming:vegan_meat", "flowers:mushroom_brown"},
		{"", "group:dough", ""},
	},
	replacements = {{"group:food_oil", "vessels:glass_bottle"}}
})

core.register_craftitem("foods:pizza_funghi", {
	description = S("Funghi Pizza"),
	inventory_image = "foods_pizza_funghi.png",
	groups = {flammable = 2},
	on_use = core.item_eat(6),
})

core.register_craft({
	type = "cooking",
	cooktime = 18,
	output = "foods:pizza_funghi",
	recipe = "foods:pizza_funghi_raw"
})

core.register_node("foods:asparagus_hollandaise", {
	description = S("Asparagus Hollandaise"),
	drawtype = "plantlike",
	tiles = {"foods_asparagus_hollandaise.png"},
	inventory_image = "foods_asparagus_hollandaise.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(5, "vessels:ceramic_plate"),
	selection_box = {
		type = "fixed",
		fixed = {-.28, -.5, -.28, .28, -.15, .28}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "foods:asparagus_hollandaise",
	recipe = {
		{"farming:asparagus", "foods:sauce_hollandaise", "farming:parsley"},
		{"", "group:skillet", "vessels:ceramic_plate"},
	},
	replacements = {
		{"farming:skillet", "farming:skillet"},
		{"aztec:skillet", "aztec:skillet"},
		{"foods:sauce_hollandaise", "vessels:glass_bottle"}
	}
})

core.register_node("foods:rice_asparagus", {
	description = S("Asparagus on Rice"),
	drawtype = "plantlike",
	tiles = {"foods_rice_asparagus.png"},
	inventory_image = "foods_rice_asparagus.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(6, "vessels:ceramic_plate"),
	selection_box = {
		type = "fixed",
		fixed = {-.28, -.5, -.28, .28, -.15, .28}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "foods:rice_asparagus",
	recipe = {
		{"farming:asparagus", "farming:rice_cooked", "group:butter"},
		{"", "group:skillet", "vessels:ceramic_plate"},
	},
	replacements = {
		{"farming:skillet", "farming:skillet"},
		{"aztec:skillet", "aztec:skillet"},
		{"farming:rice_cooked", "vessels:wood_bowl"}
	}
})

core.register_node("foods:fish_parsley_rosemary", {
	description = S("Fish with Parsley and Rosemary"),
	drawtype = "plantlike",
	tiles = {"foods_fish_parsley_rosemary.png"},
	inventory_image = "foods_fish_parsley_rosemary.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(6, "vessels:ceramic_plate"),
	selection_box = {
		type = "fixed",
		fixed = {-.28, -.5, -.28, .28, -.15, .28}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "foods:fish_parsley_rosemary",
	recipe = {
		{"farming:parsley", "group:food_oil", "farming:rosemary"},
		{"", "farming:vegan_fish", ""},
		{"", "group:skillet", "vessels:ceramic_plate"},
	},
	replacements = {
		{"farming:skillet", "farming:skillet"},
		{"aztec:skillet", "aztec:skillet"},
		{"group:food_oil", "vessels:glass_bottle"}
	}
})

-- Chicken soup
core.register_craftitem("foods:chicken_soup", {
	description = S("Chicken Soup"),
	inventory_image = "foods_chicken_soup.png",
	on_use = core.item_eat(6, "vessels:wood_bowl"),
})

core.register_craft({
	output = "foods:chicken_soup",
	recipe = {
		{"farming:onion", "group:food_oil", "farming:rosemary"},
		{"farming:peppercorn_ground", "group:chicken_raw", "farming:barley"},
		{"farming:cutting_board", "group:boiling_water", "vessels:wood_bowl"},
	},
	replacements = {
		{"farming:cutting_board", "farming:cutting_board"},
		{"group:boiling_water", "bucket:bucket_empty"},
		{"farming:barley", "farming:straw_pile"},
		{"group:food_oil", "vessels:glass_bottle"},
		{"farming:peppercorn_ground", "vessels:glass_bottle"}
	}
})

-- MLT
core.register_craftitem("foods:mlt_burger", {
	description = S("MLT (Mutton, Lettuce, Tomato)"),
	inventory_image = "foods_mlt.png",
	groups = {flammable = 2},
	on_use = core.item_eat(6),
})

core.register_craft({
	output = "foods:mlt_burger",
	recipe = {
		{"mobs:mutton_cooked", "group:lettuce", "farming:tomato"},
		{"", "farming:cutting_board", "group:bread"},
	},
	replacements = {{"farming:cutting_board", "farming:cutting_board"}}
})

-- Potato uses
core.register_craftitem("foods:potato_slices", {
	description = S("Sliced Potato"),
	inventory_image = "foods_potato_slices.png",
	groups = {flammable = 1},
	on_use = core.item_eat(2),
})

core.register_craft({
	output = "foods:potato_slices",
	recipe = {
		{"farming:potato"},
		{"farming:cutting_board"},
	},
	replacements = {{"farming:cutting_board", "farming:cutting_board"}}
})

core.register_craftitem("foods:potato_chips", {
	description = S("Potato Chips"),
	inventory_image = "foods_potato_chips.png",
	groups = {flammable = 2},
	on_use = core.item_eat(3, "vessels:wood_bowl"),
})

core.register_craft({
	type = "shapeless",
	output = "foods:potato_chips 3",
	recipe = {"foods:potato_slices", "foods:potato_slices", "foods:potato_slices",
		"group:food_oil", "group:skillet", "vessels:wood_bowl",
		"vessels:wood_bowl", "vessels:wood_bowl"},
	replacements = {
		{"group:food_oil", "vessels:glass_bottle"},
		{"farming:skillet", "farming:skillet"},
		{"aztec:skillet", "aztec:skillet"}
	}
})

cake_box2 = {
	type = "fixed",
	fixed = {
		{-.375, -.5, -.375, .375, -.1875, .375},
		{-.3125, -.5, -.3125, .3125, -.0625, .3125}
	}
}

core.register_node("foods:casserole", {
	description = S("Casserole"),
	drawtype = "nodebox",
	tiles = {"foods_casserole.png", "foods_cake_bottom.png"},
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(5),
	node_box = cake_box2,
	groups = {crumbly = 3, attached_node = 1},
})

core.register_craft({
	output = "foods:casserole",
	recipe = {
		{"farming:carrot", "farming:potato", "farming:tomato"},
		{"", "group:dough", ""},
		{"", "group:baking_tray", ""},
	},
	replacements = {
		{"farming:baking_tray", "farming:baking_tray"},
		{"aztec:baking_tray", "aztec:baking_tray"}
	}
})

-- Sushi
core.register_craftitem("foods:sushi", {
	description = S("Sushi"),
	inventory_image = "foods_sushi.png",
	groups = {flammable = 2},
	on_use = core.item_eat(4),
})

core.register_craft({
	output = "foods:sushi 4",
	recipe = {
		{"group:fish"},
		{"farming:rice_cooked"},
		{"default:kelp"},
	},
	replacements = {{"farming:rice_cooked", "vessels:wood_bowl"}}
})

-- Rose Water
core.register_node("foods:rose_water", {
	description = S("Rose Water"),
	drawtype = "plantlike",
	tiles = {"foods_rose_water.png"},
	inventory_image = "foods_rose_water.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .3, .25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "foods:rose_water",
	recipe = {
		{"flowers:rose", "flowers:rose", "flowers:rose"},
		{"flowers:rose", "flowers:rose", "flowers:rose"},
		{"", "group:boiling_water", "vessels:glass_bottle"},
	},
	replacements = {
		{"flowers:rose", "farming:spent_biomasse"},
		{"flowers:rose", "farming:spent_biomasse"},
		{"flowers:rose", "farming:spent_biomasse"},
		{"flowers:rose", "farming:spent_biomasse"},
		{"flowers:rose", "farming:spent_biomasse"},
		{"flowers:rose", "dye:red"},
		{"group:boiling_water", "bucket:bucket_empty"}
	}
})

-- Turkish Delight
core.register_craftitem("foods:turkish_delight", {
	description = S("Turkish Delight"),
	inventory_image = "foods_turkish_delight.png",
	groups = {flammable = 3},
	on_use = core.item_eat(2),
})

core.register_craft({-- group:gelatin
	output = "foods:turkish_delight 4",
	recipe = {
		{"farming:maizestarch", "dye:pink", "farming:maizestarch"},
		{"group:sugar", "foods:rose_water", "group:sugar"},
		{"group:sugar", "farming:maizestarch", "group:sugar"},
	},
	replacements = {
		{"farming:maizestarch", "vessels:wood_bowl"},
		{"farming:maizestarch", "vessels:wood_bowl"},
		{"farming:maizestarch", "vessels:wood_bowl"},
		{"foods:rose_water", "vessels:glass_bottle"}
	}
})

-- Date & Nut recipes!
if core.get_modpath("cedar") and core.get_modpath("fir") and core.registered_items["group:spruce_nut"] then
core.register_craftitem("foods:date_nut_snack", {
	description = S("Date & Nut Snack"),
	inventory_image = "foods_date_nut_snack.png",
	on_use = core.item_eat(4),
	groups = {flammable = 1},
})

core.register_craftitem("foods:date_nut_dough", {
	description = S("Date-nut Cake Dough"),
	inventory_image = "foods_date_nut_dough.png",
	groups = {flammable = 1},
})

core.register_craftitem("foods:date_nut_cake", {
	description = S("Date-nut Cake"),
	inventory_image = "foods_date_nut_cake.png",
	on_use = core.item_eat(32),
	groups = {flammable = 1},
})

core.register_craftitem("foods:date_nut_bar", {
	description = S("Date-nut Energy Bar"),
	inventory_image = "foods_date_nut_bar.png",
	on_use = core.item_eat(12),
	groups = {flammable = 1},
})

core.register_craft({
	type = "shapeless",
	output = "foods:date_nut_snack",
	recipe = {"farming:date", "farming:date", "farming:date",
		"group:spruce_nut", "cedar:nuts", "fir:nuts"},
	replacements = {
		{"farming:date", "farming:date_pit"},
		{"farming:date", "farming:date_pit"},
		{"farming:date", "farming:date_pit"}
	}
})

-- The date-nut cake is an exceptional food item due to its highly
-- concentrated nature (32 food units). Because of that, it requires
-- many different ingredients, and, starting from the base ingredients
-- found or harvested in nature, it requires many steps to prepare.
core.register_craft({
	type = "shapeless",
	output = "foods:date_nut_dough",
	recipe = {"foods:date_nut_snack", "foods:date_nut_snack",
		"foods:date_nut_snack", "default:coconut_milk",
		"foods:date_nut_snack", "default:raw_coconut",
		"default:coconut_milk", "group:flour", "default:raw_coconut"},
	replacements = {
		{"default:coconut_milk", "vessels:drinking_glass"},
		{"default:coconut_milk", "vessels:drinking_glass"}
	}
})

core.register_craft({
	type = "cooking",
	output = "foods:date_nut_cake",
	recipe = "foods:date_nut_dough",
})

core.register_craft({
	type = "shapeless",
	output = "foods:date_nut_bar 8",
	recipe = {"foods:date_nut_cake"},
})
end

-- Pappardelle
core.register_craftitem("foods:pappardelle", {
	description = S("Pappardelle"),
	inventory_image = "foods_pappardelle.png",
	groups = {flammable = 1},
})

core.register_craft({
	output = "foods:pappardelle 8",
	recipe = {
		{"group:dough", "group:dough", "group:dough"},
		{"group:dough", "group:egg", "group:dough"},
		{"group:dough", "group:egg", "group:dough"},
	},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"},
		{"group:egg", "bonemeal:egg_shell"}
	}
})

-- Garlic Tomato on Pappardelle
core.register_craftitem("foods:garlic_tomato_pasta", {
	description = S("Garlic Tomato on Pappardelle"),
	inventory_image = "foods_garlic_tomato_pasta.png",
	on_use = core.item_eat(8)
})

core.register_craft({
	output = "foods:garlic_tomato_pasta",
	type = "shapeless",
	recipe = {"group:boiling_water", "foods:pappardelle",
		"farming:tomato", "farming:garlic_clove", "farming:garlic_clove",
		"group:saucepan", "vessels:ceramic_plate"},
	replacements = {
		{"group:boiling_water", "bucket:bucket_empty"},
		{"farming:saucepan", "farming:saucepan"},
		{"aztec:saucepan", "aztec:saucepan"}
	}
})

-- Ciabatta dough
core.register_craftitem("foods:ciabatta_dough", {
	description = S("Ciabatta Dough"),
	inventory_image = "foods_ciabatta_dough.png",
	groups = {flammable = 1},
})

core.register_craft({
	type = "shapeless",
	output = "foods:ciabatta_dough",
	recipe = {"group:milk", "group:food_oil", "group:dough", "group:herb"},
	replacements = {
		{"group:milk", "bucket:bucket_empty"},
		{"group:food_oil", "vessels:glass_bottle"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "foods:ciabatta_dough",
	recipe = {"group:milk", "group:food_oil", "group:dough", "farming:peppercorn_ground"},
	replacements = {
		{"group:milk", "bucket:bucket_empty"},
		{"group:food_oil", "vessels:glass_bottle"},
		{"farming:peppercorn_ground", "vessels:glass_bottle"}
	}
})

-- Ciabatta
core.register_craftitem("foods:ciabatta", {
	description = S("Ciabatta"),
	inventory_image = "foods_ciabatta.png",
	on_use = core.item_eat(4),
	groups = {flammable = 1},
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "foods:ciabatta",
	recipe = "foods:ciabatta_dough"
})

-- Chestnut flour, dough and bread
if core.get_modpath("chestnut") then
core.register_craftitem("foods:chestnut_flour", {
	description = S("Chestnut Flour"),
	inventory_image = "farming_sunflower_flour.png^[colorize:brown:30",
	groups = {flour = 1, flammable = 2},
})

core.register_craft({
	output = "foods:chestnut_flour",
	recipe = {
		{"chestnut:fruit", "chestnut:fruit", "chestnut:fruit"},
		{"chestnut:fruit", "group:grinder", "chestnut:fruit"},
		{"chestnut:fruit", "chestnut:fruit", "chestnut:fruit"},
	},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"}
	}
})

core.register_craftitem("foods:chestnut_dough", {
	description = S("Chestnut Dough"),
	inventory_image = "farming_sunflower_dough.png^[colorize:brown:30",
	groups = {dough = 1, flammable = 1},
})

core.register_craft({
	output = "foods:chestnut_dough 3",
	recipe = {
		{"foods:chestnut_flour", "foods:chestnut_flour", "foods:chestnut_flour"},
		{"foods:chestnut_flour", "foods:chestnut_flour", "foods:chestnut_flour"},
		{"", "group:fresh_water_bucket", ""}
	},
	replacements = {
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"}
	}
})

core.register_craftitem("foods:chestnut_bread", {
	description = S("Chestnut Bread"),
	inventory_image = "farming_sunflower_bread.png^[colorize:brown:50",
	on_use = core.item_eat(5),
	groups = {bread = 1, flammable = 2},
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "foods:chestnut_bread",
	recipe = "foods:chestnut_dough"
})
end

-- Multigrain dough
core.register_craftitem("foods:multigrain_dough", {
	description = S("Multigrain Dough"),
	inventory_image = "foods_multigrain_dough.png",
	groups = {dough = 1, flammable = 1},
})

core.register_craft({
	type = "shapeless",
	output = "foods:multigrain_dough 4",
	recipe = {"farming:barley_flour", "farming:flax_flour", "farming:wheat_flour",
			"farming:oat_flour", "farming:quinoa_flour", "farming:rice_flour",
			"farming:rye_flour", "farming:sunflower_flour", "group:fresh_water_bucket"},
	replacements = {
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"}
	}
})

-- Multigrain bread
core.register_craftitem("foods:multigrain_bread", {
	description = S("Multigrain Bread"),
	inventory_image = "foods_multigrain_bread.png",
	on_use = core.item_eat(7),
	groups = {bread = 1, flammable = 2},
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "foods:multigrain_bread",
	recipe = "foods:multigrain_dough"
})

-- Bread slice
core.register_craftitem("foods:bread_slice", {
	description = S("Bread Slice"),
	inventory_image = "foods_bread_slice.png",
	on_use = core.item_eat(1),
	groups = {flammable = 2},
})

core.register_craft({
	type = "shapeless",
	output = "foods:bread_slice 5",
	recipe = {"group:bread", "farming:cutting_board"},
	replacements = {{"farming:cutting_board", "farming:cutting_board"}}
})

-- Toast
core.register_craftitem("foods:toast", {
	description = S("Toast"),
	inventory_image = "foods_toast.png",
	on_use = core.item_eat(1),
	groups = {flammable = 2},
})

core.register_craft({
	type = "cooking",
	cooktime = 3,
	output = "foods:toast",
	recipe = "foods:bread_slice"
})

core.register_craftitem("foods:coconut_cream", {
	description = S("Coconut Cream Bucket"),
	inventory_image = "foods_bucket_coconut_cream.png",
	stack_max = 1,
	on_use = core.item_eat(7, "bucket:bucket_empty"),
})

core.register_craft({
	type = "shapeless",
	output = "foods:coconut_cream",
	recipe = {"default:coconut", "default:coconut", "default:coconut",
		"default:coconut", "default:coconut", "default:coconut",
		"default:ice", "bucket:bucket_empty", "vessels:drinking_glass"},
	replacements = {
		{"default:ice", "default:ice"},
		{"vessels:drinking_glass", "default:coconut_milk"}
	}
})

-- chocolate chip cookie
core.register_craftitem("foods:chocolate_chip_cookie", {
	description = S("Chocolate Chip Cookie"),
	inventory_image = "foods_chocolate_chip_cookie.png",
	on_use = core.item_eat(2),
})

core.register_craftitem("foods:chocolate_chip_cookie_dough", {
	description = S("Chocolate Chip Cookie Dough"),
	inventory_image = "foods_chocolate_chip_cookie_dough.png",
	on_use = core.item_eat(-1),
})

core.register_craft({
	type = "shapeless",
	output = "foods:chocolate_chip_cookie_dough 2",
	recipe = {"group:dough", "farming:milk_chocolate", "group:dough", "group:butter", "group:sugar", "group:egg"},
	replacements = {{"group:egg", "bonemeal:egg_shell"}}
})

core.register_craft({
	type = "shapeless",
	output = "foods:chocolate_chip_cookie_dough 2",
	recipe = {"group:dough", "farming:milk_chocolate", "group:dough", "group:butter", "foods:molasses_1", "group:egg"},
	replacements = {
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"group:egg", "bonemeal:egg_shell"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "foods:chocolate_chip_cookie 8",
	recipe = "foods:chocolate_chip_cookie_dough"
})

-- pumpkin spice cookie
core.register_craftitem("foods:pumpkin_spice_cookie", {
	description = S("Pumpkin Spice Cookie"),
	inventory_image = "foods_chocolate_chip_cookie.png^[colorize:brown:70",
	on_use = core.item_eat(2),
})

-- pumpkin spice cookie dough
core.register_craftitem("foods:pumpkin_spice_cookie_dough", {
	description = S("Pumpkin Spice Cookie Dough"),
	inventory_image = "foods_pumpkin_spice_cookie_dough.png",
	on_use = core.item_eat(-1),
})

core.register_craft({
	type = "shapeless",
	output = "foods:pumpkin_spice_cookie_dough",
	recipe = {"farming:pumpkin_dough", "farming:pumpkin_spice", "group:sugar", "group:egg"},
	replacements = {{"group:egg", "bonemeal:egg_shell"}}
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "foods:pumpkin_spice_cookie 8",
	recipe = "foods:pumpkin_spice_cookie_dough"
})

-- pumpkin spice muffin
core.register_craftitem("foods:pumpkin_spice_muffin", {
	description = S("Pumpkin Spice Muffin"),
	inventory_image = "foods_pumpkin_spice_muffin.png",
	on_use = core.item_eat(2),
})

core.register_craftitem("foods:pumpkin_spice_muffin_dough", {
	description = S("Pumpkin Spice Muffin Dough"),
	inventory_image = "foods_pumpkin_spice_cookie_dough.png^[colorize:brown:50",
	on_use = core.item_eat(-1),
})

core.register_craft({
	type = "shapeless",
	output = "foods:pumpkin_spice_muffin_dough",
	recipe = {"farming:pumpkin_spice", "group:dough", "farming:pumpkin_spice", "group:sugar", "group:egg"},
	replacements = {{"group:egg", "bonemeal:egg_shell"}}
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "foods:pumpkin_spice_muffin 2",
	recipe = "foods:pumpkin_spice_muffin_dough"
})

-- pumpkin spice bread
core.register_craftitem("foods:pumpkin_spice_bread", {
	description = S("Pumpkin Spice Bread"),
	inventory_image = "farming_pumpkin_bread.png^[colorize:brown:50",
	on_use = core.item_eat(8),
	groups = {bread = 1, flammable = 2},
})

core.register_craftitem("foods:pumpkin_spice_dough", {
	description = S("Pumpkin Spice Dough"),
	inventory_image = "farming_pumpkin_dough.png^[colorize:brown:40",
})

core.register_craft({
	type = "shapeless",
	output = "foods:pumpkin_spice_dough",
	recipe = {"farming:pumpkin_dough", "farming:pumpkin_spice"}
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "foods:pumpkin_spice_bread",
	recipe = "foods:pumpkin_spice_dough",
})

core.register_craftitem("foods:pumpkin_spice_cake", {
    description = "Pumpkin Spice Cake",
    inventory_image = "foods_pumpkin_spice_cake.png",
    on_use = core.item_eat(12),
})

core.register_craft({
	type = "shapeless",
	output = "foods:pumpkin_spice_cake",
	recipe = {"group:baking_tray", "farming:pumpkin_dough",
		"farming:pumpkin_spice", "farming:pumpkin_dough", "group:egg", "group:sugar"},
	replacements = {
		{"farming:baking_tray", "farming:baking_tray"},
		{"aztec:baking_tray", "aztec:baking_tray"},
		{"group:egg", "bonemeal:egg_shell"}
	}
})

-- Donut (thanks to Bockwurst for making the donut images)
core.register_craftitem("foods:donut", {
	description = S("Donut"),
	inventory_image = "foods_donut.png",
	on_use = core.item_eat(4),
})

core.register_craft({
	output = "foods:donut 6",
	recipe = {
		{"", "group:dough", ""},
		{"group:dough", "group:sugar", "group:dough"},
		{"", "group:dough", ""},
	}
})

core.register_craft({
	output = "foods:donut 6",
	recipe = {
		{"", "group:dough", ""},
		{"group:dough", "foods:molasses_1", "group:dough"},
		{"", "group:dough", ""},
	},
	replacements = {{"foods:molasses_1", "vessels:glass_bottle"}}
})

core.register_craftitem("foods:donut_chocolate", {
	description = S("Chocolate Donut"),
	inventory_image = "foods_donut_chocolate.png",
	on_use = core.item_eat(6),
})

core.register_craft({
	output = "foods:donut_chocolate",
	recipe = {
		{"farming:milk_chocolate"},
		{"foods:donut"},
	}
})

core.register_craftitem("foods:donut_apple", {
	description = S("Apple Donut"),
	inventory_image = "foods_donut_apple.png",
	on_use = core.item_eat(6),
})

core.register_craft({
	output = "foods:donut_apple",
	recipe = {
		{"default:apple"},
		{"foods:donut"},
	},
	replacements = {{"default:apple", "farming:spent_biomasse"}}
})

core.register_craftitem("foods:donut_pumpkin_spice", {
	description = S("Pumpkin Spice Donut"),
	inventory_image = "foods_donut_pumpkin_spice.png",
	on_use = core.item_eat(6),
})

core.register_craft({
	output = "foods:donut_pumpkin_spice",
	recipe = {
		{"farming:pumpkin_spice"},
		{"foods:donut"},
	}
})

-- Peach cobbler
core.register_craftitem("foods:peach_cobbler", {
	description = S("Peach Cobbler"),
	inventory_image = "foods_peach_cobbler.png",
	on_use = core.item_eat(4),
})

core.register_craftitem("foods:peach_cobbler_raw", {
	description = S("Raw Peach Cobbler"),
	inventory_image = "foods_peach_cobbler_raw.png",
})

core.register_craft({
	type = "shapeless",
	output = "foods:peach_cobbler_raw 3",
	recipe = {"group:dough", "group:sugar", "group:egg", "farming:peach"},
	replacements = {{"group:egg", "bonemeal:egg_shell"}}
})

core.register_craft({
	type = "shapeless",
	output = "foods:peach_cobbler_raw 3",
	recipe = {"group:dough", "foods:molasses_1", "group:egg", "farming:peach"},
	replacements = {
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"group:egg", "bonemeal:egg_shell"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "foods:peach_cobbler",
	recipe = "foods:peach_cobbler_raw",
})

-- Yellow maize bread
core.register_craftitem("foods:maize_yellow_bread", {
	description = S("Yellow Maize Bread"),
	inventory_image = "foods_maize_yellow_bread.png",
	on_use = core.item_eat(4),
})

core.register_craftitem("foods:maize_yellow_bread_dough", {
	description = S("Yellow Maize Bread Dough"),
	inventory_image = "foods_maize_yellow_bread_dough.png",
})

core.register_craft({
	type = "shapeless",
	output = "foods:maize_yellow_bread_dough 3",
	recipe = {"group:dough", "farming:masa_yellow", "group:milk", "group:egg"},
	replacements = {
		{"group:milk", "bucket:bucket_empty"},
		{"group:egg", "bonemeal:egg_shell"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "foods:maize_yellow_bread",
	recipe = "foods:maize_yellow_bread_dough",
})

-- Strawberry lemonade
core.register_craftitem("foods:strawberry_lemonade", {
	description = S("Strawberry Lemonade"),
	inventory_image = "foods_strawberry_lemonade.png",
	on_use = core.item_eat(2, "vessels:drinking_glass"),
})

core.register_craft({
	type = "shapeless",
	output = "foods:strawberry_lemonade",
	recipe = {"farming:strawberry", "farming:lemon", "group:sugar", "vessels:drinking_glass", "farming:mortar_pestle"},
	replacements = {{"farming:mortar_pestle", "farming:mortar_pestle"}}
})

-- Fritters

-- Walnut
core.register_craftitem("foods:fritter_walnut", {
	description = S("Walnut Fritter"),
	inventory_image = "foods_fritter_walnut.png",
	on_use = core.item_eat(6),
})

core.register_craftitem("foods:fritter_walnut_dough", {
	description = S("Walnut Fritter Dough"),
	inventory_image = "foods_fritter_walnut_dough.png",
	on_use = core.item_eat(-2),
})

core.register_craft({
	output = "foods:fritter_walnut_dough 3",
	recipe = {
		{"", "group:egg", ""},
		{"group:dough", "farming:soaked_walnuts", "group:dough"},
		{"", "group:sugar", ""},
	},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"},
		{"farming:soaked_walnuts", "vessels:glass_jar"}
	}
})

core.register_craft({
	output = "foods:fritter_walnut_dough 3",
	recipe = {
		{"", "group:egg", ""},
		{"group:dough", "farming:soaked_walnuts", "group:dough"},
		{"", "foods:molasses_1", ""},
	},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"},
		{"farming:soaked_walnuts", "vessels:glass_jar"},
		{"foods:molasses_1", "vessels:glass_bottle"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "foods:fritter_walnut",
	recipe = "foods:fritter_walnut_dough",
})

-- Yellow maize
core.register_craftitem("foods:fritter_maize_yellow", {
	description = S("Yellow Maize Fritter"),
	inventory_image = "foods_fritter_maize_yellow.png",
	on_use = core.item_eat(6),
})

core.register_craftitem("foods:fritter_maize_yellow_dough", {
	description = S("Yellow Maize Fritter Dough"),
	inventory_image = "foods_fritter_maize_yellow_dough.png",
	on_use = core.item_eat(-2),
})

core.register_craft({
	output = "foods:fritter_maize_yellow_dough 3",
	recipe = {
		{"", "group:egg", ""},
		{"group:dough", "farming:masa_yellow", "group:dough"},
		{"", "group:sugar", ""},
	},
	replacements = {{"group:egg", "bonemeal:egg_shell"}}
})

core.register_craft({
	output = "foods:fritter_maize_yellow_dough 3",
	recipe = {
		{"", "group:egg", ""},
		{"group:dough", "farming:masa_yellow", "group:dough"},
		{"", "foods:molasses_1", ""},
	},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"},
		{"foods:molasses_1", "vessels:glass_bottle"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "foods:fritter_maize_yellow",
	recipe = "foods:fritter_maize_yellow_dough",
})

-- Apple
core.register_craftitem("foods:fritter_apple", {
	description = S("Apple Fritter"),
	inventory_image = "foods_fritter_apple.png",
	on_use = core.item_eat(6),
})

core.register_craftitem("foods:fritter_apple_dough", {
	description = S("Apple Fritter Dough"),
	inventory_image = "foods_fritter_apple_dough.png",
	on_use = core.item_eat(-2),
})

core.register_craft({
	output = "foods:fritter_apple_dough 3",
	recipe = {
		{"", "group:egg", ""},
		{"group:dough", "default:apple", "group:dough"},
		{"", "group:sugar", ""},
	},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"},
		{"default:apple", "farming:spent_biomasse"}
	}
})

core.register_craft({
	output = "foods:fritter_apple_dough 3",
	recipe = {
		{"", "group:egg", ""},
		{"group:dough", "default:apple", "group:dough"},
		{"", "foods:molasses_1", ""},
	},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"},
		{"default:apple", "farming:spent_biomasse"},
		{"foods:molasses_1", "vessels:glass_bottle"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "foods:fritter_apple",
	recipe = "foods:fritter_apple_dough",
})

farming.pie_types = {
	"blackberry",
	"blackcurrant",
	"blueberry",
	"gooseberry",
	"huckleberry",
	"raspberry",
	"rhubarb",
	"strawberry",
	"mixed_berry"
}

farming.pie_type_descriptions = {
	{S("Raw Blackberry pie"),	S("Cooked Blackberry pie"),		S("Slice of Blackberry pie")},
	{S("Raw Blackcurrant pie"),	S("Cooked Blackcurrant pie"),	S("Slice of Blackcurrant pie")},
	{S("Raw Blueberry pie"),	S("Cooked Blueberry pie"),		S("Slice of Blueberry pie")},
	{S("Raw Gooseberry pie"),	S("Cooked Gooseberry pie"),		S("Slice of Gooseberry pie")},
	{S("Raw Huckleberry pie"),	S("Cooked Huckleberry pie"),	S("Slice of Huckleberry pie")},
	{S("Raw Raspberry pie"),	S("Cooked Raspberry pie"),		S("Slice of Raspberry pie")},
	{S("Raw Rhubarb pie"),		S("Cooked Rhubarb pie"),		S("Slice of Rhubarb pie")},
	{S("Raw Strawberry pie"),	S("Cooked Strawberry pie"),		S("Slice of Strawberry pie")},
	{S("Raw Mixed Berry pie"),	S("Cooked Mixed Berry pie"),	S("Slice of Mixed Berry pie")}
}

for i, berry in ipairs(farming.pie_types) do

	-- Raw pie
	core.register_craftitem("foods:"..berry.."_pie_raw", {
		description = farming.pie_type_descriptions[i][1],
		inventory_image = "foods_"..berry.."_pie_raw.png",
		on_use = core.item_eat(4),
	})

	if berry ~= "mixed_berry" then

		core.register_craft({
			output = "foods:"..berry.."_pie_raw",
			recipe = {
				{"", "group:sugar", "group:dough"},
				{"group:"..berry, "group:"..berry, "group:"..berry},
				{"group:dough", "group:baking_tray", ""},
			},
			replacements = {
				{"farming:baking_tray", "farming:baking_tray"},
				{"aztec:baking_tray", "aztec:baking_tray"}
			}
		})

		core.register_craft({
			output = "foods:"..berry.."_pie_raw",
			recipe = {
				{"", "foods:molasses_1", "group:dough"},
				{"group:"..berry, "group:"..berry, "group:"..berry},
				{"group:dough", "group:baking_tray", ""},
			},
			replacements = {
				{"foods:molasses_1", "vessels:glass_bottle"},
				{"farming:baking_tray", "farming:baking_tray"},
				{"aztec:baking_tray", "aztec:baking_tray"}
			}
		})
	else
		core.register_craft({
			output = "foods:mixed_berry_pie_raw",
			recipe = {
				{"farming:strawberry", "group:sugar", "group:dough"},
				{"farming:blueberries", "farming:gooseberries", "farming:raspberries"},
				{"group:dough", "group:baking_tray", "farming:blackcurrants"},
			},
			replacements = {
				{"farming:baking_tray", "farming:baking_tray"},
				{"aztec:baking_tray", "aztec:baking_tray"}
			}
		})

		core.register_craft({
			output = "foods:mixed_berry_pie_raw",
			recipe = {
				{"farming:strawberry", "foods:molasses_1", "group:dough"},
				{"farming:blueberries", "farming:gooseberries", "farming:raspberries"},
				{"group:dough", "group:baking_tray", "farming:blackcurrants"},
			},
			replacements = {
				{"foods:molasses_1", "vessels:glass_bottle"},
				{"farming:baking_tray", "farming:baking_tray"},
				{"aztec:baking_tray", "aztec:baking_tray"}
			}
		})
	end

	-- Cooked pie
	core.register_craftitem("foods:"..berry.."_pie", {
		description = farming.pie_type_descriptions[i][2],
		inventory_image = "foods_"..berry.."_pie.png",
		on_use = core.item_eat(6),
	})

	core.register_craft({
		type = "cooking",
		cooktime = 30,
		output = "foods:"..berry.."_pie",
		recipe = "foods:"..berry.."_pie_raw",
	})

	-- Slice of pie
	core.register_craftitem("foods:"..berry.."_pie_slice", {
		description = farming.pie_type_descriptions[i][3],
		inventory_image = "foods_"..berry.."_pie_slice.png",
		on_use = core.item_eat(1),
	})

	core.register_craft({
		output = "foods:"..berry.."_pie_slice 6",
		recipe = {
			{"foods:"..berry.."_pie"},
			{"farming:cutting_board"},
		},
		replacements = {{"farming:cutting_board", "farming:cutting_board"}}
	})
end

-- Strawberry rhubarb pie
core.register_craftitem("foods:strawberry_rhubarb_pie_raw", {
	description = S("Raw Strawberry Rhubarb Pie"),
	inventory_image = "foods_strawberry_rhubarb_pie_raw.png",
	on_use = core.item_eat(4),
})

core.register_craftitem("foods:strawberry_rhubarb_pie", {
	description = S("Strawberry Rhubarb Pie"),
	inventory_image = "foods_strawberry_rhubarb_pie.png",
	on_use = core.item_eat(6),
})

core.register_craftitem("foods:strawberry_rhubarb_pie_slice", {
	description = S("Strawberry Rhubarb Pie Slice"),
	inventory_image = "foods_strawberry_rhubarb_pie_slice.png",
	on_use = core.item_eat(1),
})

core.register_craft({
	output = "foods:strawberry_rhubarb_pie_raw",
	recipe = {
		{"", "group:sugar", "group:dough"},
		{"farming:strawberry", "farming:rhubarb", "farming:strawberry"},
		{"group:dough", "group:baking_tray", ""},
	},
	replacements = {
		{"farming:baking_tray", "farming:baking_tray"},
		{"aztec:baking_tray", "aztec:baking_tray"}
	}
})

core.register_craft({
	output = "foods:strawberry_rhubarb_pie_raw",
	recipe = {
		{"", "foods:molasses_1", "group:dough"},
		{"farming:strawberry", "farming:rhubarb", "farming:strawberry"},
		{"group:dough", "group:baking_tray", ""},
	},
	replacements = {
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"farming:baking_tray", "farming:baking_tray"},
		{"aztec:baking_tray", "aztec:baking_tray"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 30,
	output = "foods:strawberry_rhubarb_pie",
	recipe = "foods:strawberry_rhubarb_pie_raw",
})

core.register_craft({
	output = "foods:strawberry_rhubarb_pie_slice 6",
	recipe = {
		{"foods:strawberry_rhubarb_pie"},
		{"farming:cutting_board"},
	},
	replacements = {{"farming:cutting_board", "farming:cutting_board"}}
})

cake_box1 = {
	type = "fixed",
	fixed = {
		{-.25, -.5, -.29688, .25, -.25, .312502},
		{-.309375, -.5, -.25, .309375, -.25, .25},
		{-.25, -.25, -.25, .25, -.2, .25}
	}
}

pie_box = {
	type = "fixed",
	fixed = {
		{-.375, -.3125, -.375, .375, -.125, .375},
		{-.3125, -.4375, -.3125, .3125, -.0625, .3125},
		{-.25, -.5, -.25, .25, -.125, .25}
	}
}

core.register_node("foods:cake_plain", {
	description = S("Cake"),
	drawtype = "nodebox",
	tiles = {"foods_cake_texture.png", "foods_cake_texture.png", "foods_cake_texture_side.png"},
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(4),
	node_box = cake_box1,
	groups = {crumbly = 3, attached_node = 1},
})

core.register_craftitem("foods:cakemix_plain",{
	description = S("Cake Mix"),
	inventory_image = "foods_cakemix_plain.png"
})

core.register_craft({
	output = "foods:cakemix_plain",
	recipe = {
		{"group:egg", "group:dough", "group:sugar"},
		{"", "group:baking_tray", ""},
	},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"},
		{"farming:baking_tray", "farming:baking_tray"},
		{"aztec:baking_tray", "aztec:baking_tray"}
	}
})

core.register_craft({
	output = "foods:cakemix_plain",
	recipe = {
		{"group:egg", "group:dough", "foods:molasses_1"},
		{"", "group:baking_tray", ""},
	},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"},
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"farming:baking_tray", "farming:baking_tray"},
		{"aztec:baking_tray", "aztec:baking_tray"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "foods:cake_plain",
	recipe = "foods:cakemix_plain",
})

core.register_node("foods:cake_choco", {
	description = S("Chocolate Cake"),
	drawtype = "nodebox",
	tiles = {"foods_cake_choco_texture.png", "foods_cake_choco_texture.png", "foods_cake_choco_texture_side.png"},
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(4),
	node_box = cake_box1,
	groups = {crumbly = 3, attached_node = 1},
})

core.register_craftitem("foods:cakemix_choco",{
	description = S("Chocolate Cake Mix"),
	inventory_image = "foods_cakemix_choco.png"
})

core.register_craft({
	output = "foods:cakemix_choco",
	recipe = {
		{"farming:milk_chocolate", "farming:milk_chocolate", ""},
		{"group:egg", "group:dough", "group:sugar"},
		{"", "group:baking_tray", ""},
	},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"},
		{"farming:baking_tray", "farming:baking_tray"},
		{"aztec:baking_tray", "aztec:baking_tray"}
	}
})

core.register_craft({
	output = "foods:cakemix_choco",
	recipe = {
		{"farming:milk_chocolate", "farming:milk_chocolate", ""},
		{"group:egg", "group:dough", "foods:molasses_1"},
		{"", "group:baking_tray", ""},
	},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"},
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"farming:baking_tray", "farming:baking_tray"},
		{"aztec:baking_tray", "aztec:baking_tray"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "foods:cake_choco",
	recipe = "foods:cakemix_choco",
})

core.register_node("foods:cake_carrot", {
	description = S("Carrot Cake"),
	drawtype = "nodebox",
	tiles = {"foods_cake_carrot_texture.png", "foods_cake_carrot_texture.png", "foods_cake_carrot_texture_side.png"},
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(4),
	node_box = cake_box1,
	groups = {crumbly = 3, attached_node = 1},
})

core.register_craftitem("foods:cakemix_carrot",{
	description = S("Carrot Cake Mix"),
	inventory_image = "foods_cakemix_carrot.png"
})

core.register_craft({
	output = "foods:cakemix_carrot",
	recipe = {
		{"farming:carrot", "farming:carrot", "farming:carrot"},
		{"group:egg", "group:dough", "group:sugar"},
		{"", "group:baking_tray", ""},
	},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"},
		{"farming:baking_tray", "farming:baking_tray"},
		{"aztec:baking_tray", "aztec:baking_tray"}
	}
})

core.register_craft({
	output = "foods:cakemix_carrot",
	recipe = {
		{"farming:carrot", "farming:carrot", "farming:carrot"},
		{"group:egg", "group:dough", "foods:molasses_1"},
		{"", "group:baking_tray", ""},
	},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"},
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"farming:baking_tray", "farming:baking_tray"},
		{"aztec:baking_tray", "aztec:baking_tray"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "foods:cake_carrot",
	recipe = "foods:cakemix_carrot",
})

core.register_node("foods:cake_p", {
	description = S("Cake P"),
	drawtype = "nodebox",
	tiles = {"foods_cake_top.png", "foods_cake_bottom.png", "foods_cake_side.png"},
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(3),
	node_box = cake_box2,
	groups = {crumbly = 3, attached_node = 1},
})

core.register_node("foods:chocolate_cake", {
	description = S("Chocolate Cake"),
	drawtype = "nodebox",
	tiles = {"foods_cake_ctop.png", "foods_cake_cbottom.png", "foods_cake_cside.png"},
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(5),
	node_box = cake_box2,
	groups = {crumbly = 3, attached_node = 1},
})

core.register_node("foods:carrot_cake", {
	description = S("Carrot Cake"),
	drawtype = "nodebox",
	tiles = {"foods_cake_atop.png", "foods_cake_bottom.png", "foods_cake_aside.png"},
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(4),
	node_box = cake_box2,
	groups = {crumbly = 3, attached_node = 1},
})

core.register_node("foods:apple_pie", {
	description = S("Apple Pie"),
	drawtype = "nodebox",
	tiles = {"foods_apie_top.png", "foods_pie_bottom.png", "foods_pie_side.png"},
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(5),
	node_box = pie_box,
	groups = {crumbly = 3, attached_node = 1},
})

core.register_node("foods:rhubarb_pie2", {
	description = S("Rhubarb Pie"),
	drawtype = "nodebox",
	tiles = {"foods_rpie_top.png", "foods_pie_bottom.png", "foods_pie_side.png"},
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(5),
	node_box = pie_box,
	groups = {crumbly = 3, attached_node = 1},
})

core.register_node("foods:banana_pie", {
	description = S("Banana Pie"),
	drawtype = "nodebox",
	tiles = {"foods_bpie_top.png", "foods_pie_bottom.png", "foods_pie_side.png"},
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(5),
	node_box = pie_box,
	groups = {crumbly = 3, attached_node = 1},
})

core.register_node("foods:pumpkin_pie", {
	description = S("Pumpkin Pie"),
	drawtype = "nodebox",
	tiles = {"foods_ppie_top.png", "foods_pie_bottom.png", "foods_pie_side.png"},
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(5),
	node_box = pie_box,
	groups = {crumbly = 3, attached_node = 1},
})

core.register_node("foods:boston_cream", {
	description = S("Boston Cream Pie"),
	drawtype = "nodebox",
	walkable = false,
	tiles = {"foods_cake_cbottom.png", "foods_pie_bottom.png", "foods_bcpie_side.png"},
	paramtype = "light",
	is_ground_content = false,
	on_use = core.item_eat(5),
	node_box = pie_box,
	groups = {crumbly = 3, attached_node = 1},
})

core.register_node("foods:shortcake", {
	description = S("Short Bread Cake"),
	drawtype = "nodebox",
	tiles = {"foods_shortcake_top.png", "foods_cake_bottom.png", "foods_shortcake_side.png"},
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(3),
	node_box = {
		type = "fixed",
		fixed = {
			{-.1875,	-.5,	-.1875,	.1875,	.125,	.1875},
			{-.3125,	-.375,	-.3125,	.3125,	0,		.3125}
		}
	},
	groups = {crumbly = 3, attached_node = 1},
})

-- Walnut and coffee cake
core.register_node("foods:cake_walnut_coffee", {
	description = S("Walnut and Coffee Cake"),
	drawtype = "nodebox",
	tiles = {"foods_cake_walnut_coffee_3d_top.png", "foods_cake_walnut_coffee_3d_bottom.png", "foods_cake_walnut_coffee_3d.png"},
	inventory_image = "foods_cake_walnut_coffee_2d.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(4),
	node_box = {
		type = "fixed",
		fixed = {
			{-.5,-.4375,-.5,.5,0,.5},
			{-.4375,-.5,-.4375,.438462,-.4375,.426923},
			{-.4375,0,-.4375,.45,.0625,.426923},
			{-.3125,.0625,.1875,-.1875,.1875,.3125},
			{.1875,.0625,-.3125,.3125,.1875,-.1875},
		}
	},
	groups = {crumbly = 3, attached_node = 1},
})

core.register_craftitem("foods:cakemix_walnut_coffee",{
	description = S("Walnut and Coffee Cake Mix"),
	inventory_image = "foods_cakemix_walnut_coffee.png"
})

core.register_craft({
	output = "foods:cakemix_walnut_coffee",
	recipe = {
		{"", "farming:soaked_walnuts", "farming:coffee_ground"},
		{"group:egg", "group:dough", "group:sugar"},
		{"", "group:baking_tray", ""},
	},
	replacements = {
		{"farming:soaked_walnuts", "vessels:glass_jar"},
		{"group:egg", "bonemeal:egg_shell"},
		{"farming:baking_tray", "farming:baking_tray"},
		{"aztec:baking_tray", "aztec:baking_tray"}
	}
})

core.register_craft({
	output = "foods:cakemix_walnut_coffee",
	recipe = {
		{"", "farming:soaked_walnuts", "farming:coffee_ground"},
		{"group:egg", "group:dough", "foods:molasses_1"},
		{"", "group:baking_tray", ""},
	},
	replacements = {
		{"farming:soaked_walnuts", "vessels:glass_jar"},
		{"group:egg", "bonemeal:egg_shell"},
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"farming:baking_tray", "farming:baking_tray"},
		{"aztec:baking_tray", "aztec:baking_tray"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "foods:cake_walnut_coffee",
	recipe = "foods:cakemix_walnut_coffee",
})

-- Strawberry cheese cake
core.register_craftitem("foods:cake_cheese_strawberry", {
	description = S("Strawberry Cheese Cake"),
	inventory_image = "foods_cake_cheese_strawberry.png",
	on_use = core.item_eat(4),
})

core.register_craftitem("foods:cakemix_cheese_strawberry", {
	description = S("Strawberry Cheese Cake Mix"),
	inventory_image = "foods_cakemix_cheese_strawberry.png",
})

core.register_craft({
	output = "foods:cakemix_cheese_strawberry",
	recipe = {
		{"group:cheese", "farming:strawberry", ""},
		{"group:sugar", "group:dough", "group:egg"},
	},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"}
	}
})

core.register_craft({
	output = "foods:cakemix_cheese_strawberry",
	recipe = {
		{"group:cheese", "farming:strawberry", ""},
		{"foods:molasses_1", "group:dough", "group:egg"},
	},
	replacements = {
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"group:egg", "bonemeal:egg_shell"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "foods:cake_cheese_strawberry",
	recipe = "foods:cakemix_cheese_strawberry",
})

-- Blueberry cheese cake
core.register_craftitem("foods:cake_cheese_blueberry", {
	description = S("Blueberry Cheese Cake"),
	inventory_image = "foods_cake_cheese_blueberry.png",
	on_use = core.item_eat(4),
})

core.register_craftitem("foods:cakemix_cheese_blueberry", {
	description = S("Blueberry Cheese Cake Mix"),
	inventory_image = "foods_cakemix_cheese_blueberry.png",
})

core.register_craft({
	output = "foods:cakemix_cheese_blueberry",
	recipe = {
		{"group:cheese", "group:blueberry", ""},
		{"group:sugar", "group:dough", "group:egg"},
	},
	replacements = {{"group:egg", "bonemeal:egg_shell"}}
})

core.register_craft({
	output = "foods:cakemix_cheese_blueberry",
	recipe = {
		{"group:cheese", "group:blueberry", ""},
		{"foods:molasses_1", "group:dough", "group:egg"},
	},
	replacements = {
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"group:egg", "bonemeal:egg_shell"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "foods:cake_cheese_blueberry",
	recipe = "foods:cakemix_cheese_blueberry",
})

-- Triple chocolate cake
core.register_craftitem("foods:cake_triple_choco", {
	description = S("Triple Chocolate Cake"),
	inventory_image = "foods_cake_triple_choco.png",
	on_use = core.item_eat(4),
})

core.register_craftitem("foods:cakemix_triple_choco", {
	description = S("Triple Chocolate Cake Mix"),
	inventory_image = "foods_cakemix_triple_choco.png",
})

core.register_craft({
	output = "foods:cakemix_triple_choco",
	recipe = {
		{"farming:milk_chocolate", "farming:milk_chocolate", "farming:milk_chocolate"},
		{"group:sugar", "group:dough", "group:egg"},
		{"farming:milk_chocolate", "farming:milk_chocolate", "farming:milk_chocolate"},
	},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"},
	}
})

core.register_craft({
	output = "foods:cakemix_triple_choco",
	recipe = {
		{"farming:milk_chocolate", "farming:milk_chocolate", "farming:milk_chocolate"},
		{"foods:molasses_1", "group:dough", "group:egg"},
		{"farming:milk_chocolate", "farming:milk_chocolate", "farming:milk_chocolate"},
	},
	replacements = {
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"group:egg", "bonemeal:egg_shell"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "foods:cake_triple_choco",
	recipe = "foods:cakemix_triple_choco",
})

-- Wedding cake
core.register_craftitem("foods:cake_wedding", {
	description = S("Wedding Cake"),
	inventory_image = "foods_cake_wedding.png",
	on_use = core.item_eat(6),
})

core.register_craft({
	output = "foods:cake_wedding",
	recipe = {
		{"foods:cake_plain"},
		{"foods:cake_plain"},
		{"foods:cake_plain"},
	}
})

-- Cup cake
core.register_craftitem("foods:cupcake", {
	description = S("Cupcake"),
	inventory_image = "foods_cupcake.png",
	on_use = core.item_eat(2),
})

core.register_craftitem("foods:cupcake_mix", {
	description = S("Cupcake Mix"),
	inventory_image = "foods_cupcake_mix.png",
	on_use = function(itemstack, user, pointd)
		if user then
			if math.random(3) == 1 then
				return core.do_item_eat(-1, nil, itemstack, user, pointd)
			else
				return core.do_item_eat(1, nil, itemstack, user, pointd)
			end
		end
	end,
})

core.register_craft({
	output = "foods:cupcake_mix",
	recipe = {
		{"group:sugar", "group:egg"},
		{"", "group:dough"},
	},
	replacements = {{"group:egg", "bonemeal:egg_shell"}}
})

core.register_craft({
	output = "foods:cupcake_mix",
	recipe = {
		{"foods:molasses_1", "group:egg"},
		{"", "group:dough"},
	},
	replacements = {
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"group:egg", "bonemeal:egg_shell"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 7,
	output = "foods:cupcake 6",
	recipe = "foods:cupcake_mix",
})

-- Chocolate cupcake
core.register_craftitem("foods:cupcake_choco", {
	description = S("Chocolate Cupcake"),
	inventory_image = "foods_cupcake_choco.png",
	on_use = core.item_eat(4),
})

core.register_craftitem("foods:cupcake_choco_mix", {
	description = S("Chocolate Cupcake Mix"),
	inventory_image = "foods_cupcake_choco_mix.png",
	on_use = function(itemstack, user, pointd)
		if user then
			if math.random(3) == 1 then
				return core.do_item_eat(-1, nil, itemstack, user, pointd)
			else
				return core.do_item_eat(1, nil, itemstack, user, pointd)
			end
		end
	end,
})

core.register_craft({
	output = "foods:cupcake_choco_mix",
	recipe = {
		{"group:sugar", "farming:milk_chocolate", "group:egg"},
		{"farming:milk_chocolate", "group:dough", ""},
	},
	replacements = {{"group:egg", "bonemeal:egg_shell"}}
})

core.register_craft({
	output = "foods:cupcake_choco_mix",
	recipe = {
		{"foods:molasses_1", "farming:milk_chocolate", "group:egg"},
		{"farming:milk_chocolate", "group:dough", ""},
	},
	replacements = {
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"group:egg", "bonemeal:egg_shell"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 7,
	output = "foods:cupcake_choco 6",
	recipe = "foods:cupcake_choco_mix",
})

-- Fairy cake
core.register_craftitem("foods:cupcake_fairy", {
	description = S("Fairy Cake"),
	inventory_image = "foods_cupcake_fairy.png",
	on_use = core.item_eat(2),
})

core.register_craft({
	output = "foods:cupcake_fairy",
	recipe = {
		{"group:sugar"},
		{"foods:cupcake"},
	},
})

-- Lemon cupcake
core.register_craftitem("foods:cupcake_lemon", {
	description = S("Lemon Drizzle Cupcake"),
	inventory_image = "foods_cupcake_lemon.png",
	on_use = core.item_eat(2),
})

core.register_craft({
	output = "foods:cupcake_lemon",
	recipe = {
		{"farming:lemon"},
		{"foods:cupcake"},
	},
})

-- Chocolate chip muffin
core.register_craftitem("foods:muffin_choco", {
	description = S("Chocolate Chip Muffin"),
	inventory_image = "foods_muffin_choco.png",
	on_use = core.item_eat(4),
})

core.register_craftitem("foods:muffin_choco_mix", {
	description = S("Chocolate Chip Muffin Mix"),
	inventory_image = "foods_cupcake_choco_mix.png",
	on_use = function(itemstack, user, pointd)
		if user then
			if math.random(3) == 1 then
				return core.do_item_eat(-1, nil, itemstack, user, pointd)
			else
				return core.do_item_eat(1, nil, itemstack, user, pointd)
			end
		end
	end,
})

core.register_craft({
	output = "foods:muffin_choco_mix",
	recipe = {
		{"farming:milk_chocolate", "farming:milk_chocolate", ""},
		{"group:sugar", "group:dough", "group:egg"},
	},
	replacements = {{"group:egg", "bonemeal:egg_shell"}}
})

core.register_craft({
	output = "foods:muffin_choco_mix",
	recipe = {
		{"farming:milk_chocolate", "farming:milk_chocolate", ""},
		{"foods:molasses_1", "group:dough", "group:egg"},
	},
	replacements = {
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"group:egg", "bonemeal:egg_shell"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "foods:muffin_choco 2",
	recipe = "foods:muffin_choco_mix",
})

core.register_craftitem("foods:short_bread", {
	description = S("Short Bread"),
	inventory_image = "foods_short_bread.png",
	on_use = core.item_eat(3),
})

core.register_craftitem("foods:pie_crust", {
	description = S("Pie Crust"),
	inventory_image = "foods_pie_crust.png",
	on_use = core.item_eat(3),
})

core.register_craftitem("foods:strawberry_shortcake", {
	description = S("Strawberry Short-Cake"),
	inventory_image = "foods_strawberry_shortcake.png",
	on_use = core.item_eat(3),
})

core.register_craft({
	output = "foods:short_bread",
	recipe = {
		{"group:milk"},
		{"group:sugar"},
		{"group:bread"},
	},
	replacements = {{"group:milk", "bucket:bucket_empty"}}
})

core.register_craft({
	output = "foods:short_bread",
	recipe = {
		{"group:milk"},
		{"foods:molasses_1"},
		{"group:bread"},
	},
	replacements = {
		{"group:milk", "bucket:bucket_empty"},
		{"foods:molasses_1", "vessels:glass_bottle"}
	}
})

core.register_craft({
	output = "foods:shortcake",
	recipe = {
		{"mobs:bucket_cream"},
		{"foods:short_bread"},
	},
	replacements = {{"mobs:bucket_cream", "bucket:bucket_empty"}}
})

core.register_craft({
	output = "foods:strawberry_shortcake 3",
	recipe = {
		{"farming:strawberry", "mobs:bucket_cream", "farming:strawberry"},
		{"foods:short_bread", "foods:short_bread", "foods:short_bread"},
	},
	replacements = {{"mobs:bucket_cream", "bucket:bucket_empty"}}
})

core.register_craft({
	output = "foods:cake_p",
	recipe = {
		{"", "group:sugar", ""},
		{"group:milk", "group:dough", "group:milk"},
		{"", "group:sugar", ""},
	},
	replacements = {{"group:milk", "bucket:bucket_empty 2"}}
})

core.register_craft({
	output = "foods:chocolate_cake",
	recipe = {
		{"farming:dark_chocolate"},
		{"farming:dark_chocolate"},
		{"foods:cake_p"},
	}
})

core.register_craft({
	output = "foods:carrot_cake",
	recipe = {
		{"", "farming:cocoa_powder", ""},
		{"farming:carrot", "farming:carrot", "farming:carrot"},
		{"", "foods:cake_p", ""},
	}
})

core.register_craft({
	output = "foods:pie_crust 2",
	recipe = {
		{"group:egg", "group:dough"},
		{"group:dough", "group:sugar"},
	},
	replacements = {{"group:egg", "bonemeal:egg_shell"}}
})

core.register_craft({
	output = "foods:apple_pie",
	recipe = {
		{"", "farming:cinnamon", ""},
		{"default:apple", "default:apple", "default:apple"},
		{"", "foods:pie_crust", ""},
	},
	replacements = {
		{"default:apple", "farming:spent_biomasse"},
		{"default:apple", "farming:spent_biomasse"},
		{"default:apple", "farming:spent_biomasse"}
	}
})

core.register_craft({
	output = "foods:rhubarb_pie2",
	recipe = {
		{"", "farming:strawberry", ""},
		{"farming:rhubarb", "farming:rhubarb", "farming:rhubarb"},
		{"", "foods:pie_crust", ""},
	}
})

core.register_craft({
	output = "foods:banana_pie",
	recipe = {
		{"ethereal:banana", "mobs:bucket_cream", "ethereal:banana"},
		{"", "foods:pie_crust", ""},
	},
	replacements = {
		{"ethereal:banana", "farming:spent_biomasse"},
		{"mobs:bucket_cream", "bucket:bucket_empty"},
		{"ethereal:banana", "farming:spent_biomasse"}
	}
})

core.register_craft({
	output = "foods:pumpkin_pie",
	recipe = {
		{"mobs:bucket_cream", "farming:pumpkin_slice", "mobs:bucket_cream"},
		{"", "foods:pie_crust", ""},
	},
	replacements = {{"mobs:bucket_cream", "bucket:bucket_empty 2"}}
})

core.register_craft({
	output = "foods:boston_cream",
	recipe = {
		{"mobs:bucket_cream", "farming:dark_chocolate", "mobs:bucket_cream"},
		{"", "foods:pie_crust", ""},
	},
	replacements = {{"mobs:bucket_cream", "bucket:bucket_empty 2"}}
})

-- Porridge
core.register_craftitem("foods:porridge", {
	description = S("Porridge"),
	inventory_image = "foods_porridge.png",
	on_use = core.item_eat(6, "vessels:wood_bowl"),
})

core.register_craft({
	type = "shapeless",
	output = "foods:porridge",
	recipe = {"group:grain", "vessels:wood_bowl", "group:milk"},
	replacements = {
		{"group:milk", "bucket:bucket_empty"},
		{"group:grain", "farming:straw_pile"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "foods:porridge",
	recipe = {"group:grain", "vessels:wood_bowl",
		"group:boiling_water", "group:sugar"},
	replacements = {
		{"group:boiling_water", "bucket:bucket_empty"},
		{"group:grain", "farming:straw_pile"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "foods:porridge",
	recipe = {"group:grain", "vessels:wood_bowl",
		"group:boiling_water", "foods:molasses_1"},
	replacements = {
		{"group:boiling_water", "bucket:bucket_empty"},
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"group:grain", "farming:straw_pile"}
	}
})

-- Jaffa Cake
core.register_craftitem("foods:jaffa_cake", {
	description = S("Jaffa Cake"),
	inventory_image = "foods_jaffa_cake.png",
	on_use = core.item_eat(6),
})

core.register_craft({
	type = "shapeless",
	output = "foods:jaffa_cake",
	recipe = {"group:baking_tray", "group:egg", "group:sugar", "group:dough",
		"farming:dark_chocolate", "default:orange", "group:milk"},
	replacements = {
		{"farming:baking_tray", "farming:baking_tray"},
		{"aztec:baking_tray", "aztec:baking_tray"},
		{"group:egg", "bonemeal:egg_shell"},
		{"group:milk", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "foods:jaffa_cake",
	recipe = {"group:baking_tray", "group:egg", "foods:molasses_1",
		"group:dough", "farming:dark_chocolate", "default:orange", "group:milk"},
	replacements = {
		{"farming:baking_tray", "farming:baking_tray"},
		{"aztec:baking_tray", "aztec:baking_tray"},
		{"group:egg", "bonemeal:egg_shell"},
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"group:milk", "bucket:bucket_empty"}
	}
})

-- Korean Bibimbap
core.register_craftitem("foods:bibimbap", {
	description = S("Bibimbap"),
	inventory_image = "foods_bibimbap.png",
	on_use = core.item_eat(8, "vessels:wood_bowl")
})

core.register_craft({
	output = "foods:bibimbap",
	type = "shapeless",
	recipe = {"group:skillet", "vessels:wood_bowl", "group:egg",
		"group:chicken_raw", "farming:cabbage", "farming:carrot"},
	replacements = {
		{"group:egg", "bonemeal:egg_shell"},
		{"farming:skillet", "farming:skillet"},
		{"aztec:skillet", "aztec:skillet"}
	}
})

core.register_craft({
	output = "foods:bibimbap",
	type = "shapeless",
	recipe = {"group:skillet", "vessels:wood_bowl", "flowers:mushroom_brown",
		"farming:rice", "farming:cabbage", "farming:carrot", "flowers:mushroom_brown"},
	replacements = {
		{"farming:skillet", "farming:skillet"},
		{"aztec:skillet", "aztec:skillet"},
		{"farming:rice", "farming:straw_pile"}
	}
})

-- Omlet
core.register_craftitem("foods:vegetable_omlet", {
	description = ("Vegetable Omlet"),
	inventory_image = "foods_vegetable_omlet.png",
	groups = {flammable = 2},
	on_use = core.item_eat(10)
})

core.register_craft({
	output = "foods:vegetable_omlet 3",
	recipe = {
		{"group:egg", "group:egg", "group:egg"},
		{"flowers:mushroom_brown", "farming:onion", "group:beans"},
		{"group:food_oil", "farming:tomato", ""}
	},
	replacements = {
		{"group:food_oil", "vessels:glass_bottle"},
		{"group:egg", "bonemeal:egg_shell"},
		{"group:egg", "bonemeal:egg_shell"},
		{"group:egg", "bonemeal:egg_shell"}
	}
})

core.register_craftitem("foods:beer_grain", {
	description = S("Beer Grain"),
	inventory_image = "foods_beer_grain.png",
})

core.register_craft({
	type = "shapeless",
	output = "foods:beer_grain",
	recipe = {"farming:seed_barley_sprouted", "farming:seed_barley_sprouted", "farming:seed_barley_sprouted",
		"farming:hops", "farming:hops", "farming:hops", "bucket:bucket_fresh_water", "group:grinder", "default:torch"},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"},
		{"default:torch", "default:torch"}
	}
})

core.register_node("foods:beer_bottle", {
	description = S("Bottle of Beer"),
	drawtype = "plantlike",
	tiles = {"foods_beer.png"},
	inventory_image = "foods_beer.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	on_use = core.item_eat(1, "vessels:glass_bottle"),
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("foods:wine_bottle", {
	description = S("Bottle of Wine"),
	drawtype = "plantlike",
	tiles = {"foods_wine.png"},
	inventory_image = "foods_wine.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	on_use = core.item_eat(2.5, "vessels:glass_bottle"),
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

beer = {}
beer.brewing={
{name="Beer",item="foods:beer_bottle"},
{name="Wine",item="foods:wine_bottle"}
}

beer.place = function(itemstack, placer, pointd)
	if pointd.above then
		pos = pointd.above
	else
		pos = pointd
	end
	local node = core.get_node_or_nil(pos)
	if node.name ~= "air" and core.get_item_group(node.name, "water") == 0 then
		return nil
	end
	if core.is_protected(pos, placer:get_player_name()) then
		return nil
	end
	core.set_node(pos, {name="foods:brewing_tank"})
	local meta = core.get_meta(pos)
	meta:from_table(core.deserialize(itemstack:get_meta():get_string("")))
	if meta:get_int("finished") == 0 then
	core.get_node_timer(pos):start(.3)
	end
	itemstack:take_item()
	return itemstack
end

core.register_tool("foods:brewing_inv", {
    description = "Brewing Tank in Use",
    inventory_image = "foods_barrel_side.png",
	on_place = beer.place,
	on_drop = beer.place-- interesting placement
})

core.register_node("foods:brewing_tank", {
	description = "Brewing Tank (For Beer or Wine)",
	tiles = {"foods_barrel_top.png", "foods_barrel_top.png", "foods_barrel_side.png"},
	paramtype2 = "facedir",
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("infotext", "Brewing Tank")
	end,
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
		local brew = meta:get_int("brew")
		if brew == 0 then brew = 1 end
		if meta:get_int("full") <= 99 then
			meta:set_int("full", meta:get_int("full")+1)
			core.get_node_timer(pos):start(.3)
			meta:set_string("infotext", beer.brewing[brew].name.. "\n(brewing progress at " ..meta:get_int("full").. "% full)")
		else
			meta:set_int("full", 100)
			meta:set_int("finished", 1)
			meta:set_string("infotext", beer.brewing[brew].name .. "\n(100% full)")
		end
	end,
	on_punch = function(pos, node, puncher)
		local tool = puncher:get_wielded_item():get_name()
		local meta = core.get_meta(pos)
		if meta:get_int("finished") == 1 then
		if tool and tool == "vessels:glass_bottle" then
	if meta:get_int("full") >=20 then
		local brew = meta:get_int("brew")
		if brew == 0 then brew = 1 end
		puncher:get_inventory():remove_item("main", ItemStack("vessels:glass_bottle"))
		local brew_result = beer.brewing[brew].item
		puncher:get_inventory():add_item("main", ItemStack(brew_result))
		local newFull = meta:get_int("full")-20
		meta:set_int("full", newFull)

		meta:set_string("infotext", beer.brewing[brew].name .. "\n("..newFull.."% full)")
	end
	if newFull <= 0 then
		core.set_node(pos, {name="foods:brewing_tank"})
		puncher:get_inventory():add_item("main", ItemStack("farming:spent_biomasse 5"))
		core.chat_send_player(puncher:get_player_name(), "barrel is empty :-(\nbrew a new one!")
	end
		end
		end
	end,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		local meta = core.get_meta(pos)
	if meta:get_int("brew") == 0 then
		if meta:get_int("beer_grain") == 5 and itemstack:get_name() == "default:wood" then
	meta:set_int("brew", 1)
	meta:set_string("infotext", beer.brewing[1].name .. "\n(brewing in progress... punch to interrupt)")
	core.get_node_timer(pos):start(60)
		else
			if itemstack:get_name() == "foods:beer_grain" and meta:get_int("beer_grain") ~= 5 and meta:get_int("wine_grapes") == 0 then
		meta:set_int("beer_grain", meta:get_int("beer_grain")+1)
		meta:set_string("infotext", beer.brewing[1].name.." Grain\n(" ..meta:get_int("beer_grain").. "% full of 5)")
		itemstack:take_item()
		clicker:get_inventory():add_item("main", ItemStack("bucket:bucket_empty"))
			end
		end
		if meta:get_int("wine_grapes") == 5 and itemstack:get_name() == "default:wood" then
	meta:set_int("brew", 2)
	meta:set_string("infotext", beer.brewing[2].name.. "\n(brewing in progress... punch to interrupt)")
	core.get_node_timer(pos):start(60)
		else
			if (itemstack:get_name() == "farming:grapes_purple" or itemstack:get_name() == "farming:grapes_black") and
				meta:get_int("wine_grapes") ~= 5 and meta:get_int("beer_grain") == 0 then
		meta:set_int("wine_grapes", meta:get_int("wine_grapes")+1)
		meta:set_string("infotext", beer.brewing[2].name.. " Grapes\n(" ..meta:get_int("wine_grapes").. "% full of 5)")
		itemstack:take_item()
			end
		end
	end
		return itemstack
	end,
	groups = {choppy=2,oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
	on_dig = function(pos, node, digger)
		local meta = core.get_meta(pos)
		local t = meta:to_table()
		if not(t and t.fields and t.fields.brew) then
			core.remove_node(pos)
			return
		end
		local full = meta:get_int("full")
		local s = core.serialize(t)
		local wear = 65536 - (full*65536/100)
		local item = ItemStack({name="foods:brewing_inv", count=1, wear=wear, metadata=s})
		if digger and digger:is_player() then
			local inv = digger:get_inventory()
			inv:add_item("main", item)
			core.remove_node(pos)
		end
	end
})

core.register_craft({
	output = "foods:brewing_tank 6",
	recipe = {
		{"default:wood", "default:wood", "default:wood"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:wood", "default:wood", "default:wood"}
	}
})

foods = {}

foods.protein = {"group:nut", "default:pine_nuts", "default:coconut_flesh", "group:mushroom"}

foods.water = {
	"group:water_bucket",
	"group:water",
}

foods.water_replacements = {
	{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
	{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
	{"group:water_bucket", "bucket:bucket_empty"},
	{"group:water", "bucket:bucket_empty"},
}

core.register_node("foods:salad", {
	description = "Salad",
	inventory_image = "food_salad.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_salad.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.3, 0.2}
	},
	groups = {dig_immediate = 3},
	
	on_drop = function(itemstack, dropper, pos)
		core.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,
	
	on_use = core.item_eat(6)
})

core.register_node("foods:salad_fruit", {
	description = "Fruit Salad",
	inventory_image = "food_fruit_salad.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_fruit_salad.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.3, 0.2}
	},
	groups = {dig_immediate = 3},
	
	on_drop = function(itemstack, dropper, pos)
		core.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,
	
	on_use = core.item_eat(6)
})

core.register_craft({
	type = "shapeless",
	output = "foods:salad",
	recipe = {"group:greens", "group:greens", "group:lettuce"},
})

core.register_craft({
	type = "shapeless",
	output = "foods:salad_fruit",
	recipe = {"default:apple", "default:apple", "farming:peach"},
})

core.register_craftitem("foods:stew_vegetable", {
	description = "Prepped Vegetables",
	inventory_image = "food_veg_stew.png",
	
	on_drop = function(itemstack, dropper, pos)
		core.chat_send_player(dropper:get_player_name(),
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,
	
	on_use = function(itemstack, user, pos)
		core.chat_send_player(user:get_player_name(),
				"Bleugh! Something tastes very wrong. :-(")
	end,
})

core.register_node("foods:stew_vegetable_cooked", {
	description = "Hot Vegetable Stew",
	inventory_image = "food_veg_stew_hot.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_veg_stew_hot.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.3, 0.2}
	},
	groups = {dig_immediate = 3},
	
	on_drop = function(itemstack, dropper, pos)
		core.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,
	
	on_use = core.item_eat(9)
})

for _,protein in ipairs(foods.protein) do
	core.register_craft({
	type = "shapeless",
	output = "foods:stew_vegetable",
	recipe = {"group:greens", "group:grain", protein},
})
end

core.register_craft({
	type = "cooking",
	output = "foods:stew_vegetable_cooked",
	recipe = "foods:stew_vegetable",
	cooktime = 10,
})

core.register_craftitem("foods:porridge2", {
	description = "Cold Porridge",
	inventory_image = "food_porridge.png",
	
	on_drop = function(itemstack, dropper, pos)
		core.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,
	
	on_use = function(itemstack, user, pos)
		core.chat_send_player(user:get_player_name(),
				"Bleugh! Something tastes very wrong. :-(")
	end,
})

core.register_node("foods:porridge_cooked", {
	description = "Hot Porridge",
	inventory_image = "food_porridge_hot.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_porridge_hot.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.3, 0.2}
	},
	groups = {dig_immediate = 3},
	
	on_drop = function(itemstack, dropper, pos)
		core.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,
	
	on_use = core.item_eat(4)
})

for _,water in ipairs(foods.water) do
	core.register_craft({
		type = "shapeless",
		output = "foods:porridge2",
		recipe = {"group:grain", water, "group:grain"},
		replacements = foods.water_replacements
	})
end

core.register_craft({
	type = "cooking",
	output = "foods:porridge_cooked",
	recipe = "foods:porridge2",
	cooktime = 5,
})

core.register_craftitem("foods:soup_vegetable", {
	description = "Cold Vegetable Soup",
	inventory_image = "food_veg_soup.png",
	
	on_drop = function(itemstack, dropper, pos)
		core.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,
	
	on_use = function(itemstack, user, pos)
		core.chat_send_player(user:get_player_name(),
				"Bleugh! Something tastes very wrong. :-(")
	end,
})

core.register_node("foods:soup_vegetable_cooked", {
	description = "Hot Vegetable Soup",
	inventory_image = "food_veg_soup_hot.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_veg_soup_hot.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.3, 0.2}
	},
	groups = {dig_immediate = 3},
	
	on_drop = function(itemstack, dropper, pos)
		core.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,
	
	on_use = core.item_eat(7)
})

for _,water in ipairs(foods.water) do
	core.register_craft({
		type = "shapeless",
		output = "foods:soup_vegetable",
		recipe = {"group:greens", water, "group:greens"},
		replacements = foods.water_replacements
	})
end

core.register_craft({
	type = "cooking",
	output = "foods:soup_vegetable_cooked",
	recipe = "foods:soup_vegetable",
	cooktime = 10,
})

dofile(core.get_modpath("foods").."/drinks.lua")
dofile(core.get_modpath("foods").."/nonvegan.lua")
