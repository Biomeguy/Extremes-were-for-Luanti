
nsspf.box_1 = {
	type = "fixed",
	fixed = {-.28, -.49, -.28, .28, .06, .28}
}

nsspf.box_2 = {
	type = "fixed",
	fixed = {-.28, -.49, -.28, .28, -.26, .28}
}

nsspf.box_3 = {
	type = "fixed",
	fixed = {-.15, -.49, -.15, .15, .06, .15}
}

nsspf.box_4 = {
	type = "fixed",
	fixed = {-.05, -.49, -.05, .05, .2, .05}
}

nsspf.box_5 = {
	type = "fixed",
	fixed = {-.5, -.1, -.5, .5, .1, .5}
}

nsspf.box_6 = {
	type = "fixed",
	fixed = {-.2, 0, .2, .2, .4, .5}
}

nsspf.box_7 = {
	type = "fixed",
	fixed = {-.2, -.4, .2, .2, .4, .5}
}

nsspf.box_8 = {
	type = "fixed",
	fixed = {-.1, -.49, -.1, .1, -.1, .1}
}

nsspf.box_9 = {
	type = "fixed",
	fixed = {-.3, -.49, -.3, .3, -.3, .3}
}

nsspf.box_10 = {
	type = "fixed",
	fixed = {-.05, -.49, -.05, .05, -.2, .05}
}

nsspf.box_11 = {
	type = "fixed",
	fixed = {-.05, -.49, -.05, .05, 0, .05}
}

core.register_node("nsspf:boletus_edulis", {
	description = "Boletus edulis",
	drawtype = "mesh",
	mesh = "boletus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"boletus_edulis.png"},
	groups = {shroom=1, snappy=3},
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	on_place = function(itemstack, placer, pointd)
		return
	end,
	on_use = core.item_eat(2),
	selection_box = nsspf.box_1,
 	collision_box = nsspf.box_1,
})

core.register_node("nsspf:cooked_boletus_edulis", {
	description = "Cooked Boletus edulis",
	drawtype = "mesh",
	mesh = "boletus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_boletus_edulis.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(16),
	selection_box = nsspf.box_1,
	on_place = function(itemstack, placer, pointd)
  		return
  	end,
 	collision_box = nsspf.box_1,
})

core.register_node("nsspf:boletus_edulis_fungusdirt", {
	description = "Boletus edulis Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:boletus_edulis_spores"}, rarity = 16},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:cantharellus_cibarius", {
	description = "Cantharellus cibarius",
	drawtype = "mesh",
	mesh = "cantharellus_cibarius.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	on_place = function(itemstack, placer, pointd)
		return
	end,
	tiles = {"cantharellus_cibarius.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(1),
	selection_box = nsspf.box_2,
	collision_box = nsspf.box_2,
})

core.register_node("nsspf:cooked_cantharellus_cibarius", {
	description = "Cooked Cantharellus cibarius",
	drawtype = "mesh",
	mesh = "cantharellus_cibarius.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_cantharellus_cibarius.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(8),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_2,
	collision_box = nsspf.box_2,
})

core.register_node("nsspf:cantharellus_cibarius_fungusdirt", {
	description = "Cantharellus cibarius Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:cantharellus_cibarius_spores"}, rarity = 12},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:suillus_grevillei", {
	description = "Suillus grevillei",
	drawtype = "mesh",
	mesh = "suillus_grevillei.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	tiles = {"suillus_grevillei.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(1),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_1,
 	collision_box = nsspf.box_1,
})

core.register_node("nsspf:cooked_suillus_grevillei", {
	description = "Cooked Suillus grevillei",
	drawtype = "mesh",
	mesh = "suillus_grevillei.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_suillus_grevillei.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(10),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_1,
 	collision_box = nsspf.box_1,
})

core.register_node("nsspf:suillus_grevillei_fungusdirt", {
	description = "Suillus grevillei Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:suillus_grevillei_spores"}, rarity = 8},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:morchella_conica", {
	description = "Morchella conica",
	drawtype = "mesh",
	mesh = "morchella_conica.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"morchella_conica.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(2),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_3,
	collision_box = nsspf.box_3,
})

