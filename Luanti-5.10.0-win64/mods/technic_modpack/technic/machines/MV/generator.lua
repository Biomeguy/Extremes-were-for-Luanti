core.register_alias("generator_mv", "technic:generator_mv")

core.register_craft({
	output = 'technic:mv_generator',
	recipe = {
		{'default:stainless_steel_ingot', 'technic:lv_generator', 'default:stainless_steel_ingot'},
		{'pipeworks:tube_1', 'technic:mv_transformer', 'pipeworks:tube_1'},
		{'default:stainless_steel_ingot', 'technic:mv_cable', 'default:stainless_steel_ingot'}
	}
})

technic.register_generator({tier="MV", tube=1, supply=600})

