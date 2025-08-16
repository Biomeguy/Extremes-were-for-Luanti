
-- Compact method for repeating crafts from technic worldgen
-- Register (r) Xtraores Tool (xt)
function r_xt(tool1, tool2, tool3, tool4, tool5, toolore, toolhandle)
	core.register_craft({
		output = tool1,
		recipe = {
		{toolore, toolore, toolore},
		{'', toolhandle, ''},
		{'', toolhandle, ''},
		}
	})

	-- Axes
	-- Recipes face left to match appearence in textures and inventory
	core.register_craft({
		output = tool2,
		recipe = {
			{toolore, toolore},
			{toolore, toolhandle},
			{'', toolhandle},
		}
	})

	core.register_craft({
		output = tool3,
		recipe = {
			{toolore},
			{toolore},
			{toolhandle},
		}
	})

	core.register_craft({
		output = tool4,
		recipe = {
			{'', toolore, toolore},
			{'', toolhandle, toolore},
			{toolhandle, '', ''},
		}
	})

	core.register_craft({
		output = tool5,
		recipe = {
			{'', toolore},
			{toolhandle, ''},
		}
	})
end

-- nickel set

core.register_tool("xtraores:pickaxe_nickel", {
	description = "".. core.colorize("#68fff6", "Nickel pickaxe\n").. "Mele damage: 3\nFull punch interval: 1.0\nRange: 4.0\nXtraores tool level: 1",
	inventory_image = "xtraores_pickaxe_nickel.png",
	range = 4.0,
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=6.00, [2]=1.85, [3]=0.90}, uses=15, maxlevel=2},
		},
	damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:shovel_nickel", {
	description = "".. core.colorize("#68fff6", "Nickel shovel\n").. "Mele damage: 3\nFull punch interval: 1.1\nRange: 4.0\nXtraores tool level: 1",
	inventory_image = "xtraores_shovel_nickel.png",
	range = 4.0,
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.80, [2]=1.05, [3]=0.45}, uses=25, maxlevel=2},
		},
	damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:axe_nickel", {
	description = "".. core.colorize("#68fff6", "Nickel axe\n").. "Mele damage: 4\nFull punch interval: 1.0\nRange: 4.0\nXtraores tool level: 1",
	inventory_image = "xtraores_axe_nickel.png",
	range = 4.0,
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.50, [2]=1.60, [3]=1.15}, uses=15, maxlevel=2},
		},
	damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:sword_nickel", {
	description = "".. core.colorize("#68fff6", "Nickel sword\n").. "Mele damage: 5\nFull punch interval: 0.8\nRange: 4.0\nXtraores tool level: 1",
	inventory_image = "xtraores_sword_nickel.png",
	range = 4.0,
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=3.5, [2]=1.45, [3]=0.40}, uses=25, maxlevel=2},
		},
	damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

register_tools('nickel', 'xtraores:nickel_ingot')

core.register_tool("xtraores:shortsword_nickel", {
	description = "".. core.colorize("#68fff6", "Nickel shortsword\n").. "Mele damage: 4\nFull punch interval: 0.6\nRange: 3.2\nXtraores tool level: 1",
	inventory_image = "xtraores_shortsword_nickel.png",
	range = 3.0,
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=3.5, [2]=1.45, [3]=0.40}, uses=25, maxlevel=2},
		},
	damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})
core.register_craft({
	output = 'xtraores:shortsword_nickel',
	recipe = {
		{'', 'xtraores:nickel_ingot'},
		{'group:stick', ''},
	}
})

-- platinum set

