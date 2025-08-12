
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = armor.get_translator

--- Copper
--
--  Requires setting `armor_material_copper`.
--
--  @section copper

if armor.materials.copper then
	armor:register_armor(":3d_armor:helmet_copper", {
		description = S("Copper Helmet"),
		inventory_image = "3d_armor_inv_helmet_copper.png",
		groups = {armor_head=1, armor_heal=3, armor_use=750,
			physics_speed=-.03, physics_gravity=.03},
		armor_groups = {fleshy=8},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:chestplate_copper", {
		description = S("Copper Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_copper.png",
		groups = {armor_torso=1, armor_heal=3, armor_use=750,
			physics_speed=-.06, physics_gravity=.06},
		armor_groups = {fleshy=13},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:leggings_copper", {
		description = S("Copper Leggings"),
		inventory_image = "3d_armor_inv_leggings_copper.png",
		groups = {armor_legs=1, armor_heal=3, armor_use=750,
			physics_speed=-.05, physics_gravity=.05},
		armor_groups = {fleshy=13},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:boots_copper", {
		description = S("Copper Boots"),
		inventory_image = "3d_armor_inv_boots_copper.png",
		groups = {armor_feet=1, armor_heal=3, armor_use=750,
			physics_speed=-.03, physics_gravity=.03},
		armor_groups = {fleshy=8},
		damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
	})

	local s = "copper"
	local m = armor.materials.copper
	core.register_craft({
		output = "3d_armor:helmet_".. s,
		recipe = {
			{m, m, m},
			{m, "", m}
		}
	})
	core.register_craft({
		output = "3d_armor:chestplate_".. s,
		recipe = {
			{m, "", m},
			{m, m, m},
			{m, m, m}
		}
	})
	core.register_craft({
		output = "3d_armor:leggings_".. s,
		recipe = {
			{m, m, m},
			{m, "", m},
			{m, "", m}
		}
	})
	core.register_craft({
		output = "3d_armor:boots_".. s,
		recipe = {
			{m, "", m},
			{m, "", m}
		}
	})
end