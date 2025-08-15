
core.register_node("streets:stconcrete", {
	description = "Concrete",
	tiles = {"streets_concrete.png"},
	groups = {cracky = 2, stone = 3},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "streets:stconcrete 5",
	recipe = {
		{"default:gravel", "default:rock", "default:gravel"},
		{"default:rock", "default:wet_cement", "default:rock"},
		{"default:gravel", "default:wet_cement", "default:gravel"}
	}
})

core.register_node("streets:sidewalk", {
	description = "Sidewalk",
	tiles = {"streets_sidewalk.png"},
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	type = "shapeless",
	output = "streets:sidewalk",
	recipe = {"default:cobble", "dye:white"}
})

if core.get_modpath("moreblocks") or core.get_modpath("stairsplus") then
	stairsplus:register_all("streets", "stconcrete", "streets:stconcrete", {
		description = "Concrete",
		tiles = {"streets_concrete.png"},
		groups = {cracky = 2, stone = 3},
		sounds = default.node_sound_stone_defaults()
	})

	stairsplus:register_all("streets", "sidewalk", "streets:sidewalk", {
		description = "Sidewalk",
		tiles = {"streets_sidewalk.png"},
		groups = {cracky = 3, stone = 1},
		sounds = default.node_sound_stone_defaults()
	})
end
stairs.register_stair_and_slab("stconcrete", "streets:stconcrete",
	{cracky=2}, {"streets_concrete.png"},
	"Concrete Stair", "Concrete Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("sidewalk", "streets:sidewalk",
	{cracky=3}, {"streets_sidewalk.png"},
	"Sidewalk Stair", "Sidewalk Slab", default.node_sound_stone_defaults(), true)

core.register_node("streets:concrete_wall", {
	description = "Concrete Wall",
	paramtype = "light",
	drawtype = "nodebox",
	tiles = {"streets_concrete.png"},
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, wall = 1 },
	node_box = {
		type = "connected",
		fixed = { { -0.35, -0.5, -0.35, 0.35, -0.4, 0.35 }, { -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 } },
		connect_front = { { -0.35, -0.5, -0.5, 0.35, -0.4, 0.35 }, { -0.15, -0.5, -0.5, 0.15, 0.5, 0.15 } }, -- z-
		connect_back = { { -0.35, -0.5, -0.35, 0.35, -0.4, 0.5 }, { -0.15, -0.5, -0.15, 0.15, 0.5, 0.5 } }, -- z+
		connect_left = { { -0.5, -0.5, -0.35, 0.35, -0.4, 0.35 }, { -0.5, -0.5, -0.15, 0.15, 0.5, 0.15 } }, -- x-
		connect_right = { { -0.35, -0.5, -0.35, 0.5, -0.4, 0.35 }, { -0.15, -0.5, -0.15, 0.5, 0.5, 0.15 } }, -- x+
	},
	connects_to = { "group:wall", "group:stone", "group:wood", "group:trunk", "group:concrete" },
	sound = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "streets:concrete_wall 5",
	recipe = {
		{ "", "streets:stconcrete", "" },
		{ "", "streets:stconcrete", "" },
		{ "streets:stconcrete", "streets:stconcrete", "streets:stconcrete" },
	}
})

core.register_node("streets:concrete_wall_straight", {
	description = "Concrete Wall (Top)",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_concrete.png"},
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, wall = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.35, 0.5, -0.4, 0.35 },
			{ -0.5, -0.5, -0.15, 0.5, 0.5, 0.15 },
		},
	},
	connect_sides = { "left", "right" },
	sound = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "streets:concrete_wall_straight 2",
	recipe = {
		{ "streets:concrete_wall", "streets:concrete_wall"},
	}
})

core.register_node("streets:concrete_wall_top", {
	description = "Concrete Wall",
	paramtype = "light",
	drawtype = "nodebox",
	tiles = {"streets_concrete.png"},
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, wall = 1 },
	node_box = {
		type = "connected",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 },
		connect_front = { -0.15, -0.5, -0.5, 0.15, 0.5, 0.15 }, -- z-
		connect_back = { -0.15, -0.5, -0.15, 0.15, 0.5, 0.5 }, -- z+
		connect_left = { -0.5, -0.5, -0.15, 0.15, 0.5, 0.15 }, -- x-
		connect_right = { -0.15, -0.5, -0.15, 0.5, 0.5, 0.15 }, -- x+
	},
	connects_to = { "group:wall", "group:stone", "group:wood", "group:trunk", "group:concrete" },
	sound = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "streets:concrete_wall_top 2",
	recipe = {
		{ "streets:concrete_wall" },
		{ "streets:concrete_wall"},
	}
})

