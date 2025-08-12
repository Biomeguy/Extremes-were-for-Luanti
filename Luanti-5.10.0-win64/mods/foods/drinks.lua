
function foods.register_drink(defn)
	core.register_node("foods:"..defn.name, {
		description = defn.desc,
		inventory_image = "food_juice_"..defn.colour..".png^[noalpha",
		drawtype = "liquid",
		tiles = {
			{
				name = "food_juice_"..defn.colour.."_animated.png",
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 2.0,
				},
			},
		},
		special_tiles = {
			{
				name = "food_juice_"..defn.colour.."_animated.png",
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 2.0,
				},
				backface_culling = false,
			},
		},
		use_texture_alpha = "blend",
		paramtype = "light",
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		is_ground_content = false,
		drop = "",
		drowning = 1,
		liquidtype = "source",
		liquid_alternative_flowing = "foods:"..defn.name.."_flowing",
		liquid_alternative_source = "foods:"..defn.name,
		liquid_viscosity = 2,
		liquid_renewable = false,
		liquid_range = 1,
		post_effect_color = defn.colouring,
		groups = {liquid = 3, not_in_creative_inventory = 0},
	})

	core.register_node("foods:"..defn.name.."_flowing", {
		description = "Flowing "..defn.name,
		inventory_image = core.inventorycube("food_juice_"..defn.colour..".png"),
		drawtype = "flowingliquid",
		tiles = {"food_juice_"..defn.colour..".png"},
		special_tiles = {
			{
				name = "food_juice_"..defn.colour.."_flowing_animated.png",
				backface_culling = false,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 0.8,
				},
			},
			{
				name = "food_juice_"..defn.colour.."_flowing_animated.png",
				backface_culling = true,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 0.8,
				},
			},
		},
		use_texture_alpha = "blend",
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
		liquid_alternative_flowing = "foods:"..defn.name.."_flowing",
		liquid_alternative_source = "foods:"..defn.name,
		liquid_viscosity = 1,
		liquid_renewable = false,
		liquid_range = 2,
		post_effect_color = defn.colouring,
		groups = {liquid = 3, not_in_creative_inventory = 0},
	})
end


foods.register_drink({
	name = "blackberry",
	desc = "Blackberry juice",
	colour = "purple",
	colouring = {a = 120, r = 90, g = 30, b = 90},
	flavour = "farming:blackberries",
	nutrition = 2,
	groups = {},
})

foods.register_drink({
	name = "apple",
	desc = "Apple juice",
	colour = "rose",
	colouring = {a = 120, r = 90, g = 60, b = 60},
	flavour = "default:apple",
	nutrition = 2,
	groups = {},
})

foods.register_drink({
	name = "cider",
	desc = "Cider",
	colour = "rose",
	colouring = {a = 120, r = 90, g = 60, b = 60},
	flavour = "none",
	nutrition = 1,
	groups = {},
})

foods.register_drink({
	name = "orange",
	desc = "Orange juice",
	colour = "orange",
	colouring = {a = 120, r = 90, g = 75, b = 30},
	flavour = "default:orange",
	nutrition = 2,
	groups = {},
})

foods.register_drink({
	name = "barley_water",
	desc = "Barley water",
	colour = "lemon",
	colouring = {a = 120, r = 120, g = 120, b = 60},
	flavour = "group:grain",
	nutrition = 0,
	groups = {},
})

foods.register_drink({
	name = "beer",
	desc = "Beer",
	colour = "lemon",
	colouring = {a = 120, r = 120, g = 120, b = 60},
	flavour = "none",
	nutrition = 2,
	groups = {},
})

foods.register_drink({
	name = "red_beet",
	desc = "Red Beet juice",
	colour = "red",
	colouring = {a = 120, r = 90, g = 30, b = 30},
	flavour = "farming:red_beet",
	nutrition = 3,
	groups = {},
})

foods.register_drink({
	name = "carrot",
	desc = "Carrot juice",
	colour = "orange",
	colouring = {a = 120, r = 90, g = 75, b = 30},
	flavour = "farming:carrot",
	nutrition = 2,
	groups = {},
})

