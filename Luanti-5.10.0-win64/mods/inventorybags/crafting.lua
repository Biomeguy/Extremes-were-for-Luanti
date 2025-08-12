-- Craftitem / Misc

core.register_craft({
	output = 'inventorybags:item_filter',
	recipe = {
		{'default:steel_ingot', 'group:stick', 'default:steel_ingot'},
		{'group:stick', 'fabric:sheet_white', 'group:stick'},
		{'default:steel_ingot', 'group:stick', 'default:steel_ingot'}
	}
})

core.register_craft({
	output = 'inventorybags:item_puller',
	recipe = {
		{'default:steel_ingot', 'default:gold_ingot', 'default:steel_ingot'},
		{'default:obsidian_glass', 'inventorybags:item_filter', 'default:obsidian_glass'},
		{'default:obsidian_glass', '', 'default:obsidian_glass'}
	}
})

core.register_craft({
	output = 'inventorybags:inventory_connecter',
	recipe = {
		{'fabric:sheet_white', 'fabric:sheet_white', 'fabric:sheet_white'},
		{'inventorybags:item_puller', 'default:mese_crystal', 'inventorybags:item_puller'},
		{'fabric:sheet_white', 'fabric:sheet_white', 'fabric:sheet_white'}
	}
})

-- Upgrade Device

core.register_craft({
	output = 'inventorybags:bud',
	recipe = {
		{'group:stick', 'default:meselamp_torch', ''},
		{'group:stick', 'inventorybags:upgrade_base', ''},
		{'group:wood', 'group:wood', 'group:wood'}
	}
})

-- Upgrades

core.register_craft({
	output = 'inventorybags:upgrade_base',
	recipe = {
		{'fabric:string', 'group:stick', 'fabric:string'},
		{'group:stick', 'default:mese_crystal_fragment', 'group:stick'},
		{'fabric:string', 'group:stick', 'fabric:string'}
	}
})

core.register_craft({
	type = "shapeless",
	output = "inventorybags:rename_upgrade",
	recipe = {"inventorybags:upgrade_base", "default:paper"},
})

core.register_craft({
	type = "shapeless",
	output = "inventorybags:coloring_upgrade",
	recipe = {"inventorybags:upgrade_base", "dye:cyan", "dye:magenta", "dye:yellow", "dye:black", "dye:white"},
})

core.register_craft({
	type = "shapeless",
	output = "inventorybags:coloring_upgrade",
	recipe = {"inventorybags:upgrade_base", "dye:red", "dye:green", "dye:blue", "dye:black", "dye:white"},
})

if core.get_modpath("node_texture_modifier") then
	core.register_craft({
		type = "shapeless",
		output = "inventorybags:coloring_upgrade",
		recipe = {"inventorybags:upgrade_base", "node_texture_modifier:dye_mixture"},
	})
end

core.register_craft({
	output = 'inventorybags:collecting_upgrade',
	recipe = {
		{'default:steel_ingot', 'inventorybags:upgrade_base', 'default:steel_ingot'},
		{'default:steel_ingot', 'inventorybags:item_puller', 'default:steel_ingot'},
		{'default:obsidian_glass', '', 'default:obsidian_glass'},
	}
})

core.register_craft({
	output = 'inventorybags:advanced_collecting_upgrade',
	recipe = {
		{'default:steel_ingot', 'inventorybags:collecting_upgrade', 'default:steel_ingot'},
		{'default:steel_ingot', 'inventorybags:item_puller', 'default:steel_ingot'},
		{'default:obsidian_glass', '', 'default:obsidian_glass'},
	}
})

core.register_craft({
	output = 'inventorybags:sorting_upgrade',
	recipe = {
		{'', 'inventorybags:upgrade_base', ''},
		{'default:ladder_steel', 'default:ladder_steel', 'default:ladder_steel'},
		{'group:fabric_block', 'inventorybags:item_filter', 'group:fabric_block'},
	}
})

core.register_craft({
	output = 'inventorybags:autocrafting_upgrade',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'default:steel_ingot', 'default:mese_crystal', 'default:steel_ingot'},
		{'default:steel_ingot', 'inventorybags:upgrade_base', 'default:steel_ingot'},
	}
})

if core.get_modpath("pipeworks") then
	core.register_craft({
		type = "shapeless",
		output = 'inventorybags:autocrafting_upgrade',
		recipe = {"inventorybags:upgrade_base", "pipeworks:autocrafter",},
	})
end


core.register_craft({
	output = 'inventorybags:dumping_upgrade',
	recipe = {
		{'default:steel_ingot', 'inventorybags:upgrade_base', 'default:steel_ingot'},
		{'default:steel_ingot', 'inventorybags:item_puller', 'default:steel_ingot'},
		{'group:stone', 'bucket:bucket_lava', 'group:stone'}
	},
	replacements = {{"bucket:bucket_lava", "bucket:bucket_empty"}}
})