core.register_node("streets:concrete_wall_top_straight", {
	description = "Concrete Wall (Straight Top)",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_concrete.png"},
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, wall = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.15, 0.5, 0.5, 0.15 },
		},
	},
	connect_sides = { "left", "right" },
	sound = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "streets:concrete_wall_top_straight 2",
	recipe = {
		{ "streets:concrete_wall_straight" },
		{ "streets:concrete_wall_straight"},
	}
})

core.register_node(":streets:bigpole", {
	description = "Pole Straight",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 }
		}
	},
	on_place = core.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
				{ x = 0, y = -2, z = 0 }
			}
		}
	},
	streets_pole_connection = {
		[0] = { 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		[1] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
		[2] = { 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		[3] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
		["t"] = { 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1 }
	}
})

core.register_craft({
	output = "streets:bigpole 3",
	recipe = {
		{ "default:steel_ingot" },
		{ "default:steel_ingot" }
	}
})


core.register_node(":streets:bigpole_short", {
	description = "Pole Short",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.15, 0.15 }
		}
	},
	on_place = core.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		[1] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 },
		[2] = { 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		[3] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0 },
		["t"] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
	}
})

core.register_craft({
	output = "streets:bigpole_short 2",
	recipe = {
		{ "streets:bigpole" }
	}
})


core.register_node(":streets:bigpole_edge", {
	description = "Pole Edge",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.15, 0.15 },
			{ -0.15, -0.15, -0.15, 0.15, 0.15, -0.5 }
		}
	},
	on_place = core.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0 },
		[1] = { 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1 },
		[2] = { 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0 },
		[3] = { 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0 },
		["t"] = { 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0 }
	}
})

core.register_craft({
	output = "streets:bigpole_edge 3",
	recipe = {
		{ "streets:bigpole", "streets:bigpole" },
		{ "streets:bigpole", "" }
	}
})

core.register_craft({
	output = "streets:bigpole_edge 3",
	recipe = {
		{ "streets:bigpole", "streets:bigpole" },
		{ "", "streets:bigpole" }
	}
})


core.register_node(":streets:bigpole_tjunction", {
	description = "Pole T-Junction",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.15, 0.15 },
			{ -0.15, -0.15, -0.5, 0.15, 0.15, 0.5 }
		}
	},
	on_place = core.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0 },
		[1] = { 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1 },
		[2] = { 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0 },
		[3] = { 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1 },
		["t"] = { 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0 }
	}
})

core.register_craft({
	output = "streets:bigpole_tjunction",
	recipe = {
		{ "streets:bigpole_edge", "streets:bigpole_short" },
	}
})


core.register_node(":streets:bigpole_corner", {
	description = "Pole Corner",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.15, 0.15 },
			{ -0.15, -0.15, -0.15, 0.15, 0.15, -0.5 },
			{ -0.15, -0.15, -0.15, 0.5, 0.15, 0.15 }
		}
	},
	on_place = core.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0 },
		[1] = { 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1 },
		[2] = { 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1 },
		[3] = { 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0 },
		["t"] = { 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0 }
	}
})

core.register_craft({
	output = "streets:bigpole_corner",
	recipe = {
		{ "streets:bigpole_edge" },
		{ "streets:bigpole_short" }
	}
})


core.register_node(":streets:bigpole_four_side_junction", {
	description = "Pole 4-Side-Junction",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 },
			{ -0.15, -0.15, -0.15, 0.15, 0.15, -0.5 },
			{ -0.15, -0.15, -0.15, 0.5, 0.15, 0.15 }
		}
	},
	on_place = core.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0 },
		[1] = { 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1 },
		[2] = { 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1 },
		[3] = { 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0 },
		["t"] = { 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1 }
	}
})

core.register_craft({
	output = "streets:bigpole_four_side_junction",
	recipe = {
		{ "streets:bigpole_short" },
		{ "streets:bigpole_corner" }
	}
})


