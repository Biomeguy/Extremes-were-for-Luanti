
-- Fishing - crabman77 version
-- Rewrited from original Fishing - Mossmanikin's version - Fishes 0.0.4
-- License (code & textures): WTFPL


-- Fish
core.register_craftitem("fishing:fish_raw", {
	description = fishing_setting.func.S("Fish"),
	groups = {fishbait=1, fishraw=1},
	inventory_image = "fishing_fish_raw.png",
	 on_use = core.item_eat(2),
})

-- Roasted Fish
core.register_craftitem("fishing:fish_cooked", {
	description = fishing_setting.func.S("Roasted Fish"),
	groups = {},
	inventory_image = "fishing_fish_cooked.png",
	on_use = core.item_eat(4),
})

-- Sushi
core.register_craftitem("fishing:sushi", {
	description = fishing_setting.func.S("Sushi (Hoso Maki)"),
	groups = {},
	inventory_image = "fishing_sushi.png",
	on_use = core.item_eat(6),
})

-- clownfish
core.register_craftitem("fishing:clownfish_raw", {
	description = fishing_setting.func.S("Clownfish"),
	groups = {fishbait=1, fishraw=1},
	inventory_image = "fishing_clownfish_raw.png",
	 on_use = core.item_eat(2),
})

-- bluewhite
core.register_craftitem("fishing:bluewhite_raw", {
	description = fishing_setting.func.S("Bluewhite"),
	groups = {fishbait=1, fishraw=1},
	inventory_image = "fishing_bluewhite_raw.png",
	 on_use = core.item_eat(2),
})

-- exoticfish
core.register_craftitem("fishing:exoticfish_raw", {
	description = fishing_setting.func.S("Exotic"),
	groups = {fishbait=1, fishraw=1},
	inventory_image = "fishing_exoticfish_raw.png",
	 on_use = core.item_eat(2),
})

-- carp
core.register_craftitem("fishing:carp_raw", {
	description = fishing_setting.func.S("Carp"),
	groups = {fishbait=1, fishraw=1},
	inventory_image = "fishing_carp_raw.png",
	 on_use = core.item_eat(2),
})

-- perch
core.register_craftitem("fishing:perch_raw", {
	description = fishing_setting.func.S("Perch"),
	groups = {fishbait=1, fishraw=1},
	inventory_image = "fishing_perch_raw.png",
	 on_use = core.item_eat(2),
})

-- catfish
core.register_craftitem("fishing:catfish_raw", {
	description = fishing_setting.func.S("Catfish"),
	groups = {fishbait=1, fishraw=1},
	inventory_image = "fishing_catfish_raw.png",
	 on_use = core.item_eat(2),
})

-- Whatthef... it's a freakin' Shark!
core.register_craftitem("fishing:shark_raw", {
	description = fishing_setting.func.S("Shark"),
	groups = {fishbait=1},
	inventory_image = "fishing_shark_raw.png",
	 on_use = core.item_eat(2),
})

-- Roasted Shark
core.register_craftitem("fishing:shark_cooked", {
	description = fishing_setting.func.S("Roasted Shark"),
	groups = {},
	inventory_image = "fishing_shark_cooked.png",
	on_use = core.item_eat(6),
})

-- Pike
core.register_craftitem("fishing:pike_raw", {
	description = fishing_setting.func.S("Northern Pike"),
	groups = {fishbait=1},
	inventory_image = "fishing_pike_raw.png",
	 on_use = core.item_eat(2),
})

-- Roasted Pike
core.register_craftitem("fishing:pike_cooked", {
	description = fishing_setting.func.S("Roasted Northern Pike"),
	groups = {},
	inventory_image = "fishing_pike_cooked.png",
	on_use = core.item_eat(6),
})
