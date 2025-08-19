
core.register_alias("grinder", "technic:lv_grinder")
core.register_craft({
	output = 'technic:lv_grinder',
	recipe = {
		{'default:desert_stone', 'default:diamond', 'default:desert_stone'},
		{'default:desert_stone', 'technic:machine_casing', 'default:desert_stone'},
		{'default:granite', 'technic:lv_cable', 'default:granite'}
	}
})

technic.register_grinder({tier="LV", demand={200}, speed=1})