core.register_node(":streets:bigpole_cross", {
	description = "Pole Cross",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 },
			{ -0.15, -0.15, -0.5, 0.15, 0.15, 0.5 }
		}
	},
	on_place = core.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0 },
		[1] = { 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1 },
		[2] = { 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0 },
		[3] = { 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1 },
		["t"] = { 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1 }
	}
})

core.register_craft({
	output = "streets:bigpole_cross",
	recipe = {
		{ "", "streets:bigpole_short", "" },
		{ "streets:bigpole_short", "", "streets:bigpole_short" },
		{ "", "streets:bigpole_short", "" },
	}
})


core.register_node(":streets:bigpole_five_side_junction", {
	description = "Pole 5-Side-Junction",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 },
			{ -0.15, -0.15, -0.5, 0.15, 0.15, 0.5 },
			{ -0.15, -0.15, -0.15, 0.5, 0.15, 0.15 }
		}
	},
	on_place = core.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0 },
		[1] = { 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1 },
		[2] = { 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1 },
		[3] = { 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1 },
		["t"] = { 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1 }
	}
})

core.register_craft({
	output = "streets:bigpole_five_side_junction",
	recipe = {
		{ "streets:bigpole_cross", "streets:bigpole_short" }
	}
})


core.register_node(":streets:bigpole_all_sides", {
	description = "Pole All Sides",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 },
			{ -0.15, -0.15, -0.5, 0.15, 0.15, 0.5 },
			{ -0.5, -0.15, -0.15, 0.5, 0.15, 0.15 }
		}
	},
	on_place = core.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
		[1] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
		[2] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
		[3] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
		["t"] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
	}
})

core.register_craft({
	output = "streets:bigpole_all_sides",
	recipe = {
		{ "streets:bigpole_short", "streets:bigpole_cross", "streets:bigpole_short" }
	}
})

streets.register_road_surface({
	name = "asphalt",
	friendlyname = "Asphalt",
	tiles = { "streets_asphalt.png" },
	groups = { cracky = 3, asphalt = 1 },
	sounds = default.node_sound_stone_defaults(),
	register_stairs = true,
	craft = {
		output = "streets:asphalt",
		recipe = {
	{"default:gravel", "default:coal_lump", "default:gravel"},
	{"default:coal_lump", "default:torch", "default:coal_lump"},
	{"default:gravel", "default:wet_cement", "default:gravel"}
		},
		replacements = {{"default:torch", "default:torch_spent"}}
	}
})

streets.register_road_surface({
	name = "asphalt_red",
	friendlyname = "Red Asphalt",
	tiles = { "streets_asphalt_red.png" },
	groups = { cracky = 3, asphalt = 1 },
	sounds = default.node_sound_stone_defaults(),
	register_stairs = true,
	craft = {
		output = "streets:asphalt_red",
		type = "shapeless",
		recipe = {"streets:asphalt", "dye:red"}
	}
})

streets.register_road_surface({
	name = "asphalt_yellow",
	friendlyname = "Yellow Asphalt",
	tiles = {"streets_asphalt_yellow.png"},
	groups = {cracky = 3, asphalt = 1},
	sounds = default.node_sound_stone_defaults(),
	craft = {
		output = "streets:asphalt_yellow",
		type = "shapeless",
		recipe = {"streets:asphalt", "dye:yellow"}
	}
})

streets.register_road_surface({
	name = "asphalt_blue",
	friendlyname = "Blue Asphalt",
	tiles = { "streets_asphalt_blue.png" },
	groups = { cracky = 3, asphalt = 1 },
	sounds = default.node_sound_stone_defaults(),
	register_stairs = false,
	craft = {
		output = "streets:asphalt_blue",
		type = "shapeless",
		recipe = {"streets:asphalt", "dye:blue"}
	}
})

