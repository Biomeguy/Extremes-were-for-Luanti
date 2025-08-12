core.register_craftitem(":3d_armor:soap", {
	description = "Soap (for washing a dye out of a piece of dyed armor)",
	inventory_image = "3d_armor_soap.png",
	groups = {flammable = 2},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:soap 5",
	recipe = {"default:beech_leaves", "dye:white"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather",
	recipe = {"group:leather_helmet", "3d_armor:soap"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather",
	recipe = {"group:leather_leggings", "3d_armor:soap"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather",
	recipe = {"group:leather_chestplate", "3d_armor:soap"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather",
	recipe = {"group:leather_boots", "3d_armor:soap"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather",
	recipe = {"group:leather_shield", "3d_armor:soap"},
})

core.register_tool(":3d_armor:helmet_leather", {
	description = "Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather.png",
	groups = {armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather", {
	description = "Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather.png",
	groups = {armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather", {
	description = "Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather.png",
	groups = {armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather", {
	description = "Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather.png",
	groups = {armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather", {
	description = "Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather.png",
	groups = {armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

local L = "leather"
local M = "mobs:"..L
core.register_craft({
	output = "3d_armor:helmet_"..L,
	recipe = {
		{M, M, M},
		{M, "", M}
	}
})
core.register_craft({
	output = "3d_armor:chestplate_"..L,
	recipe = {
		{M, "", M},
		{M, M, M},
		{M, M, M}
	}
})
core.register_craft({
	output = "3d_armor:leggings_"..L,
	recipe = {
		{M, M, M},
		{M, "", M},
		{M, "", M}
	}
})
core.register_craft({
	output = "3d_armor:boots_"..L,
	recipe = {
		{M, "", M},
		{M, "", M}
	}
})
core.register_craft({
	output = "3d_armor:shield_"..L,
	recipe = {
		{M, M, M},
		{M, 'default:wood', M},
		{"", M, ""}
	}
})

core.register_tool(":3d_armor:helmet_studded", {
	description = "Studded Helmet",
	inventory_image = "3d_armor_inv_helmet_studded.png",
	groups = {armor_head=12.4, armor_heal=2, armor_use=400},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_studded", {
	description = "Studded Chestplate",
	inventory_image = "3d_armor_inv_chestplate_studded.png",
	groups = {armor_torso=16.4, armor_heal=2, armor_use=400},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_studded", {
	description = "Studded Leggings",
	inventory_image = "3d_armor_inv_leggings_studded.png",
	groups = {armor_legs=16.4, armor_heal=2, armor_use=400},
	wear = 0,
})

core.register_tool(":3d_armor:boots_studded", {
	description = "Studded Boots",
	inventory_image = "3d_armor_inv_boots_studded.png",
	groups = {armor_feet=12.4, armor_heal=2, armor_use=400},
	wear = 0,
})

core.register_tool(":3d_armor:shield_studded", {
	description = "Studded Shield",
	inventory_image = "3d_armor_inv_shield_studded.png",
	groups = {armor_shield=12.4, armor_heal=2, armor_use=400},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_studded",
	recipe = {"3d_armor:helmet_chainmail", "3d_armor:helmet_leather"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_studded",
	recipe = {"3d_armor:chestplate_chainmail", "3d_armor:chestplate_leather"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_studded",
	recipe = {"3d_armor:leggings_chainmail", "3d_armor:leggings_leather"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_studded",
	recipe = {"3d_armor:boots_chainmail", "3d_armor:boots_leather"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_studded",
	recipe = {"shields:shield_chainmail", "3d_armor:shield_leather"},
})

core.register_tool(":3d_armor:helmet_leather_green", {
	description = "Green Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_green.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_green", {
	description = "Green Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_green.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_green", {
	description = "Green Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_green.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_green", {
	description = "Green Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_green.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_green", {
	description = "Green Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_green.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_green",
	recipe = {"3d_armor:helmet_leather", "dye:green"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_green",
	recipe = {"3d_armor:chestplate_leather", "dye:green"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_green",
	recipe = {"3d_armor:leggings_leather", "dye:green"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_green",
	recipe = {"3d_armor:boots_leather", "dye:green"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_green",
	recipe = {"3d_armor:shield_leather", "dye:green"},
})

core.register_tool(":3d_armor:helmet_leather_blue", {
	description = "Blue Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_blue.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_blue", {
	description = "Blue Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_blue.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_blue", {
	description = "Blue Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_blue.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_blue", {
	description = "Blue Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_blue.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_blue", {
	description = "Blue Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_blue.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_blue",
	recipe = {"3d_armor:helmet_leather", "dye:blue"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_blue",
	recipe = {"3d_armor:chestplate_leather", "dye:blue"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_blue",
	recipe = {"3d_armor:leggings_leather", "dye:blue"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_blue",
	recipe = {"3d_armor:boots_leather", "dye:blue"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_blue",
	recipe = {"3d_armor:shield_leather", "dye:blue"},
})

core.register_tool(":3d_armor:helmet_leather_red", {
	description = "Red Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_red.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_red", {
	description = "Red Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_red.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_red", {
	description = "Red Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_red.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_red", {
	description = "Red Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_red.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_red", {
	description = "Red Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_red.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_red",
	recipe = {"3d_armor:helmet_leather", "dye:red"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_red",
	recipe = {"3d_armor:chestplate_leather", "dye:red"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_red",
	recipe = {"3d_armor:leggings_leather", "dye:red"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_red",
	recipe = {"3d_armor:boots_leather", "dye:red"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_red",
	recipe = {"3d_armor:shield_leather", "dye:red"},
})

core.register_tool(":3d_armor:helmet_leather_yellow", {
	description = "Yellow Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_yellow.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_yellow", {
	description = "Yellow Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_yellow.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_yellow", {
	description = "Yellow Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_yellow.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_yellow", {
	description = "Yellow Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_yellow.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_yellow", {
	description = "Yellow Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_yellow.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_yellow",
	recipe = {"3d_armor:helmet_leather", "dye:yellow"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_yellow",
	recipe = {"3d_armor:chestplate_leather", "dye:yellow"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_yellow",
	recipe = {"3d_armor:leggings_leather", "dye:yellow"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_yellow",
	recipe = {"3d_armor:boots_leather", "dye:yellow"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_yellow",
	recipe = {"3d_armor:shield_leather", "dye:yellow"},
})

core.register_tool(":3d_armor:helmet_leather_white", {
	description = "White Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_white.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_white", {
	description = "White Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_white.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_white", {
	description = "White Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_white.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_white", {
	description = "White Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_white.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_white", {
	description = "White Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_white.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_white",
	recipe = {"3d_armor:helmet_leather", "dye:white"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_white",
	recipe = {"3d_armor:chestplate_leather", "dye:white"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_white",
	recipe = {"3d_armor:leggings_leather", "dye:white"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_white",
	recipe = {"3d_armor:boots_leather", "dye:white"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_white",
	recipe = {"3d_armor:shield_leather", "dye:white"},
})

core.register_tool(":3d_armor:helmet_leather_black", {
	description = "Black Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_black.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_black", {
	description = "Black Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_black.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_black", {
	description = "Black Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_black.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_black", {
	description = "Black Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_black.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_black", {
	description = "Black Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_black.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_black",
	recipe = {"3d_armor:helmet_leather", "dye:black"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_black",
	recipe = {"3d_armor:chestplate_leather", "dye:black"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_black",
	recipe = {"3d_armor:leggings_leather", "dye:black"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_black",
	recipe = {"3d_armor:boots_leather", "dye:black"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_black",
	recipe = {"3d_armor:shield_leather", "dye:black"},
})

core.register_tool(":3d_armor:helmet_leather_grey", {
	description = "Grey Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_grey.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_grey", {
	description = "Grey Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_grey.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_grey", {
	description = "Grey Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_grey.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_grey", {
	description = "Grey Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_grey.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_grey", {
	description = "Grey Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_grey.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_grey",
	recipe = {"3d_armor:helmet_leather", "dye:grey"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_grey",
	recipe = {"3d_armor:chestplate_leather", "dye:grey"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_grey",
	recipe = {"3d_armor:leggings_leather", "dye:grey"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_grey",
	recipe = {"3d_armor:boots_leather", "dye:grey"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_grey",
	recipe = {"3d_armor:shield_leather", "dye:grey"},
})

core.register_tool(":3d_armor:helmet_leather_orange", {
	description = "Orange Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_orange.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_orange", {
	description = "Orange Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_orange.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_orange", {
	description = "Orange Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_orange.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_orange", {
	description = "Orange Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_orange.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_orange", {
	description = "Orange Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_orange.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_orange",
	recipe = {"3d_armor:helmet_leather", "dye:orange"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_orange",
	recipe = {"3d_armor:chestplate_leather", "dye:orange"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_orange",
	recipe = {"3d_armor:leggings_leather", "dye:orange"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_orange",
	recipe = {"3d_armor:boots_leather", "dye:orange"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_orange",
	recipe = {"3d_armor:shield_leather", "dye:orange"},
})

core.register_tool(":3d_armor:helmet_leather_dark_grey", {
	description = "Dark Grey Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_dark_grey.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_dark_grey", {
	description = "Dark Grey Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_dark_grey.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_dark_grey", {
	description = "Dark Grey Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_dark_grey.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_dark_grey", {
	description = "Dark Grey Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_dark_grey.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_dark_grey", {
	description = "Dark Grey Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_dark_grey.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_dark_grey",
	recipe = {"3d_armor:helmet_leather", "dye:dark_grey"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_dark_grey",
	recipe = {"3d_armor:chestplate_leather", "dye:dark_grey"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_dark_grey",
	recipe = {"3d_armor:leggings_leather", "dye:dark_grey"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_dark_grey",
	recipe = {"3d_armor:boots_leather", "dye:dark_grey"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_dark_grey",
	recipe = {"3d_armor:shield_leather", "dye:dark_grey"},
})

core.register_tool(":3d_armor:helmet_leather_dark_green", {
	description = "Dark Green Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_dark_green.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_dark_green", {
	description = "Dark Green Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_dark_green.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_dark_green", {
	description = "Dark Green Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_dark_green.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_dark_green", {
	description = "Dark Green Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_dark_green.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_dark_green", {
	description = "Dark Green Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_dark_green.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_dark_green",
	recipe = {"3d_armor:helmet_leather", "dye:dark_green"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_dark_green",
	recipe = {"3d_armor:chestplate_leather", "dye:dark_green"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_dark_green",
	recipe = {"3d_armor:leggings_leather", "dye:dark_green"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_dark_green",
	recipe = {"3d_armor:boots_leather", "dye:dark_green"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_dark_green",
	recipe = {"3d_armor:shield_leather", "dye:dark_green"},
})

core.register_tool(":3d_armor:helmet_leather_cyan", {
	description = "Cyan Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_cyan.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_cyan", {
	description = "Cyan Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_cyan.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_cyan", {
	description = "Cyan Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_cyan.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_cyan", {
	description = "Cyan Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_cyan.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_cyan", {
	description = "Cyan Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_cyan.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_cyan",
	recipe = {"3d_armor:helmet_leather", "dye:cyan"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_cyan",
	recipe = {"3d_armor:chestplate_leather", "dye:cyan"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_cyan",
	recipe = {"3d_armor:leggings_leather", "dye:cyan"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_cyan",
	recipe = {"3d_armor:boots_leather", "dye:cyan"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_cyan",
	recipe = {"3d_armor:shield_leather", "dye:cyan"},
})

core.register_tool(":3d_armor:helmet_leather_pink", {
	description = "Pink Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_pink.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_pink", {
	description = "Pink Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_pink.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_pink", {
	description = "Pink Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_pink.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_pink", {
	description = "Pink Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_pink.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_pink", {
	description = "Pink Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_pink.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_pink",
	recipe = {"3d_armor:helmet_leather", "dye:pink"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_pink",
	recipe = {"3d_armor:chestplate_leather", "dye:pink"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_pink",
	recipe = {"3d_armor:leggings_leather", "dye:pink"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_pink",
	recipe = {"3d_armor:boots_leather", "dye:pink"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_pink",
	recipe = {"3d_armor:shield_leather", "dye:pink"},
})

core.register_tool(":3d_armor:helmet_leather_magenta", {
	description = "Magenta Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_magenta.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_magenta", {
	description = "Magenta Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_magenta.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_magenta", {
	description = "Magenta Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_magenta.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_magenta", {
	description = "Magenta Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_magenta.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_magenta", {
	description = "Magenta Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_magenta.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_magenta",
	recipe = {"3d_armor:helmet_leather", "dye:magenta"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_magenta",
	recipe = {"3d_armor:chestplate_leather", "dye:magenta"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_magenta",
	recipe = {"3d_armor:leggings_leather", "dye:magenta"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_magenta",
	recipe = {"3d_armor:boots_leather", "dye:magenta"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_magenta",
	recipe = {"3d_armor:shield_leather", "dye:magenta"},
})

core.register_tool(":3d_armor:helmet_leather_violet", {
	description = "Violet Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_violet.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_violet", {
	description = "Violet Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_violet.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_violet", {
	description = "Violet Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_violet.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_violet", {
	description = "Violet Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_violet.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_violet", {
	description = "Violet Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_violet.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_violet",
	recipe = {"3d_armor:helmet_leather", "dye:violet"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_violet",
	recipe = {"3d_armor:chestplate_leather", "dye:violet"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_violet",
	recipe = {"3d_armor:leggings_leather", "dye:violet"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_violet",
	recipe = {"3d_armor:boots_leather", "dye:violet"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_violet",
	recipe = {"3d_armor:shield_leather", "dye:violet"},
})

core.register_tool(":3d_armor:helmet_leather_brown", {
	description = "Brown Leather Cap",
	inventory_image = "3d_armor_inv_helmet_leather_brown.png",
	groups = {leather_helmet=1, armor_head=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:chestplate_leather_brown", {
	description = "Brown Leather Tunic",
	inventory_image = "3d_armor_inv_chestplate_leather_brown.png",
	groups = {leather_chestplate=1, armor_torso=12, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:leggings_leather_brown", {
	description = "Brown Leather Trousers",
	inventory_image = "3d_armor_inv_leggings_leather_brown.png",
	groups = {leather_leggings=1, armor_legs=7, armor_heal=2, armor_use=150},
	wear = 0,
})

core.register_tool(":3d_armor:boots_leather_brown", {
	description = "Brown Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather_brown.png",
	groups = {leather_boots=1, armor_feet=7, armor_heal=2, physics_speed=0.15, armor_use=1000},
	wear = 0,
})

core.register_tool(":3d_armor:shield_leather_brown", {
	description = "Brown Leather Shield",
	inventory_image = "3d_armor_inv_shield_leather_brown.png",
	groups = {leather_shield=1, armor_shield=7, armor_heal=2, armor_use=1000},
	wear = 0,
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:helmet_leather_brown",
	recipe = {"3d_armor:helmet_leather", "dye:brown"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:chestplate_leather_brown",
	recipe = {"3d_armor:chestplate_leather", "dye:brown"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:leggings_leather_brown",
	recipe = {"3d_armor:leggings_leather", "dye:brown"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:boots_leather_brown",
	recipe = {"3d_armor:boots_leather", "dye:brown"},
})

core.register_craft({
	type = "shapeless",
	output = "3d_armor:shield_leather_brown",
	recipe = {"3d_armor:shield_leather", "dye:brown"},
})
