
-- Fishing - crabman77 version
-- Rewrited from original Fishing - Mossmanikin's version - Recipes 0.0.8

-- License (code & textures): 	WTFPL
-- Contains code from: 		animal_clownfish, animal_fish_blue_white, fishing (original), stoneage


-- Fishing Pole

-- Wood Fishing Pole
core.register_craft({
	output = "fishing:pole_wood",
	recipe = {
		{"", "", "group:stick"},
		{"", "group:stick", "fabric:string"},
		{"group:stick", "", "fabric:string"}
	}
})

if core.get_modpath("moreblocks") then
core.register_craft({
	output = "fishing:pole_wood",
	recipe = {
		{"", "", "group:stick"},
		{"", "group:stick", "moreblocks:rope"},
		{"group:stick", "", "moreblocks:rope"}
	}
})
end

if core.get_modpath("ropes") then
	core.register_craft({
		output = "fishing:pole_wood",
		recipe = {
			{"", "", "group:stick"},
			{"", "group:stick", "ropes:rope"},
			{"group:stick", "", "ropes:rope"}
		}
	})
end

-- Mithril Fishing Pole
if core.get_modpath("mobs_monster") then
core.register_craft({
	output = "fishing:pole_perfect",
	recipe = {
		{"", "", "default:mithril_ingot"},
		{"", "default:mithril_ingot", "mobs:cobweb"},
		{"default:mithril_ingot", "", "mobs:cobweb"}
	}
})
end

-- Fishing bait

--bait corn
core.register_craft({
	output = "fishing:bait_corn 9",
	recipe = {{"", "group:maize", ""}}
})

--bait bread
core.register_craft({
	output = "fishing:bait_bread 9",
	recipe = {{"", "group:bread", ""}}
})

-- Roasted Fish
core.register_craft({
	type = "cooking",
	output = "fishing:fish_cooked",
	recipe = "group:fishraw",
	cooktime = 2,
})

if core.get_modpath("mobs_fish") then
	core.register_craft({
		type = "cooking",
		output = "fishing:fish_cooked",
		recipe = "mobs_fish:clownfish",
		cooktime = 2,
	})
	core.register_craft({
		type = "cooking",
		output = "fishing:fish_cooked",
		recipe = "mobs_fish:tropical",
		cooktime = 2,
	})
end

-- Sushi
if core.get_modpath("flowers_plus") then
	core.register_craft({
		type = "shapeless",
		output = "fishing:sushi",
		recipe = {"fishing:fish_cooked", "farming:seed_wheat", "flowers_plus:seaweed" },
	})
end

core.register_craft({
	type = "shapeless",
	output = "fishing:sushi",
	recipe = {"fishing:fish_cooked", "farming:seed_wheat", "default:kelp_green" },
})

-- Roasted Shark
core.register_craft({
	type = "cooking",
	output = "fishing:shark_cooked",
	recipe = "fishing:shark_raw",
	cooktime = 2,
})

if core.get_modpath("mobs_sharks") then
	core.register_craft({
		type = "cooking",
		output = "fishing:shark_cooked",
		recipe = "mobs_sharks:shark_lg",
		cooktime = 2,
	})
	core.register_craft({
		type = "cooking",
		output = "fishing:shark_cooked",
		recipe = "mobs_sharks:shark_md",
		cooktime = 2,
	})
	core.register_craft({
		type = "cooking",
		output = "fishing:shark_cooked",
		recipe = "mobs_sharks:shark_sm",
		cooktime = 2,
	})
end

-- Roasted Pike
core.register_craft({
	type = "cooking",
	output = "fishing:pike_cooked",
	recipe = "fishing:pike_raw",
	cooktime = 2,
})
