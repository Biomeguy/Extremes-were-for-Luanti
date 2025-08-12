if core.get_modpath("default") then
	if core.get_modpath("farming") then
hbhunger.register_food("default:apple", 2, "farming:spent_biomasse")
	end
	hbhunger.register_food("default:bulrush_1", 1)
	hbhunger.register_food("default:bulrush_2", 1)
	hbhunger.register_food("default:kelp_brown", 2)
	hbhunger.register_food("default:kelp_dark_green", 2)
	hbhunger.register_food("default:kelp_green", 2)
	hbhunger.register_food("default:kelp_yellow", 2)
	hbhunger.register_food("default:seaweed", 2)
	hbhunger.register_food("default:alga", 2)
	hbhunger.register_food("default:seagrass", 2)
	hbhunger.register_food("default:seagrass_green", 2)
	hbhunger.register_food("default:seagrass_red", 2)
	hbhunger.register_food("default:sea_anemone", 3, "", 2)
	hbhunger.register_food("default:blueberries", 2)
	hbhunger.register_food("default:bush_berry", 1)
	hbhunger.register_food("default:cactus_fruit", 4, "", nil, 3)
	hbhunger.register_food("default:coconut_flesh", 4)
	hbhunger.register_food("default:coconut_young_open", 2)
	hbhunger.register_food("default:cooked_bulrush", 2)
	hbhunger.register_food("default:orange", 4)
	hbhunger.register_food("default:pine_nuts", 1)
	if core.get_modpath("vessels") then
hbhunger.register_food("default:coconut_milk", 2, "vessels:drinking_glass")
hbhunger.register_food("default:sea_salad", 5, "vessels:wood_bowl", nil, 3)
	end
end