core.register_tool("xtraores:pickaxe_platinum", {
	description = "".. core.colorize("#68fff6", "Platinum pickaxe\n").. "Mele damage: 6\nFull punch interval: 0.88\nRange: 4.2\nXtraores tool level: 2",
	inventory_image = "xtraores_pickaxe_platinum.png",
	range = 4.2,
	tool_capabilities = {
		full_punch_interval = 0.88,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=3},
		},
	damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:shovel_platinum", {
	description = "".. core.colorize("#68fff6", "Platinum shovel\n").. "Mele damage: 5\nFull punch interval: 0.98\nRange: 4.2\nXtraores tool level: 2",
	inventory_image = "xtraores_shovel_platinum.png",
	range = 4.2,
	tool_capabilities = {
		full_punch_interval = 0.98,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=20, maxlevel=3},
		},
	damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:axe_platinum", {
	description = "".. core.colorize("#68fff6", "Platinum axe\n").. "Mele damage: 6\nFull punch interval: 0.88\nRange: 4.2\nXtraores tool level: 2",
	inventory_image = "xtraores_axe_platinum.png",
	range = 4.2,
	tool_capabilities = {
		full_punch_interval = 0.88,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=20, maxlevel=3},
		},
	damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:sword_platinum", {
	description = "".. core.colorize("#68fff6", "Platinum sword\n").. "Mele damage: 7\nFull punch interval: 0.68\nRange: 4.2\nXtraores tool level: 2",
	inventory_image = "xtraores_sword_platinum.png",
	range = 4.2,
	tool_capabilities = {
		full_punch_interval = 0.68,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
	damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

register_tools('platinum', 'xtraores:platinum_ingot')

core.register_tool("xtraores:shortsword_platinum", {
	description = "".. core.colorize("#68fff6", "Platinum shortsword\n").. "Mele damage: 6\nFull punch interval: 0.58\nRange: 3.1\nXtraores tool level: 2",
	inventory_image = "xtraores_shortsword_platinum.png",
	range = 3.1,
	tool_capabilities = {
		full_punch_interval = 0.48,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
	damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})
core.register_craft({
	output = 'xtraores:shortsword_platinum',
	recipe = {
		{'', 'xtraores:platinum_ingot'},
		{'group:stick', ''},
	}
})

-- palladium set

core.register_tool("xtraores:pickaxe_palladium", {
	description = "".. core.colorize("#68fff6", "Palladium pickaxe\n").. "Mele damage: 8\nFull punch interval: 0.86\nRange: 4.4\nXtraores tool level: 3",
	inventory_image = "xtraores_pickaxe_palladium.png",
	range = 4.4,
	tool_capabilities = {
		full_punch_interval = 0.86,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[4]=4.00, [1]=1.85, [2]=1.1, [3]=0.55}, uses=45, maxlevel=3},
		},
	damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:shovel_palladium", {
	description = "".. core.colorize("#68fff6", "Palladium shovel\n").. "Mele damage: 7\nFull punch interval: 0.96\nRange: 4.4\nXtraores tool level: 3",
	inventory_image = "xtraores_shovel_palladium.png",
	range = 4.4,
	tool_capabilities = {
		full_punch_interval = 0.96,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=0.95, [2]=0.40, [3]=0.25}, uses=45, maxlevel=3},
		},
	damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:axe_palladium", {
	description = "".. core.colorize("#68fff6", "Palladium axe\n").. "Mele damage: 8\nFull punch interval: 0.86\nRange: 4.4\nXtraores tool level: 3",
	inventory_image = "xtraores_axe_palladium.png",
	range = 4.4,
	tool_capabilities = {
		full_punch_interval = 0.86,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.95, [2]=0.80, [3]=0.45}, uses=45, maxlevel=3},
		},
	damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:sword_palladium", {
	description = "".. core.colorize("#68fff6", "Palladium sword\n").. "Mele damage: 9\nFull punch interval: 0.66\nRange: 4.4\nXtraores tool level: 3",
	inventory_image = "xtraores_sword_palladium.png",
	range = 4.4,
	tool_capabilities = {
		full_punch_interval = 0.66,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.75, [2]=0.80, [3]=0.25}, uses=45, maxlevel=3},
		},
	damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
})

register_tools('palladium', 'xtraores:palladium_ingot')

core.register_tool("xtraores:shortsword_palladium", {
	description = "".. core.colorize("#68fff6", "Palladium shortsword\n").. "Mele damage: 8\nFull punch interval: 0.56\nRange: 3.2\nXtraores tool level: 3",
	inventory_image = "xtraores_shortsword_palladium.png",
	range = 3.2,
	tool_capabilities = {
		full_punch_interval = 0.56,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.75, [2]=0.80, [3]=0.25}, uses=45, maxlevel=3},
		},
	damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
})
core.register_craft({
	output = 'xtraores:shortsword_palladium',
	recipe = {
		{'', 'xtraores:palladium_ingot'},
		{'group:stick', ''},
	}
})

-- cobalt set