for surface_name, surface_data in pairs(streets.surfaces.surfacetypes) do
	core.register_node("streets:" .. surface_name:sub(2, -1):split(":")[2] .. "_manhole", {
		description = "Manhole",
		tiles = { surface_data["tiles"][1] .. "^streets_manhole.png", surface_data.tiles[1] },
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = { cracky = 3 },
		on_rightclick = function(pos, node, name)
			local name = name:get_player_name()
			if core.is_protected(pos, name) and not core.check_player_privs(name, { protection_bypass = true }) then
				core.record_protection_violation(pos, name)
				return
			end
			node.name = node.name .. "_open"
			core.set_node(pos, node)
		end,
		sunlight_propagates = true,
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0.5, -0.375 }, -- F
				{ -0.5, -0.5, 0.375, 0.5, 0.5, 0.5 }, -- B
				{ -0.5, -0.5, -0.4375, -0.375, 0.5, 0.4375 }, -- L
				{ 0.375, -0.5, -0.4375, 0.5, 0.5, 0.4375 }, -- R
				{ -0.25, 0.4375, -0.25, 0.25, 0.5, 0.25 }, -- CenterPlate
				{ -0.5, 0.4375, -0.0625, 0.5, 0.5, 0.0625 }, -- CenterLR
				{ -0.0625, 0.4375, -0.5, 0.0625, 0.5, 0.5 }, -- CenterFR
			}
		},
	})

	core.register_node("streets:" .. surface_name:sub(2, -1):split(":")[2] .. "_manhole_open", {
		tiles = { surface_data["tiles"][1] .. "^streets_manhole.png", surface_data.tiles[1] },
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		climbable = true,
		drop = "streets:" .. surface_name:sub(2, -1):split(":")[2] .. "_manhole",
		groups = { cracky = 3, not_in_creative_inventory = 1 },
		on_rightclick = function(pos, node, name)
			local name = name:get_player_name()
			if core.is_protected(pos, name) and not core.check_player_privs(name, { protection_bypass = true }) then
				core.record_protection_violation(pos, name)
				return
			end
			node.name = string.sub(node.name, 1, -6)
			core.set_node(pos, node)
		end,
		sunlight_propagates = true,
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0.5, -0.375 }, -- F
				{ -0.5, -0.5, 0.375, 0.5, 0.5, 0.5 }, -- B
				{ -0.5, -0.5, -0.4375, -0.375, 0.5, 0.4375 }, -- L
				{ 0.375, -0.5, -0.4375, 0.5, 0.5, 0.4375 }, -- R
			}
		},
	})

	core.register_craft({
		output = "streets:" .. surface_name:sub(2, -1):split(":")[2] .. "_manhole 16",
		recipe = {
			{ surface_name, surface_name, surface_name },
			{ surface_name, "default:steel_ingot", surface_name },
			{ surface_name, surface_name, surface_name },
		}
	})
end

core.register_node("streets:steel_support", {
	description = "Steel support",
	drawtype = "glasslike_framed",
	tiles = {"streets_support.png"},
	paramtype = "light",
	climbable = true,
	sunlight_propagates = true,
	groups = {cracky = 1},
	collision_box = {
		type = "fixed",
		fixed = {-.15, -.5, -.15, .15, .5, .15}
	},
})

core.register_craft({
	output = "streets:steel_support 5",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "", "default:steel_ingot"}
	}
})

core.register_node("streets:roadwork_traffic_barrier", {
	description = "Traffic Barrier",
	paramtype = "light",
	drawtype = "nodebox",
	tiles = {"streets_concrete.png", "streets_concrete.png",
		"streets_concrete.png^streets_roadwork_traffic_barrier.png"},
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, wall = 1 },
	node_box = {
		type = "connected",
		fixed = {
			{ -0.35, -0.5, -0.35, 0.35, -0.4, 0.35 },
			{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 }
		},
		connect_front = {
			{ -0.35, -0.5, -0.5, 0.35, -0.4, 0.35 },
			{ -0.15, -0.5, -0.5, 0.15, 0.5, 0.15 }
		}, -- z-
		connect_back = {
			{ -0.35, -0.5, -0.35, 0.35, -0.4, 0.5 },
			{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.5 }
		}, -- z+
		connect_left = {
			{ -0.5, -0.5, -0.35, 0.35, -0.4, 0.35 },
			{ -0.5, -0.5, -0.15, 0.15, 0.5, 0.15 }
		}, -- x-
		connect_right = {
			{ -0.35, -0.5, -0.35, 0.5, -0.4, 0.35 },
			{ -0.15, -0.5, -0.15, 0.5, 0.5, 0.15 }
		}, -- x+
	},
	connects_to = { "group:wall", "group:stone", "group:wood", "group:trunk", "group:concrete" },
	sound = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "streets:roadwork_traffic_barrier 3",
	recipe = {
		{ "dye:red", "dye:white", "dye:red" },
		{ "streets:concrete_wall", "streets:concrete_wall", "streets:concrete_wall" },
	}
})

