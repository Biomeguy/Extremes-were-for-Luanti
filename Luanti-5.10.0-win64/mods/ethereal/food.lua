
local S = ethereal.intllib

-- Banana
core.register_craftitem("ethereal:banana", {
	description = S("Banana"),
	inventory_image = "banana_single.png",
	groups = {flammable = 2},
	on_use = core.item_eat(2, "farming:spent_biomasse")
})

-- Banana Dough
core.register_craftitem("ethereal:banana_dough", {
	description = S("Banana Dough"),
	inventory_image = "banana_dough.png"
})

-- Banana Loaf
core.register_craftitem("ethereal:banana_bread", {
	description = S("Banana Loaf"),
	inventory_image = "banana_bread.png",
	groups = {bread = 1, flammable = 2},
	on_use = core.item_eat(6)
})

core.register_craft({
	type = "shapeless",
	output = "ethereal:banana_dough 2",
	recipe = {"group:dough", "ethereal:banana", "ethereal:banana"},
	replacements = {
		{"ethereal:banana", "farming:spent_biomasse"},
		{"ethereal:banana", "farming:spent_biomasse"}
	}
})

core.register_craft({
	type = "cooking",
	cooktime = 14,
	output = "ethereal:banana_bread",
	recipe = "ethereal:banana_dough"
})

-- Golden Apple
core.register_node("ethereal:golden_apple", {
	description = S("Golden Apple"),
	drawtype = "plantlike",
	tiles = {"golden_apple.png"},
	inventory_image = "golden_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.37, -.2, .2, .31, .2}
	},
	groups = {fleshy = 3, dig_immediate = 3, leafdecay = 3, leafdecay_drop = 1},
--	on_use = core.item_eat(20),
	on_use = function(itemstack, user, pointd)
		if user then
			user:set_hp(20)
			return core.do_item_eat(2, "farming:spent_biomasse", itemstack, user, pointd)
		end
	end,
	sounds = default.node_sound_fruits_defaults(),
	after_place_node = default.after_place_leaves,

	after_dig_node = function(pos, oldnode)
		if oldnode.param2 == 0 then
			pos.y = pos.y+1
			if core.get_node(pos).name == "ethereal:yellowleaves" and core.get_node(pos).param2 == 0 then
				pos.y = pos.y-1
				core.set_node(pos, {name = "ethereal:golden_apple_mark"})
				local f = core.find_node_near(pos, 1, "ethereal:yellow_trunk")
				if f then
					core.get_node_timer(f):start(math.random(300, 1500))
				end
			end
		end
	end
})

-- Hearty Stew (thanks to ZonerDarkRevention for his DokuCraft DeviantArt bowl texture)
core.register_craftitem("ethereal:hearty_stew", {
	description = S("Hearty Stew"),
	inventory_image = "hearty_stew.png",
	groups = {flammable = 1},
	on_use = core.item_eat(10, "vessels:wood_bowl")
})

core.register_craft({
	output = "ethereal:hearty_stew",
	recipe = {
		{"farming:onion", "flowers:mushroom_brown", "group:tuber"},
		{"", "flowers:mushroom_brown", ""},
		{"", "vessels:wood_bowl", ""}
	},
	replacements = {{"farming:onion", "farming:spent_biomasse"}}
})

core.register_craft({
	output = "ethereal:hearty_stew",
	recipe = {
		{"farming:onion", "flowers:mushroom_brown", "group:beans"},
		{"", "flowers:mushroom_brown", ""},
		{"", "vessels:wood_bowl", ""}
	},
	replacements = {{"farming:onion", "farming:spent_biomasse"}}
})

-- Bucket of Cactus Pulp
core.register_craftitem("ethereal:bucket_cactus", {
	description = S("Bucket of Saguaro Cactus Pulp"),
	inventory_image = "bucket_cactus.png",
	stack_max = 1,
	groups = {drink = 1},
	on_use = function(itemstack, user, pointd)
		if user then
			if math.random(5) == 1 then
				return core.do_item_eat(-1, "bucket:bucket_empty", itemstack, user, pointd)
			else
				return core.do_item_eat(2, "bucket:bucket_empty", itemstack, user, pointd)
			end
		end
	end
})

core.register_craft({
	type = "shapeless",
	output = "ethereal:bucket_cactus",
	recipe = {"bucket:bucket_empty", "default:cactus", "group:grinder"},
	replacements = {
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"},
		{"default:cactus", "default:stick 3"}
	}
})

-- firethorn jelly
core.register_craftitem("ethereal:firethorn_jelly", {
	description = S("Firethorn Jelly"),
	inventory_image = "ethereal_firethorn_jelly.png",
	wield_image = "ethereal_firethorn_jelly.png",
	groups = {vessel = 1},
	on_use = core.item_eat(2, "vessels:glass_bottle")
})

core.register_craft({
	type = "shapeless",
	output = "ethereal:firethorn_jelly",
	recipe = {"farming:mortar_pestle", "vessels:glass_bottle",
		"ethereal:firethorn", "ethereal:firethorn", "ethereal:firethorn",
		"bucket:bucket_water", "bucket:bucket_water", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty 3"},
		{"ethereal:firethorn", "farming:spent_biomasse"},
		{"ethereal:firethorn", "farming:spent_biomasse"},
		{"ethereal:firethorn", "farming:spent_biomasse"},
		{"farming:mortar_pestle", "farming:mortar_pestle"}
	}
})

-- Candied Lemon
core.register_craftitem("ethereal:candied_lemon", {
	description = S("Candied Lemon"),
	inventory_image = "ethereal_candied_lemon.png",
	wield_image = "ethereal_candied_lemon.png",
	groups = {candied_lemon = 1},
	on_use = core.item_eat(5),
})

core.register_craft({
	type = "shapeless",
	output = "ethereal:candied_lemon",
	recipe = {"farming:baking_tray", "farming:lemon", "group:sugar"},
	replacements = {{"farming:baking_tray", "farming:baking_tray"}}
})

-- Lemonade
core.register_node("ethereal:lemonade", {
	description = S("Lemonade"),
	drawtype = "plantlike",
	tiles = {"ethereal_lemonade.png"},
	inventory_image = "ethereal_lemonade.png",
	wield_image = "ethereal_lemonade.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, drink = 1},
	on_use = core.item_eat(5, "vessels:drinking_glass"),
	sounds = default.node_sound_glass_defaults()
})

core.register_craft({
	type = "shapeless",
	output = "ethereal:lemonade",
	recipe = {"farming:lemon", "group:sugar", "group:sugar",
		"vessels:drinking_glass", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})
