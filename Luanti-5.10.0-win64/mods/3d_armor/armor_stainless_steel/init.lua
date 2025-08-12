
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = armor.get_translator

--- Stainless Steel
--
--  Requires setting `armor_material_stainless_steel`.
--
--  @section stainless_steel

if armor.materials.stainless_steel then
	armor:register_armor(":3d_armor:helmet_stainless_steel", {
		description = S("Stainless Steel Helmet"),
		inventory_image = "3d_armor_inv_helmet_stainless_steel.png",
		groups = {armor_head=1, armor_heal=5, armor_use=700,
			physics_speed=-.01, physics_gravity=.01},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=2, level=2},
	})
	armor:register_armor(":3d_armor:chestplate_stainless_steel", {
		description = S("Stainless Steel Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_stainless_steel.png",
		groups = {armor_torso=1, armor_heal=5, armor_use=700,
			physics_speed=-.02, physics_gravity=.02},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=2, level=2},
	})
	armor:register_armor(":3d_armor:leggings_stainless_steel", {
		description = S("Stainless Steel Leggings"),
		inventory_image = "3d_armor_inv_leggings_stainless_steel.png",
		groups = {armor_legs=1, armor_heal=5, armor_use=700,
			physics_speed=-.02, physics_gravity=.02},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=2, level=2},
	})
	armor:register_armor(":3d_armor:boots_stainless_steel", {
		description = S("Stainless Steel Boots"),
		inventory_image = "3d_armor_inv_boots_stainless_steel.png",
		groups = {armor_feet=1, armor_heal=5, armor_use=700,
			physics_speed=-.01, physics_gravity=.01},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=2, level=2},
	})

	local s = "stainless_steel"
	local m = armor.materials.stainless_steel
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