if core.get_modpath("farming") then
	hbhunger.register_food("farming:alfalfa_leaves", 4)
	hbhunger.register_food("farming:vegan_butter", 2)
	hbhunger.register_food("farming:vegan_cheese", 3)
	hbhunger.register_food("farming:vegan_egg", 3)
	hbhunger.register_food("farming:vegan_fish", 3)
	hbhunger.register_food("farming:vegan_meat", 3)
	hbhunger.register_food("farming:amaranth_leaves", 2, "", nil, 1)
	hbhunger.register_food("farming:amaranth_bread", 5)
	hbhunger.register_food("farming:asparagus", 3)
	hbhunger.register_food("farming:barley_bread", 5)
	hbhunger.register_food("farming:beans_green", 1)
	hbhunger.register_food("farming:beans_yellow", 1)
	hbhunger.register_food("farming:blackberries", 1)
	hbhunger.register_food("farming:blackcurrants", 10, "", nil, 5)
	hbhunger.register_food("farming:blueberries", 1)
	hbhunger.register_food("farming:blueberry_muffin", 4)
	hbhunger.register_food("farming:buckwheat_bread", 5)
	hbhunger.register_food("farming:carrot", 4)
	hbhunger.register_food("farming:carrot_leaves", 2)
	hbhunger.register_food("farming:carrot_silver", 6, "", nil, 8)
	hbhunger.register_food("farming:wildcarrot", 2)
	hbhunger.register_food("farming:brocoli_sprout", 7, "", nil, 2)
	hbhunger.register_food("farming:cabbage", 3)
	hbhunger.register_food("farming:brocoli", 4)
	hbhunger.register_food("farming:cauliflower", 5)
	hbhunger.register_food("farming:cauliflower_leaves", 2)
	hbhunger.register_food("farming:celery", 1)
	hbhunger.register_food("farming:celery_pb", 4)
	hbhunger.register_food("farming:chili_pepper", 2, "farming:spent_biomasse")
	hbhunger.register_food("farming:cayenne_pepper", 2, "farming:spent_biomasse")
	hbhunger.register_food("farming:chives", 1)
	hbhunger.register_food("farming:cilantro_seed", 1)
	hbhunger.register_food("farming:cilantro", 2)
	hbhunger.register_food("farming:cucumber", 4)
	hbhunger.register_food("farming:cucumber_leaves", 2)
	hbhunger.register_food("farming:seed_flax", 2)
	hbhunger.register_food("farming:flax_bread", 5)
	hbhunger.register_food("farming:garlic_clove", 1, "farming:spent_biomasse")
	hbhunger.register_food("farming:garlic", 8, "farming:spent_biomasse 9", nil, 1)
	hbhunger.register_food("farming:garlic_bread", 2)
	hbhunger.register_food("farming:ginger", 1)
	hbhunger.register_food("farming:gooseberries", 2)
	hbhunger.register_food("farming:grapes_green", 2, "farming:spent_biomasse")
	hbhunger.register_food("farming:grapes_red", 2, "farming:spent_biomasse")
	hbhunger.register_food("farming:grapes_purple", 2, "farming:spent_biomasse")
	hbhunger.register_food("farming:grapes_black", 2, "farming:spent_biomasse", nil, 1)
	hbhunger.register_food("farming:green_onions", 1, "farming:spent_biomasse")
	hbhunger.register_food("farming:habanero", 3, "farming:spent_biomasse")
	hbhunger.register_food("farming:huckleberries", 1)
	hbhunger.register_food("farming:kohlrabi", 3)
	hbhunger.register_food("farming:kohlrabi_leaves_cooked", 3)
	hbhunger.register_food("farming:kohlrabi_cooked", 4)
	hbhunger.register_food("farming:leek", 3, "farming:leek_root")
	hbhunger.register_food("farming:lettuce_iceberg", 1, "farming:spent_biomasse")
	hbhunger.register_food("farming:lettuce_romaine", 2, "farming:spent_biomasse", nil, 1)
	hbhunger.register_food("farming:maize_yellow", 3, "farming:spent_biomasse")
	hbhunger.register_food("farming:maize_red", 3, "farming:spent_biomasse")
	hbhunger.register_food("farming:maize_blue", 3, "farming:spent_biomasse")
	hbhunger.register_food("farming:maize_yellow_cooked", 5, "farming:spent_biomasse")
	hbhunger.register_food("farming:maize_red_cooked", 5, "farming:spent_biomasse")
	hbhunger.register_food("farming:maize_blue_cooked", 5, "farming:spent_biomasse")
	hbhunger.register_food("farming:masa_yellow", 22, "farming:spent_biomasse", nil, 3)
	hbhunger.register_food("farming:masa_red", 22, "farming:spent_biomasse", nil, 3)
	hbhunger.register_food("farming:masa_blue", 22, "farming:spent_biomasse", nil, 3)
	hbhunger.register_food("farming:melon_seed", 1, "", nil, 1)
	hbhunger.register_food("farming:melon_slice", 2, "farming:spent_biomasse")
	hbhunger.register_food("farming:mustard_seed", 1)
	hbhunger.register_food("farming:oat_bread", 5)
	hbhunger.register_food("farming:onion", 2, "farming:spent_biomasse")
	hbhunger.register_food("farming:parsley", 1)
	hbhunger.register_food("farming:peanut_roasted", 4, "farming:spent_biomasse")
	hbhunger.register_food("farming:pea_snow", 1)
	hbhunger.register_food("farming:pea", 1)
	hbhunger.register_food("farming:pea_chick", 2)
	hbhunger.register_food("farming:pea_leaves", 2)
	hbhunger.register_food("farming:peppercorn", 1)
	hbhunger.register_food("farming:pineapple_ring", 6)
	hbhunger.register_food("farming:poisonous_potato", 1, "", 4)
	hbhunger.register_food("farming:baked_potato", 6)
	hbhunger.register_food("farming:pumpkin_slice", 2, "farming:spent_biomasse")
	hbhunger.register_food("farming:pumpkin_seed", 1)
	hbhunger.register_food("farming:pumpkin_seed_roasted", 2)
	hbhunger.register_food("farming:pumpkin_bread", 8)
	hbhunger.register_food("farming:quinoa_leaves", 2)
	hbhunger.register_food("farming:quinoa_bread", 5)
	hbhunger.register_food("farming:raddish", 3)
	hbhunger.register_food("farming:raddish_leaves", 2)
	hbhunger.register_food("farming:raspberries", 1)
	hbhunger.register_food("farming:red_beet", 2, "farming:spent_biomasse")
	hbhunger.register_food("farming:red_beet_leaves", 2)
	hbhunger.register_food("farming:rhubarb", 1)
	hbhunger.register_food("farming:rice_bread", 5)
	hbhunger.register_food("farming:rosemary", 1)
	hbhunger.register_food("farming:rye_bread", 5)
	hbhunger.register_food("farming:strawberry", 1)
	hbhunger.register_food("farming:sugar_beet", 3, "farming:spent_biomasse")
	hbhunger.register_food("farming:sugar_beet_leaves", 2)
	hbhunger.register_food("farming:sunflower_seeds", 1, "farming:spent_biomasse")
	hbhunger.register_food("farming:sunflower_seeds_roasted", 2, "farming:spent_biomasse")
	hbhunger.register_food("farming:sunflower_root", 1)
	hbhunger.register_food("farming:sunflower_bread", 5)
	hbhunger.register_food("farming:sweet_pepper_green", 2, "farming:sweet_pepper_seed 15")
	hbhunger.register_food("farming:sweet_pepper_yellow", 2, "farming:sweet_pepper_seed 15")
	hbhunger.register_food("farming:sweet_pepper_orange", 2, "farming:sweet_pepper_seed 15")
	hbhunger.register_food("farming:sweet_pepper_red", 2, "farming:sweet_pepper_seed 15")
	hbhunger.register_food("farming:sweet_pepper_purple", 2, "farming:sweet_pepper_seed 15")
	hbhunger.register_food("farming:tomato", 4, "farming:spent_biomasse")
	hbhunger.register_food("farming:turmeric", 1)
	hbhunger.register_food("farming:vanilla", 1)
	hbhunger.register_food("farming:wheat_bread", 5)
	hbhunger.register_food("farming:zucchini_green", 4, "farming:spent_biomasse")
	hbhunger.register_food("farming:zucchini_green_cooked", 8, "farming:spent_biomasse", nil, 1)
	hbhunger.register_food("farming:zucchini_yellow", 4, "farming:spent_biomasse")
	hbhunger.register_food("farming:zucchini_yellow_cooked", 8, "farming:spent_biomasse", nil, 1)
	hbhunger.register_food("farming:avocado", 5, "", nil, 1)
	hbhunger.register_food("farming:cherry", 4, "farming:spent_biomasse")
	hbhunger.register_food("farming:cocoa_beans", 2)
	hbhunger.register_food("farming:cocoa_powder", 0, "", nil, -3)
	hbhunger.register_food("farming:dark_chocolate", 4)
	hbhunger.register_food("farming:milk_chocolate", 3)
	hbhunger.register_food("farming:white_chocolate", 3)
	hbhunger.register_food("farming:date", 1, "farming:date_pit")
	hbhunger.register_food("farming:fig", 3, "farming:spent_biomasse")
	hbhunger.register_food("farming:hazelnut", 4, "farming:spent_biomasse")
	hbhunger.register_food("farming:lemon", 3)
	hbhunger.register_food("farming:lime", 3)
	hbhunger.register_food("farming:mandarin", 2)
	hbhunger.register_food("farming:mango", 4)
	hbhunger.register_food("farming:mirabelle", 3)
	hbhunger.register_food("farming:nutmeg", 3, "farming:nutmeg_nut")
	hbhunger.register_food("farming:olive_green", 2)
	hbhunger.register_food("farming:olive_ripe", 3)
	hbhunger.register_food("farming:peach", 4, "farming:peach_pit")
	hbhunger.register_food("farming:almond", 1)
	hbhunger.register_food("farming:pear", 4, "farming:spent_biomasse")
	hbhunger.register_food("farming:pecan_shelled", 2)
	hbhunger.register_food("farming:plum", 3, "farming:plum_pit")
	hbhunger.register_food("farming:pomegranate", 3, "farming:spent_biomasse")
	hbhunger.register_food("farming:walnut", 1, "farming:spent_biomasse")
	hbhunger.register_food("farming:sugar", 1)
	hbhunger.register_food("farming:red_beet_sugar", 1)
	if core.get_modpath("bucket") then