core.register_node("streets:roadwork_traffic_barrier_straight", {
	description = "Traffic Barrier (Straight)",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_concrete.png", "streets_concrete.png",
		"streets_concrete.png^streets_roadwork_traffic_barrier.png"},
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, wall = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.35, 0.5, -0.4, 0.35 },
			{ -0.5, -0.5, -0.15, 0.5, 0.5, 0.15 },
		},
	},
	connect_sides = { "left", "right" },
	sound = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "streets:roadwork_traffic_barrier_straight 2",
	recipe = {
		{ "streets:roadwork_traffic_barrier", "streets:roadwork_traffic_barrier"},
	}
})

core.register_node("streets:roadwork_traffic_barrier_top", {
	description = "Traffic Barrier (Top)",
	paramtype = "light",
	drawtype = "nodebox",
	tiles = {"streets_concrete.png", "streets_concrete.png",
		"streets_concrete.png^streets_roadwork_traffic_barrier.png"},
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, wall = 1 },
	node_box = {
		type = "connected",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 }
		},
		connect_front = {
			{ -0.15, -0.5, -0.5, 0.15, 0.5, 0.15 }
		}, -- z-
		connect_back = {
			{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.5 }
		}, -- z+
		connect_left = {
			{ -0.5, -0.5, -0.15, 0.15, 0.5, 0.15 }
		}, -- x-
		connect_right = {
			{ -0.15, -0.5, -0.15, 0.5, 0.5, 0.15 }
		}, -- x+
	},
	connects_to = { "group:wall", "group:stone", "group:wood", "group:trunk", "group:concrete" },
	sound = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "streets:roadwork_traffic_barrier_top 2",
	recipe = {
		{ "streets:roadwork_traffic_barrier" },
		{ "streets:roadwork_traffic_barrier" },
	}
})

core.register_node("streets:roadwork_traffic_barrier_top_straight", {
	description = "Traffic Barrier (Straight Top)",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_concrete.png", "streets_concrete.png",
		"streets_concrete.png^streets_roadwork_traffic_barrier.png"},
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, wall = 1 },
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.15, .5, .5, .15}
	},
	connect_sides = { "left", "right" },
	sound = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "streets:roadwork_traffic_barrier_top_straight 2",
	recipe = {
		{"streets:roadwork_traffic_barrier_straight"},
		{"streets:roadwork_traffic_barrier_straight"}
	}
})

-- Barrier Tape

core.register_node("streets:roadwork_barrier_tape", {
	description = "Barrier Tape",
	paramtype = "light",
	drawtype = "nodebox",
	tiles = { "streets_roadwork_barrier_tape.png" },
	sunlight_propagates = true,
	groups = { choppy = 1, dig_immediate = 3, level = 1, wall = 1 },
	node_box = {
		type = "connected",
		fixed = { -1 / 16, -0.5, -1 / 16, 1 / 16, 0.5, 1 / 16 },
		connect_front = { 0, 4 / 16, -0.5, 0, 6 / 16, 0 }, -- z-
		connect_back = { 0, 4 / 16, 0, 0, 6 / 16, 0.5 }, -- z+
		connect_left = { -0.5, 4 / 16, 0, 0, 6 / 16, 0 }, -- x-
		connect_right = { 0, 4 / 16, 0, 0.5, 6 / 16, 0 }, -- x+
	},
	selection_box = {
		type = "fixed",
		fixed = {-2/16, -.5, -2/16, 2/16, .5, 2/16}
	},
	connects_to = { "group:wall", "group:stone", "group:wood", "group:trunk", "group:sign", "group:concrete" },
})

core.register_craft({
	output = "streets:roadwork_barrier_tape 24",
	recipe = {
		{"dye:red", "dye:white", "dye:red"},
		{"farming:cotton", "default:stick", "farming:cotton"},
		{"", "default:stick", ""}
	}
})