core.register_tool("xtraores:pickaxe_cobalt", {
	description = "".. core.colorize("#68fff6", "Cobalt pickaxe\n").. "Mele damage: 10\nFull punch interval: 0.84\nRange: 4.6\nXtraores tool level: 4",
	inventory_image = "xtraores_pickaxe_cobalt.png",
	range = 4.6,
	tool_capabilities = {
		full_punch_interval = 0.84,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[5]=6.00, [4]=3.50, [1]=1.65, [2]=0.95, [3]=0.45}, uses=60, maxlevel=3},
		},
	damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:shovel_cobalt", {
	description = "".. core.colorize("#68fff6", "Cobalt shovel\n").. "Mele damage: 9\nFull punch interval: 0.94\nRange: 4.6\nXtraores tool level: 4",
	inventory_image = "xtraores_shovel_cobalt.png",
	range = 4.6,
	tool_capabilities = {
		full_punch_interval = 0.94,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=0.8, [2]=0.30, [3]=0.20}, uses=60, maxlevel=3},
		},
	damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:axe_cobalt", {
	description = "".. core.colorize("#68fff6", "Cobalt axe\n").. "Mele damage: 10\nFull punch interval: 0.84\nRange: 4.6\nXtraores tool level: 4",
	inventory_image = "xtraores_axe_cobalt.png",
	range = 4.6,
	tool_capabilities = {
		full_punch_interval = 0.84,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.8, [2]=0.70, [3]=0.40}, uses=60, maxlevel=3},
		},
	damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:sword_cobalt", {
	description = "".. core.colorize("#68fff6", "Cobalt sword\n").. "Mele damage: 11\nFull punch interval: 0.64\nRange: 4.6\nXtraores tool level: 4",
	inventory_image = "xtraores_sword_cobalt.png",
	range = 4.6,
	tool_capabilities = {
		full_punch_interval = 0.64,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.60, [2]=0.70, [3]=0.20}, uses=60, maxlevel=3},
		},
	damage_groups = {fleshy=11},
	},
	sound = {breaks = "default_tool_breaks"},
})

register_tools('cobalt', 'xtraores:cobalt_ingot')

core.register_tool("xtraores:shortsword_cobalt", {
	description = "".. core.colorize("#68fff6", "Cobalt shortsword\n").. "Mele damage: 10\nFull punch interval: 0.54\nRange: 3.3\nXtraores tool level: 4",
	inventory_image = "xtraores_shortsword_cobalt.png",
	range = 3.3,
	tool_capabilities = {
		full_punch_interval = 0.54,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.6, [2]=0.70, [3]=0.20}, uses=60, maxlevel=3},
		},
	damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
})
core.register_craft({
	output = 'xtraores:shortsword_cobalt',
	recipe = {
		{'', 'xtraores:cobalt_ingot'},
		{'group:stick', ''},
	}
})

-- thorium set

core.register_tool("xtraores:pickaxe_thorium", {
	description = "".. core.colorize("#68fff6", "Thorium pickaxe\n").. "Mele damage: 12\nFull punch interval: 0.82\nRange: 4.8\nXtraores tool level: 5",
	inventory_image = "xtraores_pickaxe_thorium.png",
	range = 4.8,
	tool_capabilities = {
		full_punch_interval = 0.82,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[6]=8.00, [5]=5.40, [4]=3.50, [1]=1.5, [2]=0.85, [3]=0.40}, uses=90, maxlevel=3},
			crumbly = {times={[1]=0.6, [2]=0.20, [3]=0.15}, uses=90, maxlevel=3},
		},
	damage_groups = {fleshy=12},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:axe_thorium", {
	description = "".. core.colorize("#68fff6", "Thorium axe\n").. "Mele damage: 12\nFull punch interval: 0.82\nRange: 4.8\nXtraores tool level: 5",
	inventory_image = "xtraores_axe_thorium.png",
	range = 4.8,
	tool_capabilities = {
		full_punch_interval = 0.82,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.6, [2]=0.60, [3]=0.35}, uses=90, maxlevel=3},
		},
	damage_groups = {fleshy=12},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:sword_thorium", {
	description = "".. core.colorize("#68fff6", "Thorium sword\n").. "Mele damage: 13\nFull punch interval: 0.62\nRange: 4.8\nXtraores tool level: 5",
	inventory_image = "xtraores_sword_thorium.png",
	range = 4.8,
	tool_capabilities = {
		full_punch_interval = 0.62,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.40, [2]=0.60, [3]=0.15}, uses=90, maxlevel=3},
		},
	damage_groups = {fleshy=13},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:spear_thorium", {
	description = "".. core.colorize("#68fff6", "Thorium spear\n").. "Mele damage: 14\nFull punch interval: 0.93\nRange: 6.0\nXtraores tool level: 5",
	inventory_image = "xtraores_spear_thorium.png",
	wield_scale = {x=2.0,y=2.0,z=1.0},
	range = 6.0,
	tool_capabilities = {
		full_punch_interval = 0.93,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.40, [2]=0.60, [3]=0.15}, uses=90, maxlevel=3},
		},
	damage_groups = {fleshy=14},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:shortsword_thorium", {
	description = "".. core.colorize("#68fff6", "Thorium shortsword\n").. "Mele damage: 12\nFull punch interval: 0.52\nRange: 3.4\nXtraores tool level: 5",
	inventory_image = "xtraores_shortsword_thorium.png",
	range = 3.4,
	tool_capabilities = {
		full_punch_interval = 0.52,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.4, [2]=0.60, [3]=0.15}, uses=90, maxlevel=3},
		},
	damage_groups = {fleshy=12},
	},
	sound = {breaks = "default_tool_breaks"},
})