hbhunger.register_food("farming:vegan_milk", 8, 'bucket:bucket_empty')
hbhunger.register_food("farming:rice_milk", 8, 'bucket:bucket_empty')
hbhunger.register_food("farming:almond_milk", 8, 'bucket:bucket_empty')
	end
	if core.get_modpath("vessels") then
hbhunger.register_food("farming:coffee_hot", 3, "vessels:ceramic_cup", nil, 2)
hbhunger.register_food("farming:mint_tea_hot", 2, "vessels:ceramic_cup")
hbhunger.register_food("farming:pumpkin_spice_latte_hot", 6, "vessels:ceramic_cup")
hbhunger.register_food("farming:raspberry_leaf_tea_hot", 5, "vessels:ceramic_cup")
hbhunger.register_food("farming:tea_hot", 5, "vessels:ceramic_cup")
hbhunger.register_food("farming:pineapple_juice", 14, "vessels:drinking_glass", nil, 2)
hbhunger.register_food("farming:smoothie_blackberry", 2, "vessels:drinking_glass")
hbhunger.register_food("farming:smoothie_raspberry", 2, "vessels:drinking_glass")
hbhunger.register_food("farming:almond_oil", 2, "vessels:glass_bottle")
hbhunger.register_food("farming:cottonseed_oil", 0, "vessels:glass_bottle", 2, -1)
hbhunger.register_food("farming:flaxseed_oil", 2, "vessels:glass_bottle")
hbhunger.register_food("farming:medicine", 8, "vessels:glass_bottle", nil, 6)
hbhunger.register_food("farming:olive_oil", 4, "vessels:glass_bottle")
hbhunger.register_food("farming:peppercorn_ground", 1, "vessels:glass_bottle", nil, 1)
hbhunger.register_food("farming:sunflower_oil", 2, "vessels:glass_bottle")
hbhunger.register_food("farming:almond_butter", 7, "vessels:glass_jar")
hbhunger.register_food("farming:melon_seed_butter", 7, "vessels:glass_jar", nil, 5)
hbhunger.register_food("farming:mustard", 4, "vessels:glass_jar")
hbhunger.register_food("farming:peanut_butter", 6, "vessels:glass_jar")
hbhunger.register_food("farming:pumpkin_seed_butter", 6, "vessels:glass_jar")
hbhunger.register_food("farming:soaked_walnuts", 14, "vessels:glass_jar")
hbhunger.register_food("farming:sunflower_butter", 6, "vessels:glass_jar")
hbhunger.register_food("farming:amaranth_cooked", 3, "vessels:wood_bowl")
hbhunger.register_food("farming:asparagus_soup", 5, "vessels:wood_bowl", nil, 2)
hbhunger.register_food("farming:chili_bowl", 8, "vessels:wood_bowl")
hbhunger.register_food("farming:kohlrabi_soup", 5, "vessels:wood_bowl")
hbhunger.register_food("farming:onion_soup", 6, "vessels:wood_bowl")
hbhunger.register_food("farming:pea_soup", 12, "vessels:wood_bowl", nil, 3)
hbhunger.register_food("farming:potato_salad", 10, "vessels:wood_bowl")
hbhunger.register_food("farming:quinoa_cooked", 3, "vessels:wood_bowl")
hbhunger.register_food("farming:red_beet_soup", 15, "vessels:wood_bowl", nil, 3)
hbhunger.register_food("farming:rice_cooked", 3, "vessels:wood_bowl")
	end
