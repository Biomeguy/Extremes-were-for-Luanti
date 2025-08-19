-- Code by Mossmanikin

core.register_craft({
	output = "trunks:twig_1 2",
	recipe = {{"group:leafdecay"}}
})
if core.get_modpath("bushes") then
core.register_craft({
	output = "trunks:twig_1 2",
	recipe = {{"bushes:BushLeaves1"}}
})
core.register_craft({
	output = "trunks:twig_1 2",
	recipe = {{"bushes:BushLeaves2"}}
})
core.register_craft({
	output = "trunks:twig_1 4",
	recipe = {{"bushes:bushbranches1"}}
})
core.register_craft({
	output = "trunks:twig_1 4",
	recipe = {{"bushes:bushbranches2"}}
})
core.register_craft({
	output = "trunks:twig_1 4",
	recipe = {{"bushes:bushbranches3"}}
})
end
core.register_craft({
	output = "trunks:twig_1 8",
	recipe = {{"trunks:twigs"}}
})
core.register_craft({
	output = "trunks:twig_1 4",
	recipe = {{"trunks:twigs_slab"}}
})
core.register_craft({
	output = "trunks:twig_1 4",
	recipe = {{"trunks:twigs_roof"}}
})
core.register_craft({
	output = "trunks:twig_1 3",
	recipe = {{"trunks:twigs_roof_corner"}}
})
core.register_craft({
	output = "trunks:twig_1 3",
	recipe = {{"trunks:twigs_roof_corner_2"}}
})

core.register_craft({
	output = "default:stick",
	recipe = {{"trunks:twig_1"}}
})

core.register_craft({
	output = "trunks:twigs",
	recipe = {
		{"trunks:twig_1","trunks:twig_1","trunks:twig_1"},
		{"trunks:twig_1","","trunks:twig_1"},
		{"trunks:twig_1","trunks:twig_1","trunks:twig_1"}
	}
})

core.register_craft({
	output = "trunks:twigs_slab 6",
	recipe = {{"trunks:twigs","trunks:twigs","trunks:twigs"}}
})

core.register_craft({
	output = "trunks:twigs_roof 4",
	recipe = {
		{"trunks:twigs",""},
		{"","trunks:twigs"}
	}
})
core.register_craft({
	output = "trunks:twigs_roof 4",
	recipe = {
		{"","trunks:twigs"},
		{"trunks:twigs",""}
	}
})

core.register_craft({
	output = "trunks:twigs_roof_corner 8",
	recipe = {
		{"","trunks:twigs",""},
		{"trunks:twigs","","trunks:twigs"}
	}
})

core.register_craft({
	output = "trunks:twigs_roof_corner_2 8",
	recipe = {
		{"trunks:twigs","","trunks:twigs"},
		{"","trunks:twigs",""}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"farming:spent_biomasse", "farming:spent_biomasse", "farming:spent_biomasse", "farming:spent_biomasse",
		"farming:spent_biomasse", "group:trunks_moss", "group:trunks_moss", "farming:straw_pile", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"farming:spent_biomasse", "farming:spent_biomasse", "farming:spent_biomasse", "farming:spent_biomasse",
		"farming:spent_biomasse", "group:trunks_moss", "group:trunks_moss", "farming:hay_pile", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"farming:spent_biomasse", "group:leaves", "group:trunks_moss", "farming:spent_biomasse", "default:coir",
		"farming:spent_biomasse", "farming:straw_pile", "fire:ash", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"farming:spent_biomasse", "group:leaves", "group:trunks_moss", "farming:spent_biomasse", "default:coir",
		"farming:spent_biomasse", "farming:hay_pile", "fire:ash", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"farming:spent_biomasse", "group:leaves", "group:trunks_moss", "farming:spent_biomasse", "group:trunks_moss",
		"farming:spent_biomasse", "farming:straw_pile", "fire:ash", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:compost_pile",
	recipe = {"farming:spent_biomasse", "group:leaves", "group:trunks_moss", "farming:spent_biomasse", "group:trunks_moss",
		"farming:spent_biomasse", "farming:hay_pile", "fire:ash", "group:water_bucket"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "group:trunks_moss",
	burntime = 4,
})
