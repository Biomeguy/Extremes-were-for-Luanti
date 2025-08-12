
local S

if core.get_translator ~= nil then
	S = core.get_translator("armor_steeldian")
else
	S = function(str)
		return(str)
	end
end


-- Crafitem
core.register_craftitem(":steeldian:ingot", {
	description = S("Steeldian Ingot"),
	inventory_image = "steeldian_ingot.png",
})

core.register_craft({
	type = "shapeless",
	output = "steeldian:ingot 2",
	recipe = {"default:steel_ingot", "default:obsidian"}
})

-- Tools
core.register_tool(":steeldian:sword", {
	description = S("Steeldian Sword"),
	inventory_image = "steeldian_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level = 1,
		groupcaps = {
			snappy = {times = {1.7, 0.7, 0.25}, uses = 50, maxlevel = 3},
		},
		damage_groups = {fleshy = 10},
	},
})

core.register_tool(":steeldian:pick", {
	description = S("Steeldian Pickaxe"),
	inventory_image = "steeldian_pick.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level = 3,
		groupcaps = {
			cracky = {times={[1]=1.8, [2]=0.8, [3]=0.40}, uses = 40, maxlevel = 3},
		},
		damage_groups = {fleshy = 6},
	},
})

core.register_tool(":steeldian:shovel", {
	description = S("Steeldian Shovel"),
	inventory_image = "steeldian_shovel.png",
	wield_image = "steeldian_shovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
})

core.register_tool(":steeldian:axe", {
	description = S("Steeldian Axe"),
	inventory_image = "steeldian_axe.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level = 1,
		groupcaps = {
			choppy = {times = {[1] = 2.00, [2] = 0.80, [3] = 0.40}, uses = 40, maxlevel = 3},
		},
		damage_groups = {fleshy = 7},
	},
})

-- Tool Crafts
core.register_craft({
	output = "steeldian:sword",
	recipe = {
		{"steeldian:ingot"},
		{"steeldian:ingot"},
		{"default:obsidian_shard"}
	}
})

core.register_craft({
	output = "steeldian:pick",
	recipe = {
		{"steeldian:ingot", "steeldian:ingot", "steeldian:ingot"},
		{"", "default:obsidian_shard", ""},
		{"", "default:obsidian_shard", ""}
	}
})

core.register_craft({
	output = "steeldian:shovel",
	recipe = {
		{"steeldian:ingot"},
		{"default:obsidian_shard"},
		{"default:obsidian_shard"}
	}
})

core.register_craft({
	output = "steeldian:axe",
	recipe = {
		{"steeldian:ingot", "steeldian:ingot"},
		{"steeldian:ingot", "default:obsidian_shard"},
		{"", "default:obsidian_shard"}
	}
})

-- Armor
if core.get_modpath("3d_armor") then
if armor.materials.steeldian then
	armor:register_armor(":3d_armor:helmet_steeldian", {
		description = S("Steeldian Helmet"),
		inventory_image = "3d_armor_inv_helmet_steeldian.png",
		groups = {armor_head=1, armor_heal=12, armor_use=100},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
	armor:register_armor(":3d_armor:chestplate_steeldian", {
		description = S("Steeldian Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_steeldian.png",
		groups = {armor_torso=1, armor_heal=12, armor_use=100},
		armor_groups = {fleshy=20},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
	armor:register_armor(":3d_armor:leggings_steeldian", {
		description = S("Steeldian Leggings"),
		inventory_image = "3d_armor_inv_leggings_steeldian.png",
		groups = {armor_legs=1, armor_heal=12, armor_use=100},
		armor_groups = {fleshy=20},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
	armor:register_armor(":3d_armor:boots_steeldian", {
		description = S("Steeldian Boots"),
		inventory_image = "3d_armor_inv_boots_steeldian.png",
		groups = {armor_feet=1, armor_heal=12, armor_use=100},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, level=3},
	})

-- Armor Crafts
	local s = "_steeldian"
	local m = "steeldian:ingot"
	core.register_craft({
		output = "3d_armor:helmet"..s,
		recipe = {
			{m, m, m},
			{m, "", m}
		}
	})

	core.register_craft({
		output = "3d_armor:chestplate"..s,
		recipe = {
			{m, "", m},
			{m, m, m},
			{m, m, m}
		}
	})

	core.register_craft({
		output = "3d_armor:leggings"..s,
		recipe = {
			{m, m, m},
			{m, "", m},
			{m, "", m}
		}
	})

	core.register_craft({
		output = "3d_armor:boots"..s,
		recipe = {
			{m, "", m},
			{m, "", m}
		}
	})
end
end

-- Node
core.register_node(":steeldian:block", {
	description = S("Steeldian Block"),
	tiles = {"steeldian_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

register_nine("steeldian:block", "steeldian:ingot")

-- Toolranks support
if core.get_modpath("toolranks") then
	core.override_item("steeldian:sword", {
		description = toolranks.create_description(S("Steeldian Sword"), 0, 1),
		original_description = S("Steeldian Sword"),
		after_use = toolranks.new_afteruse
	})

	core.override_item("steeldian:pick", {
		description = toolranks.create_description(S("Steeldian Pickaxe"), 0, 1),
		original_description = S("Steeldian Pickaxe"),
		after_use = toolranks.new_afteruse
	})

	core.override_item("steeldian:axe", {
		description = toolranks.create_description(S("Steeldian Axe"), 0, 1),
		original_description = S("Steeldian Axe"),
		after_use = toolranks.new_afteruse
	})

	core.override_item("steeldian:shovel", {
		description = toolranks.create_description(S("Steeldian Shovel"), 0, 1),
		original_description = S("Steeldian Shovel"),
		after_use = toolranks.new_afteruse
	})
end
