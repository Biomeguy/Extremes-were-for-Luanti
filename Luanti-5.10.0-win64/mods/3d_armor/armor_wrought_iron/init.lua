
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = armor.get_translator

--- Wrought Iron
--
--  Requires setting `armor_material_wrought_iron`.
--
--  @section wrought_iron

if armor.materials.wrought_iron then
	armor:register_armor(":3d_armor:helmet_wrought_iron", {
		description = S("Wrought Iron Helmet"),
		inventory_image = "3d_armor_inv_helmet_wrought_iron.png",
		groups = {armor_head=1, armor_heal=0, armor_use=900,
			physics_speed=-.02, physics_gravity=.02},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=1, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:chestplate_wrought_iron", {
		description = S("Wrought Iron Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_wrought_iron.png",
		groups = {armor_torso=1, armor_heal=0, armor_use=900,
			physics_speed=-.04, physics_gravity=.04},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=1, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:leggings_wrought_iron", {
		description = S("Wrought Iron Leggings"),
		inventory_image = "3d_armor_inv_leggings_wrought_iron.png",
		groups = {armor_legs=1, armor_heal=0, armor_use=900,
			physics_speed=-.04, physics_gravity=.04},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=1, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:boots_wrought_iron", {
		description = S("Wrought Iron Boots"),
		inventory_image = "3d_armor_inv_boots_wrought_iron.png",
		groups = {armor_feet=1, armor_heal=0, armor_use=900,
			physics_speed=-.02, physics_gravity=.02},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=1, snappy=3, choppy=2, crumbly=1, level=2},
	})

	local s = "wrought_iron"
	local m = armor.materials.wrought_iron
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