-- support for i18n
local S = core.get_translator("ferns")

-- Ferns (by Mossmanikin)

-- FIDDLEHEAD
core.register_craftitem("ferns:fiddlehead", {
	description = S("Fiddlehead"),
	inventory_image = "ferns_fiddlehead.png",
	groups = {flammable = 2},
	on_use = core.item_eat(-1), -- slightly poisonous when raw
})

core.register_craftitem("ferns:fiddlehead_roasted", {
	description = S("Roasted Fiddlehead"),
	inventory_image = "ferns_fiddlehead_roasted.png",
	groups = {flammable = 2},
	on_use = core.item_eat(1), -- edible when cooked
})

core.register_craft({
	output = "ferns:fiddlehead 3",
	recipe = {{"default:fern_1"}},
	replacements = {{"default:fern_1", "ferns:ferntuber"}}
})
core.register_craft({
	output = "ferns:fiddlehead 3",
	recipe = {{"ferns:tree_fern_leaves"}},
	replacements = {{"ferns:tree_fern_leaves", "ferns:sapling_tree_fern"}}
})
core.register_craft({
	type = "cooking",
	output = "ferns:fiddlehead_roasted",
	recipe = "ferns:fiddlehead",
	cooktime = 1,
})

-- FERN TUBER
core.register_craftitem("ferns:ferntuber", {
	description = S("Fern Tuber"),
	inventory_image = "ferns_ferntuber.png",
	groups = {flammable = 2},
})
core.register_craftitem("ferns:ferntuber_roasted", {
	description = S("Roasted Fern Tuber"),
	inventory_image = "ferns_ferntuber_roasted.png",
	groups = {tuber = 1, flammable = 2},
	on_use = core.item_eat(3),
})
core.register_craft({
	type = "cooking",
	output = "ferns:ferntuber_roasted",
	recipe = "ferns:ferntuber",
	cooktime = 3,
})

-- HORSETAIL  (EQUISETUM) --> GREEN DYE https://en.wikipedia.org/wiki/Equisetum
core.register_craft({
	output = "dye:green",
	recipe = {{"group:horsetail"}}
})