core.register_node("nsspf:cooked_morchella_conica", {
	description = "Cooked Morchella conica",
	drawtype = "mesh",
	mesh = "morchella_conica.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_morchella_conica.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(8),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_3,
	collision_box = nsspf.box_3,
})

core.register_node("nsspf:morchella_conica_fungusdirt", {
	description = "Morchella conica Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:morchella_conica_spores"}, rarity = 12},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:russula_xerampelina", {
	description = "Russula xerampelina",
	drawtype = "mesh",
	mesh = "russula.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	tiles = {"russula_xerampelina.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-8),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_1,
	collision_box = nsspf.box_1,
})

core.register_node("nsspf:cooked_russula_xerampelina", {
	description = "Cooked Russula xerampelina",
	drawtype = "mesh",
	mesh = "russula.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_russula_xerampelina.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(6),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_1,
	collision_box = nsspf.box_1,
})

core.register_node("nsspf:russula_xerampelina_fungusdirt", {
	description = "Russula xerampelina Dirt",
	tiles = {"default_dirt.png"},
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:russula_xerampelina_spores"}, rarity = 12},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:boletus_pinophilus", {
	description = "Boletus pinophilus",
	drawtype = "mesh",
	mesh = "boletus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	tiles = {"boletus_pinophilus.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(2),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_1,
	collision_box = nsspf.box_1,
})

core.register_node("nsspf:cooked_boletus_pinophilus", {
	description = "Cooked Boletus pinophilus",
	drawtype = "mesh",
	mesh = "boletus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	tiles = {"cooked_boletus_pinophilus.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(16),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_1,
	collision_box = nsspf.box_1,
})

core.register_node("nsspf:boletus_pinophilus_fungusdirt", {
	description = "Boletus pinophilus Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:boletus_pinophilus_spores"}, rarity = 16},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:boletus_satanas", {
	description = "Boletus satanas",
	drawtype = "mesh",
	mesh = "boletus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"boletus_satanas.png"},
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-20),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_1,
	collision_box = nsspf.box_1,
})

core.register_node("nsspf:cooked_boletus_satanas", {
	description = "Cooked Boletus satanas",
	drawtype = "mesh",
	mesh = "boletus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_boletus_satanas.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-16),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_1,
	collision_box = nsspf.box_1,
})

core.register_node("nsspf:boletus_satanas_fungusdirt", {
	description = "Boletus satanas Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:boletus_satanas_spores"}, rarity = 18},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:amanita_phalloides", {
	description = "Amanita phalloides",
	drawtype = "mesh",
	mesh = "amanita.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	tiles = {"amanita_phalloides.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-20),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_4,
	collision_box = nsspf.box_4,
})

core.register_node("nsspf:cooked_amanita_phalloides", {
	description = "Cooked Amanita phalloides",
	drawtype = "mesh",
	mesh = "amanita.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_amanita_phalloides.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-20),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_4,
	collision_box = nsspf.box_4,
})

core.register_node("nsspf:amanita_phalloides_fungusdirt", {
	description = "Amanita phalloides Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:amanita_phalloides_spores"}, rarity = 18},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:amanita_muscaria", {
	description = "Amanita muscaria",
	drawtype = "mesh",
	mesh = "amanita.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"amanita_muscaria.png"},
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-20),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_4,
	collision_box = nsspf.box_4,
})

core.register_node("nsspf:cooked_amanita_muscaria", {
	description = "Cooked Amanita muscaria",
	drawtype = "mesh",
	mesh = "amanita.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_amanita_muscaria.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-18),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_4,
	collision_box = nsspf.box_4,
})

