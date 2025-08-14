if core.get_mapgen_setting("mg_name") ~= "v6" then
--structure generation
core.register_decoration({
	deco_type = "schematic",
	place_on = "default:dirt_with_grass",
	place_offset_y = 15,
	sidelen = 80,
	fill_ratio = .000016,
	y_max = 70,
	y_min = 1,
	schematic = Anest,
	spawn_by = "default:dirt_with_grass",
	num_spawn_by = 8,
	flags = "place_center_x, place_center_z",
})

core.register_decoration({
	deco_type = "schematic",
	place_on = "default:sand",
	place_offset_y = -2,
	sidelen = 80,
	fill_ratio = .00016,
	y_max = 0,
	y_min = -12,
	schematic = Cnest,
	rotation = "random",
	spawn_by = "default:sand",
	num_spawn_by = 8,
	flags = "place_center_x, place_center_z",
})

core.register_decoration({
	deco_type = "schematic",
	place_on = "default:dirt_with_grass",
	sidelen = 80,
	fill_ratio = .000016,
	y_max = 100,
	y_min = 1,
	schematic = Mnest,
	spawn_by = "default:dirt_with_grass",
	num_spawn_by = 8,
	flags = "place_center_x, place_center_z",
})

core.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_rainforest_litter", "default:jungle_trunk"},
	place_offset_y = -6,
	sidelen = 80,
	fill_ratio = .00016,
	y_max = 100,
	y_min = 1,
	schematic = Snest1,
	rotation = "random",
	spawn_by = "default:dirt_with_rainforest_litter",
	num_spawn_by = 8,
	flags = "place_center_x, place_center_z",
})

core.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_rainforest_litter", "default:jungle_trunk"},
	place_offset_y = -6,
	sidelen = 80,
	fill_ratio = .00016,
	y_max = 100,
	y_min = 1,
	schematic = Snest2,
	rotation = "random",
	spawn_by = "default:dirt_with_rainforest_litter",
	num_spawn_by = 8,
	flags = "place_center_x, place_center_z",
})

core.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_rainforest_litter", "default:jungle_trunk"},
	place_offset_y = -6,
	sidelen = 80,
	fill_ratio = .00016,
	y_max = 100,
	y_min = 1,
	schematic = Snest3,
	rotation = "random",
	spawn_by = "default:dirt_with_rainforest_litter",
	num_spawn_by = 8,
	flags = "place_center_x, place_center_z",
})
end
