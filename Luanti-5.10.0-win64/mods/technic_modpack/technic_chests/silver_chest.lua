core.register_craft({
	output = 'technic:silver_chest',
	recipe = {
		{'default:silver_ingot','default:silver_ingot','default:silver_ingot'},
		{'default:silver_ingot','default:chest','default:silver_ingot'},
		{'default:silver_ingot','default:silver_ingot','default:silver_ingot'}
	}
})

core.register_craft({
	output = 'technic:silver_locked_chest',
	recipe = {
		{'default:silver_ingot','default:silver_ingot','default:silver_ingot'},
		{'default:silver_ingot','default:chest_locked','default:silver_ingot'},
		{'default:silver_ingot','default:silver_ingot','default:silver_ingot'}
	}
})

core.register_craft({
	output = 'technic:silver_locked_chest',
	recipe = {
		{'default:padlock'},
		{'technic:silver_chest'}
	}
})

technic.chests:register("Silver", {
	width = 12,
	height = 6,
	sort = true,
	autosort = true,
	infotext = true,
	color = false,
	locked = false,
})

technic.chests:register("Silver", {
	width = 12,
	height = 6,
	sort = true,
	autosort = true,
	infotext = true,
	color = false,
	locked = true,
})