core.register_node("nsspf:amanita_muscaria_fungusdirt", {
	description = "Amanita muscaria Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:amanita_muscaria_spores"}, rarity = 16},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:tuber_melanosporum_fungusdirt", {
	description = "Tuber melanosporum Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:tuber_melanosporum_spores"}, rarity = 16},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:tuber_magnatum_pico_fungusdirt", {
	description = "Tuber magnatum pico Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:tuber_magnatum_pico_spores"}, rarity = 30},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:tuber_borchii_fungusdirt", {
	description = "Tuber borchii Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:tuber_borchii_spores"}, rarity = 12},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:terfezia_arenaria_fungusdirt", {
	description = "Terfezia arenaria Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:terfezia_arenaria_spores"}, rarity = 8},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

--Saprotrophic fungi that live on trees

core.register_node("nsspf:fistulina_hepatica", {
	description = "Fistulina hepatica",
	drawtype = "mesh",
	mesh = "fistulina_hepatica.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	tiles = {"fistulina_hepatica.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(4),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_5,
	collision_box = nsspf.box_5,
})

core.register_node("nsspf:cooked_fistulina_hepatica", {
	description = "Cooked Fistulina hepatica",
	drawtype = "mesh",
	mesh = "fistulina_hepatica.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_fistulina_hepatica.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(14),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_5,
	collision_box = nsspf.box_5,
})

core.register_node("nsspf:armillaria_mellea", {
	description = "Armillaria mellea",
	drawtype = "mesh",
	mesh = "armillaria_mellea.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"armillaria_mellea.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(2),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_6,
	collision_box = nsspf.box_6,
})

core.register_node("nsspf:fomes_fomentarius", {
	description = "Fomes fomentarius",
	drawtype = "mesh",
	mesh = "fomes_fomentarius.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"fomes_fomentarius.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-1),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_6,
	collision_box = nsspf.box_6,
})

core.register_node("nsspf:cooked_armillaria_mellea", {
	description = "Cooked Armillaria mellea",
	drawtype = "mesh",
	mesh = "armillaria_mellea.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_armillaria_mellea.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(12),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_6,
	collision_box = nsspf.box_6,
})

core.register_node("nsspf:mycena_chlorophos", {
	description = "Mycena chlorophos",
	drawtype = "mesh",
	mesh = "mycena_chlorophos.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"mycena_chlorophos.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-2),
	selection_box = nsspf.box_7,
	collision_box = nsspf.box_7,
})

core.register_node("nsspf:cooked_mycena_chlorophos", {
	description = "Cooked Mycena chlorophos",
	drawtype = "mesh",
	mesh = "mycena_chlorophos.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_mycena_chlorophos.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-4),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_7,
	collision_box = nsspf.box_7,
})

core.register_node("nsspf:mycena_chlorophos_light", {
	description = "Nocturn Mycena chlorophos",
	drawtype = "mesh",
	mesh = "mycena_chlorophos.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	tiles = {"mycena_chlorophos_light.png"},
	groups = {shroom=1, snappy=3, not_in_creative_inventory=1},
	light_source = 8,
	drop ="nsspf:mycena_chlorophos",
	on_use = core.item_eat(-2),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_7,
	collision_box = nsspf.box_7,
})

core.register_node("nsspf:panellus_pusillus", {
	description = "Panellus pusillus",
	drawtype = "mesh",
	mesh = "panellus_pusillus.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"panellus_pusillus.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-2),
	selection_box = nsspf.box_7,
	collision_box = nsspf.box_7,
})

core.register_node("nsspf:cooked_panellus_pusillus", {
	description = "Cooked Panellus pusillus",
	drawtype = "mesh",
	mesh = "panellus_pusillus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_panellus_pusillus.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-4),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_7,
 	collision_box = nsspf.box_7,
})

core.register_node("nsspf:panellus_pusillus_light", {
	description = "Nocturn Panellus pusillus",
	drawtype = "mesh",
	mesh = "panellus_pusillus.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"panellus_pusillus_light.png"},
	groups = {shroom=1, snappy=3, not_in_creative_inventory=1},
	light_source = 8,
	drop = "nsspf:panellus_pusillus",
	on_use = core.item_eat(-2),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_7,
	collision_box = nsspf.box_7,
})

--Saprotrophic fungi that grow on the ground

