
local S = core.get_translator("farming")

-- Sugar
core.register_craftitem("farming:sugar", {
	description = S("Sugar"),
	inventory_image = "farming_sugar.png",
	on_use = core.item_eat(1),
	groups = {sugar = 1, flammable = 2},
})

core.register_craft({
	type = "cooking",
	cooktime = 3,
	output = "farming:sugar 2",
	recipe = "default:reed",
	replacements = {{"default:reed", "farming:spent_biomasse"}}
})

core.register_craft({
	type = "cooking",
	cooktime = 3,
	output = "farming:sugar 6",
	recipe = "farming:sugar_beet",
	replacements = {{"farming:sugar_beet", "farming:spent_biomasse"}}
})

core.register_craft({
	type = "cooking",
	cooktime = 6,
	output = "farming:sugar 8",
	recipe = "default:papyrus",
	replacements = {{"default:papyrus", "farming:spent_biomasse"}}
})

-- Red Beet Sugar
core.register_craftitem("farming:red_beet_sugar", {
	description = S("Red Beet Sugar"),
	inventory_image = "farming_sugar.png^[colorize:red:50",
	on_use = core.item_eat(1),
	groups = {sugar = 1, flammable = 2},
})

core.register_craft({
	type = "cooking",
	cooktime = 3,
	output = "farming:red_beet_sugar 3",
	recipe = "farming:red_beet",
	replacements = {{"farming:red_beet", "farming:spent_biomasse"}}
})

-- Boiling waters
core.register_craftitem("farming:boiling_water", {
	description = S("Boiling Water Bucket"),
	inventory_image = "bucket_water.png^farming_boiling.png",
	stack_max = 1,
	groups = {boiling_water = 1},
})

core.register_craftitem("farming:boiling_fresh_water", {
	description = S("Boiling Fresh Water Bucket"),
	inventory_image = "bucket_fresh_water.png^farming_boiling.png",
	stack_max = 1,
	groups = {boiling_water = 1},
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:boiling_water",
	recipe = "bucket:bucket_water"
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:boiling_fresh_water",
	recipe = "bucket:bucket_fresh_water"
})

-- Salt
core.register_craftitem("farming:salt", {
	description = S("Salt"),
	inventory_image = "farming_salt.png",
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:salt 2",
	recipe = "farming:boiling_water",-- Should be with an empty bucket
	replacements = {{"farming:boiling_water", "bucket:bucket_fresh_water"}}
})

core.register_craft({
	output = 'farming:salt 5',
	recipe = {{'default:mangrove_leaves'}}
})

-- Cactus juice
core.register_craftitem("farming:cactus_juice", {
	description = S("Saguaro Cactus Juice"),
	inventory_image = "farming_cactus_juice.png",
	groups = {vessel = 1, drink = 1},
	on_use = function(itemstack, user, pointd)
		if user then
			if math.random(5) == 1 then
				return core.do_item_eat(-1, "vessels:drinking_glass", itemstack, user, pointd)
			else
				return core.do_item_eat(2, "vessels:drinking_glass", itemstack, user, pointd)
			end
		end
	end
})

core.register_craft({
	type = "shapeless",
	output = "farming:cactus_juice 4",
	recipe = {"vessels:drinking_glass", "vessels:drinking_glass", "vessels:drinking_glass",
		"vessels:drinking_glass", "default:cactus", "farming:mortar_pestle"},
	replacements = {
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:cactus", "default:stick 3"}
	}
})

-- Medicine
core.register_craftitem("farming:medicine", {
	description = S("Medicine"),
	inventory_image = "farming_medicine.png",
	on_use = core.item_eat(8, "vessels:glass_bottle"),
})

core.register_craft({
	output = "farming:medicine",
	recipe = {
		{"default:jungle_grass_1"},
		{"farming:dark_chocolate"},
		{"vessels:glass_bottle"},
	}
})