core.register_craft({
	output = 'inventorybags:opening_sound_upgrade',
	recipe = {
		{'inventorybags:closing_sound_upgrade'},
	}
})

core.register_craft({
	output = 'inventorybags:closing_sound_upgrade',
	recipe = {
		{'inventorybags:opening_sound_upgrade'},
	}
})

core.register_craft({
	output = 'inventorybags:opening_sound_upgrade',
	recipe = {
		{'', '', 'default:steel_ingot'},
		{'inventorybags:upgrade_base', 'default:steel_ingot', 'default:paper'},
		{'', '', 'default:steel_ingot'},
	}
})

core.register_craft({
	output = 'inventorybags:refilling_upgrade',
	recipe = {
		{'default:bronze_ingot', 'inventorybags:item_puller', 'default:bronze_ingot'},
		{'default:bronze_ingot', 'inventorybags:upgrade_base', 'default:bronze_ingot'},
	}
})

core.register_craft({
	output = 'inventorybags:closing_sound_upgrade',
	recipe = {
		{'default:steel_ingot', '', ''},
		{'default:paper', 'default:steel_ingot', 'inventorybags:upgrade_base'},
		{'default:steel_ingot', '', ''},
	}
})

if core.registered_items["inventorybags:explosion_upgrade"] then
	core.register_craft({
		type = "shapeless",
		output = 'inventorybags:explosion_upgrade',
		recipe = {"inventorybags:upgrade_base", "tnt:gunpowder", "tnt:tnt"},
	})
end

core.register_craft({
	output = 'inventorybags:storage_upgrade_tier_1',
	recipe = {
		{'default:steel_block', 'inventorybags:large_pouch', 'default:steel_block'},
		{'inventorybags:large_pouch', 'inventorybags:upgrade_base', 'inventorybags:large_pouch'},
		{'default:steel_block', 'inventorybags:large_pouch', 'default:steel_block'},
	}
})

core.register_craft({
	output = 'inventorybags:storage_upgrade_tier_2',
	recipe = {
		{'default:gold_block', 'inventorybags:large_pouch', 'default:gold_block'},
		{'inventorybags:large_pouch', 'inventorybags:storage_upgrade_tier_1', 'inventorybags:large_pouch'},
		{'default:gold_block', 'inventorybags:large_pouch', 'default:gold_block'},
	}
})

core.register_craft({
	output = 'inventorybags:storage_upgrade_tier_3',
	recipe = {
		{'default:diamond_block', 'inventorybags:large_pouch', 'default:diamond_block'},
		{'inventorybags:large_pouch', 'inventorybags:storage_upgrade_tier_2', 'inventorybags:large_pouch'},
		{'default:diamond_block', 'inventorybags:large_pouch', 'default:diamond_block'},
	}
})

-- Bags

core.register_craft({
	output = 'inventorybags:tiny_pouch',
	recipe = {
		{'fabric:string'},
		{'fabric:sheet_white'}
	},
})

core.register_craft({
	output = 'inventorybags:small_pouch',
	recipe = {
		{'', 'fabric:string', ''},
		{'fabric:sheet_white', 'inventorybags:tiny_pouch', 'fabric:sheet_white'},
		{'fabric:sheet_white', 'inventorybags:tiny_pouch', 'fabric:sheet_white'}
	},
})

core.register_craft({
	output = 'inventorybags:small_pouch',
	recipe = {
		{'fabric:string', 'fabric:string', 'fabric:string'},
		{'fabric:sheet_white', 'fabric:sheet_white', 'fabric:sheet_white'},
		{'fabric:sheet_white', 'fabric:sheet_white', 'fabric:sheet_white'}
	},
})

core.register_craft({
	output = 'inventorybags:medium_pouch',
	recipe = {
		{'', 'fabric:string', ''},
		{'fabric:sheet_white', 'inventorybags:small_pouch', 'fabric:sheet_white'},
		{'fabric:sheet_white', 'inventorybags:small_pouch', 'fabric:sheet_white'}
	},
})

core.register_craft({
	output = 'inventorybags:large_pouch',
	recipe = {
		{'', 'fabric:string', ''},
		{'fabric:sheet_white', 'inventorybags:medium_pouch', 'fabric:sheet_white'},
		{'fabric:sheet_white', 'inventorybags:medium_pouch', 'fabric:sheet_white'}
	},
})

core.register_craft({
	output = 'inventorybags:backpack',
	recipe = {
		{'fabric:sheet_white', 'fabric:sheet_white', 'fabric:string'},
		{'fabric:sheet_white', 'inventorybags:large_pouch', 'fabric:string'},
		{'fabric:sheet_white', 'inventorybags:large_pouch', 'fabric:string'}
	},
})

core.register_craft({
	output = 'inventorybags:suitcase',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'inventorybags:large_pouch', 'fabric:sheet_white', 'inventorybags:large_pouch'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'}
	},
})

