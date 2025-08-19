core.register_craft({
	output = 'technic:copper_chest',
	recipe = {
		{'default:copper_ingot','default:copper_ingot','default:copper_ingot'},
		{'default:copper_ingot','default:chest','default:copper_ingot'},
		{'default:copper_ingot','default:copper_ingot','default:copper_ingot'}
	}
})

core.register_craft({
	output = 'technic:copper_locked_chest',
	recipe = {
		{'default:copper_ingot','default:copper_ingot','default:copper_ingot'},
		{'default:copper_ingot','default:chest_locked','default:copper_ingot'},
		{'default:copper_ingot','default:copper_ingot','default:copper_ingot'}
	}
})

core.register_craft({
	output = 'technic:copper_locked_chest',
	recipe = {
		{'default:padlock'},
		{'technic:copper_chest'}
	}
})

technic.chests:register("Copper", {
	width = 12,
	height = 5,
	sort = true,
	autosort = true,
	infotext = false,
	color = false,
	locked = false,
})

technic.chests:register("Copper", {
	width = 12,
	height = 5,
	sort = true,
	autosort = true,
	infotext = false,
	color = false,
	locked = true,
})

