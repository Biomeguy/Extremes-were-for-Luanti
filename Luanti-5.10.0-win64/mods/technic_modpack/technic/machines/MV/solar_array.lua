
core.register_craft({
	output = 'technic:solar_array_mv',
	recipe = {
		{'technic:solar_array_lv', 'technic:solar_array_lv', 'technic:solar_array_lv'},
		{'default:steel_ingot', 'technic:mv_transformer', 'default:steel_ingot'},
		{'', 'technic:mv_cable', ''}
	}
})

technic.register_solar_array({tier="MV", power=30})

-- compatibility alias for upgrading from old versions of technic
core.register_alias("technic:solar_panel_mv", "technic:solar_array_mv")
