core.register_craft({
	output = 'technic:mithril_chest',
	recipe = {
		{'default:mithril_ingot','default:mithril_ingot','default:mithril_ingot'},
		{'default:mithril_ingot','default:chest','default:mithril_ingot'},
		{'default:mithril_ingot','default:mithril_ingot','default:mithril_ingot'}
	}
})

core.register_craft({
	output = 'technic:mithril_locked_chest',
	recipe = {
		{'default:mithril_ingot','default:mithril_ingot','default:mithril_ingot'},
		{'default:mithril_ingot','default:chest_locked','default:mithril_ingot'},
		{'default:mithril_ingot','default:mithril_ingot','default:mithril_ingot'}
	}
})

core.register_craft({
	output = 'technic:mithril_locked_chest',
	recipe = {
		{'default:padlock'},
		{'technic:mithril_chest'}
	}
})

technic.chests:register("Mithril", {
	width = 15,
	height = 6,
	sort = true,
	autosort = true,
	infotext = false,
	color = false,
	locked = false,
})

technic.chests:register("Mithril", {
	width = 15,
	height = 6,
	sort = true,
	autosort = true,
	infotext = false,
	color = false,
	locked = true,
})