r_xt('xtraores:pickaxe_thorium', 'xtraores:axe_thorium', 'xtraores:sword_thorium', 'xtraores:spear_thorium', 'xtraores:shortsword_thorium', 'xtraores:thorium_ingot', 'xtraores:steel_handle')

-- osmium set

core.register_tool("xtraores:pickaxe_osmium", {
	description = "".. core.colorize("#68fff6", "Osmium pickaxe\n").. "Mele damage: 14\nFull punch interval: 0.80\nRange: 5.0\nXtraores tool level: 6",
	inventory_image = "xtraores_pickaxe_osmium.png",
	range = 5.0,
	tool_capabilities = {
		full_punch_interval = 0.80,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[7]=10.00, [6]=7.20, [5]=5.40, [4]=3.00, [1]=1.3, [2]=0.75, [3]=0.35}, uses=125, maxlevel=3},
			crumbly = {times={[1]=0.3, [2]=0.12, [3]=0.08}, uses=125, maxlevel=3},
		},
	damage_groups = {fleshy=14},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:axe_osmium", {
	description = "".. core.colorize("#68fff6", "Osmium axe\n").. "Mele damage: 14\nFull punch interval: 0.80\nRange: 5.0\nXtraores tool level: 6",
	inventory_image = "xtraores_axe_osmium.png",
	range = 5.0,
	tool_capabilities = {
		full_punch_interval = 0.80,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.4, [2]=0.50, [3]=0.30}, uses=125, maxlevel=3},
		},
	damage_groups = {fleshy=14},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:sword_osmium", {
	description = "".. core.colorize("#68fff6", "Osmium sword\n").. "Mele damage: 15\nFull punch interval: 0.60\nRange: 5.0\nXtraores tool level: 6",
	inventory_image = "xtraores_sword_osmium.png",
	range = 5.0,
	tool_capabilities = {
		full_punch_interval = 0.60,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.20, [2]=0.50, [3]=0.10}, uses=125, maxlevel=3},
		},
	damage_groups = {fleshy=15},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:spear_osmium", {
	description = "".. core.colorize("#68fff6", "Osmium spear\n").. "Mele damage: 16\nFull punch interval: 0.90\nRange: 6.3\nXtraores tool level: 6",
	inventory_image = "xtraores_spear_osmium.png",
	wield_scale = {x=2.0,y=2.0,z=1.0},
	range = 6.3,
	tool_capabilities = {
		full_punch_interval = 0.90,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.20, [2]=0.50, [3]=0.10}, uses=125, maxlevel=3},
		},
	damage_groups = {fleshy=16},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:shortsword_osmium", {
	description = "".. core.colorize("#68fff6", "Osmium shortsword\n").. "Mele damage: 14\nFull punch interval: 0.50\nRange: 3.5\nXtraores tool level: 6",
	inventory_image = "xtraores_shortsword_osmium.png",
	range = 3.5,
	tool_capabilities = {
		full_punch_interval = 0.50,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.2, [2]=0.50, [3]=0.10}, uses=125, maxlevel=3},
		},
	damage_groups = {fleshy=14},
	},
	sound = {breaks = "default_tool_breaks"},
})

r_xt('xtraores:pickaxe_osmium', 'xtraores:axe_osmium', 'xtraores:sword_osmium', 'xtraores:spear_osmium', 'xtraores:shortsword_osmium', 'xtraores:osmium_ingot', 'xtraores:steel_handle')

-- rhenium set

