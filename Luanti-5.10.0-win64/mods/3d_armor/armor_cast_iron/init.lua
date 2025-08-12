
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = armor.get_translator

--- Cast Iron
--
--  Requires setting `armor_material_cast_iron`.
--
--  @section cast_iron

if armor.materials.cast_iron then
	armor:register_armor(":3d_armor:helmet_cast_iron", {
		description = S("Cast Iron Helmet"),
		inventory_image = "3d_armor_inv_helmet_cast_iron.png",
		groups = {armor_head=1, armor_heal=0, armor_use=800,
			physics_speed=-.03, physics_gravity=.03},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:chestplate_cast_iron", {
		description = S("Cast Iron Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_cast_iron.png",
		groups = {armor_torso=1, armor_heal=0, armor_use=800,
			physics_speed=-.05, physics_gravity=.05},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:leggings_cast_iron", {
		description = S("Cast Iron Leggings"),
		inventory_image = "3d_armor_inv_leggings_cast_iron.png",
		groups = {armor_legs=1, armor_heal=0, armor_use=800,
			physics_speed=-.05, physics_gravity=.05},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:boots_cast_iron", {
		description = S("Cast Iron Boots"),
		inventory_image = "3d_armor_inv_boots_cast_iron.png",
		groups = {armor_feet=1, armor_heal=0, armor_use=800,
			physics_speed=-.03, physics_gravity=.03},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})

	local s = "cast_iron"
	local m = armor.materials.cast_iron
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