end

if core.get_modpath("flowers") then
	hbhunger.register_food("flowers:mushroom_brown", 1)
	hbhunger.register_food("flowers:sinister_bread", 4, "", 3)
	hbhunger.register_food("flowers:mushroom_white", 1, "", 3)
	hbhunger.register_food("flowers:mushroom_red", 1, "", 3)
end

if core.get_modpath("mobs") then
	if mobs.mod ~= nil and mobs.mod == "redo" then
hbhunger.register_food("mobs:meat", 8, "bonemeal:bone")
hbhunger.register_food("mobs:meat_raw", 4, "bonemeal:bone")
hbhunger.register_food("mobs:meatblock", 20, "bonemeal:bone 9")
if core.get_modpath("mobs_animal") then 
	hbhunger.register_food("mobs:honey", 3)
	hbhunger.register_food("mobs:rabbit_raw", 3, "bonemeal:bone 3", 3)
	hbhunger.register_food("mobs:rabbit_cooked", 5, "bonemeal:bone 3")
	hbhunger.register_food("mobs:chicken_cooked", 6, "bonemeal:bone 3")
	hbhunger.register_food("mobs:chicken_raw", 2, "bonemeal:bone 3", 3)
	hbhunger.register_food("mobs:chicken_egg_fried", 2)
	if core.get_modpath("bucket") then
hbhunger.register_food("mobs:bucket_milk", 8, "bucket:bucket_empty")
hbhunger.register_food("mobs:bucket_skim_milk", 7, "bucket:bucket_empty")
hbhunger.register_food("mobs:bucket_whey", 7, "bucket:bucket_empty")
hbhunger.register_food("mobs:bucket_cream", 8, "bucket:bucket_empty")
hbhunger.register_food("mobs:bucket_evaporated_milk", 8, "bucket:bucket_empty")
hbhunger.register_food("mobs:bucket_condensed_milk", 8, "bucket:bucket_empty")
	end
	if core.get_modpath("vessels") then
hbhunger.register_food("mobs:glass_milk", 2, "vessels:drinking_glass")
	end
	hbhunger.register_food("mobs:butter", 2)
	hbhunger.register_food("mobs:cheese", 4)
	hbhunger.register_food("mobs:rat_cooked", 4)
	hbhunger.register_food("mobs:mutton_raw", 3, "bonemeal:bone 4", 3)
	hbhunger.register_food("mobs:mutton_cooked", 6, "bonemeal:bone 4")
	hbhunger.register_food("mobs:pork_raw", 3, "", 3)
	hbhunger.register_food("mobs:pork_cooked", 8)
end
	else
hbhunger.register_food("mobs:meat", 6)
hbhunger.register_food("mobs:meat_raw", 3)
hbhunger.register_food("mobs:rat_cooked", 5)
	end
end

if core.get_modpath("aztec") then
	hbhunger.register_food("aztec:socolatl_hot", 16, "vessels:ceramic_cup", nil, 9)
end

if core.get_modpath("black_oak") then
	hbhunger.register_food("black_oak:acorn_muffin", 4, "", nil, 1)
end

if core.get_modpath("black_spruce") then
	hbhunger.register_food("black_spruce:nuts", 1)
end

if core.get_modpath("blue_spruce") or core.get_modpath("white_spruce") then
	hbhunger.register_food("default:spruce_nuts", 1)
end

if core.get_modpath("cedar") then
	hbhunger.register_food("cedar:nuts", 1)
end

if core.get_modpath("chestnut") then
	hbhunger.register_food("chestnut:bur", 2, "farming:spent_biomasse")
	hbhunger.register_food("chestnut:fruit", 3, "", nil, 1)
end

if core.get_modpath("crops") then
	hbhunger.register_food("crops:melon_slice", 1, "", nil, 1)
	hbhunger.register_food("crops:roasted_pumpkin", 2, "", nil, 1)
	hbhunger.register_food("crops:corn_on_the_cob", 1)
	hbhunger.register_food("crops:tomato", 1)
	hbhunger.register_food("crops:potato", 1)
	hbhunger.register_food("crops:green_bean", 1)
end

if core.get_modpath("ebony") then
	hbhunger.register_food("ebony:persimmon", 4, "farming:spent_biomasse", nil, 2)
end

