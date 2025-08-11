
-- add lucky blocks

if core.get_modpath("lucky_block") then

	lucky_block:add_blocks({
		{"dro", {"farming:maize_yellow"}, 5},
		{"dro", {"farming:maize_red"}, 5},
		{"dro", {"farming:maize_blue"}, 5},
		{"dro", {"farming:coffee_hot"}, 1},
		{"dro", {"group:bread"}, 5},
		{"nod", "farming:jackolantern", 0},
		{"tro", "farming:jackolantern_on"},
		{"nod", "default:fresh_water_source", 1},
		{"tel"},
		{"dro", {"farming:trellis", "farming:grapes_purple"}, 5},
		{"dro", {"farming:ethanol_3"}, 1},
		{"nod", "farming:melon_S7", 0},
		{"dro", {"farming:donut", "farming:donut_chocolate", "farming:donut_apple"}, 5},
		{"dro", {"farming:hemp_leaf", "farming:hemp_fibre", "farming:seed_hemp"}, 10},
		{"dro", {"farming:strawberry"}, 10},
		{"nod", "fire:permanent_flame", 1},
		{"dro", {"farming:chili_pepper", "farming:chili_bowl"}, 5},
		{"dro", {"vessels:wood_bowl"}, 3},
		{"dro", {"farming:saucepan"}, 1},
		{"dro", {"farming:pot"}, 1},
		{"dro", {"farming:baking_tray"}, 1},
		{"dro", {"farming:skillet"}, 1},
		{"exp", 4},
		{"dro", {"farming:mortar_pestle"}, 1},
		{"dro", {"farming:cutting_board"}, 1},
		{"dro", {"vessels:mixing_bowl"}, 1},
		{"dro", {"farming:hoe_bomb"}, 10},
		{"dro", {"foods:turkish_delight"}, 5},
		{"lig"},
		{"dro", {"farming:scythe_mithril"}, 1},
		{"sch", "instafarming", 0, true, {
			{"farming:wheat_S8", "farming:carrot_S8"},
			{"farming:cotton_S8", "farming:rhubarb_S4"},
		}},
		{"sch", "instafarming", 0, true, {
			{"farming:wheat_S8", "farming:sweet_pepper_S7"},
			{"farming:cotton_S8", "farming:onion_S5"},
		}},
		{"sch", "instafarming", 0, true, {
			{"farming:wheat_S8", "farming:red_beet_S6"},
			{"farming:cotton_S8", "farming:barley_S7"},
		}},
		{"sch", "instafarming", 0, true, {
			{"farming:wheat_S8", "farming:maize_S8"},
			{"farming:cotton_S8", "farming:grapes_S9"},
		}},
		{"sch", "instafarming", 0, true, {
			{"farming:wheat_S8", "farming:pea_S8"},
			{"farming:cotton_S8", "farming:coffee_S5"},
		}},
		{"sch", "instafarming", 0, true, {
			{"farming:wheat_S8", "farming:raspberry_S6"},
			{"farming:cotton_S8", "farming:tomato_S9"},
		}},
		{"sch", "instafarming", 0, true, {
			{"farming:wheat_S8", "farming:chili_S8"},
			{"farming:cotton_S8", "farming:cucumber_S7"},
		}},
		{"nod", "default:chest", 0, {
			{name = "farming:seed_wheat", max = 15},
			{name = "farming:seed_barley", max = 15},
			{name = "farming:seed_barley", max = 15},
			{name = "farming:seed_hemp", max = 15},
			{name = "farming:seed_rye", max = 15},
			{name = "farming:seed_rice", max = 15},
			{name = "farming:seed_oat", max = 15},
			{name = "farming:soil_wet", max = 10},
		}},
	})
end
