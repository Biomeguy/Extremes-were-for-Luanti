
-- baitball
core.register_craftitem("fishing:baitball", {
	description = fishing_setting.func.S("Bait Ball"),
	inventory_image = "fishing_baitball.png",
})

core.register_craft({
	type = "shapeless",
	output = "fishing:baitball 20",
	recipe = {"group:flour", "group:maize", "bucket:bucket_water"},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})


-- baitball_shark
core.register_craftitem("fishing:baitball_shark", {
	description = fishing_setting.func.S("Shark Bait Ball"),
	inventory_image = "fishing_baitball_shark.png",
})

core.register_craft({
	type = "shapeless",
	output = "fishing:baitball_shark 20",
	recipe = {"group:fishbait", "group:fishbait"}
})