core.register_node("streets:roadwork_blinking_light_off", {
	description = "Blinking Light",
	drawtype = "nodebox",
	tiles = {"streets_roadwork_blinking_light_top.png", "streets_roadwork_blinking_light_top.png", "streets_roadwork_blinking_light_off.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-.1875, -.5, -.125, .1875, -.3125, .125}, -- Base
			{-.1875, -.3125, 0, .1875, .0625, 0} -- Light
		}
	},
	groups = {cracky = 1, timer_check = 1},
	on_timer = function(pos)
		core.set_node(pos, {name = "streets:roadwork_blinking_light_on", param2 = core.get_node(pos).param2 })
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,
})

core.register_node("streets:roadwork_blinking_light_on", {
	description = "Blinking Light",
	drawtype = "nodebox",
	tiles = {"streets_roadwork_blinking_light_top.png", "streets_roadwork_blinking_light_top.png", "streets_roadwork_blinking_light_on.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = {cracky = 1, timer_check = 1, not_in_creative_inventory = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-.1875, -.5, -.125, .1875, -.3125, .125}, -- Base
			{-.1875, -.3125, 0, .1875, .0625, 0} -- Light
		}
	},
	light_source = 12,
	on_timer = function(pos)
		core.set_node(pos, {name = "streets:roadwork_blinking_light_off", param2 = core.get_node(pos).param2 })
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	drop = "streets:roadwork_blinking_light_off",
})

core.register_craft({
	output = "streets:roadwork_blinking_light_off 2",
	recipe = {
		{"dye:red", "default:meselamp_torch", "dye:red"},
		{"dye:yellow", "default:steel_ingot", "dye:yellow"}
	}
})

local rules = {
	{ x = 0, y = 0, z = -1 },
	{ x = 0, y = 0, z = 1 },
	{ x = 1, y = 0, z = 0 },
	{ x = -1, y = 0, z = 0 },
	{ x = 0, y = -1, z = 0 },
	{ x = 0, y = 1, z = 0 },
	{ x = 1, y = 1, z = 0 },
	{ x = 1, y = -1, z = 0 },
	{ x = -1, y = 1, z = 0 },
	{ x = -1, y = -1, z = 0 },
	{ x = 0, y = 1, z = 1 },
	{ x = 0, y = -1, z = 1 },
	{ x = 0, y = 1, z = -1 },
	{ x = 0, y = -1, z = -1 }
}

local function update_formspec(pos)
	local node = core.get_node(pos)
	if not core.registered_nodes[node.name].groups.streets_light then
		return
	end
	local meta = core.get_meta(pos)
	local mode = meta:get_string("mode")

	local fs = "size[9,6;]"
	fs = fs .. "label[0,0;Street Light Setup]"
	fs = fs .. "box[0,0.4;8.6,0.05;#FFFFFF]"
	fs = fs .. "box[2.6,0.6;0.05,5.4;#FFFFFF]"
	fs = fs .. "label[0,0.6;Select Mode:]"
	fs = fs .. "button[0,1.25;2.5,1;time;Time]"
	fs = fs .. "button[0,2.25;2.5,1;digiline;Digiline]"
	fs = fs .. "button[0,3.25;2.5,1;mesecons;Mesecons]"
	fs = fs .. "button[0,4.25;2.5,1;manual;Manual]"

	if mode == "time" then
		fs = fs .. "label[3,0.6;Selected Mode: Time]"
		fs = fs .. "field[3.5,2;2,1;time_on;Turn-On-Time;${time_on}]"
		fs = fs .. "button[5,1.7;1,1;submit_time;OK]"
		fs = fs .. "field[3.5,4;2,1;time_off;Turn-Off-Time;${time_off}]"
		fs = fs .. "button[5,3.7;1,1;submit_time;OK]"
	elseif mode == "digiline" then
		fs = fs .. "label[3,0.6;Selected Mode: Digiline]"
		fs = fs .. "label[3,2;Send digiline message 'ON' to turn the lantern on.]"
		fs = fs .. "label[3,2.3;Send digiline message 'OFF' to turn the lantern off.]"
		fs = fs .. "field[3.5,4;2,1;channel;Digiline Channel;${channel}]"
		fs = fs .. "button[5,3.7;1,1;submit_channel;OK]"
	elseif mode == "mesecons" then
		fs = fs .. "label[3,0.6;Selected Mode: Mesecons]"
		fs = fs .. "label[3,2;The lantern is on when receiving mesecons signal.]"
		fs = fs .. "label[3,2.3;The lantern is off when not receiving mesecons signal.]"
	elseif mode == "manual" then
		fs = fs .. "label[3,0.6;Selected Mode: Manual]"
		fs = fs .. "label[3,2;Punch the lantern to change the state (on/off).]"
	end
	meta:set_string("formspec", fs)
