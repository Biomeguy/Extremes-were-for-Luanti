
local add_ore = function(a, b, c, d, e, f)

core.register_ore({
	ore_type = "scatter",
	ore = a,
	wherein = "default:desert_stone",
	clust_scarcity = b,
	clust_num_ores = c,
	clust_size = d,
	y_max = e,
	y_min = f,
	biomes = {"desert"},
})
end

-- Coal
add_ore("default:stone_with_coal", 24*24*24, 27, 6, -16, -31000)

-- Iron
add_ore("default:stone_with_iron", 9*9*9, 5, 3, -16, -63)
add_ore("default:stone_with_iron", 24*24*24, 27, 6, -64, -31000)

-- Mese
add_ore("default:stone_with_mese", 14*14*14, 5, 3, -256, -31000)

-- Gold
add_ore("default:stone_with_gold", 15*15*15, 3, 2, -64, -255)
add_ore("default:stone_with_gold", 13*13*13, 5, 3, -256, -31000)

-- Diamond
add_ore("default:stone_with_diamond", 17*17*17, 4, 3, -128, -255)
add_ore("default:stone_with_diamond", 15*15*15, 4, 3, -256, -31000)

-- Copper
add_ore("default:stone_with_copper", 9*9*9, 5, 3, -64, -31000)

-- Etherium
add_ore("ethereal:etherium_ore", 10*10*10, 1, 1, 40, 5)