core.register_tool("xtraores:pickaxe_rhenium", {
	description = "".. core.colorize("#68fff6", "Rhenium pickaxe\n").. "Mele damage: 16\nFull punch interval: 0.78\nRange: 5.2\nXtraores tool level: 7",
	inventory_image = "xtraores_pickaxe_rhenium.png",
	range = 5.2,
	tool_capabilities = {
		full_punch_interval = 0.78,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[8]=12.00, [7]=9.00, [6]=6.40, [5]=4.80, [4]=2.60, [1]=1.1, [2]=0.65, [3]=0.30}, uses=175, maxlevel=3},
			crumbly = {times={[1]=0.2, [2]=0.08, [3]=0.05}, uses=175, maxlevel=3},
		},
	damage_groups = {fleshy=16},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:axe_rhenium", {
	description = "".. core.colorize("#68fff6", "Rhenium axe\n").. "Mele damage: 16\nFull punch interval: 0.78\nRange: 5.2\nXtraores tool level: 7",
	inventory_image = "xtraores_axe_rhenium.png",
	range = 5.2,
	tool_capabilities = {
		full_punch_interval = 0.78,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.1, [2]=0.30, [3]=0.20}, uses=175, maxlevel=3},
		},
	damage_groups = {fleshy=16},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:sword_rhenium", {
	description = "".. core.colorize("#68fff6", "Rhenium sword\n").. "Mele damage: 17\nFull punch interval: 0.58\nRange: 5.2\nXtraores tool level: 7",
	inventory_image = "xtraores_sword_rhenium.png",
	range = 5.2,
	tool_capabilities = {
		full_punch_interval = 0.58,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.00, [2]=0.40, [3]=0.05}, uses=175, maxlevel=3},
		},
	damage_groups = {fleshy=17},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:spear_rhenium", {
	description = "".. core.colorize("#68fff6", "Rhenium spear\n").. "Mele damage: 18\nFull punch interval: 0.87\nRange: 6.6\nXtraores tool level: 7",
	inventory_image = "xtraores_spear_rhenium.png",
	wield_scale = {x=2.0,y=2.0,z=1.0},
	range = 6.6,
	tool_capabilities = {
		full_punch_interval = 0.87,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.20, [2]=0.50, [3]=0.10}, uses=175, maxlevel=3},
		},
	damage_groups = {fleshy=18},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:shortsword_rhenium", {
	description = "".. core.colorize("#68fff6", "Rhenium shortsword\n").. "Mele damage: 16\nFull punch interval: 0.48\nRange: 3.6\nXtraores tool level: 7",
	inventory_image = "xtraores_shortsword_rhenium.png",
	range = 3.6,
	tool_capabilities = {
		full_punch_interval = 0.48,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.0, [2]=0.40, [3]=0.05}, uses=175, maxlevel=3},
		},
	damage_groups = {fleshy=16},
	},
	sound = {breaks = "default_tool_breaks"},
})

r_xt('xtraores:pickaxe_rhenium', 'xtraores:axe_rhenium', 'xtraores:sword_rhenium', 'xtraores:spear_rhenium', 'xtraores:shortsword_rhenium', 'xtraores:rhenium_ingot', 'xtraores:steel_handle')

-- vanadium set

core.register_tool("xtraores:pickaxe_vanadium", {
	description = "".. core.colorize("#68fff6", "Vanadium pickaxe\n").. "Mele damage: 18\nFull punch interval: 0.76\nRange: 5.4\nXtraores tool level: 8",
	inventory_image = "xtraores_pickaxe_vanadium.png",
	range = 5.4,
	tool_capabilities = {
		full_punch_interval = 0.76,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[9]=15.00, [8]=10.00, [7]=8.00, [6]=6.00, [5]=4.40, [4]=2.20, [1]=0.9, [2]=0.5, [3]=0.25}, uses=255, maxlevel=3},
			crumbly = {times={[1]=0.1, [2]=0.04, [3]=0.025}, uses=255, maxlevel=3},
		},
	damage_groups = {fleshy=18},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:axe_vanadium", {
	description = "".. core.colorize("#68fff6", "Vanadium axe\n").. "Mele damage: 18\nFull punch interval: 0.76\nRange: 5.4\nXtraores tool level: 8",
	inventory_image = "xtraores_axe_vanadium.png",
	range = 5.4,
	tool_capabilities = {
		full_punch_interval = 0.76,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.9, [2]=0.25, [3]=0.175}, uses=255, maxlevel=3},
		},
	damage_groups = {fleshy=18},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:sword_vanadium", {
	description = "".. core.colorize("#68fff6", "Vanadium sword\n").. "Mele damage: 19\nFull punch interval: 0.56\nRange: 5.4\nXtraores tool level: 8",
	inventory_image = "xtraores_sword_vanadium.png",
	range = 5.4,
	tool_capabilities = {
		full_punch_interval = 0.56,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.80, [2]=0.30, [3]=0.025}, uses=255, maxlevel=3},
		},
	damage_groups = {fleshy=19},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:spear_vanadium", {
	description = "".. core.colorize("#68fff6", "Vanadium spear\n").. "Mele damage: 20\nFull punch interval: 0.84\nRange: 6.85\nXtraores tool level: 8",
	inventory_image = "xtraores_spear_vanadium.png",
	wield_scale = {x=2.0,y=2.0,z=1.0},
	range = 6.85,
	tool_capabilities = {
		full_punch_interval = 0.84,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.80, [2]=0.40, [3]=0.05}, uses=255, maxlevel=3},
		},
	damage_groups = {fleshy=20},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:shortsword_vanadium", {
	description = "".. core.colorize("#68fff6", "Vanadium shortsword\n").. "Mele damage: 18\nFull punch interval: 0.46\nRange: 3.7\nXtraores tool level: 8",
	inventory_image = "xtraores_shortsword_vanadium.png",
	range = 3.7,
	tool_capabilities = {
		full_punch_interval = 0.46,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.8, [2]=0.30, [3]=0.025}, uses=255, maxlevel=3},
		},
	damage_groups = {fleshy=18},
	},
	sound = {breaks = "default_tool_breaks"},
})

