-- mods/default/tools.lua

-- support for MT game translation.
local S = default.get_translator

-- The hand
-- Override the hand item registered in the engine in builtin/game/register.lua
core.override_item("", {
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
		},
		damage_groups = {fleshy=1},
	}
})

--
-- Picks
--

core.register_tool("default:pick_wood", {
	description = S("Wooden Pickaxe"),
	inventory_image = "default_tool_woodpick.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=1.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1, flammable = 2}
})

core.register_tool("default:pick_stone", {
	description = S("Stone Pickaxe"),
	inventory_image = "default_tool_stonepick.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.00}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

core.register_tool("default:pick_bronze", {
	description = S("Bronze Pickaxe"),
	inventory_image = "default_tool_bronzepick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.50, [2]=1.80, [3]=0.90}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

core.register_tool("default:pick_steel", {
	description = S("Steel Pickaxe"),
	inventory_image = "default_tool_steelpick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

core.register_tool("default:pick_silver", {
	description = S("Silver Pickaxe"),
	inventory_image = "default_tool_silverpick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=2,
		groupcaps={
			cracky = {times={[1]=2.60, [2]=1.00, [3]=0.60}, uses=100, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

core.register_tool("default:pick_mese", {
	description = S("Mese Pickaxe"),
	inventory_image = "default_tool_mesepick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

core.register_tool("default:pick_mithril", {
	description = S("Mithril Pickaxe"),
	inventory_image = "default_tool_mithrilpick.png",
	tool_capabilities = {
		full_punch_interval = 0.45,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.25, [2]=0.55, [3]=0.35}, uses=200, maxlevel=2},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

core.register_tool("default:pick_diamond", {
	description = S("Diamond Pickaxe"),
	inventory_image = "default_tool_diamondpick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

core.register_tool("default:pick_orichalc", {
	description = S("Orichalc Pickaxe"),
	inventory_image = "default_tool_orichalcpick.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=1.5, [2]=0.5, [3]=0.25}, uses=65, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

core.register_tool("default:pick_blue_diamond", {
	description = S("Blue Diamond Pickaxe"),
	inventory_image = "default_tool_bluediamondpick.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=2,
		groupcaps={
			cracky = {times={[4]=3.8, [1]=0.9, [2]=0.3, [3]=0.13}, uses=105, maxlevel=3},
			hard = {times={[1]=4.5, [2]=9., [3]=18.}, uses=93, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

core.register_tool("default:pick_crystal", {
	description = S("Frost Crystal Pickaxe"),
	inventory_image = "crystal_pick.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level = 3,
		groupcaps={
			cracky = {times={[1]=1.8, [2]=0.8, [3]=0.40}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy = 6},
		luck_drops = true,
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

--
-- Shovels
--

core.register_tool("default:shovel_wood", {
	description = S("Wooden Shovel"),
	inventory_image = "default_tool_woodshovel.png",
	wield_image = "default_tool_woodshovel.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=3.00, [2]=1.60, [3]=0.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1, flammable = 2}
})

core.register_tool("default:shovel_stone", {
	description = S("Stone Shovel"),
	inventory_image = "default_tool_stoneshovel.png",
	wield_image = "default_tool_stoneshovel.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

core.register_tool("default:shovel_bronze", {
	description = S("Bronze Shovel"),
	inventory_image = "default_tool_bronzeshovel.png",
	wield_image = "default_tool_bronzeshovel.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.65, [2]=1.05, [3]=0.45}, uses=25, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

core.register_tool("default:shovel_steel", {
	description = S("Steel Shovel"),
	inventory_image = "default_tool_steelshovel.png",
	wield_image = "default_tool_steelshovel.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

core.register_tool("default:shovel_silver", {
	description = S("Silver Shovel"),
	inventory_image = "default_tool_silvershovel.png",
	wield_image = "default_tool_silvershovel.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=2,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.40, [3]=0.25}, uses=100, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

core.register_tool("default:shovel_mese", {
	description = S("Mese Shovel"),
	inventory_image = "default_tool_meseshovel.png",
	wield_image = "default_tool_meseshovel.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

core.register_tool("default:shovel_mithril", {
	description = S("Mithril Shovel"),
	inventory_image = "default_tool_mithrilshovel.png",
	wield_image = "default_tool_mithrilshovel.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 0.45,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=0.70, [2]=0.35, [3]=0.20}, uses=200, maxlevel=2},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

core.register_tool("default:shovel_diamond", {
	description = S("Diamond Shovel"),
	inventory_image = "default_tool_diamondshovel.png",
	wield_image = "default_tool_diamondshovel.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

core.register_tool("default:shovel_orichalc", {
	description = S("Orichalc Shovel"),
	inventory_image = "default_tool_orichalcshovel.png",
	wield_image = "default_tool_orichalcshovel.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=0.55, [2]=0.25, [3]=0.15}, uses=65, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

core.register_tool("default:shovel_blue_diamond", {
	description = S("Blue Diamond Shovel"),
	inventory_image = "default_tool_bluediamondshovel.png",
	wield_image = "default_tool_bluediamondshovel.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=2,
		groupcaps={
			crumbly = {times={[1]=0.26, [2]=0.13, [3]=0.07}, uses=105, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

core.register_tool("default:shovel_crystal", {
	description = S("Frost Crystal Shovel"),
	inventory_image = "crystal_shovel.png",
	wield_image = "crystal_shovel.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level = 1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy = 4},
		give_dig = true,
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

--
-- Axes
--

core.register_tool("default:axe_wood", {
	description = S("Wooden Axe"),
	inventory_image = "default_tool_woodaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			choppy = {times={[2]=3.00, [3]=1.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1, flammable = 2}
})

core.register_tool("default:hand_axe_flint", {
	description = S("Flint Hand Axe"),
	inventory_image = "default_flint_hand_axe.png",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=3.20, [2]=1.20, [3]=0.60}, uses=60, maxlevel=1},
			crumbly={times={[1]=1.70, [2]=0.70, [3]=0.50}, uses=20, maxlevel=1},
			fleshy={times={[2]=1.00, [3]=0.60}, uses=40, maxlevel=1},
			oddly_breakable_by_hand={times={[1]=3.50, [2]=2.00, [3]=0.70}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=3},
	},
	groups = {axe = 1, shovel = 1, sword = 1, hand_axe = 1}
})

core.register_tool("default:hand_axe_desert_stone", {
	description = S("Desert Stone Hand Axe"),
	inventory_image = "default_desert_stone_hand_axe.png",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=3.30, [2]=2.20, [3]=1.40}, uses=40, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	groups = {hand_axe = 1}
})

core.register_tool("default:hand_axe_stone", {
	description = S("Stone Hand Axe"),
	inventory_image = "default_stone_hand_axe.png",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=3.30, [2]=2.20, [3]=1.40}, uses=40, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	groups = {hand_axe = 1}
})

core.register_tool("default:axe_stone", {
	description = S("Stone Axe"),
	inventory_image = "default_tool_stoneaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=3.00, [2]=2.00, [3]=1.30}, uses=60, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_tool("default:axe_bronze", {
	description = S("Bronze Axe"),
	inventory_image = "default_tool_bronzeaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.75, [2]=1.70, [3]=1.15}, uses=60, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_tool("default:axe_steel", {
	description = S("Steel Axe"),
	inventory_image = "default_tool_steelaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=60, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_tool("default:axe_silver", {
	description = S("Silver Axe"),
	inventory_image = "default_tool_silveraxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy = {times={[1]=2.50, [2]=0.80, [3]=0.50}, uses=200, maxlevel=1},
			fleshy = {times={[2]=1.10, [3]=0.60}, uses=200, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_tool("default:axe_mese", {
	description = S("Mese Axe"),
	inventory_image = "default_tool_meseaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=80, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_tool("default:axe_mithril", {
	description = S("Mithril Axe"),
	inventory_image = "default_tool_mithrilaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.45,
		max_drop_level=3,
		groupcaps={
			choppy = {times={[1]=1.75, [2]=0.45, [3]=0.45}, uses=400, maxlevel=2},
			fleshy = {times={[2]=0.95, [3]=0.30}, uses=400, maxlevel=1},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_tool("default:axe_diamond", {
	description = S("Diamond Axe"),
	inventory_image = "default_tool_diamondaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=90, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_tool("default:axe_orichalc", {
	description = S("Orichalc Axe"),
	inventory_image = "default_tool_orichalcaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.05, [2]=0.45, [3]=0.25}, uses=130, maxlevel=3},
			fleshy={times={[1]=1.05, [2]=0.45, [3]=0.25}, uses=130, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_tool("default:axe_blue_diamond", {
	description = S("Blue Diamond Axe"),
	inventory_image = "default_tool_bluediamondaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.5, [2]=0.23, [3]=0.13}, uses=210, maxlevel=3},
			fleshy={times={[1]=0.5, [2]=0.23, [3]=0.13}, uses=210, maxlevel=3},
		},
		damage_groups = {fleshy=11},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_tool("default:axe_crystal", {
	description = S("Frost Crystal Axe"),
	inventory_image = "crystal_axe.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level = 1,
		groupcaps = {
			choppy = {times={[1]=2.00, [2]=0.80, [3]=0.40}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy = 7},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

--
-- Swords
--

core.register_tool("default:sword_wood", {
	description = S("Wooden Sword"),
	inventory_image = "default_tool_woodsword.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1, flammable = 2}
})

core.register_tool("default:sword_stone", {
	description = S("Stone Sword"),
	inventory_image = "default_tool_stonesword.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

core.register_tool("default:sword_bronze", {
	description = S("Bronze Sword"),
	inventory_image = "default_tool_bronzesword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.75, [2]=1.30, [3]=0.375}, uses=25, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

core.register_tool("default:sword_steel", {
	description = S("Steel Sword"),
	inventory_image = "default_tool_steelsword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

core.register_tool("default:sword_silver", {
	description = S("Silver Sword"),
	inventory_image = "default_tool_silversword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy = {times={[2]=0.70, [3]=0.30}, uses=100, maxlevel=1},
			snappy = {times={[2]=0.70, [3]=0.30}, uses=100, maxlevel=1},
			choppy = {times={[3]=0.80}, uses=100, maxlevel=0},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

core.register_tool("default:sword_mese", {
	description = S("Mese Sword"),
	inventory_image = "default_tool_mesesword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

core.register_tool("default:sword_mithril", {
	description = S("Mithril Sword"),
	inventory_image = "default_tool_mithrilsword.png",
	tool_capabilities = {
		full_punch_interval = 0.45,
		max_drop_level=3,
		groupcaps={
			fleshy = {times={[2]=0.65, [3]=0.25}, uses=200, maxlevel=2},
			snappy = {times={[2]=0.70, [3]=0.25}, uses=200, maxlevel=2},
			choppy = {times={[3]=0.65}, uses=200, maxlevel=0},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

core.register_tool("default:sword_diamond", {
	description = S("Diamond Sword"),
	inventory_image = "default_tool_diamondsword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

core.register_tool("default:sword_orichalc", {
	description = S("Orichalc Sword"),
	inventory_image = "default_tool_orichalcsword.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.93, [2]=0.43, [3]=0.13}, uses=85, maxlevel=3},
		},
		damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

core.register_tool("default:sword_blue_diamond", {
	description = S("Blue Diamond Sword"),
	inventory_image = "default_tool_bluediamondsword.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.45, [2]=0.21, [3]=0.06}, uses=105, maxlevel=3},
		},
		damage_groups = {fleshy=13},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

core.register_tool("default:sword_crystal", {
	description = S("Frost Crystal Sword"),
	inventory_image = "crystal_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level = 1,
		groupcaps = {
			snappy = {times={[1]=1.70, [2]=0.70, [3]=0.25}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy = 10},
		looting_level = 3,
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

--
-- Register Craft Recipies
--

core.register_craft({
	output = "default:hand_axe_desert_stone",
	recipe = {
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:hand_axe_desert_stone",
	recipe = {
		{"default:rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "default:hand_axe_flint",
	recipe = {
		{"default:desert_rock", "default:flint"}
	}
})

core.register_craft({
	output = "default:hand_axe_flint",
	recipe = {
		{"default:rock", "default:flint"}
	}
})

core.register_craft({
	output = "default:hand_axe_stone",
	recipe = {
		{"default:desert_rock", "default:rock"}
	}
})

core.register_craft({
	output = "default:hand_axe_stone",
	recipe = {
		{"default:rock", "default:rock"}
	}
})

register_tools("wood", "group:wood")
register_tools("stone", "group:rock")
register_tools("bronze", "default:bronze_ingot")
register_tools("steel", "default:steel_ingot")
register_tools("silver", "default:silver_ingot")
register_tools("mese", "default:mese_crystal")
register_tools("mithril", "default:mithril_ingot")
register_tools("diamond", "default:diamond")
register_tools("orichalc", "default:orichalc_ingot")
register_tools("blue_diamond", "default:blue_diamond")
register_tools("crystal", "default:crystal_ingot", "default:steel_ingot")

core.register_tool("default:plasma_cannon", {
	description = S("Plasma Cannon"),
	inventory_image = "default_plasma_cannon.png",
	wield_scale = {x=2, y=2, z=2},
	groups = {disable_repair = 1, not_repaired_by_anvil = 1},
	on_use = function(item, user)
		local wear = math.ceil(65535 / 300)
		local max_wear = 299 * wear
		if item:get_wear() < max_wear then
	local pos = user:get_pos()
	local dir = user:get_look_dir()
	local name = user:get_player_name()
	local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+1.5+dir.y,z=pos.z+dir.z}, "default:plasma")
	obj:get_luaentity().launcher = name
	obj:set_velocity({x=dir.x*15,y=dir.y*15,z=dir.z*15})
	local modify = item:get_meta():get_int("plasmod")
	if modify == 1 or modify == 2 then
		obj:get_luaentity().y_depth = modify+1
	elseif modify == 3 then
		obj:set_properties({physical = true})
	end
	core.sound_play("default_plasma_shot", {pos = pos, gain = 1, max_hear_distance = 8}, true)
	if not core.is_creative_enabled(name) then
		item:add_wear(wear)
	end
		end
		return item
	end,
	on_secondary_use = function(item, user)
		local name = user:get_player_name()
		local modify = item:get_meta():get_int("plasmod")
		if modify < 3 then
	item:get_meta():set_int("plasmod", modify+1)
	core.chat_send_player(name, "Plasma cannon is set to "..modify+1)
		else
	item:get_meta():set_int("plasmod", 0)
	core.chat_send_player(name, "Plasma cannon is set to 0")
		end
		return item
	end,
	on_place = function(item, user, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and user and
				not user:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, user,
					item, pointd)
			end
		end

		local name = user:get_player_name()
		local modify = item:get_meta():get_int("plasmod")
		if modify < 3 then
	item:get_meta():set_int("plasmod", modify+1)
	core.chat_send_player(name, "Plasma cannon is set to "..modify+1)
		else
	item:get_meta():set_int("plasmod", 0)
	core.chat_send_player(name, "Plasma cannon is set to 0")
		end
		return item
	end
})

core.register_craft({
	output = "default:plasma_cannon",
	recipe = {
		{"", "default:blue_diamond", ""},
		{"default:stainless_steel_ingot", "default:blue_diamond", "default:stainless_steel_ingot"},
		{"default:brass_ingot", "default:mese_crystal", "default:copper_ingot"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:plasma_cannon",
	recipe = {"default:plasma_cannon", "default:mese_crystal"}
})

core.register_craft({
	type = "fuel",
	recipe = "default:pick_wood",
	burntime = 6,
})

core.register_craft({
	type = "fuel",
	recipe = "default:shovel_wood",
	burntime = 4,
})

core.register_craft({
	type = "fuel",
	recipe = "default:axe_wood",
	burntime = 6,
})

core.register_craft({
	type = "fuel",
	recipe = "default:sword_wood",
	burntime = 5,
})
