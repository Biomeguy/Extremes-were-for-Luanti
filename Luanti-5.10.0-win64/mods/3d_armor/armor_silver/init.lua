
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = armor.get_translator

--- Silver
--
--  Requires setting `armor_material_silver`.
--
--  @section silver

if armor.materials.silver then
	armor:register_armor(":3d_armor:helmet_silver", {
		description = S("Silver Helmet"),
		inventory_image = "3d_armor_inv_helmet_silver.png",
		groups = {armor_head=1, armor_heal=6, armor_use=500,
			physics_speed=-.01, physics_gravity=.01},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=1, snappy=1, choppy=2, crumbly=2, level=2},
	})
	armor:register_armor(":3d_armor:chestplate_silver", {
		description = S("Silver Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_silver.png",
		groups = {armor_torso=1, armor_heal=6, armor_use=500,
			physics_speed=-.04, physics_gravity=.04},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=1, snappy=1, choppy=2, crumbly=2, level=2},
	})
	armor:register_armor(":3d_armor:leggings_silver", {
		description = S("Silver Leggings"),
		inventory_image = "3d_armor_inv_leggings_silver.png",
		groups = {armor_legs=1, armor_heal=6, armor_use=500,
			physics_speed=-.03, physics_gravity=.03},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=1, snappy=1, choppy=2, crumbly=2, level=2},
	})
	armor:register_armor(":3d_armor:boots_silver", {
		description = S("Silver Boots"),
		inventory_image = "3d_armor_inv_boots_silver.png",
		groups = {armor_feet=1, armor_heal=6, armor_use=500,
			physics_speed=-.01, physics_gravity=.01},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=1, snappy=1, choppy=2, crumbly=2, level=2},
	})

	local s = "silver"
	local m = armor.materials.silver
	core.register_craft({
		output = "3d_armor:helmet_"..s,
		recipe = {
			{m, m, m},
			{m, "", m}
		}
	})
	core.register_craft({
		output = "3d_armor:chestplate_"..s,
		recipe = {
			{m, "", m},
			{m, m, m},
			{m, m, m}
		}
	})
	core.register_craft({
		output = "3d_armor:leggings_"..s,
		recipe = {
			{m, m, m},
			{m, "", m},
			{m, "", m}
		}
	})
	core.register_craft({
		output = "3d_armor:boots_"..s,
		recipe = {
			{m, "", m},
			{m, "", m}
		}
	})
end