core.register_craft({
	output = 'inventorybags:bag_on_a_stick',
	recipe = {
		{'', '', 'group:stick'},
		{'', 'group:stick', 'inventorybags:large_pouch'},
		{'group:stick', '', 'inventorybags:large_pouch'}
	},
})

core.register_craft({
	output = 'inventorybags:belt_bag',
	recipe = {
		{'fabric:string', 'inventorybags:large_pouch', 'fabric:string'},
		{'fabric:string', 'fabric:sheet_white', 'fabric:string'},
		{'fabric:string', 'inventorybags:large_pouch', 'fabric:string'}
	},
})

core.register_craft({
	output = 'inventorybags:hand_bag',
	recipe = {
		{'fabric:string', '', 'fabric:string'},
		{'fabric:sheet_white', 'inventorybags:large_pouch', 'fabric:sheet_white'},
		{'fabric:sheet_white', 'inventorybags:large_pouch', 'fabric:sheet_white'}
	},
})

core.register_craft({
	output = 'inventorybags:chest_bag',
	recipe = {
		{'fabric:string', '', 'fabric:string'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'inventorybags:large_pouch', 'default:chest', 'inventorybags:large_pouch'}
	},
})

core.register_craft({
	output = 'inventorybags:satchel',
	recipe = {
		{'fabric:string', 'fabric:string', 'fabric:string'},
		{'fabric:string', '', 'fabric:string'},
		{'inventorybags:large_pouch', 'fabric:sheet_white', 'inventorybags:large_pouch'}
	},
})

core.register_craft({
	output = 'inventorybags:paper_bag',
	recipe = {
		{'default:paper', '', 'default:paper'},
		{'default:paper', 'default:paper', 'default:paper'},
		{'default:paper', 'default:paper', 'default:paper'}
	},
})

if core.registered_items["basic_materials:plastic_sheet"] then
	core.register_craft({
		output = 'inventorybags:plastic_bag',
		recipe = {
			{'basic_materials:plastic_sheet', '', 'basic_materials:plastic_sheet'},
			{'basic_materials:plastic_sheet', 'basic_materials:plastic_sheet', 'basic_materials:plastic_sheet'},
			{'basic_materials:plastic_sheet', 'basic_materials:plastic_sheet', 'basic_materials:plastic_sheet'}
		},
	})
end

core.register_craft({
	output = 'inventorybags:bag_transporting_bag',
	recipe = {
		{'fabric:sheet_white', 'inventorybags:large_pouch', 'fabric:sheet_white'},
		{'inventorybags:large_pouch', 'inventorybags:small_pouch', 'inventorybags:large_pouch'},
		{'fabric:sheet_white', 'inventorybags:large_pouch', 'fabric:sheet_white'}
	},
})

if core.settings:get_bool("inventorybags_enable_item_teleportation_bag") then
	core.register_craft({
		output = 'inventorybags:item_teleportation_bag',
		recipe = {
			{'default:diamond', 'inventorybags:large_pouch', 'default:diamond'},
			{'default:diamond', 'inventorybags:inventory_connecter', 'default:diamond'},
			{'default:diamond', 'default:mese', 'default:diamond'}
		},
	})
	if core.get_modpath("pipeworks") then
		core.register_craft({
			type = "shapeless",
			output = 'inventorybags:item_teleportation_bag',
			recipe = {"inventorybags:large_pouch", "inventorybags:inventory_connecter", "pipeworks:teleport_tube_1"},
		})
	end
end

if core.get_modpath("xdecor") then
	core.register_craft({
		type = "shapeless",
		output = 'inventorybags:ender_bag',
		recipe = {"inventorybags:large_pouch", "inventorybags:inventory_connecter", "xdecor:enderchest"},
	})
end

if core.get_modpath("more_chests") then
	core.register_craft({
		type = "shapeless",
		output = 'inventorybags:wifi_bag',
		recipe = {"inventorybags:large_pouch", "inventorybags:inventory_connecter", "more_chests:wifi"},
	})
end

if core.get_modpath("beds") then
	core.register_craft({
		output = 'inventorybags:sleeping_bag',
		recipe = {
			{"fabric:block_red", "fabric:block_red", "fabric:block_white"},
			{"", "inventorybags:large_pouch", ""}
		},
	})
	
	core.register_craft({
		type = "shapeless",
		output = 'inventorybags:sleeping_bag',
		recipe = {"inventorybags:large_pouch", "group:bed"},
	})
end

if not core.settings:get_bool("inventorybags_dialable_bag_of_winds") then
	core.register_craft({
		output = 'inventorybags:bag_of_winds_closed',
		recipe = {
			{"default:gold_block", "inventorybags:large_pouch", "default:gold_block"},
			{"default:diamond_block", "default:mese", "default:diamond_block"},
			{"default:diamond_block", "default:mese", "default:diamond_block"}
		},
	})
end