core.register_node("nsspf:macrolepiota_procera", {
	description = "Macrolepiota procera",
	drawtype = "mesh",
	mesh = "macrolepiota_procera.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"macrolepiota_procera.png"},
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(3),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_4,
	collision_box = nsspf.box_4,
})

core.register_node("nsspf:cooked_macrolepiota_procera", {
	description = "Cooked Macrolepiota procera",
	drawtype = "mesh",
	mesh = "macrolepiota_procera.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_macrolepiota_procera.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(16),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_4,
	collision_box = nsspf.box_4,
})

core.register_node("nsspf:macrolepiota_procera_fungusdirt", {
	description = "Macrolepiota procera Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:macrolepiota_procera_spores"}, rarity = 12},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:psilocybe_cubensis", {
	description = "Psilocybe cubensis",
	drawtype = "mesh",
	mesh = "psilocybe_cubensis.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"psilocybe_cubensis.png"},
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-7),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_8,
	collision_box = nsspf.box_8,
})

core.register_node("nsspf:cooked_psilocybe_cubensis", {
	description = "Cooked Psilocybe cubensis",
	drawtype = "mesh",
	mesh = "psilocybe_cubensis.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_psilocybe_cubensis.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(2),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_8,
	collision_box = nsspf.box_8,
})

core.register_node("nsspf:psilocybe_cubensis_fungusdirt", {
	description = "Psilocybe cubensis Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:psilocybe_cubensis_spores"}, rarity = 16},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:lycoperdon_pyriforme", {
	description = "Lycoperdon pyriforme",
	drawtype = "mesh",
	mesh = "lycoperdon_pyriforme.b3d",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"lycoperdon_pyriforme.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(8),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_9,
	collision_box = nsspf.box_9,
})

core.register_node("nsspf:cooked_lycoperdon_pyriforme", {
	description = "Cooked Lycoperdon pyriforme",
	drawtype = "mesh",
	mesh = "lycoperdon_pyriforme.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_lycoperdon_pyriforme.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(12),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_9,
	collision_box = nsspf.box_9,
})

core.register_node("nsspf:lycoperdon_pyriforme_fungusdirt", {
	description = "Lycoperdon pyriforme Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:lycoperdon_pyriforme_spores"}, rarity = 4},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:gyromitra_esculenta", {
	description = "Gyromitra esculenta",
	drawtype = "mesh",
	mesh = "gyromitra_esculenta.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	tiles = {"gyromitra_esculenta.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-20),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_10,
	collision_box = nsspf.box_10,
})

core.register_node("nsspf:cooked_gyromitra_esculenta", {
	description = "Cooked Gyromitra esculenta",
	drawtype = "mesh",
	mesh = "gyromitra_esculenta.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_gyromitra_esculenta.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-16),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_10,
	collision_box = nsspf.box_10,
})

core.register_node("nsspf:gyromitra_esculenta_fungusdirt", {
	description = "Gyromitra esculenta Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:gyromitra_esculenta_spores"}, rarity = 18},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:coprinus_atramentarius", {
	description = "Coprinus atramentarius",
	drawtype = "mesh",
	mesh = "coprinus_atramentarius.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"coprinus_atramentarius.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-13),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_11,
	collision_box = nsspf.box_11,
})

core.register_node("nsspf:cooked_coprinus_atramentarius", {
	description = "Cooked Coprinus atramentarius",
	drawtype = "mesh",
	mesh = "coprinus_atramentarius.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_coprinus_atramentarius.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(6),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_11,
	collision_box = nsspf.box_11,
})

core.register_node("nsspf:coprinus_atramentarius_fungusdirt", {
	description = "Coprinus atramentarius Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:coprinus_atramentarius_spores"}, rarity = 20},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

--jungle fungi

core.register_node("nsspf:lentinus_strigosus", {
	description = "Lentinus strigosus",
	drawtype = "mesh",
	mesh = "lentinus_strigosus.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"lentinus_strigosus.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(1),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_11,
	collision_box = nsspf.box_11,
})