end

local on_receive_fields = function(pos, formname, fields, sender)
	local name = sender:get_player_name()
	if core.is_protected(pos, name) and not core.check_player_privs(name, { protection_bypass = true }) then
		core.chat_send_player(name, core.colorize("#FF5300", "You don't have access to this lantern. Stop trying to configure it!"))
		core.record_protection_violation(pos, name)
		return
	end

	local meta = core.get_meta(pos)

	if fields.time then
		meta:set_string("mode", "time")
	elseif fields.digiline then
		meta:set_string("mode", "digiline")
	elseif fields.mesecons then
		meta:set_string("mode", "mesecons")
	elseif fields.manual then
		meta:set_string("mode", "manual")
	end

	if fields.submit_channel then
		meta:set_string("channel", fields.channel)
	elseif fields.submit_time then
		meta:set_int("time_on", tonumber(fields.time_on))
		meta:set_int("time_off", tonumber(fields.time_off))
	end

	update_formspec(pos)
end

local on_digiline_receive = function(pos, node, channel, msg)
	local meta = core.get_meta(pos)
	local mode = meta:get_string("mode")
	local state = node.name:find("off") and "off" or "on"
	local newnode = node
	if type(msg) == "string" then
		msg = msg:lower()
		if mode == "digiline" and channel == meta:get_string("channel") then
			if state == "on" then
				if msg == "off" then
					newnode.name = newnode.name:gsub("_on", "_off")
					core.swap_node(pos, newnode)
				end
			else
				if msg == "on" then
					newnode.name = newnode.name:gsub("_off", "_on")
					core.swap_node(pos, newnode)
				end
			end
		end
	end
end

local on_punch = function(pos, node, player, pointd)
	local pname = player:get_player_name()
	if core.is_protected(pos, pname) and not core.check_player_privs(pname, { protection_bypass = true }) then
		core.chat_send_player(pname, core.colorize("#FF5300", "You don't have access to this lantern. Stop trying to turn it on/off!"))
		core.record_protection_violation(pos, pname)
		return
	end
	local meta = core.get_meta(pos)
	local mode = meta:get_string("mode")
	local state = node.name:find("off") and "off" or "on"
	local newnode = node
	if mode == "manual" then
		if state == "on" then
			newnode.name = newnode.name:gsub("_on", "_off")
			core.swap_node(pos, newnode)
		else
			newnode.name = newnode.name:gsub("_off", "_on")
			core.swap_node(pos, newnode)
		end
	end
end

local on_construct = function(pos)
	local meta = core.get_meta(pos)
	meta:set_string("mode", "time")
	meta:set_string("channel", "streetlight")
	meta:set_int("time_on", "18500")
	meta:set_string("time_off", "5500")
	update_formspec(pos)
end

local def_digiline = {
	receptor = {},
	effector = {
		action = on_digiline_receive,
		rules = rules
	},
	wire = {
		rules = rules
	}}

local def_mesecons = {
	effector = {
		action_on = function(pos, node)
			local meta = core.get_meta(pos)
			local state = node.name:find("off") and "off" or "on"
			if meta:get_string("mode") == "mesecons" and state == "off" then
				local newnode = node
				newnode.name = newnode.name:gsub("_off", "_on")
				core.swap_node(pos, newnode)
			end
		end,
		action_off = function(pos, node)
			local meta = core.get_meta(pos)
			local state = node.name:find("off") and "off" or "on"
			if meta:get_string("mode") == "mesecons" and state == "on" then
				local newnode = node
				newnode.name = newnode.name:gsub("_on", "_off")
				core.swap_node(pos, newnode)
			end
		end,
		rules = rules
	},
	wire = {
		rules = rules
	}}


core.register_abm({
	nodenames = {"group:streets_light"},
	interval = 10,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = core.get_meta(pos)
		local mode = meta:get_string("mode")
		local state = node.name:find("off") and "off" or "on"
		local newnode = node
		if mode == "time" then
			local time = core.get_timeofday() * 24000
			if state == "on" then
				if time < meta:get_int("time_on") and time > meta:get_int("time_off") then
					newnode.name = newnode.name:gsub("_on", "_off")
					core.swap_node(pos, newnode)
				end
			else
				if time > meta:get_int("time_on") or time < meta:get_int("time_off") then
					newnode.name = newnode.name:gsub("_off", "_on")
					core.swap_node(pos, newnode)
				end
			end
		end
	end,
})