r_xt('xtraores:pickaxe_vanadium', 'xtraores:axe_vanadium', 'xtraores:sword_vanadium', 'xtraores:spear_vanadium', 'xtraores:shortsword_vanadium', 'xtraores:vanadium_ingot', 'xtraores:steel_handle')

-- rarium set

core.register_tool("xtraores:pickaxe_rarium", {
	description = "".. core.colorize("#68fff6", "Rarium pickaxe\n").. "Mele damage: 20\nFull punch interval: 0.74\nRange: 5.6\nXtraores tool level: 9",
	inventory_image = "xtraores_pickaxe_rarium.png",
	range = 5.6,
	tool_capabilities = {
		full_punch_interval = 0.74,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[10]=20.00, [9]=12.00, [8]=8.00, [7]=7.40, [6]=5.00, [5]=3.90, [4]=1.80, [1]=0.65, [2]=0.35, [3]=0.175}, uses=300, maxlevel=3},
			crumbly = {times={[1]=0.05, [2]=0.02, [3]=0.0125}, uses=255, maxlevel=3},
		},
	damage_groups = {fleshy=20},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:axe_rarium", {
	description = "".. core.colorize("#68fff6", "Rarium axe\n").. "Mele damage: 20\nFull punch interval: 0.74\nRange: 5.6\nXtraores tool level: 9",
	inventory_image = "xtraores_axe_rarium.png",
	range = 5.6,
	tool_capabilities = {
		full_punch_interval = 0.74,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.7, [2]=0.20, [3]=0.10}, uses=300, maxlevel=3},
		},
	damage_groups = {fleshy=20},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:sword_rarium", {
	description = "".. core.colorize("#68fff6", "Rarium sword\n").. "Mele damage: 21\nFull punch interval: 0.54\nRange: 5.6\nXtraores tool level: 9",
	inventory_image = "xtraores_sword_rarium.png",
	range = 5.6,
	tool_capabilities = {
		full_punch_interval = 0.54,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.80, [2]=0.30, [3]=0.025}, uses=300, maxlevel=3},
		},
	damage_groups = {fleshy=21},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:spear_rarium", {
	description = "".. core.colorize("#68fff6", "Rarium spear\n").. "Mele damage: 22\nFull punch interval: 0.81\nRange: 7.0\nXtraores tool level: 9",
	inventory_image = "xtraores_spear_rarium.png",
	wield_scale = {x=2.0,y=2.0,z=1.0},
	range = 7.0,
	tool_capabilities = {
		full_punch_interval = 0.81,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.60, [2]=0.20, [3]=0.001}, uses=300, maxlevel=3},
		},
	damage_groups = {fleshy=22},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:shortsword_rarium", {
	description = "".. core.colorize("#68fff6", "Rarium shortsword\n").. "Mele damage: 20\nFull punch interval: 0.44\nRange: 3.8\nXtraores tool level: 9",
	inventory_image = "xtraores_shortsword_rarium.png",
	range = 3.8,
	tool_capabilities = {
		full_punch_interval = 0.44,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.6, [2]=0.20, [3]=0.015}, uses=300, maxlevel=3},
		},
	damage_groups = {fleshy=20},
	},
	sound = {breaks = "default_tool_breaks"},
})

r_xt('xtraores:pickaxe_rarium', 'xtraores:axe_rarium', 'xtraores:sword_rarium', 'xtraores:spear_rarium', 'xtraores:shortsword_rarium', 'xtraores:rarium_ingot', 'xtraores:duraglass_handle')

-- orichalcum set

