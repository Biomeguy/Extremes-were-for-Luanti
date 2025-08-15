local part_count = 4

local level = 35
local heal = 20
local fire = 4
local radiation = 50

if core.get_modpath("shields") then
	level = level / 0.9
end

if part_count == #armor.elements then
	level = level / 1.1
end

level = math.floor(level / part_count)
heal = math.floor(heal / part_count)
fire = math.floor(fire / part_count)
radiation = math.floor(radiation / part_count)

core.register_craftitem("hazmat_suit:helmet_hazmat", {
	description = "Hazmat Helmet",
	inventory_image = "hazmat_suit_inv_helmet_hazmat.png",
	stack_max = 1,
})

core.register_craftitem("hazmat_suit:chestplate_hazmat", {
	description = "Hazmat Chestplate",
	inventory_image = "hazmat_suit_inv_chestplate_hazmat.png",
	stack_max = 1,
})

core.register_craftitem("hazmat_suit:sleeve_hazmat", {
	description = "Hazmat Sleeve",
	inventory_image = "hazmat_suit_inv_sleeve_hazmat.png",
	stack_max = 1,
})

core.register_craftitem("hazmat_suit:leggings_hazmat", {
	description = "Hazmat Leggins",
	inventory_image = "hazmat_suit_inv_leggings_hazmat.png",
	stack_max = 1,
})

core.register_craftitem("hazmat_suit:boots_hazmat", {
	description = "Hazmat Boots",
	inventory_image = "hazmat_suit_inv_boots_hazmat.png",
	stack_max = 1,
})

core.register_tool("hazmat_suit:suit_hazmat", {
	description = "Hazmat Suit",
	inventory_image = "hazmat_suit_inv_suit_hazmat.png",
	groups = {
		armor_head = 1,
		armor_torso = 1,
		armor_legs = 1,
		armor_feet = 1,
		armor_heal = heal,
		armor_use = 1000,
		armor_fire = fire,
		armor_water = 1,
		armor_radiation = radiation,
	},
	armor_groups = {fleshy=level},
	damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
})

core.register_craft({
	output = "hazmat_suit:helmet_hazmat",
	recipe = {
		{"", "default:stainless_steel_ingot", ""},
		{"default:stainless_steel_ingot", "default:glass", "default:stainless_steel_ingot"},
		{"technic:rubber", "technic:rubber", "technic:rubber"}
	}
})

core.register_craft({
	output = "hazmat_suit:chestplate_hazmat",
	recipe = {
		{"technic:lead_ingot", "dye:yellow", "technic:lead_ingot"},
		{"default:stainless_steel_ingot", "technic:lead_ingot", "default:stainless_steel_ingot"},
		{"technic:lead_ingot", "default:stainless_steel_ingot", "technic:lead_ingot"}
	}
})

core.register_craft({
	output = "hazmat_suit:sleeve_hazmat",
	recipe = {
		{"technic:rubber", "dye:yellow"},
		{"", "default:stainless_steel_ingot"},
		{"", "technic:rubber"}
	}
})

core.register_craft({
	output = "hazmat_suit:leggings_hazmat",
	recipe = {
		{"technic:rubber", "technic:lead_ingot", "technic:rubber"},
		{"default:stainless_steel_ingot", "technic:rubber", "default:stainless_steel_ingot"},
		{"technic:lead_ingot", "", "technic:lead_ingot"}
	}
})

core.register_craft({
	output = "hazmat_suit:boots_hazmat",
	recipe = {
		{"technic:rubber", "", "technic:rubber"},
		{"default:stainless_steel_ingot", "", "default:stainless_steel_ingot"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "hazmat_suit:suit_hazmat",
	recipe = {"hazmat_suit:helmet_hazmat", "hazmat_suit:chestplate_hazmat", "hazmat_suit:leggings_hazmat",
		"hazmat_suit:boots_hazmat", "hazmat_suit:sleeve_hazmat", "hazmat_suit:sleeve_hazmat"}
})
