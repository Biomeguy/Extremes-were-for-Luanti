-- MV grinder

core.register_craft({
	output = 'technic:mv_grinder',
	recipe = {
		{'default:stainless_steel_ingot', 'technic:lv_grinder', 'default:stainless_steel_ingot'},
		{'pipeworks:tube_1', 'technic:mv_transformer', 'pipeworks:tube_1'},
		{'default:stainless_steel_ingot', 'technic:mv_cable', 'default:stainless_steel_ingot'}
	}
})

technic.register_grinder({tier="MV", demand={600, 450, 300}, speed=2, upgrade=1, tube=1})