if core.get_modpath("ecology") then
	hbhunger.register_food("ecology:medflower", 1)
	hbhunger.register_food("ecology:bluemush", 1)
	hbhunger.register_food("ecology:chillshroom", 1)
	hbhunger.register_food("ecology:chillshroom_2", 1)
	hbhunger.register_food("ecology:sunshroom", 1)
	hbhunger.register_food("ecology:zapshroom", 1)
	hbhunger.register_food("ecology:rushroom", 1)
	hbhunger.register_food("ecology:wildberry", 1)
	hbhunger.register_food("ecology:bigmush", 1, "", 2)
	hbhunger.register_food("ecology:mushroom_red", 1, "", nil, 4)
	hbhunger.register_food("ecology:mushroom_shiitake", 2, "", nil, 1)
	hbhunger.register_food("ecology:prickly_pear_fruit", 2, "", nil, 1)
	hbhunger.register_food("ecology:pale_green_berries", 1, "", 2)
	hbhunger.register_food("ecology:curlyfruit", 1)
	hbhunger.register_food("ecology:arctic_carrot", 2, "ecology:arctic_carrot_leaves")
	hbhunger.register_food("ecology:arctic_carrot_root", 2)
	hbhunger.register_food("ecology:mandragora", 1)
	hbhunger.register_food("ecology:orange_mycena", 3)
	hbhunger.register_food("ecology:cortinarius_violaceus", 1, "", 5)
	hbhunger.register_food("ecology:gliophorus_viridis", 1, "", 3)
	hbhunger.register_food("ecology:kelp", 2)
	hbhunger.register_food("ecology:sushi", 6)
end

if core.get_modpath("fir") then
	hbhunger.register_food("fir:nuts", 1)
end

if core.get_modpath("juniper") then
	hbhunger.register_food("juniper:berries", 1)
end

if core.get_modpath("fishing") then
	hbhunger.register_food("fishing:fish_raw", 2)
	hbhunger.register_food("fishing:fish_cooked", 5)
	hbhunger.register_food("fishing:sushi", 6)
	hbhunger.register_food("fishing:shark", 4)
	hbhunger.register_food("fishing:shark_cooked", 8)
	hbhunger.register_food("fishing:pike", 4)
	hbhunger.register_food("fishing:pike_cooked", 8)
end

if core.get_modpath("gloop") then
	hbhunger.register_food("gloop:kalite_lump", 1)
end

if core.get_modpath("foods") then
hbhunger.register_food("foods:molasses_1", 1, "vessels:glass_bottle")
hbhunger.register_food("foods:molasses_2", 2, "vessels:glass_bottle")
hbhunger.register_food("foods:molasses_3", 1, "vessels:glass_bottle")
	hbhunger.register_food("foods:caramel", 2)
hbhunger.register_food("foods:carrot_juice", 4, "vessels:drinking_glass")
hbhunger.register_food("foods:apple_juice", 3, "vessels:drinking_glass")
hbhunger.register_food("foods:orange_juice", 4, "vessels:drinking_glass")
hbhunger.register_food("foods:spectrum_juice", 20, "vessels:drinking_glass", nil, 20)
hbhunger.register_food("foods:salad_bowl", 4, "vessels:mixing_bowl")
hbhunger.register_food("foods:sauce_hollandaise", 3, "vessels:glass_bottle")
hbhunger.register_food("foods:salad_bowl_hollandaise", 7, "vessels:mixing_bowl")
hbhunger.register_food("foods:salad_bowl_oil", 5, "vessels:mixing_bowl")
	hbhunger.register_food("foods:pizza_vegan_raw", 2)
	hbhunger.register_food("foods:pizza_vegan", 6)
	hbhunger.register_food("foods:pizza_funghi_raw", 2)
	hbhunger.register_food("foods:pizza_funghi", 6)
hbhunger.register_food("foods:asparagus_hollandaise", 5, "vessels:ceramic_plate")
hbhunger.register_food("foods:rice_asparagus", 6, "vessels:ceramic_plate")
hbhunger.register_food("foods:fish_parsley_rosemary", 6, "vessels:ceramic_plate")
hbhunger.register_food("farming:chicken_soup", 6, "vessels:wood_bowl")
	hbhunger.register_food("foods:mlt_burger", 6)
	hbhunger.register_food("foods:potato_slices", 2)
	hbhunger.register_food("foods:potato_chips", 3, "vessels:wood_bowl")
	hbhunger.register_food("foods:casserole", 5)
	hbhunger.register_food("foods:sushi", 4)
	hbhunger.register_food("foods:turkish_delight", 2)
	hbhunger.register_food("foods:date_nut_snack", 4)
	hbhunger.register_food("foods:date_nut_cake", 32)
	hbhunger.register_food("foods:date_nut_bar", 12)
	hbhunger.register_food("foods:garlic_tomato_pasta", 8)
	hbhunger.register_food("foods:ciabatta", 4)
	hbhunger.register_food("foods:chestnut_bread", 5)
	hbhunger.register_food("foods:multigrain_bread", 7)
	hbhunger.register_food("foods:bread_slice", 1)
	hbhunger.register_food("foods:toast", 1)
