
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = armor.get_translator

--- Chainmail
--
--  Requires setting `armor_material_chainmail`.
--
--  @section chainmail

if armor.materials.chainmail then
	armor:register_armor(":3d_armor:helmet_chainmail", {
		description = S("Chainmail Helmet"),
		inventory_image = "3d_armor_inv_helmet_chainmail.png",
		groups = {armor_head=1, armor_heal=0, armor_use=750,
			physics_speed=-.02, physics_gravity=.02},
		armor_groups = {fleshy=8},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:chestplate_chainmail", {
		description = S("Chainmail Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_chainmail.png",
		groups = {armor_torso=1, armor_heal=0, armor_use=750,
			physics_speed=-.05, physics_gravity=.05},
		armor_groups = {fleshy=13},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:leggings_chainmail", {
		description = S("Chainmail Leggings"),
		inventory_image = "3d_armor_inv_leggings_chainmail.png",
		groups = {armor_legs=1, armor_heal=0, armor_use=750,
			physics_speed=-.04, physics_gravity=.04},
		armor_groups = {fleshy=13},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor(":3d_armor:boots_chainmail", {
		description = S("Chainmail Boots"),
		inventory_image = "3d_armor_inv_boots_chainmail.png",
		groups = {armor_feet=1, armor_heal=0, armor_use=750,
			physics_speed=-.02, physics_gravity=.02},
		armor_groups = {fleshy=8},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})

	local s = "chainmail"
	local m = armor.materials.chainmail
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