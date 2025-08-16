if core.get_modpath("3d_armor") then

-- Gold crown
armor:register_armor("xtraores:helmet_crown", {
	description = "Gold crown",
	inventory_image = "xtraores_inv_helmet_crown.png",
	groups = {armor_head=1, armor_heal=25, armor_use=0},
	armor_groups = {fleshy=25},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

-- Nickel set
armor:register_armor("xtraores:helmet_nickel", {
	description = "".. core.colorize("#68fff6", "Nickel helmet\n").. "Protection: 7%\nHeal chance: 0%\nSpeed bonus: -1%\nJump bonus: 0%\nGravity bonus: 1%\nXtraores armor level: 1",
	inventory_image = "xtraores_inv_helmet_nickel.png",
	groups = {armor_head=1, armor_heal=0, armor_use=1200, physics_speed=-0.01, physics_gravity=0.01},
	armor_groups = {fleshy=7},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:chestplate_nickel", {
	description = "".. core.colorize("#68fff6", "Nickel chestguard\n").. "Protection: 12%\nHeal chance: 0%\nSpeed bonus: -1%\nJump bonus: 0%\nGravity bonus: 1%\nXtraores armor level: 1",
	inventory_image = "xtraores_inv_chestplate_nickel.png",
	groups = {armor_torso=1, armor_heal=0, armor_use=1200, physics_speed=-0.01, physics_gravity=0.01},
	armor_groups = {fleshy=12},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:leggings_nickel", {
	description = "".. core.colorize("#68fff6", "Nickel leg protectors\n").. "Protection: 12%\nHeal chance: 0%\nSpeed bonus: -1%\nJump bonus: 0%\nGravity bonus: 1%\nXtraores armor level: 1",
	inventory_image = "xtraores_inv_leggings_nickel.png",
	groups = {armor_legs=1, armor_heal=0, armor_use=1200, physics_speed=-0.01, physics_gravity=0.01},
	armor_groups = {fleshy=12},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:boots_nickel", {
	description = "".. core.colorize("#68fff6", "Nickel boots\n").. "Protection: 7%\nHeal chance: 0%\nSpeed bonus: -1%\nJump bonus: 0%\nGravity bonus: 1%\nXtraores armor level: 1",
	inventory_image = "xtraores_inv_boots_nickel.png",
	groups = {armor_feet=1, armor_heal=0, armor_use=1200, physics_speed=-0.01, physics_gravity=0.01},
	armor_groups = {fleshy=7},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:shield_nickel", {
	description = "".. core.colorize("#68fff6", "Nickel buckler\n").. "Protection: 7%\nHeal chance: 0%\nSpeed bonus: -1%\nJump bonus: 0%\nGravity bonus: 1%\nXtraores armor level: 1",
	inventory_image = "xtraores_inv_shield_nickel.png",
	groups = {armor_shield=1, armor_heal=0, armor_use=1200, physics_speed=-0.01, physics_gravity=0.01},
	armor_groups = {fleshy=7},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

-- Platinum set
armor:register_armor("xtraores:helmet_platinum", {
	description = "".. core.colorize("#68fff6", "Platinum chain-helmet\n").. "Protection: 12%\nHeal chance: 7%\nSpeed bonus: 0%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 2",
	inventory_image = "xtraores_inv_helmet_platinum.png",
	groups = {armor_head=1, armor_heal=7, armor_use=200, physics_speed=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=12},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:chestplate_platinum", {
	description = "".. core.colorize("#68fff6", "Platinum chainmail\n").. "Protection: 17%\nHeal chance: 7%\nSpeed bonus: 0%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 2",
	inventory_image = "xtraores_inv_chestplate_platinum.png",
	groups = {armor_torso=1, armor_heal=7, armor_use=200, physics_speed=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=17},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:leggings_platinum", {
	description = "".. core.colorize("#68fff6", "Platinum chain leggings\n").. "Protection: 17%\nHeal chance: 7%\nSpeed bonus: 0%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 2",
	inventory_image = "xtraores_inv_leggings_platinum.png",
	groups = {armor_legs=1, armor_heal=7, armor_use=200, physics_speed=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=17},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:boots_platinum", {
	description = "".. core.colorize("#68fff6", "Platinum chained boots\n").. "Protection: 12%\nHeal chance: 7%\nSpeed bonus: 0%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 2",
	inventory_image = "xtraores_inv_boots_platinum.png",
	groups = {armor_feet=1, armor_heal=7, armor_use=200, physics_speed=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=12},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:shield_platinum", {
	description = "".. core.colorize("#68fff6", "Platinum small-shield\n").. "Protection: 12%\nHeal chance: 7%\nSpeed bonus: 0%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 2",
	inventory_image = "xtraores_inv_shield_platinum.png",
	groups = {armor_shield=1, armor_heal=7, armor_use=200, physics_speed=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=12},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

-- Palladium set
armor:register_armor("xtraores:helmet_palladium", {
	description = "".. core.colorize("#68fff6", "Palladium helmet\n").. "Protection: 15%\nHeal chance: 12%\nSpeed bonus: 3%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 3",
	inventory_image = "xtraores_inv_helmet_palladium.png",
	groups = {armor_head=1, armor_heal=12, armor_use=150, physics_speed=0.03, physics_jump=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=15},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:chestplate_palladium", {
	description = "".. core.colorize("#68fff6", "Palladium platemail\n").. "Protection: 20%\nHeal chance: 12%\nSpeed bonus: 3%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 3",
	inventory_image = "xtraores_inv_chestplate_palladium.png",
	groups = {armor_torso=1, armor_heal=12, armor_use=150, physics_speed=0.03, physics_jump=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=20},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:leggings_palladium", {
	description = "".. core.colorize("#68fff6", "Palladium leggings\n").. "Protection: 20%\nHeal chance: 12%\nSpeed bonus: 3%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 3",
	inventory_image = "xtraores_inv_leggings_palladium.png",
	groups = {armor_legs=1, armor_heal=12, armor_use=150, physics_speed=0.03, physics_jump=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=20},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:boots_palladium", {
	description = "".. core.colorize("#68fff6", "Palladium boots\n").. "Protection: 15%\nHeal chance: 12%\nSpeed bonus: 3%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 3",
	inventory_image = "xtraores_inv_boots_palladium.png",
	groups = {armor_feet=1, armor_heal=12, armor_use=150, physics_speed=0.03, physics_jump=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=15},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:shield_palladium", {
	description = "".. core.colorize("#68fff6", "Palladium shield\n").. "Protection: 15%\nHeal chance: 12%\nSpeed bonus: 3%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 3",
	inventory_image = "xtraores_inv_shield_palladium.png",
	groups = {armor_shield=1, armor_heal=12, armor_use=150, physics_speed=0.03, physics_jump=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=15},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

-- Cobalt set
armor:register_armor("xtraores:helmet_cobalt", {
	description = "".. core.colorize("#68fff6", "Cobalt helmet\n").. "Protection: 15.2%\nHeal chance: 12.1%\nSpeed bonus: 7%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 4",
	inventory_image = "xtraores_inv_helmet_cobalt.png",
	groups = {armor_head=1, armor_heal=12.1, armor_use=100, physics_speed=0.07, physics_jump=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=15.2},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:chestplate_cobalt", {
	description = "".. core.colorize("#68fff6", "Cobalt platemail\n").. "Protection: 20.2%\nHeal chance: 12.1%\nSpeed bonus: 7%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 4",
	inventory_image = "xtraores_inv_chestplate_cobalt.png",
	groups = {armor_torso=1, armor_heal=12.1, armor_use=100, physics_speed=0.07, physics_jump=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=20.2},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:leggings_cobalt", {
	description = "".. core.colorize("#68fff6", "Cobalt leggings\n").. "Protection: 20.2%\nHeal chance: 12.1%\nSpeed bonus: 7%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 4",
	inventory_image = "xtraores_inv_leggings_cobalt.png",
	groups = {armor_legs=1, armor_heal=12.1, armor_use=100, physics_speed=0.07, physics_jump=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=20.2},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:boots_cobalt", {
	description = "".. core.colorize("#68fff6", "Cobalt boots\n").. "Protection: 15.2%\nHeal chance: 12.1%\nSpeed bonus: 7%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 4",
	inventory_image = "xtraores_inv_boots_cobalt.png",
	groups = {armor_feet=1, armor_heal=12.1, armor_use=100, physics_speed=0.07, physics_jump=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=15.2},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:shield_cobalt", {
	description = "".. core.colorize("#68fff6", "Cobalt shield\n").. "Protection: 15.2%\nHeal chance: 12.1%\nSpeed bonus: 7%\nJump bonus: 0%\nGravity bonus: 0%\nXtraores armor level: 4",
	inventory_image = "xtraores_inv_shield_cobalt.png",
	groups = {armor_shield=1, armor_heal=12.1, armor_use=100, physics_speed=0.07, physics_jump=0.00, physics_gravity=0.00},
	armor_groups = {fleshy=15.2},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

-- Thorium set
armor:register_armor("xtraores:helmet_thorium", {
	description = "".. core.colorize("#68fff6", "Thorium helmet\n").. "Protection: 15.4%\nHeal chance: 12.2%\nSpeed bonus: 11%\nJump bonus: 3%\nGravity bonus: 0%\nXtraores armor level: 5",
	inventory_image = "xtraores_inv_helmet_thorium.png",
	groups = {armor_head=1, armor_heal=12.2, armor_use=100, physics_speed=0.11, physics_jump=0.03, physics_gravity=0.00},
	armor_groups = {fleshy=15.4},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:chestplate_thorium", {
	description = "".. core.colorize("#68fff6", "Thorium platemail\n").. "Protection: 20.4%\nHeal chance: 12.2%\nSpeed bonus: 11%\nJump bonus: 3%\nGravity bonus: 0%\nXtraores armor level: 5",
	inventory_image = "xtraores_inv_chestplate_thorium.png",
	groups = {armor_torso=1, armor_heal=12.2, armor_use=100, physics_speed=0.11, physics_jump=0.03, physics_gravity=0.00},
	armor_groups = {fleshy=20.4},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:leggings_thorium", {
	description = "".. core.colorize("#68fff6", "Thorium leggings\n").. "Protection: 20.4%\nHeal chance: 12.2%\nSpeed bonus: 11%\nJump bonus: 3%\nGravity bonus: 0%\nXtraores armor level: 5",
	inventory_image = "xtraores_inv_leggings_thorium.png",
	groups = {armor_legs=1, armor_heal=12.2, armor_use=100, physics_speed=0.11, physics_jump=0.03, physics_gravity=0.00},
	armor_groups = {fleshy=20.4},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:boots_thorium", {
	description = "".. core.colorize("#68fff6", "Thorium boots\n").. "Protection: 15.4%\nHeal chance: 12.2%\nSpeed bonus: 11%\nJump bonus: 3%\nGravity bonus: 0%\nXtraores armor level: 5",
	inventory_image = "xtraores_inv_boots_thorium.png",
	groups = {armor_feet=1, armor_heal=12.2, armor_use=100, physics_speed=0.11, physics_jump=0.03, physics_gravity=0.00},
	armor_groups = {fleshy=15.4},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:shield_thorium", {
	description = "".. core.colorize("#68fff6", "Thorium shield\n").. "Protection: 15.4%\nHeal chance: 12.2%\nSpeed bonus: 11%\nJump bonus: 3%\nGravity bonus: 0%\nXtraores armor level: 5",
	inventory_image = "xtraores_inv_shield_thorium.png",
	groups = {armor_shield=1, armor_heal=12.2, armor_use=100, physics_speed=0.11, physics_jump=0.03, physics_gravity=0.00},
	armor_groups = {fleshy=15.4},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

-- Osmium set
armor:register_armor("xtraores:helmet_osmium", {
	description = "".. core.colorize("#68fff6", "Osmium helmet\n").. "Protection: 15.6%\nHeal chance: 12.3%\nSpeed bonus: 16%\nJump bonus: 5%\nGravity bonus: 0%\nXtraores armor level: 6",
	inventory_image = "xtraores_inv_helmet_osmium.png",
	groups = {armor_head=1, armor_heal=12.3, armor_use=60, physics_speed=0.16, physics_jump=0.05, physics_gravity=0.00},
	armor_groups = {fleshy=15.6},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:chestplate_osmium", {
	description = "".. core.colorize("#68fff6", "Osmium platemail\n").. "Protection: 20.6%\nHeal chance: 12.3%\nSpeed bonus: 16%\nJump bonus: 5%\nGravity bonus: 0%\nXtraores armor level: 6",
	inventory_image = "xtraores_inv_chestplate_osmium.png",
	groups = {armor_torso=1, armor_heal=12.3, armor_use=60, physics_speed=0.16, physics_jump=0.05, physics_gravity=0.00},
	armor_groups = {fleshy=20.6},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:leggings_osmium", {
	description = "".. core.colorize("#68fff6", "Osmium leggings\n").. "Protection: 20.6%\nHeal chance: 12.3%\nSpeed bonus: 16%\nJump bonus: 5%\nGravity bonus: 0%\nXtraores armor level: 6",
	inventory_image = "xtraores_inv_leggings_osmium.png",
	groups = {armor_legs=1, armor_heal=12.3, armor_use=60, physics_speed=0.16, physics_jump=0.05, physics_gravity=0.00},
	armor_groups = {fleshy=20.6},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:boots_osmium", {
	description = "".. core.colorize("#68fff6", "Osmium boots\n").. "Protection: 15.6%\nHeal chance: 12.3%\nSpeed bonus: 16%\nJump bonus: 5%\nGravity bonus: 0%\nXtraores armor level: 6",
	inventory_image = "xtraores_inv_boots_osmium.png",
	groups = {armor_feet=1, armor_heal=12.3, armor_use=60, physics_speed=0.16, physics_jump=0.05, physics_gravity=0.00},
	armor_groups = {fleshy=15.6},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:shield_osmium", {
	description = "".. core.colorize("#68fff6", "Osmium shield\n").. "Protection: 15.6%\nHeal chance: 12.3%\nSpeed bonus: 16%\nJump bonus: 5%\nGravity bonus: 0%\nXtraores armor level: 6",
	inventory_image = "xtraores_inv_shield_osmium.png",
	groups = {armor_shield=1, armor_heal=12.3, armor_use=60, physics_speed=0.16, physics_jump=0.05, physics_gravity=0.00},
	armor_groups = {fleshy=15.6},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

-- Rhenium set
armor:register_armor("xtraores:helmet_rhenium", {
	description = "".. core.colorize("#68fff6", "Rhenium helmet\n").. "Protection: 15.8%\nHeal chance: 12.4%\nSpeed bonus: 21%\nJump bonus: 8%\nGravity bonus: -1%\nXtraores armor level: 7",
	inventory_image = "xtraores_inv_helmet_rhenium.png",
	groups = {armor_head=1, armor_heal=12.4, armor_use=40, physics_speed=0.21, physics_jump=0.08, physics_gravity=-0.01},
	armor_groups = {fleshy=15.8},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:chestplate_rhenium", {
	description = "".. core.colorize("#68fff6", "Rhenium platemail\n").. "Protection: 20.8%\nHeal chance: 12.4%\nSpeed bonus: 21%\nJump bonus: 8%\nGravity bonus: -1%\nXtraores armor level: 7",
	inventory_image = "xtraores_inv_chestplate_rhenium.png",
	groups = {armor_torso=1, armor_heal=12.4, armor_use=40, physics_speed=0.21, physics_jump=0.08, physics_gravity=-0.01},
	armor_groups = {fleshy=20.8},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:leggings_rhenium", {
	description = "".. core.colorize("#68fff6", "Rhenium leggings\n").. "Protection: 20.8%\nHeal chance: 12.4%\nSpeed bonus: 21%\nJump bonus: 8%\nGravity bonus: -1%\nXtraores armor level: 7",
	inventory_image = "xtraores_inv_leggings_rhenium.png",
	groups = {armor_legs=1, armor_heal=12.4, armor_use=40, physics_speed=0.21, physics_jump=0.08, physics_gravity=-0.01},
	armor_groups = {fleshy=20.8},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:boots_rhenium", {
	description = "".. core.colorize("#68fff6", "Rhenium boots\n").. "Protection: 15.8%\nHeal chance: 12.4%\nSpeed bonus: 21%\nJump bonus: 8%\nGravity bonus: -1%\nXtraores armor level: 7",
	inventory_image = "xtraores_inv_boots_rhenium.png",
	groups = {armor_feet=1, armor_heal=12.4, armor_use=40, physics_speed=0.21, physics_jump=0.08, physics_gravity=-0.01},
	armor_groups = {fleshy=15.8},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:shield_rhenium", {
	description = "".. core.colorize("#68fff6", "Rhenium shield\n").. "Protection: 15.8%\nHeal chance: 12.4%\nSpeed bonus: 21%\nJump bonus: 8%\nGravity bonus: -1%\nXtraores armor level: 7",
	inventory_image = "xtraores_inv_shield_rhenium.png",
	groups = {armor_shield=1, armor_heal=12.4, armor_use=40, physics_speed=0.21, physics_jump=0.08, physics_gravity=-0.01},
	armor_groups = {fleshy=15.8},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

-- Vanadium set
armor:register_armor("xtraores:helmet_vanadium", {
	description = "".. core.colorize("#68fff6", "Vanadium helmet\n").. "Protection: 16.0%\nHeal chance: 12.5%\nSpeed bonus: 25%\nJump bonus: 10%\nGravity bonus: -2%\nXtraores armor level: 8",
	inventory_image = "xtraores_inv_helmet_vanadium.png",
	groups = {armor_head=1, armor_heal=12.5, armor_use=25, physics_speed=0.25, physics_jump=0.10, physics_gravity=-0.02},
	armor_groups = {fleshy=16.0},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:chestplate_vanadium", {
	description = "".. core.colorize("#68fff6", "Vanadium platemail\n").. "Protection: 21.0%\nHeal chance: 12.5%\nSpeed bonus: 25%\nJump bonus: 10%\nGravity bonus: -2%\nXtraores armor level: 8",
	inventory_image = "xtraores_inv_chestplate_vanadium.png",
	groups = {armor_torso=1, armor_heal=12.5, armor_use=25, physics_speed=0.25, physics_jump=0.10, physics_gravity=-0.02},
	armor_groups = {fleshy=21.0},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:leggings_vanadium", {
	description = "".. core.colorize("#68fff6", "Vanadium leggings\n").. "Protection: 21.0%\nHeal chance: 12.5%\nSpeed bonus: 25%\nJump bonus: 10%\nGravity bonus: -2%\nXtraores armor level: 8",
	inventory_image = "xtraores_inv_leggings_vanadium.png",
	groups = {armor_legs=1, armor_heal=12.5, armor_use=25, physics_speed=0.25, physics_jump=0.10, physics_gravity=-0.02},
	armor_groups = {fleshy=21.0},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:boots_vanadium", {
	description = "".. core.colorize("#68fff6", "Vanadium boots\n").. "Protection: 16.0%\nHeal chance: 12.5%\nSpeed bonus: 25%\nJump bonus: 10%\nGravity bonus: -2%\nXtraores armor level: 8",
	inventory_image = "xtraores_inv_boots_vanadium.png",
	groups = {armor_feet=1, armor_heal=12.5, armor_use=25, physics_speed=0.25, physics_jump=0.10, physics_gravity=-0.02},
	armor_groups = {fleshy=16.0},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:shield_vanadium", {
	description = "".. core.colorize("#68fff6", "Vanadium shield\n").. "Protection: 16.0%\nHeal chance: 12.5%\nSpeed bonus: 25%\nJump bonus: 10%\nGravity bonus: -2%\nXtraores armor level: 8",
	inventory_image = "xtraores_inv_shield_vanadium.png",
	groups = {armor_shield=1, armor_heal=12.5, armor_use=25, physics_speed=0.25, physics_jump=0.10, physics_gravity=-0.02},
	armor_groups = {fleshy=16.0},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

-- Rarium set
armor:register_armor("xtraores:helmet_rarium", {
	description = "".. core.colorize("#68fff6", "Rarium heavy-helmet\n").. "Protection: 16.2%\nHeal chance: 12.6%\nSpeed bonus: 29%\nJump bonus: 12%\nGravity bonus: -3%\nXtraores armor level: 9",
	inventory_image = "xtraores_inv_helmet_rarium.png",
	groups = {armor_head=1, armor_heal=12.6, armor_use=20, physics_speed=0.29, physics_jump=0.12, physics_gravity=-0.03},
	armor_groups = {fleshy=16.2},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:chestplate_rarium", {
	description = "".. core.colorize("#68fff6", "Rarium heavy-platemail\n").. "Protection: 21.2%\nHeal chance: 12.6%\nSpeed bonus: 29%\nJump bonus: 12%\nGravity bonus: -3%\nXtraores armor level: 9",
	inventory_image = "xtraores_inv_chestplate_rarium.png",
	groups = {armor_torso=1, armor_heal=12.6, armor_use=20, physics_speed=0.29, physics_jump=0.12, physics_gravity=-0.03},
	armor_groups = {fleshy=21.2},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:leggings_rarium", {
	description = "".. core.colorize("#68fff6", "Rarium heavy-leggings\n").. "Protection: 21.2%\nHeal chance: 12.6%\nSpeed bonus: 29%\nJump bonus: 12%\nGravity bonus: -3%\nXtraores armor level: 9",
	inventory_image = "xtraores_inv_leggings_rarium.png",
	groups = {armor_legs=1, armor_heal=12.6, armor_use=20, physics_speed=0.29, physics_jump=0.12, physics_gravity=-0.03},
	armor_groups = {fleshy=21.2},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:boots_rarium", {
	description = "".. core.colorize("#68fff6", "Rarium heavy-boots\n").. "Protection: 16.2%\nHeal chance: 12.6%\nSpeed bonus: 29%\nJump bonus: 12%\nGravity bonus: -3%\nXtraores armor level: 9",
	inventory_image = "xtraores_inv_boots_rarium.png",
	groups = {armor_feet=1, armor_heal=12.6, armor_use=20, physics_speed=0.29, physics_jump=0.12, physics_gravity=-0.03},
	armor_groups = {fleshy=16.2},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:shield_rarium", {
	description = "".. core.colorize("#68fff6", "Rarium heavy-shield\n").. "Protection: 16.2%\nHeal chance: 12.6%\nSpeed bonus: 29%\nJump bonus: 12%\nGravity bonus: -3%\nXtraores armor level: 9",
	inventory_image = "xtraores_inv_shield_rarium.png",
	groups = {armor_shield=1, armor_heal=12.6, armor_use=20, physics_speed=0.29, physics_jump=0.12, physics_gravity=-0.03},
	armor_groups = {fleshy=16.2},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

-- Orichalcum set
armor:register_armor("xtraores:helmet_orichalcum", {
	description = "".. core.colorize("#68fff6", "Orichalcum heavy-helmet\n").. "Protection: 16.4%\nHeal chance: 12.7%\nSpeed bonus: 33%\nJump bonus: 14%\nGravity bonus: -4%\nXtraores armor level: 10",
	inventory_image = "xtraores_inv_helmet_orichalcum.png",
	groups = {armor_head=1, armor_heal=12.7, armor_use=17, physics_speed=0.33, physics_jump=0.14, physics_gravity=-0.04},
	armor_groups = {fleshy=16.4},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:chestplate_orichalcum", {
	description = "".. core.colorize("#68fff6", "Orichalcum heavy-platemail\n").. "Protection: 21.4%\nHeal chance: 12.7%\nSpeed bonus: 33%\nJump bonus: 14%\nGravity bonus: -4%\nXtraores armor level: 10",
	inventory_image = "xtraores_inv_chestplate_orichalcum.png",
	groups = {armor_torso=1, armor_heal=12.7, armor_use=17, physics_speed=0.33, physics_jump=0.14, physics_gravity=-0.04},
	armor_groups = {fleshy=21.4},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:leggings_orichalcum", {
	description = "".. core.colorize("#68fff6", "Orichalcum heavy-leggings\n").. "Protection: 21.4%\nHeal chance: 12.7%\nSpeed bonus: 33%\nJump bonus: 14%\nGravity bonus: -4%\nXtraores armor level: 10",
	inventory_image = "xtraores_inv_leggings_orichalcum.png",
	groups = {armor_legs=1, armor_heal=12.7, armor_use=17, physics_speed=0.33, physics_jump=0.14, physics_gravity=-0.04},
	armor_groups = {fleshy=21.4},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:boots_orichalcum", {
	description = "".. core.colorize("#68fff6", "Orichalcum heavy-boots\n").. "Protection: 16.4%\nHeal chance: 12.7%\nSpeed bonus: 33%\nJump bonus: 14%\nGravity bonus: -4%\nXtraores armor level: 10",
	inventory_image = "xtraores_inv_boots_orichalcum.png",
	groups = {armor_feet=1, armor_heal=12.7, armor_use=17, physics_speed=0.33, physics_jump=0.14, physics_gravity=-0.04},
	armor_groups = {fleshy=16.4},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:shield_orichalcum", {
	description = "".. core.colorize("#68fff6", "Orichalcum heavy-shield\n").. "Protection: 16.4%\nHeal chance: 12.7%\nSpeed bonus: 33%\nJump bonus: 14%\nGravity bonus: -4%\nXtraores armor level: 10",
	inventory_image = "xtraores_inv_shield_orichalcum.png",
	groups = {armor_shield=1, armor_heal=12.7, armor_use=17, physics_speed=0.33, physics_jump=0.14, physics_gravity=-0.04},
	armor_groups = {fleshy=16.4},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

-- Titanium set
armor:register_armor("xtraores:helmet_titanium", {
	description = "".. core.colorize("#68fff6", "Titanium heavy-helmet\n").. "Protection: 16.5%\nHeal chance: 12.8%\nSpeed bonus: 34%\nJump bonus: 15%\nGravity bonus: -4.5%\nXtraores armor level: 11",
	inventory_image = "xtraores_inv_helmet_titanium.png",
	groups = {armor_head=1, armor_heal=12.8, armor_use=15, physics_speed=0.34, physics_jump=0.15, physics_gravity=-0.045},
	armor_groups = {fleshy=16.5},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:chestplate_titanium", {
	description = "".. core.colorize("#68fff6", "Titanium heavy-platemail\n").. "Protection: 21.5%\nHeal chance: 12.8%\nSpeed bonus: 34%\nJump bonus: 15%\nGravity bonus: -4.5%\nXtraores armor level: 11",
	inventory_image = "xtraores_inv_chestplate_titanium.png",
	groups = {armor_torso=1, armor_heal=12.8, armor_use=15, physics_speed=0.34, physics_jump=0.15, physics_gravity=-0.045},
	armor_groups = {fleshy=21.5},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:leggings_titanium", {
	description = "".. core.colorize("#68fff6", "Titanium heavy-leggings\n").. "Protection: 21.5%\nHeal chance: 12.8%\nSpeed bonus: 34%\nJump bonus: 15%\nGravity bonus: -4.5%\nXtraores armor level: 11",
	inventory_image = "xtraores_inv_leggings_titanium.png",
	groups = {armor_legs=1, armor_heal=12.8, armor_use=15, physics_speed=0.34, physics_jump=0.15, physics_gravity=-0.045},
	armor_groups = {fleshy=21.5},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:boots_titanium", {
	description = "".. core.colorize("#68fff6", "Titanium heavy-boots\n").. "Protection: 16.5%\nHeal chance: 12.8%\nSpeed bonus: 34%\nJump bonus: 15%\nGravity bonus: -4.5%\nXtraores armor level: 11",
	inventory_image = "xtraores_inv_boots_titanium.png",
	groups = {armor_feet=1, armor_heal=12.8, armor_use=15, physics_speed=0.34, physics_jump=0.15, physics_gravity=-0.045},
	armor_groups = {fleshy=16.5},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:shield_titanium", {
	description = "".. core.colorize("#68fff6", "Titanium heavy-shield\n").. "Protection: 16.5%\nHeal chance: 12.8%\nSpeed bonus: 34%\nJump bonus: 15%\nGravity bonus: -4.5%\nXtraores armor level: 11",
	inventory_image = "xtraores_inv_shield_titanium.png",
	groups = {armor_shield=1, armor_heal=12.8, armor_use=15, physics_speed=0.34, physics_jump=0.15, physics_gravity=-0.045},
	armor_groups = {fleshy=16.5},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

-- Chromium set
armor:register_armor("xtraores:helmet_chromium", {
	description = "".. core.colorize("#68fff6", "Chromium heavy-helmet\n").. "Protection: 16.6%\nHeal chance: 12.9%\nSpeed bonus: 35%\nJump bonus: 16%\nGravity bonus: -5.0%\nXtraores armor level: 12",
	inventory_image = "xtraores_inv_helmet_chromium.png",
	groups = {armor_head=1, armor_heal=12.9, armor_use=14, physics_speed=0.35, physics_jump=0.16, physics_gravity=-0.05},
	armor_groups = {fleshy=16.6},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:chestplate_chromium", {
	description = "".. core.colorize("#68fff6", "Chromium heavy-platemail\n").. "Protection: 21.6%\nHeal chance: 12.9%\nSpeed bonus: 35%\nJump bonus: 16%\nGravity bonus: -5.0%\nXtraores armor level: 12",
	inventory_image = "xtraores_inv_chestplate_chromium.png",
	groups = {armor_torso=1, armor_heal=12.9, armor_use=14, physics_speed=0.35, physics_jump=0.16, physics_gravity=-0.05},
	armor_groups = {fleshy=21.6},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:leggings_chromium", {
	description = "".. core.colorize("#68fff6", "Chromium heavy-leggings\n").. "Protection: 21.6%\nHeal chance: 12.9%\nSpeed bonus: 35%\nJump bonus: 16%\nGravity bonus: -5.0%\nXtraores armor level: 12",
	inventory_image = "xtraores_inv_leggings_chromium.png",
	groups = {armor_legs=1, armor_heal=12.9, armor_use=14, physics_speed=0.35, physics_jump=0.16, physics_gravity=-0.05},
	armor_groups = {fleshy=21.6},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:boots_chromium", {
	description = "".. core.colorize("#68fff6", "Chromium heavy-boots\n").. "Protection: 16.6%\nHeal chance: 12.9%\nSpeed bonus: 35%\nJump bonus: 16%\nGravity bonus: -5.0%\nXtraores armor level: 12",
	inventory_image = "xtraores_inv_boots_chromium.png",
	groups = {armor_feet=1, armor_heal=12.9, armor_use=14, physics_speed=0.35, physics_jump=0.16, physics_gravity=-0.05},
	armor_groups = {fleshy=16.6},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("xtraores:shield_chromium", {
	description = "".. core.colorize("#68fff6", "Chromium heavy-shield\n").. "Protection: 16.6%\nHeal chance: 12.9%\nSpeed bonus: 35%\nJump bonus: 16%\nGravity bonus: -5.0%\nXtraores armor level: 12",
	inventory_image = "xtraores_inv_shield_chromium.png",
	groups = {armor_shield=1, armor_heal=12.9, armor_use=14, physics_speed=0.35, physics_jump=0.16, physics_gravity=-0.05},
	armor_groups = {fleshy=16.6},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

-- Register crafting recipes:

local xtraores_ingreds = {

	nickel = "xtraores:nickel_ingot",
	platinum = "xtraores:platinum_ingot",
	palladium = "xtraores:palladium_ingot",
	cobalt = "xtraores:cobalt_ingot",
	thorium = "xtraores:thorium_ingot",
	osmium = "xtraores:osmium_ingot",
	rhenium = "xtraores:rhenium_ingot",
	vanadium = "xtraores:vanadium_ingot",
	rarium = "xtraores:rarium_ingot",
	orichalcum = "xtraores:orichalcum_ingot",
	titanium = "xtraores:titanium_ingot",
	chromium = "xtraores:chromium_ingot",
}

for k, v in pairs(xtraores_ingreds) do
	core.register_craft({
		output = "xtraores:helmet_".. k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{"", "", ""}
		}
	})
	core.register_craft({
		output = "xtraores:chestplate_".. k,
		recipe = {
			{v, "", v},
			{v, v, v},
			{v, v, v}
		}
	})
	core.register_craft({
		output = "xtraores:leggings_".. k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{v, "", v}
		}
	})
	core.register_craft({
		output = "xtraores:boots_".. k,
		recipe = {
			{v, "", v},
			{v, "", v}
		}
	})
if core.get_modpath("shields") then
	core.register_craft({
		output = "xtraores:shield_".. k,
		recipe = {
			{v, v, v},
			{v, v, v},
			{"", v, ""}
		}
	})
end
end
end
