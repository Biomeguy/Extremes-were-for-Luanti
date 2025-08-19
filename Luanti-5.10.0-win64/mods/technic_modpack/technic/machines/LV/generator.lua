-- The electric generator.
-- A simple device to get started on the electric machines.
-- Inefficient and expensive in fuel (200EU per tick)
-- Also only allows for LV machinery to run.

core.register_alias("lv_generator", "technic:lv_generator")

core.register_craft({
	output = 'technic:lv_generator',
	recipe = {
		{'default:stone', 'default:furnace', 'default:stone'},
		{'default:stone', 'technic:machine_casing', 'default:stone'},
		{'default:stone', 'technic:lv_cable', 'default:stone'}
	}
})

technic.register_generator({tier="LV", supply=200})