core.register_tool("xtraores:pickaxe_orichalcum", {
	description = "".. core.colorize("#68fff6", "Orichalcum pickaxe\n").. "Mele damage: 22\nFull punch interval: 0.72\nRange: 5.8\nXtraores tool level: 10",
	inventory_image = "xtraores_pickaxe_orichalcum.png",
	range = 5.8,
	tool_capabilities = {
		full_punch_interval = 0.72,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[11]=25.00, [10]=16.00, [9]=10.00, [8]=7.00, [7]=6.90, [6]=4.50, [5]=3.50, [4]=1.20, [1]=0.5, [2]=0.25, [3]=0.13}, uses=360, maxlevel=3},
			crumbly = {times={[1]=0.03, [2]=0.01, [3]=0.009}, uses=360, maxlevel=3},
		},
	damage_groups = {fleshy=22},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:axe_orichalcum", {
	description = "".. core.colorize("#68fff6", "Orichalcum axe\n").. "Mele damage: 22\nFull punch interval: 0.72\nRange: 5.8\nXtraores tool level: 10",
	inventory_image = "xtraores_axe_orichalcum.png",
	range = 5.8,
	tool_capabilities = {
		full_punch_interval = 0.72,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.5, [2]=0.15, [3]=0.075}, uses=360, maxlevel=3},
		},
	damage_groups = {fleshy=22},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:sword_orichalcum", {
	description = "".. core.colorize("#68fff6", "Orichalcum sword\n").. "Mele damage: 23\nFull punch interval: 0.52\nRange: 5.8\nXtraores tool level: 10",
	inventory_image = "xtraores_sword_orichalcum.png",
	range = 5.8,
	tool_capabilities = {
		full_punch_interval = 0.52,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.50, [2]=0.30, [3]=0.015}, uses=360, maxlevel=3},
		},
	damage_groups = {fleshy=23},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:spear_orichalcum", {
	description = "".. core.colorize("#68fff6", "Orichalcum spear\n").. "Mele damage: 24\nFull punch interval: 0.78\nRange: 7.2\nXtraores tool level: 10",
	inventory_image = "xtraores_spear_orichalcum.png",
	wield_scale = {x=2.0,y=2.0,z=1.0},
	range = 7.2,
	tool_capabilities = {
		full_punch_interval = 0.78,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.40, [2]=0.10, [3]=0.001}, uses=360, maxlevel=3},
		},
	damage_groups = {fleshy=24},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:shortsword_orichalcum", {
	description = "".. core.colorize("#68fff6", "Orichalcum shortsword\n").. "Mele damage: 23\nFull punch interval: 0.42\nRange: 3.9\nXtraores tool level: 10",
	inventory_image = "xtraores_shortsword_orichalcum.png",
	range = 3.9,
	tool_capabilities = {
		full_punch_interval = 0.42,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.4, [2]=0.15, [3]=0.010}, uses=360, maxlevel=3},
		},
	damage_groups = {fleshy=23},
	},
	sound = {breaks = "default_tool_breaks"},
})

r_xt('xtraores:pickaxe_orichalcum', 'xtraores:axe_orichalcum', 'xtraores:sword_orichalcum', 'xtraores:spear_orichalcum', 'xtraores:shortsword_orichalcum', 'xtraores:orichalcum_ingot', 'xtraores:duraglass_handle')

-- Titanium set

core.register_tool("xtraores:pickaxe_titanium", {
	description = "".. core.colorize("#68fff6", "Titanium pickaxe\n").. "Mele damage: 23\nFull punch interval: 0.70\nRange: 5.9\nXtraores tool level: 11",
	inventory_image = "xtraores_pickaxe_titanium.png",
	range = 5.9,
	tool_capabilities = {
		full_punch_interval = 0.70,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[12]=30.00, [11]=22.50, [10]=14.50, [9]=8.75, [8]=6.00, [7]=6.40, [6]=4.20, [5]=3.25, [4]=1.00, [1]=0.45, [2]=0.22, [3]=0.115}, uses=390, maxlevel=3},
			crumbly = {times={[1]=0.022, [2]=0.008, [3]=0.008}, uses=390, maxlevel=3},
		},
	damage_groups = {fleshy=23},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:axe_titanium", {
	description = "".. core.colorize("#68fff6", "Titanium axe\n").. "Mele damage: 23\nFull punch interval: 0.70\nRange: 5.9\nXtraores tool level: 11",
	inventory_image = "xtraores_axe_titanium.png",
	range = 5.9,
	tool_capabilities = {
		full_punch_interval = 0.70,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.45, [2]=0.13, [3]=0.065}, uses=390, maxlevel=3},
		},
	damage_groups = {fleshy=23},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:sword_titanium", {
	description = "".. core.colorize("#68fff6", "Titanium sword\n").. "Mele damage: 25\nFull punch interval: 0.50\nRange: 5.9\nXtraores tool level: 11",
	inventory_image = "xtraores_sword_titanium.png",
	range = 5.9,
	tool_capabilities = {
		full_punch_interval = 0.50,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.44, [2]=0.26, [3]=0.012}, uses=390, maxlevel=3},
		},
	damage_groups = {fleshy=25},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:spear_titanium", {
	description = "".. core.colorize("#68fff6", "Titanium spear\n").. "Mele damage: 26\nFull punch interval: 0.76\nRange: 7.35\nXtraores tool level: 11",
	inventory_image = "xtraores_spear_titanium.png",
	wield_scale = {x=2.0,y=2.0,z=1.0},
	range = 7.35,
	tool_capabilities = {
		full_punch_interval = 0.76,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.40, [2]=0.10, [3]=0.001}, uses=390, maxlevel=3},
		},
	damage_groups = {fleshy=26},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:shortsword_titanium", {
	description = "".. core.colorize("#68fff6", "Titanium shortsword\n").. "Mele damage: 23\nFull punch interval: 0.40\nRange: 3.95\nXtraores tool level: 11",
	inventory_image = "xtraores_shortsword_titanium.png",
	range = 3.95,
	tool_capabilities = {
		full_punch_interval = 0.40,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.35, [2]=0.12, [3]=0.008}, uses=390, maxlevel=3},
		},
	damage_groups = {fleshy=23},
	},
	sound = {breaks = "default_tool_breaks"},
})