hbhunger.register_food("foods:coconut_cream", 7, 'bucket:bucket_empty')
	hbhunger.register_food("foods:chocolate_chip_cookie", 2)
	hbhunger.register_food("foods:chocolate_chip_cookie_dough", 4, "", 6)
	hbhunger.register_food("foods:pumpkin_spice_cookie", 2)
	hbhunger.register_food("foods:pumpkin_spice_cookie_dough", 4, "", 6)
	hbhunger.register_food("foods:pumpkin_spice_muffin", 2)
	hbhunger.register_food("foods:pumpkin_spice_muffin_dough", 4, "", 6)
	hbhunger.register_food("foods:pumpkin_spice_bread", 8)
	hbhunger.register_food("foods:pumpkin_spice_cake", 12)
	hbhunger.register_food("foods:donut", 4)
	hbhunger.register_food("foods:donut_chocolate", 6)
	hbhunger.register_food("foods:donut_apple", 6)
	hbhunger.register_food("foods:donut_pumpkin_spice", 6)
	hbhunger.register_food("foods:peach_cobbler", 4)
	hbhunger.register_food("foods:maize_yellow_bread", 4)
hbhunger.register_food("foods:strawberry_lemonade", 2, "vessels:drinking_glass")
	hbhunger.register_food("foods:fritter_walnut", 6)
	hbhunger.register_food("foods:fritter_walnut_dough", 4, "", 6)
	hbhunger.register_food("foods:fritter_maize_yellow", 6)
	hbhunger.register_food("foods:fritter_maize_yellow_dough", 4, "", 6)
	hbhunger.register_food("foods:fritter_apple", 6)
	hbhunger.register_food("foods:fritter_apple_dough", 4, "", 6)
for _, berry in ipairs({"blackberry", "blackcurrant", "blueberry", "gooseberry",
	"huckleberry", "raspberry", "rhubarb", "strawberry", "strawberry_rhubarb", "mixed_berry"}) do
	hbhunger.register_food("foods:"..berry.."_pie_raw", 4)
	hbhunger.register_food("foods:"..berry.."_pie", 6)
	hbhunger.register_food("foods:"..berry.."_pie_slice", 1)
end
	hbhunger.register_food("foods:cake_plain", 4)
	hbhunger.register_food("foods:cake_choco", 4)
	hbhunger.register_food("foods:cake_carrot", 4)
	hbhunger.register_food("foods:cake_p", 3)
	hbhunger.register_food("foods:chocolate_cake", 5)
	hbhunger.register_food("foods:carrot_cake", 4)
	hbhunger.register_food("foods:apple_pie", 5)
	hbhunger.register_food("foods:rhubarb_pie2", 5)
	hbhunger.register_food("foods:banana_pie", 5)
	hbhunger.register_food("foods:pumpkin_pie", 5)
	hbhunger.register_food("foods:boston_cream", 5)
	hbhunger.register_food("foods:shortcake", 3)
	hbhunger.register_food("foods:cake_walnut_coffee", 4)
	hbhunger.register_food("foods:cake_cheese_strawberry", 4)
	hbhunger.register_food("foods:cake_cheese_blueberry", 4)
	hbhunger.register_food("foods:cake_triple_choco", 4)
	hbhunger.register_food("foods:cake_wedding", 6)
	hbhunger.register_food("foods:cupcake", 2)
	hbhunger.register_food("foods:cupcake_choco", 4)
	hbhunger.register_food("foods:cupcake_fairy", 2)
	hbhunger.register_food("foods:cupcake_lemon", 2)
	hbhunger.register_food("foods:muffin_choco", 4)
	hbhunger.register_food("foods:short_bread", 3)
	hbhunger.register_food("foods:pie_crust", 3)
	hbhunger.register_food("foods:strawberry_shortcake", 3)
	hbhunger.register_food("foods:porridge", 6, "vessels:wood_bowl")
	hbhunger.register_food("foods:jaffa_cake", 6)
	hbhunger.register_food("foods:bibimbap", 8, "vessels:wood_bowl")
	hbhunger.register_food("foods:vegetable_omlet", 10, "", nil, 4)
hbhunger.register_food("foods:beer_bottle", 1, "vessels:glass_bottle")
hbhunger.register_food("foods:wine_bottle", 2.5, "vessels:glass_bottle")
	hbhunger.register_food("foods:salad", 6)
	hbhunger.register_food("foods:salad_fruit", 6)
	hbhunger.register_food("foods:stew_vegetable_cooked", 9)
	hbhunger.register_food("foods:porridge_cooked", 4)
	hbhunger.register_food("foods:soup_vegetable_cooked", 7)
end

if core.get_modpath("creatures") then
	hbhunger.register_food("creatures:meat", 6)
	hbhunger.register_food("creatures:flesh", 3)
	hbhunger.register_food("creatures:rotten_flesh", 3, "", 3)
end

