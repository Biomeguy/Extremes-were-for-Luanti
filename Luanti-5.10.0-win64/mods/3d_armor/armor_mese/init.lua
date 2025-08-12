
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = armor.get_translator

--- Mese
--
--  Requires setting `armor_material_mese`.
--
--  @section mese

if armor.materials.mese then
	armor:register_armor(":3d_armor:helmet_mese", {
		description = S("Mese Helmet"),
		inventory_image = "3d_armor_inv_helmet_mese.png",
		groups = {armor_head=1, armor_heal=10, armor_use=150, physics_jump=.1,
			physics_speed=.1},
		armor_groups = {fleshy=14},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
		light_source = 3,
	})
	armor:register_armor(":3d_armor:chestplate_mese", {
		description = S("Mese Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_mese.png",
		groups = {armor_torso=1, armor_heal=10, armor_use=150, physics_jump=.1,
			physics_speed=.1},
		armor_groups = {fleshy=19},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
		light_source = 3,
	})
	armor:register_armor(":3d_armor:leggings_mese", {
		description = S("Mese Leggings"),
		inventory_image = "3d_armor_inv_leggings_mese.png",
		groups = {armor_legs=1, armor_heal=10, armor_use=150, physics_jump=.1,
			physics_speed=.1},
		armor_groups = {fleshy=19},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
		light_source = 3,
	})
	armor:register_armor(":3d_armor:boots_mese", {
		description = S("Mese Boots"),
		inventory_image = "3d_armor_inv_boots_mese.png",
		groups = {armor_feet=1, armor_heal=10, armor_use=150, physics_jump=.1,
			physics_speed=.1},
		armor_groups = {fleshy=14},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
		light_source = 3,
	})

	local s = "mese"
	local m = armor.materials.mese
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