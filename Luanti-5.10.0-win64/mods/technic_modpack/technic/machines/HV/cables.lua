
core.register_craft({
	output = 'technic:hv_cable 3',
	recipe = {
		{'basic_materials:plastic_sheet', 'basic_materials:plastic_sheet', 'basic_materials:plastic_sheet'},
		{'technic:mv_cable', 'technic:mv_cable', 'technic:mv_cable'},
		{'basic_materials:plastic_sheet', 'basic_materials:plastic_sheet', 'basic_materials:plastic_sheet'}
	}
})

technic.register_cable("HV", 3/16)
