
local mm = nssm.multimobs
local mg_name = core.get_mapgen_setting("mg_name")

-- Spawning parameters

if mm ~= 0 then
	if mg_name == "v6" then
	    -- ANTS
	    mobs:spawn_specific("nssm:ant_queen", {"nssm:ant_dirt"}, {"air"}, 0, 20, 60, 200000/mm, 1, -31000, 31000)
	    mobs:spawn_specific("nssm:ant_soldier", {"nssm:ant_dirt"}, {"air"}, 0, 20, 7, 30000/mm, 4, -31000, 31000)
	    mobs:spawn_specific("nssm:ant_worker", {"nssm:ant_dirt"}, {"air"}, 0, 20, 5, 10000/mm, 5, -31000, 31000)

	    -- SPIDERS
	    mobs:spawn_specific("nssm:black_widow", {"default:dirt_with_rainforest_litter", "default:jungle_trunk", "nssm:web" }, {"air"}, 0, 20, 20, 1200000/mm, 2, -31000, 31000)
	    mobs:spawn_specific("nssm:daddy_long_legs", {"default:dirt_with_rainforest_litter", "default:jungle_trunk", "nssm:web" }, {"air"}, 0, 20, 10, 1200000/mm, 2, -31000, 31000)
	    mobs:spawn_specific("nssm:tarantula", {"default:dirt_with_rainforest_litter", "default:jungle_trunk", "nssm:web" }, {"air"}, 0, 14, 120, 5000000/mm, 1, -31000, 31000)
	    mobs:spawn_specific("nssm:uloboros", {"default:dirt_with_rainforest_litter", "default:jungle_trunk", "nssm:web" }, {"air"}, 0, 20, 20, 1200000/mm, 1, -31000, 31000)

	    -- MOUNTAINS
	    mobs:spawn_specific("nssm:echidna", {"default:dirt_with_grass"}, {"default:dirt_with_grass"}, 0, 20, 200, 100000000/mm, 1, 22, 31000)

	    -- FOREST
	    mobs:spawn_specific("nssm:masticone", {"default:dirt_with_grass"}, {"default:beech_trunk","default:aspen_trunk"}, 0, 20, 120, 5000000/mm, 2, -31000, 140)

	else
	    -- SPIDERS
	    mobs:spawn_specific("nssm:black_widow", {"default:dirt_with_rainforest_litter", "default:jungle_trunk", "nssm:web" }, {"air"}, 0, 20, 30, 4400000/mm, 2, -31000, 31000)
	    mobs:spawn_specific("nssm:daddy_long_legs", {"default:dirt_with_rainforest_litter", "default:jungle_trunk", "nssm:web" }, {"air"}, 0, 30, 10, 4400000/mm, 2, -31000, 31000)
	    mobs:spawn_specific("nssm:tarantula", {"default:dirt_with_rainforest_litter", "default:jungle_trunk", "nssm:web" }, {"air"}, 0, 14, 120, 50000000/mm, 1, -31000, 31000)
	    mobs:spawn_specific("nssm:uloboros", {"default:dirt_with_rainforest_litter", "default:jungle_trunk", "nssm:web" }, {"air"}, 0, 20, 30, 4400000/mm, 1, -31000, 31000)

	    -- MOUNTAINS
	    mobs:spawn_specific("nssm:echidna", {"default:dirt_with_grass"}, {"default:dirt_with_grass"}, 0, 20, 200, 100000000/mm, 1, 50, 31000)

	    -- FOREST
	    mobs:spawn_specific("nssm:masticone", {"default:dirt_with_grass"}, {"default:beech_trunk","default:aspen_trunk"}, 0, 20, 180, 6000000/mm, 2, -31000, 140)
	end

	mobs:spawn_specific("nssm:xgaloctopus", {"default:water_source"}, {"default:ocean_stone_carved"}, 0, 20, 20, 800000/mm, 1, -31000, 0)

	-- CAVES
	mobs:spawn_specific("nssm:lava_titan", {"default:stone", "default:desert_stone"}, {"air"}, 0, 120, 12, 22000000/mm, 1, -31000, -100)

	-- SEA
	mobs:spawn_specific("nssm:crab", {"default:sand"}, {"default:water_source"}, 0, 20, 60, 4000000/mm, 1, -31000, 31000)
	mobs:spawn_specific("nssm:crocodile", {"default:sand","default:water_source"}, {"default:water_source"}, 0, 20, 100, 35000000/mm, 1, -31000, 31000)
	mobs:spawn_specific("nssm:crocodile", {"default:sand","default:fresh_water_source"}, {"default:fresh_water_source"}, 0, 20, 60, 12000000/mm, 1, -31000, 31000)
	mobs:spawn_specific("nssm:octopus", {"default:water_source"}, {"default:water_source"}, 0, 20, 80, 38000000/mm, 1, -31000, 0)

	-- DESERT
	mobs:spawn_specific("nssm:sandworm", {"default:desert_sand", "default:desert_stone"}, {"air"}, 0, 20, 100, 28000000/mm, 1, -31000, 31000)

	-- MORLENDOR
	mobs:spawn_specific("nssm:morbat", {"air"}, {"nssm:morelentir"}, 0, 20, 100, 20000000/mm, 1, -31000, 0)
	mobs:spawn_specific("nssm:morvy", {"nssm:morentir"}, {"nssm:morentir"}, 0, 20, 120, 18000000/mm, 1, -31000, -93)
	mobs:spawn_specific("nssm:morlu", {"nssm:morentir"}, {"nssm:mornen", "nssm:mornen_flowing"}, 0, 20, 80, 1200000/mm, 1, -31000, -93)
	mobs:spawn_specific("nssm:morde", {"nssm:morentir"}, {"nssm:mornar"}, 0, 20, 50, 350000/mm, 1, -31000, -93)
	mobs:spawn_specific("nssm:mordain", {"nssm:morentir"}, {"nssm:morentir"}, 0, 20, 90, 15000000/mm, 1, -31000, -93)
	mobs:spawn_specific("nssm:morgut", {"nssm:morentir"}, {"nssm:morentir"}, 0, 20, 50, 15000000/mm, 1, -31000, -93)
	mobs:spawn_specific("nssm:morgre", {"nssm:morentir"}, {"nssm:mornar"}, 0, 20, 80, 1800000/mm, 1, -31000, -93)
end
