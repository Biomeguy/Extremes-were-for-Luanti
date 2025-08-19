
local cast_ingot = "default:cast_iron_ingot"

core.register_craft({
	output = 'technic:iron_chest',
	recipe = {
		{cast_ingot, cast_ingot, cast_ingot},
		{cast_ingot, 'default:chest', cast_ingot},
		{cast_ingot, cast_ingot, cast_ingot}
	}
})

core.register_craft({
	output = 'technic:iron_locked_chest',
	recipe = {
		{cast_ingot, cast_ingot, cast_ingot},
		{cast_ingot, 'default:chest_locked', cast_ingot},
		{cast_ingot, cast_ingot, cast_ingot}
	}
})

core.register_craft({
	output = 'technic:iron_locked_chest',
	recipe = {
		{'default:padlock'},
		{'technic:iron_chest'}
	}
})

technic.chests:register("Iron", {
	width = 9,
	height = 5,
	sort = true,
	autosort = false,
	infotext = false,
	color = false,
	locked = false,
})

technic.chests:register("Iron", {
	width = 9,
	height = 5,
	sort = true,
	autosort = false,
	infotext = false,
	color = false,
	locked = true,
})

