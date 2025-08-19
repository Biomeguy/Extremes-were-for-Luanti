core.register_alias("mv_cable", "technic:mv_cable")

core.register_craft({
	output = 'technic:mv_cable 3',
	recipe ={
		{'technic:rubber', 'technic:rubber', 'technic:rubber'},
		{'technic:lv_cable', 'technic:lv_cable', 'technic:lv_cable'},
		{'technic:rubber', 'technic:rubber', 'technic:rubber'}
	}
})

technic.register_cable("MV", 2.5/16)