core.register_node(":streets:light_vertical_off", {
	description = "Streets Light Vertical",
	tiles = { "streets_pole.png", "streets_pole.png", "streets_light_vertical_off.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { cracky = 1, streets_light = 1 },
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{ -5 / 16, -0.5, -5 / 16, 5 / 16, 0.5, 5 / 16 },
		}
	},
	on_construct = on_construct,
	on_punch = on_punch,
	on_receive_fields = on_receive_fields,
	digiline = def_digiline,
	mesecons = def_mesecons
})

core.register_node(":streets:light_vertical_on", {
	tiles = { "streets_pole.png", "streets_pole.png", "streets_light_vertical_on.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { cracky = 1, streets_light = 1, not_in_creative_inventory = 1 },
	light_source = 14,
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{ -5 / 16, -0.5, -5 / 16, 5 / 16, 0.5, 5 / 16 },
		}
	},
	drop = "streets:light_vertical_off",
	on_construct = on_construct,
	on_punch = on_punch,
	on_receive_fields = on_receive_fields,
	digiline = def_digiline,
	mesecons = def_mesecons
})


core.register_node(":streets:light_horizontal_off", {
	description = "Streets Light Horizontal",
	tiles = { "streets_pole.png", "streets_light_horizontal_off_bottom.png", "streets_light_horizontal_off_side.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { cracky = 1, streets_light = 1 },
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{ -3 / 16, -3 / 16, -0.5, 3 / 16, 3 / 16, 0.5 },
		}
	},
	on_construct = on_construct,
	on_punch = on_punch,
	on_receive_fields = on_receive_fields,
	digiline = def_digiline,
	mesecons = def_mesecons
})

core.register_node(":streets:light_horizontal_on", {
	tiles = { "streets_pole.png", "streets_light_horizontal_on_bottom.png", "streets_light_horizontal_on_side.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { cracky = 1, streets_light = 1, not_in_creative_inventory = 1 },
	light_source = 14,
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{ -3 / 16, -3 / 16, -0.5, 3 / 16, 3 / 16, 0.5 },
		}
	},
	drop = "streets:light_horizontal_off",
	on_construct = on_construct,
	on_punch = on_punch,
	on_receive_fields = on_receive_fields,
	digiline = def_digiline,
	mesecons = def_mesecons
})


core.register_node(":streets:light_hanging_off", {
	description = "Streets Light Hanging",
	tiles = { "streets_pole.png", "streets_light_horizontal_off_bottom.png", "streets_light_hanging_off_side.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { cracky = 1, streets_light = 1 },
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{ -3 / 16, 2 / 16, -0.5, 3 / 16, 0.5, 0.5 },
		}
	},
	on_construct = on_construct,
	on_punch = on_punch,
	on_receive_fields = on_receive_fields,
	digiline = def_digiline,
	mesecons = def_mesecons
})

core.register_node(":streets:light_hanging_on", {
	tiles = { "streets_pole.png", "streets_light_horizontal_on_bottom.png", "streets_light_hanging_on_side.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { cracky = 1, streets_light = 1, not_in_creative_inventory = 1 },
	light_source = 14,
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{ -3 / 16, 2 / 16, -0.5, 3 / 16, 0.5, 0.5 },
		}
	},
	drop = "streets:light_hanging_off",
	on_construct = on_construct,
	on_punch = on_punch,
	on_receive_fields = on_receive_fields,
	digiline = def_digiline,
	mesecons = def_mesecons
})

core.register_craft({
	output = "streets:light_vertical_off 3",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"", "default:meselamp", ""},
		{"", "default:steel_ingot", ""}
	}
})

core.register_craft({
	output = "streets:light_horizontal_off 3",
	recipe = {{"default:steel_ingot", "default:meselamp", "default:steel_ingot"}}
})

core.register_craft({
	output = "streets:light_hanging_off 3",
	recipe = {
		{"", "default:stick", ""},
		{"default:steel_ingot", "default:meselamp", "default:steel_ingot"}
	}
})
