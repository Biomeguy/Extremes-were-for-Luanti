
core.register_craftitem("foods:stew_meat", {
	description = "Prepped Meat",
	inventory_image = "food_meat_stew.png",

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

core.register_node("foods:stew_meat_cooked", {
	description = "Hot Meat Stew",
	inventory_image = "food_meat_stew_hot.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_meat_stew_hot.png"},
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

	on_use = core.item_eat(12)
})

core.register_craft({
	type = "shapeless",
	output = "foods:stew_meat",
	recipe = {"group:meat", "group:grain", "farming:carrot"},
})

core.register_craft({
	type = "cooking",
	output = "foods:stew_meat_cooked",
	recipe = "foods:stew_meat",
	cooktime = 10,
})

foods.cake_box = {
	type = "fixed",
	fixed = {
		{-0.250000,-0.500000,-0.296880,0.250000,-0.250000,0.312502},
		{-0.309375,-0.500000,-0.250000,0.309375,-0.250000,0.250000},
		{-0.250000,-0.250000,-0.250000,0.250000,-0.200000,0.250000}
	}
}

core.register_node("foods:cake", {
	description = "Cake",
	on_use = core.item_eat(4),
	groups={food=3,crumbly=3},
	tiles = {"food_cake_texture.png", "food_cake_texture.png", "food_cake_texture_side.png"},
	walkable = false,
	sunlight_propagates = true,
	drawtype="nodebox",
	paramtype = "light",
	node_box = foods.cake_box
})

core.register_node("foods:fruitcake", {
	description = "Fruit Cake",
	on_use = core.item_eat(6),
	groups={food=3,crumbly=3},
	tiles = {"food_cake_carrot_texture.png", "food_cake_carrot_texture.png",
		"food_cake_carrot_texture_side.png"},
	walkable = false,
	sunlight_propagates = true,
	drawtype="nodebox",
	paramtype = "light",
	node_box = foods.cake_box
})

core.register_craftitem("foods:cake_mix", {
	description = "Cake Mix",
	inventory_image = "foods_cakemix_plain.png"
})

core.register_craftitem("foods:fruitcake_mix", {
	description = "Fruit Cake Mix",
	inventory_image = "foods_cakemix_plain.png"
})

for _,water in ipairs(foods.water) do
	core.register_craft({
		type = "shapeless",
		output = "foods:cake_mix",
		recipe = {"group:flour", water, "group:egg"},
		replacements = foods.water_replacements
	})
		core.register_craft({
		type = "shapeless",
		output = "foods:fruitcake_mix",
		recipe = {"group:flour", water, "group:egg", "default:apple"},
		replacements = foods.water_replacements
	})
end

core.register_craft({
	type = "cooking",
	cooktime = 8,
	output = "foods:cake",
	recipe = "foods:cake_mix"
})

core.register_craft({
	type = "cooking",
	cooktime = 12,
	output = "foods:fruitcake",
	recipe = "foods:fruitcake_mix"
})


-- Drinks

foods.register_drink({
	name = "honey",
	desc = "Honey Juice",
	colour = "mead",
	colouring = {a = 120, r = 90, g = 60, b = 0},
	flavour = "mobs:honey",
	nutrition = 4,
	groups = {},
})

foods.register_drink({
	name = "mead",
	desc = "Mead",
	colour = "mead",
	colouring = {a = 120, r = 90, g = 60, b = 0},
	flavour = "none",
	nutrition = 6,
	groups = {},
})

foods.milk = {
	"mobs:bucket_milk",
	"mobs:pail_milk",
}

foods.milk_replacements = {
	{"mobs:bucket_milk", "bucket:bucket_empty"},
	{"mobs:pail_milk", "bucket:wooden_empty"},
}

core.register_node("foods:milk_flowing", {
	description = "Flowing milk",
	inventory_image = core.inventorycube("food_milk.png"),
	drawtype = "flowingliquid",
	tiles = {"food_milk.png"},
	special_tiles = {
		{
			name = "food_milk_flowing_animated.png",
			backface_culling = false,
			animation = {
				type     = "vertical_frames", 
				aspect_w = 16, 
				aspect_h = 16, 
				length   = 0.8,
			}
		},
		{
			name = "food_milk_flowing_animated.png",
			backface_culling = true,
			animation = {
				type     = "vertical_frames", 
				aspect_w = 16, 
				aspect_h = 16, 
				length   = 0.8,
			}
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "foods:milk_flowing",
	liquid_alternative_source = "foods:milk",
	liquid_viscosity = 3,
	post_effect_color = {a = 127, r = 255, g = 255, b = 255},
	groups = {milk = 3, liquid = 3, not_in_creative_inventory = 0},
	sounds = default.node_sound_water_defaults(),
})

core.register_node("foods:milk", {
	description = "Milk",
	inventory_image = core.inventorycube("food_milk.png"),
	drawtype = "liquid",
	tiles = {
		{
			name = "food_milk_animated.png", 
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style milk source material (mostly unused)
		{
			name = "food_milk_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "foods:milk_flowing",
	liquid_alternative_source = "foods:milk",
	liquid_viscosity = 3,
	post_effect_color = {a = 127, r = 255, g = 255, b = 255},
	groups = {milk = 3, liquid = 3, freezes = 1, melt_around = 1},
	sounds = default.node_sound_water_defaults(),
})

core.register_node("foods:bottle_milk", {
	description = "Bottle of milk",
	drawtype = "plantlike",
	tiles = {"foods_cane_syrup.png^[colorize:white:80"},
	inventory_image = "foods_cane_syrup.png^[colorize:white:80",
	wield_image = "foods_cane_syrup.png^[colorize:white:80",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	stack_max = 12,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(itemstack, user, pointd)
		local replace_with_item = "vessels:glass_bottle"
		if pointd.under  then
			local target = core.get_node(pointd.under)
			if target.name == "vessels:drinking_glass" then
				core.set_node(pointd.under, {name="foods:glass_milk"})
				if itemstack:take_item() ~= nil then
					if itemstack:is_empty() then
						itemstack:add_item(replace_with_item)
					else
						local inv = user:get_inventory()
						if inv:room_for_item("main", {name=replace_with_item}) then
							inv:add_item("main", replace_with_item)
						else
							local pos = user:getpos()
							pos.y = math.floor(pos.y + 0.5)
							core.add_item(pos, replace_with_item)
						end
					end
				end
			else
				core.do_item_eat(1, replace_with_item, itemstack, user, pointd)
			end
		else
			core.do_item_eat(1, replace_with_item, itemstack, user, pointd)
		end
		return itemstack
	end
})

for _,milk in ipairs(foods.milk) do
	core.register_craft({
		output = "foods:bottle_milk 8",
		recipe = {
			{"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"},
			{"vessels:glass_bottle", milk, "vessels:glass_bottle"},
			{"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"}
		},
		replacements = foods.milk_replacements
	})
end

core.register_craft({
	output = "mobs:bucket_milk",
	recipe = {
		{"foods:bottle_milk", "foods:bottle_milk", "foods:bottle_milk"},
		{"foods:bottle_milk", "bucket:bucket_empty", "foods:bottle_milk"},
		{"foods:bottle_milk", "foods:bottle_milk", "foods:bottle_milk"}
	},
	replacements = {
		{"foods:bottle_milk", "vessels:glass_bottle"},
		{"foods:bottle_milk", "vessels:glass_bottle"},
		{"foods:bottle_milk", "vessels:glass_bottle"},
		{"foods:bottle_milk", "vessels:glass_bottle"},
		{"foods:bottle_milk", "vessels:glass_bottle"},
		{"foods:bottle_milk", "vessels:glass_bottle"},
		{"foods:bottle_milk", "vessels:glass_bottle"},
		{"foods:bottle_milk", "vessels:glass_bottle"}
	}
})

core.register_node("foods:glass_milk", {
	description = "Glass of milk",
	drawtype = "plantlike",
	tiles = {"vessels_drinking_glass.png^[colorize:white:80"},
	inventory_image = "vessels_drinking_glass.png^[colorize:white:80",
	wield_image = "vessels_drinking_glass.png^[colorize:white:80",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	stack_max = 1,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
	},
	groups = {vessel = 1, dig_immediate = 3,attached_node = 1, not_in_creative_inventory = 0},
	sounds = default.node_sound_glass_defaults(),
	on_use = core.item_eat(1, "vessels:drinking_glass"),
})

core.register_node("foods:flask_milk", {
	description = "Flask of milk",
	drawtype = "plantlike",
	tiles = {"vessels_steel_bottle.png"},
	inventory_image = "vessels_steel_bottle.png",
	wield_image = "vessels_steel_bottle.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	stack_max = 12,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
	on_use = function(itemstack, user, pointd)
		local replace_with_item = "vessels:steel_bottle"
		if pointd.under  then
			local target = core.get_node(pointd.under)
			if target.name == "vessels:drinking_glass" then
				core.set_node(pointd.under, {name="foods:glass_milk"})
				if itemstack:take_item() ~= nil then
					if itemstack:is_empty() then
						itemstack:add_item(replace_with_item)
					else
						local inv = user:get_inventory()
						if inv:room_for_item("main", {name=replace_with_item}) then
							inv:add_item("main", replace_with_item)
						else
							local pos = user:getpos()
							pos.y = math.floor(pos.y + 0.5)
							core.add_item(pos, replace_with_item)
						end
					end
				end
			else
				core.do_item_eat(1, replace_with_item, itemstack, user, pointd)
			end
		else
			core.do_item_eat(1, replace_with_item, itemstack, user, pointd)
		end
		return itemstack
	end

})

for _,milk in ipairs(foods.milk) do
	core.register_craft({
		output = "foods:flask_milk 8",
		recipe = {
			{"vessels:steel_bottle", "vessels:steel_bottle", "vessels:steel_bottle"},
			{"vessels:steel_bottle", milk, "vessels:steel_bottle"},
			{"vessels:steel_bottle", "vessels:steel_bottle", "vessels:steel_bottle"}
		},
		replacements = foods.milk_replacements
	})
end

core.register_craft({
	output = "mobs:bucket_milk",
	recipe = {
		{"foods:flask_milk", "foods:flask_milk", "foods:flask_milk"},
		{"foods:flask_milk", "bucket:bucket_empty", "foods:flask_milk"},
		{"foods:flask_milk", "foods:flask_milk", "foods:flask_milk"}
	},
	replacements = {
		{"foods:flask_milk", "vessels:steel_bottle"},
		{"foods:flask_milk", "vessels:steel_bottle"},
		{"foods:flask_milk", "vessels:steel_bottle"},
		{"foods:flask_milk", "vessels:steel_bottle"},
		{"foods:flask_milk", "vessels:steel_bottle"},
		{"foods:flask_milk", "vessels:steel_bottle"},
		{"foods:flask_milk", "vessels:steel_bottle"},
		{"foods:flask_milk", "vessels:steel_bottle"}
	}
})
