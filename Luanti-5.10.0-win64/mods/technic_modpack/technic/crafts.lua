-- check if we have the necessary dependencies to allow actually using these materials in the crafts
local mesecons_insulated = core.get_modpath("mesecons_insulated")

if core.get_modpath("pipeworks") then
-- Remove some recipes

-- Accelerator tube
if pipeworks.enable_accelerator_tube then
	core.clear_craft({
		output = "pipeworks:accelerator_tube_1",
	})

	core.register_craft({
		output = 'pipeworks:accelerator_tube_1',
		recipe = {
			{'technic:copper_coil', 'pipeworks:tube_1', 'technic:copper_coil'}
		}
	})
end

-- Teleport tube
if pipeworks.enable_teleport_tube then
	core.clear_craft({
		output = "pipeworks:teleport_tube_1",
	})

	core.register_craft({
		output = 'pipeworks:teleport_tube_1',
		recipe = {
			{'default:mese_crystal', 'technic:copper_coil', 'default:mese_crystal'},
			{'pipeworks:tube_1', 'technic:control_logic_unit', 'pipeworks:tube_1'},
			{'default:mese_crystal', 'technic:copper_coil', 'default:mese_crystal'}
		}
	})
end
end

-- tubes crafting recipes

core.register_craft({
	output = 'technic:diamond_drill_head',
	recipe = {
		{'default:stainless_steel_ingot', 'default:diamond', 'default:stainless_steel_ingot'},
		{'default:diamond', '', 'default:diamond'},
		{'default:stainless_steel_ingot', 'default:diamond', 'default:stainless_steel_ingot'}
	}
})

core.register_craft({
	output = 'technic:green_energy_crystal',
	recipe = {
		{'default:gold_ingot', 'technic:battery', 'dye:green'},
		{'technic:battery', 'technic:red_energy_crystal', 'technic:battery'},
		{'dye:green', 'technic:battery', 'default:gold_ingot'}
	}
})

core.register_craft({
	output = 'technic:blue_energy_crystal',
	recipe = {
		{'default:mithril_ingot', 'technic:battery', 'dye:blue'},
		{'technic:battery', 'technic:green_energy_crystal', 'technic:battery'},
		{'dye:blue', 'technic:battery', 'default:mithril_ingot'}
	}
})

core.register_craft({
	output = 'technic:red_energy_crystal',
	recipe = {
		{'default:silver_ingot', 'technic:battery', 'dye:red'},
		{'technic:battery', 'basic_materials:energy_crystal_simple', 'technic:battery'},
		{'dye:red', 'technic:battery', 'default:silver_ingot'}
	}
})

core.register_craft({
	output = 'technic:copper_coil',
	recipe = {
		{'basic_materials:copper_wire', 'default:wrought_iron_ingot', 'basic_materials:copper_wire'},
		{'default:wrought_iron_ingot', '', 'default:wrought_iron_ingot'},
		{'basic_materials:copper_wire', 'default:wrought_iron_ingot', 'basic_materials:copper_wire'}
	},
	replacements = {
		{"basic_materials:copper_wire", "basic_materials:empty_spool"},
		{"basic_materials:copper_wire", "basic_materials:empty_spool"},
		{"basic_materials:copper_wire", "basic_materials:empty_spool"},
		{"basic_materials:copper_wire", "basic_materials:empty_spool"}
	}
})

local isolation = mesecons_insulated and "mesecons_insulated:fiber" or "technic:rubber"

core.register_craft({
	output = 'technic:lv_transformer',
	recipe = {
		{isolation, 'default:wrought_iron_ingot', isolation},
		{'technic:copper_coil', 'default:wrought_iron_ingot', 'technic:copper_coil'},
		{'default:wrought_iron_ingot', 'default:wrought_iron_ingot', 'default:wrought_iron_ingot'}
	}
})

core.register_craft({
	output = 'technic:mv_transformer',
	recipe = {
		{isolation, 'default:steel_ingot', isolation},
		{'technic:copper_coil', 'default:steel_ingot', 'technic:copper_coil'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'}
	}
})

core.register_craft({
	output = 'technic:hv_transformer',
	recipe = {
		{isolation, 'default:stainless_steel_ingot', isolation},
		{'technic:copper_coil', 'default:stainless_steel_ingot', 'technic:copper_coil'},
		{'default:stainless_steel_ingot', 'default:stainless_steel_ingot', 'default:stainless_steel_ingot'}
	}
})

core.register_craft({
	output = 'technic:control_logic_unit',
	recipe = {
		{'', 'basic_materials:gold_wire', ''},
		{'default:copper_ingot', 'technic:silicon_wafer', 'default:copper_ingot'},
		{'', 'default:chromium_ingot', ''}
	},
	replacements = {{"basic_materials:gold_wire", "basic_materials:empty_spool"}}
})

core.register_craft({
	output = 'technic:mixed_metal_ingot 9',
	recipe = {
		{'default:stainless_steel_ingot', 'default:stainless_steel_ingot', 'default:stainless_steel_ingot'},
		{'default:bronze_ingot', 'default:bronze_ingot', 'default:bronze_ingot'},
		{'default:tin_ingot', 'default:tin_ingot', 'default:tin_ingot'}
	}
})

core.register_craft({
	output = 'technic:carbon_cloth',
	recipe = {
		{'technic:graphite', 'technic:graphite', 'technic:graphite'}
	}
})

core.register_craft({
	output = "technic:machine_casing",
	recipe = {
		{"default:cast_iron_ingot", "default:cast_iron_ingot", "default:cast_iron_ingot"},
		{"default:cast_iron_ingot", "default:brass_ingot", "default:cast_iron_ingot"},
		{"default:cast_iron_ingot", "default:cast_iron_ingot", "default:cast_iron_ingot"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:dirt 2",
	recipe = {"technic:stone_dust", "group:leaves", "group:water_bucket", "group:sand"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})
