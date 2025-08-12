
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = armor.get_translator

--- Brass
--
--  Requires setting `armor_material_brass`.
--
--  @section brass

if armor.materials.brass then
	armor:register_armor(":3d_armor:helmet_brass", {
		description = S("Brass Helmet"),
		inventory_image = "3d_armor_inv_helmet_brass.png",
		groups = {armor_head=1, armor_heal=6, armor_use=400,
			physics_speed=-.01, physics_gravity=.01},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:chestplate_brass", {
		description = S("Brass Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_brass.png",
		groups = {armor_torso=1, armor_heal=6, armor_use=400,
			physics_speed=-.04, physics_gravity=.04},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:leggings_brass", {
		description = S("Brass Leggings"),
		inventory_image = "3d_armor_inv_leggings_brass.png",
		groups = {armor_legs=1, armor_heal=6, armor_use=400,
			physics_speed=-.03, physics_gravity=.03},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:boots_brass", {
		description = S("Brass Boots"),
		inventory_image = "3d_armor_inv_boots_brass.png",
		groups = {armor_feet=1, armor_heal=6, armor_use=400,
			physics_speed=-.01, physics_gravity=.01},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
	})

	local s = "brass"
	local m = armor.materials.brass
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