core.register_node("nsspf:cooked_lentinus_strigosus", {
	description = "Cooked Lentinus strigosus",
	drawtype = "mesh",
	mesh = "lentinus_strigosus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_lentinus_strigosus.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(16),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_11,
	collision_box = nsspf.box_11,
})

core.register_node("nsspf:ganoderma_lucidum", {
	description = "Ganoderma lucidum",
	drawtype = "mesh",
	mesh = "fistulina_hepatica.b3d",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"ganoderma_lucidum.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(14),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_5,
	collision_box = nsspf.box_5,
})

core.register_node("nsspf:cooked_ganoderma_lucidum", {
	description = "Cooked Ganoderma lucidum",
	drawtype = "mesh",
	mesh = "fistulina_hepatica.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_ganoderma_lucidum.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(4),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_5,
	collision_box = nsspf.box_5,
})

core.register_node("nsspf:marasmius_haematocephalus", {
	description = "Marasmius haematocephalus",
	drawtype = "mesh",
	mesh = "marasmius_haematocephalus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	tiles = {"marasmius_haematocephalus.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-1),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_8,
	collision_box = nsspf.box_8,
})

core.register_node("nsspf:cooked_marasmius_haematocephalus", {
	description = "Cooked Marasmius haematocephalus",
	drawtype = "mesh",
	mesh = "marasmius_haematocephalus.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_marasmius_haematocephalus.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-19),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_8,
	collision_box = nsspf.box_8,
})

core.register_node("nsspf:clitocybula_azurea", {
	description = "Clitocybula azurea",
	drawtype = "mesh",
	mesh = "clitocybula_azurea.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
	tiles = {"clitocybula_azurea.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-6),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_7,
	collision_box = nsspf.box_7,
})

core.register_node("nsspf:cooked_clitocybula_azurea", {
	description = "Cooked Clitocybula azurea",
	drawtype = "mesh",
	mesh = "clitocybula_azurea.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_clitocybula_azurea.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(10),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_7,
	collision_box = nsspf.box_7,
})

--snowbank fungus

core.register_node("nsspf:clitocybe_glacialis", {
	description = "Clitocybe glacialis",
	drawtype = "mesh",
	mesh = "clitocybe_glacialis.b3d",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"clitocybe_glacialis.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(1),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_11,
	collision_box = nsspf.box_11,
})

core.register_node("nsspf:cooked_clitocybe_glacialis", {
	description = "Cooked Clitocybe glacialis",
	drawtype = "mesh",
	mesh = "clitocybe_glacialis.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_clitocybe_glacialis.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(10),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_11,
	collision_box = nsspf.box_11,
})

core.register_node("nsspf:clitocybe_glacialis_fungusdirt", {
	description = "Clitocybe glacialis Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:clitocybe_glacialis_spores"}, rarity = 16},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:hygrophorus_goetzii", {
	description = "Hygrophorus goetzii",
	drawtype = "mesh",
	mesh = "hygrophorus_goetzii.b3d",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"hygrophorus_goetzii.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-4),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_11,
	collision_box = nsspf.box_11,
})

core.register_node("nsspf:cooked_hygrophorus_goetzii", {
	description = "Cooked Hygrophorus goetzii",
	drawtype = "mesh",
	mesh = "hygrophorus_goetzii.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_hygrophorus_goetzii.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(8),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_11,
	collision_box = nsspf.box_11,
})

core.register_node("nsspf:hygrophorus_goetzii_fungusdirt", {
	description = "Hygrophorus goetzii Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nsspf:hygrophorus_goetzii_spores"}, rarity = 14},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

core.register_node("nsspf:plectania_nannfeldtii", {
	description = "Plectania nannfeldtii",
	drawtype = "mesh",
	mesh = "plectania_nannfeldtii.b3d",
    paramtype = 'light',
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="air"})
	end,
    paramtype2 = 'facedir',
	tiles = {"plectania_nannfeldtii.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-20),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_9,
	collision_box = nsspf.box_9,
})