core.register_node("foods:bottle_water", {
	description = "Bottle of water",
	drawtype = "plantlike",
	tiles = {"foods_cane_syrup.png^[colorize:blue:80"},
	inventory_image = "foods_cane_syrup.png^[colorize:blue:80",
	wield_image = "foods_cane_syrup.png^[colorize:blue:80",
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
		if pointd.under then
			local target = core.get_node(pointd.under)
			if target.name == "vessels:drinking_glass" then
				core.set_node(pointd.under, {name="foods:glass_water"})
				if itemstack:take_item() ~= nil then
					if itemstack:is_empty() then
						itemstack:add_item(replace_with_item)
					else
						local inv = user:get_inventory()
						if inv:room_for_item("main", {name=replace_with_item}) then
							inv:add_item("main", replace_with_item)
						else
							local pos = user:get_pos()
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

for _,water in ipairs(foods.water) do
	core.register_craft({
		output = "foods:bottle_water 8",
		recipe = {
			{"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"},
			{"vessels:glass_bottle", water, "vessels:glass_bottle"},
			{"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"}
		},
		replacements = foods.water_replacements
	})
end

core.register_craft({
	output = "bucket:bucket_water",
	recipe = {
		{"foods:bottle_water", "foods:bottle_water", "foods:bottle_water"},
		{"foods:bottle_water", "bucket:bucket_empty", "foods:bottle_water"},
		{"foods:bottle_water", "foods:bottle_water", "foods:bottle_water"}
	},
	replacements = {
		{"foods:bottle_water", "vessels:glass_bottle"},
		{"foods:bottle_water", "vessels:glass_bottle"},
		{"foods:bottle_water", "vessels:glass_bottle"},
		{"foods:bottle_water", "vessels:glass_bottle"},
		{"foods:bottle_water", "vessels:glass_bottle"},
		{"foods:bottle_water", "vessels:glass_bottle"},
		{"foods:bottle_water", "vessels:glass_bottle"},
		{"foods:bottle_water", "vessels:glass_bottle"}
	}
})

core.register_node("foods:glass_water", {
	description = "Glass of water",
	drawtype = "plantlike",
	tiles = {"vessels_drinking_glass.png^[colorize:blue:80"},
	inventory_image = "vessels_drinking_glass.png^[colorize:blue:80",
	wield_image = "vessels_drinking_glass.png^[colorize:blue:80",
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

core.register_node("foods:flask_water", {
	description = "Flask of water",
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
		if pointd.under then
			local target = core.get_node(pointd.under)
			if target.name == "vessels:drinking_glass" then
				core.set_node(pointd.under, {name="foods:glass_water"})
				if itemstack:take_item() ~= nil then
					if itemstack:is_empty() then
						itemstack:add_item(replace_with_item)
					else
						local inv = user:get_inventory()
						if inv:room_for_item("main", {name=replace_with_item}) then
							inv:add_item("main", replace_with_item)
						else
							local pos = user:get_pos()
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

for _,water in ipairs(foods.water) do
	core.register_craft({
		output = "foods:flask_water 8",
		recipe = {
			{"vessels:steel_bottle", "vessels:steel_bottle", "vessels:steel_bottle"},
			{"vessels:steel_bottle", water, "vessels:steel_bottle"},
			{"vessels:steel_bottle", "vessels:steel_bottle", "vessels:steel_bottle"}
		},
		replacements = foods.water_replacements
	})
end

core.register_craft({
	output = "bucket:bucket_water",
	recipe = {
		{"foods:flask_water", "foods:flask_water", "foods:flask_water"},
		{"foods:flask_water", "bucket:bucket_empty", "foods:flask_water"},
		{"foods:flask_water", "foods:flask_water", "foods:flask_water"}
	},
	replacements = {
		{"foods:flask_water", "vessels:steel_bottle"},
		{"foods:flask_water", "vessels:steel_bottle"},
		{"foods:flask_water", "vessels:steel_bottle"},
		{"foods:flask_water", "vessels:steel_bottle"},
		{"foods:flask_water", "vessels:steel_bottle"},
		{"foods:flask_water", "vessels:steel_bottle"},
		{"foods:flask_water", "vessels:steel_bottle"},
		{"foods:flask_water", "vessels:steel_bottle"}
	}
})