r_xt('xtraores:pickaxe_titanium', 'xtraores:axe_titanium', 'xtraores:sword_titanium', 'xtraores:spear_titanium', 'xtraores:shortsword_titanium', 'xtraores:titanium_ingot', 'xtraores:duraglass_handle')

-- Chromium set

core.register_tool("xtraores:pickaxe_chromium", {
	description = "".. core.colorize("#68fff6", "Chromium pickaxe\n").. "Mele damage: 24\nFull punch interval: 0.69\nRange: 6.0\nXtraores tool level: 12",
	inventory_image = "xtraores_pickaxe_chromium.png",
	range = 6.0,
	tool_capabilities = {
		full_punch_interval = 0.69,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[13]=36.00,[12]=25.00, [11]=17.50, [10]=11.00, [9]=7.25, [8]=5.00, [7]=5.50, [6]=3.60, [5]=2.75, [4]=0.80, [1]=0.35, [2]=0.17, [3]=0.10}, uses=420, maxlevel=3},
			crumbly = {times={[1]=0.022, [2]=0.008, [3]=0.008}, uses=420, maxlevel=3},
		},
	damage_groups = {fleshy=24},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:axe_chromium", {
	description = "".. core.colorize("#68fff6", "Chromium axe\n").. "Mele damage: 24\nFull punch interval: 0.69\nRange: 6.0\nXtraores tool level: 12",
	inventory_image = "xtraores_axe_chromium.png",
	range = 6.0,
	tool_capabilities = {
		full_punch_interval = 0.69,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.40, [2]=0.11, [3]=0.055}, uses=420, maxlevel=3},
		},
	damage_groups = {fleshy=24},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:sword_chromium", {
	description = "".. core.colorize("#68fff6", "Chromium sword\n").. "Mele damage: 27\nFull punch interval: 0.48\nRange: 6.0\nXtraores tool level: 12",
	inventory_image = "xtraores_sword_chromium.png",
	range = 6.0,
	tool_capabilities = {
		full_punch_interval = 0.48,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.30, [2]=0.19, [3]=0.008}, uses=420, maxlevel=3},
		},
	damage_groups = {fleshy=27},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:spear_chromium", {
	description = "".. core.colorize("#68fff6", "Chromium spear\n").. "Mele damage: 29\nFull punch interval: 0.75\nRange: 7.5\nXtraores tool level: 12",
	inventory_image = "xtraores_spear_chromium.png",
	wield_scale = {x=2.0,y=2.0,z=1.0},
	range = 7.5,
	tool_capabilities = {
		full_punch_interval = 0.75,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.30, [2]=0.08, [3]=0.001}, uses=420, maxlevel=3},
		},
	damage_groups = {fleshy=29},
	},
	sound = {breaks = "default_tool_breaks"},
})

core.register_tool("xtraores:shortsword_chromium", {
	description = "".. core.colorize("#68fff6", "Chromium shortsword\n").. "Mele damage: 25\nFull punch interval: 0.38\nRange: 4.0\nXtraores tool level: 12",
	inventory_image = "xtraores_shortsword_chromium.png",
	range = 4.0,
	tool_capabilities = {
		full_punch_interval = 0.38,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.35, [2]=0.12, [3]=0.008}, uses=420, maxlevel=3},
		},
	damage_groups = {fleshy=23},
	},
	sound = {breaks = "default_tool_breaks"},
})

r_xt('xtraores:pickaxe_chromium', 'xtraores:axe_chromium', 'xtraores:sword_chromium', 'xtraores:spear_chromium', 'xtraores:shortsword_chromium', 'xtraores:chromium_ingot', 'xtraores:duraglass_handle')
