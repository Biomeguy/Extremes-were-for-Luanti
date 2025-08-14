--Extreme Survival created by Maikerumine
-- Luanti mod: "Extreme Survival"
-- namespace: es
--https://github.com/maikerumine


if core.get_modpath("3d_armor") then

-- Alien hide
core.register_tool("es:chestplate_alienhide", {
	description = "Alien Hide Coat",
	inventory_image = "es_inv_chestplate_alienhide.png",
	groups = {armor_torso = 37, armor_legs = 37, armor_heal = 8, armor_use = 100},
	wear = 0,
})

-- Emerald set
core.register_tool("es:helmet_emerald", {
	description = "Emerald Helmet",
	inventory_image = "es_inv_helmet_emerald.png",
	groups = {armor_head = 15, armor_heal = 12, armor_use = 100},
	wear = 0,
})

core.register_tool("es:chestplate_emerald", {
	description = "Emerald Chestplate",
	inventory_image = "es_inv_chestplate_emerald.png",
	groups = {armor_torso = 20, armor_heal = 12, armor_use = 100},
	wear = 0,
})

core.register_tool("es:leggings_emerald", {
	description = "Emerald Leggings",
	inventory_image = "es_inv_leggings_emerald.png",
	groups = {armor_legs = 20, armor_heal = 12, armor_use = 100},
	wear = 0,
})

core.register_tool("es:boots_emerald", {
	description = "Emerald Boots",
	inventory_image = "es_inv_boots_emerald.png",
	groups = {armor_feet = 15, armor_heal = 12, armor_use = 100},
	wear = 0,
})

core.register_tool("es:shield_emerald", {
	description = "Emerald Shield",
	inventory_image = "es_inv_shield_emerald.png",
	groups = {armor_shield=14, armor_heal=12, armor_use=52},
	wear = 0,
})

-- Aikerum set
core.register_tool("es:helmet_aikerum", {
	description = "Aikerum Helmet",
	inventory_image = "es_inv_helmet_aikerum.png",
	groups = {armor_head = 17, armor_heal = 17, armor_use = 120},
	wear = 0,
})

core.register_tool("es:chestplate_aikerum", {
	description = "Aikerum Chestplate",
	inventory_image = "es_inv_chestplate_aikerum.png",
	groups = {armor_torso = 35, armor_heal = 13, armor_use = 125},
	wear = 0,
})

core.register_tool("es:leggings_aikerum", {
	description = "Aikerum Leggings",
	inventory_image = "es_inv_leggings_aikerum.png",
	groups = {armor_legs = 34, armor_heal = 13, armor_use = 125},
	wear = 0,
})

core.register_tool("es:boots_aikerum", {
	description = "Aikerum Boots",
	inventory_image = "es_inv_boots_aikerum.png",
	groups = {armor_feet = 20, armor_heal = 13, armor_use = 130},
	wear = 0,
})

core.register_tool("es:shield_aikerum", {-- Don't change these shields
	description = "Aikerum Shield",
	inventory_image = "es_inv_shield_aikerum.png",
	groups = {armor_shield=16, armor_heal=12, armor_use=56},
	wear = 0,
})

-- Infinium set
core.register_tool("es:helmet_infinium", {
	description = "Infinium Helmet",
	inventory_image = "es_inv_helmet_infinium.png",
	groups = {armor_head = 20, armor_heal = 15, armor_use = 150},
	wear = 0,
})

core.register_tool("es:chestplate_infinium", {
	description = "Infinium Chestplate",
	inventory_image = "es_inv_chestplate_infinium.png",
	groups = {armor_torso = 50, armor_heal = 15, armor_use = 150},
	wear = 0,
})

core.register_tool("es:leggings_infinium", {
	description = "Infinium Leggings",
	inventory_image = "es_inv_leggings_infinium.png",
	groups = {armor_legs = 50, armor_heal = 15, armor_use = 150},
	wear = 0,
})

core.register_tool("es:boots_infinium", {
	description = "Infinium Boots",
	inventory_image = "es_inv_boots_infinium.png",
	groups = {armor_feet = 30, armor_heal = 15, armor_use = 150},
	wear = 0,
})

core.register_tool("es:shield_infinium", {
	description = "Infinium Shield",
	inventory_image = "es_inv_shield_infinium.png",
	groups = {armor_shield=17, armor_heal=12, armor_use=59},
	wear = 0,
})

-- Register crafting recipes:

core.register_craft({
	output = "es:chestplate_alienhide",
	recipe = {
		{"es:alien_skin", "", "es:alien_skin"},
		{"es:alien_skin", "es:alien_skin", "es:alien_skin"},
		{"es:alien_skin", "es:alien_skin", "es:alien_skin"}
	}
})

local es_ingreds = {

	emerald = "gems:emerald",
	aikerum = "es:aikerum_crystal",
	infinium = "es:infinium_ingot",
}

for k, v in pairs(es_ingreds) do
	core.register_craft({
		output = "es:helmet_".. k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{"", "", ""}
		}
	})
	core.register_craft({
		output = "es:chestplate_".. k,
		recipe = {
			{v, "", v},
			{v, v, v},
			{v, v, v}
		}
	})
	core.register_craft({
		output = "es:leggings_".. k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{v, "", v}
		}
	})
	core.register_craft({
		output = "es:boots_".. k,
		recipe = {
			{v, "", v},
			{v, "", v}
		}
	})
if core.get_modpath("shields") then
	core.register_craft({
		output = "es:shield_".. k,
		recipe = {
			{v, v, v},
			{v, v, v},
			{"", v, ""}
		}
	})
end
end
end