if core.get_modpath("ethereal") then
	hbhunger.register_food("ethereal:banana", 4)
	hbhunger.register_food("ethereal:bamboo_sprout", 0, "", 3)
	hbhunger.register_food("ethereal:fern_tubers", 1)
	hbhunger.register_food("ethereal:banana_bread", 7)
	hbhunger.register_food("ethereal:golden_apple", 4, "", nil, 10)
	hbhunger.register_food("ethereal:hearty_stew", 10, "vessels:wood_bowl")
	if core.get_modpath("bucket") then
		hbhunger.register_food("ethereal:bucket_cactus", 2, "bucket:bucket_empty")
	end
	hbhunger.register_food("ethereal:fish_raw", 2)
	hbhunger.register_food("ethereal:fish_cooked", 5)
	hbhunger.register_food("ethereal:seaweed", 1)
	hbhunger.register_food("ethereal:yellowleaves", 1, "", nil, 1)
	hbhunger.register_food("ethereal:sashimi", 4)
end

if core.get_modpath("ferns") then
	hbhunger.register_food("ferns:fiddlehead", 1, "", 1)
	hbhunger.register_food("ferns:fiddlehead_roasted", 3)
	hbhunger.register_food("ferns:ferntuber_roasted", 3)
	hbhunger.register_food("ferns:horsetail_01", 1)
end

if core.get_modpath("noel") then
	hbhunger.register_food("noel:candycane", 4)
	hbhunger.register_food("noel:gingerbread_cookie", 6)
	hbhunger.register_food("noel:plate_with_cookies", 14, "vessels:ceramic_plate", nil, 6)
	hbhunger.register_food("noel:milk_glass", 4, "vessels:drinking_glass")
	hbhunger.register_food("noel:gumdrop_red", 2)
	hbhunger.register_food("noel:gumdrop_orange", 2)
	hbhunger.register_food("noel:gumdrop_yellow", 2)
	hbhunger.register_food("noel:gumdrop_green", 2)
	hbhunger.register_food("noel:gumdrop_blue", 2)
	hbhunger.register_food("noel:gumdrop_purple", 2)
	hbhunger.register_food("noel:apple_pudding", 8)
	hbhunger.register_food("noel:candy_cane", 1)
	hbhunger.register_food("noel:ginger_bread_cookie", 6)
end

if core.get_modpath("nssm") then
	hbhunger.register_food("nssm:werewolf_leg", 3)
	hbhunger.register_food("nssm:heron_leg", 2)
	hbhunger.register_food("nssm:chichibios_heron_leg", 4)
	hbhunger.register_food("nssm:crocodile_tail", 3)
	hbhunger.register_food("nssm:duck_legs", 1)
	hbhunger.register_food("nssm:ant_leg", 1)
	hbhunger.register_food("nssm:spider_leg", 1)
	hbhunger.register_food("nssm:tentacle", 2)
	hbhunger.register_food("nssm:worm_flesh", 2, "", 2) -- poisonous
	hbhunger.register_food("nssm:amphibian_heart", 1)
	hbhunger.register_food("nssm:raw_scrausics_wing", 1)
	-- superfoods
	hbhunger.register_food("nssm:phoenix_nuggets", 20, "", nil, 20)
	hbhunger.register_food("nssm:phoenix_tear", 20, "", nil, 20)
end

if core.get_modpath("dwarves") then
	hbhunger.register_food("dwarves:beer", 2)
	hbhunger.register_food("dwarves:apple_cider", 1)
	hbhunger.register_food("dwarves:midus", 2)
	hbhunger.register_food("dwarves:tequila", 2)
	hbhunger.register_food("dwarves:tequila_with_lime", 2)
	hbhunger.register_food("dwarves:sake", 2)
end

if core.get_modpath("animalmaterials") then
	hbhunger.register_food("animalmaterials:milk", 2)
	hbhunger.register_food("animalmaterials:meat_raw", 3)
	hbhunger.register_food("animalmaterials:meat_pork", 3)
	hbhunger.register_food("animalmaterials:meat_beef", 3)
	hbhunger.register_food("animalmaterials:meat_chicken", 3)
	hbhunger.register_food("animalmaterials:meat_lamb", 3)
	hbhunger.register_food("animalmaterials:meat_venison", 3)
	hbhunger.register_food("animalmaterials:meat_undead", 3, "", 3)
	hbhunger.register_food("animalmaterials:meat_toxic", 3, "", 5)
	hbhunger.register_food("animalmaterials:meat_ostrich", 3)
	hbhunger.register_food("animalmaterials:fish_bluewhite", 2)
	hbhunger.register_food("animalmaterials:fish_clownfish", 2)
end

if core.get_modpath("bushes") then
	hbhunger.register_food("bushes:sugar", 1)
	hbhunger.register_food("bushes:strawberry", 2)
	hbhunger.register_food("bushes:berry_pie_raw", 3)
	hbhunger.register_food("bushes:berry_pie_cooked", 4)
	hbhunger.register_food("bushes:basket_pies", 15)
end

if core.get_modpath("bushes_classic") then
	-- bushes_classic mod, as found in the plantlife modpack
	local berries = {
		"strawberry",
		"blackberry",
		"blueberry",
		"raspberry",
		"gooseberry",
		"mixed_berry"}
	for _, berry in ipairs(berries) do
		if berry ~= "mixed_berry" then
			hbhunger.register_food("bushes:"..berry, 1)
		end
		hbhunger.register_food("bushes:"..berry.."_pie_raw", 2)
		hbhunger.register_food("bushes:"..berry.."_pie_cooked", 5)
		hbhunger.register_food("bushes:basket_"..berry, 15)
	end