core.register_node("nsspf:cooked_plectania_nannfeldtii", {
	description = "Cooked Plectania nannfeldtii",
	drawtype = "mesh",
	mesh = "plectania_nannfeldtii.b3d",
    paramtype = 'light',
    paramtype2 = 'facedir',
	tiles = {"cooked_plectania_nannfeldtii.png"},
	groups = {shroom=1, snappy=3},
	on_use = core.item_eat(-20),
	on_place = function(itemstack, placer, pointd)
		return
	end,
	selection_box = nsspf.box_9,
	collision_box = nsspf.box_9,
})

core.register_node("nsspf:plectania_nannfeldtii_fungusdirt", {
	description = "Plectania nannfeldtii Dirt",
	on_timer = function(pos, elapsed)
		core.set_node(pos, {name="default:dirt"})
	end,
	tiles = {"default_dirt.png"},
	drop = {
		max_items = 1,
			items = {
				{items = {"nsspf:plectania_nannfeldtii_spores"}, rarity = 20},
		}
	},
	groups = {crumbly = 3, not_in_creative_inventory =1},
})

function nsspf_register_recipes (name)

core.register_craft({
	type = "cooking",
	output = "nsspf:cooked_"..name,
	recipe = "nsspf:"..name,
	cooktime = 10,
})

end

nsspf_register_recipes ('boletus_edulis')
nsspf_register_recipes ('boletus_pinophilus')
nsspf_register_recipes ('boletus_satanas')
nsspf_register_recipes ('suillus_grevillei')
nsspf_register_recipes ('morchella_conica')
nsspf_register_recipes ('amanita_phalloides')
nsspf_register_recipes ('amanita_muscaria')
nsspf_register_recipes ('cantharellus_cibarius')
nsspf_register_recipes ('russula_xerampelina')
nsspf_register_recipes ('fistulina_hepatica')
nsspf_register_recipes ('armillaria_mellea')
nsspf_register_recipes ('mycena_chlorophos')
nsspf_register_recipes ('panellus_pusillus')
nsspf_register_recipes ('macrolepiota_procera')
nsspf_register_recipes ('psilocybe_cubensis')
nsspf_register_recipes ('lycoperdon_pyriforme')
nsspf_register_recipes ('coprinus_atramentarius')
nsspf_register_recipes ('gyromitra_esculenta')
nsspf_register_recipes ('clitocybe_glacialis')
nsspf_register_recipes ('plectania_nannfeldtii')
nsspf_register_recipes ('hygrophorus_goetzii')
nsspf_register_recipes ('lentinus_strigosus')
nsspf_register_recipes ('ganoderma_lucidum')
nsspf_register_recipes ('marasmius_haematocephalus')
nsspf_register_recipes ('clitocybula_azurea')

core.register_craftitem("nsspf:amadou", {
	description = "Amadou",
	image = "amadou.png",
})

core.register_craft({
	output = 'nsspf:amadou',
	type = "shapeless",
	recipe = {'nsspf:fomes_fomentarius'},
})

core.register_craft({
	type = "fuel",
	recipe = "nsspf:amadou",
	burntime = 120,
})

if core.get_modpath("tnt") then

	core.register_craftitem("nsspf:lasting_amadou", {
		description = 'Lasting Amadou',
		image = "lasting_amadou.png",
	})

	core.register_craft({
		output = 'nsspf:lasting_amadou',
		type = "shapeless",
		recipe = {'tnt:gunpowder', 'nsspf:amadou'},
	})

	core.register_craft({
		type = "fuel",
		recipe = "nsspf:lasting_amadou",
		burntime = 300,
	})

end

if core.get_modpath("nssm") then

	core.register_craftitem("nsspf:long_lasting_amadou", {
		description = 'Long Lasting Amadou',
		image = "long_lasting_amadou.png",
	})

	core.register_craft({
		output = 'nsspf:long_lasting_amadou',
		type = "shapeless",
		recipe = {'nssm:black_powder', 'nsspf:amadou'},
	})

	core.register_craft({
		type = "fuel",
		recipe = "nsspf:long_lasting_amadou",
		burntime = 400,
	})

end