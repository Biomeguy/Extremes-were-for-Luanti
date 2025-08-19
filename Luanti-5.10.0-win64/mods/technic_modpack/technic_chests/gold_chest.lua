core.register_craft({
	output = 'technic:gold_chest',
	recipe = {
		{'default:gold_ingot','default:gold_ingot','default:gold_ingot'},
		{'default:gold_ingot',"default:chest",'default:gold_ingot'},
		{'default:gold_ingot','default:gold_ingot','default:gold_ingot'}
	}
})

core.register_craft({
	output = 'technic:gold_locked_chest',
	recipe = {
		{'default:gold_ingot','default:gold_ingot','default:gold_ingot'},
		{'default:gold_ingot',"default:chest_locked",'default:gold_ingot'},
		{'default:gold_ingot','default:gold_ingot','default:gold_ingot'}
	}
})

core.register_craft({
	output = 'technic:gold_locked_chest',
	recipe = {
		{'default:padlock'},
		{'technic:gold_chest'}
	}
})

technic.chests:register("Gold", {
	width = 15,
	height = 6,
	sort = true,
	autosort = true,
	infotext = true,
	color = true,
	locked = false,
})

technic.chests:register("Gold", {
	width = 15,
	height = 6,
	sort = true,
	autosort = true,
	infotext = true,
	color = true,
	locked = true,
})

