
-- helper function
local add_biome = function(a, l, m, n, o, p, b, c, d, e, f, g, nd, ns)

	-- if not 1 then biome disabled, don't add
	if p ~= 1 then return end

	core.register_biome({
		name = a,
		node_dust = b,
		node_top = c,
		depth_top = d,
		node_filler = e,
		depth_filler = f,
		node_stone = g,
		y_max = m,
		y_min = l,
		heat_point = n,
		humidity_point = o,
		node_dungeon = nd or "default:cobble",
		node_dungeon_alt = (nd and "") or "default:mossycobble",
		node_dungeon_stair = ns or "stairs:stair_cobble",
	})
end

-- biomes with disable setting
add_biome("scorched", 3, 25, 65, 25, ethereal.scorched,
	nil, "default:dry_dirt", 1, "default:dry_dirt", 3)

add_biome("scorched_ocean", -192, 2, 55, 25, ethereal.scorched,
	nil, "default:sand", 1, "default:sand", 2)


add_biome("fiery", 5, 20, 75, 10, ethereal.fiery,
	nil, "ethereal:dry_dirt_with_fiery_grass", 1, "default:dry_dirt", 3)

add_biome("fiery_ocean", -192, 4, 75, 10, ethereal.fiery,
	nil, "default:sand", 1, "default:sand", 2)