end

if core.get_modpath("mushroom") then
	hbhunger.register_food("mushroom:brown", 1)
	hbhunger.register_food("mushroom:red", 1, "", 3)
	-- mushroom potions: red = strong poison, brown = light restorative
	if core.get_modpath("vessels") then
		hbhunger.register_food("mushroom:brown_essence", 1, "vessels:glass_bottle", nil, 4)
		hbhunger.register_food("mushroom:poison", 1, "vessels:glass_bottle", 10)
	end
end

if core.get_modpath("docfarming") then
	hbhunger.register_food("docfarming:carrot", 3)
	hbhunger.register_food("docfarming:cucumber", 2)
	hbhunger.register_food("docfarming:corn", 3)
	hbhunger.register_food("docfarming:potato", 4)
	hbhunger.register_food("docfarming:bakedpotato", 5)
	hbhunger.register_food("docfarming:raspberry", 3)
end

if core.get_modpath("farming_plus") then
	hbhunger.register_food("farming_plus:carrot_item", 3)
	hbhunger.register_food("farming_plus:banana", 2)
	hbhunger.register_food("farming_plus:orange_item", 2)
	hbhunger.register_food("farming_plus:strawberry_item", 2)
	hbhunger.register_food("farming_plus:tomato_item", 2)
	hbhunger.register_food("farming_plus:potato_item", 4)
	hbhunger.register_food("farming_plus:rhubarb_item", 2)
end

if core.get_modpath("fruit") then
	hbhunger.register_food("fruit:apple", 2)
	hbhunger.register_food("fruit:pear", 2)
	hbhunger.register_food("fruit:bananna", 3)
	hbhunger.register_food("fruit:orange", 2)
end

if core.get_modpath("mush45") then
	hbhunger.register_food("mush45:meal", 4)
end

if core.get_modpath("seaplants") then
	hbhunger.register_food("seaplants:kelpgreen", 1)
	hbhunger.register_food("seaplants:kelpbrown", 1)
	hbhunger.register_food("seaplants:seagrassgreen", 1)
	hbhunger.register_food("seaplants:seagrassred", 1)
	hbhunger.register_food("seaplants:seasaladmix", 6)
	hbhunger.register_food("seaplants:kelpgreensalad", 1)
	hbhunger.register_food("seaplants:kelpbrownsalad", 1)
	hbhunger.register_food("seaplants:seagrassgreensalad", 1)
	hbhunger.register_food("seaplants:seagrassgreensalad", 1)
end

if core.get_modpath("mobfcooking") then
	hbhunger.register_food("mobfcooking:cooked_pork", 6)
	hbhunger.register_food("mobfcooking:cooked_ostrich", 6)
	hbhunger.register_food("mobfcooking:cooked_beef", 6)
	hbhunger.register_food("mobfcooking:cooked_chicken", 6)
	hbhunger.register_food("mobfcooking:cooked_lamb", 6)
	hbhunger.register_food("mobfcooking:cooked_venison", 6)
	hbhunger.register_food("mobfcooking:cooked_fish", 6)
end

if core.get_modpath("kpgmobs") then
	hbhunger.register_food("kpgmobs:uley", 3)
	hbhunger.register_food("kpgmobs:meat", 6)
	hbhunger.register_food("kpgmobs:rat_cooked", 5)
	hbhunger.register_food("kpgmobs:med_cooked", 4)
	if core.get_modpath("bucket") then
		hbhunger.register_food("kpgmobs:bucket_milk", 4, "bucket:bucket_empty")
	end
end

if core.get_modpath("jkfarming") then
	hbhunger.register_food("jkfarming:carrot", 3)
	hbhunger.register_food("jkfarming:corn", 3)
	hbhunger.register_food("jkfarming:melon_part", 2)
	hbhunger.register_food("jkfarming:cake", 3)
end

if core.get_modpath("jkanimals") then
	hbhunger.register_food("jkanimals:meat", 6)
end

if core.get_modpath("jkwine") then
	hbhunger.register_food("jkwine:grapes", 2)
	hbhunger.register_food("jkwine:winebottle", 1)
end

if core.get_modpath("cooking") then
	hbhunger.register_food("cooking:meat_beef_cooked", 4)
	hbhunger.register_food("cooking:fish_bluewhite_cooked", 3)
	hbhunger.register_food("cooking:fish_clownfish_cooked", 1)
	hbhunger.register_food("cooking:meat_chicken_cooked", 2)
	hbhunger.register_food("cooking:meat_cooked", 2)
	hbhunger.register_food("cooking:meat_pork_cooked", 3)
	hbhunger.register_food("cooking:meat_toxic_cooked", -3)
	hbhunger.register_food("cooking:meat_venison_cooked", 3)
	hbhunger.register_food("cooking:meat_undead_cooked", 1)
end

if core.get_modpath("pizza") then
	hbhunger.register_food("pizza:pizza", 30, "", nil, 30)
	hbhunger.register_food("pizza:pizzaslice", 5, "", nil, 5)
end
