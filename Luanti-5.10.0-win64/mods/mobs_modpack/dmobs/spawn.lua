if dmobs.regulars then
	-- friendlies

	mobs:register_spawn("dmobs:nyan", {"default:pine_needles","default:beech_leaves"}, 20, 10, 50000, 2, 31000)
	mobs:register_spawn("dmobs:nyan", {"nyanland:meseleaves"}, 20, 10, 15000, 2, 31000)

	mobs:register_spawn("dmobs:hedgehog", {"default:dirt_with_grass","default:pine_needles"}, 20, 10, 15000, 2, 31000)
	mobs:register_spawn("dmobs:whale", {"default:water_source"}, 20, 10, 15000, -20, 1000)
	mobs:register_spawn("dmobs:whale2", {"default:water_source"}, 20, 10, 15000, -20, 1000)
	mobs:register_spawn("dmobs:owl", {"default:beech_leaves","default:beech_trunk"}, 20, 10, 15000, 2, 31000)
	mobs:register_spawn("dmobs:gnorm", {"default:dirt_with_grass","default:wood"}, 20, 10, 32000, 2, 31000)
	mobs:register_spawn("dmobs:tortoise", {"default:clay","default:sand"}, 20, 10, 15000, 2, 31000)
	mobs:register_spawn("dmobs:elephant", {"default:dirt_with_rainforest_litter","ethereal:grove_dirt"}, 20, 10, 15000, 2, 31000)
	mobs:register_spawn("dmobs:elephant2", {"default:clay_dirt_with_savanna_grass","default:desert_sand"}, 20, 10, 7000, 20, 11000)
	mobs:register_spawn("dmobs:badger", {"default:dirt_with_grass","default:dirt"}, 20, 10, 15000, 2, 31000)
	mobs:register_spawn("dmobs:badger2", {"default:clay_dirt_with_savanna_grass","default:dirt"}, 20, 10, 15000, 2, 31000)

	mobs:register_spawn("dmobs:smallbird", {"default:beech_leaves"}, 20, 10, 70000, 6, 11000)
	mobs:register_spawn("dmobs:pterodactyl", {"default:jungle_leaves"}, 20, 10, 70000, 6, 11000)
mobs:spawn({
	name = "dmobs:wild_chicken",
	nodes = {"default:dirt_with_rainforest_litter", "ethereal:grove_dirt"},
	min_light = 10,
	chance = 7000,
	min_height = 0,
	max_height = 200,
	day_toggle = true,
})
	mobs:register_spawn("dmobs:smallfish", {"default:water_source",}, 20, 10, 15000, 20, 11000)
	mobs:register_spawn("dmobs:ammonite_s", {"default:water_source",}, 20, 10, 15000, 20, 11000)
	mobs:register_spawn("dmobs:ammonite_b", {"default:water_source",}, 20, 10, 15000, 20, 11000)
	mobs:register_spawn("dmobs:trilobite", {"default:water_source"}, 20, 10, 15000, 2, 11000)
	mobs:register_spawn("dmobs:riverfish", {"default:fresh_water_source"}, 20, 10, 15000, 20, 11000)
	mobs:register_spawn("dmobs:pirana", {"default:fresh_water_source"}, 20, 10, 15000, 20, 11000)

	-- baddies

	mobs:register_spawn("dmobs:wasp", {"default:dirt_with_grass"}, 20, 10, 32000, 2, 31000)
	mobs:register_spawn("dmobs:wasp", {"dmobs:hive"}, 20, 10, 16000, 2, 31000)
	mobs:register_spawn("dmobs:wasp_leader", {"default:dirt_with_grass","dmobs:hive"}, 20, 10, 64000, 2, 31000)

	mobs:register_spawn("dmobs:golem", {"default:stone"}, 7, 0, 16000, 2, 31000)
	--mobs:register_spawn("dmobs:fox", {"default:dirt_with_grass","default:dirt"}, 20, 10, 32000, 2, 31000)
	mobs:register_spawn("dmobs:velociraptor", {"default:dirt_with_grass","default:dirt"}, 20, 10, 32000, 2, 31000)

	if not dmobs.dragons then
		mobs:register_spawn("dmobs:orc", {"default:snow","default:snow_block", "default:desert_sand"}, 20, 10, 15000, 2, 31000)
	else
		mobs:register_spawn("dmobs:orc", {"default:snow","default:snow_block", "default:desert_sand"}, 20, 10, 3500, 2, 31000)
	end

	mobs:register_spawn("dmobs:rat", {"default:stone","default:sand"}, 20, 0, 32000, 2, 31000)
	mobs:register_spawn("dmobs:treeman", {"default:beech_leaves", "default:pine_needles"}, 7, 0, 16000, 2, 31000)
	mobs:register_spawn("dmobs:zombie", {"default:dirt_with_grass", "default:desert_sand", "default:dirt_with_rainforest_litter", "default:clay_dirt_with_savanna_grass"}, 5, 0, 7000, 20, 11000, true)
	mobs:register_spawn("dmobs:zombie_brute", {"default:dirt_with_grass"}, 5, 0, 7000, 20, 11000)
	mobs:register_spawn("dmobs:witch", {"default:dirt_with_swamp_grass",}, 5, 0, 7000, 20, 11000)
	mobs:register_spawn("dmobs:bear", {"default:dirt_with_coniferous_litter",}, 5, 0, 7000, 20, 11000)
	mobs:register_spawn("dmobs:swamp_lurker", {"default:dirt_with_swamp_grass"}, 5, 0, 7000, 20, 11000)
	mobs:register_spawn("dmobs:cavecrab", {"default:stone", "default:sand"}, 5, 0, 7000, 20, 11000)
	mobs:register_spawn("dmobs:crabspider", {"default:desert_sand", "default:silver_sand"}, 5, 0, 7000, 20, 11000)
	mobs:register_spawn("dmobs:beetle", {"default:desert_sand",}, 5, 0, 7000, 20, 11000)
	-- ninja spawn on top of trees
	mobs:register_spawn("dmobs:ninja", {"default:beech_leaves"}, 5, 0, 10000, 1, 31000)
	mobs:register_spawn("dmobs:yeti", {"default:dirt_with_snow", "default:snow_block", "default:ice"}, 10, -1, 7000, 1, 31000)
end

-- dragons

mobs:register_spawn("dmobs:dragon", {"default:beech_leaves","default:dirt_with_grass"}, 20, 10, 64000, 2, 31000)

if dmobs.dragons then
	mobs:register_spawn("dmobs:dragon2", {"default:pine_needles"}, 20, 10, 64000, 2, 31000)
	mobs:register_spawn("dmobs:dragon3", {"default:acacia_leaves","default:clay_dirt_with_savanna_grass"}, 20, 10, 64000, 2, 31000)
	mobs:register_spawn("dmobs:dragon4", {"default:jungle_leaves"}, 20, 10, 64000, 2, 31000)
	mobs:register_spawn("dmobs:waterdragon", {"default:water_source"}, 20, 10, 32000, 1, 31000, false)
	mobs:register_spawn("dmobs:wyvern",	{"default:beech_leaves"}, 20, 10, 32000, 1, 31000, false)
	mobs:register_spawn("dmobs:dragon_great", {"default:lava_source"}, 20, 0, 64000, -21000, 1000, false)
end
